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
%define SHAPEPROCESSDOCSTRING
"ShapeProcess module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_shapeprocess.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<ShapeProcess_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<Resource_module.hxx>
#include<Message_module.hxx>
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
%import TCollection.i
%import Resource.i
%import Message.i
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

/* python proy classes for enums */
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
typedef Standard_Boolean ( * ShapeProcess_OperFunc ) ( const opencascade::handle<ShapeProcess_Context>& context );
/* end typedefs declaration */

/*********************
* class ShapeProcess *
*********************/
%rename(shapeprocess) ShapeProcess;
class ShapeProcess {
	public:
		/****************** FindOperator ******************/
		/**** md5 signature: ac666265198f26dac6234760a5de3179 ****/
		%feature("compactdefaultargs") FindOperator;
		%feature("autodoc", "Finds operator by its name.

Parameters
----------
name: char *
op: ShapeProcess_Operator

Returns
-------
bool
") FindOperator;
		static Standard_Boolean FindOperator(const char * name, opencascade::handle<ShapeProcess_Operator> & op);

		/****************** Perform ******************/
		/**** md5 signature: 7533e984efb09869bf1f3c4940c1ce68 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs a specified sequence of operators on context resource file and other data should be already loaded to context (including description of sequence seq).

Parameters
----------
context: ShapeProcess_Context
seq: char *

Returns
-------
bool
") Perform;
		static Standard_Boolean Perform(const opencascade::handle<ShapeProcess_Context> & context, const char * seq);

		/****************** RegisterOperator ******************/
		/**** md5 signature: f3fc4533ca3193906e102f361e526b9e ****/
		%feature("compactdefaultargs") RegisterOperator;
		%feature("autodoc", "Registers operator to make it visible for performer.

Parameters
----------
name: char *
op: ShapeProcess_Operator

Returns
-------
bool
") RegisterOperator;
		static Standard_Boolean RegisterOperator(const char * name, const opencascade::handle<ShapeProcess_Operator> & op);

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
		/****************** ShapeProcess_Context ******************/
		/**** md5 signature: 9e6b7dcdae0dc3a0d529e7257dafbe61 ****/
		%feature("compactdefaultargs") ShapeProcess_Context;
		%feature("autodoc", "Creates an empty tool.

Returns
-------
None
") ShapeProcess_Context;
		 ShapeProcess_Context();

		/****************** ShapeProcess_Context ******************/
		/**** md5 signature: 11c95383da3f2b0444e62f214ea97e61 ****/
		%feature("compactdefaultargs") ShapeProcess_Context;
		%feature("autodoc", "Creates a new tool and initialises by name of resource file and (if specified) starting scope calls method init().

Parameters
----------
file: char *
scope: char *,optional
	default value is ""

Returns
-------
None
") ShapeProcess_Context;
		 ShapeProcess_Context(const char * file, const char * scope = "");

		/****************** BooleanVal ******************/
		/**** md5 signature: 9ef6eb8d9ad5133cb1a4c75139909634 ****/
		%feature("compactdefaultargs") BooleanVal;
		%feature("autodoc", "No available documentation.

Parameters
----------
param: char *
def: bool

Returns
-------
bool
") BooleanVal;
		Standard_Boolean BooleanVal(const char * param, const Standard_Boolean def);

		/****************** GetBoolean ******************/
		/**** md5 signature: 9df27916e333b4d27bedc4c44beaf1d4 ****/
		%feature("compactdefaultargs") GetBoolean;
		%feature("autodoc", "No available documentation.

Parameters
----------
param: char *

Returns
-------
val: bool
") GetBoolean;
		Standard_Boolean GetBoolean(const char * param, Standard_Boolean &OutValue);

		/****************** GetInteger ******************/
		/**** md5 signature: f7b7ac81028a2992ab387f7d40982c83 ****/
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
param: char *

Returns
-------
val: int
") GetInteger;
		Standard_Boolean GetInteger(const char * param, Standard_Integer &OutValue);

		/****************** GetReal ******************/
		/**** md5 signature: f76f4f5bd096be97f6395d4ae2b0c881 ****/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
param: char *

Returns
-------
val: float
") GetReal;
		Standard_Boolean GetReal(const char * param, Standard_Real &OutValue);

		/****************** GetString ******************/
		/**** md5 signature: d1aa90ddcb8f0c6991ce0ba3f0def1c1 ****/
		%feature("compactdefaultargs") GetString;
		%feature("autodoc", "Get value of parameter as being of specific type returns false if parameter is not defined or has a wrong type.

Parameters
----------
param: char *
val: TCollection_AsciiString

Returns
-------
bool
") GetString;
		Standard_Boolean GetString(const char * param, TCollection_AsciiString & val);

		/****************** Init ******************/
		/**** md5 signature: 847da2713ad977e0b2dcccc69df0b25c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialises a tool by loading resource file and (if specified) sets starting scope returns false if resource file not found.

Parameters
----------
file: char *
scope: char *,optional
	default value is ""

Returns
-------
bool
") Init;
		Standard_Boolean Init(const char * file, const char * scope = "");

		/****************** IntegerVal ******************/
		/**** md5 signature: 9d0714ed8df23981995ae835d1b115f2 ****/
		%feature("compactdefaultargs") IntegerVal;
		%feature("autodoc", "No available documentation.

Parameters
----------
param: char *
def: int

Returns
-------
int
") IntegerVal;
		Standard_Integer IntegerVal(const char * param, const Standard_Integer def);

		/****************** IsParamSet ******************/
		/**** md5 signature: b7b37179e228d9c93cbc70f5f2a1f388 ****/
		%feature("compactdefaultargs") IsParamSet;
		%feature("autodoc", "Returns true if parameter is defined in the resource file.

Parameters
----------
param: char *

Returns
-------
bool
") IsParamSet;
		Standard_Boolean IsParamSet(const char * param);

		/****************** LoadResourceManager ******************/
		/**** md5 signature: e91c46eb5bef823da15ad18b28716741 ****/
		%feature("compactdefaultargs") LoadResourceManager;
		%feature("autodoc", "Loading resource_manager object if this object not equal internal static resource_manager object or internal static resource_manager object is null.

Parameters
----------
file: char *

Returns
-------
opencascade::handle<Resource_Manager>
") LoadResourceManager;
		opencascade::handle<Resource_Manager> LoadResourceManager(const char * file);

		/****************** Messenger ******************/
		/**** md5 signature: c51845cdafadb143338935f519a3d7c7 ****/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "Returns messenger used for outputting messages.

Returns
-------
opencascade::handle<Message_Messenger>
") Messenger;
		opencascade::handle<Message_Messenger> Messenger();

		/****************** Progress ******************/
		/**** md5 signature: b1f33c3390e3bf1c3442fbce55e6f143 ****/
		%feature("compactdefaultargs") Progress;
		%feature("autodoc", "Returns progress indicator.

Returns
-------
opencascade::handle<Message_ProgressIndicator>
") Progress;
		opencascade::handle<Message_ProgressIndicator> Progress();

		/****************** RealVal ******************/
		/**** md5 signature: b3e5c67f2dd7912ff4b94cd089eeda0a ****/
		%feature("compactdefaultargs") RealVal;
		%feature("autodoc", "No available documentation.

Parameters
----------
param: char *
def: float

Returns
-------
float
") RealVal;
		Standard_Real RealVal(const char * param, const Standard_Real def);

		/****************** ResourceManager ******************/
		/**** md5 signature: 6cc7683a80ec93119c306087ce89d4fc ****/
		%feature("compactdefaultargs") ResourceManager;
		%feature("autodoc", "Returns internal resource_manager object.

Returns
-------
opencascade::handle<Resource_Manager>
") ResourceManager;
		const opencascade::handle<Resource_Manager> & ResourceManager();

		/****************** SetMessenger ******************/
		/**** md5 signature: a9749da4085afccb49a47ccebbb86045 ****/
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "Sets messenger used for outputting messages.

Parameters
----------
messenger: Message_Messenger

Returns
-------
None
") SetMessenger;
		void SetMessenger(const opencascade::handle<Message_Messenger> & messenger);

		/****************** SetProgress ******************/
		/**** md5 signature: a84d4cba9281e377406d50b9d58fab3b ****/
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "Sets progress indicator.

Parameters
----------
theProgress: Message_ProgressIndicator

Returns
-------
None
") SetProgress;
		void SetProgress(const opencascade::handle<Message_ProgressIndicator> & theProgress);

		/****************** SetScope ******************/
		/**** md5 signature: 8ee5ae53e9b457435d5d63fa00ffc340 ****/
		%feature("compactdefaultargs") SetScope;
		%feature("autodoc", "Set a new (sub)scope.

Parameters
----------
scope: char *

Returns
-------
None
") SetScope;
		void SetScope(const char * scope);

		/****************** SetTraceLevel ******************/
		/**** md5 signature: b2d3fab409a6e2832ea6fb56a22812c1 ****/
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "Sets trace level used for outputting messages - 0: no trace at all - 1: errors - 2: errors and warnings - 3: all messages default is 1 : errors traced.

Parameters
----------
tracelev: int

Returns
-------
None
") SetTraceLevel;
		void SetTraceLevel(const Standard_Integer tracelev);

		/****************** StringVal ******************/
		/**** md5 signature: ec376c06c836704e6cd2528dafcf8254 ****/
		%feature("compactdefaultargs") StringVal;
		%feature("autodoc", "Get value of parameter as being of specific type if parameter is not defined or does not have expected type, returns default value as specified.

Parameters
----------
param: char *
def: char *

Returns
-------
char *
") StringVal;
		const char * StringVal(const char * param, const char * def);

		/****************** TraceLevel ******************/
		/**** md5 signature: 71a5f63811c28c261ef1f9e77d8b2618 ****/
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "Returns trace level used for outputting messages.

Returns
-------
int
") TraceLevel;
		Standard_Integer TraceLevel();

		/****************** UnSetScope ******************/
		/**** md5 signature: 0d739e53be5f4f434204591261654f70 ****/
		%feature("compactdefaultargs") UnSetScope;
		%feature("autodoc", "Go out of current scope.

Returns
-------
None
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
		/****************** ApplyModifier ******************/
		/**** md5 signature: b322162cc954d340e91de4550fc0742f ****/
		%feature("compactdefaultargs") ApplyModifier;
		%feature("autodoc", "Applies breptools_modification to a shape, taking into account sharing of components of compounds. if themutableinput vat is set to true then imput shape s can be modified during the modification process.

Parameters
----------
S: TopoDS_Shape
context: ShapeProcess_ShapeContext
M: BRepTools_Modification
map: TopTools_DataMapOfShapeShape
msg: ShapeExtend_MsgRegistrator,optional
	default value is 0
theMutableInput: bool,optional
	default value is Standard_False

Returns
-------
TopoDS_Shape
") ApplyModifier;
		static TopoDS_Shape ApplyModifier(const TopoDS_Shape & S, const opencascade::handle<ShapeProcess_ShapeContext> & context, const opencascade::handle<BRepTools_Modification> & M, TopTools_DataMapOfShapeShape & map, const opencascade::handle<ShapeExtend_MsgRegistrator> & msg = 0, Standard_Boolean theMutableInput = Standard_False);

		/****************** Init ******************/
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Registers all the operators.

Returns
-------
None
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
		/****************** Perform ******************/
		/**** md5 signature: ad410a2bfb887550687dbf0d439b0f68 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs operation and eventually records changes in the context.

Parameters
----------
context: ShapeProcess_Context

Returns
-------
bool
") Perform;
		virtual Standard_Boolean Perform(const opencascade::handle<ShapeProcess_Context> & context);

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
		/****************** ShapeProcess_ShapeContext ******************/
		/**** md5 signature: 20f4e66b475119e7c804f3036fb6c3b6 ****/
		%feature("compactdefaultargs") ShapeProcess_ShapeContext;
		%feature("autodoc", "No available documentation.

Parameters
----------
file: char *
seq: char *,optional
	default value is ""

Returns
-------
None
") ShapeProcess_ShapeContext;
		 ShapeProcess_ShapeContext(const char * file, const char * seq = "");

		/****************** ShapeProcess_ShapeContext ******************/
		/**** md5 signature: bbe323f78f09a408b3fe5639953403da ****/
		%feature("compactdefaultargs") ShapeProcess_ShapeContext;
		%feature("autodoc", "Initializes a tool by resource file and shape to be processed.

Parameters
----------
S: TopoDS_Shape
file: char *
seq: char *,optional
	default value is ""

Returns
-------
None
") ShapeProcess_ShapeContext;
		 ShapeProcess_ShapeContext(const TopoDS_Shape & S, const char * file, const char * seq = "");

		/****************** AddMessage ******************/
		/**** md5 signature: d6c4b099fe68ccec72d5d85c1d0b829f ****/
		%feature("compactdefaultargs") AddMessage;
		%feature("autodoc", "Record a message for shape s shape s should be one of subshapes of original shape (or whole one), but not one of intermediate shapes records only if message() is not null.

Parameters
----------
S: TopoDS_Shape
msg: Message_Msg
gravity: Message_Gravity,optional
	default value is Message_Warning

Returns
-------
None
") AddMessage;
		void AddMessage(const TopoDS_Shape & S, const Message_Msg & msg, const Message_Gravity gravity = Message_Warning);

		/****************** ContinuityVal ******************/
		/**** md5 signature: b777d734b7118a1cd0601529d462f08e ****/
		%feature("compactdefaultargs") ContinuityVal;
		%feature("autodoc", "Get value of parameter as being of the type geomabs_shape if parameter is not defined or does not have expected type, returns default value as specified.

Parameters
----------
param: char *
def: GeomAbs_Shape

Returns
-------
GeomAbs_Shape
") ContinuityVal;
		GeomAbs_Shape ContinuityVal(const char * param, const GeomAbs_Shape def);

		/****************** GetContinuity ******************/
		/**** md5 signature: 8156d1ea5c38e69794d6923a701e0552 ****/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "Get value of parameter as being of the type geomabs_shape returns false if parameter is not defined or has a wrong type.

Parameters
----------
param: char *
val: GeomAbs_Shape

Returns
-------
bool
") GetContinuity;
		Standard_Boolean GetContinuity(const char * param, GeomAbs_Shape & val);

		/****************** GetDetalisation ******************/
		/**** md5 signature: 39c7fd043c5ef7a11d722274e748b546 ****/
		%feature("compactdefaultargs") GetDetalisation;
		%feature("autodoc", "Set and get value for detalisation level only shapes of types from topods_compound and until specified detalisation level will be recorded in maps to cancel mapping, use topabs_shape to force full mapping, use topabs_vertex the default level is topabs_face.

Returns
-------
TopAbs_ShapeEnum
") GetDetalisation;
		TopAbs_ShapeEnum GetDetalisation();

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes tool by a new shape and clears all results.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsNonManifold ******************/
		/**** md5 signature: 85615c859bdc55645bc1d336aa403598 ****/
		%feature("compactdefaultargs") IsNonManifold;
		%feature("autodoc", "Get nonmanifold flag.

Returns
-------
bool
") IsNonManifold;
		Standard_Boolean IsNonManifold();

		/****************** Map ******************/
		/**** md5 signature: f3544fddbdbe445b92ed0b96e5dc0e82 ****/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Returns map of replacements shape -> shape this map is not recursive.

Returns
-------
TopTools_DataMapOfShapeShape
") Map;
		const TopTools_DataMapOfShapeShape & Map();

		/****************** Messages ******************/
		/**** md5 signature: 4bcb959a43c79d763ed04d57cd2f32ff ****/
		%feature("compactdefaultargs") Messages;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ShapeExtend_MsgRegistrator>
") Messages;
		const opencascade::handle<ShapeExtend_MsgRegistrator> & Messages();

		/****************** Messages ******************/
		/**** md5 signature: 677d948f1c1520b140ad117b0b1f0b9e ****/
		%feature("compactdefaultargs") Messages;
		%feature("autodoc", "Returns messages recorded during shape processing it can be nullified before processing in order to avoid recording messages.

Returns
-------
opencascade::handle<ShapeExtend_MsgRegistrator>
") Messages;
		opencascade::handle<ShapeExtend_MsgRegistrator> & Messages();

		/****************** PrintStatistics ******************/
		/**** md5 signature: 86cdcf68cd4100ca4b4194fe92a8fef1 ****/
		%feature("compactdefaultargs") PrintStatistics;
		%feature("autodoc", "Prints statistics on shape processing onto the current messenger.

Returns
-------
None
") PrintStatistics;
		void PrintStatistics();

		/****************** RecordModification ******************/
		/**** md5 signature: 5910cf7b53b64b7f6eb689e3ad5e4130 ****/
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", "No available documentation.

Parameters
----------
repl: TopTools_DataMapOfShapeShape
msg: ShapeExtend_MsgRegistrator,optional
	default value is 0

Returns
-------
None
") RecordModification;
		void RecordModification(const TopTools_DataMapOfShapeShape & repl, const opencascade::handle<ShapeExtend_MsgRegistrator> & msg = 0);

		/****************** RecordModification ******************/
		/**** md5 signature: 7003d8786e0ab31160304d31b2f0ffe5 ****/
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", "No available documentation.

Parameters
----------
repl: ShapeBuild_ReShape
msg: ShapeExtend_MsgRegistrator

Returns
-------
None
") RecordModification;
		void RecordModification(const opencascade::handle<ShapeBuild_ReShape> & repl, const opencascade::handle<ShapeExtend_MsgRegistrator> & msg);

		/****************** RecordModification ******************/
		/**** md5 signature: cacfc6c7bca95ccb7353e340e0ed4613 ****/
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", "No available documentation.

Parameters
----------
repl: ShapeBuild_ReShape

Returns
-------
None
") RecordModification;
		void RecordModification(const opencascade::handle<ShapeBuild_ReShape> & repl);

		/****************** RecordModification ******************/
		/**** md5 signature: a6e67ee56c4448930fb9467c96f1f088 ****/
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", "Records modifications and resets result accordingly note: modification of resulting shape should be explicitly defined in the maps along with modifications of subshapes //! in the last function, sh is the shape on which modifier was run. it can be different from the whole shape, but in that case result as a whole should be reset later either by call to setresult(), or by another call to recordmodification() which contains mapping of current result to a new one explicitly.

Parameters
----------
sh: TopoDS_Shape
repl: BRepTools_Modifier
msg: ShapeExtend_MsgRegistrator,optional
	default value is 0

Returns
-------
None
") RecordModification;
		void RecordModification(const TopoDS_Shape & sh, const BRepTools_Modifier & repl, const opencascade::handle<ShapeExtend_MsgRegistrator> & msg = 0);

		/****************** Result ******************/
		/**** md5 signature: 64e8e20a963b00a422945949bd4e1549 ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns current result.

Returns
-------
TopoDS_Shape
") Result;
		const TopoDS_Shape Result();

		/****************** SetDetalisation ******************/
		/**** md5 signature: c1c41e04cf028d55eb3aeb2a1dfb31ed ****/
		%feature("compactdefaultargs") SetDetalisation;
		%feature("autodoc", "No available documentation.

Parameters
----------
level: TopAbs_ShapeEnum

Returns
-------
None
") SetDetalisation;
		void SetDetalisation(const TopAbs_ShapeEnum level);

		/****************** SetNonManifold ******************/
		/**** md5 signature: db259f4c5acea89a0f836fc005f1b3b3 ****/
		%feature("compactdefaultargs") SetNonManifold;
		%feature("autodoc", "Set nonmanifold flag.

Parameters
----------
theNonManifold: bool

Returns
-------
None
") SetNonManifold;
		void SetNonManifold(Standard_Boolean theNonManifold);

		/****************** SetResult ******************/
		/**** md5 signature: 53ecd78f2e971f6e061f01fa79870f7f ****/
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "Sets a new result shape note: this method should be used very carefully to keep consistency of modifications it is recommended to use recordmodification() methods with explicit definition of mapping from current result to a new one.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") SetResult;
		void SetResult(const TopoDS_Shape & S);

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns shape being processed.

Returns
-------
TopoDS_Shape
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
		/****************** ShapeProcess_UOperator ******************/
		/**** md5 signature: 59eb42de0921dac1584e78dad688c4b4 ****/
		%feature("compactdefaultargs") ShapeProcess_UOperator;
		%feature("autodoc", "Creates operator with implementation defined as operfunc (static function).

Parameters
----------
func: ShapeProcess_OperFunc

Returns
-------
None
") ShapeProcess_UOperator;
		 ShapeProcess_UOperator(const ShapeProcess_OperFunc func);

		/****************** Perform ******************/
		/**** md5 signature: 44b9939b59beba716399814ccdea1c5c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs operation and records changes in the context.

Parameters
----------
context: ShapeProcess_Context

Returns
-------
bool
") Perform;
		virtual Standard_Boolean Perform(const opencascade::handle<ShapeProcess_Context> & context);

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
