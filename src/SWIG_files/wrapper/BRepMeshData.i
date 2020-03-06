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
%define BREPMESHDATADOCSTRING
"BRepMeshData module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepmeshdata.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/***************************
* class BRepMeshData_Curve *
***************************/
%nodefaultctor BRepMeshData_Curve;
class BRepMeshData_Curve : public IMeshData_Curve {
	public:
		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Adds new discretization point to pcurve.

Parameters
----------
thePoint: gp_Pnt
theParamOnCurve: float

Returns
-------
None
") AddPoint;
		virtual void AddPoint(const gp_Pnt & thePoint, const Standard_Real theParamOnCurve);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears parameters list.

Parameters
----------
isKeepEndPoints: bool

Returns
-------
None
") Clear;
		virtual void Clear(const Standard_Boolean isKeepEndPoints);

		/****************** GetParameter ******************/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "Returns parameter with the given index.

Parameters
----------
theIndex: int

Returns
-------
float
") GetParameter;
		virtual Standard_Real & GetParameter(const Standard_Integer theIndex);

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "Returns discretization point with the given index.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt
") GetPoint;
		virtual gp_Pnt GetPoint(const Standard_Integer theIndex);

		/****************** InsertPoint ******************/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "Inserts new discretization point at the given position.

Parameters
----------
thePosition: int
thePoint: gp_Pnt
theParamOnPCurve: float

Returns
-------
None
") InsertPoint;
		virtual void InsertPoint(const Standard_Integer thePosition, const gp_Pnt & thePoint, const Standard_Real theParamOnPCurve);

		/****************** ParametersNb ******************/
		%feature("compactdefaultargs") ParametersNb;
		%feature("autodoc", "Returns number of parameters stored in curve.

Returns
-------
int
") ParametersNb;
		virtual Standard_Integer ParametersNb();

		/****************** RemovePoint ******************/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "Removes point with the given index.

Parameters
----------
theIndex: int

Returns
-------
None
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
		%feature("compactdefaultargs") AddPCurve;
		%feature("autodoc", "Adds disrete pcurve for the specifed discrete face.

Parameters
----------
theDFace: IMeshData::IFacePtr
theOrientation: TopAbs_Orientation

Returns
-------
IMeshData::IPCurveHandle
") AddPCurve;
		virtual const IMeshData::IPCurveHandle & AddPCurve(const IMeshData::IFacePtr & theDFace, const TopAbs_Orientation theOrientation);

		/****************** GetPCurve ******************/
		%feature("compactdefaultargs") GetPCurve;
		%feature("autodoc", "Returns pcurve for the specified discrete face.

Parameters
----------
theDFace: IMeshData::IFacePtr
theOrientation: TopAbs_Orientation

Returns
-------
IMeshData::IPCurveHandle
") GetPCurve;
		virtual const IMeshData::IPCurveHandle & GetPCurve(const IMeshData::IFacePtr & theDFace, const TopAbs_Orientation theOrientation);

		/****************** GetPCurve ******************/
		%feature("compactdefaultargs") GetPCurve;
		%feature("autodoc", "Returns pcurve with the given index.

Parameters
----------
theIndex: int

Returns
-------
IMeshData::IPCurveHandle
") GetPCurve;
		virtual const IMeshData::IPCurveHandle & GetPCurve(const Standard_Integer theIndex);

		/****************** PCurvesNb ******************/
		%feature("compactdefaultargs") PCurvesNb;
		%feature("autodoc", "Returns number of pcurves assigned to current edge.

Returns
-------
int
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
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "Adds wire to discrete model of face.

Parameters
----------
theWire: TopoDS_Wire
theEdgeNb: int,optional
	default value is 0

Returns
-------
IMeshData::IWireHandle
") AddWire;
		virtual const IMeshData::IWireHandle & AddWire(const TopoDS_Wire & theWire, const Standard_Integer theEdgeNb = 0);

		/****************** GetWire ******************/
		%feature("compactdefaultargs") GetWire;
		%feature("autodoc", "Gets wire with the given index.

Parameters
----------
theIndex: int

Returns
-------
IMeshData::IWireHandle
") GetWire;
		virtual const IMeshData::IWireHandle & GetWire(const Standard_Integer theIndex);

		/****************** WiresNb ******************/
		%feature("compactdefaultargs") WiresNb;
		%feature("autodoc", "Gets number of children.

Returns
-------
int
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
		%feature("compactdefaultargs") BRepMeshData_Model;
		%feature("autodoc", "Constructor. initializes empty model.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") BRepMeshData_Model;
		 BRepMeshData_Model(const TopoDS_Shape & theShape);

		/****************** AddEdge ******************/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "Adds new edge to shape model.

Parameters
----------
theEdge: TopoDS_Edge

Returns
-------
IMeshData::IEdgeHandle
") AddEdge;
		virtual const IMeshData::IEdgeHandle & AddEdge(const TopoDS_Edge & theEdge);

		/****************** AddFace ******************/
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "Adds new face to shape model.

Parameters
----------
theFace: TopoDS_Face

Returns
-------
IMeshData::IFaceHandle
") AddFace;
		virtual const IMeshData::IFaceHandle & AddFace(const TopoDS_Face & theFace);

		/****************** EdgesNb ******************/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "Returns number of edges in discrete model.

Returns
-------
int
") EdgesNb;
		virtual Standard_Integer EdgesNb();

		/****************** FacesNb ******************/
		%feature("compactdefaultargs") FacesNb;
		%feature("autodoc", "Returns number of faces in discrete model.

Returns
-------
int
") FacesNb;
		virtual Standard_Integer FacesNb();

		/****************** GetEdge ******************/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "Gets model's edge with the given index.

Parameters
----------
theIndex: int

Returns
-------
IMeshData::IEdgeHandle
") GetEdge;
		virtual const IMeshData::IEdgeHandle & GetEdge(const Standard_Integer theIndex);

		/****************** GetFace ******************/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "Gets model's face with the given index.

Parameters
----------
theIndex: int

Returns
-------
IMeshData::IFaceHandle
") GetFace;
		virtual const IMeshData::IFaceHandle & GetFace(const Standard_Integer theIndex);

		/****************** GetMaxSize ******************/
		%feature("compactdefaultargs") GetMaxSize;
		%feature("autodoc", "Returns maximum size of shape's bounding box.

Returns
-------
float
") GetMaxSize;
		virtual Standard_Real GetMaxSize();

		/****************** SetMaxSize ******************/
		%feature("compactdefaultargs") SetMaxSize;
		%feature("autodoc", "Sets maximum size of shape's bounding box.

Parameters
----------
theValue: float

Returns
-------
None
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
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Adds new discretization point to pcurve.

Parameters
----------
thePoint: gp_Pnt2d
theParamOnPCurve: float

Returns
-------
None
") AddPoint;
		virtual void AddPoint(const gp_Pnt2d & thePoint, const Standard_Real theParamOnPCurve);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears parameters list.

Parameters
----------
isKeepEndPoints: bool

Returns
-------
None
") Clear;
		virtual void Clear(const Standard_Boolean isKeepEndPoints);

		/****************** GetIndex ******************/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "Returns index in mesh corresponded to discretization point with the given index.

Parameters
----------
theIndex: int

Returns
-------
int
") GetIndex;
		virtual Standard_Integer & GetIndex(const Standard_Integer theIndex);

		/****************** GetParameter ******************/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "Returns parameter with the given index.

Parameters
----------
theIndex: int

Returns
-------
float
") GetParameter;
		virtual Standard_Real & GetParameter(const Standard_Integer theIndex);

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "Returns discretization point with the given index.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt2d
") GetPoint;
		virtual gp_Pnt2d GetPoint(const Standard_Integer theIndex);

		/****************** InsertPoint ******************/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "Inserts new discretization point at the given position.

Parameters
----------
thePosition: int
thePoint: gp_Pnt2d
theParamOnPCurve: float

Returns
-------
None
") InsertPoint;
		virtual void InsertPoint(const Standard_Integer thePosition, const gp_Pnt2d & thePoint, const Standard_Real theParamOnPCurve);

		/****************** ParametersNb ******************/
		%feature("compactdefaultargs") ParametersNb;
		%feature("autodoc", "Returns number of parameters stored in pcurve.

Returns
-------
int
") ParametersNb;
		virtual Standard_Integer ParametersNb();

		/****************** RemovePoint ******************/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "Removes point with the given index.

Parameters
----------
theIndex: int

Returns
-------
None
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
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "Adds new discrete edge with specified orientation to wire chain. returns index of added edge in wire chain.

Parameters
----------
theDEdge: IMeshData::IEdgePtr
theOrientation: TopAbs_Orientation

Returns
-------
int
") AddEdge;
		virtual Standard_Integer AddEdge(const IMeshData::IEdgePtr & theDEdge, const TopAbs_Orientation theOrientation);

		/****************** EdgesNb ******************/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "Gets number of children.

Returns
-------
int
") EdgesNb;
		virtual Standard_Integer EdgesNb();

		/****************** GetEdge ******************/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "Gets edge with the given index.

Parameters
----------
theIndex: int

Returns
-------
IMeshData::IEdgePtr
") GetEdge;
		virtual const IMeshData::IEdgePtr & GetEdge(const Standard_Integer theIndex);

		/****************** GetEdgeOrientation ******************/
		%feature("compactdefaultargs") GetEdgeOrientation;
		%feature("autodoc", "Returns true if orientation of discrete edge with the given index is forward.

Parameters
----------
theIndex: int

Returns
-------
TopAbs_Orientation
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
