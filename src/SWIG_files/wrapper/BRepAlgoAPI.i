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
%define BREPALGOAPIDOCSTRING
"BRepAlgoAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepalgoapi.html"
%enddef
%module (package="OCC.Core", docstring=BREPALGOAPIDOCSTRING) BRepAlgoAPI


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
#include<BRepAlgoAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BOPAlgo_module.hxx>
#include<TopoDS_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<TopTools_module.hxx>
#include<BRepTools_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<TopLoc_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<IntTools_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Extrema_module.hxx>
#include<Adaptor2d_module.hxx>
#include<IntSurf_module.hxx>
#include<BOPDS_module.hxx>
#include<IntPatch_module.hxx>
#include<Approx_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Message_module.hxx>
#include<AppParCurves_module.hxx>
#include<Bnd_module.hxx>
#include<BRep_module.hxx>
#include<TShort_module.hxx>
#include<Poly_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BOPAlgo.i
%import TopoDS.i
%import BRepBuilderAPI.i
%import TopTools.i
%import BRepTools.i
%import gp.i
%import Geom.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};


%include "BRepAlgoAPI_Algo.hxx";
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

/**************************
* class BRepAlgoAPI_Check *
**************************/
class BRepAlgoAPI_Check : public BOPAlgo_Options {
	public:
		/****************** BRepAlgoAPI_Check ******************/
		/**** md5 signature: 411402657614d45c8444ed8f583c4d89 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check();

		/****************** BRepAlgoAPI_Check ******************/
		/**** md5 signature: 0d046774211ccfb7a57473b281d4869c ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "Constructor for checking single shape. //! @param thes [in] - the shape to check; @param btestse [in] - flag which specifies whether to check the shape  on small edges or not; by default it is set to true; @param btestsi [in] - flag which specifies whether to check the shape  on self-interference or not; by default it is set to true;.

Parameters
----------
theS: TopoDS_Shape
bTestSE: bool,optional
	default value is Standard_True
bTestSI: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check(const TopoDS_Shape & theS, const Standard_Boolean bTestSE = Standard_True, const Standard_Boolean bTestSI = Standard_True);

		/****************** BRepAlgoAPI_Check ******************/
		/**** md5 signature: 6068a5b505f5a3d60d502aaacd5e7d72 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "Constructor for checking the couple of shapes. additionally to the validity checks of each given shape, the types of the given shapes will be checked on validity for boolean operation of given type. //! @param thes1 [in] - the first shape to check; @param thes2 [in] - the second shape to check; @param theop [in] - the type of boolean operation for which the validity of given shapes should be checked. @param btestse [in] - flag which specifies whether to check the shape  on small edges or not; by default it is set to true; @param btestsi [in] - flag which specifies whether to check the shape  on self-interference or not; by default it is set to true;.

Parameters
----------
theS1: TopoDS_Shape
theS2: TopoDS_Shape
theOp: BOPAlgo_Operation,optional
	default value is BOPAlgo_UNKNOWN
bTestSE: bool,optional
	default value is Standard_True
bTestSI: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check(const TopoDS_Shape & theS1, const TopoDS_Shape & theS2, const BOPAlgo_Operation theOp = BOPAlgo_UNKNOWN, const Standard_Boolean bTestSE = Standard_True, const Standard_Boolean bTestSI = Standard_True);

		/****************** IsValid ******************/
		/**** md5 signature: c1993b3b31d320b598a9a9b27c56914e ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Shows whether shape(s) valid or not.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the check.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Result ******************/
		/**** md5 signature: 7cf3309b46dab6da497e78cfc1a9af75 ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns faulty shapes.

Returns
-------
BOPAlgo_ListOfCheckResult
") Result;
		const BOPAlgo_ListOfCheckResult & Result();

		/****************** SetData ******************/
		/**** md5 signature: c1fd665a073df98354476ae857f43c48 ****/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "Initializes the algorithm with single shape. //! @param thes [in] - the shape to check; @param btestse [in] - flag which specifies whether to check the shape  on small edges or not; by default it is set to true; @param btestsi [in] - flag which specifies whether to check the shape  on self-interference or not; by default it is set to true;.

Parameters
----------
theS: TopoDS_Shape
bTestSE: bool,optional
	default value is Standard_True
bTestSI: bool,optional
	default value is Standard_True

Returns
-------
None
") SetData;
		void SetData(const TopoDS_Shape & theS, const Standard_Boolean bTestSE = Standard_True, const Standard_Boolean bTestSI = Standard_True);

		/****************** SetData ******************/
		/**** md5 signature: 80850e26186481dcc7772de06de5db11 ****/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "Initializes the algorithm with couple of shapes. additionally to the validity checks of each given shape, the types of the given shapes will be checked on validity for boolean operation of given type. //! @param thes1 [in] - the first shape to check; @param thes2 [in] - the second shape to check; @param theop [in] - the type of boolean operation for which the validity of given shapes should be checked. @param btestse [in] - flag which specifies whether to check the shape  on small edges or not; by default it is set to true; @param btestsi [in] - flag which specifies whether to check the shape  on self-interference or not; by default it is set to true;.

Parameters
----------
theS1: TopoDS_Shape
theS2: TopoDS_Shape
theOp: BOPAlgo_Operation,optional
	default value is BOPAlgo_UNKNOWN
bTestSE: bool,optional
	default value is Standard_True
bTestSI: bool,optional
	default value is Standard_True

Returns
-------
None
") SetData;
		void SetData(const TopoDS_Shape & theS1, const TopoDS_Shape & theS2, const BOPAlgo_Operation theOp = BOPAlgo_UNKNOWN, const Standard_Boolean bTestSE = Standard_True, const Standard_Boolean bTestSI = Standard_True);

};


%extend BRepAlgoAPI_Check {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepAlgoAPI_Algo *
*************************/
%nodefaultctor BRepAlgoAPI_Algo;
%ignore BRepAlgoAPI_Algo::~BRepAlgoAPI_Algo();
class BRepAlgoAPI_Algo : public BRepBuilderAPI_MakeShape, protected BOPAlgo_Options {
	public:
		/****************** Shape ******************/
		/**** md5 signature: b8642bc5a50083ee24c608b46f5bf1c8 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		virtual const TopoDS_Shape Shape();

};


%extend BRepAlgoAPI_Algo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepAlgoAPI_BuilderAlgo *
********************************/
class BRepAlgoAPI_BuilderAlgo : public BRepAlgoAPI_Algo {
	public:
		/****************** BRepAlgoAPI_BuilderAlgo ******************/
		/**** md5 signature: f034b0ea83263b0b12a5034e2ab03c28 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_BuilderAlgo;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_BuilderAlgo;
		 BRepAlgoAPI_BuilderAlgo();

		/****************** BRepAlgoAPI_BuilderAlgo ******************/
		/**** md5 signature: 87f0646930c224a38e316c8395128e53 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_BuilderAlgo;
		%feature("autodoc", "Constructor with prepared filler object.

Parameters
----------
thePF: BOPAlgo_PaveFiller

Returns
-------
None
") BRepAlgoAPI_BuilderAlgo;
		 BRepAlgoAPI_BuilderAlgo(const BOPAlgo_PaveFiller & thePF);

		/****************** Arguments ******************/
		/**** md5 signature: 5c44416d889811943ccde89673d3c270 ****/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Gets the arguments.

Returns
-------
TopTools_ListOfShape
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs the algorithm.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Builder ******************/
		/**** md5 signature: 8b185d6cf1a66c51174428861a33b6c7 ****/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "Returns the building tool.

Returns
-------
BOPAlgo_PBuilder
") Builder;
		const BOPAlgo_PBuilder & Builder();

		/****************** CheckInverted ******************/
		/**** md5 signature: ce3c18df15bc3282101b99ee82f78b47 ****/
		%feature("compactdefaultargs") CheckInverted;
		%feature("autodoc", "Returns the flag defining whether the check for input solids on inverted status should be performed or not.

Returns
-------
bool
") CheckInverted;
		Standard_Boolean CheckInverted();

		/****************** DSFiller ******************/
		/**** md5 signature: eacda80fa3f8437b06bd46026236195a ****/
		%feature("compactdefaultargs") DSFiller;
		%feature("autodoc", "Returns the intersection tool.

Returns
-------
BOPAlgo_PPaveFiller
") DSFiller;
		const BOPAlgo_PPaveFiller & DSFiller();

		/****************** Generated ******************/
		/**** md5 signature: 6765eaeea6b04c9e5e12d95bf0d36ae9 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <thes>. in frames of boolean operations algorithms only edges and faces could have generated elements, as only they produce new elements during intersection: - edges can generate new vertices; - faces can generate new edges and vertices.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & theS);

		/****************** Glue ******************/
		/**** md5 signature: 2a0ac34b43f154dd0238ac1408d9079b ****/
		%feature("compactdefaultargs") Glue;
		%feature("autodoc", "Returns the glue option of the algorithm.

Returns
-------
BOPAlgo_GlueEnum
") Glue;
		BOPAlgo_GlueEnum Glue();

		/****************** HasDeleted ******************/
		/**** md5 signature: 62e1a47bba6730979f45045197c457ad ****/
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "Returns true if any of the input shapes has been deleted during operation. normally, general fuse operation should not have deleted elements, but all derived operation can have.

Returns
-------
bool
") HasDeleted;
		virtual Standard_Boolean HasDeleted();

		/****************** HasGenerated ******************/
		/**** md5 signature: 41e62931be9792b7588a37969bdd21d8 ****/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "Returns true if any of the input shapes has generated shapes during operation.

Returns
-------
bool
") HasGenerated;
		virtual Standard_Boolean HasGenerated();

		/****************** HasHistory ******************/
		/**** md5 signature: 707ba290c9cd0157e12b7038a0944657 ****/
		%feature("compactdefaultargs") HasHistory;
		%feature("autodoc", "Returns flag of history availability.

Returns
-------
bool
") HasHistory;
		Standard_Boolean HasHistory();

		/****************** HasModified ******************/
		/**** md5 signature: 33dead3a6879f4d3e05d3f85aabe6d13 ****/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "Returns true if any of the input shapes has been modified during operation.

Returns
-------
bool
") HasModified;
		virtual Standard_Boolean HasModified();

		/****************** History ******************/
		/**** md5 signature: a47770f1ee9d6f229a149d416a698dc5 ****/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "History tool.

Returns
-------
opencascade::handle<BRepTools_History>
") History;
		opencascade::handle<BRepTools_History> History();

		/****************** IsDeleted ******************/
		/**** md5 signature: 431a14f43afb5fe71090f69dcb3e4037 ****/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Checks if the shape <thes> has been completely removed from the result, i.e. the result does not contain the shape itself and any of its splits. returns true if the shape has been deleted.

Parameters
----------
aS: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & aS);

		/****************** Modified ******************/
		/**** md5 signature: 4e20601bbc1c3aead85ab39355caf9fd ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the shapes modified from the shape <thes>. if any, the list will contain only those splits of the given shape, contained in the result.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & theS);

		/****************** NonDestructive ******************/
		/**** md5 signature: debf4165891df54bd9a565d235f0d378 ****/
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "Returns the flag that defines the mode of treatment. in non-destructive mode the argument shapes are not modified. instead a copy of a sub-shape is created in the result if it is needed to be updated.

Returns
-------
bool
") NonDestructive;
		Standard_Boolean NonDestructive();

		/****************** SectionEdges ******************/
		/**** md5 signature: 8d1d78adb60588ec6c6d9bac5ddb95cb ****/
		%feature("compactdefaultargs") SectionEdges;
		%feature("autodoc", "Returns a list of section edges. the edges represent the result of intersection between arguments of operation.

Returns
-------
TopTools_ListOfShape
") SectionEdges;
		const TopTools_ListOfShape & SectionEdges();

		/****************** SetArguments ******************/
		/**** md5 signature: c8050caf960534f7d5c8a2cd210eb861 ****/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "Sets the arguments.

Parameters
----------
theLS: TopTools_ListOfShape

Returns
-------
None
") SetArguments;
		void SetArguments(const TopTools_ListOfShape & theLS);

		/****************** SetCheckInverted ******************/
		/**** md5 signature: 9645001f4ab756df382f60cfc76654bc ****/
		%feature("compactdefaultargs") SetCheckInverted;
		%feature("autodoc", "Enables/disables the check of the input solids for inverted status.

Parameters
----------
theCheck: bool

Returns
-------
None
") SetCheckInverted;
		void SetCheckInverted(const Standard_Boolean theCheck);

		/****************** SetGlue ******************/
		/**** md5 signature: bae09c43d6b988a5d7d19b6376a5aa05 ****/
		%feature("compactdefaultargs") SetGlue;
		%feature("autodoc", "Sets the glue option for the algorithm, which allows increasing performance of the intersection of the input shapes.

Parameters
----------
theGlue: BOPAlgo_GlueEnum

Returns
-------
None
") SetGlue;
		void SetGlue(const BOPAlgo_GlueEnum theGlue);

		/****************** SetNonDestructive ******************/
		/**** md5 signature: 0a29c6536a8337536ce71b892337fbbb ****/
		%feature("compactdefaultargs") SetNonDestructive;
		%feature("autodoc", "Sets the flag that defines the mode of treatment. in non-destructive mode the argument shapes are not modified. instead a copy of a sub-shape is created in the result if it is needed to be updated.

Parameters
----------
theFlag: bool

Returns
-------
None
") SetNonDestructive;
		void SetNonDestructive(const Standard_Boolean theFlag);

		/****************** SetToFillHistory ******************/
		/**** md5 signature: 0645816549ab38af8118c8f63f46c0ea ****/
		%feature("compactdefaultargs") SetToFillHistory;
		%feature("autodoc", "Allows disabling the history collection.

Parameters
----------
theHistFlag: bool

Returns
-------
None
") SetToFillHistory;
		void SetToFillHistory(const Standard_Boolean theHistFlag);

		/****************** SimplifyResult ******************/
		/**** md5 signature: 88e0cdcd55300620756ca014f3c6371d ****/
		%feature("compactdefaultargs") SimplifyResult;
		%feature("autodoc", "Simplification of the result shape is performed by the means of *shapeupgrade_unifysamedomain* algorithm. the result of the operation will be overwritten with the simplified result. //! the simplification is performed without creation of the internal shapes, i.e. shapes connections will never be broken. //! simplification is performed on the whole result shape. thus, if the input shapes contained connected tangent edges or faces unmodified during the operation they will also be unified. //! after simplification, the history of result simplification is merged into the main history of operation. so, it is taken into account when asking for modified, generated and deleted shapes. //! some options of the main operation are passed into the unifier: - fuzzy tolerance of the operation is given to the unifier as the linear tolerance. - non destructive mode here controls the safe input mode in unifier. //! @param theunifyedges controls the edges unification. true by default. @param theunifyfaces controls the faces unification. true by default. @param theangulartol angular criteria for tangency of edges and faces.  precision::angular() by default.

Parameters
----------
theUnifyEdges: bool,optional
	default value is Standard_True
theUnifyFaces: bool,optional
	default value is Standard_True
theAngularTol: float,optional
	default value is Precision::Angular()

Returns
-------
None
") SimplifyResult;
		void SimplifyResult(const Standard_Boolean theUnifyEdges = Standard_True, const Standard_Boolean theUnifyFaces = Standard_True, const Standard_Real theAngularTol = Precision::Angular());

};


%extend BRepAlgoAPI_BuilderAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepAlgoAPI_Defeaturing *
********************************/
class BRepAlgoAPI_Defeaturing : public BRepAlgoAPI_Algo {
	public:
		/****************** BRepAlgoAPI_Defeaturing ******************/
		/**** md5 signature: c00608d9bba8810c82a05b46e3e4f871 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Defeaturing;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Defeaturing;
		 BRepAlgoAPI_Defeaturing();

		/****************** AddFaceToRemove ******************/
		/**** md5 signature: 26c9409a587f43491552f28dbeb97ed4 ****/
		%feature("compactdefaultargs") AddFaceToRemove;
		%feature("autodoc", "Adds the features to remove from the input shape. @param theface [in] the shape to extract the faces for removal.

Parameters
----------
theFace: TopoDS_Shape

Returns
-------
None
") AddFaceToRemove;
		void AddFaceToRemove(const TopoDS_Shape & theFace);

		/****************** AddFacesToRemove ******************/
		/**** md5 signature: de6da71dc89a49bec36f3c8a28a2c6dd ****/
		%feature("compactdefaultargs") AddFacesToRemove;
		%feature("autodoc", "Adds the faces to remove from the input shape. @param thefaces [in] the list of shapes to extract the faces for removal.

Parameters
----------
theFaces: TopTools_ListOfShape

Returns
-------
None
") AddFacesToRemove;
		void AddFacesToRemove(const TopTools_ListOfShape & theFaces);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs the operation.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** FacesToRemove ******************/
		/**** md5 signature: 947971dfb74df8135dc7f7ce60eaaa90 ****/
		%feature("compactdefaultargs") FacesToRemove;
		%feature("autodoc", "Returns the list of faces which have been requested for removal from the input shape.

Returns
-------
TopTools_ListOfShape
") FacesToRemove;
		const TopTools_ListOfShape & FacesToRemove();

		/****************** Generated ******************/
		/**** md5 signature: 6765eaeea6b04c9e5e12d95bf0d36ae9 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <thes> during the operation.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & theS);

		/****************** HasDeleted ******************/
		/**** md5 signature: 62e1a47bba6730979f45045197c457ad ****/
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "Returns true if any of the input shapes has been deleted during operation.

Returns
-------
bool
") HasDeleted;
		virtual Standard_Boolean HasDeleted();

		/****************** HasGenerated ******************/
		/**** md5 signature: 41e62931be9792b7588a37969bdd21d8 ****/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "Returns true if any of the input shapes has generated shapes during operation.

Returns
-------
bool
") HasGenerated;
		virtual Standard_Boolean HasGenerated();

		/****************** HasHistory ******************/
		/**** md5 signature: 707ba290c9cd0157e12b7038a0944657 ****/
		%feature("compactdefaultargs") HasHistory;
		%feature("autodoc", "Returns whether the history was requested or not.

Returns
-------
bool
") HasHistory;
		Standard_Boolean HasHistory();

		/****************** HasModified ******************/
		/**** md5 signature: 33dead3a6879f4d3e05d3f85aabe6d13 ****/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "Returns true if any of the input shapes has been modified during operation.

Returns
-------
bool
") HasModified;
		virtual Standard_Boolean HasModified();

		/****************** History ******************/
		/**** md5 signature: 1926fba5b3ef6c8825eef7dc63e4c382 ****/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Returns the history of shapes modifications.

Returns
-------
opencascade::handle<BRepTools_History>
") History;
		opencascade::handle<BRepTools_History> History();

		/****************** InputShape ******************/
		/**** md5 signature: c0c04276bd1d5989adf5070d423aadb7 ****/
		%feature("compactdefaultargs") InputShape;
		%feature("autodoc", "Returns the input shape.

Returns
-------
TopoDS_Shape
") InputShape;
		const TopoDS_Shape InputShape();

		/****************** IsDeleted ******************/
		/**** md5 signature: e03e7b54c17bc7f23491a2c633b6e283 ****/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Returns true if the shape <thes> has been deleted during the operation. it means that the shape has no any trace in the result. otherwise it returns false.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & theS);

		/****************** Modified ******************/
		/**** md5 signature: 4e20601bbc1c3aead85ab39355caf9fd ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <thes> during the operation.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & theS);

		/****************** SetShape ******************/
		/**** md5 signature: 927e2ebe2fb5354dfb3da3c53e512cad ****/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Sets the shape for processing. @param theshape [in] the shape to remove the features from.  it should either be the solid, compsolid or compound of solids.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

		/****************** SetToFillHistory ******************/
		/**** md5 signature: 74ee5996560ad06ab737a4c8f4c7350d ****/
		%feature("compactdefaultargs") SetToFillHistory;
		%feature("autodoc", "Defines whether to track the modification of the shapes or not.

Parameters
----------
theFlag: bool

Returns
-------
None
") SetToFillHistory;
		void SetToFillHistory(const Standard_Boolean theFlag);

};


%extend BRepAlgoAPI_Defeaturing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepAlgoAPI_BooleanOperation *
*************************************/
class BRepAlgoAPI_BooleanOperation : public BRepAlgoAPI_BuilderAlgo {
	public:
		/****************** BRepAlgoAPI_BooleanOperation ******************/
		/**** md5 signature: ecd6042de04813653a64f217d81e1a57 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_BooleanOperation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_BooleanOperation;
		 BRepAlgoAPI_BooleanOperation();

		/****************** BRepAlgoAPI_BooleanOperation ******************/
		/**** md5 signature: 911dfe6e6653bd69280d3f5c21f112f5 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_BooleanOperation;
		%feature("autodoc", "Constructor with precomputed intersections of arguments.

Parameters
----------
thePF: BOPAlgo_PaveFiller

Returns
-------
None
") BRepAlgoAPI_BooleanOperation;
		 BRepAlgoAPI_BooleanOperation(const BOPAlgo_PaveFiller & thePF);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs the boolean operation.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Operation ******************/
		/**** md5 signature: 3fe7ad033306b813a524bc39f03a5e6e ****/
		%feature("compactdefaultargs") Operation;
		%feature("autodoc", "Returns the type of boolean operation.

Returns
-------
BOPAlgo_Operation
") Operation;
		BOPAlgo_Operation Operation();

		/****************** SetOperation ******************/
		/**** md5 signature: cef1e63b0452d16e7996e89724a77c38 ****/
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "Sets the type of boolean operation.

Parameters
----------
theBOP: BOPAlgo_Operation

Returns
-------
None
") SetOperation;
		void SetOperation(const BOPAlgo_Operation theBOP);

		/****************** SetTools ******************/
		/**** md5 signature: 3be2cbb7f8439cb12462b3704230f424 ****/
		%feature("compactdefaultargs") SetTools;
		%feature("autodoc", "Sets the tool arguments.

Parameters
----------
theLS: TopTools_ListOfShape

Returns
-------
None
") SetTools;
		void SetTools(const TopTools_ListOfShape & theLS);

		/****************** Shape1 ******************/
		/**** md5 signature: 8981b86985f46147f6d78d0ef2565c6e ****/
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", "Returns the first argument involved in this boolean operation. obsolete.

Returns
-------
TopoDS_Shape
") Shape1;
		const TopoDS_Shape Shape1();

		/****************** Shape2 ******************/
		/**** md5 signature: 2c54bae91519136523ed62dc1f27ae72 ****/
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", "Returns the second argument involved in this boolean operation. obsolete.

Returns
-------
TopoDS_Shape
") Shape2;
		const TopoDS_Shape Shape2();

		/****************** Tools ******************/
		/**** md5 signature: 0471973aac274d4f863776957a65fd19 ****/
		%feature("compactdefaultargs") Tools;
		%feature("autodoc", "Returns the tools arguments.

Returns
-------
TopTools_ListOfShape
") Tools;
		const TopTools_ListOfShape & Tools();

};


%extend BRepAlgoAPI_BooleanOperation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepAlgoAPI_Splitter *
*****************************/
class BRepAlgoAPI_Splitter : public BRepAlgoAPI_BuilderAlgo {
	public:
		/****************** BRepAlgoAPI_Splitter ******************/
		/**** md5 signature: 9ef21f13bc074dc22af2512d12d68538 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Splitter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Splitter;
		 BRepAlgoAPI_Splitter();

		/****************** BRepAlgoAPI_Splitter ******************/
		/**** md5 signature: 7e6131d308f84171e35c6eadd0d40875 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Splitter;
		%feature("autodoc", "Constructor with already prepared intersection tool - pavefiller.

Parameters
----------
thePF: BOPAlgo_PaveFiller

Returns
-------
None
") BRepAlgoAPI_Splitter;
		 BRepAlgoAPI_Splitter(const BOPAlgo_PaveFiller & thePF);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs the split operation. performs the intersection of the argument shapes (both objects and tools) and splits objects by the tools.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** SetTools ******************/
		/**** md5 signature: 3be2cbb7f8439cb12462b3704230f424 ****/
		%feature("compactdefaultargs") SetTools;
		%feature("autodoc", "Sets the tool arguments.

Parameters
----------
theLS: TopTools_ListOfShape

Returns
-------
None
") SetTools;
		void SetTools(const TopTools_ListOfShape & theLS);

		/****************** Tools ******************/
		/**** md5 signature: 0471973aac274d4f863776957a65fd19 ****/
		%feature("compactdefaultargs") Tools;
		%feature("autodoc", "Returns the tool arguments.

Returns
-------
TopTools_ListOfShape
") Tools;
		const TopTools_ListOfShape & Tools();

};


%extend BRepAlgoAPI_Splitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepAlgoAPI_Common *
***************************/
class BRepAlgoAPI_Common : public BRepAlgoAPI_BooleanOperation {
	public:
		/****************** BRepAlgoAPI_Common ******************/
		/**** md5 signature: f91369cacf90268e3d29941c629e6143 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common();

		/****************** BRepAlgoAPI_Common ******************/
		/**** md5 signature: 221ea98268ab300eec5e97d97aab1008 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "Empty constructor <pf> - pavefiller object that is carried out.

Parameters
----------
PF: BOPAlgo_PaveFiller

Returns
-------
None
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common(const BOPAlgo_PaveFiller & PF);

		/****************** BRepAlgoAPI_Common ******************/
		/**** md5 signature: 65c64c29f7cf2b9ce8fc226b39f512dd ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "Constructor with two shapes <s1> -argument <s2> -tool <anoperation> - the type of the operation obsolete.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** BRepAlgoAPI_Common ******************/
		/**** md5 signature: 234cc5b6a4b65f1836f72b85b4853c82 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "Constructor with two shapes <s1> -argument <s2> -tool <anoperation> - the type of the operation <pf> - pavefiller object that is carried out obsolete.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
PF: BOPAlgo_PaveFiller

Returns
-------
None
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const BOPAlgo_PaveFiller & PF);

};


%extend BRepAlgoAPI_Common {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepAlgoAPI_Cut *
************************/
class BRepAlgoAPI_Cut : public BRepAlgoAPI_BooleanOperation {
	public:
		/****************** BRepAlgoAPI_Cut ******************/
		/**** md5 signature: 629dc45f6ac54a1d0dd3eb613bb25729 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut();

		/****************** BRepAlgoAPI_Cut ******************/
		/**** md5 signature: d1f642f339e236fdb33a884982f2791a ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "Empty constructor <pf> - pavefiller object that is carried out.

Parameters
----------
PF: BOPAlgo_PaveFiller

Returns
-------
None
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut(const BOPAlgo_PaveFiller & PF);

		/****************** BRepAlgoAPI_Cut ******************/
		/**** md5 signature: 11f9a02b23a31e70aa286dbffb024431 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "Constructor with two shapes <s1> -argument <s2> -tool <anoperation> - the type of the operation obsolete.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** BRepAlgoAPI_Cut ******************/
		/**** md5 signature: e0df31a6859bf1c0dc245660c66fab53 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "Constructor with two shapes <s1> -argument <s2> -tool <anoperation> - the type of the operation <pf> - pavefiller object that is carried out obsolete.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
aDSF: BOPAlgo_PaveFiller
bFWD: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const BOPAlgo_PaveFiller & aDSF, const Standard_Boolean bFWD = Standard_True);

};


%extend BRepAlgoAPI_Cut {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepAlgoAPI_Fuse *
*************************/
class BRepAlgoAPI_Fuse : public BRepAlgoAPI_BooleanOperation {
	public:
		/****************** BRepAlgoAPI_Fuse ******************/
		/**** md5 signature: ba31d780d01f5752b12d845f4446df0f ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse();

		/****************** BRepAlgoAPI_Fuse ******************/
		/**** md5 signature: 7689d836e2615ec52255c3ee260ddb69 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "Empty constructor <pf> - pavefiller object that is carried out.

Parameters
----------
PF: BOPAlgo_PaveFiller

Returns
-------
None
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse(const BOPAlgo_PaveFiller & PF);

		/****************** BRepAlgoAPI_Fuse ******************/
		/**** md5 signature: 879433be8fed9f569be5cc5a6a1e1325 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "Constructor with two shapes <s1> -argument <s2> -tool <anoperation> - the type of the operation obsolete.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** BRepAlgoAPI_Fuse ******************/
		/**** md5 signature: 0a16e33ccaa30501e91551c57e5f2810 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "Constructor with two shapes <s1> -argument <s2> -tool <anoperation> - the type of the operation <pf> - pavefiller object that is carried out obsolete.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
aDSF: BOPAlgo_PaveFiller

Returns
-------
None
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const BOPAlgo_PaveFiller & aDSF);

};


%extend BRepAlgoAPI_Fuse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepAlgoAPI_Section *
****************************/
class BRepAlgoAPI_Section : public BRepAlgoAPI_BooleanOperation {
	public:
		/****************** BRepAlgoAPI_Section ******************/
		/**** md5 signature: a47f0ceb741798857db55d2032f40092 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section();

		/****************** BRepAlgoAPI_Section ******************/
		/**** md5 signature: bda2ec08baeb2e74ab6cb69daaf2c885 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "Empty constructor <pf> - pavefiller object that is carried out.

Parameters
----------
PF: BOPAlgo_PaveFiller

Returns
-------
None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const BOPAlgo_PaveFiller & PF);

		/****************** BRepAlgoAPI_Section ******************/
		/**** md5 signature: cb5bfbec844bcec9b0cb0f6e222e3512 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "Constructor with two shapes <s1> -argument <s2> -tool <performnow> - the flag: if <performnow>=true - the algorithm is performed immediatly obsolete.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
PerformNow: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Standard_Boolean PerformNow = Standard_True);

		/****************** BRepAlgoAPI_Section ******************/
		/**** md5 signature: 6f2f6902a99b64288c481b6cad474b59 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "Constructor with two shapes <s1> -argument <s2> -tool <pf> - pavefiller object that is carried out <performnow> - the flag: if <performnow>=true - the algorithm is performed immediatly obsolete.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
aDSF: BOPAlgo_PaveFiller
PerformNow: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const BOPAlgo_PaveFiller & aDSF, const Standard_Boolean PerformNow = Standard_True);

		/****************** BRepAlgoAPI_Section ******************/
		/**** md5 signature: 30e774e5a1508f5dd6195bbba8028bdd ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "Constructor with two shapes <s1> - argument <pl> - tool <performnow> - the flag: if <performnow>=true - the algorithm is performed immediatly obsolete.

Parameters
----------
S1: TopoDS_Shape
Pl: gp_Pln
PerformNow: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const TopoDS_Shape & S1, const gp_Pln & Pl, const Standard_Boolean PerformNow = Standard_True);

		/****************** BRepAlgoAPI_Section ******************/
		/**** md5 signature: c287bb4bc888ac88d0cb0da777c82aa7 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "Constructor with two shapes <s1> - argument <sf> - tool <performnow> - the flag: if <performnow>=true - the algorithm is performed immediatly obsolete.

Parameters
----------
S1: TopoDS_Shape
Sf: Geom_Surface
PerformNow: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const TopoDS_Shape & S1, const opencascade::handle<Geom_Surface> & Sf, const Standard_Boolean PerformNow = Standard_True);

		/****************** BRepAlgoAPI_Section ******************/
		/**** md5 signature: 672281bf6f9f679b4d466fb17e60f6c9 ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "Constructor with two shapes <sf> - argument <s2> - tool <performnow> - the flag: if <performnow>=true - the algorithm is performed immediatly obsolete.

Parameters
----------
Sf: Geom_Surface
S2: TopoDS_Shape
PerformNow: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const opencascade::handle<Geom_Surface> & Sf, const TopoDS_Shape & S2, const Standard_Boolean PerformNow = Standard_True);

		/****************** BRepAlgoAPI_Section ******************/
		/**** md5 signature: b272770396cfbca61affc5a095f04dbc ****/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "Constructor with two shapes <sf1> - argument <sf2> - tool <performnow> - the flag: if <performnow>=true - the algorithm is performed immediatly obsolete.

Parameters
----------
Sf1: Geom_Surface
Sf2: Geom_Surface
PerformNow: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const opencascade::handle<Geom_Surface> & Sf1, const opencascade::handle<Geom_Surface> & Sf2, const Standard_Boolean PerformNow = Standard_True);

		/****************** Approximation ******************/
		/**** md5 signature: f599ca30fa002b2a3dc329decde6ce74 ****/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Approximation;
		void Approximation(const Standard_Boolean B);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs the algorithm filling interference data structure (if it is necessary) building the result of the operation.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** ComputePCurveOn1 ******************/
		/**** md5 signature: e4a8add7cd0d8f532479132026321808 ****/
		%feature("compactdefaultargs") ComputePCurveOn1;
		%feature("autodoc", "Indicates whether the p-curve should be (or not) performed on the argument. by default, no parametric 2d curve (pcurve) is defined for the edges of the result. if computepcurve1 equals true, further computations performed to attach an p-curve in the parametric space of the argument to the constructed edges. obsolete.

Parameters
----------
B: bool

Returns
-------
None
") ComputePCurveOn1;
		void ComputePCurveOn1(const Standard_Boolean B);

		/****************** ComputePCurveOn2 ******************/
		/**** md5 signature: 69d49dff388a83191da02eb8e1945b69 ****/
		%feature("compactdefaultargs") ComputePCurveOn2;
		%feature("autodoc", "Indicates whether the p-curve should be (or not) performed on the tool. by default, no parametric 2d curve (pcurve) is defined for the edges of the result. if computepcurve1 equals true, further computations performed to attach an p-curve in the parametric space of the tool to the constructed edges. obsolete.

Parameters
----------
B: bool

Returns
-------
None
") ComputePCurveOn2;
		void ComputePCurveOn2(const Standard_Boolean B);

		/****************** HasAncestorFaceOn1 ******************/
		/**** md5 signature: 36605047037cbfa30f9efcc59b149e44 ****/
		%feature("compactdefaultargs") HasAncestorFaceOn1;
		%feature("autodoc", "Get the face of the first part giving section edge <e>. returns true on the 3 following conditions : 1/ <e> is an edge returned by the shape() metwod. 2/ first part of section performed is a shape. 3/ <e> is built on a intersection curve (i.e <e> is not the result of common edges) when false, f remains untouched. obsolete.

Parameters
----------
E: TopoDS_Shape
F: TopoDS_Shape

Returns
-------
bool
") HasAncestorFaceOn1;
		Standard_Boolean HasAncestorFaceOn1(const TopoDS_Shape & E, TopoDS_Shape & F);

		/****************** HasAncestorFaceOn2 ******************/
		/**** md5 signature: 0642a4fb4df5a635412bd18e5f65e916 ****/
		%feature("compactdefaultargs") HasAncestorFaceOn2;
		%feature("autodoc", "Identifies the ancestor faces of the intersection edge e resulting from the last computation performed in this framework, that is, the faces of the two original shapes on which the edge e lies: - hasancestorfaceon1 gives the ancestor face in the first shape, and - hasancestorfaceon2 gives the ancestor face in the second shape. these functions return true if an ancestor face f is found, or false if not. an ancestor face is identifiable for the edge e if the following conditions are satisfied: - the first part on which this algorithm performed its last computation is a shape, that is, it was not given as a surface or a plane at the time of construction of this algorithm or at a later time by the init1 function, - e is one of the elementary edges built by the last computation of this section algorithm. to use these functions properly, you have to test the returned boolean value before using the ancestor face: f is significant only if the returned boolean value equals true. obsolete.

Parameters
----------
E: TopoDS_Shape
F: TopoDS_Shape

Returns
-------
bool
") HasAncestorFaceOn2;
		Standard_Boolean HasAncestorFaceOn2(const TopoDS_Shape & E, TopoDS_Shape & F);

		/****************** Init1 ******************/
		/**** md5 signature: 7fa686f55d72920afc50e65b8a84a805 ****/
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "Initialize the argument <s1> - argument obsolete.

Parameters
----------
S1: TopoDS_Shape

Returns
-------
None
") Init1;
		void Init1(const TopoDS_Shape & S1);

		/****************** Init1 ******************/
		/**** md5 signature: 1e834e5b66aacf2f588a792cb0edcd57 ****/
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "Initialize the argument <pl> - argument obsolete.

Parameters
----------
Pl: gp_Pln

Returns
-------
None
") Init1;
		void Init1(const gp_Pln & Pl);

		/****************** Init1 ******************/
		/**** md5 signature: a94f1a0649d28cfd679dcbe46833b484 ****/
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "Initialize the argument <sf> - argument obsolete.

Parameters
----------
Sf: Geom_Surface

Returns
-------
None
") Init1;
		void Init1(const opencascade::handle<Geom_Surface> & Sf);

		/****************** Init2 ******************/
		/**** md5 signature: 8a35dc2983e205023df1fac2afbf3b01 ****/
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "Initialize the tool <s2> - tool obsolete.

Parameters
----------
S2: TopoDS_Shape

Returns
-------
None
") Init2;
		void Init2(const TopoDS_Shape & S2);

		/****************** Init2 ******************/
		/**** md5 signature: 1fb6fdb5216fde3b15724409206adcfe ****/
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "Initialize the tool <pl> - tool obsolete.

Parameters
----------
Pl: gp_Pln

Returns
-------
None
") Init2;
		void Init2(const gp_Pln & Pl);

		/****************** Init2 ******************/
		/**** md5 signature: 86865e03b7bd5eecac0d55746d523771 ****/
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "Initialize the tool <sf> - tool obsolete.

Parameters
----------
Sf: Geom_Surface

Returns
-------
None
") Init2;
		void Init2(const opencascade::handle<Geom_Surface> & Sf);

};


%extend BRepAlgoAPI_Section {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
