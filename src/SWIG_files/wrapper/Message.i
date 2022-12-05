/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_message.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<Message_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<OSD_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import OSD.i
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

enum Message_ConsoleColor {
	Message_ConsoleColor_Default = 0,
	Message_ConsoleColor_Black = 1,
	Message_ConsoleColor_White = 2,
	Message_ConsoleColor_Red = 3,
	Message_ConsoleColor_Blue = 4,
	Message_ConsoleColor_Green = 5,
	Message_ConsoleColor_Yellow = 6,
	Message_ConsoleColor_Cyan = 7,
	Message_ConsoleColor_Magenta = 8,
};

enum Message_Gravity {
	Message_Trace = 0,
	Message_Info = 1,
	Message_Warning = 2,
	Message_Alarm = 3,
	Message_Fail = 4,
};

enum Message_MetricType {
	Message_MetricType_None = 0,
	Message_MetricType_ThreadCPUUserTime = 1,
	Message_MetricType_ThreadCPUSystemTime = 2,
	Message_MetricType_ProcessCPUUserTime = 3,
	Message_MetricType_ProcessCPUSystemTime = 4,
	Message_MetricType_WallClock = 5,
	Message_MetricType_MemPrivate = 6,
	Message_MetricType_MemVirtual = 7,
	Message_MetricType_MemWorkingSet = 8,
	Message_MetricType_MemWorkingSetPeak = 9,
	Message_MetricType_MemSwapUsage = 10,
	Message_MetricType_MemSwapUsagePeak = 11,
	Message_MetricType_MemHeapUsage = 12,
};

enum Message_StatusType {
	Message_DONE = 256,
	Message_WARN = 512,
	Message_ALARM = 1024,
	Message_FAIL = 2048,
};

/* end public enums declaration */

/* python proxy classes for enums */
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

class Message_ConsoleColor(IntEnum):
	Message_ConsoleColor_Default = 0
	Message_ConsoleColor_Black = 1
	Message_ConsoleColor_White = 2
	Message_ConsoleColor_Red = 3
	Message_ConsoleColor_Blue = 4
	Message_ConsoleColor_Green = 5
	Message_ConsoleColor_Yellow = 6
	Message_ConsoleColor_Cyan = 7
	Message_ConsoleColor_Magenta = 8
Message_ConsoleColor_Default = Message_ConsoleColor.Message_ConsoleColor_Default
Message_ConsoleColor_Black = Message_ConsoleColor.Message_ConsoleColor_Black
Message_ConsoleColor_White = Message_ConsoleColor.Message_ConsoleColor_White
Message_ConsoleColor_Red = Message_ConsoleColor.Message_ConsoleColor_Red
Message_ConsoleColor_Blue = Message_ConsoleColor.Message_ConsoleColor_Blue
Message_ConsoleColor_Green = Message_ConsoleColor.Message_ConsoleColor_Green
Message_ConsoleColor_Yellow = Message_ConsoleColor.Message_ConsoleColor_Yellow
Message_ConsoleColor_Cyan = Message_ConsoleColor.Message_ConsoleColor_Cyan
Message_ConsoleColor_Magenta = Message_ConsoleColor.Message_ConsoleColor_Magenta

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

class Message_MetricType(IntEnum):
	Message_MetricType_None = 0
	Message_MetricType_ThreadCPUUserTime = 1
	Message_MetricType_ThreadCPUSystemTime = 2
	Message_MetricType_ProcessCPUUserTime = 3
	Message_MetricType_ProcessCPUSystemTime = 4
	Message_MetricType_WallClock = 5
	Message_MetricType_MemPrivate = 6
	Message_MetricType_MemVirtual = 7
	Message_MetricType_MemWorkingSet = 8
	Message_MetricType_MemWorkingSetPeak = 9
	Message_MetricType_MemSwapUsage = 10
	Message_MetricType_MemSwapUsagePeak = 11
	Message_MetricType_MemHeapUsage = 12
Message_MetricType_None = Message_MetricType.Message_MetricType_None
Message_MetricType_ThreadCPUUserTime = Message_MetricType.Message_MetricType_ThreadCPUUserTime
Message_MetricType_ThreadCPUSystemTime = Message_MetricType.Message_MetricType_ThreadCPUSystemTime
Message_MetricType_ProcessCPUUserTime = Message_MetricType.Message_MetricType_ProcessCPUUserTime
Message_MetricType_ProcessCPUSystemTime = Message_MetricType.Message_MetricType_ProcessCPUSystemTime
Message_MetricType_WallClock = Message_MetricType.Message_MetricType_WallClock
Message_MetricType_MemPrivate = Message_MetricType.Message_MetricType_MemPrivate
Message_MetricType_MemVirtual = Message_MetricType.Message_MetricType_MemVirtual
Message_MetricType_MemWorkingSet = Message_MetricType.Message_MetricType_MemWorkingSet
Message_MetricType_MemWorkingSetPeak = Message_MetricType.Message_MetricType_MemWorkingSetPeak
Message_MetricType_MemSwapUsage = Message_MetricType.Message_MetricType_MemSwapUsage
Message_MetricType_MemSwapUsagePeak = Message_MetricType.Message_MetricType_MemSwapUsagePeak
Message_MetricType_MemHeapUsage = Message_MetricType.Message_MetricType_MemHeapUsage

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
%wrap_handle(Message_Attribute)
%wrap_handle(Message_CompositeAlerts)
%wrap_handle(Message_Messenger)
%wrap_handle(Message_Printer)
%wrap_handle(Message_ProgressIndicator)
%wrap_handle(Message_Report)
%wrap_handle(Message_AlertExtended)
%wrap_handle(Message_AttributeMeter)
%wrap_handle(Message_AttributeObject)
%wrap_handle(Message_AttributeStream)
%wrap_handle(Message_PrinterOStream)
%wrap_handle(Message_PrinterSystemLog)
%wrap_handle(Message_PrinterToReport)
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
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<NCollection_Handle<Message_Msg>> Message_ArrayOfMsg;
typedef NCollection_Handle<Message_ArrayOfMsg> Message_HArrayOfMsg;
typedef NCollection_List<Message_Msg>::Iterator Message_ListIteratorOfListOfMsg;
typedef NCollection_List<opencascade::handle<Message_Alert>> Message_ListOfAlert;
typedef NCollection_List<Message_Msg> Message_ListOfMsg;
typedef NCollection_Sequence<opencascade::handle<Message_Printer>> Message_SequenceOfPrinters;
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
		%feature("autodoc", "Defines default messenger for occt applications. this is global static instance of the messenger. by default, it contains single printer directed to std::cout. it can be customized according to the application needs. //! the following syntax can be used to print messages: @code message::defaultmessenger()->send ('my warning', message_warning); message::sendwarning ('my warning'); // short-cut for message_warning message::sendwarning() << 'my warning with ' << thecounter << ' arguments'; message::sendfail ('my failure'); // short-cut for message_fail @endcode.

Returns
-------
opencascade::handle<Message_Messenger>
") DefaultMessenger;
		static const opencascade::handle<Message_Messenger> & DefaultMessenger();

		/****************** DefaultReport ******************/
		/**** md5 signature: 1a46d101e264ecb7a9ff31ebaa8389d0 ****/
		%feature("compactdefaultargs") DefaultReport;
		%feature("autodoc", "Returns the only one instance of report when thetocreate is true - automatically creates message report when not exist.

Parameters
----------
theToCreate: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<Message_Report>
") DefaultReport;
		static const opencascade::handle<Message_Report> & DefaultReport(const Standard_Boolean theToCreate = Standard_False);

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

		/****************** MetricFromString ******************/
		/**** md5 signature: 8b9b33ac06ea8343eec4ac0d86f4a849 ****/
		%feature("compactdefaultargs") MetricFromString;
		%feature("autodoc", "Determines the metric from the given string identifier. @param thestring string identifier @param thetype detected type of metric returns true if string identifier is known.

Parameters
----------
theString: char *

Returns
-------
theType: Message_MetricType
") MetricFromString;
		static Standard_Boolean MetricFromString(const char * theString, Message_MetricType &OutValue);

		/****************** MetricFromString ******************/
		/**** md5 signature: 7bcfa45f3a495293ba4a5aaadbb2c36c ****/
		%feature("compactdefaultargs") MetricFromString;
		%feature("autodoc", "Returns the metric type from the given string identifier. @param thestring string identifier returns metric type or message_metrictype_none if string identifier is invalid.

Parameters
----------
theString: char *

Returns
-------
Message_MetricType
") MetricFromString;
		static Message_MetricType MetricFromString(const char * theString);

		/****************** MetricToString ******************/
		/**** md5 signature: decdd094dd1c76ec3583d959cc1518c6 ****/
		%feature("compactdefaultargs") MetricToString;
		%feature("autodoc", "Returns the string name for a given metric type. @param thetype metric type returns string identifier from the list of message_metrictype.

Parameters
----------
theType: Message_MetricType

Returns
-------
char *
") MetricToString;
		static const char * MetricToString(const Message_MetricType theType);

		/****************** ToMessageMetric ******************/
		/**** md5 signature: b5f6d46706472fd2bb258a2427547372 ****/
		%feature("compactdefaultargs") ToMessageMetric;
		%feature("autodoc", "Converts osd memory info type to message metric. @param thememinfo [int] memory info type @param themetric [out] filled message metric returns true if converted.

Parameters
----------
theMemInfo: OSD_MemInfo::Counter

Returns
-------
theMetric: Message_MetricType
") ToMessageMetric;
		static Standard_Boolean ToMessageMetric(const OSD_MemInfo::Counter theMemInfo, Message_MetricType &OutValue);

		/****************** ToOSDMetric ******************/
		/**** md5 signature: 24e960587fb400b2dc0ce233166ebe2c ****/
		%feature("compactdefaultargs") ToOSDMetric;
		%feature("autodoc", "Converts message metric to osd memory info type. @param themetric [in] message metric @param thememinfo [out] filled memory info type returns true if converted.

Parameters
----------
theMetric: Message_MetricType
theMemInfo: OSD_MemInfo::Counter

Returns
-------
bool
") ToOSDMetric;
		static Standard_Boolean ToOSDMetric(const Message_MetricType theMetric, OSD_MemInfo::Counter & theMemInfo);

};


%extend Message {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Send(self):
		pass

	@methodnotwrapped
	def SendAlarm(self):
		pass

	@methodnotwrapped
	def SendInfo(self):
		pass

	@methodnotwrapped
	def SendTrace(self):
		pass

	@methodnotwrapped
	def SendWarning(self):
		pass

	@methodnotwrapped
	def SendFail(self):
		pass
	}
};

/**********************
* class Message_Alert *
**********************/
class Message_Alert : public Standard_Transient {
	public:

            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
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

/**************************
* class Message_Attribute *
**************************/
class Message_Attribute : public Standard_Transient {
	public:
		/****************** Message_Attribute ******************/
		/**** md5 signature: b36397f58fadc697ba00b619118e7732 ****/
		%feature("compactdefaultargs") Message_Attribute;
		%feature("autodoc", "Empty constructor.

Parameters
----------
theName: TCollection_AsciiString,optional
	default value is TCollection_AsciiString()

Returns
-------
None
") Message_Attribute;
		 Message_Attribute(const TCollection_AsciiString & theName = TCollection_AsciiString());


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** GetMessageKey ******************/
		/**** md5 signature: 71c9c83f94a6139aa0d49ac59c2b9561 ****/
		%feature("compactdefaultargs") GetMessageKey;
		%feature("autodoc", "Return a c string to be used as a key for generating text user messages describing this alert. the messages are generated with help of message_msg class, in message_report::dump(). base implementation returns dynamic type name of the instance.

Returns
-------
char *
") GetMessageKey;
		virtual const char * GetMessageKey();

		/****************** GetName ******************/
		/**** md5 signature: 03f303d315214c418f43c2b4c12c386a ****/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Returns custom name of alert if it is set returns alert name.

Returns
-------
TCollection_AsciiString
") GetName;
		const TCollection_AsciiString & GetName();

		/****************** SetName ******************/
		/**** md5 signature: 273df384551aa519beda71c20cd913ae ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Sets the custom name of alert @param thename a name for the alert.

Parameters
----------
theName: TCollection_AsciiString

Returns
-------
None
") SetName;
		void SetName(const TCollection_AsciiString & theName);

};


%make_alias(Message_Attribute)

%extend Message_Attribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Message_CompositeAlerts *
********************************/
class Message_CompositeAlerts : public Standard_Transient {
	public:
		/****************** Message_CompositeAlerts ******************/
		/**** md5 signature: d533e6984f420f01322ce334ac736541 ****/
		%feature("compactdefaultargs") Message_CompositeAlerts;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Message_CompositeAlerts;
		 Message_CompositeAlerts();

		/****************** AddAlert ******************/
		/**** md5 signature: 0dd0f641b9ac70c8921f38d63e5df5a6 ****/
		%feature("compactdefaultargs") AddAlert;
		%feature("autodoc", "Add alert with specified gravity. if the alert supports merge it will be merged. @param thegravity an alert gravity @param thealert an alert to be added as a child alert returns true if the alert is added or merged.

Parameters
----------
theGravity: Message_Gravity
theAlert: Message_Alert

Returns
-------
bool
") AddAlert;
		Standard_Boolean AddAlert(Message_Gravity theGravity, const opencascade::handle<Message_Alert> & theAlert);

		/****************** Alerts ******************/
		/**** md5 signature: 2721a4c27570c7cfecd3c1541a2c2b8a ****/
		%feature("compactdefaultargs") Alerts;
		%feature("autodoc", "Returns list of collected alerts with specified gravity.

Parameters
----------
theGravity: Message_Gravity

Returns
-------
Message_ListOfAlert
") Alerts;
		const Message_ListOfAlert & Alerts(const Message_Gravity theGravity);

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
		%feature("autodoc", "Clears collected alerts with specified gravity @param thegravity an alert gravity.

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
		%feature("autodoc", "Clears collected alerts with specified type @param thetype an alert type.

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
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** HasAlert ******************/
		/**** md5 signature: c84dc45f7e7e49755037ef8eafb79d8b ****/
		%feature("compactdefaultargs") HasAlert;
		%feature("autodoc", "Returns true if the alert belong the list of the child alerts. @param thealert an alert to be checked as a child alert returns true if the alert is found in a container of children.

Parameters
----------
theAlert: Message_Alert

Returns
-------
bool
") HasAlert;
		Standard_Boolean HasAlert(const opencascade::handle<Message_Alert> & theAlert);

		/****************** HasAlert ******************/
		/**** md5 signature: 33bb8095c0695e3b2dfa7bf20c5d452c ****/
		%feature("compactdefaultargs") HasAlert;
		%feature("autodoc", "Returns true if specific type of alert is recorded with specified gravity @param thetype an alert type @param thegravity an alert gravity returns true if the alert is found in a container of children.

Parameters
----------
theType: Standard_Type
theGravity: Message_Gravity

Returns
-------
bool
") HasAlert;
		Standard_Boolean HasAlert(const opencascade::handle<Standard_Type> & theType, Message_Gravity theGravity);

		/****************** RemoveAlert ******************/
		/**** md5 signature: 81cd6e4bb8706243a84108d77f15c2c8 ****/
		%feature("compactdefaultargs") RemoveAlert;
		%feature("autodoc", "Removes alert with specified gravity. @param thegravity an alert gravity @param thealert an alert to be removed from the children returns true if the alert is removed.

Parameters
----------
theGravity: Message_Gravity
theAlert: Message_Alert

Returns
-------
bool
") RemoveAlert;
		Standard_Boolean RemoveAlert(Message_Gravity theGravity, const opencascade::handle<Message_Alert> & theAlert);

};


%make_alias(Message_CompositeAlerts)

%extend Message_CompositeAlerts {
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

/* python proxy classes for enums */
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
		/**** md5 signature: e70fcb9e18b669793b993e8322ea1605 ****/
		%feature("compactdefaultargs") Message_ExecStatus;
		%feature("autodoc", "Initialise the execution status.

Parameters
----------
theStatus: Message_Status

Returns
-------
None
") Message_ExecStatus;
		 Message_ExecStatus(Message_Status theStatus);

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
		/**** md5 signature: 5d217c7d5185defc9a72813a728bbe14 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear one status.

Parameters
----------
theStatus: Message_Status

Returns
-------
None
") Clear;
		void Clear(Message_Status theStatus);

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
		/**** md5 signature: 19eb5fde3d07014e5af1d2a78dc374fb ****/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Check status for being set.

Parameters
----------
theStatus: Message_Status

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet(Message_Status theStatus);

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
		/**** md5 signature: 6c712b1771472bd46c2b10e4dfc2c642 ****/
		%feature("compactdefaultargs") LocalStatusIndex;
		%feature("autodoc", "Returns index of status inside type of status (done or warn or, etc) in range [1, statusespertype].

Parameters
----------
theStatus: Message_Status

Returns
-------
int
") LocalStatusIndex;
		static Standard_Integer LocalStatusIndex(Message_Status theStatus);

		/****************** Set ******************/
		/**** md5 signature: b242a4657d21c49402bda067388b0208 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets a status flag.

Parameters
----------
theStatus: Message_Status

Returns
-------
None
") Set;
		void Set(Message_Status theStatus);

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
		/**** md5 signature: 97762e4edd481e82f85b8126209f9d05 ****/
		%feature("compactdefaultargs") StatusIndex;
		%feature("autodoc", "Returns index of status in whole range [firststatus, laststatus].

Parameters
----------
theStatus: Message_Status

Returns
-------
int
") StatusIndex;
		static Standard_Integer StatusIndex(Message_Status theStatus);

		/****************** TypeOfStatus ******************/
		/**** md5 signature: 7df3ebd7e6811078add1c79ae4d46cbb ****/
		%feature("compactdefaultargs") TypeOfStatus;
		%feature("autodoc", "Returns status type (done, warn, alarm, or fail) .

Parameters
----------
theStatus: Message_Status

Returns
-------
Message_StatusType
") TypeOfStatus;
		static Message_StatusType TypeOfStatus(Message_Status theStatus);

};


%extend Message_ExecStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Message_Level *
**********************/
class Message_Level {
	public:
		/****************** Message_Level ******************/
		/**** md5 signature: 52d64033607531376dbce6771633395a ****/
		%feature("compactdefaultargs") Message_Level;
		%feature("autodoc", "Constructor. one string key is used for all alert meters. the perf meter is not started automatically, it will be done in addalert() method.

Parameters
----------
theName: TCollection_AsciiString,optional
	default value is TCollection_AsciiString()

Returns
-------
None
") Message_Level;
		 Message_Level(const TCollection_AsciiString & theName = TCollection_AsciiString());

		/****************** AddAlert ******************/
		/**** md5 signature: 6822168d042ac1736351cc369078d114 ****/
		%feature("compactdefaultargs") AddAlert;
		%feature("autodoc", "Adds new alert on the level. stops the last alert metric, appends the alert and starts the alert metrics collecting. sets root alert beforehand this method using, if the root is null, it does nothing. @param thegravity an alert gravity @param thealert an alert returns true if alert is added.

Parameters
----------
theGravity: Message_Gravity
theAlert: Message_Alert

Returns
-------
bool
") AddAlert;
		Standard_Boolean AddAlert(const Message_Gravity theGravity, const opencascade::handle<Message_Alert> & theAlert);

		/****************** RootAlert ******************/
		/**** md5 signature: df580c9f60fdc517981ba7c5bb3795f3 ****/
		%feature("compactdefaultargs") RootAlert;
		%feature("autodoc", "Returns root alert of the level returns alert instance or null.

Returns
-------
opencascade::handle<Message_AlertExtended>
") RootAlert;
		const opencascade::handle<Message_AlertExtended> & RootAlert();

		/****************** SetRootAlert ******************/
		/**** md5 signature: c29b138aed7a3f4a0a0900c584513f03 ****/
		%feature("compactdefaultargs") SetRootAlert;
		%feature("autodoc", "Sets the root alert. starts collects alert metrics if active. @param thealert an alert .

Parameters
----------
theAlert: Message_AlertExtended
isRequiredToStart: bool

Returns
-------
None
") SetRootAlert;
		void SetRootAlert(const opencascade::handle<Message_AlertExtended> & theAlert, const Standard_Boolean isRequiredToStart);

};


%extend Message_Level {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Message_Messenger *
**************************/
class Message_Messenger : public Standard_Transient {
	public:
		class StreamBuffer {};
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


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
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

};


%make_alias(Message_Messenger)

%extend Message_Messenger {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Send(self):
		pass

	@methodnotwrapped
	def SendAlarm(self):
		pass

	@methodnotwrapped
	def SendInfo(self):
		pass

	@methodnotwrapped
	def SendTrace(self):
		pass

	@methodnotwrapped
	def SendWarning(self):
		pass

	@methodnotwrapped
	def SendFail(self):
		pass
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
		%feature("autodoc", "Gives the text for the message identified by the keyword <key>. if there are no messages with such keyword defined, the error message is returned. in that case reference to static string is returned, it can be changed with next call(s) to msg(). note: the error message is constructed like 'unknown message: <key>', and can itself be customized by defining message with key message_msg_badkeyword.

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
		/**** md5 signature: 2eb2928323c2712c2e45b68666ff1fc3 ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Send a string message with specified trace level. the last boolean argument is deprecated and unused. default implementation redirects to send().

Parameters
----------
theString: TCollection_ExtendedString
theGravity: Message_Gravity

Returns
-------
None
") Send;
		virtual void Send(const TCollection_ExtendedString & theString, const Message_Gravity theGravity);

		/****************** Send ******************/
		/**** md5 signature: 0c58ee0dbb6a09d1744f40578405c768 ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Send a string message with specified trace level. the last boolean argument is deprecated and unused. default implementation redirects to send().

Parameters
----------
theString: char *
theGravity: Message_Gravity

Returns
-------
None
") Send;
		virtual void Send(const char * theString, const Message_Gravity theGravity);

		/****************** Send ******************/
		/**** md5 signature: 4b9e6e900c60c7a53742bdd6d96a0c34 ****/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Send a string message with specified trace level. the last boolean argument is deprecated and unused. default implementation redirects to send().

Parameters
----------
theString: TCollection_AsciiString
theGravity: Message_Gravity

Returns
-------
None
") Send;
		virtual void Send(const TCollection_AsciiString & theString, const Message_Gravity theGravity);

		/****************** SendObject ******************/
		/**** md5 signature: 7c818ea3a690882c6ab2eaf01f19188a ****/
		%feature("compactdefaultargs") SendObject;
		%feature("autodoc", "Send a string message with specified trace level. the object is converted to string in format: <object kind> : <object pointer>. default implementation calls first method send().

Parameters
----------
theObject: Standard_Transient
theGravity: Message_Gravity

Returns
-------
None
") SendObject;
		virtual void SendObject(const opencascade::handle<Standard_Transient> & theObject, const Message_Gravity theGravity);

		/****************** SendStringStream ******************/
		/**** md5 signature: 54e59dce53b8cfc5968219565c2204ee ****/
		%feature("compactdefaultargs") SendStringStream;
		%feature("autodoc", "Send a string message with specified trace level. stream is converted to string value. default implementation calls first method send().

Parameters
----------
theStream: Standard_SStream
theGravity: Message_Gravity

Returns
-------
None
") SendStringStream;
		virtual void SendStringStream(const Standard_SStream & theStream, const Message_Gravity theGravity);

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
		/****************** GetPosition ******************/
		/**** md5 signature: a5e1b2902874eb36e192e83771aaa0de ****/
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "Returns total progress position ranged from 0 to 1. should not be called concurrently while the progress is advancing, except from implementation of method show().

Returns
-------
float
") GetPosition;
		Standard_Real GetPosition();

		/****************** Start ******************/
		/**** md5 signature: 641d195faa8ef13594a798925aa3d5fe ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Resets the indicator to zero, calls reset(), and returns the range. this range refers to the scope that has no name and is initialized with max value 1 and step 1. use this method to get the top level range for progress indication.

Returns
-------
Message_ProgressRange
") Start;
		Message_ProgressRange Start();

		/****************** Start ******************/
		/**** md5 signature: 92c770394d6e4b367100b7541920e359 ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "If argument is non-null handle, returns theprogress->start(). otherwise, returns dummy range that can be safely used in the algorithms but not bound to progress indicator.

Parameters
----------
theProgress: Message_ProgressIndicator

Returns
-------
Message_ProgressRange
") Start;
		static Message_ProgressRange Start(const opencascade::handle<Message_ProgressIndicator> & theProgress);

};


%make_alias(Message_ProgressIndicator)

%extend Message_ProgressIndicator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Message_ProgressRange *
******************************/
class Message_ProgressRange {
	public:
		/****************** Message_ProgressRange ******************/
		/**** md5 signature: bcc3605cb831aa500c4a3f7a8a42117b ****/
		%feature("compactdefaultargs") Message_ProgressRange;
		%feature("autodoc", "Constructor of the empty range.

Returns
-------
None
") Message_ProgressRange;
		 Message_ProgressRange();

		/****************** Message_ProgressRange ******************/
		/**** md5 signature: 03ca52206a59f90254b00728aece2467 ****/
		%feature("compactdefaultargs") Message_ProgressRange;
		%feature("autodoc", "Copy constructor disarms the source.

Parameters
----------
theOther: Message_ProgressRange

Returns
-------
None
") Message_ProgressRange;
		 Message_ProgressRange(const Message_ProgressRange & theOther);

		/****************** Close ******************/
		/**** md5 signature: d50d7ba65c2beb3eb436584b5735f108 ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Closes the current range and advances indicator.

Returns
-------
None
") Close;
		void Close();

		/****************** IsActive ******************/
		/**** md5 signature: 476abafc82a8bb87ac904f5a77e179a3 ****/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "Returns true if this progress range is attached to some indicator.

Returns
-------
bool
") IsActive;
		Standard_Boolean IsActive();

		/****************** More ******************/
		/**** md5 signature: cff271d3b32940da94bada40648f9096 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns false if progressindicator signals userbreak.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** UserBreak ******************/
		/**** md5 signature: a3184031f8c031243ff09aeb0da2460e ****/
		%feature("compactdefaultargs") UserBreak;
		%feature("autodoc", "Returns true if progressindicator signals userbreak.

Returns
-------
bool
") UserBreak;
		Standard_Boolean UserBreak();

};


%extend Message_ProgressRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Message_ProgressScope *
******************************/
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

		/****************** ActivateInMessenger ******************/
		/**** md5 signature: 6760ecf65f1a6556a3e99e8ba7275f7d ****/
		%feature("compactdefaultargs") ActivateInMessenger;
		%feature("autodoc", "Creates an instance of message_printertoreport with the current report and register it in messenger @param toactivate if true, activated else deactivated @param themessenger the messenger. if it's null, the default messenger is used.

Parameters
----------
toActivate: bool
theMessenger: Message_Messenger,optional
	default value is NULL

Returns
-------
None
") ActivateInMessenger;
		void ActivateInMessenger(const Standard_Boolean toActivate, const opencascade::handle<Message_Messenger> & theMessenger = NULL);

		/****************** ActiveMetrics ******************/
		/**** md5 signature: 69fbfa35c1d07de4faca23e67c2982b0 ****/
		%feature("compactdefaultargs") ActiveMetrics;
		%feature("autodoc", "Returns computed metrics when alerts are performed.

Returns
-------
NCollection_IndexedMap<Message_MetricType>
") ActiveMetrics;
		const NCollection_IndexedMap<Message_MetricType> & ActiveMetrics();

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

		/****************** AddLevel ******************/
		/**** md5 signature: 2875c942a63b96463c74725a1dd630b0 ****/
		%feature("compactdefaultargs") AddLevel;
		%feature("autodoc", "Add new level of alerts @param thelevel a level .

Parameters
----------
theLevel: Message_Level *
theName: TCollection_AsciiString

Returns
-------
None
") AddLevel;
		void AddLevel(Message_Level * theLevel, const TCollection_AsciiString & theName);

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

		/****************** ClearMetrics ******************/
		/**** md5 signature: 347f25435c30f19b880a881962a2224f ****/
		%feature("compactdefaultargs") ClearMetrics;
		%feature("autodoc", "Removes all activated metrics.

Returns
-------
None
") ClearMetrics;
		void ClearMetrics();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };

            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
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

		/****************** IsActiveInMessenger ******************/
		/**** md5 signature: c742075e9f41eeea7a7151a5775d8232 ****/
		%feature("compactdefaultargs") IsActiveInMessenger;
		%feature("autodoc", "Returns true if a report printer for the current report is registered in the messenger @param themessenger the messenger. if it's null, the default messenger is used.

Parameters
----------
theMessenger: Message_Messenger,optional
	default value is NULL

Returns
-------
bool
") IsActiveInMessenger;
		Standard_Boolean IsActiveInMessenger(const opencascade::handle<Message_Messenger> & theMessenger = NULL);

		/****************** Limit ******************/
		/**** md5 signature: 4c143ecf7a94bec5302a799121b4f1fa ****/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "Returns maximum number of collecting alerts. if the limit is achieved, first alert is removed, the new alert is added in the container. returns the limit value.

Returns
-------
int
") Limit;
		Standard_Integer Limit();

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

		/****************** RemoveLevel ******************/
		/**** md5 signature: 0d698f99a100c109734747e5b09c2200 ****/
		%feature("compactdefaultargs") RemoveLevel;
		%feature("autodoc", "Remove level of alerts.

Parameters
----------
theLevel: Message_Level *

Returns
-------
None
") RemoveLevel;
		void RemoveLevel(Message_Level * theLevel);

		/****************** SendMessages ******************/
		/**** md5 signature: b49d24787eb95e615bc87992c508982d ****/
		%feature("compactdefaultargs") SendMessages;
		%feature("autodoc", "Sends all collected alerts to messenger.

Parameters
----------
theMessenger: Message_Messenger

Returns
-------
None
") SendMessages;
		virtual void SendMessages(const opencascade::handle<Message_Messenger> & theMessenger);

		/****************** SendMessages ******************/
		/**** md5 signature: 2039482f00272bd003e36f844c23bcc3 ****/
		%feature("compactdefaultargs") SendMessages;
		%feature("autodoc", "Dumps collected alerts with specified gravity to messenger. default implementation creates message_msg object with a message key returned by alert, and sends it in the messenger.

Parameters
----------
theMessenger: Message_Messenger
theGravity: Message_Gravity

Returns
-------
None
") SendMessages;
		virtual void SendMessages(const opencascade::handle<Message_Messenger> & theMessenger, Message_Gravity theGravity);

		/****************** SetActiveMetric ******************/
		/**** md5 signature: 8b0fd359e5d58f4029b1e7748552f229 ****/
		%feature("compactdefaultargs") SetActiveMetric;
		%feature("autodoc", "Sets metrics to compute when alerts are performed @param themetrics container of metrics.

Parameters
----------
theMetricType: Message_MetricType
theActivate: bool

Returns
-------
None
") SetActiveMetric;
		void SetActiveMetric(const Message_MetricType theMetricType, const Standard_Boolean theActivate);

		/****************** SetLimit ******************/
		/**** md5 signature: 3086e0a1c8b869746059ea97fbe95f3e ****/
		%feature("compactdefaultargs") SetLimit;
		%feature("autodoc", "Sets maximum number of collecting alerts. @param thelimit limit value.

Parameters
----------
theLimit: int

Returns
-------
None
") SetLimit;
		void SetLimit(const Standard_Integer theLimit);

		/****************** UpdateActiveInMessenger ******************/
		/**** md5 signature: 2fce97adc40cd2d6c92a74c8ec882d00 ****/
		%feature("compactdefaultargs") UpdateActiveInMessenger;
		%feature("autodoc", "Updates internal flag isactiveinmessenger. it becomes true if messenger contains at least one instance of message_printertoreport. @param themessenger the messenger. if it's null, the default messenger is used.

Parameters
----------
theMessenger: Message_Messenger,optional
	default value is NULL

Returns
-------
None
") UpdateActiveInMessenger;
		void UpdateActiveInMessenger(const opencascade::handle<Message_Messenger> & theMessenger = NULL);

};


%make_alias(Message_Report)

%extend Message_Report {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Message_AlertExtended *
******************************/
class Message_AlertExtended : public Message_Alert {
	public:
		/****************** Message_AlertExtended ******************/
		/**** md5 signature: 511a89534645d66d0f332b262d6c6a00 ****/
		%feature("compactdefaultargs") Message_AlertExtended;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Message_AlertExtended;
		 Message_AlertExtended();

		/****************** AddAlert ******************/
		/**** md5 signature: 64289ddc6a8ac019b1052ee2c6f07ec9 ****/
		%feature("compactdefaultargs") AddAlert;
		%feature("autodoc", "Creates new instance of the alert and put it into report with message_info gravity. it does nothing if such kind of gravity is not active in the report @param thereport the message report where new alert is placed @param theattribute container of additional values of the alert returns created alert or null if message_info is not active in report.

Parameters
----------
theReport: Message_Report
theAttribute: Message_Attribute
theGravity: Message_Gravity

Returns
-------
opencascade::handle<Message_Alert>
") AddAlert;
		static opencascade::handle<Message_Alert> AddAlert(const opencascade::handle<Message_Report> & theReport, const opencascade::handle<Message_Attribute> & theAttribute, const Message_Gravity theGravity);

		/****************** Attribute ******************/
		/**** md5 signature: d873f2c4cc26357e7f247f03dd0a0595 ****/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "Returns container of the alert attributes.

Returns
-------
opencascade::handle<Message_Attribute>
") Attribute;
		const opencascade::handle<Message_Attribute> & Attribute();

		/****************** CompositeAlerts ******************/
		/**** md5 signature: 4be9cfb8aebe49f3027c7e6c3e36e566 ****/
		%feature("compactdefaultargs") CompositeAlerts;
		%feature("autodoc", "Returns class provided hierarchy of alerts if created or create if the parameter is true @param thetocreate if composite alert has not been created for this alert, it should be created returns instance or null.

Parameters
----------
theToCreate: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<Message_CompositeAlerts>
") CompositeAlerts;
		opencascade::handle<Message_CompositeAlerts> CompositeAlerts(const Standard_Boolean theToCreate = Standard_False);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** GetMessageKey ******************/
		/**** md5 signature: a89afc9b71fa70bfa5a05fd046a77fe7 ****/
		%feature("compactdefaultargs") GetMessageKey;
		%feature("autodoc", "Return a c string to be used as a key for generating text user messages describing this alert. the messages are generated with help of message_msg class, in message_report::dump(). base implementation returns dynamic type name of the instance.

Returns
-------
char *
") GetMessageKey;
		virtual const char * GetMessageKey();

		/****************** Merge ******************/
		/**** md5 signature: 35843034c2fcb7185666677c75445acd ****/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "If possible, merge data contained in this alert to thetarget. base implementation always returns false. returns true if merged.

Parameters
----------
theTarget: Message_Alert

Returns
-------
bool
") Merge;
		virtual Standard_Boolean Merge(const opencascade::handle<Message_Alert> & theTarget);

		/****************** SetAttribute ******************/
		/**** md5 signature: 1dd3f1a57ce4137320643019f6422bc5 ****/
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "Sets container of the alert attributes @param theattributes an attribute values.

Parameters
----------
theAttribute: Message_Attribute

Returns
-------
None
") SetAttribute;
		void SetAttribute(const opencascade::handle<Message_Attribute> & theAttribute);

		/****************** SupportsMerge ******************/
		/**** md5 signature: 45abe0601cddac599cb8c2c1cbfefd85 ****/
		%feature("compactdefaultargs") SupportsMerge;
		%feature("autodoc", "Return true if this type of alert can be merged with other of the same type to avoid duplication. hierarchical alerts can not be merged basis implementation returns true.

Returns
-------
bool
") SupportsMerge;
		virtual Standard_Boolean SupportsMerge();

};


%make_alias(Message_AlertExtended)

%extend Message_AlertExtended {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Message_AttributeMeter *
*******************************/
class Message_AttributeMeter : public Message_Attribute {
	public:
		/****************** Message_AttributeMeter ******************/
		/**** md5 signature: 3b95a3ca364fcdb6d37e6da5b52bfd05 ****/
		%feature("compactdefaultargs") Message_AttributeMeter;
		%feature("autodoc", "Constructor with string argument.

Parameters
----------
theName: TCollection_AsciiString,optional
	default value is TCollection_AsciiString()

Returns
-------
None
") Message_AttributeMeter;
		 Message_AttributeMeter(const TCollection_AsciiString & theName = TCollection_AsciiString());


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** HasMetric ******************/
		/**** md5 signature: 3f12286f59675604f3124d35ffdcb72e ****/
		%feature("compactdefaultargs") HasMetric;
		%feature("autodoc", "Checks whether the attribute has values for the metric @param themetric [in] metric type returns true if the metric values exist in the attribute.

Parameters
----------
theMetric: Message_MetricType

Returns
-------
bool
") HasMetric;
		Standard_Boolean HasMetric(const Message_MetricType & theMetric);

		/****************** IsMetricValid ******************/
		/**** md5 signature: ec98d3332b7fa587970240f15aebd779 ****/
		%feature("compactdefaultargs") IsMetricValid;
		%feature("autodoc", "Returns true when both values of the metric are set. @param themetric [in] metric type returns true if metric values are valid.

Parameters
----------
theMetric: Message_MetricType

Returns
-------
bool
") IsMetricValid;
		Standard_Boolean IsMetricValid(const Message_MetricType & theMetric);

		/****************** SetAlertMetrics ******************/
		/**** md5 signature: c66a5c7cae777f915625c21e78f2d68c ****/
		%feature("compactdefaultargs") SetAlertMetrics;
		%feature("autodoc", "Sets current values of default report metrics into the alert. processed only alert with message_attributemeter attribute @param thealert an alert @param thestartvalue flag, if true, the start value is collected otherwise stop.

Parameters
----------
theAlert: Message_AlertExtended
theStartValue: bool

Returns
-------
None
") SetAlertMetrics;
		static void SetAlertMetrics(const opencascade::handle<Message_AlertExtended> & theAlert, const Standard_Boolean theStartValue);

		/****************** SetStartValue ******************/
		/**** md5 signature: 34ac0c1ff7621a8f76e8ce7457dd3619 ****/
		%feature("compactdefaultargs") SetStartValue;
		%feature("autodoc", "Sets start values for the metric @param themetric [in] metric type.

Parameters
----------
theMetric: Message_MetricType
theValue: float

Returns
-------
None
") SetStartValue;
		void SetStartValue(const Message_MetricType & theMetric, const Standard_Real theValue);

		/****************** SetStopValue ******************/
		/**** md5 signature: 4c1d382df1bb019f355be83c4c89c490 ****/
		%feature("compactdefaultargs") SetStopValue;
		%feature("autodoc", "Sets stop values for the metric @param themetric [in] metric type.

Parameters
----------
theMetric: Message_MetricType
theValue: float

Returns
-------
None
") SetStopValue;
		void SetStopValue(const Message_MetricType & theMetric, const Standard_Real theValue);

		/****************** StartAlert ******************/
		/**** md5 signature: 9cfb4f2fed520f32c1c0141fab40cd55 ****/
		%feature("compactdefaultargs") StartAlert;
		%feature("autodoc", "Sets start values of default report metrics into the alert @param thealert an alert .

Parameters
----------
theAlert: Message_AlertExtended

Returns
-------
None
") StartAlert;
		static void StartAlert(const opencascade::handle<Message_AlertExtended> & theAlert);

		/****************** StartValue ******************/
		/**** md5 signature: 2d2ac7b89e0ba81754328eb8d3bd3d52 ****/
		%feature("compactdefaultargs") StartValue;
		%feature("autodoc", "Returns start value for the metric @param themetric [in] metric type returns real value.

Parameters
----------
theMetric: Message_MetricType

Returns
-------
float
") StartValue;
		Standard_Real StartValue(const Message_MetricType & theMetric);

		/****************** StopAlert ******************/
		/**** md5 signature: f051aa14cda40746a870817f89d9ca1c ****/
		%feature("compactdefaultargs") StopAlert;
		%feature("autodoc", "Sets stop values of default report metrics into the alert @param thealert an alert .

Parameters
----------
theAlert: Message_AlertExtended

Returns
-------
None
") StopAlert;
		static void StopAlert(const opencascade::handle<Message_AlertExtended> & theAlert);

		/****************** StopValue ******************/
		/**** md5 signature: 73140499ec46cab9a3b54b561db9d503 ****/
		%feature("compactdefaultargs") StopValue;
		%feature("autodoc", "Returns stop value for the metric @param themetric [in] metric type returns real value.

Parameters
----------
theMetric: Message_MetricType

Returns
-------
float
") StopValue;
		Standard_Real StopValue(const Message_MetricType & theMetric);

		/****************** UndefinedMetricValue ******************/
		/**** md5 signature: 1197c1dee25da141b862477e3a1ff2ca ****/
		%feature("compactdefaultargs") UndefinedMetricValue;
		%feature("autodoc", "Returns default value of the metric when it is not defined returns undefined value.

Returns
-------
float
") UndefinedMetricValue;
		static Standard_Real UndefinedMetricValue();

};


%make_alias(Message_AttributeMeter)

%extend Message_AttributeMeter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Message_AttributeObject *
********************************/
class Message_AttributeObject : public Message_Attribute {
	public:
		/****************** Message_AttributeObject ******************/
		/**** md5 signature: 6c4bfa828e8a46e741976178e861a689 ****/
		%feature("compactdefaultargs") Message_AttributeObject;
		%feature("autodoc", "Constructor with string argument.

Parameters
----------
theObject: Standard_Transient
theName: TCollection_AsciiString,optional
	default value is TCollection_AsciiString()

Returns
-------
None
") Message_AttributeObject;
		 Message_AttributeObject(const opencascade::handle<Standard_Transient> & theObject, const TCollection_AsciiString & theName = TCollection_AsciiString());


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** Object ******************/
		/**** md5 signature: 980fb130325587d03ae875c7b436387a ****/
		%feature("compactdefaultargs") Object;
		%feature("autodoc", "Returns object returns the object instance.

Returns
-------
opencascade::handle<Standard_Transient>
") Object;
		const opencascade::handle<Standard_Transient> & Object();

		/****************** SetObject ******************/
		/**** md5 signature: 86ca8ffa942614fd400cee9017359afa ****/
		%feature("compactdefaultargs") SetObject;
		%feature("autodoc", "Sets the object @param theobject an instance.

Parameters
----------
theObject: Standard_Transient

Returns
-------
None
") SetObject;
		void SetObject(const opencascade::handle<Standard_Transient> & theObject);

};


%make_alias(Message_AttributeObject)

%extend Message_AttributeObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Message_AttributeStream *
********************************/
class Message_AttributeStream : public Message_Attribute {
	public:
		/****************** Message_AttributeStream ******************/
		/**** md5 signature: ae1d92aaabc47d48af35c92f68dead8d ****/
		%feature("compactdefaultargs") Message_AttributeStream;
		%feature("autodoc", "Constructor with string argument.

Parameters
----------
theStream: Standard_SStream
theName: TCollection_AsciiString,optional
	default value is TCollection_AsciiString()

Returns
-------
None
") Message_AttributeStream;
		 Message_AttributeStream(const Standard_SStream & theStream, const TCollection_AsciiString & theName = TCollection_AsciiString());


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** SetStream ******************/
		/**** md5 signature: bd93662a7f73ff5e9a6217c3100cd562 ****/
		%feature("compactdefaultargs") SetStream;
		%feature("autodoc", "Sets stream value.

Parameters
----------
theStream: Standard_SStream

Returns
-------
None
") SetStream;
		void SetStream(const Standard_SStream & theStream);

		/****************** Stream ******************/
		/**** md5 signature: bf624542447549e8d924a142424a736a ****/
		%feature("compactdefaultargs") Stream;
		%feature("autodoc", "Returns stream value.

Returns
-------
Standard_SStream
") Stream;
		const Standard_SStream & Stream();

};


%make_alias(Message_AttributeStream)

%extend Message_AttributeStream {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Message_LazyProgressScope *
**********************************/
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

		/****************** SetToColorize ******************/
		/**** md5 signature: b4f903af5677d00a1f393de87002a6a5 ****/
		%feature("compactdefaultargs") SetToColorize;
		%feature("autodoc", "Set if text output into console should be colorized depending on message gravity.

Parameters
----------
theToColorize: bool

Returns
-------
None
") SetToColorize;
		void SetToColorize(Standard_Boolean theToColorize);

		/****************** ToColorize ******************/
		/**** md5 signature: 8b29b99ccd01eee1376b6c14a1d2e81a ****/
		%feature("compactdefaultargs") ToColorize;
		%feature("autodoc", "Returns true if text output into console should be colorized depending on message gravity; true by default.

Returns
-------
bool
") ToColorize;
		Standard_Boolean ToColorize();

};


%make_alias(Message_PrinterOStream)

%extend Message_PrinterOStream {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Message_PrinterSystemLog *
*********************************/
class Message_PrinterSystemLog : public Message_Printer {
	public:
		/****************** Message_PrinterSystemLog ******************/
		/**** md5 signature: cf596c3a8bcbaafc15d6d7aef9eaa912 ****/
		%feature("compactdefaultargs") Message_PrinterSystemLog;
		%feature("autodoc", "Main constructor.

Parameters
----------
theEventSourceName: TCollection_AsciiString
theTraceLevel: Message_Gravity,optional
	default value is Message_Info

Returns
-------
None
") Message_PrinterSystemLog;
		 Message_PrinterSystemLog(const TCollection_AsciiString & theEventSourceName, const Message_Gravity theTraceLevel = Message_Info);

};


%make_alias(Message_PrinterSystemLog)

%extend Message_PrinterSystemLog {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Message_PrinterToReport *
********************************/
class Message_PrinterToReport : public Message_Printer {
	public:
		/****************** Message_PrinterToReport ******************/
		/**** md5 signature: 4d806309372807fc173121055fa6b751 ****/
		%feature("compactdefaultargs") Message_PrinterToReport;
		%feature("autodoc", "Create printer for redirecting messages into report.

Returns
-------
None
") Message_PrinterToReport;
		 Message_PrinterToReport();

		/****************** Report ******************/
		/**** md5 signature: 419008b80d85ded8b37c8fdd1b881df4 ****/
		%feature("compactdefaultargs") Report;
		%feature("autodoc", "Returns the current or default report.

Returns
-------
opencascade::handle<Message_Report>
") Report;
		const opencascade::handle<Message_Report> & Report();

		/****************** SendObject ******************/
		/**** md5 signature: c28ab021e116263770372caf8295e160 ****/
		%feature("compactdefaultargs") SendObject;
		%feature("autodoc", "Send a string message with specified trace level. the object is converted to string in format: <object kind> : <object pointer>. the parameter thetoputeol specified whether end-of-line should be added to the end of the message. default implementation calls first method send().

Parameters
----------
theObject: Standard_Transient
theGravity: Message_Gravity

Returns
-------
None
") SendObject;
		virtual void SendObject(const opencascade::handle<Standard_Transient> & theObject, const Message_Gravity theGravity);

		/****************** SendStringStream ******************/
		/**** md5 signature: b78a7459709969aa520bb51c62824536 ****/
		%feature("compactdefaultargs") SendStringStream;
		%feature("autodoc", "Send a string message with specified trace level. stream is converted to string value. default implementation calls first method send().

Parameters
----------
theStream: Standard_SStream
theGravity: Message_Gravity

Returns
-------
None
") SendStringStream;
		virtual void SendStringStream(const Standard_SStream & theStream, const Message_Gravity theGravity);

		/****************** SetReport ******************/
		/**** md5 signature: f93d4cd16d2a9be962c8ab7766dddef1 ****/
		%feature("compactdefaultargs") SetReport;
		%feature("autodoc", "Sets the printer report @param thereport report for messages processing, if null, the default report is used.

Parameters
----------
theReport: Message_Report

Returns
-------
None
") SetReport;
		void SetReport(const opencascade::handle<Message_Report> & theReport);

};


%make_alias(Message_PrinterToReport)

%extend Message_PrinterToReport {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Message_ProgressSentry *
*******************************/
class Message_ProgressSentry : public Message_ProgressScope {
	public:
		/****************** Message_ProgressSentry ******************/
		/**** md5 signature: 1230165fd9f060b2f2607edcf046b87e ****/
		%feature("compactdefaultargs") Message_ProgressSentry;
		%feature("autodoc", "Deprecated constructor, message_progressscope should be created instead.

Parameters
----------
theRange: Message_ProgressRange
theName: char *
theMin: float
theMax: float
theStep: float
theIsInf: bool,optional
	default value is Standard_False
theNewScopeSpan: float,optional
	default value is 0.0

Returns
-------
None
") Message_ProgressSentry;
		 Message_ProgressSentry(const Message_ProgressRange & theRange, const char * theName, const Standard_Real theMin, const Standard_Real theMax, const Standard_Real theStep, const Standard_Boolean theIsInf = Standard_False, const Standard_Real theNewScopeSpan = 0.0);

		/****************** Relieve ******************/
		/**** md5 signature: afb30890579d12c604229a7b3e1a2bcf ****/
		%feature("compactdefaultargs") Relieve;
		%feature("autodoc", "Method relieve() was replaced by close() in message_progressscope.

Returns
-------
None
") Relieve;
		void Relieve();

};


%extend Message_ProgressSentry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Message_ProgressScope:
	pass

@classnotwrapped
class Message_LazyProgressScope:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
