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
#include<TopTools_module.hxx>
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
		/****** md5 signature: 52dd8c9ea3b664e92a4372809ce8921d ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
bTestSE: bool (optional, default to true)
bTestSI: bool (optional, default to true)
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
		 BRepAlgoAPI_Check(const TopoDS_Shape & theS, const bool bTestSE = true, const bool bTestSI = true, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Check::BRepAlgoAPI_Check ******/
		/****** md5 signature: dd705a9594505b9d4e02c108e4fb9197 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "
Parameters
----------
theS1: TopoDS_Shape
theS2: TopoDS_Shape
theOp: BOPAlgo_Operation (optional, default to BOPAlgo_UNKNOWN)
bTestSE: bool (optional, default to true)
bTestSI: bool (optional, default to true)
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
		 BRepAlgoAPI_Check(const TopoDS_Shape & theS1, const TopoDS_Shape & theS2, const BOPAlgo_Operation theOp = BOPAlgo_UNKNOWN, const bool bTestSE = true, const bool bTestSI = true, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Check::IsValid ******/
		/****** md5 signature: 82efcf3e608ccd8c0d0a35a3a439a722 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Shows whether shape(s) valid or not.
") IsValid;
		bool IsValid();

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
		/****** md5 signature: 8d26033858e0a1825ae93927c067d61d ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
NCollection_List<BOPAlgo_CheckResult>

Description
-----------
Returns faulty shapes.
") Result;
		const NCollection_List<BOPAlgo_CheckResult> & Result();

		/****** BRepAlgoAPI_Check::SetData ******/
		/****** md5 signature: 14f01d1770a64de432e724a1ebf37382 ******/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
bTestSE: bool (optional, default to true)
bTestSI: bool (optional, default to true)

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
		void SetData(const TopoDS_Shape & theS, const bool bTestSE = true, const bool bTestSI = true);

		/****** BRepAlgoAPI_Check::SetData ******/
		/****** md5 signature: 1d2f3777957ffae0ba1af1a88a5f4e69 ******/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "
Parameters
----------
theS1: TopoDS_Shape
theS2: TopoDS_Shape
theOp: BOPAlgo_Operation (optional, default to BOPAlgo_UNKNOWN)
bTestSE: bool (optional, default to true)
bTestSI: bool (optional, default to true)

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
		void SetData(const TopoDS_Shape & theS1, const TopoDS_Shape & theS2, const BOPAlgo_Operation theOp = BOPAlgo_UNKNOWN, const bool bTestSE = true, const bool bTestSI = true);

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
		/****** md5 signature: 67475a0ea0ddfe61d404399d95b89ea0 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns a shape built by the shape construction algorithm. Does not check if the shape is built.
") Shape;
		const TopoDS_Shape Shape();

};


%extend BRepAlgoAPI_Algo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepAlgoAPI_BuilderAlgo *
********************************/
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
		/****** md5 signature: 5a73a43aadf1fe17c79a981a16e3c0ac ******/
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
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
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
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Defeaturing::FacesToRemove ******/
		/****** md5 signature: 2265923b20d3cdfe0e4bc1cba758c7d2 ******/
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
		/****** md5 signature: 9b9a05fc05596bf1aae965197e0fcaf8 ******/
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
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & theS);

		/****** BRepAlgoAPI_Defeaturing::HasDeleted ******/
		/****** md5 signature: 9af855f0e7dfa60c7b3bcd573b520120 ******/
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has been deleted during operation.
") HasDeleted;
		virtual bool HasDeleted();

		/****** BRepAlgoAPI_Defeaturing::HasGenerated ******/
		/****** md5 signature: f2540eb5a2ba9856f4501cf8a3b86f5a ******/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has generated shapes during operation.
") HasGenerated;
		virtual bool HasGenerated();

		/****** BRepAlgoAPI_Defeaturing::HasHistory ******/
		/****** md5 signature: 4e7f7d67e0066c12e74fcbd6a94053ea ******/
		%feature("compactdefaultargs") HasHistory;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether the history was requested or not.
") HasHistory;
		bool HasHistory();

		/****** BRepAlgoAPI_Defeaturing::HasModified ******/
		/****** md5 signature: f5286605b2147aa4cab96d15d0becdba ******/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has been modified during operation.
") HasModified;
		virtual bool HasModified();

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
		/****** md5 signature: 7f513ef53f962b91a8f82acae295fe11 ******/
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
		bool IsDeleted(const TopoDS_Shape & theS);

		/****** BRepAlgoAPI_Defeaturing::Modified ******/
		/****** md5 signature: fe07e72bf2ba9abb3cc72857d221a523 ******/
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
		const TopTools_ListOfShape & Modified(const TopoDS_Shape & theS);

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
		/****** md5 signature: c81ddc48f4865fa2871e33e8621f950f ******/
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
		void SetToFillHistory(const bool theFlag);

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
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
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
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** md5 signature: 21fc7a634b846e7217d3dc19afae2215 ******/
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
		/****** md5 signature: f354d26768926e996d17ca393c56586f ******/
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
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
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
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Splitter::SetTools ******/
		/****** md5 signature: 21fc7a634b846e7217d3dc19afae2215 ******/
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
		/****** md5 signature: f354d26768926e996d17ca393c56586f ******/
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
		/****** md5 signature: cef932389aad2678136d951946e3a59e ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
aDSF: BOPAlgo_PaveFiller
bFWD: bool (optional, default to true)
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Constructor with two shapes <S1> -argument <S2> -tool <anOperation> - the type of the operation <PF> - PaveFiller object that is carried out Obsolete.
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const BOPAlgo_PaveFiller & aDSF, const bool bFWD = true, const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** md5 signature: 80e4bcf869adf85676d82e9cdea51e40 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
PerformNow: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructor with two shapes <S1> -argument <S2> -tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediately Obsolete.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const bool PerformNow = true);

		/****** BRepAlgoAPI_Section::BRepAlgoAPI_Section ******/
		/****** md5 signature: c1d8a9abd3ebbc4e11e9ad553d2bbfeb ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
aDSF: BOPAlgo_PaveFiller
PerformNow: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructor with two shapes <S1> -argument <S2> -tool <PF> - PaveFiller object that is carried out <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediately Obsolete.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const BOPAlgo_PaveFiller & aDSF, const bool PerformNow = true);

		/****** BRepAlgoAPI_Section::BRepAlgoAPI_Section ******/
		/****** md5 signature: 6c42a7ea202b28d5960932be99a82713 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
Pl: gp_Pln
PerformNow: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructor with two shapes <S1> - argument <Pl> - tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediately Obsolete.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const TopoDS_Shape & S1, const gp_Pln & Pl, const bool PerformNow = true);

		/****** BRepAlgoAPI_Section::BRepAlgoAPI_Section ******/
		/****** md5 signature: 8ecd8292a73e39f3776d254f90271016 ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
Sf: Geom_Surface
PerformNow: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructor with two shapes <S1> - argument <Sf> - tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediately Obsolete.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const TopoDS_Shape & S1, const opencascade::handle<Geom_Surface> & Sf, const bool PerformNow = true);

		/****** BRepAlgoAPI_Section::BRepAlgoAPI_Section ******/
		/****** md5 signature: 3eaa63164bafc2c73aafeb0281d58ffe ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "
Parameters
----------
Sf: Geom_Surface
S2: TopoDS_Shape
PerformNow: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructor with two shapes <Sf> - argument <S2> - tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediately Obsolete.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const opencascade::handle<Geom_Surface> & Sf, const TopoDS_Shape & S2, const bool PerformNow = true);

		/****** BRepAlgoAPI_Section::BRepAlgoAPI_Section ******/
		/****** md5 signature: 3c2874e9f43ec68ac2245e8f9652300d ******/
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "
Parameters
----------
Sf1: Geom_Surface
Sf2: Geom_Surface
PerformNow: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructor with two shapes <Sf1> - argument <Sf2> - tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediately Obsolete.
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section(const opencascade::handle<Geom_Surface> & Sf1, const opencascade::handle<Geom_Surface> & Sf2, const bool PerformNow = true);

		/****** BRepAlgoAPI_Section::Approximation ******/
		/****** md5 signature: 38ff5c44dc07d656beef65d03bf56649 ******/
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
		void Approximation(const bool B);

		/****** BRepAlgoAPI_Section::Build ******/
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
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
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepAlgoAPI_Section::ComputePCurveOn1 ******/
		/****** md5 signature: 69805c9d10a55b01b847257427876a19 ******/
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
		void ComputePCurveOn1(const bool B);

		/****** BRepAlgoAPI_Section::ComputePCurveOn2 ******/
		/****** md5 signature: 66847d44241b20484b3138ba5118e651 ******/
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
		void ComputePCurveOn2(const bool B);

		/****** BRepAlgoAPI_Section::HasAncestorFaceOn1 ******/
		/****** md5 signature: eb44e40dc90b556c541df4d3647df2ed ******/
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
		bool HasAncestorFaceOn1(const TopoDS_Shape & E, TopoDS_Shape & F);

		/****** BRepAlgoAPI_Section::HasAncestorFaceOn2 ******/
		/****** md5 signature: dbc0ca03380e9742ebd5a2fc7caaaa58 ******/
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
		bool HasAncestorFaceOn2(const TopoDS_Shape & E, TopoDS_Shape & F);

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

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BRepAlgoAPI_BuilderAlgo:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
