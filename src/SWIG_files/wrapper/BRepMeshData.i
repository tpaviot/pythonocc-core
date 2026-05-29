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
%define BREPMESHDATADOCSTRING
"BRepMeshData module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepmeshdata.html"
%enddef
%module (package="OCC.Core", docstring=BREPMESHDATADOCSTRING) BRepMeshData


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
#include<BRepMeshData_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IMeshData_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<TopoDS_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IMeshData.i
%import gp.i
%import TopAbs.i
%import TopoDS.i

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
%wrap_handle(BRepMeshData_Curve)
%wrap_handle(BRepMeshData_Edge)
%wrap_handle(BRepMeshData_Face)
%wrap_handle(BRepMeshData_Model)
%wrap_handle(BRepMeshData_PCurve)
%wrap_handle(BRepMeshData_Wire)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************************
* class BRepMeshData_Curve *
***************************/
%nodefaultctor BRepMeshData_Curve;
class BRepMeshData_Curve : public IMeshData_Curve {
	public:
		/****** BRepMeshData_Curve::AddPoint ******/
		/****** md5 signature: cf7d852a1b042ccd6475ee5e1f72b171 ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt
theParamOnCurve: double

Return
-------
None

Description
-----------
Adds new discretization point to pcurve.
") AddPoint;
		void AddPoint(const gp_Pnt & thePoint, const double theParamOnCurve);

		/****** BRepMeshData_Curve::Clear ******/
		/****** md5 signature: ceb34dd2749a7aa7fa2365bb5bc2a010 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
isKeepEndPoints: bool

Return
-------
None

Description
-----------
Clears parameters list.
") Clear;
		void Clear(const bool isKeepEndPoints);

		/****** BRepMeshData_Curve::GetParameter ******/
		/****** md5 signature: 60610898713f2509facd4a2026bd8ee6 ******/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns parameter with the given index.
") GetParameter;
		double & GetParameter(const int theIndex);

		/****** BRepMeshData_Curve::GetPoint ******/
		/****** md5 signature: 20ea33858b5f70008ef7a4aa83a8e98c ******/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt

Description
-----------
Returns discretization point with the given index.
") GetPoint;
		gp_Pnt GetPoint(const int theIndex);

		/****** BRepMeshData_Curve::InsertPoint ******/
		/****** md5 signature: 45b1bed9bb2c45400a684a7f1321ce04 ******/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "
Parameters
----------
thePosition: int
thePoint: gp_Pnt
theParamOnPCurve: double

Return
-------
None

Description
-----------
Inserts new discretization point at the given position.
") InsertPoint;
		void InsertPoint(const int thePosition, const gp_Pnt & thePoint, const double theParamOnPCurve);

		/****** BRepMeshData_Curve::ParametersNb ******/
		/****** md5 signature: 9aba53c4cea655c67c05817f24e589f4 ******/
		%feature("compactdefaultargs") ParametersNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of parameters stored in curve.
") ParametersNb;
		int ParametersNb();

		/****** BRepMeshData_Curve::RemovePoint ******/
		/****** md5 signature: b86669460245a17be990b44a978aea98 ******/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Removes point with the given index.
") RemovePoint;
		void RemovePoint(const int theIndex);

};


%make_alias(BRepMeshData_Curve)

%extend BRepMeshData_Curve {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def B(self):
		pass

	@methodnotwrapped
	def R(self):
		pass

	@methodnotwrapped
	def e(self):
		pass

	@methodnotwrapped
	def p(self):
		pass

	@methodnotwrapped
	def M(self):
		pass

	@methodnotwrapped
	def e(self):
		pass

	@methodnotwrapped
	def s(self):
		pass

	@methodnotwrapped
	def h(self):
		pass

	@methodnotwrapped
	def D(self):
		pass

	@methodnotwrapped
	def a(self):
		pass

	@methodnotwrapped
	def t(self):
		pass

	@methodnotwrapped
	def a(self):
		pass

	@methodnotwrapped
	def _(self):
		pass

	@methodnotwrapped
	def C(self):
		pass

	@methodnotwrapped
	def u(self):
		pass

	@methodnotwrapped
	def r(self):
		pass

	@methodnotwrapped
	def v(self):
		pass

	@methodnotwrapped
	def e(self):
		pass
	}
};

/**************************
* class BRepMeshData_Edge *
**************************/
%nodefaultctor BRepMeshData_Edge;
class BRepMeshData_Edge : public IMeshData_Edge {
	public:
		/****** BRepMeshData_Edge::AddPCurve ******/
		/****** md5 signature: 4f25305764f9aa31a3b39f2fa4f23af2 ******/
		%feature("compactdefaultargs") AddPCurve;
		%feature("autodoc", "
Parameters
----------
theDFace: IMeshData::IFacePtr
theOrientation: TopAbs_Orientation

Return
-------
IMeshData::IPCurveHandle

Description
-----------
Adds discrete pcurve for the specified discrete face.
") AddPCurve;
		IMeshData::IPCurveHandle AddPCurve(const IMeshData::IFacePtr & theDFace, const TopAbs_Orientation theOrientation);

		/****** BRepMeshData_Edge::GetPCurve ******/
		/****** md5 signature: 5c1d0413206cd4d5654e003c35b71367 ******/
		%feature("compactdefaultargs") GetPCurve;
		%feature("autodoc", "
Parameters
----------
theDFace: IMeshData::IFacePtr
theOrientation: TopAbs_Orientation

Return
-------
IMeshData::IPCurveHandle

Description
-----------
Returns pcurve for the specified discrete face.
") GetPCurve;
		IMeshData::IPCurveHandle GetPCurve(const IMeshData::IFacePtr & theDFace, const TopAbs_Orientation theOrientation);

		/****** BRepMeshData_Edge::GetPCurve ******/
		/****** md5 signature: 1354232aceccc51c83298ffa078e48ff ******/
		%feature("compactdefaultargs") GetPCurve;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IMeshData::IPCurveHandle

Description
-----------
Returns pcurve with the given index.
") GetPCurve;
		IMeshData::IPCurveHandle GetPCurve(const int theIndex);

		/****** BRepMeshData_Edge::GetPCurves ******/
		/****** md5 signature: 491c9fe0639e2760c1b01b2974df445b ******/
		%feature("compactdefaultargs") GetPCurves;
		%feature("autodoc", "
Parameters
----------
theDFace: IMeshData::IFacePtr

Return
-------
IMeshData::ListOfInteger

Description
-----------
Returns an array of pcurves indices for the specified discrete face.
") GetPCurves;
		const IMeshData::ListOfInteger & GetPCurves(const IMeshData::IFacePtr & theDFace);

		/****** BRepMeshData_Edge::PCurvesNb ******/
		/****** md5 signature: a3c146d8913221c4d641830d3dc90f1d ******/
		%feature("compactdefaultargs") PCurvesNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of pcurves assigned to current edge.
") PCurvesNb;
		int PCurvesNb();

};


%make_alias(BRepMeshData_Edge)

%extend BRepMeshData_Edge {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def B(self):
		pass

	@methodnotwrapped
	def R(self):
		pass

	@methodnotwrapped
	def e(self):
		pass

	@methodnotwrapped
	def p(self):
		pass

	@methodnotwrapped
	def M(self):
		pass

	@methodnotwrapped
	def e(self):
		pass

	@methodnotwrapped
	def s(self):
		pass

	@methodnotwrapped
	def h(self):
		pass

	@methodnotwrapped
	def D(self):
		pass

	@methodnotwrapped
	def a(self):
		pass

	@methodnotwrapped
	def t(self):
		pass

	@methodnotwrapped
	def a(self):
		pass

	@methodnotwrapped
	def _(self):
		pass

	@methodnotwrapped
	def E(self):
		pass

	@methodnotwrapped
	def d(self):
		pass

	@methodnotwrapped
	def g(self):
		pass

	@methodnotwrapped
	def e(self):
		pass
	}
};

/**************************
* class BRepMeshData_Face *
**************************/
%nodefaultctor BRepMeshData_Face;
class BRepMeshData_Face : public IMeshData_Face {
	public:
		/****** BRepMeshData_Face::AddWire ******/
		/****** md5 signature: da6383228b6811d9b2e53917e314db4c ******/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "
Parameters
----------
theWire: TopoDS_Wire
theEdgeNb: int (optional, default to 0)

Return
-------
IMeshData::IWireHandle

Description
-----------
Adds wire to discrete model of face.
") AddWire;
		const IMeshData::IWireHandle & AddWire(const TopoDS_Wire & theWire, const int theEdgeNb = 0);

		/****** BRepMeshData_Face::GetWire ******/
		/****** md5 signature: 3e289414d2c00bf902051ece2205a4f6 ******/
		%feature("compactdefaultargs") GetWire;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IMeshData::IWireHandle

Description
-----------
Gets wire with the given index.
") GetWire;
		const IMeshData::IWireHandle & GetWire(const int theIndex);

		/****** BRepMeshData_Face::WiresNb ******/
		/****** md5 signature: aecfdab6f8a30a78956b602bc1766537 ******/
		%feature("compactdefaultargs") WiresNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gets number of children.
") WiresNb;
		int WiresNb();

};


%make_alias(BRepMeshData_Face)

%extend BRepMeshData_Face {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def B(self):
		pass

	@methodnotwrapped
	def R(self):
		pass

	@methodnotwrapped
	def e(self):
		pass

	@methodnotwrapped
	def p(self):
		pass

	@methodnotwrapped
	def M(self):
		pass

	@methodnotwrapped
	def e(self):
		pass

	@methodnotwrapped
	def s(self):
		pass

	@methodnotwrapped
	def h(self):
		pass

	@methodnotwrapped
	def D(self):
		pass

	@methodnotwrapped
	def a(self):
		pass

	@methodnotwrapped
	def t(self):
		pass

	@methodnotwrapped
	def a(self):
		pass

	@methodnotwrapped
	def _(self):
		pass

	@methodnotwrapped
	def F(self):
		pass

	@methodnotwrapped
	def a(self):
		pass

	@methodnotwrapped
	def c(self):
		pass

	@methodnotwrapped
	def e(self):
		pass
	}
};

/***************************
* class BRepMeshData_Model *
***************************/
class BRepMeshData_Model : public IMeshData_Model {
	public:
		/****** BRepMeshData_Model::BRepMeshData_Model ******/
		/****** md5 signature: 20c23584fb959b2f44e23291f517691e ******/
		%feature("compactdefaultargs") BRepMeshData_Model;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Constructor. Initializes empty model.
") BRepMeshData_Model;
		 BRepMeshData_Model(const TopoDS_Shape & theShape);

		/****** BRepMeshData_Model::AddEdge ******/
		/****** md5 signature: bbdf5246f49115b5073f1184599756c3 ******/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge

Return
-------
IMeshData::IEdgeHandle

Description
-----------
Adds new edge to shape model.
") AddEdge;
		const IMeshData::IEdgeHandle & AddEdge(const TopoDS_Edge & theEdge);

		/****** BRepMeshData_Model::AddFace ******/
		/****** md5 signature: cbe3e3287395d683281ce086f245f2d8 ******/
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
IMeshData::IFaceHandle

Description
-----------
Adds new face to shape model.
") AddFace;
		const IMeshData::IFaceHandle & AddFace(const TopoDS_Face & theFace);

		/****** BRepMeshData_Model::EdgesNb ******/
		/****** md5 signature: 8dd09b2e9dc369a335971c4c78eb7b09 ******/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of edges in discrete model.
") EdgesNb;
		int EdgesNb();

		/****** BRepMeshData_Model::FacesNb ******/
		/****** md5 signature: af7796a9b289ec2eec0d7d01f734c419 ******/
		%feature("compactdefaultargs") FacesNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of faces in discrete model.
") FacesNb;
		int FacesNb();

		/****** BRepMeshData_Model::GetEdge ******/
		/****** md5 signature: ddaff6ad7cb928e4030ef3825c90a50e ******/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IMeshData::IEdgeHandle

Description
-----------
Gets model's edge with the given index.
") GetEdge;
		const IMeshData::IEdgeHandle & GetEdge(const int theIndex);

		/****** BRepMeshData_Model::GetFace ******/
		/****** md5 signature: 173a5ffac5e8612c1a36d0c1960c1e2d ******/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IMeshData::IFaceHandle

Description
-----------
Gets model's face with the given index.
") GetFace;
		const IMeshData::IFaceHandle & GetFace(const int theIndex);

		/****** BRepMeshData_Model::GetMaxSize ******/
		/****** md5 signature: b8dd7606074f6ea46655e9c3adb337f7 ******/
		%feature("compactdefaultargs") GetMaxSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns maximum size of shape's bounding box.
") GetMaxSize;
		double GetMaxSize();

		/****** BRepMeshData_Model::SetMaxSize ******/
		/****** md5 signature: 42367ddc52452e4f025a814bc8332b1c ******/
		%feature("compactdefaultargs") SetMaxSize;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Sets maximum size of shape's bounding box.
") SetMaxSize;
		void SetMaxSize(const double theValue);

};


%make_alias(BRepMeshData_Model)

%extend BRepMeshData_Model {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepMeshData_PCurve *
****************************/
%nodefaultctor BRepMeshData_PCurve;
class BRepMeshData_PCurve : public IMeshData_PCurve {
	public:
		/****** BRepMeshData_PCurve::AddPoint ******/
		/****** md5 signature: b2b5c056d97b79b76e4a43e23a39f25f ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d
theParamOnPCurve: double

Return
-------
None

Description
-----------
Adds new discretization point to pcurve.
") AddPoint;
		void AddPoint(const gp_Pnt2d & thePoint, const double theParamOnPCurve);

		/****** BRepMeshData_PCurve::Clear ******/
		/****** md5 signature: ceb34dd2749a7aa7fa2365bb5bc2a010 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
isKeepEndPoints: bool

Return
-------
None

Description
-----------
Clears parameters list.
") Clear;
		void Clear(const bool isKeepEndPoints);

		/****** BRepMeshData_PCurve::GetIndex ******/
		/****** md5 signature: 2f116843b760cd4c10df5d69702454e6 ******/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Returns index in mesh corresponded to discretization point with the given index.
") GetIndex;
		int & GetIndex(const int theIndex);

		/****** BRepMeshData_PCurve::GetParameter ******/
		/****** md5 signature: 60610898713f2509facd4a2026bd8ee6 ******/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns parameter with the given index.
") GetParameter;
		double & GetParameter(const int theIndex);

		/****** BRepMeshData_PCurve::GetPoint ******/
		/****** md5 signature: d2c0c474cbbf62dd04262a796fef4305 ******/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt2d

Description
-----------
Returns discretization point with the given index.
") GetPoint;
		gp_Pnt2d GetPoint(const int theIndex);

		/****** BRepMeshData_PCurve::InsertPoint ******/
		/****** md5 signature: 468896dd222e4cdfe67775448c07ee67 ******/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "
Parameters
----------
thePosition: int
thePoint: gp_Pnt2d
theParamOnPCurve: double

Return
-------
None

Description
-----------
Inserts new discretization point at the given position.
") InsertPoint;
		void InsertPoint(const int thePosition, const gp_Pnt2d & thePoint, const double theParamOnPCurve);

		/****** BRepMeshData_PCurve::ParametersNb ******/
		/****** md5 signature: 9aba53c4cea655c67c05817f24e589f4 ******/
		%feature("compactdefaultargs") ParametersNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of parameters stored in pcurve.
") ParametersNb;
		int ParametersNb();

		/****** BRepMeshData_PCurve::RemovePoint ******/
		/****** md5 signature: b86669460245a17be990b44a978aea98 ******/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Removes point with the given index.
") RemovePoint;
		void RemovePoint(const int theIndex);

};


%make_alias(BRepMeshData_PCurve)

%extend BRepMeshData_PCurve {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def B(self):
		pass

	@methodnotwrapped
	def R(self):
		pass

	@methodnotwrapped
	def e(self):
		pass

	@methodnotwrapped
	def p(self):
		pass

	@methodnotwrapped
	def M(self):
		pass

	@methodnotwrapped
	def e(self):
		pass

	@methodnotwrapped
	def s(self):
		pass

	@methodnotwrapped
	def h(self):
		pass

	@methodnotwrapped
	def D(self):
		pass

	@methodnotwrapped
	def a(self):
		pass

	@methodnotwrapped
	def t(self):
		pass

	@methodnotwrapped
	def a(self):
		pass

	@methodnotwrapped
	def _(self):
		pass

	@methodnotwrapped
	def P(self):
		pass

	@methodnotwrapped
	def C(self):
		pass

	@methodnotwrapped
	def u(self):
		pass

	@methodnotwrapped
	def r(self):
		pass

	@methodnotwrapped
	def v(self):
		pass

	@methodnotwrapped
	def e(self):
		pass
	}
};

/**************************
* class BRepMeshData_Wire *
**************************/
%nodefaultctor BRepMeshData_Wire;
class BRepMeshData_Wire : public IMeshData_Wire {
	public:
		/****** BRepMeshData_Wire::AddEdge ******/
		/****** md5 signature: b506e93e4c2f588eed717766d900a11d ******/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "
Parameters
----------
theDEdge: IMeshData::IEdgePtr
theOrientation: TopAbs_Orientation

Return
-------
int

Description
-----------
Adds new discrete edge with specified orientation to wire chain. 
Return: index of added edge in wire chain.
") AddEdge;
		int AddEdge(const IMeshData::IEdgePtr & theDEdge, const TopAbs_Orientation theOrientation);

		/****** BRepMeshData_Wire::EdgesNb ******/
		/****** md5 signature: 8dd09b2e9dc369a335971c4c78eb7b09 ******/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gets number of children.
") EdgesNb;
		int EdgesNb();

		/****** BRepMeshData_Wire::GetEdge ******/
		/****** md5 signature: 3f65b77383c174358c7254a610d4738b ******/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IMeshData::IEdgePtr

Description
-----------
Gets edge with the given index.
") GetEdge;
		const IMeshData::IEdgePtr & GetEdge(const int theIndex);

		/****** BRepMeshData_Wire::GetEdgeOrientation ******/
		/****** md5 signature: a7711c6fef17b2fbfbb7f5a363d23fd2 ******/
		%feature("compactdefaultargs") GetEdgeOrientation;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
TopAbs_Orientation

Description
-----------
Returns True if orientation of discrete edge with the given index is forward.
") GetEdgeOrientation;
		TopAbs_Orientation GetEdgeOrientation(const int theIndex);

};


%make_alias(BRepMeshData_Wire)

%extend BRepMeshData_Wire {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def B(self):
		pass

	@methodnotwrapped
	def R(self):
		pass

	@methodnotwrapped
	def e(self):
		pass

	@methodnotwrapped
	def p(self):
		pass

	@methodnotwrapped
	def M(self):
		pass

	@methodnotwrapped
	def e(self):
		pass

	@methodnotwrapped
	def s(self):
		pass

	@methodnotwrapped
	def h(self):
		pass

	@methodnotwrapped
	def D(self):
		pass

	@methodnotwrapped
	def a(self):
		pass

	@methodnotwrapped
	def t(self):
		pass

	@methodnotwrapped
	def a(self):
		pass

	@methodnotwrapped
	def _(self):
		pass

	@methodnotwrapped
	def W(self):
		pass

	@methodnotwrapped
	def i(self):
		pass

	@methodnotwrapped
	def r(self):
		pass

	@methodnotwrapped
	def e(self):
		pass
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
