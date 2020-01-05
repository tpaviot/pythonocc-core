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
%define IMESHTOOLSDOCSTRING
"IMeshTools module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_imeshtools.html"
%enddef
%module (package="OCC.Core", docstring=IMESHTOOLSDOCSTRING) IMeshTools


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
#include<IMeshTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IMeshData_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<Message_module.hxx>
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
%import GeomAbs.i
%import Message.i
%import TopoDS.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(IMeshTools_Context)
%wrap_handle(IMeshTools_CurveTessellator)
%wrap_handle(IMeshTools_MeshAlgo)
%wrap_handle(IMeshTools_MeshAlgoFactory)
%wrap_handle(IMeshTools_ModelAlgo)
%wrap_handle(IMeshTools_ShapeExplorer)
%wrap_handle(IMeshTools_ShapeVisitor)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************************
* class IMeshTools_Context *
***************************/
class IMeshTools_Context : public IMeshData_Shape {
	public:
		/****************** BuildModel ******************/
		%feature("compactdefaultargs") BuildModel;
		%feature("autodoc", "* Builds model using assined model builder. returns True on success, False elsewhere.
	:rtype: bool") BuildModel;
		virtual Standard_Boolean BuildModel ();

		/****************** ChangeParameters ******************/
		%feature("compactdefaultargs") ChangeParameters;
		%feature("autodoc", "* Gets reference to parameters to be used for meshing.
	:rtype: inline IMeshTools_Parameters") ChangeParameters;
		inline IMeshTools_Parameters & ChangeParameters ();

		/****************** Clean ******************/
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "* Cleans temporary context data.
	:rtype: void") Clean;
		virtual void Clean ();

		/****************** DiscretizeEdges ******************/
		%feature("compactdefaultargs") DiscretizeEdges;
		%feature("autodoc", "* Performs discretization of model edges using assigned edge discret algorithm. returns True on success, False elsewhere.
	:rtype: bool") DiscretizeEdges;
		virtual Standard_Boolean DiscretizeEdges ();

		/****************** DiscretizeFaces ******************/
		%feature("compactdefaultargs") DiscretizeFaces;
		%feature("autodoc", "* Performs meshing of faces of discrete model using assigned meshing algorithm. returns True on success, False elsewhere.
	:rtype: bool") DiscretizeFaces;
		virtual Standard_Boolean DiscretizeFaces ();

		/****************** GetEdgeDiscret ******************/
		%feature("compactdefaultargs") GetEdgeDiscret;
		%feature("autodoc", "* Gets instance of a tool to be used to discretize edges of a model.
	:rtype: inline  opencascade::handle<IMeshTools_ModelAlgo>") GetEdgeDiscret;
		inline const opencascade::handle<IMeshTools_ModelAlgo> & GetEdgeDiscret ();

		/****************** GetFaceDiscret ******************/
		%feature("compactdefaultargs") GetFaceDiscret;
		%feature("autodoc", "* Gets instance of meshing algorithm.
	:rtype: inline  opencascade::handle<IMeshTools_ModelAlgo>") GetFaceDiscret;
		inline const opencascade::handle<IMeshTools_ModelAlgo> & GetFaceDiscret ();

		/****************** GetModel ******************/
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "* Returns discrete model of a shape.
	:rtype: inline  opencascade::handle<IMeshData_Model>") GetModel;
		inline const opencascade::handle<IMeshData_Model> & GetModel ();

		/****************** GetModelBuilder ******************/
		%feature("compactdefaultargs") GetModelBuilder;
		%feature("autodoc", "* Gets instance of a tool to be used to build discrete model.
	:rtype: inline  opencascade::handle<IMeshTools_ModelBuilder>") GetModelBuilder;
		inline const opencascade::handle<IMeshTools_ModelBuilder> & GetModelBuilder ();

		/****************** GetModelHealer ******************/
		%feature("compactdefaultargs") GetModelHealer;
		%feature("autodoc", "* Gets instance of a tool to be used to heal discrete model.
	:rtype: inline  opencascade::handle<IMeshTools_ModelAlgo>") GetModelHealer;
		inline const opencascade::handle<IMeshTools_ModelAlgo> & GetModelHealer ();

		/****************** GetParameters ******************/
		%feature("compactdefaultargs") GetParameters;
		%feature("autodoc", "* Gets parameters to be used for meshing.
	:rtype: inline  IMeshTools_Parameters") GetParameters;
		inline const IMeshTools_Parameters & GetParameters ();

		/****************** GetPostProcessor ******************/
		%feature("compactdefaultargs") GetPostProcessor;
		%feature("autodoc", "* Gets instance of post-processing algorithm.
	:rtype: inline  opencascade::handle<IMeshTools_ModelAlgo>") GetPostProcessor;
		inline const opencascade::handle<IMeshTools_ModelAlgo> & GetPostProcessor ();

		/****************** GetPreProcessor ******************/
		%feature("compactdefaultargs") GetPreProcessor;
		%feature("autodoc", "* Gets instance of pre-processing algorithm.
	:rtype: inline  opencascade::handle<IMeshTools_ModelAlgo>") GetPreProcessor;
		inline const opencascade::handle<IMeshTools_ModelAlgo> & GetPreProcessor ();

		/****************** HealModel ******************/
		%feature("compactdefaultargs") HealModel;
		%feature("autodoc", "* Performs healing of discrete model built by DiscretizeEdges() method using assigned healing algorithm. returns True on success, False elsewhere.
	:rtype: bool") HealModel;
		virtual Standard_Boolean HealModel ();

		/****************** IMeshTools_Context ******************/
		%feature("compactdefaultargs") IMeshTools_Context;
		%feature("autodoc", "* Constructor.
	:rtype: None") IMeshTools_Context;
		 IMeshTools_Context ();

		/****************** PostProcessModel ******************/
		%feature("compactdefaultargs") PostProcessModel;
		%feature("autodoc", "* Performs post-processing of discrete model using assigned algorithm. returns True on success, False elsewhere.
	:rtype: bool") PostProcessModel;
		virtual Standard_Boolean PostProcessModel ();

		/****************** PreProcessModel ******************/
		%feature("compactdefaultargs") PreProcessModel;
		%feature("autodoc", "* Performs pre-processing of discrete model using assigned algorithm. Performs auxiliary actions such as cleaning shape from old triangulation. returns True on success, False elsewhere.
	:rtype: bool") PreProcessModel;
		virtual Standard_Boolean PreProcessModel ();

		/****************** SetEdgeDiscret ******************/
		%feature("compactdefaultargs") SetEdgeDiscret;
		%feature("autodoc", "* Sets instance of a tool to be used to discretize edges of a model.
	:param theEdgeDiscret:
	:type theEdgeDiscret: IMeshTools_ModelAlgo
	:rtype: inline void") SetEdgeDiscret;
		inline void SetEdgeDiscret (const opencascade::handle<IMeshTools_ModelAlgo> & theEdgeDiscret);

		/****************** SetFaceDiscret ******************/
		%feature("compactdefaultargs") SetFaceDiscret;
		%feature("autodoc", "* Sets instance of meshing algorithm.
	:param theFaceDiscret:
	:type theFaceDiscret: IMeshTools_ModelAlgo
	:rtype: inline void") SetFaceDiscret;
		inline void SetFaceDiscret (const opencascade::handle<IMeshTools_ModelAlgo> & theFaceDiscret);

		/****************** SetModelBuilder ******************/
		%feature("compactdefaultargs") SetModelBuilder;
		%feature("autodoc", "* Sets instance of a tool to be used to build discrete model.
	:param theBuilder:
	:type theBuilder: IMeshTools_ModelBuilder
	:rtype: inline void") SetModelBuilder;
		inline void SetModelBuilder (const opencascade::handle<IMeshTools_ModelBuilder> & theBuilder);

		/****************** SetModelHealer ******************/
		%feature("compactdefaultargs") SetModelHealer;
		%feature("autodoc", "* Sets instance of a tool to be used to heal discrete model.
	:param theModelHealer:
	:type theModelHealer: IMeshTools_ModelAlgo
	:rtype: inline void") SetModelHealer;
		inline void SetModelHealer (const opencascade::handle<IMeshTools_ModelAlgo> & theModelHealer);

		/****************** SetPostProcessor ******************/
		%feature("compactdefaultargs") SetPostProcessor;
		%feature("autodoc", "* Sets instance of post-processing algorithm.
	:param thePostProcessor:
	:type thePostProcessor: IMeshTools_ModelAlgo
	:rtype: inline void") SetPostProcessor;
		inline void SetPostProcessor (const opencascade::handle<IMeshTools_ModelAlgo> & thePostProcessor);

		/****************** SetPreProcessor ******************/
		%feature("compactdefaultargs") SetPreProcessor;
		%feature("autodoc", "* Sets instance of pre-processing algorithm.
	:param thePreProcessor:
	:type thePreProcessor: IMeshTools_ModelAlgo
	:rtype: inline void") SetPreProcessor;
		inline void SetPreProcessor (const opencascade::handle<IMeshTools_ModelAlgo> & thePreProcessor);

};


%make_alias(IMeshTools_Context)

%extend IMeshTools_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IMeshTools_CurveTessellator *
************************************/
%nodefaultctor IMeshTools_CurveTessellator;
class IMeshTools_CurveTessellator : public Standard_Transient {
	public:
		/****************** PointsNb ******************/
		%feature("compactdefaultargs") PointsNb;
		%feature("autodoc", "* Returns number of tessellation points.
	:rtype: int") PointsNb;
		virtual Standard_Integer PointsNb ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns parameters of solution with the given index. @param theIndex index of tessellation point. @param thePoint tessellation point. @param theParameter parameters on PCurve corresponded to the solution. returns True in case of valid result, false elewhere.
	:param theIndex:
	:type theIndex: int
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theParameter:
	:type theParameter: float
	:rtype: bool") Value;
		virtual Standard_Boolean Value (const Standard_Integer theIndex,gp_Pnt & thePoint,Standard_Real &OutValue);

};


%make_alias(IMeshTools_CurveTessellator)

%extend IMeshTools_CurveTessellator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IMeshTools_MeshAlgo *
****************************/
%nodefaultctor IMeshTools_MeshAlgo;
class IMeshTools_MeshAlgo : public Standard_Transient {
	public:
		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs processing of the given face.
	:param theDFace:
	:type theDFace: IMeshData::IFaceHandle
	:param theParameters:
	:type theParameters: IMeshTools_Parameters
	:rtype: void") Perform;
		virtual void Perform (const IMeshData::IFaceHandle & theDFace,const IMeshTools_Parameters & theParameters);

};


%make_alias(IMeshTools_MeshAlgo)

%extend IMeshTools_MeshAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IMeshTools_MeshAlgoFactory *
***********************************/
%nodefaultctor IMeshTools_MeshAlgoFactory;
class IMeshTools_MeshAlgoFactory : public Standard_Transient {
	public:
		/****************** GetAlgo ******************/
		%feature("compactdefaultargs") GetAlgo;
		%feature("autodoc", "* Creates instance of meshing algorithm for the given type of surface.
	:param theSurfaceType:
	:type theSurfaceType: GeomAbs_SurfaceType
	:param theParameters:
	:type theParameters: IMeshTools_Parameters
	:rtype: opencascade::handle<IMeshTools_MeshAlgo>") GetAlgo;
		virtual opencascade::handle<IMeshTools_MeshAlgo> GetAlgo (const GeomAbs_SurfaceType theSurfaceType,const IMeshTools_Parameters & theParameters);

};


%make_alias(IMeshTools_MeshAlgoFactory)

%extend IMeshTools_MeshAlgoFactory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IMeshTools_MeshBuilder *
*******************************/
class IMeshTools_MeshBuilder : public Message_Algorithm {
	public:
		/****************** GetContext ******************/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "* Gets context of algorithm.
	:rtype: inline  opencascade::handle<IMeshTools_Context>") GetContext;
		inline const opencascade::handle<IMeshTools_Context> & GetContext ();

		/****************** IMeshTools_MeshBuilder ******************/
		%feature("compactdefaultargs") IMeshTools_MeshBuilder;
		%feature("autodoc", "* Constructor.
	:rtype: None") IMeshTools_MeshBuilder;
		 IMeshTools_MeshBuilder ();

		/****************** IMeshTools_MeshBuilder ******************/
		%feature("compactdefaultargs") IMeshTools_MeshBuilder;
		%feature("autodoc", "* Constructor.
	:param theContext:
	:type theContext: IMeshTools_Context
	:rtype: None") IMeshTools_MeshBuilder;
		 IMeshTools_MeshBuilder (const opencascade::handle<IMeshTools_Context> & theContext);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs meshing ot the shape using current context.
	:rtype: void") Perform;
		virtual void Perform ();

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "* Sets context for algorithm.
	:param theContext:
	:type theContext: IMeshTools_Context
	:rtype: inline void") SetContext;
		inline void SetContext (const opencascade::handle<IMeshTools_Context> & theContext);

};


%extend IMeshTools_MeshBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IMeshTools_ModelAlgo *
*****************************/
%nodefaultctor IMeshTools_ModelAlgo;
class IMeshTools_ModelAlgo : public Standard_Transient {
	public:
		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Exceptions protected processing of the given model.
	:param theModel:
	:type theModel: IMeshData_Model
	:param theParameters:
	:type theParameters: IMeshTools_Parameters
	:rtype: bool") Perform;
		Standard_Boolean Perform (const opencascade::handle<IMeshData_Model> & theModel,const IMeshTools_Parameters & theParameters);

};


%make_alias(IMeshTools_ModelAlgo)

%extend IMeshTools_ModelAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IMeshTools_ModelBuilder *
********************************/
%nodefaultctor IMeshTools_ModelBuilder;
class IMeshTools_ModelBuilder : public Message_Algorithm {
	public:
		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Exceptions protected method to create discrete model for the given shape. Returns nullptr in case of failure.
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theParameters:
	:type theParameters: IMeshTools_Parameters
	:rtype: opencascade::handle<IMeshData_Model>") Perform;
		opencascade::handle<IMeshData_Model> Perform (const TopoDS_Shape & theShape,const IMeshTools_Parameters & theParameters);

};


%extend IMeshTools_ModelBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IMeshTools_Parameters *
******************************/
class IMeshTools_Parameters {
	public:
		float Angle;
		float Deflection;
		float AngleInterior;
		float DeflectionInterior;
		float MinSize;
		bool InParallel;
		bool Relative;
		bool InternalVerticesMode;
		bool ControlSurfaceDeflection;
		bool CleanModel;
		bool AdjustMinSize;
		/****************** IMeshTools_Parameters ******************/
		%feature("compactdefaultargs") IMeshTools_Parameters;
		%feature("autodoc", "* Default constructor
	:rtype: None") IMeshTools_Parameters;
		 IMeshTools_Parameters ();

		/****************** RelMinSize ******************/
		%feature("compactdefaultargs") RelMinSize;
		%feature("autodoc", "* Returns factor used to compute default value of MinSize (minimum mesh edge length) from deflection
	:rtype: float") RelMinSize;
		static Standard_Real RelMinSize ();

};


%extend IMeshTools_Parameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IMeshTools_ShapeExplorer *
*********************************/
class IMeshTools_ShapeExplorer : public IMeshData_Shape {
	public:
		/****************** Accept ******************/
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "* Starts exploring of a shape.
	:param theVisitor:
	:type theVisitor: IMeshTools_ShapeVisitor
	:rtype: void") Accept;
		virtual void Accept (const opencascade::handle<IMeshTools_ShapeVisitor> & theVisitor);

		/****************** IMeshTools_ShapeExplorer ******************/
		%feature("compactdefaultargs") IMeshTools_ShapeExplorer;
		%feature("autodoc", "* Constructor.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") IMeshTools_ShapeExplorer;
		 IMeshTools_ShapeExplorer (const TopoDS_Shape & theShape);

};


%make_alias(IMeshTools_ShapeExplorer)

%extend IMeshTools_ShapeExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IMeshTools_ShapeVisitor *
********************************/
%nodefaultctor IMeshTools_ShapeVisitor;
class IMeshTools_ShapeVisitor : public Standard_Transient {
	public:
		/****************** Visit ******************/
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "* Handles TopoDS_Face object.
	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: void") Visit;
		virtual void Visit (const TopoDS_Face & theFace);

		/****************** Visit ******************/
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "* Handles TopoDS_Edge object.
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:rtype: void") Visit;
		virtual void Visit (const TopoDS_Edge & theEdge);

};


%make_alias(IMeshTools_ShapeVisitor)

%extend IMeshTools_ShapeVisitor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
