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
%define SHAPEPROCESSDOCSTRING
"ShapeProcess module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_shapeprocess.html"
%enddef
%module (package="OCC.Core", docstring=SHAPEPROCESSDOCSTRING) ShapeProcess


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
#include <bitset>
using namespace std;
#include<ShapeProcess_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<TCollection_module.hxx>
#include<Resource_module.hxx>
#include<TopoDS_module.hxx>
#include<BRepTools_module.hxx>
#include<TopTools_module.hxx>
#include<ShapeExtend_module.hxx>
#include<GeomAbs_module.hxx>
#include<TopAbs_module.hxx>
#include<ShapeBuild_module.hxx>
#include<BRep_module.hxx>
#include<TShort_module.hxx>
#include<TColGeom_module.hxx>
#include<Poly_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<TopLoc_module.hxx>
#include<ShapeExtend_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Message.i
%import TCollection.i
%import Resource.i
%import TopoDS.i
%import BRepTools.i
%import TopTools.i
%import ShapeExtend.i
%import GeomAbs.i
%import TopAbs.i
%import ShapeBuild.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(ShapeProcess_Context)
%wrap_handle(ShapeProcess_Operator)
%wrap_handle(ShapeProcess_ShapeContext)
%wrap_handle(ShapeProcess_UOperator)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************
* class ShapeProcess *
*********************/
%rename(shapeprocess) ShapeProcess;
class ShapeProcess {
	public:
/* public enums */
enum Operation {
	First = 0,
	DirectFaces = First,
	SameParameter = 2,
	SetTolerance = 3,
	SplitAngle = 4,
	BSplineRestriction = 5,
	ElementaryToRevolution = 6,
	SweptToElementary = 7,
	SurfaceToBSpline = 8,
	ToBezier = 9,
	SplitContinuity = 10,
	SplitClosedFaces = 11,
	FixWireGaps = 12,
	FixFaceSize = 13,
	DropSmallSolids = 14,
	DropSmallEdges = 15,
	FixShape = 16,
	SplitClosedEdges = 17,
	SplitCommonVertex = 18,
	Last = SplitCommonVertex,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Operation(IntEnum):
	First = 0
	DirectFaces = First
	SameParameter = 2
	SetTolerance = 3
	SplitAngle = 4
	BSplineRestriction = 5
	ElementaryToRevolution = 6
	SweptToElementary = 7
	SurfaceToBSpline = 8
	ToBezier = 9
	SplitContinuity = 10
	SplitClosedFaces = 11
	FixWireGaps = 12
	FixFaceSize = 13
	DropSmallSolids = 14
	DropSmallEdges = 15
	FixShape = 16
	SplitClosedEdges = 17
	SplitCommonVertex = 18
	Last = SplitCommonVertex
First = Operation.First
DirectFaces = Operation.DirectFaces
SameParameter = Operation.SameParameter
SetTolerance = Operation.SetTolerance
SplitAngle = Operation.SplitAngle
BSplineRestriction = Operation.BSplineRestriction
ElementaryToRevolution = Operation.ElementaryToRevolution
SweptToElementary = Operation.SweptToElementary
SurfaceToBSpline = Operation.SurfaceToBSpline
ToBezier = Operation.ToBezier
SplitContinuity = Operation.SplitContinuity
SplitClosedFaces = Operation.SplitClosedFaces
FixWireGaps = Operation.FixWireGaps
FixFaceSize = Operation.FixFaceSize
DropSmallSolids = Operation.DropSmallSolids
DropSmallEdges = Operation.DropSmallEdges
FixShape = Operation.FixShape
SplitClosedEdges = Operation.SplitClosedEdges
SplitCommonVertex = Operation.SplitCommonVertex
Last = Operation.Last
};
/* end python proxy for enums */

		/****** ShapeProcess::FindOperator ******/
		/****** md5 signature: ac666265198f26dac6234760a5de3179 ******/
		%feature("compactdefaultargs") FindOperator;
		%feature("autodoc", "
Parameters
----------
name: str
op: ShapeProcess_Operator

Return
-------
bool

Description
-----------
Finds operator by its name.
") FindOperator;
		static Standard_Boolean FindOperator(Standard_CString name, opencascade::handle<ShapeProcess_Operator> & op);

		/****** ShapeProcess::Perform ******/
		/****** md5 signature: b09a663248f0a938268494641ee9386a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
context: ShapeProcess_Context
seq: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Performs a specified sequence of operators on Context Resource file and other data should be already loaded to Context (including description of sequence seq).
") Perform;
		static Standard_Boolean Perform(const opencascade::handle<ShapeProcess_Context> & context, Standard_CString seq, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** ShapeProcess::Perform ******/
		/****** md5 signature: 1a9b7124b83f1109d58f5a7bb67b2dc2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theContext: ShapeProcess_Context
theOperations: bitset<Operation::Last + 1 >
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Performs a specified sequence of operators on @p theContext. 
Parameter theContext Context to perform operations on. Contains the shape to process and processing parameters. If processing parameters are not set, default values are used. Parameters should be in a scope of operation, for example, instead of 'FromSTEP.FixShape.Tolerance3d'	we should use just 'FixShape.Tolerance3d'. 
Parameter theOperations Bitset of operations to perform. 
Parameter theProgress Progress indicator. 
Return: true if at least one operation was performed, false otherwise.
") Perform;
		static Standard_Boolean Perform(const opencascade::handle<ShapeProcess_Context> & theContext, bitset<Operation::Last + 1 > theOperations, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** ShapeProcess::RegisterOperator ******/
		/****** md5 signature: f3fc4533ca3193906e102f361e526b9e ******/
		%feature("compactdefaultargs") RegisterOperator;
		%feature("autodoc", "
Parameters
----------
name: str
op: ShapeProcess_Operator

Return
-------
bool

Description
-----------
Registers operator to make it visible for Performer.
") RegisterOperator;
		static Standard_Boolean RegisterOperator(Standard_CString name, const opencascade::handle<ShapeProcess_Operator> & op);

		/****** ShapeProcess::ToOperationFlag ******/
		/****** md5 signature: fc2c7e06a6ec1c89c6f54a912f7afaef ******/
		%feature("compactdefaultargs") ToOperationFlag;
		%feature("autodoc", "
Parameters
----------
theName: char *

Return
-------
std::pair<Operation, bool >

Description
-----------
Converts operation name to operation flag. 
Parameter theName Operation name. 
Return: Operation flag and true if the operation name is valid, false otherwise.
") ToOperationFlag;
		static std::pair<Operation, bool > ToOperationFlag(const char * theName);

};


%extend ShapeProcess {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class ShapeProcess_Context *
*****************************/
class ShapeProcess_Context : public Standard_Transient {
	public:
		/****** ShapeProcess_Context::ShapeProcess_Context ******/
		/****** md5 signature: 9e6b7dcdae0dc3a0d529e7257dafbe61 ******/
		%feature("compactdefaultargs") ShapeProcess_Context;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tool.
") ShapeProcess_Context;
		 ShapeProcess_Context();

		/****** ShapeProcess_Context::ShapeProcess_Context ******/
		/****** md5 signature: 11c95383da3f2b0444e62f214ea97e61 ******/
		%feature("compactdefaultargs") ShapeProcess_Context;
		%feature("autodoc", "
Parameters
----------
file: str
scope: str (optional, default to "")

Return
-------
None

Description
-----------
Creates a new tool and initialises by name of resource file and (if specified) starting scope Calls method Init().
") ShapeProcess_Context;
		 ShapeProcess_Context(Standard_CString file, Standard_CString scope = "");

		/****** ShapeProcess_Context::BooleanVal ******/
		/****** md5 signature: 9ef6eb8d9ad5133cb1a4c75139909634 ******/
		%feature("compactdefaultargs") BooleanVal;
		%feature("autodoc", "
Parameters
----------
param: str
def: bool

Return
-------
bool

Description
-----------
No available documentation.
") BooleanVal;
		Standard_Boolean BooleanVal(Standard_CString param, const Standard_Boolean def);

		/****** ShapeProcess_Context::GetBoolean ******/
		/****** md5 signature: 9df27916e333b4d27bedc4c44beaf1d4 ******/
		%feature("compactdefaultargs") GetBoolean;
		%feature("autodoc", "
Parameters
----------
param: str

Return
-------
val: bool

Description
-----------
No available documentation.
") GetBoolean;
		Standard_Boolean GetBoolean(Standard_CString param, Standard_Boolean &OutValue);

		/****** ShapeProcess_Context::GetInteger ******/
		/****** md5 signature: f7b7ac81028a2992ab387f7d40982c83 ******/
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "
Parameters
----------
param: str

Return
-------
val: int

Description
-----------
No available documentation.
") GetInteger;
		Standard_Boolean GetInteger(Standard_CString param, Standard_Integer &OutValue);

		/****** ShapeProcess_Context::GetReal ******/
		/****** md5 signature: f76f4f5bd096be97f6395d4ae2b0c881 ******/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "
Parameters
----------
param: str

Return
-------
val: float

Description
-----------
No available documentation.
") GetReal;
		Standard_Boolean GetReal(Standard_CString param, Standard_Real &OutValue);

		/****** ShapeProcess_Context::GetString ******/
		/****** md5 signature: d1aa90ddcb8f0c6991ce0ba3f0def1c1 ******/
		%feature("compactdefaultargs") GetString;
		%feature("autodoc", "
Parameters
----------
param: str
val: str

Return
-------
bool

Description
-----------
Get value of parameter as being of specific type Returns False if parameter is not defined or has a wrong type.
") GetString;
		Standard_Boolean GetString(Standard_CString param, TCollection_AsciiString & val);

		/****** ShapeProcess_Context::Init ******/
		/****** md5 signature: 847da2713ad977e0b2dcccc69df0b25c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
file: str
scope: str (optional, default to "")

Return
-------
bool

Description
-----------
Initialises a tool by loading resource file and (if specified) sets starting scope Returns False if resource file not found.
") Init;
		Standard_Boolean Init(Standard_CString file, Standard_CString scope = "");

		/****** ShapeProcess_Context::IntegerVal ******/
		/****** md5 signature: 9d0714ed8df23981995ae835d1b115f2 ******/
		%feature("compactdefaultargs") IntegerVal;
		%feature("autodoc", "
Parameters
----------
param: str
def: int

Return
-------
int

Description
-----------
No available documentation.
") IntegerVal;
		Standard_Integer IntegerVal(Standard_CString param, const Standard_Integer def);

		/****** ShapeProcess_Context::IsParamSet ******/
		/****** md5 signature: b7b37179e228d9c93cbc70f5f2a1f388 ******/
		%feature("compactdefaultargs") IsParamSet;
		%feature("autodoc", "
Parameters
----------
param: str

Return
-------
bool

Description
-----------
Returns True if parameter is defined in the resource file.
") IsParamSet;
		Standard_Boolean IsParamSet(Standard_CString param);

		/****** ShapeProcess_Context::LoadResourceManager ******/
		/****** md5 signature: e91c46eb5bef823da15ad18b28716741 ******/
		%feature("compactdefaultargs") LoadResourceManager;
		%feature("autodoc", "
Parameters
----------
file: str

Return
-------
opencascade::handle<Resource_Manager>

Description
-----------
Loading Resource_Manager object if this object not equal internal static Resource_Manager object or internal static Resource_Manager object is null.
") LoadResourceManager;
		opencascade::handle<Resource_Manager> LoadResourceManager(Standard_CString file);

		/****** ShapeProcess_Context::Messenger ******/
		/****** md5 signature: c51845cdafadb143338935f519a3d7c7 ******/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "Return
-------
opencascade::handle<Message_Messenger>

Description
-----------
Returns Messenger used for outputting messages.
") Messenger;
		opencascade::handle<Message_Messenger> Messenger();

		/****** ShapeProcess_Context::RealVal ******/
		/****** md5 signature: b3e5c67f2dd7912ff4b94cd089eeda0a ******/
		%feature("compactdefaultargs") RealVal;
		%feature("autodoc", "
Parameters
----------
param: str
def: float

Return
-------
float

Description
-----------
No available documentation.
") RealVal;
		Standard_Real RealVal(Standard_CString param, const Standard_Real def);

		/****** ShapeProcess_Context::ResourceManager ******/
		/****** md5 signature: 6cc7683a80ec93119c306087ce89d4fc ******/
		%feature("compactdefaultargs") ResourceManager;
		%feature("autodoc", "Return
-------
opencascade::handle<Resource_Manager>

Description
-----------
Returns internal Resource_Manager object.
") ResourceManager;
		const opencascade::handle<Resource_Manager> & ResourceManager();

		/****** ShapeProcess_Context::SetMessenger ******/
		/****** md5 signature: a9749da4085afccb49a47ccebbb86045 ******/
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "
Parameters
----------
messenger: Message_Messenger

Return
-------
None

Description
-----------
Sets Messenger used for outputting messages.
") SetMessenger;
		void SetMessenger(const opencascade::handle<Message_Messenger> & messenger);

		/****** ShapeProcess_Context::SetScope ******/
		/****** md5 signature: 8ee5ae53e9b457435d5d63fa00ffc340 ******/
		%feature("compactdefaultargs") SetScope;
		%feature("autodoc", "
Parameters
----------
scope: str

Return
-------
None

Description
-----------
Set a new (sub)scope.
") SetScope;
		void SetScope(Standard_CString scope);

		/****** ShapeProcess_Context::SetTraceLevel ******/
		/****** md5 signature: b2d3fab409a6e2832ea6fb56a22812c1 ******/
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "
Parameters
----------
tracelev: int

Return
-------
None

Description
-----------
Sets trace level used for outputting messages - 0: no trace at all - 1: errors - 2: errors and warnings - 3: all messages Default is 1: Errors traced.
") SetTraceLevel;
		void SetTraceLevel(const Standard_Integer tracelev);

		/****** ShapeProcess_Context::StringVal ******/
		/****** md5 signature: ec376c06c836704e6cd2528dafcf8254 ******/
		%feature("compactdefaultargs") StringVal;
		%feature("autodoc", "
Parameters
----------
param: str
def: str

Return
-------
str

Description
-----------
Get value of parameter as being of specific type If parameter is not defined or does not have expected type, returns default value as specified.
") StringVal;
		Standard_CString StringVal(Standard_CString param, Standard_CString def);

		/****** ShapeProcess_Context::TraceLevel ******/
		/****** md5 signature: 71a5f63811c28c261ef1f9e77d8b2618 ******/
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns trace level used for outputting messages.
") TraceLevel;
		Standard_Integer TraceLevel();

		/****** ShapeProcess_Context::UnSetScope ******/
		/****** md5 signature: 0d739e53be5f4f434204591261654f70 ******/
		%feature("compactdefaultargs") UnSetScope;
		%feature("autodoc", "Return
-------
None

Description
-----------
Go out of current scope.
") UnSetScope;
		void UnSetScope();

};


%make_alias(ShapeProcess_Context)

%extend ShapeProcess_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class ShapeProcess_OperLibrary *
*********************************/
class ShapeProcess_OperLibrary {
	public:
		/****** ShapeProcess_OperLibrary::ApplyModifier ******/
		/****** md5 signature: b322162cc954d340e91de4550fc0742f ******/
		%feature("compactdefaultargs") ApplyModifier;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
context: ShapeProcess_ShapeContext
M: BRepTools_Modification
map: TopTools_DataMapOfShapeShape
msg: ShapeExtend_MsgRegistrator (optional, default to 0)
theMutableInput: bool (optional, default to Standard_False)

Return
-------
TopoDS_Shape

Description
-----------
Applies BRepTools_Modification to a shape, taking into account sharing of components of compounds. if theMutableInput vat is set to true then input shape S can be modified during the modification process.
") ApplyModifier;
		static TopoDS_Shape ApplyModifier(const TopoDS_Shape & S, const opencascade::handle<ShapeProcess_ShapeContext> & context, const opencascade::handle<BRepTools_Modification> & M, TopTools_DataMapOfShapeShape & map, const opencascade::handle<ShapeExtend_MsgRegistrator> & msg = 0, Standard_Boolean theMutableInput = Standard_False);

		/****** ShapeProcess_OperLibrary::Init ******/
		/****** md5 signature: 342fdccc4643f67c269591c4b6447108 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Registers all the operators.
") Init;
		static void Init();

};


%extend ShapeProcess_OperLibrary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class ShapeProcess_Operator *
******************************/
%nodefaultctor ShapeProcess_Operator;
class ShapeProcess_Operator : public Standard_Transient {
	public:
		/****** ShapeProcess_Operator::Perform ******/
		/****** md5 signature: b2410fe629ca4604fd2f4736b7846dc2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
context: ShapeProcess_Context
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Performs operation and eventually records changes in the context.
") Perform;
		virtual Standard_Boolean Perform(const opencascade::handle<ShapeProcess_Context> & context, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%make_alias(ShapeProcess_Operator)

%extend ShapeProcess_Operator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class ShapeProcess_ShapeContext *
**********************************/
class ShapeProcess_ShapeContext : public ShapeProcess_Context {
	public:
		/****** ShapeProcess_ShapeContext::ShapeProcess_ShapeContext ******/
		/****** md5 signature: 20f4e66b475119e7c804f3036fb6c3b6 ******/
		%feature("compactdefaultargs") ShapeProcess_ShapeContext;
		%feature("autodoc", "
Parameters
----------
file: str
seq: str (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") ShapeProcess_ShapeContext;
		 ShapeProcess_ShapeContext(Standard_CString file, Standard_CString seq = "");

		/****** ShapeProcess_ShapeContext::ShapeProcess_ShapeContext ******/
		/****** md5 signature: bbe323f78f09a408b3fe5639953403da ******/
		%feature("compactdefaultargs") ShapeProcess_ShapeContext;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
file: str
seq: str (optional, default to "")

Return
-------
None

Description
-----------
Initializes a tool by resource file and shape to be processed.
") ShapeProcess_ShapeContext;
		 ShapeProcess_ShapeContext(const TopoDS_Shape & S, Standard_CString file, Standard_CString seq = "");

		/****** ShapeProcess_ShapeContext::AddMessage ******/
		/****** md5 signature: d6c4b099fe68ccec72d5d85c1d0b829f ******/
		%feature("compactdefaultargs") AddMessage;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
msg: Message_Msg
gravity: Message_Gravity (optional, default to Message_Warning)

Return
-------
None

Description
-----------
Record a message for shape S Shape S should be one of subshapes of original shape (or whole one), but not one of intermediate shapes Records only if Message() is not Null.
") AddMessage;
		void AddMessage(const TopoDS_Shape & S, const Message_Msg & msg, const Message_Gravity gravity = Message_Warning);

		/****** ShapeProcess_ShapeContext::ContinuityVal ******/
		/****** md5 signature: b777d734b7118a1cd0601529d462f08e ******/
		%feature("compactdefaultargs") ContinuityVal;
		%feature("autodoc", "
Parameters
----------
param: str
def: GeomAbs_Shape

Return
-------
GeomAbs_Shape

Description
-----------
Get value of parameter as being of the type GeomAbs_Shape If parameter is not defined or does not have expected type, returns default value as specified.
") ContinuityVal;
		GeomAbs_Shape ContinuityVal(Standard_CString param, const GeomAbs_Shape def);

		/****** ShapeProcess_ShapeContext::GetContinuity ******/
		/****** md5 signature: 8156d1ea5c38e69794d6923a701e0552 ******/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "
Parameters
----------
param: str

Return
-------
val: GeomAbs_Shape

Description
-----------
Get value of parameter as being of the type GeomAbs_Shape Returns False if parameter is not defined or has a wrong type.
") GetContinuity;
		Standard_Boolean GetContinuity(Standard_CString param, GeomAbs_Shape &OutValue);

		/****** ShapeProcess_ShapeContext::GetDetalisation ******/
		/****** md5 signature: 39c7fd043c5ef7a11d722274e748b546 ******/
		%feature("compactdefaultargs") GetDetalisation;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Set and get value for detalisation level Only shapes of types from TopoDS_COMPOUND and until specified detalisation level will be recorded in maps To cancel mapping, use TopAbs_SHAPE To force full mapping, use TopAbs_VERTEX The default level is TopAbs_FACE.
") GetDetalisation;
		TopAbs_ShapeEnum GetDetalisation();

		/****** ShapeProcess_ShapeContext::Init ******/
		/****** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initializes tool by a new shape and clears all results.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** ShapeProcess_ShapeContext::IsNonManifold ******/
		/****** md5 signature: 85615c859bdc55645bc1d336aa403598 ******/
		%feature("compactdefaultargs") IsNonManifold;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Get NonManifold flag.
") IsNonManifold;
		Standard_Boolean IsNonManifold();

		/****** ShapeProcess_ShapeContext::Map ******/
		/****** md5 signature: f3544fddbdbe445b92ed0b96e5dc0e82 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TopTools_DataMapOfShapeShape

Description
-----------
Returns map of replacements shape -> shape This map is not recursive.
") Map;
		const TopTools_DataMapOfShapeShape & Map();

		/****** ShapeProcess_ShapeContext::Messages ******/
		/****** md5 signature: 4bcb959a43c79d763ed04d57cd2f32ff ******/
		%feature("compactdefaultargs") Messages;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeExtend_MsgRegistrator>

Description
-----------
No available documentation.
") Messages;
		const opencascade::handle<ShapeExtend_MsgRegistrator> & Messages();

		/****** ShapeProcess_ShapeContext::Messages ******/
		/****** md5 signature: 677d948f1c1520b140ad117b0b1f0b9e ******/
		%feature("compactdefaultargs") Messages;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeExtend_MsgRegistrator>

Description
-----------
Returns messages recorded during shape processing It can be nullified before processing in order to avoid recording messages.
") Messages;
		opencascade::handle<ShapeExtend_MsgRegistrator> & Messages();

		/****** ShapeProcess_ShapeContext::PrintStatistics ******/
		/****** md5 signature: 86cdcf68cd4100ca4b4194fe92a8fef1 ******/
		%feature("compactdefaultargs") PrintStatistics;
		%feature("autodoc", "Return
-------
None

Description
-----------
Prints statistics on Shape Processing onto the current Messenger.
") PrintStatistics;
		void PrintStatistics();

		/****** ShapeProcess_ShapeContext::RecordModification ******/
		/****** md5 signature: 5910cf7b53b64b7f6eb689e3ad5e4130 ******/
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", "
Parameters
----------
repl: TopTools_DataMapOfShapeShape
msg: ShapeExtend_MsgRegistrator (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") RecordModification;
		void RecordModification(const TopTools_DataMapOfShapeShape & repl, const opencascade::handle<ShapeExtend_MsgRegistrator> & msg = 0);

		/****** ShapeProcess_ShapeContext::RecordModification ******/
		/****** md5 signature: 7003d8786e0ab31160304d31b2f0ffe5 ******/
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", "
Parameters
----------
repl: ShapeBuild_ReShape
msg: ShapeExtend_MsgRegistrator

Return
-------
None

Description
-----------
No available documentation.
") RecordModification;
		void RecordModification(const opencascade::handle<ShapeBuild_ReShape> & repl, const opencascade::handle<ShapeExtend_MsgRegistrator> & msg);

		/****** ShapeProcess_ShapeContext::RecordModification ******/
		/****** md5 signature: cacfc6c7bca95ccb7353e340e0ed4613 ******/
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", "
Parameters
----------
repl: ShapeBuild_ReShape

Return
-------
None

Description
-----------
No available documentation.
") RecordModification;
		void RecordModification(const opencascade::handle<ShapeBuild_ReShape> & repl);

		/****** ShapeProcess_ShapeContext::RecordModification ******/
		/****** md5 signature: a6e67ee56c4448930fb9467c96f1f088 ******/
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", "
Parameters
----------
sh: TopoDS_Shape
repl: BRepTools_Modifier
msg: ShapeExtend_MsgRegistrator (optional, default to 0)

Return
-------
None

Description
-----------
Records modifications and resets result accordingly NOTE: modification of resulting shape should be explicitly defined in the maps along with modifications of subshapes //! In the last function, sh is the shape on which Modifier was run. It can be different from the whole shape, but in that case result as a whole should be reset later either by call to SetResult(), or by another call to RecordModification() which contains mapping of current result to a new one explicitly.
") RecordModification;
		void RecordModification(const TopoDS_Shape & sh, const BRepTools_Modifier & repl, const opencascade::handle<ShapeExtend_MsgRegistrator> & msg = 0);

		/****** ShapeProcess_ShapeContext::Result ******/
		/****** md5 signature: 64e8e20a963b00a422945949bd4e1549 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns current result.
") Result;
		const TopoDS_Shape Result();

		/****** ShapeProcess_ShapeContext::SetDetalisation ******/
		/****** md5 signature: c1c41e04cf028d55eb3aeb2a1dfb31ed ******/
		%feature("compactdefaultargs") SetDetalisation;
		%feature("autodoc", "
Parameters
----------
level: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
No available documentation.
") SetDetalisation;
		void SetDetalisation(const TopAbs_ShapeEnum level);

		/****** ShapeProcess_ShapeContext::SetNonManifold ******/
		/****** md5 signature: db259f4c5acea89a0f836fc005f1b3b3 ******/
		%feature("compactdefaultargs") SetNonManifold;
		%feature("autodoc", "
Parameters
----------
theNonManifold: bool

Return
-------
None

Description
-----------
Set NonManifold flag.
") SetNonManifold;
		void SetNonManifold(Standard_Boolean theNonManifold);

		/****** ShapeProcess_ShapeContext::SetResult ******/
		/****** md5 signature: 53ecd78f2e971f6e061f01fa79870f7f ******/
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Sets a new result shape NOTE: this method should be used very carefully to keep consistency of modifications It is recommended to use RecordModification() methods with explicit definition of mapping from current result to a new one.
") SetResult;
		void SetResult(const TopoDS_Shape & S);

		/****** ShapeProcess_ShapeContext::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns shape being processed.
") Shape;
		const TopoDS_Shape Shape();

};


%make_alias(ShapeProcess_ShapeContext)

%extend ShapeProcess_ShapeContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class ShapeProcess_UOperator *
*******************************/
class ShapeProcess_UOperator : public ShapeProcess_Operator {
	public:
		/****** ShapeProcess_UOperator::ShapeProcess_UOperator ******/
		/****** md5 signature: 59eb42de0921dac1584e78dad688c4b4 ******/
		%feature("compactdefaultargs") ShapeProcess_UOperator;
		%feature("autodoc", "
Parameters
----------
func: ShapeProcess_OperFunc

Return
-------
None

Description
-----------
Creates operator with implementation defined as OperFunc (static function).
") ShapeProcess_UOperator;
		 ShapeProcess_UOperator(const ShapeProcess_OperFunc func);

		/****** ShapeProcess_UOperator::Perform ******/
		/****** md5 signature: 24c3bd22390455c26b649fc0127bc193 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
context: ShapeProcess_Context
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Performs operation and records changes in the context.
") Perform;
		virtual Standard_Boolean Perform(const opencascade::handle<ShapeProcess_Context> & context, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%make_alias(ShapeProcess_UOperator)

%extend ShapeProcess_UOperator {
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
def shapeprocess_FindOperator(*args):
	return shapeprocess.FindOperator(*args)

@deprecated
def shapeprocess_Perform(*args):
	return shapeprocess.Perform(*args)

@deprecated
def shapeprocess_Perform(*args):
	return shapeprocess.Perform(*args)

@deprecated
def shapeprocess_RegisterOperator(*args):
	return shapeprocess.RegisterOperator(*args)

@deprecated
def shapeprocess_ToOperationFlag(*args):
	return shapeprocess.ToOperationFlag(*args)

@deprecated
def ShapeProcess_OperLibrary_ApplyModifier(*args):
	return ShapeProcess_OperLibrary.ApplyModifier(*args)

@deprecated
def ShapeProcess_OperLibrary_Init(*args):
	return ShapeProcess_OperLibrary.Init(*args)

}
