/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

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
		%feature("autodoc", "* Adds new discretization point to pcurve.
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theParamOnCurve:
	:type theParamOnCurve: float
	:rtype: void") AddPoint;
		virtual void AddPoint (const gp_Pnt & thePoint,const Standard_Real theParamOnCurve);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears parameters list.
	:param isKeepEndPoints:
	:type isKeepEndPoints: bool
	:rtype: void") Clear;
		virtual void Clear (const Standard_Boolean isKeepEndPoints);

		/****************** GetParameter ******************/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "* Returns parameter with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: float") GetParameter;
		virtual Standard_Real & GetParameter (const Standard_Integer theIndex);

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "* Returns discretization point with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: gp_Pnt") GetPoint;
		virtual gp_Pnt  GetPoint (const Standard_Integer theIndex);

		/****************** InsertPoint ******************/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "* Inserts new discretization point at the given position.
	:param thePosition:
	:type thePosition: int
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theParamOnPCurve:
	:type theParamOnPCurve: float
	:rtype: void") InsertPoint;
		virtual void InsertPoint (const Standard_Integer thePosition,const gp_Pnt & thePoint,const Standard_Real theParamOnPCurve);

		/****************** ParametersNb ******************/
		%feature("compactdefaultargs") ParametersNb;
		%feature("autodoc", "* Returns number of parameters stored in curve.
	:rtype: int") ParametersNb;
		virtual Standard_Integer ParametersNb ();

		/****************** RemovePoint ******************/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "* Removes point with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: void") RemovePoint;
		virtual void RemovePoint (const Standard_Integer theIndex);

};


%extend BRepMeshData_Curve {
	%pythoncode {
	__repr__ = _dumps_object
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
		%feature("autodoc", "* Adds disrete pcurve for the specifed discrete face.
	:param theDFace:
	:type theDFace: IMeshData::IFacePtr
	:param theOrientation:
	:type theOrientation: TopAbs_Orientation
	:rtype: IMeshData::IPCurveHandle") AddPCurve;
		virtual const IMeshData::IPCurveHandle & AddPCurve (const IMeshData::IFacePtr & theDFace,const TopAbs_Orientation theOrientation);

		/****************** GetPCurve ******************/
		%feature("compactdefaultargs") GetPCurve;
		%feature("autodoc", "* Returns pcurve for the specified discrete face.
	:param theDFace:
	:type theDFace: IMeshData::IFacePtr
	:param theOrientation:
	:type theOrientation: TopAbs_Orientation
	:rtype: IMeshData::IPCurveHandle") GetPCurve;
		virtual const IMeshData::IPCurveHandle & GetPCurve (const IMeshData::IFacePtr & theDFace,const TopAbs_Orientation theOrientation);

		/****************** GetPCurve ******************/
		%feature("compactdefaultargs") GetPCurve;
		%feature("autodoc", "* Returns pcurve with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: IMeshData::IPCurveHandle") GetPCurve;
		virtual const IMeshData::IPCurveHandle & GetPCurve (const Standard_Integer theIndex);

		/****************** PCurvesNb ******************/
		%feature("compactdefaultargs") PCurvesNb;
		%feature("autodoc", "* Returns number of pcurves assigned to current edge.
	:rtype: int") PCurvesNb;
		virtual Standard_Integer PCurvesNb ();

};


%extend BRepMeshData_Edge {
	%pythoncode {
	__repr__ = _dumps_object
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
		%feature("autodoc", "* Adds wire to discrete model of face.
	:param theWire:
	:type theWire: TopoDS_Wire
	:param theEdgeNb: default value is 0
	:type theEdgeNb: int
	:rtype: IMeshData::IWireHandle") AddWire;
		virtual const IMeshData::IWireHandle & AddWire (const TopoDS_Wire & theWire,const Standard_Integer theEdgeNb = 0);

		/****************** GetWire ******************/
		%feature("compactdefaultargs") GetWire;
		%feature("autodoc", "* Gets wire with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: IMeshData::IWireHandle") GetWire;
		virtual const IMeshData::IWireHandle & GetWire (const Standard_Integer theIndex);

		/****************** WiresNb ******************/
		%feature("compactdefaultargs") WiresNb;
		%feature("autodoc", "* Gets number of children.
	:rtype: int") WiresNb;
		virtual Standard_Integer WiresNb ();

};


%extend BRepMeshData_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepMeshData_Model *
***************************/
class BRepMeshData_Model : public IMeshData_Model {
	public:
		/****************** AddEdge ******************/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "* Adds new edge to shape model.
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:rtype: IMeshData::IEdgeHandle") AddEdge;
		virtual const IMeshData::IEdgeHandle & AddEdge (const TopoDS_Edge & theEdge);

		/****************** AddFace ******************/
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "* Adds new face to shape model.
	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: IMeshData::IFaceHandle") AddFace;
		virtual const IMeshData::IFaceHandle & AddFace (const TopoDS_Face & theFace);

		/****************** BRepMeshData_Model ******************/
		%feature("compactdefaultargs") BRepMeshData_Model;
		%feature("autodoc", "* Constructor. Initializes empty model.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") BRepMeshData_Model;
		 BRepMeshData_Model (const TopoDS_Shape & theShape);

		/****************** EdgesNb ******************/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "* @name discrete edges Returns number of edges in discrete model.
	:rtype: int") EdgesNb;
		virtual Standard_Integer EdgesNb ();

		/****************** FacesNb ******************/
		%feature("compactdefaultargs") FacesNb;
		%feature("autodoc", "* @name discrete faces Returns number of faces in discrete model.
	:rtype: int") FacesNb;
		virtual Standard_Integer FacesNb ();

		/****************** GetEdge ******************/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "* Gets model's edge with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: IMeshData::IEdgeHandle") GetEdge;
		virtual const IMeshData::IEdgeHandle & GetEdge (const Standard_Integer theIndex);

		/****************** GetFace ******************/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "* Gets model's face with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: IMeshData::IFaceHandle") GetFace;
		virtual const IMeshData::IFaceHandle & GetFace (const Standard_Integer theIndex);

		/****************** GetMaxSize ******************/
		%feature("compactdefaultargs") GetMaxSize;
		%feature("autodoc", "* Returns maximum size of shape's bounding box.
	:rtype: float") GetMaxSize;
		virtual Standard_Real GetMaxSize ();

		/****************** SetMaxSize ******************/
		%feature("compactdefaultargs") SetMaxSize;
		%feature("autodoc", "* Sets maximum size of shape's bounding box.
	:param theValue:
	:type theValue: float
	:rtype: inline void") SetMaxSize;
		inline void SetMaxSize (const Standard_Real theValue);

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
		%feature("autodoc", "* Adds new discretization point to pcurve.
	:param thePoint:
	:type thePoint: gp_Pnt2d
	:param theParamOnPCurve:
	:type theParamOnPCurve: float
	:rtype: void") AddPoint;
		virtual void AddPoint (const gp_Pnt2d & thePoint,const Standard_Real theParamOnPCurve);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears parameters list.
	:param isKeepEndPoints:
	:type isKeepEndPoints: bool
	:rtype: void") Clear;
		virtual void Clear (const Standard_Boolean isKeepEndPoints);

		/****************** GetIndex ******************/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "* Returns index in mesh corresponded to discretization point with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: int") GetIndex;
		virtual Standard_Integer & GetIndex (const Standard_Integer theIndex);

		/****************** GetParameter ******************/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "* Returns parameter with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: float") GetParameter;
		virtual Standard_Real & GetParameter (const Standard_Integer theIndex);

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "* Returns discretization point with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: gp_Pnt2d") GetPoint;
		virtual gp_Pnt2d  GetPoint (const Standard_Integer theIndex);

		/****************** InsertPoint ******************/
		%feature("compactdefaultargs") InsertPoint;
		%feature("autodoc", "* Inserts new discretization point at the given position.
	:param thePosition:
	:type thePosition: int
	:param thePoint:
	:type thePoint: gp_Pnt2d
	:param theParamOnPCurve:
	:type theParamOnPCurve: float
	:rtype: void") InsertPoint;
		virtual void InsertPoint (const Standard_Integer thePosition,const gp_Pnt2d & thePoint,const Standard_Real theParamOnPCurve);

		/****************** ParametersNb ******************/
		%feature("compactdefaultargs") ParametersNb;
		%feature("autodoc", "* Returns number of parameters stored in pcurve.
	:rtype: int") ParametersNb;
		virtual Standard_Integer ParametersNb ();

		/****************** RemovePoint ******************/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "* Removes point with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: void") RemovePoint;
		virtual void RemovePoint (const Standard_Integer theIndex);

};


%extend BRepMeshData_PCurve {
	%pythoncode {
	__repr__ = _dumps_object
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
		%feature("autodoc", "* Adds new discrete edge with specified orientation to wire chain. returns index of added edge in wire chain.
	:param theDEdge:
	:type theDEdge: IMeshData::IEdgePtr
	:param theOrientation:
	:type theOrientation: TopAbs_Orientation
	:rtype: int") AddEdge;
		virtual Standard_Integer AddEdge (const IMeshData::IEdgePtr & theDEdge,const TopAbs_Orientation theOrientation);

		/****************** EdgesNb ******************/
		%feature("compactdefaultargs") EdgesNb;
		%feature("autodoc", "* Gets number of children.
	:rtype: int") EdgesNb;
		virtual Standard_Integer EdgesNb ();

		/****************** GetEdge ******************/
		%feature("compactdefaultargs") GetEdge;
		%feature("autodoc", "* Gets edge with the given index.
	:param theIndex:
	:type theIndex: int
	:rtype: IMeshData::IEdgePtr") GetEdge;
		virtual const IMeshData::IEdgePtr & GetEdge (const Standard_Integer theIndex);

		/****************** GetEdgeOrientation ******************/
		%feature("compactdefaultargs") GetEdgeOrientation;
		%feature("autodoc", "* Returns True if orientation of discrete edge with the given index is forward.
	:param theIndex:
	:type theIndex: int
	:rtype: TopAbs_Orientation") GetEdgeOrientation;
		virtual TopAbs_Orientation GetEdgeOrientation (const Standard_Integer theIndex);

};


%extend BRepMeshData_Wire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
