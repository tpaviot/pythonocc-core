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
%define BREPMESHDATADOCSTRING
"BRepMeshData module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_brepmeshdata.html"
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
		/****************** AddPoint ******************/
		/**** md5 signature: 5587b337748a540e6cb9a51458b03bf2 ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt
theParamOnCurve: float

Return
-------
None

Description
-----------
Adds new discretization point to pcurve.
") AddPoint;
		virtual void AddPoint(const gp_Pnt & thePoint, const Standard_Real theParamOnCurve);

		/****************** Clear ******************/
		/**** md5 signature: b91f21d79c57aeb0ab4d6d89d0391c2c ****/
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
		virtual void Clear(const Standard_Boolean isKeepEndPoints);

		/****************** GetParameter ******************/
		/**** md5 signature: 43c7041b75cad4564a4558a2da55af83 ****/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Returns parameter with the given index.
") GetParameter;
		virtual Standard_Real & GetParameter(const Standard_Integer theIndex);

		/****************** GetPoint ******************/
		/**** md5 signature: ae53efbf52e2afb6d158d4bc0d262b60 ****/
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
		virtual gp_Pnt GetPoint(const Standard_Integer theIndex);

		/****************** InsertPoint ******************/
		/**** md5 signature: 5e229fee3ffb69ce367f8b52f9cc2a2d ****/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "
Parameters
----------
thePosition: int
thePoint: gp_Pnt
theParamOnPCurve: float

Return
-------
None

Description
-----------
Inserts new discretization point at the given position.
") InsertPoint;
		virtual void InsertPoint(const Standard_Integer thePosition, const gp_Pnt & thePoint, const Standard_Real theParamOnPCurve);

		/****************** ParametersNb ******************/
		/**** md5 signature: 98955ccca9a9a58d67efd3cf821045d5 ****/
		%feature("compactdefaultargs") ParametersNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of parameters stored in curve.
") ParametersNb;
		virtual Standard_Integer ParametersNb();

		/****************** RemovePoint ******************/
		/**** md5 signature: dc9ca36142ba2044706f1377e29a7b2a ****/
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
		virtual void RemovePoint(const Standard_Integer theIndex);

};


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
		/****************** AddPCurve ******************/
		/**** md5 signature: b0e75fdb233dd95364fad0411000ec96 ****/
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
		virtual const IMeshData::IPCurveHandle & AddPCurve(const IMeshData::IFacePtr & theDFace, const TopAbs_Orientation theOrientation);

		/****************** GetPCurve ******************/
		/**** md5 signature: 4c651c871b35e5f5f12404be43db3374 ****/
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
		virtual const IMeshData::IPCurveHandle & GetPCurve(const IMeshData::IFacePtr & theDFace, const TopAbs_Orientation theOrientation);

		/****************** GetPCurve ******************/
		/**** md5 signature: c2f904a58e6d4fae050f2bef2b323320 ****/
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
		virtual const IMeshData::IPCurveHandle & GetPCurve(const Standard_Integer theIndex);

		/****************** PCurvesNb ******************/
		/**** md5 signature: 396e4ba5fd70d100e8e49ef4d5da81c6 ****/
		%feature("compactdefaultargs") PCurvesNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of pcurves assigned to current edge.
") PCurvesNb;
		virtual Standard_Integer PCurvesNb();

};


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
		/****************** AddWire ******************/
		/**** md5 signature: 887f3c30d9841bcc014daace52a3b4dc ****/
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
		virtual const IMeshData::IWireHandle & AddWire(const TopoDS_Wire & theWire, const Standard_Integer theEdgeNb = 0);

		/****************** GetWire ******************/
		/**** md5 signature: dc2ee08263a7ad8e6a1e6e9bce47ac66 ****/
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
		virtual const IMeshData::IWireHandle & GetWire(const Standard_Integer theIndex);

		/****************** WiresNb ******************/
		/**** md5 signature: c1ae306201b98c47c64b7d6fd7fee1f4 ****/
		%feature("compactdefaultargs") WiresNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gets number of children.
") WiresNb;
		virtual Standard_Integer WiresNb();

};


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
		/****************** BRepMeshData_Model ******************/
		/**** md5 signature: 20c23584fb959b2f44e23291f517691e ****/
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
Constructor. initializes empty model.
") BRepMeshData_Model;
		 BRepMeshData_Model(const TopoDS_Shape & theShape);

		/****************** AddEdge ******************/
		/**** md5 signature: 2ec0cf61f4a3389f2fb166c66d06ce72 ****/
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
		virtual const IMeshData::IEdgeHandle & AddEdge(const TopoDS_Edge & theEdge);

		/****************** AddFace ******************/
		/**** md5 signature: a58703e7432ff85120d2b68c02a8bff4 ****/
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
		virtual const IMeshData::IFaceHandle & AddFace(const TopoDS_Face & theFace);

		/****************** EdgesNb ******************/
		/**** md5 signature: d8bed3659eeea9d444f232f4eeeb7350 ****/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of edges in discrete model.
") EdgesNb;
		virtual Standard_Integer EdgesNb();

		/****************** FacesNb ******************/
		/**** md5 signature: 65bd60c646a1f9634db0dc8215150552 ****/
		%feature("compactdefaultargs") FacesNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of faces in discrete model.
") FacesNb;
		virtual Standard_Integer FacesNb();

		/****************** GetEdge ******************/
		/**** md5 signature: 086e707eb61c4770df8201df143365ff ****/
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
		virtual const IMeshData::IEdgeHandle & GetEdge(const Standard_Integer theIndex);

		/****************** GetFace ******************/
		/**** md5 signature: 00576006cdfa2bb95715ca47ec356d25 ****/
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
		virtual const IMeshData::IFaceHandle & GetFace(const Standard_Integer theIndex);

		/****************** GetMaxSize ******************/
		/**** md5 signature: 0a00229321f1e3e5c5930bb31d203e3a ****/
		%feature("compactdefaultargs") GetMaxSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns maximum size of shape's bounding box.
") GetMaxSize;
		virtual Standard_Real GetMaxSize();

		/****************** SetMaxSize ******************/
		/**** md5 signature: bec30c9764ffff8d39bf47869dadae4b ****/
		%feature("compactdefaultargs") SetMaxSize;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Sets maximum size of shape's bounding box.
") SetMaxSize;
		void SetMaxSize(const Standard_Real theValue);

};


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
		/****************** AddPoint ******************/
		/**** md5 signature: b1d43f3062f4eec32549956924a93d1c ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d
theParamOnPCurve: float

Return
-------
None

Description
-----------
Adds new discretization point to pcurve.
") AddPoint;
		virtual void AddPoint(const gp_Pnt2d & thePoint, const Standard_Real theParamOnPCurve);

		/****************** Clear ******************/
		/**** md5 signature: b91f21d79c57aeb0ab4d6d89d0391c2c ****/
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
		virtual void Clear(const Standard_Boolean isKeepEndPoints);

		/****************** GetIndex ******************/
		/**** md5 signature: 14de5a18fa0133a999b5cff84739f766 ****/
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
		virtual Standard_Integer & GetIndex(const Standard_Integer theIndex);

		/****************** GetParameter ******************/
		/**** md5 signature: 43c7041b75cad4564a4558a2da55af83 ****/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Returns parameter with the given index.
") GetParameter;
		virtual Standard_Real & GetParameter(const Standard_Integer theIndex);

		/****************** GetPoint ******************/
		/**** md5 signature: cf6dfc6bc543dce91044cba5d793fcb2 ****/
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
		virtual gp_Pnt2d GetPoint(const Standard_Integer theIndex);

		/****************** InsertPoint ******************/
		/**** md5 signature: ba146337f4ebc5f84d06489cf31e1ee0 ****/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "
Parameters
----------
thePosition: int
thePoint: gp_Pnt2d
theParamOnPCurve: float

Return
-------
None

Description
-----------
Inserts new discretization point at the given position.
") InsertPoint;
		virtual void InsertPoint(const Standard_Integer thePosition, const gp_Pnt2d & thePoint, const Standard_Real theParamOnPCurve);

		/****************** ParametersNb ******************/
		/**** md5 signature: 98955ccca9a9a58d67efd3cf821045d5 ****/
		%feature("compactdefaultargs") ParametersNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of parameters stored in pcurve.
") ParametersNb;
		virtual Standard_Integer ParametersNb();

		/****************** RemovePoint ******************/
		/**** md5 signature: dc9ca36142ba2044706f1377e29a7b2a ****/
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
		virtual void RemovePoint(const Standard_Integer theIndex);

};


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
		/****************** AddEdge ******************/
		/**** md5 signature: 5d6a61a9aded474f1c90ff1465972fef ****/
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
Adds new discrete edge with specified orientation to wire chain. return index of added edge in wire chain.
") AddEdge;
		virtual Standard_Integer AddEdge(const IMeshData::IEdgePtr & theDEdge, const TopAbs_Orientation theOrientation);

		/****************** EdgesNb ******************/
		/**** md5 signature: d8bed3659eeea9d444f232f4eeeb7350 ****/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gets number of children.
") EdgesNb;
		virtual Standard_Integer EdgesNb();

		/****************** GetEdge ******************/
		/**** md5 signature: 071d6cbcbf6a096f1abbf54c9f4a9a9e ****/
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
		virtual const IMeshData::IEdgePtr & GetEdge(const Standard_Integer theIndex);

		/****************** GetEdgeOrientation ******************/
		/**** md5 signature: 928c9f1f2b575dbdba2dc9dd7c999c8f ****/
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
Returns true if orientation of discrete edge with the given index is forward.
") GetEdgeOrientation;
		virtual TopAbs_Orientation GetEdgeOrientation(const Standard_Integer theIndex);

};


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
