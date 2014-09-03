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
%module (package="OCC") ElCLib

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

%include ElCLib_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(elclib) ElCLib;
%nodefaultctor ElCLib;
class ElCLib {
	public:
		%feature("autodoc", "Args:
	U(Standard_Real)
	UFirst(Standard_Real)
	ULast(Standard_Real)

Returns:
	static Standard_Real

Return a value in   the  range <UFirst, ULast>  by  
         adding or removing the period <ULast -  UFirst> to  
         <U>.") InPeriod;
		static Standard_Real InPeriod (const Standard_Real U,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("autodoc", "Args:
	UFirst(Standard_Real)
	ULast(Standard_Real)
	Precision(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	static void

Adjust U1 and  U2 in the  parametric range  UFirst  
         Ulast of a periodic curve, where ULast -  
UFirst is its period. To do this, this function:  
-   sets U1 in the range [ UFirst, ULast ] by  
  adding/removing the period to/from the value U1, then  
-   sets U2 in the range [ U1, U1 + period ] by  
  adding/removing the period to/from the value U2.  
  Precision is used to test the equalities.") AdjustPeriodic;
		static void AdjustPeriodic (const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real Precision,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	L(gp_Lin)

Returns:
	static gp_Pnt

For elementary curves (lines, circles and conics) from  
the gp package, computes the point of parameter U.  
The result is either:  
-   a gp_Pnt point for a curve in 3D space, or  
-   a gp_Pnt2d point for a curve in 2D space.") Value;
		static gp_Pnt Value (const Standard_Real U,const gp_Lin & L);
		%feature("autodoc", "Args:
	U(Standard_Real)
	C(gp_Circ)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const Standard_Real U,const gp_Circ & C);
		%feature("autodoc", "Args:
	U(Standard_Real)
	E(gp_Elips)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const Standard_Real U,const gp_Elips & E);
		%feature("autodoc", "Args:
	U(Standard_Real)
	H(gp_Hypr)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const Standard_Real U,const gp_Hypr & H);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Prb(gp_Parab)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const Standard_Real U,const gp_Parab & Prb);
		%feature("autodoc", "Args:
	U(Standard_Real)
	L(gp_Lin)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	static void

For elementary curves (lines, circles and conics) from the  
gp package, computes:  
-   the point P of parameter U, and  
-   the first derivative vector V1 at this point.  
The results P and V1 are either:  
-   a gp_Pnt point and a gp_Vec vector, for a curve in 3D  space, or  
-   a gp_Pnt2d point and a gp_Vec2d vector, for a curve in 2D space.") D1;
		static void D1 (const Standard_Real U,const gp_Lin & L,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	C(gp_Circ)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const gp_Circ & C,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	E(gp_Elips)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const gp_Elips & E,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	H(gp_Hypr)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const gp_Hypr & H,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Prb(gp_Parab)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const gp_Parab & Prb,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	C(gp_Circ)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

For elementary curves (circles and conics) from the gp  
package, computes:  
- the point P of parameter U, and  
- the first and second derivative vectors V1 and V2 at this point.  
  The results, P, V1 and V2, are either:  
-   a gp_Pnt point and two gp_Vec vectors, for a curve in 3D space, or  
-   a gp_Pnt2d point and two gp_Vec2d vectors, for a curve in 2D space.") D2;
		static void D2 (const Standard_Real U,const gp_Circ & C,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	E(gp_Elips)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const gp_Elips & E,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	H(gp_Hypr)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const gp_Hypr & H,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Prb(gp_Parab)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const gp_Parab & Prb,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	C(gp_Circ)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

For elementary curves (circles, ellipses and hyperbolae)  
from the gp package, computes:  
-   the point P of parameter U, and  
-   the first, second and third derivative vectors V1, V2  
  and V3 at this point.  
The results, P, V1, V2 and V3, are either:  
-   a gp_Pnt point and three gp_Vec vectors, for a curve in 3D space, or  
-   a gp_Pnt2d point and three gp_Vec2d vectors, for a curve in 2D space.") D3;
		static void D3 (const Standard_Real U,const gp_Circ & C,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	E(gp_Elips)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Standard_Real U,const gp_Elips & E,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	H(gp_Hypr)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Standard_Real U,const gp_Hypr & H,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	L(gp_Lin)
	N(Standard_Integer)

Returns:
	static gp_Vec

For elementary curves (lines, circles and conics) from  
the gp package, computes the vector corresponding to  
the Nth derivative at the point of parameter U. The result is either:  
-   a gp_Vec vector for a curve in 3D space, or  
-   a gp_Vec2d vector for a curve in 2D space.  
 In the following functions N is the order of derivation  
 and should be greater than 0") DN;
		static gp_Vec DN (const Standard_Real U,const gp_Lin & L,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	C(gp_Circ)
	N(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Standard_Real U,const gp_Circ & C,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	E(gp_Elips)
	N(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Standard_Real U,const gp_Elips & E,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	H(gp_Hypr)
	N(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Standard_Real U,const gp_Hypr & H,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Prb(gp_Parab)
	N(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Standard_Real U,const gp_Parab & Prb,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	L(gp_Lin2d)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Value;
		static gp_Pnt2d Value (const Standard_Real U,const gp_Lin2d & L);
		%feature("autodoc", "Args:
	U(Standard_Real)
	C(gp_Circ2d)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Value;
		static gp_Pnt2d Value (const Standard_Real U,const gp_Circ2d & C);
		%feature("autodoc", "Args:
	U(Standard_Real)
	E(gp_Elips2d)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Value;
		static gp_Pnt2d Value (const Standard_Real U,const gp_Elips2d & E);
		%feature("autodoc", "Args:
	U(Standard_Real)
	H(gp_Hypr2d)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Value;
		static gp_Pnt2d Value (const Standard_Real U,const gp_Hypr2d & H);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Prb(gp_Parab2d)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Value;
		static gp_Pnt2d Value (const Standard_Real U,const gp_Parab2d & Prb);
		%feature("autodoc", "Args:
	U(Standard_Real)
	L(gp_Lin2d)
	P(gp_Pnt2d)
	V1(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const gp_Lin2d & L,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	C(gp_Circ2d)
	P(gp_Pnt2d)
	V1(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const gp_Circ2d & C,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	E(gp_Elips2d)
	P(gp_Pnt2d)
	V1(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const gp_Elips2d & E,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	H(gp_Hypr2d)
	P(gp_Pnt2d)
	V1(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const gp_Hypr2d & H,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Prb(gp_Parab2d)
	P(gp_Pnt2d)
	V1(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const gp_Parab2d & Prb,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	C(gp_Circ2d)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const gp_Circ2d & C,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	E(gp_Elips2d)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const gp_Elips2d & E,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	H(gp_Hypr2d)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const gp_Hypr2d & H,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Prb(gp_Parab2d)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const gp_Parab2d & Prb,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	C(gp_Circ2d)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Standard_Real U,const gp_Circ2d & C,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	E(gp_Elips2d)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Standard_Real U,const gp_Elips2d & E,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	H(gp_Hypr2d)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

In the following functions N is the order of derivation  
 and should be greater than 0") D3;
		static void D3 (const Standard_Real U,const gp_Hypr2d & H,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	L(gp_Lin2d)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") DN;
		static gp_Vec2d DN (const Standard_Real U,const gp_Lin2d & L,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	C(gp_Circ2d)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") DN;
		static gp_Vec2d DN (const Standard_Real U,const gp_Circ2d & C,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	E(gp_Elips2d)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") DN;
		static gp_Vec2d DN (const Standard_Real U,const gp_Elips2d & E,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	H(gp_Hypr2d)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") DN;
		static gp_Vec2d DN (const Standard_Real U,const gp_Hypr2d & H,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Prb(gp_Parab2d)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") DN;
		static gp_Vec2d DN (const Standard_Real U,const gp_Parab2d & Prb,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax1)

Returns:
	static gp_Pnt

Curve evaluation  
 The following basis functions compute the derivatives on  
 elementary curves defined by their geometric characteristics.  
 These functions can be called without constructing a conic  
 from package gp. They are called by the previous functions.  
Example :  
 A circle is defined by its position and its radius.") LineValue;
		static gp_Pnt LineValue (const Standard_Real U,const gp_Ax1 & Pos);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	Radius(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") CircleValue;
		static gp_Pnt CircleValue (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Radius);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") EllipseValue;
		static gp_Pnt EllipseValue (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") HyperbolaValue;
		static gp_Pnt HyperbolaValue (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	Focal(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") ParabolaValue;
		static gp_Pnt ParabolaValue (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Focal);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax1)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") LineD1;
		static void LineD1 (const Standard_Real U,const gp_Ax1 & Pos,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	Radius(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") CircleD1;
		static void CircleD1 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") EllipseD1;
		static void EllipseD1 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") HyperbolaD1;
		static void HyperbolaD1 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	Focal(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") ParabolaD1;
		static void ParabolaD1 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Focal,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	Radius(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") CircleD2;
		static void CircleD2 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") EllipseD2;
		static void EllipseD2 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") HyperbolaD2;
		static void HyperbolaD2 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	Focal(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") ParabolaD2;
		static void ParabolaD2 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Focal,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	Radius(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") CircleD3;
		static void CircleD3 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") EllipseD3;
		static void EllipseD3 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") HyperbolaD3;
		static void HyperbolaD3 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax1)
	N(Standard_Integer)

Returns:
	static gp_Vec

In the following functions N is the order of derivation  
 and should be greater than 0") LineDN;
		static gp_Vec LineDN (const Standard_Real U,const gp_Ax1 & Pos,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	Radius(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") CircleDN;
		static gp_Vec CircleDN (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Radius,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") EllipseDN;
		static gp_Vec EllipseDN (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") HyperbolaDN;
		static gp_Vec HyperbolaDN (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2)
	Focal(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") ParabolaDN;
		static gp_Vec ParabolaDN (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Focal,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2d)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") LineValue;
		static gp_Pnt2d LineValue (const Standard_Real U,const gp_Ax2d & Pos);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	Radius(Standard_Real)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") CircleValue;
		static gp_Pnt2d CircleValue (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Radius);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") EllipseValue;
		static gp_Pnt2d EllipseValue (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") HyperbolaValue;
		static gp_Pnt2d HyperbolaValue (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	Focal(Standard_Real)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") ParabolaValue;
		static gp_Pnt2d ParabolaValue (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Focal);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2d)
	P(gp_Pnt2d)
	V1(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") LineD1;
		static void LineD1 (const Standard_Real U,const gp_Ax2d & Pos,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	Radius(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") CircleD1;
		static void CircleD1 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Radius,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") EllipseD1;
		static void EllipseD1 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") HyperbolaD1;
		static void HyperbolaD1 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	Focal(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") ParabolaD1;
		static void ParabolaD1 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Focal,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	Radius(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") CircleD2;
		static void CircleD2 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Radius,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") EllipseD2;
		static void EllipseD2 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") HyperbolaD2;
		static void HyperbolaD2 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	Focal(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") ParabolaD2;
		static void ParabolaD2 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Focal,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	Radius(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") CircleD3;
		static void CircleD3 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Radius,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") EllipseD3;
		static void EllipseD3 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

In the following functions N is the order of derivation  
 and should be greater than 0") HyperbolaD3;
		static void HyperbolaD3 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax2d)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") LineDN;
		static gp_Vec2d LineDN (const Standard_Real U,const gp_Ax2d & Pos,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	Radius(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") CircleDN;
		static gp_Vec2d CircleDN (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Radius,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") EllipseDN;
		static gp_Vec2d EllipseDN (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") HyperbolaDN;
		static gp_Vec2d HyperbolaDN (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pos(gp_Ax22d)
	Focal(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

The following functions compute the parametric value corresponding  
 to a given point on a elementary curve. The point should be on the  
 curve.") ParabolaDN;
		static gp_Vec2d ParabolaDN (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Focal,const Standard_Integer N);
		%feature("autodoc", "Args:
	L(gp_Lin)
	P(gp_Pnt)

Returns:
	static Standard_Real

Computes the parameter value of the point P on the given curve.  
Note: In its local coordinate system, the parametric  
equation of the curve is given by the following:  
-   for the line L: P(U) = Po + U*Vo  
where Po is the origin and Vo the unit vector of its positioning axis.  
-   for the circle C: X(U) = Radius*Cos(U), Y(U) = Radius*Sin(U)  
-   for the ellipse E: X(U) = MajorRadius*Cos(U). Y(U) = MinorRadius*Sin(U)  
-   for the hyperbola H: X(U) = MajorRadius*Ch(U), Y(U) = MinorRadius*Sh(U)  
-   for the parabola Prb:  
X(U) = U**2 / (2*p)  
Y(U) = U  
where p is the distance between the focus and the directrix.  
Warning  
The point P must be on the curve. These functions are  
not protected, however, and if point P is not on the  
curve, an exception may be raised.") Parameter;
		static Standard_Real Parameter (const gp_Lin & L,const gp_Pnt & P);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	P(gp_Pnt2d)

Returns:
	static Standard_Real

parametrization  
 P (U) = L.Location() + U * L.Direction()") Parameter;
		static Standard_Real Parameter (const gp_Lin2d & L,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	C(gp_Circ)
	P(gp_Pnt)

Returns:
	static Standard_Real

No detailed docstring for this function.") Parameter;
		static Standard_Real Parameter (const gp_Circ & C,const gp_Pnt & P);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	P(gp_Pnt2d)

Returns:
	static Standard_Real

parametrization  
 In the local coordinate system of the circle  
 X (U) = Radius * Cos (U)  
 Y (U) = Radius * Sin (U)") Parameter;
		static Standard_Real Parameter (const gp_Circ2d & C,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	E(gp_Elips)
	P(gp_Pnt)

Returns:
	static Standard_Real

No detailed docstring for this function.") Parameter;
		static Standard_Real Parameter (const gp_Elips & E,const gp_Pnt & P);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	P(gp_Pnt2d)

Returns:
	static Standard_Real

parametrization  
 In the local coordinate system of the Ellipse  
 X (U) = MajorRadius * Cos (U)  
 Y (U) = MinorRadius * Sin (U)") Parameter;
		static Standard_Real Parameter (const gp_Elips2d & E,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	H(gp_Hypr)
	P(gp_Pnt)

Returns:
	static Standard_Real

No detailed docstring for this function.") Parameter;
		static Standard_Real Parameter (const gp_Hypr & H,const gp_Pnt & P);
		%feature("autodoc", "Args:
	H(gp_Hypr2d)
	P(gp_Pnt2d)

Returns:
	static Standard_Real

parametrization  
 In the local coordinate system of the Hyperbola  
 X (U) = MajorRadius * Ch (U)  
 Y (U) = MinorRadius * Sh (U)") Parameter;
		static Standard_Real Parameter (const gp_Hypr2d & H,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	Prb(gp_Parab)
	P(gp_Pnt)

Returns:
	static Standard_Real

No detailed docstring for this function.") Parameter;
		static Standard_Real Parameter (const gp_Parab & Prb,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Prb(gp_Parab2d)
	P(gp_Pnt2d)

Returns:
	static Standard_Real

parametrization  
 In the local coordinate system of the parabola  
 Y**2 = (2*P) * X where P is the distance between the focus  
 and the directrix.") Parameter;
		static Standard_Real Parameter (const gp_Parab2d & Prb,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	Pos(gp_Ax1)
	P(gp_Pnt)

Returns:
	static Standard_Real

No detailed docstring for this function.") LineParameter;
		static Standard_Real LineParameter (const gp_Ax1 & Pos,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Pos(gp_Ax2d)
	P(gp_Pnt2d)

Returns:
	static Standard_Real

parametrization  
 P (U) = L.Location() + U * L.Direction()") LineParameter;
		static Standard_Real LineParameter (const gp_Ax2d & Pos,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	P(gp_Pnt)

Returns:
	static Standard_Real

No detailed docstring for this function.") CircleParameter;
		static Standard_Real CircleParameter (const gp_Ax2 & Pos,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Pos(gp_Ax22d)
	P(gp_Pnt2d)

Returns:
	static Standard_Real

Pos is the Axis of the Circle  parametrization  
 In the local coordinate system of the circle  
 X (U) = Radius * Cos (U)  
 Y (U) = Radius * Sin (U)") CircleParameter;
		static Standard_Real CircleParameter (const gp_Ax22d & Pos,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt)

Returns:
	static Standard_Real

No detailed docstring for this function.") EllipseParameter;
		static Standard_Real EllipseParameter (const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Pos(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt2d)

Returns:
	static Standard_Real

Pos is the Axis of the Ellipse  parametrization  
 In the local coordinate system of the Ellipse  
 X (U) = MajorRadius * Cos (U)  
 Y (U) = MinorRadius * Sin (U)") EllipseParameter;
		static Standard_Real EllipseParameter (const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt)

Returns:
	static Standard_Real

No detailed docstring for this function.") HyperbolaParameter;
		static Standard_Real HyperbolaParameter (const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Pos(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	P(gp_Pnt2d)

Returns:
	static Standard_Real

Pos is the Axis of the Hyperbola  parametrization  
 In the local coordinate system of the Hyperbola  
 X (U) = MajorRadius * Ch (U)  
 Y (U) = MinorRadius * Sh (U)") HyperbolaParameter;
		static Standard_Real HyperbolaParameter (const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	P(gp_Pnt)

Returns:
	static Standard_Real

No detailed docstring for this function.") ParabolaParameter;
		static Standard_Real ParabolaParameter (const gp_Ax2 & Pos,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Pos(gp_Ax22d)
	P(gp_Pnt2d)

Returns:
	static Standard_Real

Pos is the mirror axis of the parabola  parametrization  
 In the local coordinate system of the parabola  
 Y**2 = (2*P) * X where P is the distance between the focus  
 and the directrix.   The following functions build  a 3d curve from a  
           2d curve at a given position defined with an Ax2.") ParabolaParameter;
		static Standard_Real ParabolaParameter (const gp_Ax22d & Pos,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	P(gp_Pnt2d)

Returns:
	static gp_Pnt

No detailed docstring for this function.") To3d;
		static gp_Pnt To3d (const gp_Ax2 & Pos,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	V(gp_Vec2d)

Returns:
	static gp_Vec

No detailed docstring for this function.") To3d;
		static gp_Vec To3d (const gp_Ax2 & Pos,const gp_Vec2d & V);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	V(gp_Dir2d)

Returns:
	static gp_Dir

No detailed docstring for this function.") To3d;
		static gp_Dir To3d (const gp_Ax2 & Pos,const gp_Dir2d & V);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	A(gp_Ax2d)

Returns:
	static gp_Ax1

No detailed docstring for this function.") To3d;
		static gp_Ax1 To3d (const gp_Ax2 & Pos,const gp_Ax2d & A);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	A(gp_Ax22d)

Returns:
	static gp_Ax2

No detailed docstring for this function.") To3d;
		static gp_Ax2 To3d (const gp_Ax2 & Pos,const gp_Ax22d & A);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	L(gp_Lin2d)

Returns:
	static gp_Lin

No detailed docstring for this function.") To3d;
		static gp_Lin To3d (const gp_Ax2 & Pos,const gp_Lin2d & L);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	C(gp_Circ2d)

Returns:
	static gp_Circ

No detailed docstring for this function.") To3d;
		static gp_Circ To3d (const gp_Ax2 & Pos,const gp_Circ2d & C);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	E(gp_Elips2d)

Returns:
	static gp_Elips

No detailed docstring for this function.") To3d;
		static gp_Elips To3d (const gp_Ax2 & Pos,const gp_Elips2d & E);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	H(gp_Hypr2d)

Returns:
	static gp_Hypr

No detailed docstring for this function.") To3d;
		static gp_Hypr To3d (const gp_Ax2 & Pos,const gp_Hypr2d & H);
		%feature("autodoc", "Args:
	Pos(gp_Ax2)
	Prb(gp_Parab2d)

Returns:
	static gp_Parab

These functions build a 3D geometric entity from a 2D geometric entity.  
The 'X Axis' and the 'Y Axis' of the global coordinate  
system (i.e. 2D space) are lined up respectively with the  
'X Axis' and 'Y Axis' of the 3D coordinate system, Pos.") To3d;
		static gp_Parab To3d (const gp_Ax2 & Pos,const gp_Parab2d & Prb);
};


%feature("shadow") ElCLib::~ElCLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ElCLib {
	void _kill_pointed() {
		delete $self;
	}
};
