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
		/**** md5 signature: 0a3d4dfbf36f2a368bc588774584e748 ****/
		%feature("compactdefaultargs") Media_BufferPool;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Media_BufferPool;
		 Media_BufferPool();

		/****************** BufferSize ******************/
		/**** md5 signature: 53f829a274fa10a615fcab16e9396178 ****/
		%feature("compactdefaultargs") BufferSize;
		%feature("autodoc", "Return buffer size within the pool.

Returns
-------
int
") BufferSize;
		int BufferSize();

		/****************** GetBuffer ******************/
		/**** md5 signature: c6b8a68f85ed63b3323f23a260f0a2ab ****/
		%feature("compactdefaultargs") GetBuffer;
		%feature("autodoc", "Get new buffer from the pool.

Returns
-------
AVBufferRef *
") GetBuffer;
		AVBufferRef * GetBuffer();

		/****************** Init ******************/
		/**** md5 signature: 1d7136152cf93ba34a8a14a93286b5be ****/
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
		/**** md5 signature: 1e8c38eacea1e94fe658824d01fd2a18 ****/
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
		/**** md5 signature: b1ab8c3c302fb25327dd7640e1b1b9b7 ****/
		%feature("compactdefaultargs") Media_CodecContext;
		%feature("autodoc", "Constructor.

Returns
-------
None
") Media_CodecContext;
		 Media_CodecContext();

		/****************** CanProcessPacket ******************/
		/**** md5 signature: 73813a9b9a6a8323526272588ef10c9d ****/
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
		/**** md5 signature: d50d7ba65c2beb3eb436584b5735f108 ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Close input.

Returns
-------
None
") Close;
		void Close();

		/****************** Context ******************/
		/**** md5 signature: 3aa4ee2db34bb5d3a1962e5f1ef82df0 ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return context.

Returns
-------
AVCodecContext *
") Context;
		AVCodecContext * Context();

		/****************** Flush ******************/
		/**** md5 signature: 7df46c8de5607dcfd7ff19dad73048c8 ****/
		%feature("compactdefaultargs") Flush;
		%feature("autodoc", "Avcodec_flush_buffers() wrapper.

Returns
-------
None
") Flush;
		void Flush();

		/****************** Init ******************/
		/**** md5 signature: 786bfe2d854124fc9683172d092b2068 ****/
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
		/**** md5 signature: d8dd70f08fa37b98d81b88e8ab12c758 ****/
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
		/**** md5 signature: d85e6c0c0a50f90e40ad0338e5b1176d ****/
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
		/**** md5 signature: 6ee68cfd8dd6c256ba29edd959d3f717 ****/
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
		/**** md5 signature: 41f5d5b44df3f549b54065fb1a105dc0 ****/
		%feature("compactdefaultargs") SizeX;
		%feature("autodoc", "Returns source frame width.

Returns
-------
int
") SizeX;
		int SizeX();

		/****************** SizeY ******************/
		/**** md5 signature: efa0acdf16604e6ae4e975b41801d117 ****/
		%feature("compactdefaultargs") SizeY;
		%feature("autodoc", "Returns source frame height.

Returns
-------
int
") SizeY;
		int SizeY();

		/****************** StreamIndex ******************/
		/**** md5 signature: 8282b45ef9abe2fbc90b5e14652eed24 ****/
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
		/**** md5 signature: 0a1fe0e6e7bc6d4302f56eb5e705fd7d ****/
		%feature("compactdefaultargs") Media_FormatContext;
		%feature("autodoc", "Constructor.

Returns
-------
None
") Media_FormatContext;
		 Media_FormatContext();

		/****************** Close ******************/
		/**** md5 signature: d50d7ba65c2beb3eb436584b5735f108 ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Close input.

Returns
-------
None
") Close;
		void Close();

		/****************** Context ******************/
		/**** md5 signature: 7bdf08d584080f0e41398b3e34fbde34 ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return context.

Returns
-------
AVFormatContext *
") Context;
		AVFormatContext * Context();

		/****************** Duration ******************/
		/**** md5 signature: 7dbbe5f7e0b63b92819c252fd1239f67 ****/
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "Return duration in seconds.

Returns
-------
double
") Duration;
		double Duration();

		/****************** FormatAVErrorDescription ******************/
		/**** md5 signature: 773cb02997f0f1d570fefce0f6f6a475 ****/
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
		/**** md5 signature: f690781c25df7ca8bca49eff85972db4 ****/
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
		/**** md5 signature: 73096950cc30d59cda1052f8b1203496 ****/
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
		/**** md5 signature: dfc4ad198d9ecf3e07e59892a4d6c6e0 ****/
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
		/**** md5 signature: 863b4c333e1c58134ef95f24f620b035 ****/
		%feature("compactdefaultargs") NbSteams;
		%feature("autodoc", "Return amount of streams.

Returns
-------
unsigned int
") NbSteams;
		unsigned int NbSteams();

		/****************** OpenInput ******************/
		/**** md5 signature: c47d43d919938cc79b3f42134a7b2d81 ****/
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
		/**** md5 signature: 6b47d8a3bebf5d1cc984499c8eeb1ea4 ****/
		%feature("compactdefaultargs") PtsStartBase;
		%feature("autodoc", "Return pts start base in seconds.

Returns
-------
double
") PtsStartBase;
		double PtsStartBase();

		/****************** ReadPacket ******************/
		/**** md5 signature: 8b25df75e7034c52d337365877dd66bb ****/
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
		/**** md5 signature: 32d4f1364cb1743ea36dd37a8b873041 ****/
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
		/**** md5 signature: 72dd7c660f06e2d6513a97ff81eb2199 ****/
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
		/**** md5 signature: e87a4908278022b74d028a14667a8cbd ****/
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
		/**** md5 signature: c4e4b8c8c3725600e25ecd062b5517f2 ****/
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
		/**** md5 signature: c4142ad229d3af2830e9c605d2a8db1a ****/
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
		/**** md5 signature: 073d34b357033222de40461c8985072f ****/
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
		/**** md5 signature: 9f9ec2a7d23ea77d0f339fce6f923478 ****/
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
		/**** md5 signature: f478f1fe81fba12c35612c21bdffa450 ****/
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
		/**** md5 signature: 1495fd3cca88b15ffe8f5719f7230e7a ****/
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
		/**** md5 signature: de4b0785f447fb828af5ef1dd8de96b4 ****/
		%feature("compactdefaultargs") Media_Frame;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Media_Frame;
		 Media_Frame();

		/****************** BestEffortTimestamp ******************/
		/**** md5 signature: 6249feb8d2350db4cc46146cfe95f16c ****/
		%feature("compactdefaultargs") BestEffortTimestamp;
		%feature("autodoc", "Returns frame timestamp estimated using various heuristics, in stream time base.

Returns
-------
int64_t
") BestEffortTimestamp;
		int64_t BestEffortTimestamp();

		/****************** ChangeFrame ******************/
		/**** md5 signature: e581f2307b7696dcd12a5e4a6dc5954c ****/
		%feature("compactdefaultargs") ChangeFrame;
		%feature("autodoc", "Return frame.

Returns
-------
AVFrame *
") ChangeFrame;
		AVFrame * ChangeFrame();

		/****************** Format ******************/
		/**** md5 signature: f090b2900db41ceb19ca4466383f3f83 ****/
		%feature("compactdefaultargs") Format;
		%feature("autodoc", "Return pixel format (avpixelformat).

Returns
-------
int
") Format;
		int Format();

		/****************** FormatFFmpeg2Occt ******************/
		/**** md5 signature: f27eff95e450fccec278c3f5994e4e59 ****/
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
		/**** md5 signature: 7e3fc3530356b3075b5602731b6f95c9 ****/
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
		/**** md5 signature: da955104c4dbd4e1ab21d6e30ba7f6d7 ****/
		%feature("compactdefaultargs") Frame;
		%feature("autodoc", "Return frame.

Returns
-------
AVFrame *
") Frame;
		const AVFrame * Frame();

		/****************** InitWrapper ******************/
		/**** md5 signature: 5cf075f55aa4deec1b14206ac39c6b61 ****/
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
		/**** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return true if frame does not contain any data.

Returns
-------
bool
") IsEmpty;
		bool IsEmpty();

		/****************** IsFullRangeYUV ******************/
		/**** md5 signature: f77080e08a3a7da5717d45286617d2d6 ****/
		%feature("compactdefaultargs") IsFullRangeYUV;
		%feature("autodoc", "Return true if yuv range is full.

Returns
-------
bool
") IsFullRangeYUV;
		bool IsFullRangeYUV();

		/****************** IsLocked ******************/
		/**** md5 signature: 2b50e90aee5cec6d8b4dd46d74de9f98 ****/
		%feature("compactdefaultargs") IsLocked;
		%feature("autodoc", "Return locked state.

Returns
-------
bool
") IsLocked;
		bool IsLocked();

		/****************** LineSize ******************/
		/**** md5 signature: d88947f004429a59f7bd915b86914262 ****/
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
		/**** md5 signature: cd014bcdc37b3f131d0552831d71432b ****/
		%feature("compactdefaultargs") PixelAspectRatio;
		%feature("autodoc", "Return par.

Returns
-------
float
") PixelAspectRatio;
		float PixelAspectRatio();

		/****************** Plane ******************/
		/**** md5 signature: 298a3ed4b4a4d60a373db19e4cbaa87f ****/
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
		/**** md5 signature: 82fdd9863e472cb47e2bc66adbef93ff ****/
		%feature("compactdefaultargs") Pts;
		%feature("autodoc", "Return presentation timestamp (pts).

Returns
-------
double
") Pts;
		double Pts();

		/****************** SetLocked ******************/
		/**** md5 signature: 781da575a3f42080b3d2137980f685ab ****/
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
		/**** md5 signature: afaaac75a23f38475c339f5c82389573 ****/
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
		/**** md5 signature: 7a563cdee57412ffaca2f959d3b4873a ****/
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
		/**** md5 signature: e26a44473b1b232114c063872b4d3759 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return image dimensions.

Returns
-------
Graphic3d_Vec2i
") Size;
		Graphic3d_Vec2i Size();

		/****************** SizeX ******************/
		/**** md5 signature: 41f5d5b44df3f549b54065fb1a105dc0 ****/
		%feature("compactdefaultargs") SizeX;
		%feature("autodoc", "Return image width.

Returns
-------
int
") SizeX;
		int SizeX();

		/****************** SizeY ******************/
		/**** md5 signature: efa0acdf16604e6ae4e975b41801d117 ****/
		%feature("compactdefaultargs") SizeY;
		%feature("autodoc", "Return image height.

Returns
-------
int
") SizeY;
		int SizeY();

		/****************** Swap ******************/
		/**** md5 signature: 2d63acb421918456b7b4fd318bd9fcee ****/
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
		/**** md5 signature: 80f3680284ab07da25f505149bd7579b ****/
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
		/**** md5 signature: 69657043f5e0770ce40e69c596ea6106 ****/
		%feature("compactdefaultargs") LockFrame;
		%feature("autodoc", "Lock the frame, e.g. take ownership on a single (not currently displayed) frame from the queue to perform decoding into.

Returns
-------
opencascade::handle<Media_Frame>
") LockFrame;
		virtual opencascade::handle<Media_Frame> LockFrame();

		/****************** ReleaseFrame ******************/
		/**** md5 signature: f18c23476816903c91e2873fd7540a51 ****/
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
		/**** md5 signature: 21d023f149426d16256f4af491519ca2 ****/
		%feature("compactdefaultargs") Media_Packet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Media_Packet;
		 Media_Packet();

		/****************** ChangeData ******************/
		/**** md5 signature: c33789445db4c3c2e8f062262ca4a368 ****/
		%feature("compactdefaultargs") ChangeData;
		%feature("autodoc", "Return data.

Returns
-------
uint8_t *
") ChangeData;
		uint8_t * ChangeData();

		/****************** ChangePacket ******************/
		/**** md5 signature: a18ba4bd3b558febb825d40a1d101ff9 ****/
		%feature("compactdefaultargs") ChangePacket;
		%feature("autodoc", "Return packet.

Returns
-------
AVPacket *
") ChangePacket;
		AVPacket * ChangePacket();

		/****************** Data ******************/
		/**** md5 signature: 022377391b4ffbbe639530737addffe2 ****/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Return data.

Returns
-------
uint8_t *
") Data;
		const uint8_t * Data();

		/****************** Dts ******************/
		/**** md5 signature: 337121fa2e4ebc36a3ac20fe06327875 ****/
		%feature("compactdefaultargs") Dts;
		%feature("autodoc", "Return decoding timestamp (dts).

Returns
-------
int64_t
") Dts;
		int64_t Dts();

		/****************** Duration ******************/
		/**** md5 signature: 2e5fd59baaedf54955643a1c5597d867 ****/
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "Return duration.

Returns
-------
int64_t
") Duration;
		int64_t Duration();

		/****************** DurationSeconds ******************/
		/**** md5 signature: a0a5c28939815fd66fe453042751d0ab ****/
		%feature("compactdefaultargs") DurationSeconds;
		%feature("autodoc", "Return duration in seconds.

Returns
-------
double
") DurationSeconds;
		double DurationSeconds();

		/****************** IsKeyFrame ******************/
		/**** md5 signature: 02866b20bd8d4d5ab67c4fd95fbac948 ****/
		%feature("compactdefaultargs") IsKeyFrame;
		%feature("autodoc", "Return true for a key frame.

Returns
-------
bool
") IsKeyFrame;
		bool IsKeyFrame();

		/****************** Packet ******************/
		/**** md5 signature: 6c896d6462955b46aa756fbddaaee45e ****/
		%feature("compactdefaultargs") Packet;
		%feature("autodoc", "Return packet.

Returns
-------
AVPacket *
") Packet;
		const AVPacket * Packet();

		/****************** Pts ******************/
		/**** md5 signature: 5da9bc6b9e9f73a01ede42e359cd31a1 ****/
		%feature("compactdefaultargs") Pts;
		%feature("autodoc", "Return presentation timestamp (pts).

Returns
-------
int64_t
") Pts;
		int64_t Pts();

		/****************** SetDurationSeconds ******************/
		/**** md5 signature: 96b245f8b5b34ac7fc2f765aba71e077 ****/
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
		/**** md5 signature: 0bc4860e51243a123d98b61907eb9034 ****/
		%feature("compactdefaultargs") SetKeyFrame;
		%feature("autodoc", "Mark as key frame.

Returns
-------
None
") SetKeyFrame;
		void SetKeyFrame();

		/****************** Size ******************/
		/**** md5 signature: 17331f3e25412668feb601e972bde1f4 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return data size.

Returns
-------
int
") Size;
		int Size();

		/****************** StreamIndex ******************/
		/**** md5 signature: 8eb05efab1b6364d236ad3e3e2b1b9f8 ****/
		%feature("compactdefaultargs") StreamIndex;
		%feature("autodoc", "Return stream index.

Returns
-------
int
") StreamIndex;
		int StreamIndex();

		/****************** Unref ******************/
		/**** md5 signature: 80f3680284ab07da25f505149bd7579b ****/
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
		/**** md5 signature: 598765b614d4673c30838cc7f6764f51 ****/
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
		/**** md5 signature: c0df9ec93a3101b0a6a32c678e243c3f ****/
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
		/**** md5 signature: 6950a2d22c04cbd05974f88c89f1ad71 ****/
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
		/**** md5 signature: 29dbaa6814dab6226a053621aee10839 ****/
		%feature("compactdefaultargs") Pause;
		%feature("autodoc", "Pause playback.

Returns
-------
None
") Pause;
		void Pause();

		/****************** PlayPause ******************/
		/**** md5 signature: 958bd11bf49c945a931b80948eb2c8b7 ****/
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
		/**** md5 signature: 51293a2ab0a7e31ac1fc726c2c5db223 ****/
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
		/**** md5 signature: d1c1a5e700e6ae906ad11b9e234d5a5e ****/
		%feature("compactdefaultargs") Resume;
		%feature("autodoc", "Resume playback.

Returns
-------
None
") Resume;
		void Resume();

		/****************** Seek ******************/
		/**** md5 signature: b9c5db7780a20262df94218b3da1d4ef ****/
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
		/**** md5 signature: ec16f04277608d5ca16ee11a2e038a7a ****/
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
		/**** md5 signature: 4202281f73f5f04197952f31be48acaa ****/
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
		/**** md5 signature: 5f21d38bf7884162a0a8027e30c0c524 ****/
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
		/**** md5 signature: 029e344749db7e31686a9c1089e97094 ****/
		%feature("compactdefaultargs") Media_Scaler;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Media_Scaler;
		 Media_Scaler();

		/****************** Convert ******************/
		/**** md5 signature: 8f6ef1558f5c92971a15d12df87373b1 ****/
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
		/**** md5 signature: bed7e181f77765cc04d6dc7c4b0c169e ****/
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
		/**** md5 signature: 735088818cf24ebe0ebc7005a507da69 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return true if context was initialized.

Returns
-------
bool
") IsValid;
		bool IsValid();

		/****************** Release ******************/
		/**** md5 signature: 1e8c38eacea1e94fe658824d01fd2a18 ****/
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
		/**** md5 signature: 5502207261d24805316c6ff0b6584707 ****/
		%feature("compactdefaultargs") Media_Timer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Media_Timer;
		 Media_Timer();

		/****************** ElapsedTime ******************/
		/**** md5 signature: 70206d58970896f6b73a519322e3cb27 ****/
		%feature("compactdefaultargs") ElapsedTime;
		%feature("autodoc", "Return elapsed time in seconds.

Returns
-------
float
") ElapsedTime;
		Standard_Real ElapsedTime();

		/****************** IsStarted ******************/
		/**** md5 signature: 7873d62c6270d07d4b00b96df3c37ce9 ****/
		%feature("compactdefaultargs") IsStarted;
		%feature("autodoc", "Return true if timer has been started.

Returns
-------
bool
") IsStarted;
		Standard_Boolean IsStarted();

		/****************** Pause ******************/
		/**** md5 signature: cb33e31713040ec14a20bffed4984198 ****/
		%feature("compactdefaultargs") Pause;
		%feature("autodoc", "Pause the timer.

Returns
-------
None
") Pause;
		void Pause();

		/****************** PlaybackSpeed ******************/
		/**** md5 signature: 57b3c104badbb2d03df54cc0e8568d2b ****/
		%feature("compactdefaultargs") PlaybackSpeed;
		%feature("autodoc", "Return playback speed coefficient (1.0 means normal speed).

Returns
-------
float
") PlaybackSpeed;
		Standard_Real PlaybackSpeed();

		/****************** Seek ******************/
		/**** md5 signature: b3acf1e2aa31e74799994399d25609a1 ****/
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
		/**** md5 signature: 2fcf09d284cf9236c6a398721aa758cf ****/
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
		/**** md5 signature: 4d03a8d97f47d1d3454f953eb54cb197 ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Start the timer.

Returns
-------
None
") Start;
		void Start();

		/****************** Stop ******************/
		/**** md5 signature: 702270b81e0a152f42e95b594cbf6271 ****/
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
