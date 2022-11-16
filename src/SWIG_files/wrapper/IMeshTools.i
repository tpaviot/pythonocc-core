/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_imeshtools.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<IMeshTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IMeshData_module.hxx>
#include<Message_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
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
%import Message.i
%import gp.i
%import GeomAbs.i
%import TopoDS.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum IMeshTools_MeshAlgoType {
	IMeshTools_MeshAlgoType_DEFAULT = - 1,
	IMeshTools_MeshAlgoType_Watson = 0,
	IMeshTools_MeshAlgoType_Delabella = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class IMeshTools_MeshAlgoType(IntEnum):
	IMeshTools_MeshAlgoType_DEFAULT = - 1
	IMeshTools_MeshAlgoType_Watson = 0
	IMeshTools_MeshAlgoType_Delabella = 1
IMeshTools_MeshAlgoType_DEFAULT = IMeshTools_MeshAlgoType.IMeshTools_MeshAlgoType_DEFAULT
IMeshTools_MeshAlgoType_Watson = IMeshTools_MeshAlgoType.IMeshTools_MeshAlgoType_Watson
IMeshTools_MeshAlgoType_Delabella = IMeshTools_MeshAlgoType.IMeshTools_MeshAlgoType_Delabella
};
/* end python proxy for enums */

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
		/****************** IMeshTools_Context ******************/
		/**** md5 signature: 35815624d31e5e47525fa105cbe24d16 ****/
		%feature("compactdefaultargs") IMeshTools_Context;
		%feature("autodoc", "Constructor.

Returns
-------
None
") IMeshTools_Context;
		 IMeshTools_Context();

		/****************** BuildModel ******************/
		/**** md5 signature: af00dd5e5c53c0adab36af636bffd87b ****/
		%feature("compactdefaultargs") BuildModel;
		%feature("autodoc", "Builds model using assigned model builder. returns true on success, false elsewhere.

Returns
-------
bool
") BuildModel;
		virtual Standard_Boolean BuildModel();

		/****************** ChangeParameters ******************/
		/**** md5 signature: 7d357d2d707ea7c6e435ce7944cdbaeb ****/
		%feature("compactdefaultargs") ChangeParameters;
		%feature("autodoc", "Gets reference to parameters to be used for meshing.

Returns
-------
IMeshTools_Parameters
") ChangeParameters;
		IMeshTools_Parameters & ChangeParameters();

		/****************** Clean ******************/
		/**** md5 signature: 64b482de220663dd9c8dd510b1856f66 ****/
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "Cleans temporary context data.

Returns
-------
None
") Clean;
		virtual void Clean();

		/****************** DiscretizeEdges ******************/
		/**** md5 signature: a896f9d3e57ca6edd4aa6d6e666f13ac ****/
		%feature("compactdefaultargs") DiscretizeEdges;
		%feature("autodoc", "Performs discretization of model edges using assigned edge discret algorithm. returns true on success, false elsewhere.

Returns
-------
bool
") DiscretizeEdges;
		virtual Standard_Boolean DiscretizeEdges();

		/****************** DiscretizeFaces ******************/
		/**** md5 signature: 30410098805ac70055b47926b85743f4 ****/
		%feature("compactdefaultargs") DiscretizeFaces;
		%feature("autodoc", "Performs meshing of faces of discrete model using assigned meshing algorithm. returns true on success, false elsewhere.

Parameters
----------
theRange: Message_ProgressRange

Returns
-------
bool
") DiscretizeFaces;
		virtual Standard_Boolean DiscretizeFaces(const Message_ProgressRange & theRange);

		/****************** GetFaceDiscret ******************/
		/**** md5 signature: ac18004e7beb332d1ceaa528692bb549 ****/
		%feature("compactdefaultargs") GetFaceDiscret;
		%feature("autodoc", "Gets instance of meshing algorithm.

Returns
-------
opencascade::handle<IMeshTools_ModelAlgo>
") GetFaceDiscret;
		const opencascade::handle<IMeshTools_ModelAlgo> & GetFaceDiscret();

		/****************** GetModelHealer ******************/
		/**** md5 signature: b4d4c336d1a6d7891f8c737038e3f01a ****/
		%feature("compactdefaultargs") GetModelHealer;
		%feature("autodoc", "Gets instance of a tool to be used to heal discrete model.

Returns
-------
opencascade::handle<IMeshTools_ModelAlgo>
") GetModelHealer;
		const opencascade::handle<IMeshTools_ModelAlgo> & GetModelHealer();

		/****************** GetParameters ******************/
		/**** md5 signature: 931d70f744696a19117df768eb22fb5f ****/
		%feature("compactdefaultargs") GetParameters;
		%feature("autodoc", "Gets parameters to be used for meshing.

Returns
-------
IMeshTools_Parameters
") GetParameters;
		const IMeshTools_Parameters & GetParameters();

		/****************** GetPostProcessor ******************/
		/**** md5 signature: 1739748d3e77ef562b0d3f182698dc5e ****/
		%feature("compactdefaultargs") GetPostProcessor;
		%feature("autodoc", "Gets instance of post-processing algorithm.

Returns
-------
opencascade::handle<IMeshTools_ModelAlgo>
") GetPostProcessor;
		const opencascade::handle<IMeshTools_ModelAlgo> & GetPostProcessor();

		/****************** GetPreProcessor ******************/
		/**** md5 signature: 56539ea9878f9c1d01f19d0eb2e718d3 ****/
		%feature("compactdefaultargs") GetPreProcessor;
		%feature("autodoc", "Gets instance of pre-processing algorithm.

Returns
-------
opencascade::handle<IMeshTools_ModelAlgo>
") GetPreProcessor;
		const opencascade::handle<IMeshTools_ModelAlgo> & GetPreProcessor();

		/****************** HealModel ******************/
		/**** md5 signature: 6c220b4e5704dbfadabaa5cfb9f5eecb ****/
		%feature("compactdefaultargs") HealModel;
		%feature("autodoc", "Performs healing of discrete model built by discretizeedges() method using assigned healing algorithm. returns true on success, false elsewhere.

Returns
-------
bool
") HealModel;
		virtual Standard_Boolean HealModel();

		/****************** PostProcessModel ******************/
		/**** md5 signature: 2dc4eef313ca6f1d6c638d587292aa30 ****/
		%feature("compactdefaultargs") PostProcessModel;
		%feature("autodoc", "Performs post-processing of discrete model using assigned algorithm. returns true on success, false elsewhere.

Returns
-------
bool
") PostProcessModel;
		virtual Standard_Boolean PostProcessModel();

		/****************** PreProcessModel ******************/
		/**** md5 signature: 7e76c2c8fd5e63eb40440a69ef84801b ****/
		%feature("compactdefaultargs") PreProcessModel;
		%feature("autodoc", "Performs pre-processing of discrete model using assigned algorithm. performs auxiliary actions such as cleaning shape from old triangulation. returns true on success, false elsewhere.

Returns
-------
bool
") PreProcessModel;
		virtual Standard_Boolean PreProcessModel();

		/****************** SetEdgeDiscret ******************/
		/**** md5 signature: 291d959210d87db25e70ab768c6129d2 ****/
		%feature("compactdefaultargs") SetEdgeDiscret;
		%feature("autodoc", "Sets instance of a tool to be used to discretize edges of a model.

Parameters
----------
theEdgeDiscret: Handle ( IMeshTools_ModelAlgo )

Returns
-------
None
") SetEdgeDiscret;
		void SetEdgeDiscret(const Handle ( IMeshTools_ModelAlgo ) & theEdgeDiscret);

		/****************** SetFaceDiscret ******************/
		/**** md5 signature: e5f88be0158f99b3a420ac23970c0074 ****/
		%feature("compactdefaultargs") SetFaceDiscret;
		%feature("autodoc", "Sets instance of meshing algorithm.

Parameters
----------
theFaceDiscret: IMeshTools_ModelAlgo

Returns
-------
None
") SetFaceDiscret;
		void SetFaceDiscret(const opencascade::handle<IMeshTools_ModelAlgo> & theFaceDiscret);

		/****************** SetModelBuilder ******************/
		/**** md5 signature: a40dc296e168fb353aa98930e685955e ****/
		%feature("compactdefaultargs") SetModelBuilder;
		%feature("autodoc", "Sets instance of a tool to be used to build discrete model.

Parameters
----------
theBuilder: Handle ( IMeshTools_ModelBuilder )

Returns
-------
None
") SetModelBuilder;
		void SetModelBuilder(const Handle ( IMeshTools_ModelBuilder ) & theBuilder);

		/****************** SetModelHealer ******************/
		/**** md5 signature: 5abcede778d7925cf655f85c1b509e25 ****/
		%feature("compactdefaultargs") SetModelHealer;
		%feature("autodoc", "Sets instance of a tool to be used to heal discrete model.

Parameters
----------
theModelHealer: IMeshTools_ModelAlgo

Returns
-------
None
") SetModelHealer;
		void SetModelHealer(const opencascade::handle<IMeshTools_ModelAlgo> & theModelHealer);

		/****************** SetPostProcessor ******************/
		/**** md5 signature: ca1f00899134f5a301e82206ee35fe39 ****/
		%feature("compactdefaultargs") SetPostProcessor;
		%feature("autodoc", "Sets instance of post-processing algorithm.

Parameters
----------
thePostProcessor: IMeshTools_ModelAlgo

Returns
-------
None
") SetPostProcessor;
		void SetPostProcessor(const opencascade::handle<IMeshTools_ModelAlgo> & thePostProcessor);

		/****************** SetPreProcessor ******************/
		/**** md5 signature: 20d32520a1da3e58d3431c9d7f17809e ****/
		%feature("compactdefaultargs") SetPreProcessor;
		%feature("autodoc", "Sets instance of pre-processing algorithm.

Parameters
----------
thePreProcessor: IMeshTools_ModelAlgo

Returns
-------
None
") SetPreProcessor;
		void SetPreProcessor(const opencascade::handle<IMeshTools_ModelAlgo> & thePreProcessor);

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
		/**** md5 signature: a51e1d076dacc79fd77a501486f282d6 ****/
		%feature("compactdefaultargs") PointsNb;
		%feature("autodoc", "Returns number of tessellation points.

Returns
-------
int
") PointsNb;
		virtual Standard_Integer PointsNb();

		/****************** Value ******************/
		/**** md5 signature: dac1f83a293b7019bfb321826ef79977 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns parameters of solution with the given index. @param theindex index of tessellation point. @param thepoint tessellation point. @param theparameter parameters on pcurve corresponded to the solution. returns true in case of valid result, false elewhere.

Parameters
----------
theIndex: int
thePoint: gp_Pnt

Returns
-------
theParameter: float
") Value;
		virtual Standard_Boolean Value(const Standard_Integer theIndex, gp_Pnt & thePoint, Standard_Real &OutValue);

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
		/**** md5 signature: aad6a988913ab82ff96ca40fc2df0cbf ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs processing of the given face.

Parameters
----------
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters
theRange: Message_ProgressRange

Returns
-------
None
") Perform;
		virtual void Perform(const IMeshData::IFaceHandle & theDFace, const IMeshTools_Parameters & theParameters, const Message_ProgressRange & theRange);

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
		/**** md5 signature: c4b6ee8a9f2c2898a11f9cc07086f9db ****/
		%feature("compactdefaultargs") GetAlgo;
		%feature("autodoc", "Creates instance of meshing algorithm for the given type of surface.

Parameters
----------
theSurfaceType: GeomAbs_SurfaceType
theParameters: IMeshTools_Parameters

Returns
-------
opencascade::handle<IMeshTools_MeshAlgo>
") GetAlgo;
		virtual opencascade::handle<IMeshTools_MeshAlgo> GetAlgo(const GeomAbs_SurfaceType theSurfaceType, const IMeshTools_Parameters & theParameters);

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
		/****************** IMeshTools_MeshBuilder ******************/
		/**** md5 signature: d470d8fcad2f2fa0c477903bb5692f58 ****/
		%feature("compactdefaultargs") IMeshTools_MeshBuilder;
		%feature("autodoc", "Constructor.

Returns
-------
None
") IMeshTools_MeshBuilder;
		 IMeshTools_MeshBuilder();

		/****************** IMeshTools_MeshBuilder ******************/
		/**** md5 signature: dfa758d15aa71e4174ca043ace7bbb14 ****/
		%feature("compactdefaultargs") IMeshTools_MeshBuilder;
		%feature("autodoc", "Constructor.

Parameters
----------
theContext: Handle ( IMeshTools_Context )

Returns
-------
None
") IMeshTools_MeshBuilder;
		 IMeshTools_MeshBuilder(const Handle ( IMeshTools_Context ) & theContext);

		/****************** Perform ******************/
		/**** md5 signature: 3be29591efb89b639a8e87056a3f4905 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs meshing to the shape using current context.

Parameters
----------
theRange: Message_ProgressRange

Returns
-------
None
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange);

		/****************** SetContext ******************/
		/**** md5 signature: 8be830571630dd25f35c28c52255700c ****/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets context for algorithm.

Parameters
----------
theContext: Handle ( IMeshTools_Context )

Returns
-------
None
") SetContext;
		void SetContext(const Handle ( IMeshTools_Context ) & theContext);

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
		/**** md5 signature: b6028ab33842d8e695a3691d5ce74e92 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Exceptions protected processing of the given model.

Parameters
----------
theModel: Handle ( IMeshData_Model )
theParameters: IMeshTools_Parameters
theRange: Message_ProgressRange

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const Handle ( IMeshData_Model ) & theModel, const IMeshTools_Parameters & theParameters, const Message_ProgressRange & theRange);

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
		IMeshTools_MeshAlgoType MeshAlgo;
		float Angle;
		float Deflection;
		float AngleInterior;
		float DeflectionInterior;
		float MinSize;
		bool InParallel;
		bool Relative;
		bool InternalVerticesMode;
		bool ControlSurfaceDeflection;
		bool EnableControlSurfaceDeflectionAllSurfaces;
		bool CleanModel;
		bool AdjustMinSize;
		bool ForceFaceDeflection;
		bool AllowQualityDecrease;
		/****************** IMeshTools_Parameters ******************/
		/**** md5 signature: 354732bb8aea0c3d5affb49a91591d02 ****/
		%feature("compactdefaultargs") IMeshTools_Parameters;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") IMeshTools_Parameters;
		 IMeshTools_Parameters();

		/****************** RelMinSize ******************/
		/**** md5 signature: 43303359675dadfe3be4ebafa20ce69f ****/
		%feature("compactdefaultargs") RelMinSize;
		%feature("autodoc", "Returns factor used to compute default value of minsize (minimum mesh edge length) from deflection.

Returns
-------
float
") RelMinSize;
		static Standard_Real RelMinSize();

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
		/****************** IMeshTools_ShapeExplorer ******************/
		/**** md5 signature: 806133c50173a565d94c675bf7d464cc ****/
		%feature("compactdefaultargs") IMeshTools_ShapeExplorer;
		%feature("autodoc", "Constructor.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") IMeshTools_ShapeExplorer;
		 IMeshTools_ShapeExplorer(const TopoDS_Shape & theShape);

		/****************** Accept ******************/
		/**** md5 signature: cbab5f4b453459b79aedefc30807e3eb ****/
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "Starts exploring of a shape.

Parameters
----------
theVisitor: Handle ( IMeshTools_ShapeVisitor )

Returns
-------
None
") Accept;
		virtual void Accept(const Handle ( IMeshTools_ShapeVisitor ) & theVisitor);

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
		/**** md5 signature: 835bd61bce16ed0526f19322762467a4 ****/
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "Handles topods_face object.

Parameters
----------
theFace: TopoDS_Face

Returns
-------
None
") Visit;
		virtual void Visit(const TopoDS_Face & theFace);

		/****************** Visit ******************/
		/**** md5 signature: 2edec6ae7a6e88b194166ba0926be0c2 ****/
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "Handles topods_edge object.

Parameters
----------
theEdge: TopoDS_Edge

Returns
-------
None
") Visit;
		virtual void Visit(const TopoDS_Edge & theEdge);

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
/* class aliases */
%pythoncode {
}
