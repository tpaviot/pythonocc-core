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
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check();

		/****************** BRepAlgoAPI_Check ******************/
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
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Shows whether shape(s) valid or not.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the check.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns faulty shapes.

Returns
-------
BOPAlgo_ListOfCheckResult
") Result;
		const BOPAlgo_ListOfCheckResult & Result();

		/****************** SetData ******************/
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
		%feature("compactdefaultargs") BRepAlgoAPI_BuilderAlgo;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_BuilderAlgo;
		 BRepAlgoAPI_BuilderAlgo();

		/****************** BRepAlgoAPI_BuilderAlgo ******************/
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
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Gets the arguments.

Returns
-------
TopTools_ListOfShape
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs the algorithm.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Builder ******************/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "Returns the building tool.

Returns
-------
BOPAlgo_PBuilder
") Builder;
		const BOPAlgo_PBuilder & Builder();

		/****************** CheckInverted ******************/
		%feature("compactdefaultargs") CheckInverted;
		%feature("autodoc", "Returns the flag defining whether the check for input solids on inverted status should be performed or not.

Returns
-------
bool
") CheckInverted;
		Standard_Boolean CheckInverted();

		/****************** DSFiller ******************/
		%feature("compactdefaultargs") DSFiller;
		%feature("autodoc", "Returns the intersection tool.

Returns
-------
BOPAlgo_PPaveFiller
") DSFiller;
		const BOPAlgo_PPaveFiller & DSFiller();

		/****************** Generated ******************/
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
		%feature("compactdefaultargs") Glue;
		%feature("autodoc", "Returns the glue option of the algorithm.

Returns
-------
BOPAlgo_GlueEnum
") Glue;
		BOPAlgo_GlueEnum Glue();

		/****************** HasDeleted ******************/
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "Returns true if any of the input shapes has been deleted during operation. normally, general fuse operation should not have deleted elements, but all derived operation can have.

Returns
-------
bool
") HasDeleted;
		virtual Standard_Boolean HasDeleted();

		/****************** HasGenerated ******************/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "Returns true if any of the input shapes has generated shapes during operation.

Returns
-------
bool
") HasGenerated;
		virtual Standard_Boolean HasGenerated();

		/****************** HasHistory ******************/
		%feature("compactdefaultargs") HasHistory;
		%feature("autodoc", "Returns flag of history availability.

Returns
-------
bool
") HasHistory;
		Standard_Boolean HasHistory();

		/****************** HasModified ******************/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "Returns true if any of the input shapes has been modified during operation.

Returns
-------
bool
") HasModified;
		virtual Standard_Boolean HasModified();

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "History tool.

Returns
-------
opencascade::handle<BRepTools_History>
") History;
		opencascade::handle<BRepTools_History> History();

		/****************** IsDeleted ******************/
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
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "Returns the flag that defines the mode of treatment. in non-destructive mode the argument shapes are not modified. instead a copy of a sub-shape is created in the result if it is needed to be updated.

Returns
-------
bool
") NonDestructive;
		Standard_Boolean NonDestructive();

		/****************** SectionEdges ******************/
		%feature("compactdefaultargs") SectionEdges;
		%feature("autodoc", "Returns a list of section edges. the edges represent the result of intersection between arguments of operation.

Returns
-------
TopTools_ListOfShape
") SectionEdges;
		const TopTools_ListOfShape & SectionEdges();

		/****************** SetArguments ******************/
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
		%feature("compactdefaultargs") BRepAlgoAPI_Defeaturing;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Defeaturing;
		 BRepAlgoAPI_Defeaturing();

		/****************** AddFaceToRemove ******************/
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
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs the operation.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** FacesToRemove ******************/
		%feature("compactdefaultargs") FacesToRemove;
		%feature("autodoc", "Returns the list of faces which have been requested for removal from the input shape.

Returns
-------
TopTools_ListOfShape
") FacesToRemove;
		const TopTools_ListOfShape & FacesToRemove();

		/****************** Generated ******************/
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
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "Returns true if any of the input shapes has been deleted during operation.

Returns
-------
bool
") HasDeleted;
		virtual Standard_Boolean HasDeleted();

		/****************** HasGenerated ******************/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "Returns true if any of the input shapes has generated shapes during operation.

Returns
-------
bool
") HasGenerated;
		virtual Standard_Boolean HasGenerated();

		/****************** HasHistory ******************/
		%feature("compactdefaultargs") HasHistory;
		%feature("autodoc", "Returns whether the history was requested or not.

Returns
-------
bool
") HasHistory;
		Standard_Boolean HasHistory();

		/****************** HasModified ******************/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "Returns true if any of the input shapes has been modified during operation.

Returns
-------
bool
") HasModified;
		virtual Standard_Boolean HasModified();

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Returns the history of shapes modifications.

Returns
-------
opencascade::handle<BRepTools_History>
") History;
		opencascade::handle<BRepTools_History> History();

		/****************** InputShape ******************/
		%feature("compactdefaultargs") InputShape;
		%feature("autodoc", "Returns the input shape.

Returns
-------
TopoDS_Shape
") InputShape;
		const TopoDS_Shape InputShape();

		/****************** IsDeleted ******************/
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
		%feature("compactdefaultargs") BRepAlgoAPI_BooleanOperation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_BooleanOperation;
		 BRepAlgoAPI_BooleanOperation();

		/****************** BRepAlgoAPI_BooleanOperation ******************/
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
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs the boolean operation.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Operation ******************/
		%feature("compactdefaultargs") Operation;
		%feature("autodoc", "Returns the type of boolean operation.

Returns
-------
BOPAlgo_Operation
") Operation;
		BOPAlgo_Operation Operation();

		/****************** SetOperation ******************/
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
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", "Returns the first argument involved in this boolean operation. obsolete.

Returns
-------
TopoDS_Shape
") Shape1;
		const TopoDS_Shape Shape1();

		/****************** Shape2 ******************/
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", "Returns the second argument involved in this boolean operation. obsolete.

Returns
-------
TopoDS_Shape
") Shape2;
		const TopoDS_Shape Shape2();

		/****************** Tools ******************/
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
		%feature("compactdefaultargs") BRepAlgoAPI_Splitter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Splitter;
		 BRepAlgoAPI_Splitter();

		/****************** BRepAlgoAPI_Splitter ******************/
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
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs the split operation. performs the intersection of the argument shapes (both objects and tools) and splits objects by the tools.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** SetTools ******************/
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
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common();

		/****************** BRepAlgoAPI_Common ******************/
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
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut();

		/****************** BRepAlgoAPI_Cut ******************/
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
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse();

		/****************** BRepAlgoAPI_Fuse ******************/
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
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section();

		/****************** BRepAlgoAPI_Section ******************/
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
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs the algorithm filling interference data structure (if it is necessary) building the result of the operation.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** ComputePCurveOn1 ******************/
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
