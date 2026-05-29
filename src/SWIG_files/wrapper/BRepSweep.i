/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepsweep.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<Bnd_module.hxx>
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

/* python proxy classes for enums */
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
		/****** BRepSweep_Builder::BRepSweep_Builder ******/
		/****** md5 signature: 274709e738c66b6c8297287d2dbdd267 ******/
		%feature("compactdefaultargs") BRepSweep_Builder;
		%feature("autodoc", "
Parameters
----------
aBuilder: BRep_Builder

Return
-------
None

Description
-----------
Creates a Builder.
") BRepSweep_Builder;
		 BRepSweep_Builder(const BRep_Builder & aBuilder);

		/****** BRepSweep_Builder::Add ******/
		/****** md5 signature: 853b947a69699a3aefa79822e6d7886e ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aShape1: TopoDS_Shape
aShape2: TopoDS_Shape
Orient: TopAbs_Orientation

Return
-------
None

Description
-----------
Adds the Shape 1 in the Shape 2, set to <Orient> orientation.
") Add;
		void Add(TopoDS_Shape & aShape1, const TopoDS_Shape & aShape2, const TopAbs_Orientation Orient);

		/****** BRepSweep_Builder::Add ******/
		/****** md5 signature: 5a02d96d121a4985d5e77bbf93dac451 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aShape1: TopoDS_Shape
aShape2: TopoDS_Shape

Return
-------
None

Description
-----------
Adds the Shape 1 in the Shape 2.
") Add;
		void Add(TopoDS_Shape & aShape1, const TopoDS_Shape & aShape2);

		/****** BRepSweep_Builder::Builder ******/
		/****** md5 signature: 0e400544facfe2a99c354fd61331d22b ******/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "Return
-------
BRep_Builder

Description
-----------
No available documentation.
") Builder;
		const BRep_Builder & Builder();

		/****** BRepSweep_Builder::MakeCompSolid ******/
		/****** md5 signature: 98d01f0958a66b4cec51d5601f9ad814 ******/
		%feature("compactdefaultargs") MakeCompSolid;
		%feature("autodoc", "
Parameters
----------
aCompSolid: TopoDS_Shape

Return
-------
None

Description
-----------
Returns an empty CompSolid.
") MakeCompSolid;
		void MakeCompSolid(TopoDS_Shape & aCompSolid);

		/****** BRepSweep_Builder::MakeCompound ******/
		/****** md5 signature: d61591b80ec926066aa587d807cda4cd ******/
		%feature("compactdefaultargs") MakeCompound;
		%feature("autodoc", "
Parameters
----------
aCompound: TopoDS_Shape

Return
-------
None

Description
-----------
Returns an empty Compound.
") MakeCompound;
		void MakeCompound(TopoDS_Shape & aCompound);

		/****** BRepSweep_Builder::MakeShell ******/
		/****** md5 signature: 3d594e272d58e4c51b7cb39a8ba10649 ******/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "
Parameters
----------
aShell: TopoDS_Shape

Return
-------
None

Description
-----------
Returns an empty Shell.
") MakeShell;
		void MakeShell(TopoDS_Shape & aShell);

		/****** BRepSweep_Builder::MakeSolid ******/
		/****** md5 signature: ccc6f113ddb50253efebfed8a93e3ed1 ******/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "
Parameters
----------
aSolid: TopoDS_Shape

Return
-------
None

Description
-----------
Returns an empty Solid.
") MakeSolid;
		void MakeSolid(TopoDS_Shape & aSolid);

		/****** BRepSweep_Builder::MakeWire ******/
		/****** md5 signature: 6da7d12ff761095e7875653cbdc34e6e ******/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "
Parameters
----------
aWire: TopoDS_Shape

Return
-------
None

Description
-----------
Returns an empty Wire.
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
		/****** BRepSweep_Iterator::BRepSweep_Iterator ******/
		/****** md5 signature: cb18c60510a25a64f1b7dbcb040314a3 ******/
		%feature("compactdefaultargs") BRepSweep_Iterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepSweep_Iterator;
		 BRepSweep_Iterator();

		/****** BRepSweep_Iterator::Init ******/
		/****** md5 signature: 2071f1c35cd5b4cf68ec06a4b4f693d0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
None

Description
-----------
Reset the Iterator on sub-shapes of <aShape>.
") Init;
		void Init(const TopoDS_Shape & aShape);

		/****** BRepSweep_Iterator::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current sub-shape.
") More;
		bool More();

		/****** BRepSweep_Iterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Moves to the next sub-shape.
") Next;
		void Next();

		/****** BRepSweep_Iterator::Orientation ******/
		/****** md5 signature: 328242fe19b1f80489d8169681ebc029 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Returns the orientation of the current sub-shape.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** BRepSweep_Iterator::Value ******/
		/****** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the current sub-shape.
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
		/****** BRepSweep_NumLinearRegularSweep::Closed ******/
		/****** md5 signature: 3af99e52b24f54eb2b999649fc18915a ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Closed;
		bool Closed();

		/****** BRepSweep_NumLinearRegularSweep::DirectSolid ******/
		/****** md5 signature: 467ad4e54890d65522aecc070a205901 ******/
		%feature("compactdefaultargs") DirectSolid;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
TopAbs_Orientation

Description
-----------
Returns the Orientation of the shell in the solid generated by the face aGenS with the edge aDirS. It is REVERSED if the surface is swept in the direction of the normal.
") DirectSolid;
		virtual TopAbs_Orientation DirectSolid(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_NumLinearRegularSweep::FirstShape ******/
		/****** md5 signature: 99e62ccf294eacd7ee50fd33dc8f595f ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the resulting Shape indexed by the first Vertex of myDirWire and myGenShape.
") FirstShape;
		TopoDS_Shape FirstShape();

		/****** BRepSweep_NumLinearRegularSweep::FirstShape ******/
		/****** md5 signature: f884f390411b4843959477d7e09bc663 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the resulting Shape indexed by the first Vertex of myDirWire and aGenS.
") FirstShape;
		TopoDS_Shape FirstShape(const TopoDS_Shape & aGenS);

		/****** BRepSweep_NumLinearRegularSweep::GDDShapeIsToAdd ******/
		/****** md5 signature: 639f5938fdb0411d9fda00ccaab12f27 ******/
		%feature("compactdefaultargs") GDDShapeIsToAdd;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape
aSubDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
Returns true if aNewSubShape (addressed by aGenS and aSubDirS) must be added in aNewShape (addressed by aGenS and aDirS).
") GDDShapeIsToAdd;
		virtual bool GDDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS, const Sweep_NumShape & aSubDirS);

		/****** BRepSweep_NumLinearRegularSweep::GGDShapeIsToAdd ******/
		/****** md5 signature: 90de6523608ede01c87a7907ddcb0b21 ******/
		%feature("compactdefaultargs") GGDShapeIsToAdd;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
Returns true if aNewSubShape (addressed by aSubGenS and aDirS) must be added in aNewShape (addressed by aGenS and aDirS).
") GGDShapeIsToAdd;
		virtual bool GGDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_NumLinearRegularSweep::GenIsUsed ******/
		/****** md5 signature: fd1f0f955c0bd8fc0265a6afa2d4acf6 ******/
		%feature("compactdefaultargs") GenIsUsed;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the shape, generated from theS is used in result shape.
") GenIsUsed;
		bool GenIsUsed(const TopoDS_Shape & theS);

		/****** BRepSweep_NumLinearRegularSweep::HasShape ******/
		/****** md5 signature: b34651fc3cfdd338f3e3fc76b4e1d7ac ******/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
Returns true if aDirS and aGenS addresses a resulting Shape. In some specific cases the shape can be geometrically inexsistant, then this function returns false.
") HasShape;
		virtual bool HasShape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_NumLinearRegularSweep::IsInvariant ******/
		/****** md5 signature: f3d36ed3360c2eae5e8415ba1e0a8dea ******/
		%feature("compactdefaultargs") IsInvariant;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if aGenS cannot be transformed.
") IsInvariant;
		virtual bool IsInvariant(const TopoDS_Shape & aGenS);

		/****** BRepSweep_NumLinearRegularSweep::IsUsed ******/
		/****** md5 signature: 10fa0678b750fea7a9f656dd3aaebc48 ******/
		%feature("compactdefaultargs") IsUsed;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the initial shape aGenS is used in result shape.
") IsUsed;
		bool IsUsed(const TopoDS_Shape & aGenS);

		/****** BRepSweep_NumLinearRegularSweep::LastShape ******/
		/****** md5 signature: 1988f5b4cf413dea813498473161b41a ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the resulting Shape indexed by the last Vertex of myDirWire and myGenShape.
") LastShape;
		TopoDS_Shape LastShape();

		/****** BRepSweep_NumLinearRegularSweep::LastShape ******/
		/****** md5 signature: bb21db1014474497d8ea1beda698051e ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the resulting Shape indexed by the last Vertex of myDirWire and aGenS.
") LastShape;
		TopoDS_Shape LastShape(const TopoDS_Shape & aGenS);

		/****** BRepSweep_NumLinearRegularSweep::MakeEmptyDirectingEdge ******/
		/****** md5 signature: 2aab75cc53737cfb5bfdef4c69ec0563 ******/
		%feature("compactdefaultargs") MakeEmptyDirectingEdge;
		%feature("autodoc", "
Parameters
----------
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the edge addressed by [aGenV,aDirE], with its geometric part, but without subcomponents.
") MakeEmptyDirectingEdge;
		virtual TopoDS_Shape MakeEmptyDirectingEdge(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE);

		/****** BRepSweep_NumLinearRegularSweep::MakeEmptyFace ******/
		/****** md5 signature: 31039ada5c38b16e74d987b5f6927423 ******/
		%feature("compactdefaultargs") MakeEmptyFace;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the face addressed by [aGenS,aDirS], with its geometric part, but without subcomponents. The couple aGenS, aDirS can be a 'generating face and a directing vertex' or 'a generating edge and a directing edge'.
") MakeEmptyFace;
		virtual TopoDS_Shape MakeEmptyFace(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_NumLinearRegularSweep::MakeEmptyGeneratingEdge ******/
		/****** md5 signature: 23e17669af9dbd7ec9fe69968d38e689 ******/
		%feature("compactdefaultargs") MakeEmptyGeneratingEdge;
		%feature("autodoc", "
Parameters
----------
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the edge addressed by [aGenE,aDirV], with its geometric part, but without subcomponents.
") MakeEmptyGeneratingEdge;
		virtual TopoDS_Shape MakeEmptyGeneratingEdge(const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV);

		/****** BRepSweep_NumLinearRegularSweep::MakeEmptyVertex ******/
		/****** md5 signature: 65fb4c43c0fb4fc058233497f0455f67 ******/
		%feature("compactdefaultargs") MakeEmptyVertex;
		%feature("autodoc", "
Parameters
----------
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the vertex addressed by [aGenV,aDirV], with its geometric part, but without subcomponents.
") MakeEmptyVertex;
		virtual TopoDS_Shape MakeEmptyVertex(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****** BRepSweep_NumLinearRegularSweep::SeparatedWires ******/
		/****** md5 signature: ef3382cfa499cdbd95589b711de7194d ******/
		%feature("compactdefaultargs") SeparatedWires;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
In some particular cases the topology of a generated face must be composed of independent closed wires, in this case this function returns true.
") SeparatedWires;
		virtual bool SeparatedWires(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_NumLinearRegularSweep::SetContinuity ******/
		/****** md5 signature: 78a1073d0172ad1dff1fc828f4c35e5b ******/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
None

Description
-----------
Called to propagate the continuity of every vertex between two edges of the generating wire aGenS on the generated edge and faces.
") SetContinuity;
		virtual void SetContinuity(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_NumLinearRegularSweep::SetDirectingPCurve ******/
		/****** md5 signature: b0f97a562d10fef4a186a331be6109f4 ******/
		%feature("compactdefaultargs") SetDirectingPCurve;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
orien: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aGenV.
") SetDirectingPCurve;
		virtual void SetDirectingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const TopAbs_Orientation orien);

		/****** BRepSweep_NumLinearRegularSweep::SetDirectingParameter ******/
		/****** md5 signature: 08b0629c42aaa96e43af7f24cbb9257b ******/
		%feature("compactdefaultargs") SetDirectingParameter;
		%feature("autodoc", "
Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape

Return
-------
None

Description
-----------
Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenV aDirE, and aDirV.
") SetDirectingParameter;
		virtual void SetDirectingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV);

		/****** BRepSweep_NumLinearRegularSweep::SetGeneratingPCurve ******/
		/****** md5 signature: c6bfd0a789cdcef392f507b01f9589ba ******/
		%feature("compactdefaultargs") SetGeneratingPCurve;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aDirV.
") SetGeneratingPCurve;
		virtual void SetGeneratingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****** BRepSweep_NumLinearRegularSweep::SetGeneratingParameter ******/
		/****** md5 signature: 1ae98cd619b9a59c964fca35b3740112 ******/
		%feature("compactdefaultargs") SetGeneratingParameter;
		%feature("autodoc", "
Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
None

Description
-----------
Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenE, aGenV and aDirV .
") SetGeneratingParameter;
		virtual void SetGeneratingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****** BRepSweep_NumLinearRegularSweep::SetPCurve ******/
		/****** md5 signature: c0047c2fbc5572ce3e8faa535000b53b ******/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenF: TopoDS_Shape
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenF, aGenE and aDirV.
") SetPCurve;
		virtual void SetPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****** BRepSweep_NumLinearRegularSweep::SetParameters ******/
		/****** md5 signature: 0f6f4a8a442b075a2da09819fc70d120 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenF: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
None

Description
-----------
Sets the parameters of the new vertex on the new face. The new face and new vertex where generated from aGenF, aGenV and aDirV .
") SetParameters;
		virtual void SetParameters(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****** BRepSweep_NumLinearRegularSweep::Shape ******/
		/****** md5 signature: 14b09f26495a9f89d03f867b59166bc4 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Returns the resulting Shape indexed by aDirS and aGenS.
") Shape;
		TopoDS_Shape Shape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_NumLinearRegularSweep::Shape ******/
		/****** md5 signature: ac4eba69efed3f2b7a40ac4e765b2a2f ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the resulting Shape indexed by myDirWire and aGenS.
") Shape;
		TopoDS_Shape Shape(const TopoDS_Shape & aGenS);

		/****** BRepSweep_NumLinearRegularSweep::Shape ******/
		/****** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the resulting Shape indexed by myDirWire and myGenShape.
") Shape;
		TopoDS_Shape Shape();

		/****** BRepSweep_NumLinearRegularSweep::SplitShell ******/
		/****** md5 signature: 39766b015f1b465ba3b9e5a1bd44c6b6 ******/
		%feature("compactdefaultargs") SplitShell;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
In some particular cases the topology of a generated Shell must be composed of independent closed Shells, in this case this function returns a Compound of independent Shells.
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
		/****** BRepSweep_Prism::BRepSweep_Prism ******/
		/****** md5 signature: adafacd8cfd5dbb2d4c12c16a5551b3a ******/
		%feature("compactdefaultargs") BRepSweep_Prism;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
V: gp_Vec
Copy: bool (optional, default to false)
Canonize: bool (optional, default to true)

Return
-------
None

Description
-----------
Builds the prism of base S and vector V. If C is true, S is copied. If Canonize is true then generated surfaces are attempted to be canonized in simple types.
") BRepSweep_Prism;
		 BRepSweep_Prism(const TopoDS_Shape & S, const gp_Vec & V, const bool Copy = false, const bool Canonize = true);

		/****** BRepSweep_Prism::BRepSweep_Prism ******/
		/****** md5 signature: 821521ad254e99067895d822e55f52bb ******/
		%feature("compactdefaultargs") BRepSweep_Prism;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
D: gp_Dir
Inf: bool (optional, default to true)
Copy: bool (optional, default to false)
Canonize: bool (optional, default to true)

Return
-------
None

Description
-----------
Builds a semi-infinite or an infinite prism of base S. If Copy is true S is copied. If Inf is true the prism is infinite, if Inf is false the prism is infinite in the direction D. If Canonize is true then generated surfaces are attempted to be canonized in simple types.
") BRepSweep_Prism;
		 BRepSweep_Prism(const TopoDS_Shape & S, const gp_Dir & D, const bool Inf = true, const bool Copy = false, const bool Canonize = true);

		/****** BRepSweep_Prism::FirstShape ******/
		/****** md5 signature: 99e62ccf294eacd7ee50fd33dc8f595f ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the bottom of the prism.
") FirstShape;
		TopoDS_Shape FirstShape();

		/****** BRepSweep_Prism::FirstShape ******/
		/****** md5 signature: f884f390411b4843959477d7e09bc663 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the bottom of the prism. generated with aGenS (subShape of the generating shape).
") FirstShape;
		TopoDS_Shape FirstShape(const TopoDS_Shape & aGenS);

		/****** BRepSweep_Prism::GenIsUsed ******/
		/****** md5 signature: fd1f0f955c0bd8fc0265a6afa2d4acf6 ******/
		%feature("compactdefaultargs") GenIsUsed;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the shape, generated from theS is used in result shape.
") GenIsUsed;
		bool GenIsUsed(const TopoDS_Shape & theS);

		/****** BRepSweep_Prism::IsUsed ******/
		/****** md5 signature: 10fa0678b750fea7a9f656dd3aaebc48 ******/
		%feature("compactdefaultargs") IsUsed;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the aGenS is used in resulting shape.
") IsUsed;
		bool IsUsed(const TopoDS_Shape & aGenS);

		/****** BRepSweep_Prism::LastShape ******/
		/****** md5 signature: 1988f5b4cf413dea813498473161b41a ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the top of the prism.
") LastShape;
		TopoDS_Shape LastShape();

		/****** BRepSweep_Prism::LastShape ******/
		/****** md5 signature: bb21db1014474497d8ea1beda698051e ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the top of the prism. generated with aGenS (subShape of the generating shape).
") LastShape;
		TopoDS_Shape LastShape(const TopoDS_Shape & aGenS);

		/****** BRepSweep_Prism::Shape ******/
		/****** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape attached to the prism.
") Shape;
		TopoDS_Shape Shape();

		/****** BRepSweep_Prism::Shape ******/
		/****** md5 signature: ac4eba69efed3f2b7a40ac4e765b2a2f ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape generated with aGenS (subShape of the generating shape).
") Shape;
		TopoDS_Shape Shape(const TopoDS_Shape & aGenS);

		/****** BRepSweep_Prism::Vec ******/
		/****** md5 signature: d672c8e9c451e569ee9745cc73dfec20 ******/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the Vector of the Prism, if it is an infinite prism the Vec is unitar.
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
		/****** BRepSweep_Revol::BRepSweep_Revol ******/
		/****** md5 signature: 2b1ba77a4bad184c5d2a94ef99f9c26d ******/
		%feature("compactdefaultargs") BRepSweep_Revol;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
A: gp_Ax1
D: double
C: bool (optional, default to false)

Return
-------
None

Description
-----------
Builds the Revol of meridian S axis A and angle D. If C is true S is copied.
") BRepSweep_Revol;
		 BRepSweep_Revol(const TopoDS_Shape & S, const gp_Ax1 & A, const double D, const bool C = false);

		/****** BRepSweep_Revol::BRepSweep_Revol ******/
		/****** md5 signature: b6751ee465bd2d98e3d9e04c16619e9a ******/
		%feature("compactdefaultargs") BRepSweep_Revol;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
A: gp_Ax1
C: bool (optional, default to false)

Return
-------
None

Description
-----------
Builds the Revol of meridian S axis A and angle 2*Pi. If C is true S is copied.
") BRepSweep_Revol;
		 BRepSweep_Revol(const TopoDS_Shape & S, const gp_Ax1 & A, const bool C = false);

		/****** BRepSweep_Revol::Angle ******/
		/****** md5 signature: 2b9c11d59a1231fe171f8d4c440fc397 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the angle.
") Angle;
		double Angle();

		/****** BRepSweep_Revol::Axe ******/
		/****** md5 signature: ae9358c470f1ac8b11f3860f80ec2cd7 ******/
		%feature("compactdefaultargs") Axe;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
returns the axis.
") Axe;
		gp_Ax1 Axe();

		/****** BRepSweep_Revol::FirstShape ******/
		/****** md5 signature: 99e62ccf294eacd7ee50fd33dc8f595f ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the first shape of the revol (coinciding with the generating shape).
") FirstShape;
		TopoDS_Shape FirstShape();

		/****** BRepSweep_Revol::FirstShape ******/
		/****** md5 signature: f884f390411b4843959477d7e09bc663 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the first shape of the revol (coinciding with the generating shape).
") FirstShape;
		TopoDS_Shape FirstShape(const TopoDS_Shape & aGenS);

		/****** BRepSweep_Revol::IsUsed ******/
		/****** md5 signature: 10fa0678b750fea7a9f656dd3aaebc48 ******/
		%feature("compactdefaultargs") IsUsed;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the aGenS is used in resulting Shape.
") IsUsed;
		bool IsUsed(const TopoDS_Shape & aGenS);

		/****** BRepSweep_Revol::LastShape ******/
		/****** md5 signature: 1988f5b4cf413dea813498473161b41a ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the top of the prism.
") LastShape;
		TopoDS_Shape LastShape();

		/****** BRepSweep_Revol::LastShape ******/
		/****** md5 signature: bb21db1014474497d8ea1beda698051e ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the top of the prism. generated with aGenS (subShape of the generating shape).
") LastShape;
		TopoDS_Shape LastShape(const TopoDS_Shape & aGenS);

		/****** BRepSweep_Revol::Shape ******/
		/****** md5 signature: 3bc559831c5959191e55bf80cdb0f8f7 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape attached to the Revol.
") Shape;
		TopoDS_Shape Shape();

		/****** BRepSweep_Revol::Shape ******/
		/****** md5 signature: ac4eba69efed3f2b7a40ac4e765b2a2f ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape generated with aGenS (subShape of the generating shape).
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
		/****** BRepSweep_Tool::BRepSweep_Tool ******/
		/****** md5 signature: 420ab6e1827a7c8142a3d86ace7e0fd4 ******/
		%feature("compactdefaultargs") BRepSweep_Tool;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
None

Description
-----------
Initialize the tool with <aShape>. The IndexTool must prepare an indexation for all the subshapes of this shape.
") BRepSweep_Tool;
		 BRepSweep_Tool(const TopoDS_Shape & aShape);

		/****** BRepSweep_Tool::Index ******/
		/****** md5 signature: 2f0d7465ae86ea5f7e124fe93b6c1d97 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
int

Description
-----------
Returns the index of <aShape>.
") Index;
		int Index(const TopoDS_Shape & aShape);

		/****** BRepSweep_Tool::NbShapes ******/
		/****** md5 signature: 5033c6acdebfec4ad702502e01d3601a ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of subshapes in the shape.
") NbShapes;
		int NbShapes();

		/****** BRepSweep_Tool::Orientation ******/
		/****** md5 signature: 3e6195d49fb7b31ece701e3a305e5410 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
TopAbs_Orientation

Description
-----------
Returns the Orientation of <aShape>.
") Orientation;
		TopAbs_Orientation Orientation(const TopoDS_Shape & aShape);

		/****** BRepSweep_Tool::SetOrientation ******/
		/****** md5 signature: 461d54aa9cdec0d7c84b8cf49c3aefb8 ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
Or: TopAbs_Orientation

Return
-------
None

Description
-----------
Set the Orientation of <aShape> with Or.
") SetOrientation;
		void SetOrientation(TopoDS_Shape & aShape, const TopAbs_Orientation Or);

		/****** BRepSweep_Tool::Shape ******/
		/****** md5 signature: ef596fa7b9cc679ae04b4738863ea2eb ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
anIndex: int

Return
-------
TopoDS_Shape

Description
-----------
Returns the Shape at Index anIdex.
") Shape;
		TopoDS_Shape Shape(const int anIndex);

		/****** BRepSweep_Tool::Type ******/
		/****** md5 signature: 2e9c60b86d2e6a35e37e3b8ab7f4ee8d ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns the type of <aShape>.
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
		/****** BRepSweep_Trsf::GDDShapeIsToAdd ******/
		/****** md5 signature: a8103a431d7b89856ea3547ae994e012 ******/
		%feature("compactdefaultargs") GDDShapeIsToAdd;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape
aSubDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
Returns true if aNewSubShape (addressed by aGenS and aSubDirS) must be added in aNewShape (addressed by aGenS and aDirS).
") GDDShapeIsToAdd;
		bool GDDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS, const Sweep_NumShape & aSubDirS);

		/****** BRepSweep_Trsf::GGDShapeIsToAdd ******/
		/****** md5 signature: 84f0c52a97158775b3cb4f837b11c47b ******/
		%feature("compactdefaultargs") GGDShapeIsToAdd;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
Returns true if aNewSubShape (addressed by aSubGenS and aDirS) must be added in aNewShape (addressed by aGenS and aDirS).
") GGDShapeIsToAdd;
		bool GGDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Trsf::HasShape ******/
		/****** md5 signature: 3fde53622fc116227c77c923496b9bd2 ******/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
Returns true if aDirS and aGenS addresses a resulting Shape. In some specific cases the shape can be geometrically inexsistant, then this function returns false.
") HasShape;
		bool HasShape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Trsf::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
ends the construction of the swept primitive calling the virtual geometric functions that can't be called in the initialize.
") Init;
		void Init();

		/****** BRepSweep_Trsf::IsInvariant ******/
		/****** md5 signature: 24121c3ebee1870931c4fb027efb6fe7 ******/
		%feature("compactdefaultargs") IsInvariant;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the geometry of aGenS is not modified by the trsf of the BRepSweep Trsf.
") IsInvariant;
		bool IsInvariant(const TopoDS_Shape & aGenS);

		/****** BRepSweep_Trsf::MakeEmptyDirectingEdge ******/
		/****** md5 signature: 663f258d74c3e6ebcde6402be58b7900 ******/
		%feature("compactdefaultargs") MakeEmptyDirectingEdge;
		%feature("autodoc", "
Parameters
----------
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the edge addressed by [aGenV,aDirE], with its geometric part, but without subcomponents.
") MakeEmptyDirectingEdge;
		TopoDS_Shape MakeEmptyDirectingEdge(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE);

		/****** BRepSweep_Trsf::MakeEmptyFace ******/
		/****** md5 signature: 96e0ba95d4e4b967ef9cfc60f6cebba0 ******/
		%feature("compactdefaultargs") MakeEmptyFace;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the face addressed by [aGenS,aDirS], with its geometric part, but without subcomponents. The couple aGenS, aDirS can be a 'generating face and a directing vertex' or 'a generating edge and a directing edge'.
") MakeEmptyFace;
		TopoDS_Shape MakeEmptyFace(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Trsf::MakeEmptyGeneratingEdge ******/
		/****** md5 signature: d9c6e73a37fc8fe98f6a9e510480030e ******/
		%feature("compactdefaultargs") MakeEmptyGeneratingEdge;
		%feature("autodoc", "
Parameters
----------
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the edge addressed by [aGenE,aDirV], with its geometric part, but without subcomponents.
") MakeEmptyGeneratingEdge;
		TopoDS_Shape MakeEmptyGeneratingEdge(const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Trsf::MakeEmptyVertex ******/
		/****** md5 signature: 462c78ddbd677bbbcc15246413beecc8 ******/
		%feature("compactdefaultargs") MakeEmptyVertex;
		%feature("autodoc", "
Parameters
----------
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the vertex addressed by [aGenV,aDirV], with its geometric part, but without subcomponents.
") MakeEmptyVertex;
		TopoDS_Shape MakeEmptyVertex(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Trsf::Process ******/
		/****** md5 signature: b54c6083207b0304834c0ce8b0ec7a8b ******/
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
bool

Description
-----------
function called to analyze the way of construction of the shapes generated by aGenS and aDirV.
") Process;
		bool Process(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Trsf::SeparatedWires ******/
		/****** md5 signature: f335c1e9042ed6c97cadb2bd63d4bb06 ******/
		%feature("compactdefaultargs") SeparatedWires;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
In some particular cases the topology of a generated face must be composed of independent closed wires, in this case this function returns true.
") SeparatedWires;
		bool SeparatedWires(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Trsf::SetContinuity ******/
		/****** md5 signature: 16834adaedaedc779669b1bb551f3502 ******/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
None

Description
-----------
Called to propagate the continuity of every vertex between two edges of the generating wire aGenS on the generated edge and faces.
") SetContinuity;
		void SetContinuity(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Trsf::SetDirectingPCurve ******/
		/****** md5 signature: bf4d9186f5a7215cb12461678633de02 ******/
		%feature("compactdefaultargs") SetDirectingPCurve;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
orien: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aGenV.
") SetDirectingPCurve;
		void SetDirectingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const TopAbs_Orientation orien);

		/****** BRepSweep_Trsf::SetDirectingParameter ******/
		/****** md5 signature: 259d9dec6c3a93149b0573e4de79fe42 ******/
		%feature("compactdefaultargs") SetDirectingParameter;
		%feature("autodoc", "
Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape

Return
-------
None

Description
-----------
Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenV aDirE, and aDirV.
") SetDirectingParameter;
		void SetDirectingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Trsf::SetGeneratingPCurve ******/
		/****** md5 signature: dcd5041f77513a8594fd41f64a897e69 ******/
		%feature("compactdefaultargs") SetGeneratingPCurve;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aDirV.
") SetGeneratingPCurve;
		void SetGeneratingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****** BRepSweep_Trsf::SetGeneratingParameter ******/
		/****** md5 signature: 84713397c8df071daa9c0f33622e293c ******/
		%feature("compactdefaultargs") SetGeneratingParameter;
		%feature("autodoc", "
Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
None

Description
-----------
Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenE, aGenV and aDirV.
") SetGeneratingParameter;
		void SetGeneratingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Trsf::SetPCurve ******/
		/****** md5 signature: c5401b2e52877ccc88daabe6528ef1a8 ******/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenF: TopoDS_Shape
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenF, aGenE and aDirV.
") SetPCurve;
		void SetPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****** BRepSweep_Trsf::SetParameters ******/
		/****** md5 signature: b41e04d94aebefd31355bde62013ac9c ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenF: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
None

Description
-----------
Sets the parameters of the new vertex on the new face. The new face and new vertex where generated from aGenF, aGenV and aDirV.
") SetParameters;
		void SetParameters(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

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
		/****** BRepSweep_Rotation::BRepSweep_Rotation ******/
		/****** md5 signature: 4727fcc5a4d71c084f259fb6fddaf167 ******/
		%feature("compactdefaultargs") BRepSweep_Rotation;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
N: Sweep_NumShape
L: TopLoc_Location
A: gp_Ax1
D: double
C: bool

Return
-------
None

Description
-----------
Creates a topology by rotating <S> around A with the angle D.
") BRepSweep_Rotation;
		 BRepSweep_Rotation(const TopoDS_Shape & S, const Sweep_NumShape & N, const TopLoc_Location & L, const gp_Ax1 & A, const double D, const bool C);

		/****** BRepSweep_Rotation::Angle ******/
		/****** md5 signature: 2b9c11d59a1231fe171f8d4c440fc397 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the angle.
") Angle;
		double Angle();

		/****** BRepSweep_Rotation::Axe ******/
		/****** md5 signature: ae9358c470f1ac8b11f3860f80ec2cd7 ******/
		%feature("compactdefaultargs") Axe;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
returns the axis.
") Axe;
		gp_Ax1 Axe();

		/****** BRepSweep_Rotation::DirectSolid ******/
		/****** md5 signature: 9fe4419d7348eb29f7af415418ba2595 ******/
		%feature("compactdefaultargs") DirectSolid;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
TopAbs_Orientation

Description
-----------
Returns the Orientation of the shell in the solid generated by the face aGenS with the edge aDirS. It is REVERSED if the surface is swept in the direction of the normal.
") DirectSolid;
		TopAbs_Orientation DirectSolid(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Rotation::GDDShapeIsToAdd ******/
		/****** md5 signature: 302cc23038cbe775e87899dda8f3dbe8 ******/
		%feature("compactdefaultargs") GDDShapeIsToAdd;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape
aSubDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
Returns true if aNewSubShape (addressed by aGenS and aSubDirS) must be added in aNewShape (addressed by aGenS and aDirS).
") GDDShapeIsToAdd;
		bool GDDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS, const Sweep_NumShape & aSubDirS);

		/****** BRepSweep_Rotation::GGDShapeIsToAdd ******/
		/****** md5 signature: eb8ece902aa3fe1b7ad9a7f983ca5bb4 ******/
		%feature("compactdefaultargs") GGDShapeIsToAdd;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
Returns true if aNewSubShape (addressed by aSubGenS and aDirS) must be added in aNewShape (addressed by aGenS and aDirS).
") GGDShapeIsToAdd;
		bool GGDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Rotation::HasShape ******/
		/****** md5 signature: 1e330367c2366d126d8bcec20a65bd90 ******/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
Returns true if aDirS and aGenS addresses a resulting Shape. In some specific cases the shape can be geometrically inexsistant, then this function returns false.
") HasShape;
		bool HasShape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Rotation::IsInvariant ******/
		/****** md5 signature: 671da5e6c0a8bb507971f8b3bf37a714 ******/
		%feature("compactdefaultargs") IsInvariant;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true when the geometry of aGenS is not modified by the rotation.
") IsInvariant;
		bool IsInvariant(const TopoDS_Shape & aGenS);

		/****** BRepSweep_Rotation::MakeEmptyDirectingEdge ******/
		/****** md5 signature: 9ff8ad2d06a9791f1720d0cb720a9579 ******/
		%feature("compactdefaultargs") MakeEmptyDirectingEdge;
		%feature("autodoc", "
Parameters
----------
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the edge addressed by [aGenV,aDirE], with its geometric part, but without subcomponents.
") MakeEmptyDirectingEdge;
		TopoDS_Shape MakeEmptyDirectingEdge(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE);

		/****** BRepSweep_Rotation::MakeEmptyFace ******/
		/****** md5 signature: 57e7905efee919833de51d86de676fcc ******/
		%feature("compactdefaultargs") MakeEmptyFace;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the face addressed by [aGenS,aDirS], with its geometric part, but without subcomponents. The couple aGenS, aDirS can be a 'generating face and a directing vertex' or 'a generating edge and a directing edge'.
") MakeEmptyFace;
		TopoDS_Shape MakeEmptyFace(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Rotation::MakeEmptyGeneratingEdge ******/
		/****** md5 signature: 2d7b7e6cae6a627df92b5db75c420f8d ******/
		%feature("compactdefaultargs") MakeEmptyGeneratingEdge;
		%feature("autodoc", "
Parameters
----------
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the edge addressed by [aGenE,aDirV], with its geometric part, but without subcomponents.
") MakeEmptyGeneratingEdge;
		TopoDS_Shape MakeEmptyGeneratingEdge(const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Rotation::MakeEmptyVertex ******/
		/****** md5 signature: a01c8260727a7ca7999d738ad0bfa7d4 ******/
		%feature("compactdefaultargs") MakeEmptyVertex;
		%feature("autodoc", "
Parameters
----------
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the vertex addressed by [aGenV,aDirV], with its geometric part, but without subcomponents.
") MakeEmptyVertex;
		TopoDS_Shape MakeEmptyVertex(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Rotation::SeparatedWires ******/
		/****** md5 signature: ce3a6748c8b02ec77de20af8912bd9b0 ******/
		%feature("compactdefaultargs") SeparatedWires;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
In some particular cases the topology of a generated face must be composed of independent closed wires, in this case this function returns true. The only case in which the function may return true is a planar face in a closed revol.
") SeparatedWires;
		bool SeparatedWires(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Rotation::SetDirectingPCurve ******/
		/****** md5 signature: 4588632e312aac9ec998bf4642841e00 ******/
		%feature("compactdefaultargs") SetDirectingPCurve;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
orien: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aGenV.
") SetDirectingPCurve;
		void SetDirectingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const TopAbs_Orientation orien);

		/****** BRepSweep_Rotation::SetDirectingParameter ******/
		/****** md5 signature: 80fe67c8b2fe1635fa8c7077f7ff3985 ******/
		%feature("compactdefaultargs") SetDirectingParameter;
		%feature("autodoc", "
Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape

Return
-------
None

Description
-----------
Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenV aDirE, and aDirV.
") SetDirectingParameter;
		void SetDirectingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Rotation::SetGeneratingPCurve ******/
		/****** md5 signature: 3ef923eb92c5b61d74805386fadb49f3 ******/
		%feature("compactdefaultargs") SetGeneratingPCurve;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aDirV.
") SetGeneratingPCurve;
		void SetGeneratingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****** BRepSweep_Rotation::SetGeneratingParameter ******/
		/****** md5 signature: e439298076dffdbe575b9808d1e82385 ******/
		%feature("compactdefaultargs") SetGeneratingParameter;
		%feature("autodoc", "
Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
None

Description
-----------
Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenE, aGenV and aDirV .
") SetGeneratingParameter;
		void SetGeneratingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Rotation::SetPCurve ******/
		/****** md5 signature: d9f42cd537593f47791fb1a0bfee22c3 ******/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenF: TopoDS_Shape
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenF, aGenE and aDirV.
") SetPCurve;
		void SetPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****** BRepSweep_Rotation::SetParameters ******/
		/****** md5 signature: 49aa7b776292994fbfe2868ba4701401 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenF: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
None

Description
-----------
Sets the parameters of the new vertex on the new face. The new face and new vertex where generated from aGenF, aGenV and aDirV .
") SetParameters;
		void SetParameters(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Rotation::SplitShell ******/
		/****** md5 signature: 0373d81de836145d66179921ca82c1ce ******/
		%feature("compactdefaultargs") SplitShell;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
In some particular cases the topology of a generated Shell must be composed of independent closed Shells, in this case this function returns a Compound of independent Shells.
") SplitShell;
		TopoDS_Shape SplitShell(const TopoDS_Shape & aNewShape);

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
		/****** BRepSweep_Translation::BRepSweep_Translation ******/
		/****** md5 signature: b2bea937da30468dece47642ada19084 ******/
		%feature("compactdefaultargs") BRepSweep_Translation;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
N: Sweep_NumShape
L: TopLoc_Location
V: gp_Vec
C: bool
Canonize: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a topology by translating <S> with the vector <V>. If C is true S Sucomponents are copied If Canonize is true then generated surfaces are attempted to be canonized in simple types.
") BRepSweep_Translation;
		 BRepSweep_Translation(const TopoDS_Shape & S, const Sweep_NumShape & N, const TopLoc_Location & L, const gp_Vec & V, const bool C, const bool Canonize = true);

		/****** BRepSweep_Translation::DirectSolid ******/
		/****** md5 signature: 9fe4419d7348eb29f7af415418ba2595 ******/
		%feature("compactdefaultargs") DirectSolid;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
TopAbs_Orientation

Description
-----------
Returns the Orientation of the shell in the solid generated by the face aGenS with the edge aDirS. It is REVERSED if the surface is swept in the direction of the normal.
") DirectSolid;
		TopAbs_Orientation DirectSolid(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Translation::GDDShapeIsToAdd ******/
		/****** md5 signature: 302cc23038cbe775e87899dda8f3dbe8 ******/
		%feature("compactdefaultargs") GDDShapeIsToAdd;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape
aSubDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
Returns true if aNewSubShape (addressed by aGenS and aSubDirS) must be added in aNewShape (addressed by aGenS and aDirS).
") GDDShapeIsToAdd;
		bool GDDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS, const Sweep_NumShape & aSubDirS);

		/****** BRepSweep_Translation::GGDShapeIsToAdd ******/
		/****** md5 signature: eb8ece902aa3fe1b7ad9a7f983ca5bb4 ******/
		%feature("compactdefaultargs") GGDShapeIsToAdd;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
Returns true if aNewSubShape (addressed by aSubGenS and aDirS) must be added in aNewShape (addressed by aGenS and aDirS).
") GGDShapeIsToAdd;
		bool GGDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Translation::HasShape ******/
		/****** md5 signature: 1e330367c2366d126d8bcec20a65bd90 ******/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
Returns true if aDirS and aGenS addresses a resulting Shape. In some specific cases the shape can be geometrically inexsistant, then this function returns false.
") HasShape;
		bool HasShape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Translation::IsInvariant ******/
		/****** md5 signature: 671da5e6c0a8bb507971f8b3bf37a714 ******/
		%feature("compactdefaultargs") IsInvariant;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns always false because here the transformation is a translation.
") IsInvariant;
		bool IsInvariant(const TopoDS_Shape & aGenS);

		/****** BRepSweep_Translation::MakeEmptyDirectingEdge ******/
		/****** md5 signature: 9ff8ad2d06a9791f1720d0cb720a9579 ******/
		%feature("compactdefaultargs") MakeEmptyDirectingEdge;
		%feature("autodoc", "
Parameters
----------
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the edge addressed by [aGenV,aDirE], with its geometric part, but without subcomponents.
") MakeEmptyDirectingEdge;
		TopoDS_Shape MakeEmptyDirectingEdge(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE);

		/****** BRepSweep_Translation::MakeEmptyFace ******/
		/****** md5 signature: 57e7905efee919833de51d86de676fcc ******/
		%feature("compactdefaultargs") MakeEmptyFace;
		%feature("autodoc", "
Parameters
----------
aGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the face addressed by [aGenS,aDirS], with its geometric part, but without subcomponents. The couple aGenS, aDirS can be a 'generating face and a directing vertex' or 'a generating edge and a directing edge'.
") MakeEmptyFace;
		TopoDS_Shape MakeEmptyFace(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Translation::MakeEmptyGeneratingEdge ******/
		/****** md5 signature: 2d7b7e6cae6a627df92b5db75c420f8d ******/
		%feature("compactdefaultargs") MakeEmptyGeneratingEdge;
		%feature("autodoc", "
Parameters
----------
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the edge addressed by [aGenE,aDirV], with its geometric part, but without subcomponents.
") MakeEmptyGeneratingEdge;
		TopoDS_Shape MakeEmptyGeneratingEdge(const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Translation::MakeEmptyVertex ******/
		/****** md5 signature: a01c8260727a7ca7999d738ad0bfa7d4 ******/
		%feature("compactdefaultargs") MakeEmptyVertex;
		%feature("autodoc", "
Parameters
----------
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
TopoDS_Shape

Description
-----------
Builds the vertex addressed by [aGenV,aDirV], with its geometric part, but without subcomponents.
") MakeEmptyVertex;
		TopoDS_Shape MakeEmptyVertex(const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Translation::SeparatedWires ******/
		/****** md5 signature: ce3a6748c8b02ec77de20af8912bd9b0 ******/
		%feature("compactdefaultargs") SeparatedWires;
		%feature("autodoc", "
Parameters
----------
aNewShape: TopoDS_Shape
aNewSubShape: TopoDS_Shape
aGenS: TopoDS_Shape
aSubGenS: TopoDS_Shape
aDirS: Sweep_NumShape

Return
-------
bool

Description
-----------
In some particular cases the topology of a generated face must be composed of independent closed wires, in this case this function returns true. Here it always returns false.
") SeparatedWires;
		bool SeparatedWires(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Translation::SetDirectingPCurve ******/
		/****** md5 signature: 4588632e312aac9ec998bf4642841e00 ******/
		%feature("compactdefaultargs") SetDirectingPCurve;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
orien: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aGenV.
") SetDirectingPCurve;
		void SetDirectingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const TopAbs_Orientation orien);

		/****** BRepSweep_Translation::SetDirectingParameter ******/
		/****** md5 signature: 80fe67c8b2fe1635fa8c7077f7ff3985 ******/
		%feature("compactdefaultargs") SetDirectingParameter;
		%feature("autodoc", "
Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenV: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape

Return
-------
None

Description
-----------
Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenV aDirE, and aDirV.
") SetDirectingParameter;
		void SetDirectingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Translation::SetGeneratingPCurve ******/
		/****** md5 signature: 3ef923eb92c5b61d74805386fadb49f3 ******/
		%feature("compactdefaultargs") SetGeneratingPCurve;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenE: TopoDS_Shape
aDirE: Sweep_NumShape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenE, aDirE and aDirV.
") SetGeneratingPCurve;
		void SetGeneratingPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****** BRepSweep_Translation::SetGeneratingParameter ******/
		/****** md5 signature: e439298076dffdbe575b9808d1e82385 ******/
		%feature("compactdefaultargs") SetGeneratingParameter;
		%feature("autodoc", "
Parameters
----------
aNewEdge: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenE: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
None

Description
-----------
Sets the parameter of the new vertex on the new edge. The new edge and new vertex where generated from aGenE, aGenV and aDirV .
") SetGeneratingParameter;
		void SetGeneratingParameter(const TopoDS_Shape & aNewEdge, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenE, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Translation::SetPCurve ******/
		/****** md5 signature: d9f42cd537593f47791fb1a0bfee22c3 ******/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewEdge: TopoDS_Shape
aGenF: TopoDS_Shape
aGenE: TopoDS_Shape
aDirV: Sweep_NumShape
orien: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the PCurve for a new edge on a new face. The new edge and the new face were generated using aGenF, aGenE and aDirV.
") SetPCurve;
		void SetPCurve(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewEdge, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenE, const Sweep_NumShape & aDirV, const TopAbs_Orientation orien);

		/****** BRepSweep_Translation::SetParameters ******/
		/****** md5 signature: 49aa7b776292994fbfe2868ba4701401 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
aNewFace: TopoDS_Shape
aNewVertex: TopoDS_Shape
aGenF: TopoDS_Shape
aGenV: TopoDS_Shape
aDirV: Sweep_NumShape

Return
-------
None

Description
-----------
Sets the parameters of the new vertex on the new face. The new face and new vertex where generated from aGenF, aGenV and aDirV .
") SetParameters;
		void SetParameters(const TopoDS_Shape & aNewFace, TopoDS_Shape & aNewVertex, const TopoDS_Shape & aGenF, const TopoDS_Shape & aGenV, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Translation::Vec ******/
		/****** md5 signature: d672c8e9c451e569ee9745cc73dfec20 ******/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the Vector of the Prism, if it is an infinite prism the Vec is unitar.
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
/* class aliases */
%pythoncode {
}
