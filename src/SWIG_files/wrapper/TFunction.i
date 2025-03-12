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
%define TFUNCTIONDOCSTRING
"TFunction module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_tfunction.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
%template(TFunction_DataMapOfGUIDDriver) NCollection_DataMap<Standard_GUID,opencascade::handle<TFunction_Driver>>;
%template(TFunction_DataMapOfLabelListOfLabel) NCollection_DataMap<TDF_Label,TDF_LabelList>;
%template(TFunction_DoubleMapOfIntegerLabel) NCollection_DoubleMap<Standard_Integer,TDF_Label>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<TFunction_DataMapOfGUIDDriver> TFunction_Array1OfDataMapOfGUIDDriver;
typedef NCollection_DataMap<Standard_GUID, opencascade::handle<TFunction_Driver>>::Iterator TFunction_DataMapIteratorOfDataMapOfGUIDDriver;
typedef NCollection_DataMap<TDF_Label, TDF_LabelList>::Iterator TFunction_DataMapIteratorOfDataMapOfLabelListOfLabel;
typedef NCollection_DataMap<Standard_GUID, opencascade::handle<TFunction_Driver>> TFunction_DataMapOfGUIDDriver;
typedef NCollection_DataMap<TDF_Label, TDF_LabelList> TFunction_DataMapOfLabelListOfLabel;
typedef NCollection_DoubleMap<Standard_Integer, TDF_Label>::Iterator TFunction_DoubleMapIteratorOfDoubleMapOfIntegerLabel;
typedef NCollection_DoubleMap<Standard_Integer, TDF_Label> TFunction_DoubleMapOfIntegerLabel;
/* end typedefs declaration */

/*************************
* class TFunction_Driver *
*************************/
%nodefaultctor TFunction_Driver;
class TFunction_Driver : public Standard_Transient {
	public:
		/****** TFunction_Driver::Arguments ******/
		/****** md5 signature: 4bba17ca81de91c4df690b3c81768a5b ******/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "
Parameters
----------
args: TDF_LabelList

Return
-------
None

Description
-----------
The method fills-in the list by labels, where the arguments of the function are located.
") Arguments;
		virtual void Arguments(TDF_LabelList & args);

		/****** TFunction_Driver::Execute ******/
		/****** md5 signature: 8f1f158cb1e50b9ad9cbeb810402dbb9 ******/
		%feature("compactdefaultargs") Execute;
		%feature("autodoc", "
Parameters
----------
log: TFunction_Logbook

Return
-------
int

Description
-----------
Executes the function in this function driver and puts the impacted labels in the logbook log. arguments & results of functions ================================.
") Execute;
		virtual Standard_Integer Execute(opencascade::handle<TFunction_Logbook> & log);

		/****** TFunction_Driver::Init ******/
		/****** md5 signature: 04d8cbbfa106ea91a8e8ec8518b2d168 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
Initializes the label L for this function prior to its execution.
") Init;
		void Init(const TDF_Label & L);

		/****** TFunction_Driver::Label ******/
		/****** md5 signature: 45446fb6d4e5a656e74b10a5eb4cd845 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the label of the driver for this function.
") Label;
		TDF_Label Label();

		/****** TFunction_Driver::MustExecute ******/
		/****** md5 signature: ed847147c57bdc6a486bd9096417dbbd ******/
		%feature("compactdefaultargs") MustExecute;
		%feature("autodoc", "
Parameters
----------
log: TFunction_Logbook

Return
-------
bool

Description
-----------
Analyzes the labels in the logbook log. Returns true if attributes have been modified. If the function label itself has been modified, the function must be executed.
") MustExecute;
		virtual Standard_Boolean MustExecute(const opencascade::handle<TFunction_Logbook> & log);

		/****** TFunction_Driver::Results ******/
		/****** md5 signature: 1def5504257d3183313d6e32adc3f82c ******/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "
Parameters
----------
res: TDF_LabelList

Return
-------
None

Description
-----------
The method fills-in the list by labels, where the results of the function are located.
") Results;
		virtual void Results(TDF_LabelList & res);

		/****** TFunction_Driver::Validate ******/
		/****** md5 signature: 69c28722fabc21dce096f9430b8d8dd2 ******/
		%feature("compactdefaultargs") Validate;
		%feature("autodoc", "
Parameters
----------
log: TFunction_Logbook

Return
-------
None

Description
-----------
Validates labels of a function in <log>. This function is the one initialized in this function driver. Warning In regeneration mode, the solver must call this method even if the function is not executed. execution of function =====================.
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
		/****** TFunction_DriverTable::TFunction_DriverTable ******/
		/****** md5 signature: 1e2dc65f0349a608d8b1892add60c315 ******/
		%feature("compactdefaultargs") TFunction_DriverTable;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") TFunction_DriverTable;
		 TFunction_DriverTable();

		/****** TFunction_DriverTable::AddDriver ******/
		/****** md5 signature: 990c0ed5bd237c30c73356fef2a2a75e ******/
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID
driver: TFunction_Driver
thread: int (optional, default to 0)

Return
-------
bool

Description
-----------
Returns true if the driver has been added successfully to the driver table.
") AddDriver;
		Standard_Boolean AddDriver(const Standard_GUID & guid, const opencascade::handle<TFunction_Driver> & driver, const Standard_Integer thread = 0);

		/****** TFunction_DriverTable::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all drivers. Returns true if the driver has been removed successfully.
") Clear;
		void Clear();

		/****** TFunction_DriverTable::Dump ******/
		/****** md5 signature: cfe815398c9c4191063c65e53f786693 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TFunction_DriverTable::FindDriver ******/
		/****** md5 signature: 40071a232ea53c66f7cc98d78279429a ******/
		%feature("compactdefaultargs") FindDriver;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID
driver: TFunction_Driver
thread: int (optional, default to 0)

Return
-------
bool

Description
-----------
Returns true if the driver was found.
") FindDriver;
		Standard_Boolean FindDriver(const Standard_GUID & guid, opencascade::handle<TFunction_Driver> & driver, const Standard_Integer thread = 0);

		/****** TFunction_DriverTable::Get ******/
		/****** md5 signature: 99832888c5ad61808b6c3a1d6f9f47ab ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
opencascade::handle<TFunction_DriverTable>

Description
-----------
Returns the driver table. If a driver does not exist, creates it.
") Get;
		static opencascade::handle<TFunction_DriverTable> Get();

		/****** TFunction_DriverTable::HasDriver ******/
		/****** md5 signature: a13dcf522146bf63d5f903a907eb9bec ******/
		%feature("compactdefaultargs") HasDriver;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID
thread: int (optional, default to 0)

Return
-------
bool

Description
-----------
Returns true if the driver exists in the driver table.
") HasDriver;
		Standard_Boolean HasDriver(const Standard_GUID & guid, const Standard_Integer thread = 0);

		/****** TFunction_DriverTable::RemoveDriver ******/
		/****** md5 signature: 0487b3b5549030bd89cc5ba37eb1e15d ******/
		%feature("compactdefaultargs") RemoveDriver;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID
thread: int (optional, default to 0)

Return
-------
bool

Description
-----------
Removes a driver with the given GUID. Returns true if the driver has been removed successfully.
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
		/****** TFunction_Function::TFunction_Function ******/
		/****** md5 signature: b9c7048d524663afffe8366d1791feb5 ******/
		%feature("compactdefaultargs") TFunction_Function;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TFunction_Function;
		 TFunction_Function();

		/****** TFunction_Function::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		virtual Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TFunction_Function::Failed ******/
		/****** md5 signature: c3da447468b921d93e6422cc08e3d1e7 ******/
		%feature("compactdefaultargs") Failed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the execution failed.
") Failed;
		Standard_Boolean Failed();

		/****** TFunction_Function::GetDriverGUID ******/
		/****** md5 signature: 0e0689f6b2e27ee70a70496d12a69015 ******/
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the GUID for this function's driver.
") GetDriverGUID;
		const Standard_GUID & GetDriverGUID();

		/****** TFunction_Function::GetFailure ******/
		/****** md5 signature: ab0d027da81cfa3770c0c0a8ed26e021 ******/
		%feature("compactdefaultargs") GetFailure;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns an index of failure if the execution of this function failed. If this integer value is 0, no failure has occurred. Implementation of Attribute methods: ===================================.
") GetFailure;
		Standard_Integer GetFailure();

		/****** TFunction_Function::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the GUID for functions. Returns a function found on the label. Instance methods: ================.
") GetID;
		static const Standard_GUID & GetID();

		/****** TFunction_Function::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TFunction_Function::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TFunction_Function::Paste ******/
		/****** md5 signature: 05e5f8f16a08ca8388ac65d3be603584 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TFunction_Function::References ******/
		/****** md5 signature: 3f614360a69c957f8600d26b49bc71b2 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
No available documentation.
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TFunction_Function::Restore ******/
		/****** md5 signature: 317305acc3f3ea9c2fd983a7ed00e566 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** TFunction_Function::Set ******/
		/****** md5 signature: aca554bf54cbef266ab789ddb6086714 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<TFunction_Function>

Description
-----------
Static methods: ============== Finds or Creates a function attribute on the label <L>. Returns the function attribute.
") Set;
		static opencascade::handle<TFunction_Function> Set(const TDF_Label & L);

		/****** TFunction_Function::Set ******/
		/****** md5 signature: b0b73840ed28fd912c95afec06fd8ac6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
DriverID: Standard_GUID

Return
-------
opencascade::handle<TFunction_Function>

Description
-----------
Finds or Creates a function attribute on the label <L>. Sets a driver ID to the function. Returns the function attribute.
") Set;
		static opencascade::handle<TFunction_Function> Set(const TDF_Label & L, const Standard_GUID & DriverID);

		/****** TFunction_Function::SetDriverGUID ******/
		/****** md5 signature: 07186d86451e9b1ad5ad4848dd63f1dc ******/
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "
Parameters
----------
guid: Standard_GUID

Return
-------
None

Description
-----------
Sets the driver for this function as that identified by the GUID guid.
") SetDriverGUID;
		void SetDriverGUID(const Standard_GUID & guid);

		/****** TFunction_Function::SetFailure ******/
		/****** md5 signature: 7de1e35f0beb0ac9d20d5fb500b27540 ******/
		%feature("compactdefaultargs") SetFailure;
		%feature("autodoc", "
Parameters
----------
mode: int (optional, default to 0)

Return
-------
None

Description
-----------
Sets the failed index.
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
		/****** TFunction_GraphNode::TFunction_GraphNode ******/
		/****** md5 signature: 840026a0804abadd928349149b54de96 ******/
		%feature("compactdefaultargs") TFunction_GraphNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TFunction_GraphNode;
		 TFunction_GraphNode();

		/****** TFunction_GraphNode::AddNext ******/
		/****** md5 signature: 46f1368888ac2f27323ecb83c4e2780e ******/
		%feature("compactdefaultargs") AddNext;
		%feature("autodoc", "
Parameters
----------
funcID: int

Return
-------
bool

Description
-----------
Defines a reference to the function as a next one.
") AddNext;
		Standard_Boolean AddNext(const Standard_Integer funcID);

		/****** TFunction_GraphNode::AddNext ******/
		/****** md5 signature: 30d1fa6ecff42d69a4ecb4324e40b9bf ******/
		%feature("compactdefaultargs") AddNext;
		%feature("autodoc", "
Parameters
----------
func: TDF_Label

Return
-------
bool

Description
-----------
Defines a reference to the function as a next one.
") AddNext;
		Standard_Boolean AddNext(const TDF_Label & func);

		/****** TFunction_GraphNode::AddPrevious ******/
		/****** md5 signature: fcbc15f22d1d20f10c6e462339e8b99c ******/
		%feature("compactdefaultargs") AddPrevious;
		%feature("autodoc", "
Parameters
----------
funcID: int

Return
-------
bool

Description
-----------
Defines a reference to the function as a previous one.
") AddPrevious;
		Standard_Boolean AddPrevious(const Standard_Integer funcID);

		/****** TFunction_GraphNode::AddPrevious ******/
		/****** md5 signature: 817018c3f68fee1004e6f7635bbf057a ******/
		%feature("compactdefaultargs") AddPrevious;
		%feature("autodoc", "
Parameters
----------
func: TDF_Label

Return
-------
bool

Description
-----------
Defines a reference to the function as a previous one.
") AddPrevious;
		Standard_Boolean AddPrevious(const TDF_Label & func);

		/****** TFunction_GraphNode::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		virtual Standard_OStream & Dump(std::ostream &OutValue);

		/****** TFunction_GraphNode::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the GUID for GraphNode attribute. Instant methods =============== Constructor (empty).
") GetID;
		static const Standard_GUID & GetID();

		/****** TFunction_GraphNode::GetNext ******/
		/****** md5 signature: 2c92b7840c40f1d4060b8645cdd7203e ******/
		%feature("compactdefaultargs") GetNext;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Returns a map of next functions.
") GetNext;
		const TColStd_MapOfInteger & GetNext();

		/****** TFunction_GraphNode::GetPrevious ******/
		/****** md5 signature: 0c76468cefb57cc5ca0c158597c978c5 ******/
		%feature("compactdefaultargs") GetPrevious;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Returns a map of previous functions.
") GetPrevious;
		const TColStd_MapOfInteger & GetPrevious();

		/****** TFunction_GraphNode::GetStatus ******/
		/****** md5 signature: d22ac7893e97d480932227129700806c ******/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Return
-------
TFunction_ExecutionStatus

Description
-----------
Returns the execution status of the function.
") GetStatus;
		TFunction_ExecutionStatus GetStatus();

		/****** TFunction_GraphNode::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TFunction_GraphNode::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TFunction_GraphNode::Paste ******/
		/****** md5 signature: 05e5f8f16a08ca8388ac65d3be603584 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TFunction_GraphNode::References ******/
		/****** md5 signature: 3f614360a69c957f8600d26b49bc71b2 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
No available documentation.
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TFunction_GraphNode::RemoveAllNext ******/
		/****** md5 signature: 0cd87a83ea50ca309bc065a771225586 ******/
		%feature("compactdefaultargs") RemoveAllNext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears a map of next functions.
") RemoveAllNext;
		void RemoveAllNext();

		/****** TFunction_GraphNode::RemoveAllPrevious ******/
		/****** md5 signature: 6fa7fdc92df1cf59d5c5e281367883c4 ******/
		%feature("compactdefaultargs") RemoveAllPrevious;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears a map of previous functions.
") RemoveAllPrevious;
		void RemoveAllPrevious();

		/****** TFunction_GraphNode::RemoveNext ******/
		/****** md5 signature: d64243f774cea972663b505ad15afa03 ******/
		%feature("compactdefaultargs") RemoveNext;
		%feature("autodoc", "
Parameters
----------
funcID: int

Return
-------
bool

Description
-----------
Removes a reference to the function as a next one.
") RemoveNext;
		Standard_Boolean RemoveNext(const Standard_Integer funcID);

		/****** TFunction_GraphNode::RemoveNext ******/
		/****** md5 signature: 749269e72d7fc21a359cc7533a289ccc ******/
		%feature("compactdefaultargs") RemoveNext;
		%feature("autodoc", "
Parameters
----------
func: TDF_Label

Return
-------
bool

Description
-----------
Removes a reference to the function as a next one.
") RemoveNext;
		Standard_Boolean RemoveNext(const TDF_Label & func);

		/****** TFunction_GraphNode::RemovePrevious ******/
		/****** md5 signature: 334ea5a1f0fe47a269ff5d99a5ddbdbe ******/
		%feature("compactdefaultargs") RemovePrevious;
		%feature("autodoc", "
Parameters
----------
funcID: int

Return
-------
bool

Description
-----------
Removes a reference to the function as a previous one.
") RemovePrevious;
		Standard_Boolean RemovePrevious(const Standard_Integer funcID);

		/****** TFunction_GraphNode::RemovePrevious ******/
		/****** md5 signature: 690308575b8794f75585531b28bb8bd2 ******/
		%feature("compactdefaultargs") RemovePrevious;
		%feature("autodoc", "
Parameters
----------
func: TDF_Label

Return
-------
bool

Description
-----------
Removes a reference to the function as a previous one.
") RemovePrevious;
		Standard_Boolean RemovePrevious(const TDF_Label & func);

		/****** TFunction_GraphNode::Restore ******/
		/****** md5 signature: 317305acc3f3ea9c2fd983a7ed00e566 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** TFunction_GraphNode::Set ******/
		/****** md5 signature: 094ce1b4803fd44779764fb4b5bbc278 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<TFunction_GraphNode>

Description
-----------
Static methods ============== Finds or Creates a graph node attribute at the label <L>. Returns the attribute.
") Set;
		static opencascade::handle<TFunction_GraphNode> Set(const TDF_Label & L);

		/****** TFunction_GraphNode::SetStatus ******/
		/****** md5 signature: d65ad3bd62bda10bd543de7f03931f36 ******/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "
Parameters
----------
status: TFunction_ExecutionStatus

Return
-------
None

Description
-----------
Defines an execution status for a function. Implementation of Attribute methods ===================================.
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
		/****** TFunction_IFunction::TFunction_IFunction ******/
		/****** md5 signature: 8d63105f8a6ad4acb652c7c6ec381e72 ******/
		%feature("compactdefaultargs") TFunction_IFunction;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TFunction_IFunction;
		 TFunction_IFunction();

		/****** TFunction_IFunction::TFunction_IFunction ******/
		/****** md5 signature: 3096b6694485edb079cd64a06ab874e6 ******/
		%feature("compactdefaultargs") TFunction_IFunction;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
A constructor. Initializes the interface by the label of function.
") TFunction_IFunction;
		 TFunction_IFunction(const TDF_Label & L);

		/****** TFunction_IFunction::Arguments ******/
		/****** md5 signature: 36ff9641bb166dfb0eeac7454f7615db ******/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "
Parameters
----------
args: TDF_LabelList

Return
-------
None

Description
-----------
The method fills-in the list by labels, where the arguments of the function are located.
") Arguments;
		void Arguments(TDF_LabelList & args);

		/****** TFunction_IFunction::DeleteFunction ******/
		/****** md5 signature: a370b1b834afd69c6f938d6aa2863f44 ******/
		%feature("compactdefaultargs") DeleteFunction;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Deletes a function attached to a label <L>. It deletes a TFunction_Function attribute and a TFunction_GraphNode. It deletes the functions from the scope of function of this document.
") DeleteFunction;
		static Standard_Boolean DeleteFunction(const TDF_Label & L);

		/****** TFunction_IFunction::GetAllFunctions ******/
		/****** md5 signature: c18f441033a9c6525f76df221447f7f3 ******/
		%feature("compactdefaultargs") GetAllFunctions;
		%feature("autodoc", "Return
-------
TFunction_DoubleMapOfIntegerLabel

Description
-----------
Returns the scope of all functions.
") GetAllFunctions;
		const TFunction_DoubleMapOfIntegerLabel & GetAllFunctions();

		/****** TFunction_IFunction::GetDriver ******/
		/****** md5 signature: ec861a28b99b970cedc10dcc1154472c ******/
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "
Parameters
----------
thread: int (optional, default to 0)

Return
-------
opencascade::handle<TFunction_Driver>

Description
-----------
Returns a driver of the function.
") GetDriver;
		opencascade::handle<TFunction_Driver> GetDriver(const Standard_Integer thread = 0);

		/****** TFunction_IFunction::GetGraphNode ******/
		/****** md5 signature: ce954ac825727c0f4041e07053e3755c ******/
		%feature("compactdefaultargs") GetGraphNode;
		%feature("autodoc", "Return
-------
opencascade::handle<TFunction_GraphNode>

Description
-----------
Returns a graph node of the function.
") GetGraphNode;
		opencascade::handle<TFunction_GraphNode> GetGraphNode();

		/****** TFunction_IFunction::GetLogbook ******/
		/****** md5 signature: 413c9b5e90f1e3a8ba4fe0ac434c95a4 ******/
		%feature("compactdefaultargs") GetLogbook;
		%feature("autodoc", "Return
-------
opencascade::handle<TFunction_Logbook>

Description
-----------
Returns the Logbook - keeper of modifications.
") GetLogbook;
		opencascade::handle<TFunction_Logbook> GetLogbook();

		/****** TFunction_IFunction::GetNext ******/
		/****** md5 signature: c4b14e72dbd7f482bd7cee741c39adf3 ******/
		%feature("compactdefaultargs") GetNext;
		%feature("autodoc", "
Parameters
----------
prev: TDF_LabelList

Return
-------
None

Description
-----------
Returns a list of next functions.
") GetNext;
		void GetNext(TDF_LabelList & prev);

		/****** TFunction_IFunction::GetPrevious ******/
		/****** md5 signature: c0fa38784a0524350c9ab9cd20330f37 ******/
		%feature("compactdefaultargs") GetPrevious;
		%feature("autodoc", "
Parameters
----------
prev: TDF_LabelList

Return
-------
None

Description
-----------
Returns a list of previous functions.
") GetPrevious;
		void GetPrevious(TDF_LabelList & prev);

		/****** TFunction_IFunction::GetStatus ******/
		/****** md5 signature: d22ac7893e97d480932227129700806c ******/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Return
-------
TFunction_ExecutionStatus

Description
-----------
Returns the execution status of the function.
") GetStatus;
		TFunction_ExecutionStatus GetStatus();

		/****** TFunction_IFunction::Init ******/
		/****** md5 signature: 04d8cbbfa106ea91a8e8ec8518b2d168 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
Initializes the interface by the label of function.
") Init;
		void Init(const TDF_Label & L);

		/****** TFunction_IFunction::Label ******/
		/****** md5 signature: eb9fb194262b05b6572e359c88345eec ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns a label of the function.
") Label;
		const TDF_Label & Label();

		/****** TFunction_IFunction::NewFunction ******/
		/****** md5 signature: 4a3d2cc128414a9727a2214b0198518d ******/
		%feature("compactdefaultargs") NewFunction;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
ID: Standard_GUID

Return
-------
bool

Description
-----------
Sets a new function attached to a label <L> with <ID>. It creates a new TFunction_Function attribute initialized by the <ID>, a new TFunction_GraphNode with an empty list of dependencies and the status equal to TFunction_ES_WrongDefinition. It registers the function in the scope of functions for this document.
") NewFunction;
		static Standard_Boolean NewFunction(const TDF_Label & L, const Standard_GUID & ID);

		/****** TFunction_IFunction::Results ******/
		/****** md5 signature: f6b4be89e631b6b8d2780fb882fb2a15 ******/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "
Parameters
----------
res: TDF_LabelList

Return
-------
None

Description
-----------
The method fills-in the list by labels, where the results of the function are located.
") Results;
		void Results(TDF_LabelList & res);

		/****** TFunction_IFunction::SetStatus ******/
		/****** md5 signature: 6b13bf361b6b05641737bfa869b959e5 ******/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "
Parameters
----------
status: TFunction_ExecutionStatus

Return
-------
None

Description
-----------
Defines an execution status for a function.
") SetStatus;
		void SetStatus(const TFunction_ExecutionStatus status);

		/****** TFunction_IFunction::UpdateDependencies ******/
		/****** md5 signature: d7e6b01ec20ceb9895fad8f3582979f9 ******/
		%feature("compactdefaultargs") UpdateDependencies;
		%feature("autodoc", "
Parameters
----------
Access: TDF_Label

Return
-------
bool

Description
-----------
Updates dependencies for all functions of the scope. It returns false in case of an error. An empty constructor.
") UpdateDependencies;
		static Standard_Boolean UpdateDependencies(const TDF_Label & Access);

		/****** TFunction_IFunction::UpdateDependencies ******/
		/****** md5 signature: fce181c709b9f09a0e899fd8020a65c7 ******/
		%feature("compactdefaultargs") UpdateDependencies;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Updates the dependencies of this function only.
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
		/****** TFunction_Iterator::TFunction_Iterator ******/
		/****** md5 signature: 69237d8a90b10d6fa7daaabc8a87aa4e ******/
		%feature("compactdefaultargs") TFunction_Iterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
An empty constructor.
") TFunction_Iterator;
		 TFunction_Iterator();

		/****** TFunction_Iterator::TFunction_Iterator ******/
		/****** md5 signature: 5f2fe40104172dec3efd03730ffcbb47 ******/
		%feature("compactdefaultargs") TFunction_Iterator;
		%feature("autodoc", "
Parameters
----------
Access: TDF_Label

Return
-------
None

Description
-----------
A constructor. Initializes the iterator.
") TFunction_Iterator;
		 TFunction_Iterator(const TDF_Label & Access);

		/****** TFunction_Iterator::Current ******/
		/****** md5 signature: b881dd90596d55e68898d23d0c7ddfe0 ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
TDF_LabelList

Description
-----------
Returns the current list of functions. If the iterator uses the execution status, the returned list contains only the functions with 'not executed' status.
") Current;
		virtual const TDF_LabelList & Current();

		/****** TFunction_Iterator::Dump ******/
		/****** md5 signature: ee51cac270c7787d1809a1cb8cf01d91 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TFunction_Iterator::GetMaxNbThreads ******/
		/****** md5 signature: f69c96860a70a701f350c27debbc0ecf ******/
		%feature("compactdefaultargs") GetMaxNbThreads;
		%feature("autodoc", "Return
-------
int

Description
-----------
Analyses the graph of dependencies and returns maximum number of threads may be used to calculate the model.
") GetMaxNbThreads;
		virtual Standard_Integer GetMaxNbThreads();

		/****** TFunction_Iterator::GetStatus ******/
		/****** md5 signature: 17944549fb14f65fbdca6984a11026a6 ******/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "
Parameters
----------
func: TDF_Label

Return
-------
TFunction_ExecutionStatus

Description
-----------
A help-function aimed to help the user to check the status of retrurned function. It calls TFunction_GraphNode::GetStatus() inside.
") GetStatus;
		TFunction_ExecutionStatus GetStatus(const TDF_Label & func);

		/****** TFunction_Iterator::GetUsageOfExecutionStatus ******/
		/****** md5 signature: 745de2f63107d82ffde6cff47fc0d45b ******/
		%feature("compactdefaultargs") GetUsageOfExecutionStatus;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns usage of execution status by the iterator.
") GetUsageOfExecutionStatus;
		Standard_Boolean GetUsageOfExecutionStatus();

		/****** TFunction_Iterator::Init ******/
		/****** md5 signature: 345b41bbe6fa1deeffdcc8b21e78dde7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Access: TDF_Label

Return
-------
None

Description
-----------
Initializes the Iterator.
") Init;
		virtual void Init(const TDF_Label & Access);

		/****** TFunction_Iterator::More ******/
		/****** md5 signature: 4bb6f1f5e9d1b93bf6d038f6bdd34088 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false if the graph of functions is fully iterated.
") More;
		virtual Standard_Boolean More();

		/****** TFunction_Iterator::Next ******/
		/****** md5 signature: 73141d627b33e5b89ace1d498cedfc52 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Switches the iterator to the next list of current functions.
") Next;
		virtual void Next();

		/****** TFunction_Iterator::SetStatus ******/
		/****** md5 signature: fc0439d96141332bb14647a9247c17bb ******/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "
Parameters
----------
func: TDF_Label
status: TFunction_ExecutionStatus

Return
-------
None

Description
-----------
A help-function aimed to help the user to change the execution status of a function. It calls TFunction_GraphNode::SetStatus() inside.
") SetStatus;
		void SetStatus(const TDF_Label & func, const TFunction_ExecutionStatus status);

		/****** TFunction_Iterator::SetUsageOfExecutionStatus ******/
		/****** md5 signature: 1ccd07e65af420d2e0064c145d930ff5 ******/
		%feature("compactdefaultargs") SetUsageOfExecutionStatus;
		%feature("autodoc", "
Parameters
----------
usage: bool

Return
-------
None

Description
-----------
Defines the mode of iteration - usage or not of the execution status. If the iterator takes into account the execution status, the method ::Current() returns only 'not executed' functions while their status is not changed. If the iterator ignores the execution status, the method ::Current() returns the functions following their dependencies and ignoring the execution status.
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
		/****** TFunction_Logbook::TFunction_Logbook ******/
		/****** md5 signature: 7f6e366f5622e0cb7923ed223f2950b3 ******/
		%feature("compactdefaultargs") TFunction_Logbook;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor (empty).
") TFunction_Logbook;
		 TFunction_Logbook();

		/****** TFunction_Logbook::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears this logbook to its default, empty state.
") Clear;
		void Clear();

		/****** TFunction_Logbook::Done ******/
		/****** md5 signature: c5a6cedd71cacbb094b0e21e84839b80 ******/
		%feature("compactdefaultargs") Done;
		%feature("autodoc", "
Parameters
----------
status: bool

Return
-------
None

Description
-----------
Sets status of execution.
") Done;
		void Done(const Standard_Boolean status);

		/****** TFunction_Logbook::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
Prints th data of the attributes (touched, impacted and valid labels).
") Dump;
		virtual Standard_OStream & Dump(std::ostream &OutValue);

		/****** TFunction_Logbook::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the GUID for logbook attribute.
") GetID;
		static const Standard_GUID & GetID();

		/****** TFunction_Logbook::GetImpacted ******/
		/****** md5 signature: 576a1cfb4d06b1f257db388ff1c0e2ed ******/
		%feature("compactdefaultargs") GetImpacted;
		%feature("autodoc", "Return
-------
TDF_LabelMap

Description
-----------
Returns the map of impacted labels contained in this logbook.
") GetImpacted;
		const TDF_LabelMap & GetImpacted();

		/****** TFunction_Logbook::GetTouched ******/
		/****** md5 signature: 53c5bf228c255d7a060952628ae1a46c ******/
		%feature("compactdefaultargs") GetTouched;
		%feature("autodoc", "Return
-------
TDF_LabelMap

Description
-----------
Returns the map of touched labels in this logbook. A touched label is the one modified by the end user.
") GetTouched;
		const TDF_LabelMap & GetTouched();

		/****** TFunction_Logbook::GetValid ******/
		/****** md5 signature: c371157b895ee66ea6eea74aede1c22d ******/
		%feature("compactdefaultargs") GetValid;
		%feature("autodoc", "Return
-------
TDF_LabelMap

Description
-----------
Returns the map of valid labels in this logbook.
") GetValid;
		const TDF_LabelMap & GetValid();

		/****** TFunction_Logbook::GetValid ******/
		/****** md5 signature: 6b7cdd40d3f35242487d2c50906e4ad3 ******/
		%feature("compactdefaultargs") GetValid;
		%feature("autodoc", "
Parameters
----------
Ls: TDF_LabelMap

Return
-------
None

Description
-----------
No available documentation.
") GetValid;
		void GetValid(TDF_LabelMap & Ls);

		/****** TFunction_Logbook::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID of the attribute.
") ID;
		const Standard_GUID & ID();

		/****** TFunction_Logbook::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns status of execution.
") IsDone;
		Standard_Boolean IsDone();

		/****** TFunction_Logbook::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TFunction_Logbook::IsModified ******/
		/****** md5 signature: dde8156280d736d3666aed8619938e79 ******/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
WithChildren: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Returns True if the label L is touched or impacted. This method is called by <TFunction_FunctionDriver::MustExecute>. If <WithChildren> is set to true, the method checks all the sublabels of <L> too.
") IsModified;
		Standard_Boolean IsModified(const TDF_Label & L, const Standard_Boolean WithChildren = Standard_False);

		/****** TFunction_Logbook::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns a new empty instance of the attribute.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TFunction_Logbook::Paste ******/
		/****** md5 signature: 05e5f8f16a08ca8388ac65d3be603584 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
Pastes the attribute to another label.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TFunction_Logbook::Restore ******/
		/****** md5 signature: 317305acc3f3ea9c2fd983a7ed00e566 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
Undos (and redos) the attribute.
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** TFunction_Logbook::Set ******/
		/****** md5 signature: da8c497eb15c2b0854ab324832db3bdd ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Access: TDF_Label

Return
-------
opencascade::handle<TFunction_Logbook>

Description
-----------
Finds or Creates a TFunction_Logbook attribute at the root label accessed by <Access>. Returns the attribute.
") Set;
		static opencascade::handle<TFunction_Logbook> Set(const TDF_Label & Access);

		/****** TFunction_Logbook::SetImpacted ******/
		/****** md5 signature: 3582237b711c5897b84ba82741b6ee29 ******/
		%feature("compactdefaultargs") SetImpacted;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
WithChildren: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets the label L as an impacted label in this logbook. This method is called by execution of the function driver.
") SetImpacted;
		void SetImpacted(const TDF_Label & L, const Standard_Boolean WithChildren = Standard_False);

		/****** TFunction_Logbook::SetTouched ******/
		/****** md5 signature: ceda765442b14a3d1f9b806250dac6f0 ******/
		%feature("compactdefaultargs") SetTouched;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
Sets the label L as a touched label in this logbook. In other words, L is understood to have been modified by the end user.
") SetTouched;
		void SetTouched(const TDF_Label & L);

		/****** TFunction_Logbook::SetValid ******/
		/****** md5 signature: b1d61fdb8a3a99162f18a38a51e5b463 ******/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
WithChildren: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets the label L as a valid label in this logbook.
") SetValid;
		void SetValid(const TDF_Label & L, const Standard_Boolean WithChildren = Standard_False);

		/****** TFunction_Logbook::SetValid ******/
		/****** md5 signature: c9a582502dc92dc4c7869630fd34c08c ******/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "
Parameters
----------
Ls: TDF_LabelMap

Return
-------
None

Description
-----------
No available documentation.
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
		/****** TFunction_Scope::TFunction_Scope ******/
		/****** md5 signature: 2a3d20c34a691f5bce9328340cecc4d6 ******/
		%feature("compactdefaultargs") TFunction_Scope;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TFunction_Scope;
		 TFunction_Scope();

		/****** TFunction_Scope::AddFunction ******/
		/****** md5 signature: 37b220f272e7943ba34d29bf3b163d59 ******/
		%feature("compactdefaultargs") AddFunction;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Adds a function to the scope of functions.
") AddFunction;
		Standard_Boolean AddFunction(const TDF_Label & L);

		/****** TFunction_Scope::ChangeFunctions ******/
		/****** md5 signature: ef1f7dd06977445ecb5382170702b5c3 ******/
		%feature("compactdefaultargs") ChangeFunctions;
		%feature("autodoc", "Return
-------
TFunction_DoubleMapOfIntegerLabel

Description
-----------
Returns the scope of functions for modification. Warning: Don't use this method if You are not sure what You do!.
") ChangeFunctions;
		TFunction_DoubleMapOfIntegerLabel & ChangeFunctions();

		/****** TFunction_Scope::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		virtual Standard_OStream & Dump(std::ostream &OutValue);

		/****** TFunction_Scope::GetFreeID ******/
		/****** md5 signature: 34e64d8664d6cf8b1d7cb4b452f9928a ******/
		%feature("compactdefaultargs") GetFreeID;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetFreeID;
		Standard_Integer GetFreeID();

		/****** TFunction_Scope::GetFunction ******/
		/****** md5 signature: ab240b61c30829fda3ef82df9f0ff977 ******/
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
int

Description
-----------
Returns an ID of the function.
") GetFunction;
		Standard_Integer GetFunction(const TDF_Label & L);

		/****** TFunction_Scope::GetFunction ******/
		/****** md5 signature: 8e5945ee76dad41e8663060b9d376836 ******/
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "
Parameters
----------
ID: int

Return
-------
TDF_Label

Description
-----------
Returns the label of the function with this ID.
") GetFunction;
		const TDF_Label & GetFunction(const Standard_Integer ID);

		/****** TFunction_Scope::GetFunctions ******/
		/****** md5 signature: 5ccfa051f05b966233870286f13ddb26 ******/
		%feature("compactdefaultargs") GetFunctions;
		%feature("autodoc", "Return
-------
TFunction_DoubleMapOfIntegerLabel

Description
-----------
Returns the scope of functions.
") GetFunctions;
		const TFunction_DoubleMapOfIntegerLabel & GetFunctions();

		/****** TFunction_Scope::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the GUID for Scope attribute. Instant methods =============== Constructor (empty).
") GetID;
		static const Standard_GUID & GetID();

		/****** TFunction_Scope::GetLogbook ******/
		/****** md5 signature: 413c9b5e90f1e3a8ba4fe0ac434c95a4 ******/
		%feature("compactdefaultargs") GetLogbook;
		%feature("autodoc", "Return
-------
opencascade::handle<TFunction_Logbook>

Description
-----------
Returns the Logbook used in TFunction_Driver methods. Implementation of Attribute methods ===================================.
") GetLogbook;
		opencascade::handle<TFunction_Logbook> GetLogbook();

		/****** TFunction_Scope::HasFunction ******/
		/****** md5 signature: f94fb1a6238a09ba5d0395d1843e9269 ******/
		%feature("compactdefaultargs") HasFunction;
		%feature("autodoc", "
Parameters
----------
ID: int

Return
-------
bool

Description
-----------
Returns true if the function exists with such an ID.
") HasFunction;
		Standard_Boolean HasFunction(const Standard_Integer ID);

		/****** TFunction_Scope::HasFunction ******/
		/****** md5 signature: 5680fbeb4adab29afcbd0451803740ce ******/
		%feature("compactdefaultargs") HasFunction;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Returns true if the label contains a function of this scope.
") HasFunction;
		Standard_Boolean HasFunction(const TDF_Label & L);

		/****** TFunction_Scope::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TFunction_Scope::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TFunction_Scope::Paste ******/
		/****** md5 signature: 05e5f8f16a08ca8388ac65d3be603584 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TFunction_Scope::RemoveAllFunctions ******/
		/****** md5 signature: 5ae16be68a364bbe960c9844c0b04f14 ******/
		%feature("compactdefaultargs") RemoveAllFunctions;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all functions from the scope of functions.
") RemoveAllFunctions;
		void RemoveAllFunctions();

		/****** TFunction_Scope::RemoveFunction ******/
		/****** md5 signature: ca9467e990e495e45a89e96b8951f5fc ******/
		%feature("compactdefaultargs") RemoveFunction;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Removes a function from the scope of functions.
") RemoveFunction;
		Standard_Boolean RemoveFunction(const TDF_Label & L);

		/****** TFunction_Scope::RemoveFunction ******/
		/****** md5 signature: ba9a32cc375c7861589a52671876fd4a ******/
		%feature("compactdefaultargs") RemoveFunction;
		%feature("autodoc", "
Parameters
----------
ID: int

Return
-------
bool

Description
-----------
Removes a function from the scope of functions.
") RemoveFunction;
		Standard_Boolean RemoveFunction(const Standard_Integer ID);

		/****** TFunction_Scope::Restore ******/
		/****** md5 signature: 317305acc3f3ea9c2fd983a7ed00e566 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
with: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****** TFunction_Scope::Set ******/
		/****** md5 signature: a322379ca65220ce15bff86f94c55132 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Access: TDF_Label

Return
-------
opencascade::handle<TFunction_Scope>

Description
-----------
Static methods ============== Finds or Creates a TFunction_Scope attribute at the root label accessed by <Access>. Returns the attribute.
") Set;
		static opencascade::handle<TFunction_Scope> Set(const TDF_Label & Access);

		/****** TFunction_Scope::SetFreeID ******/
		/****** md5 signature: 6e979e75ad977ad04fe0333367a5e5b4 ******/
		%feature("compactdefaultargs") SetFreeID;
		%feature("autodoc", "
Parameters
----------
ID: int

Return
-------
None

Description
-----------
No available documentation.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def TFunction_DriverTable_Get(*args):
	return TFunction_DriverTable.Get(*args)

@deprecated
def TFunction_Function_GetID(*args):
	return TFunction_Function.GetID(*args)

@deprecated
def TFunction_Function_Set(*args):
	return TFunction_Function.Set(*args)

@deprecated
def TFunction_Function_Set(*args):
	return TFunction_Function.Set(*args)

@deprecated
def TFunction_GraphNode_GetID(*args):
	return TFunction_GraphNode.GetID(*args)

@deprecated
def TFunction_GraphNode_Set(*args):
	return TFunction_GraphNode.Set(*args)

@deprecated
def TFunction_IFunction_DeleteFunction(*args):
	return TFunction_IFunction.DeleteFunction(*args)

@deprecated
def TFunction_IFunction_NewFunction(*args):
	return TFunction_IFunction.NewFunction(*args)

@deprecated
def TFunction_IFunction_UpdateDependencies(*args):
	return TFunction_IFunction.UpdateDependencies(*args)

@deprecated
def TFunction_Logbook_GetID(*args):
	return TFunction_Logbook.GetID(*args)

@deprecated
def TFunction_Logbook_Set(*args):
	return TFunction_Logbook.Set(*args)

@deprecated
def TFunction_Scope_GetID(*args):
	return TFunction_Scope.GetID(*args)

@deprecated
def TFunction_Scope_Set(*args):
	return TFunction_Scope.Set(*args)

}
