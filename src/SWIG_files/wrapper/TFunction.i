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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum TFunction_ExecutionStatus {
	TFunction_ES_WrongDefinition = 0,
	TFunction_ES_NotExecuted = 1,
	TFunction_ES_Executing = 2,
	TFunction_ES_Succeeded = 3,
	TFunction_ES_Failed = 4,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class TFunction_ExecutionStatus(IntEnum):
	TFunction_ES_WrongDefinition = 0
	TFunction_ES_NotExecuted = 1
	TFunction_ES_Executing = 2
	TFunction_ES_Succeeded = 3
	TFunction_ES_Failed = 4
TFunction_ES_WrongDefinition = TFunction_ExecutionStatus.TFunction_ES_WrongDefinition
TFunction_ES_NotExecuted = TFunction_ExecutionStatus.TFunction_ES_NotExecuted
TFunction_ES_Executing = TFunction_ExecutionStatus.TFunction_ES_Executing
TFunction_ES_Succeeded = TFunction_ExecutionStatus.TFunction_ES_Succeeded
TFunction_ES_Failed = TFunction_ExecutionStatus.TFunction_ES_Failed
};
/* end python proxy for enums */

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
%template(TFunction_Array1OfDataMapOfGUIDDriver) NCollection_Array1<TFunction_DataMapOfGUIDDriver>;

%extend NCollection_Array1<TFunction_DataMapOfGUIDDriver> {
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
%template(TFunction_DataMapOfGUIDDriver) NCollection_DataMap<Standard_GUID,opencascade::handle<TFunction_Driver>,Standard_GUID>;
%template(TFunction_DataMapOfLabelListOfLabel) NCollection_DataMap<TDF_Label,TDF_LabelList,TDF_LabelMapHasher>;
%template(TFunction_DoubleMapOfIntegerLabel) NCollection_DoubleMap<Standard_Integer,TDF_Label,TColStd_MapIntegerHasher,TDF_LabelMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<TFunction_DataMapOfGUIDDriver> TFunction_Array1OfDataMapOfGUIDDriver;
typedef NCollection_DataMap<Standard_GUID, opencascade::handle<TFunction_Driver>, Standard_GUID>::Iterator TFunction_DataMapIteratorOfDataMapOfGUIDDriver;
typedef NCollection_DataMap<TDF_Label, TDF_LabelList, TDF_LabelMapHasher>::Iterator TFunction_DataMapIteratorOfDataMapOfLabelListOfLabel;
typedef NCollection_DataMap<Standard_GUID, opencascade::handle<TFunction_Driver>, Standard_GUID> TFunction_DataMapOfGUIDDriver;
typedef NCollection_DataMap<TDF_Label, TDF_LabelList, TDF_LabelMapHasher> TFunction_DataMapOfLabelListOfLabel;
typedef NCollection_DoubleMap<Standard_Integer, TDF_Label, TColStd_MapIntegerHasher, TDF_LabelMapHasher>::Iterator TFunction_DoubleMapIteratorOfDoubleMapOfIntegerLabel;
typedef NCollection_DoubleMap<Standard_Integer, TDF_Label, TColStd_MapIntegerHasher, TDF_LabelMapHasher> TFunction_DoubleMapOfIntegerLabel;
/* end typedefs declaration */

/*************************
* class TFunction_Driver *
*************************/
%nodefaultctor TFunction_Driver;
class TFunction_Driver : public Standard_Transient {
	public:
		/****************** Arguments ******************/
		/**** md5 signature: 4bba17ca81de91c4df690b3c81768a5b ****/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "The method fills-in the list by labels, where the arguments of the function are located.

Parameters
----------
args: TDF_LabelList

Returns
-------
None
") Arguments;
		virtual void Arguments(TDF_LabelList & args);

		/****************** Execute ******************/
		/**** md5 signature: 8f1f158cb1e50b9ad9cbeb810402dbb9 ****/
		%feature("compactdefaultargs") Execute;
		%feature("autodoc", "Executes the function in this function driver and puts the impacted labels in the logbook log. arguments & results of functions ================================.

Parameters
----------
log: TFunction_Logbook

Returns
-------
int
") Execute;
		virtual Standard_Integer Execute(opencascade::handle<TFunction_Logbook> & log);

		/****************** Init ******************/
		/**** md5 signature: 04d8cbbfa106ea91a8e8ec8518b2d168 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the label l for this function prior to its execution.

Parameters
----------
L: TDF_Label

Returns
-------
None
") Init;
		void Init(const TDF_Label & L);

		/****************** Label ******************/
		/**** md5 signature: 45446fb6d4e5a656e74b10a5eb4cd845 ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label of the driver for this function.

Returns
-------
TDF_Label
") Label;
		TDF_Label Label();

		/****************** MustExecute ******************/
		/**** md5 signature: ed847147c57bdc6a486bd9096417dbbd ****/
		%feature("compactdefaultargs") MustExecute;
		%feature("autodoc", "Analyzes the labels in the logbook log. returns true if attributes have been modified. if the function label itself has been modified, the function must be executed.

Parameters
----------
log: TFunction_Logbook

Returns
-------
bool
") MustExecute;
		virtual Standard_Boolean MustExecute(const opencascade::handle<TFunction_Logbook> & log);

		/****************** Results ******************/
		/**** md5 signature: 1def5504257d3183313d6e32adc3f82c ****/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "The method fills-in the list by labels, where the results of the function are located.

Parameters
----------
res: TDF_LabelList

Returns
-------
None
") Results;
		virtual void Results(TDF_LabelList & res);

		/****************** Validate ******************/
		/**** md5 signature: 69c28722fabc21dce096f9430b8d8dd2 ****/
		%feature("compactdefaultargs") Validate;
		%feature("autodoc", "Validates labels of a function in <log>. this function is the one initialized in this function driver. warning in regeneration mode, the solver must call this method even if the function is not executed. execution of function =====================.

Parameters
----------
log: TFunction_Logbook

Returns
-------
None
") Validate;
		virtual void Validate(opencascade::handle<TFunction_Logbook> & log);

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
		/****************** TFunction_DriverTable ******************/
		/**** md5 signature: 1e2dc65f0349a608d8b1892add60c315 ****/
		%feature("compactdefaultargs") TFunction_DriverTable;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") TFunction_DriverTable;
		 TFunction_DriverTable();

		/****************** AddDriver ******************/
		/**** md5 signature: 990c0ed5bd237c30c73356fef2a2a75e ****/
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "Returns true if the driver has been added successfully to the driver table.

Parameters
----------
guid: Standard_GUID
driver: TFunction_Driver
thread: int,optional
	default value is 0

Returns
-------
bool
") AddDriver;
		Standard_Boolean AddDriver(const Standard_GUID & guid, const opencascade::handle<TFunction_Driver> & driver, const Standard_Integer thread = 0);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all drivers. returns true if the driver has been removed successfully.

Returns
-------
None
") Clear;
		void Clear();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** FindDriver ******************/
		/**** md5 signature: 40071a232ea53c66f7cc98d78279429a ****/
		%feature("compactdefaultargs") FindDriver;
		%feature("autodoc", "Returns true if the driver was found.

Parameters
----------
guid: Standard_GUID
driver: TFunction_Driver
thread: int,optional
	default value is 0

Returns
-------
bool
") FindDriver;
		Standard_Boolean FindDriver(const Standard_GUID & guid, opencascade::handle<TFunction_Driver> & driver, const Standard_Integer thread = 0);

		/****************** Get ******************/
		/**** md5 signature: 99832888c5ad61808b6c3a1d6f9f47ab ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the driver table. if a driver does not exist, creates it.

Returns
-------
opencascade::handle<TFunction_DriverTable>
") Get;
		static opencascade::handle<TFunction_DriverTable> Get();

		/****************** HasDriver ******************/
		/**** md5 signature: a13dcf522146bf63d5f903a907eb9bec ****/
		%feature("compactdefaultargs") HasDriver;
		%feature("autodoc", "Returns true if the driver exists in the driver table.

Parameters
----------
guid: Standard_GUID
thread: int,optional
	default value is 0

Returns
-------
bool
") HasDriver;
		Standard_Boolean HasDriver(const Standard_GUID & guid, const Standard_Integer thread = 0);

		/****************** RemoveDriver ******************/
		/**** md5 signature: 0487b3b5549030bd89cc5ba37eb1e15d ****/
		%feature("compactdefaultargs") RemoveDriver;
		%feature("autodoc", "Removes a driver with the given guid. returns true if the driver has been removed successfully.

Parameters
----------
guid: Standard_GUID
thread: int,optional
	default value is 0

Returns
-------
bool
") RemoveDriver;
		Standard_Boolean RemoveDriver(const Standard_GUID & guid, const Standard_Integer thread = 0);

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
		/****************** TFunction_Function ******************/
		/**** md5 signature: b9c7048d524663afffe8366d1791feb5 ****/
		%feature("compactdefaultargs") TFunction_Function;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TFunction_Function;
		 TFunction_Function();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Failed ******************/
		/**** md5 signature: c3da447468b921d93e6422cc08e3d1e7 ****/
		%feature("compactdefaultargs") Failed;
		%feature("autodoc", "Returns true if the execution failed.

Returns
-------
bool
") Failed;
		Standard_Boolean Failed();

		/****************** GetDriverGUID ******************/
		/**** md5 signature: 0e0689f6b2e27ee70a70496d12a69015 ****/
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "Returns the guid for this function's driver.

Returns
-------
Standard_GUID
") GetDriverGUID;
		const Standard_GUID & GetDriverGUID();

		/****************** GetFailure ******************/
		/**** md5 signature: ab0d027da81cfa3770c0c0a8ed26e021 ****/
		%feature("compactdefaultargs") GetFailure;
		%feature("autodoc", "Returns an index of failure if the execution of this function failed. if this integer value is 0, no failure has occurred. implementation of attribute methods: ===================================.

Returns
-------
int
") GetFailure;
		Standard_Integer GetFailure();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the guid for functions. returns a function found on the label. instance methods: ================.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 05e5f8f16a08ca8388ac65d3be603584 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		/**** md5 signature: 3f614360a69c957f8600d26b49bc71b2 ****/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDataSet: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		/**** md5 signature: 317305acc3f3ea9c2fd983a7ed00e566 ****/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		/**** md5 signature: aca554bf54cbef266ab789ddb6086714 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Static methods: ============== finds or creates a function attribute on the label <l>. returns the function attribute.

Parameters
----------
L: TDF_Label

Returns
-------
opencascade::handle<TFunction_Function>
") Set;
		static opencascade::handle<TFunction_Function> Set(const TDF_Label & L);

		/****************** Set ******************/
		/**** md5 signature: b0b73840ed28fd912c95afec06fd8ac6 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a function attribute on the label <l>. sets a driver id to the function. returns the function attribute.

Parameters
----------
L: TDF_Label
DriverID: Standard_GUID

Returns
-------
opencascade::handle<TFunction_Function>
") Set;
		static opencascade::handle<TFunction_Function> Set(const TDF_Label & L, const Standard_GUID & DriverID);

		/****************** SetDriverGUID ******************/
		/**** md5 signature: 07186d86451e9b1ad5ad4848dd63f1dc ****/
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "Sets the driver for this function as that indentified by the guid guid.

Parameters
----------
guid: Standard_GUID

Returns
-------
None
") SetDriverGUID;
		void SetDriverGUID(const Standard_GUID & guid);

		/****************** SetFailure ******************/
		/**** md5 signature: 7de1e35f0beb0ac9d20d5fb500b27540 ****/
		%feature("compactdefaultargs") SetFailure;
		%feature("autodoc", "Sets the failed index.

Parameters
----------
mode: int,optional
	default value is 0

Returns
-------
None
") SetFailure;
		void SetFailure(const Standard_Integer mode = 0);

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
		/****************** TFunction_GraphNode ******************/
		/**** md5 signature: 840026a0804abadd928349149b54de96 ****/
		%feature("compactdefaultargs") TFunction_GraphNode;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TFunction_GraphNode;
		 TFunction_GraphNode();

		/****************** AddNext ******************/
		/**** md5 signature: 46f1368888ac2f27323ecb83c4e2780e ****/
		%feature("compactdefaultargs") AddNext;
		%feature("autodoc", "Defines a reference to the function as a next one.

Parameters
----------
funcID: int

Returns
-------
bool
") AddNext;
		Standard_Boolean AddNext(const Standard_Integer funcID);

		/****************** AddNext ******************/
		/**** md5 signature: 30d1fa6ecff42d69a4ecb4324e40b9bf ****/
		%feature("compactdefaultargs") AddNext;
		%feature("autodoc", "Defines a reference to the function as a next one.

Parameters
----------
func: TDF_Label

Returns
-------
bool
") AddNext;
		Standard_Boolean AddNext(const TDF_Label & func);

		/****************** AddPrevious ******************/
		/**** md5 signature: fcbc15f22d1d20f10c6e462339e8b99c ****/
		%feature("compactdefaultargs") AddPrevious;
		%feature("autodoc", "Defines a reference to the function as a previous one.

Parameters
----------
funcID: int

Returns
-------
bool
") AddPrevious;
		Standard_Boolean AddPrevious(const Standard_Integer funcID);

		/****************** AddPrevious ******************/
		/**** md5 signature: 817018c3f68fee1004e6f7635bbf057a ****/
		%feature("compactdefaultargs") AddPrevious;
		%feature("autodoc", "Defines a reference to the function as a previous one.

Parameters
----------
func: TDF_Label

Returns
-------
bool
") AddPrevious;
		Standard_Boolean AddPrevious(const TDF_Label & func);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the guid for graphnode attribute. instant methods =============== constructor (empty).

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetNext ******************/
		/**** md5 signature: 2c92b7840c40f1d4060b8645cdd7203e ****/
		%feature("compactdefaultargs") GetNext;
		%feature("autodoc", "Returns a map of next functions.

Returns
-------
TColStd_MapOfInteger
") GetNext;
		const TColStd_MapOfInteger & GetNext();

		/****************** GetPrevious ******************/
		/**** md5 signature: 0c76468cefb57cc5ca0c158597c978c5 ****/
		%feature("compactdefaultargs") GetPrevious;
		%feature("autodoc", "Returns a map of previous functions.

Returns
-------
TColStd_MapOfInteger
") GetPrevious;
		const TColStd_MapOfInteger & GetPrevious();

		/****************** GetStatus ******************/
		/**** md5 signature: d22ac7893e97d480932227129700806c ****/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Returns the execution status of the function.

Returns
-------
TFunction_ExecutionStatus
") GetStatus;
		TFunction_ExecutionStatus GetStatus();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 05e5f8f16a08ca8388ac65d3be603584 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		/**** md5 signature: 3f614360a69c957f8600d26b49bc71b2 ****/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDataSet: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** RemoveAllNext ******************/
		/**** md5 signature: 0cd87a83ea50ca309bc065a771225586 ****/
		%feature("compactdefaultargs") RemoveAllNext;
		%feature("autodoc", "Clears a map of next functions.

Returns
-------
None
") RemoveAllNext;
		void RemoveAllNext();

		/****************** RemoveAllPrevious ******************/
		/**** md5 signature: 6fa7fdc92df1cf59d5c5e281367883c4 ****/
		%feature("compactdefaultargs") RemoveAllPrevious;
		%feature("autodoc", "Clears a map of previous functions.

Returns
-------
None
") RemoveAllPrevious;
		void RemoveAllPrevious();

		/****************** RemoveNext ******************/
		/**** md5 signature: d64243f774cea972663b505ad15afa03 ****/
		%feature("compactdefaultargs") RemoveNext;
		%feature("autodoc", "Removes a reference to the function as a next one.

Parameters
----------
funcID: int

Returns
-------
bool
") RemoveNext;
		Standard_Boolean RemoveNext(const Standard_Integer funcID);

		/****************** RemoveNext ******************/
		/**** md5 signature: 749269e72d7fc21a359cc7533a289ccc ****/
		%feature("compactdefaultargs") RemoveNext;
		%feature("autodoc", "Removes a reference to the function as a next one.

Parameters
----------
func: TDF_Label

Returns
-------
bool
") RemoveNext;
		Standard_Boolean RemoveNext(const TDF_Label & func);

		/****************** RemovePrevious ******************/
		/**** md5 signature: 334ea5a1f0fe47a269ff5d99a5ddbdbe ****/
		%feature("compactdefaultargs") RemovePrevious;
		%feature("autodoc", "Removes a reference to the function as a previous one.

Parameters
----------
funcID: int

Returns
-------
bool
") RemovePrevious;
		Standard_Boolean RemovePrevious(const Standard_Integer funcID);

		/****************** RemovePrevious ******************/
		/**** md5 signature: 690308575b8794f75585531b28bb8bd2 ****/
		%feature("compactdefaultargs") RemovePrevious;
		%feature("autodoc", "Removes a reference to the function as a previous one.

Parameters
----------
func: TDF_Label

Returns
-------
bool
") RemovePrevious;
		Standard_Boolean RemovePrevious(const TDF_Label & func);

		/****************** Restore ******************/
		/**** md5 signature: 317305acc3f3ea9c2fd983a7ed00e566 ****/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		/**** md5 signature: 094ce1b4803fd44779764fb4b5bbc278 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Static methods ============== finds or creates a graph node attribute at the label <l>. returns the attribute.

Parameters
----------
L: TDF_Label

Returns
-------
opencascade::handle<TFunction_GraphNode>
") Set;
		static opencascade::handle<TFunction_GraphNode> Set(const TDF_Label & L);

		/****************** SetStatus ******************/
		/**** md5 signature: d65ad3bd62bda10bd543de7f03931f36 ****/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Defines an execution status for a function. implementation of attribute methods ===================================.

Parameters
----------
status: TFunction_ExecutionStatus

Returns
-------
None
") SetStatus;
		void SetStatus(const TFunction_ExecutionStatus status);

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
		/****************** TFunction_IFunction ******************/
		/**** md5 signature: 8d63105f8a6ad4acb652c7c6ec381e72 ****/
		%feature("compactdefaultargs") TFunction_IFunction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TFunction_IFunction;
		 TFunction_IFunction();

		/****************** TFunction_IFunction ******************/
		/**** md5 signature: 3096b6694485edb079cd64a06ab874e6 ****/
		%feature("compactdefaultargs") TFunction_IFunction;
		%feature("autodoc", "A constructor. initializes the interface by the label of function.

Parameters
----------
L: TDF_Label

Returns
-------
None
") TFunction_IFunction;
		 TFunction_IFunction(const TDF_Label & L);

		/****************** Arguments ******************/
		/**** md5 signature: 36ff9641bb166dfb0eeac7454f7615db ****/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "The method fills-in the list by labels, where the arguments of the function are located.

Parameters
----------
args: TDF_LabelList

Returns
-------
None
") Arguments;
		void Arguments(TDF_LabelList & args);

		/****************** DeleteFunction ******************/
		/**** md5 signature: a370b1b834afd69c6f938d6aa2863f44 ****/
		%feature("compactdefaultargs") DeleteFunction;
		%feature("autodoc", "Deletes a function attached to a label <l>. it deletes a tfunction_function attribute and a tfunction_graphnode. it deletes the functions from the scope of function of this document.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") DeleteFunction;
		static Standard_Boolean DeleteFunction(const TDF_Label & L);

		/****************** GetAllFunctions ******************/
		/**** md5 signature: c18f441033a9c6525f76df221447f7f3 ****/
		%feature("compactdefaultargs") GetAllFunctions;
		%feature("autodoc", "Returns the scope of all functions.

Returns
-------
TFunction_DoubleMapOfIntegerLabel
") GetAllFunctions;
		const TFunction_DoubleMapOfIntegerLabel & GetAllFunctions();

		/****************** GetDriver ******************/
		/**** md5 signature: ec861a28b99b970cedc10dcc1154472c ****/
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "Returns a driver of the function.

Parameters
----------
thread: int,optional
	default value is 0

Returns
-------
opencascade::handle<TFunction_Driver>
") GetDriver;
		opencascade::handle<TFunction_Driver> GetDriver(const Standard_Integer thread = 0);

		/****************** GetGraphNode ******************/
		/**** md5 signature: ce954ac825727c0f4041e07053e3755c ****/
		%feature("compactdefaultargs") GetGraphNode;
		%feature("autodoc", "Returns a graph node of the function.

Returns
-------
opencascade::handle<TFunction_GraphNode>
") GetGraphNode;
		opencascade::handle<TFunction_GraphNode> GetGraphNode();

		/****************** GetLogbook ******************/
		/**** md5 signature: 413c9b5e90f1e3a8ba4fe0ac434c95a4 ****/
		%feature("compactdefaultargs") GetLogbook;
		%feature("autodoc", "Returns the logbook - keeper of modifications.

Returns
-------
opencascade::handle<TFunction_Logbook>
") GetLogbook;
		opencascade::handle<TFunction_Logbook> GetLogbook();

		/****************** GetNext ******************/
		/**** md5 signature: c4b14e72dbd7f482bd7cee741c39adf3 ****/
		%feature("compactdefaultargs") GetNext;
		%feature("autodoc", "Returns a list of next functions.

Parameters
----------
prev: TDF_LabelList

Returns
-------
None
") GetNext;
		void GetNext(TDF_LabelList & prev);

		/****************** GetPrevious ******************/
		/**** md5 signature: c0fa38784a0524350c9ab9cd20330f37 ****/
		%feature("compactdefaultargs") GetPrevious;
		%feature("autodoc", "Returns a list of previous functions.

Parameters
----------
prev: TDF_LabelList

Returns
-------
None
") GetPrevious;
		void GetPrevious(TDF_LabelList & prev);

		/****************** GetStatus ******************/
		/**** md5 signature: d22ac7893e97d480932227129700806c ****/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Returns the execution status of the function.

Returns
-------
TFunction_ExecutionStatus
") GetStatus;
		TFunction_ExecutionStatus GetStatus();

		/****************** Init ******************/
		/**** md5 signature: 04d8cbbfa106ea91a8e8ec8518b2d168 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the interface by the label of function.

Parameters
----------
L: TDF_Label

Returns
-------
None
") Init;
		void Init(const TDF_Label & L);

		/****************** Label ******************/
		/**** md5 signature: eb9fb194262b05b6572e359c88345eec ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a label of the function.

Returns
-------
TDF_Label
") Label;
		const TDF_Label & Label();

		/****************** NewFunction ******************/
		/**** md5 signature: 4a3d2cc128414a9727a2214b0198518d ****/
		%feature("compactdefaultargs") NewFunction;
		%feature("autodoc", "Sets a new function attached to a label <l> with <id>. it creates a new tfunction_function attribute initialized by the <id>, a new tfunction_graphnode with an empty list of dependencies and the status equal to tfunction_es_wrongdefinition. it registers the function in the scope of functions for this document.

Parameters
----------
L: TDF_Label
ID: Standard_GUID

Returns
-------
bool
") NewFunction;
		static Standard_Boolean NewFunction(const TDF_Label & L, const Standard_GUID & ID);

		/****************** Results ******************/
		/**** md5 signature: f6b4be89e631b6b8d2780fb882fb2a15 ****/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "The method fills-in the list by labels, where the results of the function are located.

Parameters
----------
res: TDF_LabelList

Returns
-------
None
") Results;
		void Results(TDF_LabelList & res);

		/****************** SetStatus ******************/
		/**** md5 signature: 6b13bf361b6b05641737bfa869b959e5 ****/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Defines an execution status for a function.

Parameters
----------
status: TFunction_ExecutionStatus

Returns
-------
None
") SetStatus;
		void SetStatus(const TFunction_ExecutionStatus status);

		/****************** UpdateDependencies ******************/
		/**** md5 signature: d7e6b01ec20ceb9895fad8f3582979f9 ****/
		%feature("compactdefaultargs") UpdateDependencies;
		%feature("autodoc", "Updates dependencies for all functions of the scope. it returns false in case of an error. an empty constructor.

Parameters
----------
Access: TDF_Label

Returns
-------
bool
") UpdateDependencies;
		static Standard_Boolean UpdateDependencies(const TDF_Label & Access);

		/****************** UpdateDependencies ******************/
		/**** md5 signature: fce181c709b9f09a0e899fd8020a65c7 ****/
		%feature("compactdefaultargs") UpdateDependencies;
		%feature("autodoc", "Updates the dependencies of this function only.

Returns
-------
bool
") UpdateDependencies;
		Standard_Boolean UpdateDependencies();

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
		/****************** TFunction_Iterator ******************/
		/**** md5 signature: 69237d8a90b10d6fa7daaabc8a87aa4e ****/
		%feature("compactdefaultargs") TFunction_Iterator;
		%feature("autodoc", "An empty constructor.

Returns
-------
None
") TFunction_Iterator;
		 TFunction_Iterator();

		/****************** TFunction_Iterator ******************/
		/**** md5 signature: 5f2fe40104172dec3efd03730ffcbb47 ****/
		%feature("compactdefaultargs") TFunction_Iterator;
		%feature("autodoc", "A constructor. initializes the iterator.

Parameters
----------
Access: TDF_Label

Returns
-------
None
") TFunction_Iterator;
		 TFunction_Iterator(const TDF_Label & Access);

		/****************** Current ******************/
		/**** md5 signature: b881dd90596d55e68898d23d0c7ddfe0 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Returns the current list of functions. if the iterator uses the execution status, the returned list contains only the functions with 'not executed' status.

Returns
-------
TDF_LabelList
") Current;
		virtual const TDF_LabelList & Current();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetMaxNbThreads ******************/
		/**** md5 signature: f69c96860a70a701f350c27debbc0ecf ****/
		%feature("compactdefaultargs") GetMaxNbThreads;
		%feature("autodoc", "Analyses the graph of dependencies and returns maximum number of threads may be used to calculate the model.

Returns
-------
int
") GetMaxNbThreads;
		virtual Standard_Integer GetMaxNbThreads();

		/****************** GetStatus ******************/
		/**** md5 signature: 17944549fb14f65fbdca6984a11026a6 ****/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "A help-function aimed to help the user to check the status of retrurned function. it calls tfunction_graphnode::getstatus() inside.

Parameters
----------
func: TDF_Label

Returns
-------
TFunction_ExecutionStatus
") GetStatus;
		TFunction_ExecutionStatus GetStatus(const TDF_Label & func);

		/****************** GetUsageOfExecutionStatus ******************/
		/**** md5 signature: 745de2f63107d82ffde6cff47fc0d45b ****/
		%feature("compactdefaultargs") GetUsageOfExecutionStatus;
		%feature("autodoc", "Returns usage of execution status by the iterator.

Returns
-------
bool
") GetUsageOfExecutionStatus;
		Standard_Boolean GetUsageOfExecutionStatus();

		/****************** Init ******************/
		/**** md5 signature: 345b41bbe6fa1deeffdcc8b21e78dde7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the iterator.

Parameters
----------
Access: TDF_Label

Returns
-------
None
") Init;
		virtual void Init(const TDF_Label & Access);

		/****************** More ******************/
		/**** md5 signature: 4bb6f1f5e9d1b93bf6d038f6bdd34088 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns false if the graph of functions is fully iterated.

Returns
-------
bool
") More;
		virtual Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: 73141d627b33e5b89ace1d498cedfc52 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Switches the iterator to the next list of current functions.

Returns
-------
None
") Next;
		virtual void Next();

		/****************** SetStatus ******************/
		/**** md5 signature: fc0439d96141332bb14647a9247c17bb ****/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "A help-function aimed to help the user to change the execution status of a function. it calls tfunction_graphnode::setstatus() inside.

Parameters
----------
func: TDF_Label
status: TFunction_ExecutionStatus

Returns
-------
None
") SetStatus;
		void SetStatus(const TDF_Label & func, const TFunction_ExecutionStatus status);

		/****************** SetUsageOfExecutionStatus ******************/
		/**** md5 signature: 1ccd07e65af420d2e0064c145d930ff5 ****/
		%feature("compactdefaultargs") SetUsageOfExecutionStatus;
		%feature("autodoc", "Defines the mode of iteration - usage or not of the execution status. if the iterator takes into account the execution status, the method ::current() returns only 'not executed' functions while their status is not changed. if the iterator ignores the execution status, the method ::current() returns the functions following their dependencies and ignoring the execution status.

Parameters
----------
usage: bool

Returns
-------
None
") SetUsageOfExecutionStatus;
		void SetUsageOfExecutionStatus(const Standard_Boolean usage);

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
		/****************** TFunction_Logbook ******************/
		/**** md5 signature: 7f6e366f5622e0cb7923ed223f2950b3 ****/
		%feature("compactdefaultargs") TFunction_Logbook;
		%feature("autodoc", "Constructor (empty).

Returns
-------
None
") TFunction_Logbook;
		 TFunction_Logbook();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears this logbook to its default, empty state.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Done ******************/
		/**** md5 signature: c5a6cedd71cacbb094b0e21e84839b80 ****/
		%feature("compactdefaultargs") Done;
		%feature("autodoc", "Sets status of execution.

Parameters
----------
status: bool

Returns
-------
None
") Done;
		void Done(const Standard_Boolean status);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the guid for logbook attribute.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetImpacted ******************/
		/**** md5 signature: 576a1cfb4d06b1f257db388ff1c0e2ed ****/
		%feature("compactdefaultargs") GetImpacted;
		%feature("autodoc", "Returns the map of impacted labels contained in this logbook.

Returns
-------
TDF_LabelMap
") GetImpacted;
		const TDF_LabelMap & GetImpacted();

		/****************** GetTouched ******************/
		/**** md5 signature: 53c5bf228c255d7a060952628ae1a46c ****/
		%feature("compactdefaultargs") GetTouched;
		%feature("autodoc", "Returns the map of touched labels in this logbook. a touched label is the one modified by the end user.

Returns
-------
TDF_LabelMap
") GetTouched;
		const TDF_LabelMap & GetTouched();

		/****************** GetValid ******************/
		/**** md5 signature: c371157b895ee66ea6eea74aede1c22d ****/
		%feature("compactdefaultargs") GetValid;
		%feature("autodoc", "Returns the map of valid labels in this logbook.

Returns
-------
TDF_LabelMap
") GetValid;
		const TDF_LabelMap & GetValid();

		/****************** GetValid ******************/
		/**** md5 signature: 6b7cdd40d3f35242487d2c50906e4ad3 ****/
		%feature("compactdefaultargs") GetValid;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ls: TDF_LabelMap

Returns
-------
None
") GetValid;
		void GetValid(TDF_LabelMap & Ls);

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns status of execution.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsModified ******************/
		/**** md5 signature: dde8156280d736d3666aed8619938e79 ****/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Returns true if the label l is touched or impacted. this method is called by <tfunction_functiondriver::mustexecute>. if <withchildren> is set to true, the method checks all the sublabels of <l> too.

Parameters
----------
L: TDF_Label
WithChildren: bool,optional
	default value is Standard_False

Returns
-------
bool
") IsModified;
		Standard_Boolean IsModified(const TDF_Label & L, const Standard_Boolean WithChildren = Standard_False);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns a new empty instance of the attribute.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 05e5f8f16a08ca8388ac65d3be603584 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "Pastes the attribute to another label.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		/**** md5 signature: 317305acc3f3ea9c2fd983a7ed00e566 ****/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Undos (and redos) the attribute.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		/**** md5 signature: da8c497eb15c2b0854ab324832db3bdd ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a tfunction_logbook attribute at the root label accessed by <access>. returns the attribute.

Parameters
----------
Access: TDF_Label

Returns
-------
opencascade::handle<TFunction_Logbook>
") Set;
		static opencascade::handle<TFunction_Logbook> Set(const TDF_Label & Access);

		/****************** SetImpacted ******************/
		/**** md5 signature: 3582237b711c5897b84ba82741b6ee29 ****/
		%feature("compactdefaultargs") SetImpacted;
		%feature("autodoc", "Sets the label l as an impacted label in this logbook. this method is called by execution of the function driver.

Parameters
----------
L: TDF_Label
WithChildren: bool,optional
	default value is Standard_False

Returns
-------
None
") SetImpacted;
		void SetImpacted(const TDF_Label & L, const Standard_Boolean WithChildren = Standard_False);

		/****************** SetTouched ******************/
		/**** md5 signature: ceda765442b14a3d1f9b806250dac6f0 ****/
		%feature("compactdefaultargs") SetTouched;
		%feature("autodoc", "Sets the label l as a touched label in this logbook. in other words, l is understood to have been modified by the end user.

Parameters
----------
L: TDF_Label

Returns
-------
None
") SetTouched;
		void SetTouched(const TDF_Label & L);

		/****************** SetValid ******************/
		/**** md5 signature: b1d61fdb8a3a99162f18a38a51e5b463 ****/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "Sets the label l as a valid label in this logbook.

Parameters
----------
L: TDF_Label
WithChildren: bool,optional
	default value is Standard_False

Returns
-------
None
") SetValid;
		void SetValid(const TDF_Label & L, const Standard_Boolean WithChildren = Standard_False);

		/****************** SetValid ******************/
		/**** md5 signature: c9a582502dc92dc4c7869630fd34c08c ****/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ls: TDF_LabelMap

Returns
-------
None
") SetValid;
		void SetValid(const TDF_LabelMap & Ls);

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
		/****************** TFunction_Scope ******************/
		/**** md5 signature: 2a3d20c34a691f5bce9328340cecc4d6 ****/
		%feature("compactdefaultargs") TFunction_Scope;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TFunction_Scope;
		 TFunction_Scope();

		/****************** AddFunction ******************/
		/**** md5 signature: 37b220f272e7943ba34d29bf3b163d59 ****/
		%feature("compactdefaultargs") AddFunction;
		%feature("autodoc", "Adds a function to the scope of functions.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") AddFunction;
		Standard_Boolean AddFunction(const TDF_Label & L);

		/****************** ChangeFunctions ******************/
		/**** md5 signature: ef1f7dd06977445ecb5382170702b5c3 ****/
		%feature("compactdefaultargs") ChangeFunctions;
		%feature("autodoc", "Returns the scope of functions for modification. warning: don't use this method if you are not sure what you do!.

Returns
-------
TFunction_DoubleMapOfIntegerLabel
") ChangeFunctions;
		TFunction_DoubleMapOfIntegerLabel & ChangeFunctions();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetFreeID ******************/
		/**** md5 signature: 34e64d8664d6cf8b1d7cb4b452f9928a ****/
		%feature("compactdefaultargs") GetFreeID;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetFreeID;
		Standard_Integer GetFreeID();

		/****************** GetFunction ******************/
		/**** md5 signature: ab240b61c30829fda3ef82df9f0ff977 ****/
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "Returns an id of the function.

Parameters
----------
L: TDF_Label

Returns
-------
int
") GetFunction;
		Standard_Integer GetFunction(const TDF_Label & L);

		/****************** GetFunction ******************/
		/**** md5 signature: 8e5945ee76dad41e8663060b9d376836 ****/
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "Returns the label of the function with this id.

Parameters
----------
ID: int

Returns
-------
TDF_Label
") GetFunction;
		const TDF_Label & GetFunction(const Standard_Integer ID);

		/****************** GetFunctions ******************/
		/**** md5 signature: 5ccfa051f05b966233870286f13ddb26 ****/
		%feature("compactdefaultargs") GetFunctions;
		%feature("autodoc", "Returns the scope of functions.

Returns
-------
TFunction_DoubleMapOfIntegerLabel
") GetFunctions;
		const TFunction_DoubleMapOfIntegerLabel & GetFunctions();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the guid for scope attribute. instant methods =============== constructor (empty).

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetLogbook ******************/
		/**** md5 signature: 413c9b5e90f1e3a8ba4fe0ac434c95a4 ****/
		%feature("compactdefaultargs") GetLogbook;
		%feature("autodoc", "Returns the logbook used in tfunction_driver methods. implementation of attribute methods ===================================.

Returns
-------
opencascade::handle<TFunction_Logbook>
") GetLogbook;
		opencascade::handle<TFunction_Logbook> GetLogbook();

		/****************** HasFunction ******************/
		/**** md5 signature: f94fb1a6238a09ba5d0395d1843e9269 ****/
		%feature("compactdefaultargs") HasFunction;
		%feature("autodoc", "Returns true if the function exists with such an id.

Parameters
----------
ID: int

Returns
-------
bool
") HasFunction;
		Standard_Boolean HasFunction(const Standard_Integer ID);

		/****************** HasFunction ******************/
		/**** md5 signature: 5680fbeb4adab29afcbd0451803740ce ****/
		%feature("compactdefaultargs") HasFunction;
		%feature("autodoc", "Returns true if the label contains a function of this scope.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") HasFunction;
		Standard_Boolean HasFunction(const TDF_Label & L);

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 05e5f8f16a08ca8388ac65d3be603584 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveAllFunctions ******************/
		/**** md5 signature: 5ae16be68a364bbe960c9844c0b04f14 ****/
		%feature("compactdefaultargs") RemoveAllFunctions;
		%feature("autodoc", "Removes all functions from the scope of functions.

Returns
-------
None
") RemoveAllFunctions;
		void RemoveAllFunctions();

		/****************** RemoveFunction ******************/
		/**** md5 signature: ca9467e990e495e45a89e96b8951f5fc ****/
		%feature("compactdefaultargs") RemoveFunction;
		%feature("autodoc", "Removes a function from the scope of functions.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") RemoveFunction;
		Standard_Boolean RemoveFunction(const TDF_Label & L);

		/****************** RemoveFunction ******************/
		/**** md5 signature: ba9a32cc375c7861589a52671876fd4a ****/
		%feature("compactdefaultargs") RemoveFunction;
		%feature("autodoc", "Removes a function from the scope of functions.

Parameters
----------
ID: int

Returns
-------
bool
") RemoveFunction;
		Standard_Boolean RemoveFunction(const Standard_Integer ID);

		/****************** Restore ******************/
		/**** md5 signature: 317305acc3f3ea9c2fd983a7ed00e566 ****/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
with: TDF_Attribute

Returns
-------
None
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		/**** md5 signature: a322379ca65220ce15bff86f94c55132 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Static methods ============== finds or creates a tfunction_scope attribute at the root label accessed by <access>. returns the attribute.

Parameters
----------
Access: TDF_Label

Returns
-------
opencascade::handle<TFunction_Scope>
") Set;
		static opencascade::handle<TFunction_Scope> Set(const TDF_Label & Access);

		/****************** SetFreeID ******************/
		/**** md5 signature: 6e979e75ad977ad04fe0333367a5e5b4 ****/
		%feature("compactdefaultargs") SetFreeID;
		%feature("autodoc", "No available documentation.

Parameters
----------
ID: int

Returns
-------
None
") SetFreeID;
		void SetFreeID(const Standard_Integer ID);

};


%make_alias(TFunction_Scope)

%extend TFunction_Scope {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class TFunction_HArray1OfDataMapOfGUIDDriver : public TFunction_Array1OfDataMapOfGUIDDriver, public Standard_Transient {
  public:
    TFunction_HArray1OfDataMapOfGUIDDriver(const Standard_Integer theLower, const Standard_Integer theUpper);
    TFunction_HArray1OfDataMapOfGUIDDriver(const Standard_Integer theLower, const Standard_Integer theUpper, const TFunction_Array1OfDataMapOfGUIDDriver::value_type& theValue);
    TFunction_HArray1OfDataMapOfGUIDDriver(const TFunction_Array1OfDataMapOfGUIDDriver& theOther);
    const TFunction_Array1OfDataMapOfGUIDDriver& Array1();
    TFunction_Array1OfDataMapOfGUIDDriver& ChangeArray1();
};
%make_alias(TFunction_HArray1OfDataMapOfGUIDDriver)

/* harray2 classes */
/* hsequence classes */
