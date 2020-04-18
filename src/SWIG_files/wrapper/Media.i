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
%define MEDIADOCSTRING
"Media module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_media.html"
%enddef
%module (package="OCC.Core", docstring=MEDIADOCSTRING) Media


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
#include<Media_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<Image_module.hxx>
#include<Graphic3d_module.hxx>
#include<Geom_module.hxx>
#include<Bnd_module.hxx>
#include<Quantity_module.hxx>
#include<Aspect_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import Image.i
%import Graphic3d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Media_BufferPool)
%wrap_handle(Media_CodecContext)
%wrap_handle(Media_FormatContext)
%wrap_handle(Media_Frame)
%wrap_handle(Media_Packet)
%wrap_handle(Media_PlayerContext)
%wrap_handle(Media_Scaler)
%wrap_handle(Media_Timer)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*************************
* class Media_BufferPool *
*************************/
class Media_BufferPool : public Standard_Transient {
	public:
		/****************** Media_BufferPool ******************/
		%feature("compactdefaultargs") Media_BufferPool;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Media_BufferPool;
		 Media_BufferPool();

		/****************** BufferSize ******************/
		%feature("compactdefaultargs") BufferSize;
		%feature("autodoc", "Return buffer size within the pool.

Returns
-------
int
") BufferSize;
		int BufferSize();

		/****************** GetBuffer ******************/
		%feature("compactdefaultargs") GetBuffer;
		%feature("autodoc", "Get new buffer from the pool.

Returns
-------
AVBufferRef *
") GetBuffer;
		AVBufferRef * GetBuffer();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "(re-)initialize the pool.

Parameters
----------
theBufferSize: int

Returns
-------
bool
") Init;
		bool Init(int theBufferSize);

		/****************** Release ******************/
		%feature("compactdefaultargs") Release;
		%feature("autodoc", "Release the pool (reference-counted buffer will be released when needed).

Returns
-------
None
") Release;
		void Release();

};


%make_alias(Media_BufferPool)

%extend Media_BufferPool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Media_CodecContext *
***************************/
class Media_CodecContext : public Standard_Transient {
	public:
		/****************** Media_CodecContext ******************/
		%feature("compactdefaultargs") Media_CodecContext;
		%feature("autodoc", "Constructor.

Returns
-------
None
") Media_CodecContext;
		 Media_CodecContext();

		/****************** CanProcessPacket ******************/
		%feature("compactdefaultargs") CanProcessPacket;
		%feature("autodoc", "Return true if packet belongs to this stream.

Parameters
----------
thePacket: Media_Packet

Returns
-------
bool
") CanProcessPacket;
		bool CanProcessPacket(const opencascade::handle<Media_Packet> & thePacket);

		/****************** Close ******************/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Close input.

Returns
-------
None
") Close;
		void Close();

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return context.

Returns
-------
AVCodecContext *
") Context;
		AVCodecContext * Context();

		/****************** Flush ******************/
		%feature("compactdefaultargs") Flush;
		%feature("autodoc", "Avcodec_flush_buffers() wrapper.

Returns
-------
None
") Flush;
		void Flush();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Open codec specified within the stream. @param thestream stream to open @param theptsstartbase pts start in seconds @param thenbthreads amount of threads to use for avmedia_type_video stream; -1 means osd_parallel::nblogicalprocessors(),  0 means auto by ffmpeg itself >0 means specified number of threads (decoder should support multi-threading to take effect).

Parameters
----------
theStream: AVStream
thePtsStartBase: double
theNbThreads: int,optional
	default value is -1

Returns
-------
bool
") Init;
		bool Init(const AVStream & theStream, double thePtsStartBase, int theNbThreads = -1);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Open codec. @param thestream stream to open @param theptsstartbase pts start in seconds @param thenbthreads amount of threads to use for avmedia_type_video stream; -1 means osd_parallel::nblogicalprocessors(),  0 means auto by ffmpeg itself >0 means specified number of threads (decoder should support multi-threading to take effect) @param thecodecid codec (avcodecid) to open.

Parameters
----------
theStream: AVStream
thePtsStartBase: double
theNbThreads: int
theCodecId: int

Returns
-------
bool
") Init;
		bool Init(const AVStream & theStream, double thePtsStartBase, int theNbThreads, int theCodecId);

		/****************** ReceiveFrame ******************/
		%feature("compactdefaultargs") ReceiveFrame;
		%feature("autodoc", "Avcodec_receive_frame() wrapper.

Parameters
----------
theFrame: Media_Frame

Returns
-------
bool
") ReceiveFrame;
		bool ReceiveFrame(const opencascade::handle<Media_Frame> & theFrame);

		/****************** SendPacket ******************/
		%feature("compactdefaultargs") SendPacket;
		%feature("autodoc", "Avcodec_send_packet() wrapper.

Parameters
----------
thePacket: Media_Packet

Returns
-------
bool
") SendPacket;
		bool SendPacket(const opencascade::handle<Media_Packet> & thePacket);

		/****************** SizeX ******************/
		%feature("compactdefaultargs") SizeX;
		%feature("autodoc", "Returns source frame width.

Returns
-------
int
") SizeX;
		int SizeX();

		/****************** SizeY ******************/
		%feature("compactdefaultargs") SizeY;
		%feature("autodoc", "Returns source frame height.

Returns
-------
int
") SizeY;
		int SizeY();

		/****************** StreamIndex ******************/
		%feature("compactdefaultargs") StreamIndex;
		%feature("autodoc", "Return stream index.

Returns
-------
int
") StreamIndex;
		int StreamIndex();

};


%make_alias(Media_CodecContext)

%extend Media_CodecContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Media_FormatContext *
****************************/
class Media_FormatContext : public Standard_Transient {
	public:
		/****************** Media_FormatContext ******************/
		%feature("compactdefaultargs") Media_FormatContext;
		%feature("autodoc", "Constructor.

Returns
-------
None
") Media_FormatContext;
		 Media_FormatContext();

		/****************** Close ******************/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Close input.

Returns
-------
None
") Close;
		void Close();

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return context.

Returns
-------
AVFormatContext *
") Context;
		AVFormatContext * Context();

		/****************** Duration ******************/
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "Return duration in seconds.

Returns
-------
double
") Duration;
		double Duration();

		/****************** FormatAVErrorDescription ******************/
		%feature("compactdefaultargs") FormatAVErrorDescription;
		%feature("autodoc", "Returns string description for averror code.

Parameters
----------
theErrCodeAV: int

Returns
-------
TCollection_AsciiString
") FormatAVErrorDescription;
		static TCollection_AsciiString FormatAVErrorDescription(int theErrCodeAV);

		/****************** FormatTime ******************/
		%feature("compactdefaultargs") FormatTime;
		%feature("autodoc", "Time formatter.

Parameters
----------
theSeconds: double

Returns
-------
TCollection_AsciiString
") FormatTime;
		static TCollection_AsciiString FormatTime(double theSeconds);

		/****************** FormatTimeProgress ******************/
		%feature("compactdefaultargs") FormatTimeProgress;
		%feature("autodoc", "Time progress / duration formatter.

Parameters
----------
theProgress: double
theDuration: double

Returns
-------
TCollection_AsciiString
") FormatTimeProgress;
		static TCollection_AsciiString FormatTimeProgress(double theProgress, double theDuration);

		/****************** FormatUnitsToSeconds ******************/
		%feature("compactdefaultargs") FormatUnitsToSeconds;
		%feature("autodoc", "Convert time units into seconds for context. @param thetimeunits value to convert returns converted time units in seconds.

Parameters
----------
theTimeUnits: int64_t

Returns
-------
double
") FormatUnitsToSeconds;
		static double FormatUnitsToSeconds(int64_t theTimeUnits);

		/****************** NbSteams ******************/
		%feature("compactdefaultargs") NbSteams;
		%feature("autodoc", "Return amount of streams.

Returns
-------
unsigned int
") NbSteams;
		unsigned int NbSteams();

		/****************** OpenInput ******************/
		%feature("compactdefaultargs") OpenInput;
		%feature("autodoc", "Open input.

Parameters
----------
theInput: TCollection_AsciiString

Returns
-------
bool
") OpenInput;
		bool OpenInput(const TCollection_AsciiString & theInput);

		/****************** PtsStartBase ******************/
		%feature("compactdefaultargs") PtsStartBase;
		%feature("autodoc", "Return pts start base in seconds.

Returns
-------
double
") PtsStartBase;
		double PtsStartBase();

		/****************** ReadPacket ******************/
		%feature("compactdefaultargs") ReadPacket;
		%feature("autodoc", "Av_read_frame() wrapper.

Parameters
----------
thePacket: Media_Packet

Returns
-------
bool
") ReadPacket;
		bool ReadPacket(const opencascade::handle<Media_Packet> & thePacket);

		/****************** SecondsToUnits ******************/
		%feature("compactdefaultargs") SecondsToUnits;
		%feature("autodoc", "Convert seconds into time units for context. @param thetimeseconds value to convert returns time units.

Parameters
----------
theTimeSeconds: double

Returns
-------
int64_t
") SecondsToUnits;
		static int64_t SecondsToUnits(double theTimeSeconds);

		/****************** SecondsToUnits ******************/
		%feature("compactdefaultargs") SecondsToUnits;
		%feature("autodoc", "Convert seconds into time units. @param thetimebase the timebase @param thetimeseconds value to convert returns time units.

Parameters
----------
theTimeBase: AVRational
theTimeSeconds: double

Returns
-------
int64_t
") SecondsToUnits;
		static int64_t SecondsToUnits(const AVRational & theTimeBase, double theTimeSeconds);

		/****************** Seek ******************/
		%feature("compactdefaultargs") Seek;
		%feature("autodoc", "Seek context to specified position.

Parameters
----------
theSeekPts: double
toSeekBack: bool

Returns
-------
bool
") Seek;
		bool Seek(double theSeekPts, bool toSeekBack);

		/****************** SeekStream ******************/
		%feature("compactdefaultargs") SeekStream;
		%feature("autodoc", "Seek stream to specified position.

Parameters
----------
theStreamId: unsigned int
theSeekPts: double
toSeekBack: bool

Returns
-------
bool
") SeekStream;
		bool SeekStream(unsigned int theStreamId, double theSeekPts, bool toSeekBack);

		/****************** Stream ******************/
		%feature("compactdefaultargs") Stream;
		%feature("autodoc", "Return stream.

Parameters
----------
theIndex: unsigned int

Returns
-------
AVStream
") Stream;
		const AVStream & Stream(unsigned int theIndex);

		/****************** StreamInfo ******************/
		%feature("compactdefaultargs") StreamInfo;
		%feature("autodoc", "Format stream info.

Parameters
----------
theIndex: unsigned int
theCodecCtx: AVCodecContext *,optional
	default value is NULL

Returns
-------
TCollection_AsciiString
") StreamInfo;
		TCollection_AsciiString StreamInfo(unsigned int theIndex, AVCodecContext * theCodecCtx = NULL);

		/****************** StreamSecondsToUnits ******************/
		%feature("compactdefaultargs") StreamSecondsToUnits;
		%feature("autodoc", "Convert seconds into time units for stream. @param thestream the stream @param thetimeseconds value to convert returns time units.

Parameters
----------
theStream: AVStream
theTimeSeconds: double

Returns
-------
int64_t
") StreamSecondsToUnits;
		static int64_t StreamSecondsToUnits(const AVStream & theStream, double theTimeSeconds);

		/****************** StreamUnitsToSeconds ******************/
		%feature("compactdefaultargs") StreamUnitsToSeconds;
		%feature("autodoc", "Convert time units into seconds using stream base. @param thestream the stream; @param thetimeunits value to convert; returns converted time units in seconds.

Parameters
----------
theStream: AVStream
theTimeUnits: int64_t

Returns
-------
double
") StreamUnitsToSeconds;
		static double StreamUnitsToSeconds(const AVStream & theStream, int64_t theTimeUnits);

		/****************** UnitsToSeconds ******************/
		%feature("compactdefaultargs") UnitsToSeconds;
		%feature("autodoc", "Convert time units into seconds. returns zero for invalid value. @param thetimebase the timebase @param thetimeunits value to convert returns converted time units in seconds.

Parameters
----------
theTimeBase: AVRational
theTimeUnits: int64_t

Returns
-------
double
") UnitsToSeconds;
		static double UnitsToSeconds(const AVRational & theTimeBase, int64_t theTimeUnits);

};


%make_alias(Media_FormatContext)

%extend Media_FormatContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Media_Frame *
********************/
class Media_Frame : public Standard_Transient {
	public:
		/****************** Media_Frame ******************/
		%feature("compactdefaultargs") Media_Frame;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Media_Frame;
		 Media_Frame();

		/****************** BestEffortTimestamp ******************/
		%feature("compactdefaultargs") BestEffortTimestamp;
		%feature("autodoc", "Returns frame timestamp estimated using various heuristics, in stream time base.

Returns
-------
int64_t
") BestEffortTimestamp;
		int64_t BestEffortTimestamp();

		/****************** ChangeFrame ******************/
		%feature("compactdefaultargs") ChangeFrame;
		%feature("autodoc", "Return frame.

Returns
-------
AVFrame *
") ChangeFrame;
		AVFrame * ChangeFrame();

		/****************** Format ******************/
		%feature("compactdefaultargs") Format;
		%feature("autodoc", "Return pixel format (avpixelformat).

Returns
-------
int
") Format;
		int Format();

		/****************** FormatFFmpeg2Occt ******************/
		%feature("compactdefaultargs") FormatFFmpeg2Occt;
		%feature("autodoc", "Convert pixel format from ffmpeg (avpixelformat) to occt.

Parameters
----------
theFormat: int

Returns
-------
Image_Format
") FormatFFmpeg2Occt;
		static Image_Format FormatFFmpeg2Occt(int theFormat);

		/****************** FormatOcct2FFmpeg ******************/
		%feature("compactdefaultargs") FormatOcct2FFmpeg;
		%feature("autodoc", "Convert pixel format from occt to ffmpeg (avpixelformat). returns -1 (av_pix_fmt_none) if undefined.

Parameters
----------
theFormat: Image_Format

Returns
-------
int
") FormatOcct2FFmpeg;
		static int FormatOcct2FFmpeg(Image_Format theFormat);

		/****************** Frame ******************/
		%feature("compactdefaultargs") Frame;
		%feature("autodoc", "Return frame.

Returns
-------
AVFrame *
") Frame;
		const AVFrame * Frame();

		/****************** InitWrapper ******************/
		%feature("compactdefaultargs") InitWrapper;
		%feature("autodoc", "Wrap allocated image pixmap.

Parameters
----------
thePixMap: Image_PixMap

Returns
-------
bool
") InitWrapper;
		bool InitWrapper(const opencascade::handle<Image_PixMap> & thePixMap);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return true if frame does not contain any data.

Returns
-------
bool
") IsEmpty;
		bool IsEmpty();

		/****************** IsFullRangeYUV ******************/
		%feature("compactdefaultargs") IsFullRangeYUV;
		%feature("autodoc", "Return true if yuv range is full.

Returns
-------
bool
") IsFullRangeYUV;
		bool IsFullRangeYUV();

		/****************** IsLocked ******************/
		%feature("compactdefaultargs") IsLocked;
		%feature("autodoc", "Return locked state.

Returns
-------
bool
") IsLocked;
		bool IsLocked();

		/****************** LineSize ******************/
		%feature("compactdefaultargs") LineSize;
		%feature("autodoc", "Returns linesize in bytes for specified data plane.

Parameters
----------
thePlaneId: int

Returns
-------
int
") LineSize;
		int LineSize(int thePlaneId);

		/****************** PixelAspectRatio ******************/
		%feature("compactdefaultargs") PixelAspectRatio;
		%feature("autodoc", "Return par.

Returns
-------
float
") PixelAspectRatio;
		float PixelAspectRatio();

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Access data plane for specified id.

Parameters
----------
thePlaneId: int

Returns
-------
uint8_t *
") Plane;
		uint8_t * Plane(int thePlaneId);

		/****************** Pts ******************/
		%feature("compactdefaultargs") Pts;
		%feature("autodoc", "Return presentation timestamp (pts).

Returns
-------
double
") Pts;
		double Pts();

		/****************** SetLocked ******************/
		%feature("compactdefaultargs") SetLocked;
		%feature("autodoc", "Lock/free frame for edition.

Parameters
----------
theToLock: bool

Returns
-------
None
") SetLocked;
		void SetLocked(bool theToLock);

		/****************** SetPixelAspectRatio ******************/
		%feature("compactdefaultargs") SetPixelAspectRatio;
		%feature("autodoc", "Set par.

Parameters
----------
theRatio: float

Returns
-------
None
") SetPixelAspectRatio;
		void SetPixelAspectRatio(float theRatio);

		/****************** SetPts ******************/
		%feature("compactdefaultargs") SetPts;
		%feature("autodoc", "Set presentation timestamp (pts).

Parameters
----------
thePts: double

Returns
-------
None
") SetPts;
		void SetPts(double thePts);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return image dimensions.

Returns
-------
Graphic3d_Vec2i
") Size;
		Graphic3d_Vec2i Size();

		/****************** SizeX ******************/
		%feature("compactdefaultargs") SizeX;
		%feature("autodoc", "Return image width.

Returns
-------
int
") SizeX;
		int SizeX();

		/****************** SizeY ******************/
		%feature("compactdefaultargs") SizeY;
		%feature("autodoc", "Return image height.

Returns
-------
int
") SizeY;
		int SizeY();

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "Swap avframe* within two frames.

Parameters
----------
theFrame1: Media_Frame
theFrame2: Media_Frame

Returns
-------
None
") Swap;
		static void Swap(const opencascade::handle<Media_Frame> & theFrame1, const opencascade::handle<Media_Frame> & theFrame2);

		/****************** Unref ******************/
		%feature("compactdefaultargs") Unref;
		%feature("autodoc", "Av_frame_unref() wrapper.

Returns
-------
None
") Unref;
		void Unref();

};


%make_alias(Media_Frame)

%extend Media_Frame {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Media_IFrameQueue *
**************************/
%nodefaultctor Media_IFrameQueue;
class Media_IFrameQueue {
	public:
		/****************** LockFrame ******************/
		%feature("compactdefaultargs") LockFrame;
		%feature("autodoc", "Lock the frame, e.g. take ownership on a single (not currently displayed) frame from the queue to perform decoding into.

Returns
-------
opencascade::handle<Media_Frame>
") LockFrame;
		virtual opencascade::handle<Media_Frame> LockFrame();

		/****************** ReleaseFrame ******************/
		%feature("compactdefaultargs") ReleaseFrame;
		%feature("autodoc", "Release previously locked frame, e.g. it can be displayed on the screen.

Parameters
----------
theFrame: Media_Frame

Returns
-------
None
") ReleaseFrame;
		virtual void ReleaseFrame(const opencascade::handle<Media_Frame> & theFrame);

};


%extend Media_IFrameQueue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Media_Packet *
*********************/
class Media_Packet : public Standard_Transient {
	public:
		/****************** Media_Packet ******************/
		%feature("compactdefaultargs") Media_Packet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Media_Packet;
		 Media_Packet();

		/****************** ChangeData ******************/
		%feature("compactdefaultargs") ChangeData;
		%feature("autodoc", "Return data.

Returns
-------
uint8_t *
") ChangeData;
		uint8_t * ChangeData();

		/****************** ChangePacket ******************/
		%feature("compactdefaultargs") ChangePacket;
		%feature("autodoc", "Return packet.

Returns
-------
AVPacket *
") ChangePacket;
		AVPacket * ChangePacket();

		/****************** Data ******************/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Return data.

Returns
-------
uint8_t *
") Data;
		const uint8_t * Data();

		/****************** Dts ******************/
		%feature("compactdefaultargs") Dts;
		%feature("autodoc", "Return decoding timestamp (dts).

Returns
-------
int64_t
") Dts;
		int64_t Dts();

		/****************** Duration ******************/
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "Return duration.

Returns
-------
int64_t
") Duration;
		int64_t Duration();

		/****************** DurationSeconds ******************/
		%feature("compactdefaultargs") DurationSeconds;
		%feature("autodoc", "Return duration in seconds.

Returns
-------
double
") DurationSeconds;
		double DurationSeconds();

		/****************** IsKeyFrame ******************/
		%feature("compactdefaultargs") IsKeyFrame;
		%feature("autodoc", "Return true for a key frame.

Returns
-------
bool
") IsKeyFrame;
		bool IsKeyFrame();

		/****************** Packet ******************/
		%feature("compactdefaultargs") Packet;
		%feature("autodoc", "Return packet.

Returns
-------
AVPacket *
") Packet;
		const AVPacket * Packet();

		/****************** Pts ******************/
		%feature("compactdefaultargs") Pts;
		%feature("autodoc", "Return presentation timestamp (pts).

Returns
-------
int64_t
") Pts;
		int64_t Pts();

		/****************** SetDurationSeconds ******************/
		%feature("compactdefaultargs") SetDurationSeconds;
		%feature("autodoc", "Set duration in seconds.

Parameters
----------
theDurationSec: double

Returns
-------
None
") SetDurationSeconds;
		void SetDurationSeconds(double theDurationSec);

		/****************** SetKeyFrame ******************/
		%feature("compactdefaultargs") SetKeyFrame;
		%feature("autodoc", "Mark as key frame.

Returns
-------
None
") SetKeyFrame;
		void SetKeyFrame();

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return data size.

Returns
-------
int
") Size;
		int Size();

		/****************** StreamIndex ******************/
		%feature("compactdefaultargs") StreamIndex;
		%feature("autodoc", "Return stream index.

Returns
-------
int
") StreamIndex;
		int StreamIndex();

		/****************** Unref ******************/
		%feature("compactdefaultargs") Unref;
		%feature("autodoc", "Av_packet_unref() wrapper.

Returns
-------
None
") Unref;
		void Unref();

};


%make_alias(Media_Packet)

%extend Media_Packet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Media_PlayerContext *
****************************/
class Media_PlayerContext : public Standard_Transient {
	public:
		/****************** Media_PlayerContext ******************/
		%feature("compactdefaultargs") Media_PlayerContext;
		%feature("autodoc", "Main constructor. note that frame queue is stored as pointer, and it is expected that this context is stored as a class field of frame queue.

Parameters
----------
theFrameQueue: Media_IFrameQueue *

Returns
-------
None
") Media_PlayerContext;
		 Media_PlayerContext(Media_IFrameQueue * theFrameQueue);

		/****************** DumpFirstFrame ******************/
		%feature("compactdefaultargs") DumpFirstFrame;
		%feature("autodoc", "Dump first video frame. @param thesrcvideo [in] path to the video @param themediainfo [out] video description.

Parameters
----------
theSrcVideo: TCollection_AsciiString
theMediaInfo: TCollection_AsciiString

Returns
-------
opencascade::handle<Media_Frame>
") DumpFirstFrame;
		static opencascade::handle<Media_Frame> DumpFirstFrame(const TCollection_AsciiString & theSrcVideo, TCollection_AsciiString & theMediaInfo);

		/****************** DumpFirstFrame ******************/
		%feature("compactdefaultargs") DumpFirstFrame;
		%feature("autodoc", "Dump first video frame. @param thesrcvideo [in] path to the video @param theoutimage [in] path to make a screenshot @param themediainfo [out] video description @param themaxsize [in] when positive - downscales image to specified size.

Parameters
----------
theSrcVideo: TCollection_AsciiString
theOutImage: TCollection_AsciiString
theMediaInfo: TCollection_AsciiString
theMaxSize: int,optional
	default value is 0

Returns
-------
bool
") DumpFirstFrame;
		static bool DumpFirstFrame(const TCollection_AsciiString & theSrcVideo, const TCollection_AsciiString & theOutImage, TCollection_AsciiString & theMediaInfo, int theMaxSize = 0);

		/****************** Pause ******************/
		%feature("compactdefaultargs") Pause;
		%feature("autodoc", "Pause playback.

Returns
-------
None
") Pause;
		void Pause();

		/****************** PlayPause ******************/
		%feature("compactdefaultargs") PlayPause;
		%feature("autodoc", "Pause/pause playback depending on the current state.

Parameters
----------

Returns
-------
theIsPaused: bool
theProgress: float
theDuration: float
") PlayPause;
		void PlayPause(Standard_Boolean &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** PlaybackState ******************/
		%feature("compactdefaultargs") PlaybackState;
		%feature("autodoc", "Return playback state.

Parameters
----------

Returns
-------
theIsPaused: bool
theProgress: float
theDuration: float
") PlaybackState;
		void PlaybackState(Standard_Boolean &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Resume ******************/
		%feature("compactdefaultargs") Resume;
		%feature("autodoc", "Resume playback.

Returns
-------
None
") Resume;
		void Resume();

		/****************** Seek ******************/
		%feature("compactdefaultargs") Seek;
		%feature("autodoc", "Seek to specified position.

Parameters
----------
thePosSec: float

Returns
-------
None
") Seek;
		void Seek(Standard_Real thePosSec);

		/****************** SetForceRgb ******************/
		%feature("compactdefaultargs") SetForceRgb;
		%feature("autodoc", "Set if queue requires rgb pixel format or can handle also yuv pixel format.

Parameters
----------
theToForce: bool

Returns
-------
None
") SetForceRgb;
		void SetForceRgb(bool theToForce);

		/****************** SetInput ******************/
		%feature("compactdefaultargs") SetInput;
		%feature("autodoc", "Set new input for playback.

Parameters
----------
theInputPath: TCollection_AsciiString
theToWait: bool

Returns
-------
None
") SetInput;
		void SetInput(const TCollection_AsciiString & theInputPath, Standard_Boolean theToWait);

		/****************** ToForceRgb ******************/
		%feature("compactdefaultargs") ToForceRgb;
		%feature("autodoc", "Return true if queue requires rgb pixel format or can handle also yuv pixel format; true by default.

Returns
-------
bool
") ToForceRgb;
		bool ToForceRgb();

};


%make_alias(Media_PlayerContext)

%extend Media_PlayerContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Media_Scaler *
*********************/
class Media_Scaler : public Standard_Transient {
	public:
		/****************** Media_Scaler ******************/
		%feature("compactdefaultargs") Media_Scaler;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Media_Scaler;
		 Media_Scaler();

		/****************** Convert ******************/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "Convert one frame to another.

Parameters
----------
theSrc: Media_Frame
theRes: Media_Frame

Returns
-------
bool
") Convert;
		bool Convert(const opencascade::handle<Media_Frame> & theSrc, const opencascade::handle<Media_Frame> & theRes);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Sws_getcontext() wrapper - creates conversion context. @param thesrcdims dimensions of input frame @param thesrcformat pixel format (avpixelformat) of input frame @param theresdims dimensions of destination frame @param theresformat pixel format (avpixelformat) of destination frame.

Parameters
----------
theSrcDims: Graphic3d_Vec2i
theSrcFormat: int
theResDims: Graphic3d_Vec2i
theResFormat: int

Returns
-------
bool
") Init;
		bool Init(const Graphic3d_Vec2i & theSrcDims, int theSrcFormat, const Graphic3d_Vec2i & theResDims, int theResFormat);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return true if context was initialized.

Returns
-------
bool
") IsValid;
		bool IsValid();

		/****************** Release ******************/
		%feature("compactdefaultargs") Release;
		%feature("autodoc", "Sws_freecontext() wrapper.

Returns
-------
None
") Release;
		void Release();

};


%make_alias(Media_Scaler)

%extend Media_Scaler {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Media_Timer *
********************/
class Media_Timer : public Standard_Transient {
	public:
		/****************** Media_Timer ******************/
		%feature("compactdefaultargs") Media_Timer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Media_Timer;
		 Media_Timer();

		/****************** ElapsedTime ******************/
		%feature("compactdefaultargs") ElapsedTime;
		%feature("autodoc", "Return elapsed time in seconds.

Returns
-------
float
") ElapsedTime;
		Standard_Real ElapsedTime();

		/****************** IsStarted ******************/
		%feature("compactdefaultargs") IsStarted;
		%feature("autodoc", "Return true if timer has been started.

Returns
-------
bool
") IsStarted;
		Standard_Boolean IsStarted();

		/****************** Pause ******************/
		%feature("compactdefaultargs") Pause;
		%feature("autodoc", "Pause the timer.

Returns
-------
None
") Pause;
		void Pause();

		/****************** PlaybackSpeed ******************/
		%feature("compactdefaultargs") PlaybackSpeed;
		%feature("autodoc", "Return playback speed coefficient (1.0 means normal speed).

Returns
-------
float
") PlaybackSpeed;
		Standard_Real PlaybackSpeed();

		/****************** Seek ******************/
		%feature("compactdefaultargs") Seek;
		%feature("autodoc", "Seek the timer to specified position.

Parameters
----------
theTime: float

Returns
-------
None
") Seek;
		void Seek(const Standard_Real theTime);

		/****************** SetPlaybackSpeed ******************/
		%feature("compactdefaultargs") SetPlaybackSpeed;
		%feature("autodoc", "Setup playback speed coefficient.

Parameters
----------
theSpeed: float

Returns
-------
None
") SetPlaybackSpeed;
		void SetPlaybackSpeed(const Standard_Real theSpeed);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Start the timer.

Returns
-------
None
") Start;
		void Start();

		/****************** Stop ******************/
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "Stop the timer.

Returns
-------
None
") Stop;
		void Stop();

};


%make_alias(Media_Timer)

%extend Media_Timer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
