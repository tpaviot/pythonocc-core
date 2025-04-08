/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_gccint.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
		/****** GccInt_Bisec::ArcType ******/
		/****** md5 signature: 012085e881e5dd82e00afd486265c505 ******/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Return
-------
GccInt_IType

Description
-----------
Returns the type of bisecting object (line, circle, parabola, hyperbola, ellipse, point).
") ArcType;
		virtual GccInt_IType ArcType();

		/****** GccInt_Bisec::Circle ******/
		/****** md5 signature: 624ff1e0c75139ee893a5066be1b5a0c ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
Returns the bisecting line when ArcType returns Cir. An exception DomainError is raised if ArcType is not a Cir.
") Circle;
		virtual gp_Circ2d Circle();

		/****** GccInt_Bisec::Ellipse ******/
		/****** md5 signature: ad57dba8c1c2fed98a4ee4d518e5af58 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
Returns the bisecting line when ArcType returns Ell. An exception DomainError is raised if ArcType is not an Ell.
") Ellipse;
		virtual gp_Elips2d Ellipse();

		/****** GccInt_Bisec::Hyperbola ******/
		/****** md5 signature: ec5c753a319a89563396073e20a5375e ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Returns the bisecting line when ArcType returns Hpr. An exception DomainError is raised if ArcType is not a Hpr.
") Hyperbola;
		virtual gp_Hypr2d Hyperbola();

		/****** GccInt_Bisec::Line ******/
		/****** md5 signature: c030f66e64195409bcfc92be438de5d5 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
Returns the bisecting line when ArcType returns Lin. An exception DomainError is raised if ArcType is not a Lin.
") Line;
		virtual gp_Lin2d Line();

		/****** GccInt_Bisec::Parabola ******/
		/****** md5 signature: 2bbe5ac6a61b052fd2bae484e8f0313c ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
Returns the bisecting line when ArcType returns Par. An exception DomainError is raised if ArcType is not a Par.
") Parabola;
		virtual gp_Parab2d Parabola();

		/****** GccInt_Bisec::Point ******/
		/****** md5 signature: a1a592224bdee2f507f9eb88188fca01 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the bisecting line when ArcType returns Pnt. An exception DomainError is raised if ArcType is not a Pnt.
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
		/****** GccInt_BCirc::GccInt_BCirc ******/
		/****** md5 signature: ecea5ec3de7f5a063455697b6676b2b1 ******/
		%feature("compactdefaultargs") GccInt_BCirc;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ2d

Return
-------
None

Description
-----------
Constructs a bisecting curve whose geometry is the 2D circle Circ.
") GccInt_BCirc;
		 GccInt_BCirc(const gp_Circ2d & Circ);

		/****** GccInt_BCirc::ArcType ******/
		/****** md5 signature: 9a5ddd020c90ebd33f4781d8a1292c29 ******/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Return
-------
GccInt_IType

Description
-----------
Returns GccInt_Cir, which is the type of any GccInt_BCirc bisecting curve.
") ArcType;
		GccInt_IType ArcType();

		/****** GccInt_BCirc::Circle ******/
		/****** md5 signature: 8ca5a3e19338cebd34f671ea84aabcbe ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
Returns a 2D circle which is the geometry of this bisecting curve.
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
		/****** GccInt_BElips::GccInt_BElips ******/
		/****** md5 signature: 8689e8d44fa7b6e607d1f485c46d5f57 ******/
		%feature("compactdefaultargs") GccInt_BElips;
		%feature("autodoc", "
Parameters
----------
Ellipse: gp_Elips2d

Return
-------
None

Description
-----------
Constructs a bisecting curve whose geometry is the 2D ellipse Ellipse.
") GccInt_BElips;
		 GccInt_BElips(const gp_Elips2d & Ellipse);

		/****** GccInt_BElips::ArcType ******/
		/****** md5 signature: 9a5ddd020c90ebd33f4781d8a1292c29 ******/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Return
-------
GccInt_IType

Description
-----------
Returns GccInt_Ell, which is the type of any GccInt_BElips bisecting curve.
") ArcType;
		GccInt_IType ArcType();

		/****** GccInt_BElips::Ellipse ******/
		/****** md5 signature: eb7f485d691f7cad1a5fcf5b0cf4e730 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
Returns a 2D ellipse which is the geometry of this bisecting curve.
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
		/****** GccInt_BHyper::GccInt_BHyper ******/
		/****** md5 signature: 2dc70a415b30d0df4bcff6492c4cf9c3 ******/
		%feature("compactdefaultargs") GccInt_BHyper;
		%feature("autodoc", "
Parameters
----------
Hyper: gp_Hypr2d

Return
-------
None

Description
-----------
Constructs a bisecting curve whose geometry is the 2D hyperbola Hyper.
") GccInt_BHyper;
		 GccInt_BHyper(const gp_Hypr2d & Hyper);

		/****** GccInt_BHyper::ArcType ******/
		/****** md5 signature: 9a5ddd020c90ebd33f4781d8a1292c29 ******/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Return
-------
GccInt_IType

Description
-----------
Returns GccInt_Hpr, which is the type of any GccInt_BHyper bisecting curve.
") ArcType;
		GccInt_IType ArcType();

		/****** GccInt_BHyper::Hyperbola ******/
		/****** md5 signature: 17dde456f3c24d600767a534ae02bd6a ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Returns a 2D hyperbola which is the geometry of this bisecting curve.
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
		/****** GccInt_BLine::GccInt_BLine ******/
		/****** md5 signature: a3fecd6d4849eed2b8817d7b11b884c6 ******/
		%feature("compactdefaultargs") GccInt_BLine;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin2d

Return
-------
None

Description
-----------
Constructs a bisecting line whose geometry is the 2D line Line.
") GccInt_BLine;
		 GccInt_BLine(const gp_Lin2d & Line);

		/****** GccInt_BLine::ArcType ******/
		/****** md5 signature: 9a5ddd020c90ebd33f4781d8a1292c29 ******/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Return
-------
GccInt_IType

Description
-----------
Returns GccInt_Lin, which is the type of any GccInt_BLine bisecting line.
") ArcType;
		GccInt_IType ArcType();

		/****** GccInt_BLine::Line ******/
		/****** md5 signature: 34f5184ec712073b39d91fb7721078de ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
Returns a 2D line which is the geometry of this bisecting line.
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
		/****** GccInt_BParab::GccInt_BParab ******/
		/****** md5 signature: 65cc95a0760068add5f691286775c450 ******/
		%feature("compactdefaultargs") GccInt_BParab;
		%feature("autodoc", "
Parameters
----------
Parab: gp_Parab2d

Return
-------
None

Description
-----------
Constructs a bisecting curve whose geometry is the 2D parabola Parab.
") GccInt_BParab;
		 GccInt_BParab(const gp_Parab2d & Parab);

		/****** GccInt_BParab::ArcType ******/
		/****** md5 signature: 9a5ddd020c90ebd33f4781d8a1292c29 ******/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Return
-------
GccInt_IType

Description
-----------
Returns GccInt_Par, which is the type of any GccInt_BParab bisecting curve.
") ArcType;
		GccInt_IType ArcType();

		/****** GccInt_BParab::Parabola ******/
		/****** md5 signature: 603e36f863c0dca079120d9c013f71fc ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
Returns a 2D parabola which is the geometry of this bisecting curve.
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
		/****** GccInt_BPoint::GccInt_BPoint ******/
		/****** md5 signature: f983ed62d188af45abb307c8434a5ebd ******/
		%feature("compactdefaultargs") GccInt_BPoint;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d

Return
-------
None

Description
-----------
Constructs a bisecting object whose geometry is the 2D point Point.
") GccInt_BPoint;
		 GccInt_BPoint(const gp_Pnt2d & Point);

		/****** GccInt_BPoint::ArcType ******/
		/****** md5 signature: 9a5ddd020c90ebd33f4781d8a1292c29 ******/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Return
-------
GccInt_IType

Description
-----------
Returns GccInt_Pnt, which is the type of any GccInt_BPoint bisecting object.
") ArcType;
		GccInt_IType ArcType();

		/****** GccInt_BPoint::Point ******/
		/****** md5 signature: 2119788025a432d37e1e406e6ab1c7ab ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns a 2D point which is the geometry of this bisecting object.
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
/* class aliases */
%pythoncode {
}
