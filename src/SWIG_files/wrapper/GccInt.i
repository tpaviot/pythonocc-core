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
from enum import IntEnum
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

class GccInt_IType(IntEnum):
	GccInt_Lin = 0
	GccInt_Cir = 1
	GccInt_Ell = 2
	GccInt_Par = 3
	GccInt_Hpr = 4
	GccInt_Pnt = 5
GccInt_Lin = GccInt_IType.GccInt_Lin
GccInt_Cir = GccInt_IType.GccInt_Cir
GccInt_Ell = GccInt_IType.GccInt_Ell
GccInt_Par = GccInt_IType.GccInt_Par
GccInt_Hpr = GccInt_IType.GccInt_Hpr
GccInt_Pnt = GccInt_IType.GccInt_Pnt
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
		/**** md5 signature: 012085e881e5dd82e00afd486265c505 ****/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns the type of bisecting object (line, circle, parabola, hyperbola, ellipse, point).

Returns
-------
GccInt_IType
") ArcType;
		virtual GccInt_IType ArcType();

		/****************** Circle ******************/
		/**** md5 signature: 624ff1e0c75139ee893a5066be1b5a0c ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns the bisecting line when arctype returns cir. an exception domainerror is raised if arctype is not a cir.

Returns
-------
gp_Circ2d
") Circle;
		virtual gp_Circ2d Circle();

		/****************** Ellipse ******************/
		/**** md5 signature: ad57dba8c1c2fed98a4ee4d518e5af58 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Returns the bisecting line when arctype returns ell. an exception domainerror is raised if arctype is not an ell.

Returns
-------
gp_Elips2d
") Ellipse;
		virtual gp_Elips2d Ellipse();

		/****************** Hyperbola ******************/
		/**** md5 signature: ec5c753a319a89563396073e20a5375e ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Returns the bisecting line when arctype returns hpr. an exception domainerror is raised if arctype is not a hpr.

Returns
-------
gp_Hypr2d
") Hyperbola;
		virtual gp_Hypr2d Hyperbola();

		/****************** Line ******************/
		/**** md5 signature: c030f66e64195409bcfc92be438de5d5 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the bisecting line when arctype returns lin. an exception domainerror is raised if arctype is not a lin.

Returns
-------
gp_Lin2d
") Line;
		virtual gp_Lin2d Line();

		/****************** Parabola ******************/
		/**** md5 signature: 2bbe5ac6a61b052fd2bae484e8f0313c ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Returns the bisecting line when arctype returns par. an exception domainerror is raised if arctype is not a par.

Returns
-------
gp_Parab2d
") Parabola;
		virtual gp_Parab2d Parabola();

		/****************** Point ******************/
		/**** md5 signature: a1a592224bdee2f507f9eb88188fca01 ****/
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
		/**** md5 signature: ecea5ec3de7f5a063455697b6676b2b1 ****/
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
		/**** md5 signature: 9a5ddd020c90ebd33f4781d8a1292c29 ****/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns gccint_cir, which is the type of any gccint_bcirc bisecting curve.

Returns
-------
GccInt_IType
") ArcType;
		GccInt_IType ArcType();

		/****************** Circle ******************/
		/**** md5 signature: 8ca5a3e19338cebd34f671ea84aabcbe ****/
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
		/**** md5 signature: 8689e8d44fa7b6e607d1f485c46d5f57 ****/
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
		/**** md5 signature: 9a5ddd020c90ebd33f4781d8a1292c29 ****/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns gccint_ell, which is the type of any gccint_belips bisecting curve.

Returns
-------
GccInt_IType
") ArcType;
		GccInt_IType ArcType();

		/****************** Ellipse ******************/
		/**** md5 signature: eb7f485d691f7cad1a5fcf5b0cf4e730 ****/
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
		/**** md5 signature: 2dc70a415b30d0df4bcff6492c4cf9c3 ****/
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
		/**** md5 signature: 9a5ddd020c90ebd33f4781d8a1292c29 ****/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns gccint_hpr, which is the type of any gccint_bhyper bisecting curve.

Returns
-------
GccInt_IType
") ArcType;
		GccInt_IType ArcType();

		/****************** Hyperbola ******************/
		/**** md5 signature: 17dde456f3c24d600767a534ae02bd6a ****/
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
		/**** md5 signature: a3fecd6d4849eed2b8817d7b11b884c6 ****/
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
		/**** md5 signature: 9a5ddd020c90ebd33f4781d8a1292c29 ****/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns gccint_lin, which is the type of any gccint_bline bisecting line.

Returns
-------
GccInt_IType
") ArcType;
		GccInt_IType ArcType();

		/****************** Line ******************/
		/**** md5 signature: 34f5184ec712073b39d91fb7721078de ****/
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
		/**** md5 signature: 65cc95a0760068add5f691286775c450 ****/
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
		/**** md5 signature: 9a5ddd020c90ebd33f4781d8a1292c29 ****/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns gccint_par, which is the type of any gccint_bparab bisecting curve.

Returns
-------
GccInt_IType
") ArcType;
		GccInt_IType ArcType();

		/****************** Parabola ******************/
		/**** md5 signature: 603e36f863c0dca079120d9c013f71fc ****/
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
		/**** md5 signature: f983ed62d188af45abb307c8434a5ebd ****/
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
		/**** md5 signature: 9a5ddd020c90ebd33f4781d8a1292c29 ****/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns gccint_pnt, which is the type of any gccint_bpoint bisecting object.

Returns
-------
GccInt_IType
") ArcType;
		GccInt_IType ArcType();

		/****************** Point ******************/
		/**** md5 signature: 2119788025a432d37e1e406e6ab1c7ab ****/
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
