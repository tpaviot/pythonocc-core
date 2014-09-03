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
%module (package="OCC") Message

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

%include Message_headers.i

/* typedefs */
typedef Handle_Message_ArrayOfMsg Message_HArrayOfMsg;
typedef NCollection_Array1 <Handle_Message_Msg> Message_ArrayOfMsg;
typedef NCollection_Handle <Message_Msg> Handle_Message_Msg;
typedef NCollection_Handle <Message_ArrayOfMsg> Handle_Message_ArrayOfMsg;
/* end typedefs declaration */

/* public enums */
enum Message_Gravity {
	Message_Trace = 0,
	Message_Info = 1,
	Message_Warning = 2,
	Message_Alarm = 3,
	Message_Fail = 4,
};

enum Message_Status {
	Message_None = 0,
	Message_Done1 = Message_DONE,
	Message_Done2 = 2,
	Message_Done3 = 3,
	Message_Done4 = 4,
	Message_Done5 = 5,
	Message_Done6 = 6,
	Message_Done7 = 7,
	Message_Done8 = 8,
	Message_Done9 = 9,
	Message_Done10 = 10,
	Message_Done11 = 11,
	Message_Done12 = 12,
	Message_Done13 = 13,
	Message_Done14 = 14,
	Message_Done15 = 15,
	Message_Done16 = 16,
	Message_Done17 = 17,
	Message_Done18 = 18,
	Message_Done19 = 19,
	Message_Done20 = 20,
	Message_Done21 = 21,
	Message_Done22 = 22,
	Message_Done23 = 23,
	Message_Done24 = 24,
	Message_Done25 = 25,
	Message_Done26 = 26,
	Message_Done27 = 27,
	Message_Done28 = 28,
	Message_Done29 = 29,
	Message_Done30 = 30,
	Message_Done31 = 31,
	Message_Done32 = 32,
	Message_Warn1 = Message_WARN,
	Message_Warn2 = 34,
	Message_Warn3 = 35,
	Message_Warn4 = 36,
	Message_Warn5 = 37,
	Message_Warn6 = 38,
	Message_Warn7 = 39,
	Message_Warn8 = 40,
	Message_Warn9 = 41,
	Message_Warn10 = 42,
	Message_Warn11 = 43,
	Message_Warn12 = 44,
	Message_Warn13 = 45,
	Message_Warn14 = 46,
	Message_Warn15 = 47,
	Message_Warn16 = 48,
	Message_Warn17 = 49,
	Message_Warn18 = 50,
	Message_Warn19 = 51,
	Message_Warn20 = 52,
	Message_Warn21 = 53,
	Message_Warn22 = 54,
	Message_Warn23 = 55,
	Message_Warn24 = 56,
	Message_Warn25 = 57,
	Message_Warn26 = 58,
	Message_Warn27 = 59,
	Message_Warn28 = 60,
	Message_Warn29 = 61,
	Message_Warn30 = 62,
	Message_Warn31 = 63,
	Message_Warn32 = 64,
	Message_Alarm1 = Message_ALARM,
	Message_Alarm2 = 66,
	Message_Alarm3 = 67,
	Message_Alarm4 = 68,
	Message_Alarm5 = 69,
	Message_Alarm6 = 70,
	Message_Alarm7 = 71,
	Message_Alarm8 = 72,
	Message_Alarm9 = 73,
	Message_Alarm10 = 74,
	Message_Alarm11 = 75,
	Message_Alarm12 = 76,
	Message_Alarm13 = 77,
	Message_Alarm14 = 78,
	Message_Alarm15 = 79,
	Message_Alarm16 = 80,
	Message_Alarm17 = 81,
	Message_Alarm18 = 82,
	Message_Alarm19 = 83,
	Message_Alarm20 = 84,
	Message_Alarm21 = 85,
	Message_Alarm22 = 86,
	Message_Alarm23 = 87,
	Message_Alarm24 = 88,
	Message_Alarm25 = 89,
	Message_Alarm26 = 90,
	Message_Alarm27 = 91,
	Message_Alarm28 = 92,
	Message_Alarm29 = 93,
	Message_Alarm30 = 94,
	Message_Alarm31 = 95,
	Message_Alarm32 = 96,
	Message_Fail1 = Message_FAIL,
	Message_Fail2 = 98,
	Message_Fail3 = 99,
	Message_Fail4 = 100,
	Message_Fail5 = 101,
	Message_Fail6 = 102,
	Message_Fail7 = 103,
	Message_Fail8 = 104,
	Message_Fail9 = 105,
	Message_Fail10 = 106,
	Message_Fail11 = 107,
	Message_Fail12 = 108,
	Message_Fail13 = 109,
	Message_Fail14 = 110,
	Message_Fail15 = 111,
	Message_Fail16 = 112,
	Message_Fail17 = 113,
	Message_Fail18 = 114,
	Message_Fail19 = 115,
	Message_Fail20 = 116,
	Message_Fail21 = 117,
	Message_Fail22 = 118,
	Message_Fail23 = 119,
	Message_Fail24 = 120,
	Message_Fail25 = 121,
	Message_Fail26 = 122,
	Message_Fail27 = 123,
	Message_Fail28 = 124,
	Message_Fail29 = 125,
	Message_Fail30 = 126,
	Message_Fail31 = 127,
	Message_Fail32 = 128,
};

enum Message_StatusType {
	Message_DONE = 256,
	Message_WARN = 512,
	Message_ALARM = 1024,
	Message_FAIL = 2048,
};

/* end public enums declaration */

%rename(message) Message;
%nodefaultctor Message;
class Message {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	static  Handle_Message_Messenger

Defines default messenger for OCCT applications.  
         This is global static instance of the messenger.  
         By default, it contains single printer directed to cout.  
         It can be customized according to the application needs.") DefaultMessenger;
		static const Handle_Message_Messenger & DefaultMessenger ();
		%feature("autodoc", "Args:
	Hour(Standard_Integer)
	Minute(Standard_Integer)
	Second(Standard_Real)

Returns:
	static TCollection_AsciiString

Returns the string filled with values of hours, minutes and seconds.  
Example:  
         1. (5, 12, 26.3345) returns '05h:12m:26.33s',  
         2. (0,  6, 34.496 ) returns '06m:34.50s',  
         3. (0,  0,  4.5   ) returns '4.50s'") FillTime;
		static TCollection_AsciiString FillTime (const Standard_Integer Hour,const Standard_Integer Minute,const Standard_Real Second);
};


%feature("shadow") Message::~Message %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Message_Algorithm;
class Message_Algorithm : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") Message_Algorithm;
		 Message_Algorithm ();
		%feature("autodoc", "Args:
	theStat(Message_Status)

Returns:
	None

Sets status with no parameter") SetStatus;
		void SetStatus (const Message_Status & theStat);
		%feature("autodoc", "Args:
	theStat(Message_Status)
	theInt(Standard_Integer)

Returns:
	None

Sets status with integer parameter") SetStatus;
		void SetStatus (const Message_Status & theStat,const Standard_Integer theInt);
		%feature("autodoc", "Args:
	theStat(Message_Status)
	theStr(char *)
	noRepetitions(Standard_Boolean)=Standard_True

Returns:
	None

Sets status with string parameter.  
         If noRepetitions is True, the parameter will be added only  
         if it has not been yet recorded for the same status flag") SetStatus;
		void SetStatus (const Message_Status & theStat,const char * theStr,const Standard_Boolean noRepetitions = Standard_True);
		%feature("autodoc", "Args:
	theStat(Message_Status)
	theStr(TCollection_AsciiString)
	noRepetitions(Standard_Boolean)=Standard_True

Returns:
	None

Sets status with string parameter  
         If noRepetitions is True, the parameter will be added only  
         if it has not been yet recorded for the same status flag") SetStatus;
		void SetStatus (const Message_Status & theStat,const TCollection_AsciiString & theStr,const Standard_Boolean noRepetitions = Standard_True);
		%feature("autodoc", "Args:
	theStat(Message_Status)
	theStr(Handle_TCollection_HAsciiString)
	noRepetitions(Standard_Boolean)=Standard_True

Returns:
	None

Sets status with string parameter  
         If noRepetitions is True, the parameter will be added only  
         if it has not been yet recorded for the same status flag") SetStatus;
		void SetStatus (const Message_Status & theStat,const Handle_TCollection_HAsciiString & theStr,const Standard_Boolean noRepetitions = Standard_True);
		%feature("autodoc", "Args:
	theStat(Message_Status)
	theStr(TCollection_ExtendedString)
	noRepetitions(Standard_Boolean)=Standard_True

Returns:
	None

Sets status with string parameter  
         If noRepetitions is True, the parameter will be added only  
         if it has not been yet recorded for the same status flag") SetStatus;
		void SetStatus (const Message_Status & theStat,const TCollection_ExtendedString & theStr,const Standard_Boolean noRepetitions = Standard_True);
		%feature("autodoc", "Args:
	theStat(Message_Status)
	theStr(Handle_TCollection_HExtendedString)
	noRepetitions(Standard_Boolean)=Standard_True

Returns:
	None

Sets status with string parameter  
         If noRepetitions is True, the parameter will be added only  
         if it has not been yet recorded for the same status flag") SetStatus;
		void SetStatus (const Message_Status & theStat,const Handle_TCollection_HExtendedString & theStr,const Standard_Boolean noRepetitions = Standard_True);
		%feature("autodoc", "Args:
	theStat(Message_Status)
	theMsg(Message_Msg)

Returns:
	None

Sets status with preformatted message. This message will be  
         used directly to report the status; automatic generation of  
         status messages will be disabled for it.") SetStatus;
		void SetStatus (const Message_Status & theStat,const Message_Msg & theMsg);
		%feature("autodoc", "Args:
	None
Returns:
	Message_ExecStatus

Returns copy of exec status of algorithm") GetStatus;
		const Message_ExecStatus & GetStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	Message_ExecStatus

Returns exec status of algorithm") ChangeStatus;
		Message_ExecStatus & ChangeStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear exec status of algorithm") ClearStatus;
		void ClearStatus ();
		%feature("autodoc", "Args:
	theMsgr(Handle_Message_Messenger)

Returns:
	None

Sets messenger to algorithm") SetMessenger;
		void SetMessenger (const Handle_Message_Messenger & theMsgr);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Message_Messenger

Returns messenger of algorithm.  
         The returned handle is always non-null and can  
         be used for sending messages.") GetMessenger;
		Handle_Message_Messenger GetMessenger ();
		%feature("autodoc", "Args:
	theFilter(Message_ExecStatus)
	theTraceLevel(Message_Gravity)=Message_Warning
	theMaxCount(Standard_Integer)=20

Returns:
	virtual void

Print messages for all status flags that have been set during  
         algorithm execution, excluding statuses that are NOT set  
         in theFilter.  
 
         The messages are taken from resource file, names being  
         constructed as {dynamic class type}.{status name},  
         for instance, 'Message_Algorithm.Fail5'.  
         If message is not found in resources for this class and all  
         its base types, surrogate text is printed.  
 
         For the statuses having number or string parameters,  
         theMaxCount defines maximal number of numbers or strings to be  
         included in the message  
 
         Note that this method is virtual; this allows descendant  
         classes to customize message output (e.g. by adding  
         messages from other sub-algorithms)") SendStatusMessages;
		virtual void SendStatusMessages (const Message_ExecStatus & theFilter,const Message_Gravity theTraceLevel = Message_Warning,const Standard_Integer theMaxCount = 20);
		%feature("autodoc", "Args:
	theTraceLevel(Message_Gravity)=Message_Warning
	theMaxCount(Standard_Integer)=20

Returns:
	None

Convenient variant of SendStatusMessages() with theFilter  
         having defined all WARN, ALARM, and FAIL (but not DONE)  
         status flags") SendMessages;
		void SendMessages (const Message_Gravity theTraceLevel = Message_Warning,const Standard_Integer theMaxCount = 20);
		%feature("autodoc", "Args:
	theOther(Handle_Message_Algorithm)

Returns:
	None

Add statuses to this algorithm from other algorithm  
         (including messages)") AddStatus;
		void AddStatus (const Handle_Message_Algorithm & theOther);
		%feature("autodoc", "Args:
	theStatus(Message_ExecStatus)
	theOther(Handle_Message_Algorithm)

Returns:
	None

Add statuses to this algorithm from other algorithm, but  
         only those items are moved that correspond to statuses  
         set in theStatus") AddStatus;
		void AddStatus (const Message_ExecStatus & theStatus,const Handle_Message_Algorithm & theOther);
		%feature("autodoc", "Args:
	theStatus(Message_Status)

Returns:
	Handle_TColStd_HPackedMapOfInteger

Return the numbers associated with the indicated status;  
         Null handle if no such status or no numbers associated with it") GetMessageNumbers;
		Handle_TColStd_HPackedMapOfInteger GetMessageNumbers (const Message_Status & theStatus);
		%feature("autodoc", "Args:
	theStatus(Message_Status)

Returns:
	Handle_TColStd_HSequenceOfHExtendedString

Return the strings associated with the indicated status;  
         Null handle if no such status or no strings associated with it") GetMessageStrings;
		Handle_TColStd_HSequenceOfHExtendedString GetMessageStrings (const Message_Status & theStatus);
		%feature("autodoc", "Args:
	theError(Handle_TColStd_HPackedMapOfInteger)
	theMaxCount(Standard_Integer)

Returns:
	static TCollection_ExtendedString

Prepares a string containing a list of integers contained  
         in theError map, but not more than theMaxCount") PrepareReport;
		static TCollection_ExtendedString PrepareReport (const Handle_TColStd_HPackedMapOfInteger & theError,const Standard_Integer theMaxCount);
		%feature("autodoc", "Args:
	theReportSeq(TColStd_SequenceOfHExtendedString)
	theMaxCount(Standard_Integer)

Returns:
	static TCollection_ExtendedString

Prepares a string containing a list of names contained  
         in theReportSeq sequence, but not more than theMaxCount") PrepareReport;
		static TCollection_ExtendedString PrepareReport (const TColStd_SequenceOfHExtendedString & theReportSeq,const Standard_Integer theMaxCount);
};


%feature("shadow") Message_Algorithm::~Message_Algorithm %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_Algorithm {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Message_Algorithm {
	Handle_Message_Algorithm GetHandle() {
	return *(Handle_Message_Algorithm*) &$self;
	}
};

%nodefaultctor Handle_Message_Algorithm;
class Handle_Message_Algorithm : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Message_Algorithm();
        Handle_Message_Algorithm(const Handle_Message_Algorithm &aHandle);
        Handle_Message_Algorithm(const Message_Algorithm *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Message_Algorithm DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Message_Algorithm {
    Message_Algorithm* GetObject() {
    return (Message_Algorithm*)$self->Access();
    }
};
%feature("shadow") Handle_Message_Algorithm::~Handle_Message_Algorithm %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Message_Algorithm {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Message_ListIteratorOfListOfMsg;
class Message_ListIteratorOfListOfMsg {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Message_ListIteratorOfListOfMsg;
		 Message_ListIteratorOfListOfMsg ();
		%feature("autodoc", "Args:
	L(Message_ListOfMsg)

Returns:
	None

No detailed docstring for this function.") Message_ListIteratorOfListOfMsg;
		 Message_ListIteratorOfListOfMsg (const Message_ListOfMsg & L);
		%feature("autodoc", "Args:
	L(Message_ListOfMsg)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Message_ListOfMsg & L);
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
		%feature("autodoc", "Args:
	None
Returns:
	Message_Msg

No detailed docstring for this function.") Value;
		Message_Msg & Value ();
};


%feature("shadow") Message_ListIteratorOfListOfMsg::~Message_ListIteratorOfListOfMsg %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_ListIteratorOfListOfMsg {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Message_ListNodeOfListOfMsg;
class Message_ListNodeOfListOfMsg : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Message_Msg)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Message_ListNodeOfListOfMsg;
		 Message_ListNodeOfListOfMsg (const Message_Msg & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Message_Msg

No detailed docstring for this function.") Value;
		Message_Msg & Value ();
};


%feature("shadow") Message_ListNodeOfListOfMsg::~Message_ListNodeOfListOfMsg %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_ListNodeOfListOfMsg {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Message_ListNodeOfListOfMsg {
	Handle_Message_ListNodeOfListOfMsg GetHandle() {
	return *(Handle_Message_ListNodeOfListOfMsg*) &$self;
	}
};

%nodefaultctor Handle_Message_ListNodeOfListOfMsg;
class Handle_Message_ListNodeOfListOfMsg : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Message_ListNodeOfListOfMsg();
        Handle_Message_ListNodeOfListOfMsg(const Handle_Message_ListNodeOfListOfMsg &aHandle);
        Handle_Message_ListNodeOfListOfMsg(const Message_ListNodeOfListOfMsg *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Message_ListNodeOfListOfMsg DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Message_ListNodeOfListOfMsg {
    Message_ListNodeOfListOfMsg* GetObject() {
    return (Message_ListNodeOfListOfMsg*)$self->Access();
    }
};
%feature("shadow") Handle_Message_ListNodeOfListOfMsg::~Handle_Message_ListNodeOfListOfMsg %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Message_ListNodeOfListOfMsg {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Message_ListOfMsg;
class Message_ListOfMsg {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Message_ListOfMsg;
		 Message_ListOfMsg ();
		%feature("autodoc", "Args:
	Other(Message_ListOfMsg)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const Message_ListOfMsg & Other);
		%feature("autodoc", "Args:
	Other(Message_ListOfMsg)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Message_ListOfMsg & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Message_Msg)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Message_Msg & I);
		%feature("autodoc", "Args:
	I(Message_Msg)
	theIt(Message_ListIteratorOfListOfMsg)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Message_Msg & I,Message_ListIteratorOfListOfMsg & theIt);
		%feature("autodoc", "Args:
	Other(Message_ListOfMsg)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Message_ListOfMsg & Other);
		%feature("autodoc", "Args:
	I(Message_Msg)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Message_Msg & I);
		%feature("autodoc", "Args:
	I(Message_Msg)
	theIt(Message_ListIteratorOfListOfMsg)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Message_Msg & I,Message_ListIteratorOfListOfMsg & theIt);
		%feature("autodoc", "Args:
	Other(Message_ListOfMsg)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Message_ListOfMsg & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Message_Msg

No detailed docstring for this function.") First;
		Message_Msg & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Message_Msg

No detailed docstring for this function.") Last;
		Message_Msg & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(Message_ListIteratorOfListOfMsg)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (Message_ListIteratorOfListOfMsg & It);
		%feature("autodoc", "Args:
	I(Message_Msg)
	It(Message_ListIteratorOfListOfMsg)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Message_Msg & I,Message_ListIteratorOfListOfMsg & It);
		%feature("autodoc", "Args:
	Other(Message_ListOfMsg)
	It(Message_ListIteratorOfListOfMsg)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (Message_ListOfMsg & Other,Message_ListIteratorOfListOfMsg & It);
		%feature("autodoc", "Args:
	I(Message_Msg)
	It(Message_ListIteratorOfListOfMsg)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Message_Msg & I,Message_ListIteratorOfListOfMsg & It);
		%feature("autodoc", "Args:
	Other(Message_ListOfMsg)
	It(Message_ListIteratorOfListOfMsg)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (Message_ListOfMsg & Other,Message_ListIteratorOfListOfMsg & It);
};


%feature("shadow") Message_ListOfMsg::~Message_ListOfMsg %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_ListOfMsg {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Message_Messenger;
class Message_Messenger : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor; initializes by single printer directed to cout.  
         Note: the default messenger is not empty but directed to cout  
         in order to protect against possibility to forget defining printers.  
         If printing to cout is not needed, clear messenger by GetPrinters().Clear()") Message_Messenger;
		 Message_Messenger ();
		%feature("autodoc", "Args:
	thePrinter(Handle_Message_Printer)

Returns:
	None

Create messenger with single printer") Message_Messenger;
		 Message_Messenger (const Handle_Message_Printer & thePrinter);
		%feature("autodoc", "Args:
	thePrinter(Handle_Message_Printer)

Returns:
	Standard_Boolean

Add a printer to the messenger.  
         The printer will be added only if it is not yet in the list.  
         Returns True if printer has been added.") AddPrinter;
		Standard_Boolean AddPrinter (const Handle_Message_Printer & thePrinter);
		%feature("autodoc", "Args:
	thePrinter(Handle_Message_Printer)

Returns:
	Standard_Boolean

Removes specified printer from the messenger.  
         Returns True if this printer has been found in the list  
         and removed.") RemovePrinter;
		Standard_Boolean RemovePrinter (const Handle_Message_Printer & thePrinter);
		%feature("autodoc", "Args:
	theType(Handle_Standard_Type)

Returns:
	Standard_Integer

Removes printers of specified type (including derived classes)  
         from the messenger.  
         Returns number of removed printers.") RemovePrinters;
		Standard_Integer RemovePrinters (const Handle_Standard_Type & theType);
		%feature("autodoc", "Args:
	None
Returns:
	Message_SequenceOfPrinters

Returns current sequence of printers") Printers;
		const Message_SequenceOfPrinters & Printers ();
		%feature("autodoc", "Args:
	None
Returns:
	Message_SequenceOfPrinters

Returns sequence of printers  
         The sequence can be modified.") ChangePrinters;
		Message_SequenceOfPrinters & ChangePrinters ();
		%feature("autodoc", "Args:
	theString(char *)
	theGravity(Message_Gravity)=Message_Warning
	putEndl(Standard_Boolean)=Standard_True

Returns:
	None

Dispatch a message to all the printers in the list.  
         Three versions of string representations are accepted for  
         convenience, by default all are converted to ExtendedString.  
         The parameter putEndl specifies whether the new line should  
         be started after this message (default) or not (may have  
         sense in some conditions).") Send;
		void Send (const char * theString,const Message_Gravity theGravity = Message_Warning,const Standard_Boolean putEndl = Standard_True);
		%feature("autodoc", "Args:
	theString(TCollection_AsciiString)
	theGravity(Message_Gravity)=Message_Warning
	putEndl(Standard_Boolean)=Standard_True

Returns:
	None

See above") Send;
		void Send (const TCollection_AsciiString & theString,const Message_Gravity theGravity = Message_Warning,const Standard_Boolean putEndl = Standard_True);
		%feature("autodoc", "Args:
	theString(TCollection_ExtendedString)
	theGravity(Message_Gravity)=Message_Warning
	putEndl(Standard_Boolean)=Standard_True

Returns:
	None

See above") Send;
		void Send (const TCollection_ExtendedString & theString,const Message_Gravity theGravity = Message_Warning,const Standard_Boolean putEndl = Standard_True);
};


%feature("shadow") Message_Messenger::~Message_Messenger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_Messenger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Message_Messenger {
	Handle_Message_Messenger GetHandle() {
	return *(Handle_Message_Messenger*) &$self;
	}
};

%nodefaultctor Handle_Message_Messenger;
class Handle_Message_Messenger : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Message_Messenger();
        Handle_Message_Messenger(const Handle_Message_Messenger &aHandle);
        Handle_Message_Messenger(const Message_Messenger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Message_Messenger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Message_Messenger {
    Message_Messenger* GetObject() {
    return (Message_Messenger*)$self->Access();
    }
};
%feature("shadow") Handle_Message_Messenger::~Handle_Message_Messenger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Message_Messenger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Message_MsgFile;
class Message_MsgFile {
	public:
		%feature("autodoc", "Args:
	theDirName(char *)
	theFileName(char *)

Returns:
	static Standard_Boolean

Load message file <theFileName> from directory <theDirName>  
         or its sub-directory") Load;
		static Standard_Boolean Load (const char * theDirName,const char * theFileName);
		%feature("autodoc", "Args:
	theFName(char *)

Returns:
	static Standard_Boolean

Load the messages from the given file, additive to any previously  
         loaded messages. Messages with same keywords, if already present,  
         are replaced with the new ones.") LoadFile;
		static Standard_Boolean LoadFile (const char * theFName);
		%feature("autodoc", "Args:
	envname(char *)
	filename(char *)
	ext(char *)=

Returns:
	static void

Loads the messages from the file with name (without extension)  
         given by environment variable.  
         Extension of the file name is given separately. If its not  
         defined, it is taken:  
         - by default from environment CSF_LANGUAGE,  
         - if not defined either, as 'us'.") LoadFromEnv;
		static void LoadFromEnv (const char * envname,const char * filename,const char * ext = "");
		%feature("autodoc", "Args:
	key(TCollection_AsciiString)
	text(TCollection_ExtendedString)

Returns:
	static Standard_Boolean

Adds new message to the map. Parameter <key> gives  
         the key of the message, <text> defines the message itself.  
         If there already was defined the message identified by the  
         same keyword, it is replaced with the new one.") AddMsg;
		static Standard_Boolean AddMsg (const TCollection_AsciiString & key,const TCollection_ExtendedString & text);
		%feature("autodoc", "Args:
	key(char *)

Returns:
	static  TCollection_ExtendedString

No detailed docstring for this function.") Msg;
		static const TCollection_ExtendedString & Msg (const char * key);
		%feature("autodoc", "Args:
	key(TCollection_AsciiString)

Returns:
	static  TCollection_ExtendedString

Gives the text for the message identified by the keyword <key>  
         If there are no messages with such keyword defined,  
         the error message is returned.  
         In that case reference to static string is returned, it can  
         be chenged with next call(s) to Msg().  
         Note: The error message is constructed like 'Unknown message: <key>', and can  
               itself be customized by defining message with key Message_Msg_BadKeyword.") Msg;
		static const TCollection_ExtendedString & Msg (const TCollection_AsciiString & key);
};


%feature("shadow") Message_MsgFile::~Message_MsgFile %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_MsgFile {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Message_Printer;
class Message_Printer : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	theString(TCollection_ExtendedString)
	theGravity(Message_Gravity)
	putEndl(Standard_Boolean)

Returns:
	virtual void

Send a string message with specified trace level.  
         The parameter putEndl specified whether end-of-line  
         should be added to the end of the message.  
         This method must be redefined in descentant.") Send;
		virtual void Send (const TCollection_ExtendedString & theString,const Message_Gravity theGravity,const Standard_Boolean putEndl);
		%feature("autodoc", "Args:
	theString(char *)
	theGravity(Message_Gravity)
	putEndl(Standard_Boolean)

Returns:
	virtual void

Send a string message with specified trace level.  
         The parameter putEndl specified whether end-of-line  
         should be added to the end of the message.  
         Default implementation calls first method Send().") Send;
		virtual void Send (const char * theString,const Message_Gravity theGravity,const Standard_Boolean putEndl);
		%feature("autodoc", "Args:
	theString(TCollection_AsciiString)
	theGravity(Message_Gravity)
	putEndl(Standard_Boolean)

Returns:
	virtual void

Send a string message with specified trace level.  
         The parameter putEndl specified whether end-of-line  
         should be added to the end of the message.  
         Default implementation calls first method Send().") Send;
		virtual void Send (const TCollection_AsciiString & theString,const Message_Gravity theGravity,const Standard_Boolean putEndl);
};


%feature("shadow") Message_Printer::~Message_Printer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_Printer {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Message_Printer {
	Handle_Message_Printer GetHandle() {
	return *(Handle_Message_Printer*) &$self;
	}
};

%nodefaultctor Handle_Message_Printer;
class Handle_Message_Printer : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Message_Printer();
        Handle_Message_Printer(const Handle_Message_Printer &aHandle);
        Handle_Message_Printer(const Message_Printer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Message_Printer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Message_Printer {
    Message_Printer* GetObject() {
    return (Message_Printer*)$self->Access();
    }
};
%feature("shadow") Handle_Message_Printer::~Handle_Message_Printer %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Message_Printer {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Message_ProgressIndicator;
class Message_ProgressIndicator : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Drops all scopes and sets scale from 0 to 100, step 1  
         This scale has name 'Step'") Reset;
		virtual void Reset ();
		%feature("autodoc", "Args:
	name(char *)

Returns:
	None

No detailed docstring for this function.") SetName;
		void SetName (const char * name);
		%feature("autodoc", "Args:
	name(Handle_TCollection_HAsciiString)

Returns:
	None

Set (optional) name for scale") SetName;
		void SetName (const Handle_TCollection_HAsciiString & name);
		%feature("autodoc", "Args:
	min(Standard_Real)
	max(Standard_Real)

Returns:
	None

Set range for current scale") SetRange;
		void SetRange (const Standard_Real min,const Standard_Real max);
		%feature("autodoc", "Args:
	step(Standard_Real)

Returns:
	None

Set step for current scale") SetStep;
		void SetStep (const Standard_Real step);
		%feature("autodoc", "Args:
	isInf(Standard_Boolean)=Standard_True

Returns:
	None

Set or drop infinite mode for the current scale") SetInfinite;
		void SetInfinite (const Standard_Boolean isInf = Standard_True);
		%feature("autodoc", "Args:
	name(char *)
	min(Standard_Real)
	max(Standard_Real)
	step(Standard_Real)
	isInf(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") SetScale;
		void SetScale (const char * name,const Standard_Real min,const Standard_Real max,const Standard_Real step,const Standard_Boolean isInf = Standard_False);
		%feature("autodoc", "Args:
	min(Standard_Real)
	max(Standard_Real)
	step(Standard_Real)
	isInf(Standard_Boolean)=Standard_False

Returns:
	None

Set all parameters for current scale") SetScale;
		void SetScale (const Standard_Real min,const Standard_Real max,const Standard_Real step,const Standard_Boolean isInf = Standard_False);
		%feature("autodoc", "Args:
	min(Standard_Real)
	max(Standard_Real)
	step(Standard_Real)
	isInf(Standard_Boolean)

Returns:
	None

Returns all parameters for current scale") GetScale;
		void GetScale (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean & isInf);
		%feature("autodoc", "Args:
	val(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Real val);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Set and get progress value at current scale  
         If the value to be set is more than currently set one, or out  
         of range for the current scale, it is limited by that range") GetValue;
		Standard_Real GetValue ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Increment;
		void Increment ();
		%feature("autodoc", "Args:
	step(Standard_Real)

Returns:
	None

Increment the progress value by the default of specified step") Increment;
		void Increment (const Standard_Real step);
		%feature("autodoc", "Args:
	name(char *)=0

Returns:
	Standard_Boolean

No detailed docstring for this function.") NewScope;
		Standard_Boolean NewScope (const char * name = 0);
		%feature("autodoc", "Args:
	name(Handle_TCollection_HAsciiString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") NewScope;
		Standard_Boolean NewScope (const Handle_TCollection_HAsciiString & name);
		%feature("autodoc", "Args:
	span(Standard_Real)
	name(char *)=0

Returns:
	Standard_Boolean

No detailed docstring for this function.") NewScope;
		Standard_Boolean NewScope (const Standard_Real span,const char * name = 0);
		%feature("autodoc", "Args:
	span(Standard_Real)
	name(Handle_TCollection_HAsciiString)

Returns:
	Standard_Boolean

Creates new scope on a part of a current scale from current  
         position with span either equal to default step, or specified  
         The scale for the new scope will have specified name and  
         ranged from 0 to 100 with step 1  
         Returns False if something is wrong in arguments or in current  
         position of progress indicator; scope is opened anyway") NewScope;
		Standard_Boolean NewScope (const Standard_Real span,const Handle_TCollection_HAsciiString & name);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Close the current scope and thus return to previous scale  
         Updates position to be at the end of the closing scope  
         Returns False if no scope is opened") EndScope;
		Standard_Boolean EndScope ();
		%feature("autodoc", "Args:
	name(char *)=0

Returns:
	Standard_Boolean

No detailed docstring for this function.") NextScope;
		Standard_Boolean NextScope (const char * name = 0);
		%feature("autodoc", "Args:
	span(Standard_Real)
	name(char *)=0

Returns:
	Standard_Boolean

Optimized version of { return EndScope() && NewScope(); }") NextScope;
		Standard_Boolean NextScope (const Standard_Real span,const char * name = 0);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Should return True if user has send a break signal.  
         Default implementation returns False.") UserBreak;
		virtual Standard_Boolean UserBreak ();
		%feature("autodoc", "Args:
	force(Standard_Boolean)=Standard_True

Returns:
	virtual Standard_Boolean

Update presentation of the progress indicator  
         Called when progress position is changed  
         Flag force is intended for forcing update in case if it is  
         optimized; all internal calls from ProgressIndicator are  
         done with this flag equal to False") Show;
		virtual Standard_Boolean Show (const Standard_Boolean force = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns total progress position on the basic scale  
         ranged from 0. to 1.") GetPosition;
		Standard_Real GetPosition ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns current number of opened scopes  
         This number is always >=1 as top-level scale is always present") GetNbScopes;
		Standard_Integer GetNbScopes ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Message_ProgressScale

Returns data for scale of index-th scope  
         The first scope is current one, the last is the top-level one") GetScope;
		const Message_ProgressScale & GetScope (const Standard_Integer index);
};


%feature("shadow") Message_ProgressIndicator::~Message_ProgressIndicator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_ProgressIndicator {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Message_ProgressIndicator {
	Handle_Message_ProgressIndicator GetHandle() {
	return *(Handle_Message_ProgressIndicator*) &$self;
	}
};

%nodefaultctor Handle_Message_ProgressIndicator;
class Handle_Message_ProgressIndicator : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Message_ProgressIndicator();
        Handle_Message_ProgressIndicator(const Handle_Message_ProgressIndicator &aHandle);
        Handle_Message_ProgressIndicator(const Message_ProgressIndicator *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Message_ProgressIndicator DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Message_ProgressIndicator {
    Message_ProgressIndicator* GetObject() {
    return (Message_ProgressIndicator*)$self->Access();
    }
};
%feature("shadow") Handle_Message_ProgressIndicator::~Handle_Message_ProgressIndicator %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Message_ProgressIndicator {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Message_ProgressScale;
class Message_ProgressScale {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates scale ranged from 0 to 100 with step 1") Message_ProgressScale;
		 Message_ProgressScale ();
		%feature("autodoc", "Args:
	theName(char *)

Returns:
	None

No detailed docstring for this function.") SetName;
		void SetName (const char * theName);
		%feature("autodoc", "Args:
	theName(Handle_TCollection_HAsciiString)

Returns:
	None

Sets scale name") SetName;
		void SetName (const Handle_TCollection_HAsciiString & theName);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HAsciiString

Gets scale name  
         Name may be Null handle if not set") GetName;
		Handle_TCollection_HAsciiString GetName ();
		%feature("autodoc", "Args:
	theMin(Standard_Real)

Returns:
	None

Sets minimum value of scale") SetMin;
		void SetMin (const Standard_Real theMin);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Gets minimum value of scale") GetMin;
		Standard_Real GetMin ();
		%feature("autodoc", "Args:
	theMax(Standard_Real)

Returns:
	None

Sets minimum value of scale") SetMax;
		void SetMax (const Standard_Real theMax);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Gets minimum value of scale") GetMax;
		Standard_Real GetMax ();
		%feature("autodoc", "Args:
	min(Standard_Real)
	max(Standard_Real)

Returns:
	None

Set both min and max") SetRange;
		void SetRange (const Standard_Real min,const Standard_Real max);
		%feature("autodoc", "Args:
	theStep(Standard_Real)

Returns:
	None

Sets default step") SetStep;
		void SetStep (const Standard_Real theStep);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Gets default step") GetStep;
		Standard_Real GetStep ();
		%feature("autodoc", "Args:
	theInfinite(Standard_Boolean)=Standard_True

Returns:
	None

Sets flag for infinite scale") SetInfinite;
		void SetInfinite (const Standard_Boolean theInfinite = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Gets flag for infinite scale") GetInfinite;
		Standard_Boolean GetInfinite ();
		%feature("autodoc", "Args:
	min(Standard_Real)
	max(Standard_Real)
	step(Standard_Real)
	theInfinite(Standard_Boolean)=Standard_True

Returns:
	None

Set all scale parameters") SetScale;
		void SetScale (const Standard_Real min,const Standard_Real max,const Standard_Real step,const Standard_Boolean theInfinite = Standard_True);
		%feature("autodoc", "Args:
	first(Standard_Real)
	last(Standard_Real)

Returns:
	None

Defines span occupied by the scale on the basis scale") SetSpan;
		void SetSpan (const Standard_Real first,const Standard_Real last);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetFirst;
		Standard_Real GetFirst ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Return information on span occupied by the scale on the base scale") GetLast;
		Standard_Real GetLast ();
		%feature("autodoc", "Args:
	val(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") LocalToBase;
		Standard_Real LocalToBase (const Standard_Real val);
		%feature("autodoc", "Args:
	val(Standard_Real)

Returns:
	Standard_Real

Convert value from this scale to base one and back") BaseToLocal;
		Standard_Real BaseToLocal (const Standard_Real val);
};


%feature("shadow") Message_ProgressScale::~Message_ProgressScale %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_ProgressScale {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Message_ProgressSentry;
class Message_ProgressSentry {
	public:
		%feature("autodoc", "Args:
	PI(Handle_Message_ProgressIndicator)
	name(char *)
	min(Standard_Real)
	max(Standard_Real)
	step(Standard_Real)
	isInf(Standard_Boolean)=Standard_False
	newScopeSpan(Standard_Real)=0.0

Returns:
	None

No detailed docstring for this function.") Message_ProgressSentry;
		 Message_ProgressSentry (const Handle_Message_ProgressIndicator & PI,const char * name,const Standard_Real min,const Standard_Real max,const Standard_Real step,const Standard_Boolean isInf = Standard_False,const Standard_Real newScopeSpan = 0.0);
		%feature("autodoc", "Args:
	PI(Handle_Message_ProgressIndicator)
	name(Handle_TCollection_HAsciiString)
	min(Standard_Real)
	max(Standard_Real)
	step(Standard_Real)
	isInf(Standard_Boolean)=Standard_False
	newScopeSpan(Standard_Real)=0.0

Returns:
	None

Creates an instance of ProgressSentry attaching it to  
         the specified ProgressIndicator, selects parameters of  
         the current scale, and opens a new scope with specified  
         span (equal to step by default)") Message_ProgressSentry;
		 Message_ProgressSentry (const Handle_Message_ProgressIndicator & PI,const Handle_TCollection_HAsciiString & name,const Standard_Real min,const Standard_Real max,const Standard_Real step,const Standard_Boolean isInf = Standard_False,const Standard_Real newScopeSpan = 0.0);
		%feature("autodoc", "Args:
	None
Returns:
	None

Moves progress indicator to the end of the current scale  
         and relieves sentry from its duty. Methods other than Show()  
         will do nothing after this one is called.") Relieve;
		void Relieve ();
		%feature("autodoc", "Args:
	name(char *)=0

Returns:
	None

No detailed docstring for this function.") Next;
		void Next (const char * name = 0);
		%feature("autodoc", "Args:
	span(Standard_Real)
	name(char *)=0

Returns:
	None

No detailed docstring for this function.") Next;
		void Next (const Standard_Real span,const char * name = 0);
		%feature("autodoc", "Args:
	span(Standard_Real)
	name(Handle_TCollection_HAsciiString)

Returns:
	None

Closes current scope and opens next one  
         with either specified or default span") Next;
		void Next (const Standard_Real span,const Handle_TCollection_HAsciiString & name);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False if ProgressIndicator signals UserBreak") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Forces update of progress indicator display") Show;
		void Show ();
};


%feature("shadow") Message_ProgressSentry::~Message_ProgressSentry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_ProgressSentry {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Message_SequenceNodeOfSequenceOfPrinters;
class Message_SequenceNodeOfSequenceOfPrinters : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Message_Printer)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Message_SequenceNodeOfSequenceOfPrinters;
		 Message_SequenceNodeOfSequenceOfPrinters (const Handle_Message_Printer & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Message_Printer

No detailed docstring for this function.") Value;
		Handle_Message_Printer & Value ();
};


%feature("shadow") Message_SequenceNodeOfSequenceOfPrinters::~Message_SequenceNodeOfSequenceOfPrinters %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_SequenceNodeOfSequenceOfPrinters {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Message_SequenceNodeOfSequenceOfPrinters {
	Handle_Message_SequenceNodeOfSequenceOfPrinters GetHandle() {
	return *(Handle_Message_SequenceNodeOfSequenceOfPrinters*) &$self;
	}
};

%nodefaultctor Handle_Message_SequenceNodeOfSequenceOfPrinters;
class Handle_Message_SequenceNodeOfSequenceOfPrinters : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Message_SequenceNodeOfSequenceOfPrinters();
        Handle_Message_SequenceNodeOfSequenceOfPrinters(const Handle_Message_SequenceNodeOfSequenceOfPrinters &aHandle);
        Handle_Message_SequenceNodeOfSequenceOfPrinters(const Message_SequenceNodeOfSequenceOfPrinters *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Message_SequenceNodeOfSequenceOfPrinters DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Message_SequenceNodeOfSequenceOfPrinters {
    Message_SequenceNodeOfSequenceOfPrinters* GetObject() {
    return (Message_SequenceNodeOfSequenceOfPrinters*)$self->Access();
    }
};
%feature("shadow") Handle_Message_SequenceNodeOfSequenceOfPrinters::~Handle_Message_SequenceNodeOfSequenceOfPrinters %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Message_SequenceNodeOfSequenceOfPrinters {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Message_SequenceNodeOfSequenceOfProgressScale;
class Message_SequenceNodeOfSequenceOfProgressScale : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Message_ProgressScale)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Message_SequenceNodeOfSequenceOfProgressScale;
		 Message_SequenceNodeOfSequenceOfProgressScale (const Message_ProgressScale & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Message_ProgressScale

No detailed docstring for this function.") Value;
		Message_ProgressScale & Value ();
};


%feature("shadow") Message_SequenceNodeOfSequenceOfProgressScale::~Message_SequenceNodeOfSequenceOfProgressScale %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_SequenceNodeOfSequenceOfProgressScale {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Message_SequenceNodeOfSequenceOfProgressScale {
	Handle_Message_SequenceNodeOfSequenceOfProgressScale GetHandle() {
	return *(Handle_Message_SequenceNodeOfSequenceOfProgressScale*) &$self;
	}
};

%nodefaultctor Handle_Message_SequenceNodeOfSequenceOfProgressScale;
class Handle_Message_SequenceNodeOfSequenceOfProgressScale : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Message_SequenceNodeOfSequenceOfProgressScale();
        Handle_Message_SequenceNodeOfSequenceOfProgressScale(const Handle_Message_SequenceNodeOfSequenceOfProgressScale &aHandle);
        Handle_Message_SequenceNodeOfSequenceOfProgressScale(const Message_SequenceNodeOfSequenceOfProgressScale *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Message_SequenceNodeOfSequenceOfProgressScale DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Message_SequenceNodeOfSequenceOfProgressScale {
    Message_SequenceNodeOfSequenceOfProgressScale* GetObject() {
    return (Message_SequenceNodeOfSequenceOfProgressScale*)$self->Access();
    }
};
%feature("shadow") Handle_Message_SequenceNodeOfSequenceOfProgressScale::~Handle_Message_SequenceNodeOfSequenceOfProgressScale %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Message_SequenceNodeOfSequenceOfProgressScale {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Message_SequenceOfPrinters;
class Message_SequenceOfPrinters : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Message_SequenceOfPrinters;
		 Message_SequenceOfPrinters ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Message_SequenceOfPrinters)

Returns:
	Message_SequenceOfPrinters

No detailed docstring for this function.") Assign;
		const Message_SequenceOfPrinters & Assign (const Message_SequenceOfPrinters & Other);
		%feature("autodoc", "Args:
	Other(Message_SequenceOfPrinters)

Returns:
	Message_SequenceOfPrinters

No detailed docstring for this function.") operator=;
		const Message_SequenceOfPrinters & operator = (const Message_SequenceOfPrinters & Other);
		%feature("autodoc", "Args:
	T(Handle_Message_Printer)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Message_Printer & T);
		%feature("autodoc", "Args:
	S(Message_SequenceOfPrinters)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Message_SequenceOfPrinters & S);
		%feature("autodoc", "Args:
	T(Handle_Message_Printer)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Message_Printer & T);
		%feature("autodoc", "Args:
	S(Message_SequenceOfPrinters)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Message_SequenceOfPrinters & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Message_Printer)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Message_Printer & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Message_SequenceOfPrinters)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Message_SequenceOfPrinters & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Message_Printer)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Message_Printer & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Message_SequenceOfPrinters)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Message_SequenceOfPrinters & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Message_Printer

No detailed docstring for this function.") First;
		const Handle_Message_Printer & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Message_Printer

No detailed docstring for this function.") Last;
		const Handle_Message_Printer & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Message_SequenceOfPrinters)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Message_SequenceOfPrinters & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Message_Printer

No detailed docstring for this function.") Value;
		const Handle_Message_Printer & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Message_Printer)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Message_Printer & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Message_Printer

No detailed docstring for this function.") ChangeValue;
		Handle_Message_Printer & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Message_SequenceOfPrinters::~Message_SequenceOfPrinters %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_SequenceOfPrinters {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Message_SequenceOfProgressScale;
class Message_SequenceOfProgressScale : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Message_SequenceOfProgressScale;
		 Message_SequenceOfProgressScale ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Message_SequenceOfProgressScale)

Returns:
	Message_SequenceOfProgressScale

No detailed docstring for this function.") Assign;
		const Message_SequenceOfProgressScale & Assign (const Message_SequenceOfProgressScale & Other);
		%feature("autodoc", "Args:
	Other(Message_SequenceOfProgressScale)

Returns:
	Message_SequenceOfProgressScale

No detailed docstring for this function.") operator=;
		const Message_SequenceOfProgressScale & operator = (const Message_SequenceOfProgressScale & Other);
		%feature("autodoc", "Args:
	T(Message_ProgressScale)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Message_ProgressScale & T);
		%feature("autodoc", "Args:
	S(Message_SequenceOfProgressScale)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Message_SequenceOfProgressScale & S);
		%feature("autodoc", "Args:
	T(Message_ProgressScale)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Message_ProgressScale & T);
		%feature("autodoc", "Args:
	S(Message_SequenceOfProgressScale)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Message_SequenceOfProgressScale & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Message_ProgressScale)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Message_ProgressScale & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Message_SequenceOfProgressScale)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Message_SequenceOfProgressScale & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Message_ProgressScale)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Message_ProgressScale & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Message_SequenceOfProgressScale)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Message_SequenceOfProgressScale & S);
		%feature("autodoc", "Args:
	None
Returns:
	Message_ProgressScale

No detailed docstring for this function.") First;
		const Message_ProgressScale & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Message_ProgressScale

No detailed docstring for this function.") Last;
		const Message_ProgressScale & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Message_SequenceOfProgressScale)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Message_SequenceOfProgressScale & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Message_ProgressScale

No detailed docstring for this function.") Value;
		const Message_ProgressScale & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Message_ProgressScale)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Message_ProgressScale & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Message_ProgressScale

No detailed docstring for this function.") ChangeValue;
		Message_ProgressScale & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Message_SequenceOfProgressScale::~Message_SequenceOfProgressScale %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_SequenceOfProgressScale {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Message_PrinterOStream;
class Message_PrinterOStream : public Message_Printer {
	public:
		%feature("autodoc", "Args:
	theTraceLevel(Message_Gravity)=Message_Info

Returns:
	None

Empty constructor, defaulting to cout") Message_PrinterOStream;
		 Message_PrinterOStream (const Message_Gravity theTraceLevel = Message_Info);
		%feature("autodoc", "Args:
	theFileName(char *)
	theDoAppend(Standard_Boolean)
	theTraceLevel(Message_Gravity)=Message_Info

Returns:
	None

Create printer for output to a specified file.  
         The option theDoAppend specifies whether file should be  
         appended or rewritten.  
         For specific file names (cout, cerr) standard streams are used") Message_PrinterOStream;
		 Message_PrinterOStream (const char * theFileName,const Standard_Boolean theDoAppend,const Message_Gravity theTraceLevel = Message_Info);
		%feature("autodoc", "Args:
	None
Returns:
	None

Flushes the output stream and destroys it if it has been  
         specified externally with option doFree (or if it is internal  
         file stream)") Close;
		void Close ();
		%feature("autodoc", "Args:
	None
Returns:
	Message_Gravity

Return trace level used for filtering messages;  
         messages with lover gravity will be ignored.") GetTraceLevel;
		Message_Gravity GetTraceLevel ();
		%feature("autodoc", "Args:
	theTraceLevel(Message_Gravity)

Returns:
	None

Set trace level used for filtering messages.  
         By default, trace level is Message_Info, so that  
         all messages are output") SetTraceLevel;
		void SetTraceLevel (const Message_Gravity theTraceLevel);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns option to convert non-Ascii symbols to UTF8 encoding") GetUseUtf8;
		Standard_Boolean GetUseUtf8 ();
		%feature("autodoc", "Args:
	useUtf8(Standard_Boolean)

Returns:
	None

Sets option to convert non-Ascii symbols to UTF8 encoding") SetUseUtf8;
		void SetUseUtf8 (const Standard_Boolean useUtf8);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_OStream

Returns reference to the output stream") GetStream;
		Standard_OStream & GetStream ();
		%feature("autodoc", "Args:
	theString(char *)
	theGravity(Message_Gravity)
	putEndl(Standard_Boolean)=Standard_True

Returns:
	virtual void

Puts a message to the current stream  
         if its gravity is equal or greater  
         to the trace level set by SetTraceLevel()") Send;
		virtual void Send (const char * theString,const Message_Gravity theGravity,const Standard_Boolean putEndl = Standard_True);
		%feature("autodoc", "Args:
	theString(TCollection_AsciiString)
	theGravity(Message_Gravity)
	putEndl(Standard_Boolean)=Standard_True

Returns:
	virtual void

Puts a message to the current stream  
         if its gravity is equal or greater  
         to the trace level set by SetTraceLevel()") Send;
		virtual void Send (const TCollection_AsciiString & theString,const Message_Gravity theGravity,const Standard_Boolean putEndl = Standard_True);
		%feature("autodoc", "Args:
	theString(TCollection_ExtendedString)
	theGravity(Message_Gravity)
	putEndl(Standard_Boolean)=Standard_True

Returns:
	virtual void

Puts a message to the current stream  
         if its gravity is equal or greater  
         to the trace level set by SetTraceLevel()  
         Non-Ascii symbols are converted to UTF-8 if UseUtf8  
         option is set, else replaced by symbols '?'") Send;
		virtual void Send (const TCollection_ExtendedString & theString,const Message_Gravity theGravity,const Standard_Boolean putEndl = Standard_True);
};


%feature("shadow") Message_PrinterOStream::~Message_PrinterOStream %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Message_PrinterOStream {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Message_PrinterOStream {
	Handle_Message_PrinterOStream GetHandle() {
	return *(Handle_Message_PrinterOStream*) &$self;
	}
};

%nodefaultctor Handle_Message_PrinterOStream;
class Handle_Message_PrinterOStream : public Handle_Message_Printer {

    public:
        // constructors
        Handle_Message_PrinterOStream();
        Handle_Message_PrinterOStream(const Handle_Message_PrinterOStream &aHandle);
        Handle_Message_PrinterOStream(const Message_PrinterOStream *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Message_PrinterOStream DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Message_PrinterOStream {
    Message_PrinterOStream* GetObject() {
    return (Message_PrinterOStream*)$self->Access();
    }
};
%feature("shadow") Handle_Message_PrinterOStream::~Handle_Message_PrinterOStream %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Message_PrinterOStream {
    void _kill_pointed() {
        delete $self;
    }
};

