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
%module BRepSweep

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

%include BRepSweep_required_python_modules.i
%include BRepSweep_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepSweep_Array2OfShapesOfNumLinearRegularSweep;
class BRepSweep_Array2OfShapesOfNumLinearRegularSweep {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepSweep_Array2OfShapesOfNumLinearRegularSweep;
		 BRepSweep_Array2OfShapesOfNumLinearRegularSweep (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(TopoDS_Shape)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepSweep_Array2OfShapesOfNumLinearRegularSweep;
		 BRepSweep_Array2OfShapesOfNumLinearRegularSweep (const TopoDS_Shape & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(BRepSweep_Array2OfShapesOfNumLinearRegularSweep)

Returns:
	BRepSweep_Array2OfShapesOfNumLinearRegularSweep

No detailed docstring for this function.") Assign;
		const BRepSweep_Array2OfShapesOfNumLinearRegularSweep & Assign (const BRepSweep_Array2OfShapesOfNumLinearRegularSweep & Other);
		%feature("autodoc", "Args:
	Other(BRepSweep_Array2OfShapesOfNumLinearRegularSweep)

Returns:
	BRepSweep_Array2OfShapesOfNumLinearRegularSweep

No detailed docstring for this function.") operator=;
		const BRepSweep_Array2OfShapesOfNumLinearRegularSweep & operator = (const BRepSweep_Array2OfShapesOfNumLinearRegularSweep & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const TopoDS_Shape & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeValue;
		TopoDS_Shape & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") BRepSweep_Array2OfShapesOfNumLinearRegularSweep::~BRepSweep_Array2OfShapesOfNumLinearRegularSweep %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepSweep_Array2OfShapesOfNumLinearRegularSweep {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepSweep_Builder;
class BRepSweep_Builder {
	public:
		%feature("autodoc", "Args:
	aBuilder(BRep_Builder)

Returns:
	None

Creates a Builder.") BRepSweep_Builder;
		 BRepSweep_Builder (const BRep_Builder & aBuilder);
		%feature("autodoc", "Args:
	None
Returns:
	BRep_Builder

No detailed docstring for this function.") Builder;
		const BRep_Builder & Builder ();
		%feature("autodoc", "Args:
	aCompound(TopoDS_Shape)

Returns:
	None

Returns an empty Compound.") MakeCompound;
		void MakeCompound (TopoDS_Shape & aCompound);
		%feature("autodoc", "Args:
	aCompSolid(TopoDS_Shape)

Returns:
	None

Returns an empty CompSolid.") MakeCompSolid;
		void MakeCompSolid (TopoDS_Shape & aCompSolid);
		%feature("autodoc", "Args:
	aSolid(TopoDS_Shape)

Returns:
	None

Returns an empty Solid.") MakeSolid;
		void MakeSolid (TopoDS_Shape & aSolid);
		%feature("autodoc", "Args:
	aShell(TopoDS_Shape)

Returns:
	None

Returns an empty Shell.") MakeShell;
		void MakeShell (TopoDS_Shape & aShell);
		%feature("autodoc", "Args:
	aWire(TopoDS_Shape)

Returns:
	None

Returns an empty Wire.") MakeWire;
		void MakeWire (TopoDS_Shape & aWire);
		%feature("autodoc", "Args:
	aShape1(TopoDS_Shape)
	aShape2(TopoDS_Shape)
	Orient(TopAbs_Orientation)

Returns:
	None

Adds the Shape 1 in the Shape 2, set to  
         <Orient> orientation.") Add;
		void Add (TopoDS_Shape & aShape1,const TopoDS_Shape & aShape2,const TopAbs_Orientation Orient);
		%feature("autodoc", "Args:
	aShape1(TopoDS_Shape)
	aShape2(TopoDS_Shape)

Returns:
	None

Adds the Shape 1 in the Shape 2.") Add;
		void Add (TopoDS_Shape & aShape1,const TopoDS_Shape & aShape2);
};


%feature("shadow") BRepSweep_Builder::~BRepSweep_Builder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepSweep_Builder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepSweep_Iterator;
class BRepSweep_Iterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepSweep_Iterator;
		 BRepSweep_Iterator ();
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	None

Resest the Iterator on sub-shapes of <aShape>.") Init;
		void Init (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is a current sub-shape.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Moves to the next sub-shape.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the current sub-shape.") Value;
		const TopoDS_Shape & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

Returns the orientation of the current sub-shape.") Orientation;
		TopAbs_Orientation Orientation ();
};


%feature("shadow") BRepSweep_Iterator::~BRepSweep_Iterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepSweep_Iterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepSweep_NumLinearRegularSweep;
class BRepSweep_NumLinearRegularSweep {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	aGenV(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	virtual TopoDS_Shape

No detailed docstring for this function.") MakeEmptyVertex;
		virtual TopoDS_Shape MakeEmptyVertex (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aGenV(TopoDS_Shape)
	aDirE(Sweep_NumShape)

Returns:
	virtual TopoDS_Shape

No detailed docstring for this function.") MakeEmptyDirectingEdge;
		virtual TopoDS_Shape MakeEmptyDirectingEdge (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE);
		%feature("autodoc", "Args:
	aGenE(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	virtual TopoDS_Shape

No detailed docstring for this function.") MakeEmptyGeneratingEdge;
		virtual TopoDS_Shape MakeEmptyGeneratingEdge (const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewVertex(TopoDS_Shape)
	aGenF(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	virtual void

No detailed docstring for this function.") SetParameters;
		virtual void SetParameters (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aNewEdge(TopoDS_Shape)
	aNewVertex(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirE(Sweep_NumShape)
	aDirV(Sweep_NumShape)

Returns:
	virtual void

No detailed docstring for this function.") SetDirectingParameter;
		virtual void SetDirectingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aNewEdge(TopoDS_Shape)
	aNewVertex(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	virtual void

No detailed docstring for this function.") SetGeneratingParameter;
		virtual void SetGeneratingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	virtual TopoDS_Shape

No detailed docstring for this function.") MakeEmptyFace;
		virtual TopoDS_Shape MakeEmptyFace (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewEdge(TopoDS_Shape)
	aGenF(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aDirV(Sweep_NumShape)
	orien(TopAbs_Orientation)

Returns:
	virtual void

No detailed docstring for this function.") SetPCurve;
		virtual void SetPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewEdge(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aDirE(Sweep_NumShape)
	aDirV(Sweep_NumShape)
	orien(TopAbs_Orientation)

Returns:
	virtual void

No detailed docstring for this function.") SetGeneratingPCurve;
		virtual void SetGeneratingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewEdge(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirE(Sweep_NumShape)
	orien(TopAbs_Orientation)

Returns:
	virtual void

No detailed docstring for this function.") SetDirectingPCurve;
		virtual void SetDirectingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const TopAbs_Orientation orien);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	virtual TopAbs_Orientation

No detailed docstring for this function.") DirectSolid;
		virtual TopAbs_Orientation DirectSolid (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)
	aNewSubShape(TopoDS_Shape)
	aGenS(TopoDS_Shape)
	aSubGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") GGDShapeIsToAdd;
		virtual Standard_Boolean GGDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)
	aNewSubShape(TopoDS_Shape)
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)
	aSubDirS(Sweep_NumShape)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") GDDShapeIsToAdd;
		virtual Standard_Boolean GDDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS,const Sweep_NumShape & aSubDirS);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)
	aNewSubShape(TopoDS_Shape)
	aGenS(TopoDS_Shape)
	aSubGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") SeparatedWires;
		virtual Standard_Boolean SeparatedWires (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)

Returns:
	virtual TopoDS_Shape

No detailed docstring for this function.") SplitShell;
		virtual TopoDS_Shape SplitShell (const TopoDS_Shape & aNewShape);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	virtual void

No detailed docstring for this function.") SetContinuity;
		virtual void SetContinuity (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") HasShape;
		virtual Standard_Boolean HasShape (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		TopoDS_Shape Shape (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		TopoDS_Shape Shape (const TopoDS_Shape & aGenS);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		TopoDS_Shape Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") FirstShape;
		TopoDS_Shape FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") LastShape;
		TopoDS_Shape LastShape ();
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FirstShape;
		TopoDS_Shape FirstShape (const TopoDS_Shape & aGenS);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") LastShape;
		TopoDS_Shape LastShape (const TopoDS_Shape & aGenS);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Closed;
		Standard_Boolean Closed ();
};


%feature("shadow") BRepSweep_NumLinearRegularSweep::~BRepSweep_NumLinearRegularSweep %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepSweep_NumLinearRegularSweep {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepSweep_Prism;
class BRepSweep_Prism {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	V(gp_Vec)
	Copy(Standard_Boolean)=Standard_False
	Canonize(Standard_Boolean)=Standard_True

Returns:
	None

Builds the prism of base S and vector V. If C is true,  
         S is copied. If Canonize is true then generated surfaces  
         are attempted to be canonized in simple types") BRepSweep_Prism;
		 BRepSweep_Prism (const TopoDS_Shape & S,const gp_Vec & V,const Standard_Boolean Copy = Standard_False,const Standard_Boolean Canonize = Standard_True);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	D(gp_Dir)
	Inf(Standard_Boolean)=Standard_True
	Copy(Standard_Boolean)=Standard_False
	Canonize(Standard_Boolean)=Standard_True

Returns:
	None

Builds a semi-infinite or an infinite prism of base S.  
         If Copy is true S is copied.  If Inf is true the prism  
         is infinite, if Inf is false the  prism is infinite in  
         the direction D. If Canonize is true then generated surfaces  
         are attempted to be canonized in simple types") BRepSweep_Prism;
		 BRepSweep_Prism (const TopoDS_Shape & S,const gp_Dir & D,const Standard_Boolean Inf = Standard_True,const Standard_Boolean Copy = Standard_False,const Standard_Boolean Canonize = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the TopoDS Shape attached to the prism.") Shape;
		TopoDS_Shape Shape ();
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns    the  TopoDS  Shape   generated  with  aGenS  
         (subShape  of the generating shape).") Shape;
		TopoDS_Shape Shape (const TopoDS_Shape & aGenS);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the  TopoDS  Shape of the bottom of the prism.") FirstShape;
		TopoDS_Shape FirstShape ();
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the TopoDS Shape of the bottom  of the  prism.  
         generated  with  aGenS  (subShape  of  the  generating  
         shape).") FirstShape;
		TopoDS_Shape FirstShape (const TopoDS_Shape & aGenS);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the TopoDS Shape of the top of the prism.") LastShape;
		TopoDS_Shape LastShape ();
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the  TopoDS  Shape of the top  of  the  prism.  
         generated  with  aGenS  (subShape  of  the  generating  
         shape).") LastShape;
		TopoDS_Shape LastShape (const TopoDS_Shape & aGenS);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

Returns the Vector of the Prism,  if it is an infinite  
         prism the Vec is unitar.") Vec;
		gp_Vec Vec ();
};


%feature("shadow") BRepSweep_Prism::~BRepSweep_Prism %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepSweep_Prism {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepSweep_Revol;
class BRepSweep_Revol {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	A(gp_Ax1)
	D(Quantity_PlaneAngle)
	C(Standard_Boolean)=Standard_False

Returns:
	None

Builds the Revol of meridian S axis A  and angle D. If  
         C is true S is copied.") BRepSweep_Revol;
		 BRepSweep_Revol (const TopoDS_Shape & S,const gp_Ax1 & A,const Quantity_PlaneAngle D,const Standard_Boolean C = Standard_False);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	A(gp_Ax1)
	C(Standard_Boolean)=Standard_False

Returns:
	None

Builds the Revol of meridian S  axis A and angle 2*Pi.  
         If C is true S is copied.") BRepSweep_Revol;
		 BRepSweep_Revol (const TopoDS_Shape & S,const gp_Ax1 & A,const Standard_Boolean C = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the TopoDS Shape attached to the Revol.") Shape;
		TopoDS_Shape Shape ();
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns    the  TopoDS  Shape   generated  with  aGenS  
         (subShape  of the generating shape).") Shape;
		TopoDS_Shape Shape (const TopoDS_Shape & aGenS);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the first shape of the revol  (coinciding with  
         the generating shape).") FirstShape;
		TopoDS_Shape FirstShape ();
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the first shape of the revol  (coinciding with  
         the generating shape).") FirstShape;
		TopoDS_Shape FirstShape (const TopoDS_Shape & aGenS);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the TopoDS Shape of the top of the prism.") LastShape;
		TopoDS_Shape LastShape ();
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the  TopoDS  Shape of the top  of  the  prism.  
         generated  with  aGenS  (subShape  of  the  generating  
         shape).") LastShape;
		TopoDS_Shape LastShape (const TopoDS_Shape & aGenS);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

returns the axis") Axe;
		gp_Ax1 Axe ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_PlaneAngle

returns the angle.") Angle;
		Quantity_PlaneAngle Angle ();
};


%feature("shadow") BRepSweep_Revol::~BRepSweep_Revol %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepSweep_Revol {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep;
class BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(TopoDS_Shape)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep;
		 BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep (const TopoDS_Shape & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		TopoDS_Shape & Value ();
};


%feature("shadow") BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep::~BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep {
	Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep GetHandle() {
	return *(Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep*) &$self;
	}
};

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
%feature("shadow") Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep::~Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepSweep_SequenceNodeOfSequenceOfShapesOfNumLinearRegularSweep {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepSweep_SequenceOfShapesOfNumLinearRegularSweep;
class BRepSweep_SequenceOfShapesOfNumLinearRegularSweep : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepSweep_SequenceOfShapesOfNumLinearRegularSweep;
		 BRepSweep_SequenceOfShapesOfNumLinearRegularSweep ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(BRepSweep_SequenceOfShapesOfNumLinearRegularSweep)

Returns:
	BRepSweep_SequenceOfShapesOfNumLinearRegularSweep

No detailed docstring for this function.") Assign;
		const BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & Assign (const BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & Other);
		%feature("autodoc", "Args:
	Other(BRepSweep_SequenceOfShapesOfNumLinearRegularSweep)

Returns:
	BRepSweep_SequenceOfShapesOfNumLinearRegularSweep

No detailed docstring for this function.") operator=;
		const BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & operator = (const BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & Other);
		%feature("autodoc", "Args:
	T(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopoDS_Shape & T);
		%feature("autodoc", "Args:
	S(BRepSweep_SequenceOfShapesOfNumLinearRegularSweep)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & S);
		%feature("autodoc", "Args:
	T(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopoDS_Shape & T);
		%feature("autodoc", "Args:
	S(BRepSweep_SequenceOfShapesOfNumLinearRegularSweep)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TopoDS_Shape & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepSweep_SequenceOfShapesOfNumLinearRegularSweep)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TopoDS_Shape & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepSweep_SequenceOfShapesOfNumLinearRegularSweep)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") First;
		const TopoDS_Shape & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Last;
		const TopoDS_Shape & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(BRepSweep_SequenceOfShapesOfNumLinearRegularSweep)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,BRepSweep_SequenceOfShapesOfNumLinearRegularSweep & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopoDS_Shape & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeValue;
		TopoDS_Shape & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") BRepSweep_SequenceOfShapesOfNumLinearRegularSweep::~BRepSweep_SequenceOfShapesOfNumLinearRegularSweep %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepSweep_SequenceOfShapesOfNumLinearRegularSweep {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepSweep_Tool;
class BRepSweep_Tool {
	public:
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	None

Initialize the tool  with <aShape>.  The IndexTool  
         must prepare an indexation for  all  the subshapes  
         of this shape.") BRepSweep_Tool;
		 BRepSweep_Tool (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of subshapes in the shape.") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	Standard_Integer

Returns the index of <aShape>.") Index;
		Standard_Integer Index (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	TopoDS_Shape

Returns the Shape at Index anIdex.") Shape;
		TopoDS_Shape Shape (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	TopAbs_ShapeEnum

Returns the type of <aShape>.") Type;
		TopAbs_ShapeEnum Type (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	TopAbs_Orientation

Returns the Orientation of <aShape>.") Orientation;
		TopAbs_Orientation Orientation (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	Or(TopAbs_Orientation)

Returns:
	None

Set the Orientation of <aShape> with Or.") SetOrientation;
		void SetOrientation (TopoDS_Shape & aShape,const TopAbs_Orientation Or);
};


%feature("shadow") BRepSweep_Tool::~BRepSweep_Tool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepSweep_Tool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepSweep_Trsf;
class BRepSweep_Trsf : public BRepSweep_NumLinearRegularSweep {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	None
Returns:
	None

ends  the  construction  of the   swept  primitive  
         calling the virtual geometric functions that can't  
         be called in the initialize.") Init;
		void Init ();
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	Standard_Boolean

function called to analize the way of construction  
         of the shapes generated by aGenS and aDirV.") Process;
		Standard_Boolean Process (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aGenV(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	virtual TopoDS_Shape

Builds the vertex addressed by [aGenV,aDirV], with its  
         geometric part, but without subcomponents.") MakeEmptyVertex;
		virtual TopoDS_Shape MakeEmptyVertex (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aGenV(TopoDS_Shape)
	aDirE(Sweep_NumShape)

Returns:
	virtual TopoDS_Shape

Builds the edge addressed by [aGenV,aDirE], with its  
         geometric part, but without subcomponents.") MakeEmptyDirectingEdge;
		virtual TopoDS_Shape MakeEmptyDirectingEdge (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE);
		%feature("autodoc", "Args:
	aGenE(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	virtual TopoDS_Shape

Builds the edge addressed by [aGenE,aDirV], with its  
         geometric part, but without subcomponents.") MakeEmptyGeneratingEdge;
		virtual TopoDS_Shape MakeEmptyGeneratingEdge (const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewVertex(TopoDS_Shape)
	aGenF(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	virtual void

Sets the  parameters of the new  vertex  on the new  
         face. The new face and  new vertex where generated  
         from aGenF, aGenV and aDirV .") SetParameters;
		virtual void SetParameters (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aNewEdge(TopoDS_Shape)
	aNewVertex(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirE(Sweep_NumShape)
	aDirV(Sweep_NumShape)

Returns:
	virtual void

Sets the  parameter of the new  vertex  on the new  
         edge. The new edge and  new vertex where generated  
         from aGenV aDirE, and aDirV.") SetDirectingParameter;
		virtual void SetDirectingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aNewEdge(TopoDS_Shape)
	aNewVertex(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	virtual void

Sets the  parameter of the new  vertex  on the new  
         edge. The new edge and  new vertex where generated  
         from aGenE, aGenV and aDirV .") SetGeneratingParameter;
		virtual void SetGeneratingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	virtual TopoDS_Shape

Builds  the face addressed  by [aGenS,aDirS], with  
         its geometric part, but without subcomponents. The  
         couple aGenS, aDirS can be  a 'generating face and  
         a  directing vertex' or 'a   generating edge and a  
         directing  edge'.") MakeEmptyFace;
		virtual TopoDS_Shape MakeEmptyFace (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewEdge(TopoDS_Shape)
	aGenF(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aDirV(Sweep_NumShape)
	orien(TopAbs_Orientation)

Returns:
	virtual void

Sets the PCurve for a new edge on a new face. The  
         new edge and  the  new face were generated  using  
         aGenF, aGenE and aDirV.") SetPCurve;
		virtual void SetPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewEdge(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aDirE(Sweep_NumShape)
	aDirV(Sweep_NumShape)
	orien(TopAbs_Orientation)

Returns:
	virtual void

Sets the PCurve for a new edge on a new face. The  
         new edge and  the  new face were generated  using  
         aGenE, aDirE and aDirV.") SetGeneratingPCurve;
		virtual void SetGeneratingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewEdge(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirE(Sweep_NumShape)
	orien(TopAbs_Orientation)

Returns:
	virtual void

Sets the PCurve for a new edge on a new face. The  
         new edge and  the  new face were generated  using  
         aGenE, aDirE and aGenV.") SetDirectingPCurve;
		virtual void SetDirectingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const TopAbs_Orientation orien);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)
	aNewSubShape(TopoDS_Shape)
	aGenS(TopoDS_Shape)
	aSubGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	virtual Standard_Boolean

Returns   true   if  aNewSubShape    (addressed by  
         aSubGenS  and aDirS)  must  be added  in aNewShape  
         (addressed by aGenS and aDirS).") GGDShapeIsToAdd;
		virtual Standard_Boolean GGDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)
	aNewSubShape(TopoDS_Shape)
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)
	aSubDirS(Sweep_NumShape)

Returns:
	virtual Standard_Boolean

Returns   true   if  aNewSubShape    (addressed by  
         aGenS  and aSubDirS)  must  be added  in aNewShape  
         (addressed by aGenS and aDirS).") GDDShapeIsToAdd;
		virtual Standard_Boolean GDDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS,const Sweep_NumShape & aSubDirS);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)
	aNewSubShape(TopoDS_Shape)
	aGenS(TopoDS_Shape)
	aSubGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	virtual Standard_Boolean

In  some  particular  cases  the   topology  of  a  
         generated  face must be  composed  of  independant  
         closed wires,  in this case  this function returns  
         true.") SeparatedWires;
		virtual Standard_Boolean SeparatedWires (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	virtual Standard_Boolean

Returns true   if aDirS   and aGenS  addresses   a  
         resulting Shape. In some  specific cases the shape  
         can  be    geometrically   inexsistant,  then this  
         function returns false.") HasShape;
		virtual Standard_Boolean HasShape (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

Returns  true if  the geometry   of  aGenS is  not  
         modified by the trsf of the BRepSweep Trsf.") IsInvariant;
		virtual Standard_Boolean IsInvariant (const TopoDS_Shape & aGenS);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	None

Called to propagate the continuity of  every vertex  
         between two edges of the  generating wire  aGenS on  
         the generated edge and faces.") SetContinuity;
		void SetContinuity (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
};


%feature("shadow") BRepSweep_Trsf::~BRepSweep_Trsf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepSweep_Trsf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepSweep_Rotation;
class BRepSweep_Rotation : public BRepSweep_Trsf {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	N(Sweep_NumShape)
	L(TopLoc_Location)
	A(gp_Ax1)
	D(Quantity_PlaneAngle)
	C(Standard_Boolean)

Returns:
	None

Creates a topology  by rotating <S>  around A with the  
         angle D.") BRepSweep_Rotation;
		 BRepSweep_Rotation (const TopoDS_Shape & S,const Sweep_NumShape & N,const TopLoc_Location & L,const gp_Ax1 & A,const Quantity_PlaneAngle D,const Standard_Boolean C);
		%feature("autodoc", "Args:
	aGenV(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	TopoDS_Shape

Builds the vertex addressed by [aGenV,aDirV], with its  
         geometric part, but without subcomponents.") MakeEmptyVertex;
		TopoDS_Shape MakeEmptyVertex (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aGenV(TopoDS_Shape)
	aDirE(Sweep_NumShape)

Returns:
	TopoDS_Shape

Builds the edge addressed by [aGenV,aDirE], with its  
         geometric part, but without subcomponents.") MakeEmptyDirectingEdge;
		TopoDS_Shape MakeEmptyDirectingEdge (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE);
		%feature("autodoc", "Args:
	aGenE(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	TopoDS_Shape

Builds the edge addressed by [aGenE,aDirV], with its  
         geometric part, but without subcomponents.") MakeEmptyGeneratingEdge;
		TopoDS_Shape MakeEmptyGeneratingEdge (const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewVertex(TopoDS_Shape)
	aGenF(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	None

Sets the  parameters of the new  vertex  on the new  
         face. The new face and  new vertex where generated  
         from aGenF, aGenV and aDirV .") SetParameters;
		void SetParameters (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aNewEdge(TopoDS_Shape)
	aNewVertex(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirE(Sweep_NumShape)
	aDirV(Sweep_NumShape)

Returns:
	None

Sets the  parameter of the new  vertex  on the new  
         edge. The new edge and  new vertex where generated  
         from aGenV aDirE, and aDirV.") SetDirectingParameter;
		void SetDirectingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aNewEdge(TopoDS_Shape)
	aNewVertex(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	None

Sets the  parameter of the new  vertex  on the new  
         edge. The new edge and  new vertex where generated  
         from aGenE, aGenV and aDirV .") SetGeneratingParameter;
		void SetGeneratingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	TopoDS_Shape

Builds the face  addressed by [aGenS,aDirS],  with  
         its geometric part, but without subcomponents. The  
         couple aGenS, aDirS can be  a 'generating face and  
         a  directing vertex' or  'a generating  edge and a  
         directing edge'.") MakeEmptyFace;
		TopoDS_Shape MakeEmptyFace (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewEdge(TopoDS_Shape)
	aGenF(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aDirV(Sweep_NumShape)
	orien(TopAbs_Orientation)

Returns:
	None

Sets the PCurve for a new edge on a new face. The  
         new edge and  the  new face were generated  using  
         aGenF, aGenE and aDirV.") SetPCurve;
		void SetPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewEdge(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aDirE(Sweep_NumShape)
	aDirV(Sweep_NumShape)
	orien(TopAbs_Orientation)

Returns:
	None

Sets the PCurve for a new edge on a new face. The  
         new edge and  the  new face were generated  using  
         aGenE, aDirE and aDirV.") SetGeneratingPCurve;
		void SetGeneratingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewEdge(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirE(Sweep_NumShape)
	orien(TopAbs_Orientation)

Returns:
	None

Sets the PCurve for a new edge on a new face. The  
         new edge and  the  new face were generated  using  
         aGenE, aDirE and aGenV.") SetDirectingPCurve;
		void SetDirectingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const TopAbs_Orientation orien);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	TopAbs_Orientation

Returns the Orientation of the  shell in the solid  
         generated by the face aGenS  with  the edge aDirS.  
         It is  REVERSED  if the surface is  swept  in  the  
         direction of the normal.") DirectSolid;
		TopAbs_Orientation DirectSolid (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)
	aNewSubShape(TopoDS_Shape)
	aGenS(TopoDS_Shape)
	aSubGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	Standard_Boolean

Returns   true   if  aNewSubShape    (addressed by  
         aSubGenS  and aDirS)  must  be added  in aNewShape  
         (addressed by aGenS and aDirS).") GGDShapeIsToAdd;
		Standard_Boolean GGDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)
	aNewSubShape(TopoDS_Shape)
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)
	aSubDirS(Sweep_NumShape)

Returns:
	Standard_Boolean

Returns   true   if  aNewSubShape    (addressed by  
         aGenS  and aSubDirS)  must  be added  in aNewShape  
         (addressed by aGenS and aDirS).") GDDShapeIsToAdd;
		Standard_Boolean GDDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS,const Sweep_NumShape & aSubDirS);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)
	aNewSubShape(TopoDS_Shape)
	aGenS(TopoDS_Shape)
	aSubGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	Standard_Boolean

In   some  particular  cases  the  topology  of  a  
         generated  face  must  be  composed of independant  
         closed wires, in  this  case this function returns  
         true.   The  only  case in whitch the function may  
         return true is a planar face in a closed revol.") SeparatedWires;
		Standard_Boolean SeparatedWires (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)

Returns:
	virtual TopoDS_Shape

In  some  particular  cases  the   topology  of  a  
         generated  Shell must be  composed  of  independant  
         closed Shells,  in this case  this function returns  
         a Compound of independant Shells.") SplitShell;
		virtual TopoDS_Shape SplitShell (const TopoDS_Shape & aNewShape);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	Standard_Boolean

Returns true   if aDirS   and aGenS  addresses   a  
         resulting Shape. In some  specific cases the shape  
         can  be    geometrically   inexsistant,  then this  
         function returns false.") HasShape;
		Standard_Boolean HasShape (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)

Returns:
	Standard_Boolean

Returns true when   the geometry of  aGenS  is not  
         modified  by the rotation.") IsInvariant;
		Standard_Boolean IsInvariant (const TopoDS_Shape & aGenS);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

returns the axis") Axe;
		gp_Ax1 Axe ();
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_PlaneAngle

returns the angle.") Angle;
		Quantity_PlaneAngle Angle ();
};


%feature("shadow") BRepSweep_Rotation::~BRepSweep_Rotation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepSweep_Rotation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepSweep_Translation;
class BRepSweep_Translation : public BRepSweep_Trsf {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	N(Sweep_NumShape)
	L(TopLoc_Location)
	V(gp_Vec)
	C(Standard_Boolean)
	Canonize(Standard_Boolean)=Standard_True

Returns:
	None

Creates  a  topology by  translating <S>  with the  
         vector  <V>. If  C  is   true S Sucomponents   are  
         copied. If Canonize is true then generated surfaces  
         are attempted to be canonized in simple types") BRepSweep_Translation;
		 BRepSweep_Translation (const TopoDS_Shape & S,const Sweep_NumShape & N,const TopLoc_Location & L,const gp_Vec & V,const Standard_Boolean C,const Standard_Boolean Canonize = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	aGenV(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	TopoDS_Shape

Builds the vertex addressed by [aGenV,aDirV], with its  
         geometric part, but without subcomponents.") MakeEmptyVertex;
		TopoDS_Shape MakeEmptyVertex (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aGenV(TopoDS_Shape)
	aDirE(Sweep_NumShape)

Returns:
	TopoDS_Shape

Builds the edge addressed by [aGenV,aDirE], with its  
         geometric part, but without subcomponents.") MakeEmptyDirectingEdge;
		TopoDS_Shape MakeEmptyDirectingEdge (const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE);
		%feature("autodoc", "Args:
	aGenE(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	TopoDS_Shape

Builds the edge addressed by [aGenE,aDirV], with its  
         geometric part, but without subcomponents.") MakeEmptyGeneratingEdge;
		TopoDS_Shape MakeEmptyGeneratingEdge (const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewVertex(TopoDS_Shape)
	aGenF(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	None

Sets the  parameters of the new  vertex  on the new  
         face. The new face and  new vertex where generated  
         from aGenF, aGenV and aDirV .") SetParameters;
		void SetParameters (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aNewEdge(TopoDS_Shape)
	aNewVertex(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirE(Sweep_NumShape)
	aDirV(Sweep_NumShape)

Returns:
	None

Sets the  parameter of the new  vertex  on the new  
         edge. The new edge and  new vertex where generated  
         from aGenV aDirE, and aDirV.") SetDirectingParameter;
		void SetDirectingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aNewEdge(TopoDS_Shape)
	aNewVertex(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirV(Sweep_NumShape)

Returns:
	None

Sets the  parameter of the new  vertex  on the new  
         edge. The new edge and  new vertex where generated  
         from aGenE, aGenV and aDirV .") SetGeneratingParameter;
		void SetGeneratingParameter (const TopoDS_Shape & aNewEdge,TopoDS_Shape & aNewVertex,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirV);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	TopoDS_Shape

Builds the  face addressed  by [aGenS,aDirS], with  
         its geometric part, but without subcomponents. The  
         couple aGenS, aDirS can  be a 'generating face and  
         a  directing  vertex' or  'a generating edge and a  
         directing  edge'.") MakeEmptyFace;
		TopoDS_Shape MakeEmptyFace (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewEdge(TopoDS_Shape)
	aGenF(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aDirV(Sweep_NumShape)
	orien(TopAbs_Orientation)

Returns:
	None

Sets the PCurve for a new edge on a new face. The  
         new edge and  the  new face were generated  using  
         aGenF, aGenE and aDirV.") SetPCurve;
		void SetPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenF,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewEdge(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aDirE(Sweep_NumShape)
	aDirV(Sweep_NumShape)
	orien(TopAbs_Orientation)

Returns:
	None

Sets the PCurve for a new edge on a new face. The  
         new edge and  the  new face were generated  using  
         aGenE, aDirE and aDirV.") SetGeneratingPCurve;
		void SetGeneratingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const Sweep_NumShape & aDirE,const Sweep_NumShape & aDirV,const TopAbs_Orientation orien);
		%feature("autodoc", "Args:
	aNewFace(TopoDS_Shape)
	aNewEdge(TopoDS_Shape)
	aGenE(TopoDS_Shape)
	aGenV(TopoDS_Shape)
	aDirE(Sweep_NumShape)
	orien(TopAbs_Orientation)

Returns:
	None

Sets the PCurve for a new edge on a new face. The  
         new edge and  the  new face were generated  using  
         aGenE, aDirE and aGenV.") SetDirectingPCurve;
		void SetDirectingPCurve (const TopoDS_Shape & aNewFace,TopoDS_Shape & aNewEdge,const TopoDS_Shape & aGenE,const TopoDS_Shape & aGenV,const Sweep_NumShape & aDirE,const TopAbs_Orientation orien);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	TopAbs_Orientation

Returns the Orientation of the  shell in the solid  
         generated by the face aGenS  with  the edge aDirS.  
         It is  REVERSED  if the surface is  swept  in  the  
         direction of the normal.") DirectSolid;
		TopAbs_Orientation DirectSolid (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)
	aNewSubShape(TopoDS_Shape)
	aGenS(TopoDS_Shape)
	aSubGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	Standard_Boolean

Returns   true   if  aNewSubShape    (addressed by  
         aSubGenS  and aDirS)  must  be added  in aNewShape  
         (addressed by aGenS and aDirS).") GGDShapeIsToAdd;
		Standard_Boolean GGDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)
	aNewSubShape(TopoDS_Shape)
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)
	aSubDirS(Sweep_NumShape)

Returns:
	Standard_Boolean

Returns   true   if  aNewSubShape    (addressed by  
         aGenS  and aSubDirS)  must  be added  in aNewShape  
         (addressed by aGenS and aDirS).") GDDShapeIsToAdd;
		Standard_Boolean GDDShapeIsToAdd (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS,const Sweep_NumShape & aSubDirS);
		%feature("autodoc", "Args:
	aNewShape(TopoDS_Shape)
	aNewSubShape(TopoDS_Shape)
	aGenS(TopoDS_Shape)
	aSubGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	Standard_Boolean

In  some  particular  cases  the   topology  of  a  
         generated  face must be  composed  of  independant  
         closed wires,  in this case  this function returns  
         true.  
         Here it always returns false.") SeparatedWires;
		Standard_Boolean SeparatedWires (const TopoDS_Shape & aNewShape,const TopoDS_Shape & aNewSubShape,const TopoDS_Shape & aGenS,const TopoDS_Shape & aSubGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)
	aDirS(Sweep_NumShape)

Returns:
	Standard_Boolean

Returns true   if aDirS   and aGenS  addresses   a  
         resulting Shape. In some  specific cases the shape  
         can  be    geometrically   inexsistant,  then this  
         function returns false.") HasShape;
		Standard_Boolean HasShape (const TopoDS_Shape & aGenS,const Sweep_NumShape & aDirS);
		%feature("autodoc", "Args:
	aGenS(TopoDS_Shape)

Returns:
	Standard_Boolean

Returns  always     false   because    here    the  
         transformation is a translation.") IsInvariant;
		Standard_Boolean IsInvariant (const TopoDS_Shape & aGenS);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

Returns the Vector of the Prism,  if it is an infinite  
         prism the Vec is unitar.") Vec;
		gp_Vec Vec ();
};


%feature("shadow") BRepSweep_Translation::~BRepSweep_Translation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepSweep_Translation {
	void _kill_pointed() {
		delete $self;
	}
};
