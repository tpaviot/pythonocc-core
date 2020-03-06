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
%define BREPSWEEPDOCSTRING
"BRepSweep module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepsweep.html"
%enddef
%module (package="OCC.Core", docstring=BREPSWEEPDOCSTRING) BRepSweep


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
#include<BRepSweep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRep_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<Sweep_module.hxx>
#include<gp_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TShort_module.hxx>
#include<Poly_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRep.i
%import TopoDS.i
%import TopAbs.i
%import Sweep.i
%import gp.i
%import TopLoc.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************************
* class BRepSweep_Builder *
**************************/
class BRepSweep_Builder {
	public:
		/****************** BRepSweep_Builder ******************/
		%feature("compactdefaultargs") BRepSweep_Builder;
		%feature("autodoc", "Creates a builder.

Parameters
----------
aBuilder: BRep_Builder

Returns
-------
None
") BRepSweep_Builder;
		 BRepSweep_Builder(const BRep_Builder & aBuilder);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the shape 1 in the shape 2, set to <orient> orientation.

Parameters
----------
aShape1: TopoDS_Shape
aShape2: TopoDS_Shape
Orient: TopAbs_Orientation

Returns
-------
None
") Add;
		void Add(TopoDS_Shape & aShape1, const TopoDS_Shape & aShape2, const TopAbs_Orientation Orient);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the shape 1 in the shape 2.

Parameters
----------
aShape1: TopoDS_Shape
aShape2: TopoDS_Shape

Returns
-------
None
") Add;
		void Add(TopoDS_Shape & aShape1, const TopoDS_Shape & aShape2);

		/****************** Builder ******************/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "No available documentation.

Returns
-------
BRep_Builder
") Builder;
		const BRep_Builder & Builder();

		/****************** MakeCompSolid ******************/
		%feature("compactdefaultargs") MakeCompSolid;
		%feature("autodoc", "Returns an empty compsolid.

Parameters
----------
aCompSolid: TopoDS_Shape

Returns
-------
None
") MakeCompSolid;
		void MakeCompSolid(TopoDS_Shape & aCompSolid);

		/****************** MakeCompound ******************/
		%feature("compactdefaultargs") MakeCompound;
		%feature("autodoc", "Returns an empty compound.

Parameters
----------
aCompound: TopoDS_Shape

Returns
-------
None
") MakeCompound;
		void MakeCompound(TopoDS_Shape & aCompound);

		/****************** MakeShell ******************/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "Returns an empty shell.

Parameters
----------
aShell: TopoDS_Shape

Returns
-------
None
") MakeShell;
		void MakeShell(TopoDS_Shape & aShell);

		/****************** MakeSolid ******************/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "Returns an empty solid.

Parameters
----------
aSolid: TopoDS_Shape

Returns
-------
None
") MakeSolid;
		void MakeSolid(TopoDS_Shape & aSolid);

		/****************** MakeWire ******************/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "Returns an empty wire.

Parameters
----------
aWire: TopoDS_Shape

Returns
-------
None
") MakeWire;
		void MakeWire(TopoDS_Shape & aWire);

};


%extend BRepSweep_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepSweep_Iterator *
***************************/
class BRepSweep_Iterator {
	public:
		/****************** BRepSweep_Iterator ******************/
		%feature("compactdefaultargs") BRepSweep_Iterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepSweep_Iterator;
		 BRepSweep_Iterator();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Resest the iterator on sub-shapes of <ashape>.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & aShape);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current sub-shape.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Moves to the next sub-shape.

Returns
-------
None
") Next;
		void Next();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation of the current sub-shape.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current sub-shape.

Returns
-------
TopoDS_Shape
") Value;
		const TopoDS_Shape Value();

};


%extend BRepSweep_Iterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BRepSweep_NumLinearRegularSweep *
****************************************/
%nodefaultctor BRepSweep_NumLinearRegularSweep;
class BRepSweep_NumLinearRegularSweep {
	public:
		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Closed;
		Standard_Boolean Closed();

		/****************** DirectSolid ******************/
		%feature("compactdefaultargs") DirectSolid;
		%feature("autodoc", "Returns the orientation of the shell in the solid generated by the face agens with the edge adirs. it is reversed if the surface is swept in the direction of the normal.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
TopAbs_Orientation
") DirectSolid;
		virtual TopAbs_Orientation DirectSolid(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the resulting shape indexed by the first vertex of mydirwire and mygenshape.

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape();

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the resulting shape indexed by the first vertex of mydirwire and agens.

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape(const TopoDS_Shape & aGenS);

		/****************** GDDShapeIsToAdd ******************/
		%feature("compactdefaultargs") GDDShapeIsToAdd;
		%feature("autodoc", "Returns true if anewsubshape (addressed by agens and asubdirs) must be added in anewshape (addressed by agens and adirs).

Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape
aSubDirS: Sweep_NumShape

Returns
-------
bool
") GDDShapeIsToAdd;
		virtual Standard_Boolean GDDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS, const Sweep_NumShape & aSubDirS);

		/****************** GGDShapeIsToAdd ******************/
		%feature("compactdefaultargs") GGDShapeIsToAdd;
		%feature("autodoc", "Returns true if anewsubshape (addressed by asubgens and adirs) must be added in anewshape (addressed by agens and adirs).

Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
bool
") GGDShapeIsToAdd;
		virtual Standard_Boolean GGDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****************** GenIsUsed ******************/
		%feature("compactdefaultargs") GenIsUsed;
		%feature("autodoc", "Returns true if the shape, generated from thes is used in result shape.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
bool
") GenIsUsed;
		Standard_Boolean GenIsUsed(const TopoDS_Shape & theS);

		/****************** HasShape ******************/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "Returns true if adirs and agens addresses a resulting shape. in some specific cases the shape can be geometrically inexsistant, then this function returns false.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
bool
") HasShape;
		virtual Standard_Boolean HasShape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** IsInvariant ******************/
		%feature("compactdefaultargs") IsInvariant;
		%feature("autodoc", "Returns true if agens cannot be transformed.

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
bool
") IsInvariant;
		virtual Standard_Boolean IsInvariant(const TopoDS_Shape & aGenS);

		/****************** IsUsed ******************/
		%feature("compactdefaultargs") IsUsed;
		%feature("autodoc", "Returns true if the initial shape agens is used in result shape.

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
bool
") IsUsed;
		Standard_Boolean IsUsed(const TopoDS_Shape & aGenS);

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the resulting shape indexed by the last vertex of mydirwire and mygenshape.

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the resulting shape indexed by the last vertex of mydirwire and agens.

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape(const TopoDS_Shape & aGenS);

		/****************** MakeEmptyDirectingEdge ******************/
		%feature("compactdefaultargs") MakeEmptyDirectingEdge;
		%feature("autodoc", "Builds the edge addressed by [agenv,adire], with its geometric part, but without subcomponents.

Parameters
----------
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyDirectingEdge;
		virtual TopoDS_Shape MakeEmptyDirectingEdge(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE);

		/****************** MakeEmptyFace ******************/
		%feature("compactdefaultargs") MakeEmptyFace;
		%feature("autodoc", "Builds the face addressed by [agens,adirs], with its geometric part, but without subcomponents. the couple agens, adirs can be a 'generating face and a directing vertex' or 'a generating edge and a directing edge'.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyFace;
		virtual TopoDS_Shape MakeEmptyFace(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** MakeEmptyGeneratingEdge ******************/
		%feature("compactdefaultargs") MakeEmptyGeneratingEdge;
		%feature("autodoc", "Builds the edge addressed by [agene,adirv], with its geometric part, but without subcomponents.

Parameters
----------
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyGeneratingEdge;
		virtual TopoDS_Shape MakeEmptyGeneratingEdge(const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV);

		/****************** MakeEmptyVertex ******************/
		%feature("compactdefaultargs") MakeEmptyVertex;
		%feature("autodoc", "Builds the vertex addressed by [agenv,adirv], with its geometric part, but without subcomponents.

Parameters
----------
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyVertex;
		virtual TopoDS_Shape MakeEmptyVertex(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****************** SeparatedWires ******************/
		%feature("compactdefaultargs") SeparatedWires;
		%feature("autodoc", "In some particular cases the topology of a generated face must be composed of independant closed wires, in this case this function returns true.

Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
bool
") SeparatedWires;
		virtual Standard_Boolean SeparatedWires(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "Called to propagate the continuity of every vertex between two edges of the generating wire agens on the generated edge and faces.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
None
") SetContinuity;
		virtual void SetContinuity(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** SetDirectingPCurve ******************/
		%feature("compactdefaultargs") SetDirectingPCurve;
		%feature("autodoc", "Sets the pcurve for a new edge on a new face. the new edge and the new face were generated using agene, adire and agenv.

Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
orien: TopAbs_Orientation

Returns
-------
None
") SetDirectingPCurve;
		virtual void SetDirectingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const TopAbs_Orientation orien);

		/****************** SetDirectingParameter ******************/
		%feature("compactdefaultargs") SetDirectingParameter;
		%feature("autodoc", "Sets the parameter of the new vertex on the new edge. the new edge and new vertex where generated from agenv adire, and adirv.

Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape

Returns
-------
None
") SetDirectingParameter;
		virtual void SetDirectingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV);

		/****************** SetGeneratingPCurve ******************/
		%feature("compactdefaultargs") SetGeneratingPCurve;
		%feature("autodoc", "Sets the pcurve for a new edge on a new face. the new edge and the new face were generated using agene, adire and adirv.

Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Returns
-------
None
") SetGeneratingPCurve;
		virtual void SetGeneratingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****************** SetGeneratingParameter ******************/
		%feature("compactdefaultargs") SetGeneratingParameter;
		%feature("autodoc", "Sets the parameter of the new vertex on the new edge. the new edge and new vertex where generated from agene, agenv and adirv .

Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
None
") SetGeneratingParameter;
		virtual void SetGeneratingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****************** SetPCurve ******************/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "Sets the pcurve for a new edge on a new face. the new edge and the new face were generated using agenf, agene and adirv.

Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenF: TopoDS_Shape
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Returns
-------
None
") SetPCurve;
		virtual void SetPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Sets the parameters of the new vertex on the new face. the new face and new vertex where generated from agenf, agenv and adirv .

Parameters
----------
aNewFace: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenF: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
None
") SetParameters;
		virtual void SetParameters(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the resulting shape indexed by adirs and agens.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the resulting shape indexed by mydirwire and agens.

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape(const TopoDS_Shape & aGenS);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the resulting shape indexed by mydirwire and mygenshape.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** SplitShell ******************/
		%feature("compactdefaultargs") SplitShell;
		%feature("autodoc", "In some particular cases the topology of a generated shell must be composed of independant closed shells, in this case this function returns a compound of independant shells.

Parameters
----------
aNewShape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") SplitShell;
		virtual TopoDS_Shape SplitShell(const TopoDS_Shape & aNewShape);

};


%extend BRepSweep_NumLinearRegularSweep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepSweep_Prism *
************************/
class BRepSweep_Prism {
	public:
		/****************** BRepSweep_Prism ******************/
		%feature("compactdefaultargs") BRepSweep_Prism;
		%feature("autodoc", "Builds the prism of base s and vector v. if c is true, s is copied. if canonize is true then generated surfaces are attempted to be canonized in simple types.

Parameters
----------
S: TopoDS_Shape
V: gp_Vec
Copy: bool,optional
	default value is Standard_False
Canonize: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepSweep_Prism;
		 BRepSweep_Prism(const TopoDS_Shape & S, const gp_Vec & V, const Standard_Boolean Copy = Standard_False, const Standard_Boolean Canonize = Standard_True);

		/****************** BRepSweep_Prism ******************/
		%feature("compactdefaultargs") BRepSweep_Prism;
		%feature("autodoc", "Builds a semi-infinite or an infinite prism of base s. if copy is true s is copied. if inf is true the prism is infinite, if inf is false the prism is infinite in the direction d. if canonize is true then generated surfaces are attempted to be canonized in simple types.

Parameters
----------
S: TopoDS_Shape
D: gp_Dir
Inf: bool,optional
	default value is Standard_True
Copy: bool,optional
	default value is Standard_False
Canonize: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepSweep_Prism;
		 BRepSweep_Prism(const TopoDS_Shape & S, const gp_Dir & D, const Standard_Boolean Inf = Standard_True, const Standard_Boolean Copy = Standard_False, const Standard_Boolean Canonize = Standard_True);

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the topods shape of the bottom of the prism.

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape();

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the topods shape of the bottom of the prism. generated with agens (subshape of the generating shape).

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape(const TopoDS_Shape & aGenS);

		/****************** GenIsUsed ******************/
		%feature("compactdefaultargs") GenIsUsed;
		%feature("autodoc", "Returns true if the shape, generated from thes is used in result shape.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
bool
") GenIsUsed;
		Standard_Boolean GenIsUsed(const TopoDS_Shape & theS);

		/****************** IsUsed ******************/
		%feature("compactdefaultargs") IsUsed;
		%feature("autodoc", "Returns true if the agens is used in resulting shape.

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
bool
") IsUsed;
		Standard_Boolean IsUsed(const TopoDS_Shape & aGenS);

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the top of the prism.

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the top of the prism. generated with agens (subshape of the generating shape).

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape(const TopoDS_Shape & aGenS);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the topods shape attached to the prism.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the topods shape generated with agens (subshape of the generating shape).

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape(const TopoDS_Shape & aGenS);

		/****************** Vec ******************/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "Returns the vector of the prism, if it is an infinite prism the vec is unitar.

Returns
-------
gp_Vec
") Vec;
		gp_Vec Vec();

};


%extend BRepSweep_Prism {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepSweep_Revol *
************************/
class BRepSweep_Revol {
	public:
		/****************** BRepSweep_Revol ******************/
		%feature("compactdefaultargs") BRepSweep_Revol;
		%feature("autodoc", "Builds the revol of meridian s axis a and angle d. if c is true s is copied.

Parameters
----------
S: TopoDS_Shape
A: gp_Ax1
D: float
C: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepSweep_Revol;
		 BRepSweep_Revol(const TopoDS_Shape & S, const gp_Ax1 & A, const Standard_Real D, const Standard_Boolean C = Standard_False);

		/****************** BRepSweep_Revol ******************/
		%feature("compactdefaultargs") BRepSweep_Revol;
		%feature("autodoc", "Builds the revol of meridian s axis a and angle 2*pi. if c is true s is copied.

Parameters
----------
S: TopoDS_Shape
A: gp_Ax1
C: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepSweep_Revol;
		 BRepSweep_Revol(const TopoDS_Shape & S, const gp_Ax1 & A, const Standard_Boolean C = Standard_False);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the angle.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Axe ******************/
		%feature("compactdefaultargs") Axe;
		%feature("autodoc", "Returns the axis.

Returns
-------
gp_Ax1
") Axe;
		gp_Ax1 Axe();

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the first shape of the revol (coinciding with the generating shape).

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape();

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the first shape of the revol (coinciding with the generating shape).

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape(const TopoDS_Shape & aGenS);

		/****************** IsUsed ******************/
		%feature("compactdefaultargs") IsUsed;
		%feature("autodoc", "Returns true if the agens is used in resulting shape .

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
bool
") IsUsed;
		Standard_Boolean IsUsed(const TopoDS_Shape & aGenS);

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the top of the prism.

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the top of the prism. generated with agens (subshape of the generating shape).

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape(const TopoDS_Shape & aGenS);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the topods shape attached to the revol.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the topods shape generated with agens (subshape of the generating shape).

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape(const TopoDS_Shape & aGenS);

};


%extend BRepSweep_Revol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepSweep_Tool *
***********************/
class BRepSweep_Tool {
	public:
		/****************** BRepSweep_Tool ******************/
		%feature("compactdefaultargs") BRepSweep_Tool;
		%feature("autodoc", "Initialize the tool with <ashape>. the indextool must prepare an indexation for all the subshapes of this shape.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
None
") BRepSweep_Tool;
		 BRepSweep_Tool(const TopoDS_Shape & aShape);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the index of <ashape>.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
int
") Index;
		Standard_Integer Index(const TopoDS_Shape & aShape);

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Returns the number of subshapes in the shape.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation of <ashape>.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation(const TopoDS_Shape & aShape);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "Set the orientation of <ashape> with or.

Parameters
----------
aShape: TopoDS_Shape
Or: TopAbs_Orientation

Returns
-------
None
") SetOrientation;
		void SetOrientation(TopoDS_Shape & aShape, const TopAbs_Orientation Or);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the shape at index anidex.

Parameters
----------
anIndex: int

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape(const Standard_Integer anIndex);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type of <ashape>.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
TopAbs_ShapeEnum
") Type;
		TopAbs_ShapeEnum Type(const TopoDS_Shape & aShape);

};


%extend BRepSweep_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepSweep_Trsf *
***********************/
%nodefaultctor BRepSweep_Trsf;
class BRepSweep_Trsf : public BRepSweep_NumLinearRegularSweep {
	public:
		/****************** GDDShapeIsToAdd ******************/
		%feature("compactdefaultargs") GDDShapeIsToAdd;
		%feature("autodoc", "Returns true if anewsubshape (addressed by agens and asubdirs) must be added in anewshape (addressed by agens and adirs).

Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape
aSubDirS: Sweep_NumShape

Returns
-------
bool
") GDDShapeIsToAdd;
		virtual Standard_Boolean GDDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS, const Sweep_NumShape & aSubDirS);

		/****************** GGDShapeIsToAdd ******************/
		%feature("compactdefaultargs") GGDShapeIsToAdd;
		%feature("autodoc", "Returns true if anewsubshape (addressed by asubgens and adirs) must be added in anewshape (addressed by agens and adirs).

Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
bool
") GGDShapeIsToAdd;
		virtual Standard_Boolean GGDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****************** HasShape ******************/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "Returns true if adirs and agens addresses a resulting shape. in some specific cases the shape can be geometrically inexsistant, then this function returns false.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
bool
") HasShape;
		virtual Standard_Boolean HasShape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Ends the construction of the swept primitive calling the virtual geometric functions that can't be called in the initialize.

Returns
-------
None
") Init;
		void Init();

		/****************** IsInvariant ******************/
		%feature("compactdefaultargs") IsInvariant;
		%feature("autodoc", "Returns true if the geometry of agens is not modified by the trsf of the brepsweep trsf.

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
bool
") IsInvariant;
		virtual Standard_Boolean IsInvariant(const TopoDS_Shape & aGenS);

		/****************** MakeEmptyDirectingEdge ******************/
		%feature("compactdefaultargs") MakeEmptyDirectingEdge;
		%feature("autodoc", "Builds the edge addressed by [agenv,adire], with its geometric part, but without subcomponents.

Parameters
----------
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyDirectingEdge;
		virtual TopoDS_Shape MakeEmptyDirectingEdge(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE);

		/****************** MakeEmptyFace ******************/
		%feature("compactdefaultargs") MakeEmptyFace;
		%feature("autodoc", "Builds the face addressed by [agens,adirs], with its geometric part, but without subcomponents. the couple agens, adirs can be a 'generating face and a directing vertex' or 'a generating edge and a directing edge'.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyFace;
		virtual TopoDS_Shape MakeEmptyFace(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** MakeEmptyGeneratingEdge ******************/
		%feature("compactdefaultargs") MakeEmptyGeneratingEdge;
		%feature("autodoc", "Builds the edge addressed by [agene,adirv], with its geometric part, but without subcomponents.

Parameters
----------
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyGeneratingEdge;
		virtual TopoDS_Shape MakeEmptyGeneratingEdge(const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV);

		/****************** MakeEmptyVertex ******************/
		%feature("compactdefaultargs") MakeEmptyVertex;
		%feature("autodoc", "Builds the vertex addressed by [agenv,adirv], with its geometric part, but without subcomponents.

Parameters
----------
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyVertex;
		virtual TopoDS_Shape MakeEmptyVertex(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****************** Process ******************/
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "Function called to analize the way of construction of the shapes generated by agens and adirv.

Parameters
----------
aGenS: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
bool
") Process;
		Standard_Boolean Process(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirV);

		/****************** SeparatedWires ******************/
		%feature("compactdefaultargs") SeparatedWires;
		%feature("autodoc", "In some particular cases the topology of a generated face must be composed of independant closed wires, in this case this function returns true.

Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
bool
") SeparatedWires;
		virtual Standard_Boolean SeparatedWires(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "Called to propagate the continuity of every vertex between two edges of the generating wire agens on the generated edge and faces.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
None
") SetContinuity;
		void SetContinuity(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** SetDirectingPCurve ******************/
		%feature("compactdefaultargs") SetDirectingPCurve;
		%feature("autodoc", "Sets the pcurve for a new edge on a new face. the new edge and the new face were generated using agene, adire and agenv.

Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
orien: TopAbs_Orientation

Returns
-------
None
") SetDirectingPCurve;
		virtual void SetDirectingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const TopAbs_Orientation orien);

		/****************** SetDirectingParameter ******************/
		%feature("compactdefaultargs") SetDirectingParameter;
		%feature("autodoc", "Sets the parameter of the new vertex on the new edge. the new edge and new vertex where generated from agenv adire, and adirv.

Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape

Returns
-------
None
") SetDirectingParameter;
		virtual void SetDirectingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV);

		/****************** SetGeneratingPCurve ******************/
		%feature("compactdefaultargs") SetGeneratingPCurve;
		%feature("autodoc", "Sets the pcurve for a new edge on a new face. the new edge and the new face were generated using agene, adire and adirv.

Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Returns
-------
None
") SetGeneratingPCurve;
		virtual void SetGeneratingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****************** SetGeneratingParameter ******************/
		%feature("compactdefaultargs") SetGeneratingParameter;
		%feature("autodoc", "Sets the parameter of the new vertex on the new edge. the new edge and new vertex where generated from agene, agenv and adirv .

Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
None
") SetGeneratingParameter;
		virtual void SetGeneratingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****************** SetPCurve ******************/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "Sets the pcurve for a new edge on a new face. the new edge and the new face were generated using agenf, agene and adirv.

Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenF: TopoDS_Shape
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Returns
-------
None
") SetPCurve;
		virtual void SetPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Sets the parameters of the new vertex on the new face. the new face and new vertex where generated from agenf, agenv and adirv .

Parameters
----------
aNewFace: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenF: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
None
") SetParameters;
		virtual void SetParameters(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

};


%extend BRepSweep_Trsf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepSweep_Rotation *
***************************/
class BRepSweep_Rotation : public BRepSweep_Trsf {
	public:
		/****************** BRepSweep_Rotation ******************/
		%feature("compactdefaultargs") BRepSweep_Rotation;
		%feature("autodoc", "Creates a topology by rotating <s> around a with the angle d.

Parameters
----------
S: TopoDS_Shape
N: Sweep_NumShape
L: TopLoc_Location
A: gp_Ax1
D: float
C: bool

Returns
-------
None
") BRepSweep_Rotation;
		 BRepSweep_Rotation(const TopoDS_Shape & S, const Sweep_NumShape & N, const TopLoc_Location & L, const gp_Ax1 & A, const Standard_Real D, const Standard_Boolean C);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the angle.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Axe ******************/
		%feature("compactdefaultargs") Axe;
		%feature("autodoc", "Returns the axis.

Returns
-------
gp_Ax1
") Axe;
		gp_Ax1 Axe();

		/****************** DirectSolid ******************/
		%feature("compactdefaultargs") DirectSolid;
		%feature("autodoc", "Returns the orientation of the shell in the solid generated by the face agens with the edge adirs. it is reversed if the surface is swept in the direction of the normal.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
TopAbs_Orientation
") DirectSolid;
		TopAbs_Orientation DirectSolid(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** GDDShapeIsToAdd ******************/
		%feature("compactdefaultargs") GDDShapeIsToAdd;
		%feature("autodoc", "Returns true if anewsubshape (addressed by agens and asubdirs) must be added in anewshape (addressed by agens and adirs).

Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape
aSubDirS: Sweep_NumShape

Returns
-------
bool
") GDDShapeIsToAdd;
		Standard_Boolean GDDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS, const Sweep_NumShape & aSubDirS);

		/****************** GGDShapeIsToAdd ******************/
		%feature("compactdefaultargs") GGDShapeIsToAdd;
		%feature("autodoc", "Returns true if anewsubshape (addressed by asubgens and adirs) must be added in anewshape (addressed by agens and adirs).

Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
bool
") GGDShapeIsToAdd;
		Standard_Boolean GGDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****************** HasShape ******************/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "Returns true if adirs and agens addresses a resulting shape. in some specific cases the shape can be geometrically inexsistant, then this function returns false.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
bool
") HasShape;
		Standard_Boolean HasShape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** IsInvariant ******************/
		%feature("compactdefaultargs") IsInvariant;
		%feature("autodoc", "Returns true when the geometry of agens is not modified by the rotation.

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
bool
") IsInvariant;
		Standard_Boolean IsInvariant(const TopoDS_Shape & aGenS);

		/****************** MakeEmptyDirectingEdge ******************/
		%feature("compactdefaultargs") MakeEmptyDirectingEdge;
		%feature("autodoc", "Builds the edge addressed by [agenv,adire], with its geometric part, but without subcomponents.

Parameters
----------
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyDirectingEdge;
		TopoDS_Shape MakeEmptyDirectingEdge(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE);

		/****************** MakeEmptyFace ******************/
		%feature("compactdefaultargs") MakeEmptyFace;
		%feature("autodoc", "Builds the face addressed by [agens,adirs], with its geometric part, but without subcomponents. the couple agens, adirs can be a 'generating face and a directing vertex' or 'a generating edge and a directing edge'.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyFace;
		TopoDS_Shape MakeEmptyFace(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** MakeEmptyGeneratingEdge ******************/
		%feature("compactdefaultargs") MakeEmptyGeneratingEdge;
		%feature("autodoc", "Builds the edge addressed by [agene,adirv], with its geometric part, but without subcomponents.

Parameters
----------
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyGeneratingEdge;
		TopoDS_Shape MakeEmptyGeneratingEdge(const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV);

		/****************** MakeEmptyVertex ******************/
		%feature("compactdefaultargs") MakeEmptyVertex;
		%feature("autodoc", "Builds the vertex addressed by [agenv,adirv], with its geometric part, but without subcomponents.

Parameters
----------
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyVertex;
		TopoDS_Shape MakeEmptyVertex(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****************** SeparatedWires ******************/
		%feature("compactdefaultargs") SeparatedWires;
		%feature("autodoc", "In some particular cases the topology of a generated face must be composed of independant closed wires, in this case this function returns true. the only case in whitch the function may return true is a planar face in a closed revol.

Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
bool
") SeparatedWires;
		Standard_Boolean SeparatedWires(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****************** SetDirectingPCurve ******************/
		%feature("compactdefaultargs") SetDirectingPCurve;
		%feature("autodoc", "Sets the pcurve for a new edge on a new face. the new edge and the new face were generated using agene, adire and agenv.

Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
orien: TopAbs_Orientation

Returns
-------
None
") SetDirectingPCurve;
		void SetDirectingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const TopAbs_Orientation orien);

		/****************** SetDirectingParameter ******************/
		%feature("compactdefaultargs") SetDirectingParameter;
		%feature("autodoc", "Sets the parameter of the new vertex on the new edge. the new edge and new vertex where generated from agenv adire, and adirv.

Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape

Returns
-------
None
") SetDirectingParameter;
		void SetDirectingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV);

		/****************** SetGeneratingPCurve ******************/
		%feature("compactdefaultargs") SetGeneratingPCurve;
		%feature("autodoc", "Sets the pcurve for a new edge on a new face. the new edge and the new face were generated using agene, adire and adirv.

Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Returns
-------
None
") SetGeneratingPCurve;
		void SetGeneratingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****************** SetGeneratingParameter ******************/
		%feature("compactdefaultargs") SetGeneratingParameter;
		%feature("autodoc", "Sets the parameter of the new vertex on the new edge. the new edge and new vertex where generated from agene, agenv and adirv .

Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
None
") SetGeneratingParameter;
		void SetGeneratingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****************** SetPCurve ******************/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "Sets the pcurve for a new edge on a new face. the new edge and the new face were generated using agenf, agene and adirv.

Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenF: TopoDS_Shape
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Returns
-------
None
") SetPCurve;
		void SetPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Sets the parameters of the new vertex on the new face. the new face and new vertex where generated from agenf, agenv and adirv .

Parameters
----------
aNewFace: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenF: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
None
") SetParameters;
		void SetParameters(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****************** SplitShell ******************/
		%feature("compactdefaultargs") SplitShell;
		%feature("autodoc", "In some particular cases the topology of a generated shell must be composed of independant closed shells, in this case this function returns a compound of independant shells.

Parameters
----------
aNewShape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") SplitShell;
		virtual TopoDS_Shape SplitShell(const TopoDS_Shape & aNewShape);

};


%extend BRepSweep_Rotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepSweep_Translation *
******************************/
class BRepSweep_Translation : public BRepSweep_Trsf {
	public:
		/****************** BRepSweep_Translation ******************/
		%feature("compactdefaultargs") BRepSweep_Translation;
		%feature("autodoc", "Creates a topology by translating <s> with the vector <v>. if c is true s sucomponents are copied. if canonize is true then generated surfaces are attempted to be canonized in simple types.

Parameters
----------
S: TopoDS_Shape
N: Sweep_NumShape
L: TopLoc_Location
V: gp_Vec
C: bool
Canonize: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepSweep_Translation;
		 BRepSweep_Translation(const TopoDS_Shape & S, const Sweep_NumShape & N, const TopLoc_Location & L, const gp_Vec & V, const Standard_Boolean C, const Standard_Boolean Canonize = Standard_True);

		/****************** DirectSolid ******************/
		%feature("compactdefaultargs") DirectSolid;
		%feature("autodoc", "Returns the orientation of the shell in the solid generated by the face agens with the edge adirs. it is reversed if the surface is swept in the direction of the normal.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
TopAbs_Orientation
") DirectSolid;
		TopAbs_Orientation DirectSolid(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** GDDShapeIsToAdd ******************/
		%feature("compactdefaultargs") GDDShapeIsToAdd;
		%feature("autodoc", "Returns true if anewsubshape (addressed by agens and asubdirs) must be added in anewshape (addressed by agens and adirs).

Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape
aSubDirS: Sweep_NumShape

Returns
-------
bool
") GDDShapeIsToAdd;
		Standard_Boolean GDDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS, const Sweep_NumShape & aSubDirS);

		/****************** GGDShapeIsToAdd ******************/
		%feature("compactdefaultargs") GGDShapeIsToAdd;
		%feature("autodoc", "Returns true if anewsubshape (addressed by asubgens and adirs) must be added in anewshape (addressed by agens and adirs).

Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
bool
") GGDShapeIsToAdd;
		Standard_Boolean GGDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****************** HasShape ******************/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "Returns true if adirs and agens addresses a resulting shape. in some specific cases the shape can be geometrically inexsistant, then this function returns false.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
bool
") HasShape;
		Standard_Boolean HasShape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** IsInvariant ******************/
		%feature("compactdefaultargs") IsInvariant;
		%feature("autodoc", "Returns always false because here the transformation is a translation.

Parameters
----------
aGenS: TopoDS_Shape

Returns
-------
bool
") IsInvariant;
		Standard_Boolean IsInvariant(const TopoDS_Shape & aGenS);

		/****************** MakeEmptyDirectingEdge ******************/
		%feature("compactdefaultargs") MakeEmptyDirectingEdge;
		%feature("autodoc", "Builds the edge addressed by [agenv,adire], with its geometric part, but without subcomponents.

Parameters
----------
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyDirectingEdge;
		TopoDS_Shape MakeEmptyDirectingEdge(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE);

		/****************** MakeEmptyFace ******************/
		%feature("compactdefaultargs") MakeEmptyFace;
		%feature("autodoc", "Builds the face addressed by [agens,adirs], with its geometric part, but without subcomponents. the couple agens, adirs can be a 'generating face and a directing vertex' or 'a generating edge and a directing edge'.

Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyFace;
		TopoDS_Shape MakeEmptyFace(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****************** MakeEmptyGeneratingEdge ******************/
		%feature("compactdefaultargs") MakeEmptyGeneratingEdge;
		%feature("autodoc", "Builds the edge addressed by [agene,adirv], with its geometric part, but without subcomponents.

Parameters
----------
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyGeneratingEdge;
		TopoDS_Shape MakeEmptyGeneratingEdge(const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV);

		/****************** MakeEmptyVertex ******************/
		%feature("compactdefaultargs") MakeEmptyVertex;
		%feature("autodoc", "Builds the vertex addressed by [agenv,adirv], with its geometric part, but without subcomponents.

Parameters
----------
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
TopoDS_Shape
") MakeEmptyVertex;
		TopoDS_Shape MakeEmptyVertex(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****************** SeparatedWires ******************/
		%feature("compactdefaultargs") SeparatedWires;
		%feature("autodoc", "In some particular cases the topology of a generated face must be composed of independant closed wires, in this case this function returns true. here it always returns false.

Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Returns
-------
bool
") SeparatedWires;
		Standard_Boolean SeparatedWires(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****************** SetDirectingPCurve ******************/
		%feature("compactdefaultargs") SetDirectingPCurve;
		%feature("autodoc", "Sets the pcurve for a new edge on a new face. the new edge and the new face were generated using agene, adire and agenv.

Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
orien: TopAbs_Orientation

Returns
-------
None
") SetDirectingPCurve;
		void SetDirectingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const TopAbs_Orientation orien);

		/****************** SetDirectingParameter ******************/
		%feature("compactdefaultargs") SetDirectingParameter;
		%feature("autodoc", "Sets the parameter of the new vertex on the new edge. the new edge and new vertex where generated from agenv adire, and adirv.

Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape

Returns
-------
None
") SetDirectingParameter;
		void SetDirectingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV);

		/****************** SetGeneratingPCurve ******************/
		%feature("compactdefaultargs") SetGeneratingPCurve;
		%feature("autodoc", "Sets the pcurve for a new edge on a new face. the new edge and the new face were generated using agene, adire and adirv.

Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Returns
-------
None
") SetGeneratingPCurve;
		void SetGeneratingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****************** SetGeneratingParameter ******************/
		%feature("compactdefaultargs") SetGeneratingParameter;
		%feature("autodoc", "Sets the parameter of the new vertex on the new edge. the new edge and new vertex where generated from agene, agenv and adirv .

Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
None
") SetGeneratingParameter;
		void SetGeneratingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****************** SetPCurve ******************/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "Sets the pcurve for a new edge on a new face. the new edge and the new face were generated using agenf, agene and adirv.

Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenF: TopoDS_Shape
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Returns
-------
None
") SetPCurve;
		void SetPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Sets the parameters of the new vertex on the new face. the new face and new vertex where generated from agenf, agenv and adirv .

Parameters
----------
aNewFace: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenF: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Returns
-------
None
") SetParameters;
		void SetParameters(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****************** Vec ******************/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "Returns the vector of the prism, if it is an infinite prism the vec is unitar.

Returns
-------
gp_Vec
") Vec;
		gp_Vec Vec();

};


%extend BRepSweep_Translation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
