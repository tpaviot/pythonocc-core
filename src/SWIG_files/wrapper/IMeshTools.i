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
%define IMESHTOOLSDOCSTRING
"IMeshTools module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_imeshtools.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
		/****** IMeshTools_Context::IMeshTools_Context ******/
		/****** md5 signature: 35815624d31e5e47525fa105cbe24d16 ******/
		%feature("compactdefaultargs") IMeshTools_Context;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") IMeshTools_Context;
		 IMeshTools_Context();

		/****** IMeshTools_Context::BuildModel ******/
		/****** md5 signature: af00dd5e5c53c0adab36af636bffd87b ******/
		%feature("compactdefaultargs") BuildModel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Builds model using assigned model builder. return true on success, false elsewhere.
") BuildModel;
		virtual Standard_Boolean BuildModel();

		/****** IMeshTools_Context::ChangeParameters ******/
		/****** md5 signature: 7d357d2d707ea7c6e435ce7944cdbaeb ******/
		%feature("compactdefaultargs") ChangeParameters;
		%feature("autodoc", "Return
-------
IMeshTools_Parameters

Description
-----------
Gets reference to parameters to be used for meshing.
") ChangeParameters;
		IMeshTools_Parameters & ChangeParameters();

		/****** IMeshTools_Context::Clean ******/
		/****** md5 signature: 64b482de220663dd9c8dd510b1856f66 ******/
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "Return
-------
None

Description
-----------
Cleans temporary context data.
") Clean;
		virtual void Clean();

		/****** IMeshTools_Context::DiscretizeEdges ******/
		/****** md5 signature: a896f9d3e57ca6edd4aa6d6e666f13ac ******/
		%feature("compactdefaultargs") DiscretizeEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs discretization of model edges using assigned edge discret algorithm. return true on success, false elsewhere.
") DiscretizeEdges;
		virtual Standard_Boolean DiscretizeEdges();

		/****** IMeshTools_Context::DiscretizeFaces ******/
		/****** md5 signature: 30410098805ac70055b47926b85743f4 ******/
		%feature("compactdefaultargs") DiscretizeFaces;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange

Return
-------
bool

Description
-----------
Performs meshing of faces of discrete model using assigned meshing algorithm. return true on success, false elsewhere.
") DiscretizeFaces;
		virtual Standard_Boolean DiscretizeFaces(const Message_ProgressRange & theRange);

		/****** IMeshTools_Context::GetFaceDiscret ******/
		/****** md5 signature: ac18004e7beb332d1ceaa528692bb549 ******/
		%feature("compactdefaultargs") GetFaceDiscret;
		%feature("autodoc", "Return
-------
opencascade::handle<IMeshTools_ModelAlgo>

Description
-----------
Gets instance of meshing algorithm.
") GetFaceDiscret;
		const opencascade::handle<IMeshTools_ModelAlgo> & GetFaceDiscret();

		/****** IMeshTools_Context::GetModelHealer ******/
		/****** md5 signature: b4d4c336d1a6d7891f8c737038e3f01a ******/
		%feature("compactdefaultargs") GetModelHealer;
		%feature("autodoc", "Return
-------
opencascade::handle<IMeshTools_ModelAlgo>

Description
-----------
Gets instance of a tool to be used to heal discrete model.
") GetModelHealer;
		const opencascade::handle<IMeshTools_ModelAlgo> & GetModelHealer();

		/****** IMeshTools_Context::GetParameters ******/
		/****** md5 signature: 931d70f744696a19117df768eb22fb5f ******/
		%feature("compactdefaultargs") GetParameters;
		%feature("autodoc", "Return
-------
IMeshTools_Parameters

Description
-----------
Gets parameters to be used for meshing.
") GetParameters;
		const IMeshTools_Parameters & GetParameters();

		/****** IMeshTools_Context::GetPostProcessor ******/
		/****** md5 signature: 1739748d3e77ef562b0d3f182698dc5e ******/
		%feature("compactdefaultargs") GetPostProcessor;
		%feature("autodoc", "Return
-------
opencascade::handle<IMeshTools_ModelAlgo>

Description
-----------
Gets instance of post-processing algorithm.
") GetPostProcessor;
		const opencascade::handle<IMeshTools_ModelAlgo> & GetPostProcessor();

		/****** IMeshTools_Context::GetPreProcessor ******/
		/****** md5 signature: 56539ea9878f9c1d01f19d0eb2e718d3 ******/
		%feature("compactdefaultargs") GetPreProcessor;
		%feature("autodoc", "Return
-------
opencascade::handle<IMeshTools_ModelAlgo>

Description
-----------
Gets instance of pre-processing algorithm.
") GetPreProcessor;
		const opencascade::handle<IMeshTools_ModelAlgo> & GetPreProcessor();

		/****** IMeshTools_Context::HealModel ******/
		/****** md5 signature: 6c220b4e5704dbfadabaa5cfb9f5eecb ******/
		%feature("compactdefaultargs") HealModel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs healing of discrete model built by discretizeedges() method using assigned healing algorithm. return true on success, false elsewhere.
") HealModel;
		virtual Standard_Boolean HealModel();

		/****** IMeshTools_Context::PostProcessModel ******/
		/****** md5 signature: 2dc4eef313ca6f1d6c638d587292aa30 ******/
		%feature("compactdefaultargs") PostProcessModel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs post-processing of discrete model using assigned algorithm. return true on success, false elsewhere.
") PostProcessModel;
		virtual Standard_Boolean PostProcessModel();

		/****** IMeshTools_Context::PreProcessModel ******/
		/****** md5 signature: 7e76c2c8fd5e63eb40440a69ef84801b ******/
		%feature("compactdefaultargs") PreProcessModel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs pre-processing of discrete model using assigned algorithm. performs auxiliary actions such as cleaning shape from old triangulation. return true on success, false elsewhere.
") PreProcessModel;
		virtual Standard_Boolean PreProcessModel();

		/****** IMeshTools_Context::SetEdgeDiscret ******/
		/****** md5 signature: 291d959210d87db25e70ab768c6129d2 ******/
		%feature("compactdefaultargs") SetEdgeDiscret;
		%feature("autodoc", "
Parameters
----------
theEdgeDiscret: Handle ( IMeshTools_ModelAlgo )

Return
-------
None

Description
-----------
Sets instance of a tool to be used to discretize edges of a model.
") SetEdgeDiscret;
		void SetEdgeDiscret(const Handle ( IMeshTools_ModelAlgo ) & theEdgeDiscret);

		/****** IMeshTools_Context::SetFaceDiscret ******/
		/****** md5 signature: e5f88be0158f99b3a420ac23970c0074 ******/
		%feature("compactdefaultargs") SetFaceDiscret;
		%feature("autodoc", "
Parameters
----------
theFaceDiscret: IMeshTools_ModelAlgo

Return
-------
None

Description
-----------
Sets instance of meshing algorithm.
") SetFaceDiscret;
		void SetFaceDiscret(const opencascade::handle<IMeshTools_ModelAlgo> & theFaceDiscret);

		/****** IMeshTools_Context::SetModelBuilder ******/
		/****** md5 signature: a40dc296e168fb353aa98930e685955e ******/
		%feature("compactdefaultargs") SetModelBuilder;
		%feature("autodoc", "
Parameters
----------
theBuilder: Handle ( IMeshTools_ModelBuilder )

Return
-------
None

Description
-----------
Sets instance of a tool to be used to build discrete model.
") SetModelBuilder;
		void SetModelBuilder(const Handle ( IMeshTools_ModelBuilder ) & theBuilder);

		/****** IMeshTools_Context::SetModelHealer ******/
		/****** md5 signature: 5abcede778d7925cf655f85c1b509e25 ******/
		%feature("compactdefaultargs") SetModelHealer;
		%feature("autodoc", "
Parameters
----------
theModelHealer: IMeshTools_ModelAlgo

Return
-------
None

Description
-----------
Sets instance of a tool to be used to heal discrete model.
") SetModelHealer;
		void SetModelHealer(const opencascade::handle<IMeshTools_ModelAlgo> & theModelHealer);

		/****** IMeshTools_Context::SetPostProcessor ******/
		/****** md5 signature: ca1f00899134f5a301e82206ee35fe39 ******/
		%feature("compactdefaultargs") SetPostProcessor;
		%feature("autodoc", "
Parameters
----------
thePostProcessor: IMeshTools_ModelAlgo

Return
-------
None

Description
-----------
Sets instance of post-processing algorithm.
") SetPostProcessor;
		void SetPostProcessor(const opencascade::handle<IMeshTools_ModelAlgo> & thePostProcessor);

		/****** IMeshTools_Context::SetPreProcessor ******/
		/****** md5 signature: 20d32520a1da3e58d3431c9d7f17809e ******/
		%feature("compactdefaultargs") SetPreProcessor;
		%feature("autodoc", "
Parameters
----------
thePreProcessor: IMeshTools_ModelAlgo

Return
-------
None

Description
-----------
Sets instance of pre-processing algorithm.
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
		/****** IMeshTools_CurveTessellator::PointsNb ******/
		/****** md5 signature: a51e1d076dacc79fd77a501486f282d6 ******/
		%feature("compactdefaultargs") PointsNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of tessellation points.
") PointsNb;
		virtual Standard_Integer PointsNb();

		/****** IMeshTools_CurveTessellator::Value ******/
		/****** md5 signature: dac1f83a293b7019bfb321826ef79977 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theIndex: int
thePoint: gp_Pnt

Return
-------
theParameter: float

Description
-----------
Returns parameters of solution with the given index. @param theindex index of tessellation point. @param thepoint tessellation point. @param theparameter parameters on pcurve corresponded to the solution. return true in case of valid result, false elewhere.
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
		/****** IMeshTools_MeshAlgo::Perform ******/
		/****** md5 signature: aad6a988913ab82ff96ca40fc2df0cbf ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theDFace: IMeshData::IFaceHandle
theParameters: IMeshTools_Parameters
theRange: Message_ProgressRange

Return
-------
None

Description
-----------
Performs processing of the given face.
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
		/****** IMeshTools_MeshAlgoFactory::GetAlgo ******/
		/****** md5 signature: c4b6ee8a9f2c2898a11f9cc07086f9db ******/
		%feature("compactdefaultargs") GetAlgo;
		%feature("autodoc", "
Parameters
----------
theSurfaceType: GeomAbs_SurfaceType
theParameters: IMeshTools_Parameters

Return
-------
opencascade::handle<IMeshTools_MeshAlgo>

Description
-----------
Creates instance of meshing algorithm for the given type of surface.
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
		/****** IMeshTools_MeshBuilder::IMeshTools_MeshBuilder ******/
		/****** md5 signature: d470d8fcad2f2fa0c477903bb5692f58 ******/
		%feature("compactdefaultargs") IMeshTools_MeshBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") IMeshTools_MeshBuilder;
		 IMeshTools_MeshBuilder();

		/****** IMeshTools_MeshBuilder::IMeshTools_MeshBuilder ******/
		/****** md5 signature: dfa758d15aa71e4174ca043ace7bbb14 ******/
		%feature("compactdefaultargs") IMeshTools_MeshBuilder;
		%feature("autodoc", "
Parameters
----------
theContext: Handle ( IMeshTools_Context )

Return
-------
None

Description
-----------
Constructor.
") IMeshTools_MeshBuilder;
		 IMeshTools_MeshBuilder(const Handle ( IMeshTools_Context ) & theContext);

		/****** IMeshTools_MeshBuilder::Perform ******/
		/****** md5 signature: 3be29591efb89b639a8e87056a3f4905 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange

Return
-------
None

Description
-----------
Performs meshing to the shape using current context.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange);

		/****** IMeshTools_MeshBuilder::SetContext ******/
		/****** md5 signature: 8be830571630dd25f35c28c52255700c ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
theContext: Handle ( IMeshTools_Context )

Return
-------
None

Description
-----------
Sets context for algorithm.
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
		/****** IMeshTools_ModelAlgo::Perform ******/
		/****** md5 signature: b6028ab33842d8e695a3691d5ce74e92 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theModel: Handle ( IMeshData_Model )
theParameters: IMeshTools_Parameters
theRange: Message_ProgressRange

Return
-------
bool

Description
-----------
Exceptions protected processing of the given model.
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
		/****** IMeshTools_Parameters::IMeshTools_Parameters ******/
		/****** md5 signature: 354732bb8aea0c3d5affb49a91591d02 ******/
		%feature("compactdefaultargs") IMeshTools_Parameters;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") IMeshTools_Parameters;
		 IMeshTools_Parameters();

		/****** IMeshTools_Parameters::RelMinSize ******/
		/****** md5 signature: 43303359675dadfe3be4ebafa20ce69f ******/
		%feature("compactdefaultargs") RelMinSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns factor used to compute default value of minsize (minimum mesh edge length) from deflection.
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
		/****** IMeshTools_ShapeExplorer::IMeshTools_ShapeExplorer ******/
		/****** md5 signature: 806133c50173a565d94c675bf7d464cc ******/
		%feature("compactdefaultargs") IMeshTools_ShapeExplorer;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Constructor.
") IMeshTools_ShapeExplorer;
		 IMeshTools_ShapeExplorer(const TopoDS_Shape & theShape);

		/****** IMeshTools_ShapeExplorer::Accept ******/
		/****** md5 signature: cbab5f4b453459b79aedefc30807e3eb ******/
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "
Parameters
----------
theVisitor: Handle ( IMeshTools_ShapeVisitor )

Return
-------
None

Description
-----------
Starts exploring of a shape.
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
		/****** IMeshTools_ShapeVisitor::Visit ******/
		/****** md5 signature: 835bd61bce16ed0526f19322762467a4 ******/
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
None

Description
-----------
Handles topods_face object.
") Visit;
		virtual void Visit(const TopoDS_Face & theFace);

		/****** IMeshTools_ShapeVisitor::Visit ******/
		/****** md5 signature: 2edec6ae7a6e88b194166ba0926be0c2 ******/
		%feature("compactdefaultargs") Visit;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge

Return
-------
None

Description
-----------
Handles topods_edge object.
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
/* deprecated methods */
%pythoncode {
@deprecated
def IMeshTools_Parameters_RelMinSize(*args):
	return IMeshTools_Parameters.RelMinSize(*args)

}
