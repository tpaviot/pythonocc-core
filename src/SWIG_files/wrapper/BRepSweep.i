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
from enum import IntEnum
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
		/**** md5 signature: 274709e738c66b6c8297287d2dbdd267 ****/
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
		/**** md5 signature: 853b947a69699a3aefa79822e6d7886e ****/
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
		/**** md5 signature: 5a02d96d121a4985d5e77bbf93dac451 ****/
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
		/**** md5 signature: 0e400544facfe2a99c354fd61331d22b ****/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "No available documentation.

Returns
-------
BRep_Builder
") Builder;
		const BRep_Builder & Builder();

		/****************** MakeCompSolid ******************/
		/**** md5 signature: 98d01f0958a66b4cec51d5601f9ad814 ****/
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
		/**** md5 signature: d61591b80ec926066aa587d807cda4cd ****/
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
		/**** md5 signature: 3d594e272d58e4c51b7cb39a8ba10649 ****/
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
		/**** md5 signature: ccc6f113ddb50253efebfed8a93e3ed1 ****/
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
		/**** md5 signature: 6da7d12ff761095e7875653cbdc34e6e ****/
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
		/**** md5 signature: cb18c60510a25a64f1b7dbcb040314a3 ****/
		%feature("compactdefaultargs") BRepSweep_Iterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepSweep_Iterator;
		 BRepSweep_Iterator();

		/****************** Init ******************/
		/**** md5 signature: 2071f1c35cd5b4cf68ec06a4b4f693d0 ****/
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
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current sub-shape.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Moves to the next sub-shape.

Returns
-------
None
") Next;
		void Next();

		/****************** Orientation ******************/
		/**** md5 signature: 328242fe19b1f80489d8169681ebc029 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation of the current sub-shape.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Value ******************/
		/**** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ****/
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
		/**** md5 signature: 6964da666f9b5a80bedb32cfb1fdc0ba ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Closed;
		Standard_Boolean Closed();

		/****************** DirectSolid ******************/
		/**** md5 signature: 467ad4e54890d65522aecc070a205901 ****/
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
		/**** md5 signature: 99e62ccf294eacd7ee50fd33dc8f595f ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the resulting shape indexed by the first vertex of mydirwire and mygenshape.

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape();

		/****************** FirstShape ******************/
		/**** md5 signature: f884f390411b4843959477d7e09bc663 ****/
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
		/**** md5 signature: fe88d75093634a6a9b82af7ecb844883 ****/
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
		/**** md5 signature: 9fa440fddebdfb679e9340eb82dffc8a ****/
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
		/**** md5 signature: 2eee5f7a9e572952f4de3dcfe523608a ****/
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
		/**** md5 signature: 20f9af4b351b229b5a6f40f7e751b053 ****/
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
		/**** md5 signature: 9d05aaff715a168d29ddf032477dee17 ****/
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
		/**** md5 signature: 6c55c7bbee1cca89bd9680a50ccdcec0 ****/
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
		/**** md5 signature: 1988f5b4cf413dea813498473161b41a ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the resulting shape indexed by the last vertex of mydirwire and mygenshape.

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape();

		/****************** LastShape ******************/
		/**** md5 signature: bb21db1014474497d8ea1beda698051e ****/
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
		/**** md5 signature: 2aab75cc53737cfb5bfdef4c69ec0563 ****/
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
		/**** md5 signature: 31039ada5c38b16e74d987b5f6927423 ****/
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
		/**** md5 signature: 23e17669af9dbd7ec9fe69968d38e689 ****/
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
		/**** md5 signature: 65fb4c43c0fb4fc058233497f0455f67 ****/
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
		/**** md5 signature: 59729d23b465e6739a88651dce236e8e ****/
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
		/**** md5 signature: 78a1073d0172ad1dff1fc828f4c35e5b ****/
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
		/**** md5 signature: b0f97a562d10fef4a186a331be6109f4 ****/
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
		/**** md5 signature: 08b0629c42aaa96e43af7f24cbb9257b ****/
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
		/**** md5 signature: c6bfd0a789cdcef392f507b01f9589ba ****/
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
		/**** md5 signature: 1ae98cd619b9a59c964fca35b3740112 ****/
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
		/**** md5 signature: c0047c2fbc5572ce3e8faa535000b53b ****/
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
		/**** md5 signature: 0f6f4a8a442b075a2da09819fc70d120 ****/
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
		/**** md5 signature: 14b09f26495a9f89d03f867b59166bc4 ****/
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
		/**** md5 signature: ac4eba69efed3f2b7a40ac4e765b2a2f ****/
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
		/**** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the resulting shape indexed by mydirwire and mygenshape.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** SplitShell ******************/
		/**** md5 signature: 39766b015f1b465ba3b9e5a1bd44c6b6 ****/
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
		/**** md5 signature: 8a50c07b3584cdb6ef78115e1d21e740 ****/
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
		/**** md5 signature: 38c094323dc54f925ddebf265609afdc ****/
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
		/**** md5 signature: 99e62ccf294eacd7ee50fd33dc8f595f ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the topods shape of the bottom of the prism.

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape();

		/****************** FirstShape ******************/
		/**** md5 signature: f884f390411b4843959477d7e09bc663 ****/
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
		/**** md5 signature: 2eee5f7a9e572952f4de3dcfe523608a ****/
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
		/**** md5 signature: 6c55c7bbee1cca89bd9680a50ccdcec0 ****/
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
		/**** md5 signature: 1988f5b4cf413dea813498473161b41a ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the top of the prism.

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape();

		/****************** LastShape ******************/
		/**** md5 signature: bb21db1014474497d8ea1beda698051e ****/
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
		/**** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the topods shape attached to the prism.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** Shape ******************/
		/**** md5 signature: ac4eba69efed3f2b7a40ac4e765b2a2f ****/
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
		/**** md5 signature: d672c8e9c451e569ee9745cc73dfec20 ****/
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
		/**** md5 signature: 8d47a9098cea3ba3286b2b0f0097229c ****/
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
		/**** md5 signature: f16f016d2fc715defa64e7bfaa3e89a6 ****/
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
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the angle.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Axe ******************/
		/**** md5 signature: ae9358c470f1ac8b11f3860f80ec2cd7 ****/
		%feature("compactdefaultargs") Axe;
		%feature("autodoc", "Returns the axis.

Returns
-------
gp_Ax1
") Axe;
		gp_Ax1 Axe();

		/****************** FirstShape ******************/
		/**** md5 signature: 99e62ccf294eacd7ee50fd33dc8f595f ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the first shape of the revol (coinciding with the generating shape).

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape();

		/****************** FirstShape ******************/
		/**** md5 signature: f884f390411b4843959477d7e09bc663 ****/
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
		/**** md5 signature: 6c55c7bbee1cca89bd9680a50ccdcec0 ****/
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
		/**** md5 signature: 1988f5b4cf413dea813498473161b41a ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the top of the prism.

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape();

		/****************** LastShape ******************/
		/**** md5 signature: bb21db1014474497d8ea1beda698051e ****/
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
		/**** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the topods shape attached to the revol.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** Shape ******************/
		/**** md5 signature: ac4eba69efed3f2b7a40ac4e765b2a2f ****/
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
		/**** md5 signature: 420ab6e1827a7c8142a3d86ace7e0fd4 ****/
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
		/**** md5 signature: f2df6704dd6a221c450c874e56f265b1 ****/
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
		/**** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ****/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Returns the number of subshapes in the shape.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** Orientation ******************/
		/**** md5 signature: 3e6195d49fb7b31ece701e3a305e5410 ****/
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
		/**** md5 signature: 461d54aa9cdec0d7c84b8cf49c3aefb8 ****/
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
		/**** md5 signature: c1f5f0f58a7a298380121ab4ee711fa5 ****/
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
		/**** md5 signature: 2e9c60b86d2e6a35e37e3b8ab7f4ee8d ****/
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
		/**** md5 signature: fe88d75093634a6a9b82af7ecb844883 ****/
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
		/**** md5 signature: 9fa440fddebdfb679e9340eb82dffc8a ****/
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
		/**** md5 signature: 20f9af4b351b229b5a6f40f7e751b053 ****/
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
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Ends the construction of the swept primitive calling the virtual geometric functions that can't be called in the initialize.

Returns
-------
None
") Init;
		void Init();

		/****************** IsInvariant ******************/
		/**** md5 signature: 9d05aaff715a168d29ddf032477dee17 ****/
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
		/**** md5 signature: 2aab75cc53737cfb5bfdef4c69ec0563 ****/
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
		/**** md5 signature: 31039ada5c38b16e74d987b5f6927423 ****/
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
		/**** md5 signature: 23e17669af9dbd7ec9fe69968d38e689 ****/
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
		/**** md5 signature: 65fb4c43c0fb4fc058233497f0455f67 ****/
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
		/**** md5 signature: 5531c3417943534a0975ac67d55763b7 ****/
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
		/**** md5 signature: 59729d23b465e6739a88651dce236e8e ****/
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
		/**** md5 signature: 37089da5d56ab940e9d05de1978f2d84 ****/
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
		/**** md5 signature: b0f97a562d10fef4a186a331be6109f4 ****/
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
		/**** md5 signature: 08b0629c42aaa96e43af7f24cbb9257b ****/
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
		/**** md5 signature: c6bfd0a789cdcef392f507b01f9589ba ****/
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
		/**** md5 signature: 1ae98cd619b9a59c964fca35b3740112 ****/
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
		/**** md5 signature: c0047c2fbc5572ce3e8faa535000b53b ****/
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
		/**** md5 signature: 0f6f4a8a442b075a2da09819fc70d120 ****/
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
		/**** md5 signature: e05b8c8ad1e8a545059b8133e5773ece ****/
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
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the angle.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Axe ******************/
		/**** md5 signature: ae9358c470f1ac8b11f3860f80ec2cd7 ****/
		%feature("compactdefaultargs") Axe;
		%feature("autodoc", "Returns the axis.

Returns
-------
gp_Ax1
") Axe;
		gp_Ax1 Axe();

		/****************** DirectSolid ******************/
		/**** md5 signature: 9cb0ca77deb76ca34b12ea167a341446 ****/
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
		/**** md5 signature: 2cfce7bc408f276129caef6b714b93db ****/
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
		/**** md5 signature: f76ffaf46f9b0140f61fbb7b95e70ed3 ****/
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
		/**** md5 signature: 711d609505b211d9a398bccd167235e0 ****/
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
		/**** md5 signature: 20d6e3772ed9b3bde1eae17149263c8b ****/
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
		/**** md5 signature: 0f93e821c4aa02ba0f107ee7052c361e ****/
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
		/**** md5 signature: 98e50f7aa97124fb05b166b09df39c7b ****/
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
		/**** md5 signature: 7f34a55a558b66e59d2526bcd9cc7fac ****/
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
		/**** md5 signature: 4030e180c6a95c0f80633cbf091de2aa ****/
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
		/**** md5 signature: 739dcb9703dcd526a3fe95d4061137b6 ****/
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
		/**** md5 signature: ac278d087240b35efa4b4e9de80b53ad ****/
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
		/**** md5 signature: ddc02383cd4f7c52eece59495c5ca915 ****/
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
		/**** md5 signature: c76422746bf77e364ca36e17af28e484 ****/
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
		/**** md5 signature: 928b4f6f046054bb6e378769bfeac8a5 ****/
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
		/**** md5 signature: 531017a24828b97a1b79fbd881d93b12 ****/
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
		/**** md5 signature: d358640d733de7983cfbfe868a9e3846 ****/
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
		/**** md5 signature: 04721169aec9020dc4e10a271a4b00bb ****/
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
		/**** md5 signature: 08b25f8206a6f7e202ce4aaea7bc802c ****/
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
		/**** md5 signature: 1e98a941ececf830d972fe0e1b051e61 ****/
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
		/**** md5 signature: d9aea4aa9a99d8f03fdb096eceb85a80 ****/
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
		/**** md5 signature: 0f2fc383cbd5635177c9320ce4d4fd50 ****/
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
		/**** md5 signature: 71a14855721136181f7e601dc52ad930 ****/
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
		/**** md5 signature: 5b066db5fa001b1a153d6adfb0c20a85 ****/
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
		/**** md5 signature: 38849a5c3c2911b325ff114fca85ea2c ****/
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
		/**** md5 signature: 2e9bb3007bfbd0575e1026d1a3f0c6b6 ****/
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
		/**** md5 signature: 036ae7ff9f87f6ad8322cb7cfe2ebf0e ****/
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
		/**** md5 signature: 2cabb10fca2f11e5b6e30693c4008fd6 ****/
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
		/**** md5 signature: 7fc703b1ba19708e5eeebc73a6803fc3 ****/
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
		/**** md5 signature: bc185c2655e0221d27e7dc24ac617cff ****/
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
		/**** md5 signature: adabbfe5e879c458d04ce866541654c2 ****/
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
		/**** md5 signature: b2fce02ea5e92edb57d0d16b15cc9a8d ****/
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
		/**** md5 signature: 938b35569af58b948eeb07a2cc3f5de6 ****/
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
		/**** md5 signature: 16fe81d7a5038184bcfd79b186ef48ff ****/
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
		/**** md5 signature: 45a1be1aedcb3aaa7aebb14c04352cb0 ****/
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
		/**** md5 signature: d672c8e9c451e569ee9745cc73dfec20 ****/
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
