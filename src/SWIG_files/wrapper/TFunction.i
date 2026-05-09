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
%define TFUNCTIONDOCSTRING
"TFunction module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_tfunction.html"
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
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<Standard_GUID,opencascade::handle<TFunction_Driver>>::Items;
%ignore NCollection_DataMap<Standard_GUID,opencascade::handle<TFunction_Driver>>::KeyValues;
%template(TFunction_DataMapOfGUIDDriver) NCollection_DataMap<Standard_GUID,opencascade::handle<TFunction_Driver>>;
%ignore NCollection_DataMap<TDF_Label,TDF_LabelList>::Items;
%ignore NCollection_DataMap<TDF_Label,TDF_LabelList>::KeyValues;
%template(TFunction_DataMapOfLabelListOfLabel) NCollection_DataMap<TDF_Label,TDF_LabelList>;
%template(TFunction_DoubleMapOfIntegerLabel) NCollection_DoubleMap<int,TDF_Label>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<TFunction_DataMapOfGUIDDriver> TFunction_Array1OfDataMapOfGUIDDriver;
typedef NCollection_DataMap<Standard_GUID, opencascade::handle<TFunction_Driver>>::Iterator TFunction_DataMapIteratorOfDataMapOfGUIDDriver;
typedef NCollection_DataMap<TDF_Label, TDF_LabelList>::Iterator TFunction_DataMapIteratorOfDataMapOfLabelListOfLabel;
typedef NCollection_DataMap<Standard_GUID, opencascade::handle<TFunction_Driver>> TFunction_DataMapOfGUIDDriver;
typedef NCollection_DataMap<TDF_Label, TDF_LabelList> TFunction_DataMapOfLabelListOfLabel;
typedef NCollection_DoubleMap<int, TDF_Label>::Iterator TFunction_DoubleMapIteratorOfDoubleMapOfIntegerLabel;
typedef NCollection_DoubleMap<int, TDF_Label> TFunction_DoubleMapOfIntegerLabel;
typedef NCollection_HArray1<TFunction_DataMapOfGUIDDriver> TFunction_HArray1OfDataMapOfGUIDDriver;
/* end typedefs declaration */

/*************************
* class TFunction_Driver *
*************************/
%nodefaultctor TFunction_Driver;
class TFunction_Driver : public Standard_Transient {
	public:
		/****** TFunction_Driver::Arguments ******/
		/****** md5 signature: 15f9f897512a8cd46cc4b5267cc6dced ******/
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
		/****** md5 signature: 4d82c635563ebfa7330a2fb2d96a1890 ******/
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
		virtual int Execute(opencascade::handle<TFunction_Logbook> & log);

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
		/****** md5 signature: 3f84bc46270df2be498ec10aafdbde00 ******/
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
		virtual bool MustExecute(const opencascade::handle<TFunction_Logbook> & log);

		/****** TFunction_Driver::Results ******/
		/****** md5 signature: 2b683a00431be5413c05a5cf123ca38e ******/
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
		/****** md5 signature: 423a12c33d12bdceb19c48f26ec9e67b ******/
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
		virtual void Validate(const opencascade::handle<TFunction_Logbook> & log);

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
		/****** md5 signature: 5d5863d7a85593a52ffe707d444de3b9 ******/
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
		bool AddDriver(const Standard_GUID & guid, const opencascade::handle<TFunction_Driver> & driver, const int thread = 0);

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
		/****** md5 signature: 2d0db992f14ef39ed81cd2f732d4bdfc ******/
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
		bool FindDriver(const Standard_GUID & guid, opencascade::handle<TFunction_Driver> & driver, const int thread = 0);

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
		/****** md5 signature: 318351394f641c158a92575af2885a7f ******/
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
		bool HasDriver(const Standard_GUID & guid, const int thread = 0);

		/****** TFunction_DriverTable::RemoveDriver ******/
		/****** md5 signature: b15e8831c3ae833aa8c51ed7fa566be4 ******/
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
		bool RemoveDriver(const Standard_GUID & guid, const int thread = 0);

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
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
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
		/****** md5 signature: 6ae9cda6410362e062dd94ec4add3738 ******/
		%feature("compactdefaultargs") Failed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the execution failed.
") Failed;
		bool Failed();

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
		/****** md5 signature: b85f1cad1a0f0fefb425411d7849ae55 ******/
		%feature("compactdefaultargs") GetFailure;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns an index of failure if the execution of this function failed. If this integer value is 0, no failure has occurred. Implementation of Attribute methods: ===================================.
") GetFailure;
		int GetFailure();

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
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
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
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TFunction_Function::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
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
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TFunction_Function::References ******/
		/****** md5 signature: 3de62c613451bbbead6f06af1452fc25 ******/
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
		void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TFunction_Function::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
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
		void Restore(const opencascade::handle<TDF_Attribute> & with);

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
		/****** md5 signature: 2746905a028b7bf34747b3a719a00d68 ******/
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
		void SetFailure(const int mode = 0);

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
		/****** md5 signature: 5c4bcca226f087067a04cd5cec704e57 ******/
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
		bool AddNext(const int funcID);

		/****** TFunction_GraphNode::AddNext ******/
		/****** md5 signature: ac02c066a76c5e2fcf04fa01a80ee3cb ******/
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
		bool AddNext(const TDF_Label & func);

		/****** TFunction_GraphNode::AddPrevious ******/
		/****** md5 signature: b8a2b76a4eafbab3eb316c8a2284f262 ******/
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
		bool AddPrevious(const int funcID);

		/****** TFunction_GraphNode::AddPrevious ******/
		/****** md5 signature: 3cbff11a0f0ef45e1a202ce3263b470e ******/
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
		bool AddPrevious(const TDF_Label & func);

		/****** TFunction_GraphNode::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
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
		/****** md5 signature: 064c8214b7c2f99686b52413f2c2d422 ******/
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
		/****** md5 signature: e8fc0dd31ecb307c2cbdb750b0547616 ******/
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
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
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
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TFunction_GraphNode::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
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
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TFunction_GraphNode::References ******/
		/****** md5 signature: 3de62c613451bbbead6f06af1452fc25 ******/
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
		void References(const opencascade::handle<TDF_DataSet> & aDataSet);

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
		/****** md5 signature: 22b16fd3e91aadc16b9ba4fe537bc9d5 ******/
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
		bool RemoveNext(const int funcID);

		/****** TFunction_GraphNode::RemoveNext ******/
		/****** md5 signature: 53c66c9dc3129776f867ca88d2ea9c54 ******/
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
		bool RemoveNext(const TDF_Label & func);

		/****** TFunction_GraphNode::RemovePrevious ******/
		/****** md5 signature: 34395bf89ca887d0fb9fbbfb77e117a7 ******/
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
		bool RemovePrevious(const int funcID);

		/****** TFunction_GraphNode::RemovePrevious ******/
		/****** md5 signature: e61daf75acc1c441f333ef8eb3782157 ******/
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
		bool RemovePrevious(const TDF_Label & func);

		/****** TFunction_GraphNode::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
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
		void Restore(const opencascade::handle<TDF_Attribute> & with);

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
		/****** md5 signature: 086a44ac72a8a2a229752e87f6299c33 ******/
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
		/****** md5 signature: e00c4c65b307bcf47f52dbfcf7786e5c ******/
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
		static bool DeleteFunction(const TDF_Label & L);

		/****** TFunction_IFunction::GetAllFunctions ******/
		/****** md5 signature: b54154477e422cdd44a5227fb54df6c8 ******/
		%feature("compactdefaultargs") GetAllFunctions;
		%feature("autodoc", "Return
-------
NCollection_DoubleMap<int, TDF_Label>

Description
-----------
Returns the scope of all functions.
") GetAllFunctions;
		const NCollection_DoubleMap<int, TDF_Label> & GetAllFunctions();

		/****** TFunction_IFunction::GetDriver ******/
		/****** md5 signature: ef67718bc07c6464b940de46a9a42232 ******/
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
		opencascade::handle<TFunction_Driver> GetDriver(const int thread = 0);

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
		/****** md5 signature: 72a35bb1a42bb911854f36db5dcd168f ******/
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
		/****** md5 signature: 5b18a41871bc7d19747931812cef3b6c ******/
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
		/****** md5 signature: 644b642d2066e8d4004de1a5ee9ad083 ******/
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
		static bool NewFunction(const TDF_Label & L, const Standard_GUID & ID);

		/****** TFunction_IFunction::Results ******/
		/****** md5 signature: a8672a43db1283898c5317accae84961 ******/
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
		/****** md5 signature: 69082b8ea540d57da3a8fb5b1d33ad3d ******/
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
		static bool UpdateDependencies(const TDF_Label & Access);

		/****** TFunction_IFunction::UpdateDependencies ******/
		/****** md5 signature: 9477f5e44614b493f565153e3f8f67bb ******/
		%feature("compactdefaultargs") UpdateDependencies;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Updates the dependencies of this function only.
") UpdateDependencies;
		bool UpdateDependencies();

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
		/****** md5 signature: f40d90a321d7f011798c0a026d3daff0 ******/
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
		/****** md5 signature: 823a6aae6d812f7910c5d7d9f3817db1 ******/
		%feature("compactdefaultargs") GetMaxNbThreads;
		%feature("autodoc", "Return
-------
int

Description
-----------
Analyses the graph of dependencies and returns maximum number of threads may be used to calculate the model.
") GetMaxNbThreads;
		virtual int GetMaxNbThreads();

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
		/****** md5 signature: b816a274f5542621a2c28d6e6a3c27ca ******/
		%feature("compactdefaultargs") GetUsageOfExecutionStatus;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns usage of execution status by the iterator.
") GetUsageOfExecutionStatus;
		bool GetUsageOfExecutionStatus();

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
		/****** md5 signature: 1baced8960511e863532ef005bb96cb8 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false if the graph of functions is fully iterated.
") More;
		virtual bool More();

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
		/****** md5 signature: 05bc2bc18f68c5d97c0e58ad840052dd ******/
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
		void SetUsageOfExecutionStatus(const bool usage);

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
		/****** md5 signature: 6567a59190b8849d60258ce74eae24c5 ******/
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
		void Done(const bool status);

		/****** TFunction_Logbook::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
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
		Standard_OStream & Dump(std::ostream &OutValue);

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
		/****** md5 signature: 3222059aa515913d410d544665b71bdd ******/
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
		/****** md5 signature: fa58d459f40f64a3917f5956e50c84db ******/
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
		/****** md5 signature: e544ee87bdeef2f9f564bf6e738a5f18 ******/
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
		/****** md5 signature: 34c1e4015941f40fee89db0e6a8bf38d ******/
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
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns status of execution.
") IsDone;
		bool IsDone();

		/****** TFunction_Logbook::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** TFunction_Logbook::IsModified ******/
		/****** md5 signature: 043a8722b45c09ab77c6558b4a108d3a ******/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
WithChildren: bool (optional, default to false)

Return
-------
bool

Description
-----------
Returns True if the label L is touched or impacted. This method is called by <TFunction_FunctionDriver::MustExecute>. If <WithChildren> is set to true, the method checks all the sublabels of <L> too.
") IsModified;
		bool IsModified(const TDF_Label & L, const bool WithChildren = false);

		/****** TFunction_Logbook::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns a new empty instance of the attribute.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TFunction_Logbook::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
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
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TFunction_Logbook::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
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
		void Restore(const opencascade::handle<TDF_Attribute> & with);

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
		/****** md5 signature: d860ca3d3d51ccd7c89239bdae82f481 ******/
		%feature("compactdefaultargs") SetImpacted;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
WithChildren: bool (optional, default to false)

Return
-------
None

Description
-----------
Sets the label L as an impacted label in this logbook. This method is called by execution of the function driver.
") SetImpacted;
		void SetImpacted(const TDF_Label & L, const bool WithChildren = false);

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
		/****** md5 signature: 3572301fe900d2f67be3d2e87319e1b0 ******/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
WithChildren: bool (optional, default to false)

Return
-------
None

Description
-----------
Sets the label L as a valid label in this logbook.
") SetValid;
		void SetValid(const TDF_Label & L, const bool WithChildren = false);

		/****** TFunction_Logbook::SetValid ******/
		/****** md5 signature: b3295e77b2ae3bc2819db0e8d67d7c7a ******/
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
		/****** md5 signature: 18bc7f57bce2621ca40cff8b9ad72e76 ******/
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
		bool AddFunction(const TDF_Label & L);

		/****** TFunction_Scope::ChangeFunctions ******/
		/****** md5 signature: 042d80331f538f46e64cbc438d1860f1 ******/
		%feature("compactdefaultargs") ChangeFunctions;
		%feature("autodoc", "Return
-------
NCollection_DoubleMap<int, TDF_Label>

Description
-----------
Returns the scope of functions for modification. Warning: Don't use this method if You are not sure what You do!.
") ChangeFunctions;
		NCollection_DoubleMap<int, TDF_Label> & ChangeFunctions();

		/****** TFunction_Scope::Dump ******/
		/****** md5 signature: c3832f0735de2bdac14af95fe6ce7de3 ******/
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

		/****** TFunction_Scope::GetFreeID ******/
		/****** md5 signature: 27b6bef0d7e8b986dc2159ca231a3a53 ******/
		%feature("compactdefaultargs") GetFreeID;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetFreeID;
		int GetFreeID();

		/****** TFunction_Scope::GetFunction ******/
		/****** md5 signature: bbe55ce15dbeb1b399470fcd6644c395 ******/
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
		int GetFunction(const TDF_Label & L);

		/****** TFunction_Scope::GetFunction ******/
		/****** md5 signature: a4d5870e240b5571af79791eaaeb33ae ******/
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
		const TDF_Label & GetFunction(const int ID);

		/****** TFunction_Scope::GetFunctions ******/
		/****** md5 signature: 731347d280a2efc699841947c3a3edf6 ******/
		%feature("compactdefaultargs") GetFunctions;
		%feature("autodoc", "Return
-------
NCollection_DoubleMap<int, TDF_Label>

Description
-----------
Returns the scope of functions.
") GetFunctions;
		const NCollection_DoubleMap<int, TDF_Label> & GetFunctions();

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
		/****** md5 signature: 6d1cc32894784a6a31920f24bb79dd12 ******/
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
		bool HasFunction(const int ID);

		/****** TFunction_Scope::HasFunction ******/
		/****** md5 signature: 2401c3c4fa984476b997e03cf3c3de62 ******/
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
		bool HasFunction(const TDF_Label & L);

		/****** TFunction_Scope::ID ******/
		/****** md5 signature: 90e2a7836a98c0274891df8231c5ae76 ******/
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
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TFunction_Scope::Paste ******/
		/****** md5 signature: bfece7a0e37cb5034ac0b2a8c488da37 ******/
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
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

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
		/****** md5 signature: c84ee7592ed6097f8888e8029e06fbc2 ******/
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
		bool RemoveFunction(const TDF_Label & L);

		/****** TFunction_Scope::RemoveFunction ******/
		/****** md5 signature: 3c10daf32c32ff2d90205f24e4ff8d59 ******/
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
		bool RemoveFunction(const int ID);

		/****** TFunction_Scope::Restore ******/
		/****** md5 signature: 8bde8d15cc1907242b8c43fe6eb18f19 ******/
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
		void Restore(const opencascade::handle<TDF_Attribute> & with);

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
		/****** md5 signature: 9b238dbed246168a2aa8319df310f343 ******/
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
		void SetFreeID(const int ID);

};


%make_alias(TFunction_Scope)

%extend TFunction_Scope {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class TFunction_HArray1OfDataMapOfGUIDDriver : public NCollection_Array1<TFunction_DataMapOfGUIDDriver>, public Standard_Transient {
  public:
    TFunction_HArray1OfDataMapOfGUIDDriver(const Standard_Integer theLower, const Standard_Integer theUpper);
    TFunction_HArray1OfDataMapOfGUIDDriver(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<TFunction_DataMapOfGUIDDriver>::value_type& theValue);
    TFunction_HArray1OfDataMapOfGUIDDriver(const NCollection_Array1<TFunction_DataMapOfGUIDDriver>& theOther);
    const NCollection_Array1<TFunction_DataMapOfGUIDDriver>& Array1();
    NCollection_Array1<TFunction_DataMapOfGUIDDriver>& ChangeArray1();
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
