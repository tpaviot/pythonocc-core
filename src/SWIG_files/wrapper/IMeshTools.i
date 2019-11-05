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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define IMESHTOOLSDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=IMESHTOOLSDOCSTRING) IMeshTools

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include IMeshTools_headers.i

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

%nodefaultctor IMeshTools_Context;
class IMeshTools_Context : public IMeshData_Shape {
	public:
		%feature("compactdefaultargs") BuildModel;
		%feature("autodoc", "	* Builds model using assined model builder. returns True on success, False elsewhere.

	:rtype: bool
") BuildModel;
		virtual Standard_Boolean BuildModel ();
		%feature("compactdefaultargs") ChangeParameters;
		%feature("autodoc", "	* Gets reference to parameters to be used for meshing.

	:rtype: inline IMeshTools_Parameters
") ChangeParameters;
		inline IMeshTools_Parameters & ChangeParameters ();
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "	* Cleans temporary context data.

	:rtype: void
") Clean;
		virtual void Clean ();
		%feature("compactdefaultargs") DiscretizeEdges;
		%feature("autodoc", "	* Performs discretization of model edges using assigned edge discret algorithm. returns True on success, False elsewhere.

	:rtype: bool
") DiscretizeEdges;
		virtual Standard_Boolean DiscretizeEdges ();
		%feature("compactdefaultargs") DiscretizeFaces;
		%feature("autodoc", "	* Performs meshing of faces of discrete model using assigned meshing algorithm. returns True on success, False elsewhere.

	:rtype: bool
") DiscretizeFaces;
		virtual Standard_Boolean DiscretizeFaces ();
		%feature("compactdefaultargs") GetEdgeDiscret;
		%feature("autodoc", "	* Gets instance of a tool to be used to discretize edges of a model.

	:rtype: inline  opencascade::handle<IMeshTools_ModelAlgo>
") GetEdgeDiscret;
		inline const opencascade::handle<IMeshTools_ModelAlgo> & GetEdgeDiscret ();
		%feature("compactdefaultargs") GetFaceDiscret;
		%feature("autodoc", "	* Gets instance of meshing algorithm.

	:rtype: inline  opencascade::handle<IMeshTools_ModelAlgo>
") GetFaceDiscret;
		inline const opencascade::handle<IMeshTools_ModelAlgo> & GetFaceDiscret ();
		%feature("compactdefaultargs") GetModel;
		%feature("autodoc", "	* Returns discrete model of a shape.

	:rtype: inline  opencascade::handle<IMeshData_Model>
") GetModel;
		inline const opencascade::handle<IMeshData_Model> & GetModel ();
		%feature("compactdefaultargs") GetModelBuilder;
		%feature("autodoc", "	* Gets instance of a tool to be used to build discrete model.

	:rtype: inline  opencascade::handle<IMeshTools_ModelBuilder>
") GetModelBuilder;
		inline const opencascade::handle<IMeshTools_ModelBuilder> & GetModelBuilder ();
		%feature("compactdefaultargs") GetModelHealer;
		%feature("autodoc", "	* Gets instance of a tool to be used to heal discrete model.

	:rtype: inline  opencascade::handle<IMeshTools_ModelAlgo>
") GetModelHealer;
		inline const opencascade::handle<IMeshTools_ModelAlgo> & GetModelHealer ();
		%feature("compactdefaultargs") GetParameters;
		%feature("autodoc", "	* Gets parameters to be used for meshing.

	:rtype: inline  IMeshTools_Parameters
") GetParameters;
		inline const IMeshTools_Parameters & GetParameters ();
		%feature("compactdefaultargs") GetPostProcessor;
		%feature("autodoc", "	* Gets instance of post-processing algorithm.

	:rtype: inline  opencascade::handle<IMeshTools_ModelAlgo>
") GetPostProcessor;
		inline const opencascade::handle<IMeshTools_ModelAlgo> & GetPostProcessor ();
		%feature("compactdefaultargs") GetPreProcessor;
		%feature("autodoc", "	* Gets instance of pre-processing algorithm.

	:rtype: inline  opencascade::handle<IMeshTools_ModelAlgo>
") GetPreProcessor;
		inline const opencascade::handle<IMeshTools_ModelAlgo> & GetPreProcessor ();
		%feature("compactdefaultargs") HealModel;
		%feature("autodoc", "	* Performs healing of discrete model built by DiscretizeEdges() method using assigned healing algorithm. returns True on success, False elsewhere.

	:rtype: bool
") HealModel;
		virtual Standard_Boolean HealModel ();
		%feature("compactdefaultargs") IMeshTools_Context;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") IMeshTools_Context;
		 IMeshTools_Context ();
		%feature("compactdefaultargs") PostProcessModel;
		%feature("autodoc", "	* Performs post-processing of discrete model using assigned algorithm. returns True on success, False elsewhere.

	:rtype: bool
") PostProcessModel;
		virtual Standard_Boolean PostProcessModel ();
		%feature("compactdefaultargs") PreProcessModel;
		%feature("autodoc", "	* Performs pre-processing of discrete model using assigned algorithm. Performs auxiliary actions such as cleaning shape from old triangulation. returns True on success, False elsewhere.

	:rtype: bool
") PreProcessModel;
		virtual Standard_Boolean PreProcessModel ();
		%feature("compactdefaultargs") SetEdgeDiscret;
		%feature("autodoc", "	* Sets instance of a tool to be used to discretize edges of a model.

	:param theEdgeDiscret:
	:type theEdgeDiscret: opencascade::handle<IMeshTools_ModelAlgo> &
	:rtype: inline void
") SetEdgeDiscret;
		inline void SetEdgeDiscret (const opencascade::handle<IMeshTools_ModelAlgo> & theEdgeDiscret);
		%feature("compactdefaultargs") SetFaceDiscret;
		%feature("autodoc", "	* Sets instance of meshing algorithm.

	:param theFaceDiscret:
	:type theFaceDiscret: opencascade::handle<IMeshTools_ModelAlgo> &
	:rtype: inline void
") SetFaceDiscret;
		inline void SetFaceDiscret (const opencascade::handle<IMeshTools_ModelAlgo> & theFaceDiscret);
		%feature("compactdefaultargs") SetModelBuilder;
		%feature("autodoc", "	* Sets instance of a tool to be used to build discrete model.

	:param theBuilder:
	:type theBuilder: opencascade::handle<IMeshTools_ModelBuilder> &
	:rtype: inline void
") SetModelBuilder;
		inline void SetModelBuilder (const opencascade::handle<IMeshTools_ModelBuilder> & theBuilder);
		%feature("compactdefaultargs") SetModelHealer;
		%feature("autodoc", "	* Sets instance of a tool to be used to heal discrete model.

	:param theModelHealer:
	:type theModelHealer: opencascade::handle<IMeshTools_ModelAlgo> &
	:rtype: inline void
") SetModelHealer;
		inline void SetModelHealer (const opencascade::handle<IMeshTools_ModelAlgo> & theModelHealer);
		%feature("compactdefaultargs") SetPostProcessor;
		%feature("autodoc", "	* Sets instance of post-processing algorithm.

	:param thePostProcessor:
	:type thePostProcessor: opencascade::handle<IMeshTools_ModelAlgo> &
	:rtype: inline void
") SetPostProcessor;
		inline void SetPostProcessor (const opencascade::handle<IMeshTools_ModelAlgo> & thePostProcessor);
		%feature("compactdefaultargs") SetPreProcessor;
		%feature("autodoc", "	* Sets instance of pre-processing algorithm.

	:param thePreProcessor:
	:type thePreProcessor: opencascade::handle<IMeshTools_ModelAlgo> &
	:rtype: inline void
") SetPreProcessor;
		inline void SetPreProcessor (const opencascade::handle<IMeshTools_ModelAlgo> & thePreProcessor);
};


%make_alias(IMeshTools_Context)

%extend IMeshTools_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshTools_CurveTessellator;
class IMeshTools_CurveTessellator : public Standard_Transient {
	public:
		%feature("compactdefaultargs") PointsNb;
		%feature("autodoc", "	* Returns number of tessellation points.

	:rtype: int
") PointsNb;
		virtual Standard_Integer PointsNb ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns parameters of solution with the given index. @param theIndex index of tessellation point. @param thePoint tessellation point. @param theParameter parameters on PCurve corresponded to the solution. returns True in case of valid result, false elewhere.

	:param theIndex:
	:type theIndex: int
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theParameter:
	:type theParameter: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Integer theIndex,gp_Pnt & thePoint,Standard_Real &OutValue);
};


%make_alias(IMeshTools_CurveTessellator)

%extend IMeshTools_CurveTessellator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshTools_MeshAlgo;
class IMeshTools_MeshAlgo : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs processing of the given face.

	:param theDFace:
	:type theDFace: IMeshData::IFaceHandle &
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: void
") Perform;
		virtual void Perform (const IMeshData::IFaceHandle & theDFace,const IMeshTools_Parameters & theParameters);
};


%make_alias(IMeshTools_MeshAlgo)

%extend IMeshTools_MeshAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshTools_MeshAlgoFactory;
class IMeshTools_MeshAlgoFactory : public Standard_Transient {
	public:
		%feature("compactdefaultargs") GetAlgo;
		%feature("autodoc", "	* Creates instance of meshing algorithm for the given type of surface.

	:param theSurfaceType:
	:type theSurfaceType: GeomAbs_SurfaceType
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: opencascade::handle<IMeshTools_MeshAlgo>
") GetAlgo;
		virtual opencascade::handle<IMeshTools_MeshAlgo> GetAlgo (const GeomAbs_SurfaceType theSurfaceType,const IMeshTools_Parameters & theParameters);
};


%make_alias(IMeshTools_MeshAlgoFactory)

%extend IMeshTools_MeshAlgoFactory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshTools_MeshBuilder;
class IMeshTools_MeshBuilder : public Message_Algorithm {
	public:
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "	* Gets context of algorithm.

	:rtype: inline  opencascade::handle<IMeshTools_Context>
") GetContext;
		inline const opencascade::handle<IMeshTools_Context> & GetContext ();
		%feature("compactdefaultargs") IMeshTools_MeshBuilder;
		%feature("autodoc", "	* Constructor.

	:rtype: None
") IMeshTools_MeshBuilder;
		 IMeshTools_MeshBuilder ();
		%feature("compactdefaultargs") IMeshTools_MeshBuilder;
		%feature("autodoc", "	* Constructor.

	:param theContext:
	:type theContext: opencascade::handle<IMeshTools_Context> &
	:rtype: None
") IMeshTools_MeshBuilder;
		 IMeshTools_MeshBuilder (const opencascade::handle<IMeshTools_Context> & theContext);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs meshing ot the shape using current context.

	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* Sets context for algorithm.

	:param theContext:
	:type theContext: opencascade::handle<IMeshTools_Context> &
	:rtype: inline void
") SetContext;
		inline void SetContext (const opencascade::handle<IMeshTools_Context> & theContext);
};


%extend IMeshTools_MeshBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshTools_ModelAlgo;
class IMeshTools_ModelAlgo : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Exceptions protected processing of the given model.

	:param theModel:
	:type theModel: opencascade::handle<IMeshData_Model> &
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: bool
") Perform;
		Standard_Boolean Perform (const opencascade::handle<IMeshData_Model> & theModel,const IMeshTools_Parameters & theParameters);
};


%make_alias(IMeshTools_ModelAlgo)

%extend IMeshTools_ModelAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshTools_ModelBuilder;
class IMeshTools_ModelBuilder : public Message_Algorithm {
	public:
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Exceptions protected method to create discrete model for the given shape. Returns nullptr in case of failure.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theParameters:
	:type theParameters: IMeshTools_Parameters &
	:rtype: opencascade::handle<IMeshData_Model>
") Perform;
		opencascade::handle<IMeshData_Model> Perform (const TopoDS_Shape & theShape,const IMeshTools_Parameters & theParameters);
};


%extend IMeshTools_ModelBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshTools_Parameters;
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
		%feature("compactdefaultargs") IMeshTools_Parameters;
		%feature("autodoc", "	* Default constructor

	:rtype: None
") IMeshTools_Parameters;
		 IMeshTools_Parameters ();
		%feature("compactdefaultargs") RelMinSize;
		%feature("autodoc", "	* Returns factor used to compute default value of MinSize (minimum mesh edge length) from deflection

	:rtype: float
") RelMinSize;
		static Standard_Real RelMinSize ();
};


%extend IMeshTools_Parameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshTools_ShapeExplorer;
class IMeshTools_ShapeExplorer : public IMeshData_Shape {
	public:
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "	* Starts exploring of a shape.

	:param theVisitor:
	:type theVisitor: opencascade::handle<IMeshTools_ShapeVisitor> &
	:rtype: void
") Accept;
		virtual void Accept (const opencascade::handle<IMeshTools_ShapeVisitor> & theVisitor);
		%feature("compactdefaultargs") IMeshTools_ShapeExplorer;
		%feature("autodoc", "	* Constructor.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") IMeshTools_ShapeExplorer;
		 IMeshTools_ShapeExplorer (const TopoDS_Shape & theShape);
};


%make_alias(IMeshTools_ShapeExplorer)

%extend IMeshTools_ShapeExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IMeshTools_ShapeVisitor;
class IMeshTools_ShapeVisitor : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "	* Handles TopoDS_Face object.

	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: void
") Visit;
		virtual void Visit (const TopoDS_Face & theFace);
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "	* Handles TopoDS_Edge object.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:rtype: void
") Visit;
		virtual void Visit (const TopoDS_Edge & theEdge);
};


%make_alias(IMeshTools_ShapeVisitor)

%extend IMeshTools_ShapeVisitor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
