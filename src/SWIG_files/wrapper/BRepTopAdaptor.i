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
%define BREPTOPADAPTORDOCSTRING
"BRepTopAdaptor module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_breptopadaptor.html"
%enddef
%module (package="OCC.Core", docstring=BREPTOPADAPTORDOCSTRING) BRepTopAdaptor


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
#include<BRepTopAdaptor_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<Adaptor3d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import gp.i
%import TopAbs.i
%import Adaptor3d.i
%import BRepAdaptor.i
%import Adaptor2d.i

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
%wrap_handle(BRepTopAdaptor_HVertex)
%wrap_handle(BRepTopAdaptor_TopolTool)
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<TopoDS_Shape,BRepTopAdaptor_Tool,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,BRepTopAdaptor_Tool,TopTools_ShapeMapHasher>::KeyValues;
%template(BRepTopAdaptor_MapOfShapeTool) NCollection_DataMap<TopoDS_Shape,BRepTopAdaptor_Tool,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher>::Iterator BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool;
typedef NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher> BRepTopAdaptor_MapOfShapeTool;
/* end typedefs declaration */

/********************************
* class BRepTopAdaptor_FClass2d *
********************************/
class BRepTopAdaptor_FClass2d {
	public:
		/****** BRepTopAdaptor_FClass2d::BRepTopAdaptor_FClass2d ******/
		/****** md5 signature: 3fae67e24363d9c60c07304f6a9dc752 ******/
		%feature("compactdefaultargs") BRepTopAdaptor_FClass2d;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") BRepTopAdaptor_FClass2d;
		 BRepTopAdaptor_FClass2d(const TopoDS_Face & F, const double Tol);

		/****** BRepTopAdaptor_FClass2d::Copy ******/
		/****** md5 signature: efc7d008bfae308e21078aca0811254c ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
Other: BRepTopAdaptor_FClass2d

Return
-------
BRepTopAdaptor_FClass2d

Description
-----------
No available documentation.
") Copy;
		const BRepTopAdaptor_FClass2d & Copy(const BRepTopAdaptor_FClass2d & Other);

		/****** BRepTopAdaptor_FClass2d::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Destroy;
		void Destroy();

		/****** BRepTopAdaptor_FClass2d::Perform ******/
		/****** md5 signature: cdb3c5a039795a6fac8973a573e41750 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Puv: gp_Pnt2d
RecadreOnPeriodic: bool (optional, default to true)

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") Perform;
		TopAbs_State Perform(const gp_Pnt2d & Puv, const bool RecadreOnPeriodic = true);

		/****** BRepTopAdaptor_FClass2d::PerformInfinitePoint ******/
		/****** md5 signature: 372e31f938f00ae741d3664c08c086b5 ******/
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
No available documentation.
") PerformInfinitePoint;
		TopAbs_State PerformInfinitePoint();

		/****** BRepTopAdaptor_FClass2d::TestOnRestriction ******/
		/****** md5 signature: 909781cdd20af89cef190ae54ec1dfef ******/
		%feature("compactdefaultargs") TestOnRestriction;
		%feature("autodoc", "
Parameters
----------
Puv: gp_Pnt2d
Tol: double
RecadreOnPeriodic: bool (optional, default to true)

Return
-------
TopAbs_State

Description
-----------
Test a point with +- an offset (Tol) and returns On if some points are OUT an some are IN (Caution: Internal use. see the code for more details).
") TestOnRestriction;
		TopAbs_State TestOnRestriction(const gp_Pnt2d & Puv, const double Tol, const bool RecadreOnPeriodic = true);

};


%extend BRepTopAdaptor_FClass2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepTopAdaptor_HVertex *
*******************************/
class BRepTopAdaptor_HVertex : public Adaptor3d_HVertex {
	public:
		/****** BRepTopAdaptor_HVertex::BRepTopAdaptor_HVertex ******/
		/****** md5 signature: fb5f8882c6434ceec0ae660be4e57a44 ******/
		%feature("compactdefaultargs") BRepTopAdaptor_HVertex;
		%feature("autodoc", "
Parameters
----------
Vtx: TopoDS_Vertex
Curve: BRepAdaptor_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") BRepTopAdaptor_HVertex;
		 BRepTopAdaptor_HVertex(const TopoDS_Vertex & Vtx, const opencascade::handle<BRepAdaptor_Curve2d> & Curve);

		/****** BRepTopAdaptor_HVertex::ChangeVertex ******/
		/****** md5 signature: d024b91a23e89f21ebe612259435c2f1 ******/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") ChangeVertex;
		TopoDS_Vertex ChangeVertex();

		/****** BRepTopAdaptor_HVertex::IsSame ******/
		/****** md5 signature: 3ee98016ddacc9e25865a0ea02a4751d ******/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "
Parameters
----------
Other: Adaptor3d_HVertex

Return
-------
bool

Description
-----------
No available documentation.
") IsSame;
		bool IsSame(const opencascade::handle<Adaptor3d_HVertex> & Other);

		/****** BRepTopAdaptor_HVertex::Orientation ******/
		/****** md5 signature: 2fa987db5a1c189d78c582e106bac418 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** BRepTopAdaptor_HVertex::Parameter ******/
		/****** md5 signature: a2d44357a37b162d08eb8cc561009af7 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** BRepTopAdaptor_HVertex::Resolution ******/
		/****** md5 signature: 25f32e257ea6aff2e2171cd59aa729df ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
Parametric resolution (2d).
") Resolution;
		double Resolution(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** BRepTopAdaptor_HVertex::Value ******/
		/****** md5 signature: 34d316b542c8df085bfe5a9385388368 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		gp_Pnt2d Value();

		/****** BRepTopAdaptor_HVertex::Vertex ******/
		/****** md5 signature: f6b9d30df043abdbae2c9dffcc672395 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		const TopoDS_Vertex Vertex();

};


%make_alias(BRepTopAdaptor_HVertex)

%extend BRepTopAdaptor_HVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepTopAdaptor_Tool *
****************************/
class BRepTopAdaptor_Tool {
	public:
		/****** BRepTopAdaptor_Tool::BRepTopAdaptor_Tool ******/
		/****** md5 signature: e6b2a6be90b6ee74514e96d96a5af8e3 ******/
		%feature("compactdefaultargs") BRepTopAdaptor_Tool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool();

		/****** BRepTopAdaptor_Tool::BRepTopAdaptor_Tool ******/
		/****** md5 signature: 99db79d982fc887139cf620b7a339451 ******/
		%feature("compactdefaultargs") BRepTopAdaptor_Tool;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Tol2d: double

Return
-------
None

Description
-----------
No available documentation.
") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool(const TopoDS_Face & F, const double Tol2d);

		/****** BRepTopAdaptor_Tool::BRepTopAdaptor_Tool ******/
		/****** md5 signature: 037b1fa0230726f1609974324d2a61a3 ******/
		%feature("compactdefaultargs") BRepTopAdaptor_Tool;
		%feature("autodoc", "
Parameters
----------
Surface: Adaptor3d_Surface
Tol2d: double

Return
-------
None

Description
-----------
No available documentation.
") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool(const opencascade::handle<Adaptor3d_Surface> & Surface, const double Tol2d);

		/****** BRepTopAdaptor_Tool::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Destroy;
		void Destroy();

		/****** BRepTopAdaptor_Tool::GetSurface ******/
		/****** md5 signature: afbd71c808e80f77f5a76ef64e3237a1 ******/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") GetSurface;
		opencascade::handle<Adaptor3d_Surface> GetSurface();

		/****** BRepTopAdaptor_Tool::GetTopolTool ******/
		/****** md5 signature: ff64aa4100d21790bf932c85946a7eac ******/
		%feature("compactdefaultargs") GetTopolTool;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepTopAdaptor_TopolTool>

Description
-----------
No available documentation.
") GetTopolTool;
		opencascade::handle<BRepTopAdaptor_TopolTool> GetTopolTool();

		/****** BRepTopAdaptor_Tool::Init ******/
		/****** md5 signature: ed522c3b9d79e364670b96af361b66a6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Tol2d: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Face & F, const double Tol2d);

		/****** BRepTopAdaptor_Tool::Init ******/
		/****** md5 signature: d9dcf14aabfe7b38c9e71a68f8528da8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Surface: Adaptor3d_Surface
Tol2d: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Adaptor3d_Surface> & Surface, const double Tol2d);

		/****** BRepTopAdaptor_Tool::SetTopolTool ******/
		/****** md5 signature: 3bffbb5885a2ed968b12bd808603632f ******/
		%feature("compactdefaultargs") SetTopolTool;
		%feature("autodoc", "
Parameters
----------
TT: BRepTopAdaptor_TopolTool

Return
-------
None

Description
-----------
No available documentation.
") SetTopolTool;
		void SetTopolTool(const opencascade::handle<BRepTopAdaptor_TopolTool> & TT);

};


%extend BRepTopAdaptor_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepTopAdaptor_TopolTool *
*********************************/
class BRepTopAdaptor_TopolTool : public Adaptor3d_TopolTool {
	public:
		/****** BRepTopAdaptor_TopolTool::BRepTopAdaptor_TopolTool ******/
		/****** md5 signature: 41ec4c16be305a9785129796032fadeb ******/
		%feature("compactdefaultargs") BRepTopAdaptor_TopolTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepTopAdaptor_TopolTool;
		 BRepTopAdaptor_TopolTool();

		/****** BRepTopAdaptor_TopolTool::BRepTopAdaptor_TopolTool ******/
		/****** md5 signature: 891cbde0b65f09eb06f8b982bf4b268b ******/
		%feature("compactdefaultargs") BRepTopAdaptor_TopolTool;
		%feature("autodoc", "
Parameters
----------
Surface: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") BRepTopAdaptor_TopolTool;
		 BRepTopAdaptor_TopolTool(const opencascade::handle<Adaptor3d_Surface> & Surface);

		/****** BRepTopAdaptor_TopolTool::Classify ******/
		/****** md5 signature: 55c350b6e08b6ac62bf53f212a45e34c ******/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "
Parameters
----------
P2d: gp_Pnt2d
Tol: double
RecadreOnPeriodic: bool (optional, default to true)

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") Classify;
		TopAbs_State Classify(const gp_Pnt2d & P2d, const double Tol, const bool RecadreOnPeriodic = true);

		/****** BRepTopAdaptor_TopolTool::ComputeSamplePoints ******/
		/****** md5 signature: 1fa105aa64ba9bca92e753c7f09817c9 ******/
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ComputeSamplePoints;
		void ComputeSamplePoints();

		/****** BRepTopAdaptor_TopolTool::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Destroy;
		void Destroy();

		/****** BRepTopAdaptor_TopolTool::DomainIsInfinite ******/
		/****** md5 signature: 9bcb7e376667381af854747a59061834 ******/
		%feature("compactdefaultargs") DomainIsInfinite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") DomainIsInfinite;
		bool DomainIsInfinite();

		/****** BRepTopAdaptor_TopolTool::Edge ******/
		/****** md5 signature: 4be84cbbce9a45facacd149b9c714293 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
void *

Description
-----------
No available documentation.
") Edge;
		void * Edge();

		/****** BRepTopAdaptor_TopolTool::Has3d ******/
		/****** md5 signature: 1893db2877a337c8a9454e9ec0e07c39 ******/
		%feature("compactdefaultargs") Has3d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
answers if arcs and vertices may have 3d representations, so that we could use Tol3d and Pnt methods.
") Has3d;
		bool Has3d();

		/****** BRepTopAdaptor_TopolTool::Init ******/
		/****** md5 signature: c6dbf0d99d706ac50fb0b6c62ce47ad1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** BRepTopAdaptor_TopolTool::InitVertexIterator ******/
		/****** md5 signature: c67a916df1e4a1c1a9824bc4b18ada47 ******/
		%feature("compactdefaultargs") InitVertexIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitVertexIterator;
		void InitVertexIterator();

		/****** BRepTopAdaptor_TopolTool::Initialize ******/
		/****** md5 signature: 5f193f51f8e20831a5bbcf374ee967ad ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize();

		/****** BRepTopAdaptor_TopolTool::Initialize ******/
		/****** md5 signature: 9816d1f77afc629fc78b8597916117a7 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** BRepTopAdaptor_TopolTool::Initialize ******/
		/****** md5 signature: 11b83b45b0e08285332869daeaa8f49c ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const opencascade::handle<Adaptor2d_Curve2d> & Curve);

		/****** BRepTopAdaptor_TopolTool::IsThePointOn ******/
		/****** md5 signature: b1284cc729b004f9a3c7dfe3c24fd02b ******/
		%feature("compactdefaultargs") IsThePointOn;
		%feature("autodoc", "
Parameters
----------
P2d: gp_Pnt2d
Tol: double
RecadreOnPeriodic: bool (optional, default to true)

Return
-------
bool

Description
-----------
see the code for specifications).
") IsThePointOn;
		bool IsThePointOn(const gp_Pnt2d & P2d, const double Tol, const bool RecadreOnPeriodic = true);

		/****** BRepTopAdaptor_TopolTool::More ******/
		/****** md5 signature: 0e8ffada362265379ac9c707dc04b7fe ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		bool More();

		/****** BRepTopAdaptor_TopolTool::MoreVertex ******/
		/****** md5 signature: 2a2e4d2af43180c20a1897fe2f1fd41b ******/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreVertex;
		bool MoreVertex();

		/****** BRepTopAdaptor_TopolTool::NbSamples ******/
		/****** md5 signature: 46d1b96e57bb8811cdba7e702a282a06 ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
compute the sample-points for the intersections algorithms.
") NbSamples;
		int NbSamples();

		/****** BRepTopAdaptor_TopolTool::NbSamplesU ******/
		/****** md5 signature: 35d7ce0d38afcaacbe9a2e5dc3334537 ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "Return
-------
int

Description
-----------
compute the sample-points for the intersections algorithms.
") NbSamplesU;
		int NbSamplesU();

		/****** BRepTopAdaptor_TopolTool::NbSamplesV ******/
		/****** md5 signature: 480adcf30874bc7740b0cf4cb0985056 ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "Return
-------
int

Description
-----------
compute the sample-points for the intersections algorithms.
") NbSamplesV;
		int NbSamplesV();

		/****** BRepTopAdaptor_TopolTool::Next ******/
		/****** md5 signature: ae2056cc0c58ac4479c643a77ecf6a1e ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** BRepTopAdaptor_TopolTool::NextVertex ******/
		/****** md5 signature: 62fac1544b9c03af53d3598d2b742295 ******/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextVertex;
		void NextVertex();

		/****** BRepTopAdaptor_TopolTool::Orientation ******/
		/****** md5 signature: b928cca53eb713074009ae83b52cd2a4 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
TopAbs_Orientation

Description
-----------
If the function returns the orientation of the arc. If the orientation is FORWARD or REVERSED, the arc is a 'real' limit of the surface. If the orientation is INTERNAL or EXTERNAL, the arc is considered as an arc on the surface.
") Orientation;
		TopAbs_Orientation Orientation(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** BRepTopAdaptor_TopolTool::Orientation ******/
		/****** md5 signature: d7faffcaf81acc70893394ccf242867f ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_HVertex

Return
-------
TopAbs_Orientation

Description
-----------
If the function returns the orientation of the arc. If the orientation is FORWARD or REVERSED, the arc is a 'real' limit of the surface. If the orientation is INTERNAL or EXTERNAL, the arc is considered as an arc on the surface.
") Orientation;
		TopAbs_Orientation Orientation(const opencascade::handle<Adaptor3d_HVertex> & C);

		/****** BRepTopAdaptor_TopolTool::Pnt ******/
		/****** md5 signature: ccd5842b2e3f05020816e48b44fca11d ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex

Return
-------
gp_Pnt

Description
-----------
returns 3d point of the vertex V.
") Pnt;
		gp_Pnt Pnt(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****** BRepTopAdaptor_TopolTool::SamplePoint ******/
		/****** md5 signature: 96359df3b40ddced07e0cdd815611111 ******/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "
Parameters
----------
Index: int
P2d: gp_Pnt2d
P3d: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SamplePoint;
		void SamplePoint(const int Index, gp_Pnt2d & P2d, gp_Pnt & P3d);

		/****** BRepTopAdaptor_TopolTool::Tol3d ******/
		/****** md5 signature: a608f1ec58a0a2f23bc650fb6a80e9bf ******/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
returns 3d tolerance of the arc C.
") Tol3d;
		double Tol3d(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** BRepTopAdaptor_TopolTool::Tol3d ******/
		/****** md5 signature: a9f2c1b55a481d79fd38f9920c791b10 ******/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex

Return
-------
double

Description
-----------
returns 3d tolerance of the vertex V.
") Tol3d;
		double Tol3d(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****** BRepTopAdaptor_TopolTool::Value ******/
		/****** md5 signature: 459b24b48553142ae26e933809eec96b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") Value;
		opencascade::handle<Adaptor2d_Curve2d> Value();

		/****** BRepTopAdaptor_TopolTool::Vertex ******/
		/****** md5 signature: 3233158bd82db4b7631ab6c1d0523a21 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_HVertex>

Description
-----------
No available documentation.
") Vertex;
		opencascade::handle<Adaptor3d_HVertex> Vertex();

};


%make_alias(BRepTopAdaptor_TopolTool)

%extend BRepTopAdaptor_TopolTool {
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
