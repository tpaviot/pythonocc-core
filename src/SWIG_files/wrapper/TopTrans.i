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
%module (package="OCC") TopTrans

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


%include TopTrans_headers.i


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

%nodefaultctor TopTrans_Array2OfOrientation;
class TopTrans_Array2OfOrientation {
	public:
		%feature("compactdefaultargs") TopTrans_Array2OfOrientation;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TopTrans_Array2OfOrientation;
		 TopTrans_Array2OfOrientation (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TopTrans_Array2OfOrientation;
		%feature("autodoc", "	:param Item:
	:type Item: TopAbs_Orientation &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TopTrans_Array2OfOrientation;
		 TopTrans_Array2OfOrientation (const TopAbs_Orientation & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TopAbs_Orientation &
	:rtype: None
") Init;
		void Init (const TopAbs_Orientation & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTrans_Array2OfOrientation &
	:rtype: TopTrans_Array2OfOrientation
") Assign;
		const TopTrans_Array2OfOrientation & Assign (const TopTrans_Array2OfOrientation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTrans_Array2OfOrientation &
	:rtype: TopTrans_Array2OfOrientation
") operator =;
		const TopTrans_Array2OfOrientation & operator = (const TopTrans_Array2OfOrientation & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: TopAbs_Orientation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const TopAbs_Orientation & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: TopAbs_Orientation
") Value;
		const TopAbs_Orientation & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: TopAbs_Orientation
") ChangeValue;
		TopAbs_Orientation & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TopTrans_Array2OfOrientation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTrans_CurveTransition;
class TopTrans_CurveTransition {
	public:
		%feature("compactdefaultargs") TopTrans_CurveTransition;
		%feature("autodoc", "	* Create an empty Curve Transition.

	:rtype: None
") TopTrans_CurveTransition;
		 TopTrans_CurveTransition ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Initialize a Transition with the local description of a Curve.

	:param Tgt:
	:type Tgt: gp_Dir
	:param Norm:
	:type Norm: gp_Dir
	:param Curv:
	:type Curv: float
	:rtype: None
") Reset;
		void Reset (const gp_Dir & Tgt,const gp_Dir & Norm,const Standard_Real Curv);
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Initialize a Transition with the local description of a straigth line.

	:param Tgt:
	:type Tgt: gp_Dir
	:rtype: None
") Reset;
		void Reset (const gp_Dir & Tgt);
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "	* Add a curve element to the boundary. If Or is REVERSED the curve is before the intersection, else if Or is FORWARD the curv is after the intersection and if Or is INTERNAL the intersection is in the middle of the curv.

	:param Tole:
	:type Tole: float
	:param Tang:
	:type Tang: gp_Dir
	:param Norm:
	:type Norm: gp_Dir
	:param Curv:
	:type Curv: float
	:param S:
	:type S: TopAbs_Orientation
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None
") Compare;
		void Compare (const Standard_Real Tole,const gp_Dir & Tang,const gp_Dir & Norm,const Standard_Real Curv,const TopAbs_Orientation S,const TopAbs_Orientation Or);
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "	* returns the state of the curve before the intersection, this is the position relative to the boundary of a point very close to the intersection on the negative side of the tangent.

	:rtype: TopAbs_State
") StateBefore;
		TopAbs_State StateBefore ();
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "	* returns the state of the curve after the intersection, this is the position relative to the boundary of a point very close to the intersection on the positive side of the tangent.

	:rtype: TopAbs_State
") StateAfter;
		TopAbs_State StateAfter ();
};


%extend TopTrans_CurveTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTrans_SurfaceTransition;
class TopTrans_SurfaceTransition {
	public:
		%feature("compactdefaultargs") TopTrans_SurfaceTransition;
		%feature("autodoc", "	* Create an empty Surface Transition.

	:rtype: None
") TopTrans_SurfaceTransition;
		 TopTrans_SurfaceTransition ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Initialize a Surface Transition with the local description of the intersection curve and of the reference surface. PREQUESITORY : Norm oriented OUTSIDE 'geometric matter'

	:param Tgt:
	:type Tgt: gp_Dir
	:param Norm:
	:type Norm: gp_Dir
	:param MaxD:
	:type MaxD: gp_Dir
	:param MinD:
	:type MinD: gp_Dir
	:param MaxCurv:
	:type MaxCurv: float
	:param MinCurv:
	:type MinCurv: float
	:rtype: None
") Reset;
		void Reset (const gp_Dir & Tgt,const gp_Dir & Norm,const gp_Dir & MaxD,const gp_Dir & MinD,const Standard_Real MaxCurv,const Standard_Real MinCurv);
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Initialize a Surface Transition with the local description of a straight line.

	:param Tgt:
	:type Tgt: gp_Dir
	:param Norm:
	:type Norm: gp_Dir
	:rtype: None
") Reset;
		void Reset (const gp_Dir & Tgt,const gp_Dir & Norm);
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "	* Add a face element to the boundary. //! - S defines topological orientation for the face : S FORWARD means: along the intersection curve on the reference surface, transition states while crossing the face are OUT,IN. S REVERSED means states are IN,OUT. S INTERNAL means states are IN,IN. //! - O defines curve's position on face : O FORWARD means the face is before the intersection O REVERSED means the face is AFTER O INTERNAL means the curve intersection is in the face. PREQUESITORY : Norm oriented OUTSIDE 'geometric matter'

	:param Tole:
	:type Tole: float
	:param Norm:
	:type Norm: gp_Dir
	:param MaxD:
	:type MaxD: gp_Dir
	:param MinD:
	:type MinD: gp_Dir
	:param MaxCurv:
	:type MaxCurv: float
	:param MinCurv:
	:type MinCurv: float
	:param S:
	:type S: TopAbs_Orientation
	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") Compare;
		void Compare (const Standard_Real Tole,const gp_Dir & Norm,const gp_Dir & MaxD,const gp_Dir & MinD,const Standard_Real MaxCurv,const Standard_Real MinCurv,const TopAbs_Orientation S,const TopAbs_Orientation O);
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "	* Add a plane or a cylindric face to the boundary.

	:param Tole:
	:type Tole: float
	:param Norm:
	:type Norm: gp_Dir
	:param S:
	:type S: TopAbs_Orientation
	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") Compare;
		void Compare (const Standard_Real Tole,const gp_Dir & Norm,const TopAbs_Orientation S,const TopAbs_Orientation O);
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "	* Returns the state of the reference surface before the interference, this is the position relative to the surface of a point very close to the intersection on the negative side of the tangent.

	:rtype: TopAbs_State
") StateBefore;
		TopAbs_State StateBefore ();
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "	* Returns the state of the reference surface after interference, this is the position relative to the surface of a point very close to the intersection on the positive side of the tangent.

	:rtype: TopAbs_State
") StateAfter;
		TopAbs_State StateAfter ();
		%feature("compactdefaultargs") GetBefore;
		%feature("autodoc", "	:param Tran:
	:type Tran: TopAbs_Orientation
	:rtype: TopAbs_State
") GetBefore;
		static TopAbs_State GetBefore (const TopAbs_Orientation Tran);
		%feature("compactdefaultargs") GetAfter;
		%feature("autodoc", "	:param Tran:
	:type Tran: TopAbs_Orientation
	:rtype: TopAbs_State
") GetAfter;
		static TopAbs_State GetAfter (const TopAbs_Orientation Tran);
};


%extend TopTrans_SurfaceTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
