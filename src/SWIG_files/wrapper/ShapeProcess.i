/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(ShapeProcess_Context)
%wrap_handle(ShapeProcess_Operator)
%wrap_handle(ShapeProcess_ShapeContext)
%wrap_handle(ShapeProcess_UOperator)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef Standard_Boolean ( * ShapeProcess_OperFunc ) ( const opencascade::handle <ShapeProcess_Context>& context );
/* end typedefs declaration */

/*********************
* class ShapeProcess *
*********************/
%rename(shapeprocess) ShapeProcess;
class ShapeProcess {
	public:
		/****************** FindOperator ******************/
		%feature("compactdefaultargs") FindOperator;
		%feature("autodoc", "* Finds operator by its name
	:param name:
	:type name: char *
	:param op:
	:type op: ShapeProcess_Operator
	:rtype: bool") FindOperator;
		static Standard_Boolean FindOperator (const char * name,opencascade::handle<ShapeProcess_Operator> & op);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs a specified sequence of operators on Context Resource file and other data should be already loaded to Context (including description of sequence seq)
	:param context:
	:type context: ShapeProcess_Context
	:param seq:
	:type seq: char *
	:rtype: bool") Perform;
		static Standard_Boolean Perform (const opencascade::handle<ShapeProcess_Context> & context,const char * seq);

		/****************** RegisterOperator ******************/
		%feature("compactdefaultargs") RegisterOperator;
		%feature("autodoc", "* Registers operator to make it visible for Performer
	:param name:
	:type name: char *
	:param op:
	:type op: ShapeProcess_Operator
	:rtype: bool") RegisterOperator;
		static Standard_Boolean RegisterOperator (const char * name,const opencascade::handle<ShapeProcess_Operator> & op);

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
		/****************** BooleanVal ******************/
		%feature("compactdefaultargs") BooleanVal;
		%feature("autodoc", ":param param:
	:type param: char *
	:param def:
	:type def: bool
	:rtype: bool") BooleanVal;
		Standard_Boolean BooleanVal (const char * param,const Standard_Boolean def);

		/****************** GetBoolean ******************/
		%feature("compactdefaultargs") GetBoolean;
		%feature("autodoc", ":param param:
	:type param: char *
	:param val:
	:type val: bool
	:rtype: bool") GetBoolean;
		Standard_Boolean GetBoolean (const char * param,Standard_Boolean &OutValue);

		/****************** GetInteger ******************/
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", ":param param:
	:type param: char *
	:param val:
	:type val: int
	:rtype: bool") GetInteger;
		Standard_Boolean GetInteger (const char * param,Standard_Integer &OutValue);

		/****************** GetReal ******************/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", ":param param:
	:type param: char *
	:param val:
	:type val: float
	:rtype: bool") GetReal;
		Standard_Boolean GetReal (const char * param,Standard_Real &OutValue);

		/****************** GetString ******************/
		%feature("compactdefaultargs") GetString;
		%feature("autodoc", "* Get value of parameter as being of specific type Returns False if parameter is not defined or has a wrong type
	:param param:
	:type param: char *
	:param val:
	:type val: TCollection_AsciiString
	:rtype: bool") GetString;
		Standard_Boolean GetString (const char * param,TCollection_AsciiString & val);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialises a tool by loading resource file and (if specified) sets starting scope Returns False if resource file not found
	:param file:
	:type file: char *
	:param scope: default value is ""
	:type scope: char *
	:rtype: bool") Init;
		Standard_Boolean Init (const char * file,const char * scope = "");

		/****************** IntegerVal ******************/
		%feature("compactdefaultargs") IntegerVal;
		%feature("autodoc", ":param param:
	:type param: char *
	:param def:
	:type def: int
	:rtype: int") IntegerVal;
		Standard_Integer IntegerVal (const char * param,const Standard_Integer def);

		/****************** IsParamSet ******************/
		%feature("compactdefaultargs") IsParamSet;
		%feature("autodoc", "* Returns True if parameter is defined in the resource file
	:param param:
	:type param: char *
	:rtype: bool") IsParamSet;
		Standard_Boolean IsParamSet (const char * param);

		/****************** LoadResourceManager ******************/
		%feature("compactdefaultargs") LoadResourceManager;
		%feature("autodoc", "* Loading Resource_Manager object if this object not equal internal static Resource_Manager object or internal static Resource_Manager object is null
	:param file:
	:type file: char *
	:rtype: opencascade::handle<Resource_Manager>") LoadResourceManager;
		opencascade::handle<Resource_Manager> LoadResourceManager (const char * file);

		/****************** Messenger ******************/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "* Returns Messenger used for outputting messages.
	:rtype: opencascade::handle<Message_Messenger>") Messenger;
		opencascade::handle<Message_Messenger> Messenger ();

		/****************** Progress ******************/
		%feature("compactdefaultargs") Progress;
		%feature("autodoc", "* Returns Progress Indicator.
	:rtype: opencascade::handle<Message_ProgressIndicator>") Progress;
		opencascade::handle<Message_ProgressIndicator> Progress ();

		/****************** RealVal ******************/
		%feature("compactdefaultargs") RealVal;
		%feature("autodoc", ":param param:
	:type param: char *
	:param def:
	:type def: float
	:rtype: float") RealVal;
		Standard_Real RealVal (const char * param,const Standard_Real def);

		/****************** ResourceManager ******************/
		%feature("compactdefaultargs") ResourceManager;
		%feature("autodoc", "* Returns internal Resource_Manager object
	:rtype: opencascade::handle<Resource_Manager>") ResourceManager;
		const opencascade::handle<Resource_Manager> & ResourceManager ();

		/****************** SetMessenger ******************/
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "* Sets Messenger used for outputting messages.
	:param messenger:
	:type messenger: Message_Messenger
	:rtype: None") SetMessenger;
		void SetMessenger (const opencascade::handle<Message_Messenger> & messenger);

		/****************** SetProgress ******************/
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "* Sets Progress Indicator.
	:param theProgress:
	:type theProgress: Message_ProgressIndicator
	:rtype: None") SetProgress;
		void SetProgress (const opencascade::handle<Message_ProgressIndicator> & theProgress);

		/****************** SetScope ******************/
		%feature("compactdefaultargs") SetScope;
		%feature("autodoc", "* Set a new (sub)scope
	:param scope:
	:type scope: char *
	:rtype: None") SetScope;
		void SetScope (const char * scope);

		/****************** SetTraceLevel ******************/
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "* Sets trace level used for outputting messages - 0: no trace at all - 1: errors - 2: errors and warnings - 3: all messages Default is 1 : Errors traced
	:param tracelev:
	:type tracelev: int
	:rtype: None") SetTraceLevel;
		void SetTraceLevel (const Standard_Integer tracelev);

		/****************** ShapeProcess_Context ******************/
		%feature("compactdefaultargs") ShapeProcess_Context;
		%feature("autodoc", "* Creates an empty tool
	:rtype: None") ShapeProcess_Context;
		 ShapeProcess_Context ();

		/****************** ShapeProcess_Context ******************/
		%feature("compactdefaultargs") ShapeProcess_Context;
		%feature("autodoc", "* Creates a new tool and initialises by name of resource file and (if specified) starting scope Calls method Init()
	:param file:
	:type file: char *
	:param scope: default value is ""
	:type scope: char *
	:rtype: None") ShapeProcess_Context;
		 ShapeProcess_Context (const char * file,const char * scope = "");

		/****************** StringVal ******************/
		%feature("compactdefaultargs") StringVal;
		%feature("autodoc", "* Get value of parameter as being of specific type If parameter is not defined or does not have expected type, returns default value as specified
	:param param:
	:type param: char *
	:param def:
	:type def: char *
	:rtype: char *") StringVal;
		const char * StringVal (const char * param,const char * def);

		/****************** TraceLevel ******************/
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "* Returns trace level used for outputting messages.
	:rtype: int") TraceLevel;
		Standard_Integer TraceLevel ();

		/****************** UnSetScope ******************/
		%feature("compactdefaultargs") UnSetScope;
		%feature("autodoc", "* Go out of current scope
	:rtype: None") UnSetScope;
		void UnSetScope ();

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
		%feature("autodoc", "* Applies BRepTools_Modification to a shape, taking into account sharing of components of compounds. if theMutableInput vat is set to true then imput shape S can be modified during the modification process.
	:param S:
	:type S: TopoDS_Shape
	:param context:
	:type context: ShapeProcess_ShapeContext
	:param M:
	:type M: BRepTools_Modification
	:param map:
	:type map: TopTools_DataMapOfShapeShape
	:param msg: default value is 0
	:type msg: ShapeExtend_MsgRegistrator
	:param theMutableInput: default value is Standard_False
	:type theMutableInput: bool
	:rtype: TopoDS_Shape") ApplyModifier;
		static TopoDS_Shape ApplyModifier (const TopoDS_Shape & S,const opencascade::handle<ShapeProcess_ShapeContext> & context,const opencascade::handle<BRepTools_Modification> & M,TopTools_DataMapOfShapeShape & map,const opencascade::handle<ShapeExtend_MsgRegistrator> & msg = 0,Standard_Boolean theMutableInput = Standard_False);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Registers all the operators
	:rtype: void") Init;
		static void Init ();

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
		%feature("autodoc", "* Performs operation and eventually records changes in the context
	:param context:
	:type context: ShapeProcess_Context
	:rtype: bool") Perform;
		virtual Standard_Boolean Perform (const opencascade::handle<ShapeProcess_Context> & context);

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
		/****************** AddMessage ******************/
		%feature("compactdefaultargs") AddMessage;
		%feature("autodoc", "* Record a message for shape S Shape S should be one of subshapes of original shape (or whole one), but not one of intermediate shapes Records only if Message() is not Null
	:param S:
	:type S: TopoDS_Shape
	:param msg:
	:type msg: Message_Msg
	:param gravity: default value is Message_Warning
	:type gravity: Message_Gravity
	:rtype: None") AddMessage;
		void AddMessage (const TopoDS_Shape & S,const Message_Msg & msg,const Message_Gravity gravity = Message_Warning);

		/****************** ContinuityVal ******************/
		%feature("compactdefaultargs") ContinuityVal;
		%feature("autodoc", "* Get value of parameter as being of the type GeomAbs_Shape If parameter is not defined or does not have expected type, returns default value as specified
	:param param:
	:type param: char *
	:param def:
	:type def: GeomAbs_Shape
	:rtype: GeomAbs_Shape") ContinuityVal;
		GeomAbs_Shape ContinuityVal (const char * param,const GeomAbs_Shape def);

		/****************** GetContinuity ******************/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "* Get value of parameter as being of the type GeomAbs_Shape Returns False if parameter is not defined or has a wrong type
	:param param:
	:type param: char *
	:param val:
	:type val: GeomAbs_Shape
	:rtype: bool") GetContinuity;
		Standard_Boolean GetContinuity (const char * param,GeomAbs_Shape & val);

		/****************** GetDetalisation ******************/
		%feature("compactdefaultargs") GetDetalisation;
		%feature("autodoc", "* Set and get value for detalisation level Only shapes of types from TopoDS_COMPOUND and until specified detalisation level will be recorded in maps To cancel mapping, use TopAbs_SHAPE To force full mapping, use TopAbs_VERTEX The default level is TopAbs_FACE
	:rtype: TopAbs_ShapeEnum") GetDetalisation;
		TopAbs_ShapeEnum GetDetalisation ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes tool by a new shape and clears all results
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** IsNonManifold ******************/
		%feature("compactdefaultargs") IsNonManifold;
		%feature("autodoc", "* Get NonManifold flag
	:rtype: bool") IsNonManifold;
		Standard_Boolean IsNonManifold ();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "* Returns map of replacements shape -> shape This map is not recursive
	:rtype: TopTools_DataMapOfShapeShape") Map;
		const TopTools_DataMapOfShapeShape & Map ();

		/****************** Messages ******************/
		%feature("compactdefaultargs") Messages;
		%feature("autodoc", ":rtype: opencascade::handle<ShapeExtend_MsgRegistrator>") Messages;
		const opencascade::handle<ShapeExtend_MsgRegistrator> & Messages ();

		/****************** Messages ******************/
		%feature("compactdefaultargs") Messages;
		%feature("autodoc", "* Returns messages recorded during shape processing It can be nullified before processing in order to avoid recording messages
	:rtype: opencascade::handle<ShapeExtend_MsgRegistrator>") Messages;
		opencascade::handle<ShapeExtend_MsgRegistrator> & Messages ();

		/****************** PrintStatistics ******************/
		%feature("compactdefaultargs") PrintStatistics;
		%feature("autodoc", "* Prints statistics on Shape Processing onto the current Messenger.
	:rtype: None") PrintStatistics;
		void PrintStatistics ();

		/****************** RecordModification ******************/
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", ":param repl:
	:type repl: TopTools_DataMapOfShapeShape
	:param msg: default value is 0
	:type msg: ShapeExtend_MsgRegistrator
	:rtype: None") RecordModification;
		void RecordModification (const TopTools_DataMapOfShapeShape & repl,const opencascade::handle<ShapeExtend_MsgRegistrator> & msg = 0);

		/****************** RecordModification ******************/
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", ":param repl:
	:type repl: ShapeBuild_ReShape
	:param msg:
	:type msg: ShapeExtend_MsgRegistrator
	:rtype: None") RecordModification;
		void RecordModification (const opencascade::handle<ShapeBuild_ReShape> & repl,const opencascade::handle<ShapeExtend_MsgRegistrator> & msg);

		/****************** RecordModification ******************/
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", ":param repl:
	:type repl: ShapeBuild_ReShape
	:rtype: None") RecordModification;
		void RecordModification (const opencascade::handle<ShapeBuild_ReShape> & repl);

		/****************** RecordModification ******************/
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", "* Records modifications and resets result accordingly NOTE: modification of resulting shape should be explicitly defined in the maps along with modifications of subshapes //! In the last function, sh is the shape on which Modifier was run. It can be different from the whole shape, but in that case result as a whole should be reset later either by call to SetResult(), or by another call to RecordModification() which contains mapping of current result to a new one explicitly
	:param sh:
	:type sh: TopoDS_Shape
	:param repl:
	:type repl: BRepTools_Modifier
	:param msg: default value is 0
	:type msg: ShapeExtend_MsgRegistrator
	:rtype: None") RecordModification;
		void RecordModification (const TopoDS_Shape & sh,const BRepTools_Modifier & repl,const opencascade::handle<ShapeExtend_MsgRegistrator> & msg = 0);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "* Returns current result
	:rtype: TopoDS_Shape") Result;
		const TopoDS_Shape  Result ();

		/****************** SetDetalisation ******************/
		%feature("compactdefaultargs") SetDetalisation;
		%feature("autodoc", ":param level:
	:type level: TopAbs_ShapeEnum
	:rtype: None") SetDetalisation;
		void SetDetalisation (const TopAbs_ShapeEnum level);

		/****************** SetNonManifold ******************/
		%feature("compactdefaultargs") SetNonManifold;
		%feature("autodoc", "* Set NonManifold flag
	:param theNonManifold:
	:type theNonManifold: bool
	:rtype: None") SetNonManifold;
		void SetNonManifold (Standard_Boolean theNonManifold);

		/****************** SetResult ******************/
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "* Sets a new result shape NOTE: this method should be used very carefully to keep consistency of modifications It is recommended to use RecordModification() methods with explicit definition of mapping from current result to a new one
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") SetResult;
		void SetResult (const TopoDS_Shape & S);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns shape being processed
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** ShapeProcess_ShapeContext ******************/
		%feature("compactdefaultargs") ShapeProcess_ShapeContext;
		%feature("autodoc", ":param file:
	:type file: char *
	:param seq: default value is ""
	:type seq: char *
	:rtype: None") ShapeProcess_ShapeContext;
		 ShapeProcess_ShapeContext (const char * file,const char * seq = "");

		/****************** ShapeProcess_ShapeContext ******************/
		%feature("compactdefaultargs") ShapeProcess_ShapeContext;
		%feature("autodoc", "* Initializes a tool by resource file and shape to be processed
	:param S:
	:type S: TopoDS_Shape
	:param file:
	:type file: char *
	:param seq: default value is ""
	:type seq: char *
	:rtype: None") ShapeProcess_ShapeContext;
		 ShapeProcess_ShapeContext (const TopoDS_Shape & S,const char * file,const char * seq = "");

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
		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs operation and records changes in the context
	:param context:
	:type context: ShapeProcess_Context
	:rtype: bool") Perform;
		virtual Standard_Boolean Perform (const opencascade::handle<ShapeProcess_Context> & context);

		/****************** ShapeProcess_UOperator ******************/
		%feature("compactdefaultargs") ShapeProcess_UOperator;
		%feature("autodoc", "* Creates operator with implementation defined as OperFunc (static function)
	:param func:
	:type func: ShapeProcess_OperFunc
	:rtype: None") ShapeProcess_UOperator;
		 ShapeProcess_UOperator (const ShapeProcess_OperFunc func);

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
