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
%define TFUNCTIONDOCSTRING
"TFunction module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tfunction.html"
%enddef
%module (package="OCC.Core", docstring=TFUNCTIONDOCSTRING) TFunction


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
#include<TFunction_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDF_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDF.i
%import TColStd.i
/* public enums */
enum TFunction_ExecutionStatus {
	TFunction_ES_WrongDefinition = 0,
	TFunction_ES_NotExecuted = 1,
	TFunction_ES_Executing = 2,
	TFunction_ES_Succeeded = 3,
	TFunction_ES_Failed = 4,
};

/* end public enums declaration */

/* handles */
%wrap_handle(TFunction_Driver)
%wrap_handle(TFunction_DriverTable)
%wrap_handle(TFunction_Function)
%wrap_handle(TFunction_GraphNode)
%wrap_handle(TFunction_Logbook)
%wrap_handle(TFunction_Scope)
%wrap_handle(TFunction_HArray1OfDataMapOfGUIDDriver)
/* end handles declaration */

/* templates */
%template(TFunction_Array1OfDataMapOfGUIDDriver) NCollection_Array1 <TFunction_DataMapOfGUIDDriver>;

%extend NCollection_Array1 <TFunction_DataMapOfGUIDDriver> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(TFunction_DataMapOfGUIDDriver) NCollection_DataMap <Standard_GUID , opencascade::handle <TFunction_Driver>, Standard_GUID>;
%template(TFunction_DoubleMapOfIntegerLabel) NCollection_DoubleMap <Standard_Integer , TDF_Label , TColStd_MapIntegerHasher , TDF_LabelMapHasher>;
%template(TFunction_DataMapOfLabelListOfLabel) NCollection_DataMap <TDF_Label , TDF_LabelList , TDF_LabelMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1 <TFunction_DataMapOfGUIDDriver> TFunction_Array1OfDataMapOfGUIDDriver;
typedef NCollection_DataMap <Standard_GUID , opencascade::handle <TFunction_Driver>, Standard_GUID> TFunction_DataMapOfGUIDDriver;
typedef NCollection_DataMap <Standard_GUID , opencascade::handle <TFunction_Driver>, Standard_GUID>::Iterator TFunction_DataMapIteratorOfDataMapOfGUIDDriver;
typedef NCollection_DoubleMap <Standard_Integer , TDF_Label , TColStd_MapIntegerHasher , TDF_LabelMapHasher> TFunction_DoubleMapOfIntegerLabel;
typedef NCollection_DoubleMap <Standard_Integer , TDF_Label , TColStd_MapIntegerHasher , TDF_LabelMapHasher>::Iterator TFunction_DoubleMapIteratorOfDoubleMapOfIntegerLabel;
typedef NCollection_DataMap <TDF_Label , TDF_LabelList , TDF_LabelMapHasher> TFunction_DataMapOfLabelListOfLabel;
typedef NCollection_DataMap <TDF_Label , TDF_LabelList , TDF_LabelMapHasher>::Iterator TFunction_DataMapIteratorOfDataMapOfLabelListOfLabel;
/* end typedefs declaration */

/*************************
* class TFunction_Driver *
*************************/
%nodefaultctor TFunction_Driver;
class TFunction_Driver : public Standard_Transient {
	public:
		/****************** Arguments ******************/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "* The method fills-in the list by labels, where the arguments of the function are located.
	:param args:
	:type args: TDF_LabelList
	:rtype: void") Arguments;
		virtual void Arguments (TDF_LabelList & args);

		/****************** Execute ******************/
		%feature("compactdefaultargs") Execute;
		%feature("autodoc", "* Executes the function in this function driver and puts the impacted labels in the logbook log. arguments & results of functions ================================
	:param log:
	:type log: TFunction_Logbook
	:rtype: int") Execute;
		virtual Standard_Integer Execute (opencascade::handle<TFunction_Logbook> & log);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the label L for this function prior to its execution.
	:param L:
	:type L: TDF_Label
	:rtype: None") Init;
		void Init (const TDF_Label & L);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns the label of the driver for this function.
	:rtype: TDF_Label") Label;
		TDF_Label Label ();

		/****************** MustExecute ******************/
		%feature("compactdefaultargs") MustExecute;
		%feature("autodoc", "* Analyzes the labels in the logbook log. Returns true if attributes have been modified. If the function label itself has been modified, the function must be executed.
	:param log:
	:type log: TFunction_Logbook
	:rtype: bool") MustExecute;
		virtual Standard_Boolean MustExecute (const opencascade::handle<TFunction_Logbook> & log);

		/****************** Results ******************/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "* The method fills-in the list by labels, where the results of the function are located.
	:param res:
	:type res: TDF_LabelList
	:rtype: void") Results;
		virtual void Results (TDF_LabelList & res);

		/****************** Validate ******************/
		%feature("compactdefaultargs") Validate;
		%feature("autodoc", "* Validates labels of a function in <log>. This function is the one initialized in this function driver. Warning In regeneration mode, the solver must call this method even if the function is not executed. execution of function =====================
	:param log:
	:type log: TFunction_Logbook
	:rtype: void") Validate;
		virtual void Validate (opencascade::handle<TFunction_Logbook> & log);

};


%make_alias(TFunction_Driver)

%extend TFunction_Driver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TFunction_DriverTable *
******************************/
class TFunction_DriverTable : public Standard_Transient {
	public:
		/****************** AddDriver ******************/
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "* Returns true if the driver has been added successfully to the driver table.
	:param guid:
	:type guid: Standard_GUID
	:param driver:
	:type driver: TFunction_Driver
	:param thread: default value is 0
	:type thread: int
	:rtype: bool") AddDriver;
		Standard_Boolean AddDriver (const Standard_GUID & guid,const opencascade::handle<TFunction_Driver> & driver,const Standard_Integer thread = 0);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Removes all drivers. Returns true if the driver has been removed successfully.
	:rtype: None") Clear;
		void Clear ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** FindDriver ******************/
		%feature("compactdefaultargs") FindDriver;
		%feature("autodoc", "* Returns true if the driver was found.
	:param guid:
	:type guid: Standard_GUID
	:param driver:
	:type driver: TFunction_Driver
	:param thread: default value is 0
	:type thread: int
	:rtype: bool") FindDriver;
		Standard_Boolean FindDriver (const Standard_GUID & guid,opencascade::handle<TFunction_Driver> & driver,const Standard_Integer thread = 0);

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "* Returns the driver table. If a driver does not exist, creates it.
	:rtype: opencascade::handle<TFunction_DriverTable>") Get;
		static opencascade::handle<TFunction_DriverTable> Get ();

		/****************** HasDriver ******************/
		%feature("compactdefaultargs") HasDriver;
		%feature("autodoc", "* Returns true if the driver exists in the driver table.
	:param guid:
	:type guid: Standard_GUID
	:param thread: default value is 0
	:type thread: int
	:rtype: bool") HasDriver;
		Standard_Boolean HasDriver (const Standard_GUID & guid,const Standard_Integer thread = 0);

		/****************** RemoveDriver ******************/
		%feature("compactdefaultargs") RemoveDriver;
		%feature("autodoc", "* Removes a driver with the given GUID. Returns true if the driver has been removed successfully.
	:param guid:
	:type guid: Standard_GUID
	:param thread: default value is 0
	:type thread: int
	:rtype: bool") RemoveDriver;
		Standard_Boolean RemoveDriver (const Standard_GUID & guid,const Standard_Integer thread = 0);

		/****************** TFunction_DriverTable ******************/
		%feature("compactdefaultargs") TFunction_DriverTable;
		%feature("autodoc", "* Default constructor
	:rtype: None") TFunction_DriverTable;
		 TFunction_DriverTable ();

};


%make_alias(TFunction_DriverTable)

%extend TFunction_DriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TFunction_Function *
***************************/
class TFunction_Function : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** Failed ******************/
		%feature("compactdefaultargs") Failed;
		%feature("autodoc", "* Returns true if the execution failed
	:rtype: bool") Failed;
		Standard_Boolean Failed ();

		/****************** GetDriverGUID ******************/
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "* Returns the GUID for this function's driver.
	:rtype: Standard_GUID") GetDriverGUID;
		const Standard_GUID & GetDriverGUID ();

		/****************** GetFailure ******************/
		%feature("compactdefaultargs") GetFailure;
		%feature("autodoc", "* Returns an index of failure if the execution of this function failed. If this integer value is 0, no failure has occurred. Implementation of Attribute methods: ===================================
	:rtype: int") GetFailure;
		Standard_Integer GetFailure ();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* Returns the GUID for functions. Returns a function found on the label. Instance methods: ================
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", ":rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", ":param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: void") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param with:
	:type with: TDF_Attribute
	:rtype: void") Restore;
		virtual void Restore (const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Static methods: ============== Finds or Creates a function attribute on the label <L>. Returns the function attribute.
	:param L:
	:type L: TDF_Label
	:rtype: opencascade::handle<TFunction_Function>") Set;
		static opencascade::handle<TFunction_Function> Set (const TDF_Label & L);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Finds or Creates a function attribute on the label <L>. Sets a driver ID to the function. Returns the function attribute.
	:param L:
	:type L: TDF_Label
	:param DriverID:
	:type DriverID: Standard_GUID
	:rtype: opencascade::handle<TFunction_Function>") Set;
		static opencascade::handle<TFunction_Function> Set (const TDF_Label & L,const Standard_GUID & DriverID);

		/****************** SetDriverGUID ******************/
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "* Sets the driver for this function as that indentified by the GUID guid.
	:param guid:
	:type guid: Standard_GUID
	:rtype: None") SetDriverGUID;
		void SetDriverGUID (const Standard_GUID & guid);

		/****************** SetFailure ******************/
		%feature("compactdefaultargs") SetFailure;
		%feature("autodoc", "* Sets the failed index.
	:param mode: default value is 0
	:type mode: int
	:rtype: None") SetFailure;
		void SetFailure (const Standard_Integer mode = 0);

		/****************** TFunction_Function ******************/
		%feature("compactdefaultargs") TFunction_Function;
		%feature("autodoc", ":rtype: None") TFunction_Function;
		 TFunction_Function ();

};


%make_alias(TFunction_Function)

%extend TFunction_Function {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TFunction_GraphNode *
****************************/
class TFunction_GraphNode : public TDF_Attribute {
	public:
		/****************** AddNext ******************/
		%feature("compactdefaultargs") AddNext;
		%feature("autodoc", "* Defines a reference to the function as a next one.
	:param funcID:
	:type funcID: int
	:rtype: bool") AddNext;
		Standard_Boolean AddNext (const Standard_Integer funcID);

		/****************** AddNext ******************/
		%feature("compactdefaultargs") AddNext;
		%feature("autodoc", "* Defines a reference to the function as a next one.
	:param func:
	:type func: TDF_Label
	:rtype: bool") AddNext;
		Standard_Boolean AddNext (const TDF_Label & func);

		/****************** AddPrevious ******************/
		%feature("compactdefaultargs") AddPrevious;
		%feature("autodoc", "* Defines a reference to the function as a previous one.
	:param funcID:
	:type funcID: int
	:rtype: bool") AddPrevious;
		Standard_Boolean AddPrevious (const Standard_Integer funcID);

		/****************** AddPrevious ******************/
		%feature("compactdefaultargs") AddPrevious;
		%feature("autodoc", "* Defines a reference to the function as a previous one.
	:param func:
	:type func: TDF_Label
	:rtype: bool") AddPrevious;
		Standard_Boolean AddPrevious (const TDF_Label & func);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* Returns the GUID for GraphNode attribute. Instant methods =============== Constructor (empty).
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** GetNext ******************/
		%feature("compactdefaultargs") GetNext;
		%feature("autodoc", "* Returns a map of next functions.
	:rtype: TColStd_MapOfInteger") GetNext;
		const TColStd_MapOfInteger & GetNext ();

		/****************** GetPrevious ******************/
		%feature("compactdefaultargs") GetPrevious;
		%feature("autodoc", "* Returns a map of previous functions.
	:rtype: TColStd_MapOfInteger") GetPrevious;
		const TColStd_MapOfInteger & GetPrevious ();

		/****************** GetStatus ******************/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "* Returns the execution status of the function.
	:rtype: TFunction_ExecutionStatus") GetStatus;
		TFunction_ExecutionStatus GetStatus ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", ":rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", ":param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: void") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** RemoveAllNext ******************/
		%feature("compactdefaultargs") RemoveAllNext;
		%feature("autodoc", "* Clears a map of next functions.
	:rtype: None") RemoveAllNext;
		void RemoveAllNext ();

		/****************** RemoveAllPrevious ******************/
		%feature("compactdefaultargs") RemoveAllPrevious;
		%feature("autodoc", "* Clears a map of previous functions.
	:rtype: None") RemoveAllPrevious;
		void RemoveAllPrevious ();

		/****************** RemoveNext ******************/
		%feature("compactdefaultargs") RemoveNext;
		%feature("autodoc", "* Removes a reference to the function as a next one.
	:param funcID:
	:type funcID: int
	:rtype: bool") RemoveNext;
		Standard_Boolean RemoveNext (const Standard_Integer funcID);

		/****************** RemoveNext ******************/
		%feature("compactdefaultargs") RemoveNext;
		%feature("autodoc", "* Removes a reference to the function as a next one.
	:param func:
	:type func: TDF_Label
	:rtype: bool") RemoveNext;
		Standard_Boolean RemoveNext (const TDF_Label & func);

		/****************** RemovePrevious ******************/
		%feature("compactdefaultargs") RemovePrevious;
		%feature("autodoc", "* Removes a reference to the function as a previous one.
	:param funcID:
	:type funcID: int
	:rtype: bool") RemovePrevious;
		Standard_Boolean RemovePrevious (const Standard_Integer funcID);

		/****************** RemovePrevious ******************/
		%feature("compactdefaultargs") RemovePrevious;
		%feature("autodoc", "* Removes a reference to the function as a previous one.
	:param func:
	:type func: TDF_Label
	:rtype: bool") RemovePrevious;
		Standard_Boolean RemovePrevious (const TDF_Label & func);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param with:
	:type with: TDF_Attribute
	:rtype: void") Restore;
		virtual void Restore (const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Static methods ============== Finds or Creates a graph node attribute at the label <L>. Returns the attribute.
	:param L:
	:type L: TDF_Label
	:rtype: opencascade::handle<TFunction_GraphNode>") Set;
		static opencascade::handle<TFunction_GraphNode> Set (const TDF_Label & L);

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "* Defines an execution status for a function. Implementation of Attribute methods ===================================
	:param status:
	:type status: TFunction_ExecutionStatus
	:rtype: None") SetStatus;
		void SetStatus (const TFunction_ExecutionStatus status);

		/****************** TFunction_GraphNode ******************/
		%feature("compactdefaultargs") TFunction_GraphNode;
		%feature("autodoc", ":rtype: None") TFunction_GraphNode;
		 TFunction_GraphNode ();

};


%make_alias(TFunction_GraphNode)

%extend TFunction_GraphNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TFunction_IFunction *
****************************/
class TFunction_IFunction {
	public:
		/****************** Arguments ******************/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "* The method fills-in the list by labels, where the arguments of the function are located.
	:param args:
	:type args: TDF_LabelList
	:rtype: None") Arguments;
		void Arguments (TDF_LabelList & args);

		/****************** DeleteFunction ******************/
		%feature("compactdefaultargs") DeleteFunction;
		%feature("autodoc", "* Deletes a function attached to a label <L>. It deletes a TFunction_Function attribute and a TFunction_GraphNode. It deletes the functions from the scope of function of this document.
	:param L:
	:type L: TDF_Label
	:rtype: bool") DeleteFunction;
		static Standard_Boolean DeleteFunction (const TDF_Label & L);

		/****************** GetAllFunctions ******************/
		%feature("compactdefaultargs") GetAllFunctions;
		%feature("autodoc", "* Returns the scope of all functions.
	:rtype: TFunction_DoubleMapOfIntegerLabel") GetAllFunctions;
		const TFunction_DoubleMapOfIntegerLabel & GetAllFunctions ();

		/****************** GetDriver ******************/
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "* Returns a driver of the function.
	:param thread: default value is 0
	:type thread: int
	:rtype: opencascade::handle<TFunction_Driver>") GetDriver;
		opencascade::handle<TFunction_Driver> GetDriver (const Standard_Integer thread = 0);

		/****************** GetGraphNode ******************/
		%feature("compactdefaultargs") GetGraphNode;
		%feature("autodoc", "* Returns a graph node of the function.
	:rtype: opencascade::handle<TFunction_GraphNode>") GetGraphNode;
		opencascade::handle<TFunction_GraphNode> GetGraphNode ();

		/****************** GetLogbook ******************/
		%feature("compactdefaultargs") GetLogbook;
		%feature("autodoc", "* Returns the Logbook - keeper of modifications.
	:rtype: opencascade::handle<TFunction_Logbook>") GetLogbook;
		opencascade::handle<TFunction_Logbook> GetLogbook ();

		/****************** GetNext ******************/
		%feature("compactdefaultargs") GetNext;
		%feature("autodoc", "* Returns a list of next functions.
	:param prev:
	:type prev: TDF_LabelList
	:rtype: None") GetNext;
		void GetNext (TDF_LabelList & prev);

		/****************** GetPrevious ******************/
		%feature("compactdefaultargs") GetPrevious;
		%feature("autodoc", "* Returns a list of previous functions.
	:param prev:
	:type prev: TDF_LabelList
	:rtype: None") GetPrevious;
		void GetPrevious (TDF_LabelList & prev);

		/****************** GetStatus ******************/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "* Returns the execution status of the function.
	:rtype: TFunction_ExecutionStatus") GetStatus;
		TFunction_ExecutionStatus GetStatus ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the interface by the label of function.
	:param L:
	:type L: TDF_Label
	:rtype: None") Init;
		void Init (const TDF_Label & L);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a label of the function.
	:rtype: TDF_Label") Label;
		const TDF_Label & Label ();

		/****************** NewFunction ******************/
		%feature("compactdefaultargs") NewFunction;
		%feature("autodoc", "* Sets a new function attached to a label <L> with <ID>. It creates a new TFunction_Function attribute initialized by the <ID>, a new TFunction_GraphNode with an empty list of dependencies and the status equal to TFunction_ES_WrongDefinition. It registers the function in the scope of functions for this document.
	:param L:
	:type L: TDF_Label
	:param ID:
	:type ID: Standard_GUID
	:rtype: bool") NewFunction;
		static Standard_Boolean NewFunction (const TDF_Label & L,const Standard_GUID & ID);

		/****************** Results ******************/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "* The method fills-in the list by labels, where the results of the function are located.
	:param res:
	:type res: TDF_LabelList
	:rtype: None") Results;
		void Results (TDF_LabelList & res);

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "* Defines an execution status for a function.
	:param status:
	:type status: TFunction_ExecutionStatus
	:rtype: None") SetStatus;
		void SetStatus (const TFunction_ExecutionStatus status);

		/****************** TFunction_IFunction ******************/
		%feature("compactdefaultargs") TFunction_IFunction;
		%feature("autodoc", ":rtype: None") TFunction_IFunction;
		 TFunction_IFunction ();

		/****************** TFunction_IFunction ******************/
		%feature("compactdefaultargs") TFunction_IFunction;
		%feature("autodoc", "* A constructor. Initializes the interface by the label of function.
	:param L:
	:type L: TDF_Label
	:rtype: None") TFunction_IFunction;
		 TFunction_IFunction (const TDF_Label & L);

		/****************** UpdateDependencies ******************/
		%feature("compactdefaultargs") UpdateDependencies;
		%feature("autodoc", "* Updates dependencies for all functions of the scope. It returns false in case of an error. An empty constructor.
	:param Access:
	:type Access: TDF_Label
	:rtype: bool") UpdateDependencies;
		static Standard_Boolean UpdateDependencies (const TDF_Label & Access);

		/****************** UpdateDependencies ******************/
		%feature("compactdefaultargs") UpdateDependencies;
		%feature("autodoc", "* Updates the dependencies of this function only.
	:rtype: bool") UpdateDependencies;
		Standard_Boolean UpdateDependencies ();

};


%extend TFunction_IFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TFunction_Iterator *
***************************/
class TFunction_Iterator {
	public:
		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "* Returns the current list of functions. If the iterator uses the execution status, the returned list contains only the functions with 'not executed' status.
	:rtype: TDF_LabelList") Current;
		virtual const TDF_LabelList & Current ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GetMaxNbThreads ******************/
		%feature("compactdefaultargs") GetMaxNbThreads;
		%feature("autodoc", "* Analyses the graph of dependencies and returns maximum number of threads may be used to calculate the model.
	:rtype: int") GetMaxNbThreads;
		virtual Standard_Integer GetMaxNbThreads ();

		/****************** GetStatus ******************/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "* A help-function aimed to help the user to check the status of retrurned function. It calls TFunction_GraphNode::GetStatus() inside.
	:param func:
	:type func: TDF_Label
	:rtype: TFunction_ExecutionStatus") GetStatus;
		TFunction_ExecutionStatus GetStatus (const TDF_Label & func);

		/****************** GetUsageOfExecutionStatus ******************/
		%feature("compactdefaultargs") GetUsageOfExecutionStatus;
		%feature("autodoc", "* Returns usage of execution status by the iterator.
	:rtype: bool") GetUsageOfExecutionStatus;
		Standard_Boolean GetUsageOfExecutionStatus ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the Iterator.
	:param Access:
	:type Access: TDF_Label
	:rtype: void") Init;
		virtual void Init (const TDF_Label & Access);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns false if the graph of functions is fully iterated.
	:rtype: bool") More;
		virtual Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Switches the iterator to the next list of current functions.
	:rtype: void") Next;
		virtual void Next ();

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "* A help-function aimed to help the user to change the execution status of a function. It calls TFunction_GraphNode::SetStatus() inside.
	:param func:
	:type func: TDF_Label
	:param status:
	:type status: TFunction_ExecutionStatus
	:rtype: None") SetStatus;
		void SetStatus (const TDF_Label & func,const TFunction_ExecutionStatus status);

		/****************** SetUsageOfExecutionStatus ******************/
		%feature("compactdefaultargs") SetUsageOfExecutionStatus;
		%feature("autodoc", "* Defines the mode of iteration - usage or not of the execution status. If the iterator takes into account the execution status, the method ::Current() returns only 'not executed' functions while their status is not changed. If the iterator ignores the execution status, the method ::Current() returns the functions following their dependencies and ignoring the execution status.
	:param usage:
	:type usage: bool
	:rtype: None") SetUsageOfExecutionStatus;
		void SetUsageOfExecutionStatus (const Standard_Boolean usage);

		/****************** TFunction_Iterator ******************/
		%feature("compactdefaultargs") TFunction_Iterator;
		%feature("autodoc", "* An empty constructor.
	:rtype: None") TFunction_Iterator;
		 TFunction_Iterator ();

		/****************** TFunction_Iterator ******************/
		%feature("compactdefaultargs") TFunction_Iterator;
		%feature("autodoc", "* A constructor. Initializes the iterator.
	:param Access:
	:type Access: TDF_Label
	:rtype: None") TFunction_Iterator;
		 TFunction_Iterator (const TDF_Label & Access);

};


%extend TFunction_Iterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TFunction_Logbook *
**************************/
class TFunction_Logbook : public TDF_Attribute {
	public:
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears this logbook to its default, empty state.
	:rtype: None") Clear;
		void Clear ();

		/****************** Done ******************/
		%feature("compactdefaultargs") Done;
		%feature("autodoc", "* Sets status of execution.
	:param status:
	:type status: bool
	:rtype: None") Done;
		void Done (const Standard_Boolean status);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* Returns the GUID for logbook attribute.
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** GetImpacted ******************/
		%feature("compactdefaultargs") GetImpacted;
		%feature("autodoc", "* Returns the map of impacted labels contained in this logbook.
	:rtype: TDF_LabelMap") GetImpacted;
		const TDF_LabelMap & GetImpacted ();

		/****************** GetTouched ******************/
		%feature("compactdefaultargs") GetTouched;
		%feature("autodoc", "* Returns the map of touched labels in this logbook. A touched label is the one modified by the end user.
	:rtype: TDF_LabelMap") GetTouched;
		const TDF_LabelMap & GetTouched ();

		/****************** GetValid ******************/
		%feature("compactdefaultargs") GetValid;
		%feature("autodoc", "* Returns the map of valid labels in this logbook.
	:rtype: TDF_LabelMap") GetValid;
		const TDF_LabelMap & GetValid ();

		/****************** GetValid ******************/
		%feature("compactdefaultargs") GetValid;
		%feature("autodoc", ":param Ls:
	:type Ls: TDF_LabelMap
	:rtype: None") GetValid;
		void GetValid (TDF_LabelMap & Ls);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "* The methods inherited from TDF_Attribute Returns the ID of the attribute.
	:rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns status of execution.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", ":rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "* Returns True if the label L is touched or impacted. This method is called by <TFunction_FunctionDriver::MustExecute>. If <WithChildren> is set to true, the method checks all the sublabels of <L> too.
	:param L:
	:type L: TDF_Label
	:param WithChildren: default value is Standard_False
	:type WithChildren: bool
	:rtype: bool") IsModified;
		Standard_Boolean IsModified (const TDF_Label & L,const Standard_Boolean WithChildren = Standard_False);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "* Returns a new empty instance of the attribute.
	:rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "* Pastes the attribute to another label.
	:param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "* Undos (and redos) the attribute.
	:param with:
	:type with: TDF_Attribute
	:rtype: void") Restore;
		virtual void Restore (const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Finds or Creates a TFunction_Logbook attribute at the root label accessed by <Access>. Returns the attribute.
	:param Access:
	:type Access: TDF_Label
	:rtype: opencascade::handle<TFunction_Logbook>") Set;
		static opencascade::handle<TFunction_Logbook> Set (const TDF_Label & Access);

		/****************** SetImpacted ******************/
		%feature("compactdefaultargs") SetImpacted;
		%feature("autodoc", "* Sets the label L as an impacted label in this logbook. This method is called by execution of the function driver.
	:param L:
	:type L: TDF_Label
	:param WithChildren: default value is Standard_False
	:type WithChildren: bool
	:rtype: None") SetImpacted;
		void SetImpacted (const TDF_Label & L,const Standard_Boolean WithChildren = Standard_False);

		/****************** SetTouched ******************/
		%feature("compactdefaultargs") SetTouched;
		%feature("autodoc", "* Sets the label L as a touched label in this logbook. In other words, L is understood to have been modified by the end user.
	:param L:
	:type L: TDF_Label
	:rtype: None") SetTouched;
		void SetTouched (const TDF_Label & L);

		/****************** SetValid ******************/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "* Sets the label L as a valid label in this logbook.
	:param L:
	:type L: TDF_Label
	:param WithChildren: default value is Standard_False
	:type WithChildren: bool
	:rtype: None") SetValid;
		void SetValid (const TDF_Label & L,const Standard_Boolean WithChildren = Standard_False);

		/****************** SetValid ******************/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", ":param Ls:
	:type Ls: TDF_LabelMap
	:rtype: None") SetValid;
		void SetValid (const TDF_LabelMap & Ls);

		/****************** TFunction_Logbook ******************/
		%feature("compactdefaultargs") TFunction_Logbook;
		%feature("autodoc", "* The methods manipulating the data (touched, impacted and valid labels) Constructor (empty).
	:rtype: None") TFunction_Logbook;
		 TFunction_Logbook ();

};


%make_alias(TFunction_Logbook)

%extend TFunction_Logbook {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TFunction_Scope *
************************/
class TFunction_Scope : public TDF_Attribute {
	public:
		/****************** AddFunction ******************/
		%feature("compactdefaultargs") AddFunction;
		%feature("autodoc", "* Adds a function to the scope of functions.
	:param L:
	:type L: TDF_Label
	:rtype: bool") AddFunction;
		Standard_Boolean AddFunction (const TDF_Label & L);

		/****************** ChangeFunctions ******************/
		%feature("compactdefaultargs") ChangeFunctions;
		%feature("autodoc", "* Returns the scope of functions for modification. Warning: Don't use this method if You are not sure what You do!
	:rtype: TFunction_DoubleMapOfIntegerLabel") ChangeFunctions;
		TFunction_DoubleMapOfIntegerLabel & ChangeFunctions ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GetFreeID ******************/
		%feature("compactdefaultargs") GetFreeID;
		%feature("autodoc", ":rtype: int") GetFreeID;
		Standard_Integer GetFreeID ();

		/****************** GetFunction ******************/
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "* Returns an ID of the function.
	:param L:
	:type L: TDF_Label
	:rtype: int") GetFunction;
		Standard_Integer GetFunction (const TDF_Label & L);

		/****************** GetFunction ******************/
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "* Returns the label of the function with this ID.
	:param ID:
	:type ID: int
	:rtype: TDF_Label") GetFunction;
		const TDF_Label & GetFunction (const Standard_Integer ID);

		/****************** GetFunctions ******************/
		%feature("compactdefaultargs") GetFunctions;
		%feature("autodoc", "* Returns the scope of functions.
	:rtype: TFunction_DoubleMapOfIntegerLabel") GetFunctions;
		const TFunction_DoubleMapOfIntegerLabel & GetFunctions ();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* Returns the GUID for Scope attribute. Instant methods =============== Constructor (empty).
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** GetLogbook ******************/
		%feature("compactdefaultargs") GetLogbook;
		%feature("autodoc", "* Returns the Logbook used in TFunction_Driver methods. Implementation of Attribute methods ===================================
	:rtype: opencascade::handle<TFunction_Logbook>") GetLogbook;
		opencascade::handle<TFunction_Logbook> GetLogbook ();

		/****************** HasFunction ******************/
		%feature("compactdefaultargs") HasFunction;
		%feature("autodoc", "* Returns true if the function exists with such an ID.
	:param ID:
	:type ID: int
	:rtype: bool") HasFunction;
		Standard_Boolean HasFunction (const Standard_Integer ID);

		/****************** HasFunction ******************/
		%feature("compactdefaultargs") HasFunction;
		%feature("autodoc", "* Returns true if the label contains a function of this scope.
	:param L:
	:type L: TDF_Label
	:rtype: bool") HasFunction;
		Standard_Boolean HasFunction (const TDF_Label & L);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", ":rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveAllFunctions ******************/
		%feature("compactdefaultargs") RemoveAllFunctions;
		%feature("autodoc", "* Removes all functions from the scope of functions.
	:rtype: None") RemoveAllFunctions;
		void RemoveAllFunctions ();

		/****************** RemoveFunction ******************/
		%feature("compactdefaultargs") RemoveFunction;
		%feature("autodoc", "* Removes a function from the scope of functions.
	:param L:
	:type L: TDF_Label
	:rtype: bool") RemoveFunction;
		Standard_Boolean RemoveFunction (const TDF_Label & L);

		/****************** RemoveFunction ******************/
		%feature("compactdefaultargs") RemoveFunction;
		%feature("autodoc", "* Removes a function from the scope of functions.
	:param ID:
	:type ID: int
	:rtype: bool") RemoveFunction;
		Standard_Boolean RemoveFunction (const Standard_Integer ID);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param with:
	:type with: TDF_Attribute
	:rtype: void") Restore;
		virtual void Restore (const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Static methods ============== Finds or Creates a TFunction_Scope attribute at the root label accessed by <Access>. Returns the attribute.
	:param Access:
	:type Access: TDF_Label
	:rtype: opencascade::handle<TFunction_Scope>") Set;
		static opencascade::handle<TFunction_Scope> Set (const TDF_Label & Access);

		/****************** SetFreeID ******************/
		%feature("compactdefaultargs") SetFreeID;
		%feature("autodoc", ":param ID:
	:type ID: int
	:rtype: None") SetFreeID;
		void SetFreeID (const Standard_Integer ID);

		/****************** TFunction_Scope ******************/
		%feature("compactdefaultargs") TFunction_Scope;
		%feature("autodoc", ":rtype: None") TFunction_Scope;
		 TFunction_Scope ();

};


%make_alias(TFunction_Scope)

%extend TFunction_Scope {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class TFunction_HArray1OfDataMapOfGUIDDriver : public  TFunction_Array1OfDataMapOfGUIDDriver, public Standard_Transient {
  public:
    TFunction_HArray1OfDataMapOfGUIDDriver(const Standard_Integer theLower, const Standard_Integer theUpper);
    TFunction_HArray1OfDataMapOfGUIDDriver(const Standard_Integer theLower, const Standard_Integer theUpper, const  TFunction_Array1OfDataMapOfGUIDDriver::value_type& theValue);
    TFunction_HArray1OfDataMapOfGUIDDriver(const  TFunction_Array1OfDataMapOfGUIDDriver& theOther);
    const  TFunction_Array1OfDataMapOfGUIDDriver& Array1();
     TFunction_Array1OfDataMapOfGUIDDriver& ChangeArray1();
};
%make_alias(TFunction_HArray1OfDataMapOfGUIDDriver)


/* harray2 classes */
/* hsequence classes */
