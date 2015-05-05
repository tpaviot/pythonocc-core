/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") Storage

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include Storage_headers.i

/* typedefs */
typedef Storage_BaseDriver * Storage_Container;
typedef long Storage_Position;
/* end typedefs declaration */

/* public enums */
enum Storage_Error {
	Storage_VSOk = 0,
	Storage_VSOpenError = 1,
	Storage_VSModeError = 2,
	Storage_VSCloseError = 3,
	Storage_VSAlreadyOpen = 4,
	Storage_VSNotOpen = 5,
	Storage_VSSectionNotFound = 6,
	Storage_VSWriteError = 7,
	Storage_VSFormatError = 8,
	Storage_VSUnknownType = 9,
	Storage_VSTypeMismatch = 10,
	Storage_VSInternalError = 11,
	Storage_VSExtCharParityError = 12,
	Storage_VSWrongFileDriver = 13,
};

enum Storage_OpenMode {
	Storage_VSNone = 0,
	Storage_VSRead = 1,
	Storage_VSWrite = 2,
	Storage_VSReadWrite = 3,
};

enum Storage_SolveMode {
	Storage_AddSolve = 0,
	Storage_WriteSolve = 1,
	Storage_ReadSolve = 2,
};

/* end public enums declaration */

%rename(storage) Storage;
class Storage {
	public:
		%feature("autodoc", "	* returns the version of Storage's read/write routines

	:rtype: TCollection_AsciiString
") Version;
		static TCollection_AsciiString Version ();
};


%feature("shadow") Storage::~Storage %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_ArrayOfCallBack;
class Storage_ArrayOfCallBack {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Storage_ArrayOfCallBack;
		 Storage_ArrayOfCallBack (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Storage_CallBack &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Storage_ArrayOfCallBack;
		 Storage_ArrayOfCallBack (const Handle_Storage_CallBack & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_Storage_CallBack &
	:rtype: None
") Init;
		void Init (const Handle_Storage_CallBack & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Storage_ArrayOfCallBack &
	:rtype: Storage_ArrayOfCallBack
") Assign;
		const Storage_ArrayOfCallBack & Assign (const Storage_ArrayOfCallBack & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Storage_ArrayOfCallBack &
	:rtype: Storage_ArrayOfCallBack
") operator=;
		const Storage_ArrayOfCallBack & operator = (const Storage_ArrayOfCallBack & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Storage_CallBack &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Storage_CallBack & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Storage_CallBack
") Value;
		const Handle_Storage_CallBack & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Storage_CallBack
") ChangeValue;
		Handle_Storage_CallBack & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Storage_ArrayOfCallBack::~Storage_ArrayOfCallBack %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_ArrayOfCallBack {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_ArrayOfSchema;
class Storage_ArrayOfSchema {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Storage_ArrayOfSchema;
		 Storage_ArrayOfSchema (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Storage_Schema &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Storage_ArrayOfSchema;
		 Storage_ArrayOfSchema (const Handle_Storage_Schema & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_Storage_Schema &
	:rtype: None
") Init;
		void Init (const Handle_Storage_Schema & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Storage_ArrayOfSchema &
	:rtype: Storage_ArrayOfSchema
") Assign;
		const Storage_ArrayOfSchema & Assign (const Storage_ArrayOfSchema & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Storage_ArrayOfSchema &
	:rtype: Storage_ArrayOfSchema
") operator=;
		const Storage_ArrayOfSchema & operator = (const Storage_ArrayOfSchema & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Storage_Schema &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Storage_Schema & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Storage_Schema
") Value;
		const Handle_Storage_Schema & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Storage_Schema
") ChangeValue;
		Handle_Storage_Schema & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Storage_ArrayOfSchema::~Storage_ArrayOfSchema %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_ArrayOfSchema {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_BaseDriver;
class Storage_BaseDriver {
	public:
		%feature("autodoc", "	:rtype: None
") Delete;
		void Delete ();
		%feature("autodoc", "	:param aName:
	:type aName: TCollection_AsciiString &
	:param aMode:
	:type aMode: Storage_OpenMode
	:rtype: Storage_Error
") Open;
		virtual Storage_Error Open (const TCollection_AsciiString & aName,const Storage_OpenMode aMode);
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Name;
		TCollection_AsciiString Name ();
		%feature("autodoc", "	:rtype: Storage_OpenMode
") OpenMode;
		Storage_OpenMode OpenMode ();
		%feature("autodoc", "	* returns True if we are at end of the stream

	:rtype: bool
") IsEnd;
		virtual Standard_Boolean IsEnd ();
		%feature("autodoc", "	* return position in the file. Return -1 upon error.

	:rtype: Storage_Position
") Tell;
		virtual Storage_Position Tell ();
		%feature("autodoc", "	:rtype: Storage_Error
") BeginWriteInfoSection;
		virtual Storage_Error BeginWriteInfoSection ();
		%feature("autodoc", "	:param nbObj:
	:type nbObj: Standard_Integer
	:param dbVersion:
	:type dbVersion: TCollection_AsciiString &
	:param date:
	:type date: TCollection_AsciiString &
	:param schemaName:
	:type schemaName: TCollection_AsciiString &
	:param schemaVersion:
	:type schemaVersion: TCollection_AsciiString &
	:param appName:
	:type appName: TCollection_ExtendedString &
	:param appVersion:
	:type appVersion: TCollection_AsciiString &
	:param objectType:
	:type objectType: TCollection_ExtendedString &
	:param userInfo:
	:type userInfo: TColStd_SequenceOfAsciiString &
	:rtype: void
") WriteInfo;
		virtual void WriteInfo (const Standard_Integer nbObj,const TCollection_AsciiString & dbVersion,const TCollection_AsciiString & date,const TCollection_AsciiString & schemaName,const TCollection_AsciiString & schemaVersion,const TCollection_ExtendedString & appName,const TCollection_AsciiString & appVersion,const TCollection_ExtendedString & objectType,const TColStd_SequenceOfAsciiString & userInfo);
		%feature("autodoc", "	:rtype: Storage_Error
") EndWriteInfoSection;
		virtual Storage_Error EndWriteInfoSection ();
		%feature("autodoc", "	:rtype: Storage_Error
") BeginReadInfoSection;
		virtual Storage_Error BeginReadInfoSection ();
		%feature("autodoc", "	:param nbObj:
	:type nbObj: Standard_Integer &
	:param dbVersion:
	:type dbVersion: TCollection_AsciiString &
	:param date:
	:type date: TCollection_AsciiString &
	:param schemaName:
	:type schemaName: TCollection_AsciiString &
	:param schemaVersion:
	:type schemaVersion: TCollection_AsciiString &
	:param appName:
	:type appName: TCollection_ExtendedString &
	:param appVersion:
	:type appVersion: TCollection_AsciiString &
	:param objectType:
	:type objectType: TCollection_ExtendedString &
	:param userInfo:
	:type userInfo: TColStd_SequenceOfAsciiString &
	:rtype: void
") ReadInfo;
		virtual void ReadInfo (Standard_Integer &OutValue,TCollection_AsciiString & dbVersion,TCollection_AsciiString & date,TCollection_AsciiString & schemaName,TCollection_AsciiString & schemaVersion,TCollection_ExtendedString & appName,TCollection_AsciiString & appVersion,TCollection_ExtendedString & objectType,TColStd_SequenceOfAsciiString & userInfo);
		%feature("autodoc", "	:rtype: Storage_Error
") EndReadInfoSection;
		virtual Storage_Error EndReadInfoSection ();
		%feature("autodoc", "	:rtype: Storage_Error
") BeginWriteCommentSection;
		virtual Storage_Error BeginWriteCommentSection ();
		%feature("autodoc", "	:param userComments:
	:type userComments: TColStd_SequenceOfExtendedString &
	:rtype: void
") WriteComment;
		virtual void WriteComment (const TColStd_SequenceOfExtendedString & userComments);
		%feature("autodoc", "	:rtype: Storage_Error
") EndWriteCommentSection;
		virtual Storage_Error EndWriteCommentSection ();
		%feature("autodoc", "	:rtype: Storage_Error
") BeginReadCommentSection;
		virtual Storage_Error BeginReadCommentSection ();
		%feature("autodoc", "	:param userComments:
	:type userComments: TColStd_SequenceOfExtendedString &
	:rtype: void
") ReadComment;
		virtual void ReadComment (TColStd_SequenceOfExtendedString & userComments);
		%feature("autodoc", "	:rtype: Storage_Error
") EndReadCommentSection;
		virtual Storage_Error EndReadCommentSection ();
		%feature("autodoc", "	:rtype: Storage_Error
") BeginWriteTypeSection;
		virtual Storage_Error BeginWriteTypeSection ();
		%feature("autodoc", "	:param aSize:
	:type aSize: Standard_Integer
	:rtype: void
") SetTypeSectionSize;
		virtual void SetTypeSectionSize (const Standard_Integer aSize);
		%feature("autodoc", "	:param typeNum:
	:type typeNum: Standard_Integer
	:param typeName:
	:type typeName: TCollection_AsciiString &
	:rtype: void
") WriteTypeInformations;
		virtual void WriteTypeInformations (const Standard_Integer typeNum,const TCollection_AsciiString & typeName);
		%feature("autodoc", "	:rtype: Storage_Error
") EndWriteTypeSection;
		virtual Storage_Error EndWriteTypeSection ();
		%feature("autodoc", "	:rtype: Storage_Error
") BeginReadTypeSection;
		virtual Storage_Error BeginReadTypeSection ();
		%feature("autodoc", "	:rtype: int
") TypeSectionSize;
		virtual Standard_Integer TypeSectionSize ();
		%feature("autodoc", "	:param typeNum:
	:type typeNum: Standard_Integer &
	:param typeName:
	:type typeName: TCollection_AsciiString &
	:rtype: void
") ReadTypeInformations;
		virtual void ReadTypeInformations (Standard_Integer &OutValue,TCollection_AsciiString & typeName);
		%feature("autodoc", "	:rtype: Storage_Error
") EndReadTypeSection;
		virtual Storage_Error EndReadTypeSection ();
		%feature("autodoc", "	:rtype: Storage_Error
") BeginWriteRootSection;
		virtual Storage_Error BeginWriteRootSection ();
		%feature("autodoc", "	:param aSize:
	:type aSize: Standard_Integer
	:rtype: void
") SetRootSectionSize;
		virtual void SetRootSectionSize (const Standard_Integer aSize);
		%feature("autodoc", "	:param rootName:
	:type rootName: TCollection_AsciiString &
	:param aRef:
	:type aRef: Standard_Integer
	:param aType:
	:type aType: TCollection_AsciiString &
	:rtype: void
") WriteRoot;
		virtual void WriteRoot (const TCollection_AsciiString & rootName,const Standard_Integer aRef,const TCollection_AsciiString & aType);
		%feature("autodoc", "	:rtype: Storage_Error
") EndWriteRootSection;
		virtual Storage_Error EndWriteRootSection ();
		%feature("autodoc", "	:rtype: Storage_Error
") BeginReadRootSection;
		virtual Storage_Error BeginReadRootSection ();
		%feature("autodoc", "	:rtype: int
") RootSectionSize;
		virtual Standard_Integer RootSectionSize ();
		%feature("autodoc", "	:param rootName:
	:type rootName: TCollection_AsciiString &
	:param aRef:
	:type aRef: Standard_Integer &
	:param aType:
	:type aType: TCollection_AsciiString &
	:rtype: void
") ReadRoot;
		virtual void ReadRoot (TCollection_AsciiString & rootName,Standard_Integer &OutValue,TCollection_AsciiString & aType);
		%feature("autodoc", "	:rtype: Storage_Error
") EndReadRootSection;
		virtual Storage_Error EndReadRootSection ();
		%feature("autodoc", "	:rtype: Storage_Error
") BeginWriteRefSection;
		virtual Storage_Error BeginWriteRefSection ();
		%feature("autodoc", "	:param aSize:
	:type aSize: Standard_Integer
	:rtype: void
") SetRefSectionSize;
		virtual void SetRefSectionSize (const Standard_Integer aSize);
		%feature("autodoc", "	:param reference:
	:type reference: Standard_Integer
	:param typeNum:
	:type typeNum: Standard_Integer
	:rtype: void
") WriteReferenceType;
		virtual void WriteReferenceType (const Standard_Integer reference,const Standard_Integer typeNum);
		%feature("autodoc", "	:rtype: Storage_Error
") EndWriteRefSection;
		virtual Storage_Error EndWriteRefSection ();
		%feature("autodoc", "	:rtype: Storage_Error
") BeginReadRefSection;
		virtual Storage_Error BeginReadRefSection ();
		%feature("autodoc", "	:rtype: int
") RefSectionSize;
		virtual Standard_Integer RefSectionSize ();
		%feature("autodoc", "	:param reference:
	:type reference: Standard_Integer &
	:param typeNum:
	:type typeNum: Standard_Integer &
	:rtype: void
") ReadReferenceType;
		virtual void ReadReferenceType (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:rtype: Storage_Error
") EndReadRefSection;
		virtual Storage_Error EndReadRefSection ();
		%feature("autodoc", "	:rtype: Storage_Error
") BeginWriteDataSection;
		virtual Storage_Error BeginWriteDataSection ();
		%feature("autodoc", "	:param aRef:
	:type aRef: Standard_Integer
	:param aType:
	:type aType: Standard_Integer
	:rtype: void
") WritePersistentObjectHeader;
		virtual void WritePersistentObjectHeader (const Standard_Integer aRef,const Standard_Integer aType);
		%feature("autodoc", "	:rtype: void
") BeginWritePersistentObjectData;
		virtual void BeginWritePersistentObjectData ();
		%feature("autodoc", "	:rtype: void
") BeginWriteObjectData;
		virtual void BeginWriteObjectData ();
		%feature("autodoc", "	:rtype: void
") EndWriteObjectData;
		virtual void EndWriteObjectData ();
		%feature("autodoc", "	:rtype: void
") EndWritePersistentObjectData;
		virtual void EndWritePersistentObjectData ();
		%feature("autodoc", "	:rtype: Storage_Error
") EndWriteDataSection;
		virtual Storage_Error EndWriteDataSection ();
		%feature("autodoc", "	:rtype: Storage_Error
") BeginReadDataSection;
		virtual Storage_Error BeginReadDataSection ();
		%feature("autodoc", "	:param aRef:
	:type aRef: Standard_Integer &
	:param aType:
	:type aType: Standard_Integer &
	:rtype: void
") ReadPersistentObjectHeader;
		virtual void ReadPersistentObjectHeader (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:rtype: void
") BeginReadPersistentObjectData;
		virtual void BeginReadPersistentObjectData ();
		%feature("autodoc", "	:rtype: void
") BeginReadObjectData;
		virtual void BeginReadObjectData ();
		%feature("autodoc", "	:rtype: void
") EndReadObjectData;
		virtual void EndReadObjectData ();
		%feature("autodoc", "	:rtype: void
") EndReadPersistentObjectData;
		virtual void EndReadPersistentObjectData ();
		%feature("autodoc", "	:rtype: Storage_Error
") EndReadDataSection;
		virtual Storage_Error EndReadDataSection ();
		%feature("autodoc", "	:rtype: void
") SkipObject;
		virtual void SkipObject ();
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_Integer
	:rtype: Storage_BaseDriver
") PutReference;
		virtual Storage_BaseDriver & PutReference (const Standard_Integer aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_Character
	:rtype: Storage_BaseDriver
") PutCharacter;
		virtual Storage_BaseDriver & PutCharacter (const Standard_Character aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_ExtCharacter
	:rtype: Storage_BaseDriver
") PutExtCharacter;
		virtual Storage_BaseDriver & PutExtCharacter (const Standard_ExtCharacter aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_Integer
	:rtype: Storage_BaseDriver
") PutInteger;
		virtual Storage_BaseDriver & PutInteger (const Standard_Integer aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: bool
	:rtype: Storage_BaseDriver
") PutBoolean;
		virtual Storage_BaseDriver & PutBoolean (const Standard_Boolean aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: float
	:rtype: Storage_BaseDriver
") PutReal;
		virtual Storage_BaseDriver & PutReal (const Standard_Real aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_ShortReal
	:rtype: Storage_BaseDriver
") PutShortReal;
		virtual Storage_BaseDriver & PutShortReal (const Standard_ShortReal aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_Integer &
	:rtype: Storage_BaseDriver
") GetReference;
		virtual Storage_BaseDriver & GetReference (Standard_Integer &OutValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_Character &
	:rtype: Storage_BaseDriver
") GetCharacter;
		virtual Storage_BaseDriver & GetCharacter (Standard_Character & aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_Character &
	:rtype: Storage_BaseDriver
") operator>>;
		Storage_BaseDriver & operator >> (Standard_Character & aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_ExtCharacter &
	:rtype: Storage_BaseDriver
") GetExtCharacter;
		virtual Storage_BaseDriver & GetExtCharacter (Standard_ExtCharacter & aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_ExtCharacter &
	:rtype: Storage_BaseDriver
") operator>>;
		Storage_BaseDriver & operator >> (Standard_ExtCharacter & aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_Integer &
	:rtype: Storage_BaseDriver
") GetInteger;
		virtual Storage_BaseDriver & GetInteger (Standard_Integer &OutValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_Integer &
	:rtype: Storage_BaseDriver
") operator>>;
		Storage_BaseDriver & operator >> (Standard_Integer &OutValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: bool
	:rtype: Storage_BaseDriver
") GetBoolean;
		virtual Storage_BaseDriver & GetBoolean (Standard_Boolean & aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: bool
	:rtype: Storage_BaseDriver
") operator>>;
		Storage_BaseDriver & operator >> (Standard_Boolean & aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: float &
	:rtype: Storage_BaseDriver
") GetReal;
		virtual Storage_BaseDriver & GetReal (Standard_Real &OutValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: float &
	:rtype: Storage_BaseDriver
") operator>>;
		Storage_BaseDriver & operator >> (Standard_Real &OutValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_ShortReal &
	:rtype: Storage_BaseDriver
") GetShortReal;
		virtual Storage_BaseDriver & GetShortReal (Standard_ShortReal & aValue);
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_ShortReal &
	:rtype: Storage_BaseDriver
") operator>>;
		Storage_BaseDriver & operator >> (Standard_ShortReal & aValue);
		%feature("autodoc", "	:rtype: Storage_Error
") Close;
		virtual Storage_Error Close ();
};


%feature("shadow") Storage_BaseDriver::~Storage_BaseDriver %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_BaseDriver {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_Bucket;
class Storage_Bucket {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_Bucket;
		 Storage_Bucket ();
		%feature("autodoc", "	:param theSpaceSize:
	:type theSpaceSize: Standard_Integer
	:rtype: None
") Storage_Bucket;
		 Storage_Bucket (const Standard_Integer theSpaceSize);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
};


%feature("shadow") Storage_Bucket::~Storage_Bucket %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_Bucket {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_BucketIterator;
class Storage_BucketIterator {
	public:
		%feature("autodoc", "	:param :
	:type : Storage_BucketOfPersistent *
	:rtype: None
") Storage_BucketIterator;
		 Storage_BucketIterator (Storage_BucketOfPersistent * );
		%feature("autodoc", "	:param :
	:type : Storage_BucketOfPersistent *
	:rtype: None
") Init;
		void Init (Storage_BucketOfPersistent * );
		%feature("autodoc", "	:rtype: None
") Reset;
		void Reset ();
		%feature("autodoc", "	:rtype: Standard_Persistent *
") Value;
		Standard_Persistent * Value ();
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
};


%feature("shadow") Storage_BucketIterator::~Storage_BucketIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_BucketIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_BucketOfPersistent;
class Storage_BucketOfPersistent {
	public:
		%feature("autodoc", "	:param theBucketSize: default value is 300000
	:type theBucketSize: Standard_Integer
	:param theBucketNumber: default value is 100
	:type theBucketNumber: Standard_Integer
	:rtype: None
") Storage_BucketOfPersistent;
		 Storage_BucketOfPersistent (const Standard_Integer theBucketSize = 300000,const Standard_Integer theBucketNumber = 100);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:param sp:
	:type sp: Handle_Standard_Persistent &
	:rtype: None
") Append;
		void Append (const Handle_Standard_Persistent & sp);
		%feature("autodoc", "	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: Standard_Persistent *
") Value;
		Standard_Persistent * Value (const Standard_Integer theIndex);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
};


%feature("shadow") Storage_BucketOfPersistent::~Storage_BucketOfPersistent %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_BucketOfPersistent {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_CallBack;
class Storage_CallBack : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: Handle_Standard_Persistent
") New;
		virtual Handle_Standard_Persistent New ();
		%feature("autodoc", "	:param aPers:
	:type aPers: Handle_Standard_Persistent &
	:param aSchema:
	:type aSchema: Handle_Storage_Schema &
	:rtype: void
") Add;
		virtual void Add (const Handle_Standard_Persistent & aPers,const Handle_Storage_Schema & aSchema);
		%feature("autodoc", "	:param aPers:
	:type aPers: Handle_Standard_Persistent &
	:param aDriver:
	:type aDriver: Storage_BaseDriver &
	:param aSchema:
	:type aSchema: Handle_Storage_Schema &
	:rtype: void
") Write;
		virtual void Write (const Handle_Standard_Persistent & aPers,Storage_BaseDriver & aDriver,const Handle_Storage_Schema & aSchema);
		%feature("autodoc", "	:param aPers:
	:type aPers: Handle_Standard_Persistent &
	:param aDriver:
	:type aDriver: Storage_BaseDriver &
	:param aSchema:
	:type aSchema: Handle_Storage_Schema &
	:rtype: void
") Read;
		virtual void Read (const Handle_Standard_Persistent & aPers,Storage_BaseDriver & aDriver,const Handle_Storage_Schema & aSchema);
};


%feature("shadow") Storage_CallBack::~Storage_CallBack %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_CallBack {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_CallBack {
	Handle_Storage_CallBack GetHandle() {
	return *(Handle_Storage_CallBack*) &$self;
	}
};

%nodefaultctor Handle_Storage_CallBack;
class Handle_Storage_CallBack : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_CallBack();
        Handle_Storage_CallBack(const Handle_Storage_CallBack &aHandle);
        Handle_Storage_CallBack(const Storage_CallBack *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_CallBack DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_CallBack {
    Storage_CallBack* GetObject() {
    return (Storage_CallBack*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_CallBack::~Handle_Storage_CallBack %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_CallBack {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_Data;
class Storage_Data : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Creates an empty set of data. You explicitly create a Storage_Data object when preparing the set of objects to be stored together in a container (for example, in a file). Then use the function AddRoot to add persistent objects to the set of data. A Storage_Data object is also returned by the Read function of a Storage_Schema storage/retrieval algorithm. Use the functions NumberOfRoots and Roots to find the roots which were stored in the read container.

	:rtype: None
") Storage_Data;
		 Storage_Data ();
		%feature("autodoc", "	* Returns Storage_VSOk if - the last storage operation performed with the function Read, or - the last retrieval operation performed with the function Write by a Storage_Schema algorithm, on this set of data was successful. If the storage or retrieval operation was not performed, the returned error status indicates the reason why the operation failed. The algorithm stops its analysis at the first detected error

	:rtype: Storage_Error
") ErrorStatus;
		Storage_Error ErrorStatus ();
		%feature("autodoc", "	* Clears the error status positioned either by: - the last storage operation performed with the Read function, or - the last retrieval operation performed with the Write function by a Storage_Schema algorithm, on this set of data. This error status may be read by the function ErrorStatus.

	:rtype: None
") ClearErrorStatus;
		void ClearErrorStatus ();
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") ErrorStatusExtension;
		TCollection_AsciiString ErrorStatusExtension ();
		%feature("autodoc", "	* return the creation date

	:rtype: TCollection_AsciiString
") CreationDate;
		TCollection_AsciiString CreationDate ();
		%feature("autodoc", "	* return the Storage package version

	:rtype: TCollection_AsciiString
") StorageVersion;
		TCollection_AsciiString StorageVersion ();
		%feature("autodoc", "	* get the version of the schema

	:rtype: TCollection_AsciiString
") SchemaVersion;
		TCollection_AsciiString SchemaVersion ();
		%feature("autodoc", "	* get the schema's name

	:rtype: TCollection_AsciiString
") SchemaName;
		TCollection_AsciiString SchemaName ();
		%feature("autodoc", "	* set the version of the application

	:param aVersion:
	:type aVersion: TCollection_AsciiString &
	:rtype: None
") SetApplicationVersion;
		void SetApplicationVersion (const TCollection_AsciiString & aVersion);
		%feature("autodoc", "	* get the version of the application

	:rtype: TCollection_AsciiString
") ApplicationVersion;
		TCollection_AsciiString ApplicationVersion ();
		%feature("autodoc", "	* set the name of the application

	:param aName:
	:type aName: TCollection_ExtendedString &
	:rtype: None
") SetApplicationName;
		void SetApplicationName (const TCollection_ExtendedString & aName);
		%feature("autodoc", "	* get the name of the application

	:rtype: TCollection_ExtendedString
") ApplicationName;
		TCollection_ExtendedString ApplicationName ();
		%feature("autodoc", "	* set the data type

	:param aType:
	:type aType: TCollection_ExtendedString &
	:rtype: None
") SetDataType;
		void SetDataType (const TCollection_ExtendedString & aType);
		%feature("autodoc", "	* returns data type

	:rtype: TCollection_ExtendedString
") DataType;
		TCollection_ExtendedString DataType ();
		%feature("autodoc", "	* add <theUserInfo> to the user informations

	:param anInfo:
	:type anInfo: TCollection_AsciiString &
	:rtype: None
") AddToUserInfo;
		void AddToUserInfo (const TCollection_AsciiString & anInfo);
		%feature("autodoc", "	* return the user informations

	:rtype: TColStd_SequenceOfAsciiString
") UserInfo;
		const TColStd_SequenceOfAsciiString & UserInfo ();
		%feature("autodoc", "	* add <theUserInfo> to the user informations

	:param aComment:
	:type aComment: TCollection_ExtendedString &
	:rtype: None
") AddToComments;
		void AddToComments (const TCollection_ExtendedString & aComment);
		%feature("autodoc", "	* return the user informations

	:rtype: TColStd_SequenceOfExtendedString
") Comments;
		const TColStd_SequenceOfExtendedString & Comments ();
		%feature("autodoc", "	* the the number of persistent objects Return: the number of persistent objects readed

	:rtype: int
") NumberOfObjects;
		Standard_Integer NumberOfObjects ();
		%feature("autodoc", "	* Returns the number of root objects in this set of data. - When preparing a storage operation, the result is the number of roots inserted into this set of data with the function AddRoot. - When retrieving an object, the result is the number of roots stored in the read container. Use the Roots function to get these roots in a sequence.

	:rtype: int
") NumberOfRoots;
		Standard_Integer NumberOfRoots ();
		%feature("autodoc", "	* add a persistent root to write. the name of the root is a driver reference number.

	:param anObject:
	:type anObject: Handle_Standard_Persistent &
	:rtype: None
") AddRoot;
		void AddRoot (const Handle_Standard_Persistent & anObject);
		%feature("autodoc", "	* Adds the root anObject to this set of data. The name of the root is aName if given; if not, it will be a reference number assigned by the driver when writing the set of data into the container. When naming the roots, it is easier to retrieve objects by significant references rather than by references without any semantic values.

	:param aName:
	:type aName: TCollection_AsciiString &
	:param anObject:
	:type anObject: Handle_Standard_Persistent &
	:rtype: None
") AddRoot;
		void AddRoot (const TCollection_AsciiString & aName,const Handle_Standard_Persistent & anObject);
		%feature("autodoc", "	* Removes from this set of data the root object named aName. Warning Nothing is done if there is no root object whose name is aName in this set of data.

	:param aName:
	:type aName: TCollection_AsciiString &
	:rtype: None
") RemoveRoot;
		void RemoveRoot (const TCollection_AsciiString & aName);
		%feature("autodoc", "	* Returns the roots of this set of data in a sequence. - When preparing a storage operation, the sequence contains the roots inserted into this set of data with the function AddRoot. - When retrieving an object, the sequence contains the roots stored in the container read. - An empty sequence is returned if there is no root in this set of data.

	:rtype: Handle_Storage_HSeqOfRoot
") Roots;
		Handle_Storage_HSeqOfRoot Roots ();
		%feature("autodoc", "	* Gives the root object whose name is aName in this set of data. The returned object is a Storage_Root object, from which the object it encapsulates may be extracted. Warning A null handle is returned if there is no root object whose name is aName in this set of data.

	:param aName:
	:type aName: TCollection_AsciiString &
	:rtype: Handle_Storage_Root
") Find;
		Handle_Storage_Root Find (const TCollection_AsciiString & aName);
		%feature("autodoc", "	* returns Standard_True if <self> contains a root named <aName>

	:param aName:
	:type aName: TCollection_AsciiString &
	:rtype: bool
") IsRoot;
		Standard_Boolean IsRoot (const TCollection_AsciiString & aName);
		%feature("autodoc", "	* Returns the number of types of objects used in this set of data.

	:rtype: int
") NumberOfTypes;
		Standard_Integer NumberOfTypes ();
		%feature("autodoc", "	* Returns true if this set of data contains an object of type aName. Persistent objects from this set of data must have types which are recognized by the Storage_Schema algorithm used to store or retrieve them.

	:param aName:
	:type aName: TCollection_AsciiString &
	:rtype: bool
") IsType;
		Standard_Boolean IsType (const TCollection_AsciiString & aName);
		%feature("autodoc", "	* Gives the list of types of objects used in this set of data in a sequence.

	:rtype: Handle_TColStd_HSequenceOfAsciiString
") Types;
		Handle_TColStd_HSequenceOfAsciiString Types ();
};


%feature("shadow") Storage_Data::~Storage_Data %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_Data {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_Data {
	Handle_Storage_Data GetHandle() {
	return *(Handle_Storage_Data*) &$self;
	}
};

%nodefaultctor Handle_Storage_Data;
class Handle_Storage_Data : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_Data();
        Handle_Storage_Data(const Handle_Storage_Data &aHandle);
        Handle_Storage_Data(const Storage_Data *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_Data DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_Data {
    Storage_Data* GetObject() {
    return (Storage_Data*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_Data::~Handle_Storage_Data %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_Data {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_DataMapIteratorOfMapOfCallBack;
class Storage_DataMapIteratorOfMapOfCallBack : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_DataMapIteratorOfMapOfCallBack;
		 Storage_DataMapIteratorOfMapOfCallBack ();
		%feature("autodoc", "	:param aMap:
	:type aMap: Storage_MapOfCallBack &
	:rtype: None
") Storage_DataMapIteratorOfMapOfCallBack;
		 Storage_DataMapIteratorOfMapOfCallBack (const Storage_MapOfCallBack & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: Storage_MapOfCallBack &
	:rtype: None
") Initialize;
		void Initialize (const Storage_MapOfCallBack & aMap);
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		const TCollection_AsciiString & Key ();
		%feature("autodoc", "	:rtype: Handle_Storage_TypedCallBack
") Value;
		const Handle_Storage_TypedCallBack & Value ();
};


%feature("shadow") Storage_DataMapIteratorOfMapOfCallBack::~Storage_DataMapIteratorOfMapOfCallBack %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_DataMapIteratorOfMapOfCallBack {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_DataMapIteratorOfMapOfPers;
class Storage_DataMapIteratorOfMapOfPers : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_DataMapIteratorOfMapOfPers;
		 Storage_DataMapIteratorOfMapOfPers ();
		%feature("autodoc", "	:param aMap:
	:type aMap: Storage_MapOfPers &
	:rtype: None
") Storage_DataMapIteratorOfMapOfPers;
		 Storage_DataMapIteratorOfMapOfPers (const Storage_MapOfPers & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: Storage_MapOfPers &
	:rtype: None
") Initialize;
		void Initialize (const Storage_MapOfPers & aMap);
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		const TCollection_AsciiString & Key ();
		%feature("autodoc", "	:rtype: Handle_Storage_Root
") Value;
		const Handle_Storage_Root & Value ();
};


%feature("shadow") Storage_DataMapIteratorOfMapOfPers::~Storage_DataMapIteratorOfMapOfPers %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_DataMapIteratorOfMapOfPers {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_DataMapNodeOfMapOfCallBack;
class Storage_DataMapNodeOfMapOfCallBack : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: Handle_Storage_TypedCallBack &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Storage_DataMapNodeOfMapOfCallBack;
		 Storage_DataMapNodeOfMapOfCallBack (const TCollection_AsciiString & K,const Handle_Storage_TypedCallBack & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		TCollection_AsciiString & Key ();
		%feature("autodoc", "	:rtype: Handle_Storage_TypedCallBack
") Value;
		Handle_Storage_TypedCallBack & Value ();
};


%feature("shadow") Storage_DataMapNodeOfMapOfCallBack::~Storage_DataMapNodeOfMapOfCallBack %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_DataMapNodeOfMapOfCallBack {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_DataMapNodeOfMapOfCallBack {
	Handle_Storage_DataMapNodeOfMapOfCallBack GetHandle() {
	return *(Handle_Storage_DataMapNodeOfMapOfCallBack*) &$self;
	}
};

%nodefaultctor Handle_Storage_DataMapNodeOfMapOfCallBack;
class Handle_Storage_DataMapNodeOfMapOfCallBack : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Storage_DataMapNodeOfMapOfCallBack();
        Handle_Storage_DataMapNodeOfMapOfCallBack(const Handle_Storage_DataMapNodeOfMapOfCallBack &aHandle);
        Handle_Storage_DataMapNodeOfMapOfCallBack(const Storage_DataMapNodeOfMapOfCallBack *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_DataMapNodeOfMapOfCallBack DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_DataMapNodeOfMapOfCallBack {
    Storage_DataMapNodeOfMapOfCallBack* GetObject() {
    return (Storage_DataMapNodeOfMapOfCallBack*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_DataMapNodeOfMapOfCallBack::~Handle_Storage_DataMapNodeOfMapOfCallBack %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_DataMapNodeOfMapOfCallBack {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_DataMapNodeOfMapOfPers;
class Storage_DataMapNodeOfMapOfPers : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: Handle_Storage_Root &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Storage_DataMapNodeOfMapOfPers;
		 Storage_DataMapNodeOfMapOfPers (const TCollection_AsciiString & K,const Handle_Storage_Root & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		TCollection_AsciiString & Key ();
		%feature("autodoc", "	:rtype: Handle_Storage_Root
") Value;
		Handle_Storage_Root & Value ();
};


%feature("shadow") Storage_DataMapNodeOfMapOfPers::~Storage_DataMapNodeOfMapOfPers %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_DataMapNodeOfMapOfPers {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_DataMapNodeOfMapOfPers {
	Handle_Storage_DataMapNodeOfMapOfPers GetHandle() {
	return *(Handle_Storage_DataMapNodeOfMapOfPers*) &$self;
	}
};

%nodefaultctor Handle_Storage_DataMapNodeOfMapOfPers;
class Handle_Storage_DataMapNodeOfMapOfPers : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Storage_DataMapNodeOfMapOfPers();
        Handle_Storage_DataMapNodeOfMapOfPers(const Handle_Storage_DataMapNodeOfMapOfPers &aHandle);
        Handle_Storage_DataMapNodeOfMapOfPers(const Storage_DataMapNodeOfMapOfPers *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_DataMapNodeOfMapOfPers DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_DataMapNodeOfMapOfPers {
    Storage_DataMapNodeOfMapOfPers* GetObject() {
    return (Storage_DataMapNodeOfMapOfPers*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_DataMapNodeOfMapOfPers::~Handle_Storage_DataMapNodeOfMapOfPers %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_DataMapNodeOfMapOfPers {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_HArrayOfCallBack;
class Storage_HArrayOfCallBack : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Storage_HArrayOfCallBack;
		 Storage_HArrayOfCallBack (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Handle_Storage_CallBack &
	:rtype: None
") Storage_HArrayOfCallBack;
		 Storage_HArrayOfCallBack (const Standard_Integer Low,const Standard_Integer Up,const Handle_Storage_CallBack & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Storage_CallBack &
	:rtype: None
") Init;
		void Init (const Handle_Storage_CallBack & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Storage_CallBack &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Storage_CallBack & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Storage_CallBack
") Value;
		const Handle_Storage_CallBack & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Storage_CallBack
") ChangeValue;
		Handle_Storage_CallBack & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Storage_ArrayOfCallBack
") Array1;
		const Storage_ArrayOfCallBack & Array1 ();
		%feature("autodoc", "	:rtype: Storage_ArrayOfCallBack
") ChangeArray1;
		Storage_ArrayOfCallBack & ChangeArray1 ();
};


%feature("shadow") Storage_HArrayOfCallBack::~Storage_HArrayOfCallBack %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_HArrayOfCallBack {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_HArrayOfCallBack {
	Handle_Storage_HArrayOfCallBack GetHandle() {
	return *(Handle_Storage_HArrayOfCallBack*) &$self;
	}
};

%nodefaultctor Handle_Storage_HArrayOfCallBack;
class Handle_Storage_HArrayOfCallBack : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_HArrayOfCallBack();
        Handle_Storage_HArrayOfCallBack(const Handle_Storage_HArrayOfCallBack &aHandle);
        Handle_Storage_HArrayOfCallBack(const Storage_HArrayOfCallBack *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_HArrayOfCallBack DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_HArrayOfCallBack {
    Storage_HArrayOfCallBack* GetObject() {
    return (Storage_HArrayOfCallBack*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_HArrayOfCallBack::~Handle_Storage_HArrayOfCallBack %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_HArrayOfCallBack {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_HArrayOfSchema;
class Storage_HArrayOfSchema : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Storage_HArrayOfSchema;
		 Storage_HArrayOfSchema (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Handle_Storage_Schema &
	:rtype: None
") Storage_HArrayOfSchema;
		 Storage_HArrayOfSchema (const Standard_Integer Low,const Standard_Integer Up,const Handle_Storage_Schema & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Storage_Schema &
	:rtype: None
") Init;
		void Init (const Handle_Storage_Schema & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Storage_Schema &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Storage_Schema & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Storage_Schema
") Value;
		const Handle_Storage_Schema & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Storage_Schema
") ChangeValue;
		Handle_Storage_Schema & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Storage_ArrayOfSchema
") Array1;
		const Storage_ArrayOfSchema & Array1 ();
		%feature("autodoc", "	:rtype: Storage_ArrayOfSchema
") ChangeArray1;
		Storage_ArrayOfSchema & ChangeArray1 ();
};


%feature("shadow") Storage_HArrayOfSchema::~Storage_HArrayOfSchema %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_HArrayOfSchema {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_HArrayOfSchema {
	Handle_Storage_HArrayOfSchema GetHandle() {
	return *(Handle_Storage_HArrayOfSchema*) &$self;
	}
};

%nodefaultctor Handle_Storage_HArrayOfSchema;
class Handle_Storage_HArrayOfSchema : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_HArrayOfSchema();
        Handle_Storage_HArrayOfSchema(const Handle_Storage_HArrayOfSchema &aHandle);
        Handle_Storage_HArrayOfSchema(const Storage_HArrayOfSchema *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_HArrayOfSchema DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_HArrayOfSchema {
    Storage_HArrayOfSchema* GetObject() {
    return (Storage_HArrayOfSchema*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_HArrayOfSchema::~Handle_Storage_HArrayOfSchema %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_HArrayOfSchema {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_HPArray;
class Storage_HPArray : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Storage_HPArray;
		 Storage_HPArray (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Handle_Standard_Persistent &
	:rtype: None
") Storage_HPArray;
		 Storage_HPArray (const Standard_Integer Low,const Standard_Integer Up,const Handle_Standard_Persistent & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Standard_Persistent &
	:rtype: None
") Init;
		void Init (const Handle_Standard_Persistent & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Standard_Persistent &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Standard_Persistent & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Standard_Persistent
") Value;
		const Handle_Standard_Persistent & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Standard_Persistent
") ChangeValue;
		Handle_Standard_Persistent & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Storage_PArray
") Array1;
		const Storage_PArray & Array1 ();
		%feature("autodoc", "	:rtype: Storage_PArray
") ChangeArray1;
		Storage_PArray & ChangeArray1 ();
};


%feature("shadow") Storage_HPArray::~Storage_HPArray %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_HPArray {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_HPArray {
	Handle_Storage_HPArray GetHandle() {
	return *(Handle_Storage_HPArray*) &$self;
	}
};

%nodefaultctor Handle_Storage_HPArray;
class Handle_Storage_HPArray : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_HPArray();
        Handle_Storage_HPArray(const Handle_Storage_HPArray &aHandle);
        Handle_Storage_HPArray(const Storage_HPArray *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_HPArray DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_HPArray {
    Storage_HPArray* GetObject() {
    return (Storage_HPArray*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_HPArray::~Handle_Storage_HPArray %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_HPArray {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_HSeqOfCallBack;
class Storage_HSeqOfCallBack : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_HSeqOfCallBack;
		 Storage_HSeqOfCallBack ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Storage_CallBack &
	:rtype: None
") Append;
		void Append (const Handle_Storage_CallBack & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Storage_HSeqOfCallBack &
	:rtype: None
") Append;
		void Append (const Handle_Storage_HSeqOfCallBack & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Storage_CallBack &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Storage_CallBack & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Storage_HSeqOfCallBack &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Storage_HSeqOfCallBack & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Storage_CallBack &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Storage_CallBack & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Storage_HSeqOfCallBack &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Storage_HSeqOfCallBack & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Storage_CallBack &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Storage_CallBack & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Storage_HSeqOfCallBack &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Storage_HSeqOfCallBack & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Storage_HSeqOfCallBack
") Split;
		Handle_Storage_HSeqOfCallBack Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Storage_CallBack &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Storage_CallBack & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Storage_CallBack
") Value;
		const Handle_Storage_CallBack & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Storage_CallBack
") ChangeValue;
		Handle_Storage_CallBack & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: Storage_SeqOfCallBack
") Sequence;
		const Storage_SeqOfCallBack & Sequence ();
		%feature("autodoc", "	:rtype: Storage_SeqOfCallBack
") ChangeSequence;
		Storage_SeqOfCallBack & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Storage_HSeqOfCallBack
") ShallowCopy;
		Handle_Storage_HSeqOfCallBack ShallowCopy ();
};


%feature("shadow") Storage_HSeqOfCallBack::~Storage_HSeqOfCallBack %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_HSeqOfCallBack {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_HSeqOfCallBack {
	Handle_Storage_HSeqOfCallBack GetHandle() {
	return *(Handle_Storage_HSeqOfCallBack*) &$self;
	}
};

%nodefaultctor Handle_Storage_HSeqOfCallBack;
class Handle_Storage_HSeqOfCallBack : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_HSeqOfCallBack();
        Handle_Storage_HSeqOfCallBack(const Handle_Storage_HSeqOfCallBack &aHandle);
        Handle_Storage_HSeqOfCallBack(const Storage_HSeqOfCallBack *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_HSeqOfCallBack DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_HSeqOfCallBack {
    Storage_HSeqOfCallBack* GetObject() {
    return (Storage_HSeqOfCallBack*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_HSeqOfCallBack::~Handle_Storage_HSeqOfCallBack %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_HSeqOfCallBack {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_HSeqOfPersistent;
class Storage_HSeqOfPersistent : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_HSeqOfPersistent;
		 Storage_HSeqOfPersistent ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Standard_Persistent &
	:rtype: None
") Append;
		void Append (const Handle_Standard_Persistent & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Storage_HSeqOfPersistent &
	:rtype: None
") Append;
		void Append (const Handle_Storage_HSeqOfPersistent & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Standard_Persistent &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Standard_Persistent & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Storage_HSeqOfPersistent &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Storage_HSeqOfPersistent & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Standard_Persistent &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Standard_Persistent & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Storage_HSeqOfPersistent &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Storage_HSeqOfPersistent & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Standard_Persistent &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Standard_Persistent & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Storage_HSeqOfPersistent &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Storage_HSeqOfPersistent & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Storage_HSeqOfPersistent
") Split;
		Handle_Storage_HSeqOfPersistent Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Standard_Persistent &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Standard_Persistent & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Standard_Persistent
") Value;
		const Handle_Standard_Persistent & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Standard_Persistent
") ChangeValue;
		Handle_Standard_Persistent & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: Storage_SeqOfPersistent
") Sequence;
		const Storage_SeqOfPersistent & Sequence ();
		%feature("autodoc", "	:rtype: Storage_SeqOfPersistent
") ChangeSequence;
		Storage_SeqOfPersistent & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Storage_HSeqOfPersistent
") ShallowCopy;
		Handle_Storage_HSeqOfPersistent ShallowCopy ();
};


%feature("shadow") Storage_HSeqOfPersistent::~Storage_HSeqOfPersistent %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_HSeqOfPersistent {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_HSeqOfPersistent {
	Handle_Storage_HSeqOfPersistent GetHandle() {
	return *(Handle_Storage_HSeqOfPersistent*) &$self;
	}
};

%nodefaultctor Handle_Storage_HSeqOfPersistent;
class Handle_Storage_HSeqOfPersistent : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_HSeqOfPersistent();
        Handle_Storage_HSeqOfPersistent(const Handle_Storage_HSeqOfPersistent &aHandle);
        Handle_Storage_HSeqOfPersistent(const Storage_HSeqOfPersistent *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_HSeqOfPersistent DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_HSeqOfPersistent {
    Storage_HSeqOfPersistent* GetObject() {
    return (Storage_HSeqOfPersistent*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_HSeqOfPersistent::~Handle_Storage_HSeqOfPersistent %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_HSeqOfPersistent {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_HSeqOfRoot;
class Storage_HSeqOfRoot : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_HSeqOfRoot;
		 Storage_HSeqOfRoot ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Storage_Root &
	:rtype: None
") Append;
		void Append (const Handle_Storage_Root & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Storage_HSeqOfRoot &
	:rtype: None
") Append;
		void Append (const Handle_Storage_HSeqOfRoot & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Storage_Root &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Storage_Root & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Storage_HSeqOfRoot &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Storage_HSeqOfRoot & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Storage_Root &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Storage_Root & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Storage_HSeqOfRoot &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Storage_HSeqOfRoot & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Storage_Root &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Storage_Root & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Storage_HSeqOfRoot &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Storage_HSeqOfRoot & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Storage_HSeqOfRoot
") Split;
		Handle_Storage_HSeqOfRoot Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Storage_Root &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Storage_Root & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Storage_Root
") Value;
		const Handle_Storage_Root & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Storage_Root
") ChangeValue;
		Handle_Storage_Root & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: Storage_SeqOfRoot
") Sequence;
		const Storage_SeqOfRoot & Sequence ();
		%feature("autodoc", "	:rtype: Storage_SeqOfRoot
") ChangeSequence;
		Storage_SeqOfRoot & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Storage_HSeqOfRoot
") ShallowCopy;
		Handle_Storage_HSeqOfRoot ShallowCopy ();
};


%feature("shadow") Storage_HSeqOfRoot::~Storage_HSeqOfRoot %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_HSeqOfRoot {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_HSeqOfRoot {
	Handle_Storage_HSeqOfRoot GetHandle() {
	return *(Handle_Storage_HSeqOfRoot*) &$self;
	}
};

%nodefaultctor Handle_Storage_HSeqOfRoot;
class Handle_Storage_HSeqOfRoot : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_HSeqOfRoot();
        Handle_Storage_HSeqOfRoot(const Handle_Storage_HSeqOfRoot &aHandle);
        Handle_Storage_HSeqOfRoot(const Storage_HSeqOfRoot *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_HSeqOfRoot DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_HSeqOfRoot {
    Storage_HSeqOfRoot* GetObject() {
    return (Storage_HSeqOfRoot*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_HSeqOfRoot::~Handle_Storage_HSeqOfRoot %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_HSeqOfRoot {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_HeaderData;
class Storage_HeaderData : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_HeaderData;
		 Storage_HeaderData ();
		%feature("autodoc", "	* return the creation date

	:rtype: TCollection_AsciiString
") CreationDate;
		TCollection_AsciiString CreationDate ();
		%feature("autodoc", "	* return the Storage package version

	:rtype: TCollection_AsciiString
") StorageVersion;
		TCollection_AsciiString StorageVersion ();
		%feature("autodoc", "	* get the version of the schema

	:rtype: TCollection_AsciiString
") SchemaVersion;
		TCollection_AsciiString SchemaVersion ();
		%feature("autodoc", "	* get the schema's name

	:rtype: TCollection_AsciiString
") SchemaName;
		TCollection_AsciiString SchemaName ();
		%feature("autodoc", "	* set the version of the application

	:param aVersion:
	:type aVersion: TCollection_AsciiString &
	:rtype: None
") SetApplicationVersion;
		void SetApplicationVersion (const TCollection_AsciiString & aVersion);
		%feature("autodoc", "	* get the version of the application

	:rtype: TCollection_AsciiString
") ApplicationVersion;
		TCollection_AsciiString ApplicationVersion ();
		%feature("autodoc", "	* set the name of the application

	:param aName:
	:type aName: TCollection_ExtendedString &
	:rtype: None
") SetApplicationName;
		void SetApplicationName (const TCollection_ExtendedString & aName);
		%feature("autodoc", "	* get the name of the application

	:rtype: TCollection_ExtendedString
") ApplicationName;
		TCollection_ExtendedString ApplicationName ();
		%feature("autodoc", "	* set the data type

	:param aType:
	:type aType: TCollection_ExtendedString &
	:rtype: None
") SetDataType;
		void SetDataType (const TCollection_ExtendedString & aType);
		%feature("autodoc", "	* returns data type

	:rtype: TCollection_ExtendedString
") DataType;
		TCollection_ExtendedString DataType ();
		%feature("autodoc", "	* add <theUserInfo> to the user informations

	:param theUserInfo:
	:type theUserInfo: TCollection_AsciiString &
	:rtype: None
") AddToUserInfo;
		void AddToUserInfo (const TCollection_AsciiString & theUserInfo);
		%feature("autodoc", "	* return the user informations

	:rtype: TColStd_SequenceOfAsciiString
") UserInfo;
		const TColStd_SequenceOfAsciiString & UserInfo ();
		%feature("autodoc", "	* add <theUserInfo> to the user informations

	:param aComment:
	:type aComment: TCollection_ExtendedString &
	:rtype: None
") AddToComments;
		void AddToComments (const TCollection_ExtendedString & aComment);
		%feature("autodoc", "	* return the user informations

	:rtype: TColStd_SequenceOfExtendedString
") Comments;
		const TColStd_SequenceOfExtendedString & Comments ();
		%feature("autodoc", "	* the the number of persistent objects Return: the number of persistent objects readed

	:rtype: int
") NumberOfObjects;
		Standard_Integer NumberOfObjects ();
		%feature("autodoc", "	:rtype: Storage_Error
") ErrorStatus;
		Storage_Error ErrorStatus ();
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") ErrorStatusExtension;
		TCollection_AsciiString ErrorStatusExtension ();
		%feature("autodoc", "	:rtype: None
") ClearErrorStatus;
		void ClearErrorStatus ();
};


%feature("shadow") Storage_HeaderData::~Storage_HeaderData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_HeaderData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_HeaderData {
	Handle_Storage_HeaderData GetHandle() {
	return *(Handle_Storage_HeaderData*) &$self;
	}
};

%nodefaultctor Handle_Storage_HeaderData;
class Handle_Storage_HeaderData : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_HeaderData();
        Handle_Storage_HeaderData(const Handle_Storage_HeaderData &aHandle);
        Handle_Storage_HeaderData(const Storage_HeaderData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_HeaderData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_HeaderData {
    Storage_HeaderData* GetObject() {
    return (Storage_HeaderData*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_HeaderData::~Handle_Storage_HeaderData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_HeaderData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_IndexedDataMapNodeOfPType;
class Storage_IndexedDataMapNodeOfPType : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K1:
	:type K1: TCollection_AsciiString &
	:param K2:
	:type K2: Standard_Integer
	:param I:
	:type I: Standard_Integer &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") Storage_IndexedDataMapNodeOfPType;
		 Storage_IndexedDataMapNodeOfPType (const TCollection_AsciiString & K1,const Standard_Integer K2,const Standard_Integer & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key1;
		TCollection_AsciiString & Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetValue() {
                return (Standard_Integer) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Integer value ) {
                $self->Value()=value;
                }
            };
            };


%feature("shadow") Storage_IndexedDataMapNodeOfPType::~Storage_IndexedDataMapNodeOfPType %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_IndexedDataMapNodeOfPType {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_IndexedDataMapNodeOfPType {
	Handle_Storage_IndexedDataMapNodeOfPType GetHandle() {
	return *(Handle_Storage_IndexedDataMapNodeOfPType*) &$self;
	}
};

%nodefaultctor Handle_Storage_IndexedDataMapNodeOfPType;
class Handle_Storage_IndexedDataMapNodeOfPType : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Storage_IndexedDataMapNodeOfPType();
        Handle_Storage_IndexedDataMapNodeOfPType(const Handle_Storage_IndexedDataMapNodeOfPType &aHandle);
        Handle_Storage_IndexedDataMapNodeOfPType(const Storage_IndexedDataMapNodeOfPType *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_IndexedDataMapNodeOfPType DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_IndexedDataMapNodeOfPType {
    Storage_IndexedDataMapNodeOfPType* GetObject() {
    return (Storage_IndexedDataMapNodeOfPType*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_IndexedDataMapNodeOfPType::~Handle_Storage_IndexedDataMapNodeOfPType %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_IndexedDataMapNodeOfPType {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_InternalData;
class Storage_InternalData : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_InternalData;
		 Storage_InternalData ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
};


%feature("shadow") Storage_InternalData::~Storage_InternalData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_InternalData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_InternalData {
	Handle_Storage_InternalData GetHandle() {
	return *(Handle_Storage_InternalData*) &$self;
	}
};

%nodefaultctor Handle_Storage_InternalData;
class Handle_Storage_InternalData : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_InternalData();
        Handle_Storage_InternalData(const Handle_Storage_InternalData &aHandle);
        Handle_Storage_InternalData(const Storage_InternalData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_InternalData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_InternalData {
    Storage_InternalData* GetObject() {
    return (Storage_InternalData*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_InternalData::~Handle_Storage_InternalData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_InternalData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_MapOfCallBack;
class Storage_MapOfCallBack : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") Storage_MapOfCallBack;
		 Storage_MapOfCallBack (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: Storage_MapOfCallBack &
	:rtype: Storage_MapOfCallBack
") Assign;
		Storage_MapOfCallBack & Assign (const Storage_MapOfCallBack & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Storage_MapOfCallBack &
	:rtype: Storage_MapOfCallBack
") operator=;
		Storage_MapOfCallBack & operator = (const Storage_MapOfCallBack & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: Handle_Storage_TypedCallBack &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TCollection_AsciiString & K,const Handle_Storage_TypedCallBack & I);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Handle_Storage_TypedCallBack
") Find;
		const Handle_Storage_TypedCallBack & Find (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Handle_Storage_TypedCallBack
") ChangeFind;
		Handle_Storage_TypedCallBack & ChangeFind (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TCollection_AsciiString & K);
};


%feature("shadow") Storage_MapOfCallBack::~Storage_MapOfCallBack %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_MapOfCallBack {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_MapOfPers;
class Storage_MapOfPers : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") Storage_MapOfPers;
		 Storage_MapOfPers (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: Storage_MapOfPers &
	:rtype: Storage_MapOfPers
") Assign;
		Storage_MapOfPers & Assign (const Storage_MapOfPers & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Storage_MapOfPers &
	:rtype: Storage_MapOfPers
") operator=;
		Storage_MapOfPers & operator = (const Storage_MapOfPers & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: Handle_Storage_Root &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TCollection_AsciiString & K,const Handle_Storage_Root & I);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Handle_Storage_Root
") Find;
		const Handle_Storage_Root & Find (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Handle_Storage_Root
") ChangeFind;
		Handle_Storage_Root & ChangeFind (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TCollection_AsciiString & K);
};


%feature("shadow") Storage_MapOfPers::~Storage_MapOfPers %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_MapOfPers {
	void _kill_pointed() {
		delete $self;
	}
};
class Storage_MapPSDHasher {
	public:
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Persistent &
	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const Handle_Standard_Persistent & K,const Standard_Integer Upper);
		%feature("autodoc", "	:param K1:
	:type K1: Handle_Standard_Persistent &
	:param K2:
	:type K2: Handle_Standard_Persistent &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Handle_Standard_Persistent & K1,const Handle_Standard_Persistent & K2);
};


%feature("shadow") Storage_MapPSDHasher::~Storage_MapPSDHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_MapPSDHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_PArray;
class Storage_PArray {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Storage_PArray;
		 Storage_PArray (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Standard_Persistent &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Storage_PArray;
		 Storage_PArray (const Handle_Standard_Persistent & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_Standard_Persistent &
	:rtype: None
") Init;
		void Init (const Handle_Standard_Persistent & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Storage_PArray &
	:rtype: Storage_PArray
") Assign;
		const Storage_PArray & Assign (const Storage_PArray & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Storage_PArray &
	:rtype: Storage_PArray
") operator=;
		const Storage_PArray & operator = (const Storage_PArray & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Standard_Persistent &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Standard_Persistent & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Standard_Persistent
") Value;
		const Handle_Standard_Persistent & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Standard_Persistent
") ChangeValue;
		Handle_Standard_Persistent & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Storage_PArray::~Storage_PArray %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_PArray {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_PType;
class Storage_PType : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") Storage_PType;
		 Storage_PType (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: Storage_PType &
	:rtype: Storage_PType
") Assign;
		Storage_PType & Assign (const Storage_PType & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Storage_PType &
	:rtype: Storage_PType
") operator=;
		Storage_PType & operator = (const Storage_PType & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: Standard_Integer &
	:rtype: int
") Add;
		Standard_Integer Add (const TCollection_AsciiString & K,const Standard_Integer & I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: TCollection_AsciiString &
	:param T:
	:type T: Standard_Integer &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TCollection_AsciiString & K,const Standard_Integer & T);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TCollection_AsciiString
") FindKey;
		const TCollection_AsciiString & FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: int
") FindFromIndex;
		const Standard_Integer & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: int
") ChangeFromIndex;
		Standard_Integer & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: int
") FindFromKey;
		const Standard_Integer & FindFromKey (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: int
") ChangeFromKey;
		Standard_Integer & ChangeFromKey (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TCollection_AsciiString & K);
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TCollection_AsciiString & K);
};


%feature("shadow") Storage_PType::~Storage_PType %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_PType {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_Root;
class Storage_Root : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_Root;
		 Storage_Root ();
		%feature("autodoc", "	:param aName:
	:type aName: TCollection_AsciiString &
	:param anObject:
	:type anObject: Handle_Standard_Persistent &
	:rtype: None
") Storage_Root;
		 Storage_Root (const TCollection_AsciiString & aName,const Handle_Standard_Persistent & anObject);
		%feature("autodoc", "	:param aName:
	:type aName: TCollection_AsciiString &
	:rtype: None
") SetName;
		void SetName (const TCollection_AsciiString & aName);
		%feature("autodoc", "	* Returns the name of this root object. The name may have been given explicitly when the root was inserted into the Storage_Data object. If not, the name is a reference number which was assigned automatically by the driver when writing the set of data into the container. When naming the roots, it is easier to retrieve objects by significant references rather than by references without any semantic values. Warning The returned string will be empty if you call this function before having named this root object, either explicitly, or when writing the set of data into the container.

	:rtype: TCollection_AsciiString
") Name;
		TCollection_AsciiString Name ();
		%feature("autodoc", "	:param anObject:
	:type anObject: Handle_Standard_Persistent &
	:rtype: None
") SetObject;
		void SetObject (const Handle_Standard_Persistent & anObject);
		%feature("autodoc", "	* Returns the persistent object encapsulated by this root.

	:rtype: Handle_Standard_Persistent
") Object;
		Handle_Standard_Persistent Object ();
		%feature("autodoc", "	* Returns the name of this root type.

	:rtype: TCollection_AsciiString
") Type;
		TCollection_AsciiString Type ();
};


%feature("shadow") Storage_Root::~Storage_Root %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_Root {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_Root {
	Handle_Storage_Root GetHandle() {
	return *(Handle_Storage_Root*) &$self;
	}
};

%nodefaultctor Handle_Storage_Root;
class Handle_Storage_Root : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_Root();
        Handle_Storage_Root(const Handle_Storage_Root &aHandle);
        Handle_Storage_Root(const Storage_Root *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_Root DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_Root {
    Storage_Root* GetObject() {
    return (Storage_Root*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_Root::~Handle_Storage_Root %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_Root {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_RootData;
class Storage_RootData : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_RootData;
		 Storage_RootData ();
		%feature("autodoc", "	* returns the number of roots.

	:rtype: int
") NumberOfRoots;
		Standard_Integer NumberOfRoots ();
		%feature("autodoc", "	* add a root to <self>. If a root with same name is present, it will be replaced by <aRoot>.

	:param aRoot:
	:type aRoot: Handle_Storage_Root &
	:rtype: None
") AddRoot;
		void AddRoot (const Handle_Storage_Root & aRoot);
		%feature("autodoc", "	:rtype: Handle_Storage_HSeqOfRoot
") Roots;
		Handle_Storage_HSeqOfRoot Roots ();
		%feature("autodoc", "	* find a root with name <aName>.

	:param aName:
	:type aName: TCollection_AsciiString &
	:rtype: Handle_Storage_Root
") Find;
		Handle_Storage_Root Find (const TCollection_AsciiString & aName);
		%feature("autodoc", "	* returns Standard_True if <self> contains a root named <aName>

	:param aName:
	:type aName: TCollection_AsciiString &
	:rtype: bool
") IsRoot;
		Standard_Boolean IsRoot (const TCollection_AsciiString & aName);
		%feature("autodoc", "	* remove the root named <aName>.

	:param aName:
	:type aName: TCollection_AsciiString &
	:rtype: None
") RemoveRoot;
		void RemoveRoot (const TCollection_AsciiString & aName);
		%feature("autodoc", "	:rtype: Storage_Error
") ErrorStatus;
		Storage_Error ErrorStatus ();
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") ErrorStatusExtension;
		TCollection_AsciiString ErrorStatusExtension ();
		%feature("autodoc", "	:rtype: None
") ClearErrorStatus;
		void ClearErrorStatus ();
};


%feature("shadow") Storage_RootData::~Storage_RootData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_RootData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_RootData {
	Handle_Storage_RootData GetHandle() {
	return *(Handle_Storage_RootData*) &$self;
	}
};

%nodefaultctor Handle_Storage_RootData;
class Handle_Storage_RootData : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_RootData();
        Handle_Storage_RootData(const Handle_Storage_RootData &aHandle);
        Handle_Storage_RootData(const Storage_RootData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_RootData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_RootData {
    Storage_RootData* GetObject() {
    return (Storage_RootData*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_RootData::~Handle_Storage_RootData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_RootData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_Schema;
class Storage_Schema : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Builds a storage/retrieval algorithm based on a given data schema. Example For example, if ShapeSchema is the class inheriting from Storage_Schema and containing the description of your application data schema, you create a storage/retrieval algorithm as follows: Handle_ShapeSchema s = new ShapeSchema; -------- -- USER API -- -------------------------------------------------------------- -------- --

	:rtype: None
") Storage_Schema;
		 Storage_Schema ();
		%feature("autodoc", "	* returns version of the schema

	:param aVersion:
	:type aVersion: TCollection_AsciiString &
	:rtype: None
") SetVersion;
		void SetVersion (const TCollection_AsciiString & aVersion);
		%feature("autodoc", "	* returns the version of the schema

	:rtype: TCollection_AsciiString
") Version;
		TCollection_AsciiString Version ();
		%feature("autodoc", "	* set the schema's name

	:param aSchemaName:
	:type aSchemaName: TCollection_AsciiString &
	:rtype: None
") SetName;
		void SetName (const TCollection_AsciiString & aSchemaName);
		%feature("autodoc", "	* returns the schema's name

	:rtype: TCollection_AsciiString
") Name;
		TCollection_AsciiString Name ();
		%feature("autodoc", "	* Writes the data aggregated in aData into the container defined by the driver s. The storage operation is performed according to the data schema with which this algorithm is working. Note: aData may aggregate several root objects to be stored together.

	:param s:
	:type s: Storage_BaseDriver &
	:param aData:
	:type aData: Handle_Storage_Data &
	:rtype: None
") Write;
		void Write (Storage_BaseDriver & s,const Handle_Storage_Data & aData);
		%feature("autodoc", "	* Returns the data read from the container defined by the driver s. The retrieval operation is performed according to the data schema with which this algorithm is working. These data are aggregated in a Storage_Data object which may be browsed in order to extract the root objects from the container.

	:param s:
	:type s: Storage_BaseDriver &
	:rtype: Handle_Storage_Data
") Read;
		Handle_Storage_Data Read (Storage_BaseDriver & s);
		%feature("autodoc", "	* read the header part of the stream Arguments: s: driver to read

	:param s:
	:type s: Storage_BaseDriver &
	:rtype: Handle_Storage_HeaderData
") ReadHeaderSection;
		Handle_Storage_HeaderData ReadHeaderSection (Storage_BaseDriver & s);
		%feature("autodoc", "	* fill the TypeData with the names of the type used in a stream Arguments: s: driver to read

	:param s:
	:type s: Storage_BaseDriver &
	:rtype: Handle_Storage_TypeData
") ReadTypeSection;
		Handle_Storage_TypeData ReadTypeSection (Storage_BaseDriver & s);
		%feature("autodoc", "	* read root part of the file Arguments: s: driver to read

	:param s:
	:type s: Storage_BaseDriver &
	:rtype: Handle_Storage_RootData
") ReadRootSection;
		Handle_Storage_RootData ReadRootSection (Storage_BaseDriver & s);
		%feature("autodoc", "	* returns the known types of a schema

	:rtype: TColStd_SequenceOfAsciiString
") SchemaKnownTypes;
		virtual const TColStd_SequenceOfAsciiString & SchemaKnownTypes ();
		%feature("autodoc", "	* indicates whether the are types in the driver which are not known from the schema and for which no callbacks have been set. The unknown types can be read in <theUnknownTypes>.

	:param aDriver:
	:type aDriver: Storage_BaseDriver &
	:param theUnknownTypes:
	:type theUnknownTypes: TColStd_SequenceOfAsciiString &
	:rtype: bool
") HasUnknownType;
		Standard_Boolean HasUnknownType (Storage_BaseDriver & aDriver,TColStd_SequenceOfAsciiString & theUnknownTypes);
		%feature("autodoc", "	* returns the all known types of a schema and their nested schemes.

	:rtype: Handle_TColStd_HSequenceOfAsciiString
") GetAllSchemaKnownTypes;
		Handle_TColStd_HSequenceOfAsciiString GetAllSchemaKnownTypes ();
		%feature("autodoc", "	:param theSchemas:
	:type theSchemas: Handle_Storage_HArrayOfSchema &
	:rtype: None
") SetNestedSchemas;
		void SetNestedSchemas (const Handle_Storage_HArrayOfSchema & theSchemas);
		%feature("autodoc", "	:rtype: None
") ClearNestedSchemas;
		void ClearNestedSchemas ();
		%feature("autodoc", "	:rtype: Handle_Storage_HArrayOfSchema
") NestedSchemas;
		Handle_Storage_HArrayOfSchema NestedSchemas ();
		%feature("autodoc", "	* return a current date string

	:rtype: TCollection_AsciiString
") ICreationDate;
		static TCollection_AsciiString ICreationDate ();
		%feature("autodoc", "	* returns True if theType migration is identified the callback support provides a way to read a file with a incomplete schema. ex. : A file contains 3 types a,b and c. The application's schema contains only 2 type a and b. If you try to read the file in the application, you will have an error.To bypass this problem you can give to your application's schema a callback used when the schema dosent know how to handle this type.

	:param theTypeName:
	:type theTypeName: TCollection_AsciiString &
	:param theNewName:
	:type theNewName: TCollection_AsciiString &
	:rtype: bool
") CheckTypeMigration;
		static Standard_Boolean CheckTypeMigration (const TCollection_AsciiString & theTypeName,TCollection_AsciiString & theNewName);
		%feature("autodoc", "	* add two functions to the callback list

	:param aTypeName:
	:type aTypeName: TCollection_AsciiString &
	:param aCallBack:
	:type aCallBack: Handle_Storage_CallBack &
	:rtype: None
") AddReadUnknownTypeCallBack;
		void AddReadUnknownTypeCallBack (const TCollection_AsciiString & aTypeName,const Handle_Storage_CallBack & aCallBack);
		%feature("autodoc", "	* remove a callback for a type

	:param aTypeName:
	:type aTypeName: TCollection_AsciiString &
	:rtype: None
") RemoveReadUnknownTypeCallBack;
		void RemoveReadUnknownTypeCallBack (const TCollection_AsciiString & aTypeName);
		%feature("autodoc", "	* returns a list of type name with installed callback.

	:rtype: Handle_TColStd_HSequenceOfAsciiString
") InstalledCallBackList;
		Handle_TColStd_HSequenceOfAsciiString InstalledCallBackList ();
		%feature("autodoc", "	* clear all callback from schema instance.

	:rtype: None
") ClearCallBackList;
		void ClearCallBackList ();
		%feature("autodoc", "	* install a callback for all unknown type. the objects with unknown types will be skipped. (look SkipObject method in BaseDriver)

	:rtype: None
") UseDefaultCallBack;
		void UseDefaultCallBack ();
		%feature("autodoc", "	* tells schema to uninstall the default callback.

	:rtype: None
") DontUseDefaultCallBack;
		void DontUseDefaultCallBack ();
		%feature("autodoc", "	* ask if the schema is using the default callback.

	:rtype: bool
") IsUsingDefaultCallBack;
		Standard_Boolean IsUsingDefaultCallBack ();
		%feature("autodoc", "	* overload the default function for build.(use to set an error message or skip an object while reading an unknown type).

	:param f:
	:type f: Handle_Storage_CallBack &
	:rtype: None
") SetDefaultCallBack;
		void SetDefaultCallBack (const Handle_Storage_CallBack & f);
		%feature("autodoc", "	* reset the default function defined by Storage package.

	:rtype: None
") ResetDefaultCallBack;
		void ResetDefaultCallBack ();
		%feature("autodoc", "	* returns the read function used when the UseDefaultCallBack() is set.

	:rtype: Handle_Storage_CallBack
") DefaultCallBack;
		Handle_Storage_CallBack DefaultCallBack ();
		%feature("autodoc", "	:param tName:
	:type tName: TCollection_AsciiString &
	:rtype: Handle_Storage_CallBack
") CallBackSelection;
		virtual Handle_Storage_CallBack CallBackSelection (const TCollection_AsciiString & tName);
		%feature("autodoc", "	:param sp:
	:type sp: Handle_Standard_Persistent &
	:rtype: Handle_Storage_CallBack
") AddTypeSelection;
		virtual Handle_Storage_CallBack AddTypeSelection (const Handle_Standard_Persistent & sp);
		%feature("autodoc", "	:param sp:
	:type sp: Handle_Standard_Persistent &
	:param s:
	:type s: Storage_BaseDriver &
	:rtype: None
") WritePersistentObjectHeader;
		void WritePersistentObjectHeader (const Handle_Standard_Persistent & sp,Storage_BaseDriver & s);
		%feature("autodoc", "	:param s:
	:type s: Storage_BaseDriver &
	:rtype: None
") ReadPersistentObjectHeader;
		void ReadPersistentObjectHeader (Storage_BaseDriver & s);
		%feature("autodoc", "	:param sp:
	:type sp: Handle_Standard_Persistent &
	:param s:
	:type s: Storage_BaseDriver &
	:rtype: None
") WritePersistentReference;
		void WritePersistentReference (const Handle_Standard_Persistent & sp,Storage_BaseDriver & s);
		%feature("autodoc", "	:param sp:
	:type sp: Handle_Standard_Persistent &
	:param s:
	:type s: Storage_BaseDriver &
	:rtype: None
") ReadPersistentReference;
		void ReadPersistentReference (Handle_Standard_Persistent & sp,Storage_BaseDriver & s);
		%feature("autodoc", "	:param sp:
	:type sp: Handle_Standard_Persistent &
	:param tName:
	:type tName: char *
	:rtype: bool
") AddPersistent;
		Standard_Boolean AddPersistent (const Handle_Standard_Persistent & sp,const char * tName);
		%feature("autodoc", "	:param sp:
	:type sp: Handle_Standard_Persistent &
	:rtype: bool
") PersistentToAdd;
		Standard_Boolean PersistentToAdd (const Handle_Standard_Persistent & sp);
};


%feature("shadow") Storage_Schema::~Storage_Schema %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_Schema {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_Schema {
	Handle_Storage_Schema GetHandle() {
	return *(Handle_Storage_Schema*) &$self;
	}
};

%nodefaultctor Handle_Storage_Schema;
class Handle_Storage_Schema : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_Schema();
        Handle_Storage_Schema(const Handle_Storage_Schema &aHandle);
        Handle_Storage_Schema(const Storage_Schema *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_Schema DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_Schema {
    Storage_Schema* GetObject() {
    return (Storage_Schema*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_Schema::~Handle_Storage_Schema %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_Schema {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_SeqOfCallBack;
class Storage_SeqOfCallBack : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_SeqOfCallBack;
		 Storage_SeqOfCallBack ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Storage_SeqOfCallBack &
	:rtype: Storage_SeqOfCallBack
") Assign;
		const Storage_SeqOfCallBack & Assign (const Storage_SeqOfCallBack & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Storage_SeqOfCallBack &
	:rtype: Storage_SeqOfCallBack
") operator=;
		const Storage_SeqOfCallBack & operator = (const Storage_SeqOfCallBack & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Storage_CallBack &
	:rtype: None
") Append;
		void Append (const Handle_Storage_CallBack & T);
		%feature("autodoc", "	:param S:
	:type S: Storage_SeqOfCallBack &
	:rtype: None
") Append;
		void Append (Storage_SeqOfCallBack & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Storage_CallBack &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Storage_CallBack & T);
		%feature("autodoc", "	:param S:
	:type S: Storage_SeqOfCallBack &
	:rtype: None
") Prepend;
		void Prepend (Storage_SeqOfCallBack & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Storage_CallBack &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Storage_CallBack & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Storage_SeqOfCallBack &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Storage_SeqOfCallBack & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Storage_CallBack &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Storage_CallBack & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Storage_SeqOfCallBack &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Storage_SeqOfCallBack & S);
		%feature("autodoc", "	:rtype: Handle_Storage_CallBack
") First;
		const Handle_Storage_CallBack & First ();
		%feature("autodoc", "	:rtype: Handle_Storage_CallBack
") Last;
		const Handle_Storage_CallBack & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Storage_SeqOfCallBack &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Storage_SeqOfCallBack & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Storage_CallBack
") Value;
		const Handle_Storage_CallBack & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Storage_CallBack &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Storage_CallBack & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Storage_CallBack
") ChangeValue;
		Handle_Storage_CallBack & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Storage_SeqOfCallBack::~Storage_SeqOfCallBack %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_SeqOfCallBack {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_SeqOfPersistent;
class Storage_SeqOfPersistent : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_SeqOfPersistent;
		 Storage_SeqOfPersistent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Storage_SeqOfPersistent &
	:rtype: Storage_SeqOfPersistent
") Assign;
		const Storage_SeqOfPersistent & Assign (const Storage_SeqOfPersistent & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Storage_SeqOfPersistent &
	:rtype: Storage_SeqOfPersistent
") operator=;
		const Storage_SeqOfPersistent & operator = (const Storage_SeqOfPersistent & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Standard_Persistent &
	:rtype: None
") Append;
		void Append (const Handle_Standard_Persistent & T);
		%feature("autodoc", "	:param S:
	:type S: Storage_SeqOfPersistent &
	:rtype: None
") Append;
		void Append (Storage_SeqOfPersistent & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Standard_Persistent &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Standard_Persistent & T);
		%feature("autodoc", "	:param S:
	:type S: Storage_SeqOfPersistent &
	:rtype: None
") Prepend;
		void Prepend (Storage_SeqOfPersistent & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Standard_Persistent &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Standard_Persistent & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Storage_SeqOfPersistent &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Storage_SeqOfPersistent & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Standard_Persistent &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Standard_Persistent & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Storage_SeqOfPersistent &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Storage_SeqOfPersistent & S);
		%feature("autodoc", "	:rtype: Handle_Standard_Persistent
") First;
		const Handle_Standard_Persistent & First ();
		%feature("autodoc", "	:rtype: Handle_Standard_Persistent
") Last;
		const Handle_Standard_Persistent & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Storage_SeqOfPersistent &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Storage_SeqOfPersistent & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Standard_Persistent
") Value;
		const Handle_Standard_Persistent & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Standard_Persistent &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Standard_Persistent & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Standard_Persistent
") ChangeValue;
		Handle_Standard_Persistent & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Storage_SeqOfPersistent::~Storage_SeqOfPersistent %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_SeqOfPersistent {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_SeqOfRoot;
class Storage_SeqOfRoot : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_SeqOfRoot;
		 Storage_SeqOfRoot ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Storage_SeqOfRoot &
	:rtype: Storage_SeqOfRoot
") Assign;
		const Storage_SeqOfRoot & Assign (const Storage_SeqOfRoot & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Storage_SeqOfRoot &
	:rtype: Storage_SeqOfRoot
") operator=;
		const Storage_SeqOfRoot & operator = (const Storage_SeqOfRoot & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Storage_Root &
	:rtype: None
") Append;
		void Append (const Handle_Storage_Root & T);
		%feature("autodoc", "	:param S:
	:type S: Storage_SeqOfRoot &
	:rtype: None
") Append;
		void Append (Storage_SeqOfRoot & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Storage_Root &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Storage_Root & T);
		%feature("autodoc", "	:param S:
	:type S: Storage_SeqOfRoot &
	:rtype: None
") Prepend;
		void Prepend (Storage_SeqOfRoot & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Storage_Root &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Storage_Root & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Storage_SeqOfRoot &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Storage_SeqOfRoot & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Storage_Root &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Storage_Root & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Storage_SeqOfRoot &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Storage_SeqOfRoot & S);
		%feature("autodoc", "	:rtype: Handle_Storage_Root
") First;
		const Handle_Storage_Root & First ();
		%feature("autodoc", "	:rtype: Handle_Storage_Root
") Last;
		const Handle_Storage_Root & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Storage_SeqOfRoot &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Storage_SeqOfRoot & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Storage_Root
") Value;
		const Handle_Storage_Root & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Storage_Root &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Storage_Root & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Storage_Root
") ChangeValue;
		Handle_Storage_Root & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Storage_SeqOfRoot::~Storage_SeqOfRoot %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_SeqOfRoot {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_SequenceNodeOfSeqOfCallBack;
class Storage_SequenceNodeOfSeqOfCallBack : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Storage_CallBack &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Storage_SequenceNodeOfSeqOfCallBack;
		 Storage_SequenceNodeOfSeqOfCallBack (const Handle_Storage_CallBack & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Storage_CallBack
") Value;
		Handle_Storage_CallBack & Value ();
};


%feature("shadow") Storage_SequenceNodeOfSeqOfCallBack::~Storage_SequenceNodeOfSeqOfCallBack %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_SequenceNodeOfSeqOfCallBack {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_SequenceNodeOfSeqOfCallBack {
	Handle_Storage_SequenceNodeOfSeqOfCallBack GetHandle() {
	return *(Handle_Storage_SequenceNodeOfSeqOfCallBack*) &$self;
	}
};

%nodefaultctor Handle_Storage_SequenceNodeOfSeqOfCallBack;
class Handle_Storage_SequenceNodeOfSeqOfCallBack : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Storage_SequenceNodeOfSeqOfCallBack();
        Handle_Storage_SequenceNodeOfSeqOfCallBack(const Handle_Storage_SequenceNodeOfSeqOfCallBack &aHandle);
        Handle_Storage_SequenceNodeOfSeqOfCallBack(const Storage_SequenceNodeOfSeqOfCallBack *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_SequenceNodeOfSeqOfCallBack DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_SequenceNodeOfSeqOfCallBack {
    Storage_SequenceNodeOfSeqOfCallBack* GetObject() {
    return (Storage_SequenceNodeOfSeqOfCallBack*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_SequenceNodeOfSeqOfCallBack::~Handle_Storage_SequenceNodeOfSeqOfCallBack %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_SequenceNodeOfSeqOfCallBack {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_SequenceNodeOfSeqOfPersistent;
class Storage_SequenceNodeOfSeqOfPersistent : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Standard_Persistent &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Storage_SequenceNodeOfSeqOfPersistent;
		 Storage_SequenceNodeOfSeqOfPersistent (const Handle_Standard_Persistent & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Standard_Persistent
") Value;
		Handle_Standard_Persistent & Value ();
};


%feature("shadow") Storage_SequenceNodeOfSeqOfPersistent::~Storage_SequenceNodeOfSeqOfPersistent %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_SequenceNodeOfSeqOfPersistent {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_SequenceNodeOfSeqOfPersistent {
	Handle_Storage_SequenceNodeOfSeqOfPersistent GetHandle() {
	return *(Handle_Storage_SequenceNodeOfSeqOfPersistent*) &$self;
	}
};

%nodefaultctor Handle_Storage_SequenceNodeOfSeqOfPersistent;
class Handle_Storage_SequenceNodeOfSeqOfPersistent : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Storage_SequenceNodeOfSeqOfPersistent();
        Handle_Storage_SequenceNodeOfSeqOfPersistent(const Handle_Storage_SequenceNodeOfSeqOfPersistent &aHandle);
        Handle_Storage_SequenceNodeOfSeqOfPersistent(const Storage_SequenceNodeOfSeqOfPersistent *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_SequenceNodeOfSeqOfPersistent DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_SequenceNodeOfSeqOfPersistent {
    Storage_SequenceNodeOfSeqOfPersistent* GetObject() {
    return (Storage_SequenceNodeOfSeqOfPersistent*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_SequenceNodeOfSeqOfPersistent::~Handle_Storage_SequenceNodeOfSeqOfPersistent %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_SequenceNodeOfSeqOfPersistent {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_SequenceNodeOfSeqOfRoot;
class Storage_SequenceNodeOfSeqOfRoot : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Storage_Root &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Storage_SequenceNodeOfSeqOfRoot;
		 Storage_SequenceNodeOfSeqOfRoot (const Handle_Storage_Root & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Storage_Root
") Value;
		Handle_Storage_Root & Value ();
};


%feature("shadow") Storage_SequenceNodeOfSeqOfRoot::~Storage_SequenceNodeOfSeqOfRoot %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_SequenceNodeOfSeqOfRoot {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_SequenceNodeOfSeqOfRoot {
	Handle_Storage_SequenceNodeOfSeqOfRoot GetHandle() {
	return *(Handle_Storage_SequenceNodeOfSeqOfRoot*) &$self;
	}
};

%nodefaultctor Handle_Storage_SequenceNodeOfSeqOfRoot;
class Handle_Storage_SequenceNodeOfSeqOfRoot : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Storage_SequenceNodeOfSeqOfRoot();
        Handle_Storage_SequenceNodeOfSeqOfRoot(const Handle_Storage_SequenceNodeOfSeqOfRoot &aHandle);
        Handle_Storage_SequenceNodeOfSeqOfRoot(const Storage_SequenceNodeOfSeqOfRoot *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_SequenceNodeOfSeqOfRoot DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_SequenceNodeOfSeqOfRoot {
    Storage_SequenceNodeOfSeqOfRoot* GetObject() {
    return (Storage_SequenceNodeOfSeqOfRoot*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_SequenceNodeOfSeqOfRoot::~Handle_Storage_SequenceNodeOfSeqOfRoot %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_SequenceNodeOfSeqOfRoot {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_TypeData;
class Storage_TypeData : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_TypeData;
		 Storage_TypeData ();
		%feature("autodoc", "	:rtype: int
") NumberOfTypes;
		Standard_Integer NumberOfTypes ();
		%feature("autodoc", "	:param aName:
	:type aName: TCollection_AsciiString &
	:rtype: bool
") IsType;
		Standard_Boolean IsType (const TCollection_AsciiString & aName);
		%feature("autodoc", "	:rtype: Handle_TColStd_HSequenceOfAsciiString
") Types;
		Handle_TColStd_HSequenceOfAsciiString Types ();
		%feature("autodoc", "	:rtype: Storage_Error
") ErrorStatus;
		Storage_Error ErrorStatus ();
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") ErrorStatusExtension;
		TCollection_AsciiString ErrorStatusExtension ();
		%feature("autodoc", "	:rtype: None
") ClearErrorStatus;
		void ClearErrorStatus ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
};


%feature("shadow") Storage_TypeData::~Storage_TypeData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_TypeData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_TypeData {
	Handle_Storage_TypeData GetHandle() {
	return *(Handle_Storage_TypeData*) &$self;
	}
};

%nodefaultctor Handle_Storage_TypeData;
class Handle_Storage_TypeData : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_TypeData();
        Handle_Storage_TypeData(const Handle_Storage_TypeData &aHandle);
        Handle_Storage_TypeData(const Storage_TypeData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_TypeData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_TypeData {
    Storage_TypeData* GetObject() {
    return (Storage_TypeData*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_TypeData::~Handle_Storage_TypeData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_TypeData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_TypedCallBack;
class Storage_TypedCallBack : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_TypedCallBack;
		 Storage_TypedCallBack ();
		%feature("autodoc", "	:param aTypeName:
	:type aTypeName: TCollection_AsciiString &
	:param aCallBack:
	:type aCallBack: Handle_Storage_CallBack &
	:rtype: None
") Storage_TypedCallBack;
		 Storage_TypedCallBack (const TCollection_AsciiString & aTypeName,const Handle_Storage_CallBack & aCallBack);
		%feature("autodoc", "	:param aType:
	:type aType: TCollection_AsciiString &
	:rtype: None
") SetType;
		void SetType (const TCollection_AsciiString & aType);
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Type;
		TCollection_AsciiString Type ();
		%feature("autodoc", "	:param aCallBack:
	:type aCallBack: Handle_Storage_CallBack &
	:rtype: None
") SetCallBack;
		void SetCallBack (const Handle_Storage_CallBack & aCallBack);
		%feature("autodoc", "	:rtype: Handle_Storage_CallBack
") CallBack;
		Handle_Storage_CallBack CallBack ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer anIndex);
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
};


%feature("shadow") Storage_TypedCallBack::~Storage_TypedCallBack %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_TypedCallBack {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_TypedCallBack {
	Handle_Storage_TypedCallBack GetHandle() {
	return *(Handle_Storage_TypedCallBack*) &$self;
	}
};

%nodefaultctor Handle_Storage_TypedCallBack;
class Handle_Storage_TypedCallBack : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Storage_TypedCallBack();
        Handle_Storage_TypedCallBack(const Handle_Storage_TypedCallBack &aHandle);
        Handle_Storage_TypedCallBack(const Storage_TypedCallBack *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_TypedCallBack DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_TypedCallBack {
    Storage_TypedCallBack* GetObject() {
    return (Storage_TypedCallBack*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_TypedCallBack::~Handle_Storage_TypedCallBack %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_TypedCallBack {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Storage_stCONSTclCOM;
class Storage_stCONSTclCOM {
	public:
};


%feature("shadow") Storage_stCONSTclCOM::~Storage_stCONSTclCOM %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_stCONSTclCOM {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Storage_DefaultCallBack;
class Storage_DefaultCallBack : public Storage_CallBack {
	public:
		%feature("autodoc", "	:rtype: None
") Storage_DefaultCallBack;
		 Storage_DefaultCallBack ();
		%feature("autodoc", "	:rtype: Handle_Standard_Persistent
") New;
		Handle_Standard_Persistent New ();
		%feature("autodoc", "	:param aPers:
	:type aPers: Handle_Standard_Persistent &
	:param aSchema:
	:type aSchema: Handle_Storage_Schema &
	:rtype: None
") Add;
		void Add (const Handle_Standard_Persistent & aPers,const Handle_Storage_Schema & aSchema);
		%feature("autodoc", "	:param aPers:
	:type aPers: Handle_Standard_Persistent &
	:param aDriver:
	:type aDriver: Storage_BaseDriver &
	:param aSchema:
	:type aSchema: Handle_Storage_Schema &
	:rtype: None
") Write;
		void Write (const Handle_Standard_Persistent & aPers,Storage_BaseDriver & aDriver,const Handle_Storage_Schema & aSchema);
		%feature("autodoc", "	:param aPers:
	:type aPers: Handle_Standard_Persistent &
	:param aDriver:
	:type aDriver: Storage_BaseDriver &
	:param aSchema:
	:type aSchema: Handle_Storage_Schema &
	:rtype: None
") Read;
		void Read (const Handle_Standard_Persistent & aPers,Storage_BaseDriver & aDriver,const Handle_Storage_Schema & aSchema);
};


%feature("shadow") Storage_DefaultCallBack::~Storage_DefaultCallBack %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Storage_DefaultCallBack {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Storage_DefaultCallBack {
	Handle_Storage_DefaultCallBack GetHandle() {
	return *(Handle_Storage_DefaultCallBack*) &$self;
	}
};

%nodefaultctor Handle_Storage_DefaultCallBack;
class Handle_Storage_DefaultCallBack : public Handle_Storage_CallBack {

    public:
        // constructors
        Handle_Storage_DefaultCallBack();
        Handle_Storage_DefaultCallBack(const Handle_Storage_DefaultCallBack &aHandle);
        Handle_Storage_DefaultCallBack(const Storage_DefaultCallBack *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Storage_DefaultCallBack DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Storage_DefaultCallBack {
    Storage_DefaultCallBack* GetObject() {
    return (Storage_DefaultCallBack*)$self->Access();
    }
};
%feature("shadow") Handle_Storage_DefaultCallBack::~Handle_Storage_DefaultCallBack %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Storage_DefaultCallBack {
    void _kill_pointed() {
        delete $self;
    }
};

