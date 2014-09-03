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
%include ../common/StandardDefines.i
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
%nodefaultctor Storage;
class Storage {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	static TCollection_AsciiString

returns the version of Storage's read/write routines") Version;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Storage_ArrayOfCallBack;
		 Storage_ArrayOfCallBack (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Storage_CallBack)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Storage_ArrayOfCallBack;
		 Storage_ArrayOfCallBack (const Handle_Storage_CallBack & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Storage_CallBack & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(Storage_ArrayOfCallBack)

Returns:
	Storage_ArrayOfCallBack

No detailed docstring for this function.") Assign;
		const Storage_ArrayOfCallBack & Assign (const Storage_ArrayOfCallBack & Other);
		%feature("autodoc", "Args:
	Other(Storage_ArrayOfCallBack)

Returns:
	Storage_ArrayOfCallBack

No detailed docstring for this function.") operator=;
		const Storage_ArrayOfCallBack & operator = (const Storage_ArrayOfCallBack & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Storage_CallBack & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Storage_CallBack

No detailed docstring for this function.") Value;
		const Handle_Storage_CallBack & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Storage_CallBack

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Storage_ArrayOfSchema;
		 Storage_ArrayOfSchema (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Storage_Schema)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Storage_ArrayOfSchema;
		 Storage_ArrayOfSchema (const Handle_Storage_Schema & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Storage_Schema)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Storage_Schema & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(Storage_ArrayOfSchema)

Returns:
	Storage_ArrayOfSchema

No detailed docstring for this function.") Assign;
		const Storage_ArrayOfSchema & Assign (const Storage_ArrayOfSchema & Other);
		%feature("autodoc", "Args:
	Other(Storage_ArrayOfSchema)

Returns:
	Storage_ArrayOfSchema

No detailed docstring for this function.") operator=;
		const Storage_ArrayOfSchema & operator = (const Storage_ArrayOfSchema & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Storage_Schema)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Storage_Schema & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Storage_Schema

No detailed docstring for this function.") Value;
		const Handle_Storage_Schema & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Storage_Schema

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Delete;
		void Delete ();
		%feature("autodoc", "Args:
	aName(TCollection_AsciiString)
	aMode(Storage_OpenMode)

Returns:
	virtual Storage_Error

No detailed docstring for this function.") Open;
		virtual Storage_Error Open (const TCollection_AsciiString & aName,const Storage_OpenMode aMode);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Name;
		TCollection_AsciiString Name ();
		%feature("autodoc", "Args:
	None
Returns:
	Storage_OpenMode

No detailed docstring for this function.") OpenMode;
		Storage_OpenMode OpenMode ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

returns True if we are at end of the stream") IsEnd;
		virtual Standard_Boolean IsEnd ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Position

return position in the file. Return -1 upon error.") Tell;
		virtual Storage_Position Tell ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") BeginWriteInfoSection;
		virtual Storage_Error BeginWriteInfoSection ();
		%feature("autodoc", "Args:
	nbObj(Standard_Integer)
	dbVersion(TCollection_AsciiString)
	date(TCollection_AsciiString)
	schemaName(TCollection_AsciiString)
	schemaVersion(TCollection_AsciiString)
	appName(TCollection_ExtendedString)
	appVersion(TCollection_AsciiString)
	objectType(TCollection_ExtendedString)
	userInfo(TColStd_SequenceOfAsciiString)

Returns:
	virtual void

No detailed docstring for this function.") WriteInfo;
		virtual void WriteInfo (const Standard_Integer nbObj,const TCollection_AsciiString & dbVersion,const TCollection_AsciiString & date,const TCollection_AsciiString & schemaName,const TCollection_AsciiString & schemaVersion,const TCollection_ExtendedString & appName,const TCollection_AsciiString & appVersion,const TCollection_ExtendedString & objectType,const TColStd_SequenceOfAsciiString & userInfo);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") EndWriteInfoSection;
		virtual Storage_Error EndWriteInfoSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") BeginReadInfoSection;
		virtual Storage_Error BeginReadInfoSection ();
		%feature("autodoc", "Args:
	nbObj(Standard_Integer)
	dbVersion(TCollection_AsciiString)
	date(TCollection_AsciiString)
	schemaName(TCollection_AsciiString)
	schemaVersion(TCollection_AsciiString)
	appName(TCollection_ExtendedString)
	appVersion(TCollection_AsciiString)
	objectType(TCollection_ExtendedString)
	userInfo(TColStd_SequenceOfAsciiString)

Returns:
	virtual void

No detailed docstring for this function.") ReadInfo;
		virtual void ReadInfo (Standard_Integer &OutValue,TCollection_AsciiString & dbVersion,TCollection_AsciiString & date,TCollection_AsciiString & schemaName,TCollection_AsciiString & schemaVersion,TCollection_ExtendedString & appName,TCollection_AsciiString & appVersion,TCollection_ExtendedString & objectType,TColStd_SequenceOfAsciiString & userInfo);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") EndReadInfoSection;
		virtual Storage_Error EndReadInfoSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") BeginWriteCommentSection;
		virtual Storage_Error BeginWriteCommentSection ();
		%feature("autodoc", "Args:
	userComments(TColStd_SequenceOfExtendedString)

Returns:
	virtual void

No detailed docstring for this function.") WriteComment;
		virtual void WriteComment (const TColStd_SequenceOfExtendedString & userComments);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") EndWriteCommentSection;
		virtual Storage_Error EndWriteCommentSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") BeginReadCommentSection;
		virtual Storage_Error BeginReadCommentSection ();
		%feature("autodoc", "Args:
	userComments(TColStd_SequenceOfExtendedString)

Returns:
	virtual void

No detailed docstring for this function.") ReadComment;
		virtual void ReadComment (TColStd_SequenceOfExtendedString & userComments);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") EndReadCommentSection;
		virtual Storage_Error EndReadCommentSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") BeginWriteTypeSection;
		virtual Storage_Error BeginWriteTypeSection ();
		%feature("autodoc", "Args:
	aSize(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") SetTypeSectionSize;
		virtual void SetTypeSectionSize (const Standard_Integer aSize);
		%feature("autodoc", "Args:
	typeNum(Standard_Integer)
	typeName(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") WriteTypeInformations;
		virtual void WriteTypeInformations (const Standard_Integer typeNum,const TCollection_AsciiString & typeName);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") EndWriteTypeSection;
		virtual Storage_Error EndWriteTypeSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") BeginReadTypeSection;
		virtual Storage_Error BeginReadTypeSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") TypeSectionSize;
		virtual Standard_Integer TypeSectionSize ();
		%feature("autodoc", "Args:
	typeNum(Standard_Integer)
	typeName(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") ReadTypeInformations;
		virtual void ReadTypeInformations (Standard_Integer &OutValue,TCollection_AsciiString & typeName);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") EndReadTypeSection;
		virtual Storage_Error EndReadTypeSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") BeginWriteRootSection;
		virtual Storage_Error BeginWriteRootSection ();
		%feature("autodoc", "Args:
	aSize(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") SetRootSectionSize;
		virtual void SetRootSectionSize (const Standard_Integer aSize);
		%feature("autodoc", "Args:
	rootName(TCollection_AsciiString)
	aRef(Standard_Integer)
	aType(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") WriteRoot;
		virtual void WriteRoot (const TCollection_AsciiString & rootName,const Standard_Integer aRef,const TCollection_AsciiString & aType);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") EndWriteRootSection;
		virtual Storage_Error EndWriteRootSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") BeginReadRootSection;
		virtual Storage_Error BeginReadRootSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") RootSectionSize;
		virtual Standard_Integer RootSectionSize ();
		%feature("autodoc", "Args:
	rootName(TCollection_AsciiString)
	aRef(Standard_Integer)
	aType(TCollection_AsciiString)

Returns:
	virtual void

No detailed docstring for this function.") ReadRoot;
		virtual void ReadRoot (TCollection_AsciiString & rootName,Standard_Integer &OutValue,TCollection_AsciiString & aType);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") EndReadRootSection;
		virtual Storage_Error EndReadRootSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") BeginWriteRefSection;
		virtual Storage_Error BeginWriteRefSection ();
		%feature("autodoc", "Args:
	aSize(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") SetRefSectionSize;
		virtual void SetRefSectionSize (const Standard_Integer aSize);
		%feature("autodoc", "Args:
	reference(Standard_Integer)
	typeNum(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") WriteReferenceType;
		virtual void WriteReferenceType (const Standard_Integer reference,const Standard_Integer typeNum);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") EndWriteRefSection;
		virtual Storage_Error EndWriteRefSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") BeginReadRefSection;
		virtual Storage_Error BeginReadRefSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") RefSectionSize;
		virtual Standard_Integer RefSectionSize ();
		%feature("autodoc", "Args:
	reference(Standard_Integer)
	typeNum(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") ReadReferenceType;
		virtual void ReadReferenceType (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") EndReadRefSection;
		virtual Storage_Error EndReadRefSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") BeginWriteDataSection;
		virtual Storage_Error BeginWriteDataSection ();
		%feature("autodoc", "Args:
	aRef(Standard_Integer)
	aType(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") WritePersistentObjectHeader;
		virtual void WritePersistentObjectHeader (const Standard_Integer aRef,const Standard_Integer aType);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") BeginWritePersistentObjectData;
		virtual void BeginWritePersistentObjectData ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") BeginWriteObjectData;
		virtual void BeginWriteObjectData ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") EndWriteObjectData;
		virtual void EndWriteObjectData ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") EndWritePersistentObjectData;
		virtual void EndWritePersistentObjectData ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") EndWriteDataSection;
		virtual Storage_Error EndWriteDataSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") BeginReadDataSection;
		virtual Storage_Error BeginReadDataSection ();
		%feature("autodoc", "Args:
	aRef(Standard_Integer)
	aType(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") ReadPersistentObjectHeader;
		virtual void ReadPersistentObjectHeader (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") BeginReadPersistentObjectData;
		virtual void BeginReadPersistentObjectData ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") BeginReadObjectData;
		virtual void BeginReadObjectData ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") EndReadObjectData;
		virtual void EndReadObjectData ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") EndReadPersistentObjectData;
		virtual void EndReadPersistentObjectData ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") EndReadDataSection;
		virtual Storage_Error EndReadDataSection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") SkipObject;
		virtual void SkipObject ();
		%feature("autodoc", "Args:
	aValue(Standard_Integer)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") PutReference;
		virtual Storage_BaseDriver & PutReference (const Standard_Integer aValue);
		%feature("autodoc", "Args:
	aValue(Standard_Character)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") PutCharacter;
		virtual Storage_BaseDriver & PutCharacter (const Standard_Character aValue);
		%feature("autodoc", "Args:
	aValue(Standard_ExtCharacter)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") PutExtCharacter;
		virtual Storage_BaseDriver & PutExtCharacter (const Standard_ExtCharacter aValue);
		%feature("autodoc", "Args:
	aValue(Standard_Integer)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") PutInteger;
		virtual Storage_BaseDriver & PutInteger (const Standard_Integer aValue);
		%feature("autodoc", "Args:
	aValue(Standard_Boolean)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") PutBoolean;
		virtual Storage_BaseDriver & PutBoolean (const Standard_Boolean aValue);
		%feature("autodoc", "Args:
	aValue(Standard_Real)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") PutReal;
		virtual Storage_BaseDriver & PutReal (const Standard_Real aValue);
		%feature("autodoc", "Args:
	aValue(Standard_ShortReal)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") PutShortReal;
		virtual Storage_BaseDriver & PutShortReal (const Standard_ShortReal aValue);
		%feature("autodoc", "Args:
	aValue(Standard_Integer)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") GetReference;
		virtual Storage_BaseDriver & GetReference (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	aValue(Standard_Character)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") GetCharacter;
		virtual Storage_BaseDriver & GetCharacter (Standard_Character & aValue);
		%feature("autodoc", "Args:
	aValue(Standard_Character)

Returns:
	Storage_BaseDriver

No detailed docstring for this function.") operator>>;
		Storage_BaseDriver & operator >> (Standard_Character & aValue);
		%feature("autodoc", "Args:
	aValue(Standard_ExtCharacter)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") GetExtCharacter;
		virtual Storage_BaseDriver & GetExtCharacter (Standard_ExtCharacter & aValue);
		%feature("autodoc", "Args:
	aValue(Standard_ExtCharacter)

Returns:
	Storage_BaseDriver

No detailed docstring for this function.") operator>>;
		Storage_BaseDriver & operator >> (Standard_ExtCharacter & aValue);
		%feature("autodoc", "Args:
	aValue(Standard_Integer)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") GetInteger;
		virtual Storage_BaseDriver & GetInteger (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	aValue(Standard_Integer)

Returns:
	Storage_BaseDriver

No detailed docstring for this function.") operator>>;
		Storage_BaseDriver & operator >> (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	aValue(Standard_Boolean)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") GetBoolean;
		virtual Storage_BaseDriver & GetBoolean (Standard_Boolean & aValue);
		%feature("autodoc", "Args:
	aValue(Standard_Boolean)

Returns:
	Storage_BaseDriver

No detailed docstring for this function.") operator>>;
		Storage_BaseDriver & operator >> (Standard_Boolean & aValue);
		%feature("autodoc", "Args:
	aValue(Standard_Real)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") GetReal;
		virtual Storage_BaseDriver & GetReal (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aValue(Standard_Real)

Returns:
	Storage_BaseDriver

No detailed docstring for this function.") operator>>;
		Storage_BaseDriver & operator >> (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aValue(Standard_ShortReal)

Returns:
	virtual Storage_BaseDriver

No detailed docstring for this function.") GetShortReal;
		virtual Storage_BaseDriver & GetShortReal (Standard_ShortReal & aValue);
		%feature("autodoc", "Args:
	aValue(Standard_ShortReal)

Returns:
	Storage_BaseDriver

No detailed docstring for this function.") operator>>;
		Storage_BaseDriver & operator >> (Standard_ShortReal & aValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Storage_Error

No detailed docstring for this function.") Close;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_Bucket;
		 Storage_Bucket ();
		%feature("autodoc", "Args:
	theSpaceSize(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Storage_Bucket;
		 Storage_Bucket (const Standard_Integer theSpaceSize);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
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
		%feature("autodoc", "Args:
	(Storage_BucketOfPersistent *)

Returns:
	None

No detailed docstring for this function.") Storage_BucketIterator;
		 Storage_BucketIterator (Storage_BucketOfPersistent * );
		%feature("autodoc", "Args:
	(Storage_BucketOfPersistent *)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (Storage_BucketOfPersistent * );
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Persistent *

No detailed docstring for this function.") Value;
		Standard_Persistent * Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
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
		%feature("autodoc", "Args:
	theBucketSize(Standard_Integer)=300000
	theBucketNumber(Standard_Integer)=100

Returns:
	None

No detailed docstring for this function.") Storage_BucketOfPersistent;
		 Storage_BucketOfPersistent (const Standard_Integer theBucketSize = 300000,const Standard_Integer theBucketNumber = 100);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	sp(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Standard_Persistent & sp);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Persistent *

No detailed docstring for this function.") Value;
		Standard_Persistent * Value (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
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
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Standard_Persistent

No detailed docstring for this function.") New;
		virtual Handle_Standard_Persistent New ();
		%feature("autodoc", "Args:
	aPers(Handle_Standard_Persistent)
	aSchema(Handle_Storage_Schema)

Returns:
	virtual void

No detailed docstring for this function.") Add;
		virtual void Add (const Handle_Standard_Persistent & aPers,const Handle_Storage_Schema & aSchema);
		%feature("autodoc", "Args:
	aPers(Handle_Standard_Persistent)
	aDriver(Storage_BaseDriver)
	aSchema(Handle_Storage_Schema)

Returns:
	virtual void

No detailed docstring for this function.") Write;
		virtual void Write (const Handle_Standard_Persistent & aPers,Storage_BaseDriver & aDriver,const Handle_Storage_Schema & aSchema);
		%feature("autodoc", "Args:
	aPers(Handle_Standard_Persistent)
	aDriver(Storage_BaseDriver)
	aSchema(Handle_Storage_Schema)

Returns:
	virtual void

No detailed docstring for this function.") Read;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty set of data.  
You explicitly create a Storage_Data object  
when preparing the set of objects to be stored  
together in a container (for example, in a file).  
Then use the function AddRoot to add  
persistent objects to the set of data.  
A Storage_Data object is also returned by the  
Read function of a Storage_Schema  
storage/retrieval algorithm. Use the functions  
NumberOfRoots and Roots to find the roots  
which were stored in the read container.") Storage_Data;
		 Storage_Data ();
		%feature("autodoc", "Args:
	None
Returns:
	Storage_Error

Returns Storage_VSOk if  
-   the last storage operation performed with the  
  function Read, or  
-   the last retrieval operation performed with the function Write  
 by a Storage_Schema algorithm, on this set of data was successful.  
If the storage or retrieval operation was not  
performed, the returned error status indicates the  
reason why the operation failed. The algorithm  
stops its analysis at the first detected error") ErrorStatus;
		Storage_Error ErrorStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the error status positioned either by:  
-   the last storage operation performed with the  
  Read function, or  
-   the last retrieval operation performed with the Write function  
  by a Storage_Schema algorithm, on this set of data.  
This error status may be read by the function ErrorStatus.") ClearErrorStatus;
		void ClearErrorStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") ErrorStatusExtension;
		TCollection_AsciiString ErrorStatusExtension ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

return the creation date") CreationDate;
		TCollection_AsciiString CreationDate ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

return the Storage package version") StorageVersion;
		TCollection_AsciiString StorageVersion ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

get the version of the schema") SchemaVersion;
		TCollection_AsciiString SchemaVersion ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

get the schema's name") SchemaName;
		TCollection_AsciiString SchemaName ();
		%feature("autodoc", "Args:
	aVersion(TCollection_AsciiString)

Returns:
	None

set the version of the application") SetApplicationVersion;
		void SetApplicationVersion (const TCollection_AsciiString & aVersion);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

get the version of the application") ApplicationVersion;
		TCollection_AsciiString ApplicationVersion ();
		%feature("autodoc", "Args:
	aName(TCollection_ExtendedString)

Returns:
	None

set the name of the application") SetApplicationName;
		void SetApplicationName (const TCollection_ExtendedString & aName);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_ExtendedString

get the name of the application") ApplicationName;
		TCollection_ExtendedString ApplicationName ();
		%feature("autodoc", "Args:
	aType(TCollection_ExtendedString)

Returns:
	None

set the data type") SetDataType;
		void SetDataType (const TCollection_ExtendedString & aType);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_ExtendedString

returns data type") DataType;
		TCollection_ExtendedString DataType ();
		%feature("autodoc", "Args:
	anInfo(TCollection_AsciiString)

Returns:
	None

add <theUserInfo> to the user informations") AddToUserInfo;
		void AddToUserInfo (const TCollection_AsciiString & anInfo);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfAsciiString

return the user informations") UserInfo;
		const TColStd_SequenceOfAsciiString & UserInfo ();
		%feature("autodoc", "Args:
	aComment(TCollection_ExtendedString)

Returns:
	None

add <theUserInfo> to the user informations") AddToComments;
		void AddToComments (const TCollection_ExtendedString & aComment);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfExtendedString

return the user informations") Comments;
		const TColStd_SequenceOfExtendedString & Comments ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

the the number of persistent objects  
 Return:  
  the number of persistent objects readed") NumberOfObjects;
		Standard_Integer NumberOfObjects ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of root objects in this set of data.  
-   When preparing a storage operation, the  
  result is the number of roots inserted into this  
  set of data with the function AddRoot.  
-   When retrieving an object, the result is the  
  number of roots stored in the read container.  
  Use the Roots function to get these roots in a sequence.") NumberOfRoots;
		Standard_Integer NumberOfRoots ();
		%feature("autodoc", "Args:
	anObject(Handle_Standard_Persistent)

Returns:
	None

add a persistent root to write. the name of the root  
         is a driver reference number.") AddRoot;
		void AddRoot (const Handle_Standard_Persistent & anObject);
		%feature("autodoc", "Args:
	aName(TCollection_AsciiString)
	anObject(Handle_Standard_Persistent)

Returns:
	None

Adds the root anObject to this set of data.  
The name of the root is aName if given; if not, it  
will be a reference number assigned by the driver  
when writing the set of data into the container.  
When naming the roots, it is easier to retrieve  
objects by significant references rather than by  
references without any semantic values.") AddRoot;
		void AddRoot (const TCollection_AsciiString & aName,const Handle_Standard_Persistent & anObject);
		%feature("autodoc", "Args:
	aName(TCollection_AsciiString)

Returns:
	None

Removes from this set of data the root object named aName.  
Warning  
Nothing is done if there is no root object whose  
name is aName in this set of data.") RemoveRoot;
		void RemoveRoot (const TCollection_AsciiString & aName);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_HSeqOfRoot

Returns the roots of this set of data in a sequence.  
-   When preparing a storage operation, the  
  sequence contains the roots inserted into this  
  set of data with the function AddRoot.  
-   When retrieving an object, the sequence  
  contains the roots stored in the container read.  
-   An empty sequence is returned if there is no root in this set of data.") Roots;
		Handle_Storage_HSeqOfRoot Roots ();
		%feature("autodoc", "Args:
	aName(TCollection_AsciiString)

Returns:
	Handle_Storage_Root

Gives the root object whose name is aName in  
this set of data. The returned object is a  
Storage_Root object, from which the object it  
encapsulates may be extracted.  
Warning  
A null handle is returned if there is no root object  
whose name is aName in this set of data.") Find;
		Handle_Storage_Root Find (const TCollection_AsciiString & aName);
		%feature("autodoc", "Args:
	aName(TCollection_AsciiString)

Returns:
	Standard_Boolean

returns Standard_True if <self> contains a root named <aName>") IsRoot;
		Standard_Boolean IsRoot (const TCollection_AsciiString & aName);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of types of objects used in this set of data.") NumberOfTypes;
		Standard_Integer NumberOfTypes ();
		%feature("autodoc", "Args:
	aName(TCollection_AsciiString)

Returns:
	Standard_Boolean

Returns true if this set of data contains an object of type aName.  
Persistent objects from this set of data must  
have types which are recognized by the  
Storage_Schema algorithm used to store or retrieve them.") IsType;
		Standard_Boolean IsType (const TCollection_AsciiString & aName);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfAsciiString

Gives the list of types of objects used in this set of data in a sequence.") Types;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_DataMapIteratorOfMapOfCallBack;
		 Storage_DataMapIteratorOfMapOfCallBack ();
		%feature("autodoc", "Args:
	aMap(Storage_MapOfCallBack)

Returns:
	None

No detailed docstring for this function.") Storage_DataMapIteratorOfMapOfCallBack;
		 Storage_DataMapIteratorOfMapOfCallBack (const Storage_MapOfCallBack & aMap);
		%feature("autodoc", "Args:
	aMap(Storage_MapOfCallBack)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Storage_MapOfCallBack & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Key;
		const TCollection_AsciiString & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_TypedCallBack

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_DataMapIteratorOfMapOfPers;
		 Storage_DataMapIteratorOfMapOfPers ();
		%feature("autodoc", "Args:
	aMap(Storage_MapOfPers)

Returns:
	None

No detailed docstring for this function.") Storage_DataMapIteratorOfMapOfPers;
		 Storage_DataMapIteratorOfMapOfPers (const Storage_MapOfPers & aMap);
		%feature("autodoc", "Args:
	aMap(Storage_MapOfPers)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Storage_MapOfPers & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Key;
		const TCollection_AsciiString & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_Root

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)
	I(Handle_Storage_TypedCallBack)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Storage_DataMapNodeOfMapOfCallBack;
		 Storage_DataMapNodeOfMapOfCallBack (const TCollection_AsciiString & K,const Handle_Storage_TypedCallBack & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Key;
		TCollection_AsciiString & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_TypedCallBack

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)
	I(Handle_Storage_Root)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Storage_DataMapNodeOfMapOfPers;
		 Storage_DataMapNodeOfMapOfPers (const TCollection_AsciiString & K,const Handle_Storage_Root & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Key;
		TCollection_AsciiString & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_Root

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Storage_HArrayOfCallBack;
		 Storage_HArrayOfCallBack (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") Storage_HArrayOfCallBack;
		 Storage_HArrayOfCallBack (const Standard_Integer Low,const Standard_Integer Up,const Handle_Storage_CallBack & V);
		%feature("autodoc", "Args:
	V(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Storage_CallBack & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Storage_CallBack & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Storage_CallBack

No detailed docstring for this function.") Value;
		const Handle_Storage_CallBack & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Storage_CallBack

No detailed docstring for this function.") ChangeValue;
		Handle_Storage_CallBack & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Storage_ArrayOfCallBack

No detailed docstring for this function.") Array1;
		const Storage_ArrayOfCallBack & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Storage_ArrayOfCallBack

No detailed docstring for this function.") ChangeArray1;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Storage_HArrayOfSchema;
		 Storage_HArrayOfSchema (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Storage_Schema)

Returns:
	None

No detailed docstring for this function.") Storage_HArrayOfSchema;
		 Storage_HArrayOfSchema (const Standard_Integer Low,const Standard_Integer Up,const Handle_Storage_Schema & V);
		%feature("autodoc", "Args:
	V(Handle_Storage_Schema)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Storage_Schema & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Storage_Schema)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Storage_Schema & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Storage_Schema

No detailed docstring for this function.") Value;
		const Handle_Storage_Schema & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Storage_Schema

No detailed docstring for this function.") ChangeValue;
		Handle_Storage_Schema & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Storage_ArrayOfSchema

No detailed docstring for this function.") Array1;
		const Storage_ArrayOfSchema & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Storage_ArrayOfSchema

No detailed docstring for this function.") ChangeArray1;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Storage_HPArray;
		 Storage_HPArray (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") Storage_HPArray;
		 Storage_HPArray (const Standard_Integer Low,const Standard_Integer Up,const Handle_Standard_Persistent & V);
		%feature("autodoc", "Args:
	V(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Standard_Persistent & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Standard_Persistent & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Standard_Persistent

No detailed docstring for this function.") Value;
		const Handle_Standard_Persistent & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Standard_Persistent

No detailed docstring for this function.") ChangeValue;
		Handle_Standard_Persistent & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Storage_PArray

No detailed docstring for this function.") Array1;
		const Storage_PArray & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Storage_PArray

No detailed docstring for this function.") ChangeArray1;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_HSeqOfCallBack;
		 Storage_HSeqOfCallBack ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Storage_CallBack & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Storage_HSeqOfCallBack)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Storage_HSeqOfCallBack & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Storage_CallBack & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Storage_HSeqOfCallBack)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Storage_HSeqOfCallBack & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Storage_CallBack & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Storage_HSeqOfCallBack)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Storage_HSeqOfCallBack & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Storage_CallBack & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Storage_HSeqOfCallBack)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Storage_HSeqOfCallBack & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Storage_HSeqOfCallBack

No detailed docstring for this function.") Split;
		Handle_Storage_HSeqOfCallBack Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Storage_CallBack & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Storage_CallBack

No detailed docstring for this function.") Value;
		const Handle_Storage_CallBack & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Storage_CallBack

No detailed docstring for this function.") ChangeValue;
		Handle_Storage_CallBack & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Storage_SeqOfCallBack

No detailed docstring for this function.") Sequence;
		const Storage_SeqOfCallBack & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Storage_SeqOfCallBack

No detailed docstring for this function.") ChangeSequence;
		Storage_SeqOfCallBack & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_HSeqOfCallBack

No detailed docstring for this function.") ShallowCopy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_HSeqOfPersistent;
		 Storage_HSeqOfPersistent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Standard_Persistent & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Storage_HSeqOfPersistent)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Storage_HSeqOfPersistent & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Standard_Persistent & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Storage_HSeqOfPersistent)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Storage_HSeqOfPersistent & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Standard_Persistent & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Storage_HSeqOfPersistent)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Storage_HSeqOfPersistent & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Standard_Persistent & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Storage_HSeqOfPersistent)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Storage_HSeqOfPersistent & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Storage_HSeqOfPersistent

No detailed docstring for this function.") Split;
		Handle_Storage_HSeqOfPersistent Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Standard_Persistent & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Standard_Persistent

No detailed docstring for this function.") Value;
		const Handle_Standard_Persistent & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Standard_Persistent

No detailed docstring for this function.") ChangeValue;
		Handle_Standard_Persistent & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Storage_SeqOfPersistent

No detailed docstring for this function.") Sequence;
		const Storage_SeqOfPersistent & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Storage_SeqOfPersistent

No detailed docstring for this function.") ChangeSequence;
		Storage_SeqOfPersistent & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_HSeqOfPersistent

No detailed docstring for this function.") ShallowCopy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_HSeqOfRoot;
		 Storage_HSeqOfRoot ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Storage_Root)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Storage_Root & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Storage_HSeqOfRoot)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Storage_HSeqOfRoot & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Storage_Root)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Storage_Root & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Storage_HSeqOfRoot)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Storage_HSeqOfRoot & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Storage_Root)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Storage_Root & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Storage_HSeqOfRoot)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Storage_HSeqOfRoot & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Storage_Root)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Storage_Root & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Storage_HSeqOfRoot)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Storage_HSeqOfRoot & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Storage_HSeqOfRoot

No detailed docstring for this function.") Split;
		Handle_Storage_HSeqOfRoot Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Storage_Root)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Storage_Root & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Storage_Root

No detailed docstring for this function.") Value;
		const Handle_Storage_Root & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Storage_Root

No detailed docstring for this function.") ChangeValue;
		Handle_Storage_Root & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Storage_SeqOfRoot

No detailed docstring for this function.") Sequence;
		const Storage_SeqOfRoot & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Storage_SeqOfRoot

No detailed docstring for this function.") ChangeSequence;
		Storage_SeqOfRoot & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_HSeqOfRoot

No detailed docstring for this function.") ShallowCopy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_HeaderData;
		 Storage_HeaderData ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

return the creation date") CreationDate;
		TCollection_AsciiString CreationDate ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

return the Storage package version") StorageVersion;
		TCollection_AsciiString StorageVersion ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

get the version of the schema") SchemaVersion;
		TCollection_AsciiString SchemaVersion ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

get the schema's name") SchemaName;
		TCollection_AsciiString SchemaName ();
		%feature("autodoc", "Args:
	aVersion(TCollection_AsciiString)

Returns:
	None

set the version of the application") SetApplicationVersion;
		void SetApplicationVersion (const TCollection_AsciiString & aVersion);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

get the version of the application") ApplicationVersion;
		TCollection_AsciiString ApplicationVersion ();
		%feature("autodoc", "Args:
	aName(TCollection_ExtendedString)

Returns:
	None

set the name of the application") SetApplicationName;
		void SetApplicationName (const TCollection_ExtendedString & aName);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_ExtendedString

get the name of the application") ApplicationName;
		TCollection_ExtendedString ApplicationName ();
		%feature("autodoc", "Args:
	aType(TCollection_ExtendedString)

Returns:
	None

set the data type") SetDataType;
		void SetDataType (const TCollection_ExtendedString & aType);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_ExtendedString

returns data type") DataType;
		TCollection_ExtendedString DataType ();
		%feature("autodoc", "Args:
	theUserInfo(TCollection_AsciiString)

Returns:
	None

add <theUserInfo> to the user informations") AddToUserInfo;
		void AddToUserInfo (const TCollection_AsciiString & theUserInfo);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfAsciiString

return the user informations") UserInfo;
		const TColStd_SequenceOfAsciiString & UserInfo ();
		%feature("autodoc", "Args:
	aComment(TCollection_ExtendedString)

Returns:
	None

add <theUserInfo> to the user informations") AddToComments;
		void AddToComments (const TCollection_ExtendedString & aComment);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfExtendedString

return the user informations") Comments;
		const TColStd_SequenceOfExtendedString & Comments ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

the the number of persistent objects  
 Return:  
  the number of persistent objects readed") NumberOfObjects;
		Standard_Integer NumberOfObjects ();
		%feature("autodoc", "Args:
	None
Returns:
	Storage_Error

No detailed docstring for this function.") ErrorStatus;
		Storage_Error ErrorStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") ErrorStatusExtension;
		TCollection_AsciiString ErrorStatusExtension ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClearErrorStatus;
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
		%feature("autodoc", "Args:
	K1(TCollection_AsciiString)
	K2(Standard_Integer)
	I(Standard_Integer)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Storage_IndexedDataMapNodeOfPType;
		 Storage_IndexedDataMapNodeOfPType (const TCollection_AsciiString & K1,const Standard_Integer K2,Standard_Integer &OutValue,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Key1;
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
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_InternalData;
		 Storage_InternalData ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Storage_MapOfCallBack;
		 Storage_MapOfCallBack (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(Storage_MapOfCallBack)

Returns:
	Storage_MapOfCallBack

No detailed docstring for this function.") Assign;
		Storage_MapOfCallBack & Assign (const Storage_MapOfCallBack & Other);
		%feature("autodoc", "Args:
	Other(Storage_MapOfCallBack)

Returns:
	Storage_MapOfCallBack

No detailed docstring for this function.") operator=;
		Storage_MapOfCallBack & operator = (const Storage_MapOfCallBack & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)
	I(Handle_Storage_TypedCallBack)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TCollection_AsciiString & K,const Handle_Storage_TypedCallBack & I);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Handle_Storage_TypedCallBack

No detailed docstring for this function.") Find;
		const Handle_Storage_TypedCallBack & Find (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Handle_Storage_TypedCallBack

No detailed docstring for this function.") ChangeFind;
		Handle_Storage_TypedCallBack & ChangeFind (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Storage_MapOfPers;
		 Storage_MapOfPers (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(Storage_MapOfPers)

Returns:
	Storage_MapOfPers

No detailed docstring for this function.") Assign;
		Storage_MapOfPers & Assign (const Storage_MapOfPers & Other);
		%feature("autodoc", "Args:
	Other(Storage_MapOfPers)

Returns:
	Storage_MapOfPers

No detailed docstring for this function.") operator=;
		Storage_MapOfPers & operator = (const Storage_MapOfPers & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)
	I(Handle_Storage_Root)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TCollection_AsciiString & K,const Handle_Storage_Root & I);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Handle_Storage_Root

No detailed docstring for this function.") Find;
		const Handle_Storage_Root & Find (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Handle_Storage_Root

No detailed docstring for this function.") ChangeFind;
		Handle_Storage_Root & ChangeFind (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
%nodefaultctor Storage_MapPSDHasher;
class Storage_MapPSDHasher {
	public:
		%feature("autodoc", "Args:
	K(Handle_Standard_Persistent)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (const Handle_Standard_Persistent & K,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	K1(Handle_Standard_Persistent)
	K2(Handle_Standard_Persistent)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Storage_PArray;
		 Storage_PArray (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Standard_Persistent)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Storage_PArray;
		 Storage_PArray (const Handle_Standard_Persistent & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Standard_Persistent & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(Storage_PArray)

Returns:
	Storage_PArray

No detailed docstring for this function.") Assign;
		const Storage_PArray & Assign (const Storage_PArray & Other);
		%feature("autodoc", "Args:
	Other(Storage_PArray)

Returns:
	Storage_PArray

No detailed docstring for this function.") operator=;
		const Storage_PArray & operator = (const Storage_PArray & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Standard_Persistent & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Standard_Persistent

No detailed docstring for this function.") Value;
		const Handle_Standard_Persistent & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Standard_Persistent

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Storage_PType;
		 Storage_PType (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(Storage_PType)

Returns:
	Storage_PType

No detailed docstring for this function.") Assign;
		Storage_PType & Assign (const Storage_PType & Other);
		%feature("autodoc", "Args:
	Other(Storage_PType)

Returns:
	Storage_PType

No detailed docstring for this function.") operator=;
		Storage_PType & operator = (const Storage_PType & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)
	I(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TCollection_AsciiString & K,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TCollection_AsciiString)
	T(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TCollection_AsciiString & K,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") FindKey;
		const TCollection_AsciiString & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindFromIndex;
		const Standard_Integer & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeFromIndex;
		Standard_Integer & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindFromKey;
		const Standard_Integer & FindFromKey (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeFromKey;
		Standard_Integer & ChangeFromKey (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TCollection_AsciiString & K);
		%feature("autodoc", "Args:
	K(TCollection_AsciiString)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_Root;
		 Storage_Root ();
		%feature("autodoc", "Args:
	aName(TCollection_AsciiString)
	anObject(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") Storage_Root;
		 Storage_Root (const TCollection_AsciiString & aName,const Handle_Standard_Persistent & anObject);
		%feature("autodoc", "Args:
	aName(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") SetName;
		void SetName (const TCollection_AsciiString & aName);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the name of this root object.  
  The name may have been given explicitly when  
the root was inserted into the Storage_Data  
object. If not, the name is a reference number  
which was assigned automatically by the driver  
when writing the set of data into the container.  
When naming the roots, it is easier to retrieve  
objects by significant references rather than by  
references without any semantic values.  
Warning  
The returned string will be empty if you call this  
function before having named this root object,  
either explicitly, or when writing the set of data  
into the container.") Name;
		TCollection_AsciiString Name ();
		%feature("autodoc", "Args:
	anObject(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") SetObject;
		void SetObject (const Handle_Standard_Persistent & anObject);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Persistent

Returns the persistent object encapsulated by this root.") Object;
		Handle_Standard_Persistent Object ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the name of this root type.") Type;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_RootData;
		 Storage_RootData ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of roots.") NumberOfRoots;
		Standard_Integer NumberOfRoots ();
		%feature("autodoc", "Args:
	aRoot(Handle_Storage_Root)

Returns:
	None

add a root to <self>. If a root with same name is present, it  
         will be replaced by <aRoot>.") AddRoot;
		void AddRoot (const Handle_Storage_Root & aRoot);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_HSeqOfRoot

No detailed docstring for this function.") Roots;
		Handle_Storage_HSeqOfRoot Roots ();
		%feature("autodoc", "Args:
	aName(TCollection_AsciiString)

Returns:
	Handle_Storage_Root

find a root with name <aName>.") Find;
		Handle_Storage_Root Find (const TCollection_AsciiString & aName);
		%feature("autodoc", "Args:
	aName(TCollection_AsciiString)

Returns:
	Standard_Boolean

returns Standard_True if <self> contains a root named <aName>") IsRoot;
		Standard_Boolean IsRoot (const TCollection_AsciiString & aName);
		%feature("autodoc", "Args:
	aName(TCollection_AsciiString)

Returns:
	None

remove the root named <aName>.") RemoveRoot;
		void RemoveRoot (const TCollection_AsciiString & aName);
		%feature("autodoc", "Args:
	None
Returns:
	Storage_Error

No detailed docstring for this function.") ErrorStatus;
		Storage_Error ErrorStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") ErrorStatusExtension;
		TCollection_AsciiString ErrorStatusExtension ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClearErrorStatus;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Builds a storage/retrieval algorithm based on a  
given data schema.  
Example  
  For example, if ShapeSchema is the class  
inheriting from Storage_Schema and containing  
the description of your application data schema,  
you create a storage/retrieval algorithm as follows:  
Handle_ShapeSchema s = new  
ShapeSchema;  
-------- --  
USER API -- --------------------------------------------------------------  
-------- --") Storage_Schema;
		 Storage_Schema ();
		%feature("autodoc", "Args:
	aVersion(TCollection_AsciiString)

Returns:
	None

returns version of the schema") SetVersion;
		void SetVersion (const TCollection_AsciiString & aVersion);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns the version of the schema") Version;
		TCollection_AsciiString Version ();
		%feature("autodoc", "Args:
	aSchemaName(TCollection_AsciiString)

Returns:
	None

set the schema's name") SetName;
		void SetName (const TCollection_AsciiString & aSchemaName);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns the schema's name") Name;
		TCollection_AsciiString Name ();
		%feature("autodoc", "Args:
	s(Storage_BaseDriver)
	aData(Handle_Storage_Data)

Returns:
	None

Writes the data aggregated in aData into the  
container defined by the driver s. The storage  
operation is performed according to the data  
schema with which this algorithm is working.  
Note: aData may aggregate several root objects  
to be stored together.") Write;
		void Write (Storage_BaseDriver & s,const Handle_Storage_Data & aData);
		%feature("autodoc", "Args:
	s(Storage_BaseDriver)

Returns:
	Handle_Storage_Data

Returns the data read from the container defined  
by the driver s. The retrieval operation is  
performed according to the data schema with  
which this algorithm is working.  
These data are aggregated in a Storage_Data  
object which may be browsed in order to extract  
the root objects from the container.") Read;
		Handle_Storage_Data Read (Storage_BaseDriver & s);
		%feature("autodoc", "Args:
	s(Storage_BaseDriver)

Returns:
	Handle_Storage_HeaderData

read the header part of the stream  
 Arguments:  
  s: driver to read") ReadHeaderSection;
		Handle_Storage_HeaderData ReadHeaderSection (Storage_BaseDriver & s);
		%feature("autodoc", "Args:
	s(Storage_BaseDriver)

Returns:
	Handle_Storage_TypeData

fill the TypeData with the  names of the type used  
         in a stream  
 Arguments:  
  s: driver to read") ReadTypeSection;
		Handle_Storage_TypeData ReadTypeSection (Storage_BaseDriver & s);
		%feature("autodoc", "Args:
	s(Storage_BaseDriver)

Returns:
	Handle_Storage_RootData

read root part of the file  
 Arguments:  
  s: driver to read") ReadRootSection;
		Handle_Storage_RootData ReadRootSection (Storage_BaseDriver & s);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TColStd_SequenceOfAsciiString

returns the known types of a schema") SchemaKnownTypes;
		virtual const TColStd_SequenceOfAsciiString & SchemaKnownTypes ();
		%feature("autodoc", "Args:
	aDriver(Storage_BaseDriver)
	theUnknownTypes(TColStd_SequenceOfAsciiString)

Returns:
	Standard_Boolean

indicates whether  the  are  types  in  the driver  
         which are not known from  the schema and for which  
         no callbacks have been set. The unknown types can  
         be read in <theUnknownTypes>.") HasUnknownType;
		Standard_Boolean HasUnknownType (Storage_BaseDriver & aDriver,TColStd_SequenceOfAsciiString & theUnknownTypes);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfAsciiString

returns the all known types  of a schema and their  
         nested schemes.") GetAllSchemaKnownTypes;
		Handle_TColStd_HSequenceOfAsciiString GetAllSchemaKnownTypes ();
		%feature("autodoc", "Args:
	theSchemas(Handle_Storage_HArrayOfSchema)

Returns:
	None

No detailed docstring for this function.") SetNestedSchemas;
		void SetNestedSchemas (const Handle_Storage_HArrayOfSchema & theSchemas);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClearNestedSchemas;
		void ClearNestedSchemas ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_HArrayOfSchema

No detailed docstring for this function.") NestedSchemas;
		Handle_Storage_HArrayOfSchema NestedSchemas ();
		%feature("autodoc", "Args:
	None
Returns:
	static TCollection_AsciiString

return a current date string") ICreationDate;
		static TCollection_AsciiString ICreationDate ();
		%feature("autodoc", "Args:
	theTypeName(TCollection_AsciiString)
	theNewName(TCollection_AsciiString)

Returns:
	static Standard_Boolean

returns True if theType migration is identified  the callback support provides a way to read a file  
         with a incomplete schema.  
         ex. : A file contains 3 types a,b and c.  
               The  application's  schema  contains  only 2  
               type a and b. If you try to read the file in  
               the application, you  will  have an error.To  
               bypass this  problem  you  can  give to your  
               application's schema  a  callback  used when  
               the schema dosent  know  how  to handle this  
               type.") CheckTypeMigration;
		static Standard_Boolean CheckTypeMigration (const TCollection_AsciiString & theTypeName,TCollection_AsciiString & theNewName);
		%feature("autodoc", "Args:
	aTypeName(TCollection_AsciiString)
	aCallBack(Handle_Storage_CallBack)

Returns:
	None

add two functions to the callback list") AddReadUnknownTypeCallBack;
		void AddReadUnknownTypeCallBack (const TCollection_AsciiString & aTypeName,const Handle_Storage_CallBack & aCallBack);
		%feature("autodoc", "Args:
	aTypeName(TCollection_AsciiString)

Returns:
	None

remove a callback for a type") RemoveReadUnknownTypeCallBack;
		void RemoveReadUnknownTypeCallBack (const TCollection_AsciiString & aTypeName);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfAsciiString

returns  a  list  of   type  name  with  installed  
         callback.") InstalledCallBackList;
		Handle_TColStd_HSequenceOfAsciiString InstalledCallBackList ();
		%feature("autodoc", "Args:
	None
Returns:
	None

clear all callback from schema instance.") ClearCallBackList;
		void ClearCallBackList ();
		%feature("autodoc", "Args:
	None
Returns:
	None

install  a  callback  for  all  unknown  type. the  
         objects with unknown types  will be skipped. (look  
         SkipObject method in BaseDriver)") UseDefaultCallBack;
		void UseDefaultCallBack ();
		%feature("autodoc", "Args:
	None
Returns:
	None

tells schema to uninstall the default callback.") DontUseDefaultCallBack;
		void DontUseDefaultCallBack ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

ask if the schema is using the default callback.") IsUsingDefaultCallBack;
		Standard_Boolean IsUsingDefaultCallBack ();
		%feature("autodoc", "Args:
	f(Handle_Storage_CallBack)

Returns:
	None

overload the  default  function  for build.(use to  
         set an  error  message  or  skip  an  object while  
         reading an unknown type).") SetDefaultCallBack;
		void SetDefaultCallBack (const Handle_Storage_CallBack & f);
		%feature("autodoc", "Args:
	None
Returns:
	None

reset  the  default  function  defined  by Storage  
         package.") ResetDefaultCallBack;
		void ResetDefaultCallBack ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_CallBack

returns   the   read   function   used   when  the  
         UseDefaultCallBack() is set.") DefaultCallBack;
		Handle_Storage_CallBack DefaultCallBack ();
		%feature("autodoc", "Args:
	tName(TCollection_AsciiString)

Returns:
	virtual Handle_Storage_CallBack

No detailed docstring for this function.") CallBackSelection;
		virtual Handle_Storage_CallBack CallBackSelection (const TCollection_AsciiString & tName);
		%feature("autodoc", "Args:
	sp(Handle_Standard_Persistent)

Returns:
	virtual Handle_Storage_CallBack

No detailed docstring for this function.") AddTypeSelection;
		virtual Handle_Storage_CallBack AddTypeSelection (const Handle_Standard_Persistent & sp);
		%feature("autodoc", "Args:
	sp(Handle_Standard_Persistent)
	s(Storage_BaseDriver)

Returns:
	None

No detailed docstring for this function.") WritePersistentObjectHeader;
		void WritePersistentObjectHeader (const Handle_Standard_Persistent & sp,Storage_BaseDriver & s);
		%feature("autodoc", "Args:
	s(Storage_BaseDriver)

Returns:
	None

No detailed docstring for this function.") ReadPersistentObjectHeader;
		void ReadPersistentObjectHeader (Storage_BaseDriver & s);
		%feature("autodoc", "Args:
	sp(Handle_Standard_Persistent)
	s(Storage_BaseDriver)

Returns:
	None

No detailed docstring for this function.") WritePersistentReference;
		void WritePersistentReference (const Handle_Standard_Persistent & sp,Storage_BaseDriver & s);
		%feature("autodoc", "Args:
	sp(Handle_Standard_Persistent)
	s(Storage_BaseDriver)

Returns:
	None

No detailed docstring for this function.") ReadPersistentReference;
		void ReadPersistentReference (Handle_Standard_Persistent & sp,Storage_BaseDriver & s);
		%feature("autodoc", "Args:
	sp(Handle_Standard_Persistent)
	tName(char *)

Returns:
	Standard_Boolean

No detailed docstring for this function.") AddPersistent;
		Standard_Boolean AddPersistent (const Handle_Standard_Persistent & sp,const char * tName);
		%feature("autodoc", "Args:
	sp(Handle_Standard_Persistent)

Returns:
	Standard_Boolean

No detailed docstring for this function.") PersistentToAdd;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_SeqOfCallBack;
		 Storage_SeqOfCallBack ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Storage_SeqOfCallBack)

Returns:
	Storage_SeqOfCallBack

No detailed docstring for this function.") Assign;
		const Storage_SeqOfCallBack & Assign (const Storage_SeqOfCallBack & Other);
		%feature("autodoc", "Args:
	Other(Storage_SeqOfCallBack)

Returns:
	Storage_SeqOfCallBack

No detailed docstring for this function.") operator=;
		const Storage_SeqOfCallBack & operator = (const Storage_SeqOfCallBack & Other);
		%feature("autodoc", "Args:
	T(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Storage_CallBack & T);
		%feature("autodoc", "Args:
	S(Storage_SeqOfCallBack)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Storage_SeqOfCallBack & S);
		%feature("autodoc", "Args:
	T(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Storage_CallBack & T);
		%feature("autodoc", "Args:
	S(Storage_SeqOfCallBack)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Storage_SeqOfCallBack & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Storage_CallBack & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Storage_SeqOfCallBack)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Storage_SeqOfCallBack & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Storage_CallBack & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Storage_SeqOfCallBack)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Storage_SeqOfCallBack & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_CallBack

No detailed docstring for this function.") First;
		const Handle_Storage_CallBack & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_CallBack

No detailed docstring for this function.") Last;
		const Handle_Storage_CallBack & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Storage_SeqOfCallBack)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Storage_SeqOfCallBack & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Storage_CallBack

No detailed docstring for this function.") Value;
		const Handle_Storage_CallBack & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Storage_CallBack & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Storage_CallBack

No detailed docstring for this function.") ChangeValue;
		Handle_Storage_CallBack & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_SeqOfPersistent;
		 Storage_SeqOfPersistent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Storage_SeqOfPersistent)

Returns:
	Storage_SeqOfPersistent

No detailed docstring for this function.") Assign;
		const Storage_SeqOfPersistent & Assign (const Storage_SeqOfPersistent & Other);
		%feature("autodoc", "Args:
	Other(Storage_SeqOfPersistent)

Returns:
	Storage_SeqOfPersistent

No detailed docstring for this function.") operator=;
		const Storage_SeqOfPersistent & operator = (const Storage_SeqOfPersistent & Other);
		%feature("autodoc", "Args:
	T(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Standard_Persistent & T);
		%feature("autodoc", "Args:
	S(Storage_SeqOfPersistent)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Storage_SeqOfPersistent & S);
		%feature("autodoc", "Args:
	T(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Standard_Persistent & T);
		%feature("autodoc", "Args:
	S(Storage_SeqOfPersistent)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Storage_SeqOfPersistent & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Standard_Persistent & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Storage_SeqOfPersistent)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Storage_SeqOfPersistent & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Standard_Persistent & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Storage_SeqOfPersistent)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Storage_SeqOfPersistent & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Persistent

No detailed docstring for this function.") First;
		const Handle_Standard_Persistent & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Persistent

No detailed docstring for this function.") Last;
		const Handle_Standard_Persistent & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Storage_SeqOfPersistent)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Storage_SeqOfPersistent & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Standard_Persistent

No detailed docstring for this function.") Value;
		const Handle_Standard_Persistent & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Standard_Persistent)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Standard_Persistent & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Standard_Persistent

No detailed docstring for this function.") ChangeValue;
		Handle_Standard_Persistent & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_SeqOfRoot;
		 Storage_SeqOfRoot ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Storage_SeqOfRoot)

Returns:
	Storage_SeqOfRoot

No detailed docstring for this function.") Assign;
		const Storage_SeqOfRoot & Assign (const Storage_SeqOfRoot & Other);
		%feature("autodoc", "Args:
	Other(Storage_SeqOfRoot)

Returns:
	Storage_SeqOfRoot

No detailed docstring for this function.") operator=;
		const Storage_SeqOfRoot & operator = (const Storage_SeqOfRoot & Other);
		%feature("autodoc", "Args:
	T(Handle_Storage_Root)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Storage_Root & T);
		%feature("autodoc", "Args:
	S(Storage_SeqOfRoot)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Storage_SeqOfRoot & S);
		%feature("autodoc", "Args:
	T(Handle_Storage_Root)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Storage_Root & T);
		%feature("autodoc", "Args:
	S(Storage_SeqOfRoot)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Storage_SeqOfRoot & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Storage_Root)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Storage_Root & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Storage_SeqOfRoot)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Storage_SeqOfRoot & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Storage_Root)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Storage_Root & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Storage_SeqOfRoot)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Storage_SeqOfRoot & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_Root

No detailed docstring for this function.") First;
		const Handle_Storage_Root & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_Root

No detailed docstring for this function.") Last;
		const Handle_Storage_Root & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Storage_SeqOfRoot)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Storage_SeqOfRoot & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Storage_Root

No detailed docstring for this function.") Value;
		const Handle_Storage_Root & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Storage_Root)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Storage_Root & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Storage_Root

No detailed docstring for this function.") ChangeValue;
		Handle_Storage_Root & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	I(Handle_Storage_CallBack)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Storage_SequenceNodeOfSeqOfCallBack;
		 Storage_SequenceNodeOfSeqOfCallBack (const Handle_Storage_CallBack & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_CallBack

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_Standard_Persistent)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Storage_SequenceNodeOfSeqOfPersistent;
		 Storage_SequenceNodeOfSeqOfPersistent (const Handle_Standard_Persistent & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Persistent

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_Storage_Root)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Storage_SequenceNodeOfSeqOfRoot;
		 Storage_SequenceNodeOfSeqOfRoot (const Handle_Storage_Root & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_Root

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_TypeData;
		 Storage_TypeData ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NumberOfTypes;
		Standard_Integer NumberOfTypes ();
		%feature("autodoc", "Args:
	aName(TCollection_AsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsType;
		Standard_Boolean IsType (const TCollection_AsciiString & aName);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfAsciiString

No detailed docstring for this function.") Types;
		Handle_TColStd_HSequenceOfAsciiString Types ();
		%feature("autodoc", "Args:
	None
Returns:
	Storage_Error

No detailed docstring for this function.") ErrorStatus;
		Storage_Error ErrorStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") ErrorStatusExtension;
		TCollection_AsciiString ErrorStatusExtension ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClearErrorStatus;
		void ClearErrorStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_TypedCallBack;
		 Storage_TypedCallBack ();
		%feature("autodoc", "Args:
	aTypeName(TCollection_AsciiString)
	aCallBack(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") Storage_TypedCallBack;
		 Storage_TypedCallBack (const TCollection_AsciiString & aTypeName,const Handle_Storage_CallBack & aCallBack);
		%feature("autodoc", "Args:
	aType(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") SetType;
		void SetType (const TCollection_AsciiString & aType);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Type;
		TCollection_AsciiString Type ();
		%feature("autodoc", "Args:
	aCallBack(Handle_Storage_CallBack)

Returns:
	None

No detailed docstring for this function.") SetCallBack;
		void SetCallBack (const Handle_Storage_CallBack & aCallBack);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Storage_CallBack

No detailed docstring for this function.") CallBack;
		Handle_Storage_CallBack CallBack ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetIndex;
		void SetIndex (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Storage_DefaultCallBack;
		 Storage_DefaultCallBack ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Persistent

No detailed docstring for this function.") New;
		Handle_Standard_Persistent New ();
		%feature("autodoc", "Args:
	aPers(Handle_Standard_Persistent)
	aSchema(Handle_Storage_Schema)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const Handle_Standard_Persistent & aPers,const Handle_Storage_Schema & aSchema);
		%feature("autodoc", "Args:
	aPers(Handle_Standard_Persistent)
	aDriver(Storage_BaseDriver)
	aSchema(Handle_Storage_Schema)

Returns:
	None

No detailed docstring for this function.") Write;
		void Write (const Handle_Standard_Persistent & aPers,Storage_BaseDriver & aDriver,const Handle_Storage_Schema & aSchema);
		%feature("autodoc", "Args:
	aPers(Handle_Standard_Persistent)
	aDriver(Storage_BaseDriver)
	aSchema(Handle_Storage_Schema)

Returns:
	None

No detailed docstring for this function.") Read;
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

