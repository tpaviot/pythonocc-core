/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepalgoapi.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<BRepAlgoAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BOPAlgo_module.hxx>
#include<TopoDS_module.hxx>
#include<Message_module.hxx>
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
#include<IntCurvesFace_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BOPAlgo.i
%import TopoDS.i
%import Message.i
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

/**************************
* class BRepAlgoAPI_Check *
**************************/
class BRepAlgoAPI_Check : public BOPAlgo_Options {
	public:
		/****** BRepAlgoAPI_Check::BRepAlgoAPI_Check ******/
		/****** md5 signature: 411402657614d45c8444ed8f583c4d89 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check();

		/****** BRepAlgoAPI_Check::BRepAlgoAPI_Check ******/
		/****** md5 signature: 4c7f74c0b1475c6354942a65d5c7e394 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
bTestSE: bool (optional, default to Standard_True)
bTestSI: bool (optional, default to Standard_True)
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Constructor for checking single shape. //! 
Input parameter: theS - the shape to check; 
Input parameter: bTestSE - flag which specifies whether to check the shape  on small edges or not; by default it is set to True; 
Input parameter: bTestSI - flag which specifies whether to check the shape  on self-interference or not; by default it is set to True; 
Input parameter: theRange - parameter to use progress indicator.
") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check(const TopoDS_Shape & theS, const Standard_Boolean bTestSE = Standard_True, const Standard_Boolean bTestSI = Standard_True, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Check::BRepAlgoAPI_Check ******/
		/****** md5 signature: 6d8665f00fc74c35f58fdcae0bcdc4ea ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "
Parameters
----------
theS1: TopoDS_Shape
theS2: TopoDS_Shape
theOp: BOPAlgo_Operation (optional, default to BOPAlgo_UNKNOWN)
bTestSE: bool (optional, default to Standard_True)
bTestSI: bool (optional, default to Standard_True)
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Constructor for checking the couple of shapes. Additionally to the validity checks of each given shape, the types of the given shapes will be checked on validity for Boolean operation of given type. //! 
Input parameter: theS1 - the first shape to check; 
Input parameter: theS2 - the second shape to check; 
Input parameter: theOp - the type of Boolean Operation for which the validity of given shapes should be checked. 
Input parameter: bTestSE - flag which specifies whether to check the shape  on small edges or not; by default it is set to True; 
Input parameter: bTestSI - flag which specifies whether to check the shape  on self-interference or not; by default it is set to True; 
Input parameter: theRange - parameter to use progress indicator.
") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check(const TopoDS_Shape & theS1, const TopoDS_Shape & theS2, const BOPAlgo_Operation theOp = BOPAlgo_UNKNOWN, const Standard_Boolean bTestSE = Standard_True, const Standard_Boolean bTestSI = Standard_True, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Check::IsValid ******/
		/****** md5 signature: c1993b3b31d320b598a9a9b27c56914e ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Shows whether shape(s) valid or not.
") IsValid;
		Standard_Boolean IsValid();

		/****** BRepAlgoAPI_Check::Perform ******/
		/****** md5 signature: 237808a6b51056c9f8e292d343f26d7d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Performs the check.
") Perform;
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Check::Result ******/
		/****** md5 signature: 7cf3309b46dab6da497e78cfc1a9af75 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
BOPAlgo_ListOfCheckResult

Description
-----------
Returns faulty shapes.
") Result;
		const BOPAlgo_ListOfCheckResult & Result();

		/****** BRepAlgoAPI_Check::SetData ******/
		/****** md5 signature: c1fd665a073df98354476ae857f43c48 ******/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
bTestSE: bool (optional, default to Standard_True)
bTestSI: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Initializes the algorithm with single shape. //! 
Input parameter: theS - the shape to check; 
Input parameter: bTestSE - flag which specifies whether to check the shape  on small edges or not; by default it is set to True; 
Input parameter: bTestSI - flag which specifies whether to check the shape  on self-interference or not; by default it is set to True;.
") SetData;
		void SetData(const TopoDS_Shape & theS, const Standard_Boolean bTestSE = Standard_True, const Standard_Boolean bTestSI = Standard_True);

		/****** BRepAlgoAPI_Check::SetData ******/
		/****** md5 signature: 80850e26186481dcc7772de06de5db11 ******/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "
Parameters
----------
theS1: TopoDS_Shape
theS2: TopoDS_Shape
theOp: BOPAlgo_Operation (optional, default to BOPAlgo_UNKNOWN)
bTestSE: bool (optional, default to Standard_True)
bTestSI: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Initializes the algorithm with couple of shapes. Additionally to the validity checks of each given shape, the types of the given shapes will be checked on validity for Boolean operation of given type. //! 
Input parameter: theS1 - the first shape to check; 
Input parameter: theS2 - the second shape to check; 
Input parameter: theOp - the type of Boolean Operation for which the validity of given shapes should be checked. 
Input parameter: bTestSE - flag which specifies whether to check the shape  on small edges or not; by default it is set to True; 
Input parameter: bTestSI - flag which specifies whether to check the shape  on self-interference or not; by default it is set to True;.
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
		/****** BRepAlgoAPI_Algo::Shape ******/
		/****** md5 signature: b8642bc5a50083ee24c608b46f5bf1c8 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns a shape built by the shape construction algorithm. Does not check if the shape is built.
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
		/****** BRepAlgoAPI_BuilderAlgo::BRepAlgoAPI_BuilderAlgo ******/
		/****** md5 signature: f034b0ea83263b0b12a5034e2ab03c28 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_BuilderAlgo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepAlgoAPI_BuilderAlgo;
		 BRepAlgoAPI_BuilderAlgo();

		/****** BRepAlgoAPI_BuilderAlgo::BRepAlgoAPI_BuilderAlgo ******/
		/****** md5 signature: 87f0646930c224a38e316c8395128e53 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_BuilderAlgo;
		%feature("autodoc", "
Parameters
----------
thePF: BOPAlgo_PaveFiller

Return
-------
None

Description
-----------
Constructor with prepared Filler object.
") BRepAlgoAPI_BuilderAlgo;
		 BRepAlgoAPI_BuilderAlgo(const BOPAlgo_PaveFiller & thePF);

		/****** BRepAlgoAPI_BuilderAlgo::Arguments ******/
		/****** md5 signature: 5c44416d889811943ccde89673d3c270 ******/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Gets the arguments.
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****** BRepAlgoAPI_BuilderAlgo::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Performs the algorithm.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_BuilderAlgo::Builder ******/
		/****** md5 signature: 8b185d6cf1a66c51174428861a33b6c7 ******/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "Return
-------
BOPAlgo_PBuilder

Description
-----------
Returns the Building tool.
") Builder;
		const BOPAlgo_PBuilder & Builder();

		/****** BRepAlgoAPI_BuilderAlgo::CheckInverted ******/
		/****** md5 signature: ce3c18df15bc3282101b99ee82f78b47 ******/
		%feature("compactdefaultargs") CheckInverted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag defining whether the check for input solids on inverted status should be performed or not.
") CheckInverted;
		Standard_Boolean CheckInverted();

		/****** BRepAlgoAPI_BuilderAlgo::DSFiller ******/
		/****** md5 signature: eacda80fa3f8437b06bd46026236195a ******/
		%feature("compactdefaultargs") DSFiller;
		%feature("autodoc", "Return
-------
BOPAlgo_PPaveFiller

Description
-----------
Returns the Intersection tool.
") DSFiller;
		const BOPAlgo_PPaveFiller & DSFiller();

		/****** BRepAlgoAPI_BuilderAlgo::Generated ******/
		/****** md5 signature: 6765eaeea6b04c9e5e12d95bf0d36ae9 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes generated from the shape <theS>. In frames of Boolean Operations algorithms only Edges and Faces could have Generated elements, as only they produce new elements during intersection: - Edges can generate new vertices; - Faces can generate new edges and vertices.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & theS);

		/****** BRepAlgoAPI_BuilderAlgo::Glue ******/
		/****** md5 signature: 2a0ac34b43f154dd0238ac1408d9079b ******/
		%feature("compactdefaultargs") Glue;
		%feature("autodoc", "Return
-------
BOPAlgo_GlueEnum

Description
-----------
Returns the glue option of the algorithm.
") Glue;
		BOPAlgo_GlueEnum Glue();

		/****** BRepAlgoAPI_BuilderAlgo::HasDeleted ******/
		/****** md5 signature: 62e1a47bba6730979f45045197c457ad ******/
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has been deleted during operation. Normally, General Fuse operation should not have Deleted elements, but all derived operation can have.
") HasDeleted;
		virtual Standard_Boolean HasDeleted();

		/****** BRepAlgoAPI_BuilderAlgo::HasGenerated ******/
		/****** md5 signature: 41e62931be9792b7588a37969bdd21d8 ******/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has generated shapes during operation.
") HasGenerated;
		virtual Standard_Boolean HasGenerated();

		/****** BRepAlgoAPI_BuilderAlgo::HasHistory ******/
		/****** md5 signature: 707ba290c9cd0157e12b7038a0944657 ******/
		%feature("compactdefaultargs") HasHistory;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns flag of history availability.
") HasHistory;
		Standard_Boolean HasHistory();

		/****** BRepAlgoAPI_BuilderAlgo::HasModified ******/
		/****** md5 signature: 33dead3a6879f4d3e05d3f85aabe6d13 ******/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has been modified during operation.
") HasModified;
		virtual Standard_Boolean HasModified();

		/****** BRepAlgoAPI_BuilderAlgo::History ******/
		/****** md5 signature: a47770f1ee9d6f229a149d416a698dc5 ******/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepTools_History>

Description
-----------
History tool.
") History;
		opencascade::handle<BRepTools_History> History();

		/****** BRepAlgoAPI_BuilderAlgo::IsDeleted ******/
		/****** md5 signature: 431a14f43afb5fe71090f69dcb3e4037 ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
aS: TopoDS_Shape

Return
-------
bool

Description
-----------
Checks if the shape <theS> has been completely removed from the result, i.e. the result does not contain the shape itself and any of its splits. Returns True if the shape has been deleted.
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & aS);

		/****** BRepAlgoAPI_BuilderAlgo::Modified ******/
		/****** md5 signature: 4e20601bbc1c3aead85ab39355caf9fd ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the shapes modified from the shape <theS>. If any, the list will contain only those splits of the given shape, contained in the result.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & theS);

		/****** BRepAlgoAPI_BuilderAlgo::NonDestructive ******/
		/****** md5 signature: debf4165891df54bd9a565d235f0d378 ******/
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated.
") NonDestructive;
		Standard_Boolean NonDestructive();

		/****** BRepAlgoAPI_BuilderAlgo::SectionEdges ******/
		/****** md5 signature: 8d1d78adb60588ec6c6d9bac5ddb95cb ******/
		%feature("compactdefaultargs") SectionEdges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns a list of section edges. The edges represent the result of intersection between arguments of operation.
") SectionEdges;
		const TopTools_ListOfShape & SectionEdges();

		/****** BRepAlgoAPI_BuilderAlgo::SetArguments ******/
		/****** md5 signature: c8050caf960534f7d5c8a2cd210eb861 ******/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "
Parameters
----------
theLS: TopTools_ListOfShape

Return
-------
None

Description
-----------
Sets the arguments.
") SetArguments;
		void SetArguments(const TopTools_ListOfShape & theLS);

		/****** BRepAlgoAPI_BuilderAlgo::SetCheckInverted ******/
		/****** md5 signature: 9645001f4ab756df382f60cfc76654bc ******/
		%feature("compactdefaultargs") SetCheckInverted;
		%feature("autodoc", "
Parameters
----------
theCheck: bool

Return
-------
None

Description
-----------
Enables/Disables the check of the input solids for inverted status.
") SetCheckInverted;
		void SetCheckInverted(const Standard_Boolean theCheck);

		/****** BRepAlgoAPI_BuilderAlgo::SetGlue ******/
		/****** md5 signature: bae09c43d6b988a5d7d19b6376a5aa05 ******/
		%feature("compactdefaultargs") SetGlue;
		%feature("autodoc", "
Parameters
----------
theGlue: BOPAlgo_GlueEnum

Return
-------
None

Description
-----------
Sets the glue option for the algorithm, which allows increasing performance of the intersection of the input shapes.
") SetGlue;
		void SetGlue(const BOPAlgo_GlueEnum theGlue);

		/****** BRepAlgoAPI_BuilderAlgo::SetNonDestructive ******/
		/****** md5 signature: 0a29c6536a8337536ce71b892337fbbb ******/
		%feature("compactdefaultargs") SetNonDestructive;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
Sets the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated.
") SetNonDestructive;
		void SetNonDestructive(const Standard_Boolean theFlag);

		/****** BRepAlgoAPI_BuilderAlgo::SetToFillHistory ******/
		/****** md5 signature: 0645816549ab38af8118c8f63f46c0ea ******/
		%feature("compactdefaultargs") SetToFillHistory;
		%feature("autodoc", "
Parameters
----------
theHistFlag: bool

Return
-------
None

Description
-----------
Allows disabling the history collection.
") SetToFillHistory;
		void SetToFillHistory(const Standard_Boolean theHistFlag);

		/****** BRepAlgoAPI_BuilderAlgo::SimplifyResult ******/
		/****** md5 signature: 88e0cdcd55300620756ca014f3c6371d ******/
		%feature("compactdefaultargs") SimplifyResult;
		%feature("autodoc", "
Parameters
----------
theUnifyEdges: bool (optional, default to Standard_True)
theUnifyFaces: bool (optional, default to Standard_True)
theAngularTol: float (optional, default to Precision::Angular())

Return
-------
None

Description
-----------
Simplification of the result shape is performed by the means of *ShapeUpgrade_UnifySameDomain* algorithm. The result of the operation will be overwritten with the simplified result. //! The simplification is performed without creation of the Internal shapes, i.e. shapes connections will never be broken. //! Simplification is performed on the whole result shape. Thus, if the input shapes contained connected tangent edges or faces unmodified during the operation they will also be unified. //! After simplification, the History of result simplification is merged into the main history of operation. So, it is taken into account when asking for Modified, Generated and Deleted shapes. //! Some options of the main operation are passed into the Unifier: - Fuzzy tolerance of the operation is given to the Unifier as the linear tolerance. - Non destructive mode here controls the safe input mode in Unifier. //! 
Parameter theUnifyEdges Controls the edges unification. True by default. 
Parameter theUnifyFaces Controls the faces unification. True by default. 
Parameter theAngularTol Angular criteria for tangency of edges and faces.  Precision::Angular() by default.
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
		/****** BRepAlgoAPI_Defeaturing::BRepAlgoAPI_Defeaturing ******/
		/****** md5 signature: c00608d9bba8810c82a05b46e3e4f871 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Defeaturing;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepAlgoAPI_Defeaturing;
		 BRepAlgoAPI_Defeaturing();

		/****** BRepAlgoAPI_Defeaturing::AddFaceToRemove ******/
		/****** md5 signature: 26c9409a587f43491552f28dbeb97ed4 ******/
		%feature("compactdefaultargs") AddFaceToRemove;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Shape

Return
-------
None

Description
-----------
Adds the features to remove from the input shape. 
Input parameter: theFace The shape to extract the faces for removal.
") AddFaceToRemove;
		void AddFaceToRemove(const TopoDS_Shape & theFace);

		/****** BRepAlgoAPI_Defeaturing::AddFacesToRemove ******/
		/****** md5 signature: de6da71dc89a49bec36f3c8a28a2c6dd ******/
		%feature("compactdefaultargs") AddFacesToRemove;
		%feature("autodoc", "
Parameters
----------
theFaces: TopTools_ListOfShape

Return
-------
None

Description
-----------
Adds the faces to remove from the input shape. 
Input parameter: theFaces The list of shapes to extract the faces for removal.
") AddFacesToRemove;
		void AddFacesToRemove(const TopTools_ListOfShape & theFaces);

		/****** BRepAlgoAPI_Defeaturing::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Performs the operation.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Defeaturing::FacesToRemove ******/
		/****** md5 signature: 947971dfb74df8135dc7f7ce60eaaa90 ******/
		%feature("compactdefaultargs") FacesToRemove;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of faces which have been requested for removal from the input shape.
") FacesToRemove;
		const TopTools_ListOfShape & FacesToRemove();

		/****** BRepAlgoAPI_Defeaturing::Generated ******/
		/****** md5 signature: 6765eaeea6b04c9e5e12d95bf0d36ae9 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes generated from the shape <theS> during the operation.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & theS);

		/****** BRepAlgoAPI_Defeaturing::HasDeleted ******/
		/****** md5 signature: 62e1a47bba6730979f45045197c457ad ******/
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has been deleted during operation.
") HasDeleted;
		virtual Standard_Boolean HasDeleted();

		/****** BRepAlgoAPI_Defeaturing::HasGenerated ******/
		/****** md5 signature: 41e62931be9792b7588a37969bdd21d8 ******/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has generated shapes during operation.
") HasGenerated;
		virtual Standard_Boolean HasGenerated();

		/****** BRepAlgoAPI_Defeaturing::HasHistory ******/
		/****** md5 signature: 707ba290c9cd0157e12b7038a0944657 ******/
		%feature("compactdefaultargs") HasHistory;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether the history was requested or not.
") HasHistory;
		Standard_Boolean HasHistory();

		/****** BRepAlgoAPI_Defeaturing::HasModified ******/
		/****** md5 signature: 33dead3a6879f4d3e05d3f85aabe6d13 ******/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has been modified during operation.
") HasModified;
		virtual Standard_Boolean HasModified();

		/****** BRepAlgoAPI_Defeaturing::History ******/
		/****** md5 signature: 1926fba5b3ef6c8825eef7dc63e4c382 ******/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepTools_History>

Description
-----------
Returns the History of shapes modifications.
") History;
		opencascade::handle<BRepTools_History> History();

		/****** BRepAlgoAPI_Defeaturing::InputShape ******/
		/****** md5 signature: c0c04276bd1d5989adf5070d423aadb7 ******/
		%feature("compactdefaultargs") InputShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the input shape.
") InputShape;
		const TopoDS_Shape InputShape();

		/****** BRepAlgoAPI_Defeaturing::IsDeleted ******/
		/****** md5 signature: e03e7b54c17bc7f23491a2c633b6e283 ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the shape <theS> has been deleted during the operation. It means that the shape has no any trace in the result. Otherwise it returns false.
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & theS);

		/****** BRepAlgoAPI_Defeaturing::Modified ******/
		/****** md5 signature: 4e20601bbc1c3aead85ab39355caf9fd ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes modified from the shape <theS> during the operation.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & theS);

		/****** BRepAlgoAPI_Defeaturing::SetShape ******/
		/****** md5 signature: 927e2ebe2fb5354dfb3da3c53e512cad ******/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Sets the shape for processing. 
Input parameter: theShape The shape to remove the features from.  It should either be the SOLID, COMPSOLID or COMPOUND of Solids.
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

		/****** BRepAlgoAPI_Defeaturing::SetToFillHistory ******/
		/****** md5 signature: 74ee5996560ad06ab737a4c8f4c7350d ******/
		%feature("compactdefaultargs") SetToFillHistory;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
Defines whether to track the modification of the shapes or not.
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
		/****** BRepAlgoAPI_BooleanOperation::BRepAlgoAPI_BooleanOperation ******/
		/****** md5 signature: ecd6042de04813653a64f217d81e1a57 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_BooleanOperation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepAlgoAPI_BooleanOperation;
		 BRepAlgoAPI_BooleanOperation();

		/****** BRepAlgoAPI_BooleanOperation::BRepAlgoAPI_BooleanOperation ******/
		/****** md5 signature: 911dfe6e6653bd69280d3f5c21f112f5 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_BooleanOperation;
		%feature("autodoc", "
Parameters
----------
thePF: BOPAlgo_PaveFiller

Return
-------
None

Description
-----------
Constructor with precomputed intersections of arguments.
") BRepAlgoAPI_BooleanOperation;
		 BRepAlgoAPI_BooleanOperation(const BOPAlgo_PaveFiller & thePF);

		/****** BRepAlgoAPI_BooleanOperation::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Performs the Boolean operation.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_BooleanOperation::Operation ******/
		/****** md5 signature: 3fe7ad033306b813a524bc39f03a5e6e ******/
		%feature("compactdefaultargs") Operation;
		%feature("autodoc", "Return
-------
BOPAlgo_Operation

Description
-----------
Returns the type of Boolean Operation.
") Operation;
		BOPAlgo_Operation Operation();

		/****** BRepAlgoAPI_BooleanOperation::SetOperation ******/
		/****** md5 signature: cef1e63b0452d16e7996e89724a77c38 ******/
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "
Parameters
----------
theBOP: BOPAlgo_Operation

Return
-------
None

Description
-----------
Sets the type of Boolean operation.
") SetOperation;
		void SetOperation(const BOPAlgo_Operation theBOP);

		/****** BRepAlgoAPI_BooleanOperation::SetTools ******/
		/****** md5 signature: 3be2cbb7f8439cb12462b3704230f424 ******/
		%feature("compactdefaultargs") SetTools;
		%feature("autodoc", "
Parameters
----------
theLS: TopTools_ListOfShape

Return
-------
None

Description
-----------
Sets the Tool arguments.
") SetTools;
		void SetTools(const TopTools_ListOfShape & theLS);

		/****** BRepAlgoAPI_BooleanOperation::Shape1 ******/
		/****** md5 signature: 8981b86985f46147f6d78d0ef2565c6e ******/
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the first argument involved in this Boolean operation. Obsolete.
") Shape1;
		const TopoDS_Shape Shape1();

		/****** BRepAlgoAPI_BooleanOperation::Shape2 ******/
		/****** md5 signature: 2c54bae91519136523ed62dc1f27ae72 ******/
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the second argument involved in this Boolean operation. Obsolete.
") Shape2;
		const TopoDS_Shape Shape2();

		/****** BRepAlgoAPI_BooleanOperation::Tools ******/
		/****** md5 signature: 0471973aac274d4f863776957a65fd19 ******/
		%feature("compactdefaultargs") Tools;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the Tools arguments.
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
		/****** BRepAlgoAPI_Splitter::BRepAlgoAPI_Splitter ******/
		/****** md5 signature: 9ef21f13bc074dc22af2512d12d68538 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Splitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepAlgoAPI_Splitter;
		 BRepAlgoAPI_Splitter();

		/****** BRepAlgoAPI_Splitter::BRepAlgoAPI_Splitter ******/
		/****** md5 signature: 7e6131d308f84171e35c6eadd0d40875 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Splitter;
		%feature("autodoc", "
Parameters
----------
thePF: BOPAlgo_PaveFiller

Return
-------
None

Description
-----------
Constructor with already prepared intersection tool - PaveFiller.
") BRepAlgoAPI_Splitter;
		 BRepAlgoAPI_Splitter(const BOPAlgo_PaveFiller & thePF);

		/****** BRepAlgoAPI_Splitter::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Performs the Split operation. Performs the intersection of the argument shapes (both objects and tools) and splits objects by the tools.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Splitter::SetTools ******/
		/****** md5 signature: 3be2cbb7f8439cb12462b3704230f424 ******/
		%feature("compactdefaultargs") SetTools;
		%feature("autodoc", "
Parameters
----------
theLS: TopTools_ListOfShape

Return
-------
None

Description
-----------
Sets the Tool arguments.
") SetTools;
		void SetTools(const TopTools_ListOfShape & theLS);

		/****** BRepAlgoAPI_Splitter::Tools ******/
		/****** md5 signature: 0471973aac274d4f863776957a65fd19 ******/
		%feature("compactdefaultargs") Tools;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the Tool arguments.
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
		/****** BRepAlgoAPI_Common::BRepAlgoAPI_Common ******/
		/****** md5 signature: f91369cacf90268e3d29941c629e6143 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common();

		/****** BRepAlgoAPI_Common::BRepAlgoAPI_Common ******/
		/****** md5 signature: 221ea98268ab300eec5e97d97aab1008 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "
Parameters
----------
PF: BOPAlgo_PaveFiller

Return
-------
None

Description
-----------
Empty constructor <PF> - PaveFiller object that is carried out.
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common(const BOPAlgo_PaveFiller & PF);

		/****** BRepAlgoAPI_Common::BRepAlgoAPI_Common ******/
		/****** md5 signature: 281aea6470a4b9efa44abd92f03bd429 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Constructor with two shapes <S1> -argument <S2> -tool <anOperation> - the type of the operation Obsolete.
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Common::BRepAlgoAPI_Common ******/
		/****** md5 signature: 435fb55f2697ff39118c51724120f6f5 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
PF: BOPAlgo_PaveFiller
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Constructor with two shapes <S1> -argument <S2> -tool <anOperation> - the type of the operation <PF> - PaveFiller object that is carried out Obsolete.
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const BOPAlgo_PaveFiller & PF, const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** BRepAlgoAPI_Cut::BRepAlgoAPI_Cut ******/
		/****** md5 signature: 629dc45f6ac54a1d0dd3eb613bb25729 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut();

		/****** BRepAlgoAPI_Cut::BRepAlgoAPI_Cut ******/
		/****** md5 signature: d1f642f339e236fdb33a884982f2791a ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "
Parameters
----------
PF: BOPAlgo_PaveFiller

Return
-------
None

Description
-----------
Empty constructor <PF> - PaveFiller object that is carried out.
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut(const BOPAlgo_PaveFiller & PF);

		/****** BRepAlgoAPI_Cut::BRepAlgoAPI_Cut ******/
		/****** md5 signature: aa1da534b9c66c537779d74c3ab72d96 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Constructor with two shapes <S1> -argument <S2> -tool <anOperation> - the type of the operation Obsolete.
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Cut::BRepAlgoAPI_Cut ******/
		/****** md5 signature: ac4b1606254f036b586cca6028e78c28 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
aDSF: BOPAlgo_PaveFiller
bFWD: bool (optional, default to Standard_True)
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Constructor with two shapes <S1> -argument <S2> -tool <anOperation> - the type of the operation <PF> - PaveFiller object that is carried out Obsolete.
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const BOPAlgo_PaveFiller & aDSF, const Standard_Boolean bFWD = Standard_True, const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** BRepAlgoAPI_Fuse::BRepAlgoAPI_Fuse ******/
		/****** md5 signature: ba31d780d01f5752b12d845f4446df0f ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse();

		/****** BRepAlgoAPI_Fuse::BRepAlgoAPI_Fuse ******/
		/****** md5 signature: 7689d836e2615ec52255c3ee260ddb69 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "
Parameters
----------
PF: BOPAlgo_PaveFiller

Return
-------
None

Description
-----------
Empty constructor <PF> - PaveFiller object that is carried out.
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse(const BOPAlgo_PaveFiller & PF);

		/****** BRepAlgoAPI_Fuse::BRepAlgoAPI_Fuse ******/
		/****** md5 signature: 997b51870f06f995a1de922a1d169097 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Constructor with two shapes <S1> -argument <S2> -tool <anOperation> - the type of the operation Obsolete.
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Fuse::BRepAlgoAPI_Fuse ******/
		/****** md5 signature: 0619d132bb7d5cd901bfe7d534a8a34b ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
aDSF: BOPAlgo_PaveFiller
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Constructor with two shapes <S1> -argument <S2> -tool <anOperation> - the type of the operation <PF> - PaveFiller object that is carried out Obsolete.
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const BOPAlgo_PaveFiller & aDSF, const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** BRepAlgoAPI_Section::BRepAlgoAPI_Section ******/
		/****** md5 signature: a47f0ceb741798857db55d2032f40092 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section();

		/****** BRepAlgoAPI_Section::BRepAlgoAPI_Section ******/
		/****** md5 signature: bda2ec08baeb2e74ab6cb69daaf2c885 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "
Parameters
----------
PF: BOPAlgo_PaveFiller

Return
-------
None

Description
-----------
Empty constructor <PF> - PaveFiller object that is carried out.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const BOPAlgo_PaveFiller & PF);

		/****** BRepAlgoAPI_Section::BRepAlgoAPI_Section ******/
		/****** md5 signature: cb5bfbec844bcec9b0cb0f6e222e3512 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
PerformNow: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Constructor with two shapes <S1> -argument <S2> -tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediately Obsolete.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Standard_Boolean PerformNow = Standard_True);

		/****** BRepAlgoAPI_Section::BRepAlgoAPI_Section ******/
		/****** md5 signature: 6f2f6902a99b64288c481b6cad474b59 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
aDSF: BOPAlgo_PaveFiller
PerformNow: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Constructor with two shapes <S1> -argument <S2> -tool <PF> - PaveFiller object that is carried out <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediately Obsolete.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const BOPAlgo_PaveFiller & aDSF, const Standard_Boolean PerformNow = Standard_True);

		/****** BRepAlgoAPI_Section::BRepAlgoAPI_Section ******/
		/****** md5 signature: 30e774e5a1508f5dd6195bbba8028bdd ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
Pl: gp_Pln
PerformNow: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Constructor with two shapes <S1> - argument <Pl> - tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediately Obsolete.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const TopoDS_Shape & S1, const gp_Pln & Pl, const Standard_Boolean PerformNow = Standard_True);

		/****** BRepAlgoAPI_Section::BRepAlgoAPI_Section ******/
		/****** md5 signature: c287bb4bc888ac88d0cb0da777c82aa7 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
Sf: Geom_Surface
PerformNow: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Constructor with two shapes <S1> - argument <Sf> - tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediately Obsolete.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const TopoDS_Shape & S1, const opencascade::handle<Geom_Surface> & Sf, const Standard_Boolean PerformNow = Standard_True);

		/****** BRepAlgoAPI_Section::BRepAlgoAPI_Section ******/
		/****** md5 signature: 672281bf6f9f679b4d466fb17e60f6c9 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "
Parameters
----------
Sf: Geom_Surface
S2: TopoDS_Shape
PerformNow: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Constructor with two shapes <Sf> - argument <S2> - tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediately Obsolete.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const opencascade::handle<Geom_Surface> & Sf, const TopoDS_Shape & S2, const Standard_Boolean PerformNow = Standard_True);

		/****** BRepAlgoAPI_Section::BRepAlgoAPI_Section ******/
		/****** md5 signature: b272770396cfbca61affc5a095f04dbc ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "
Parameters
----------
Sf1: Geom_Surface
Sf2: Geom_Surface
PerformNow: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Constructor with two shapes <Sf1> - argument <Sf2> - tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediately Obsolete.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const opencascade::handle<Geom_Surface> & Sf1, const opencascade::handle<Geom_Surface> & Sf2, const Standard_Boolean PerformNow = Standard_True);

		/****** BRepAlgoAPI_Section::Approximation ******/
		/****** md5 signature: f599ca30fa002b2a3dc329decde6ce74 ******/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") Approximation;
		void Approximation(const Standard_Boolean B);

		/****** BRepAlgoAPI_Section::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Performs the algorithm Filling interference Data Structure (if it is necessary) Building the result of the operation.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Section::ComputePCurveOn1 ******/
		/****** md5 signature: e4a8add7cd0d8f532479132026321808 ******/
		%feature("compactdefaultargs") ComputePCurveOn1;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
Indicates whether the P-Curve should be (or not) performed on the argument. By default, no parametric 2D curve (pcurve) is defined for the edges of the result. If ComputePCurve1 equals true, further computations performed to attach an P-Curve in the parametric space of the argument to the constructed edges. Obsolete.
") ComputePCurveOn1;
		void ComputePCurveOn1(const Standard_Boolean B);

		/****** BRepAlgoAPI_Section::ComputePCurveOn2 ******/
		/****** md5 signature: 69d49dff388a83191da02eb8e1945b69 ******/
		%feature("compactdefaultargs") ComputePCurveOn2;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
Indicates whether the P-Curve should be (or not) performed on the tool. By default, no parametric 2D curve (pcurve) is defined for the edges of the result. If ComputePCurve1 equals true, further computations performed to attach an P-Curve in the parametric space of the tool to the constructed edges. Obsolete.
") ComputePCurveOn2;
		void ComputePCurveOn2(const Standard_Boolean B);

		/****** BRepAlgoAPI_Section::HasAncestorFaceOn1 ******/
		/****** md5 signature: 36605047037cbfa30f9efcc59b149e44 ******/
		%feature("compactdefaultargs") HasAncestorFaceOn1;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
F: TopoDS_Shape

Return
-------
bool

Description
-----------
get the face of the first part giving section edge <E>. Returns True on the 3 following conditions: 1/ <E> is an edge returned by the Shape() metwod. 2/ First part of section performed is a shape. 3/ <E> is built on a intersection curve (i.e <E> is not the result of common edges) When False, F remains untouched. Obsolete.
") HasAncestorFaceOn1;
		Standard_Boolean HasAncestorFaceOn1(const TopoDS_Shape & E, TopoDS_Shape & F);

		/****** BRepAlgoAPI_Section::HasAncestorFaceOn2 ******/
		/****** md5 signature: 0642a4fb4df5a635412bd18e5f65e916 ******/
		%feature("compactdefaultargs") HasAncestorFaceOn2;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
F: TopoDS_Shape

Return
-------
bool

Description
-----------
Identifies the ancestor faces of the intersection edge E resulting from the last computation performed in this framework, that is, the faces of the two original shapes on which the edge E lies: - HasAncestorFaceOn1 gives the ancestor face in the first shape, and - HasAncestorFaceOn2 gives the ancestor face in the second shape. These functions return true if an ancestor face F is found, or false if not. An ancestor face is identifiable for the edge E if the following conditions are satisfied: - the first part on which this algorithm performed its last computation is a shape, that is, it was not given as a surface or a plane at the time of construction of this algorithm or at a later time by the Init1 function, - E is one of the elementary edges built by the last computation of this section algorithm. To use these functions properly, you have to test the returned Boolean value before using the ancestor face: F is significant only if the returned Boolean value equals true. Obsolete.
") HasAncestorFaceOn2;
		Standard_Boolean HasAncestorFaceOn2(const TopoDS_Shape & E, TopoDS_Shape & F);

		/****** BRepAlgoAPI_Section::Init1 ******/
		/****** md5 signature: 7fa686f55d72920afc50e65b8a84a805 ******/
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape

Return
-------
None

Description
-----------
initialize the argument <S1> - argument Obsolete.
") Init1;
		void Init1(const TopoDS_Shape & S1);

		/****** BRepAlgoAPI_Section::Init1 ******/
		/****** md5 signature: 1e834e5b66aacf2f588a792cb0edcd57 ******/
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln

Return
-------
None

Description
-----------
initialize the argument <Pl> - argument Obsolete.
") Init1;
		void Init1(const gp_Pln & Pl);

		/****** BRepAlgoAPI_Section::Init1 ******/
		/****** md5 signature: a94f1a0649d28cfd679dcbe46833b484 ******/
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "
Parameters
----------
Sf: Geom_Surface

Return
-------
None

Description
-----------
initialize the argument <Sf> - argument Obsolete.
") Init1;
		void Init1(const opencascade::handle<Geom_Surface> & Sf);

		/****** BRepAlgoAPI_Section::Init2 ******/
		/****** md5 signature: 8a35dc2983e205023df1fac2afbf3b01 ******/
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "
Parameters
----------
S2: TopoDS_Shape

Return
-------
None

Description
-----------
initialize the tool <S2> - tool Obsolete.
") Init2;
		void Init2(const TopoDS_Shape & S2);

		/****** BRepAlgoAPI_Section::Init2 ******/
		/****** md5 signature: 1fb6fdb5216fde3b15724409206adcfe ******/
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln

Return
-------
None

Description
-----------
initialize the tool <Pl> - tool Obsolete.
") Init2;
		void Init2(const gp_Pln & Pl);

		/****** BRepAlgoAPI_Section::Init2 ******/
		/****** md5 signature: 86865e03b7bd5eecac0d55746d523771 ******/
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "
Parameters
----------
Sf: Geom_Surface

Return
-------
None

Description
-----------
initialize the tool <Sf> - tool Obsolete.
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
/* class aliases */
%pythoncode {
}
