/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include Message_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

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
class Message {
	public:
		%feature("compactdefaultargs") DefaultMessenger;
		%feature("autodoc", "	* Defines default messenger for OCCT applications. This is global static instance of the messenger. By default, it contains single printer directed to cout. It can be customized according to the application needs.

	:rtype: Handle_Message_Messenger
") DefaultMessenger;
		Handle_Message_Messenger DefaultMessenger ();
		%feature("compactdefaultargs") FillTime;
		%feature("autodoc", "	* Returns the string filled with values of hours, minutes and seconds. Example: 1. (5, 12, 26.3345) returns '05h:12m:26.33s', 2. (0, 6, 34.496 ) returns '06m:34.50s', 3. (0, 0, 4.5 ) returns '4.50s'

	:param Hour:
	:type Hour: int
	:param Minute:
	:type Minute: int
	:param Second:
	:type Second: float
	:rtype: TCollection_AsciiString
") FillTime;
		static TCollection_AsciiString FillTime (const Standard_Integer Hour,const Standard_Integer Minute,const Standard_Real Second);
};


%extend Message {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_Algorithm;
class Message_Algorithm : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Message_Algorithm;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") Message_Algorithm;
		 Message_Algorithm ();
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Sets status with no parameter

	:param theStat:
	:type theStat: Message_Status &
	:rtype: None
") SetStatus;
		void SetStatus (const Message_Status & theStat);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Sets status with integer parameter

	:param theStat:
	:type theStat: Message_Status &
	:param theInt:
	:type theInt: int
	:rtype: None
") SetStatus;
		void SetStatus (const Message_Status & theStat,const Standard_Integer theInt);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Sets status with string parameter. If noRepetitions is True, the parameter will be added only if it has not been yet recorded for the same status flag

	:param theStat:
	:type theStat: Message_Status &
	:param theStr:
	:type theStr: char *
	:param noRepetitions: default value is Standard_True
	:type noRepetitions: bool
	:rtype: None
") SetStatus;
		void SetStatus (const Message_Status & theStat,const char * theStr,const Standard_Boolean noRepetitions = Standard_True);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Sets status with string parameter If noRepetitions is True, the parameter will be added only if it has not been yet recorded for the same status flag

	:param theStat:
	:type theStat: Message_Status &
	:param theStr:
	:type theStr: TCollection_AsciiString &
	:param noRepetitions: default value is Standard_True
	:type noRepetitions: bool
	:rtype: None
") SetStatus;
		void SetStatus (const Message_Status & theStat,const TCollection_AsciiString & theStr,const Standard_Boolean noRepetitions = Standard_True);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Sets status with string parameter If noRepetitions is True, the parameter will be added only if it has not been yet recorded for the same status flag

	:param theStat:
	:type theStat: Message_Status &
	:param theStr:
	:type theStr: Handle_TCollection_HAsciiString &
	:param noRepetitions: default value is Standard_True
	:type noRepetitions: bool
	:rtype: None
") SetStatus;
		void SetStatus (const Message_Status & theStat,const Handle_TCollection_HAsciiString & theStr,const Standard_Boolean noRepetitions = Standard_True);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Sets status with string parameter If noRepetitions is True, the parameter will be added only if it has not been yet recorded for the same status flag

	:param theStat:
	:type theStat: Message_Status &
	:param theStr:
	:type theStr: TCollection_ExtendedString &
	:param noRepetitions: default value is Standard_True
	:type noRepetitions: bool
	:rtype: None
") SetStatus;
		void SetStatus (const Message_Status & theStat,const TCollection_ExtendedString & theStr,const Standard_Boolean noRepetitions = Standard_True);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Sets status with string parameter If noRepetitions is True, the parameter will be added only if it has not been yet recorded for the same status flag

	:param theStat:
	:type theStat: Message_Status &
	:param theStr:
	:type theStr: Handle_TCollection_HExtendedString &
	:param noRepetitions: default value is Standard_True
	:type noRepetitions: bool
	:rtype: None
") SetStatus;
		void SetStatus (const Message_Status & theStat,const Handle_TCollection_HExtendedString & theStr,const Standard_Boolean noRepetitions = Standard_True);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Sets status with preformatted message. This message will be used directly to report the status; automatic generation of status messages will be disabled for it.

	:param theStat:
	:type theStat: Message_Status &
	:param theMsg:
	:type theMsg: Message_Msg &
	:rtype: None
") SetStatus;
		void SetStatus (const Message_Status & theStat,const Message_Msg & theMsg);
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "	* Returns copy of exec status of algorithm

	:rtype: Message_ExecStatus
") GetStatus;
		const Message_ExecStatus & GetStatus ();
		%feature("compactdefaultargs") ChangeStatus;
		%feature("autodoc", "	* Returns exec status of algorithm

	:rtype: Message_ExecStatus
") ChangeStatus;
		Message_ExecStatus & ChangeStatus ();
		%feature("compactdefaultargs") ClearStatus;
		%feature("autodoc", "	* Clear exec status of algorithm

	:rtype: None
") ClearStatus;
		void ClearStatus ();
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "	* Sets messenger to algorithm

	:param theMsgr:
	:type theMsgr: Handle_Message_Messenger &
	:rtype: None
") SetMessenger;
		void SetMessenger (const Handle_Message_Messenger & theMsgr);
		%feature("compactdefaultargs") GetMessenger;
		%feature("autodoc", "	* Returns messenger of algorithm. The returned handle is always non-null and can be used for sending messages.

	:rtype: Handle_Message_Messenger
") GetMessenger;
		Handle_Message_Messenger GetMessenger ();
		%feature("compactdefaultargs") SendStatusMessages;
		%feature("autodoc", "	* Print messages for all status flags that have been set during algorithm execution, excluding statuses that are NOT set in theFilter. //! The messages are taken from resource file, names being constructed as {dynamic class type}.{status name}, for instance, 'Message_Algorithm.Fail5'. If message is not found in resources for this class and all its base types, surrogate text is printed. //! For the statuses having number or string parameters, theMaxCount defines maximal number of numbers or strings to be included in the message //! Note that this method is virtual; this allows descendant classes to customize message output (e.g. by adding messages from other sub-algorithms)

	:param theFilter:
	:type theFilter: Message_ExecStatus &
	:param theTraceLevel: default value is Message_Warning
	:type theTraceLevel: Message_Gravity
	:param theMaxCount: default value is 20
	:type theMaxCount: int
	:rtype: void
") SendStatusMessages;
		virtual void SendStatusMessages (const Message_ExecStatus & theFilter,const Message_Gravity theTraceLevel = Message_Warning,const Standard_Integer theMaxCount = 20);
		%feature("compactdefaultargs") SendMessages;
		%feature("autodoc", "	* Convenient variant of SendStatusMessages() with theFilter having defined all WARN, ALARM, and FAIL (but not DONE) status flags

	:param theTraceLevel: default value is Message_Warning
	:type theTraceLevel: Message_Gravity
	:param theMaxCount: default value is 20
	:type theMaxCount: int
	:rtype: None
") SendMessages;
		void SendMessages (const Message_Gravity theTraceLevel = Message_Warning,const Standard_Integer theMaxCount = 20);
		%feature("compactdefaultargs") AddStatus;
		%feature("autodoc", "	* Add statuses to this algorithm from other algorithm (including messages)

	:param theOther:
	:type theOther: Handle_Message_Algorithm &
	:rtype: None
") AddStatus;
		void AddStatus (const Handle_Message_Algorithm & theOther);
		%feature("compactdefaultargs") AddStatus;
		%feature("autodoc", "	* Add statuses to this algorithm from other algorithm, but only those items are moved that correspond to statuses set in theStatus

	:param theStatus:
	:type theStatus: Message_ExecStatus &
	:param theOther:
	:type theOther: Handle_Message_Algorithm &
	:rtype: None
") AddStatus;
		void AddStatus (const Message_ExecStatus & theStatus,const Handle_Message_Algorithm & theOther);
		%feature("compactdefaultargs") GetMessageNumbers;
		%feature("autodoc", "	* Return the numbers associated with the indicated status; Null handle if no such status or no numbers associated with it

	:param theStatus:
	:type theStatus: Message_Status &
	:rtype: Handle_TColStd_HPackedMapOfInteger
") GetMessageNumbers;
		Handle_TColStd_HPackedMapOfInteger GetMessageNumbers (const Message_Status & theStatus);
		%feature("compactdefaultargs") GetMessageStrings;
		%feature("autodoc", "	* Return the strings associated with the indicated status; Null handle if no such status or no strings associated with it

	:param theStatus:
	:type theStatus: Message_Status &
	:rtype: Handle_TColStd_HSequenceOfHExtendedString
") GetMessageStrings;
		Handle_TColStd_HSequenceOfHExtendedString GetMessageStrings (const Message_Status & theStatus);
		%feature("compactdefaultargs") PrepareReport;
		%feature("autodoc", "	* Prepares a string containing a list of integers contained in theError map, but not more than theMaxCount

	:param theError:
	:type theError: Handle_TColStd_HPackedMapOfInteger &
	:param theMaxCount:
	:type theMaxCount: int
	:rtype: TCollection_ExtendedString
") PrepareReport;
		static TCollection_ExtendedString PrepareReport (const Handle_TColStd_HPackedMapOfInteger & theError,const Standard_Integer theMaxCount);
		%feature("compactdefaultargs") PrepareReport;
		%feature("autodoc", "	* Prepares a string containing a list of names contained in theReportSeq sequence, but not more than theMaxCount

	:param theReportSeq:
	:type theReportSeq: TColStd_SequenceOfHExtendedString &
	:param theMaxCount:
	:type theMaxCount: int
	:rtype: TCollection_ExtendedString
") PrepareReport;
		static TCollection_ExtendedString PrepareReport (const TColStd_SequenceOfHExtendedString & theReportSeq,const Standard_Integer theMaxCount);
};


%extend Message_Algorithm {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Message_Algorithm(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Message_Algorithm::Handle_Message_Algorithm %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Message_Algorithm* _get_reference() {
    return (Message_Algorithm*)$self->Access();
    }
};

%extend Handle_Message_Algorithm {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Message_Algorithm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_ListIteratorOfListOfMsg;
class Message_ListIteratorOfListOfMsg {
	public:
		%feature("compactdefaultargs") Message_ListIteratorOfListOfMsg;
		%feature("autodoc", "	:rtype: None
") Message_ListIteratorOfListOfMsg;
		 Message_ListIteratorOfListOfMsg ();
		%feature("compactdefaultargs") Message_ListIteratorOfListOfMsg;
		%feature("autodoc", "	:param L:
	:type L: Message_ListOfMsg &
	:rtype: None
") Message_ListIteratorOfListOfMsg;
		 Message_ListIteratorOfListOfMsg (const Message_ListOfMsg & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: Message_ListOfMsg &
	:rtype: None
") Initialize;
		void Initialize (const Message_ListOfMsg & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Message_Msg
") Value;
		Message_Msg & Value ();
};


%extend Message_ListIteratorOfListOfMsg {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_ListNodeOfListOfMsg;
class Message_ListNodeOfListOfMsg : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Message_ListNodeOfListOfMsg;
		%feature("autodoc", "	:param I:
	:type I: Message_Msg &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Message_ListNodeOfListOfMsg;
		 Message_ListNodeOfListOfMsg (const Message_Msg & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Message_Msg
") Value;
		Message_Msg & Value ();
};


%extend Message_ListNodeOfListOfMsg {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Message_ListNodeOfListOfMsg(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Message_ListNodeOfListOfMsg::Handle_Message_ListNodeOfListOfMsg %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Message_ListNodeOfListOfMsg* _get_reference() {
    return (Message_ListNodeOfListOfMsg*)$self->Access();
    }
};

%extend Handle_Message_ListNodeOfListOfMsg {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Message_ListNodeOfListOfMsg {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_ListOfMsg;
class Message_ListOfMsg {
	public:
		%feature("compactdefaultargs") Message_ListOfMsg;
		%feature("autodoc", "	:rtype: None
") Message_ListOfMsg;
		 Message_ListOfMsg ();
		%feature("compactdefaultargs") Message_ListOfMsg;
		%feature("autodoc", "	:param Other:
	:type Other: Message_ListOfMsg &
	:rtype: None
") Message_ListOfMsg;
		 Message_ListOfMsg (const Message_ListOfMsg & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Message_ListOfMsg &
	:rtype: None
") Assign;
		void Assign (const Message_ListOfMsg & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Message_ListOfMsg &
	:rtype: None
") operator =;
		void operator = (const Message_ListOfMsg & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Message_Msg &
	:rtype: None
") Prepend;
		void Prepend (const Message_Msg & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Message_Msg &
	:param theIt:
	:type theIt: Message_ListIteratorOfListOfMsg &
	:rtype: None
") Prepend;
		void Prepend (const Message_Msg & I,Message_ListIteratorOfListOfMsg & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: Message_ListOfMsg &
	:rtype: None
") Prepend;
		void Prepend (Message_ListOfMsg & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Message_Msg &
	:rtype: None
") Append;
		void Append (const Message_Msg & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Message_Msg &
	:param theIt:
	:type theIt: Message_ListIteratorOfListOfMsg &
	:rtype: None
") Append;
		void Append (const Message_Msg & I,Message_ListIteratorOfListOfMsg & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: Message_ListOfMsg &
	:rtype: None
") Append;
		void Append (Message_ListOfMsg & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Message_Msg
") First;
		Message_Msg & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Message_Msg
") Last;
		Message_Msg & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: Message_ListIteratorOfListOfMsg &
	:rtype: None
") Remove;
		void Remove (Message_ListIteratorOfListOfMsg & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Message_Msg &
	:param It:
	:type It: Message_ListIteratorOfListOfMsg &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Message_Msg & I,Message_ListIteratorOfListOfMsg & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: Message_ListOfMsg &
	:param It:
	:type It: Message_ListIteratorOfListOfMsg &
	:rtype: None
") InsertBefore;
		void InsertBefore (Message_ListOfMsg & Other,Message_ListIteratorOfListOfMsg & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Message_Msg &
	:param It:
	:type It: Message_ListIteratorOfListOfMsg &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Message_Msg & I,Message_ListIteratorOfListOfMsg & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: Message_ListOfMsg &
	:param It:
	:type It: Message_ListIteratorOfListOfMsg &
	:rtype: None
") InsertAfter;
		void InsertAfter (Message_ListOfMsg & Other,Message_ListIteratorOfListOfMsg & It);
};


%extend Message_ListOfMsg {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_Messenger;
class Message_Messenger : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Message_Messenger;
		%feature("autodoc", "	* Empty constructor; initializes by single printer directed to cout. Note: the default messenger is not empty but directed to cout in order to protect against possibility to forget defining printers. If printing to cout is not needed, clear messenger by GetPrinters().Clear()

	:rtype: None
") Message_Messenger;
		 Message_Messenger ();
		%feature("compactdefaultargs") Message_Messenger;
		%feature("autodoc", "	* Create messenger with single printer

	:param thePrinter:
	:type thePrinter: Handle_Message_Printer &
	:rtype: None
") Message_Messenger;
		 Message_Messenger (const Handle_Message_Printer & thePrinter);
		%feature("compactdefaultargs") AddPrinter;
		%feature("autodoc", "	* Add a printer to the messenger. The printer will be added only if it is not yet in the list. Returns True if printer has been added.

	:param thePrinter:
	:type thePrinter: Handle_Message_Printer &
	:rtype: bool
") AddPrinter;
		Standard_Boolean AddPrinter (const Handle_Message_Printer & thePrinter);
		%feature("compactdefaultargs") RemovePrinter;
		%feature("autodoc", "	* Removes specified printer from the messenger. Returns True if this printer has been found in the list and removed.

	:param thePrinter:
	:type thePrinter: Handle_Message_Printer &
	:rtype: bool
") RemovePrinter;
		Standard_Boolean RemovePrinter (const Handle_Message_Printer & thePrinter);
		%feature("compactdefaultargs") RemovePrinters;
		%feature("autodoc", "	* Removes printers of specified type (including derived classes) from the messenger. Returns number of removed printers.

	:param theType:
	:type theType: Handle_Standard_Type &
	:rtype: int
") RemovePrinters;
		Standard_Integer RemovePrinters (const Handle_Standard_Type & theType);
		%feature("compactdefaultargs") Printers;
		%feature("autodoc", "	* Returns current sequence of printers

	:rtype: Message_SequenceOfPrinters
") Printers;
		const Message_SequenceOfPrinters & Printers ();
		%feature("compactdefaultargs") ChangePrinters;
		%feature("autodoc", "	* Returns sequence of printers The sequence can be modified.

	:rtype: Message_SequenceOfPrinters
") ChangePrinters;
		Message_SequenceOfPrinters & ChangePrinters ();
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "	* Dispatch a message to all the printers in the list. Three versions of string representations are accepted for convenience, by default all are converted to ExtendedString. The parameter putEndl specifies whether the new line should be started after this message (default) or not (may have sense in some conditions).

	:param theString:
	:type theString: char *
	:param theGravity: default value is Message_Warning
	:type theGravity: Message_Gravity
	:param putEndl: default value is Standard_True
	:type putEndl: bool
	:rtype: None
") Send;
		void Send (const char * theString,const Message_Gravity theGravity = Message_Warning,const Standard_Boolean putEndl = Standard_True);
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "	* See above

	:param theString:
	:type theString: TCollection_AsciiString &
	:param theGravity: default value is Message_Warning
	:type theGravity: Message_Gravity
	:param putEndl: default value is Standard_True
	:type putEndl: bool
	:rtype: None
") Send;
		void Send (const TCollection_AsciiString & theString,const Message_Gravity theGravity = Message_Warning,const Standard_Boolean putEndl = Standard_True);
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "	* See above

	:param theString:
	:type theString: TCollection_ExtendedString &
	:param theGravity: default value is Message_Warning
	:type theGravity: Message_Gravity
	:param putEndl: default value is Standard_True
	:type putEndl: bool
	:rtype: None
") Send;
		void Send (const TCollection_ExtendedString & theString,const Message_Gravity theGravity = Message_Warning,const Standard_Boolean putEndl = Standard_True);
};


%extend Message_Messenger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Message_Messenger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Message_Messenger::Handle_Message_Messenger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Message_Messenger* _get_reference() {
    return (Message_Messenger*)$self->Access();
    }
};

%extend Handle_Message_Messenger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Message_Messenger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Message_MsgFile {
	public:
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Load message file <theFileName> from directory <theDirName> or its sub-directory

	:param theDirName:
	:type theDirName: char *
	:param theFileName:
	:type theFileName: char *
	:rtype: bool
") Load;
		static Standard_Boolean Load (const char * theDirName,const char * theFileName);
		%feature("compactdefaultargs") LoadFile;
		%feature("autodoc", "	* Load the messages from the given file, additive to any previously loaded messages. Messages with same keywords, if already present, are replaced with the new ones.

	:param theFName:
	:type theFName: char *
	:rtype: bool
") LoadFile;
		static Standard_Boolean LoadFile (const char * theFName);
		%feature("compactdefaultargs") LoadFromEnv;
		%feature("autodoc", "	* Loads the messages from the file with name (without extension) given by environment variable. Extension of the file name is given separately. If its not defined, it is taken: - by default from environment CSF_LANGUAGE, - if not defined either, as 'us'.

	:param envname:
	:type envname: char *
	:param filename:
	:type filename: char *
	:param ext: default value is ""
	:type ext: char *
	:rtype: void
") LoadFromEnv;
		static void LoadFromEnv (const char * envname,const char * filename,const char * ext = "");
		%feature("compactdefaultargs") AddMsg;
		%feature("autodoc", "	* Adds new message to the map. Parameter <key> gives the key of the message, <text> defines the message itself. If there already was defined the message identified by the same keyword, it is replaced with the new one.

	:param key:
	:type key: TCollection_AsciiString &
	:param text:
	:type text: TCollection_ExtendedString &
	:rtype: bool
") AddMsg;
		static Standard_Boolean AddMsg (const TCollection_AsciiString & key,const TCollection_ExtendedString & text);
		%feature("compactdefaultargs") HasMsg;
		%feature("autodoc", "	* Returns True if message with specified keyword is registered

	:param key:
	:type key: TCollection_AsciiString &
	:rtype: bool
") HasMsg;
		static Standard_Boolean HasMsg (const TCollection_AsciiString & key);
		%feature("compactdefaultargs") Msg;
		%feature("autodoc", "	:param key:
	:type key: char *
	:rtype: TCollection_ExtendedString
") Msg;
		static const TCollection_ExtendedString & Msg (const char * key);
		%feature("compactdefaultargs") Msg;
		%feature("autodoc", "	* Gives the text for the message identified by the keyword <key> If there are no messages with such keyword defined, the error message is returned. In that case reference to static string is returned, it can be chenged with next call(s) to Msg(). Note: The error message is constructed like 'Unknown message: <key>', and can itself be customized by defining message with key Message_Msg_BadKeyword.

	:param key:
	:type key: TCollection_AsciiString &
	:rtype: TCollection_ExtendedString
") Msg;
		static const TCollection_ExtendedString & Msg (const TCollection_AsciiString & key);
};


%extend Message_MsgFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_Printer;
class Message_Printer : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") GetTraceLevel;
		%feature("autodoc", "	* Return trace level used for filtering messages; messages with lover gravity will be ignored.

	:rtype: Message_Gravity
") GetTraceLevel;
		Message_Gravity GetTraceLevel ();
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "	* Set trace level used for filtering messages. By default, trace level is Message_Info, so that all messages are output

	:param theTraceLevel:
	:type theTraceLevel: Message_Gravity
	:rtype: None
") SetTraceLevel;
		void SetTraceLevel (const Message_Gravity theTraceLevel);
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "	* Send a string message with specified trace level. The parameter theToPutEol specified whether end-of-line should be added to the end of the message. This method must be redefined in descentant.

	:param theString:
	:type theString: TCollection_ExtendedString &
	:param theGravity:
	:type theGravity: Message_Gravity
	:param theToPutEol:
	:type theToPutEol: bool
	:rtype: void
") Send;
		virtual void Send (const TCollection_ExtendedString & theString,const Message_Gravity theGravity,const Standard_Boolean theToPutEol);
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "	* Send a string message with specified trace level. The parameter theToPutEol specified whether end-of-line should be added to the end of the message. Default implementation calls first method Send().

	:param theString:
	:type theString: char *
	:param theGravity:
	:type theGravity: Message_Gravity
	:param theToPutEol:
	:type theToPutEol: bool
	:rtype: void
") Send;
		virtual void Send (const char * theString,const Message_Gravity theGravity,const Standard_Boolean theToPutEol);
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "	* Send a string message with specified trace level. The parameter theToPutEol specified whether end-of-line should be added to the end of the message. Default implementation calls first method Send().

	:param theString:
	:type theString: TCollection_AsciiString &
	:param theGravity:
	:type theGravity: Message_Gravity
	:param theToPutEol:
	:type theToPutEol: bool
	:rtype: void
") Send;
		virtual void Send (const TCollection_AsciiString & theString,const Message_Gravity theGravity,const Standard_Boolean theToPutEol);
};


%extend Message_Printer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Message_Printer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Message_Printer::Handle_Message_Printer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Message_Printer* _get_reference() {
    return (Message_Printer*)$self->Access();
    }
};

%extend Handle_Message_Printer {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Message_Printer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_ProgressIndicator;
class Message_ProgressIndicator : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Drops all scopes and sets scale from 0 to 100, step 1 This scale has name 'Step'

	:rtype: void
") Reset;
		virtual void Reset ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param name:
	:type name: char *
	:rtype: None
") SetName;
		void SetName (const char * name);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set (optional) name for scale

	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & name);
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "	* Set range for current scale

	:param min:
	:type min: float
	:param max:
	:type max: float
	:rtype: None
") SetRange;
		void SetRange (const Standard_Real min,const Standard_Real max);
		%feature("compactdefaultargs") SetStep;
		%feature("autodoc", "	* Set step for current scale

	:param step:
	:type step: float
	:rtype: None
") SetStep;
		void SetStep (const Standard_Real step);
		%feature("compactdefaultargs") SetInfinite;
		%feature("autodoc", "	* Set or drop infinite mode for the current scale

	:param isInf: default value is Standard_True
	:type isInf: bool
	:rtype: None
") SetInfinite;
		void SetInfinite (const Standard_Boolean isInf = Standard_True);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param min:
	:type min: float
	:param max:
	:type max: float
	:param step:
	:type step: float
	:param isInf: default value is Standard_False
	:type isInf: bool
	:rtype: None
") SetScale;
		void SetScale (const char * name,const Standard_Real min,const Standard_Real max,const Standard_Real step,const Standard_Boolean isInf = Standard_False);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Set all parameters for current scale

	:param min:
	:type min: float
	:param max:
	:type max: float
	:param step:
	:type step: float
	:param isInf: default value is Standard_False
	:type isInf: bool
	:rtype: None
") SetScale;
		void SetScale (const Standard_Real min,const Standard_Real max,const Standard_Real step,const Standard_Boolean isInf = Standard_False);
		%feature("compactdefaultargs") GetScale;
		%feature("autodoc", "	* Returns all parameters for current scale

	:param min:
	:type min: float &
	:param max:
	:type max: float &
	:param step:
	:type step: float &
	:param isInf:
	:type isInf: bool
	:rtype: None
") GetScale;
		void GetScale (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param val:
	:type val: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Real val);
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "	* Set and get progress value at current scale If the value to be set is more than currently set one, or out of range for the current scale, it is limited by that range

	:rtype: float
") GetValue;
		Standard_Real GetValue ();
		%feature("compactdefaultargs") Increment;
		%feature("autodoc", "	:rtype: None
") Increment;
		void Increment ();
		%feature("compactdefaultargs") Increment;
		%feature("autodoc", "	* Increment the progress value by the default of specified step

	:param step:
	:type step: float
	:rtype: None
") Increment;
		void Increment (const Standard_Real step);
		%feature("compactdefaultargs") NewScope;
		%feature("autodoc", "	:param name: default value is 0
	:type name: char *
	:rtype: bool
") NewScope;
		Standard_Boolean NewScope (const char * name = 0);
		%feature("compactdefaultargs") NewScope;
		%feature("autodoc", "	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:rtype: bool
") NewScope;
		Standard_Boolean NewScope (const Handle_TCollection_HAsciiString & name);
		%feature("compactdefaultargs") NewScope;
		%feature("autodoc", "	:param span:
	:type span: float
	:param name: default value is 0
	:type name: char *
	:rtype: bool
") NewScope;
		Standard_Boolean NewScope (const Standard_Real span,const char * name = 0);
		%feature("compactdefaultargs") NewScope;
		%feature("autodoc", "	* Creates new scope on a part of a current scale from current position with span either equal to default step, or specified The scale for the new scope will have specified name and ranged from 0 to 100 with step 1 Returns False if something is wrong in arguments or in current position of progress indicator; scope is opened anyway

	:param span:
	:type span: float
	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:rtype: bool
") NewScope;
		Standard_Boolean NewScope (const Standard_Real span,const Handle_TCollection_HAsciiString & name);
		%feature("compactdefaultargs") EndScope;
		%feature("autodoc", "	* Close the current scope and thus return to previous scale Updates position to be at the end of the closing scope Returns False if no scope is opened

	:rtype: bool
") EndScope;
		Standard_Boolean EndScope ();
		%feature("compactdefaultargs") NextScope;
		%feature("autodoc", "	:param name: default value is 0
	:type name: char *
	:rtype: bool
") NextScope;
		Standard_Boolean NextScope (const char * name = 0);
		%feature("compactdefaultargs") NextScope;
		%feature("autodoc", "	* Optimized version of { return EndScope() && NewScope(); }

	:param span:
	:type span: float
	:param name: default value is 0
	:type name: char *
	:rtype: bool
") NextScope;
		Standard_Boolean NextScope (const Standard_Real span,const char * name = 0);
		%feature("compactdefaultargs") UserBreak;
		%feature("autodoc", "	* Should return True if user has send a break signal. Default implementation returns False.

	:rtype: bool
") UserBreak;
		virtual Standard_Boolean UserBreak ();
		%feature("compactdefaultargs") Show;
		%feature("autodoc", "	* Update presentation of the progress indicator Called when progress position is changed Flag force is intended for forcing update in case if it is optimized; all internal calls from ProgressIndicator are done with this flag equal to False

	:param force: default value is Standard_True
	:type force: bool
	:rtype: bool
") Show;
		virtual Standard_Boolean Show (const Standard_Boolean force = Standard_True);
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "	* Returns total progress position on the basic scale ranged from 0. to 1.

	:rtype: float
") GetPosition;
		Standard_Real GetPosition ();
		%feature("compactdefaultargs") GetNbScopes;
		%feature("autodoc", "	* Returns current number of opened scopes This number is always >=1 as top-level scale is always present

	:rtype: int
") GetNbScopes;
		Standard_Integer GetNbScopes ();
		%feature("compactdefaultargs") GetScope;
		%feature("autodoc", "	* Returns data for scale of index-th scope The first scope is current one, the last is the top-level one

	:param index:
	:type index: int
	:rtype: Message_ProgressScale
") GetScope;
		const Message_ProgressScale & GetScope (const Standard_Integer index);
};


%extend Message_ProgressIndicator {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Message_ProgressIndicator(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Message_ProgressIndicator::Handle_Message_ProgressIndicator %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Message_ProgressIndicator* _get_reference() {
    return (Message_ProgressIndicator*)$self->Access();
    }
};

%extend Handle_Message_ProgressIndicator {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Message_ProgressIndicator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_ProgressScale;
class Message_ProgressScale {
	public:
		%feature("compactdefaultargs") Message_ProgressScale;
		%feature("autodoc", "	* Creates scale ranged from 0 to 100 with step 1

	:rtype: None
") Message_ProgressScale;
		 Message_ProgressScale ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param theName:
	:type theName: char *
	:rtype: None
") SetName;
		void SetName (const char * theName);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Sets scale name

	:param theName:
	:type theName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & theName);
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	* Gets scale name Name may be Null handle if not set

	:rtype: Handle_TCollection_HAsciiString
") GetName;
		Handle_TCollection_HAsciiString GetName ();
		%feature("compactdefaultargs") SetMin;
		%feature("autodoc", "	* Sets minimum value of scale

	:param theMin:
	:type theMin: float
	:rtype: None
") SetMin;
		void SetMin (const Standard_Real theMin);
		%feature("compactdefaultargs") GetMin;
		%feature("autodoc", "	* Gets minimum value of scale

	:rtype: float
") GetMin;
		Standard_Real GetMin ();
		%feature("compactdefaultargs") SetMax;
		%feature("autodoc", "	* Sets minimum value of scale

	:param theMax:
	:type theMax: float
	:rtype: None
") SetMax;
		void SetMax (const Standard_Real theMax);
		%feature("compactdefaultargs") GetMax;
		%feature("autodoc", "	* Gets minimum value of scale

	:rtype: float
") GetMax;
		Standard_Real GetMax ();
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "	* Set both min and max

	:param min:
	:type min: float
	:param max:
	:type max: float
	:rtype: None
") SetRange;
		void SetRange (const Standard_Real min,const Standard_Real max);
		%feature("compactdefaultargs") SetStep;
		%feature("autodoc", "	* Sets default step

	:param theStep:
	:type theStep: float
	:rtype: None
") SetStep;
		void SetStep (const Standard_Real theStep);
		%feature("compactdefaultargs") GetStep;
		%feature("autodoc", "	* Gets default step

	:rtype: float
") GetStep;
		Standard_Real GetStep ();
		%feature("compactdefaultargs") SetInfinite;
		%feature("autodoc", "	* Sets flag for infinite scale

	:param theInfinite: default value is Standard_True
	:type theInfinite: bool
	:rtype: None
") SetInfinite;
		void SetInfinite (const Standard_Boolean theInfinite = Standard_True);
		%feature("compactdefaultargs") GetInfinite;
		%feature("autodoc", "	* Gets flag for infinite scale

	:rtype: bool
") GetInfinite;
		Standard_Boolean GetInfinite ();
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Set all scale parameters

	:param min:
	:type min: float
	:param max:
	:type max: float
	:param step:
	:type step: float
	:param theInfinite: default value is Standard_True
	:type theInfinite: bool
	:rtype: None
") SetScale;
		void SetScale (const Standard_Real min,const Standard_Real max,const Standard_Real step,const Standard_Boolean theInfinite = Standard_True);
		%feature("compactdefaultargs") SetSpan;
		%feature("autodoc", "	* Defines span occupied by the scale on the basis scale

	:param first:
	:type first: float
	:param last:
	:type last: float
	:rtype: None
") SetSpan;
		void SetSpan (const Standard_Real first,const Standard_Real last);
		%feature("compactdefaultargs") GetFirst;
		%feature("autodoc", "	:rtype: float
") GetFirst;
		Standard_Real GetFirst ();
		%feature("compactdefaultargs") GetLast;
		%feature("autodoc", "	* Return information on span occupied by the scale on the base scale

	:rtype: float
") GetLast;
		Standard_Real GetLast ();
		%feature("compactdefaultargs") LocalToBase;
		%feature("autodoc", "	:param val:
	:type val: float
	:rtype: float
") LocalToBase;
		Standard_Real LocalToBase (const Standard_Real val);
		%feature("compactdefaultargs") BaseToLocal;
		%feature("autodoc", "	* Convert value from this scale to base one and back

	:param val:
	:type val: float
	:rtype: float
") BaseToLocal;
		Standard_Real BaseToLocal (const Standard_Real val);
};


%extend Message_ProgressScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_ProgressSentry;
class Message_ProgressSentry {
	public:
		%feature("compactdefaultargs") Message_ProgressSentry;
		%feature("autodoc", "	:param PI:
	:type PI: Handle_Message_ProgressIndicator &
	:param name:
	:type name: char *
	:param min:
	:type min: float
	:param max:
	:type max: float
	:param step:
	:type step: float
	:param isInf: default value is Standard_False
	:type isInf: bool
	:param newScopeSpan: default value is 0.0
	:type newScopeSpan: float
	:rtype: None
") Message_ProgressSentry;
		 Message_ProgressSentry (const Handle_Message_ProgressIndicator & PI,const char * name,const Standard_Real min,const Standard_Real max,const Standard_Real step,const Standard_Boolean isInf = Standard_False,const Standard_Real newScopeSpan = 0.0);
		%feature("compactdefaultargs") Message_ProgressSentry;
		%feature("autodoc", "	* Creates an instance of ProgressSentry attaching it to the specified ProgressIndicator, selects parameters of the current scale, and opens a new scope with specified span (equal to step by default)

	:param PI:
	:type PI: Handle_Message_ProgressIndicator &
	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:param min:
	:type min: float
	:param max:
	:type max: float
	:param step:
	:type step: float
	:param isInf: default value is Standard_False
	:type isInf: bool
	:param newScopeSpan: default value is 0.0
	:type newScopeSpan: float
	:rtype: None
") Message_ProgressSentry;
		 Message_ProgressSentry (const Handle_Message_ProgressIndicator & PI,const Handle_TCollection_HAsciiString & name,const Standard_Real min,const Standard_Real max,const Standard_Real step,const Standard_Boolean isInf = Standard_False,const Standard_Real newScopeSpan = 0.0);
		%feature("compactdefaultargs") Relieve;
		%feature("autodoc", "	* Moves progress indicator to the end of the current scale and relieves sentry from its duty. Methods other than Show() will do nothing after this one is called.

	:rtype: None
") Relieve;
		void Relieve ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:param name: default value is 0
	:type name: char *
	:rtype: None
") Next;
		void Next (const char * name = 0);
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:param span:
	:type span: float
	:param name: default value is 0
	:type name: char *
	:rtype: None
") Next;
		void Next (const Standard_Real span,const char * name = 0);
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Closes current scope and opens next one with either specified or default span

	:param span:
	:type span: float
	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:rtype: None
") Next;
		void Next (const Standard_Real span,const Handle_TCollection_HAsciiString & name);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns False if ProgressIndicator signals UserBreak

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Show;
		%feature("autodoc", "	* Forces update of progress indicator display

	:rtype: None
") Show;
		void Show ();
};


%extend Message_ProgressSentry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_SequenceNodeOfSequenceOfPrinters;
class Message_SequenceNodeOfSequenceOfPrinters : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Message_SequenceNodeOfSequenceOfPrinters;
		%feature("autodoc", "	:param I:
	:type I: Handle_Message_Printer &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Message_SequenceNodeOfSequenceOfPrinters;
		 Message_SequenceNodeOfSequenceOfPrinters (const Handle_Message_Printer & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Message_Printer
") Value;
		Handle_Message_Printer Value ();
};


%extend Message_SequenceNodeOfSequenceOfPrinters {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Message_SequenceNodeOfSequenceOfPrinters(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Message_SequenceNodeOfSequenceOfPrinters::Handle_Message_SequenceNodeOfSequenceOfPrinters %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Message_SequenceNodeOfSequenceOfPrinters* _get_reference() {
    return (Message_SequenceNodeOfSequenceOfPrinters*)$self->Access();
    }
};

%extend Handle_Message_SequenceNodeOfSequenceOfPrinters {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Message_SequenceNodeOfSequenceOfPrinters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_SequenceNodeOfSequenceOfProgressScale;
class Message_SequenceNodeOfSequenceOfProgressScale : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Message_SequenceNodeOfSequenceOfProgressScale;
		%feature("autodoc", "	:param I:
	:type I: Message_ProgressScale &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Message_SequenceNodeOfSequenceOfProgressScale;
		 Message_SequenceNodeOfSequenceOfProgressScale (const Message_ProgressScale & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Message_ProgressScale
") Value;
		Message_ProgressScale & Value ();
};


%extend Message_SequenceNodeOfSequenceOfProgressScale {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Message_SequenceNodeOfSequenceOfProgressScale(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Message_SequenceNodeOfSequenceOfProgressScale::Handle_Message_SequenceNodeOfSequenceOfProgressScale %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Message_SequenceNodeOfSequenceOfProgressScale* _get_reference() {
    return (Message_SequenceNodeOfSequenceOfProgressScale*)$self->Access();
    }
};

%extend Handle_Message_SequenceNodeOfSequenceOfProgressScale {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Message_SequenceNodeOfSequenceOfProgressScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_SequenceOfPrinters;
class Message_SequenceOfPrinters : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Message_SequenceOfPrinters;
		%feature("autodoc", "	:rtype: None
") Message_SequenceOfPrinters;
		 Message_SequenceOfPrinters ();
		%feature("compactdefaultargs") Message_SequenceOfPrinters;
		%feature("autodoc", "	:param Other:
	:type Other: Message_SequenceOfPrinters &
	:rtype: None
") Message_SequenceOfPrinters;
		 Message_SequenceOfPrinters (const Message_SequenceOfPrinters & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Message_SequenceOfPrinters &
	:rtype: Message_SequenceOfPrinters
") Assign;
		const Message_SequenceOfPrinters & Assign (const Message_SequenceOfPrinters & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Message_SequenceOfPrinters &
	:rtype: Message_SequenceOfPrinters
") operator =;
		const Message_SequenceOfPrinters & operator = (const Message_SequenceOfPrinters & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Message_Printer &
	:rtype: None
") Append;
		void Append (const Handle_Message_Printer & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Message_SequenceOfPrinters &
	:rtype: None
") Append;
		void Append (Message_SequenceOfPrinters & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Message_Printer &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Message_Printer & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Message_SequenceOfPrinters &
	:rtype: None
") Prepend;
		void Prepend (Message_SequenceOfPrinters & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Message_Printer &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Message_Printer & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Message_SequenceOfPrinters &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Message_SequenceOfPrinters & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Message_Printer &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Message_Printer & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Message_SequenceOfPrinters &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Message_SequenceOfPrinters & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Message_Printer
") First;
		Handle_Message_Printer First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Message_Printer
") Last;
		Handle_Message_Printer Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Message_SequenceOfPrinters &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Message_SequenceOfPrinters & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Message_Printer
") Value;
		Handle_Message_Printer Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Message_Printer &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Message_Printer & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Message_Printer
") ChangeValue;
		Handle_Message_Printer ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Message_SequenceOfPrinters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_SequenceOfProgressScale;
class Message_SequenceOfProgressScale : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Message_SequenceOfProgressScale;
		%feature("autodoc", "	:rtype: None
") Message_SequenceOfProgressScale;
		 Message_SequenceOfProgressScale ();
		%feature("compactdefaultargs") Message_SequenceOfProgressScale;
		%feature("autodoc", "	:param Other:
	:type Other: Message_SequenceOfProgressScale &
	:rtype: None
") Message_SequenceOfProgressScale;
		 Message_SequenceOfProgressScale (const Message_SequenceOfProgressScale & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Message_SequenceOfProgressScale &
	:rtype: Message_SequenceOfProgressScale
") Assign;
		const Message_SequenceOfProgressScale & Assign (const Message_SequenceOfProgressScale & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Message_SequenceOfProgressScale &
	:rtype: Message_SequenceOfProgressScale
") operator =;
		const Message_SequenceOfProgressScale & operator = (const Message_SequenceOfProgressScale & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Message_ProgressScale &
	:rtype: None
") Append;
		void Append (const Message_ProgressScale & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Message_SequenceOfProgressScale &
	:rtype: None
") Append;
		void Append (Message_SequenceOfProgressScale & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Message_ProgressScale &
	:rtype: None
") Prepend;
		void Prepend (const Message_ProgressScale & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Message_SequenceOfProgressScale &
	:rtype: None
") Prepend;
		void Prepend (Message_SequenceOfProgressScale & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Message_ProgressScale &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Message_ProgressScale & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Message_SequenceOfProgressScale &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Message_SequenceOfProgressScale & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Message_ProgressScale &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Message_ProgressScale & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Message_SequenceOfProgressScale &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Message_SequenceOfProgressScale & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Message_ProgressScale
") First;
		const Message_ProgressScale & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Message_ProgressScale
") Last;
		const Message_ProgressScale & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Message_SequenceOfProgressScale &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Message_SequenceOfProgressScale & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Message_ProgressScale
") Value;
		const Message_ProgressScale & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Message_ProgressScale &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Message_ProgressScale & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Message_ProgressScale
") ChangeValue;
		Message_ProgressScale & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Message_SequenceOfProgressScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Message_PrinterOStream;
class Message_PrinterOStream : public Message_Printer {
	public:
		%feature("compactdefaultargs") Message_PrinterOStream;
		%feature("autodoc", "	* Empty constructor, defaulting to cout

	:param theTraceLevel: default value is Message_Info
	:type theTraceLevel: Message_Gravity
	:rtype: None
") Message_PrinterOStream;
		 Message_PrinterOStream (const Message_Gravity theTraceLevel = Message_Info);
		%feature("compactdefaultargs") Message_PrinterOStream;
		%feature("autodoc", "	* Create printer for output to a specified file. The option theDoAppend specifies whether file should be appended or rewritten. For specific file names (cout, cerr) standard streams are used

	:param theFileName:
	:type theFileName: char *
	:param theDoAppend:
	:type theDoAppend: bool
	:param theTraceLevel: default value is Message_Info
	:type theTraceLevel: Message_Gravity
	:rtype: None
") Message_PrinterOStream;
		 Message_PrinterOStream (const char * theFileName,const Standard_Boolean theDoAppend,const Message_Gravity theTraceLevel = Message_Info);
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "	* Flushes the output stream and destroys it if it has been specified externally with option doFree (or if it is internal file stream)

	:rtype: None
") Close;
		void Close ();
		%feature("compactdefaultargs") GetUseUtf8;
		%feature("autodoc", "	* Returns option to convert non-Ascii symbols to UTF8 encoding

	:rtype: bool
") GetUseUtf8;
		Standard_Boolean GetUseUtf8 ();
		%feature("compactdefaultargs") SetUseUtf8;
		%feature("autodoc", "	* Sets option to convert non-Ascii symbols to UTF8 encoding

	:param useUtf8:
	:type useUtf8: bool
	:rtype: None
") SetUseUtf8;
		void SetUseUtf8 (const Standard_Boolean useUtf8);
		%feature("compactdefaultargs") GetStream;
		%feature("autodoc", "	* Returns reference to the output stream

	:rtype: Standard_OStream
") GetStream;
		Standard_OStream & GetStream ();
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "	* Puts a message to the current stream if its gravity is equal or greater to the trace level set by SetTraceLevel()

	:param theString:
	:type theString: char *
	:param theGravity:
	:type theGravity: Message_Gravity
	:param putEndl: default value is Standard_True
	:type putEndl: bool
	:rtype: void
") Send;
		virtual void Send (const char * theString,const Message_Gravity theGravity,const Standard_Boolean putEndl = Standard_True);
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "	* Puts a message to the current stream if its gravity is equal or greater to the trace level set by SetTraceLevel()

	:param theString:
	:type theString: TCollection_AsciiString &
	:param theGravity:
	:type theGravity: Message_Gravity
	:param putEndl: default value is Standard_True
	:type putEndl: bool
	:rtype: void
") Send;
		virtual void Send (const TCollection_AsciiString & theString,const Message_Gravity theGravity,const Standard_Boolean putEndl = Standard_True);
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "	* Puts a message to the current stream if its gravity is equal or greater to the trace level set by SetTraceLevel() Non-Ascii symbols are converted to UTF-8 if UseUtf8 option is set, else replaced by symbols '?'

	:param theString:
	:type theString: TCollection_ExtendedString &
	:param theGravity:
	:type theGravity: Message_Gravity
	:param putEndl: default value is Standard_True
	:type putEndl: bool
	:rtype: void
") Send;
		virtual void Send (const TCollection_ExtendedString & theString,const Message_Gravity theGravity,const Standard_Boolean putEndl = Standard_True);
};


%extend Message_PrinterOStream {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Message_PrinterOStream(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Message_PrinterOStream::Handle_Message_PrinterOStream %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Message_PrinterOStream* _get_reference() {
    return (Message_PrinterOStream*)$self->Access();
    }
};

%extend Handle_Message_PrinterOStream {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Message_PrinterOStream {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
