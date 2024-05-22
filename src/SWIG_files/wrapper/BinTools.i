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
%define BINTOOLSDOCSTRING
"BinTools module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_bintools.html"
%enddef
%module (package="OCC.Core", docstring=BINTOOLSDOCSTRING) BinTools


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


%{
#include<BinTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<Message_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<TopLoc_module.hxx>
#include<TopAbs_module.hxx>
#include<Message_module.hxx>
#include<CDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import Message.i
%import Geom2d.i
%import Geom.i
%import TopLoc.i
%import TopAbs.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum  {
	BinTools_FormatVersion_LOWER = BinTools_FormatVersion_VERSION_1,
	BinTools_FormatVersion_UPPER = BinTools_FormatVersion_VERSION_4,
};

enum BinTools_FormatVersion {
	BinTools_FormatVersion_VERSION_1 = 1,
	BinTools_FormatVersion_VERSION_2 = 2,
	BinTools_FormatVersion_VERSION_3 = 3,
	BinTools_FormatVersion_VERSION_4 = 4,
	BinTools_FormatVersion_CURRENT = BinTools_FormatVersion_VERSION_4,
};

enum BinTools_ObjectType {
	BinTools_ObjectType_Unknown = 0,
	BinTools_ObjectType_Reference8 = 1,
	BinTools_ObjectType_Reference16 = 2,
	BinTools_ObjectType_Reference32 = 3,
	BinTools_ObjectType_Reference64 = 4,
	BinTools_ObjectType_Location = 5,
	BinTools_ObjectType_SimpleLocation = 6,
	BinTools_ObjectType_EmptyLocation = 7,
	BinTools_ObjectType_LocationEnd = 8,
	BinTools_ObjectType_Curve = 9,
	BinTools_ObjectType_EmptyCurve = 10,
	BinTools_ObjectType_Curve2d = 11,
	BinTools_ObjectType_EmptyCurve2d = 12,
	BinTools_ObjectType_Surface = 13,
	BinTools_ObjectType_EmptySurface = 14,
	BinTools_ObjectType_Polygon3d = 15,
	BinTools_ObjectType_EmptyPolygon3d = 16,
	BinTools_ObjectType_PolygonOnTriangulation = 17,
	BinTools_ObjectType_EmptyPolygonOnTriangulation = 18,
	BinTools_ObjectType_Triangulation = 19,
	BinTools_ObjectType_EmptyTriangulation = 20,
	BinTools_ObjectType_EmptyShape = 198,
	BinTools_ObjectType_EndShape = 199,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class BinTools_FormatVersion(IntEnum):
	BinTools_FormatVersion_VERSION_1 = 1
	BinTools_FormatVersion_VERSION_2 = 2
	BinTools_FormatVersion_VERSION_3 = 3
	BinTools_FormatVersion_VERSION_4 = 4
	BinTools_FormatVersion_CURRENT = BinTools_FormatVersion_VERSION_4
BinTools_FormatVersion_VERSION_1 = BinTools_FormatVersion.BinTools_FormatVersion_VERSION_1
BinTools_FormatVersion_VERSION_2 = BinTools_FormatVersion.BinTools_FormatVersion_VERSION_2
BinTools_FormatVersion_VERSION_3 = BinTools_FormatVersion.BinTools_FormatVersion_VERSION_3
BinTools_FormatVersion_VERSION_4 = BinTools_FormatVersion.BinTools_FormatVersion_VERSION_4
BinTools_FormatVersion_CURRENT = BinTools_FormatVersion.BinTools_FormatVersion_CURRENT

class BinTools_ObjectType(IntEnum):
	BinTools_ObjectType_Unknown = 0
	BinTools_ObjectType_Reference8 = 1
	BinTools_ObjectType_Reference16 = 2
	BinTools_ObjectType_Reference32 = 3
	BinTools_ObjectType_Reference64 = 4
	BinTools_ObjectType_Location = 5
	BinTools_ObjectType_SimpleLocation = 6
	BinTools_ObjectType_EmptyLocation = 7
	BinTools_ObjectType_LocationEnd = 8
	BinTools_ObjectType_Curve = 9
	BinTools_ObjectType_EmptyCurve = 10
	BinTools_ObjectType_Curve2d = 11
	BinTools_ObjectType_EmptyCurve2d = 12
	BinTools_ObjectType_Surface = 13
	BinTools_ObjectType_EmptySurface = 14
	BinTools_ObjectType_Polygon3d = 15
	BinTools_ObjectType_EmptyPolygon3d = 16
	BinTools_ObjectType_PolygonOnTriangulation = 17
	BinTools_ObjectType_EmptyPolygonOnTriangulation = 18
	BinTools_ObjectType_Triangulation = 19
	BinTools_ObjectType_EmptyTriangulation = 20
	BinTools_ObjectType_EmptyShape = 198
	BinTools_ObjectType_EndShape = 199
BinTools_ObjectType_Unknown = BinTools_ObjectType.BinTools_ObjectType_Unknown
BinTools_ObjectType_Reference8 = BinTools_ObjectType.BinTools_ObjectType_Reference8
BinTools_ObjectType_Reference16 = BinTools_ObjectType.BinTools_ObjectType_Reference16
BinTools_ObjectType_Reference32 = BinTools_ObjectType.BinTools_ObjectType_Reference32
BinTools_ObjectType_Reference64 = BinTools_ObjectType.BinTools_ObjectType_Reference64
BinTools_ObjectType_Location = BinTools_ObjectType.BinTools_ObjectType_Location
BinTools_ObjectType_SimpleLocation = BinTools_ObjectType.BinTools_ObjectType_SimpleLocation
BinTools_ObjectType_EmptyLocation = BinTools_ObjectType.BinTools_ObjectType_EmptyLocation
BinTools_ObjectType_LocationEnd = BinTools_ObjectType.BinTools_ObjectType_LocationEnd
BinTools_ObjectType_Curve = BinTools_ObjectType.BinTools_ObjectType_Curve
BinTools_ObjectType_EmptyCurve = BinTools_ObjectType.BinTools_ObjectType_EmptyCurve
BinTools_ObjectType_Curve2d = BinTools_ObjectType.BinTools_ObjectType_Curve2d
BinTools_ObjectType_EmptyCurve2d = BinTools_ObjectType.BinTools_ObjectType_EmptyCurve2d
BinTools_ObjectType_Surface = BinTools_ObjectType.BinTools_ObjectType_Surface
BinTools_ObjectType_EmptySurface = BinTools_ObjectType.BinTools_ObjectType_EmptySurface
BinTools_ObjectType_Polygon3d = BinTools_ObjectType.BinTools_ObjectType_Polygon3d
BinTools_ObjectType_EmptyPolygon3d = BinTools_ObjectType.BinTools_ObjectType_EmptyPolygon3d
BinTools_ObjectType_PolygonOnTriangulation = BinTools_ObjectType.BinTools_ObjectType_PolygonOnTriangulation
BinTools_ObjectType_EmptyPolygonOnTriangulation = BinTools_ObjectType.BinTools_ObjectType_EmptyPolygonOnTriangulation
BinTools_ObjectType_Triangulation = BinTools_ObjectType.BinTools_ObjectType_Triangulation
BinTools_ObjectType_EmptyTriangulation = BinTools_ObjectType.BinTools_ObjectType_EmptyTriangulation
BinTools_ObjectType_EmptyShape = BinTools_ObjectType.BinTools_ObjectType_EmptyShape
BinTools_ObjectType_EndShape = BinTools_ObjectType.BinTools_ObjectType_EndShape
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef BinTools_LocationSet * BinTools_LocationSetPtr;
/* end typedefs declaration */

/*****************
* class BinTools *
*****************/
%rename(bintools) BinTools;
class BinTools {
	public:
		/****************** GetBool ******************/
		/**** md5 signature: 790955f4f4ba6908f582aee44fb265dd ****/
		%feature("compactdefaultargs") GetBool;
		%feature("autodoc", "
Parameters
----------
IS: str

Return
-------
theValue: bool

Description
-----------
No available documentation.
") GetBool;
		static Standard_IStream & GetBool(std::istream & IS, Standard_Boolean &OutValue);

		/****************** GetExtChar ******************/
		/**** md5 signature: 123b0c66c3051e9feb92d9bfbbb192e6 ****/
		%feature("compactdefaultargs") GetExtChar;
		%feature("autodoc", "
Parameters
----------
IS: str
theValue: Standard_ExtCharacter

Return
-------
Standard_IStream

Description
-----------
No available documentation.
") GetExtChar;
		static Standard_IStream & GetExtChar(std::istream & IS, Standard_ExtCharacter & theValue);

		/****************** GetInteger ******************/
		/**** md5 signature: 651f0a33e9e7502671bc3ef42df123eb ****/
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "
Parameters
----------
IS: str

Return
-------
theValue: int

Description
-----------
No available documentation.
") GetInteger;
		static Standard_IStream & GetInteger(std::istream & IS, Standard_Integer &OutValue);

		/****************** GetReal ******************/
		/**** md5 signature: 38bb080ad1790d03931bd0c0aa629b48 ****/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "
Parameters
----------
IS: str

Return
-------
theValue: float

Description
-----------
No available documentation.
") GetReal;
		static Standard_IStream & GetReal(std::istream & IS, Standard_Real &OutValue);

		/****************** GetShortReal ******************/
		/**** md5 signature: 825f85854ff0d067143065401770de68 ****/
		%feature("compactdefaultargs") GetShortReal;
		%feature("autodoc", "
Parameters
----------
IS: str

Return
-------
theValue: float

Description
-----------
No available documentation.
") GetShortReal;
		static Standard_IStream & GetShortReal(std::istream & IS, Standard_ShortReal &OutValue);

		/****************** PutBool ******************/
		/**** md5 signature: 0afdd320ec549f8b3da2cea1881b2e46 ****/
		%feature("compactdefaultargs") PutBool;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") PutBool;
		static Standard_OStream & PutBool(std::ostream &OutValue, const Standard_Boolean theValue);

		/****************** PutExtChar ******************/
		/**** md5 signature: 6f5f97a4001fb0c14520fc2b5b0888a6 ****/
		%feature("compactdefaultargs") PutExtChar;
		%feature("autodoc", "
Parameters
----------
theValue: Standard_ExtCharacter

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") PutExtChar;
		static Standard_OStream & PutExtChar(std::ostream &OutValue, const Standard_ExtCharacter theValue);

		/****************** PutInteger ******************/
		/**** md5 signature: 9e70411996f2de65be7008dfb8c34a78 ****/
		%feature("compactdefaultargs") PutInteger;
		%feature("autodoc", "
Parameters
----------
theValue: int

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") PutInteger;
		static Standard_OStream & PutInteger(std::ostream &OutValue, const Standard_Integer theValue);

		/****************** PutReal ******************/
		/**** md5 signature: f7775506bd4618f420e375baa72bb4b9 ****/
		%feature("compactdefaultargs") PutReal;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") PutReal;
		static Standard_OStream & PutReal(std::ostream &OutValue, const Standard_Real & theValue);

		/****************** PutShortReal ******************/
		/**** md5 signature: 042b4eea8e6fbf4023588ae3edf72eee ****/
		%feature("compactdefaultargs") PutShortReal;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") PutShortReal;
		static Standard_OStream & PutShortReal(std::ostream &OutValue, const Standard_ShortReal & theValue);

		/****************** Read ******************/
		/**** md5 signature: f85bd54e020fe6af72c5aebd07ae8a7b ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theStream: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads a shape from <thestream> and returns it in <theshape>.
") Read;
		static void Read(TopoDS_Shape & theShape, std::istream & theStream, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** Read ******************/
		/**** md5 signature: 8f3081f8c29c84c71da9267be3a08fa6 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFile: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a shape from <thefile> and returns it in <theshape>.
") Read;
		static Standard_Boolean Read(TopoDS_Shape & theShape, Standard_CString theFile, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: 66b06396144ebe349cc1d4ffe3194b4c ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
theStream: Standard_OStream

Description
-----------
Writes the shape to the stream in binary format bintools_formatversion_current. this alias writes shape with triangulation data. @param theshape [in] the shape to write @param thestream [in][out] the stream to output shape into @param therange the range of progress indicator to fill in.
") Write;
		static void Write(const TopoDS_Shape & theShape, std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: cfe16f73efe24f22e21aa7c502d4ad33 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theWithTriangles: bool
theWithNormals: bool
theVersion: BinTools_FormatVersion
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
theStream: Standard_OStream

Description
-----------
Writes the shape to the stream in binary format of specified version. @param theshape [in] the shape to write @param thestream [in][out] the stream to output shape into @param thewithtriangles [in] flag which specifies whether to save shape with (true) or without (false) triangles;  has no effect on triangulation-only geometry @param thewithnormals [in] flag which specifies whether to save triangulation with (true) or without (false) normals;  has no effect on triangulation-only geometry @param theversion [in] the bintools format version @param therange  the range of progress indicator to fill in.
") Write;
		static void Write(const TopoDS_Shape & theShape, std::ostream &OutValue, const Standard_Boolean theWithTriangles, const Standard_Boolean theWithNormals, const BinTools_FormatVersion theVersion, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: 3881a3762eede8c671fff2911d095012 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFile: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes the shape to the file in binary format bintools_formatversion_current. @param theshape [in] the shape to write @param thefile [in] the path to file to output shape into @param therange the range of progress indicator to fill in.
") Write;
		static Standard_Boolean Write(const TopoDS_Shape & theShape, Standard_CString theFile, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: b26fc24f9c2e022ffc6d11aa96e8af41 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFile: str
theWithTriangles: bool
theWithNormals: bool
theVersion: BinTools_FormatVersion
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes the shape to the file in binary format of specified version. @param theshape [in] the shape to write @param thefile [in] the path to file to output shape into @param thewithtriangles [in] flag which specifies whether to save shape with (true) or without (false) triangles;  has no effect on triangulation-only geometry @param thewithnormals [in] flag which specifies whether to save triangulation with (true) or without (false) normals;  has no effect on triangulation-only geometry @param theversion [in] the bintools format version @param therange  the range of progress indicator to fill in.
") Write;
		static Standard_Boolean Write(const TopoDS_Shape & theShape, Standard_CString theFile, const Standard_Boolean theWithTriangles, const Standard_Boolean theWithNormals, const BinTools_FormatVersion theVersion, const Message_ProgressRange & theRange = Message_ProgressRange());

};


%extend BinTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BinTools_Curve2dSet *
****************************/
class BinTools_Curve2dSet {
	public:
		/****************** BinTools_Curve2dSet ******************/
		/**** md5 signature: d70cda135813c59090ea3f4c48ff061f ****/
		%feature("compactdefaultargs") BinTools_Curve2dSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty set of curves.
") BinTools_Curve2dSet;
		 BinTools_Curve2dSet();

		/****************** Add ******************/
		/**** md5 signature: 947264273ed6b5c72eac1f308b1f2487 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
int

Description
-----------
Incorporate a new curve in the set and returns its index.
") Add;
		Standard_Integer Add(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****************** Curve2d ******************/
		/**** md5 signature: aca04b75893a006fca996d6d157d858d ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns the curve of index <i>.
") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d(const Standard_Integer I);

		/****************** Index ******************/
		/**** md5 signature: e1559320ddf80ce0263d324c781a3407 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
int

Description
-----------
Returns the index of <l>.
") Index;
		Standard_Integer Index(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Read ******************/
		/**** md5 signature: 5f2f4456946ffa93c620ea243e0f1362 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
IS: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the content of me from the stream <is>. me is first cleared.
") Read;
		void Read(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** ReadCurve2d ******************/
		/**** md5 signature: 8e76149c6e11b24fea6111aef9de38d2 ****/
		%feature("compactdefaultargs") ReadCurve2d;
		%feature("autodoc", "
Parameters
----------
IS: str
C: Geom2d_Curve

Return
-------
Standard_IStream

Description
-----------
Reads the curve from the stream. the curve is assumed to have been written with the write method.
") ReadCurve2d;
		static Standard_IStream & ReadCurve2d(std::istream & IS, opencascade::handle<Geom2d_Curve> & C);

		/****************** Write ******************/
		/**** md5 signature: d5d3cef6bd5a493e7490071dfb7ee4a9 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of me on the stream <os> in a format that can be read back by read.
") Write;
		void Write(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** WriteCurve2d ******************/
		/**** md5 signature: fb004cea29fe8c8fbe520368a3fabd33 ****/
		%feature("compactdefaultargs") WriteCurve2d;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
OS: BinTools_OStream

Return
-------
None

Description
-----------
Dumps the curve on the binary stream, that can be read back.
") WriteCurve2d;
		static void WriteCurve2d(const opencascade::handle<Geom2d_Curve> & C, BinTools_OStream & OS);

};


%extend BinTools_Curve2dSet {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Dump(self):
		pass
	}
};

/**************************
* class BinTools_CurveSet *
**************************/
class BinTools_CurveSet {
	public:
		/****************** BinTools_CurveSet ******************/
		/**** md5 signature: 704e116f502121bb0a6c7a57e0f9f8ac ****/
		%feature("compactdefaultargs") BinTools_CurveSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty set of curves.
") BinTools_CurveSet;
		 BinTools_CurveSet();

		/****************** Add ******************/
		/**** md5 signature: 4548eacacd2a36c829559b37d6b57411 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
int

Description
-----------
Incorporate a new curve in the set and returns its index.
") Add;
		Standard_Integer Add(const opencascade::handle<Geom_Curve> & C);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****************** Curve ******************/
		/**** md5 signature: 3509a433898cb7510761da8b37eedb3b ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns the curve of index <i>.
") Curve;
		opencascade::handle<Geom_Curve> Curve(const Standard_Integer I);

		/****************** Index ******************/
		/**** md5 signature: c53cbf4d0efdfb90843e67e9b32c5252 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
int

Description
-----------
Returns the index of <l>.
") Index;
		Standard_Integer Index(const opencascade::handle<Geom_Curve> & C);

		/****************** Read ******************/
		/**** md5 signature: 5f2f4456946ffa93c620ea243e0f1362 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
IS: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the content of me from the stream <is>. me is first cleared.
") Read;
		void Read(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** ReadCurve ******************/
		/**** md5 signature: dd391fb5d956a43e1ec7bd591b8d99ee ****/
		%feature("compactdefaultargs") ReadCurve;
		%feature("autodoc", "
Parameters
----------
IS: str
C: Geom_Curve

Return
-------
Standard_IStream

Description
-----------
Reads the curve from the stream. the curve is assumed to have been written with the write method.
") ReadCurve;
		static Standard_IStream & ReadCurve(std::istream & IS, opencascade::handle<Geom_Curve> & C);

		/****************** Write ******************/
		/**** md5 signature: d5d3cef6bd5a493e7490071dfb7ee4a9 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of me on the stream <os> in a format that can be read back by read.
") Write;
		void Write(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** WriteCurve ******************/
		/**** md5 signature: 0fd9a95014467f2918a41d1253d1067c ****/
		%feature("compactdefaultargs") WriteCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
OS: BinTools_OStream

Return
-------
None

Description
-----------
Dumps the curve on the stream in binary format that can be read back.
") WriteCurve;
		static void WriteCurve(const opencascade::handle<Geom_Curve> & C, BinTools_OStream & OS);

};


%extend BinTools_CurveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BinTools_IStream *
*************************/
/*****************************
* class BinTools_LocationSet *
*****************************/
class BinTools_LocationSet {
	public:
		/****************** BinTools_LocationSet ******************/
		/**** md5 signature: a107009cfc36014e539e33dde2461af7 ****/
		%feature("compactdefaultargs") BinTools_LocationSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty set of locations.
") BinTools_LocationSet;
		 BinTools_LocationSet();

		/****************** Add ******************/
		/**** md5 signature: 6d3b7662960d74b2d6e66b85d46b59f7 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
L: TopLoc_Location

Return
-------
int

Description
-----------
Incorporate a new location in the set and returns its index.
") Add;
		Standard_Integer Add(const TopLoc_Location & L);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****************** Index ******************/
		/**** md5 signature: fbb01960bb9b443c36d99f6e7b11f6c5 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
L: TopLoc_Location

Return
-------
int

Description
-----------
Returns the index of <l>.
") Index;
		Standard_Integer Index(const TopLoc_Location & L);

		/****************** Location ******************/
		/**** md5 signature: dc46e30cfdcf3a3cf13e5f29298f5163 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopLoc_Location

Description
-----------
Returns the location of index <i>.
") Location;
		const TopLoc_Location & Location(const Standard_Integer I);

		/****************** NbLocations ******************/
		/**** md5 signature: e6c134b8d9aa92e37488cc54961e88e4 ****/
		%feature("compactdefaultargs") NbLocations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of locations.
") NbLocations;
		Standard_Integer NbLocations();

		/****************** Read ******************/
		/**** md5 signature: e0ade46168fbfd205cb072426bbabac5 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
IS: str

Return
-------
None

Description
-----------
Reads the content of me from the stream <is>. me is first cleared.
") Read;
		void Read(std::istream & IS);

		/****************** Write ******************/
		/**** md5 signature: 26d5c57dbc383da9144a6151592feb6a ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of me on the stream <os> in a format that can be read back by read.
") Write;
		void Write(std::ostream &OutValue);

};


%extend BinTools_LocationSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BinTools_OStream *
*************************/
/******************************
* class BinTools_ShapeSetBase *
******************************/
class BinTools_ShapeSetBase {
	public:
		/****************** BinTools_ShapeSetBase ******************/
		/**** md5 signature: 5e43c3efb8ab1132c1c4608ac75a31b0 ****/
		%feature("compactdefaultargs") BinTools_ShapeSetBase;
		%feature("autodoc", "Return
-------
None

Description
-----------
A default constructor.
") BinTools_ShapeSetBase;
		 BinTools_ShapeSetBase();

		/****************** Clear ******************/
		/**** md5 signature: ee228ed41450ea46d6b542478ce426ba ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		virtual void Clear();

		/****************** FormatNb ******************/
		/**** md5 signature: 279a4e17d42738d62d3eac08d8631329 ****/
		%feature("compactdefaultargs") FormatNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the bintools_formatversion.
") FormatNb;
		Standard_Integer FormatNb();

		/****************** IsWithNormals ******************/
		/**** md5 signature: 49f5baecd893691e08f163fb559d8b06 ****/
		%feature("compactdefaultargs") IsWithNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if shape should be stored triangulation with normals.
") IsWithNormals;
		Standard_Boolean IsWithNormals();

		/****************** IsWithTriangles ******************/
		/**** md5 signature: 2adacf1f8e5d4c926108b4db84751e9a ****/
		%feature("compactdefaultargs") IsWithTriangles;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if shape should be stored with triangles.
") IsWithTriangles;
		Standard_Boolean IsWithTriangles();

		/****************** Read ******************/
		/**** md5 signature: 15d2ae9c24a20dde18a097c304597a5b ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
&: std::istream
&: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the content of me from the binary stream <is>. me is first cleared. //! reads the locations. //! reads the geometry calling readgeometry. //! reads the shapes. for each shape reads the type. calls readgeometry(t,s). reads the flag, the subshapes.
") Read;
		virtual void Read(std::istream &, const Message_ProgressRange & = Message_ProgressRange());

		/****************** Read ******************/
		/**** md5 signature: 9e512dab6bca19a0eddcb7c7167d7163 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
&: std::istream
&: TopoDS_Shape

Return
-------
None

Description
-----------
An empty virtual method for redefinition in shape-reader.
") Read;
		virtual void Read(std::istream &, TopoDS_Shape &);

		/****************** SetFormatNb ******************/
		/**** md5 signature: efa61c5f0aa586c699f53e1139cd95f9 ****/
		%feature("compactdefaultargs") SetFormatNb;
		%feature("autodoc", "
Parameters
----------
theFormatNb: int

Return
-------
None

Description
-----------
Sets the bintools_formatversion.
") SetFormatNb;
		void SetFormatNb(const Standard_Integer theFormatNb);

		/****************** SetWithNormals ******************/
		/**** md5 signature: 9f03f91e56766f46bd17d99a089a0a21 ****/
		%feature("compactdefaultargs") SetWithNormals;
		%feature("autodoc", "
Parameters
----------
theWithNormals: bool

Return
-------
None

Description
-----------
Define if shape will be stored triangulation with normals. ignored (always written) if face defines only triangulation (no surface).
") SetWithNormals;
		void SetWithNormals(const Standard_Boolean theWithNormals);

		/****************** SetWithTriangles ******************/
		/**** md5 signature: 7b7f7b1dd0aaac0992d59e75b5df79e1 ****/
		%feature("compactdefaultargs") SetWithTriangles;
		%feature("autodoc", "
Parameters
----------
theWithTriangles: bool

Return
-------
None

Description
-----------
Define if shape will be stored with triangles. ignored (always written) if face defines only triangulation (no surface).
") SetWithTriangles;
		void SetWithTriangles(const Standard_Boolean theWithTriangles);

		/****************** Write ******************/
		/**** md5 signature: eae5f683a0f7fae7ee4a50d676192413 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
&: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
&: Standard_OStream

Description
-----------
Writes the content of me on the stream <os> in binary format that can be read back by read. //! writes the locations. //! writes the geometry calling writegeometry. //! dumps the shapes from last to first. for each shape: write the type. calls writegeometry(s). write the flags, the subshapes.
") Write;
		virtual void Write(std::ostream &OutValue, const Message_ProgressRange & = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: 7494fb2ca2dcbcd64d26ab29a1473ab5 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
&: TopoDS_Shape

Return
-------
&: Standard_OStream

Description
-----------
Writes on <os> the shape <s>. writes the orientation, the index of the tshape and the index of the location.
") Write;
		virtual void Write(const TopoDS_Shape &, std::ostream &OutValue);

};


%extend BinTools_ShapeSetBase {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BinTools_SurfaceSet *
****************************/
class BinTools_SurfaceSet {
	public:
		/****************** BinTools_SurfaceSet ******************/
		/**** md5 signature: ea04fcb2e657ae6371aebb78e4178d8d ****/
		%feature("compactdefaultargs") BinTools_SurfaceSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty set of surfaces.
") BinTools_SurfaceSet;
		 BinTools_SurfaceSet();

		/****************** Add ******************/
		/**** md5 signature: 6108c9acf8995214a7cb8b8e5a0b937c ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
int

Description
-----------
Incorporate a new surface in the set and returns its index.
") Add;
		Standard_Integer Add(const opencascade::handle<Geom_Surface> & S);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****************** Index ******************/
		/**** md5 signature: 7fc50802d17ebd7c660284e6560fb7f6 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
int

Description
-----------
Returns the index of <l>.
") Index;
		Standard_Integer Index(const opencascade::handle<Geom_Surface> & S);

		/****************** Read ******************/
		/**** md5 signature: 5f2f4456946ffa93c620ea243e0f1362 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
IS: str
therange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the content of me from the stream <is>. me is first cleared.
") Read;
		void Read(std::istream & IS, const Message_ProgressRange & therange = Message_ProgressRange());

		/****************** ReadSurface ******************/
		/**** md5 signature: aadfa21c3ae4baf4c6a6f03347b99a89 ****/
		%feature("compactdefaultargs") ReadSurface;
		%feature("autodoc", "
Parameters
----------
IS: str
S: Geom_Surface

Return
-------
Standard_IStream

Description
-----------
Reads the surface from the stream. the surface is assumed to have been written with the write method.
") ReadSurface;
		static Standard_IStream & ReadSurface(std::istream & IS, opencascade::handle<Geom_Surface> & S);

		/****************** Surface ******************/
		/**** md5 signature: f08a9f2a886e0a3933ae15a38f9b8dda ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the surface of index <i>.
") Surface;
		opencascade::handle<Geom_Surface> Surface(const Standard_Integer I);

		/****************** Write ******************/
		/**** md5 signature: d5d3cef6bd5a493e7490071dfb7ee4a9 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of me on the stream <os> in binary format that can be read back by read.
") Write;
		void Write(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** WriteSurface ******************/
		/**** md5 signature: 41c510c34876aa6bbad25b27f75b3a30 ****/
		%feature("compactdefaultargs") WriteSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
OS: BinTools_OStream

Return
-------
None

Description
-----------
Dumps the surface on the stream in binary format that can be read back.
") WriteSurface;
		static void WriteSurface(const opencascade::handle<Geom_Surface> & S, BinTools_OStream & OS);

};


%extend BinTools_SurfaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BinTools_ShapeReader *
*****************************/
class BinTools_ShapeReader : public BinTools_ShapeSetBase {
	public:
		/****************** BinTools_ShapeReader ******************/
		/**** md5 signature: 0d4b9cf10eed36a00f9df0f855784c98 ****/
		%feature("compactdefaultargs") BinTools_ShapeReader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes a shape reader.
") BinTools_ShapeReader;
		 BinTools_ShapeReader();

		/****************** Clear ******************/
		/**** md5 signature: f671931d03948860d0ead34afbe920aa ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		virtual void Clear();

		/****************** Read ******************/
		/**** md5 signature: 25227b6e5e5f66e65787f684a82d38bd ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theStream: str
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Reads the shape from stream using previously restored shapes and objects by references.
") Read;
		void Read(std::istream & theStream, TopoDS_Shape & theShape);

		/****************** ReadLocation ******************/
		/**** md5 signature: bd5aa45e9ea119dbeec11eb219039ce0 ****/
		%feature("compactdefaultargs") ReadLocation;
		%feature("autodoc", "
Parameters
----------
theStream: BinTools_IStream

Return
-------
TopLoc_Location *

Description
-----------
Reads location from the stream.
") ReadLocation;
		const TopLoc_Location * ReadLocation(BinTools_IStream & theStream);

};


%extend BinTools_ShapeReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BinTools_ShapeSet *
**************************/
class BinTools_ShapeSet : public BinTools_ShapeSetBase {
	public:
		/****************** BinTools_ShapeSet ******************/
		/**** md5 signature: 00998afe0732062ff7e083d4a72a15a0 ****/
		%feature("compactdefaultargs") BinTools_ShapeSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds an empty shapeset. @param thewithtriangles [in] flag to write triangulation data.
") BinTools_ShapeSet;
		 BinTools_ShapeSet();

		/****************** Add ******************/
		/**** md5 signature: 53c72d7ee288afd721c7b0a7e7296012 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
Stores <s> and its sub-shape. returns the index of <s>. the method addgeometry is called on each sub-shape.
") Add;
		Standard_Integer Add(const TopoDS_Shape & S);

		/****************** AddShape ******************/
		/**** md5 signature: c53353d34d3c27129aeecdacd6371580 ****/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Stores the shape <s>.
") AddShape;
		virtual void AddShape(const TopoDS_Shape & S);

		/****************** AddShapes ******************/
		/**** md5 signature: e51de0c8f9d77467626b59e64779aeff ****/
		%feature("compactdefaultargs") AddShapes;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
Inserts the shape <s2> in the shape <s1>.
") AddShapes;
		virtual void AddShapes(TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** ChangeLocations ******************/
		/**** md5 signature: 647c90bf8c4ec50f4f4adabd19dff9ef ****/
		%feature("compactdefaultargs") ChangeLocations;
		%feature("autodoc", "Return
-------
BinTools_LocationSet

Description
-----------
No available documentation.
") ChangeLocations;
		BinTools_LocationSet & ChangeLocations();

		/****************** Clear ******************/
		/**** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		virtual void Clear();

		/****************** Index ******************/
		/**** md5 signature: 9e94bb6d7b4221be4165f8639cd27d92 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
Returns the index of <s>.
") Index;
		Standard_Integer Index(const TopoDS_Shape & S);

		/****************** Locations ******************/
		/**** md5 signature: 1891bed2b7331683f81d8635ed2a6f3e ****/
		%feature("compactdefaultargs") Locations;
		%feature("autodoc", "Return
-------
BinTools_LocationSet

Description
-----------
No available documentation.
") Locations;
		const BinTools_LocationSet & Locations();

		/****************** NbShapes ******************/
		/**** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ****/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of shapes read from file.
") NbShapes;
		Standard_Integer NbShapes();

		/****************** Read ******************/
		/**** md5 signature: 4b07273aaddc061dc208ad849f29a02f ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
IS: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the content of me from the binary stream <is>. me is first cleared. //! reads the locations. //! reads the geometry calling readgeometry. //! reads the shapes. for each shape reads the type. calls readgeometry(t,s). reads the flag, the subshapes.
") Read;
		virtual void Read(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** Read ******************/
		/**** md5 signature: 9e512dab6bca19a0eddcb7c7167d7163 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
&: std::istream
&: TopoDS_Shape

Return
-------
None

Description
-----------
An empty virtual method for redefinition in shape-reader.
") Read;
		virtual void Read(std::istream &, TopoDS_Shape &);

		/****************** ReadFlagsAndSubs ******************/
		/**** md5 signature: ec793d841cfc55e44fec35b171f31924 ****/
		%feature("compactdefaultargs") ReadFlagsAndSubs;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum
IS: str
NbShapes: int

Return
-------
None

Description
-----------
Reads from <is> a shape flags and sub-shapes and modifies s.
") ReadFlagsAndSubs;
		virtual void ReadFlagsAndSubs(TopoDS_Shape & S, const TopAbs_ShapeEnum T, std::istream & IS, const Standard_Integer NbShapes);

		/****************** ReadGeometry ******************/
		/**** md5 signature: 8c49d87428ea54564c18dee1e735e34e ****/
		%feature("compactdefaultargs") ReadGeometry;
		%feature("autodoc", "
Parameters
----------
IS: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the geometry of me from the stream <is>.
") ReadGeometry;
		virtual void ReadGeometry(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** ReadPolygon3D ******************/
		/**** md5 signature: cd88a23b4835946311db7bfe884e93c4 ****/
		%feature("compactdefaultargs") ReadPolygon3D;
		%feature("autodoc", "
Parameters
----------
IS: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the 3d polygons of me from the stream <is>.
") ReadPolygon3D;
		void ReadPolygon3D(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** ReadPolygonOnTriangulation ******************/
		/**** md5 signature: c12c2902aa15103beb764ae29fc6d436 ****/
		%feature("compactdefaultargs") ReadPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
IS: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the polygons on triangulation of me from the stream <is>.
") ReadPolygonOnTriangulation;
		void ReadPolygonOnTriangulation(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** ReadShape ******************/
		/**** md5 signature: d4336c38e7a97a10044a8170fcfa8cf4 ****/
		%feature("compactdefaultargs") ReadShape;
		%feature("autodoc", "
Parameters
----------
T: TopAbs_ShapeEnum
IS: str
S: TopoDS_Shape

Return
-------
None

Description
-----------
Reads a shape of type <t> from the stream <is> and returns it in <s>.
") ReadShape;
		virtual void ReadShape(const TopAbs_ShapeEnum T, std::istream & IS, TopoDS_Shape & S);

		/****************** ReadSubs ******************/
		/**** md5 signature: 7a4bfadead50fe32d0ef7d49caa4db13 ****/
		%feature("compactdefaultargs") ReadSubs;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
IS: str
NbShapes: int

Return
-------
None

Description
-----------
Reads from <is> a shape and returns it in s. <nbshapes> is the number of tshapes in the set.
") ReadSubs;
		virtual void ReadSubs(TopoDS_Shape & S, std::istream & IS, const Standard_Integer NbShapes);

		/****************** ReadTriangulation ******************/
		/**** md5 signature: 90589deefe94d4f2b164d615d1250312 ****/
		%feature("compactdefaultargs") ReadTriangulation;
		%feature("autodoc", "
Parameters
----------
IS: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the triangulation of me from the stream <is>.
") ReadTriangulation;
		void ReadTriangulation(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** Shape ******************/
		/**** md5 signature: e70e8ec038f807ea515f2fa1e45089cf ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Shape

Description
-----------
Returns the sub-shape of index <i>.
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer I);

		/****************** Write ******************/
		/**** md5 signature: 2090695479553866c37ac063a125c102 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of me on the stream <os> in binary format that can be read back by read. //! writes the locations. //! writes the geometry calling writegeometry. //! dumps the shapes from last to first. for each shape: write the type. calls writegeometry(s). write the flags, the subshapes.
") Write;
		virtual void Write(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: abb0b72362303f9400b3c04f195f92e2 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
OS: Standard_OStream

Description
-----------
Writes on <os> the shape <s>. writes the orientation, the index of the tshape and the index of the location.
") Write;
		virtual void Write(const TopoDS_Shape & S, std::ostream &OutValue);

		/****************** WriteGeometry ******************/
		/**** md5 signature: 79b02143ea9e44b9406698e1fc0e4a65 ****/
		%feature("compactdefaultargs") WriteGeometry;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the geometry of me on the stream <os> in a binary format that can be read back by read.
") WriteGeometry;
		virtual void WriteGeometry(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** WritePolygon3D ******************/
		/**** md5 signature: f7a844b3f174b4082764be44bdeba902 ****/
		%feature("compactdefaultargs") WritePolygon3D;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the 3d polygons on the stream <os> in a format that can be read back by read.
") WritePolygon3D;
		void WritePolygon3D(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** WritePolygonOnTriangulation ******************/
		/**** md5 signature: 42a0cb0fd4ac67791ede7550f408592e ****/
		%feature("compactdefaultargs") WritePolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the polygons on triangulation on the stream <os> in a format that can be read back by read.
") WritePolygonOnTriangulation;
		void WritePolygonOnTriangulation(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** WriteShape ******************/
		/**** md5 signature: 7c621dc2ecbfe0ab8412c61c3966b71b ****/
		%feature("compactdefaultargs") WriteShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
OS: Standard_OStream

Description
-----------
Writes the shape <s> on the stream <os> in a binary format that can be read back by read.
") WriteShape;
		virtual void WriteShape(const TopoDS_Shape & S, std::ostream &OutValue);

		/****************** WriteTriangulation ******************/
		/**** md5 signature: 86067a9cabf0d76ba9ca5aaa8394eeef ****/
		%feature("compactdefaultargs") WriteTriangulation;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the triangulation on the stream <os> in a format that can be read back by read.
") WriteTriangulation;
		void WriteTriangulation(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

};


%extend BinTools_ShapeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BinTools_ShapeWriter *
*****************************/
class BinTools_ShapeWriter : public BinTools_ShapeSetBase {
	public:
		/****************** BinTools_ShapeWriter ******************/
		/**** md5 signature: c3fd1614740ecac6a5e3b29e2072d4db ****/
		%feature("compactdefaultargs") BinTools_ShapeWriter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds an empty shapeset. parameter <thewithtriangles> is added for xml persistence.
") BinTools_ShapeWriter;
		 BinTools_ShapeWriter();

		/****************** Clear ******************/
		/**** md5 signature: f671931d03948860d0ead34afbe920aa ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		virtual void Clear();

		/****************** Write ******************/
		/**** md5 signature: 59a6a83cf3635e21cdb1e1ebc16aadda ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
theStream: Standard_OStream

Description
-----------
Writes the shape to stream using previously stored shapes and objects to refer them.
") Write;
		virtual void Write(const TopoDS_Shape & theShape, std::ostream &OutValue);

		/****************** WriteLocation ******************/
		/**** md5 signature: 650139b9f368324efb64446489116d9f ****/
		%feature("compactdefaultargs") WriteLocation;
		%feature("autodoc", "
Parameters
----------
theStream: BinTools_OStream
theLocation: TopLoc_Location

Return
-------
None

Description
-----------
Writes location to the stream (all the needed sub-information or reference if it is already used).
") WriteLocation;
		virtual void WriteLocation(BinTools_OStream & theStream, const TopLoc_Location & theLocation);

};


%extend BinTools_ShapeWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BinTools_IStream:
	pass

@classnotwrapped
class BinTools_OStream:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def bintools_GetBool(*args):
	return bintools.GetBool(*args)

@deprecated
def bintools_GetExtChar(*args):
	return bintools.GetExtChar(*args)

@deprecated
def bintools_GetInteger(*args):
	return bintools.GetInteger(*args)

@deprecated
def bintools_GetReal(*args):
	return bintools.GetReal(*args)

@deprecated
def bintools_GetShortReal(*args):
	return bintools.GetShortReal(*args)

@deprecated
def bintools_PutBool(*args):
	return bintools.PutBool(*args)

@deprecated
def bintools_PutExtChar(*args):
	return bintools.PutExtChar(*args)

@deprecated
def bintools_PutInteger(*args):
	return bintools.PutInteger(*args)

@deprecated
def bintools_PutReal(*args):
	return bintools.PutReal(*args)

@deprecated
def bintools_PutShortReal(*args):
	return bintools.PutShortReal(*args)

@deprecated
def bintools_Read(*args):
	return bintools.Read(*args)

@deprecated
def bintools_Read(*args):
	return bintools.Read(*args)

@deprecated
def bintools_Write(*args):
	return bintools.Write(*args)

@deprecated
def bintools_Write(*args):
	return bintools.Write(*args)

@deprecated
def bintools_Write(*args):
	return bintools.Write(*args)

@deprecated
def bintools_Write(*args):
	return bintools.Write(*args)

@deprecated
def BinTools_Curve2dSet_ReadCurve2d(*args):
	return BinTools_Curve2dSet.ReadCurve2d(*args)

@deprecated
def BinTools_Curve2dSet_WriteCurve2d(*args):
	return BinTools_Curve2dSet.WriteCurve2d(*args)

@deprecated
def BinTools_CurveSet_ReadCurve(*args):
	return BinTools_CurveSet.ReadCurve(*args)

@deprecated
def BinTools_CurveSet_WriteCurve(*args):
	return BinTools_CurveSet.WriteCurve(*args)

@deprecated
def BinTools_SurfaceSet_ReadSurface(*args):
	return BinTools_SurfaceSet.ReadSurface(*args)

@deprecated
def BinTools_SurfaceSet_WriteSurface(*args):
	return BinTools_SurfaceSet.WriteSurface(*args)

}
