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
%module (package="OCC") IntCurve

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


%include IntCurve_headers.i


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

%nodefaultctor IntCurve_IConicTool;
class IntCurve_IConicTool {
	public:
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "	:rtype: None
") IntCurve_IConicTool;
		 IntCurve_IConicTool ();
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "	:param IT:
	:type IT: IntCurve_IConicTool &
	:rtype: None
") IntCurve_IConicTool;
		 IntCurve_IConicTool (const IntCurve_IConicTool & IT);
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "	:param E:
	:type E: gp_Elips2d
	:rtype: None
") IntCurve_IConicTool;
		 IntCurve_IConicTool (const gp_Elips2d & E);
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:rtype: None
") IntCurve_IConicTool;
		 IntCurve_IConicTool (const gp_Lin2d & L);
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ2d
	:rtype: None
") IntCurve_IConicTool;
		 IntCurve_IConicTool (const gp_Circ2d & C);
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "	:param P:
	:type P: gp_Parab2d
	:rtype: None
") IntCurve_IConicTool;
		 IntCurve_IConicTool (const gp_Parab2d & P);
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr2d
	:rtype: None
") IntCurve_IConicTool;
		 IntCurve_IConicTool (const gp_Hypr2d & H);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: float
	:rtype: gp_Pnt2d
") Value;
		gp_Pnt2d Value (const Standard_Real X);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:param N:
	:type N: gp_Vec2d
	:rtype: None
") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Computes the value of the signed distance between the point P and the implicit curve.

	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_Pnt2d & P);
		%feature("compactdefaultargs") GradDistance;
		%feature("autodoc", "	* Computes the Gradient of the Signed Distance between a point and the implicit curve, at the point P.

	:param P:
	:type P: gp_Pnt2d
	:rtype: gp_Vec2d
") GradDistance;
		gp_Vec2d GradDistance (const gp_Pnt2d & P);
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "	* Returns the parameter U of the point on the implicit curve corresponding to the point P. The correspondance between P and the point P(U) on the implicit curve must be coherent with the way of determination of the signed distance.

	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") FindParameter;
		Standard_Real FindParameter (const gp_Pnt2d & P);
};


%extend IntCurve_IConicTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurve_IntConicConic;
class IntCurve_IntConicConic : public IntRes2d_Intersection {
	public:
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Empty Constructor

	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic ();
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between 2 lines from gp.

	:param L1:
	:type L1: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param L2:
	:type L2: gp_Lin2d
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Lin2d & L1,const IntRes2d_Domain & D1,const gp_Lin2d & L2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between 2 lines from gp.

	:param L1:
	:type L1: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param L2:
	:type L2: gp_Lin2d
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L1,const IntRes2d_Domain & D1,const gp_Lin2d & L2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between a line and a circle. The exception ConstructionError is raised if the method IsClosed of the domain of the circle returns False.

	:param L:
	:type L: gp_Lin2d
	:param DL:
	:type DL: IntRes2d_Domain &
	:param C:
	:type C: gp_Circ2d
	:param DC:
	:type DC: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Circ2d & C,const IntRes2d_Domain & DC,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a line and a circle. The exception ConstructionError is raised if the method IsClosed of the domain of the circle returns False.

	:param L:
	:type L: gp_Lin2d
	:param DL:
	:type DL: IntRes2d_Domain &
	:param C:
	:type C: gp_Circ2d
	:param DC:
	:type DC: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Circ2d & C,const IntRes2d_Domain & DC,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between a line and an ellipse. The exception ConstructionError is raised if the method IsClosed of the domain of the ellipse returns False.

	:param L:
	:type L: gp_Lin2d
	:param DL:
	:type DL: IntRes2d_Domain &
	:param E:
	:type E: gp_Elips2d
	:param DE:
	:type DE: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Elips2d & E,const IntRes2d_Domain & DE,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a line and an ellipse. The exception ConstructionError is raised if the method IsClosed of the domain of the ellipse returns False.

	:param L:
	:type L: gp_Lin2d
	:param DL:
	:type DL: IntRes2d_Domain &
	:param E:
	:type E: gp_Elips2d
	:param DE:
	:type DE: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Elips2d & E,const IntRes2d_Domain & DE,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between a line and a parabola from gp.

	:param L:
	:type L: gp_Lin2d
	:param DL:
	:type DL: IntRes2d_Domain &
	:param P:
	:type P: gp_Parab2d
	:param DP:
	:type DP: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Parab2d & P,const IntRes2d_Domain & DP,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a line and a parabola from gp.

	:param L:
	:type L: gp_Lin2d
	:param DL:
	:type DL: IntRes2d_Domain &
	:param P:
	:type P: gp_Parab2d
	:param DP:
	:type DP: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Parab2d & P,const IntRes2d_Domain & DP,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between a line and an hyperbola.

	:param L:
	:type L: gp_Lin2d
	:param DL:
	:type DL: IntRes2d_Domain &
	:param H:
	:type H: gp_Hypr2d
	:param DH:
	:type DH: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a line and an hyperbola.

	:param L:
	:type L: gp_Lin2d
	:param DL:
	:type DL: IntRes2d_Domain &
	:param H:
	:type H: gp_Hypr2d
	:param DH:
	:type DH: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between 2 circles from gp. The exception ConstructionError is raised if the method IsClosed of one of the domain returns False.

	:param C1:
	:type C1: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param C2:
	:type C2: gp_Circ2d
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Circ2d & C1,const IntRes2d_Domain & D1,const gp_Circ2d & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between 2 circles from gp. The exception ConstructionError is raised if the method IsClosed of the domain of one of the circle returns False.

	:param C1:
	:type C1: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param C2:
	:type C2: gp_Circ2d
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Circ2d & C1,const IntRes2d_Domain & D1,const gp_Circ2d & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between a circle and an ellipse. The exception ConstructionError is raised if the method IsClosed of one the domain returns False.

	:param C:
	:type C: gp_Circ2d
	:param DC:
	:type DC: IntRes2d_Domain &
	:param E:
	:type E: gp_Elips2d
	:param DE:
	:type DE: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Circ2d & C,const IntRes2d_Domain & DC,const gp_Elips2d & E,const IntRes2d_Domain & DE,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a circle and an ellipse. The exception ConstructionError is raised if the method IsClosed of one the domain returns False.

	:param C:
	:type C: gp_Circ2d
	:param DC:
	:type DC: IntRes2d_Domain &
	:param E:
	:type E: gp_Elips2d
	:param DE:
	:type DE: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & DC,const gp_Elips2d & E,const IntRes2d_Domain & DE,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between a circle and a parabola. The exception ConstructionError is raised if the method IsClosed of the domain of the circle returns False.

	:param C:
	:type C: gp_Circ2d
	:param DC:
	:type DC: IntRes2d_Domain &
	:param P:
	:type P: gp_Parab2d
	:param DP:
	:type DP: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Circ2d & C,const IntRes2d_Domain & DC,const gp_Parab2d & P,const IntRes2d_Domain & DP,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a circle and a parabola. The exception ConstructionError is raised if the method IsClosed of the domain of the circle returns False.

	:param C:
	:type C: gp_Circ2d
	:param DC:
	:type DC: IntRes2d_Domain &
	:param P:
	:type P: gp_Parab2d
	:param DP:
	:type DP: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & DC,const gp_Parab2d & P,const IntRes2d_Domain & DP,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between a circle and an hyperbola. The exception ConstructionError is raised if the method IsClosed of the domain of the circle returns False.

	:param C:
	:type C: gp_Circ2d
	:param DC:
	:type DC: IntRes2d_Domain &
	:param H:
	:type H: gp_Hypr2d
	:param DH:
	:type DH: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Circ2d & C,const IntRes2d_Domain & DC,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a circle and an hyperbola. The exception ConstructionError is raised if the method IsClosed of the domain of the circle returns False.

	:param C:
	:type C: gp_Circ2d
	:param DC:
	:type DC: IntRes2d_Domain &
	:param H:
	:type H: gp_Hypr2d
	:param DH:
	:type DH: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & DC,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between 2 ellipses. The exception ConstructionError is raised if the method IsClosed of one of the domain returns False.

	:param E1:
	:type E1: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param E2:
	:type E2: gp_Elips2d
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Elips2d & E1,const IntRes2d_Domain & D1,const gp_Elips2d & E2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between 2 ellipses. The exception ConstructionError is raised if the method IsClosed of one of the domain returns False.

	:param E1:
	:type E1: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param E2:
	:type E2: gp_Elips2d
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Elips2d & E1,const IntRes2d_Domain & D1,const gp_Elips2d & E2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between an ellipse and a parabola. The exception ConstructionError is raised if the method IsClosed of the domain of the ellipse returns False.

	:param E:
	:type E: gp_Elips2d
	:param DE:
	:type DE: IntRes2d_Domain &
	:param P:
	:type P: gp_Parab2d
	:param DP:
	:type DP: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Elips2d & E,const IntRes2d_Domain & DE,const gp_Parab2d & P,const IntRes2d_Domain & DP,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between an ellipse and a parabola. The exception ConstructionError is raised if the method IsClosed of the domain of the ellipse returns False.

	:param E:
	:type E: gp_Elips2d
	:param DE:
	:type DE: IntRes2d_Domain &
	:param P:
	:type P: gp_Parab2d
	:param DP:
	:type DP: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & DE,const gp_Parab2d & P,const IntRes2d_Domain & DP,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between an ellipse and an hyperbola. The exception ConstructionError is raised if the method IsClosed of the domain of the ellipse returns False.

	:param E:
	:type E: gp_Elips2d
	:param DE:
	:type DE: IntRes2d_Domain &
	:param H:
	:type H: gp_Hypr2d
	:param DH:
	:type DH: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Elips2d & E,const IntRes2d_Domain & DE,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between an ellipse and an hyperbola. The exception ConstructionError is raised if the method IsClosed of the domain of the ellipse returns False.

	:param E:
	:type E: gp_Elips2d
	:param DE:
	:type DE: IntRes2d_Domain &
	:param H:
	:type H: gp_Hypr2d
	:param DH:
	:type DH: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & DE,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between 2 parabolas.

	:param P1:
	:type P1: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param P2:
	:type P2: gp_Parab2d
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Parab2d & P1,const IntRes2d_Domain & D1,const gp_Parab2d & P2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between 2 parabolas.

	:param P1:
	:type P1: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param P2:
	:type P2: gp_Parab2d
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Parab2d & P1,const IntRes2d_Domain & D1,const gp_Parab2d & P2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between a parabola and an hyperbola.

	:param P:
	:type P: gp_Parab2d
	:param DP:
	:type DP: IntRes2d_Domain &
	:param H:
	:type H: gp_Hypr2d
	:param DH:
	:type DH: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Parab2d & P,const IntRes2d_Domain & DP,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a parabola and an hyperbola.

	:param P:
	:type P: gp_Parab2d
	:param DP:
	:type DP: IntRes2d_Domain &
	:param H:
	:type H: gp_Hypr2d
	:param DH:
	:type DH: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Parab2d & P,const IntRes2d_Domain & DP,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "	* Intersection between 2 hyperbolas.

	:param H1:
	:type H1: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param H2:
	:type H2: gp_Hypr2d
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Hypr2d & H1,const IntRes2d_Domain & D1,const gp_Hypr2d & H2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between 2 hyperbolas.

	:param H1:
	:type H1: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param H2:
	:type H2: gp_Hypr2d
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Hypr2d & H1,const IntRes2d_Domain & D1,const gp_Hypr2d & H2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
};


%extend IntCurve_IntConicConic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurve_IntImpConicParConic;
class IntCurve_IntImpConicParConic : public IntRes2d_Intersection {
	public:
		%feature("compactdefaultargs") IntCurve_IntImpConicParConic;
		%feature("autodoc", "	:rtype: None
") IntCurve_IntImpConicParConic;
		 IntCurve_IntImpConicParConic ();
		%feature("compactdefaultargs") IntCurve_IntImpConicParConic;
		%feature("autodoc", "	:param ITool:
	:type ITool: IntCurve_IConicTool &
	:param Dom1:
	:type Dom1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: IntCurve_PConic &
	:param Dom2:
	:type Dom2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntCurve_IntImpConicParConic;
		 IntCurve_IntImpConicParConic (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const IntCurve_PConic & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param ITool:
	:type ITool: IntCurve_IConicTool &
	:param Dom1:
	:type Dom1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: IntCurve_PConic &
	:param Dom2:
	:type Dom2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const IntCurve_PConic & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") FindU;
		%feature("autodoc", "	:param parameter:
	:type parameter: float
	:param point:
	:type point: gp_Pnt2d
	:param TheParCurev:
	:type TheParCurev: IntCurve_PConic &
	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool &
	:rtype: float
") FindU;
		Standard_Real FindU (const Standard_Real parameter,gp_Pnt2d & point,const IntCurve_PConic & TheParCurev,const IntCurve_IConicTool & TheImpTool);
		%feature("compactdefaultargs") FindV;
		%feature("autodoc", "	:param parameter:
	:type parameter: float
	:param point:
	:type point: gp_Pnt2d
	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool &
	:param ParCurve:
	:type ParCurve: IntCurve_PConic &
	:param TheParCurveDomain:
	:type TheParCurveDomain: IntRes2d_Domain &
	:param V0:
	:type V0: float
	:param V1:
	:type V1: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: float
") FindV;
		Standard_Real FindV (const Standard_Real parameter,gp_Pnt2d & point,const IntCurve_IConicTool & TheImpTool,const IntCurve_PConic & ParCurve,const IntRes2d_Domain & TheParCurveDomain,const Standard_Real V0,const Standard_Real V1,const Standard_Real Tolerance);
		%feature("compactdefaultargs") And_Domaine_Objet1_Intersections;
		%feature("autodoc", "	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool &
	:param TheParCurve:
	:type TheParCurve: IntCurve_PConic &
	:param TheImpCurveDomain:
	:type TheImpCurveDomain: IntRes2d_Domain &
	:param TheParCurveDomain:
	:type TheParCurveDomain: IntRes2d_Domain &
	:param NbResultats:
	:type NbResultats: int &
	:param Inter2_And_Domain2:
	:type Inter2_And_Domain2: TColStd_Array1OfReal &
	:param Inter1:
	:type Inter1: TColStd_Array1OfReal &
	:param Resultat1:
	:type Resultat1: TColStd_Array1OfReal &
	:param Resultat2:
	:type Resultat2: TColStd_Array1OfReal &
	:param EpsNul:
	:type EpsNul: float
	:rtype: None
") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections (const IntCurve_IConicTool & TheImpTool,const IntCurve_PConic & TheParCurve,const IntRes2d_Domain & TheImpCurveDomain,const IntRes2d_Domain & TheParCurveDomain,Standard_Integer &OutValue,TColStd_Array1OfReal & Inter2_And_Domain2,TColStd_Array1OfReal & Inter1,TColStd_Array1OfReal & Resultat1,TColStd_Array1OfReal & Resultat2,const Standard_Real EpsNul);
};


%extend IntCurve_IntImpConicParConic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurve_MyImpParToolOfIntImpConicParConic;
class IntCurve_MyImpParToolOfIntImpConicParConic : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") IntCurve_MyImpParToolOfIntImpConicParConic;
		%feature("autodoc", "	:param IT:
	:type IT: IntCurve_IConicTool &
	:param PC:
	:type PC: IntCurve_PConic &
	:rtype: None
") IntCurve_MyImpParToolOfIntImpConicParConic;
		 IntCurve_MyImpParToolOfIntImpConicParConic (const IntCurve_IConicTool & IT,const IntCurve_PConic & PC);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real Param,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend IntCurve_MyImpParToolOfIntImpConicParConic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurve_PConic;
class IntCurve_PConic {
	public:
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "	:param PC:
	:type PC: IntCurve_PConic &
	:rtype: None
") IntCurve_PConic;
		 IntCurve_PConic (const IntCurve_PConic & PC);
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "	:param E:
	:type E: gp_Elips2d
	:rtype: None
") IntCurve_PConic;
		 IntCurve_PConic (const gp_Elips2d & E);
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ2d
	:rtype: None
") IntCurve_PConic;
		 IntCurve_PConic (const gp_Circ2d & C);
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "	:param P:
	:type P: gp_Parab2d
	:rtype: None
") IntCurve_PConic;
		 IntCurve_PConic (const gp_Parab2d & P);
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr2d
	:rtype: None
") IntCurve_PConic;
		 IntCurve_PConic (const gp_Hypr2d & H);
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:rtype: None
") IntCurve_PConic;
		 IntCurve_PConic (const gp_Lin2d & L);
		%feature("compactdefaultargs") SetEpsX;
		%feature("autodoc", "	* EpsX is a internal tolerance used in math algorithms, usually about 1e-10 (See FunctionAllRoots for more details)

	:param EpsDist:
	:type EpsDist: float
	:rtype: None
") SetEpsX;
		void SetEpsX (const Standard_Real EpsDist);
		%feature("compactdefaultargs") SetAccuracy;
		%feature("autodoc", "	* Accuracy is the number of samples used to approximate the parametric curve on its domain.

	:param Nb:
	:type Nb: int
	:rtype: None
") SetAccuracy;
		void SetAccuracy (const Standard_Integer Nb);
		%feature("compactdefaultargs") Accuracy;
		%feature("autodoc", "	:rtype: int
") Accuracy;
		Standard_Integer Accuracy ();
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "	:rtype: float
") EpsX;
		Standard_Real EpsX ();
		%feature("compactdefaultargs") TypeCurve;
		%feature("autodoc", "	* The Conics are manipulated as objects which only depend on three parameters : Axis and two Real from Standards. Type Curve is used to select the correct Conic.

	:rtype: GeomAbs_CurveType
") TypeCurve;
		GeomAbs_CurveType TypeCurve ();
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "	:rtype: gp_Ax22d
") Axis2;
		const gp_Ax22d  Axis2 ();
		%feature("compactdefaultargs") Param1;
		%feature("autodoc", "	:rtype: float
") Param1;
		Standard_Real Param1 ();
		%feature("compactdefaultargs") Param2;
		%feature("autodoc", "	:rtype: float
") Param2;
		Standard_Real Param2 ();
};


%extend IntCurve_PConic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IntCurve_PConicTool {
	public:
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "	:param C:
	:type C: IntCurve_PConic &
	:rtype: float
") EpsX;
		static Standard_Real EpsX (const IntCurve_PConic & C);
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	:param C:
	:type C: IntCurve_PConic &
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const IntCurve_PConic & C);
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	:param C:
	:type C: IntCurve_PConic &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const IntCurve_PConic & C,const Standard_Real U0,const Standard_Real U1);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param C:
	:type C: IntCurve_PConic &
	:param X:
	:type X: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const IntCurve_PConic & C,const Standard_Real X);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param C:
	:type C: IntCurve_PConic &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const IntCurve_PConic & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param C:
	:type C: IntCurve_PConic &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:param N:
	:type N: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const IntCurve_PConic & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N);
};


%extend IntCurve_PConicTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IntCurve_ProjectOnPConicTool {
	public:
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "	* Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondance between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. In that case, no bounds are given. The research of the rigth parameter has to be made on the natural parametric domain of the curve.

	:param C:
	:type C: IntCurve_PConic &
	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: float
") FindParameter;
		static Standard_Real FindParameter (const IntCurve_PConic & C,const gp_Pnt2d & Pnt,const Standard_Real Tol);
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "	* Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondance between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. LowParameter and HighParameter give the boundaries of the interval in wich the parameter certainly lies. These parameters are given to implement a more efficient algoritm. So, it is not necessary to check that the returned value verifies LowParameter <= Value <= HighParameter.

	:param C:
	:type C: IntCurve_PConic &
	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param LowParameter:
	:type LowParameter: float
	:param HighParameter:
	:type HighParameter: float
	:param Tol:
	:type Tol: float
	:rtype: float
") FindParameter;
		static Standard_Real FindParameter (const IntCurve_PConic & C,const gp_Pnt2d & Pnt,const Standard_Real LowParameter,const Standard_Real HighParameter,const Standard_Real Tol);
};


%extend IntCurve_ProjectOnPConicTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
