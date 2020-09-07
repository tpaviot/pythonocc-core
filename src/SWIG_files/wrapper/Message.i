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
%define MESSAGEDOCSTRING
"Message module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_message.html"
%enddef
%module (package="OCC.Core", docstring=MESSAGEDOCSTRING) Message


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
#include<Message_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
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

enum Message_Gravity {
	Message_Trace = 0,
	Message_Info = 1,
	Message_Warning = 2,
	Message_Alarm = 3,
	Message_Fail = 4,
};

enum Message_StatusType {
	Message_DONE = 256,
	Message_WARN = 512,
	Message_ALARM = 1024,
	Message_FAIL = 2048,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Message_Status(IntEnum):
	Message_None = 0
	Message_Done1 = Message_DONE
	Message_Done2 = 2
	Message_Done3 = 3
	Message_Done4 = 4
	Message_Done5 = 5
	Message_Done6 = 6
	Message_Done7 = 7
	Message_Done8 = 8
	Message_Done9 = 9
	Message_Done10 = 10
	Message_Done11 = 11
	Message_Done12 = 12
	Message_Done13 = 13
	Message_Done14 = 14
	Message_Done15 = 15
	Message_Done16 = 16
	Message_Done17 = 17
	Message_Done18 = 18
	Message_Done19 = 19
	Message_Done20 = 20
	Message_Done21 = 21
	Message_Done22 = 22
	Message_Done23 = 23
	Message_Done24 = 24
	Message_Done25 = 25
	Message_Done26 = 26
	Message_Done27 = 27
	Message_Done28 = 28
	Message_Done29 = 29
	Message_Done30 = 30
	Message_Done31 = 31
	Message_Done32 = 32
	Message_Warn1 = Message_WARN
	Message_Warn2 = 34
	Message_Warn3 = 35
	Message_Warn4 = 36
	Message_Warn5 = 37
	Message_Warn6 = 38
	Message_Warn7 = 39
	Message_Warn8 = 40
	Message_Warn9 = 41
	Message_Warn10 = 42
	Message_Warn11 = 43
	Message_Warn12 = 44
	Message_Warn13 = 45
	Message_Warn14 = 46
	Message_Warn15 = 47
	Message_Warn16 = 48
	Message_Warn17 = 49
	Message_Warn18 = 50
	Message_Warn19 = 51
	Message_Warn20 = 52
	Message_Warn21 = 53
	Message_Warn22 = 54
	Message_Warn23 = 55
	Message_Warn24 = 56
	Message_Warn25 = 57
	Message_Warn26 = 58
	Message_Warn27 = 59
	Message_Warn28 = 60
	Message_Warn29 = 61
	Message_Warn30 = 62
	Message_Warn31 = 63
	Message_Warn32 = 64
	Message_Alarm1 = Message_ALARM
	Message_Alarm2 = 66
	Message_Alarm3 = 67
	Message_Alarm4 = 68
	Message_Alarm5 = 69
	Message_Alarm6 = 70
	Message_Alarm7 = 71
	Message_Alarm8 = 72
	Message_Alarm9 = 73
	Message_Alarm10 = 74
	Message_Alarm11 = 75
	Message_Alarm12 = 76
	Message_Alarm13 = 77
	Message_Alarm14 = 78
	Message_Alarm15 = 79
	Message_Alarm16 = 80
	Message_Alarm17 = 81
	Message_Alarm18 = 82
	Message_Alarm19 = 83
	Message_Alarm20 = 84
	Message_Alarm21 = 85
	Message_Alarm22 = 86
	Message_Alarm23 = 87
	Message_Alarm24 = 88
	Message_Alarm25 = 89
	Message_Alarm26 = 90
	Message_Alarm27 = 91
	Message_Alarm28 = 92
	Message_Alarm29 = 93
	Message_Alarm30 = 94
	Message_Alarm31 = 95
	Message_Alarm32 = 96
	Message_Fail1 = Message_FAIL
	Message_Fail2 = 98
	Message_Fail3 = 99
	Message_Fail4 = 100
	Message_Fail5 = 101
	Message_Fail6 = 102
	Message_Fail7 = 103
	Message_Fail8 = 104
	Message_Fail9 = 105
	Message_Fail10 = 106
	Message_Fail11 = 107
	Message_Fail12 = 108
	Message_Fail13 = 109
	Message_Fail14 = 110
	Message_Fail15 = 111
	Message_Fail16 = 112
	Message_Fail17 = 113
	Message_Fail18 = 114
	Message_Fail19 = 115
	Message_Fail20 = 116
	Message_Fail21 = 117
	Message_Fail22 = 118
	Message_Fail23 = 119
	Message_Fail24 = 120
	Message_Fail25 = 121
	Message_Fail26 = 122
	Message_Fail27 = 123
	Message_Fail28 = 124
	Message_Fail29 = 125
	Message_Fail30 = 126
	Message_Fail31 = 127
	Message_Fail32 = 128
Message_None = Message_Status.Message_None
Message_Done1 = Message_Status.Message_Done1
Message_Done2 = Message_Status.Message_Done2
Message_Done3 = Message_Status.Message_Done3
Message_Done4 = Message_Status.Message_Done4
Message_Done5 = Message_Status.Message_Done5
Message_Done6 = Message_Status.Message_Done6
Message_Done7 = Message_Status.Message_Done7
Message_Done8 = Message_Status.Message_Done8
Message_Done9 = Message_Status.Message_Done9
Message_Done10 = Message_Status.Message_Done10
Message_Done11 = Message_Status.Message_Done11
Message_Done12 = Message_Status.Message_Done12
Message_Done13 = Message_Status.Message_Done13
Message_Done14 = Message_Status.Message_Done14
Message_Done15 = Message_Status.Message_Done15
Message_Done16 = Message_Status.Message_Done16
Message_Done17 = Message_Status.Message_Done17
Message_Done18 = Message_Status.Message_Done18
Message_Done19 = Message_Status.Message_Done19
Message_Done20 = Message_Status.Message_Done20
Message_Done21 = Message_Status.Message_Done21
Message_Done22 = Message_Status.Message_Done22
Message_Done23 = Message_Status.Message_Done23
Message_Done24 = Message_Status.Message_Done24
Message_Done25 = Message_Status.Message_Done25
Message_Done26 = Message_Status.Message_Done26
Message_Done27 = Message_Status.Message_Done27
Message_Done28 = Message_Status.Message_Done28
Message_Done29 = Message_Status.Message_Done29
Message_Done30 = Message_Status.Message_Done30
Message_Done31 = Message_Status.Message_Done31
Message_Done32 = Message_Status.Message_Done32
Message_Warn1 = Message_Status.Message_Warn1
Message_Warn2 = Message_Status.Message_Warn2
Message_Warn3 = Message_Status.Message_Warn3
Message_Warn4 = Message_Status.Message_Warn4
Message_Warn5 = Message_Status.Message_Warn5
Message_Warn6 = Message_Status.Message_Warn6
Message_Warn7 = Message_Status.Message_Warn7
Message_Warn8 = Message_Status.Message_Warn8
Message_Warn9 = Message_Status.Message_Warn9
Message_Warn10 = Message_Status.Message_Warn10
Message_Warn11 = Message_Status.Message_Warn11
Message_Warn12 = Message_Status.Message_Warn12
Message_Warn13 = Message_Status.Message_Warn13
Message_Warn14 = Message_Status.Message_Warn14
Message_Warn15 = Message_Status.Message_Warn15
Message_Warn16 = Message_Status.Message_Warn16
Message_Warn17 = Message_Status.Message_Warn17
Message_Warn18 = Message_Status.Message_Warn18
Message_Warn19 = Message_Status.Message_Warn19
Message_Warn20 = Message_Status.Message_Warn20
Message_Warn21 = Message_Status.Message_Warn21
Message_Warn22 = Message_Status.Message_Warn22
Message_Warn23 = Message_Status.Message_Warn23
Message_Warn24 = Message_Status.Message_Warn24
Message_Warn25 = Message_Status.Message_Warn25
Message_Warn26 = Message_Status.Message_Warn26
Message_Warn27 = Message_Status.Message_Warn27
Message_Warn28 = Message_Status.Message_Warn28
Message_Warn29 = Message_Status.Message_Warn29
Message_Warn30 = Message_Status.Message_Warn30
Message_Warn31 = Message_Status.Message_Warn31
Message_Warn32 = Message_Status.Message_Warn32
Message_Alarm1 = Message_Status.Message_Alarm1
Message_Alarm2 = Message_Status.Message_Alarm2
Message_Alarm3 = Message_Status.Message_Alarm3
Message_Alarm4 = Message_Status.Message_Alarm4
Message_Alarm5 = Message_Status.Message_Alarm5
Message_Alarm6 = Message_Status.Message_Alarm6
Message_Alarm7 = Message_Status.Message_Alarm7
Message_Alarm8 = Message_Status.Message_Alarm8
Message_Alarm9 = Message_Status.Message_Alarm9
Message_Alarm10 = Message_Status.Message_Alarm10
Message_Alarm11 = Message_Status.Message_Alarm11
Message_Alarm12 = Message_Status.Message_Alarm12
Message_Alarm13 = Message_Status.Message_Alarm13
Message_Alarm14 = Message_Status.Message_Alarm14
Message_Alarm15 = Message_Status.Message_Alarm15
Message_Alarm16 = Message_Status.Message_Alarm16
Message_Alarm17 = Message_Status.Message_Alarm17
Message_Alarm18 = Message_Status.Message_Alarm18
Message_Alarm19 = Message_Status.Message_Alarm19
Message_Alarm20 = Message_Status.Message_Alarm20
Message_Alarm21 = Message_Status.Message_Alarm21
Message_Alarm22 = Message_Status.Message_Alarm22
Message_Alarm23 = Message_Status.Message_Alarm23
Message_Alarm24 = Message_Status.Message_Alarm24
Message_Alarm25 = Message_Status.Message_Alarm25
Message_Alarm26 = Message_Status.Message_Alarm26
Message_Alarm27 = Message_Status.Message_Alarm27
Message_Alarm28 = Message_Status.Message_Alarm28
Message_Alarm29 = Message_Status.Message_Alarm29
Message_Alarm30 = Message_Status.Message_Alarm30
Message_Alarm31 = Message_Status.Message_Alarm31
Message_Alarm32 = Message_Status.Message_Alarm32
Message_Fail1 = Message_Status.Message_Fail1
Message_Fail2 = Message_Status.Message_Fail2
Message_Fail3 = Message_Status.Message_Fail3
Message_Fail4 = Message_Status.Message_Fail4
Message_Fail5 = Message_Status.Message_Fail5
Message_Fail6 = Message_Status.Message_Fail6
Message_Fail7 = Message_Status.Message_Fail7
Message_Fail8 = Message_Status.Message_Fail8
Message_Fail9 = Message_Status.Message_Fail9
Message_Fail10 = Message_Status.Message_Fail10
Message_Fail11 = Message_Status.Message_Fail11
Message_Fail12 = Message_Status.Message_Fail12
Message_Fail13 = Message_Status.Message_Fail13
Message_Fail14 = Message_Status.Message_Fail14
Message_Fail15 = Message_Status.Message_Fail15
Message_Fail16 = Message_Status.Message_Fail16
Message_Fail17 = Message_Status.Message_Fail17
Message_Fail18 = Message_Status.Message_Fail18
Message_Fail19 = Message_Status.Message_Fail19
Message_Fail20 = Message_Status.Message_Fail20
Message_Fail21 = Message_Status.Message_Fail21
Message_Fail22 = Message_Status.Message_Fail22
Message_Fail23 = Message_Status.Message_Fail23
Message_Fail24 = Message_Status.Message_Fail24
Message_Fail25 = Message_Status.Message_Fail25
Message_Fail26 = Message_Status.Message_Fail26
Message_Fail27 = Message_Status.Message_Fail27
Message_Fail28 = Message_Status.Message_Fail28
Message_Fail29 = Message_Status.Message_Fail29
Message_Fail30 = Message_Status.Message_Fail30
Message_Fail31 = Message_Status.Message_Fail31
Message_Fail32 = Message_Status.Message_Fail32

class Message_Gravity(IntEnum):
	Message_Trace = 0
	Message_Info = 1
	Message_Warning = 2
	Message_Alarm = 3
	Message_Fail = 4
Message_Trace = Message_Gravity.Message_Trace
Message_Info = Message_Gravity.Message_Info
Message_Warning = Message_Gravity.Message_Warning
Message_Alarm = Message_Gravity.Message_Alarm
Message_Fail = Message_Gravity.Message_Fail

class Message_StatusType(IntEnum):
	Message_DONE = 256
	Message_WARN = 512
	Message_ALARM = 1024
	Message_FAIL = 2048
Message_DONE = Message_StatusType.Message_DONE
Message_WARN = Message_StatusType.Message_WARN
Message_ALARM = Message_StatusType.Message_ALARM
Message_FAIL = Message_StatusType.Message_FAIL
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Message_Alert)
%wrap_handle(Message_Algorithm)
%wrap_handle(Message_Messenger)
%wrap_handle(Message_Printer)
%wrap_handle(Message_ProgressIndicator)
%wrap_handle(Message_Report)
%wrap_handle(Message_PrinterOStream)
/* end handles declaration */

/* templates */
%template(Message_ListIteratorOfListOfMsg) NCollection_TListIterator<Message_Msg>;
%template(Message_ListOfAlert) NCollection_List<opencascade::handle<Message_Alert>>;

%extend NCollection_List<opencascade::handle<Message_Alert>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Message_ListOfMsg) NCollection_List<Message_Msg>;

%extend NCollection_List<Message_Msg> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Message_SequenceOfPrinters) NCollection_Sequence<opencascade::handle<Message_Printer>>;

%extend NCollection_Sequence<opencascade::handle<Message_Printer>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Message_SequenceOfProgressScale) NCollection_Sequence<Message_ProgressScale>;

%extend NCollection_Sequence<Message_ProgressScale> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<NCollection_Handle<Message_Msg>> Message_ArrayOfMsg;
typedef NCollection_Handle<Message_ArrayOfMsg> Message_HArrayOfMsg;
typedef NCollection_List<Message_Msg>::Iterator Message_ListIteratorOfListOfMsg;
typedef NCollection_List<opencascade::handle<Message_Alert>> Message_ListOfAlert;
typedef NCollection_List<Message_Msg> Message_ListOfMsg;
typedef NCollection_Sequence<opencascade::handle<Message_Printer>> Message_SequenceOfPrinters;
typedef NCollection_Sequence<Message_ProgressScale> Message_SequenceOfProgressScale;
/* end typedefs declaration */

/****************
* class Message *
****************/
%rename(message) Message;
class Message {
	public:
		/****************** DefaultMessenger ******************/
		/**** md5 signature: 8a9431fd909e432979fe2c3e70cbbe64 ****/
		%feature("compactdefaultargs") DefaultMessenger;
		%feature("autodoc", "Defines default messenger for occt applications. this is global static instance of the messenger. by default, it contains single printer directed to std::cout. it can be customized according to the application needs.

Returns
-------
opencascade::handle<Message_Messenger>
") DefaultMessenger;
		static const opencascade::handle<Message_Messenger> & DefaultMessenger();

		/****************** FillTime ******************/
		/**** md5 signature: dab98a75a667832aa851701dbbc2d085 ****/
		%feature("compactdefaultargs") FillTime;
		%feature("autodoc", "Returns the string filled with values of hours, minutes and seconds. example: 1. (5, 12, 26.3345) returns '05h:12m:26.33s', 2. (0, 6, 34.496 ) returns '06m:34.50s', 3. (0, 0, 4.5 ) returns '4.50s'.

Parameters
----------
Hour: int
Minute: int
Second: float

Returns
-------
TCollection_AsciiString
") FillTime;
		static TCollection_AsciiString FillTime(const Standard_Integer Hour, const Standard_Integer Minute, const Standard_Real Second);

};


%extend Message {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Message_Alert *
**********************/
class Message_Alert : public Standard_Transient {
	public:
		/****************** GetMessageKey ******************/
		/**** md5 signature: 71c9c83f94a6139aa0d49ac59c2b9561 ****/
		%feature("compactdefaultargs") GetMessageKey;
		%feature("autodoc", "Return a c string to be used as a key for generating text user messages describing this alert. the messages are generated with help of message_msg class, in message_report::dump(). base implementation returns dynamic type name of the instance.

Returns
-------
char *
") GetMessageKey;
		virtual const char * GetMessageKey();

		/****************** Merge ******************/
		/**** md5 signature: acdcb5438c842f7d18969756cbabade8 ****/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "If possible, merge data contained in this alert to thetarget. returns true if merged. base implementation always returns true.

Parameters
----------
theTarget: Message_Alert

Returns
-------
bool
") Merge;
		virtual Standard_Boolean Merge(const opencascade::handle<Message_Alert> & theTarget);

		/****************** SupportsMerge ******************/
		/**** md5 signature: b7457ae62f3508957acc79d507c0f597 ****/
		%feature("compactdefaultargs") SupportsMerge;
		%feature("autodoc", "Return true if this type of alert can be merged with other of the same type to avoid duplication. basis implementation returns true.

Returns
-------
bool
") SupportsMerge;
		virtual Standard_Boolean SupportsMerge();

};


%make_alias(Message_Alert)

%extend Message_Alert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Message_Algorithm *
**************************/
class Message_Algorithm : public Standard_Transient {
	public:
		/****************** Message_Algorithm ******************/
		/**** md5 signature: 12d6bd8c99a95d2833911157429858a4 ****/
		%feature("compactdefaultargs") Message_Algorithm;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Message_Algorithm;
		 Message_Algorithm();

		/****************** AddStatus ******************/
		/**** md5 signature: f6dda77e0947cfb85246bb737511e5cc ****/
		%feature("compactdefaultargs") AddStatus;
		%feature("autodoc", "Add statuses to this algorithm from other algorithm (including messages).

Parameters
----------
theOther: Message_Algorithm

Returns
-------
None
") AddStatus;
		void AddStatus(const opencascade::handle<Message_Algorithm> & theOther);

		/****************** AddStatus ******************/
		/**** md5 signature: 4bbf279213d9544ffb207550533087a1 ****/
		%feature("compactdefaultargs") AddStatus;
		%feature("autodoc", "Add statuses to this algorithm from other algorithm, but only those items are moved that correspond to statuses set in thestatus.

Parameters
----------
theStatus: Message_ExecStatus
theOther: Message_Algorithm

Returns
-------
None
") AddStatus;
		void AddStatus(const Message_ExecStatus & theStatus, const opencascade::handle<Message_Algorithm> & theOther);

		/****************** ChangeStatus ******************/
		/**** md5 signature: 583e8574056630c34fa6f25a0f2b96ed ****/
		%feature("compactdefaultargs") ChangeStatus;
		%feature("autodoc", "Returns exec status of algorithm.

Returns
-------
Message_ExecStatus
") ChangeStatus;
		Message_ExecStatus & ChangeStatus();

		/****************** ClearStatus ******************/
		/**** md5 signature: 21a2c99a72906d5acfdd614a4359180e ****/
		%feature("compactdefaultargs") ClearStatus;
		%feature("autodoc", "Clear exec status of algorithm.

Returns
-------
None
") ClearStatus;
		void ClearStatus();

		/****************** GetMessageNumbers ******************/
		/**** md5 signature: 92b002636f2cd59f62fc121d1a632035 ****/
		%feature("compactdefaultargs") GetMessageNumbers;
		%feature("autodoc", "Return the numbers associated with the indicated status; null handle if no such status or no numbers associated with it.

Parameters
----------
theStatus: Message_Status

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") GetMessageNumbers;
		opencascade::handle<TColStd_HPackedMapOfInteger> GetMessageNumbers(const Message_Status & theStatus);

		/****************** GetMessageStrings ******************/
		/**** md5 signature: b96182c7abb8c320b6a5139b02e6b62f ****/
		%feature("compactdefaultargs") GetMessageStrings;
		%feature("autodoc", "Return the strings associated with the indicated status; null handle if no such status or no strings associated with it.

Parameters
----------
theStatus: Message_Status

Returns
-------
opencascade::handle<TColStd_HSequenceOfHExtendedString>
") GetMessageStrings;
		opencascade::handle<TColStd_HSequenceOfHExtendedString> GetMessageStrings(const Message_Status & theStatus);

		/****************** GetMessenger ******************/
		/**** md5 signature: 29076e594d0ec0e5d3c6d238094013a4 ****/
		%feature("compactdefaultargs") GetMessenger;
		%feature("autodoc", "Returns messenger of algorithm. the returned handle is always non-null and can be used for sending messages.

Returns
-------
opencascade::handle<Message_Messenger>
") GetMessenger;
		opencascade::handle<Message_Messenger> GetMessenger();

		/****************** GetStatus ******************/
		/**** md5 signature: 1c5d4227b70baf0287080bbbca1cccdd ****/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Returns copy of exec status of algorithm.

Returns
-------
Message_ExecStatus
") GetStatus;
		const Message_ExecStatus & GetStatus();

		/****************** PrepareReport ******************/
		/**** md5 signature: 22eb00e4bad6cc91192d03864338d970 ****/
		%feature("compactdefaultargs") PrepareReport;
		%feature("autodoc", "Prepares a string containing a list of integers contained in theerror map, but not more than themaxcount.

Parameters
----------
theError: TColStd_HPackedMapOfInteger
theMaxCount: int

Returns
-------
TCollection_ExtendedString
") PrepareReport;
		static TCollection_ExtendedString PrepareReport(const opencascade::handle<TColStd_HPackedMapOfInteger> & theError, const Standard_Integer theMaxCount);

		/****************** PrepareReport ******************/
		/**** md5 signature: a760ed814814b3ab4fdc40e0177e2b35 ****/
		%feature("compactdefaultargs") PrepareReport;
		%feature("autodoc", "Prepares a string containing a list of names contained in thereportseq sequence, but not more than themaxcount.

Parameters
----------
theReportSeq: TColStd_SequenceOfHExtendedString
theMaxCount: int

Returns
-------
TCollection_ExtendedString
") PrepareReport;
		static TCollection_ExtendedString PrepareReport(const TColStd_SequenceOfHExtendedString & theReportSeq, const Standard_Integer theMaxCount);

		/****************** SendMessages ******************/
		/**** md5 signature: b1a44b272f7dccdd35a09052dff1cdc3 ****/
		%feature("compactdefaultargs") SendMessages;
		%feature("autodoc", "Convenient variant of sendstatusmessages() with thefilter having defined all warn, alarm, and fail (but not done) status flags.

Parameters
----------
theTraceLevel: Message_Gravity,optional
	default value is Message_Warning
theMaxCount: int,optional
	default value is 20

Returns
-------
None
") SendMessages;
		void SendMessages(const Message_Gravity theTraceLevel = Message_Warning, const Standard_Integer theMaxCount = 20);

		/****************** SendStatusMessages ******************/
		/**** md5 signature: 292dfafa4847d965f2c85cf36450acef ****/
		%feature("compactdefaultargs") SendStatusMessages;
		%feature("autodoc", "Print messages for all status flags that have been set during algorithm execution, excluding statuses that are not set in thefilter. //! the messages are taken from resource file, names being constructed as {dynamic class type}.{status name}, for instance, 'message_algorithm.fail5'. if message is not found in resources for this class and all its base types, surrogate text is printed. //! for the statuses having number or string parameters, themaxcount defines maximal number of numbers or strings to be included in the message //! note that this method is virtual; this allows descendant classes to customize message output (e.g. by adding messages from other sub-algorithms).

Parameters
----------
theFilter: Message_ExecStatus
theTraceLevel: Message_Gravity,optional
	default value is Message_Warning
theMaxCount: int,optional
	default value is 20

Returns
-------
None
") SendStatusMessages;
		virtual void SendStatusMessages(const Message_ExecStatus & theFilter, const Message_Gravity theTraceLevel = Message_Warning, const Standard_Integer theMaxCount = 20);

		/****************** SetMessenger ******************/
		/**** md5 signature: abb58d7a57a486fe28d78b4ad1c82b73 ****/
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "Sets messenger to algorithm.

Parameters
----------
theMsgr: Message_Messenger

Returns
-------
None
") SetMessenger;
		void SetMessenger(const opencascade::handle<Message_Messenger> & theMsgr);

		/****************** SetStatus ******************/
		/**** md5 signature: 44674c449a47b5acb2b18993462d233f ****/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Sets status with no parameter.

Parameters
----------
theStat: Message_Status

Returns
-------
None
") SetStatus;
		void SetStatus(const Message_Status & theStat);

		/****************** SetStatus ******************/
		/**** md5 signature: 8016fc7828e232650c6431b67db88b7d ****/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Sets status with integer parameter.

Parameters
----------
theStat: Message_Status
theInt: int

Returns
-------
None
") SetStatus;
		void SetStatus(const Message_Status & theStat, const Standard_Integer theInt);

		/****************** SetStatus ******************/
		/**** md5 signature: 6bee2d8786f13b996a483f0fe4a9e1b2 ****/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Sets status with string parameter. if norepetitions is true, the parameter will be added only if it has not been yet recorded for the same status flag.

Parameters
----------
theStat: Message_Status
theStr: char *
noRepetitions: bool,optional
	default value is Standard_True

Returns
-------
None
") SetStatus;
		void SetStatus(const Message_Status & theStat, const char * theStr, const Standard_Boolean noRepetitions = Standard_True);

		/****************** SetStatus ******************/
		/**** md5 signature: 6ea7f63dea4d03ea5d72c2052270b87e ****/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Sets status with string parameter if norepetitions is true, the parameter will be added only if it has not been yet recorded for the same status flag.

Parameters
----------
theStat: Message_Status
theStr: TCollection_AsciiString
noRepetitions: bool,optional
	default value is Standard_True

Returns
-------
None
") SetStatus;
		void SetStatus(const Message_Status & theStat, const TCollection_AsciiString & theStr, const Standard_Boolean noRepetitions = Standard_True);

		/****************** SetStatus ******************/
		/**** md5 signature: e8c38966846b71da031483a199e40a71 ****/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Sets status with string parameter if norepetitions is true, the parameter will be added only if it has not been yet recorded for the same status flag.

Parameters
----------
theStat: Message_Status
theStr: TCollection_HAsciiString
noRepetitions: bool,optional
	default value is Standard_True

Returns
-------
None
") SetStatus;
		void SetStatus(const Message_Status & theStat, const opencascade::handle<TCollection_HAsciiString> & theStr, const Standard_Boolean noRepetitions = Standard_True);

		/****************** SetStatus ******************/
		/**** md5 signature: ab2887c539ef3a405d8f2b1f591c379c ****/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Sets status with string parameter if norepetitions is true, the parameter will be added only if it has not been yet recorded for the same status flag.

Parameters
----------
theStat: Message_Status
theStr: TCollection_ExtendedString
noRepetitions: bool,optional
	default value is Standard_True

Returns
-------
None
") SetStatus;
		void SetStatus(const Message_Status & theStat, const TCollection_ExtendedString & theStr, const Standard_Boolean noRepetitions = Standard_True);

		/****************** SetStatus ******************/
		/**** md5 signature: 8aad4895c12632591f8b584c181b749e ****/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Sets status with string parameter if norepetitions is true, the parameter will be added only if it has not been yet recorded for the same status flag.

Parameters
----------
theStat: Message_Status
theStr: TCollection_HExtendedString
noRepetitions: bool,optional
	default value is Standard_True

Returns
-------
None
") SetStatus;
		void SetStatus(const Message_Status & theStat, const opencascade::handle<TCollection_HExtendedString> & theStr, const Standard_Boolean noRepetitions = Standard_True);

		/****************** SetStatus ******************/
		/**** md5 signature: 45fc0d88809b7418ca0779427ba9522b ****/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Sets status with preformatted message. this message will be used directly to report the status; automatic generation of status messages will be disabled for it.

Parameters
----------
theStat: Message_Status
theMsg: Message_Msg

Returns
-------
None
") SetStatus;
		void SetStatus(const Message_Status & theStat, const Message_Msg & theMsg);

};


%make_alias(Message_Algorithm)

%extend Message_Algorithm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Message_ExecStatus *
***************************/
class Message_ExecStatus {
	public:
/* public enums */
enum StatusRange {
	FirstStatus = 1,
	StatusesPerType = 32,
	NbStatuses = 128,
	LastStatus = 129,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class StatusRange(IntEnum):
	FirstStatus = 1
	StatusesPerType = 32
	NbStatuses = 128
	LastStatus = 129
FirstStatus = StatusRange.FirstStatus
StatusesPerType = StatusRange.StatusesPerType
NbStatuses = StatusRange.NbStatuses
LastStatus = StatusRange.LastStatus
};
/* end python proxy for enums */

		/****************** Message_ExecStatus ******************/
		/**** md5 signature: 04a3641ea96e31fb888770b16b3f97b3 ****/
		%feature("compactdefaultargs") Message_ExecStatus;
		%feature("autodoc", "Create empty execution status.

Returns
-------
None
") Message_ExecStatus;
		 Message_ExecStatus();

		/****************** Message_ExecStatus ******************/
		/**** md5 signature: 479313f920e7f073046a6de98b87e7ad ****/
		%feature("compactdefaultargs") Message_ExecStatus;
		%feature("autodoc", "Initialise the execution status.

Parameters
----------
status: Message_Status

Returns
-------
None
") Message_ExecStatus;
		 Message_ExecStatus(Message_Status status);

		/****************** Add ******************/
		/**** md5 signature: ab49ea507da657deadd740be919832a8 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add statuses to me from theother execution status.

Parameters
----------
theOther: Message_ExecStatus

Returns
-------
None
") Add;
		void Add(const Message_ExecStatus & theOther);

		/****************** And ******************/
		/**** md5 signature: 7bd037c7e26e8f5a7825c302c20edcd9 ****/
		%feature("compactdefaultargs") And;
		%feature("autodoc", "Leave only the statuses common with theother.

Parameters
----------
theOther: Message_ExecStatus

Returns
-------
None
") And;
		void And(const Message_ExecStatus & theOther);

		/****************** Clear ******************/
		/**** md5 signature: 028e0aabcb96b1fe37739fe8231bf52e ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear one status.

Parameters
----------
status: Message_Status

Returns
-------
None
") Clear;
		void Clear(Message_Status status);

		/****************** Clear ******************/
		/**** md5 signature: 75abd67f132413fc11c19201aabf1126 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear all statuses.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ClearAllAlarm ******************/
		/**** md5 signature: 09eff4052df03fca9550a44b4c8a33a3 ****/
		%feature("compactdefaultargs") ClearAllAlarm;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ClearAllAlarm;
		void ClearAllAlarm();

		/****************** ClearAllDone ******************/
		/**** md5 signature: bb80d4e3104a5c34c549a33bcb71b118 ****/
		%feature("compactdefaultargs") ClearAllDone;
		%feature("autodoc", "Clear all statuses of each type .

Returns
-------
None
") ClearAllDone;
		void ClearAllDone();

		/****************** ClearAllFail ******************/
		/**** md5 signature: 2209038d180714379a610d7a91fbb8da ****/
		%feature("compactdefaultargs") ClearAllFail;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ClearAllFail;
		void ClearAllFail();

		/****************** ClearAllWarn ******************/
		/**** md5 signature: cef19260302ac0c894a772a2329d73d9 ****/
		%feature("compactdefaultargs") ClearAllWarn;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ClearAllWarn;
		void ClearAllWarn();

		/****************** IsAlarm ******************/
		/**** md5 signature: b03ab45d600e724c50296e8180c55b5b ****/
		%feature("compactdefaultargs") IsAlarm;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsAlarm;
		Standard_Boolean IsAlarm();

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Check if at least one status of each type is set.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsFail ******************/
		/**** md5 signature: 1e1f97b278fc3f40c0a7bac429b30df2 ****/
		%feature("compactdefaultargs") IsFail;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsFail;
		Standard_Boolean IsFail();

		/****************** IsSet ******************/
		/**** md5 signature: aa57ba93bd6a4d4711fe41f21bc9a931 ****/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Check status for being set.

Parameters
----------
status: Message_Status

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet(Message_Status status);

		/****************** IsWarn ******************/
		/**** md5 signature: 78d32331471a393a46e40ed3531de5f6 ****/
		%feature("compactdefaultargs") IsWarn;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsWarn;
		Standard_Boolean IsWarn();

		/****************** LocalStatusIndex ******************/
		/**** md5 signature: 89ca5ad1155dc3d314229956eb97d159 ****/
		%feature("compactdefaultargs") LocalStatusIndex;
		%feature("autodoc", "Returns index of status inside type of status (done or warn or, etc) in range [1, statusespertype].

Parameters
----------
status: Message_Status

Returns
-------
int
") LocalStatusIndex;
		static Standard_Integer LocalStatusIndex(Message_Status status);

		/****************** Set ******************/
		/**** md5 signature: 42a40ca0729a12f810ef51809f45bc83 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets a status flag.

Parameters
----------
status: Message_Status

Returns
-------
None
") Set;
		void Set(Message_Status status);

		/****************** SetAllAlarm ******************/
		/**** md5 signature: 5fa17f1f5873afd6738f0ddb9ea513ac ****/
		%feature("compactdefaultargs") SetAllAlarm;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetAllAlarm;
		void SetAllAlarm();

		/****************** SetAllDone ******************/
		/**** md5 signature: a0ffe8a14e594267041d792a868243e1 ****/
		%feature("compactdefaultargs") SetAllDone;
		%feature("autodoc", "Set all statuses of each type.

Returns
-------
None
") SetAllDone;
		void SetAllDone();

		/****************** SetAllFail ******************/
		/**** md5 signature: f7cb34f74efa03651eba86643eb660ac ****/
		%feature("compactdefaultargs") SetAllFail;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetAllFail;
		void SetAllFail();

		/****************** SetAllWarn ******************/
		/**** md5 signature: da2f636c12c75954232463769631ed88 ****/
		%feature("compactdefaultargs") SetAllWarn;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetAllWarn;
		void SetAllWarn();

		/****************** StatusByIndex ******************/
		/**** md5 signature: 69b005c3b3e5169650a12b17eef18a3d ****/
		%feature("compactdefaultargs") StatusByIndex;
		%feature("autodoc", "Returns status with index theindex in whole range [firststatus, laststatus].

Parameters
----------
theIndex: int

Returns
-------
Message_Status
") StatusByIndex;
		static Message_Status StatusByIndex(const Standard_Integer theIndex);

		/****************** StatusIndex ******************/
		/**** md5 signature: f51d4eb3d51bbc7a87552aa497881b76 ****/
		%feature("compactdefaultargs") StatusIndex;
		%feature("autodoc", "Returns index of status in whole range [firststatus, laststatus].

Parameters
----------
status: Message_Status

Returns
-------
int
") StatusIndex;
		static Standard_Integer StatusIndex(Message_Status status);

		/****************** TypeOfStatus ******************/
		/**** md5 signature: 9a9aa53818e212f80bfb9b39cf96ee58 ****/
		%feature("compactdefaultargs") TypeOfStatus;
		%feature("autodoc", "Returns status type (done, warn, alarm, or fail) .

Parameters
----------
status: Message_Status

Returns
-------
Message_StatusType
") TypeOfStatus;
		static Message_StatusType TypeOfStatus(Message_Status status);

};


%extend Message_ExecStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Message_Messenger *
**************************/
class Message_Messenger : public Standard_Transient {
	public:
		/****************** Message_Messenger ******************/
		/**** md5 signature: 763e2a3b2fdc0ec4b4c2d7aa867ef0cc ****/
		%feature("compactdefaultargs") Message_Messenger;
		%feature("autodoc", "Empty constructor; initializes by single printer directed to std::cout. note: the default messenger is not empty but directed to cout in order to protect against possibility to forget defining printers. if printing to cout is not needed, clear messenger by getprinters().clear().

Returns
-------
None
") Message_Messenger;
		 Message_Messenger();

		/****************** Message_Messenger ******************/
		/**** md5 signature: bc957f11c46f36db9cec180fc2fd9a8e ****/
		%feature("compactdefaultargs") Message_Messenger;
		%feature("autodoc", "Create messenger with single printer.

Parameters
----------
thePrinter: Message_Printer

Returns
-------
None
") Message_Messenger;
		 Message_Messenger(const opencascade::handle<Message_Printer> & thePrinter);

		/****************** AddPrinter ******************/
		/**** md5 signature: 8f7291e2628f45e1341b1d3cde72dcc6 ****/
		%feature("compactdefaultargs") AddPrinter;
		%feature("autodoc", "Add a printer to the messenger. the printer will be added only if it is not yet in the list. returns true if printer has been added.

Parameters
----------
thePrinter: Message_Printer

Returns
-------
bool
") AddPrinter;
		Standard_Boolean AddPrinter(const opencascade::handle<Message_Printer> & thePrinter);

		/****************** ChangePrinters ******************/
		/**** md5 signature: 0bff0f1cb07fdb5a8d0b23aaed744574 ****/
		%feature("compactdefaultargs") ChangePrinters;
		%feature("autodoc", "Returns sequence of printers the sequence can be modified.

Returns
-------
Message_SequenceOfPrinters
") ChangePrinters;
		Message_SequenceOfPrinters & ChangePrinters();

		/****************** Printers ******************/
		/**** md5 signature: 6c5b0fba9e527d551e7123cf4b988068 ****/
		%feature("compactdefaultargs") Printers;
		%feature("autodoc", "Returns current sequence of printers.

Returns
-------
Message_SequenceOfPrinters
") Printers;
		const Message_SequenceOfPrinters & Printers();

		/****************** RemovePrinter ******************/
		/**** md5 signature: e1bb7c6a4a8f9e41a20e519627391bd5 ****/
		%feature("compactdefaultargs") RemovePrinter;
		%feature("autodoc", "Removes specified printer from the messenger. returns true if this printer has been found in the list and removed.

Parameters
----------
thePrinter: Message_Printer

Returns
-------
bool
") RemovePrinter;
		Standard_Boolean RemovePrinter(const opencascade::handle<Message_Printer> & thePrinter);

		/****************** RemovePrinters ******************/
		/**** md5 signature: 76986e66651ae0643c390eb8de5d6527 ****/
		%feature("compactdefaultargs") RemovePrinters;
		%feature("autodoc", "Removes printers of specified type (including derived classes) from the messenger. returns number of removed printers.

Parameters
----------
theType: Standard_Type

Returns
-------
int
") RemovePrinters;
		Standard_Integer RemovePrinters(const opencascade::handle<Standard_Type> & theType);

		/****************** Send ******************/
		/**** md5 signature: 5d474490ec8d1918454b38990984b81b ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Dispatch a message to all the printers in the list. three versions of string representations are accepted for convenience, by default all are converted to extendedstring. the parameter putendl specifies whether the new line should be started after this message (default) or not (may have sense in some conditions).

Parameters
----------
theString: char *
theGravity: Message_Gravity,optional
	default value is Message_Warning
putEndl: bool,optional
	default value is Standard_True

Returns
-------
None
") Send;
		void Send(const char * theString, const Message_Gravity theGravity = Message_Warning, const Standard_Boolean putEndl = Standard_True);

		/****************** Send ******************/
		/**** md5 signature: 453a431a3bffd08469ed3f7e44063ee1 ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "See above.

Parameters
----------
theString: TCollection_AsciiString
theGravity: Message_Gravity,optional
	default value is Message_Warning
putEndl: bool,optional
	default value is Standard_True

Returns
-------
None
") Send;
		void Send(const TCollection_AsciiString & theString, const Message_Gravity theGravity = Message_Warning, const Standard_Boolean putEndl = Standard_True);

		/****************** Send ******************/
		/**** md5 signature: c8a803f815610044c12fb7fc877cfa0a ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "See above.

Parameters
----------
theString: TCollection_ExtendedString
theGravity: Message_Gravity,optional
	default value is Message_Warning
putEndl: bool,optional
	default value is Standard_True

Returns
-------
None
") Send;
		void Send(const TCollection_ExtendedString & theString, const Message_Gravity theGravity = Message_Warning, const Standard_Boolean putEndl = Standard_True);

};


%make_alias(Message_Messenger)

%extend Message_Messenger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Message_Msg *
********************/
class Message_Msg {
	public:
		/****************** Message_Msg ******************/
		/**** md5 signature: 0998663f2cf762fe27f20f469364e916 ****/
		%feature("compactdefaultargs") Message_Msg;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Message_Msg;
		 Message_Msg();

		/****************** Message_Msg ******************/
		/**** md5 signature: 15e9899f4a8279dcf24fd0d1a44c1e44 ****/
		%feature("compactdefaultargs") Message_Msg;
		%feature("autodoc", "Copy constructor.

Parameters
----------
theMsg: Message_Msg

Returns
-------
None
") Message_Msg;
		 Message_Msg(const Message_Msg & theMsg);

		/****************** Message_Msg ******************/
		/**** md5 signature: 744684cff9f095700a1e322236ec1a58 ****/
		%feature("compactdefaultargs") Message_Msg;
		%feature("autodoc", "Create a message using a corresponding entry in message_msgfile.

Parameters
----------
theKey: char *

Returns
-------
None
") Message_Msg;
		 Message_Msg(const char * theKey);

		/****************** Message_Msg ******************/
		/**** md5 signature: 9a71629a327a5dff18cec73638731fd0 ****/
		%feature("compactdefaultargs") Message_Msg;
		%feature("autodoc", "Create a message using a corresponding entry in message_msgfile.

Parameters
----------
theKey: TCollection_ExtendedString

Returns
-------
None
") Message_Msg;
		 Message_Msg(const TCollection_ExtendedString & theKey);

		/****************** Arg ******************/
		/**** md5 signature: bdfbd4e9c9fdf706ac8b5dff6cf9cf7e ****/
		%feature("compactdefaultargs") Arg;
		%feature("autodoc", "Set a value for %..s conversion.

Parameters
----------
theString: char *

Returns
-------
Message_Msg
") Arg;
		Message_Msg & Arg(const char * theString);

		/****************** Arg ******************/
		/**** md5 signature: 53e0f531702eaebee5ed185deb9f154d ****/
		%feature("compactdefaultargs") Arg;
		%feature("autodoc", "Set a value for %..s conversion.

Parameters
----------
theString: TCollection_AsciiString

Returns
-------
Message_Msg
") Arg;
		Message_Msg & Arg(const TCollection_AsciiString & theString);

		/****************** Arg ******************/
		/**** md5 signature: 565728917b415ff298216cda6e885300 ****/
		%feature("compactdefaultargs") Arg;
		%feature("autodoc", "Set a value for %..s conversion.

Parameters
----------
theString: TCollection_HAsciiString

Returns
-------
Message_Msg
") Arg;
		Message_Msg & Arg(const opencascade::handle<TCollection_HAsciiString> & theString);

		/****************** Arg ******************/
		/**** md5 signature: 601b13634aa70704738cabfcf16a1447 ****/
		%feature("compactdefaultargs") Arg;
		%feature("autodoc", "Set a value for %..s conversion.

Parameters
----------
theString: TCollection_ExtendedString

Returns
-------
Message_Msg
") Arg;
		Message_Msg & Arg(const TCollection_ExtendedString & theString);

		/****************** Arg ******************/
		/**** md5 signature: f827cc0ee3691e862a49f42e77cff050 ****/
		%feature("compactdefaultargs") Arg;
		%feature("autodoc", "Set a value for %..s conversion.

Parameters
----------
theString: TCollection_HExtendedString

Returns
-------
Message_Msg
") Arg;
		Message_Msg & Arg(const opencascade::handle<TCollection_HExtendedString> & theString);

		/****************** Arg ******************/
		/**** md5 signature: f91e505a0e027335f0996966486eaed9 ****/
		%feature("compactdefaultargs") Arg;
		%feature("autodoc", "Set a value for %..d, %..i, %..o, %..u, %..x or %..x conversion.

Parameters
----------
theInt: int

Returns
-------
Message_Msg
") Arg;
		Message_Msg & Arg(const Standard_Integer theInt);

		/****************** Arg ******************/
		/**** md5 signature: 014327372c083665236cee2c81ca34c8 ****/
		%feature("compactdefaultargs") Arg;
		%feature("autodoc", "Set a value for %..f, %..e, %..e, %..g or %..g conversion.

Parameters
----------
theReal: float

Returns
-------
Message_Msg
") Arg;
		Message_Msg & Arg(const Standard_Real theReal);

		/****************** Get ******************/
		/**** md5 signature: f8c88c41af24fcef115a47458b797652 ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return the resulting message string with all parameters filled. if some parameters were not yet filled by calls to methods arg (or <<), these parameters are filled by the word unknown.

Returns
-------
TCollection_ExtendedString
") Get;
		const TCollection_ExtendedString & Get();

		/****************** IsEdited ******************/
		/**** md5 signature: a79267920468a931255363cb4caffb00 ****/
		%feature("compactdefaultargs") IsEdited;
		%feature("autodoc", "Tells if value differs from original.

Returns
-------
bool
") IsEdited;
		Standard_Boolean IsEdited();

		/****************** Original ******************/
		/**** md5 signature: e23e7a271ddf85e9db1a3ab6e18b109b ****/
		%feature("compactdefaultargs") Original;
		%feature("autodoc", "Returns the original message text.

Returns
-------
TCollection_ExtendedString
") Original;
		const TCollection_ExtendedString & Original();

		/****************** Set ******************/
		/**** md5 signature: 8499dc113fd535e0df78ca149846f95a ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set a message body text -- can be used as alternative to using messages from resource file.

Parameters
----------
theMsg: char *

Returns
-------
None
") Set;
		void Set(const char * theMsg);

		/****************** Set ******************/
		/**** md5 signature: 793a790c0dfc3ad98d22667b966665f4 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set a message body text -- can be used as alternative to using messages from resource file.

Parameters
----------
theMsg: TCollection_ExtendedString

Returns
-------
None
") Set;
		void Set(const TCollection_ExtendedString & theMsg);

		/****************** Value ******************/
		/**** md5 signature: f2f68aad6ed0ed6d591de9948ef0a3f6 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns current state of the message text with parameters to the moment.

Returns
-------
TCollection_ExtendedString
") Value;
		const TCollection_ExtendedString & Value();

};


%extend Message_Msg {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Message_MsgFile *
************************/
class Message_MsgFile {
	public:
		/****************** AddMsg ******************/
		/**** md5 signature: 20b2f09fa5bb5f2a41c560e929261d52 ****/
		%feature("compactdefaultargs") AddMsg;
		%feature("autodoc", "Adds new message to the map. parameter <key> gives the key of the message, <text> defines the message itself. if there already was defined the message identified by the same keyword, it is replaced with the new one.

Parameters
----------
key: TCollection_AsciiString
text: TCollection_ExtendedString

Returns
-------
bool
") AddMsg;
		static Standard_Boolean AddMsg(const TCollection_AsciiString & key, const TCollection_ExtendedString & text);

		/****************** HasMsg ******************/
		/**** md5 signature: 05156f53d05b0341643ee4353c054060 ****/
		%feature("compactdefaultargs") HasMsg;
		%feature("autodoc", "Returns true if message with specified keyword is registered.

Parameters
----------
key: TCollection_AsciiString

Returns
-------
bool
") HasMsg;
		static Standard_Boolean HasMsg(const TCollection_AsciiString & key);

		/****************** Load ******************/
		/**** md5 signature: ec5da7edc4d116c864312f5c13e0bb66 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Load message file <thefilename> from directory <thedirname> or its sub-directory.

Parameters
----------
theDirName: char *
theFileName: char *

Returns
-------
bool
") Load;
		static Standard_Boolean Load(const char * theDirName, const char * theFileName);

		/****************** LoadFile ******************/
		/**** md5 signature: d126fd90b1ca292002a4e526aa9878bb ****/
		%feature("compactdefaultargs") LoadFile;
		%feature("autodoc", "Load the messages from the given file, additive to any previously loaded messages. messages with same keywords, if already present, are replaced with the new ones.

Parameters
----------
theFName: char *

Returns
-------
bool
") LoadFile;
		static Standard_Boolean LoadFile(const char * theFName);

		/****************** LoadFromEnv ******************/
		/**** md5 signature: 70ebce2d146849639495af085d921cad ****/
		%feature("compactdefaultargs") LoadFromEnv;
		%feature("autodoc", "Loads the messages from the file with name (without extension) given by environment variable. extension of the file name is given separately. if its not defined, it is taken: - by default from environment csf_language, - if not defined either, as 'us'. @name theenvname environment variable name @name thefilename file name without language suffix @name thelangext language file name extension returns true on success.

Parameters
----------
theEnvName: char *
theFileName: char *
theLangExt: char *,optional
	default value is ""

Returns
-------
bool
") LoadFromEnv;
		static Standard_Boolean LoadFromEnv(const char * theEnvName, const char * theFileName, const char * theLangExt = "");

		/****************** LoadFromString ******************/
		/**** md5 signature: bd4253d938220e0de15c97ede6647b1f ****/
		%feature("compactdefaultargs") LoadFromString;
		%feature("autodoc", "Loads the messages from the given text buffer. @param thecontent string containing the messages @param thelength length of the buffer;  when -1 specified - thecontent will be considered as null-terminated string.

Parameters
----------
theContent: char *
theLength: int,optional
	default value is -1

Returns
-------
bool
") LoadFromString;
		static Standard_Boolean LoadFromString(const char * theContent, const Standard_Integer theLength = -1);

		/****************** Msg ******************/
		/**** md5 signature: 1e408810c811877f3892fd1e97e25dcb ****/
		%feature("compactdefaultargs") Msg;
		%feature("autodoc", "No available documentation.

Parameters
----------
key: char *

Returns
-------
TCollection_ExtendedString
") Msg;
		static const TCollection_ExtendedString & Msg(const char * key);

		/****************** Msg ******************/
		/**** md5 signature: 8c621fc4cece4752495337f2186770bf ****/
		%feature("compactdefaultargs") Msg;
		%feature("autodoc", "Gives the text for the message identified by the keyword <key> if there are no messages with such keyword defined, the error message is returned. in that case reference to static string is returned, it can be chenged with next call(s) to msg(). note: the error message is constructed like 'unknown message: <key>', and can itself be customized by defining message with key message_msg_badkeyword.

Parameters
----------
key: TCollection_AsciiString

Returns
-------
TCollection_ExtendedString
") Msg;
		static const TCollection_ExtendedString & Msg(const TCollection_AsciiString & key);

};


%extend Message_MsgFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Message_Printer *
************************/
%nodefaultctor Message_Printer;
class Message_Printer : public Standard_Transient {
	public:
		/****************** GetTraceLevel ******************/
		/**** md5 signature: 43c1665756d762b26a8dc39de58d7f1a ****/
		%feature("compactdefaultargs") GetTraceLevel;
		%feature("autodoc", "Return trace level used for filtering messages; messages with lover gravity will be ignored.

Returns
-------
Message_Gravity
") GetTraceLevel;
		Message_Gravity GetTraceLevel();

		/****************** Send ******************/
		/**** md5 signature: 900c1de196f4e947da47181424ae268d ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Send a string message with specified trace level. the parameter thetoputeol specified whether end-of-line should be added to the end of the message. this method must be redefined in descentant.

Parameters
----------
theString: TCollection_ExtendedString
theGravity: Message_Gravity
theToPutEol: bool

Returns
-------
None
") Send;
		virtual void Send(const TCollection_ExtendedString & theString, const Message_Gravity theGravity, const Standard_Boolean theToPutEol);

		/****************** Send ******************/
		/**** md5 signature: d482e31f739a1900fe8654a3d2fc4465 ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Send a string message with specified trace level. the parameter thetoputeol specified whether end-of-line should be added to the end of the message. default implementation calls first method send().

Parameters
----------
theString: char *
theGravity: Message_Gravity
theToPutEol: bool

Returns
-------
None
") Send;
		virtual void Send(const char * theString, const Message_Gravity theGravity, const Standard_Boolean theToPutEol);

		/****************** Send ******************/
		/**** md5 signature: 188aa7ce15e64fde333bb974d6cec109 ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Send a string message with specified trace level. the parameter thetoputeol specified whether end-of-line should be added to the end of the message. default implementation calls first method send().

Parameters
----------
theString: TCollection_AsciiString
theGravity: Message_Gravity
theToPutEol: bool

Returns
-------
None
") Send;
		virtual void Send(const TCollection_AsciiString & theString, const Message_Gravity theGravity, const Standard_Boolean theToPutEol);

		/****************** SetTraceLevel ******************/
		/**** md5 signature: 76564510956a50ca65a88b0d62efe400 ****/
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "Set trace level used for filtering messages. by default, trace level is message_info, so that all messages are output.

Parameters
----------
theTraceLevel: Message_Gravity

Returns
-------
None
") SetTraceLevel;
		void SetTraceLevel(const Message_Gravity theTraceLevel);

};


%make_alias(Message_Printer)

%extend Message_Printer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Message_ProgressIndicator *
**********************************/
%nodefaultctor Message_ProgressIndicator;
class Message_ProgressIndicator : public Standard_Transient {
	public:
		/****************** EndScope ******************/
		/**** md5 signature: 93786c07f1dbfeb259d687d65b578abc ****/
		%feature("compactdefaultargs") EndScope;
		%feature("autodoc", "Close the current scope and thus return to previous scale updates position to be at the end of the closing scope returns false if no scope is opened.

Returns
-------
bool
") EndScope;
		Standard_Boolean EndScope();

		/****************** GetNbScopes ******************/
		/**** md5 signature: 7a2e80f7367cb9710a00325b7ac4cecb ****/
		%feature("compactdefaultargs") GetNbScopes;
		%feature("autodoc", "Returns current number of opened scopes this number is always >=1 as top-level scale is always present.

Returns
-------
int
") GetNbScopes;
		Standard_Integer GetNbScopes();

		/****************** GetPosition ******************/
		/**** md5 signature: c4762f44bf29660e65f2c9961bb4d602 ****/
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "Returns total progress position on the basic scale ranged from 0. to 1.

Returns
-------
float
") GetPosition;
		Standard_Real GetPosition();

		/****************** GetScale ******************/
		/**** md5 signature: da63d1a25a12340d12311f8f67ff6dbb ****/
		%feature("compactdefaultargs") GetScale;
		%feature("autodoc", "Returns all parameters for current scale.

Parameters
----------

Returns
-------
min: float
max: float
step: float
isInf: bool
") GetScale;
		void GetScale(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean &OutValue);

		/****************** GetScope ******************/
		/**** md5 signature: 6f3d8e9f74c789b6c388c6a9b7e8f15c ****/
		%feature("compactdefaultargs") GetScope;
		%feature("autodoc", "Returns data for scale of index-th scope the first scope is current one, the last is the top-level one.

Parameters
----------
index: int

Returns
-------
Message_ProgressScale
") GetScope;
		const Message_ProgressScale & GetScope(const Standard_Integer index);

		/****************** GetValue ******************/
		/**** md5 signature: 2863c7a566efd7be6530d131f7f2cf29 ****/
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "Set and get progress value at current scale if the value to be set is more than currently set one, or out of range for the current scale, it is limited by that range.

Returns
-------
float
") GetValue;
		Standard_Real GetValue();

		/****************** Increment ******************/
		/**** md5 signature: 05c4352cb55da0c645c323a4eb46eabd ****/
		%feature("compactdefaultargs") Increment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Increment;
		void Increment();

		/****************** Increment ******************/
		/**** md5 signature: cd25e2a5383845bf8ee79a75090b141a ****/
		%feature("compactdefaultargs") Increment;
		%feature("autodoc", "Increment the progress value by the default of specified step.

Parameters
----------
step: float

Returns
-------
None
") Increment;
		void Increment(const Standard_Real step);

		/****************** NewScope ******************/
		/**** md5 signature: cf0b637b687de36e48b5d0fe7a112490 ****/
		%feature("compactdefaultargs") NewScope;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *,optional
	default value is 0

Returns
-------
bool
") NewScope;
		Standard_Boolean NewScope(const char * name = 0);

		/****************** NewScope ******************/
		/**** md5 signature: 8454c7915b288e236424cf7e8867ed5f ****/
		%feature("compactdefaultargs") NewScope;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: TCollection_HAsciiString

Returns
-------
bool
") NewScope;
		Standard_Boolean NewScope(const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** NewScope ******************/
		/**** md5 signature: 8f762e958567cc6c331926f3fe88d55b ****/
		%feature("compactdefaultargs") NewScope;
		%feature("autodoc", "No available documentation.

Parameters
----------
span: float
name: char *,optional
	default value is 0

Returns
-------
bool
") NewScope;
		Standard_Boolean NewScope(const Standard_Real span, const char * name = 0);

		/****************** NewScope ******************/
		/**** md5 signature: 461460ef0f23e870ce26debe996f0d38 ****/
		%feature("compactdefaultargs") NewScope;
		%feature("autodoc", "Creates new scope on a part of a current scale from current position with span either equal to default step, or specified the scale for the new scope will have specified name and ranged from 0 to 100 with step 1 returns false if something is wrong in arguments or in current position of progress indicator; scope is opened anyway.

Parameters
----------
span: float
name: TCollection_HAsciiString

Returns
-------
bool
") NewScope;
		Standard_Boolean NewScope(const Standard_Real span, const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** NextScope ******************/
		/**** md5 signature: 326030c8fdd17f096404f5d09717f760 ****/
		%feature("compactdefaultargs") NextScope;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *,optional
	default value is 0

Returns
-------
bool
") NextScope;
		Standard_Boolean NextScope(const char * name = 0);

		/****************** NextScope ******************/
		/**** md5 signature: a6d7ad21007caebd7b7d3a763f2e5c96 ****/
		%feature("compactdefaultargs") NextScope;
		%feature("autodoc", "Optimized version of { return endscope() && newscope(); }.

Parameters
----------
span: float
name: char *,optional
	default value is 0

Returns
-------
bool
") NextScope;
		Standard_Boolean NextScope(const Standard_Real span, const char * name = 0);

		/****************** Reset ******************/
		/**** md5 signature: 16b0add6564378271aa2e32ce7289d60 ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Drops all scopes and sets scale from 0 to 100, step 1 this scale has name 'step'.

Returns
-------
None
") Reset;
		virtual void Reset();

		/****************** SetInfinite ******************/
		/**** md5 signature: eea09b15783f5dbdcfb1d3405b3c9377 ****/
		%feature("compactdefaultargs") SetInfinite;
		%feature("autodoc", "Set or drop infinite mode for the current scale.

Parameters
----------
isInf: bool,optional
	default value is Standard_True

Returns
-------
None
") SetInfinite;
		void SetInfinite(const Standard_Boolean isInf = Standard_True);

		/****************** SetName ******************/
		/**** md5 signature: 208d3e507b11ad1eb22d3afd35f96209 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *

Returns
-------
None
") SetName;
		void SetName(const char * name);

		/****************** SetName ******************/
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set (optional) name for scale.

Parameters
----------
name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** SetRange ******************/
		/**** md5 signature: 94daf04c79472200acf84e47bbdf9331 ****/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "Set range for current scale.

Parameters
----------
min: float
max: float

Returns
-------
None
") SetRange;
		void SetRange(const Standard_Real min, const Standard_Real max);

		/****************** SetScale ******************/
		/**** md5 signature: 6b9e4ca2d964349d8a983d5265a59e71 ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *
min: float
max: float
step: float
isInf: bool,optional
	default value is Standard_False

Returns
-------
None
") SetScale;
		void SetScale(const char * name, const Standard_Real min, const Standard_Real max, const Standard_Real step, const Standard_Boolean isInf = Standard_False);

		/****************** SetScale ******************/
		/**** md5 signature: 08985a59987c764d0529fee401be8d65 ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Set all parameters for current scale.

Parameters
----------
min: float
max: float
step: float
isInf: bool,optional
	default value is Standard_False

Returns
-------
None
") SetScale;
		void SetScale(const Standard_Real min, const Standard_Real max, const Standard_Real step, const Standard_Boolean isInf = Standard_False);

		/****************** SetStep ******************/
		/**** md5 signature: 1f4b78a1765a2af7072dd63b20af754c ****/
		%feature("compactdefaultargs") SetStep;
		%feature("autodoc", "Set step for current scale.

Parameters
----------
step: float

Returns
-------
None
") SetStep;
		void SetStep(const Standard_Real step);

		/****************** SetValue ******************/
		/**** md5 signature: 306d5cb5d7430ef039d57c40b0690d07 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Real val);

		/****************** Show ******************/
		/**** md5 signature: b1013eeb5f3e382108ef9c03f01dcb9d ****/
		%feature("compactdefaultargs") Show;
		%feature("autodoc", "Update presentation of the progress indicator called when progress position is changed flag force is intended for forcing update in case if it is optimized; all internal calls from progressindicator are done with this flag equal to false.

Parameters
----------
force: bool,optional
	default value is Standard_True

Returns
-------
bool
") Show;
		virtual Standard_Boolean Show(const Standard_Boolean force = Standard_True);

		/****************** UserBreak ******************/
		/**** md5 signature: 7cdc23b376f0d2431d8b73d002b284bb ****/
		%feature("compactdefaultargs") UserBreak;
		%feature("autodoc", "Should return true if user has send a break signal. default implementation returns false.

Returns
-------
bool
") UserBreak;
		virtual Standard_Boolean UserBreak();

};


%make_alias(Message_ProgressIndicator)

%extend Message_ProgressIndicator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Message_ProgressScale *
******************************/
class Message_ProgressScale {
	public:
		/****************** Message_ProgressScale ******************/
		/**** md5 signature: 258582afbb8567ec5d483cf52d65287f ****/
		%feature("compactdefaultargs") Message_ProgressScale;
		%feature("autodoc", "Creates scale ranged from 0 to 100 with step 1.

Returns
-------
None
") Message_ProgressScale;
		 Message_ProgressScale();

		/****************** BaseToLocal ******************/
		/**** md5 signature: 8a233c43f559b22e91e725f2c57b5391 ****/
		%feature("compactdefaultargs") BaseToLocal;
		%feature("autodoc", "Convert value from this scale to base one and back.

Parameters
----------
val: float

Returns
-------
float
") BaseToLocal;
		Standard_Real BaseToLocal(const Standard_Real val);

		/****************** GetFirst ******************/
		/**** md5 signature: 96852ecd9a117367bc56f7c00e80179f ****/
		%feature("compactdefaultargs") GetFirst;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetFirst;
		Standard_Real GetFirst();

		/****************** GetInfinite ******************/
		/**** md5 signature: 16ad6f191f7f7736572ed2d03478f28f ****/
		%feature("compactdefaultargs") GetInfinite;
		%feature("autodoc", "Gets flag for infinite scale.

Returns
-------
bool
") GetInfinite;
		Standard_Boolean GetInfinite();

		/****************** GetLast ******************/
		/**** md5 signature: 34b02efc89e2d31997d02786aeaae583 ****/
		%feature("compactdefaultargs") GetLast;
		%feature("autodoc", "Return information on span occupied by the scale on the base scale.

Returns
-------
float
") GetLast;
		Standard_Real GetLast();

		/****************** GetMax ******************/
		/**** md5 signature: 577bc19e09eb7001f5dd74554ca4e5df ****/
		%feature("compactdefaultargs") GetMax;
		%feature("autodoc", "Gets minimum value of scale.

Returns
-------
float
") GetMax;
		Standard_Real GetMax();

		/****************** GetMin ******************/
		/**** md5 signature: bb7f997eaeb3b86a7f04f701cd8e6e30 ****/
		%feature("compactdefaultargs") GetMin;
		%feature("autodoc", "Gets minimum value of scale.

Returns
-------
float
") GetMin;
		Standard_Real GetMin();

		/****************** GetName ******************/
		/**** md5 signature: 23aadc9cd2e3411b58fb02d3fd2db5c9 ****/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Gets scale name name may be null handle if not set.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName();

		/****************** GetStep ******************/
		/**** md5 signature: d5ae775f41dfbde3b5a83c00c8d17ed5 ****/
		%feature("compactdefaultargs") GetStep;
		%feature("autodoc", "Gets default step.

Returns
-------
float
") GetStep;
		Standard_Real GetStep();

		/****************** LocalToBase ******************/
		/**** md5 signature: 845488c5c3087495f8cb5ec54fd31b30 ****/
		%feature("compactdefaultargs") LocalToBase;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float

Returns
-------
float
") LocalToBase;
		Standard_Real LocalToBase(const Standard_Real val);

		/****************** SetInfinite ******************/
		/**** md5 signature: 5b34f2cd39f9234b6fbae5a346eafe58 ****/
		%feature("compactdefaultargs") SetInfinite;
		%feature("autodoc", "Sets flag for infinite scale.

Parameters
----------
theInfinite: bool,optional
	default value is Standard_True

Returns
-------
None
") SetInfinite;
		void SetInfinite(const Standard_Boolean theInfinite = Standard_True);

		/****************** SetMax ******************/
		/**** md5 signature: 115ee5c24957750487cd7ceb9596431c ****/
		%feature("compactdefaultargs") SetMax;
		%feature("autodoc", "Sets minimum value of scale.

Parameters
----------
theMax: float

Returns
-------
None
") SetMax;
		void SetMax(const Standard_Real theMax);

		/****************** SetMin ******************/
		/**** md5 signature: f8db2dcc31db690954a4732445fea925 ****/
		%feature("compactdefaultargs") SetMin;
		%feature("autodoc", "Sets minimum value of scale.

Parameters
----------
theMin: float

Returns
-------
None
") SetMin;
		void SetMin(const Standard_Real theMin);

		/****************** SetName ******************/
		/**** md5 signature: 0c9fbc7b20b848400d02bd7be1ca9cc7 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: char *

Returns
-------
None
") SetName;
		void SetName(const char * theName);

		/****************** SetName ******************/
		/**** md5 signature: a74c500474873878f514b4e36e03588d ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Sets scale name.

Parameters
----------
theName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** SetRange ******************/
		/**** md5 signature: 94daf04c79472200acf84e47bbdf9331 ****/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "Set both min and max.

Parameters
----------
min: float
max: float

Returns
-------
None
") SetRange;
		void SetRange(const Standard_Real min, const Standard_Real max);

		/****************** SetScale ******************/
		/**** md5 signature: 957173f16a69d928abf1e1aac804f170 ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Set all scale parameters.

Parameters
----------
min: float
max: float
step: float
theInfinite: bool,optional
	default value is Standard_True

Returns
-------
None
") SetScale;
		void SetScale(const Standard_Real min, const Standard_Real max, const Standard_Real step, const Standard_Boolean theInfinite = Standard_True);

		/****************** SetSpan ******************/
		/**** md5 signature: a161b9c985312bbdf4bac744e9b7fdc3 ****/
		%feature("compactdefaultargs") SetSpan;
		%feature("autodoc", "Defines span occupied by the scale on the basis scale.

Parameters
----------
first: float
last: float

Returns
-------
None
") SetSpan;
		void SetSpan(const Standard_Real first, const Standard_Real last);

		/****************** SetStep ******************/
		/**** md5 signature: 4a6c87c7671faa746ec2f6db50d5ec9c ****/
		%feature("compactdefaultargs") SetStep;
		%feature("autodoc", "Sets default step.

Parameters
----------
theStep: float

Returns
-------
None
") SetStep;
		void SetStep(const Standard_Real theStep);

};


%extend Message_ProgressScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Message_ProgressSentry *
*******************************/
class Message_ProgressSentry {
	public:
		/****************** Message_ProgressSentry ******************/
		/**** md5 signature: 342d4a2ebaf050902f2e085d7c280a6e ****/
		%feature("compactdefaultargs") Message_ProgressSentry;
		%feature("autodoc", "No available documentation.

Parameters
----------
PI: Message_ProgressIndicator
name: char *
min: float
max: float
step: float
isInf: bool,optional
	default value is Standard_False
newScopeSpan: float,optional
	default value is 0.0

Returns
-------
None
") Message_ProgressSentry;
		 Message_ProgressSentry(const opencascade::handle<Message_ProgressIndicator> & PI, const char * name, const Standard_Real min, const Standard_Real max, const Standard_Real step, const Standard_Boolean isInf = Standard_False, const Standard_Real newScopeSpan = 0.0);

		/****************** Message_ProgressSentry ******************/
		/**** md5 signature: 37dcd5715a075a314dea3ead86f390b9 ****/
		%feature("compactdefaultargs") Message_ProgressSentry;
		%feature("autodoc", "Creates an instance of progresssentry attaching it to the specified progressindicator, selects parameters of the current scale, and opens a new scope with specified span (equal to step by default).

Parameters
----------
PI: Message_ProgressIndicator
name: TCollection_HAsciiString
min: float
max: float
step: float
isInf: bool,optional
	default value is Standard_False
newScopeSpan: float,optional
	default value is 0.0

Returns
-------
None
") Message_ProgressSentry;
		 Message_ProgressSentry(const opencascade::handle<Message_ProgressIndicator> & PI, const opencascade::handle<TCollection_HAsciiString> & name, const Standard_Real min, const Standard_Real max, const Standard_Real step, const Standard_Boolean isInf = Standard_False, const Standard_Real newScopeSpan = 0.0);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns false if progressindicator signals userbreak.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: 2e7b9750e189dd75688bb7cc26b027f6 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *,optional
	default value is 0

Returns
-------
None
") Next;
		void Next(const char * name = 0);

		/****************** Next ******************/
		/**** md5 signature: d386fc1955473ef7f1eec11d009157ca ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Parameters
----------
span: float
name: char *,optional
	default value is 0

Returns
-------
None
") Next;
		void Next(const Standard_Real span, const char * name = 0);

		/****************** Next ******************/
		/**** md5 signature: 6bf2d937028de78fe51b25978899ad65 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Closes current scope and opens next one with either specified or default span.

Parameters
----------
span: float
name: TCollection_HAsciiString

Returns
-------
None
") Next;
		void Next(const Standard_Real span, const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** Relieve ******************/
		/**** md5 signature: 6a4f9da2009670be92c35fc49b87354e ****/
		%feature("compactdefaultargs") Relieve;
		%feature("autodoc", "Moves progress indicator to the end of the current scale and relieves sentry from its duty. methods other than show() will do nothing after this one is called.

Returns
-------
None
") Relieve;
		void Relieve();

		/****************** Show ******************/
		/**** md5 signature: f13793b1615c87188871937ac29f1389 ****/
		%feature("compactdefaultargs") Show;
		%feature("autodoc", "Forces update of progress indicator display.

Returns
-------
None
") Show;
		void Show();

};


%extend Message_ProgressSentry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Message_Report *
***********************/
class Message_Report : public Standard_Transient {
	public:
		/****************** Message_Report ******************/
		/**** md5 signature: 5c605f7a543a99a193f1b5daafe0b28d ****/
		%feature("compactdefaultargs") Message_Report;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Message_Report;
		 Message_Report();

		/****************** AddAlert ******************/
		/**** md5 signature: b78f4b7eedc917e3f04fe93a90e0c532 ****/
		%feature("compactdefaultargs") AddAlert;
		%feature("autodoc", "Add alert with specified gravity. this method is thread-safe, i.e. alerts can be added from parallel threads safely.

Parameters
----------
theGravity: Message_Gravity
theAlert: Message_Alert

Returns
-------
None
") AddAlert;
		void AddAlert(Message_Gravity theGravity, const opencascade::handle<Message_Alert> & theAlert);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears all collected alerts.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Clear ******************/
		/**** md5 signature: ee3ea4727af188645acb2c12a22ca14a ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears collected alerts with specified gravity.

Parameters
----------
theGravity: Message_Gravity

Returns
-------
None
") Clear;
		void Clear(Message_Gravity theGravity);

		/****************** Clear ******************/
		/**** md5 signature: 45f7a5dcb1df58ed86ca241b4a043e69 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears collected alerts with specified type.

Parameters
----------
theType: Standard_Type

Returns
-------
None
") Clear;
		void Clear(const opencascade::handle<Standard_Type> & theType);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetAlerts ******************/
		/**** md5 signature: e105d4af57088013fb229b16770b2450 ****/
		%feature("compactdefaultargs") GetAlerts;
		%feature("autodoc", "Returns list of collected alerts with specified gravity.

Parameters
----------
theGravity: Message_Gravity

Returns
-------
Message_ListOfAlert
") GetAlerts;
		const Message_ListOfAlert & GetAlerts(Message_Gravity theGravity);

		/****************** HasAlert ******************/
		/**** md5 signature: e66dc06e59dc87e1a74ae38f1afc055a ****/
		%feature("compactdefaultargs") HasAlert;
		%feature("autodoc", "Returns true if specific type of alert is recorded.

Parameters
----------
theType: Standard_Type

Returns
-------
bool
") HasAlert;
		Standard_Boolean HasAlert(const opencascade::handle<Standard_Type> & theType);

		/****************** HasAlert ******************/
		/**** md5 signature: 33bb8095c0695e3b2dfa7bf20c5d452c ****/
		%feature("compactdefaultargs") HasAlert;
		%feature("autodoc", "Returns true if specific type of alert is recorded with specified gravity.

Parameters
----------
theType: Standard_Type
theGravity: Message_Gravity

Returns
-------
bool
") HasAlert;
		Standard_Boolean HasAlert(const opencascade::handle<Standard_Type> & theType, Message_Gravity theGravity);

		/****************** Merge ******************/
		/**** md5 signature: 7f64bb1154040a49da5f52b1a2407ab9 ****/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "Merges data from theother report into this.

Parameters
----------
theOther: Message_Report

Returns
-------
None
") Merge;
		void Merge(const opencascade::handle<Message_Report> & theOther);

		/****************** Merge ******************/
		/**** md5 signature: bde66a54a7d5ae1841d8cb87b1e6953a ****/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "Merges alerts with specified gravity from theother report into this.

Parameters
----------
theOther: Message_Report
theGravity: Message_Gravity

Returns
-------
None
") Merge;
		void Merge(const opencascade::handle<Message_Report> & theOther, Message_Gravity theGravity);

		/****************** SendMessages ******************/
		/**** md5 signature: d14bf458c325f625af6923ad20eb9e1e ****/
		%feature("compactdefaultargs") SendMessages;
		%feature("autodoc", "Sends all collected alerts to messenger.

Parameters
----------
theMessenger: Message_Messenger

Returns
-------
None
") SendMessages;
		void SendMessages(const opencascade::handle<Message_Messenger> & theMessenger);

		/****************** SendMessages ******************/
		/**** md5 signature: 9ea9a166e6c7d50edd218b006120722d ****/
		%feature("compactdefaultargs") SendMessages;
		%feature("autodoc", "Dumps collected alerts with specified gravity to messenger.

Parameters
----------
theMessenger: Message_Messenger
theGravity: Message_Gravity

Returns
-------
None
") SendMessages;
		void SendMessages(const opencascade::handle<Message_Messenger> & theMessenger, Message_Gravity theGravity);

};


%make_alias(Message_Report)

%extend Message_Report {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Message_PrinterOStream *
*******************************/
class Message_PrinterOStream : public Message_Printer {
	public:
		/****************** Message_PrinterOStream ******************/
		/**** md5 signature: e9be2f90782c77cdc19e7a25058eabc8 ****/
		%feature("compactdefaultargs") Message_PrinterOStream;
		%feature("autodoc", "Empty constructor, defaulting to cout.

Parameters
----------
theTraceLevel: Message_Gravity,optional
	default value is Message_Info

Returns
-------
None
") Message_PrinterOStream;
		 Message_PrinterOStream(const Message_Gravity theTraceLevel = Message_Info);

		/****************** Message_PrinterOStream ******************/
		/**** md5 signature: a6bd858a46b40d4da229ad5782663911 ****/
		%feature("compactdefaultargs") Message_PrinterOStream;
		%feature("autodoc", "Create printer for output to a specified file. the option thedoappend specifies whether file should be appended or rewritten. for specific file names (cout, cerr) standard streams are used.

Parameters
----------
theFileName: char *
theDoAppend: bool
theTraceLevel: Message_Gravity,optional
	default value is Message_Info

Returns
-------
None
") Message_PrinterOStream;
		 Message_PrinterOStream(const char * theFileName, const Standard_Boolean theDoAppend, const Message_Gravity theTraceLevel = Message_Info);

		/****************** Close ******************/
		/**** md5 signature: d50d7ba65c2beb3eb436584b5735f108 ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Flushes the output stream and destroys it if it has been specified externally with option dofree (or if it is internal file stream).

Returns
-------
None
") Close;
		void Close();

		/****************** GetStream ******************/
		/**** md5 signature: 5aab0a78e6f94d617c4ba07c210a5ea0 ****/
		%feature("compactdefaultargs") GetStream;
		%feature("autodoc", "Returns reference to the output stream.

Returns
-------
Standard_OStream
") GetStream;
		Standard_OStream & GetStream();

		/****************** GetUseUtf8 ******************/
		/**** md5 signature: 25c9bfe81957a1c959f195f79ee27cdb ****/
		%feature("compactdefaultargs") GetUseUtf8;
		%feature("autodoc", "Returns option to convert non-ascii symbols to utf8 encoding.

Returns
-------
bool
") GetUseUtf8;
		Standard_Boolean GetUseUtf8();

		/****************** Send ******************/
		/**** md5 signature: 4ddb70c9468d42dd07799bb08a7e9241 ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Puts a message to the current stream if its gravity is equal or greater to the trace level set by settracelevel().

Parameters
----------
theString: char *
theGravity: Message_Gravity
putEndl: bool,optional
	default value is Standard_True

Returns
-------
None
") Send;
		virtual void Send(const char * theString, const Message_Gravity theGravity, const Standard_Boolean putEndl = Standard_True);

		/****************** Send ******************/
		/**** md5 signature: f30d061a0be64825e964c3e61d0fb43a ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Puts a message to the current stream if its gravity is equal or greater to the trace level set by settracelevel().

Parameters
----------
theString: TCollection_AsciiString
theGravity: Message_Gravity
putEndl: bool,optional
	default value is Standard_True

Returns
-------
None
") Send;
		virtual void Send(const TCollection_AsciiString & theString, const Message_Gravity theGravity, const Standard_Boolean putEndl = Standard_True);

		/****************** Send ******************/
		/**** md5 signature: e2e96cd2ba9a5d47125ff9b7eee87db6 ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Puts a message to the current stream if its gravity is equal or greater to the trace level set by settracelevel() non-ascii symbols are converted to utf-8 if useutf8 option is set, else replaced by symbols '?'.

Parameters
----------
theString: TCollection_ExtendedString
theGravity: Message_Gravity
putEndl: bool,optional
	default value is Standard_True

Returns
-------
None
") Send;
		virtual void Send(const TCollection_ExtendedString & theString, const Message_Gravity theGravity, const Standard_Boolean putEndl = Standard_True);

		/****************** SetUseUtf8 ******************/
		/**** md5 signature: 7eaa9097a59dd744faef01f3326bf595 ****/
		%feature("compactdefaultargs") SetUseUtf8;
		%feature("autodoc", "Sets option to convert non-ascii symbols to utf8 encoding.

Parameters
----------
useUtf8: bool

Returns
-------
None
") SetUseUtf8;
		void SetUseUtf8(const Standard_Boolean useUtf8);

};


%make_alias(Message_PrinterOStream)

%extend Message_PrinterOStream {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
