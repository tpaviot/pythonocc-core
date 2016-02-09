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
%module (package="OCC") BRepSweep

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


%include BRepSweep_headers.i


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

%nodefaultctor BRepSweep_Array2OfShapesOfNumLinearRegularSweep;
class BRepSweep_Array2OfShapesOfNumLinearRegularSweep {
	public:
		%feature("compactdefaultargs") BRepSweep_Array2OfShapesOfNumLinearRegularSweep;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") BRepSweep_Array2OfShapesOfNumLinearRegularSweep;
		 BRepSweep_Array2OfShapesOfNumLinearRegularSweep (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") BRepSweep_Array2OfShapesOfNumLinearRegularSweep;
		%feature("autodoc", "	:param Item:
	:type Item: TopoDS_Shape &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") BRepSweep_Array2OfShapesOfNumLinearRegularSweep;
		 BRepSweep_Array2OfShapesOfNumLinearRegularSweep (const TopoDS_Shape & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepSweep_Array2OfShapesOfNumLinearRegularSweep &
	:rtype: BRepSweep_Array2OfShapesOfNumLinearRegularSweep
") Assign;
		const BRepSweep_Array2OfShapesOfNumLinearRegularSweep & Assign (const BRepSweep_Array2OfShapesOfNumLinearRegularSweep & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepSweep_Array2OfShapesOfNumLinearRegularSweep &
	:rtype: BRepSweep_Array2OfShapesOfNumLinearRegularSweep
") operator=;
		const BRepSweep_Array2OfShapesOfNumLinearRegularSweep & operator = (const BRepSweep_Array2OfShapesOfNumLinearRegularSweep & Other);
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
	:type Value: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const TopoDS_Shape & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%nodefaultctor BRepSweep_Builder;
class BRepSweep_Builder {
	public:
		%feature("compactdefaultargs") BRepSweep_Builder;
		%feature("autodoc", "	* Creates a Builder.

	:param aBuilder:
	:type aBuilder: BRep_Builder &
	:rtype: None
") BRepSweep_Builder;
		 BRepSweep_Builder (const BRep_Builder & aBuilder);
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "	:rtype: BRep_Builder
") Builder;
		const BRep_Builder & Builder ();
		%feature("compactdefaultargs") MakeCompound;
		%feature("autodoc", "	* Returns an empty Compound.

	:param aCompound:
	:type aCompound: TopoDS_Shape &
	:rtype: None
") MakeCompound;
		void MakeCompound (TopoDS_Shape & aCompound);
		%feature("compactdefaultargs") MakeCompSolid;
		%feature("autodoc", "	* Returns an empty CompSolid.

	:param aCompSolid:
	:type aCompSolid: TopoDS_Shape &
	:rtype: None
") MakeCompSolid;
		void MakeCompSolid (TopoDS_Shape & aCompSolid);
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "	* Returns an empty Solid.

	:param aSolid:
	:type aSolid: TopoDS_Shape &
	:rtype: None
") MakeSolid;
		void MakeSolid (TopoDS_Shape & aSolid);
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "	* Returns an empty Shell.

	:param aShell:
	:type aShell: TopoDS_Shape &
	:rtype: None
") MakeShell;
		void MakeShell (TopoDS_Shape & aShell);
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "	* Returns an empty Wire.

	:param aWire:
	:type aWire: TopoDS_Shape &
	:rtype: None
") MakeWire;
		void MakeWire (TopoDS_Shape & aWire);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the Shape 1 in the Shape 2, set to <Orient> orientation.

	:param aShape1:
	:type aShape1: TopoDS_Shape &
	:param aShape2:
	:type aShape2: TopoDS_Shape &
	:param Orient:
	:type Orient: TopAbs_Orientation
	:rtype: None
") Add;
		void Add (TopoDS_Shape & aShape1,const TopoDS_Shape & aShape2,const TopAbs_Orientation Orient);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the Shape 1 in the Shape 2.

	:param aShape1:
	:type aShape1: TopoDS_Shape &
	:param aShape2:
	:type aShape2: TopoDS_Shape &
	:rtype: None
") Add;
		void Add (TopoDS_Shape & aShape1,const TopoDS_Shape & aShape2);
};


%nodefaultctor BRepSweep_Iterator;
class BRepSweep_Iterator {
	public:
		%feature("compactdefaultargs") BRepSweep_Iterator;
		%feature("autodoc", "	:rtype: None
") BRepSweep_Iterator;
		 BRepSweep_Iterator ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Resest the Iterator on sub-shapes of <aShape>.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if there is a current sub-shape.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Moves to the next sub-shape.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current sub-shape.

	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* Returns the orientation of the current sub-shape.

	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
};


%nodefaultctor BRepSweep_NumLinearRegularSweep;
class BRepSweep_NumLinearRegularSweep {
	public:
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") MakeEmptyVertex;
		%feature("autodoc", "	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyVertex;
		virtual TopoDS_Shape MakeEmptyVertex (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") MakeEmptyDirectingEdge;
		%feature("autodoc", "	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyDirectingEdge;
		virtual TopoDS_Shape MakeEmptyDirectingEdge (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE);
		%feature("compactdefaultargs") MakeEmptyGeneratingEdge;
		%feature("autodoc", "	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyGeneratingEdge;
		virtual TopoDS_Shape MakeEmptyGeneratingEdge (const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Shape &
	:param aGenF:
	:type aGenF: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: void
") SetParameters;
		virtual void SetParameters (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") SetDirectingParameter;
		%feature("autodoc", "	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: void
") SetDirectingParameter;
		virtual void SetDirectingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") SetGeneratingParameter;
		%feature("autodoc", "	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: void
") SetGeneratingParameter;
		virtual void SetGeneratingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") MakeEmptyFace;
		%feature("autodoc", "	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyFace;
		virtual TopoDS_Shape MakeEmptyFace (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aGenF:
	:type aGenF: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:param orien:
	:type orien: TopAbs_Orientation
	:rtype: void
") SetPCurve;
		virtual void SetPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("compactdefaultargs") SetGeneratingPCurve;
		%feature("autodoc", "	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:param orien:
	:type orien: TopAbs_Orientation
	:rtype: void
") SetGeneratingPCurve;
		virtual void SetGeneratingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("compactdefaultargs") SetDirectingPCurve;
		%feature("autodoc", "	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:param orien:
	:type orien: TopAbs_Orientation
	:rtype: void
") SetDirectingPCurve;
		virtual void SetDirectingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const TopAbs_Orientation orien);
		%feature("compactdefaultargs") DirectSolid;
		%feature("autodoc", "	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: TopAbs_Orientation
") DirectSolid;
		virtual TopAbs_Orientation DirectSolid (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") GGDShapeIsToAdd;
		%feature("autodoc", "	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:param aNewSubShape:
	:type aNewSubShape: TopoDS_Shape &
	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aSubGenS:
	:type aSubGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: bool
") GGDShapeIsToAdd;
		virtual Standard_Boolean GGDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") GDDShapeIsToAdd;
		%feature("autodoc", "	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:param aNewSubShape:
	:type aNewSubShape: TopoDS_Shape &
	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:param aSubDirS:
	:type aSubDirS: Sweep_NumShape &
	:rtype: bool
") GDDShapeIsToAdd;
		virtual Standard_Boolean GDDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS,const Sweep_NumShape & aSubDirS);
		%feature("compactdefaultargs") SeparatedWires;
		%feature("autodoc", "	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:param aNewSubShape:
	:type aNewSubShape: TopoDS_Shape &
	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aSubGenS:
	:type aSubGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: bool
") SeparatedWires;
		virtual Standard_Boolean SeparatedWires (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") SplitShell;
		%feature("autodoc", "	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") SplitShell;
		virtual TopoDS_Shape SplitShell (const TopoDS_Shape & aNewShape);
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: void
") SetContinuity;
		virtual void SetContinuity (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: bool
") HasShape;
		virtual Standard_Boolean HasShape (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape (const TopoDS_Shape & aGenS);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape ();
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:rtype: TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape (const TopoDS_Shape & aGenS);
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:rtype: TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape (const TopoDS_Shape & aGenS);
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	:rtype: bool
") Closed;
		Standard_Boolean Closed ();
};


%nodefaultctor BRepSweep_Prism;
class BRepSweep_Prism {
	public:
		%feature("compactdefaultargs") BRepSweep_Prism;
		%feature("autodoc", "	* Builds the prism of base S and vector V. If C is true, S is copied. If Canonize is true then generated surfaces are attempted to be canonized in simple types

	:param S:
	:type S: TopoDS_Shape &
	:param V:
	:type V: gp_Vec
	:param Copy: default value is Standard_False
	:type Copy: bool
	:param Canonize: default value is Standard_True
	:type Canonize: bool
	:rtype: None
") BRepSweep_Prism;
		 BRepSweep_Prism (const TopoDS_Shape & S,const gp_Vec & V,const Standard_Boolean Copy = Standard_False,const Standard_Boolean Canonize = Standard_True);
		%feature("compactdefaultargs") BRepSweep_Prism;
		%feature("autodoc", "	* Builds a semi-infinite or an infinite prism of base S. If Copy is true S is copied. If Inf is true the prism is infinite, if Inf is false the prism is infinite in the direction D. If Canonize is true then generated surfaces are attempted to be canonized in simple types

	:param S:
	:type S: TopoDS_Shape &
	:param D:
	:type D: gp_Dir
	:param Inf: default value is Standard_True
	:type Inf: bool
	:param Copy: default value is Standard_False
	:type Copy: bool
	:param Canonize: default value is Standard_True
	:type Canonize: bool
	:rtype: None
") BRepSweep_Prism;
		 BRepSweep_Prism (const TopoDS_Shape & S,const gp_Dir & D,const Standard_Boolean Inf = Standard_True,const Standard_Boolean Copy = Standard_False,const Standard_Boolean Canonize = Standard_True);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns the TopoDS Shape attached to the prism.

	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns the TopoDS Shape generated with aGenS (subShape of the generating shape).

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape (const TopoDS_Shape & aGenS);
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the bottom of the prism.

	:rtype: TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the bottom of the prism. generated with aGenS (subShape of the generating shape).

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:rtype: TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape (const TopoDS_Shape & aGenS);
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the top of the prism.

	:rtype: TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape ();
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the top of the prism. generated with aGenS (subShape of the generating shape).

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:rtype: TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape (const TopoDS_Shape & aGenS);
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "	* Returns the Vector of the Prism, if it is an infinite prism the Vec is unitar.

	:rtype: gp_Vec
") Vec;
		gp_Vec Vec ();
};


%nodefaultctor BRepSweep_Revol;
class BRepSweep_Revol {
	public:
		%feature("compactdefaultargs") BRepSweep_Revol;
		%feature("autodoc", "	* Builds the Revol of meridian S axis A and angle D. If C is true S is copied.

	:param S:
	:type S: TopoDS_Shape &
	:param A:
	:type A: gp_Ax1
	:param D:
	:type D: Quantity_PlaneAngle
	:param C: default value is Standard_False
	:type C: bool
	:rtype: None
") BRepSweep_Revol;
		 BRepSweep_Revol (const TopoDS_Shape & S,const gp_Ax1 & A,const Quantity_PlaneAngle D,const Standard_Boolean C = Standard_False);
		%feature("compactdefaultargs") BRepSweep_Revol;
		%feature("autodoc", "	* Builds the Revol of meridian S axis A and angle 2*Pi. If C is true S is copied.

	:param S:
	:type S: TopoDS_Shape &
	:param A:
	:type A: gp_Ax1
	:param C: default value is Standard_False
	:type C: bool
	:rtype: None
") BRepSweep_Revol;
		 BRepSweep_Revol (const TopoDS_Shape & S,const gp_Ax1 & A,const Standard_Boolean C = Standard_False);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns the TopoDS Shape attached to the Revol.

	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns the TopoDS Shape generated with aGenS (subShape of the generating shape).

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape (const TopoDS_Shape & aGenS);
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	* Returns the first shape of the revol (coinciding with the generating shape).

	:rtype: TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	* Returns the first shape of the revol (coinciding with the generating shape).

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:rtype: TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape (const TopoDS_Shape & aGenS);
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the top of the prism.

	:rtype: TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape ();
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the top of the prism. generated with aGenS (subShape of the generating shape).

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:rtype: TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape (const TopoDS_Shape & aGenS);
		%feature("compactdefaultargs") Axe;
		%feature("autodoc", "	* returns the axis

	:rtype: gp_Ax1
") Axe;
		gp_Ax1 Axe ();
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* returns the angle.

	:rtype: Quantity_PlaneAngle
") Angle;
		Quantity_PlaneAngle Angle ();
};


%nodefaultctor BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep;
class BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep;
		 BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep (const TopoDS_Shape & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep::Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep;
class Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep();
        Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep(const Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep &aHandle);
        Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep(const BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep {
    BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep* GetObject() {
    return (BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep*)$self->Access();
    }
};

%nodefaultctor BRepSweep_SequenceOfShapesOfNumLinearRegularSweep;
class BRepSweep_SequenceOfShapesOfNumLinearRegularSweep : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") BRepSweep_SequenceOfShapesOfNumLinearRegularSweep;
		%feature("autodoc", "	:rtype: None
") BRepSweep_SequenceOfShapesOfNumLinearRegularSweep;
		 BRepSweep_SequenceOfShapesOfNumLinearRegularSweep ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepSweep_SequenceOfShapesOfNumLinearRegularSweep &
	:rtype: BRepSweep_SequenceOfShapesOfNumLinearRegularSweep
") Assign;
		const BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & Assign (const BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepSweep_SequenceOfShapesOfNumLinearRegularSweep &
	:rtype: BRepSweep_SequenceOfShapesOfNumLinearRegularSweep
") operator=;
		const BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & operator = (const BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") Append;
		void Append (const TopoDS_Shape & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: BRepSweep_SequenceOfShapesOfNumLinearRegularSweep &
	:rtype: None
") Append;
		void Append (BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") Prepend;
		void Prepend (const TopoDS_Shape & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: BRepSweep_SequenceOfShapesOfNumLinearRegularSweep &
	:rtype: None
") Prepend;
		void Prepend (BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TopoDS_Shape & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepSweep_SequenceOfShapesOfNumLinearRegularSweep &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TopoDS_Shape & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepSweep_SequenceOfShapesOfNumLinearRegularSweep &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") First;
		const TopoDS_Shape  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Last;
		const TopoDS_Shape  Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: BRepSweep_SequenceOfShapesOfNumLinearRegularSweep &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopoDS_Shape & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%nodefaultctor BRepSweep_Tool;
class BRepSweep_Tool {
	public:
		%feature("compactdefaultargs") BRepSweep_Tool;
		%feature("autodoc", "	* Initialize the tool with <aShape>. The IndexTool must prepare an indexation for all the subshapes of this shape.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None
") BRepSweep_Tool;
		 BRepSweep_Tool (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "	* Returns the number of subshapes in the shape.

	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* Returns the index of <aShape>.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: int
") Index;
		Standard_Integer Index (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns the Shape at Index anIdex.

	:param anIndex:
	:type anIndex: int
	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the type of <aShape>.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: TopAbs_ShapeEnum
") Type;
		TopAbs_ShapeEnum Type (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* Returns the Orientation of <aShape>.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	* Set the Orientation of <aShape> with Or.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None
") SetOrientation;
		void SetOrientation (TopoDS_Shape & aShape,const TopAbs_Orientation Or);
};


%nodefaultctor BRepSweep_Trsf;
class BRepSweep_Trsf : public BRepSweep_NumLinearRegularSweep {
	public:
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* ends the construction of the swept primitive calling the virtual geometric functions that can't be called in the initialize.

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "	* function called to analize the way of construction of the shapes generated by aGenS and aDirV.

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: bool
") Process;
		Standard_Boolean Process (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") MakeEmptyVertex;
		%feature("autodoc", "	* Builds the vertex addressed by [aGenV,aDirV], with its geometric part, but without subcomponents.

	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyVertex;
		virtual TopoDS_Shape MakeEmptyVertex (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") MakeEmptyDirectingEdge;
		%feature("autodoc", "	* Builds the edge addressed by [aGenV,aDirE], with its geometric part, but without subcomponents.

	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyDirectingEdge;
		virtual TopoDS_Shape MakeEmptyDirectingEdge (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE);
		%feature("compactdefaultargs") MakeEmptyGeneratingEdge;
		%feature("autodoc", "	* Builds the edge addressed by [aGenE,aDirV], with its geometric part, but without subcomponents.

	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyGeneratingEdge;
		virtual TopoDS_Shape MakeEmptyGeneratingEdge (const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	* Sets the parameters of the new vertex on the new face. The new face and new vertex where generated from aGenF, aGenV and aDirV .

	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Shape &
	:param aGenF:
	:type aGenF: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: void
") SetParameters;
		virtual void SetParameters (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") SetDirectingParameter;
		%feature("autodoc", "	* Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenV aDirE, and aDirV.

	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: void
") SetDirectingParameter;
		virtual void SetDirectingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") SetGeneratingParameter;
		%feature("autodoc", "	* Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenE, aGenV and aDirV .

	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: void
") SetGeneratingParameter;
		virtual void SetGeneratingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") MakeEmptyFace;
		%feature("autodoc", "	* Builds the face addressed by [aGenS,aDirS], with its geometric part, but without subcomponents. The couple aGenS, aDirS can be a 'generating face and a directing vertex' or 'a generating edge and a directing edge'.

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyFace;
		virtual TopoDS_Shape MakeEmptyFace (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "	* Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenF, aGenE and aDirV.

	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aGenF:
	:type aGenF: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:param orien:
	:type orien: TopAbs_Orientation
	:rtype: void
") SetPCurve;
		virtual void SetPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("compactdefaultargs") SetGeneratingPCurve;
		%feature("autodoc", "	* Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aDirV.

	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:param orien:
	:type orien: TopAbs_Orientation
	:rtype: void
") SetGeneratingPCurve;
		virtual void SetGeneratingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("compactdefaultargs") SetDirectingPCurve;
		%feature("autodoc", "	* Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aGenV.

	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:param orien:
	:type orien: TopAbs_Orientation
	:rtype: void
") SetDirectingPCurve;
		virtual void SetDirectingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const TopAbs_Orientation orien);
		%feature("compactdefaultargs") GGDShapeIsToAdd;
		%feature("autodoc", "	* Returns true if aNewSubShape (addressed by aSubGenS and aDirS) must be added in aNewShape (addressed by aGenS and aDirS).

	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:param aNewSubShape:
	:type aNewSubShape: TopoDS_Shape &
	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aSubGenS:
	:type aSubGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: bool
") GGDShapeIsToAdd;
		virtual Standard_Boolean GGDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") GDDShapeIsToAdd;
		%feature("autodoc", "	* Returns true if aNewSubShape (addressed by aGenS and aSubDirS) must be added in aNewShape (addressed by aGenS and aDirS).

	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:param aNewSubShape:
	:type aNewSubShape: TopoDS_Shape &
	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:param aSubDirS:
	:type aSubDirS: Sweep_NumShape &
	:rtype: bool
") GDDShapeIsToAdd;
		virtual Standard_Boolean GDDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS,const Sweep_NumShape & aSubDirS);
		%feature("compactdefaultargs") SeparatedWires;
		%feature("autodoc", "	* In some particular cases the topology of a generated face must be composed of independant closed wires, in this case this function returns true.

	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:param aNewSubShape:
	:type aNewSubShape: TopoDS_Shape &
	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aSubGenS:
	:type aSubGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: bool
") SeparatedWires;
		virtual Standard_Boolean SeparatedWires (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "	* Returns true if aDirS and aGenS addresses a resulting Shape. In some specific cases the shape can be geometrically inexsistant, then this function returns false.

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: bool
") HasShape;
		virtual Standard_Boolean HasShape (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") IsInvariant;
		%feature("autodoc", "	* Returns true if the geometry of aGenS is not modified by the trsf of the BRepSweep Trsf.

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:rtype: bool
") IsInvariant;
		virtual Standard_Boolean IsInvariant (const TopoDS_Shape & aGenS);
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "	* Called to propagate the continuity of every vertex between two edges of the generating wire aGenS on the generated edge and faces.

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: None
") SetContinuity;
		void SetContinuity (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
};


%nodefaultctor BRepSweep_Rotation;
class BRepSweep_Rotation : public BRepSweep_Trsf {
	public:
		%feature("compactdefaultargs") BRepSweep_Rotation;
		%feature("autodoc", "	* Creates a topology by rotating <S> around A with the angle D.

	:param S:
	:type S: TopoDS_Shape &
	:param N:
	:type N: Sweep_NumShape &
	:param L:
	:type L: TopLoc_Location &
	:param A:
	:type A: gp_Ax1
	:param D:
	:type D: Quantity_PlaneAngle
	:param C:
	:type C: bool
	:rtype: None
") BRepSweep_Rotation;
		 BRepSweep_Rotation (const TopoDS_Shape & S,const Sweep_NumShape & N,const TopLoc_Location & L,const gp_Ax1 & A,const Quantity_PlaneAngle D,const Standard_Boolean C);
		%feature("compactdefaultargs") MakeEmptyVertex;
		%feature("autodoc", "	* Builds the vertex addressed by [aGenV,aDirV], with its geometric part, but without subcomponents.

	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyVertex;
		TopoDS_Shape MakeEmptyVertex (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") MakeEmptyDirectingEdge;
		%feature("autodoc", "	* Builds the edge addressed by [aGenV,aDirE], with its geometric part, but without subcomponents.

	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyDirectingEdge;
		TopoDS_Shape MakeEmptyDirectingEdge (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE);
		%feature("compactdefaultargs") MakeEmptyGeneratingEdge;
		%feature("autodoc", "	* Builds the edge addressed by [aGenE,aDirV], with its geometric part, but without subcomponents.

	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyGeneratingEdge;
		TopoDS_Shape MakeEmptyGeneratingEdge (const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	* Sets the parameters of the new vertex on the new face. The new face and new vertex where generated from aGenF, aGenV and aDirV .

	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Shape &
	:param aGenF:
	:type aGenF: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: None
") SetParameters;
		void SetParameters (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") SetDirectingParameter;
		%feature("autodoc", "	* Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenV aDirE, and aDirV.

	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: None
") SetDirectingParameter;
		void SetDirectingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") SetGeneratingParameter;
		%feature("autodoc", "	* Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenE, aGenV and aDirV .

	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: None
") SetGeneratingParameter;
		void SetGeneratingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") MakeEmptyFace;
		%feature("autodoc", "	* Builds the face addressed by [aGenS,aDirS], with its geometric part, but without subcomponents. The couple aGenS, aDirS can be a 'generating face and a directing vertex' or 'a generating edge and a directing edge'.

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyFace;
		TopoDS_Shape MakeEmptyFace (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "	* Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenF, aGenE and aDirV.

	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aGenF:
	:type aGenF: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:param orien:
	:type orien: TopAbs_Orientation
	:rtype: None
") SetPCurve;
		void SetPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("compactdefaultargs") SetGeneratingPCurve;
		%feature("autodoc", "	* Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aDirV.

	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:param orien:
	:type orien: TopAbs_Orientation
	:rtype: None
") SetGeneratingPCurve;
		void SetGeneratingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("compactdefaultargs") SetDirectingPCurve;
		%feature("autodoc", "	* Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aGenV.

	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:param orien:
	:type orien: TopAbs_Orientation
	:rtype: None
") SetDirectingPCurve;
		void SetDirectingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const TopAbs_Orientation orien);
		%feature("compactdefaultargs") DirectSolid;
		%feature("autodoc", "	* Returns the Orientation of the shell in the solid generated by the face aGenS with the edge aDirS. It is REVERSED if the surface is swept in the direction of the normal.

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: TopAbs_Orientation
") DirectSolid;
		TopAbs_Orientation DirectSolid (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") GGDShapeIsToAdd;
		%feature("autodoc", "	* Returns true if aNewSubShape (addressed by aSubGenS and aDirS) must be added in aNewShape (addressed by aGenS and aDirS).

	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:param aNewSubShape:
	:type aNewSubShape: TopoDS_Shape &
	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aSubGenS:
	:type aSubGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: bool
") GGDShapeIsToAdd;
		Standard_Boolean GGDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") GDDShapeIsToAdd;
		%feature("autodoc", "	* Returns true if aNewSubShape (addressed by aGenS and aSubDirS) must be added in aNewShape (addressed by aGenS and aDirS).

	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:param aNewSubShape:
	:type aNewSubShape: TopoDS_Shape &
	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:param aSubDirS:
	:type aSubDirS: Sweep_NumShape &
	:rtype: bool
") GDDShapeIsToAdd;
		Standard_Boolean GDDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS,const Sweep_NumShape & aSubDirS);
		%feature("compactdefaultargs") SeparatedWires;
		%feature("autodoc", "	* In some particular cases the topology of a generated face must be composed of independant closed wires, in this case this function returns true. The only case in whitch the function may return true is a planar face in a closed revol.

	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:param aNewSubShape:
	:type aNewSubShape: TopoDS_Shape &
	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aSubGenS:
	:type aSubGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: bool
") SeparatedWires;
		Standard_Boolean SeparatedWires (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") SplitShell;
		%feature("autodoc", "	* In some particular cases the topology of a generated Shell must be composed of independant closed Shells, in this case this function returns a Compound of independant Shells.

	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") SplitShell;
		virtual TopoDS_Shape SplitShell (const TopoDS_Shape & aNewShape);
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "	* Returns true if aDirS and aGenS addresses a resulting Shape. In some specific cases the shape can be geometrically inexsistant, then this function returns false.

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: bool
") HasShape;
		Standard_Boolean HasShape (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") IsInvariant;
		%feature("autodoc", "	* Returns true when the geometry of aGenS is not modified by the rotation.

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:rtype: bool
") IsInvariant;
		Standard_Boolean IsInvariant (const TopoDS_Shape & aGenS);
		%feature("compactdefaultargs") Axe;
		%feature("autodoc", "	* returns the axis

	:rtype: gp_Ax1
") Axe;
		gp_Ax1 Axe ();
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* returns the angle.

	:rtype: Quantity_PlaneAngle
") Angle;
		Quantity_PlaneAngle Angle ();
};


%nodefaultctor BRepSweep_Translation;
class BRepSweep_Translation : public BRepSweep_Trsf {
	public:
		%feature("compactdefaultargs") BRepSweep_Translation;
		%feature("autodoc", "	* Creates a topology by translating <S> with the vector <V>. If C is true S Sucomponents are copied. If Canonize is true then generated surfaces are attempted to be canonized in simple types

	:param S:
	:type S: TopoDS_Shape &
	:param N:
	:type N: Sweep_NumShape &
	:param L:
	:type L: TopLoc_Location &
	:param V:
	:type V: gp_Vec
	:param C:
	:type C: bool
	:param Canonize: default value is Standard_True
	:type Canonize: bool
	:rtype: None
") BRepSweep_Translation;
		 BRepSweep_Translation (const TopoDS_Shape & S,const Sweep_NumShape & N,const TopLoc_Location & L,const gp_Vec & V,const Standard_Boolean C,const Standard_Boolean Canonize = Standard_True);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") MakeEmptyVertex;
		%feature("autodoc", "	* Builds the vertex addressed by [aGenV,aDirV], with its geometric part, but without subcomponents.

	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyVertex;
		TopoDS_Shape MakeEmptyVertex (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") MakeEmptyDirectingEdge;
		%feature("autodoc", "	* Builds the edge addressed by [aGenV,aDirE], with its geometric part, but without subcomponents.

	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyDirectingEdge;
		TopoDS_Shape MakeEmptyDirectingEdge (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE);
		%feature("compactdefaultargs") MakeEmptyGeneratingEdge;
		%feature("autodoc", "	* Builds the edge addressed by [aGenE,aDirV], with its geometric part, but without subcomponents.

	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyGeneratingEdge;
		TopoDS_Shape MakeEmptyGeneratingEdge (const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	* Sets the parameters of the new vertex on the new face. The new face and new vertex where generated from aGenF, aGenV and aDirV .

	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Shape &
	:param aGenF:
	:type aGenF: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: None
") SetParameters;
		void SetParameters (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") SetDirectingParameter;
		%feature("autodoc", "	* Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenV aDirE, and aDirV.

	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: None
") SetDirectingParameter;
		void SetDirectingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") SetGeneratingParameter;
		%feature("autodoc", "	* Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenE, aGenV and aDirV .

	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:rtype: None
") SetGeneratingParameter;
		void SetGeneratingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("compactdefaultargs") MakeEmptyFace;
		%feature("autodoc", "	* Builds the face addressed by [aGenS,aDirS], with its geometric part, but without subcomponents. The couple aGenS, aDirS can be a 'generating face and a directing vertex' or 'a generating edge and a directing edge'.

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: TopoDS_Shape
") MakeEmptyFace;
		TopoDS_Shape MakeEmptyFace (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "	* Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenF, aGenE and aDirV.

	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aGenF:
	:type aGenF: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:param orien:
	:type orien: TopAbs_Orientation
	:rtype: None
") SetPCurve;
		void SetPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("compactdefaultargs") SetGeneratingPCurve;
		%feature("autodoc", "	* Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aDirV.

	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:param aDirV:
	:type aDirV: Sweep_NumShape &
	:param orien:
	:type orien: TopAbs_Orientation
	:rtype: None
") SetGeneratingPCurve;
		void SetGeneratingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("compactdefaultargs") SetDirectingPCurve;
		%feature("autodoc", "	* Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aGenV.

	:param aNewFace:
	:type aNewFace: TopoDS_Shape &
	:param aNewEdge:
	:type aNewEdge: TopoDS_Shape &
	:param aGenE:
	:type aGenE: TopoDS_Shape &
	:param aGenV:
	:type aGenV: TopoDS_Shape &
	:param aDirE:
	:type aDirE: Sweep_NumShape &
	:param orien:
	:type orien: TopAbs_Orientation
	:rtype: None
") SetDirectingPCurve;
		void SetDirectingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const TopAbs_Orientation orien);
		%feature("compactdefaultargs") DirectSolid;
		%feature("autodoc", "	* Returns the Orientation of the shell in the solid generated by the face aGenS with the edge aDirS. It is REVERSED if the surface is swept in the direction of the normal.

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: TopAbs_Orientation
") DirectSolid;
		TopAbs_Orientation DirectSolid (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") GGDShapeIsToAdd;
		%feature("autodoc", "	* Returns true if aNewSubShape (addressed by aSubGenS and aDirS) must be added in aNewShape (addressed by aGenS and aDirS).

	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:param aNewSubShape:
	:type aNewSubShape: TopoDS_Shape &
	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aSubGenS:
	:type aSubGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: bool
") GGDShapeIsToAdd;
		Standard_Boolean GGDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") GDDShapeIsToAdd;
		%feature("autodoc", "	* Returns true if aNewSubShape (addressed by aGenS and aSubDirS) must be added in aNewShape (addressed by aGenS and aDirS).

	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:param aNewSubShape:
	:type aNewSubShape: TopoDS_Shape &
	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:param aSubDirS:
	:type aSubDirS: Sweep_NumShape &
	:rtype: bool
") GDDShapeIsToAdd;
		Standard_Boolean GDDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS,const Sweep_NumShape & aSubDirS);
		%feature("compactdefaultargs") SeparatedWires;
		%feature("autodoc", "	* In some particular cases the topology of a generated face must be composed of independant closed wires, in this case this function returns true. Here it always returns false.

	:param aNewShape:
	:type aNewShape: TopoDS_Shape &
	:param aNewSubShape:
	:type aNewSubShape: TopoDS_Shape &
	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aSubGenS:
	:type aSubGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: bool
") SeparatedWires;
		Standard_Boolean SeparatedWires (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "	* Returns true if aDirS and aGenS addresses a resulting Shape. In some specific cases the shape can be geometrically inexsistant, then this function returns false.

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:param aDirS:
	:type aDirS: Sweep_NumShape &
	:rtype: bool
") HasShape;
		Standard_Boolean HasShape (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("compactdefaultargs") IsInvariant;
		%feature("autodoc", "	* Returns always false because here the transformation is a translation.

	:param aGenS:
	:type aGenS: TopoDS_Shape &
	:rtype: bool
") IsInvariant;
		Standard_Boolean IsInvariant (const TopoDS_Shape & aGenS);
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "	* Returns the Vector of the Prism, if it is an infinite prism the Vec is unitar.

	:rtype: gp_Vec
") Vec;
		gp_Vec Vec ();
};


