/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include ElCLib_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(elclib) ElCLib;
class ElCLib {
	public:
		%feature("compactdefaultargs") InPeriod;
		%feature("autodoc", "	* Return a value in the range <UFirst, ULast> by adding or removing the period <ULast - UFirst> to <U>.

	:param U:
	:type U: float
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: float
") InPeriod;
		static Standard_Real InPeriod (const Standard_Real U,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("compactdefaultargs") AdjustPeriodic;
		%feature("autodoc", "	* Adjust U1 and U2 in the parametric range UFirst Ulast of a periodic curve, where ULast - UFirst is its period. To do this, this function: - sets U1 in the range [ UFirst, ULast ] by adding/removing the period to/from the value U1, then - sets U2 in the range [ U1, U1 + period ] by adding/removing the period to/from the value U2. Precision is used to test the equalities.

	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param Precision:
	:type Precision: float
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: void
") AdjustPeriodic;
		static void AdjustPeriodic (const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real Precision,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* For elementary curves (lines, circles and conics) from the gp package, computes the point of parameter U. The result is either: - a gp_Pnt point for a curve in 3D space, or - a gp_Pnt2d point for a curve in 2D space.

	:param U:
	:type U: float
	:param L:
	:type L: gp_Lin
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Standard_Real U,const gp_Lin & L);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Standard_Real U,const gp_Circ & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Standard_Real U,const gp_Elips & E);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Standard_Real U,const gp_Hypr & H);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Standard_Real U,const gp_Parab & Prb);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* For elementary curves (lines, circles and conics) from the gp package, computes: - the point P of parameter U, and - the first derivative vector V1 at this point. The results P and V1 are either: - a gp_Pnt point and a gp_Vec vector, for a curve in 3D space, or - a gp_Pnt2d point and a gp_Vec2d vector, for a curve in 2D space.

	:param U:
	:type U: float
	:param L:
	:type L: gp_Lin
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const gp_Lin & L,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const gp_Circ & C,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const gp_Elips & E,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const gp_Hypr & H,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const gp_Parab & Prb,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* For elementary curves (circles and conics) from the gp package, computes: - the point P of parameter U, and - the first and second derivative vectors V1 and V2 at this point. The results, P, V1 and V2, are either: - a gp_Pnt point and two gp_Vec vectors, for a curve in 3D space, or - a gp_Pnt2d point and two gp_Vec2d vectors, for a curve in 2D space.

	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Standard_Real U,const gp_Circ & C,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Standard_Real U,const gp_Elips & E,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Standard_Real U,const gp_Hypr & H,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Standard_Real U,const gp_Parab & Prb,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* For elementary curves (circles, ellipses and hyperbolae) from the gp package, computes: - the point P of parameter U, and - the first, second and third derivative vectors V1, V2 and V3 at this point. The results, P, V1, V2 and V3, are either: - a gp_Pnt point and three gp_Vec vectors, for a curve in 3D space, or - a gp_Pnt2d point and three gp_Vec2d vectors, for a curve in 2D space.

	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void
") D3;
		static void D3 (const Standard_Real U,const gp_Circ & C,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void
") D3;
		static void D3 (const Standard_Real U,const gp_Elips & E,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void
") D3;
		static void D3 (const Standard_Real U,const gp_Hypr & H,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* For elementary curves (lines, circles and conics) from the gp package, computes the vector corresponding to the Nth derivative at the point of parameter U. The result is either: - a gp_Vec vector for a curve in 3D space, or - a gp_Vec2d vector for a curve in 2D space. In the following functions N is the order of derivation and should be greater than 0

	:param U:
	:type U: float
	:param L:
	:type L: gp_Lin
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Standard_Real U,const gp_Lin & L,const Standard_Integer N);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Standard_Real U,const gp_Circ & C,const Standard_Integer N);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Standard_Real U,const gp_Elips & E,const Standard_Integer N);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Standard_Real U,const gp_Hypr & H,const Standard_Integer N);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Standard_Real U,const gp_Parab & Prb,const Standard_Integer N);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param L:
	:type L: gp_Lin2d
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Standard_Real U,const gp_Lin2d & L);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ2d
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Standard_Real U,const gp_Circ2d & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips2d
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Standard_Real U,const gp_Elips2d & E);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr2d
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Standard_Real U,const gp_Hypr2d & H);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab2d
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Standard_Real U,const gp_Parab2d & Prb);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const gp_Lin2d & L,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const gp_Circ2d & C,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const gp_Elips2d & E,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const gp_Hypr2d & H,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const gp_Parab2d & Prb,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const Standard_Real U,const gp_Circ2d & C,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const Standard_Real U,const gp_Elips2d & E,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const Standard_Real U,const gp_Hypr2d & H,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const Standard_Real U,const gp_Parab2d & Prb,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: void
") D3;
		static void D3 (const Standard_Real U,const gp_Circ2d & C,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: void
") D3;
		static void D3 (const Standard_Real U,const gp_Elips2d & E,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* In the following functions N is the order of derivation and should be greater than 0

	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: void
") D3;
		static void D3 (const Standard_Real U,const gp_Hypr2d & H,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param L:
	:type L: gp_Lin2d
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Standard_Real U,const gp_Lin2d & L,const Standard_Integer N);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ2d
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Standard_Real U,const gp_Circ2d & C,const Standard_Integer N);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips2d
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Standard_Real U,const gp_Elips2d & E,const Standard_Integer N);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr2d
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Standard_Real U,const gp_Hypr2d & H,const Standard_Integer N);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab2d
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Standard_Real U,const gp_Parab2d & Prb,const Standard_Integer N);
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "	* Curve evaluation The following basis functions compute the derivatives on elementary curves defined by their geometric characteristics. These functions can be called without constructing a conic from package gp. They are called by the previous functions. Example : A circle is defined by its position and its radius.

	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax1
	:rtype: gp_Pnt
") LineValue;
		static gp_Pnt LineValue (const Standard_Real U,const gp_Ax1 & Pos);
		%feature("compactdefaultargs") CircleValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Radius:
	:type Radius: float
	:rtype: gp_Pnt
") CircleValue;
		static gp_Pnt CircleValue (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Radius);
		%feature("compactdefaultargs") EllipseValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: gp_Pnt
") EllipseValue;
		static gp_Pnt EllipseValue (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") HyperbolaValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: gp_Pnt
") HyperbolaValue;
		static gp_Pnt HyperbolaValue (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") ParabolaValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Focal:
	:type Focal: float
	:rtype: gp_Pnt
") ParabolaValue;
		static gp_Pnt ParabolaValue (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Focal);
		%feature("compactdefaultargs") LineD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax1
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") LineD1;
		static void LineD1 (const Standard_Real U,const gp_Ax1 & Pos,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") CircleD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") CircleD1;
		static void CircleD1 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") EllipseD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") EllipseD1;
		static void EllipseD1 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") HyperbolaD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") HyperbolaD1;
		static void HyperbolaD1 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") ParabolaD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Focal:
	:type Focal: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") ParabolaD1;
		static void ParabolaD1 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Focal,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") CircleD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") CircleD2;
		static void CircleD2 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") EllipseD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") EllipseD2;
		static void EllipseD2 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") HyperbolaD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") HyperbolaD2;
		static void HyperbolaD2 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") ParabolaD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Focal:
	:type Focal: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") ParabolaD2;
		static void ParabolaD2 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Focal,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") CircleD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void
") CircleD3;
		static void CircleD3 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Radius,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") EllipseD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void
") EllipseD3;
		static void EllipseD3 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") HyperbolaD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void
") HyperbolaD3;
		static void HyperbolaD3 (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") LineDN;
		%feature("autodoc", "	* In the following functions N is the order of derivation and should be greater than 0

	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax1
	:param N:
	:type N: int
	:rtype: gp_Vec
") LineDN;
		static gp_Vec LineDN (const Standard_Real U,const gp_Ax1 & Pos,const Standard_Integer N);
		%feature("compactdefaultargs") CircleDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Radius:
	:type Radius: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") CircleDN;
		static gp_Vec CircleDN (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Radius,const Standard_Integer N);
		%feature("compactdefaultargs") EllipseDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") EllipseDN;
		static gp_Vec EllipseDN (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Integer N);
		%feature("compactdefaultargs") HyperbolaDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") HyperbolaDN;
		static gp_Vec HyperbolaDN (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Integer N);
		%feature("compactdefaultargs") ParabolaDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Focal:
	:type Focal: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") ParabolaDN;
		static gp_Vec ParabolaDN (const Standard_Real U,const gp_Ax2 & Pos,const Standard_Real Focal,const Standard_Integer N);
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2d
	:rtype: gp_Pnt2d
") LineValue;
		static gp_Pnt2d LineValue (const Standard_Real U,const gp_Ax2d & Pos);
		%feature("compactdefaultargs") CircleValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Radius:
	:type Radius: float
	:rtype: gp_Pnt2d
") CircleValue;
		static gp_Pnt2d CircleValue (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Radius);
		%feature("compactdefaultargs") EllipseValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: gp_Pnt2d
") EllipseValue;
		static gp_Pnt2d EllipseValue (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") HyperbolaValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: gp_Pnt2d
") HyperbolaValue;
		static gp_Pnt2d HyperbolaValue (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") ParabolaValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Focal:
	:type Focal: float
	:rtype: gp_Pnt2d
") ParabolaValue;
		static gp_Pnt2d ParabolaValue (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Focal);
		%feature("compactdefaultargs") LineD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") LineD1;
		static void LineD1 (const Standard_Real U,const gp_Ax2d & Pos,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("compactdefaultargs") CircleD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") CircleD1;
		static void CircleD1 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Radius,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("compactdefaultargs") EllipseD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") EllipseD1;
		static void EllipseD1 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("compactdefaultargs") HyperbolaD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") HyperbolaD1;
		static void HyperbolaD1 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("compactdefaultargs") ParabolaD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Focal:
	:type Focal: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") ParabolaD1;
		static void ParabolaD1 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Focal,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("compactdefaultargs") CircleD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") CircleD2;
		static void CircleD2 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Radius,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") EllipseD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") EllipseD2;
		static void EllipseD2 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") HyperbolaD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") HyperbolaD2;
		static void HyperbolaD2 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") ParabolaD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Focal:
	:type Focal: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") ParabolaD2;
		static void ParabolaD2 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Focal,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") CircleD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: void
") CircleD3;
		static void CircleD3 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Radius,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("compactdefaultargs") EllipseD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: void
") EllipseD3;
		static void EllipseD3 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("compactdefaultargs") HyperbolaD3;
		%feature("autodoc", "	* In the following functions N is the order of derivation and should be greater than 0

	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: void
") HyperbolaD3;
		static void HyperbolaD3 (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("compactdefaultargs") LineDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2d
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") LineDN;
		static gp_Vec2d LineDN (const Standard_Real U,const gp_Ax2d & Pos,const Standard_Integer N);
		%feature("compactdefaultargs") CircleDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Radius:
	:type Radius: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") CircleDN;
		static gp_Vec2d CircleDN (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Radius,const Standard_Integer N);
		%feature("compactdefaultargs") EllipseDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") EllipseDN;
		static gp_Vec2d EllipseDN (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Integer N);
		%feature("compactdefaultargs") HyperbolaDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") HyperbolaDN;
		static gp_Vec2d HyperbolaDN (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Integer N);
		%feature("compactdefaultargs") ParabolaDN;
		%feature("autodoc", "	* The following functions compute the parametric value corresponding to a given point on a elementary curve. The point should be on the curve.

	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Focal:
	:type Focal: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") ParabolaDN;
		static gp_Vec2d ParabolaDN (const Standard_Real U,const gp_Ax22d & Pos,const Standard_Real Focal,const Standard_Integer N);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Computes the parameter value of the point P on the given curve. Note: In its local coordinate system, the parametric equation of the curve is given by the following: - for the line L: P(U) = Po + U*Vo where Po is the origin and Vo the unit vector of its positioning axis. - for the circle C: X(U) = Radius*Cos(U), Y(U) = Radius*Sin(U) - for the ellipse E: X(U) = MajorRadius*Cos(U). Y(U) = MinorRadius*Sin(U) - for the hyperbola H: X(U) = MajorRadius*Ch(U), Y(U) = MinorRadius*Sh(U) - for the parabola Prb: X(U) = U**2 / (2*p) Y(U) = U where p is the distance between the focus and the directrix. Warning The point P must be on the curve. These functions are not protected, however, and if point P is not on the curve, an exception may be raised.

	:param L:
	:type L: gp_Lin
	:param P:
	:type P: gp_Pnt
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const gp_Lin & L,const gp_Pnt & P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* parametrization P (U) = L.Location() + U * L.Direction()

	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const gp_Lin2d & L,const gp_Pnt2d & P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param P:
	:type P: gp_Pnt
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const gp_Circ & C,const gp_Pnt & P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* parametrization In the local coordinate system of the circle X (U) = Radius * Cos (U) Y (U) = Radius * Sin (U)

	:param C:
	:type C: gp_Circ2d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const gp_Circ2d & C,const gp_Pnt2d & P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param E:
	:type E: gp_Elips
	:param P:
	:type P: gp_Pnt
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const gp_Elips & E,const gp_Pnt & P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* parametrization In the local coordinate system of the Ellipse X (U) = MajorRadius * Cos (U) Y (U) = MinorRadius * Sin (U)

	:param E:
	:type E: gp_Elips2d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const gp_Elips2d & E,const gp_Pnt2d & P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr
	:param P:
	:type P: gp_Pnt
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const gp_Hypr & H,const gp_Pnt & P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* parametrization In the local coordinate system of the Hyperbola X (U) = MajorRadius * Ch (U) Y (U) = MinorRadius * Sh (U)

	:param H:
	:type H: gp_Hypr2d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const gp_Hypr2d & H,const gp_Pnt2d & P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param Prb:
	:type Prb: gp_Parab
	:param P:
	:type P: gp_Pnt
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const gp_Parab & Prb,const gp_Pnt & P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* parametrization In the local coordinate system of the parabola Y**2 = (2*P) * X where P is the distance between the focus and the directrix.

	:param Prb:
	:type Prb: gp_Parab2d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const gp_Parab2d & Prb,const gp_Pnt2d & P);
		%feature("compactdefaultargs") LineParameter;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax1
	:param P:
	:type P: gp_Pnt
	:rtype: float
") LineParameter;
		static Standard_Real LineParameter (const gp_Ax1 & Pos,const gp_Pnt & P);
		%feature("compactdefaultargs") LineParameter;
		%feature("autodoc", "	* parametrization P (U) = L.Location() + U * L.Direction()

	:param Pos:
	:type Pos: gp_Ax2d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") LineParameter;
		static Standard_Real LineParameter (const gp_Ax2d & Pos,const gp_Pnt2d & P);
		%feature("compactdefaultargs") CircleParameter;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param P:
	:type P: gp_Pnt
	:rtype: float
") CircleParameter;
		static Standard_Real CircleParameter (const gp_Ax2 & Pos,const gp_Pnt & P);
		%feature("compactdefaultargs") CircleParameter;
		%feature("autodoc", "	* Pos is the Axis of the Circle parametrization In the local coordinate system of the circle X (U) = Radius * Cos (U) Y (U) = Radius * Sin (U)

	:param Pos:
	:type Pos: gp_Ax22d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") CircleParameter;
		static Standard_Real CircleParameter (const gp_Ax22d & Pos,const gp_Pnt2d & P);
		%feature("compactdefaultargs") EllipseParameter;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:rtype: float
") EllipseParameter;
		static Standard_Real EllipseParameter (const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const gp_Pnt & P);
		%feature("compactdefaultargs") EllipseParameter;
		%feature("autodoc", "	* Pos is the Axis of the Ellipse parametrization In the local coordinate system of the Ellipse X (U) = MajorRadius * Cos (U) Y (U) = MinorRadius * Sin (U)

	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") EllipseParameter;
		static Standard_Real EllipseParameter (const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const gp_Pnt2d & P);
		%feature("compactdefaultargs") HyperbolaParameter;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:rtype: float
") HyperbolaParameter;
		static Standard_Real HyperbolaParameter (const gp_Ax2 & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const gp_Pnt & P);
		%feature("compactdefaultargs") HyperbolaParameter;
		%feature("autodoc", "	* Pos is the Axis of the Hyperbola parametrization In the local coordinate system of the Hyperbola X (U) = MajorRadius * Ch (U) Y (U) = MinorRadius * Sh (U)

	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") HyperbolaParameter;
		static Standard_Real HyperbolaParameter (const gp_Ax22d & Pos,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const gp_Pnt2d & P);
		%feature("compactdefaultargs") ParabolaParameter;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param P:
	:type P: gp_Pnt
	:rtype: float
") ParabolaParameter;
		static Standard_Real ParabolaParameter (const gp_Ax2 & Pos,const gp_Pnt & P);
		%feature("compactdefaultargs") ParabolaParameter;
		%feature("autodoc", "	* Pos is the mirror axis of the parabola parametrization In the local coordinate system of the parabola Y**2 = (2*P) * X where P is the distance between the focus and the directrix. The following functions build a 3d curve from a 2d curve at a given position defined with an Ax2.

	:param Pos:
	:type Pos: gp_Ax22d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") ParabolaParameter;
		static Standard_Real ParabolaParameter (const gp_Ax22d & Pos,const gp_Pnt2d & P);
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param P:
	:type P: gp_Pnt2d
	:rtype: gp_Pnt
") To3d;
		static gp_Pnt To3d (const gp_Ax2 & Pos,const gp_Pnt2d & P);
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param V:
	:type V: gp_Vec2d
	:rtype: gp_Vec
") To3d;
		static gp_Vec To3d (const gp_Ax2 & Pos,const gp_Vec2d & V);
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param V:
	:type V: gp_Dir2d
	:rtype: gp_Dir
") To3d;
		static gp_Dir To3d (const gp_Ax2 & Pos,const gp_Dir2d & V);
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param A:
	:type A: gp_Ax2d
	:rtype: gp_Ax1
") To3d;
		static gp_Ax1 To3d (const gp_Ax2 & Pos,const gp_Ax2d & A);
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param A:
	:type A: gp_Ax22d
	:rtype: gp_Ax2
") To3d;
		static gp_Ax2 To3d (const gp_Ax2 & Pos,const gp_Ax22d & A);
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param L:
	:type L: gp_Lin2d
	:rtype: gp_Lin
") To3d;
		static gp_Lin To3d (const gp_Ax2 & Pos,const gp_Lin2d & L);
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param C:
	:type C: gp_Circ2d
	:rtype: gp_Circ
") To3d;
		static gp_Circ To3d (const gp_Ax2 & Pos,const gp_Circ2d & C);
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param E:
	:type E: gp_Elips2d
	:rtype: gp_Elips
") To3d;
		static gp_Elips To3d (const gp_Ax2 & Pos,const gp_Elips2d & E);
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param H:
	:type H: gp_Hypr2d
	:rtype: gp_Hypr
") To3d;
		static gp_Hypr To3d (const gp_Ax2 & Pos,const gp_Hypr2d & H);
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	* These functions build a 3D geometric entity from a 2D geometric entity. The 'X Axis' and the 'Y Axis' of the global coordinate system (i.e. 2D space) are lined up respectively with the 'X Axis' and 'Y Axis' of the 3D coordinate system, Pos.

	:param Pos:
	:type Pos: gp_Ax2
	:param Prb:
	:type Prb: gp_Parab2d
	:rtype: gp_Parab
") To3d;
		static gp_Parab To3d (const gp_Ax2 & Pos,const gp_Parab2d & Prb);
};


%extend ElCLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
