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
%define BOPALGODOCSTRING
"BOPAlgo module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_bopalgo.html"
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
#include<TopTools_module.hxx>
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
%template(BOPAlgo_ListIteratorOfListOfCheckResult) NCollection_TListIterator<BOPAlgo_CheckResult>;
%template(BOPAlgo_ListOfCheckResult) NCollection_List<BOPAlgo_CheckResult>;

%extend NCollection_List<BOPAlgo_CheckResult> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = BOPAlgo_ListIteratorOfListOfCheckResult(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_List<BOPAlgo_CheckResult>::Iterator BOPAlgo_ListIteratorOfListOfCheckResult;
typedef NCollection_List<BOPAlgo_CheckResult> BOPAlgo_ListOfCheckResult;
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
		/****** md5 signature: 02555cebc1acd7cb0f265e842acd1dae ******/
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
		/****** md5 signature: 9a9729e1f37c2dc45ee3798cb0dea0c7 ******/
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
		/****** md5 signature: ceabcd6ab788acde00f211bb3822f7a4 ******/
		%feature("compactdefaultargs") GetMaxDistance1;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the distance for the first shape.
") GetMaxDistance1;
		double GetMaxDistance1();

		/****** BOPAlgo_CheckResult::GetMaxDistance2 ******/
		/****** md5 signature: 85785c697b686fd14d66d658686c282f ******/
		%feature("compactdefaultargs") GetMaxDistance2;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the distance for the second shape.
") GetMaxDistance2;
		double GetMaxDistance2();

		/****** BOPAlgo_CheckResult::GetMaxParameter1 ******/
		/****** md5 signature: 16b421c8a4b32c40266b140f1a63248f ******/
		%feature("compactdefaultargs") GetMaxParameter1;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter for the fircst shape.
") GetMaxParameter1;
		double GetMaxParameter1();

		/****** BOPAlgo_CheckResult::GetMaxParameter2 ******/
		/****** md5 signature: c3b7fa4cdc3adadf5fa85890bbb9038d ******/
		%feature("compactdefaultargs") GetMaxParameter2;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter for the second shape.
") GetMaxParameter2;
		double GetMaxParameter2();

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
		/****** md5 signature: 473bc51b1680f10ead64b619ead42443 ******/
		%feature("compactdefaultargs") SetMaxDistance1;
		%feature("autodoc", "
Parameters
----------
theDist: double

Return
-------
None

Description
-----------
Sets max distance for the first shape.
") SetMaxDistance1;
		void SetMaxDistance1(const double theDist);

		/****** BOPAlgo_CheckResult::SetMaxDistance2 ******/
		/****** md5 signature: c1da805aa61d46babaef16cc637153d9 ******/
		%feature("compactdefaultargs") SetMaxDistance2;
		%feature("autodoc", "
Parameters
----------
theDist: double

Return
-------
None

Description
-----------
Sets max distance for the second shape.
") SetMaxDistance2;
		void SetMaxDistance2(const double theDist);

		/****** BOPAlgo_CheckResult::SetMaxParameter1 ******/
		/****** md5 signature: 8edcf5c0b673d500a39b565335170901 ******/
		%feature("compactdefaultargs") SetMaxParameter1;
		%feature("autodoc", "
Parameters
----------
thePar: double

Return
-------
None

Description
-----------
Sets the parameter for the first shape.
") SetMaxParameter1;
		void SetMaxParameter1(const double thePar);

		/****** BOPAlgo_CheckResult::SetMaxParameter2 ******/
		/****** md5 signature: 8d3cdd0a4f494cb9bc092471dbc25d63 ******/
		%feature("compactdefaultargs") SetMaxParameter2;
		%feature("autodoc", "
Parameters
----------
thePar: double

Return
-------
None

Description
-----------
Sets the parameter for the second shape.
") SetMaxParameter2;
		void SetMaxParameter2(const double thePar);

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
		/****** md5 signature: 6eef56dc3eb31c06f24ae91ee35b442b ******/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the additional tolerance.
") FuzzyValue;
		double FuzzyValue();

		/****** BOPAlgo_Options::GetParallelMode ******/
		/****** md5 signature: 2f21c90867d6a0c887a6354aa60b693b ******/
		%feature("compactdefaultargs") GetParallelMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Gets the global parallel mode.
") GetParallelMode;
		static bool GetParallelMode();

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
		/****** md5 signature: aa66ae3538e99dbc95322ff63808a8ee ******/
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
		bool HasError(const opencascade::handle<Standard_Type> & theType);

		/****** BOPAlgo_Options::HasErrors ******/
		/****** md5 signature: 8c1e2c128b1fa807b572ff0a2177782a ******/
		%feature("compactdefaultargs") HasErrors;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if algorithm has failed.
") HasErrors;
		bool HasErrors();

		/****** BOPAlgo_Options::HasWarning ******/
		/****** md5 signature: 6bac072e7a42c28f294e6b78d7badf98 ******/
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
		bool HasWarning(const opencascade::handle<Standard_Type> & theType);

		/****** BOPAlgo_Options::HasWarnings ******/
		/****** md5 signature: 265bd2fdd431635012ab35f98de56ac8 ******/
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if algorithm has generated some warning alerts.
") HasWarnings;
		bool HasWarnings();

		/****** BOPAlgo_Options::RunParallel ******/
		/****** md5 signature: 2d7b4f9ecf67a84bfce50c65b87a9c32 ******/
		%feature("compactdefaultargs") RunParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag of parallel processing.
") RunParallel;
		bool RunParallel();

		/****** BOPAlgo_Options::SetFuzzyValue ******/
		/****** md5 signature: beedb85a4dfa8508c90e54660fd7d7a1 ******/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "
Parameters
----------
theFuzz: double

Return
-------
None

Description
-----------
Sets the additional tolerance.
") SetFuzzyValue;
		void SetFuzzyValue(const double theFuzz);

		/****** BOPAlgo_Options::SetParallelMode ******/
		/****** md5 signature: e34b029ff7961a95a695fb5b20028fcd ******/
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
		static void SetParallelMode(const bool theNewMode);

		/****** BOPAlgo_Options::SetRunParallel ******/
		/****** md5 signature: 110d516d88fd618981d548d607a433d0 ******/
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
		void SetRunParallel(const bool theFlag);

		/****** BOPAlgo_Options::SetUseOBB ******/
		/****** md5 signature: 892d5110e62ddd912094630ee07fed38 ******/
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
		void SetUseOBB(const bool theUseOBB);

		/****** BOPAlgo_Options::UseOBB ******/
		/****** md5 signature: fac0325d158cc82f7c48713d0447363d ******/
		%feature("compactdefaultargs") UseOBB;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag defining usage of OBB.
") UseOBB;
		bool UseOBB();

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
		/****** md5 signature: ae41b44fc87d87b18ffb1f9d5893a8e1 ******/
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
		 BOPAlgo_PISteps(const int theNbOp);

		/****** BOPAlgo_PISteps::ChangeSteps ******/
		/****** md5 signature: bcd411c793ecc8deb30061f124b3589a ******/
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
		/****** md5 signature: c7e4889ba28b8868a99fb9ca6bc35f18 ******/
		%feature("compactdefaultargs") GetStep;
		%feature("autodoc", "
Parameters
----------
theOperation: int

Return
-------
double

Description
-----------
Returns the step assigned to the operation.
") GetStep;
		double GetStep(const int theOperation);

		/****** BOPAlgo_PISteps::SetStep ******/
		/****** md5 signature: 8ca63afe5dc8ea892c5aa30a3e5f9987 ******/
		%feature("compactdefaultargs") SetStep;
		%feature("autodoc", "
Parameters
----------
theOperation: int
theStep: double

Return
-------
None

Description
-----------
Assign the value theStep to theOperation.
") SetStep;
		void SetStep(const int theOperation, const double theStep);

		/****** BOPAlgo_PISteps::Steps ******/
		/****** md5 signature: 5a98b5d001a425d7f92cf169baf2c34e ******/
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
		/****** md5 signature: dc2e77b45c9717d1f94bfd6715fa1a88 ******/
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
		 BOPAlgo_SectionAttribute(const bool theAproximation, const bool thePCurveOnS1, const bool thePCurveOnS2);

		/****** BOPAlgo_SectionAttribute::Approximation ******/
		/****** md5 signature: 45ef0fe05c0096c7e949b6360ccc61d3 ******/
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
		void Approximation(const bool theApprox);

		/****** BOPAlgo_SectionAttribute::Approximation ******/
		/****** md5 signature: 9d7a1e63e72b96f66fd42fdcba5fa2cf ******/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Approximation flag.
") Approximation;
		bool Approximation();

		/****** BOPAlgo_SectionAttribute::PCurveOnS1 ******/
		/****** md5 signature: 2af023388df84319ac77815dd98963df ******/
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
		void PCurveOnS1(const bool thePCurveOnS1);

		/****** BOPAlgo_SectionAttribute::PCurveOnS1 ******/
		/****** md5 signature: 234d99020a7725aa7742352343a671ee ******/
		%feature("compactdefaultargs") PCurveOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the PCurveOnS1 flag.
") PCurveOnS1;
		bool PCurveOnS1();

		/****** BOPAlgo_SectionAttribute::PCurveOnS2 ******/
		/****** md5 signature: 7cc57650adff26c035fe0eee9aa90a8c ******/
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
		void PCurveOnS2(const bool thePCurveOnS2);

		/****** BOPAlgo_SectionAttribute::PCurveOnS2 ******/
		/****** md5 signature: 77e8a17ab9c3f3e0916769c20dfcfed2 ******/
		%feature("compactdefaultargs") PCurveOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the PCurveOnS2 flag.
") PCurveOnS2;
		bool PCurveOnS2();

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
		/****** md5 signature: 62b14561235099971f0d2e54959c078f ******/
		%feature("compactdefaultargs") ClassifyFaces;
		%feature("autodoc", "
Parameters
----------
theFaces: TopTools_ListOfShape
theSolids: TopTools_ListOfShape
theRunParallel: bool
theContext: IntTools_Context
theInParts: TopTools_IndexedDataMapOfShapeListOfShape
theShapeBoxMap: TopTools_DataMapOfShapeBox (optional, default to NCollection_DataMap<TopoDS_Shape,Bnd_Box,TopTools_ShapeMapHasher>())
theSolidsIF: TopTools_DataMapOfShapeListOfShape (optional, default to NCollection_DataMap<TopoDS_Shape,NCollection_List<TopoDS_Shape>,TopTools_ShapeMapHasher>())
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Classifies the faces <theFaces> relatively solids <theSolids>. The IN faces for solids are stored into output data map <theInParts>. //! The map <theSolidsIF> contains INTERNAL faces of the solids, to avoid their additional classification. //! Firstly, it checks the intersection of bounding boxes of the shapes. If the Box is not stored in the <theShapeBoxMap> map, it builds the box. If the bounding boxes of solid and face are interfering the classification is performed. //! It is assumed that all faces and solids are already intersected and do not have any geometrically coinciding parts without topological sharing of these parts.
") ClassifyFaces;
		static void ClassifyFaces(const TopTools_ListOfShape & theFaces, const TopTools_ListOfShape & theSolids, const bool theRunParallel, opencascade::handle<IntTools_Context> & theContext, TopTools_IndexedDataMapOfShapeListOfShape & theInParts, const TopTools_DataMapOfShapeBox & theShapeBoxMap = NCollection_DataMap<TopoDS_Shape,Bnd_Box,TopTools_ShapeMapHasher>(), const TopTools_DataMapOfShapeListOfShape & theSolidsIF = NCollection_DataMap<TopoDS_Shape,NCollection_List<TopoDS_Shape>,TopTools_ShapeMapHasher>(), const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_Tools::ComputeToleranceOfCB ******/
		/****** md5 signature: eca458e0175bf03031268d569d3f2d36 ******/
		%feature("compactdefaultargs") ComputeToleranceOfCB;
		%feature("autodoc", "
Parameters
----------
theCB: BOPDS_CommonBlock
theDS: BOPDS_PDS
theContext: IntTools_Context

Return
-------
double

Description
-----------
No available documentation.
") ComputeToleranceOfCB;
		static double ComputeToleranceOfCB(const opencascade::handle<BOPDS_CommonBlock> & theCB, const BOPDS_PDS theDS, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPAlgo_Tools::EdgesToWires ******/
		/****** md5 signature: c2c86b6b7ec6d853868fb589959cdeef ******/
		%feature("compactdefaultargs") EdgesToWires;
		%feature("autodoc", "
Parameters
----------
theEdges: TopoDS_Shape
theWires: TopoDS_Shape
theShared: bool (optional, default to false)
theAngTol: double (optional, default to 1e-8)

Return
-------
int

Description
-----------
Creates planar wires from the given edges. The input edges are expected to be planar. And for the performance sake the method does not check if the edges are really planar. Thus, the result wires will also be not planar if the input edges are not planar. The edges may be not shared, but the resulting wires will be sharing the coinciding parts and intersecting parts. The output wires may be non-manifold and contain free and multi-connected vertices. Parameters: <theEdges> - input edges; <theWires> - output wires; <theShared> - boolean flag which defines whether the input edges are already shared or have to be intersected; <theAngTol> - the angular tolerance which will be used for distinguishing the planes in which the edges are located. Default value is 1.e-8 which is used for intersection of planes in IntTools_FaceFace. Method returns the following error statuses: 0 - in case of success (at least one wire has been built); 1 - in case there are no edges in the given shape; 2 - sharing of the edges has failed.
") EdgesToWires;
		static int EdgesToWires(const TopoDS_Shape & theEdges, TopoDS_Shape & theWires, const bool theShared = false, const double theAngTol = 1e-8);

		/****** BOPAlgo_Tools::FillInternals ******/
		/****** md5 signature: 24998be60893f3c795543288d6d1103e ******/
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
		/****** md5 signature: d0501bcb44222f85a30ce9efeead84de ******/
		%feature("compactdefaultargs") IntersectVertices;
		%feature("autodoc", "
Parameters
----------
theVertices: TopTools_IndexedDataMapOfShapeReal
theFuzzyValue: double
theChains: TopTools_ListOfListOfShape

Return
-------
None

Description
-----------
Finds chains of intersecting vertices.
") IntersectVertices;
		static void IntersectVertices(const TopTools_IndexedDataMapOfShapeReal & theVertices, const double theFuzzyValue, TopTools_ListOfListOfShape & theChains);

		/****** BOPAlgo_Tools::PerformCommonBlocks ******/
		/****** md5 signature: 2f7eac18bbe1df14dcf08be76284faa6 ******/
		%feature("compactdefaultargs") PerformCommonBlocks;
		%feature("autodoc", "
Parameters
----------
theMBlocks: BOPDS_PaveBlock
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
		static void PerformCommonBlocks(NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>, NCollection_List<opencascade::handle<BOPDS_PaveBlock>> > & theMBlocks, const opencascade::handle<NCollection_BaseAllocator> & theAllocator, BOPDS_PDS & theDS, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPAlgo_Tools::PerformCommonBlocks ******/
		/****** md5 signature: acff3c463f15ba4e7f532c7fbc513d9c ******/
		%feature("compactdefaultargs") PerformCommonBlocks;
		%feature("autodoc", "
Parameters
----------
theMBlocks: BOPDS_PaveBlock
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
		static void PerformCommonBlocks(const NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>, TColStd_ListOfInteger> & theMBlocks, const opencascade::handle<NCollection_BaseAllocator> & theAllocator, BOPDS_PDS & pDS, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPAlgo_Tools::TrsfToPoint ******/
		/****** md5 signature: a8eb2c1277ec8a867ed510362ee5ba57 ******/
		%feature("compactdefaultargs") TrsfToPoint;
		%feature("autodoc", "
Parameters
----------
theBox1: Bnd_Box
theBox2: Bnd_Box
theTrsf: gp_Trsf
thePoint: gp_Pnt (optional, default to gp_Pnt(0.0,0.0,0.0))
theCriteria: double (optional, default to 1e+5)

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
		static bool TrsfToPoint(const Bnd_Box & theBox1, const Bnd_Box & theBox2, gp_Trsf & theTrsf, const gp_Pnt & thePoint = gp_Pnt(0.0,0.0,0.0), const double theCriteria = 1e+5);

		/****** BOPAlgo_Tools::WiresToFaces ******/
		/****** md5 signature: 2cce649d9a76f6ac4c2829047d111783 ******/
		%feature("compactdefaultargs") WiresToFaces;
		%feature("autodoc", "
Parameters
----------
theWires: TopoDS_Shape
theFaces: TopoDS_Shape
theAngTol: double (optional, default to 1e-8)

Return
-------
bool

Description
-----------
Creates planar faces from given planar wires. The method does not check if the wires are really planar. The input wires may be non-manifold but should be shared. The wires located in the same planes and included into other wires will create holes in the faces built from outer wires. The tolerance values of the input shapes may be modified during the operation due to projection of the edges on the planes for creation of 2D curves. Parameters: <theWires> - the given wires; <theFaces> - the output faces; <theAngTol> - the angular tolerance for distinguishing the planes in which the wires are located. Default value is 1.e-8 which is used for intersection of planes in IntTools_FaceFace. Method returns True in case of success, i.e. at least one face has been built.
") WiresToFaces;
		static bool WiresToFaces(const TopoDS_Shape & theWires, TopoDS_Shape & theFaces, const double theAngTol = 1e-8);

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
		/****** md5 signature: b37feba128ad5bc2a13f1af1768cea33 ******/
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
		/****** md5 signature: 8affdda449171035a3b1e1ddba936aa5 ******/
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
		/****** md5 signature: 71f5e7de01d26ce11577892a3a1479a7 ******/
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
		/****** md5 signature: 7729dc5bed49818f4be5c095d2e3edec ******/
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
		/****** md5 signature: ab6e404047ce7939c2c44403f9a869b9 ******/
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
		/****** md5 signature: 21b232ef2fa4dc6833102d7e8f837e25 ******/
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
		/****** md5 signature: 0fadeaddb54df7987bbd7a0b4ec0031e ******/
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
		/****** md5 signature: 3334f0118e7cce3ca31010d7af4e8348 ******/
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
		/****** md5 signature: 3fb20dab960ae2784ef2e2fdc3b8a3bc ******/
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
		/****** md5 signature: 4378c547d466f81e6dd36e39036a6a1e ******/
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
		void RepeatShape(const int theDirectionID, const int theTimes);

		/****** BOPAlgo_MakeConnected::SetArguments ******/
		/****** md5 signature: 2c9a34ce24e38023d6180d63ce152f6a ******/
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
		/****** md5 signature: b674e051e952c7be31c4b83be08e45c3 ******/
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
		/****** md5 signature: ab6e404047ce7939c2c44403f9a869b9 ******/
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
		/****** md5 signature: 68c1b8674f58a8f4959de5898cc753a0 ******/
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
		/****** md5 signature: c476dbeff0bb5e63eee6d9fd4a831473 ******/
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
		bool IsInputTrimmed(const int theDirectionID);

		/****** BOPAlgo_MakePeriodic::IsInputXTrimmed ******/
		/****** md5 signature: 2ac9ebaa2881deaca11f3e83ec5b86ec ******/
		%feature("compactdefaultargs") IsInputXTrimmed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether the input shape was already trimmed for X period.
") IsInputXTrimmed;
		bool IsInputXTrimmed();

		/****** BOPAlgo_MakePeriodic::IsInputYTrimmed ******/
		/****** md5 signature: d9324909c37650d97e178e848750cb56 ******/
		%feature("compactdefaultargs") IsInputYTrimmed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether the input shape was already trimmed for Y period.
") IsInputYTrimmed;
		bool IsInputYTrimmed();

		/****** BOPAlgo_MakePeriodic::IsInputZTrimmed ******/
		/****** md5 signature: 2a788e813ff5e5f67557d194c0484a28 ******/
		%feature("compactdefaultargs") IsInputZTrimmed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether the input shape was already trimmed for Z period.
") IsInputZTrimmed;
		bool IsInputZTrimmed();

		/****** BOPAlgo_MakePeriodic::IsPeriodic ******/
		/****** md5 signature: 8a2656f55b88c5a2d67690f7c2d7f976 ******/
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
		bool IsPeriodic(const int theDirectionID);

		/****** BOPAlgo_MakePeriodic::IsXPeriodic ******/
		/****** md5 signature: 60fabb305f5c94f18141c76177e2ea9c ******/
		%feature("compactdefaultargs") IsXPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the info about periodicity of the shape in X direction.
") IsXPeriodic;
		bool IsXPeriodic();

		/****** BOPAlgo_MakePeriodic::IsYPeriodic ******/
		/****** md5 signature: e9105b66a90e2f68705499cafa9bbdf9 ******/
		%feature("compactdefaultargs") IsYPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the info about periodicity of the shape in Y direction.
") IsYPeriodic;
		bool IsYPeriodic();

		/****** BOPAlgo_MakePeriodic::IsZPeriodic ******/
		/****** md5 signature: fb3e0d8d69ab5ab5beba3a396e4577b8 ******/
		%feature("compactdefaultargs") IsZPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the info about periodicity of the shape in Z direction.
") IsZPeriodic;
		bool IsZPeriodic();

		/****** BOPAlgo_MakePeriodic::MakePeriodic ******/
		/****** md5 signature: bf8ac59fc40fba34c30e5edf73d9d0e9 ******/
		%feature("compactdefaultargs") MakePeriodic;
		%feature("autodoc", "
Parameters
----------
theDirectionID: int
theIsPeriodic: bool
thePeriod: double (optional, default to 0.0)

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
		void MakePeriodic(const int theDirectionID, const bool theIsPeriodic, const double thePeriod = 0.0);

		/****** BOPAlgo_MakePeriodic::MakeXPeriodic ******/
		/****** md5 signature: e7a8aa54ef360e34344edbf7ef277a6b ******/
		%feature("compactdefaultargs") MakeXPeriodic;
		%feature("autodoc", "
Parameters
----------
theIsPeriodic: bool
thePeriod: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Sets the flag to make the shape periodic in X direction. 
Input parameter: theIsPeriodic Flag defining periodicity in X direction; 
Input parameter: thePeriod Required period in X direction.
") MakeXPeriodic;
		void MakeXPeriodic(const bool theIsPeriodic, const double thePeriod = 0.0);

		/****** BOPAlgo_MakePeriodic::MakeYPeriodic ******/
		/****** md5 signature: 9c72150e4aaaa53226761ab5167553de ******/
		%feature("compactdefaultargs") MakeYPeriodic;
		%feature("autodoc", "
Parameters
----------
theIsPeriodic: bool
thePeriod: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Sets the flag to make the shape periodic in Y direction. 
Input parameter: theIsPeriodic Flag defining periodicity in Y direction; 
Input parameter: thePeriod Required period in Y direction.
") MakeYPeriodic;
		void MakeYPeriodic(const bool theIsPeriodic, const double thePeriod = 0.0);

		/****** BOPAlgo_MakePeriodic::MakeZPeriodic ******/
		/****** md5 signature: 73eec5dc170a0a25ba6de5383474ea8f ******/
		%feature("compactdefaultargs") MakeZPeriodic;
		%feature("autodoc", "
Parameters
----------
theIsPeriodic: bool
thePeriod: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Sets the flag to make the shape periodic in Z direction. 
Input parameter: theIsPeriodic Flag defining periodicity in Z direction; 
Input parameter: thePeriod Required period in Z direction.
") MakeZPeriodic;
		void MakeZPeriodic(const bool theIsPeriodic, const double thePeriod = 0.0);

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
		/****** md5 signature: dac5304e8b52207a70f007bca42c2696 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
theDirectionID: int

Return
-------
double

Description
-----------
Returns the Period of the shape in specified direction. 
Input parameter: theDirectionID The direction's ID.
") Period;
		double Period(const int theDirectionID);

		/****** BOPAlgo_MakePeriodic::PeriodFirst ******/
		/****** md5 signature: b3caea0a49fbc914f771bff51b5aa1d8 ******/
		%feature("compactdefaultargs") PeriodFirst;
		%feature("autodoc", "
Parameters
----------
theDirectionID: int

Return
-------
double

Description
-----------
Returns the first periodic parameter in the specified direction. 
Input parameter: theDirectionID The direction's ID.
") PeriodFirst;
		double PeriodFirst(const int theDirectionID);

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
		/****** md5 signature: 3f3c221e18bbe930dbc4743bb8716528 ******/
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
		const TopoDS_Shape RepeatShape(const int theDirectionID, const int theTimes);

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
		/****** md5 signature: 952a93794d7923afaf6a83515722e24b ******/
		%feature("compactdefaultargs") SetTrimmed;
		%feature("autodoc", "
Parameters
----------
theDirectionID: int
theIsTrimmed: bool
theFirst: double (optional, default to 0.0)

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
		void SetTrimmed(const int theDirectionID, const bool theIsTrimmed, const double theFirst = 0.0);

		/****** BOPAlgo_MakePeriodic::SetXTrimmed ******/
		/****** md5 signature: be621f6a3c7a7078e261a1b28412e584 ******/
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
		void SetXTrimmed(const bool theIsTrimmed, const bool theFirst = 0.0);

		/****** BOPAlgo_MakePeriodic::SetYTrimmed ******/
		/****** md5 signature: 66a5102bf83da3a95a57cfbef00e9f78 ******/
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
		void SetYTrimmed(const bool theIsTrimmed, const bool theFirst = 0.0);

		/****** BOPAlgo_MakePeriodic::SetZTrimmed ******/
		/****** md5 signature: 81c09c579cc5e3ae61985e3d86513afe ******/
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
		void SetZTrimmed(const bool theIsTrimmed, const bool theFirst = 0.0);

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
		/****** md5 signature: aa01f8b7de0ca0cfdd2f0b88fbfc1b4f ******/
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
		static int ToDirectionID(const int theDirectionID);

		/****** BOPAlgo_MakePeriodic::XPeriod ******/
		/****** md5 signature: 10574343d5fbef556cb67fb6fecaca0f ******/
		%feature("compactdefaultargs") XPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the XPeriod of the shape.
") XPeriod;
		double XPeriod();

		/****** BOPAlgo_MakePeriodic::XPeriodFirst ******/
		/****** md5 signature: b9d05b86362a7a9acd2d0e14b8c3afb8 ******/
		%feature("compactdefaultargs") XPeriodFirst;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the first parameter for the X period.
") XPeriodFirst;
		double XPeriodFirst();

		/****** BOPAlgo_MakePeriodic::XRepeat ******/
		/****** md5 signature: ec1e2ecd5b020a26d96149a6ba57018e ******/
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
		const TopoDS_Shape XRepeat(const int theTimes);

		/****** BOPAlgo_MakePeriodic::YPeriod ******/
		/****** md5 signature: 38394c54f1a568bc9c029537148d447e ******/
		%feature("compactdefaultargs") YPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the YPeriod of the shape.
") YPeriod;
		double YPeriod();

		/****** BOPAlgo_MakePeriodic::YPeriodFirst ******/
		/****** md5 signature: 01ad0af480e0608514f559e840dded47 ******/
		%feature("compactdefaultargs") YPeriodFirst;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the first parameter for the Y period.
") YPeriodFirst;
		double YPeriodFirst();

		/****** BOPAlgo_MakePeriodic::YRepeat ******/
		/****** md5 signature: 1172aff1cf9adc999e8f5c08212053a8 ******/
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
		const TopoDS_Shape YRepeat(const int theTimes);

		/****** BOPAlgo_MakePeriodic::ZPeriod ******/
		/****** md5 signature: 009c45e63cb1fc2f3900dcc88346ed52 ******/
		%feature("compactdefaultargs") ZPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the ZPeriod of the shape.
") ZPeriod;
		double ZPeriod();

		/****** BOPAlgo_MakePeriodic::ZPeriodFirst ******/
		/****** md5 signature: 7d555a8173524ed8163fe32c6ca43cb4 ******/
		%feature("compactdefaultargs") ZPeriodFirst;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the first parameter for the Z period.
") ZPeriodFirst;
		double ZPeriodFirst();

		/****** BOPAlgo_MakePeriodic::ZRepeat ******/
		/****** md5 signature: 72d61152e89fd65f5cb5e5084ea1402a ******/
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
		const TopoDS_Shape ZRepeat(const int theTimes);

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

		/****** BOPAlgo_ArgumentAnalyzer::ArgumentTypeMode ******/
		/****** md5 signature: 8d5d7cab0f9671d1063f1b33d37fcf32 ******/
		%feature("compactdefaultargs") ArgumentTypeMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) mode that means checking types of shapes.
") ArgumentTypeMode;
		bool & ArgumentTypeMode();

		/****** BOPAlgo_ArgumentAnalyzer::ContinuityMode ******/
		/****** md5 signature: 2e4bc9246d9318e4d372446be8422a58 ******/
		%feature("compactdefaultargs") ContinuityMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) mode that means checking of problem of continuity of the shape.
") ContinuityMode;
		bool & ContinuityMode();

		/****** BOPAlgo_ArgumentAnalyzer::CurveOnSurfaceMode ******/
		/****** md5 signature: 4049ad8fdeb5659e95d09924f705a398 ******/
		%feature("compactdefaultargs") CurveOnSurfaceMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) mode that means checking of problem of invalid curve on surface.
") CurveOnSurfaceMode;
		bool & CurveOnSurfaceMode();

		/****** BOPAlgo_ArgumentAnalyzer::GetCheckResult ******/
		/****** md5 signature: a30b57cb97db17acd5914dd7d078c5b9 ******/
		%feature("compactdefaultargs") GetCheckResult;
		%feature("autodoc", "Return
-------
NCollection_List<BOPAlgo_CheckResult>

Description
-----------
returns a result of test.
") GetCheckResult;
		const NCollection_List<BOPAlgo_CheckResult> & GetCheckResult();

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
		/****** md5 signature: f0c15de856081600032bd57df1269180 ******/
		%feature("compactdefaultargs") HasFaulty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
result of test.
") HasFaulty;
		bool HasFaulty();

		/****** BOPAlgo_ArgumentAnalyzer::MergeEdgeMode ******/
		/****** md5 signature: 564735d658928d09ed626e1853996d0b ******/
		%feature("compactdefaultargs") MergeEdgeMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) mode that means checking of problem of merging edges.
") MergeEdgeMode;
		bool & MergeEdgeMode();

		/****** BOPAlgo_ArgumentAnalyzer::MergeVertexMode ******/
		/****** md5 signature: a8a54d058cc36fef3b55e242c6ad97dc ******/
		%feature("compactdefaultargs") MergeVertexMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) mode that means checking of problem of merging vertices.
") MergeVertexMode;
		bool & MergeVertexMode();

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
		/****** md5 signature: 058a93f55ca886306283dd0509f66ebe ******/
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

		/****** BOPAlgo_ArgumentAnalyzer::RebuildFaceMode ******/
		/****** md5 signature: 47e6518f9765bc5fedac01b0225ab403 ******/
		%feature("compactdefaultargs") RebuildFaceMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) mode that means checking of possibility to split or rebuild faces.
") RebuildFaceMode;
		bool & RebuildFaceMode();

		/****** BOPAlgo_ArgumentAnalyzer::SelfInterMode ******/
		/****** md5 signature: 036060be147fef240365657114bd327d ******/
		%feature("compactdefaultargs") SelfInterMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) mode that means checking of self-intersection of shapes.
") SelfInterMode;
		bool & SelfInterMode();

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

		/****** BOPAlgo_ArgumentAnalyzer::SmallEdgeMode ******/
		/****** md5 signature: 4cfc154cc2a189477580c9bcded92bce ******/
		%feature("compactdefaultargs") SmallEdgeMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) mode that means checking of small edges.
") SmallEdgeMode;
		bool & SmallEdgeMode();

		/****** BOPAlgo_ArgumentAnalyzer::StopOnFirstFaulty ******/
		/****** md5 signature: a2a1c910da5a2ea2e9a9ec2d095eef73 ******/
		%feature("compactdefaultargs") StopOnFirstFaulty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns ref.
") StopOnFirstFaulty;
		bool & StopOnFirstFaulty();

		/****** BOPAlgo_ArgumentAnalyzer::TangentMode ******/
		/****** md5 signature: 239bd3b758dc47f0ee0b370cf3b7f353 ******/
		%feature("compactdefaultargs") TangentMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (modifiable) mode that means checking of tangency between subshapes.
") TangentMode;
		bool & TangentMode();

		%extend{
			bool GetStopOnFirstFaulty() { return self->StopOnFirstFaulty(); }
			void SetStopOnFirstFaulty(bool value) { self->StopOnFirstFaulty() = value; }
		};
		%extend{
			bool GetArgumentTypeMode() { return self->ArgumentTypeMode(); }
			void SetArgumentTypeMode(bool value) { self->ArgumentTypeMode() = value; }
		};
		%extend{
			bool GetSelfInterMode() { return self->SelfInterMode(); }
			void SetSelfInterMode(bool value) { self->SelfInterMode() = value; }
		};
		%extend{
			bool GetSmallEdgeMode() { return self->SmallEdgeMode(); }
			void SetSmallEdgeMode(bool value) { self->SmallEdgeMode() = value; }
		};
		%extend{
			bool GetRebuildFaceMode() { return self->RebuildFaceMode(); }
			void SetRebuildFaceMode(bool value) { self->RebuildFaceMode() = value; }
		};
		%extend{
			bool GetTangentMode() { return self->TangentMode(); }
			void SetTangentMode(bool value) { self->TangentMode() = value; }
		};
		%extend{
			bool GetMergeVertexMode() { return self->MergeVertexMode(); }
			void SetMergeVertexMode(bool value) { self->MergeVertexMode() = value; }
		};
		%extend{
			bool GetMergeEdgeMode() { return self->MergeEdgeMode(); }
			void SetMergeEdgeMode(bool value) { self->MergeEdgeMode() = value; }
		};
		%extend{
			bool GetContinuityMode() { return self->ContinuityMode(); }
			void SetContinuityMode(bool value) { self->ContinuityMode() = value; }
		};
		%extend{
			bool GetCurveOnSurfaceMode() { return self->CurveOnSurfaceMode(); }
			void SetCurveOnSurfaceMode(bool value) { self->CurveOnSurfaceMode() = value; }
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
		/****** md5 signature: 391511284b58a222dae1f3143775e8b2 ******/
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
		/****** md5 signature: 94fba414957cd1aad374e6ae91b93e5d ******/
		%feature("compactdefaultargs") IsAvoidInternalShapes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the AvoidInternalShapes flag.
") IsAvoidInternalShapes;
		bool IsAvoidInternalShapes();

		/****** BOPAlgo_BuilderArea::Loops ******/
		/****** md5 signature: 906348aee354bcba6262f302d6f94b85 ******/
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
		/****** md5 signature: d88a017bc2d3e72e7e5ee4d3c37d12b6 ******/
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
		void SetAvoidInternalShapes(const bool theAvoidInternal);

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
		/****** md5 signature: fea8c4e2d79398c17c89d187dbdd386b ******/
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
		/****** md5 signature: dcc9fb3797b3fd8183a75c7bc6f77ab4 ******/
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
		/****** md5 signature: 4c6dbd89dd2ca8c5e32b51a147ff88b7 ******/
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
		/****** md5 signature: a4c5053067f6df96c7d3f9722284805a ******/
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has been deleted during operation.
") HasDeleted;
		bool HasDeleted();

		/****** BOPAlgo_BuilderShape::HasGenerated ******/
		/****** md5 signature: 7fd3677661381d111f522bfe87258b83 ******/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has generated shapes during operation.
") HasGenerated;
		bool HasGenerated();

		/****** BOPAlgo_BuilderShape::HasHistory ******/
		/****** md5 signature: 4e7f7d67e0066c12e74fcbd6a94053ea ******/
		%feature("compactdefaultargs") HasHistory;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns flag of history availability.
") HasHistory;
		bool HasHistory();

		/****** BOPAlgo_BuilderShape::HasModified ******/
		/****** md5 signature: 59a57280f79a37ba1b7e4331f6e4781f ******/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if any of the input shapes has been modified during operation.
") HasModified;
		bool HasModified();

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
		/****** md5 signature: a257eca6a915f2cdd0cc767e9727471e ******/
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
		bool IsDeleted(const TopoDS_Shape & theS);

		/****** BOPAlgo_BuilderShape::Modified ******/
		/****** md5 signature: d69798cce41be6f29c490bf606d02d57 ******/
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
		/****** md5 signature: 99738357009a5a30fb7a877bbcbe43fb ******/
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
		void SetToFillHistory(const bool theHistFlag);

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
		/****** md5 signature: 7729dc5bed49818f4be5c095d2e3edec ******/
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
		/****** md5 signature: 1191aafd01d0e2c0723631e17db246e8 ******/
		%feature("compactdefaultargs") IsAvoidBuildPCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag to avoid building of p-curves of edges on faces.
") IsAvoidBuildPCurve;
		bool IsAvoidBuildPCurve();

		/****** BOPAlgo_PaveFiller::NonDestructive ******/
		/****** md5 signature: 2266612e451b45938bb1570755550cf8 ******/
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated.
") NonDestructive;
		bool NonDestructive();

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
		/****** md5 signature: 058a93f55ca886306283dd0509f66ebe ******/
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
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_PaveFiller::SetArguments ******/
		/****** md5 signature: f784627b8f41b340faa4284816ab82a0 ******/
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

		/****** BOPAlgo_PaveFiller::SetArguments ******/
		/****** md5 signature: aa4855a2ee60e020d48efe30e876494a ******/
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
Sets the arguments for operation (move semantics).
") SetArguments;
		void SetArguments(TopTools_ListOfShape & theLS);

		/****** BOPAlgo_PaveFiller::SetAvoidBuildPCurve ******/
		/****** md5 signature: e8a329852a4fa99b9dbab7c6a5a73fb1 ******/
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
		void SetAvoidBuildPCurve(const bool theValue);

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
		/****** md5 signature: 06a1f52879d7f40122599b1686f0e41b ******/
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
		void SetNonDestructive(const bool theFlag);

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
		/****** md5 signature: 058a93f55ca886306283dd0509f66ebe ******/
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
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_ShellSplitter::Shells ******/
		/****** md5 signature: 530065fb92e5193f66e168b681feaa40 ******/
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
		/****** md5 signature: 8affdda449171035a3b1e1ddba936aa5 ******/
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
		/****** md5 signature: 164fbb267fc62d7b3498716c59579efa ******/
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
		/****** md5 signature: 058a93f55ca886306283dd0509f66ebe ******/
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
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** md5 signature: 7729dc5bed49818f4be5c095d2e3edec ******/
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
		/****** md5 signature: e511996b4ef1296d2d40ac2d2dceb479 ******/
		%feature("compactdefaultargs") BuildBOP;
		%feature("autodoc", "
Parameters
----------
theObjects: TopTools_ListOfShape
theObjState: TopAbs_State
theTools: TopTools_ListOfShape
theToolsState: TopAbs_State
theRange: Message_ProgressRange
theReport: Message_Report (optional, default to nullptr)

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
		virtual void BuildBOP(const TopTools_ListOfShape & theObjects, const TopAbs_State theObjState, const TopTools_ListOfShape & theTools, const TopAbs_State theToolsState, const Message_ProgressRange & theRange, opencascade::handle<Message_Report > theReport = nullptr);

		/****** BOPAlgo_Builder::BuildBOP ******/
		/****** md5 signature: d10469cf03a8ad6bc53e752be3c7aeae ******/
		%feature("compactdefaultargs") BuildBOP;
		%feature("autodoc", "
Parameters
----------
theObjects: TopTools_ListOfShape
theTools: TopTools_ListOfShape
theOperation: BOPAlgo_Operation
theRange: Message_ProgressRange
theReport: Message_Report (optional, default to nullptr)

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
		void BuildBOP(const TopTools_ListOfShape & theObjects, const TopTools_ListOfShape & theTools, const BOPAlgo_Operation theOperation, const Message_ProgressRange & theRange, opencascade::handle<Message_Report > theReport = nullptr);

		/****** BOPAlgo_Builder::CheckInverted ******/
		/****** md5 signature: 78188b8ce2947b165a496dc28f65cbcf ******/
		%feature("compactdefaultargs") CheckInverted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag defining whether the check for input solids on inverted status should be performed or not.
") CheckInverted;
		bool CheckInverted();

		/****** BOPAlgo_Builder::Clear ******/
		/****** md5 signature: 1c0d2ab59d0f6282725648dcdf130adb ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the algorithm.
") Clear;
		void Clear();

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
		/****** md5 signature: bb8a73337bb6d0cfd7c39eb8191b7241 ******/
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
		/****** md5 signature: 4933fd2f0edc15441d15a9e3162a6a3b ******/
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated.
") NonDestructive;
		bool NonDestructive();

		/****** BOPAlgo_Builder::Origins ******/
		/****** md5 signature: 9f99bce58c765fa174392333e652b14f ******/
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
		/****** md5 signature: 058a93f55ca886306283dd0509f66ebe ******/
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
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** md5 signature: 8857b821bda4b4330a297f4c0e76d0ce ******/
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
		/****** md5 signature: 99f6323623bc052bf1fd5de947d7c818 ******/
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
		void SetCheckInverted(const bool theCheck);

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
		/****** md5 signature: 38476983f1e33d19d25886356719adec ******/
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
		void SetNonDestructive(const bool theFlag);

		/****** BOPAlgo_Builder::ShapesSD ******/
		/****** md5 signature: 097ae07dc34f29a17b47f6ff512e0074 ******/
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
		/****** md5 signature: 058a93f55ca886306283dd0509f66ebe ******/
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
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** md5 signature: c4c90bd362e588b34a4d708ac60b40dd ******/
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
		/****** md5 signature: 058a93f55ca886306283dd0509f66ebe ******/
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
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** md5 signature: 058a93f55ca886306283dd0509f66ebe ******/
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
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_CheckerSI::SetLevelOfCheck ******/
		/****** md5 signature: 4825454b916e49b2f329104b01c86201 ******/
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
		void SetLevelOfCheck(const int theLevel);

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
		/****** md5 signature: af19be17bae83a8261577409885ca2a1 ******/
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

		/****** BOPAlgo_RemoveFeatures::Clear ******/
		/****** md5 signature: ab6e404047ce7939c2c44403f9a869b9 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the contents of the algorithm from previous run, allowing reusing it for following removals.
") Clear;
		void Clear();

		/****** BOPAlgo_RemoveFeatures::FacesToRemove ******/
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
		/****** md5 signature: 058a93f55ca886306283dd0509f66ebe ******/
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
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** md5 signature: 3ef7941a270d0b3e55551c13d8df79f5 ******/
		%feature("compactdefaultargs") AddAllToResult;
		%feature("autodoc", "
Parameters
----------
theMaterial: int (optional, default to 0)
theUpdate: bool (optional, default to false)

Return
-------
None

Description
-----------
Add all split parts to result. <theMaterial> defines the removal of internal boundaries; <theUpdate> parameter defines whether to remove boundaries now or not.
") AddAllToResult;
		void AddAllToResult(const int theMaterial = 0, const bool theUpdate = false);

		/****** BOPAlgo_CellsBuilder::AddToResult ******/
		/****** md5 signature: f86327fa95a7b6e7469409bb19ea9706 ******/
		%feature("compactdefaultargs") AddToResult;
		%feature("autodoc", "
Parameters
----------
theLSToTake: TopTools_ListOfShape
theLSToAvoid: TopTools_ListOfShape
theMaterial: int (optional, default to 0)
theUpdate: bool (optional, default to false)

Return
-------
None

Description
-----------
Adding the parts to result. The parts are defined by two lists of shapes: <theLSToTake> defines the arguments which parts should be taken into result; <theLSToAvoid> defines the arguments which parts should not be taken into result; To be taken into result the part must be IN for all shapes from the list <theLSToTake> and must be OUT of all shapes from the list <theLSToAvoid>. //! To remove internal boundaries between any cells in the result <theMaterial> variable should be used. The boundaries between cells with the same material will be removed. Default value is 0. Thus, to remove any boundary the value of this variable should not be equal to 0. <theUpdate> parameter defines whether to remove boundaries now or not.
") AddToResult;
		void AddToResult(const TopTools_ListOfShape & theLSToTake, const TopTools_ListOfShape & theLSToAvoid, const int theMaterial = 0, const bool theUpdate = false);

		/****** BOPAlgo_CellsBuilder::Clear ******/
		/****** md5 signature: 1c0d2ab59d0f6282725648dcdf130adb ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Redefined method Clear - clears the contents.
") Clear;
		void Clear();

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
		/****** md5 signature: faf0c988c96a09987667f5ce7411c60e ******/
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
		/****** md5 signature: 1c0d2ab59d0f6282725648dcdf130adb ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the data.
") Clear;
		void Clear();

		/****** BOPAlgo_MakerVolume::Faces ******/
		/****** md5 signature: aab441ace6b14fe44acdb7650b6002bd ******/
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
		/****** md5 signature: 94fba414957cd1aad374e6ae91b93e5d ******/
		%feature("compactdefaultargs") IsAvoidInternalShapes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the AvoidInternalShapes flag.
") IsAvoidInternalShapes;
		bool IsAvoidInternalShapes();

		/****** BOPAlgo_MakerVolume::IsIntersect ******/
		/****** md5 signature: b0d84bcf5603f56e04732d261724d9ce ******/
		%feature("compactdefaultargs") IsIntersect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag <myIntersect>.
") IsIntersect;
		bool IsIntersect();

		/****** BOPAlgo_MakerVolume::Perform ******/
		/****** md5 signature: 058a93f55ca886306283dd0509f66ebe ******/
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
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BOPAlgo_MakerVolume::SetAvoidInternalShapes ******/
		/****** md5 signature: d88a017bc2d3e72e7e5ee4d3c37d12b6 ******/
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
		void SetAvoidInternalShapes(const bool theAvoidInternal);

		/****** BOPAlgo_MakerVolume::SetIntersect ******/
		/****** md5 signature: f4c82cbb718e596ac37e167fb284bc04 ******/
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
		void SetIntersect(const bool bIntersect);

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
		/****** md5 signature: 1c0d2ab59d0f6282725648dcdf130adb ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears internal fields and arguments.
") Clear;
		void Clear();

		/****** BOPAlgo_ToolsProvider::SetTools ******/
		/****** md5 signature: 08e7af6e8687d13c73f198e235462e9d ******/
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
		/****** md5 signature: f354d26768926e996d17ca393c56586f ******/
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
		/****** md5 signature: 1c0d2ab59d0f6282725648dcdf130adb ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears internal fields and arguments.
") Clear;
		void Clear();

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
		/****** md5 signature: 058a93f55ca886306283dd0509f66ebe ******/
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
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** md5 signature: 058a93f55ca886306283dd0509f66ebe ******/
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
		void Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

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
