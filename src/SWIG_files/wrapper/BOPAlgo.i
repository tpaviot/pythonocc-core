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
%define BOPALGODOCSTRING
"BOPAlgo module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_bopalgo.html"
%enddef
%module (package="OCC.Core", docstring=BOPALGODOCSTRING) BOPAlgo


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
#include<BOPAlgo_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
#include<Message_module.hxx>
#include<TColStd_module.hxx>
#include<IntTools_module.hxx>
#include<BOPDS_module.hxx>
#include<Bnd_module.hxx>
#include<gp_module.hxx>
#include<BRepTools_module.hxx>
#include<BOPTools_module.hxx>
#include<TopAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<Extrema_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TopLoc_module.hxx>
#include<Approx_module.hxx>
#include<IntPatch_module.hxx>
#include<Geom_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<AppParCurves_module.hxx>
#include<Bnd_module.hxx>
#include<IntTools_module.hxx>
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
%import TopoDS.i
%import TopTools.i
%import Message.i
%import TColStd.i
%import IntTools.i
%import BOPDS.i
%import Bnd.i
%import gp.i
%import BRepTools.i
%import BOPTools.i
%import TopAbs.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum BOPAlgo_CheckStatus {
	BOPAlgo_CheckUnknown = 0,
	BOPAlgo_BadType = 1,
	BOPAlgo_SelfIntersect = 2,
	BOPAlgo_TooSmallEdge = 3,
	BOPAlgo_NonRecoverableFace = 4,
	BOPAlgo_IncompatibilityOfVertex = 5,
	BOPAlgo_IncompatibilityOfEdge = 6,
	BOPAlgo_IncompatibilityOfFace = 7,
	BOPAlgo_OperationAborted = 8,
	BOPAlgo_GeomAbs_C0 = 9,
	BOPAlgo_InvalidCurveOnSurface = 10,
	BOPAlgo_NotValid = 11,
};

enum BOPAlgo_GlueEnum {
	BOPAlgo_GlueOff = 0,
	BOPAlgo_GlueShift = 1,
	BOPAlgo_GlueFull = 2,
};

enum BOPAlgo_Operation {
	BOPAlgo_COMMON = 0,
	BOPAlgo_FUSE = 1,
	BOPAlgo_CUT = 2,
	BOPAlgo_CUT21 = 3,
	BOPAlgo_SECTION = 4,
	BOPAlgo_UNKNOWN = 5,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class BOPAlgo_CheckStatus(IntEnum):
	BOPAlgo_CheckUnknown = 0
	BOPAlgo_BadType = 1
	BOPAlgo_SelfIntersect = 2
	BOPAlgo_TooSmallEdge = 3
	BOPAlgo_NonRecoverableFace = 4
	BOPAlgo_IncompatibilityOfVertex = 5
	BOPAlgo_IncompatibilityOfEdge = 6
	BOPAlgo_IncompatibilityOfFace = 7
	BOPAlgo_OperationAborted = 8
	BOPAlgo_GeomAbs_C0 = 9
	BOPAlgo_InvalidCurveOnSurface = 10
	BOPAlgo_NotValid = 11
BOPAlgo_CheckUnknown = BOPAlgo_CheckStatus.BOPAlgo_CheckUnknown
BOPAlgo_BadType = BOPAlgo_CheckStatus.BOPAlgo_BadType
BOPAlgo_SelfIntersect = BOPAlgo_CheckStatus.BOPAlgo_SelfIntersect
BOPAlgo_TooSmallEdge = BOPAlgo_CheckStatus.BOPAlgo_TooSmallEdge
BOPAlgo_NonRecoverableFace = BOPAlgo_CheckStatus.BOPAlgo_NonRecoverableFace
BOPAlgo_IncompatibilityOfVertex = BOPAlgo_CheckStatus.BOPAlgo_IncompatibilityOfVertex
BOPAlgo_IncompatibilityOfEdge = BOPAlgo_CheckStatus.BOPAlgo_IncompatibilityOfEdge
BOPAlgo_IncompatibilityOfFace = BOPAlgo_CheckStatus.BOPAlgo_IncompatibilityOfFace
BOPAlgo_OperationAborted = BOPAlgo_CheckStatus.BOPAlgo_OperationAborted
BOPAlgo_GeomAbs_C0 = BOPAlgo_CheckStatus.BOPAlgo_GeomAbs_C0
BOPAlgo_InvalidCurveOnSurface = BOPAlgo_CheckStatus.BOPAlgo_InvalidCurveOnSurface
BOPAlgo_NotValid = BOPAlgo_CheckStatus.BOPAlgo_NotValid

class BOPAlgo_GlueEnum(IntEnum):
	BOPAlgo_GlueOff = 0
	BOPAlgo_GlueShift = 1
	BOPAlgo_GlueFull = 2
BOPAlgo_GlueOff = BOPAlgo_GlueEnum.BOPAlgo_GlueOff
BOPAlgo_GlueShift = BOPAlgo_GlueEnum.BOPAlgo_GlueShift
BOPAlgo_GlueFull = BOPAlgo_GlueEnum.BOPAlgo_GlueFull

class BOPAlgo_Operation(IntEnum):
	BOPAlgo_COMMON = 0
	BOPAlgo_FUSE = 1
	BOPAlgo_CUT = 2
	BOPAlgo_CUT21 = 3
	BOPAlgo_SECTION = 4
	BOPAlgo_UNKNOWN = 5
BOPAlgo_COMMON = BOPAlgo_Operation.BOPAlgo_COMMON
BOPAlgo_FUSE = BOPAlgo_Operation.BOPAlgo_FUSE
BOPAlgo_CUT = BOPAlgo_Operation.BOPAlgo_CUT
BOPAlgo_CUT21 = BOPAlgo_Operation.BOPAlgo_CUT21
BOPAlgo_SECTION = BOPAlgo_Operation.BOPAlgo_SECTION
BOPAlgo_UNKNOWN = BOPAlgo_Operation.BOPAlgo_UNKNOWN
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(BOPAlgo_ListOfCheckResult) NCollection_List<BOPAlgo_CheckResult>;

%extend NCollection_List<BOPAlgo_CheckResult> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef BOPAlgo_ListOfCheckResult::Iterator BOPAlgo_ListIteratorOfListOfCheckResult;
typedef NCollection_List<BOPAlgo_CheckResult> BOPAlgo_ListOfCheckResult;
typedef BOPAlgo_ArgumentAnalyzer * BOPAlgo_PArgumentAnalyzer;
typedef BOPAlgo_BOP * BOPAlgo_PBOP;
typedef BOPAlgo_Builder * BOPAlgo_PBuilder;
typedef BOPAlgo_PaveFiller * BOPAlgo_PPaveFiller;
typedef BOPAlgo_Section * BOPAlgo_PSection;
typedef BOPAlgo_WireEdgeSet * BOPAlgo_PWireEdgeSet;
/* end typedefs declaration */

/****************************
* class BOPAlgo_CheckResult *
****************************/
class BOPAlgo_CheckResult {
	public:
		/****** BOPAlgo_CheckResult::BOPAlgo_CheckResult ******/
		/****** md5 signature: dea769d54f4bd763585ebd4034c98353 ******/
		%feature("compactdefaultargs") BOPAlgo_CheckResult;
		%feature("autodoc", "Return
-------
None

Description
-----------
empty constructor.
") BOPAlgo_CheckResult;
		 BOPAlgo_CheckResult();

		/****** BOPAlgo_CheckResult::AddFaultyShape1 ******/
		/****** md5 signature: f4fc4348e7f32438e74e5bc925fb83c5 ******/
		%feature("compactdefaultargs") AddFaultyShape1;
		%feature("autodoc", "
Parameters
----------
TheShape: TopoDS_Shape

Return
-------
None

Description
-----------
adds faulty sub-shapes from object to a list.
") AddFaultyShape1;
		void AddFaultyShape1(const TopoDS_Shape & TheShape);

		/****** BOPAlgo_CheckResult::AddFaultyShape2 ******/
		/****** md5 signature: 08dbc2a8aeed47639b770ec0ac24b612 ******/
		%feature("compactdefaultargs") AddFaultyShape2;
		%feature("autodoc", "
Parameters
----------
TheShape: TopoDS_Shape

Return
-------
None

Description
-----------
adds faulty sub-shapes from tool to a list.
") AddFaultyShape2;
		void AddFaultyShape2(const TopoDS_Shape & TheShape);

		/****** BOPAlgo_CheckResult::GetCheckStatus ******/
		/****** md5 signature: 89e09e6d4b68f3aacbd1de7dc2d4e2f8 ******/
		%feature("compactdefaultargs") GetCheckStatus;
		%feature("autodoc", "Return
-------
BOPAlgo_CheckStatus

Description
-----------
gets status of faulty.
") GetCheckStatus;
		BOPAlgo_CheckStatus GetCheckStatus();

		/****** BOPAlgo_CheckResult::GetFaultyShapes1 ******/
		/****** md5 signature: f728fddcc353c4062194134e5bf43fd5 ******/
		%feature("compactdefaultargs") GetFaultyShapes1;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
returns list of faulty shapes for object.
") GetFaultyShapes1;
		const TopTools_ListOfShape & GetFaultyShapes1();

		/****** BOPAlgo_CheckResult::GetFaultyShapes2 ******/
		/****** md5 signature: 547a4a2e3a84bbf43143e6bb8c0f757f ******/
		%feature("compactdefaultargs") GetFaultyShapes2;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
returns list of faulty shapes for tool.
") GetFaultyShapes2;
		const TopTools_ListOfShape & GetFaultyShapes2();

		/****** BOPAlgo_CheckResult::GetMaxDistance1 ******/
		/****** md5 signature: a08934026a64239752b614e124fd393f ******/
		%feature("compactdefaultargs") GetMaxDistance1;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the distance for the first shape.
") GetMaxDistance1;
		Standard_Real GetMaxDistance1();

		/****** BOPAlgo_CheckResult::GetMaxDistance2 ******/
		/****** md5 signature: 635ed89e8c069eba76d435dbbab735c2 ******/
		%feature("compactdefaultargs") GetMaxDistance2;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the distance for the second shape.
") GetMaxDistance2;
		Standard_Real GetMaxDistance2();

		/****** BOPAlgo_CheckResult::GetMaxParameter1 ******/
		/****** md5 signature: 2d7b754d07c9650db3d770a6a970655c ******/
		%feature("compactdefaultargs") GetMaxParameter1;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter for the fircst shape.
") GetMaxParameter1;
		Standard_Real GetMaxParameter1();

		/****** BOPAlgo_CheckResult::GetMaxParameter2 ******/
		/****** md5 signature: 339892b104483047abe995771a167705 ******/
		%feature("compactdefaultargs") GetMaxParameter2;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter for the second shape.
") GetMaxParameter2;
		Standard_Real GetMaxParameter2();

		/****** BOPAlgo_CheckResult::GetShape1 ******/
		/****** md5 signature: da65271fea68f494586b07012e23b4bb ******/
		%feature("compactdefaultargs") GetShape1;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns ancestor shape (object) for faulties.
") GetShape1;
		const TopoDS_Shape GetShape1();

		/****** BOPAlgo_CheckResult::GetShape2 ******/
		/****** md5 signature: ad646522ebe6de8820d9424e4f21edb9 ******/
		%feature("compactdefaultargs") GetShape2;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns ancestor shape (tool) for faulties.
") GetShape2;
		const TopoDS_Shape GetShape2();

		/****** BOPAlgo_CheckResult::SetCheckStatus ******/
		/****** md5 signature: f3c122c6cb39ad6a91e7b859c005e322 ******/
		%feature("compactdefaultargs") SetCheckStatus;
		%feature("autodoc", "
Parameters
----------
TheStatus: BOPAlgo_CheckStatus

Return
-------
None

Description
-----------
set status of faulty.
") SetCheckStatus;
		void SetCheckStatus(const BOPAlgo_CheckStatus TheStatus);

		/****** BOPAlgo_CheckResult::SetMaxDistance1 ******/
		/****** md5 signature: f3f7c583b2244f7a9a07fbaa143b9f22 ******/
		%feature("compactdefaultargs") SetMaxDistance1;
		%feature("autodoc", "
Parameters
----------
theDist: float

Return
-------
None

Description
-----------
Sets max distance for the first shape.
") SetMaxDistance1;
		void SetMaxDistance1(const Standard_Real theDist);

		/****** BOPAlgo_CheckResult::SetMaxDistance2 ******/
		/****** md5 signature: 26e9a5acae152632933809ad11c56749 ******/
		%feature("compactdefaultargs") SetMaxDistance2;
		%feature("autodoc", "
Parameters
----------
theDist: float

Return
-------
None

Description
-----------
Sets max distance for the second shape.
") SetMaxDistance2;
		void SetMaxDistance2(const Standard_Real theDist);

		/****** BOPAlgo_CheckResult::SetMaxParameter1 ******/
		/****** md5 signature: 5df07c2f24ee4c4939cb016c85dc1437 ******/
		%feature("compactdefaultargs") SetMaxParameter1;
		%feature("autodoc", "
Parameters
----------
thePar: float

Return
-------
None

Description
-----------
Sets the parameter for the first shape.
") SetMaxParameter1;
		void SetMaxParameter1(const Standard_Real thePar);

		/****** BOPAlgo_CheckResult::SetMaxParameter2 ******/
		/****** md5 signature: ebcf38f33cf83375bcefa3a54a26e5ba ******/
		%feature("compactdefaultargs") SetMaxParameter2;
		%feature("autodoc", "
Parameters
----------
thePar: float

Return
-------
None

Description
-----------
Sets the parameter for the second shape.
") SetMaxParameter2;
		void SetMaxParameter2(const Standard_Real thePar);

		/****** BOPAlgo_CheckResult::SetShape1 ******/
		/****** md5 signature: 32d06bb8d221a179d322a30597a4d6c8 ******/
		%feature("compactdefaultargs") SetShape1;
		%feature("autodoc", "
Parameters
----------
TheShape: TopoDS_Shape

Return
-------
None

Description
-----------
sets ancestor shape (object) for faulty sub-shapes.
") SetShape1;
		void SetShape1(const TopoDS_Shape & TheShape);

		/****** BOPAlgo_CheckResult::SetShape2 ******/
		/****** md5 signature: 872074f224a41d220ff8f15ed451c9ac ******/
		%feature("compactdefaultargs") SetShape2;
		%feature("autodoc", "
Parameters
----------
TheShape: TopoDS_Shape

Return
-------
None

Description
-----------
sets ancestor shape (tool) for faulty sub-shapes.
") SetShape2;
		void SetShape2(const TopoDS_Shape & TheShape);

};


%extend BOPAlgo_CheckResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BOPAlgo_Options *
************************/
class BOPAlgo_Options {
	public:
		/****** BOPAlgo_Options::BOPAlgo_Options ******/
		/****** md5 signature: 1d3be438f8467a9d42a76784f9e361b9 ******/
		%feature("compactdefaultargs") BOPAlgo_Options;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPAlgo_Options;
		 BOPAlgo_Options();

		/****** BOPAlgo_Options::BOPAlgo_Options ******/
		/****** md5 signature: 1e4b6fcd71a6eff1c7af075708751619 ******/
		%feature("compactdefaultargs") BOPAlgo_Options;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Constructor with allocator.
") BOPAlgo_Options;
		 BOPAlgo_Options(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPAlgo_Options::AddError ******/
		/****** md5 signature: f00155f55c673f9e74c0f0dd7c25fadd ******/
		%feature("compactdefaultargs") AddError;
		%feature("autodoc", "
Parameters
----------
theAlert: Message_Alert

Return
-------
None

Description
-----------
Adds the alert as error (fail).
") AddError;
		void AddError(const opencascade::handle<Message_Alert> & theAlert);

		/****** BOPAlgo_Options::AddWarning ******/
		/****** md5 signature: 53094085790ca6daea4eb2a4ce8de10e ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
theAlert: Message_Alert

Return
-------
None

Description
-----------
Adds the alert as warning.
") AddWarning;
		void AddWarning(const opencascade::handle<Message_Alert> & theAlert);

		/****** BOPAlgo_Options::Allocator ******/
		/****** md5 signature: c2190efebec564fb34d6c8e52682605e ******/
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_BaseAllocator>

Description
-----------
Returns allocator.
") Allocator;
		const opencascade::handle<NCollection_BaseAllocator> & Allocator();

		/****** BOPAlgo_Options::Clear ******/
		/****** md5 signature: ee228ed41450ea46d6b542478ce426ba ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all warnings and errors, and any data cached by the algorithm. User defined options are not cleared.
") Clear;
		virtual void Clear();

		/****** BOPAlgo_Options::ClearWarnings ******/
		/****** md5 signature: 73c3b8280143bf02663ce560b2171c2b ******/
		%feature("compactdefaultargs") ClearWarnings;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the warnings of the algorithm.
") ClearWarnings;
		void ClearWarnings();

		/****** BOPAlgo_Options::DumpErrors ******/
		/****** md5 signature: 90a98b1a0d228edd0b78f11fc13715d9 ******/
		%feature("compactdefaultargs") DumpErrors;
		%feature("autodoc", "
Parameters
----------

Return
-------
theOS: Standard_OStream

Description
-----------
Dumps the error status into the given stream.
") DumpErrors;
		void DumpErrors(std::ostream &OutValue);

		/****** BOPAlgo_Options::DumpWarnings ******/
		/****** md5 signature: b7a54acbfda1ad785ffbd552beb749fd ******/
		%feature("compactdefaultargs") DumpWarnings;
		%feature("autodoc", "
Parameters
----------

Return
-------
theOS: Standard_OStream

Description
-----------
Dumps the warning statuses into the given stream.
") DumpWarnings;
		void DumpWarnings(std::ostream &OutValue);

		/****** BOPAlgo_Options::FuzzyValue ******/
		/****** md5 signature: c7081d612ee5325e18733e215807d19f ******/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the additional tolerance.
") FuzzyValue;
		Standard_Real FuzzyValue();

		/****** BOPAlgo_Options::GetParallelMode ******/
		/****** md5 signature: feaeebd94ff83efc7e77e3c0da668764 ******/
		%feature("compactdefaultargs") GetParallelMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Gets the global parallel mode.
") GetParallelMode;
		static Standard_Boolean GetParallelMode();

		/****** BOPAlgo_Options::GetReport ******/
		/****** md5 signature: 58a2006fc09eb4744f2647f5bb6aa259 ******/
		%feature("compactdefaultargs") GetReport;
		%feature("autodoc", "Return
-------
opencascade::handle<Message_Report>

Description
-----------
Returns report collecting all errors and warnings.
") GetReport;
		const opencascade::handle<Message_Report> & GetReport();

		/****** BOPAlgo_Options::HasError ******/
		/****** md5 signature: 16c1e1370b1b00520fec769582a88f3a ******/
		%feature("compactdefaultargs") HasError;
		%feature("autodoc", "
Parameters
----------
theType: Standard_Type

Return
-------
bool

Description
-----------
Returns true if algorithm has generated error of specified type.
") HasError;
		Standard_Boolean HasError(const opencascade::handle<Standard_Type> & theType);

		/****** BOPAlgo_Options::HasErrors ******/
		/****** md5 signature: bf718c128e76868673dd300f349b7f68 ******/
		%feature("compactdefaultargs") HasErrors;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if algorithm has failed.
") HasErrors;
		Standard_Boolean HasErrors();

		/****** BOPAlgo_Options::HasWarning ******/
		/****** md5 signature: f643e1ca521c66e8183b395e733ed0da ******/
		%feature("compactdefaultargs") HasWarning;
		%feature("autodoc", "
Parameters
----------
theType: Standard_Type

Return
-------
bool

Description
-----------
Returns true if algorithm has generated warning of specified type.
") HasWarning;
		Standard_Boolean HasWarning(const opencascade::handle<Standard_Type> & theType);

		/****** BOPAlgo_Options::HasWarnings ******/
		/****** md5 signature: 0d7f1d0092f1dca69e861f3bce5f0267 ******/
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if algorithm has generated some warning alerts.
") HasWarnings;
		Standard_Boolean HasWarnings();

		/****** BOPAlgo_Options::RunParallel ******/
		/****** md5 signature: 53cb29f6811f4f276d6c103cc8a9e7e1 ******/
		%feature("compactdefaultargs") RunParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag of parallel processing.
") RunParallel;
		Standard_Boolean RunParallel();

		/****** BOPAlgo_Options::SetFuzzyValue ******/
		/****** md5 signature: a6e52c994eeddfce238b90491de5f35c ******/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "
Parameters
----------
theFuzz: float

Return
-------
None

Description
-----------
Sets the additional tolerance.
") SetFuzzyValue;
		void SetFuzzyValue(const Standard_Real theFuzz);

		/****** BOPAlgo_Options::SetParallelMode ******/
		/****** md5 signature: b461eee387cc9df4779b32f144c1de40 ******/
		%feature("compactdefaultargs") SetParallelMode;
		%feature("autodoc", "
Parameters
----------
theNewMode: bool

Return
-------
None

Description
-----------
Sets the global parallel mode.
") SetParallelMode;
		static void SetParallelMode(const Standard_Boolean theNewMode);

		/****** BOPAlgo_Options::SetRunParallel ******/
		/****** md5 signature: bf7fbc3e9b126cd865579ef58026ce14 ******/
		%feature("compactdefaultargs") SetRunParallel;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
Set the flag of parallel processing if <theFlag> is true the parallel processing is switched on if <theFlag> is false the parallel processing is switched off.
") SetRunParallel;
		void SetRunParallel(const Standard_Boolean theFlag);

		/****** BOPAlgo_Options::SetUseOBB ******/
		/****** md5 signature: 6d40fa7ee94de6963b0a47968b0c2b35 ******/
		%feature("compactdefaultargs") SetUseOBB;
		%feature("autodoc", "
Parameters
----------
theUseOBB: bool

Return
-------
None

Description
-----------
Enables/Disables the usage of OBB.
") SetUseOBB;
		void SetUseOBB(const Standard_Boolean theUseOBB);

		/****** BOPAlgo_Options::UseOBB ******/
		/****** md5 signature: 439d685e26e7394528c125780fc412da ******/
		%feature("compactdefaultargs") UseOBB;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag defining usage of OBB.
") UseOBB;
		Standard_Boolean UseOBB();

};


%extend BOPAlgo_Options {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BOPAlgo_PISteps *
************************/
class BOPAlgo_PISteps {
	public:
		/****** BOPAlgo_PISteps::BOPAlgo_PISteps ******/
		/****** md5 signature: 678f847738ab187532af2fc55a728601 ******/
		%feature("compactdefaultargs") BOPAlgo_PISteps;
		%feature("autodoc", "
Parameters
----------
theNbOp: int

Return
-------
None

Description
-----------
Constructor.
") BOPAlgo_PISteps;
		 BOPAlgo_PISteps(const Standard_Integer theNbOp);

		/****** BOPAlgo_PISteps::ChangeSteps ******/
		/****** md5 signature: 6afaf1bdd0c07a7da0643b663ae7e1bf ******/
		%feature("compactdefaultargs") ChangeSteps;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns modifiable steps.
") ChangeSteps;
		TColStd_Array1OfReal & ChangeSteps();

		/****** BOPAlgo_PISteps::GetStep ******/
		/****** md5 signature: 085c03e320fb55492a498c74030ef52d ******/
		%feature("compactdefaultargs") GetStep;
		%feature("autodoc", "
Parameters
----------
theOperation: int

Return
-------
float

Description
-----------
Returns the step assigned to the operation.
") GetStep;
		Standard_Real GetStep(const Standard_Integer theOperation);

		/****** BOPAlgo_PISteps::SetStep ******/
		/****** md5 signature: 0ecefcccd3c3f72bac80ecf106cf7705 ******/
		%feature("compactdefaultargs") SetStep;
		%feature("autodoc", "
Parameters
----------
theOperation: int
theStep: float

Return
-------
None

Description
-----------
Assign the value theStep to theOperation.
") SetStep;
		void SetStep(const Standard_Integer theOperation, const Standard_Real theStep);

		/****** BOPAlgo_PISteps::Steps ******/
		/****** md5 signature: 5fc38fb11ebee5e2c132b891668077b8 ******/
		%feature("compactdefaultargs") Steps;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns the steps.
") Steps;
		const TColStd_Array1OfReal & Steps();

};


%extend BOPAlgo_PISteps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BOPAlgo_SectionAttribute *
*********************************/
class BOPAlgo_SectionAttribute {
	public:
		/****** BOPAlgo_SectionAttribute::BOPAlgo_SectionAttribute ******/
		/****** md5 signature: d009c63d3a8a919760589f1003ae4986 ******/
		%feature("compactdefaultargs") BOPAlgo_SectionAttribute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BOPAlgo_SectionAttribute;
		 BOPAlgo_SectionAttribute();

		/****** BOPAlgo_SectionAttribute::BOPAlgo_SectionAttribute ******/
		/****** md5 signature: 3d85e8151b6f1576f015e50486ffbe64 ******/
		%feature("compactdefaultargs") BOPAlgo_SectionAttribute;
		%feature("autodoc", "
Parameters
----------
theAproximation: bool
thePCurveOnS1: bool
thePCurveOnS2: bool

Return
-------
None

Description
-----------
Constructor.
") BOPAlgo_SectionAttribute;
		 BOPAlgo_SectionAttribute(const Standard_Boolean theAproximation, const Standard_Boolean thePCurveOnS1, const Standard_Boolean thePCurveOnS2);

		/****** BOPAlgo_SectionAttribute::Approximation ******/
		/****** md5 signature: 0dc0c40b42d72f7fa0d8967d76779a9f ******/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "
Parameters
----------
theApprox: bool

Return
-------
None

Description
-----------
Sets the Approximation flag.
") Approximation;
		void Approximation(const Standard_Boolean theApprox);

		/****** BOPAlgo_SectionAttribute::Approximation ******/
		/****** md5 signature: 56d3eec8cfa6eef2526f5faec043653f ******/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Approximation flag.
") Approximation;
		Standard_Boolean Approximation();

		/****** BOPAlgo_SectionAttribute::PCurveOnS1 ******/
		/****** md5 signature: ecc19b7110b044c15c461a8b82ccb0f6 ******/
		%feature("compactdefaultargs") PCurveOnS1;
		%feature("autodoc", "
Parameters
----------
thePCurveOnS1: bool

Return
-------
None

Description
-----------
Sets the PCurveOnS1 flag.
") PCurveOnS1;
		void PCurveOnS1(const Standard_Boolean thePCurveOnS1);

		/****** BOPAlgo_SectionAttribute::PCurveOnS1 ******/
		/****** md5 signature: 9a1e47121e59cd144b5b6675616ace9c ******/
		%feature("compactdefaultargs") PCurveOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the PCurveOnS1 flag.
") PCurveOnS1;
		Standard_Boolean PCurveOnS1();

		/****** BOPAlgo_SectionAttribute::PCurveOnS2 ******/
		/****** md5 signature: ff2501955a1d5673be11ed993fee2b79 ******/
		%feature("compactdefaultargs") PCurveOnS2;
		%feature("autodoc", "
Parameters
----------
thePCurveOnS2: bool

Return
-------
None

Description
-----------
Sets the PCurveOnS2 flag.
") PCurveOnS2;
		void PCurveOnS2(const Standard_Boolean thePCurveOnS2);

		/****** BOPAlgo_SectionAttribute::PCurveOnS2 ******/
		/****** md5 signature: 5b774e4d6136cf12a4b36814eaa92d44 ******/
		%feature("compactdefaultargs") PCurveOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the PCurveOnS2 flag.
") PCurveOnS2;
		Standard_Boolean PCurveOnS2();

};


%extend BOPAlgo_SectionAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class BOPAlgo_Tools *
**********************/
class BOPAlgo_Tools {
	public:
		/****** BOPAlgo_Tools::ClassifyFaces ******/
		/****** md5 signature: aecd30a1f788074add579e534de83f3d ******/
		%feature("compactdefaultargs") ClassifyFaces;
		%feature("autodoc", "
Parameters
----------
theFaces: TopTools_ListOfShape
theSolids: TopTools_ListOfShape
theRunParallel: bool
theContext: IntTools_Context
theInParts: TopTools_IndexedDataMapOfShapeListOfShape
theShapeBoxMap: TopTools_DataMapOfShapeBox (optional, default to TopTools_DataMapOfShapeBox())
theSolidsIF: TopTools_DataMapOfShapeListOfShape (optional, default to TopTools_DataMapOfShapeListOfShape())
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Classifies the faces <theFaces> relatively solids <theSolids>. The IN faces for solids are stored into output data map <theInParts>. //! The map <theSolidsIF> contains INTERNAL faces of the solids, to avoid their additional classification. //! Firstly, it checks the intersection of bounding boxes of the shapes. If the Box is not stored in the <theShapeBoxMap> map, it builds the box. If the bounding boxes of solid and face are interfering the classification is performed. //! It is assumed that all faces and solids are already intersected and do not have any geometrically coinciding parts without topological sharing of these parts.
") ClassifyFaces;
		static void ClassifyFaces(const TopTools_ListOfShape & theFaces, const TopTools_ListOfShape & theSolids, const Standard_Boolean theRunParallel, opencascade::handle<IntTools_Context> & theContext, TopTools_IndexedDataMapOfShapeListOfShape & theInParts, const TopTools_DataMapOfShapeBox & theShapeBoxMap = TopTools_DataMapOfShapeBox(), const TopTools_DataMapOfShapeListOfShape & theSolidsIF = TopTools_DataMapOfShapeListOfShape(), const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_Tools::ComputeToleranceOfCB ******/
		/****** md5 signature: e685c89cf11769ed8a1377be0947b846 ******/
		%feature("compactdefaultargs") ComputeToleranceOfCB;
		%feature("autodoc", "
Parameters
----------
theCB: BOPDS_CommonBlock
theDS: BOPDS_PDS
theContext: IntTools_Context

Return
-------
float

Description
-----------
No available documentation.
") ComputeToleranceOfCB;
		static Standard_Real ComputeToleranceOfCB(const opencascade::handle<BOPDS_CommonBlock> & theCB, const BOPDS_PDS theDS, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPAlgo_Tools::EdgesToWires ******/
		/****** md5 signature: e795d71da8d102674043cf89e2807135 ******/
		%feature("compactdefaultargs") EdgesToWires;
		%feature("autodoc", "
Parameters
----------
theEdges: TopoDS_Shape
theWires: TopoDS_Shape
theShared: bool (optional, default to Standard_False)
theAngTol: float (optional, default to 1e-8)

Return
-------
int

Description
-----------
Creates planar wires from the given edges. The input edges are expected to be planar. And for the performance sake the method does not check if the edges are really planar. Thus, the result wires will also be not planar if the input edges are not planar. The edges may be not shared, but the resulting wires will be sharing the coinciding parts and intersecting parts. The output wires may be non-manifold and contain free and multi-connected vertices. Parameters: <theEdges> - input edges; <theWires> - output wires; <theShared> - boolean flag which defines whether the input edges are already shared or have to be intersected; <theAngTol> - the angular tolerance which will be used for distinguishing the planes in which the edges are located. Default value is 1.e-8 which is used for intersection of planes in IntTools_FaceFace. Method returns the following error statuses: 0 - in case of success (at least one wire has been built); 1 - in case there are no edges in the given shape; 2 - sharing of the edges has failed.
") EdgesToWires;
		static Standard_Integer EdgesToWires(const TopoDS_Shape & theEdges, TopoDS_Shape & theWires, const Standard_Boolean theShared = Standard_False, const Standard_Real theAngTol = 1e-8);

		/****** BOPAlgo_Tools::FillInternals ******/
		/****** md5 signature: 114b79f8adcd1665a2acbeeb894b98bb ******/
		%feature("compactdefaultargs") FillInternals;
		%feature("autodoc", "
Parameters
----------
theSolids: TopTools_ListOfShape
theParts: TopTools_ListOfShape
theImages: TopTools_DataMapOfShapeListOfShape
theContext: IntTools_Context

Return
-------
None

Description
-----------
Classifies the given parts relatively the given solids and fills the solids with the parts classified as INTERNAL. //! 
Parameter theSolids - The solids to put internals to 
Parameter theParts - The parts to classify relatively solids 
Parameter theImages - Possible images of the parts that has to be classified 
Parameter theContext - cached geometrical tools to speed-up classifications.
") FillInternals;
		static void FillInternals(const TopTools_ListOfShape & theSolids, const TopTools_ListOfShape & theParts, const TopTools_DataMapOfShapeListOfShape & theImages, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPAlgo_Tools::IntersectVertices ******/
		/****** md5 signature: d4914d07780a11972f73f6bbf3116baa ******/
		%feature("compactdefaultargs") IntersectVertices;
		%feature("autodoc", "
Parameters
----------
theVertices: TopTools_IndexedDataMapOfShapeReal
theFuzzyValue: float
theChains: TopTools_ListOfListOfShape

Return
-------
None

Description
-----------
Finds chains of intersecting vertices.
") IntersectVertices;
		static void IntersectVertices(const TopTools_IndexedDataMapOfShapeReal & theVertices, const Standard_Real theFuzzyValue, TopTools_ListOfListOfShape & theChains);

		/****** BOPAlgo_Tools::PerformCommonBlocks ******/
		/****** md5 signature: 399b23698e9567012367f4351d1a8f04 ******/
		%feature("compactdefaultargs") PerformCommonBlocks;
		%feature("autodoc", "
Parameters
----------
theMBlocks: BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock
theAllocator: NCollection_BaseAllocator
theDS: BOPDS_PDS
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
None

Description
-----------
Create Common Blocks from the groups of pave blocks of <theMBlocks> connection map.
") PerformCommonBlocks;
		static void PerformCommonBlocks(BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock & theMBlocks, const opencascade::handle<NCollection_BaseAllocator> & theAllocator, BOPDS_PDS & theDS, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPAlgo_Tools::PerformCommonBlocks ******/
		/****** md5 signature: b795477e345159b0ed6f4ffbbc4c6f74 ******/
		%feature("compactdefaultargs") PerformCommonBlocks;
		%feature("autodoc", "
Parameters
----------
theMBlocks: BOPDS_IndexedDataMapOfPaveBlockListOfInteger
theAllocator: NCollection_BaseAllocator
pDS: BOPDS_PDS
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
None

Description
-----------
Create Common Blocks on faces using the PB->Faces connection map <theMBlocks>.
") PerformCommonBlocks;
		static void PerformCommonBlocks(const BOPDS_IndexedDataMapOfPaveBlockListOfInteger & theMBlocks, const opencascade::handle<NCollection_BaseAllocator> & theAllocator, BOPDS_PDS & pDS, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPAlgo_Tools::TrsfToPoint ******/
		/****** md5 signature: 836e5f67ee22544085d9d2fab2016425 ******/
		%feature("compactdefaultargs") TrsfToPoint;
		%feature("autodoc", "
Parameters
----------
theBox1: Bnd_Box
theBox2: Bnd_Box
theTrsf: gp_Trsf
thePoint: gp_Pnt (optional, default to gp_Pnt(0.0,0.0,0.0))
theCriteria: float (optional, default to 1e+5)

Return
-------
bool

Description
-----------
Computes the transformation needed to move the objects to the given point to increase the quality of computations. Returns true if the objects are located far from the given point (relatively given criteria), false otherwise. 
Parameter theBox1 the AABB of the first object 
Parameter theBox2 the AABB of the second object 
Parameter theTrsf the computed transformation 
Parameter thePoint the Point to compute transformation to 
Parameter theCriteria the Criteria to check whether thranformation is required.
") TrsfToPoint;
		static Standard_Boolean TrsfToPoint(const Bnd_Box & theBox1, const Bnd_Box & theBox2, gp_Trsf & theTrsf, const gp_Pnt & thePoint = gp_Pnt(0.0,0.0,0.0), const Standard_Real theCriteria = 1e+5);

		/****** BOPAlgo_Tools::WiresToFaces ******/
		/****** md5 signature: 16dc9996c77bddaa892446101a7cb4b5 ******/
		%feature("compactdefaultargs") WiresToFaces;
		%feature("autodoc", "
Parameters
----------
theWires: TopoDS_Shape
theFaces: TopoDS_Shape
theAngTol: float (optional, default to 1e-8)

Return
-------
bool

Description
-----------
Creates planar faces from given planar wires. The method does not check if the wires are really planar. The input wires may be non-manifold but should be shared. The wires located in the same planes and included into other wires will create holes in the faces built from outer wires. The tolerance values of the input shapes may be modified during the operation due to projection of the edges on the planes for creation of 2D curves. Parameters: <theWires> - the given wires; <theFaces> - the output faces; <theAngTol> - the angular tolerance for distinguishing the planes in which the wires are located. Default value is 1.e-8 which is used for intersection of planes in IntTools_FaceFace. Method returns True in case of success, i.e. at least one face has been built.
") WiresToFaces;
		static Standard_Boolean WiresToFaces(const TopoDS_Shape & theWires, TopoDS_Shape & theFaces, const Standard_Real theAngTol = 1e-8);

};


%extend BOPAlgo_Tools {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def MakeBlocks(self):
		pass

	@methodnotwrapped
	def FillMap(self):
		pass

	@methodnotwrapped
	def TreatCompound(self):
		pass
	}
};

/****************************
* class BOPAlgo_WireEdgeSet *
****************************/
class BOPAlgo_WireEdgeSet {
	public:
		/****** BOPAlgo_WireEdgeSet::BOPAlgo_WireEdgeSet ******/
		/****** md5 signature: ea26cbe6076f94b3b025b7fe930fa557 ******/
		%feature("compactdefaultargs") BOPAlgo_WireEdgeSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_WireEdgeSet;
		 BOPAlgo_WireEdgeSet();

		/****** BOPAlgo_WireEdgeSet::BOPAlgo_WireEdgeSet ******/
		/****** md5 signature: d5706b19a4e41f85b2410340b2a1f3b4 ******/
		%feature("compactdefaultargs") BOPAlgo_WireEdgeSet;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_WireEdgeSet;
		 BOPAlgo_WireEdgeSet(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPAlgo_WireEdgeSet::AddShape ******/
		/****** md5 signature: e2f1c05bc83d83e844b57971adeb089a ******/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "
Parameters
----------
sS: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddShape;
		void AddShape(const TopoDS_Shape & sS);

		/****** BOPAlgo_WireEdgeSet::AddStartElement ******/
		/****** md5 signature: c6623538c007f9731413da5cb7eb7f1b ******/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "
Parameters
----------
sS: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddStartElement;
		void AddStartElement(const TopoDS_Shape & sS);

		/****** BOPAlgo_WireEdgeSet::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** BOPAlgo_WireEdgeSet::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		const TopoDS_Face Face();

		/****** BOPAlgo_WireEdgeSet::SetFace ******/
		/****** md5 signature: b689a8f4d5c8b24783cd7ff1ee539b06 ******/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") SetFace;
		void SetFace(const TopoDS_Face & aF);

		/****** BOPAlgo_WireEdgeSet::Shapes ******/
		/****** md5 signature: bd11cb23d06c39c15707d62c9b6c054e ******/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Shapes;
		const TopTools_ListOfShape & Shapes();

		/****** BOPAlgo_WireEdgeSet::StartElements ******/
		/****** md5 signature: 4df71127781e1f235af21a1e6e23cfbe ******/
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") StartElements;
		const TopTools_ListOfShape & StartElements();

};


%extend BOPAlgo_WireEdgeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class BOPAlgo_Algo *
*********************/
%nodefaultctor BOPAlgo_Algo;
%ignore BOPAlgo_Algo::~BOPAlgo_Algo();
class BOPAlgo_Algo : public BOPAlgo_Options {
	public:
		/****** BOPAlgo_Algo::Perform ******/
		/****** md5 signature: 398f71859219956837273801c6ed1f07 ******/
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
The main method to implement the operation Providing the range allows to enable Progress indicator User break functionalities.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

};


%extend BOPAlgo_Algo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BOPAlgo_MakeConnected *
******************************/
class BOPAlgo_MakeConnected : public BOPAlgo_Options {
	public:
		/****** BOPAlgo_MakeConnected::BOPAlgo_MakeConnected ******/
		/****** md5 signature: b6b80e8925410141807a3d11286b03bf ******/
		%feature("compactdefaultargs") BOPAlgo_MakeConnected;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPAlgo_MakeConnected;
		 BOPAlgo_MakeConnected();

		/****** BOPAlgo_MakeConnected::AddArgument ******/
		/****** md5 signature: 11101b8c38f2080ebb6a92f924c1e316 ******/
		%feature("compactdefaultargs") AddArgument;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
None

Description
-----------
Adds the shape to the arguments. 
Input parameter: theS One of the argument shapes.
") AddArgument;
		void AddArgument(const TopoDS_Shape & theS);

		/****** BOPAlgo_MakeConnected::Arguments ******/
		/****** md5 signature: 5c44416d889811943ccde89673d3c270 ******/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of arguments of the operation.
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****** BOPAlgo_MakeConnected::Clear ******/
		/****** md5 signature: 75abd67f132413fc11c19201aabf1126 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the contents of the algorithm.
") Clear;
		void Clear();

		/****** BOPAlgo_MakeConnected::ClearRepetitions ******/
		/****** md5 signature: 1c0185ac8e9e0e24db025dcc70e76ee3 ******/
		%feature("compactdefaultargs") ClearRepetitions;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the repetitions performed on the periodic shape, keeping the shape periodic.
") ClearRepetitions;
		void ClearRepetitions();

		/****** BOPAlgo_MakeConnected::GetModified ******/
		/****** md5 signature: 67b726d6ad41609c9d81facb302563d9 ******/
		%feature("compactdefaultargs") GetModified;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes modified from the given shape. 
Input parameter: theS The shape for which the modified shapes are necessary.
") GetModified;
		const TopTools_ListOfShape & GetModified(const TopoDS_Shape & theS);

		/****** BOPAlgo_MakeConnected::GetOrigins ******/
		/****** md5 signature: 7db29e58de3213ff94b819ac6e61a362 ******/
		%feature("compactdefaultargs") GetOrigins;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of original shapes from which the current shape has been created. 
Input parameter: theS The shape for which the origins are necessary.
") GetOrigins;
		const TopTools_ListOfShape & GetOrigins(const TopoDS_Shape & theS);

		/****** BOPAlgo_MakeConnected::History ******/
		/****** md5 signature: 773151b712351341bc4cedd074c69f00 ******/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepTools_History>

Description
-----------
Returns the history of operations.
") History;
		const opencascade::handle<BRepTools_History> & History();

		/****** BOPAlgo_MakeConnected::MakePeriodic ******/
		/****** md5 signature: fa6a1689dfb3f4346cf8892a55e9eab9 ******/
		%feature("compactdefaultargs") MakePeriodic;
		%feature("autodoc", "
Parameters
----------
theParams: BOPAlgo_MakePeriodic::PeriodicityParams

Return
-------
None

Description
-----------
Makes the connected shape periodic. Repeated calls of this method overwrite the previous calls working with the basis connected shape. 
Input parameter: theParams Periodic options.
") MakePeriodic;
		void MakePeriodic(const BOPAlgo_MakePeriodic::PeriodicityParams & theParams);

		/****** BOPAlgo_MakeConnected::MaterialsOnNegativeSide ******/
		/****** md5 signature: 5f6193d727b8ebf6a2769408a4b22a5c ******/
		%feature("compactdefaultargs") MaterialsOnNegativeSide;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the original shapes which images contain the the given shape with REVERSED orientation. 
Input parameter: theS The shape for which the materials are necessary.
") MaterialsOnNegativeSide;
		const TopTools_ListOfShape & MaterialsOnNegativeSide(const TopoDS_Shape & theS);

		/****** BOPAlgo_MakeConnected::MaterialsOnPositiveSide ******/
		/****** md5 signature: 08f98025f671410be24c9e1ce19c2d94 ******/
		%feature("compactdefaultargs") MaterialsOnPositiveSide;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the original shapes which images contain the the given shape with FORWARD orientation. 
Input parameter: theS The shape for which the materials are necessary.
") MaterialsOnPositiveSide;
		const TopTools_ListOfShape & MaterialsOnPositiveSide(const TopoDS_Shape & theS);

		/****** BOPAlgo_MakeConnected::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs the operation, i.e. makes the input shapes connected.
") Perform;
		void Perform();

		/****** BOPAlgo_MakeConnected::PeriodicShape ******/
		/****** md5 signature: 0cadd972cbc9b05f82bfa5506c7cee42 ******/
		%feature("compactdefaultargs") PeriodicShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the resulting periodic & repeated shape.
") PeriodicShape;
		const TopoDS_Shape PeriodicShape();

		/****** BOPAlgo_MakeConnected::PeriodicityTool ******/
		/****** md5 signature: 73b35be00edb65bd2ce0a4bea38ba204 ******/
		%feature("compactdefaultargs") PeriodicityTool;
		%feature("autodoc", "Return
-------
BOPAlgo_MakePeriodic

Description
-----------
Returns the periodicity tool.
") PeriodicityTool;
		const BOPAlgo_MakePeriodic & PeriodicityTool();

		/****** BOPAlgo_MakeConnected::RepeatShape ******/
		/****** md5 signature: c36e05cb1b309b9ad4d6a379dec723ed ******/
		%feature("compactdefaultargs") RepeatShape;
		%feature("autodoc", "
Parameters
----------
theDirectionID: int
theTimes: int

Return
-------
None

Description
-----------
Performs repetition of the periodic shape in specified direction required number of times. 
Input parameter: theDirectionID The direction's ID (0 for X, 1 for Y, 2 for Z); 
Input parameter: theTimes Requested number of repetitions (sign of the value defines  the side of the repetition direction (positive or negative)).
") RepeatShape;
		void RepeatShape(const Standard_Integer theDirectionID, const Standard_Integer theTimes);

		/****** BOPAlgo_MakeConnected::SetArguments ******/
		/****** md5 signature: c11327ccf7873847aaf3c9f2c70f6eeb ******/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "
Parameters
----------
theArgs: TopTools_ListOfShape

Return
-------
None

Description
-----------
Sets the shape for making them connected. 
Input parameter: theArgs The arguments for the operation.
") SetArguments;
		void SetArguments(const TopTools_ListOfShape & theArgs);

		/****** BOPAlgo_MakeConnected::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the resulting connected shape.
") Shape;
		const TopoDS_Shape Shape();

};


%extend BOPAlgo_MakeConnected {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPAlgo_MakePeriodic *
*****************************/
class BOPAlgo_MakePeriodic : public BOPAlgo_Options {
	public:
		class PeriodicityParams {};
		/****** BOPAlgo_MakePeriodic::BOPAlgo_MakePeriodic ******/
		/****** md5 signature: 4d5c6c6476f6d1dac6cdff8dacf51577 ******/
		%feature("compactdefaultargs") BOPAlgo_MakePeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPAlgo_MakePeriodic;
		 BOPAlgo_MakePeriodic();

		/****** BOPAlgo_MakePeriodic::Clear ******/
		/****** md5 signature: 75abd67f132413fc11c19201aabf1126 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the algorithm from previous runs.
") Clear;
		void Clear();

		/****** BOPAlgo_MakePeriodic::ClearRepetitions ******/
		/****** md5 signature: edf6e1354024889c605c1f3c39cbe513 ******/
		%feature("compactdefaultargs") ClearRepetitions;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all performed repetitions. The next repetition will be performed on the base shape.
") ClearRepetitions;
		void ClearRepetitions();

		/****** BOPAlgo_MakePeriodic::GetTwins ******/
		/****** md5 signature: 7acec2f72b7c127c74cb7b8ac498de87 ******/
		%feature("compactdefaultargs") GetTwins;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the identical shapes for the given shape located on the opposite periodic side. Returns empty list in case the shape has no twin. //! 
Input parameter: theS Shape to get the twins for.
") GetTwins;
		const TopTools_ListOfShape & GetTwins(const TopoDS_Shape & theS);

		/****** BOPAlgo_MakePeriodic::History ******/
		/****** md5 signature: 773151b712351341bc4cedd074c69f00 ******/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepTools_History>

Description
-----------
Returns the History of the algorithm.
") History;
		const opencascade::handle<BRepTools_History> & History();

		/****** BOPAlgo_MakePeriodic::IsInputTrimmed ******/
		/****** md5 signature: 11de85435b7b5fa036606d9ce3973d08 ******/
		%feature("compactdefaultargs") IsInputTrimmed;
		%feature("autodoc", "
Parameters
----------
theDirectionID: int

Return
-------
bool

Description
-----------
Returns whether the input shape was trimmed in the specified direction. 
Input parameter: theDirectionID The direction's ID.
") IsInputTrimmed;
		Standard_Boolean IsInputTrimmed(const Standard_Integer theDirectionID);

		/****** BOPAlgo_MakePeriodic::IsInputXTrimmed ******/
		/****** md5 signature: 51fa4172f8e0eb40911b355e9680f28b ******/
		%feature("compactdefaultargs") IsInputXTrimmed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether the input shape was already trimmed for X period.
") IsInputXTrimmed;
		Standard_Boolean IsInputXTrimmed();

		/****** BOPAlgo_MakePeriodic::IsInputYTrimmed ******/
		/****** md5 signature: 60b80ff8725cbf223315f7aff8a660dc ******/
		%feature("compactdefaultargs") IsInputYTrimmed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether the input shape was already trimmed for Y period.
") IsInputYTrimmed;
		Standard_Boolean IsInputYTrimmed();

		/****** BOPAlgo_MakePeriodic::IsInputZTrimmed ******/
		/****** md5 signature: 1685b26b2863b1acec7025e907e61ef4 ******/
		%feature("compactdefaultargs") IsInputZTrimmed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether the input shape was already trimmed for Z period.
") IsInputZTrimmed;
		Standard_Boolean IsInputZTrimmed();

		/****** BOPAlgo_MakePeriodic::IsPeriodic ******/
		/****** md5 signature: bb8156b1e5d3c79256f3967acd61f561 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
theDirectionID: int

Return
-------
bool

Description
-----------
Returns the info about Periodicity of the shape in specified direction. 
Input parameter: theDirectionID The direction's ID.
") IsPeriodic;
		Standard_Boolean IsPeriodic(const Standard_Integer theDirectionID);

		/****** BOPAlgo_MakePeriodic::IsXPeriodic ******/
		/****** md5 signature: 825125bcd6f4a4228724ba85e488f68a ******/
		%feature("compactdefaultargs") IsXPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the info about periodicity of the shape in X direction.
") IsXPeriodic;
		Standard_Boolean IsXPeriodic();

		/****** BOPAlgo_MakePeriodic::IsYPeriodic ******/
		/****** md5 signature: bdf89adf6728f519216976b7f49a9c82 ******/
		%feature("compactdefaultargs") IsYPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the info about periodicity of the shape in Y direction.
") IsYPeriodic;
		Standard_Boolean IsYPeriodic();

		/****** BOPAlgo_MakePeriodic::IsZPeriodic ******/
		/****** md5 signature: 733ec7d6f8ce6b2035b30a926ed50f26 ******/
		%feature("compactdefaultargs") IsZPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the info about periodicity of the shape in Z direction.
") IsZPeriodic;
		Standard_Boolean IsZPeriodic();

		/****** BOPAlgo_MakePeriodic::MakePeriodic ******/
		/****** md5 signature: c4286c9a3e55c3953b69faa375b6e1b3 ******/
		%feature("compactdefaultargs") MakePeriodic;
		%feature("autodoc", "
Parameters
----------
theDirectionID: int
theIsPeriodic: bool
thePeriod: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Sets the flag to make the shape periodic in specified direction: - 0 - X direction; - 1 - Y direction; - 2 - Z direction. //! 
Input parameter: theDirectionID The direction's ID; 
Input parameter: theIsPeriodic Flag defining periodicity in given direction; 
Input parameter: thePeriod Required period in given direction.
") MakePeriodic;
		void MakePeriodic(const Standard_Integer theDirectionID, const Standard_Boolean theIsPeriodic, const Standard_Real thePeriod = 0.0);

		/****** BOPAlgo_MakePeriodic::MakeXPeriodic ******/
		/****** md5 signature: df3376e9d459c637fa867e10c13236ef ******/
		%feature("compactdefaultargs") MakeXPeriodic;
		%feature("autodoc", "
Parameters
----------
theIsPeriodic: bool
thePeriod: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Sets the flag to make the shape periodic in X direction. 
Input parameter: theIsPeriodic Flag defining periodicity in X direction; 
Input parameter: thePeriod Required period in X direction.
") MakeXPeriodic;
		void MakeXPeriodic(const Standard_Boolean theIsPeriodic, const Standard_Real thePeriod = 0.0);

		/****** BOPAlgo_MakePeriodic::MakeYPeriodic ******/
		/****** md5 signature: 8e8ca05d15522a37581c6613d7770566 ******/
		%feature("compactdefaultargs") MakeYPeriodic;
		%feature("autodoc", "
Parameters
----------
theIsPeriodic: bool
thePeriod: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Sets the flag to make the shape periodic in Y direction. 
Input parameter: theIsPeriodic Flag defining periodicity in Y direction; 
Input parameter: thePeriod Required period in Y direction.
") MakeYPeriodic;
		void MakeYPeriodic(const Standard_Boolean theIsPeriodic, const Standard_Real thePeriod = 0.0);

		/****** BOPAlgo_MakePeriodic::MakeZPeriodic ******/
		/****** md5 signature: 6c09987fe2927a09f6f4d0ae3f02d323 ******/
		%feature("compactdefaultargs") MakeZPeriodic;
		%feature("autodoc", "
Parameters
----------
theIsPeriodic: bool
thePeriod: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Sets the flag to make the shape periodic in Z direction. 
Input parameter: theIsPeriodic Flag defining periodicity in Z direction; 
Input parameter: thePeriod Required period in Z direction.
") MakeZPeriodic;
		void MakeZPeriodic(const Standard_Boolean theIsPeriodic, const Standard_Real thePeriod = 0.0);

		/****** BOPAlgo_MakePeriodic::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Makes the shape periodic in necessary directions.
") Perform;
		void Perform();

		/****** BOPAlgo_MakePeriodic::Period ******/
		/****** md5 signature: 905dfc700c6784284a2257479c7ec087 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
theDirectionID: int

Return
-------
float

Description
-----------
Returns the Period of the shape in specified direction. 
Input parameter: theDirectionID The direction's ID.
") Period;
		Standard_Real Period(const Standard_Integer theDirectionID);

		/****** BOPAlgo_MakePeriodic::PeriodFirst ******/
		/****** md5 signature: 65b281fb9f7dc9e2c35e5feaad2bfddf ******/
		%feature("compactdefaultargs") PeriodFirst;
		%feature("autodoc", "
Parameters
----------
theDirectionID: int

Return
-------
float

Description
-----------
Returns the first periodic parameter in the specified direction. 
Input parameter: theDirectionID The direction's ID.
") PeriodFirst;
		Standard_Real PeriodFirst(const Standard_Integer theDirectionID);

		/****** BOPAlgo_MakePeriodic::PeriodicityParameters ******/
		/****** md5 signature: 056ef0516517eb60320d576453827503 ******/
		%feature("compactdefaultargs") PeriodicityParameters;
		%feature("autodoc", "Return
-------
BOPAlgo_MakePeriodic::PeriodicityParams

Description
-----------
No available documentation.
") PeriodicityParameters;
		BOPAlgo_MakePeriodic::PeriodicityParams PeriodicityParameters();

		/****** BOPAlgo_MakePeriodic::RepeatShape ******/
		/****** md5 signature: 498d51ce623dcf5bdb9974585637d231 ******/
		%feature("compactdefaultargs") RepeatShape;
		%feature("autodoc", "
Parameters
----------
theDirectionID: int
theTimes: int

Return
-------
TopoDS_Shape

Description
-----------
Performs repetition of the shape in specified direction required number of times. Negative value of times means that the repetition should be perform in negative direction. Makes the repeated shape a base for following repetitions. //! 
Input parameter: theDirectionID The direction's ID; 
Input parameter: theTimes Requested number of repetitions.
") RepeatShape;
		const TopoDS_Shape RepeatShape(const Standard_Integer theDirectionID, const Standard_Integer theTimes);

		/****** BOPAlgo_MakePeriodic::RepeatedShape ******/
		/****** md5 signature: bc344bbb89766dbca655721d874cfcd6 ******/
		%feature("compactdefaultargs") RepeatedShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the repeated shape.
") RepeatedShape;
		const TopoDS_Shape RepeatedShape();

		/****** BOPAlgo_MakePeriodic::SetPeriodicityParameters ******/
		/****** md5 signature: 0952cf9752b01bf7cfc1d3d1baacf266 ******/
		%feature("compactdefaultargs") SetPeriodicityParameters;
		%feature("autodoc", "
Parameters
----------
theParams: PeriodicityParams

Return
-------
None

Description
-----------
Sets the periodicity parameters. 
Input parameter: theParams Periodicity parameters.
") SetPeriodicityParameters;
		void SetPeriodicityParameters(PeriodicityParams theParams);

		/****** BOPAlgo_MakePeriodic::SetShape ******/
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
Sets the shape to make it periodic. 
Input parameter: theShape The shape to make periodic.
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

		/****** BOPAlgo_MakePeriodic::SetTrimmed ******/
		/****** md5 signature: 36ad2721a8f03216522c13264ed2d5ec ******/
		%feature("compactdefaultargs") SetTrimmed;
		%feature("autodoc", "
Parameters
----------
theDirectionID: int
theIsTrimmed: bool
theFirst: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Defines whether the input shape is already trimmed in specified direction to fit the period in this direction. Direction is defined by an ID: - 0 - X direction; - 1 - Y direction; - 2 - Z direction. //! If the shape is not trimmed it is required to set the first parameter of the period in that direction. The algorithm will make the shape fit into the period. //! Before calling this method, the shape has to be set to be periodic in this direction. //! 
Input parameter: theDirectionID The direction's ID; 
Input parameter: theIsTrimmed The flag defining trimming of the shape in given direction; 
Input parameter: theFirst The first periodic parameter in the given direction.
") SetTrimmed;
		void SetTrimmed(const Standard_Integer theDirectionID, const Standard_Boolean theIsTrimmed, const Standard_Real theFirst = 0.0);

		/****** BOPAlgo_MakePeriodic::SetXTrimmed ******/
		/****** md5 signature: 81bbfd4b7a5f26b85a82d52dc5af0149 ******/
		%feature("compactdefaultargs") SetXTrimmed;
		%feature("autodoc", "
Parameters
----------
theIsTrimmed: bool
theFirst: bool (optional, default to 0.0)

Return
-------
None

Description
-----------
Defines whether the input shape is already trimmed in X direction to fit the X period. If the shape is not trimmed it is required to set the first parameter for the X period. The algorithm will make the shape fit into the period. //! Before calling this method, the shape has to be set to be periodic in this direction. //! 
Input parameter: theIsTrimmed Flag defining whether the shape is already trimmed  in X direction to fit the X period; 
Input parameter: theFirst The first X periodic parameter.
") SetXTrimmed;
		void SetXTrimmed(const Standard_Boolean theIsTrimmed, const Standard_Boolean theFirst = 0.0);

		/****** BOPAlgo_MakePeriodic::SetYTrimmed ******/
		/****** md5 signature: 93fc3f210273049407ff8a8e1e7c3166 ******/
		%feature("compactdefaultargs") SetYTrimmed;
		%feature("autodoc", "
Parameters
----------
theIsTrimmed: bool
theFirst: bool (optional, default to 0.0)

Return
-------
None

Description
-----------
Defines whether the input shape is already trimmed in Y direction to fit the Y period. If the shape is not trimmed it is required to set the first parameter for the Y period. The algorithm will make the shape fit into the period. //! Before calling this method, the shape has to be set to be periodic in this direction. //! 
Input parameter: theIsTrimmed Flag defining whether the shape is already trimmed  in Y direction to fit the Y period; 
Input parameter: theFirst The first Y periodic parameter.
") SetYTrimmed;
		void SetYTrimmed(const Standard_Boolean theIsTrimmed, const Standard_Boolean theFirst = 0.0);

		/****** BOPAlgo_MakePeriodic::SetZTrimmed ******/
		/****** md5 signature: 45d195d98801cadb6112962160157fe8 ******/
		%feature("compactdefaultargs") SetZTrimmed;
		%feature("autodoc", "
Parameters
----------
theIsTrimmed: bool
theFirst: bool (optional, default to 0.0)

Return
-------
None

Description
-----------
Defines whether the input shape is already trimmed in Z direction to fit the Z period. If the shape is not trimmed it is required to set the first parameter for the Z period. The algorithm will make the shape fit into the period. //! Before calling this method, the shape has to be set to be periodic in this direction. //! 
Input parameter: theIsTrimmed Flag defining whether the shape is already trimmed  in Z direction to fit the Z period; 
Input parameter: theFirst The first Z periodic parameter.
") SetZTrimmed;
		void SetZTrimmed(const Standard_Boolean theIsTrimmed, const Standard_Boolean theFirst = 0.0);

		/****** BOPAlgo_MakePeriodic::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the resulting periodic shape.
") Shape;
		const TopoDS_Shape Shape();

		/****** BOPAlgo_MakePeriodic::ToDirectionID ******/
		/****** md5 signature: 93eb37961bf75f72a1ed4293ff2f6860 ******/
		%feature("compactdefaultargs") ToDirectionID;
		%feature("autodoc", "
Parameters
----------
theDirectionID: int

Return
-------
int

Description
-----------
Converts the integer to ID of periodic direction.
") ToDirectionID;
		static Standard_Integer ToDirectionID(const Standard_Integer theDirectionID);

		/****** BOPAlgo_MakePeriodic::XPeriod ******/
		/****** md5 signature: 6dd89ec7e807f05a40688e7c6a838896 ******/
		%feature("compactdefaultargs") XPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the XPeriod of the shape.
") XPeriod;
		Standard_Real XPeriod();

		/****** BOPAlgo_MakePeriodic::XPeriodFirst ******/
		/****** md5 signature: a02688bedcf5f9cc9871b6ab26e1dbae ******/
		%feature("compactdefaultargs") XPeriodFirst;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the first parameter for the X period.
") XPeriodFirst;
		Standard_Real XPeriodFirst();

		/****** BOPAlgo_MakePeriodic::XRepeat ******/
		/****** md5 signature: 703940b883cbd562fdffcc37a48373f9 ******/
		%feature("compactdefaultargs") XRepeat;
		%feature("autodoc", "
Parameters
----------
theTimes: int

Return
-------
TopoDS_Shape

Description
-----------
Repeats the shape in X direction specified number of times. Negative value of times means that the repetition should be perform in negative X direction. Makes the repeated shape a base for following repetitions. //! 
Input parameter: theTimes Requested number of repetitions.
") XRepeat;
		const TopoDS_Shape XRepeat(const Standard_Integer theTimes);

		/****** BOPAlgo_MakePeriodic::YPeriod ******/
		/****** md5 signature: 52af3073f75d0fcc2884913777c9c0c1 ******/
		%feature("compactdefaultargs") YPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the YPeriod of the shape.
") YPeriod;
		Standard_Real YPeriod();

		/****** BOPAlgo_MakePeriodic::YPeriodFirst ******/
		/****** md5 signature: 793e8a60b882882c47265a4c35326e0e ******/
		%feature("compactdefaultargs") YPeriodFirst;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the first parameter for the Y period.
") YPeriodFirst;
		Standard_Real YPeriodFirst();

		/****** BOPAlgo_MakePeriodic::YRepeat ******/
		/****** md5 signature: ad506731f1c56bec1f509d4f39f93df1 ******/
		%feature("compactdefaultargs") YRepeat;
		%feature("autodoc", "
Parameters
----------
theTimes: int

Return
-------
TopoDS_Shape

Description
-----------
Repeats the shape in Y direction specified number of times. Negative value of times means that the repetition should be perform in negative Y direction. Makes the repeated shape a base for following repetitions. //! 
Input parameter: theTimes Requested number of repetitions.
") YRepeat;
		const TopoDS_Shape YRepeat(const Standard_Integer theTimes);

		/****** BOPAlgo_MakePeriodic::ZPeriod ******/
		/****** md5 signature: ea552fd4bc539be2e22f25f495cc2938 ******/
		%feature("compactdefaultargs") ZPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the ZPeriod of the shape.
") ZPeriod;
		Standard_Real ZPeriod();

		/****** BOPAlgo_MakePeriodic::ZPeriodFirst ******/
		/****** md5 signature: 75ea8dea98ac01ca4dd73841cb16f368 ******/
		%feature("compactdefaultargs") ZPeriodFirst;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the first parameter for the Z period.
") ZPeriodFirst;
		Standard_Real ZPeriodFirst();

		/****** BOPAlgo_MakePeriodic::ZRepeat ******/
		/****** md5 signature: 1b9e96904de0881a1a4d7b9b6fd78839 ******/
		%feature("compactdefaultargs") ZRepeat;
		%feature("autodoc", "
Parameters
----------
theTimes: int

Return
-------
TopoDS_Shape

Description
-----------
Repeats the shape in Z direction specified number of times. Negative value of times means that the repetition should be perform in negative Z direction. Makes the repeated shape a base for following repetitions. //! 
Input parameter: theTimes Requested number of repetitions.
") ZRepeat;
		const TopoDS_Shape ZRepeat(const Standard_Integer theTimes);

};


%extend BOPAlgo_MakePeriodic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BOPAlgo_ArgumentAnalyzer *
*********************************/
class BOPAlgo_ArgumentAnalyzer : public BOPAlgo_Algo {
	public:
		/****** BOPAlgo_ArgumentAnalyzer::BOPAlgo_ArgumentAnalyzer ******/
		/****** md5 signature: 9f14477a10a2e7722471042579c763b6 ******/
		%feature("compactdefaultargs") BOPAlgo_ArgumentAnalyzer;
		%feature("autodoc", "Return
-------
None

Description
-----------
empty constructor.
") BOPAlgo_ArgumentAnalyzer;
		 BOPAlgo_ArgumentAnalyzer();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetArgumentTypeMode() {
            return (Standard_Boolean) $self->ArgumentTypeMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetArgumentTypeMode(Standard_Boolean value) {
            $self->ArgumentTypeMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetContinuityMode() {
            return (Standard_Boolean) $self->ContinuityMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetContinuityMode(Standard_Boolean value) {
            $self->ContinuityMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetCurveOnSurfaceMode() {
            return (Standard_Boolean) $self->CurveOnSurfaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetCurveOnSurfaceMode(Standard_Boolean value) {
            $self->CurveOnSurfaceMode()=value;
            }
        };
		/****** BOPAlgo_ArgumentAnalyzer::GetCheckResult ******/
		/****** md5 signature: ab448040cd97688d236e23189cee34b9 ******/
		%feature("compactdefaultargs") GetCheckResult;
		%feature("autodoc", "Return
-------
BOPAlgo_ListOfCheckResult

Description
-----------
returns a result of test.
") GetCheckResult;
		const BOPAlgo_ListOfCheckResult & GetCheckResult();

		/****** BOPAlgo_ArgumentAnalyzer::GetShape1 ******/
		/****** md5 signature: da65271fea68f494586b07012e23b4bb ******/
		%feature("compactdefaultargs") GetShape1;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns object shape;.
") GetShape1;
		const TopoDS_Shape GetShape1();

		/****** BOPAlgo_ArgumentAnalyzer::GetShape2 ******/
		/****** md5 signature: ad646522ebe6de8820d9424e4f21edb9 ******/
		%feature("compactdefaultargs") GetShape2;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns tool shape.
") GetShape2;
		const TopoDS_Shape GetShape2();

		/****** BOPAlgo_ArgumentAnalyzer::HasFaulty ******/
		/****** md5 signature: 4e2d963ca1680b1be6c5917993c51870 ******/
		%feature("compactdefaultargs") HasFaulty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
result of test.
") HasFaulty;
		Standard_Boolean HasFaulty();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetMergeEdgeMode() {
            return (Standard_Boolean) $self->MergeEdgeMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetMergeEdgeMode(Standard_Boolean value) {
            $self->MergeEdgeMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetMergeVertexMode() {
            return (Standard_Boolean) $self->MergeVertexMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetMergeVertexMode(Standard_Boolean value) {
            $self->MergeVertexMode()=value;
            }
        };
		/****** BOPAlgo_ArgumentAnalyzer::OperationType ******/
		/****** md5 signature: 738397fdac6453814ea85c4462f40440 ******/
		%feature("compactdefaultargs") OperationType;
		%feature("autodoc", "Return
-------
BOPAlgo_Operation

Description
-----------
returns ref.
") OperationType;
		BOPAlgo_Operation  OperationType();

		/****** BOPAlgo_ArgumentAnalyzer::Perform ******/
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
performs analysis.
") Perform;
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetRebuildFaceMode() {
            return (Standard_Boolean) $self->RebuildFaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetRebuildFaceMode(Standard_Boolean value) {
            $self->RebuildFaceMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetSelfInterMode() {
            return (Standard_Boolean) $self->SelfInterMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetSelfInterMode(Standard_Boolean value) {
            $self->SelfInterMode()=value;
            }
        };
		/****** BOPAlgo_ArgumentAnalyzer::SetShape1 ******/
		/****** md5 signature: 32d06bb8d221a179d322a30597a4d6c8 ******/
		%feature("compactdefaultargs") SetShape1;
		%feature("autodoc", "
Parameters
----------
TheShape: TopoDS_Shape

Return
-------
None

Description
-----------
sets object shape.
") SetShape1;
		void SetShape1(const TopoDS_Shape & TheShape);

		/****** BOPAlgo_ArgumentAnalyzer::SetShape2 ******/
		/****** md5 signature: 872074f224a41d220ff8f15ed451c9ac ******/
		%feature("compactdefaultargs") SetShape2;
		%feature("autodoc", "
Parameters
----------
TheShape: TopoDS_Shape

Return
-------
None

Description
-----------
sets tool shape.
") SetShape2;
		void SetShape2(const TopoDS_Shape & TheShape);


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetSmallEdgeMode() {
            return (Standard_Boolean) $self->SmallEdgeMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetSmallEdgeMode(Standard_Boolean value) {
            $self->SmallEdgeMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetStopOnFirstFaulty() {
            return (Standard_Boolean) $self->StopOnFirstFaulty();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetStopOnFirstFaulty(Standard_Boolean value) {
            $self->StopOnFirstFaulty()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetTangentMode() {
            return (Standard_Boolean) $self->TangentMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetTangentMode(Standard_Boolean value) {
            $self->TangentMode()=value;
            }
        };
};


%extend BOPAlgo_ArgumentAnalyzer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BOPAlgo_BuilderArea *
****************************/
%nodefaultctor BOPAlgo_BuilderArea;
%ignore BOPAlgo_BuilderArea::~BOPAlgo_BuilderArea();
class BOPAlgo_BuilderArea : public BOPAlgo_Algo {
	public:
		/****** BOPAlgo_BuilderArea::Areas ******/
		/****** md5 signature: 25d90180c64c3e47d9200443b7a9d0e2 ******/
		%feature("compactdefaultargs") Areas;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the found areas.
") Areas;
		const TopTools_ListOfShape & Areas();

		/****** BOPAlgo_BuilderArea::IsAvoidInternalShapes ******/
		/****** md5 signature: 8a7b9501581d682ae84b1516b6d067be ******/
		%feature("compactdefaultargs") IsAvoidInternalShapes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the AvoidInternalShapes flag.
") IsAvoidInternalShapes;
		Standard_Boolean IsAvoidInternalShapes();

		/****** BOPAlgo_BuilderArea::Loops ******/
		/****** md5 signature: 28c8d70c5f0b2679616b2e020052a004 ******/
		%feature("compactdefaultargs") Loops;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the found loops.
") Loops;
		const TopTools_ListOfShape & Loops();

		/****** BOPAlgo_BuilderArea::SetAvoidInternalShapes ******/
		/****** md5 signature: d4ee80659b0195413556579790baf956 ******/
		%feature("compactdefaultargs") SetAvoidInternalShapes;
		%feature("autodoc", "
Parameters
----------
theAvoidInternal: bool

Return
-------
None

Description
-----------
Defines the preventing of addition of internal parts into result. The default value is False, i.e. the internal parts are added into result.
") SetAvoidInternalShapes;
		void SetAvoidInternalShapes(const Standard_Boolean theAvoidInternal);

		/****** BOPAlgo_BuilderArea::SetContext ******/
		/****** md5 signature: 45a35eea8f4e3016f544e19c60ac3b92 ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
theContext: IntTools_Context

Return
-------
None

Description
-----------
Sets the context for the algorithms.
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPAlgo_BuilderArea::SetShapes ******/
		/****** md5 signature: 7e1ffc178f673e4a1bd556c32957daf6 ******/
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", "
Parameters
----------
theLS: TopTools_ListOfShape

Return
-------
None

Description
-----------
Sets the shapes for building areas.
") SetShapes;
		void SetShapes(const TopTools_ListOfShape & theLS);

		/****** BOPAlgo_BuilderArea::Shapes ******/
		/****** md5 signature: 2884193c58152e0cda5e99b2900fdc8e ******/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the input shapes.
") Shapes;
		const TopTools_ListOfShape & Shapes();

};


%extend BOPAlgo_BuilderArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPAlgo_BuilderShape *
*****************************/
%nodefaultctor BOPAlgo_BuilderShape;
class BOPAlgo_BuilderShape : public BOPAlgo_Algo {
	public:
		/****** BOPAlgo_BuilderShape::Generated ******/
		/****** md5 signature: 7ef86753d8f2afb4fbf4e1d513ada706 ******/
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
Returns the list of shapes Generated from the shape theS.
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & theS);

		/****** BOPAlgo_BuilderShape::HasDeleted ******/
		/****** md5 signature: d1376e4451370e5ff6d8e8d03d766bcb ******/
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has been deleted during operation.
") HasDeleted;
		Standard_Boolean HasDeleted();

		/****** BOPAlgo_BuilderShape::HasGenerated ******/
		/****** md5 signature: ff1185ae4caf1307e4399403e704df0a ******/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has generated shapes during operation.
") HasGenerated;
		Standard_Boolean HasGenerated();

		/****** BOPAlgo_BuilderShape::HasHistory ******/
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

		/****** BOPAlgo_BuilderShape::HasModified ******/
		/****** md5 signature: 5aa09ad744ac71dd47a6ec381a33bc9b ******/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has been modified during operation.
") HasModified;
		Standard_Boolean HasModified();

		/****** BOPAlgo_BuilderShape::History ******/
		/****** md5 signature: 1926fba5b3ef6c8825eef7dc63e4c382 ******/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepTools_History>

Description
-----------
History Tool.
") History;
		opencascade::handle<BRepTools_History> History();

		/****** BOPAlgo_BuilderShape::IsDeleted ******/
		/****** md5 signature: c9a78c4cfde40b7040a0809bf3392d0a ******/
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
Returns true if the shape theS has been deleted. In this case the shape will have no Modified elements, but can have Generated elements.
") IsDeleted;
		Standard_Boolean IsDeleted(const TopoDS_Shape & theS);

		/****** BOPAlgo_BuilderShape::Modified ******/
		/****** md5 signature: 3627cf8d69b07cd5db7ba10195303d15 ******/
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
Returns the list of shapes Modified from the shape theS.
") Modified;
		const TopTools_ListOfShape & Modified(const TopoDS_Shape & theS);

		/****** BOPAlgo_BuilderShape::SetToFillHistory ******/
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

		/****** BOPAlgo_BuilderShape::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the result of algorithm.
") Shape;
		const TopoDS_Shape Shape();

};


%extend BOPAlgo_BuilderShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPAlgo_ParallelAlgo *
*****************************/
%nodefaultctor BOPAlgo_ParallelAlgo;
class BOPAlgo_ParallelAlgo : public BOPAlgo_Algo {
	public:
		/****** BOPAlgo_ParallelAlgo::SetProgressRange ******/
		/****** md5 signature: e46fe49a703ffe9531bdc8614884d302 ******/
		%feature("compactdefaultargs") SetProgressRange;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange

Return
-------
None

Description
-----------
Sets the range for a single run.
") SetProgressRange;
		void SetProgressRange(const Message_ProgressRange & theRange);

};


%extend BOPAlgo_ParallelAlgo {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Perform(self):
		pass
	}
};

/***************************
* class BOPAlgo_PaveFiller *
***************************/
class BOPAlgo_PaveFiller : public BOPAlgo_Algo {
	public:
		class EdgeRangeDistance {};
		/****** BOPAlgo_PaveFiller::BOPAlgo_PaveFiller ******/
		/****** md5 signature: 695e98dd6d964c29b51abadeedf2b1c7 ******/
		%feature("compactdefaultargs") BOPAlgo_PaveFiller;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_PaveFiller;
		 BOPAlgo_PaveFiller();

		/****** BOPAlgo_PaveFiller::BOPAlgo_PaveFiller ******/
		/****** md5 signature: 44433ddc985c762a918888031b5c5257 ******/
		%feature("compactdefaultargs") BOPAlgo_PaveFiller;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_PaveFiller;
		 BOPAlgo_PaveFiller(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPAlgo_PaveFiller::AddArgument ******/
		/****** md5 signature: 0ff8514ebea7960acbeb6ec826621ca9 ******/
		%feature("compactdefaultargs") AddArgument;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Adds the argument for operation.
") AddArgument;
		void AddArgument(const TopoDS_Shape & theShape);

		/****** BOPAlgo_PaveFiller::Arguments ******/
		/****** md5 signature: 5c44416d889811943ccde89673d3c270 ******/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of arguments.
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****** BOPAlgo_PaveFiller::Context ******/
		/****** md5 signature: 61a08d8ec3c36cb7537272ccd635f363 ******/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return
-------
opencascade::handle<IntTools_Context>

Description
-----------
No available documentation.
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****** BOPAlgo_PaveFiller::DS ******/
		/****** md5 signature: 87987374a37a857a957303627823fdb1 ******/
		%feature("compactdefaultargs") DS;
		%feature("autodoc", "Return
-------
BOPDS_DS

Description
-----------
No available documentation.
") DS;
		const BOPDS_DS & DS();

		/****** BOPAlgo_PaveFiller::Glue ******/
		/****** md5 signature: 19ce0746754d61539c274454d7b6b9dd ******/
		%feature("compactdefaultargs") Glue;
		%feature("autodoc", "Return
-------
BOPAlgo_GlueEnum

Description
-----------
Returns the glue option of the algorithm.
") Glue;
		BOPAlgo_GlueEnum Glue();

		/****** BOPAlgo_PaveFiller::IsAvoidBuildPCurve ******/
		/****** md5 signature: 99defd1abf1a714ec45f36a73ab8e479 ******/
		%feature("compactdefaultargs") IsAvoidBuildPCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag to avoid building of p-curves of edges on faces.
") IsAvoidBuildPCurve;
		Standard_Boolean IsAvoidBuildPCurve();

		/****** BOPAlgo_PaveFiller::NonDestructive ******/
		/****** md5 signature: a86af6798e7fda924d6a75c2fa9ebb4e ******/
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated.
") NonDestructive;
		Standard_Boolean NonDestructive();

		/****** BOPAlgo_PaveFiller::PDS ******/
		/****** md5 signature: 420dd37c2c265b3b9f0a2eefd4b48c5a ******/
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "Return
-------
BOPDS_PDS

Description
-----------
No available documentation.
") PDS;
		BOPDS_PDS PDS();

		/****** BOPAlgo_PaveFiller::Perform ******/
		/****** md5 signature: 0c284a2ff880da6562c1121fb4e216b7 ******/
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
No available documentation.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_PaveFiller::SetArguments ******/
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
Sets the arguments for operation.
") SetArguments;
		void SetArguments(const TopTools_ListOfShape & theLS);

		/****** BOPAlgo_PaveFiller::SetAvoidBuildPCurve ******/
		/****** md5 signature: c3a78bac52d326c32b1cabef045578ae ******/
		%feature("compactdefaultargs") SetAvoidBuildPCurve;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Sets the flag to avoid building of p-curves of edges on faces.
") SetAvoidBuildPCurve;
		void SetAvoidBuildPCurve(const Standard_Boolean theValue);

		/****** BOPAlgo_PaveFiller::SetGlue ******/
		/****** md5 signature: 772d2dee7d8b078f8e12daf13dc476d6 ******/
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
Sets the glue option for the algorithm.
") SetGlue;
		void SetGlue(const BOPAlgo_GlueEnum theGlue);

		/****** BOPAlgo_PaveFiller::SetNonDestructive ******/
		/****** md5 signature: a1a916959b0fbc23c0d8bd3935bb1670 ******/
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

		/****** BOPAlgo_PaveFiller::SetSectionAttribute ******/
		/****** md5 signature: 2e1a6df4e17fe92b14ed2db288f2bebf ******/
		%feature("compactdefaultargs") SetSectionAttribute;
		%feature("autodoc", "
Parameters
----------
theSecAttr: BOPAlgo_SectionAttribute

Return
-------
None

Description
-----------
No available documentation.
") SetSectionAttribute;
		void SetSectionAttribute(const BOPAlgo_SectionAttribute & theSecAttr);

};


%extend BOPAlgo_PaveFiller {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Iterator(self):
		pass
	}
};

/******************************
* class BOPAlgo_ShellSplitter *
******************************/
class BOPAlgo_ShellSplitter : public BOPAlgo_Algo {
	public:
		/****** BOPAlgo_ShellSplitter::BOPAlgo_ShellSplitter ******/
		/****** md5 signature: 1a413937e5bc85276cd970f7bd17f0e2 ******/
		%feature("compactdefaultargs") BOPAlgo_ShellSplitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
empty constructor.
") BOPAlgo_ShellSplitter;
		 BOPAlgo_ShellSplitter();

		/****** BOPAlgo_ShellSplitter::BOPAlgo_ShellSplitter ******/
		/****** md5 signature: e293806183c127a6994ca543539a4ca7 ******/
		%feature("compactdefaultargs") BOPAlgo_ShellSplitter;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
constructor.
") BOPAlgo_ShellSplitter;
		 BOPAlgo_ShellSplitter(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPAlgo_ShellSplitter::AddStartElement ******/
		/****** md5 signature: 1f9a6cd0dc44399d66b6c1516e84d023 ******/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
None

Description
-----------
adds a face <theS> to process.
") AddStartElement;
		void AddStartElement(const TopoDS_Shape & theS);

		/****** BOPAlgo_ShellSplitter::Perform ******/
		/****** md5 signature: 0c284a2ff880da6562c1121fb4e216b7 ******/
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
performs the algorithm.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_ShellSplitter::Shells ******/
		/****** md5 signature: 253534f051afc8c1348ee153669d53c1 ******/
		%feature("compactdefaultargs") Shells;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
returns the loops.
") Shells;
		const TopTools_ListOfShape & Shells();

		/****** BOPAlgo_ShellSplitter::SplitBlock ******/
		/****** md5 signature: b4a3a42e521935db4e11e49c5e4189a8 ******/
		%feature("compactdefaultargs") SplitBlock;
		%feature("autodoc", "
Parameters
----------
theCB: BOPTools_ConnexityBlock

Return
-------
None

Description
-----------
No available documentation.
") SplitBlock;
		static void SplitBlock(BOPTools_ConnexityBlock & theCB);

		/****** BOPAlgo_ShellSplitter::StartElements ******/
		/****** md5 signature: 4df71127781e1f235af21a1e6e23cfbe ******/
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
return the faces to process.
") StartElements;
		const TopTools_ListOfShape & StartElements();

};


%extend BOPAlgo_ShellSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPAlgo_WireSplitter *
*****************************/
class BOPAlgo_WireSplitter : public BOPAlgo_Algo {
	public:
		/****** BOPAlgo_WireSplitter::BOPAlgo_WireSplitter ******/
		/****** md5 signature: 94705b115e84b6538c1dd87e9bd7d242 ******/
		%feature("compactdefaultargs") BOPAlgo_WireSplitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_WireSplitter;
		 BOPAlgo_WireSplitter();

		/****** BOPAlgo_WireSplitter::BOPAlgo_WireSplitter ******/
		/****** md5 signature: 7507f32d0dff651fc083ad87f3b26067 ******/
		%feature("compactdefaultargs") BOPAlgo_WireSplitter;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_WireSplitter;
		 BOPAlgo_WireSplitter(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPAlgo_WireSplitter::Context ******/
		/****** md5 signature: 61a08d8ec3c36cb7537272ccd635f363 ******/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return
-------
opencascade::handle<IntTools_Context>

Description
-----------
Returns the context.
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****** BOPAlgo_WireSplitter::MakeWire ******/
		/****** md5 signature: 1f818413cf336ccce6872fc306458e7d ******/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "
Parameters
----------
theLE: TopTools_ListOfShape
theW: TopoDS_Wire

Return
-------
None

Description
-----------
No available documentation.
") MakeWire;
		static void MakeWire(TopTools_ListOfShape & theLE, TopoDS_Wire & theW);

		/****** BOPAlgo_WireSplitter::Perform ******/
		/****** md5 signature: 0c284a2ff880da6562c1121fb4e216b7 ******/
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
No available documentation.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_WireSplitter::SetContext ******/
		/****** md5 signature: e78608a6b667b26dfbb5221975ad17a2 ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
theContext: IntTools_Context

Return
-------
None

Description
-----------
Sets the context for the algorithm.
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPAlgo_WireSplitter::SetWES ******/
		/****** md5 signature: 8b89b7efde21e917d2d2fc92a5fcb271 ******/
		%feature("compactdefaultargs") SetWES;
		%feature("autodoc", "
Parameters
----------
theWES: BOPAlgo_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") SetWES;
		void SetWES(const BOPAlgo_WireEdgeSet & theWES);

		/****** BOPAlgo_WireSplitter::SplitBlock ******/
		/****** md5 signature: de0aea84749b1e20f54d75f31ecf8114 ******/
		%feature("compactdefaultargs") SplitBlock;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theCB: BOPTools_ConnexityBlock
theContext: IntTools_Context

Return
-------
None

Description
-----------
No available documentation.
") SplitBlock;
		static void SplitBlock(const TopoDS_Face & theF, BOPTools_ConnexityBlock & theCB, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPAlgo_WireSplitter::WES ******/
		/****** md5 signature: 58e5fd1cf4257111802b170e6fd95635 ******/
		%feature("compactdefaultargs") WES;
		%feature("autodoc", "Return
-------
BOPAlgo_WireEdgeSet

Description
-----------
No available documentation.
") WES;
		BOPAlgo_WireEdgeSet & WES();

};


%extend BOPAlgo_WireSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BOPAlgo_Builder *
************************/
class BOPAlgo_Builder : public BOPAlgo_BuilderShape {
	public:
		class NbShapes {};
		/****** BOPAlgo_Builder::BOPAlgo_Builder ******/
		/****** md5 signature: 1f86d9941e9ea86a4622ff7ec326d7fc ******/
		%feature("compactdefaultargs") BOPAlgo_Builder;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPAlgo_Builder;
		 BOPAlgo_Builder();

		/****** BOPAlgo_Builder::BOPAlgo_Builder ******/
		/****** md5 signature: f3353a4fea36ad4c50e43eda587bd535 ******/
		%feature("compactdefaultargs") BOPAlgo_Builder;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_Builder;
		 BOPAlgo_Builder(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPAlgo_Builder::AddArgument ******/
		/****** md5 signature: 60c2b0316a67e93c3535a28f84d56231 ******/
		%feature("compactdefaultargs") AddArgument;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Adds the argument to the operation.
") AddArgument;
		virtual void AddArgument(const TopoDS_Shape & theShape);

		/****** BOPAlgo_Builder::Arguments ******/
		/****** md5 signature: 5c44416d889811943ccde89673d3c270 ******/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of arguments.
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****** BOPAlgo_Builder::BuildBOP ******/
		/****** md5 signature: 2e1b9ea27d66f788b2416af1e795c40a ******/
		%feature("compactdefaultargs") BuildBOP;
		%feature("autodoc", "
Parameters
----------
theObjects: TopTools_ListOfShape
theObjState: TopAbs_State
theTools: TopTools_ListOfShape
theToolsState: TopAbs_State
theRange: Message_ProgressRange
theReport: Message_Report (optional, default to NULL)

Return
-------
None

Description
-----------
Builds the result shape according to the given states for the objects and tools. These states can be unambiguously converted into the Boolean operation type. Thus, it performs the Boolean operation on the given groups of shapes. //! The result is built basing on the result of Builder operation (GF or any other). The only condition for the Builder is that the splits of faces should be created and classified relatively solids. //! The method uses classification approach for choosing the faces which will participate in building the result shape: - All faces from each group having the given state for the opposite group will be taken into result. //! Such approach shows better results (in comparison with BOPAlgo_BuilderSolid approach) when working with open solids. However, the result may not be always correct on such data (at least, not as expected) as the correct classification of the faces relatively open solids is not always possible and may vary depending on the chosen classification point on the face. //! History is not created for the solids in this method. //! To avoid pollution of the report of Builder algorithm, there is a possibility to pass the different report to collect the alerts of the method only. But, if the new report is not given, the Builder report will be used. So, even if Builder passed without any errors, but some error has been stored into its report in this method, for the following calls the Builder report must be cleared. //! The method may set the following errors: - BOPAlgo_AlertBuilderFailed - Building operation has not been performed yet or failed; - BOPAlgo_AlertBOPNotSet - invalid BOP type is given (COMMON/FUSE/CUT/CUT21 are supported); - BOPAlgo_AlertTooFewArguments - arguments are not given; - BOPAlgo_AlertUnknownShape - the shape is unknown for the operation. //! Parameters: 
Parameter theObjects - The group of Objects for BOP; 
Parameter theObjState - State for objects faces to pass into result; 
Parameter theTools - The group of Tools for BOP; 
Parameter theToolsState - State for tools faces to pass into result; 
Parameter theReport - The alternative report to avoid pollution of the main one.
") BuildBOP;
		virtual void BuildBOP(const TopTools_ListOfShape & theObjects, const TopAbs_State theObjState, const TopTools_ListOfShape & theTools, const TopAbs_State theToolsState, const Message_ProgressRange & theRange, opencascade::handle<Message_Report > theReport = NULL);

		/****** BOPAlgo_Builder::BuildBOP ******/
		/****** md5 signature: 18c5ea0ce9eb413167db72fc87c235d6 ******/
		%feature("compactdefaultargs") BuildBOP;
		%feature("autodoc", "
Parameters
----------
theObjects: TopTools_ListOfShape
theTools: TopTools_ListOfShape
theOperation: BOPAlgo_Operation
theRange: Message_ProgressRange
theReport: Message_Report (optional, default to NULL)

Return
-------
None

Description
-----------
Builds the result of Boolean operation of given type basing on the result of Builder operation (GF or any other). //! The method converts the given type of operation into the states for the objects and tools required for their face to pass into result and performs the call to the same method, but with states instead of operation type. //! The conversion looks as follows: - COMMON is built from the faces of objects located IN any of the tools and vice versa. - FUSE is built from the faces OUT of all given shapes; - CUT is built from the faces of the objects OUT of the tools and faces of the tools located IN solids of the objects. //! 
Parameter theObjects - The group of Objects for BOP; 
Parameter theTools - The group of Tools for BOP; 
Parameter theOperation - The BOP type; 
Parameter theRange - The parameter to progressIndicator 
Parameter theReport - The alternative report to avoid pollution of the global one.
") BuildBOP;
		void BuildBOP(const TopTools_ListOfShape & theObjects, const TopTools_ListOfShape & theTools, const BOPAlgo_Operation theOperation, const Message_ProgressRange & theRange, opencascade::handle<Message_Report > theReport = NULL);

		/****** BOPAlgo_Builder::CheckInverted ******/
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

		/****** BOPAlgo_Builder::Clear ******/
		/****** md5 signature: f671931d03948860d0ead34afbe920aa ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the algorithm.
") Clear;
		virtual void Clear();

		/****** BOPAlgo_Builder::Context ******/
		/****** md5 signature: 74fb770c962675c4ccf80c755850043b ******/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return
-------
opencascade::handle<IntTools_Context>

Description
-----------
Returns the Context, tool for cashing heavy algorithms.
") Context;
		opencascade::handle<IntTools_Context> Context();

		/****** BOPAlgo_Builder::Glue ******/
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

		/****** BOPAlgo_Builder::Images ******/
		/****** md5 signature: b5e41f40108249a88217f4fca2899406 ******/
		%feature("compactdefaultargs") Images;
		%feature("autodoc", "Return
-------
TopTools_DataMapOfShapeListOfShape

Description
-----------
Returns the map of images.
") Images;
		const TopTools_DataMapOfShapeListOfShape & Images();

		/****** BOPAlgo_Builder::NonDestructive ******/
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

		/****** BOPAlgo_Builder::Origins ******/
		/****** md5 signature: af47018f396466f88e1f40a1e0dda823 ******/
		%feature("compactdefaultargs") Origins;
		%feature("autodoc", "Return
-------
TopTools_DataMapOfShapeListOfShape

Description
-----------
Returns the map of origins.
") Origins;
		const TopTools_DataMapOfShapeListOfShape & Origins();

		/****** BOPAlgo_Builder::PDS ******/
		/****** md5 signature: a30b9b6ee088c51b53e93ae172dde611 ******/
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "Return
-------
BOPDS_PDS

Description
-----------
Returns the Data Structure, holder of intersection information.
") PDS;
		BOPDS_PDS PDS();

		/****** BOPAlgo_Builder::PPaveFiller ******/
		/****** md5 signature: b4431f105883f2fda078ca3da828ad49 ******/
		%feature("compactdefaultargs") PPaveFiller;
		%feature("autodoc", "Return
-------
BOPAlgo_PPaveFiller

Description
-----------
Returns the PaveFiller, algorithm for sub-shapes intersection.
") PPaveFiller;
		BOPAlgo_PPaveFiller PPaveFiller();

		/****** BOPAlgo_Builder::Perform ******/
		/****** md5 signature: 0c284a2ff880da6562c1121fb4e216b7 ******/
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
Performs the operation. The intersection will be performed also.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_Builder::PerformWithFiller ******/
		/****** md5 signature: dcd0b26cc1d80352d6565f05cc10fd51 ******/
		%feature("compactdefaultargs") PerformWithFiller;
		%feature("autodoc", "
Parameters
----------
theFiller: BOPAlgo_PaveFiller
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Performs the operation with the prepared filler. The intersection will not be performed in this case.
") PerformWithFiller;
		virtual void PerformWithFiller(const BOPAlgo_PaveFiller & theFiller, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_Builder::SetArguments ******/
		/****** md5 signature: 52d846757af37684f5519c7b7f1b4940 ******/
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
Sets the list of arguments for the operation.
") SetArguments;
		virtual void SetArguments(const TopTools_ListOfShape & theLS);

		/****** BOPAlgo_Builder::SetCheckInverted ******/
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

		/****** BOPAlgo_Builder::SetGlue ******/
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
Sets the glue option for the algorithm.
") SetGlue;
		void SetGlue(const BOPAlgo_GlueEnum theGlue);

		/****** BOPAlgo_Builder::SetNonDestructive ******/
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
Sets the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated. This flag is taken into account if internal PaveFiller is used only. In the case of calling PerformWithFiller the corresponding flag of that PaveFiller is in force.
") SetNonDestructive;
		void SetNonDestructive(const Standard_Boolean theFlag);

		/****** BOPAlgo_Builder::ShapesSD ******/
		/****** md5 signature: b1456fb65b85afaf3fe4896e268be23e ******/
		%feature("compactdefaultargs") ShapesSD;
		%feature("autodoc", "Return
-------
TopTools_DataMapOfShapeShape

Description
-----------
Returns the map of Same Domain (SD) shapes - coinciding shapes from different arguments.
") ShapesSD;
		const TopTools_DataMapOfShapeShape & ShapesSD();

};


%extend BOPAlgo_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BOPAlgo_BuilderFace *
****************************/
class BOPAlgo_BuilderFace : public BOPAlgo_BuilderArea {
	public:
		/****** BOPAlgo_BuilderFace::BOPAlgo_BuilderFace ******/
		/****** md5 signature: 55fb0e9f8f896e5e2f0cad2dee0ad4b9 ******/
		%feature("compactdefaultargs") BOPAlgo_BuilderFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_BuilderFace;
		 BOPAlgo_BuilderFace();

		/****** BOPAlgo_BuilderFace::BOPAlgo_BuilderFace ******/
		/****** md5 signature: b5c457f566a0d6c73144f78202d49cab ******/
		%feature("compactdefaultargs") BOPAlgo_BuilderFace;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_BuilderFace;
		 BOPAlgo_BuilderFace(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPAlgo_BuilderFace::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the face generatix.
") Face;
		const TopoDS_Face Face();

		/****** BOPAlgo_BuilderFace::Orientation ******/
		/****** md5 signature: 328242fe19b1f80489d8169681ebc029 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** BOPAlgo_BuilderFace::Perform ******/
		/****** md5 signature: 0c284a2ff880da6562c1121fb4e216b7 ******/
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
Performs the algorithm.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_BuilderFace::SetFace ******/
		/****** md5 signature: 5b74a256c8032110740067b9210114f8 ******/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
None

Description
-----------
Sets the face generatix.
") SetFace;
		void SetFace(const TopoDS_Face & theFace);

};


%extend BOPAlgo_BuilderFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPAlgo_BuilderSolid *
*****************************/
class BOPAlgo_BuilderSolid : public BOPAlgo_BuilderArea {
	public:
		/****** BOPAlgo_BuilderSolid::BOPAlgo_BuilderSolid ******/
		/****** md5 signature: 3207f4476326a857182303f4e535631e ******/
		%feature("compactdefaultargs") BOPAlgo_BuilderSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPAlgo_BuilderSolid;
		 BOPAlgo_BuilderSolid();

		/****** BOPAlgo_BuilderSolid::BOPAlgo_BuilderSolid ******/
		/****** md5 signature: ffc0a313e87b14e1192559b5a26c6ac8 ******/
		%feature("compactdefaultargs") BOPAlgo_BuilderSolid;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Constructor with allocator.
") BOPAlgo_BuilderSolid;
		 BOPAlgo_BuilderSolid(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPAlgo_BuilderSolid::GetBoxesMap ******/
		/****** md5 signature: a5a9e80370b6f3886c3433f1fcf548da ******/
		%feature("compactdefaultargs") GetBoxesMap;
		%feature("autodoc", "Return
-------
TopTools_DataMapOfShapeBox

Description
-----------
For classification purposes the algorithm builds the bounding boxes for all created solids. This method returns the data map of solid - box pairs.
") GetBoxesMap;
		const TopTools_DataMapOfShapeBox & GetBoxesMap();

		/****** BOPAlgo_BuilderSolid::Perform ******/
		/****** md5 signature: 0c284a2ff880da6562c1121fb4e216b7 ******/
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
Performs the construction of the solids from the given faces.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

};


%extend BOPAlgo_BuilderSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BOPAlgo_CheckerSI *
**************************/
class BOPAlgo_CheckerSI : public BOPAlgo_PaveFiller {
	public:
		/****** BOPAlgo_CheckerSI::BOPAlgo_CheckerSI ******/
		/****** md5 signature: 4509a2dedfaae61b75002e38bf4839ca ******/
		%feature("compactdefaultargs") BOPAlgo_CheckerSI;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_CheckerSI;
		 BOPAlgo_CheckerSI();

		/****** BOPAlgo_CheckerSI::Perform ******/
		/****** md5 signature: 0c284a2ff880da6562c1121fb4e216b7 ******/
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
No available documentation.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_CheckerSI::SetLevelOfCheck ******/
		/****** md5 signature: 8b368cd9515ac3e41d12f4691644e2cf ******/
		%feature("compactdefaultargs") SetLevelOfCheck;
		%feature("autodoc", "
Parameters
----------
theLevel: int

Return
-------
None

Description
-----------
Sets the level of checking shape on self-interference. It defines which interferences will be checked: 0 - only V/V; 1 - V/V and V/E; 2 - V/V, V/E and E/E; 3 - V/V, V/E, E/E and V/F; 4 - V/V, V/E, E/E, V/F and E/F; 5 - V/V, V/E, E/E, V/F, E/F and F/F; 6 - V/V, V/E, E/E, V/F, E/F, F/F and V/S; 7 - V/V, V/E, E/E, V/F, E/F, F/F, V/S and E/S; 8 - V/V, V/E, E/E, V/F, E/F, F/F, V/S, E/S and F/S; 9 - V/V, V/E, E/E, V/F, E/F, F/F, V/S, E/S, F/S and S/S - all interferences (Default value).
") SetLevelOfCheck;
		void SetLevelOfCheck(const Standard_Integer theLevel);

};


%extend BOPAlgo_CheckerSI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BOPAlgo_RemoveFeatures *
*******************************/
class BOPAlgo_RemoveFeatures : public BOPAlgo_BuilderShape {
	public:
		/****** BOPAlgo_RemoveFeatures::BOPAlgo_RemoveFeatures ******/
		/****** md5 signature: 7b50bf592dac62efc3164c9eb9f4d77d ******/
		%feature("compactdefaultargs") BOPAlgo_RemoveFeatures;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPAlgo_RemoveFeatures;
		 BOPAlgo_RemoveFeatures();

		/****** BOPAlgo_RemoveFeatures::AddFaceToRemove ******/
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
Adds the face to remove from the input shape. 
Input parameter: theFace The shape to extract the faces for removal.
") AddFaceToRemove;
		void AddFaceToRemove(const TopoDS_Shape & theFace);

		/****** BOPAlgo_RemoveFeatures::AddFacesToRemove ******/
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

		/****** BOPAlgo_RemoveFeatures::Clear ******/
		/****** md5 signature: aed78bc7ea4fdcb55502fff982e7b775 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the contents of the algorithm from previous run, allowing reusing it for following removals.
") Clear;
		virtual void Clear();

		/****** BOPAlgo_RemoveFeatures::FacesToRemove ******/
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

		/****** BOPAlgo_RemoveFeatures::InputShape ******/
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

		/****** BOPAlgo_RemoveFeatures::Perform ******/
		/****** md5 signature: 0c284a2ff880da6562c1121fb4e216b7 ******/
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
Performs the operation.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_RemoveFeatures::SetShape ******/
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
Input parameter: theShape The shape to remove the faces from.  It should either be the SOLID, COMPSOLID or COMPOUND of Solids.
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

};


%extend BOPAlgo_RemoveFeatures {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPAlgo_CellsBuilder *
*****************************/
class BOPAlgo_CellsBuilder : public BOPAlgo_Builder {
	public:
		/****** BOPAlgo_CellsBuilder::BOPAlgo_CellsBuilder ******/
		/****** md5 signature: 283c387ed79b57aa716daf623c73a380 ******/
		%feature("compactdefaultargs") BOPAlgo_CellsBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_CellsBuilder;
		 BOPAlgo_CellsBuilder();

		/****** BOPAlgo_CellsBuilder::BOPAlgo_CellsBuilder ******/
		/****** md5 signature: 0c9a50e5a44f35e9ea990d6dd2e2c069 ******/
		%feature("compactdefaultargs") BOPAlgo_CellsBuilder;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_CellsBuilder;
		 BOPAlgo_CellsBuilder(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPAlgo_CellsBuilder::AddAllToResult ******/
		/****** md5 signature: 58f1f9632579501c71d617e8b3be70df ******/
		%feature("compactdefaultargs") AddAllToResult;
		%feature("autodoc", "
Parameters
----------
theMaterial: int (optional, default to 0)
theUpdate: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Add all split parts to result. <theMaterial> defines the removal of internal boundaries; <theUpdate> parameter defines whether to remove boundaries now or not.
") AddAllToResult;
		void AddAllToResult(const Standard_Integer theMaterial = 0, const Standard_Boolean theUpdate = Standard_False);

		/****** BOPAlgo_CellsBuilder::AddToResult ******/
		/****** md5 signature: 078f78bbeb3b4b698240216e4af3918a ******/
		%feature("compactdefaultargs") AddToResult;
		%feature("autodoc", "
Parameters
----------
theLSToTake: TopTools_ListOfShape
theLSToAvoid: TopTools_ListOfShape
theMaterial: int (optional, default to 0)
theUpdate: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Adding the parts to result. The parts are defined by two lists of shapes: <theLSToTake> defines the arguments which parts should be taken into result; <theLSToAvoid> defines the arguments which parts should not be taken into result; To be taken into result the part must be IN for all shapes from the list <theLSToTake> and must be OUT of all shapes from the list <theLSToAvoid>. //! To remove internal boundaries between any cells in the result <theMaterial> variable should be used. The boundaries between cells with the same material will be removed. Default value is 0. Thus, to remove any boundary the value of this variable should not be equal to 0. <theUpdate> parameter defines whether to remove boundaries now or not.
") AddToResult;
		void AddToResult(const TopTools_ListOfShape & theLSToTake, const TopTools_ListOfShape & theLSToAvoid, const Standard_Integer theMaterial = 0, const Standard_Boolean theUpdate = Standard_False);

		/****** BOPAlgo_CellsBuilder::Clear ******/
		/****** md5 signature: f671931d03948860d0ead34afbe920aa ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Redefined method Clear - clears the contents.
") Clear;
		virtual void Clear();

		/****** BOPAlgo_CellsBuilder::GetAllParts ******/
		/****** md5 signature: b2790f97d6203d4043686998a149d61a ******/
		%feature("compactdefaultargs") GetAllParts;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Get all split parts.
") GetAllParts;
		const TopoDS_Shape GetAllParts();

		/****** BOPAlgo_CellsBuilder::MakeContainers ******/
		/****** md5 signature: 9eacc65717dba6855fa4d05e42624e62 ******/
		%feature("compactdefaultargs") MakeContainers;
		%feature("autodoc", "Return
-------
None

Description
-----------
Makes the Containers of proper type from the parts added to result.
") MakeContainers;
		void MakeContainers();

		/****** BOPAlgo_CellsBuilder::RemoveAllFromResult ******/
		/****** md5 signature: da6f499056fba61c54387b307c110ed8 ******/
		%feature("compactdefaultargs") RemoveAllFromResult;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove all parts from result.
") RemoveAllFromResult;
		void RemoveAllFromResult();

		/****** BOPAlgo_CellsBuilder::RemoveFromResult ******/
		/****** md5 signature: 0a190413f81894fd0aedf2b6857a0e58 ******/
		%feature("compactdefaultargs") RemoveFromResult;
		%feature("autodoc", "
Parameters
----------
theLSToTake: TopTools_ListOfShape
theLSToAvoid: TopTools_ListOfShape

Return
-------
None

Description
-----------
Removing the parts from result. The parts are defined by two lists of shapes: <theLSToTake> defines the arguments which parts should be removed from result; <theLSToAvoid> defines the arguments which parts should not be removed from result. To be removed from the result the part must be IN for all shapes from the list <theLSToTake> and must be OUT of all shapes from the list <theLSToAvoid>.
") RemoveFromResult;
		void RemoveFromResult(const TopTools_ListOfShape & theLSToTake, const TopTools_ListOfShape & theLSToAvoid);

		/****** BOPAlgo_CellsBuilder::RemoveInternalBoundaries ******/
		/****** md5 signature: 2ea3e927bcf8e9d3e7d159aea16eac8b ******/
		%feature("compactdefaultargs") RemoveInternalBoundaries;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes internal boundaries between cells with the same material. If the result contains the cells with same material but of different dimension the removal of internal boundaries between these cells will not be performed. In case of some errors during the removal the method will set the appropriate warning status - use GetReport() to access them.
") RemoveInternalBoundaries;
		void RemoveInternalBoundaries();

};


%extend BOPAlgo_CellsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BOPAlgo_MakerVolume *
****************************/
class BOPAlgo_MakerVolume : public BOPAlgo_Builder {
	public:
		/****** BOPAlgo_MakerVolume::BOPAlgo_MakerVolume ******/
		/****** md5 signature: d0e6199b15a5886e06dc5392486c5729 ******/
		%feature("compactdefaultargs") BOPAlgo_MakerVolume;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPAlgo_MakerVolume;
		 BOPAlgo_MakerVolume();

		/****** BOPAlgo_MakerVolume::BOPAlgo_MakerVolume ******/
		/****** md5 signature: d34685403aab74ebc2da37a1a29c02c6 ******/
		%feature("compactdefaultargs") BOPAlgo_MakerVolume;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Empty constructor.
") BOPAlgo_MakerVolume;
		 BOPAlgo_MakerVolume(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPAlgo_MakerVolume::Box ******/
		/****** md5 signature: 3ac56b24f6371ebc9df716c917fc390f ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Return
-------
TopoDS_Solid

Description
-----------
Returns the solid box <mySBox>.
") Box;
		const TopoDS_Solid Box();

		/****** BOPAlgo_MakerVolume::Clear ******/
		/****** md5 signature: f671931d03948860d0ead34afbe920aa ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the data.
") Clear;
		virtual void Clear();

		/****** BOPAlgo_MakerVolume::Faces ******/
		/****** md5 signature: 9c2557bb3fea1d1ff5791937fe36a2f5 ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the processed faces <myFaces>.
") Faces;
		const TopTools_ListOfShape & Faces();

		/****** BOPAlgo_MakerVolume::IsAvoidInternalShapes ******/
		/****** md5 signature: 8a7b9501581d682ae84b1516b6d067be ******/
		%feature("compactdefaultargs") IsAvoidInternalShapes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the AvoidInternalShapes flag.
") IsAvoidInternalShapes;
		Standard_Boolean IsAvoidInternalShapes();

		/****** BOPAlgo_MakerVolume::IsIntersect ******/
		/****** md5 signature: 83079d7138bb957f3b50f76e715d483c ******/
		%feature("compactdefaultargs") IsIntersect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag <myIntersect>.
") IsIntersect;
		Standard_Boolean IsIntersect();

		/****** BOPAlgo_MakerVolume::Perform ******/
		/****** md5 signature: 0c284a2ff880da6562c1121fb4e216b7 ******/
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
Performs the operation.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_MakerVolume::SetAvoidInternalShapes ******/
		/****** md5 signature: d4ee80659b0195413556579790baf956 ******/
		%feature("compactdefaultargs") SetAvoidInternalShapes;
		%feature("autodoc", "
Parameters
----------
theAvoidInternal: bool

Return
-------
None

Description
-----------
Defines the preventing of addition of internal for solid parts into the result. By default the internal parts are added into result.
") SetAvoidInternalShapes;
		void SetAvoidInternalShapes(const Standard_Boolean theAvoidInternal);

		/****** BOPAlgo_MakerVolume::SetIntersect ******/
		/****** md5 signature: 91f9f86d3d941824ec34eddc9329ee23 ******/
		%feature("compactdefaultargs") SetIntersect;
		%feature("autodoc", "
Parameters
----------
bIntersect: bool

Return
-------
None

Description
-----------
Sets the flag myIntersect: if <bIntersect> is True the shapes from <myArguments> will be intersected. if <bIntersect> is False no intersection will be done.
") SetIntersect;
		void SetIntersect(const Standard_Boolean bIntersect);

};


%extend BOPAlgo_MakerVolume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BOPAlgo_Section *
************************/
class BOPAlgo_Section : public BOPAlgo_Builder {
	public:
		/****** BOPAlgo_Section::BOPAlgo_Section ******/
		/****** md5 signature: a6ca4919a6cd1765268a1adceee00250 ******/
		%feature("compactdefaultargs") BOPAlgo_Section;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPAlgo_Section;
		 BOPAlgo_Section();

		/****** BOPAlgo_Section::BOPAlgo_Section ******/
		/****** md5 signature: 7d326de6218833e290f0512fe0e4cc7f ******/
		%feature("compactdefaultargs") BOPAlgo_Section;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Constructor with allocator.
") BOPAlgo_Section;
		 BOPAlgo_Section(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

};


%extend BOPAlgo_Section {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BOPAlgo_ToolsProvider *
******************************/
class BOPAlgo_ToolsProvider : public BOPAlgo_Builder {
	public:
		/****** BOPAlgo_ToolsProvider::BOPAlgo_ToolsProvider ******/
		/****** md5 signature: 6126476d277f9865fd5dc964255f5ab2 ******/
		%feature("compactdefaultargs") BOPAlgo_ToolsProvider;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPAlgo_ToolsProvider;
		 BOPAlgo_ToolsProvider();

		/****** BOPAlgo_ToolsProvider::BOPAlgo_ToolsProvider ******/
		/****** md5 signature: 6bb0db70c66244e0cce5fe43bf078d78 ******/
		%feature("compactdefaultargs") BOPAlgo_ToolsProvider;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_ToolsProvider;
		 BOPAlgo_ToolsProvider(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPAlgo_ToolsProvider::AddTool ******/
		/****** md5 signature: 81f0977d7c049de98cc27f2491835535 ******/
		%feature("compactdefaultargs") AddTool;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Adds Tool argument of the operation.
") AddTool;
		virtual void AddTool(const TopoDS_Shape & theShape);

		/****** BOPAlgo_ToolsProvider::Clear ******/
		/****** md5 signature: f671931d03948860d0ead34afbe920aa ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears internal fields and arguments.
") Clear;
		virtual void Clear();

		/****** BOPAlgo_ToolsProvider::SetTools ******/
		/****** md5 signature: da6d08fc771172834027c4c3bf810697 ******/
		%feature("compactdefaultargs") SetTools;
		%feature("autodoc", "
Parameters
----------
theShapes: TopTools_ListOfShape

Return
-------
None

Description
-----------
Adds the Tool arguments of the operation.
") SetTools;
		virtual void SetTools(const TopTools_ListOfShape & theShapes);

		/****** BOPAlgo_ToolsProvider::Tools ******/
		/****** md5 signature: 0471973aac274d4f863776957a65fd19 ******/
		%feature("compactdefaultargs") Tools;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the Tool arguments of the operation.
") Tools;
		const TopTools_ListOfShape & Tools();

};


%extend BOPAlgo_ToolsProvider {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class BOPAlgo_BOP *
********************/
class BOPAlgo_BOP : public BOPAlgo_ToolsProvider {
	public:
		/****** BOPAlgo_BOP::BOPAlgo_BOP ******/
		/****** md5 signature: 4d357b2740befe8a8d360cc2e02f478c ******/
		%feature("compactdefaultargs") BOPAlgo_BOP;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPAlgo_BOP;
		 BOPAlgo_BOP();

		/****** BOPAlgo_BOP::BOPAlgo_BOP ******/
		/****** md5 signature: feb1029ccc5153f535a54dcb035cb288 ******/
		%feature("compactdefaultargs") BOPAlgo_BOP;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_BOP;
		 BOPAlgo_BOP(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPAlgo_BOP::Clear ******/
		/****** md5 signature: f671931d03948860d0ead34afbe920aa ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears internal fields and arguments.
") Clear;
		virtual void Clear();

		/****** BOPAlgo_BOP::Operation ******/
		/****** md5 signature: 53685d2081d3d3f1f66792b3367f7ed4 ******/
		%feature("compactdefaultargs") Operation;
		%feature("autodoc", "Return
-------
BOPAlgo_Operation

Description
-----------
No available documentation.
") Operation;
		BOPAlgo_Operation Operation();

		/****** BOPAlgo_BOP::Perform ******/
		/****** md5 signature: 0c284a2ff880da6562c1121fb4e216b7 ******/
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
No available documentation.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_BOP::SetOperation ******/
		/****** md5 signature: 315e93f5dc046c73744bab20d8a0d13f ******/
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "
Parameters
----------
theOperation: BOPAlgo_Operation

Return
-------
None

Description
-----------
No available documentation.
") SetOperation;
		void SetOperation(const BOPAlgo_Operation theOperation);

};


%extend BOPAlgo_BOP {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BOPAlgo_Splitter *
*************************/
class BOPAlgo_Splitter : public BOPAlgo_ToolsProvider {
	public:
		/****** BOPAlgo_Splitter::BOPAlgo_Splitter ******/
		/****** md5 signature: 41a4c344ea1bf552096cf49314155d42 ******/
		%feature("compactdefaultargs") BOPAlgo_Splitter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPAlgo_Splitter;
		 BOPAlgo_Splitter();

		/****** BOPAlgo_Splitter::BOPAlgo_Splitter ******/
		/****** md5 signature: 2c9575836a616bbcbb946e2ef6ad3a7a ******/
		%feature("compactdefaultargs") BOPAlgo_Splitter;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
No available documentation.
") BOPAlgo_Splitter;
		 BOPAlgo_Splitter(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPAlgo_Splitter::Perform ******/
		/****** md5 signature: 0c284a2ff880da6562c1121fb4e216b7 ******/
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
Performs the operation.
") Perform;
		virtual void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

};


%extend BOPAlgo_Splitter {
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
def BOPAlgo_Options_GetParallelMode(*args):
	return BOPAlgo_Options.GetParallelMode(*args)

@deprecated
def BOPAlgo_Options_SetParallelMode(*args):
	return BOPAlgo_Options.SetParallelMode(*args)

@deprecated
def BOPAlgo_Tools_ClassifyFaces(*args):
	return BOPAlgo_Tools.ClassifyFaces(*args)

@deprecated
def BOPAlgo_Tools_ComputeToleranceOfCB(*args):
	return BOPAlgo_Tools.ComputeToleranceOfCB(*args)

@deprecated
def BOPAlgo_Tools_EdgesToWires(*args):
	return BOPAlgo_Tools.EdgesToWires(*args)

@deprecated
def BOPAlgo_Tools_FillInternals(*args):
	return BOPAlgo_Tools.FillInternals(*args)

@deprecated
def BOPAlgo_Tools_IntersectVertices(*args):
	return BOPAlgo_Tools.IntersectVertices(*args)

@deprecated
def BOPAlgo_Tools_PerformCommonBlocks(*args):
	return BOPAlgo_Tools.PerformCommonBlocks(*args)

@deprecated
def BOPAlgo_Tools_PerformCommonBlocks(*args):
	return BOPAlgo_Tools.PerformCommonBlocks(*args)

@deprecated
def BOPAlgo_Tools_TrsfToPoint(*args):
	return BOPAlgo_Tools.TrsfToPoint(*args)

@deprecated
def BOPAlgo_Tools_WiresToFaces(*args):
	return BOPAlgo_Tools.WiresToFaces(*args)

@deprecated
def BOPAlgo_MakePeriodic_ToDirectionID(*args):
	return BOPAlgo_MakePeriodic.ToDirectionID(*args)

@deprecated
def BOPAlgo_ShellSplitter_SplitBlock(*args):
	return BOPAlgo_ShellSplitter.SplitBlock(*args)

@deprecated
def BOPAlgo_WireSplitter_MakeWire(*args):
	return BOPAlgo_WireSplitter.MakeWire(*args)

@deprecated
def BOPAlgo_WireSplitter_SplitBlock(*args):
	return BOPAlgo_WireSplitter.SplitBlock(*args)

}
