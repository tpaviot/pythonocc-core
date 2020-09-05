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
%define BOPALGODOCSTRING
"BOPAlgo module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_bopalgo.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<BOPAlgo_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
#include<Message_module.hxx>
#include<IntTools_module.hxx>
#include<BOPDS_module.hxx>
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
%import IntTools.i
%import BOPDS.i
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

enum BOPAlgo_Operation {
	BOPAlgo_COMMON = 0,
	BOPAlgo_FUSE = 1,
	BOPAlgo_CUT = 2,
	BOPAlgo_CUT21 = 3,
	BOPAlgo_SECTION = 4,
	BOPAlgo_UNKNOWN = 5,
};

enum BOPAlgo_GlueEnum {
	BOPAlgo_GlueOff = 0,
	BOPAlgo_GlueShift = 1,
	BOPAlgo_GlueFull = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
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

class BOPAlgo_GlueEnum(IntEnum):
	BOPAlgo_GlueOff = 0
	BOPAlgo_GlueShift = 1
	BOPAlgo_GlueFull = 2
BOPAlgo_GlueOff = BOPAlgo_GlueEnum.BOPAlgo_GlueOff
BOPAlgo_GlueShift = BOPAlgo_GlueEnum.BOPAlgo_GlueShift
BOPAlgo_GlueFull = BOPAlgo_GlueEnum.BOPAlgo_GlueFull
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
		/****************** BOPAlgo_CheckResult ******************/
		/**** md5 signature: dea769d54f4bd763585ebd4034c98353 ****/
		%feature("compactdefaultargs") BOPAlgo_CheckResult;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BOPAlgo_CheckResult;
		 BOPAlgo_CheckResult();

		/****************** AddFaultyShape1 ******************/
		/**** md5 signature: f4fc4348e7f32438e74e5bc925fb83c5 ****/
		%feature("compactdefaultargs") AddFaultyShape1;
		%feature("autodoc", "Adds faulty sub-shapes from object to a list.

Parameters
----------
TheShape: TopoDS_Shape

Returns
-------
None
") AddFaultyShape1;
		void AddFaultyShape1(const TopoDS_Shape & TheShape);

		/****************** AddFaultyShape2 ******************/
		/**** md5 signature: 08dbc2a8aeed47639b770ec0ac24b612 ****/
		%feature("compactdefaultargs") AddFaultyShape2;
		%feature("autodoc", "Adds faulty sub-shapes from tool to a list.

Parameters
----------
TheShape: TopoDS_Shape

Returns
-------
None
") AddFaultyShape2;
		void AddFaultyShape2(const TopoDS_Shape & TheShape);

		/****************** GetCheckStatus ******************/
		/**** md5 signature: 89e09e6d4b68f3aacbd1de7dc2d4e2f8 ****/
		%feature("compactdefaultargs") GetCheckStatus;
		%feature("autodoc", "Gets status of faulty.

Returns
-------
BOPAlgo_CheckStatus
") GetCheckStatus;
		BOPAlgo_CheckStatus GetCheckStatus();

		/****************** GetFaultyShapes1 ******************/
		/**** md5 signature: f728fddcc353c4062194134e5bf43fd5 ****/
		%feature("compactdefaultargs") GetFaultyShapes1;
		%feature("autodoc", "Returns list of faulty shapes for object.

Returns
-------
TopTools_ListOfShape
") GetFaultyShapes1;
		const TopTools_ListOfShape & GetFaultyShapes1();

		/****************** GetFaultyShapes2 ******************/
		/**** md5 signature: 547a4a2e3a84bbf43143e6bb8c0f757f ****/
		%feature("compactdefaultargs") GetFaultyShapes2;
		%feature("autodoc", "Returns list of faulty shapes for tool.

Returns
-------
TopTools_ListOfShape
") GetFaultyShapes2;
		const TopTools_ListOfShape & GetFaultyShapes2();

		/****************** GetMaxDistance1 ******************/
		/**** md5 signature: a08934026a64239752b614e124fd393f ****/
		%feature("compactdefaultargs") GetMaxDistance1;
		%feature("autodoc", "Returns the distance for the first shape.

Returns
-------
float
") GetMaxDistance1;
		Standard_Real GetMaxDistance1();

		/****************** GetMaxDistance2 ******************/
		/**** md5 signature: 635ed89e8c069eba76d435dbbab735c2 ****/
		%feature("compactdefaultargs") GetMaxDistance2;
		%feature("autodoc", "Returns the distance for the second shape.

Returns
-------
float
") GetMaxDistance2;
		Standard_Real GetMaxDistance2();

		/****************** GetMaxParameter1 ******************/
		/**** md5 signature: 2d7b754d07c9650db3d770a6a970655c ****/
		%feature("compactdefaultargs") GetMaxParameter1;
		%feature("autodoc", "Returns the parameter for the fircst shape.

Returns
-------
float
") GetMaxParameter1;
		Standard_Real GetMaxParameter1();

		/****************** GetMaxParameter2 ******************/
		/**** md5 signature: 339892b104483047abe995771a167705 ****/
		%feature("compactdefaultargs") GetMaxParameter2;
		%feature("autodoc", "Returns the parameter for the second shape.

Returns
-------
float
") GetMaxParameter2;
		Standard_Real GetMaxParameter2();

		/****************** GetShape1 ******************/
		/**** md5 signature: da65271fea68f494586b07012e23b4bb ****/
		%feature("compactdefaultargs") GetShape1;
		%feature("autodoc", "Returns ancestor shape (object) for faulties.

Returns
-------
TopoDS_Shape
") GetShape1;
		const TopoDS_Shape GetShape1();

		/****************** GetShape2 ******************/
		/**** md5 signature: ad646522ebe6de8820d9424e4f21edb9 ****/
		%feature("compactdefaultargs") GetShape2;
		%feature("autodoc", "Returns ancestor shape (tool) for faulties.

Returns
-------
TopoDS_Shape
") GetShape2;
		const TopoDS_Shape GetShape2();

		/****************** SetCheckStatus ******************/
		/**** md5 signature: f3c122c6cb39ad6a91e7b859c005e322 ****/
		%feature("compactdefaultargs") SetCheckStatus;
		%feature("autodoc", "Set status of faulty.

Parameters
----------
TheStatus: BOPAlgo_CheckStatus

Returns
-------
None
") SetCheckStatus;
		void SetCheckStatus(const BOPAlgo_CheckStatus TheStatus);

		/****************** SetMaxDistance1 ******************/
		/**** md5 signature: f3f7c583b2244f7a9a07fbaa143b9f22 ****/
		%feature("compactdefaultargs") SetMaxDistance1;
		%feature("autodoc", "Sets max distance for the first shape.

Parameters
----------
theDist: float

Returns
-------
None
") SetMaxDistance1;
		void SetMaxDistance1(const Standard_Real theDist);

		/****************** SetMaxDistance2 ******************/
		/**** md5 signature: 26e9a5acae152632933809ad11c56749 ****/
		%feature("compactdefaultargs") SetMaxDistance2;
		%feature("autodoc", "Sets max distance for the second shape.

Parameters
----------
theDist: float

Returns
-------
None
") SetMaxDistance2;
		void SetMaxDistance2(const Standard_Real theDist);

		/****************** SetMaxParameter1 ******************/
		/**** md5 signature: 5df07c2f24ee4c4939cb016c85dc1437 ****/
		%feature("compactdefaultargs") SetMaxParameter1;
		%feature("autodoc", "Sets the parameter for the first shape.

Parameters
----------
thePar: float

Returns
-------
None
") SetMaxParameter1;
		void SetMaxParameter1(const Standard_Real thePar);

		/****************** SetMaxParameter2 ******************/
		/**** md5 signature: ebcf38f33cf83375bcefa3a54a26e5ba ****/
		%feature("compactdefaultargs") SetMaxParameter2;
		%feature("autodoc", "Sets the parameter for the second shape.

Parameters
----------
thePar: float

Returns
-------
None
") SetMaxParameter2;
		void SetMaxParameter2(const Standard_Real thePar);

		/****************** SetShape1 ******************/
		/**** md5 signature: 32d06bb8d221a179d322a30597a4d6c8 ****/
		%feature("compactdefaultargs") SetShape1;
		%feature("autodoc", "Sets ancestor shape (object) for faulty sub-shapes.

Parameters
----------
TheShape: TopoDS_Shape

Returns
-------
None
") SetShape1;
		void SetShape1(const TopoDS_Shape & TheShape);

		/****************** SetShape2 ******************/
		/**** md5 signature: 872074f224a41d220ff8f15ed451c9ac ****/
		%feature("compactdefaultargs") SetShape2;
		%feature("autodoc", "Sets ancestor shape (tool) for faulty sub-shapes.

Parameters
----------
TheShape: TopoDS_Shape

Returns
-------
None
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
		/****************** BOPAlgo_Options ******************/
		/**** md5 signature: 1d3be438f8467a9d42a76784f9e361b9 ****/
		%feature("compactdefaultargs") BOPAlgo_Options;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BOPAlgo_Options;
		 BOPAlgo_Options();

		/****************** BOPAlgo_Options ******************/
		/**** md5 signature: 1e4b6fcd71a6eff1c7af075708751619 ****/
		%feature("compactdefaultargs") BOPAlgo_Options;
		%feature("autodoc", "Constructor with allocator.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPAlgo_Options;
		 BOPAlgo_Options(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** AddError ******************/
		/**** md5 signature: f00155f55c673f9e74c0f0dd7c25fadd ****/
		%feature("compactdefaultargs") AddError;
		%feature("autodoc", "Adds the alert as error (fail).

Parameters
----------
theAlert: Message_Alert

Returns
-------
None
") AddError;
		void AddError(const opencascade::handle<Message_Alert> & theAlert);

		/****************** AddWarning ******************/
		/**** md5 signature: 53094085790ca6daea4eb2a4ce8de10e ****/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Adds the alert as warning.

Parameters
----------
theAlert: Message_Alert

Returns
-------
None
") AddWarning;
		void AddWarning(const opencascade::handle<Message_Alert> & theAlert);

		/****************** Allocator ******************/
		/**** md5 signature: c2190efebec564fb34d6c8e52682605e ****/
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "Returns allocator.

Returns
-------
opencascade::handle<NCollection_BaseAllocator>
") Allocator;
		const opencascade::handle<NCollection_BaseAllocator> & Allocator();

		/****************** Clear ******************/
		/**** md5 signature: ee228ed41450ea46d6b542478ce426ba ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears all warnings and errors, and any data cached by the algorithm. user defined options are not cleared.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** ClearWarnings ******************/
		/**** md5 signature: 73c3b8280143bf02663ce560b2171c2b ****/
		%feature("compactdefaultargs") ClearWarnings;
		%feature("autodoc", "Clears the warnings of the algorithm.

Returns
-------
None
") ClearWarnings;
		void ClearWarnings();


        %feature("autodoc", "1");
        %extend{
            std::string DumpErrorsToString() {
            std::stringstream s;
            self->DumpErrors(s);
            return s.str();}
        };

        %feature("autodoc", "1");
        %extend{
            std::string DumpWarningsToString() {
            std::stringstream s;
            self->DumpWarnings(s);
            return s.str();}
        };
		/****************** FuzzyValue ******************/
		/**** md5 signature: c7081d612ee5325e18733e215807d19f ****/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Returns the additional tolerance.

Returns
-------
float
") FuzzyValue;
		Standard_Real FuzzyValue();

		/****************** GetParallelMode ******************/
		/**** md5 signature: feaeebd94ff83efc7e77e3c0da668764 ****/
		%feature("compactdefaultargs") GetParallelMode;
		%feature("autodoc", "Gets the global parallel mode.

Returns
-------
bool
") GetParallelMode;
		static Standard_Boolean GetParallelMode();

		/****************** GetReport ******************/
		/**** md5 signature: 58a2006fc09eb4744f2647f5bb6aa259 ****/
		%feature("compactdefaultargs") GetReport;
		%feature("autodoc", "Returns report collecting all errors and warnings.

Returns
-------
opencascade::handle<Message_Report>
") GetReport;
		const opencascade::handle<Message_Report> & GetReport();

		/****************** HasError ******************/
		/**** md5 signature: 16c1e1370b1b00520fec769582a88f3a ****/
		%feature("compactdefaultargs") HasError;
		%feature("autodoc", "Returns true if algorithm has generated error of specified type.

Parameters
----------
theType: Standard_Type

Returns
-------
bool
") HasError;
		Standard_Boolean HasError(const opencascade::handle<Standard_Type> & theType);

		/****************** HasErrors ******************/
		/**** md5 signature: bf718c128e76868673dd300f349b7f68 ****/
		%feature("compactdefaultargs") HasErrors;
		%feature("autodoc", "Returns true if algorithm has failed.

Returns
-------
bool
") HasErrors;
		Standard_Boolean HasErrors();

		/****************** HasWarning ******************/
		/**** md5 signature: f643e1ca521c66e8183b395e733ed0da ****/
		%feature("compactdefaultargs") HasWarning;
		%feature("autodoc", "Returns true if algorithm has generated warning of specified type.

Parameters
----------
theType: Standard_Type

Returns
-------
bool
") HasWarning;
		Standard_Boolean HasWarning(const opencascade::handle<Standard_Type> & theType);

		/****************** HasWarnings ******************/
		/**** md5 signature: 0d7f1d0092f1dca69e861f3bce5f0267 ****/
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "Returns true if algorithm has generated some warning alerts.

Returns
-------
bool
") HasWarnings;
		Standard_Boolean HasWarnings();

		/****************** RunParallel ******************/
		/**** md5 signature: 53cb29f6811f4f276d6c103cc8a9e7e1 ****/
		%feature("compactdefaultargs") RunParallel;
		%feature("autodoc", "Returns the flag of parallel processing.

Returns
-------
bool
") RunParallel;
		Standard_Boolean RunParallel();

		/****************** SetFuzzyValue ******************/
		/**** md5 signature: a6e52c994eeddfce238b90491de5f35c ****/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "Sets the additional tolerance.

Parameters
----------
theFuzz: float

Returns
-------
None
") SetFuzzyValue;
		void SetFuzzyValue(const Standard_Real theFuzz);

		/****************** SetParallelMode ******************/
		/**** md5 signature: b461eee387cc9df4779b32f144c1de40 ****/
		%feature("compactdefaultargs") SetParallelMode;
		%feature("autodoc", "Sets the global parallel mode.

Parameters
----------
theNewMode: bool

Returns
-------
None
") SetParallelMode;
		static void SetParallelMode(const Standard_Boolean theNewMode);

		/****************** SetProgressIndicator ******************/
		/**** md5 signature: ca613a7b4fe230ca118c290f9c27a4cc ****/
		%feature("compactdefaultargs") SetProgressIndicator;
		%feature("autodoc", "Set the progress indicator object.

Parameters
----------
theObj: Message_ProgressIndicator

Returns
-------
None
") SetProgressIndicator;
		void SetProgressIndicator(const opencascade::handle<Message_ProgressIndicator> & theObj);

		/****************** SetRunParallel ******************/
		/**** md5 signature: bf7fbc3e9b126cd865579ef58026ce14 ****/
		%feature("compactdefaultargs") SetRunParallel;
		%feature("autodoc", "Set the flag of parallel processing if <theflag> is true the parallel processing is switched on if <theflag> is false the parallel processing is switched off.

Parameters
----------
theFlag: bool

Returns
-------
None
") SetRunParallel;
		void SetRunParallel(const Standard_Boolean theFlag);

		/****************** SetUseOBB ******************/
		/**** md5 signature: 6d40fa7ee94de6963b0a47968b0c2b35 ****/
		%feature("compactdefaultargs") SetUseOBB;
		%feature("autodoc", "Enables/disables the usage of obb.

Parameters
----------
theUseOBB: bool

Returns
-------
None
") SetUseOBB;
		void SetUseOBB(const Standard_Boolean theUseOBB);

		/****************** UseOBB ******************/
		/**** md5 signature: 439d685e26e7394528c125780fc412da ****/
		%feature("compactdefaultargs") UseOBB;
		%feature("autodoc", "Returns the flag defining usage of obb.

Returns
-------
bool
") UseOBB;
		Standard_Boolean UseOBB();

};


%extend BOPAlgo_Options {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BOPAlgo_SectionAttribute *
*********************************/
class BOPAlgo_SectionAttribute {
	public:
		/****************** BOPAlgo_SectionAttribute ******************/
		/**** md5 signature: d009c63d3a8a919760589f1003ae4986 ****/
		%feature("compactdefaultargs") BOPAlgo_SectionAttribute;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") BOPAlgo_SectionAttribute;
		 BOPAlgo_SectionAttribute();

		/****************** BOPAlgo_SectionAttribute ******************/
		/**** md5 signature: 3d85e8151b6f1576f015e50486ffbe64 ****/
		%feature("compactdefaultargs") BOPAlgo_SectionAttribute;
		%feature("autodoc", "Constructor.

Parameters
----------
theAproximation: bool
thePCurveOnS1: bool
thePCurveOnS2: bool

Returns
-------
None
") BOPAlgo_SectionAttribute;
		 BOPAlgo_SectionAttribute(const Standard_Boolean theAproximation, const Standard_Boolean thePCurveOnS1, const Standard_Boolean thePCurveOnS2);

		/****************** Approximation ******************/
		/**** md5 signature: 0dc0c40b42d72f7fa0d8967d76779a9f ****/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "Sets the approximation flag.

Parameters
----------
theApprox: bool

Returns
-------
None
") Approximation;
		void Approximation(const Standard_Boolean theApprox);

		/****************** Approximation ******************/
		/**** md5 signature: 56d3eec8cfa6eef2526f5faec043653f ****/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "Returns the approximation flag.

Returns
-------
bool
") Approximation;
		Standard_Boolean Approximation();

		/****************** PCurveOnS1 ******************/
		/**** md5 signature: ecc19b7110b044c15c461a8b82ccb0f6 ****/
		%feature("compactdefaultargs") PCurveOnS1;
		%feature("autodoc", "Sets the pcurveons1 flag.

Parameters
----------
thePCurveOnS1: bool

Returns
-------
None
") PCurveOnS1;
		void PCurveOnS1(const Standard_Boolean thePCurveOnS1);

		/****************** PCurveOnS1 ******************/
		/**** md5 signature: 9a1e47121e59cd144b5b6675616ace9c ****/
		%feature("compactdefaultargs") PCurveOnS1;
		%feature("autodoc", "Returns the pcurveons1 flag.

Returns
-------
bool
") PCurveOnS1;
		Standard_Boolean PCurveOnS1();

		/****************** PCurveOnS2 ******************/
		/**** md5 signature: ff2501955a1d5673be11ed993fee2b79 ****/
		%feature("compactdefaultargs") PCurveOnS2;
		%feature("autodoc", "Sets the pcurveons2 flag.

Parameters
----------
thePCurveOnS2: bool

Returns
-------
None
") PCurveOnS2;
		void PCurveOnS2(const Standard_Boolean thePCurveOnS2);

		/****************** PCurveOnS2 ******************/
		/**** md5 signature: 5b774e4d6136cf12a4b36814eaa92d44 ****/
		%feature("compactdefaultargs") PCurveOnS2;
		%feature("autodoc", "Returns the pcurveons2 flag.

Returns
-------
bool
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
		/****************** ClassifyFaces ******************/
		/**** md5 signature: 7a3a4e079fbca663eebea4065ac21345 ****/
		%feature("compactdefaultargs") ClassifyFaces;
		%feature("autodoc", "Classifies the faces <thefaces> relatively solids <thesolids>. the in faces for solids are stored into output data map <theinparts>. //! the map <thesolidsif> contains internal faces of the solids, to avoid their additional classification. //! firstly, it checks the intersection of bounding boxes of the shapes. if the box is not stored in the <theshapeboxmap> map, it builds the box. if the bounding boxes of solid and face are interfering the classification is performed. //! it is assumed that all faces and solids are already intersected and do not have any geometrically coinciding parts without topological sharing of these parts.

Parameters
----------
theFaces: TopTools_ListOfShape
theSolids: TopTools_ListOfShape
theRunParallel: bool
theContext: IntTools_Context
theInParts: TopTools_IndexedDataMapOfShapeListOfShape
theShapeBoxMap: TopTools_DataMapOfShapeBox,optional
	default value is TopTools_DataMapOfShapeBox()
theSolidsIF: TopTools_DataMapOfShapeListOfShape,optional
	default value is TopTools_DataMapOfShapeListOfShape()

Returns
-------
None
") ClassifyFaces;
		static void ClassifyFaces(const TopTools_ListOfShape & theFaces, const TopTools_ListOfShape & theSolids, const Standard_Boolean theRunParallel, opencascade::handle<IntTools_Context> & theContext, TopTools_IndexedDataMapOfShapeListOfShape & theInParts, const TopTools_DataMapOfShapeBox & theShapeBoxMap = TopTools_DataMapOfShapeBox(), const TopTools_DataMapOfShapeListOfShape & theSolidsIF = TopTools_DataMapOfShapeListOfShape());

		/****************** ComputeToleranceOfCB ******************/
		/**** md5 signature: e685c89cf11769ed8a1377be0947b846 ****/
		%feature("compactdefaultargs") ComputeToleranceOfCB;
		%feature("autodoc", "No available documentation.

Parameters
----------
theCB: BOPDS_CommonBlock
theDS: BOPDS_PDS
theContext: IntTools_Context

Returns
-------
float
") ComputeToleranceOfCB;
		static Standard_Real ComputeToleranceOfCB(const opencascade::handle<BOPDS_CommonBlock> & theCB, const BOPDS_PDS theDS, const opencascade::handle<IntTools_Context> & theContext);

		/****************** EdgesToWires ******************/
		/**** md5 signature: e795d71da8d102674043cf89e2807135 ****/
		%feature("compactdefaultargs") EdgesToWires;
		%feature("autodoc", "Creates planar wires from the given edges. the input edges are expected to be planar. and for the performance sake the method does not check if the edges are really planar. thus, the result wires will also be not planar if the input edges are not planar. the edges may be not shared, but the resulting wires will be sharing the coinciding parts and intersecting parts. the output wires may be non-manifold and contain free and multi-connected vertices. parameters: <theedges> - input edges; <thewires> - output wires; <theshared> - boolean flag which defines whether the input edges are already shared or have to be intersected; <theangtol> - the angular tolerance which will be used for distinguishing the planes in which the edges are located. default value is 1.e-8 which is used for intersection of planes in inttools_faceface. method returns the following error statuses: 0 - in case of success (at least one wire has been built); 1 - in case there are no edges in the given shape; 2 - sharing of the edges has failed.

Parameters
----------
theEdges: TopoDS_Shape
theWires: TopoDS_Shape
theShared: bool,optional
	default value is Standard_False
theAngTol: float,optional
	default value is 1e-8

Returns
-------
int
") EdgesToWires;
		static Standard_Integer EdgesToWires(const TopoDS_Shape & theEdges, TopoDS_Shape & theWires, const Standard_Boolean theShared = Standard_False, const Standard_Real theAngTol = 1e-8);

		/****************** FillInternals ******************/
		/**** md5 signature: 114b79f8adcd1665a2acbeeb894b98bb ****/
		%feature("compactdefaultargs") FillInternals;
		%feature("autodoc", "Classifies the given parts relatively the given solids and fills the solids with the parts classified as internal. //! @param thesolids - the solids to put internals to @param theparts - the parts to classify relatively solids @param theimages - possible images of the parts that has to be classified @param thecontext - cashed geometrical tools to speed-up classifications.

Parameters
----------
theSolids: TopTools_ListOfShape
theParts: TopTools_ListOfShape
theImages: TopTools_DataMapOfShapeListOfShape
theContext: IntTools_Context

Returns
-------
None
") FillInternals;
		static void FillInternals(const TopTools_ListOfShape & theSolids, const TopTools_ListOfShape & theParts, const TopTools_DataMapOfShapeListOfShape & theImages, const opencascade::handle<IntTools_Context> & theContext);

		/****************** IntersectVertices ******************/
		/**** md5 signature: d4914d07780a11972f73f6bbf3116baa ****/
		%feature("compactdefaultargs") IntersectVertices;
		%feature("autodoc", "Finds chains of intersecting vertices.

Parameters
----------
theVertices: TopTools_IndexedDataMapOfShapeReal
theFuzzyValue: float
theChains: TopTools_ListOfListOfShape

Returns
-------
None
") IntersectVertices;
		static void IntersectVertices(const TopTools_IndexedDataMapOfShapeReal & theVertices, const Standard_Real theFuzzyValue, TopTools_ListOfListOfShape & theChains);

		/****************** PerformCommonBlocks ******************/
		/**** md5 signature: 399b23698e9567012367f4351d1a8f04 ****/
		%feature("compactdefaultargs") PerformCommonBlocks;
		%feature("autodoc", "Create common blocks from the groups of pave blocks of <themblocks> connection map.

Parameters
----------
theMBlocks: BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock
theAllocator: NCollection_BaseAllocator
theDS: BOPDS_PDS
theContext: IntTools_Context,optional
	default value is opencascade::handle<IntTools_Context>()

Returns
-------
None
") PerformCommonBlocks;
		static void PerformCommonBlocks(BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock & theMBlocks, const opencascade::handle<NCollection_BaseAllocator> & theAllocator, BOPDS_PDS & theDS, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** PerformCommonBlocks ******************/
		/**** md5 signature: b795477e345159b0ed6f4ffbbc4c6f74 ****/
		%feature("compactdefaultargs") PerformCommonBlocks;
		%feature("autodoc", "Create common blocks on faces using the pb->faces connection map <themblocks>.

Parameters
----------
theMBlocks: BOPDS_IndexedDataMapOfPaveBlockListOfInteger
theAllocator: NCollection_BaseAllocator
pDS: BOPDS_PDS
theContext: IntTools_Context,optional
	default value is opencascade::handle<IntTools_Context>()

Returns
-------
None
") PerformCommonBlocks;
		static void PerformCommonBlocks(const BOPDS_IndexedDataMapOfPaveBlockListOfInteger & theMBlocks, const opencascade::handle<NCollection_BaseAllocator> & theAllocator, BOPDS_PDS & pDS, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** TreatCompound ******************/
		/**** md5 signature: b1cc9e0d4e7a7bd0544b9bc0f8d37159 ****/
		%feature("compactdefaultargs") TreatCompound;
		%feature("autodoc", "Collect in the output list recursively all non-compound subshapes of the first level of the given shape thes. if a shape presents in the map themfence it is skipped. all shapes put in the output are also added into themfence.

Parameters
----------
theS: TopoDS_Shape
theMFence: TopTools_MapOfShape
theLS: TopTools_ListOfShape

Returns
-------
None
") TreatCompound;
		static void TreatCompound(const TopoDS_Shape & theS, TopTools_MapOfShape & theMFence, TopTools_ListOfShape & theLS);

		/****************** WiresToFaces ******************/
		/**** md5 signature: 16dc9996c77bddaa892446101a7cb4b5 ****/
		%feature("compactdefaultargs") WiresToFaces;
		%feature("autodoc", "Creates planar faces from given planar wires. the method does not check if the wires are really planar. the input wires may be non-manifold but should be shared. the wires located in the same planes and included into other wires will create holes in the faces built from outer wires. the tolerance values of the input shapes may be modified during the operation due to projection of the edges on the planes for creation of 2d curves. parameters: <thewires> - the given wires; <thefaces> - the output faces; <theangtol> - the angular tolerance for distinguishing the planes in which the wires are located. default value is 1.e-8 which is used for intersection of planes in inttools_faceface. method returns true in case of success, i.e. at least one face has been built.

Parameters
----------
theWires: TopoDS_Shape
theFaces: TopoDS_Shape
theAngTol: float,optional
	default value is 1e-8

Returns
-------
bool
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
	}
};

/****************************
* class BOPAlgo_WireEdgeSet *
****************************/
class BOPAlgo_WireEdgeSet {
	public:
		/****************** BOPAlgo_WireEdgeSet ******************/
		/**** md5 signature: ea26cbe6076f94b3b025b7fe930fa557 ****/
		%feature("compactdefaultargs") BOPAlgo_WireEdgeSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BOPAlgo_WireEdgeSet;
		 BOPAlgo_WireEdgeSet();

		/****************** BOPAlgo_WireEdgeSet ******************/
		/**** md5 signature: d5706b19a4e41f85b2410340b2a1f3b4 ****/
		%feature("compactdefaultargs") BOPAlgo_WireEdgeSet;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPAlgo_WireEdgeSet;
		 BOPAlgo_WireEdgeSet(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** AddShape ******************/
		/**** md5 signature: e2f1c05bc83d83e844b57971adeb089a ****/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
sS: TopoDS_Shape

Returns
-------
None
") AddShape;
		void AddShape(const TopoDS_Shape & sS);

		/****************** AddStartElement ******************/
		/**** md5 signature: c6623538c007f9731413da5cb7eb7f1b ****/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
sS: TopoDS_Shape

Returns
-------
None
") AddStartElement;
		void AddStartElement(const TopoDS_Shape & sS);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** SetFace ******************/
		/**** md5 signature: b689a8f4d5c8b24783cd7ff1ee539b06 ****/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
aF: TopoDS_Face

Returns
-------
None
") SetFace;
		void SetFace(const TopoDS_Face & aF);

		/****************** Shapes ******************/
		/**** md5 signature: bd11cb23d06c39c15707d62c9b6c054e ****/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") Shapes;
		const TopTools_ListOfShape & Shapes();

		/****************** StartElements ******************/
		/**** md5 signature: 4df71127781e1f235af21a1e6e23cfbe ****/
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
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
		/****************** Perform ******************/
		/**** md5 signature: e23b98e5ba6fc1b2692a5d6fc76fd990 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		virtual void Perform();

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
		/****************** BOPAlgo_MakeConnected ******************/
		/**** md5 signature: b6b80e8925410141807a3d11286b03bf ****/
		%feature("compactdefaultargs") BOPAlgo_MakeConnected;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BOPAlgo_MakeConnected;
		 BOPAlgo_MakeConnected();

		/****************** AddArgument ******************/
		/**** md5 signature: 11101b8c38f2080ebb6a92f924c1e316 ****/
		%feature("compactdefaultargs") AddArgument;
		%feature("autodoc", "Adds the shape to the arguments. @param thes [in] one of the argument shapes.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
None
") AddArgument;
		void AddArgument(const TopoDS_Shape & theS);

		/****************** Arguments ******************/
		/**** md5 signature: 5c44416d889811943ccde89673d3c270 ****/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Returns the list of arguments of the operation.

Returns
-------
TopTools_ListOfShape
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****************** Clear ******************/
		/**** md5 signature: 75abd67f132413fc11c19201aabf1126 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the contents of the algorithm.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ClearRepetitions ******************/
		/**** md5 signature: 1c0185ac8e9e0e24db025dcc70e76ee3 ****/
		%feature("compactdefaultargs") ClearRepetitions;
		%feature("autodoc", "Clears the repetitions performed on the periodic shape, keeping the shape periodic.

Returns
-------
None
") ClearRepetitions;
		void ClearRepetitions();

		/****************** GetModified ******************/
		/**** md5 signature: 67b726d6ad41609c9d81facb302563d9 ****/
		%feature("compactdefaultargs") GetModified;
		%feature("autodoc", "Returns the list of shapes modified from the given shape. @param thes [in] the shape for which the modified shapes are necessary.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") GetModified;
		const TopTools_ListOfShape & GetModified(const TopoDS_Shape & theS);

		/****************** GetOrigins ******************/
		/**** md5 signature: 7db29e58de3213ff94b819ac6e61a362 ****/
		%feature("compactdefaultargs") GetOrigins;
		%feature("autodoc", "Returns the list of original shapes from which the current shape has been created. @param thes [in] the shape for which the origins are necessary.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") GetOrigins;
		const TopTools_ListOfShape & GetOrigins(const TopoDS_Shape & theS);

		/****************** History ******************/
		/**** md5 signature: 773151b712351341bc4cedd074c69f00 ****/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Returns the history of operations.

Returns
-------
opencascade::handle<BRepTools_History>
") History;
		const opencascade::handle<BRepTools_History> & History();

		/****************** MakePeriodic ******************/
		/**** md5 signature: fa6a1689dfb3f4346cf8892a55e9eab9 ****/
		%feature("compactdefaultargs") MakePeriodic;
		%feature("autodoc", "Makes the connected shape periodic. repeated calls of this method overwrite the previous calls working with the basis connected shape. @param theparams [in] periodic options.

Parameters
----------
theParams: BOPAlgo_MakePeriodic::PeriodicityParams

Returns
-------
None
") MakePeriodic;
		void MakePeriodic(const BOPAlgo_MakePeriodic::PeriodicityParams & theParams);

		/****************** MaterialsOnNegativeSide ******************/
		/**** md5 signature: 5f6193d727b8ebf6a2769408a4b22a5c ****/
		%feature("compactdefaultargs") MaterialsOnNegativeSide;
		%feature("autodoc", "Returns the original shapes which images contain the the given shape with reversed orientation. @param thes [in] the shape for which the materials are necessary.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") MaterialsOnNegativeSide;
		const TopTools_ListOfShape & MaterialsOnNegativeSide(const TopoDS_Shape & theS);

		/****************** MaterialsOnPositiveSide ******************/
		/**** md5 signature: 08f98025f671410be24c9e1ce19c2d94 ****/
		%feature("compactdefaultargs") MaterialsOnPositiveSide;
		%feature("autodoc", "Returns the original shapes which images contain the the given shape with forward orientation. @param thes [in] the shape for which the materials are necessary.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") MaterialsOnPositiveSide;
		const TopTools_ListOfShape & MaterialsOnPositiveSide(const TopoDS_Shape & theS);

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the operation, i.e. makes the input shapes connected.

Returns
-------
None
") Perform;
		void Perform();

		/****************** PeriodicShape ******************/
		/**** md5 signature: 0cadd972cbc9b05f82bfa5506c7cee42 ****/
		%feature("compactdefaultargs") PeriodicShape;
		%feature("autodoc", "Returns the resulting periodic & repeated shape.

Returns
-------
TopoDS_Shape
") PeriodicShape;
		const TopoDS_Shape PeriodicShape();

		/****************** PeriodicityTool ******************/
		/**** md5 signature: 73b35be00edb65bd2ce0a4bea38ba204 ****/
		%feature("compactdefaultargs") PeriodicityTool;
		%feature("autodoc", "Returns the periodicity tool.

Returns
-------
BOPAlgo_MakePeriodic
") PeriodicityTool;
		const BOPAlgo_MakePeriodic & PeriodicityTool();

		/****************** RepeatShape ******************/
		/**** md5 signature: c36e05cb1b309b9ad4d6a379dec723ed ****/
		%feature("compactdefaultargs") RepeatShape;
		%feature("autodoc", "Performs repetition of the periodic shape in specified direction required number of times. @param thedirectionid [in] the direction's id (0 for x, 1 for y, 2 for z); @param thetimes [in] requested number of repetitions (sign of the value defines  the side of the repetition direction (positive or negative)).

Parameters
----------
theDirectionID: int
theTimes: int

Returns
-------
None
") RepeatShape;
		void RepeatShape(const Standard_Integer theDirectionID, const Standard_Integer theTimes);

		/****************** SetArguments ******************/
		/**** md5 signature: c11327ccf7873847aaf3c9f2c70f6eeb ****/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "Sets the shape for making them connected. @param theargs [in] the arguments for the operation.

Parameters
----------
theArgs: TopTools_ListOfShape

Returns
-------
None
") SetArguments;
		void SetArguments(const TopTools_ListOfShape & theArgs);

		/****************** Shape ******************/
		/**** md5 signature: 1058569f5d639354fedf11e73741b7df ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the resulting connected shape.

Returns
-------
TopoDS_Shape
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
		/****************** BOPAlgo_MakePeriodic ******************/
		/**** md5 signature: 4d5c6c6476f6d1dac6cdff8dacf51577 ****/
		%feature("compactdefaultargs") BOPAlgo_MakePeriodic;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BOPAlgo_MakePeriodic;
		 BOPAlgo_MakePeriodic();

		/****************** Clear ******************/
		/**** md5 signature: 75abd67f132413fc11c19201aabf1126 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the algorithm from previous runs.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ClearRepetitions ******************/
		/**** md5 signature: edf6e1354024889c605c1f3c39cbe513 ****/
		%feature("compactdefaultargs") ClearRepetitions;
		%feature("autodoc", "Clears all performed repetitions. the next repetition will be performed on the base shape.

Returns
-------
None
") ClearRepetitions;
		void ClearRepetitions();

		/****************** GetTwins ******************/
		/**** md5 signature: 7acec2f72b7c127c74cb7b8ac498de87 ****/
		%feature("compactdefaultargs") GetTwins;
		%feature("autodoc", "Returns the identical shapes for the given shape located on the opposite periodic side. returns empty list in case the shape has no twin. //! @param thes [in] shape to get the twins for.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") GetTwins;
		const TopTools_ListOfShape & GetTwins(const TopoDS_Shape & theS);

		/****************** History ******************/
		/**** md5 signature: 773151b712351341bc4cedd074c69f00 ****/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Returns the history of the algorithm.

Returns
-------
opencascade::handle<BRepTools_History>
") History;
		const opencascade::handle<BRepTools_History> & History();

		/****************** IsInputTrimmed ******************/
		/**** md5 signature: 11de85435b7b5fa036606d9ce3973d08 ****/
		%feature("compactdefaultargs") IsInputTrimmed;
		%feature("autodoc", "Returns whether the input shape was trimmed in the specified direction. @param thedirectionid [in] the direction's id.

Parameters
----------
theDirectionID: int

Returns
-------
bool
") IsInputTrimmed;
		Standard_Boolean IsInputTrimmed(const Standard_Integer theDirectionID);

		/****************** IsInputXTrimmed ******************/
		/**** md5 signature: 51fa4172f8e0eb40911b355e9680f28b ****/
		%feature("compactdefaultargs") IsInputXTrimmed;
		%feature("autodoc", "Returns whether the input shape was already trimmed for x period.

Returns
-------
bool
") IsInputXTrimmed;
		Standard_Boolean IsInputXTrimmed();

		/****************** IsInputYTrimmed ******************/
		/**** md5 signature: 60b80ff8725cbf223315f7aff8a660dc ****/
		%feature("compactdefaultargs") IsInputYTrimmed;
		%feature("autodoc", "Returns whether the input shape was already trimmed for y period.

Returns
-------
bool
") IsInputYTrimmed;
		Standard_Boolean IsInputYTrimmed();

		/****************** IsInputZTrimmed ******************/
		/**** md5 signature: 1685b26b2863b1acec7025e907e61ef4 ****/
		%feature("compactdefaultargs") IsInputZTrimmed;
		%feature("autodoc", "Returns whether the input shape was already trimmed for z period.

Returns
-------
bool
") IsInputZTrimmed;
		Standard_Boolean IsInputZTrimmed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: bb8156b1e5d3c79256f3967acd61f561 ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns the info about periodicity of the shape in specified direction. @param thedirectionid [in] the direction's id.

Parameters
----------
theDirectionID: int

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic(const Standard_Integer theDirectionID);

		/****************** IsXPeriodic ******************/
		/**** md5 signature: 825125bcd6f4a4228724ba85e488f68a ****/
		%feature("compactdefaultargs") IsXPeriodic;
		%feature("autodoc", "Returns the info about periodicity of the shape in x direction.

Returns
-------
bool
") IsXPeriodic;
		Standard_Boolean IsXPeriodic();

		/****************** IsYPeriodic ******************/
		/**** md5 signature: bdf89adf6728f519216976b7f49a9c82 ****/
		%feature("compactdefaultargs") IsYPeriodic;
		%feature("autodoc", "Returns the info about periodicity of the shape in y direction.

Returns
-------
bool
") IsYPeriodic;
		Standard_Boolean IsYPeriodic();

		/****************** IsZPeriodic ******************/
		/**** md5 signature: 733ec7d6f8ce6b2035b30a926ed50f26 ****/
		%feature("compactdefaultargs") IsZPeriodic;
		%feature("autodoc", "Returns the info about periodicity of the shape in z direction.

Returns
-------
bool
") IsZPeriodic;
		Standard_Boolean IsZPeriodic();

		/****************** MakePeriodic ******************/
		/**** md5 signature: c4286c9a3e55c3953b69faa375b6e1b3 ****/
		%feature("compactdefaultargs") MakePeriodic;
		%feature("autodoc", "Sets the flag to make the shape periodic in specified direction: - 0 - x direction; - 1 - y direction; - 2 - z direction. //! @param thedirectionid [in] the direction's id; @param theisperiodic [in] flag defining periodicity in given direction; @param theperiod [in] required period in given direction.

Parameters
----------
theDirectionID: int
theIsPeriodic: bool
thePeriod: float,optional
	default value is 0.0

Returns
-------
None
") MakePeriodic;
		void MakePeriodic(const Standard_Integer theDirectionID, const Standard_Boolean theIsPeriodic, const Standard_Real thePeriod = 0.0);

		/****************** MakeXPeriodic ******************/
		/**** md5 signature: df3376e9d459c637fa867e10c13236ef ****/
		%feature("compactdefaultargs") MakeXPeriodic;
		%feature("autodoc", "Sets the flag to make the shape periodic in x direction. @param theisperiodic [in] flag defining periodicity in x direction; @param theperiod [in] required period in x direction.

Parameters
----------
theIsPeriodic: bool
thePeriod: float,optional
	default value is 0.0

Returns
-------
None
") MakeXPeriodic;
		void MakeXPeriodic(const Standard_Boolean theIsPeriodic, const Standard_Real thePeriod = 0.0);

		/****************** MakeYPeriodic ******************/
		/**** md5 signature: 8e8ca05d15522a37581c6613d7770566 ****/
		%feature("compactdefaultargs") MakeYPeriodic;
		%feature("autodoc", "Sets the flag to make the shape periodic in y direction. @param theisperiodic [in] flag defining periodicity in y direction; @param theperiod [in] required period in y direction.

Parameters
----------
theIsPeriodic: bool
thePeriod: float,optional
	default value is 0.0

Returns
-------
None
") MakeYPeriodic;
		void MakeYPeriodic(const Standard_Boolean theIsPeriodic, const Standard_Real thePeriod = 0.0);

		/****************** MakeZPeriodic ******************/
		/**** md5 signature: 6c09987fe2927a09f6f4d0ae3f02d323 ****/
		%feature("compactdefaultargs") MakeZPeriodic;
		%feature("autodoc", "Sets the flag to make the shape periodic in z direction. @param theisperiodic [in] flag defining periodicity in z direction; @param theperiod [in] required period in z direction.

Parameters
----------
theIsPeriodic: bool
thePeriod: float,optional
	default value is 0.0

Returns
-------
None
") MakeZPeriodic;
		void MakeZPeriodic(const Standard_Boolean theIsPeriodic, const Standard_Real thePeriod = 0.0);

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Makes the shape periodic in necessary directions.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Period ******************/
		/**** md5 signature: 905dfc700c6784284a2257479c7ec087 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Returns the period of the shape in specified direction. @param thedirectionid [in] the direction's id.

Parameters
----------
theDirectionID: int

Returns
-------
float
") Period;
		Standard_Real Period(const Standard_Integer theDirectionID);

		/****************** PeriodFirst ******************/
		/**** md5 signature: 65b281fb9f7dc9e2c35e5feaad2bfddf ****/
		%feature("compactdefaultargs") PeriodFirst;
		%feature("autodoc", "Returns the first periodic parameter in the specified direction. @param thedirectionid [in] the direction's id.

Parameters
----------
theDirectionID: int

Returns
-------
float
") PeriodFirst;
		Standard_Real PeriodFirst(const Standard_Integer theDirectionID);

		/****************** PeriodicityParameters ******************/
		/**** md5 signature: 056ef0516517eb60320d576453827503 ****/
		%feature("compactdefaultargs") PeriodicityParameters;
		%feature("autodoc", "No available documentation.

Returns
-------
BOPAlgo_MakePeriodic::PeriodicityParams
") PeriodicityParameters;
		BOPAlgo_MakePeriodic::PeriodicityParams PeriodicityParameters();

		/****************** RepeatShape ******************/
		/**** md5 signature: 498d51ce623dcf5bdb9974585637d231 ****/
		%feature("compactdefaultargs") RepeatShape;
		%feature("autodoc", "Performs repetition of the shape in specified direction required number of times. negative value of times means that the repetition should be perform in negative direction. makes the repeated shape a base for following repetitions. //! @param thedirectionid [in] the direction's id; @param thetimes [in] requested number of repetitions.

Parameters
----------
theDirectionID: int
theTimes: int

Returns
-------
TopoDS_Shape
") RepeatShape;
		const TopoDS_Shape RepeatShape(const Standard_Integer theDirectionID, const Standard_Integer theTimes);

		/****************** RepeatedShape ******************/
		/**** md5 signature: bc344bbb89766dbca655721d874cfcd6 ****/
		%feature("compactdefaultargs") RepeatedShape;
		%feature("autodoc", "Returns the repeated shape.

Returns
-------
TopoDS_Shape
") RepeatedShape;
		const TopoDS_Shape RepeatedShape();

		/****************** SetPeriodicityParameters ******************/
		/**** md5 signature: 0952cf9752b01bf7cfc1d3d1baacf266 ****/
		%feature("compactdefaultargs") SetPeriodicityParameters;
		%feature("autodoc", "Sets the periodicity parameters. @param theparams [in] periodicity parameters.

Parameters
----------
theParams: PeriodicityParams

Returns
-------
None
") SetPeriodicityParameters;
		void SetPeriodicityParameters(PeriodicityParams theParams);

		/****************** SetShape ******************/
		/**** md5 signature: 927e2ebe2fb5354dfb3da3c53e512cad ****/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Sets the shape to make it periodic. @param theshape [in] the shape to make periodic.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

		/****************** SetTrimmed ******************/
		/**** md5 signature: 36ad2721a8f03216522c13264ed2d5ec ****/
		%feature("compactdefaultargs") SetTrimmed;
		%feature("autodoc", "Defines whether the input shape is already trimmed in specified direction to fit the period in this direction. direction is defined by an id: - 0 - x direction; - 1 - y direction; - 2 - z direction. //! if the shape is not trimmed it is required to set the first parameter of the period in that direction. the algorithm will make the shape fit into the period. //! before calling this method, the shape has to be set to be periodic in this direction. //! @param thedirectionid [in] the direction's id; @param theistrimmed [in] the flag defining trimming of the shape in given direction; @param thefirst [in] the first periodic parameter in the given direction.

Parameters
----------
theDirectionID: int
theIsTrimmed: bool
theFirst: float,optional
	default value is 0.0

Returns
-------
None
") SetTrimmed;
		void SetTrimmed(const Standard_Integer theDirectionID, const Standard_Boolean theIsTrimmed, const Standard_Real theFirst = 0.0);

		/****************** SetXTrimmed ******************/
		/**** md5 signature: 81bbfd4b7a5f26b85a82d52dc5af0149 ****/
		%feature("compactdefaultargs") SetXTrimmed;
		%feature("autodoc", "Defines whether the input shape is already trimmed in x direction to fit the x period. if the shape is not trimmed it is required to set the first parameter for the x period. the algorithm will make the shape fit into the period. //! before calling this method, the shape has to be set to be periodic in this direction. //! @param theistrimmed [in] flag defining whether the shape is already trimmed  in x direction to fit the x period; @param thefirst [in] the first x periodic parameter.

Parameters
----------
theIsTrimmed: bool
theFirst: bool,optional
	default value is 0.0

Returns
-------
None
") SetXTrimmed;
		void SetXTrimmed(const Standard_Boolean theIsTrimmed, const Standard_Boolean theFirst = 0.0);

		/****************** SetYTrimmed ******************/
		/**** md5 signature: 93fc3f210273049407ff8a8e1e7c3166 ****/
		%feature("compactdefaultargs") SetYTrimmed;
		%feature("autodoc", "Defines whether the input shape is already trimmed in y direction to fit the y period. if the shape is not trimmed it is required to set the first parameter for the y period. the algorithm will make the shape fit into the period. //! before calling this method, the shape has to be set to be periodic in this direction. //! @param theistrimmed [in] flag defining whether the shape is already trimmed  in y direction to fit the y period; @param thefirst [in] the first y periodic parameter.

Parameters
----------
theIsTrimmed: bool
theFirst: bool,optional
	default value is 0.0

Returns
-------
None
") SetYTrimmed;
		void SetYTrimmed(const Standard_Boolean theIsTrimmed, const Standard_Boolean theFirst = 0.0);

		/****************** SetZTrimmed ******************/
		/**** md5 signature: 45d195d98801cadb6112962160157fe8 ****/
		%feature("compactdefaultargs") SetZTrimmed;
		%feature("autodoc", "Defines whether the input shape is already trimmed in z direction to fit the z period. if the shape is not trimmed it is required to set the first parameter for the z period. the algorithm will make the shape fit into the period. //! before calling this method, the shape has to be set to be periodic in this direction. //! @param theistrimmed [in] flag defining whether the shape is already trimmed  in z direction to fit the z period; @param thefirst [in] the first z periodic parameter.

Parameters
----------
theIsTrimmed: bool
theFirst: bool,optional
	default value is 0.0

Returns
-------
None
") SetZTrimmed;
		void SetZTrimmed(const Standard_Boolean theIsTrimmed, const Standard_Boolean theFirst = 0.0);

		/****************** Shape ******************/
		/**** md5 signature: 1058569f5d639354fedf11e73741b7df ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the resulting periodic shape.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** ToDirectionID ******************/
		/**** md5 signature: 93eb37961bf75f72a1ed4293ff2f6860 ****/
		%feature("compactdefaultargs") ToDirectionID;
		%feature("autodoc", "Converts the integer to id of periodic direction.

Parameters
----------
theDirectionID: int

Returns
-------
int
") ToDirectionID;
		static Standard_Integer ToDirectionID(const Standard_Integer theDirectionID);

		/****************** XPeriod ******************/
		/**** md5 signature: 6dd89ec7e807f05a40688e7c6a838896 ****/
		%feature("compactdefaultargs") XPeriod;
		%feature("autodoc", "Returns the xperiod of the shape.

Returns
-------
float
") XPeriod;
		Standard_Real XPeriod();

		/****************** XPeriodFirst ******************/
		/**** md5 signature: a02688bedcf5f9cc9871b6ab26e1dbae ****/
		%feature("compactdefaultargs") XPeriodFirst;
		%feature("autodoc", "Returns the first parameter for the x period.

Returns
-------
float
") XPeriodFirst;
		Standard_Real XPeriodFirst();

		/****************** XRepeat ******************/
		/**** md5 signature: 703940b883cbd562fdffcc37a48373f9 ****/
		%feature("compactdefaultargs") XRepeat;
		%feature("autodoc", "Repeats the shape in x direction specified number of times. negative value of times means that the repetition should be perform in negative x direction. makes the repeated shape a base for following repetitions. //! @param thetimes [in] requested number of repetitions.

Parameters
----------
theTimes: int

Returns
-------
TopoDS_Shape
") XRepeat;
		const TopoDS_Shape XRepeat(const Standard_Integer theTimes);

		/****************** YPeriod ******************/
		/**** md5 signature: 52af3073f75d0fcc2884913777c9c0c1 ****/
		%feature("compactdefaultargs") YPeriod;
		%feature("autodoc", "Returns the yperiod of the shape.

Returns
-------
float
") YPeriod;
		Standard_Real YPeriod();

		/****************** YPeriodFirst ******************/
		/**** md5 signature: 793e8a60b882882c47265a4c35326e0e ****/
		%feature("compactdefaultargs") YPeriodFirst;
		%feature("autodoc", "Returns the first parameter for the y period.

Returns
-------
float
") YPeriodFirst;
		Standard_Real YPeriodFirst();

		/****************** YRepeat ******************/
		/**** md5 signature: ad506731f1c56bec1f509d4f39f93df1 ****/
		%feature("compactdefaultargs") YRepeat;
		%feature("autodoc", "Repeats the shape in y direction specified number of times. negative value of times means that the repetition should be perform in negative y direction. makes the repeated shape a base for following repetitions. //! @param thetimes [in] requested number of repetitions.

Parameters
----------
theTimes: int

Returns
-------
TopoDS_Shape
") YRepeat;
		const TopoDS_Shape YRepeat(const Standard_Integer theTimes);

		/****************** ZPeriod ******************/
		/**** md5 signature: ea552fd4bc539be2e22f25f495cc2938 ****/
		%feature("compactdefaultargs") ZPeriod;
		%feature("autodoc", "Returns the zperiod of the shape.

Returns
-------
float
") ZPeriod;
		Standard_Real ZPeriod();

		/****************** ZPeriodFirst ******************/
		/**** md5 signature: 75ea8dea98ac01ca4dd73841cb16f368 ****/
		%feature("compactdefaultargs") ZPeriodFirst;
		%feature("autodoc", "Returns the first parameter for the z period.

Returns
-------
float
") ZPeriodFirst;
		Standard_Real ZPeriodFirst();

		/****************** ZRepeat ******************/
		/**** md5 signature: 1b9e96904de0881a1a4d7b9b6fd78839 ****/
		%feature("compactdefaultargs") ZRepeat;
		%feature("autodoc", "Repeats the shape in z direction specified number of times. negative value of times means that the repetition should be perform in negative z direction. makes the repeated shape a base for following repetitions. //! @param thetimes [in] requested number of repetitions.

Parameters
----------
theTimes: int

Returns
-------
TopoDS_Shape
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
		/****************** BOPAlgo_ArgumentAnalyzer ******************/
		/**** md5 signature: 9f14477a10a2e7722471042579c763b6 ****/
		%feature("compactdefaultargs") BOPAlgo_ArgumentAnalyzer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
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
		/****************** GetCheckResult ******************/
		/**** md5 signature: ab448040cd97688d236e23189cee34b9 ****/
		%feature("compactdefaultargs") GetCheckResult;
		%feature("autodoc", "Returns a result of test.

Returns
-------
BOPAlgo_ListOfCheckResult
") GetCheckResult;
		const BOPAlgo_ListOfCheckResult & GetCheckResult();

		/****************** GetShape1 ******************/
		/**** md5 signature: da65271fea68f494586b07012e23b4bb ****/
		%feature("compactdefaultargs") GetShape1;
		%feature("autodoc", "Returns object shape;.

Returns
-------
TopoDS_Shape
") GetShape1;
		const TopoDS_Shape GetShape1();

		/****************** GetShape2 ******************/
		/**** md5 signature: ad646522ebe6de8820d9424e4f21edb9 ****/
		%feature("compactdefaultargs") GetShape2;
		%feature("autodoc", "Returns tool shape.

Returns
-------
TopoDS_Shape
") GetShape2;
		const TopoDS_Shape GetShape2();

		/****************** HasFaulty ******************/
		/**** md5 signature: 4e2d963ca1680b1be6c5917993c51870 ****/
		%feature("compactdefaultargs") HasFaulty;
		%feature("autodoc", "Result of test.

Returns
-------
bool
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
		/****************** OperationType ******************/
		/**** md5 signature: 738397fdac6453814ea85c4462f40440 ****/
		%feature("compactdefaultargs") OperationType;
		%feature("autodoc", "Returns ref.

Returns
-------
BOPAlgo_Operation
") OperationType;
		BOPAlgo_Operation  OperationType();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs analysis.

Returns
-------
None
") Perform;
		void Perform();


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
		/****************** SetShape1 ******************/
		/**** md5 signature: 32d06bb8d221a179d322a30597a4d6c8 ****/
		%feature("compactdefaultargs") SetShape1;
		%feature("autodoc", "Sets object shape.

Parameters
----------
TheShape: TopoDS_Shape

Returns
-------
None
") SetShape1;
		void SetShape1(const TopoDS_Shape & TheShape);

		/****************** SetShape2 ******************/
		/**** md5 signature: 872074f224a41d220ff8f15ed451c9ac ****/
		%feature("compactdefaultargs") SetShape2;
		%feature("autodoc", "Sets tool shape.

Parameters
----------
TheShape: TopoDS_Shape

Returns
-------
None
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
		/****************** Areas ******************/
		/**** md5 signature: 25d90180c64c3e47d9200443b7a9d0e2 ****/
		%feature("compactdefaultargs") Areas;
		%feature("autodoc", "Returns the found areas.

Returns
-------
TopTools_ListOfShape
") Areas;
		const TopTools_ListOfShape & Areas();

		/****************** IsAvoidInternalShapes ******************/
		/**** md5 signature: 8a7b9501581d682ae84b1516b6d067be ****/
		%feature("compactdefaultargs") IsAvoidInternalShapes;
		%feature("autodoc", "Returns the avoidinternalshapes flag.

Returns
-------
bool
") IsAvoidInternalShapes;
		Standard_Boolean IsAvoidInternalShapes();

		/****************** Loops ******************/
		/**** md5 signature: 28c8d70c5f0b2679616b2e020052a004 ****/
		%feature("compactdefaultargs") Loops;
		%feature("autodoc", "Returns the found loops.

Returns
-------
TopTools_ListOfShape
") Loops;
		const TopTools_ListOfShape & Loops();

		/****************** SetAvoidInternalShapes ******************/
		/**** md5 signature: d4ee80659b0195413556579790baf956 ****/
		%feature("compactdefaultargs") SetAvoidInternalShapes;
		%feature("autodoc", "Defines the preventing of addition of internal parts into result. the default value is false, i.e. the internal parts are added into result.

Parameters
----------
theAvoidInternal: bool

Returns
-------
None
") SetAvoidInternalShapes;
		void SetAvoidInternalShapes(const Standard_Boolean theAvoidInternal);

		/****************** SetContext ******************/
		/**** md5 signature: 45a35eea8f4e3016f544e19c60ac3b92 ****/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets the context for the algorithms.

Parameters
----------
theContext: IntTools_Context

Returns
-------
None
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & theContext);

		/****************** SetShapes ******************/
		/**** md5 signature: 7e1ffc178f673e4a1bd556c32957daf6 ****/
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", "Sets the shapes for building areas.

Parameters
----------
theLS: TopTools_ListOfShape

Returns
-------
None
") SetShapes;
		void SetShapes(const TopTools_ListOfShape & theLS);

		/****************** Shapes ******************/
		/**** md5 signature: 2884193c58152e0cda5e99b2900fdc8e ****/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "Returns the input shapes.

Returns
-------
TopTools_ListOfShape
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
		/****************** Generated ******************/
		/**** md5 signature: 7ef86753d8f2afb4fbf4e1d513ada706 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape thes.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & theS);

		/****************** HasDeleted ******************/
		/**** md5 signature: d1376e4451370e5ff6d8e8d03d766bcb ****/
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "Returns true if any of the input shapes has been deleted during operation.

Returns
-------
bool
") HasDeleted;
		Standard_Boolean HasDeleted();

		/****************** HasGenerated ******************/
		/**** md5 signature: ff1185ae4caf1307e4399403e704df0a ****/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "Returns true if any of the input shapes has generated shapes during operation.

Returns
-------
bool
") HasGenerated;
		Standard_Boolean HasGenerated();

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
		/**** md5 signature: 5aa09ad744ac71dd47a6ec381a33bc9b ****/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "Returns true if any of the input shapes has been modified during operation.

Returns
-------
bool
") HasModified;
		Standard_Boolean HasModified();

		/****************** History ******************/
		/**** md5 signature: 1926fba5b3ef6c8825eef7dc63e4c382 ****/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "History tool.

Returns
-------
opencascade::handle<BRepTools_History>
") History;
		opencascade::handle<BRepTools_History> History();

		/****************** IsDeleted ******************/
		/**** md5 signature: c9a78c4cfde40b7040a0809bf3392d0a ****/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Returns true if the shape thes has been deleted. in this case the shape will have no modified elements, but can have generated elements.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		Standard_Boolean IsDeleted(const TopoDS_Shape & theS);

		/****************** Modified ******************/
		/**** md5 signature: 3627cf8d69b07cd5db7ba10195303d15 ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape thes.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		const TopTools_ListOfShape & Modified(const TopoDS_Shape & theS);

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

		/****************** Shape ******************/
		/**** md5 signature: 1058569f5d639354fedf11e73741b7df ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the result of algorithm.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

};


%extend BOPAlgo_BuilderShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BOPAlgo_PaveFiller *
***************************/
class BOPAlgo_PaveFiller : public BOPAlgo_Algo {
	public:
		/****************** BOPAlgo_PaveFiller ******************/
		/**** md5 signature: 695e98dd6d964c29b51abadeedf2b1c7 ****/
		%feature("compactdefaultargs") BOPAlgo_PaveFiller;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BOPAlgo_PaveFiller;
		 BOPAlgo_PaveFiller();

		/****************** BOPAlgo_PaveFiller ******************/
		/**** md5 signature: 44433ddc985c762a918888031b5c5257 ****/
		%feature("compactdefaultargs") BOPAlgo_PaveFiller;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPAlgo_PaveFiller;
		 BOPAlgo_PaveFiller(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** AddArgument ******************/
		/**** md5 signature: 0ff8514ebea7960acbeb6ec826621ca9 ****/
		%feature("compactdefaultargs") AddArgument;
		%feature("autodoc", "Adds the argument for operation.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") AddArgument;
		void AddArgument(const TopoDS_Shape & theShape);

		/****************** Arguments ******************/
		/**** md5 signature: 5c44416d889811943ccde89673d3c270 ****/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Returns the list of arguments.

Returns
-------
TopTools_ListOfShape
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****************** Context ******************/
		/**** md5 signature: 61a08d8ec3c36cb7537272ccd635f363 ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IntTools_Context>
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****************** DS ******************/
		/**** md5 signature: 87987374a37a857a957303627823fdb1 ****/
		%feature("compactdefaultargs") DS;
		%feature("autodoc", "No available documentation.

Returns
-------
BOPDS_DS
") DS;
		const BOPDS_DS & DS();

		/****************** Glue ******************/
		/**** md5 signature: 19ce0746754d61539c274454d7b6b9dd ****/
		%feature("compactdefaultargs") Glue;
		%feature("autodoc", "Returns the glue option of the algorithm.

Returns
-------
BOPAlgo_GlueEnum
") Glue;
		BOPAlgo_GlueEnum Glue();

		/****************** IsAvoidBuildPCurve ******************/
		/**** md5 signature: 99defd1abf1a714ec45f36a73ab8e479 ****/
		%feature("compactdefaultargs") IsAvoidBuildPCurve;
		%feature("autodoc", "Returns the flag to avoid building of p-curves of edges on faces.

Returns
-------
bool
") IsAvoidBuildPCurve;
		Standard_Boolean IsAvoidBuildPCurve();

		/****************** NonDestructive ******************/
		/**** md5 signature: a86af6798e7fda924d6a75c2fa9ebb4e ****/
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "Returns the flag that defines the mode of treatment. in non-destructive mode the argument shapes are not modified. instead a copy of a sub-shape is created in the result if it is needed to be updated.

Returns
-------
bool
") NonDestructive;
		Standard_Boolean NonDestructive();

		/****************** PDS ******************/
		/**** md5 signature: 420dd37c2c265b3b9f0a2eefd4b48c5a ****/
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "No available documentation.

Returns
-------
BOPDS_PDS
") PDS;
		BOPDS_PDS PDS();

		/****************** Perform ******************/
		/**** md5 signature: d73234ef092f057e6680afbd2a273a2a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		virtual void Perform();

		/****************** SetArguments ******************/
		/**** md5 signature: c8050caf960534f7d5c8a2cd210eb861 ****/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "Sets the arguments for operation.

Parameters
----------
theLS: TopTools_ListOfShape

Returns
-------
None
") SetArguments;
		void SetArguments(const TopTools_ListOfShape & theLS);

		/****************** SetAvoidBuildPCurve ******************/
		/**** md5 signature: c3a78bac52d326c32b1cabef045578ae ****/
		%feature("compactdefaultargs") SetAvoidBuildPCurve;
		%feature("autodoc", "Sets the flag to avoid building of p-curves of edges on faces.

Parameters
----------
theValue: bool

Returns
-------
None
") SetAvoidBuildPCurve;
		void SetAvoidBuildPCurve(const Standard_Boolean theValue);

		/****************** SetGlue ******************/
		/**** md5 signature: 772d2dee7d8b078f8e12daf13dc476d6 ****/
		%feature("compactdefaultargs") SetGlue;
		%feature("autodoc", "Sets the glue option for the algorithm.

Parameters
----------
theGlue: BOPAlgo_GlueEnum

Returns
-------
None
") SetGlue;
		void SetGlue(const BOPAlgo_GlueEnum theGlue);

		/****************** SetNonDestructive ******************/
		/**** md5 signature: a1a916959b0fbc23c0d8bd3935bb1670 ****/
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

		/****************** SetSectionAttribute ******************/
		/**** md5 signature: 2e1a6df4e17fe92b14ed2db288f2bebf ****/
		%feature("compactdefaultargs") SetSectionAttribute;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSecAttr: BOPAlgo_SectionAttribute

Returns
-------
None
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
		/****************** BOPAlgo_ShellSplitter ******************/
		/**** md5 signature: 1a413937e5bc85276cd970f7bd17f0e2 ****/
		%feature("compactdefaultargs") BOPAlgo_ShellSplitter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BOPAlgo_ShellSplitter;
		 BOPAlgo_ShellSplitter();

		/****************** BOPAlgo_ShellSplitter ******************/
		/**** md5 signature: e293806183c127a6994ca543539a4ca7 ****/
		%feature("compactdefaultargs") BOPAlgo_ShellSplitter;
		%feature("autodoc", "Constructor.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPAlgo_ShellSplitter;
		 BOPAlgo_ShellSplitter(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** AddStartElement ******************/
		/**** md5 signature: 1f9a6cd0dc44399d66b6c1516e84d023 ****/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "Adds a face <thes> to process.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
None
") AddStartElement;
		void AddStartElement(const TopoDS_Shape & theS);

		/****************** Perform ******************/
		/**** md5 signature: d73234ef092f057e6680afbd2a273a2a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the algorithm.

Returns
-------
None
") Perform;
		virtual void Perform();

		/****************** Shells ******************/
		/**** md5 signature: 253534f051afc8c1348ee153669d53c1 ****/
		%feature("compactdefaultargs") Shells;
		%feature("autodoc", "Returns the loops.

Returns
-------
TopTools_ListOfShape
") Shells;
		const TopTools_ListOfShape & Shells();

		/****************** SplitBlock ******************/
		/**** md5 signature: b4a3a42e521935db4e11e49c5e4189a8 ****/
		%feature("compactdefaultargs") SplitBlock;
		%feature("autodoc", "No available documentation.

Parameters
----------
theCB: BOPTools_ConnexityBlock

Returns
-------
None
") SplitBlock;
		static void SplitBlock(BOPTools_ConnexityBlock & theCB);

		/****************** StartElements ******************/
		/**** md5 signature: 4df71127781e1f235af21a1e6e23cfbe ****/
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "Return the faces to process.

Returns
-------
TopTools_ListOfShape
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
		/****************** BOPAlgo_WireSplitter ******************/
		/**** md5 signature: 94705b115e84b6538c1dd87e9bd7d242 ****/
		%feature("compactdefaultargs") BOPAlgo_WireSplitter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BOPAlgo_WireSplitter;
		 BOPAlgo_WireSplitter();

		/****************** BOPAlgo_WireSplitter ******************/
		/**** md5 signature: 7507f32d0dff651fc083ad87f3b26067 ****/
		%feature("compactdefaultargs") BOPAlgo_WireSplitter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPAlgo_WireSplitter;
		 BOPAlgo_WireSplitter(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Context ******************/
		/**** md5 signature: 61a08d8ec3c36cb7537272ccd635f363 ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns the context.

Returns
-------
opencascade::handle<IntTools_Context>
") Context;
		const opencascade::handle<IntTools_Context> & Context();

		/****************** MakeWire ******************/
		/**** md5 signature: 1f818413cf336ccce6872fc306458e7d ****/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLE: TopTools_ListOfShape
theW: TopoDS_Wire

Returns
-------
None
") MakeWire;
		static void MakeWire(TopTools_ListOfShape & theLE, TopoDS_Wire & theW);

		/****************** Perform ******************/
		/**** md5 signature: d73234ef092f057e6680afbd2a273a2a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		virtual void Perform();

		/****************** SetContext ******************/
		/**** md5 signature: e78608a6b667b26dfbb5221975ad17a2 ****/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets the context for the algorithm.

Parameters
----------
theContext: IntTools_Context

Returns
-------
None
") SetContext;
		void SetContext(const opencascade::handle<IntTools_Context> & theContext);

		/****************** SetWES ******************/
		/**** md5 signature: 8b89b7efde21e917d2d2fc92a5fcb271 ****/
		%feature("compactdefaultargs") SetWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
theWES: BOPAlgo_WireEdgeSet

Returns
-------
None
") SetWES;
		void SetWES(const BOPAlgo_WireEdgeSet & theWES);

		/****************** SplitBlock ******************/
		/**** md5 signature: de0aea84749b1e20f54d75f31ecf8114 ****/
		%feature("compactdefaultargs") SplitBlock;
		%feature("autodoc", "No available documentation.

Parameters
----------
theF: TopoDS_Face
theCB: BOPTools_ConnexityBlock
theContext: IntTools_Context

Returns
-------
None
") SplitBlock;
		static void SplitBlock(const TopoDS_Face & theF, BOPTools_ConnexityBlock & theCB, const opencascade::handle<IntTools_Context> & theContext);

		/****************** WES ******************/
		/**** md5 signature: 58e5fd1cf4257111802b170e6fd95635 ****/
		%feature("compactdefaultargs") WES;
		%feature("autodoc", "No available documentation.

Returns
-------
BOPAlgo_WireEdgeSet
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
		/****************** BOPAlgo_Builder ******************/
		/**** md5 signature: 1f86d9941e9ea86a4622ff7ec326d7fc ****/
		%feature("compactdefaultargs") BOPAlgo_Builder;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BOPAlgo_Builder;
		 BOPAlgo_Builder();

		/****************** BOPAlgo_Builder ******************/
		/**** md5 signature: f3353a4fea36ad4c50e43eda587bd535 ****/
		%feature("compactdefaultargs") BOPAlgo_Builder;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPAlgo_Builder;
		 BOPAlgo_Builder(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** AddArgument ******************/
		/**** md5 signature: 60c2b0316a67e93c3535a28f84d56231 ****/
		%feature("compactdefaultargs") AddArgument;
		%feature("autodoc", "Adds the argument to the operation.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") AddArgument;
		virtual void AddArgument(const TopoDS_Shape & theShape);

		/****************** Arguments ******************/
		/**** md5 signature: 5c44416d889811943ccde89673d3c270 ****/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Returns the list of arguments.

Returns
-------
TopTools_ListOfShape
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****************** BuildBOP ******************/
		/**** md5 signature: bf05d8cf5f4ff010d1c03062f4eaf238 ****/
		%feature("compactdefaultargs") BuildBOP;
		%feature("autodoc", "Builds the result shape according to the given states for the objects and tools. these states can be unambiguously converted into the boolean operation type. thus, it performs the boolean operation on the given groups of shapes. //! the result is built basing on the result of builder operation (gf or any other). the only condition for the builder is that the splits of faces should be created and classified relatively solids. //! the method uses classification approach for choosing the faces which will participate in building the result shape: - all faces from each group having the given state for the opposite group will be taken into result. //! such approach shows better results (in comparison with bopalgo_buildersolid approach) when working with open solids. however, the result may not be always correct on such data (at least, not as expected) as the correct classification of the faces relatively open solids is not always possible and may vary depending on the chosen classification point on the face. //! history is not created for the solids in this method. //! to avoid pollution of the report of builder algorithm, there is a possibility to pass the different report to collect the alerts of the method only. but, if the new report is not given, the builder report will be used. so, even if builder passed without any errors, but some error has been stored into its report in this method, for the following calls the builder report must be cleared. //! the method may set the following errors: - bopalgo_alertbuilderfailed - building operation has not been performed yet or failed; - bopalgo_alertbopnotset - invalid bop type is given (common/fuse/cut/cut21 are supported); - bopalgo_alerttoofewarguments - arguments are not given; - bopalgo_alertunknownshape - the shape is unknown for the operation. //! parameters: @param theobjects - the group of objects for bop; @param theobjstate - state for objects faces to pass into result; @param thetools - the group of tools for bop; @param theobjstate - state for tools faces to pass into result; @param thereport - the alternative report to avoid pollution of the main one.

Parameters
----------
theObjects: TopTools_ListOfShape
theObjState: TopAbs_State
theTools: TopTools_ListOfShape
theToolsState: TopAbs_State
theReport: Message_Report,optional
	default value is NULL

Returns
-------
None
") BuildBOP;
		virtual void BuildBOP(const TopTools_ListOfShape & theObjects, const TopAbs_State theObjState, const TopTools_ListOfShape & theTools, const TopAbs_State theToolsState, opencascade::handle<Message_Report > theReport = NULL);

		/****************** BuildBOP ******************/
		/**** md5 signature: 5f2c4d2c7b32fe57c63ffb4571f06910 ****/
		%feature("compactdefaultargs") BuildBOP;
		%feature("autodoc", "Builds the result of boolean operation of given type basing on the result of builder operation (gf or any other). //! the method converts the given type of operation into the states for the objects and tools required for their face to pass into result and performs the call to the same method, but with states instead of operation type. //! the conversion looks as follows: - common is built from the faces of objects located in any of the tools and vice versa. - fuse is built from the faces out of all given shapes; - cut is built from the faces of the objects out of the tools and faces of the tools located in solids of the objects. //! @param theobjects - the group of objects for bop; @param thetools - the group of tools for bop; @param theoperation - the bop type; @param thereport - the alternative report to avoid pollution of the global one.

Parameters
----------
theObjects: TopTools_ListOfShape
theTools: TopTools_ListOfShape
theOperation: BOPAlgo_Operation
theReport: Message_Report,optional
	default value is NULL

Returns
-------
None
") BuildBOP;
		void BuildBOP(const TopTools_ListOfShape & theObjects, const TopTools_ListOfShape & theTools, const BOPAlgo_Operation theOperation, opencascade::handle<Message_Report > theReport = NULL);

		/****************** CheckInverted ******************/
		/**** md5 signature: ce3c18df15bc3282101b99ee82f78b47 ****/
		%feature("compactdefaultargs") CheckInverted;
		%feature("autodoc", "Returns the flag defining whether the check for input solids on inverted status should be performed or not.

Returns
-------
bool
") CheckInverted;
		Standard_Boolean CheckInverted();

		/****************** Clear ******************/
		/**** md5 signature: f671931d03948860d0ead34afbe920aa ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the algorithm.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** Context ******************/
		/**** md5 signature: 74fb770c962675c4ccf80c755850043b ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns the context, tool for cashing heavy algorithms.

Returns
-------
opencascade::handle<IntTools_Context>
") Context;
		opencascade::handle<IntTools_Context> Context();

		/****************** Glue ******************/
		/**** md5 signature: 2a0ac34b43f154dd0238ac1408d9079b ****/
		%feature("compactdefaultargs") Glue;
		%feature("autodoc", "Returns the glue option of the algorithm.

Returns
-------
BOPAlgo_GlueEnum
") Glue;
		BOPAlgo_GlueEnum Glue();

		/****************** Images ******************/
		/**** md5 signature: b5e41f40108249a88217f4fca2899406 ****/
		%feature("compactdefaultargs") Images;
		%feature("autodoc", "Returns the map of images.

Returns
-------
TopTools_DataMapOfShapeListOfShape
") Images;
		const TopTools_DataMapOfShapeListOfShape & Images();

		/****************** NonDestructive ******************/
		/**** md5 signature: debf4165891df54bd9a565d235f0d378 ****/
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "Returns the flag that defines the mode of treatment. in non-destructive mode the argument shapes are not modified. instead a copy of a sub-shape is created in the result if it is needed to be updated.

Returns
-------
bool
") NonDestructive;
		Standard_Boolean NonDestructive();

		/****************** Origins ******************/
		/**** md5 signature: af47018f396466f88e1f40a1e0dda823 ****/
		%feature("compactdefaultargs") Origins;
		%feature("autodoc", "Returns the map of origins.

Returns
-------
TopTools_DataMapOfShapeListOfShape
") Origins;
		const TopTools_DataMapOfShapeListOfShape & Origins();

		/****************** PDS ******************/
		/**** md5 signature: a30b9b6ee088c51b53e93ae172dde611 ****/
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "Returns the data structure, holder of intersection information.

Returns
-------
BOPDS_PDS
") PDS;
		BOPDS_PDS PDS();

		/****************** PPaveFiller ******************/
		/**** md5 signature: b4431f105883f2fda078ca3da828ad49 ****/
		%feature("compactdefaultargs") PPaveFiller;
		%feature("autodoc", "Returns the pavefiller, algorithm for sub-shapes intersection.

Returns
-------
BOPAlgo_PPaveFiller
") PPaveFiller;
		BOPAlgo_PPaveFiller PPaveFiller();

		/****************** Perform ******************/
		/**** md5 signature: d73234ef092f057e6680afbd2a273a2a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the operation. the intersection will be performed also.

Returns
-------
None
") Perform;
		virtual void Perform();

		/****************** PerformWithFiller ******************/
		/**** md5 signature: ad9328f46e269c9c83bdf7ea4e1b2493 ****/
		%feature("compactdefaultargs") PerformWithFiller;
		%feature("autodoc", "Performs the operation with the prepared filler. the intersection will not be performed in this case.

Parameters
----------
theFiller: BOPAlgo_PaveFiller

Returns
-------
None
") PerformWithFiller;
		virtual void PerformWithFiller(const BOPAlgo_PaveFiller & theFiller);

		/****************** SetArguments ******************/
		/**** md5 signature: 52d846757af37684f5519c7b7f1b4940 ****/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "Sets the list of arguments for the operation.

Parameters
----------
theLS: TopTools_ListOfShape

Returns
-------
None
") SetArguments;
		virtual void SetArguments(const TopTools_ListOfShape & theLS);

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
		%feature("autodoc", "Sets the glue option for the algorithm.

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
		%feature("autodoc", "Sets the flag that defines the mode of treatment. in non-destructive mode the argument shapes are not modified. instead a copy of a sub-shape is created in the result if it is needed to be updated. this flag is taken into account if internal pavefiller is used only. in the case of calling performwithfiller the corresponding flag of that pavefiller is in force.

Parameters
----------
theFlag: bool

Returns
-------
None
") SetNonDestructive;
		void SetNonDestructive(const Standard_Boolean theFlag);

		/****************** ShapesSD ******************/
		/**** md5 signature: b1456fb65b85afaf3fe4896e268be23e ****/
		%feature("compactdefaultargs") ShapesSD;
		%feature("autodoc", "Returns the map of same domain (sd) shapes - coinciding shapes from different arguments.

Returns
-------
TopTools_DataMapOfShapeShape
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
		/****************** BOPAlgo_BuilderFace ******************/
		/**** md5 signature: 55fb0e9f8f896e5e2f0cad2dee0ad4b9 ****/
		%feature("compactdefaultargs") BOPAlgo_BuilderFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BOPAlgo_BuilderFace;
		 BOPAlgo_BuilderFace();

		/****************** BOPAlgo_BuilderFace ******************/
		/**** md5 signature: b5c457f566a0d6c73144f78202d49cab ****/
		%feature("compactdefaultargs") BOPAlgo_BuilderFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPAlgo_BuilderFace;
		 BOPAlgo_BuilderFace(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the face generatix.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Orientation ******************/
		/**** md5 signature: 328242fe19b1f80489d8169681ebc029 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Perform ******************/
		/**** md5 signature: d73234ef092f057e6680afbd2a273a2a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the algorithm.

Returns
-------
None
") Perform;
		virtual void Perform();

		/****************** SetFace ******************/
		/**** md5 signature: 5b74a256c8032110740067b9210114f8 ****/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "Sets the face generatix.

Parameters
----------
theFace: TopoDS_Face

Returns
-------
None
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
		/****************** BOPAlgo_BuilderSolid ******************/
		/**** md5 signature: 3207f4476326a857182303f4e535631e ****/
		%feature("compactdefaultargs") BOPAlgo_BuilderSolid;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BOPAlgo_BuilderSolid;
		 BOPAlgo_BuilderSolid();

		/****************** BOPAlgo_BuilderSolid ******************/
		/**** md5 signature: ffc0a313e87b14e1192559b5a26c6ac8 ****/
		%feature("compactdefaultargs") BOPAlgo_BuilderSolid;
		%feature("autodoc", "Constructor with allocator.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPAlgo_BuilderSolid;
		 BOPAlgo_BuilderSolid(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** GetBoxesMap ******************/
		/**** md5 signature: a5a9e80370b6f3886c3433f1fcf548da ****/
		%feature("compactdefaultargs") GetBoxesMap;
		%feature("autodoc", "For classification purposes the algorithm builds the bounding boxes for all created solids. this method returns the data map of solid - box pairs.

Returns
-------
TopTools_DataMapOfShapeBox
") GetBoxesMap;
		const TopTools_DataMapOfShapeBox & GetBoxesMap();

		/****************** Perform ******************/
		/**** md5 signature: d73234ef092f057e6680afbd2a273a2a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the construction of the solids from the given faces.

Returns
-------
None
") Perform;
		virtual void Perform();

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
		/****************** BOPAlgo_CheckerSI ******************/
		/**** md5 signature: 4509a2dedfaae61b75002e38bf4839ca ****/
		%feature("compactdefaultargs") BOPAlgo_CheckerSI;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BOPAlgo_CheckerSI;
		 BOPAlgo_CheckerSI();

		/****************** Perform ******************/
		/**** md5 signature: d73234ef092f057e6680afbd2a273a2a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		virtual void Perform();

		/****************** SetLevelOfCheck ******************/
		/**** md5 signature: 8b368cd9515ac3e41d12f4691644e2cf ****/
		%feature("compactdefaultargs") SetLevelOfCheck;
		%feature("autodoc", "Sets the level of checking shape on self-interference. it defines which interferences will be checked: 0 - only v/v; 1 - v/v and v/e; 2 - v/v, v/e and e/e; 3 - v/v, v/e, e/e and v/f; 4 - v/v, v/e, e/e, v/f and e/f; 5 - v/v, v/e, e/e, v/f, e/f and f/f; 6 - v/v, v/e, e/e, v/f, e/f, f/f and v/s; 7 - v/v, v/e, e/e, v/f, e/f, f/f, v/s and e/s; 8 - v/v, v/e, e/e, v/f, e/f, f/f, v/s, e/s and f/s; 9 - v/v, v/e, e/e, v/f, e/f, f/f, v/s, e/s, f/s and s/s - all interferences (default value).

Parameters
----------
theLevel: int

Returns
-------
None
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
		/****************** BOPAlgo_RemoveFeatures ******************/
		/**** md5 signature: 7b50bf592dac62efc3164c9eb9f4d77d ****/
		%feature("compactdefaultargs") BOPAlgo_RemoveFeatures;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BOPAlgo_RemoveFeatures;
		 BOPAlgo_RemoveFeatures();

		/****************** AddFaceToRemove ******************/
		/**** md5 signature: 26c9409a587f43491552f28dbeb97ed4 ****/
		%feature("compactdefaultargs") AddFaceToRemove;
		%feature("autodoc", "Adds the face to remove from the input shape. @param theface [in] the shape to extract the faces for removal.

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

		/****************** Clear ******************/
		/**** md5 signature: aed78bc7ea4fdcb55502fff982e7b775 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the contents of the algorithm from previous run, allowing reusing it for following removals.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** FacesToRemove ******************/
		/**** md5 signature: 947971dfb74df8135dc7f7ce60eaaa90 ****/
		%feature("compactdefaultargs") FacesToRemove;
		%feature("autodoc", "Returns the list of faces which have been requested for removal from the input shape.

Returns
-------
TopTools_ListOfShape
") FacesToRemove;
		const TopTools_ListOfShape & FacesToRemove();

		/****************** InputShape ******************/
		/**** md5 signature: c0c04276bd1d5989adf5070d423aadb7 ****/
		%feature("compactdefaultargs") InputShape;
		%feature("autodoc", "Returns the input shape.

Returns
-------
TopoDS_Shape
") InputShape;
		const TopoDS_Shape InputShape();

		/****************** Perform ******************/
		/**** md5 signature: d73234ef092f057e6680afbd2a273a2a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the operation.

Returns
-------
None
") Perform;
		virtual void Perform();

		/****************** SetShape ******************/
		/**** md5 signature: 927e2ebe2fb5354dfb3da3c53e512cad ****/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Sets the shape for processing. @param theshape [in] the shape to remove the faces from.  it should either be the solid, compsolid or compound of solids.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
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
		/****************** BOPAlgo_CellsBuilder ******************/
		/**** md5 signature: 283c387ed79b57aa716daf623c73a380 ****/
		%feature("compactdefaultargs") BOPAlgo_CellsBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BOPAlgo_CellsBuilder;
		 BOPAlgo_CellsBuilder();

		/****************** BOPAlgo_CellsBuilder ******************/
		/**** md5 signature: 0c9a50e5a44f35e9ea990d6dd2e2c069 ****/
		%feature("compactdefaultargs") BOPAlgo_CellsBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPAlgo_CellsBuilder;
		 BOPAlgo_CellsBuilder(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** AddAllToResult ******************/
		/**** md5 signature: 58f1f9632579501c71d617e8b3be70df ****/
		%feature("compactdefaultargs") AddAllToResult;
		%feature("autodoc", "Add all split parts to result. <thematerial> defines the removal of internal boundaries; <theupdate> parameter defines whether to remove boundaries now or not.

Parameters
----------
theMaterial: int,optional
	default value is 0
theUpdate: bool,optional
	default value is Standard_False

Returns
-------
None
") AddAllToResult;
		void AddAllToResult(const Standard_Integer theMaterial = 0, const Standard_Boolean theUpdate = Standard_False);

		/****************** AddToResult ******************/
		/**** md5 signature: 078f78bbeb3b4b698240216e4af3918a ****/
		%feature("compactdefaultargs") AddToResult;
		%feature("autodoc", "Adding the parts to result. the parts are defined by two lists of shapes: <thelstotake> defines the arguments which parts should be taken into result; <thelstoavoid> defines the arguments which parts should not be taken into result; to be taken into result the part must be in for all shapes from the list <thelstotake> and must be out of all shapes from the list <thelstoavoid>. to remove internal boundaries between any cells in the result <thematerial> variable should be used. the boundaries between cells with the same material will be removed. default value is 0. thus, to remove any boundary the value of this variable should not be equal to 0. <theupdate> parameter defines whether to remove boundaries now or not.

Parameters
----------
theLSToTake: TopTools_ListOfShape
theLSToAvoid: TopTools_ListOfShape
theMaterial: int,optional
	default value is 0
theUpdate: bool,optional
	default value is Standard_False

Returns
-------
None
") AddToResult;
		void AddToResult(const TopTools_ListOfShape & theLSToTake, const TopTools_ListOfShape & theLSToAvoid, const Standard_Integer theMaterial = 0, const Standard_Boolean theUpdate = Standard_False);

		/****************** Clear ******************/
		/**** md5 signature: f671931d03948860d0ead34afbe920aa ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Redefined method clear - clears the contents.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** GetAllParts ******************/
		/**** md5 signature: b2790f97d6203d4043686998a149d61a ****/
		%feature("compactdefaultargs") GetAllParts;
		%feature("autodoc", "Get all split parts.

Returns
-------
TopoDS_Shape
") GetAllParts;
		const TopoDS_Shape GetAllParts();

		/****************** MakeContainers ******************/
		/**** md5 signature: 9eacc65717dba6855fa4d05e42624e62 ****/
		%feature("compactdefaultargs") MakeContainers;
		%feature("autodoc", "Makes the containers of proper type from the parts added to result.

Returns
-------
None
") MakeContainers;
		void MakeContainers();

		/****************** RemoveAllFromResult ******************/
		/**** md5 signature: da6f499056fba61c54387b307c110ed8 ****/
		%feature("compactdefaultargs") RemoveAllFromResult;
		%feature("autodoc", "Remove all parts from result.

Returns
-------
None
") RemoveAllFromResult;
		void RemoveAllFromResult();

		/****************** RemoveFromResult ******************/
		/**** md5 signature: 0a190413f81894fd0aedf2b6857a0e58 ****/
		%feature("compactdefaultargs") RemoveFromResult;
		%feature("autodoc", "Removing the parts from result. the parts are defined by two lists of shapes: <thelstotake> defines the arguments which parts should be removed from result; <thelstoavoid> defines the arguments which parts should not be removed from result. to be removed from the result the part must be in for all shapes from the list <thelstotake> and must be out of all shapes from the list <thelstoavoid>.

Parameters
----------
theLSToTake: TopTools_ListOfShape
theLSToAvoid: TopTools_ListOfShape

Returns
-------
None
") RemoveFromResult;
		void RemoveFromResult(const TopTools_ListOfShape & theLSToTake, const TopTools_ListOfShape & theLSToAvoid);

		/****************** RemoveInternalBoundaries ******************/
		/**** md5 signature: 2ea3e927bcf8e9d3e7d159aea16eac8b ****/
		%feature("compactdefaultargs") RemoveInternalBoundaries;
		%feature("autodoc", "Removes internal boundaries between cells with the same material. if the result contains the cells with same material but of different dimension the removal of internal boundaries between these cells will not be performed. in case of some errors during the removal the method will set the appropriate warning status - use getreport() to access them.

Returns
-------
None
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
		/****************** BOPAlgo_MakerVolume ******************/
		/**** md5 signature: d0e6199b15a5886e06dc5392486c5729 ****/
		%feature("compactdefaultargs") BOPAlgo_MakerVolume;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") BOPAlgo_MakerVolume;
		 BOPAlgo_MakerVolume();

		/****************** BOPAlgo_MakerVolume ******************/
		/**** md5 signature: d34685403aab74ebc2da37a1a29c02c6 ****/
		%feature("compactdefaultargs") BOPAlgo_MakerVolume;
		%feature("autodoc", "Empty contructor.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPAlgo_MakerVolume;
		 BOPAlgo_MakerVolume(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Box ******************/
		/**** md5 signature: 3ac56b24f6371ebc9df716c917fc390f ****/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Returns the solid box <mysbox>.

Returns
-------
TopoDS_Solid
") Box;
		const TopoDS_Solid Box();

		/****************** Clear ******************/
		/**** md5 signature: f671931d03948860d0ead34afbe920aa ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the data.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** Faces ******************/
		/**** md5 signature: 9c2557bb3fea1d1ff5791937fe36a2f5 ****/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Returns the processed faces <myfaces>.

Returns
-------
TopTools_ListOfShape
") Faces;
		const TopTools_ListOfShape & Faces();

		/****************** IsAvoidInternalShapes ******************/
		/**** md5 signature: 8a7b9501581d682ae84b1516b6d067be ****/
		%feature("compactdefaultargs") IsAvoidInternalShapes;
		%feature("autodoc", "Returns the avoidinternalshapes flag.

Returns
-------
bool
") IsAvoidInternalShapes;
		Standard_Boolean IsAvoidInternalShapes();

		/****************** IsIntersect ******************/
		/**** md5 signature: 83079d7138bb957f3b50f76e715d483c ****/
		%feature("compactdefaultargs") IsIntersect;
		%feature("autodoc", "Returns the flag <myintersect>.

Returns
-------
bool
") IsIntersect;
		Standard_Boolean IsIntersect();

		/****************** Perform ******************/
		/**** md5 signature: d73234ef092f057e6680afbd2a273a2a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the operation.

Returns
-------
None
") Perform;
		virtual void Perform();

		/****************** SetAvoidInternalShapes ******************/
		/**** md5 signature: d4ee80659b0195413556579790baf956 ****/
		%feature("compactdefaultargs") SetAvoidInternalShapes;
		%feature("autodoc", "Defines the preventing of addition of internal for solid parts into the result. by default the internal parts are added into result.

Parameters
----------
theAvoidInternal: bool

Returns
-------
None
") SetAvoidInternalShapes;
		void SetAvoidInternalShapes(const Standard_Boolean theAvoidInternal);

		/****************** SetIntersect ******************/
		/**** md5 signature: 91f9f86d3d941824ec34eddc9329ee23 ****/
		%feature("compactdefaultargs") SetIntersect;
		%feature("autodoc", "Sets the flag myintersect: if <bintersect> is true the shapes from <myarguments> will be intersected. if <bintersect> is false no intersection will be done.

Parameters
----------
bIntersect: bool

Returns
-------
None
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
		/****************** BOPAlgo_Section ******************/
		/**** md5 signature: a6ca4919a6cd1765268a1adceee00250 ****/
		%feature("compactdefaultargs") BOPAlgo_Section;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BOPAlgo_Section;
		 BOPAlgo_Section();

		/****************** BOPAlgo_Section ******************/
		/**** md5 signature: 7d326de6218833e290f0512fe0e4cc7f ****/
		%feature("compactdefaultargs") BOPAlgo_Section;
		%feature("autodoc", "Constructor with allocator.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
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
		/****************** BOPAlgo_ToolsProvider ******************/
		/**** md5 signature: 6126476d277f9865fd5dc964255f5ab2 ****/
		%feature("compactdefaultargs") BOPAlgo_ToolsProvider;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BOPAlgo_ToolsProvider;
		 BOPAlgo_ToolsProvider();

		/****************** BOPAlgo_ToolsProvider ******************/
		/**** md5 signature: 6bb0db70c66244e0cce5fe43bf078d78 ****/
		%feature("compactdefaultargs") BOPAlgo_ToolsProvider;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPAlgo_ToolsProvider;
		 BOPAlgo_ToolsProvider(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** AddTool ******************/
		/**** md5 signature: 81f0977d7c049de98cc27f2491835535 ****/
		%feature("compactdefaultargs") AddTool;
		%feature("autodoc", "Adds tool argument of the operation.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") AddTool;
		virtual void AddTool(const TopoDS_Shape & theShape);

		/****************** Clear ******************/
		/**** md5 signature: f671931d03948860d0ead34afbe920aa ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears internal fields and arguments.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** SetTools ******************/
		/**** md5 signature: da6d08fc771172834027c4c3bf810697 ****/
		%feature("compactdefaultargs") SetTools;
		%feature("autodoc", "Adds the tool arguments of the operation.

Parameters
----------
theShapes: TopTools_ListOfShape

Returns
-------
None
") SetTools;
		virtual void SetTools(const TopTools_ListOfShape & theShapes);

		/****************** Tools ******************/
		/**** md5 signature: 0471973aac274d4f863776957a65fd19 ****/
		%feature("compactdefaultargs") Tools;
		%feature("autodoc", "Returns the tool arguments of the operation.

Returns
-------
TopTools_ListOfShape
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
		/****************** BOPAlgo_BOP ******************/
		/**** md5 signature: 4d357b2740befe8a8d360cc2e02f478c ****/
		%feature("compactdefaultargs") BOPAlgo_BOP;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BOPAlgo_BOP;
		 BOPAlgo_BOP();

		/****************** BOPAlgo_BOP ******************/
		/**** md5 signature: feb1029ccc5153f535a54dcb035cb288 ****/
		%feature("compactdefaultargs") BOPAlgo_BOP;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPAlgo_BOP;
		 BOPAlgo_BOP(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Clear ******************/
		/**** md5 signature: f671931d03948860d0ead34afbe920aa ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears internal fields and arguments.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** Operation ******************/
		/**** md5 signature: 53685d2081d3d3f1f66792b3367f7ed4 ****/
		%feature("compactdefaultargs") Operation;
		%feature("autodoc", "No available documentation.

Returns
-------
BOPAlgo_Operation
") Operation;
		BOPAlgo_Operation Operation();

		/****************** Perform ******************/
		/**** md5 signature: d73234ef092f057e6680afbd2a273a2a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		virtual void Perform();

		/****************** SetOperation ******************/
		/**** md5 signature: 315e93f5dc046c73744bab20d8a0d13f ****/
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOperation: BOPAlgo_Operation

Returns
-------
None
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
		/****************** BOPAlgo_Splitter ******************/
		/**** md5 signature: 41a4c344ea1bf552096cf49314155d42 ****/
		%feature("compactdefaultargs") BOPAlgo_Splitter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BOPAlgo_Splitter;
		 BOPAlgo_Splitter();

		/****************** BOPAlgo_Splitter ******************/
		/**** md5 signature: 2c9575836a616bbcbb946e2ef6ad3a7a ****/
		%feature("compactdefaultargs") BOPAlgo_Splitter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPAlgo_Splitter;
		 BOPAlgo_Splitter(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Perform ******************/
		/**** md5 signature: d73234ef092f057e6680afbd2a273a2a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the operation.

Returns
-------
None
") Perform;
		virtual void Perform();

};


%extend BOPAlgo_Splitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
