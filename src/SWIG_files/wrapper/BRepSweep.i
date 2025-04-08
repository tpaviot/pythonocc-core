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
%define BREPSWEEPDOCSTRING
"BRepSweep module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_brepsweep.html"
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
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current sub-shape.
") More;
		Standard_Boolean More();

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
		/****** md5 signature: 6964da666f9b5a80bedb32cfb1fdc0ba ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Closed;
		Standard_Boolean Closed();

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
		/****** md5 signature: fe88d75093634a6a9b82af7ecb844883 ******/
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
		virtual Standard_Boolean GDDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS, const Sweep_NumShape & aSubDirS);

		/****** BRepSweep_NumLinearRegularSweep::GGDShapeIsToAdd ******/
		/****** md5 signature: 9fa440fddebdfb679e9340eb82dffc8a ******/
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
		virtual Standard_Boolean GGDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_NumLinearRegularSweep::GenIsUsed ******/
		/****** md5 signature: 2eee5f7a9e572952f4de3dcfe523608a ******/
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
		Standard_Boolean GenIsUsed(const TopoDS_Shape & theS);

		/****** BRepSweep_NumLinearRegularSweep::HasShape ******/
		/****** md5 signature: 20f9af4b351b229b5a6f40f7e751b053 ******/
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
		virtual Standard_Boolean HasShape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_NumLinearRegularSweep::IsInvariant ******/
		/****** md5 signature: 9d05aaff715a168d29ddf032477dee17 ******/
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
		virtual Standard_Boolean IsInvariant(const TopoDS_Shape & aGenS);

		/****** BRepSweep_NumLinearRegularSweep::IsUsed ******/
		/****** md5 signature: 6c55c7bbee1cca89bd9680a50ccdcec0 ******/
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
		Standard_Boolean IsUsed(const TopoDS_Shape & aGenS);

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
		/****** md5 signature: 59729d23b465e6739a88651dce236e8e ******/
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
		virtual Standard_Boolean SeparatedWires(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

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
		/****** md5 signature: 8a50c07b3584cdb6ef78115e1d21e740 ******/
		%feature("compactdefaultargs") BRepSweep_Prism;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
V: gp_Vec
Copy: bool (optional, default to Standard_False)
Canonize: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Builds the prism of base S and vector V. If C is true, S is copied. If Canonize is true then generated surfaces are attempted to be canonized in simple types.
") BRepSweep_Prism;
		 BRepSweep_Prism(const TopoDS_Shape & S, const gp_Vec & V, const Standard_Boolean Copy = Standard_False, const Standard_Boolean Canonize = Standard_True);

		/****** BRepSweep_Prism::BRepSweep_Prism ******/
		/****** md5 signature: 38c094323dc54f925ddebf265609afdc ******/
		%feature("compactdefaultargs") BRepSweep_Prism;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
D: gp_Dir
Inf: bool (optional, default to Standard_True)
Copy: bool (optional, default to Standard_False)
Canonize: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Builds a semi-infinite or an infinite prism of base S. If Copy is true S is copied. If Inf is true the prism is infinite, if Inf is false the prism is infinite in the direction D. If Canonize is true then generated surfaces are attempted to be canonized in simple types.
") BRepSweep_Prism;
		 BRepSweep_Prism(const TopoDS_Shape & S, const gp_Dir & D, const Standard_Boolean Inf = Standard_True, const Standard_Boolean Copy = Standard_False, const Standard_Boolean Canonize = Standard_True);

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
		/****** md5 signature: 2eee5f7a9e572952f4de3dcfe523608a ******/
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
		Standard_Boolean GenIsUsed(const TopoDS_Shape & theS);

		/****** BRepSweep_Prism::IsUsed ******/
		/****** md5 signature: 6c55c7bbee1cca89bd9680a50ccdcec0 ******/
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
		Standard_Boolean IsUsed(const TopoDS_Shape & aGenS);

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
		/****** md5 signature: 8d47a9098cea3ba3286b2b0f0097229c ******/
		%feature("compactdefaultargs") BRepSweep_Revol;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
A: gp_Ax1
D: float
C: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Builds the Revol of meridian S axis A and angle D. If C is true S is copied.
") BRepSweep_Revol;
		 BRepSweep_Revol(const TopoDS_Shape & S, const gp_Ax1 & A, const Standard_Real D, const Standard_Boolean C = Standard_False);

		/****** BRepSweep_Revol::BRepSweep_Revol ******/
		/****** md5 signature: f16f016d2fc715defa64e7bfaa3e89a6 ******/
		%feature("compactdefaultargs") BRepSweep_Revol;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
A: gp_Ax1
C: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Builds the Revol of meridian S axis A and angle 2*Pi. If C is true S is copied.
") BRepSweep_Revol;
		 BRepSweep_Revol(const TopoDS_Shape & S, const gp_Ax1 & A, const Standard_Boolean C = Standard_False);

		/****** BRepSweep_Revol::Angle ******/
		/****** md5 signature: dce50192c350c43b54f2e88e94e5372a ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the angle.
") Angle;
		Standard_Real Angle();

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
		/****** md5 signature: 6c55c7bbee1cca89bd9680a50ccdcec0 ******/
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
		Standard_Boolean IsUsed(const TopoDS_Shape & aGenS);

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
		/****** md5 signature: f2df6704dd6a221c450c874e56f265b1 ******/
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
		Standard_Integer Index(const TopoDS_Shape & aShape);

		/****** BRepSweep_Tool::NbShapes ******/
		/****** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of subshapes in the shape.
") NbShapes;
		Standard_Integer NbShapes();

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
		/****** md5 signature: c1f5f0f58a7a298380121ab4ee711fa5 ******/
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
		TopoDS_Shape Shape(const Standard_Integer anIndex);

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
		/****** md5 signature: fe88d75093634a6a9b82af7ecb844883 ******/
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
		virtual Standard_Boolean GDDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS, const Sweep_NumShape & aSubDirS);

		/****** BRepSweep_Trsf::GGDShapeIsToAdd ******/
		/****** md5 signature: 9fa440fddebdfb679e9340eb82dffc8a ******/
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
		virtual Standard_Boolean GGDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Trsf::HasShape ******/
		/****** md5 signature: 20f9af4b351b229b5a6f40f7e751b053 ******/
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
		virtual Standard_Boolean HasShape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

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
		/****** md5 signature: 9d05aaff715a168d29ddf032477dee17 ******/
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
		virtual Standard_Boolean IsInvariant(const TopoDS_Shape & aGenS);

		/****** BRepSweep_Trsf::MakeEmptyDirectingEdge ******/
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

		/****** BRepSweep_Trsf::MakeEmptyFace ******/
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

		/****** BRepSweep_Trsf::MakeEmptyGeneratingEdge ******/
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

		/****** BRepSweep_Trsf::MakeEmptyVertex ******/
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

		/****** BRepSweep_Trsf::Process ******/
		/****** md5 signature: 5531c3417943534a0975ac67d55763b7 ******/
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
		Standard_Boolean Process(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirV);

		/****** BRepSweep_Trsf::SeparatedWires ******/
		/****** md5 signature: 59729d23b465e6739a88651dce236e8e ******/
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
		virtual Standard_Boolean SeparatedWires(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Trsf::SetContinuity ******/
		/****** md5 signature: 37089da5d56ab940e9d05de1978f2d84 ******/
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

		/****** BRepSweep_Trsf::SetDirectingParameter ******/
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

		/****** BRepSweep_Trsf::SetGeneratingPCurve ******/
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

		/****** BRepSweep_Trsf::SetGeneratingParameter ******/
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

		/****** BRepSweep_Trsf::SetPCurve ******/
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

		/****** BRepSweep_Trsf::SetParameters ******/
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
		/****** md5 signature: e05b8c8ad1e8a545059b8133e5773ece ******/
		%feature("compactdefaultargs") BRepSweep_Rotation;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
N: Sweep_NumShape
L: TopLoc_Location
A: gp_Ax1
D: float
C: bool

Return
-------
None

Description
-----------
Creates a topology by rotating <S> around A with the angle D.
") BRepSweep_Rotation;
		 BRepSweep_Rotation(const TopoDS_Shape & S, const Sweep_NumShape & N, const TopLoc_Location & L, const gp_Ax1 & A, const Standard_Real D, const Standard_Boolean C);

		/****** BRepSweep_Rotation::Angle ******/
		/****** md5 signature: dce50192c350c43b54f2e88e94e5372a ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the angle.
") Angle;
		Standard_Real Angle();

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
		/****** md5 signature: 9cb0ca77deb76ca34b12ea167a341446 ******/
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
		/****** md5 signature: 2cfce7bc408f276129caef6b714b93db ******/
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
		Standard_Boolean GDDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS, const Sweep_NumShape & aSubDirS);

		/****** BRepSweep_Rotation::GGDShapeIsToAdd ******/
		/****** md5 signature: f76ffaf46f9b0140f61fbb7b95e70ed3 ******/
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
		Standard_Boolean GGDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Rotation::HasShape ******/
		/****** md5 signature: 711d609505b211d9a398bccd167235e0 ******/
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
		Standard_Boolean HasShape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Rotation::IsInvariant ******/
		/****** md5 signature: 20d6e3772ed9b3bde1eae17149263c8b ******/
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
		Standard_Boolean IsInvariant(const TopoDS_Shape & aGenS);

		/****** BRepSweep_Rotation::MakeEmptyDirectingEdge ******/
		/****** md5 signature: 0f93e821c4aa02ba0f107ee7052c361e ******/
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
		/****** md5 signature: 98e50f7aa97124fb05b166b09df39c7b ******/
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
		/****** md5 signature: 7f34a55a558b66e59d2526bcd9cc7fac ******/
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
		/****** md5 signature: 4030e180c6a95c0f80633cbf091de2aa ******/
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
		/****** md5 signature: 739dcb9703dcd526a3fe95d4061137b6 ******/
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
		Standard_Boolean SeparatedWires(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Rotation::SetDirectingPCurve ******/
		/****** md5 signature: ac278d087240b35efa4b4e9de80b53ad ******/
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
		/****** md5 signature: ddc02383cd4f7c52eece59495c5ca915 ******/
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
		/****** md5 signature: c76422746bf77e364ca36e17af28e484 ******/
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
		/****** md5 signature: 928b4f6f046054bb6e378769bfeac8a5 ******/
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
		/****** md5 signature: 531017a24828b97a1b79fbd881d93b12 ******/
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
		/****** md5 signature: d358640d733de7983cfbfe868a9e3846 ******/
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
		/****** md5 signature: 04721169aec9020dc4e10a271a4b00bb ******/
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
		/****** md5 signature: 08b25f8206a6f7e202ce4aaea7bc802c ******/
		%feature("compactdefaultargs") BRepSweep_Translation;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
N: Sweep_NumShape
L: TopLoc_Location
V: gp_Vec
C: bool
Canonize: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a topology by translating <S> with the vector <V>. If C is true S Sucomponents are copied. If Canonize is true then generated surfaces are attempted to be canonized in simple types.
") BRepSweep_Translation;
		 BRepSweep_Translation(const TopoDS_Shape & S, const Sweep_NumShape & N, const TopLoc_Location & L, const gp_Vec & V, const Standard_Boolean C, const Standard_Boolean Canonize = Standard_True);

		/****** BRepSweep_Translation::DirectSolid ******/
		/****** md5 signature: 1e98a941ececf830d972fe0e1b051e61 ******/
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
		/****** md5 signature: d9aea4aa9a99d8f03fdb096eceb85a80 ******/
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
		Standard_Boolean GDDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS, const Sweep_NumShape & aSubDirS);

		/****** BRepSweep_Translation::GGDShapeIsToAdd ******/
		/****** md5 signature: 0f2fc383cbd5635177c9320ce4d4fd50 ******/
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
		Standard_Boolean GGDShapeIsToAdd(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Translation::HasShape ******/
		/****** md5 signature: 71a14855721136181f7e601dc52ad930 ******/
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
		Standard_Boolean HasShape(const TopoDS_Shape & aGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Translation::IsInvariant ******/
		/****** md5 signature: 5b066db5fa001b1a153d6adfb0c20a85 ******/
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
		Standard_Boolean IsInvariant(const TopoDS_Shape & aGenS);

		/****** BRepSweep_Translation::MakeEmptyDirectingEdge ******/
		/****** md5 signature: 38849a5c3c2911b325ff114fca85ea2c ******/
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
		/****** md5 signature: 2e9bb3007bfbd0575e1026d1a3f0c6b6 ******/
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
		/****** md5 signature: 036ae7ff9f87f6ad8322cb7cfe2ebf0e ******/
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
		/****** md5 signature: 2cabb10fca2f11e5b6e30693c4008fd6 ******/
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
		/****** md5 signature: 7fc703b1ba19708e5eeebc73a6803fc3 ******/
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
		Standard_Boolean SeparatedWires(const TopoDS_Shape & aNewShape, const TopoDS_Shape & aNewSubShape, const TopoDS_Shape & aGenS, const TopoDS_Shape & aSubGenS, const Sweep_NumShape & aDirS);

		/****** BRepSweep_Translation::SetDirectingPCurve ******/
		/****** md5 signature: bc185c2655e0221d27e7dc24ac617cff ******/
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
		/****** md5 signature: adabbfe5e879c458d04ce866541654c2 ******/
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
		/****** md5 signature: b2fce02ea5e92edb57d0d16b15cc9a8d ******/
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
		/****** md5 signature: 938b35569af58b948eeb07a2cc3f5de6 ******/
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
		/****** md5 signature: 16fe81d7a5038184bcfd79b186ef48ff ******/
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
		/****** md5 signature: 45a1be1aedcb3aaa7aebb14c04352cb0 ******/
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
