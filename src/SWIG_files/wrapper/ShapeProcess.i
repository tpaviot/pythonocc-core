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
		%feature("compactdefaultargs") ShapeProcess_Context;
		%feature("autodoc", "Creates an empty tool.

Returns
-------
None
") ShapeProcess_Context;
		 ShapeProcess_Context();

		/****************** ShapeProcess_Context ******************/
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
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "Returns messenger used for outputting messages.

Returns
-------
opencascade::handle<Message_Messenger>
") Messenger;
		opencascade::handle<Message_Messenger> Messenger();

		/****************** Progress ******************/
		%feature("compactdefaultargs") Progress;
		%feature("autodoc", "Returns progress indicator.

Returns
-------
opencascade::handle<Message_ProgressIndicator>
") Progress;
		opencascade::handle<Message_ProgressIndicator> Progress();

		/****************** RealVal ******************/
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
		%feature("compactdefaultargs") ResourceManager;
		%feature("autodoc", "Returns internal resource_manager object.

Returns
-------
opencascade::handle<Resource_Manager>
") ResourceManager;
		const opencascade::handle<Resource_Manager> & ResourceManager();

		/****************** SetMessenger ******************/
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
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "Returns trace level used for outputting messages.

Returns
-------
int
") TraceLevel;
		Standard_Integer TraceLevel();

		/****************** UnSetScope ******************/
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
		%feature("compactdefaultargs") GetDetalisation;
		%feature("autodoc", "Set and get value for detalisation level only shapes of types from topods_compound and until specified detalisation level will be recorded in maps to cancel mapping, use topabs_shape to force full mapping, use topabs_vertex the default level is topabs_face.

Returns
-------
TopAbs_ShapeEnum
") GetDetalisation;
		TopAbs_ShapeEnum GetDetalisation();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") IsNonManifold;
		%feature("autodoc", "Get nonmanifold flag.

Returns
-------
bool
") IsNonManifold;
		Standard_Boolean IsNonManifold();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Returns map of replacements shape -> shape this map is not recursive.

Returns
-------
TopTools_DataMapOfShapeShape
") Map;
		const TopTools_DataMapOfShapeShape & Map();

		/****************** Messages ******************/
		%feature("compactdefaultargs") Messages;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ShapeExtend_MsgRegistrator>
") Messages;
		const opencascade::handle<ShapeExtend_MsgRegistrator> & Messages();

		/****************** Messages ******************/
		%feature("compactdefaultargs") Messages;
		%feature("autodoc", "Returns messages recorded during shape processing it can be nullified before processing in order to avoid recording messages.

Returns
-------
opencascade::handle<ShapeExtend_MsgRegistrator>
") Messages;
		opencascade::handle<ShapeExtend_MsgRegistrator> & Messages();

		/****************** PrintStatistics ******************/
		%feature("compactdefaultargs") PrintStatistics;
		%feature("autodoc", "Prints statistics on shape processing onto the current messenger.

Returns
-------
None
") PrintStatistics;
		void PrintStatistics();

		/****************** RecordModification ******************/
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
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns current result.

Returns
-------
TopoDS_Shape
") Result;
		const TopoDS_Shape Result();

		/****************** SetDetalisation ******************/
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
