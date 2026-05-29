/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_bintools.html"
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
%include ../common/ArrayMacros.i


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
enum BinTools_FormatVersion {
	BinTools_FormatVersion_VERSION_1 = 1,
	BinTools_FormatVersion_VERSION_2 = 2,
	BinTools_FormatVersion_VERSION_3 = 3,
	BinTools_FormatVersion_VERSION_4 = 4,
	BinTools_FormatVersion_CURRENT = BinTools_FormatVersion_VERSION_4,
};

enum  {
	BinTools_FormatVersion_LOWER = BinTools_FormatVersion_VERSION_1,
	BinTools_FormatVersion_UPPER = BinTools_FormatVersion_VERSION_4,
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
/* end typedefs declaration */

/*****************
* class BinTools *
*****************/
%rename(bintools) BinTools;
class BinTools {
	public:
		/****** BinTools::GetBool ******/
		/****** md5 signature: 56cc68bda69a4e5eb735fa29ee80c23a ******/
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

		/****** BinTools::GetExtChar ******/
		/****** md5 signature: 7bb4d11327ff3227b58f15b7e15e1505 ******/
		%feature("compactdefaultargs") GetExtChar;
		%feature("autodoc", "
Parameters
----------
IS: str
theValue: char16_t

Return
-------
Standard_IStream

Description
-----------
No available documentation.
") GetExtChar;
		static Standard_IStream & GetExtChar(std::istream & IS, char16_t & theValue);

		/****** BinTools::GetInteger ******/
		/****** md5 signature: d884be710034ee836dd6f3fc1dc8d96e ******/
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

		/****** BinTools::GetReal ******/
		/****** md5 signature: 3660c40c4d3e48492cb2bdd2780e7e62 ******/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "
Parameters
----------
IS: str

Return
-------
theValue: double

Description
-----------
No available documentation.
") GetReal;
		static Standard_IStream & GetReal(std::istream & IS, Standard_Real &OutValue);

		/****** BinTools::GetShortReal ******/
		/****** md5 signature: 04a9b47c5be7efa09f2ce96d324d7680 ******/
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

		/****** BinTools::PutBool ******/
		/****** md5 signature: 033ccb86b2d479734215c1489a2c73de ******/
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
		static Standard_OStream & PutBool(std::ostream &OutValue, const bool theValue);

		/****** BinTools::PutExtChar ******/
		/****** md5 signature: 14ff5b8eff75e15a458655e212c4084c ******/
		%feature("compactdefaultargs") PutExtChar;
		%feature("autodoc", "
Parameters
----------
theValue: char16_t

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") PutExtChar;
		static Standard_OStream & PutExtChar(std::ostream &OutValue, const char16_t theValue);

		/****** BinTools::PutInteger ******/
		/****** md5 signature: 68823fbb23384f0880306b2f94529119 ******/
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
		static Standard_OStream & PutInteger(std::ostream &OutValue, const int theValue);

		/****** BinTools::PutReal ******/
		/****** md5 signature: 29814cba31b4189ee458a18217beb3c7 ******/
		%feature("compactdefaultargs") PutReal;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") PutReal;
		static Standard_OStream & PutReal(std::ostream &OutValue, const double & theValue);

		/****** BinTools::PutShortReal ******/
		/****** md5 signature: cd83087d696b3b464bdb8eff0876e175 ******/
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
		static Standard_OStream & PutShortReal(std::ostream &OutValue, const float & theValue);

		/****** BinTools::Read ******/
		/****** md5 signature: f85bd54e020fe6af72c5aebd07ae8a7b ******/
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
Reads a shape from <theStream> and returns it in <theShape>.
") Read;
		static void Read(TopoDS_Shape & theShape, std::istream & theStream, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools::Read ******/
		/****** md5 signature: 86eaa26b886e58eaaf0f5d082bea57a7 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFile: char *
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a shape from <theFile> and returns it in <theShape>.
") Read;
		static bool Read(TopoDS_Shape & theShape, const char * const theFile, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools::Write ******/
		/****** md5 signature: 66b06396144ebe349cc1d4ffe3194b4c ******/
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
Writes the shape to the stream in binary format BinTools_FormatVersion_CURRENT. This alias writes shape with triangulation data. 
Input parameter: theShape the shape to write 
Input parameter:[out] theStream the stream to output shape into 
Parameter theRange the range of progress indicator to fill in.
") Write;
		static void Write(const TopoDS_Shape & theShape, std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools::Write ******/
		/****** md5 signature: d110c0c688ddbd1b19737ff86180c143 ******/
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
Writes the shape to the stream in binary format of specified version. 
Input parameter: theShape the shape to write 
Input parameter:[out] theStream the stream to output shape into 
Input parameter: theWithTriangles flag which specifies whether to save shape with (True) or without (False) triangles;  has no effect on triangulation-only geometry 
Input parameter: theWithNormals flag which specifies whether to save triangulation with (True) or without (False) normals;  has no effect on triangulation-only geometry 
Input parameter: theVersion the BinTools format version 
Parameter theRange  the range of progress indicator to fill in.
") Write;
		static void Write(const TopoDS_Shape & theShape, std::ostream &OutValue, const bool theWithTriangles, const bool theWithNormals, const BinTools_FormatVersion theVersion, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools::Write ******/
		/****** md5 signature: 341ca5135ef73af6b221fd9f62e7734e ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFile: char *
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes the shape to the file in binary format BinTools_FormatVersion_CURRENT. 
Input parameter: theShape the shape to write 
Input parameter: theFile the path to file to output shape into 
Parameter theRange the range of progress indicator to fill in.
") Write;
		static bool Write(const TopoDS_Shape & theShape, const char * const theFile, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools::Write ******/
		/****** md5 signature: 03eb730985ff6e0e89742f4a6b870dd3 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFile: char *
theWithTriangles: bool
theWithNormals: bool
theVersion: BinTools_FormatVersion
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes the shape to the file in binary format of specified version. 
Input parameter: theShape the shape to write 
Input parameter: theFile  the path to file to output shape into 
Input parameter: theWithTriangles flag which specifies whether to save shape with (True) or without (False) triangles;  has no effect on triangulation-only geometry 
Input parameter: theWithNormals flag which specifies whether to save triangulation with (True) or without (False) normals;  has no effect on triangulation-only geometry 
Input parameter: theVersion the BinTools format version 
Parameter theRange  the range of progress indicator to fill in.
") Write;
		static bool Write(const TopoDS_Shape & theShape, const char * const theFile, const bool theWithTriangles, const bool theWithNormals, const BinTools_FormatVersion theVersion, const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** BinTools_Curve2dSet::BinTools_Curve2dSet ******/
		/****** md5 signature: d70cda135813c59090ea3f4c48ff061f ******/
		%feature("compactdefaultargs") BinTools_Curve2dSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty set of Curves.
") BinTools_Curve2dSet;
		 BinTools_Curve2dSet();

		/****** BinTools_Curve2dSet::Add ******/
		/****** md5 signature: 7b5529147fa639cb09c2b19e17dfef22 ******/
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
Incorporate a new Curve in the set and returns its index.
") Add;
		int Add(const opencascade::handle<Geom2d_Curve> & C);

		/****** BinTools_Curve2dSet::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****** BinTools_Curve2dSet::Curve2d ******/
		/****** md5 signature: ac1faa40fbecd6c896493e09cac0733b ******/
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
Returns the Curve of index <I>.
") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d(const int I);

		/****** BinTools_Curve2dSet::Index ******/
		/****** md5 signature: f71ed5f2ca1ab45364174d69a1004651 ******/
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
Returns the index of <L>.
") Index;
		int Index(const opencascade::handle<Geom2d_Curve> & C);

		/****** BinTools_Curve2dSet::Read ******/
		/****** md5 signature: 5f2f4456946ffa93c620ea243e0f1362 ******/
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
Reads the content of me from the stream <IS>. me is first cleared.
") Read;
		void Read(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_Curve2dSet::ReadCurve2d ******/
		/****** md5 signature: 8e76149c6e11b24fea6111aef9de38d2 ******/
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
Reads the curve from the stream. The curve is assumed to have been written with the Write method.
") ReadCurve2d;
		static Standard_IStream & ReadCurve2d(std::istream & IS, opencascade::handle<Geom2d_Curve> & C);

		/****** BinTools_Curve2dSet::Write ******/
		/****** md5 signature: d5d3cef6bd5a493e7490071dfb7ee4a9 ******/
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
Writes the content of me on the stream <OS> in a format that can be read back by Read.
") Write;
		void Write(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_Curve2dSet::WriteCurve2d ******/
		/****** md5 signature: fb004cea29fe8c8fbe520368a3fabd33 ******/
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
		/****** BinTools_CurveSet::BinTools_CurveSet ******/
		/****** md5 signature: 704e116f502121bb0a6c7a57e0f9f8ac ******/
		%feature("compactdefaultargs") BinTools_CurveSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty set of Curves.
") BinTools_CurveSet;
		 BinTools_CurveSet();

		/****** BinTools_CurveSet::Add ******/
		/****** md5 signature: 8faf055453407b82e5edede2e89d6b34 ******/
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
Incorporate a new Curve in the set and returns its index.
") Add;
		int Add(const opencascade::handle<Geom_Curve> & C);

		/****** BinTools_CurveSet::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****** BinTools_CurveSet::Curve ******/
		/****** md5 signature: d33c0931ecf996d482bcfb88bfe04928 ******/
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
Returns the Curve of index <I>.
") Curve;
		opencascade::handle<Geom_Curve> Curve(const int I);

		/****** BinTools_CurveSet::Index ******/
		/****** md5 signature: 1baaf4c3c2962c561b2c8009133d74f6 ******/
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
Returns the index of <L>.
") Index;
		int Index(const opencascade::handle<Geom_Curve> & C);

		/****** BinTools_CurveSet::Read ******/
		/****** md5 signature: 5f2f4456946ffa93c620ea243e0f1362 ******/
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
Reads the content of me from the stream <IS>. me is first cleared.
") Read;
		void Read(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_CurveSet::ReadCurve ******/
		/****** md5 signature: dd391fb5d956a43e1ec7bd591b8d99ee ******/
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
Reads the curve from the stream. The curve is assumed to have been written with the Write method.
") ReadCurve;
		static Standard_IStream & ReadCurve(std::istream & IS, opencascade::handle<Geom_Curve> & C);

		/****** BinTools_CurveSet::Write ******/
		/****** md5 signature: d5d3cef6bd5a493e7490071dfb7ee4a9 ******/
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
Writes the content of me on the stream <OS> in a format that can be read back by Read.
") Write;
		void Write(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_CurveSet::WriteCurve ******/
		/****** md5 signature: 0fd9a95014467f2918a41d1253d1067c ******/
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
		/****** BinTools_LocationSet::BinTools_LocationSet ******/
		/****** md5 signature: a107009cfc36014e539e33dde2461af7 ******/
		%feature("compactdefaultargs") BinTools_LocationSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty set of locations.
") BinTools_LocationSet;
		 BinTools_LocationSet();

		/****** BinTools_LocationSet::Add ******/
		/****** md5 signature: 7cdb3f81017590d68bfd141d252b4cd7 ******/
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
Incorporate a new Location in the set and returns its index.
") Add;
		int Add(const TopLoc_Location & L);

		/****** BinTools_LocationSet::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****** BinTools_LocationSet::Index ******/
		/****** md5 signature: 422bc53fbef9ac2e56c05b850302b1bb ******/
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
Returns the index of <L>.
") Index;
		int Index(const TopLoc_Location & L);

		/****** BinTools_LocationSet::Location ******/
		/****** md5 signature: 2ce5408eb7d2eeaacf7f0ac26a1b8a72 ******/
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
Returns the location of index <I>.
") Location;
		const TopLoc_Location & Location(const int I);

		/****** BinTools_LocationSet::NbLocations ******/
		/****** md5 signature: 9505c89c0c873e0d520a75f03b4e825b ******/
		%feature("compactdefaultargs") NbLocations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of locations.
") NbLocations;
		int NbLocations();

		/****** BinTools_LocationSet::Read ******/
		/****** md5 signature: e0ade46168fbfd205cb072426bbabac5 ******/
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
Reads the content of me from the stream <IS>. me is first cleared.
") Read;
		void Read(std::istream & IS);

		/****** BinTools_LocationSet::Write ******/
		/****** md5 signature: 26d5c57dbc383da9144a6151592feb6a ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of me on the stream <OS> in a format that can be read back by Read.
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
		/****** BinTools_ShapeSetBase::BinTools_ShapeSetBase ******/
		/****** md5 signature: 5e43c3efb8ab1132c1c4608ac75a31b0 ******/
		%feature("compactdefaultargs") BinTools_ShapeSetBase;
		%feature("autodoc", "Return
-------
None

Description
-----------
A default constructor.
") BinTools_ShapeSetBase;
		 BinTools_ShapeSetBase();

		/****** BinTools_ShapeSetBase::Clear ******/
		/****** md5 signature: ee228ed41450ea46d6b542478ce426ba ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		virtual void Clear();

		/****** BinTools_ShapeSetBase::FormatNb ******/
		/****** md5 signature: e86d47dcb7666d660c787799c3ac98d9 ******/
		%feature("compactdefaultargs") FormatNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the BinTools_FormatVersion.
") FormatNb;
		int FormatNb();

		/****** BinTools_ShapeSetBase::IsWithNormals ******/
		/****** md5 signature: c7acafa16493860e7c0a6bd60edea61c ******/
		%feature("compactdefaultargs") IsWithNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if shape should be stored triangulation with normals.
") IsWithNormals;
		bool IsWithNormals();

		/****** BinTools_ShapeSetBase::IsWithTriangles ******/
		/****** md5 signature: c31685fbc77b7c6389330903a3a6386f ******/
		%feature("compactdefaultargs") IsWithTriangles;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if shape should be stored with triangles.
") IsWithTriangles;
		bool IsWithTriangles();

		/****** BinTools_ShapeSetBase::Read ******/
		/****** md5 signature: 15d2ae9c24a20dde18a097c304597a5b ******/
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
Reads the content of me from the binary stream <IS>. me is first cleared. //! Reads the locations. //! Reads the geometry calling ReadGeometry. //! Reads the shapes. For each shape Reads the type. calls ReadGeometry(T,S). Reads the flag, the subshapes.
") Read;
		virtual void Read(std::istream &, const Message_ProgressRange & = Message_ProgressRange());

		/****** BinTools_ShapeSetBase::Read ******/
		/****** md5 signature: 9e512dab6bca19a0eddcb7c7167d7163 ******/
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

		/****** BinTools_ShapeSetBase::SetFormatNb ******/
		/****** md5 signature: 82c781302ac5badb8fd104d1fef61b1b ******/
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
Sets the BinTools_FormatVersion.
") SetFormatNb;
		void SetFormatNb(const int theFormatNb);

		/****** BinTools_ShapeSetBase::SetWithNormals ******/
		/****** md5 signature: 87699c87d5128dde6485c8bede47cae2 ******/
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
Define if shape will be stored triangulation with normals. Ignored (always written) if face defines only triangulation (no surface).
") SetWithNormals;
		void SetWithNormals(const bool theWithNormals);

		/****** BinTools_ShapeSetBase::SetWithTriangles ******/
		/****** md5 signature: 089286c3553f67f84fb9f893e41739b5 ******/
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
Define if shape will be stored with triangles. Ignored (always written) if face defines only triangulation (no surface).
") SetWithTriangles;
		void SetWithTriangles(const bool theWithTriangles);

		/****** BinTools_ShapeSetBase::Write ******/
		/****** md5 signature: eae5f683a0f7fae7ee4a50d676192413 ******/
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
Writes the content of me on the stream <OS> in binary format that can be read back by Read. //! Writes the locations. //! Writes the geometry calling WriteGeometry. //! Dumps the shapes from last to first. For each shape: Write the type. calls WriteGeometry(S). Write the flags, the subshapes.
") Write;
		virtual void Write(std::ostream &OutValue, const Message_ProgressRange & = Message_ProgressRange());

		/****** BinTools_ShapeSetBase::Write ******/
		/****** md5 signature: 7494fb2ca2dcbcd64d26ab29a1473ab5 ******/
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
Writes on <OS> the shape <S>. Writes the orientation, the index of the TShape and the index of the Location.
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
		/****** BinTools_SurfaceSet::BinTools_SurfaceSet ******/
		/****** md5 signature: ea04fcb2e657ae6371aebb78e4178d8d ******/
		%feature("compactdefaultargs") BinTools_SurfaceSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty set of Surfaces.
") BinTools_SurfaceSet;
		 BinTools_SurfaceSet();

		/****** BinTools_SurfaceSet::Add ******/
		/****** md5 signature: 372a7acded5452c654533a84e59a8847 ******/
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
Incorporate a new Surface in the set and returns its index.
") Add;
		int Add(const opencascade::handle<Geom_Surface> & S);

		/****** BinTools_SurfaceSet::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****** BinTools_SurfaceSet::Index ******/
		/****** md5 signature: 16c0c2f2c4962a55dfed3c6e84e12c9a ******/
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
Returns the index of <L>.
") Index;
		int Index(const opencascade::handle<Geom_Surface> & S);

		/****** BinTools_SurfaceSet::Read ******/
		/****** md5 signature: 5f2f4456946ffa93c620ea243e0f1362 ******/
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
Reads the content of me from the stream <IS>. me is first cleared.
") Read;
		void Read(std::istream & IS, const Message_ProgressRange & therange = Message_ProgressRange());

		/****** BinTools_SurfaceSet::ReadSurface ******/
		/****** md5 signature: aadfa21c3ae4baf4c6a6f03347b99a89 ******/
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
Reads the surface from the stream. The surface is assumed to have been written with the Write method.
") ReadSurface;
		static Standard_IStream & ReadSurface(std::istream & IS, opencascade::handle<Geom_Surface> & S);

		/****** BinTools_SurfaceSet::Surface ******/
		/****** md5 signature: c8dcfe4df85c1847812c4a1ca1a64ead ******/
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
Returns the Surface of index <I>.
") Surface;
		opencascade::handle<Geom_Surface> Surface(const int I);

		/****** BinTools_SurfaceSet::Write ******/
		/****** md5 signature: d5d3cef6bd5a493e7490071dfb7ee4a9 ******/
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
Writes the content of me on the stream <OS> in binary format that can be read back by Read.
") Write;
		void Write(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_SurfaceSet::WriteSurface ******/
		/****** md5 signature: 41c510c34876aa6bbad25b27f75b3a30 ******/
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
		/****** BinTools_ShapeReader::BinTools_ShapeReader ******/
		/****** md5 signature: 0d4b9cf10eed36a00f9df0f855784c98 ******/
		%feature("compactdefaultargs") BinTools_ShapeReader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes a shape reader.
") BinTools_ShapeReader;
		 BinTools_ShapeReader();

		/****** BinTools_ShapeReader::Clear ******/
		/****** md5 signature: 1c0d2ab59d0f6282725648dcdf130adb ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****** BinTools_ShapeReader::Read ******/
		/****** md5 signature: bd72ed9119fcea6db6c276f4730eb338 ******/
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

		/****** BinTools_ShapeReader::ReadLocation ******/
		/****** md5 signature: bd5aa45e9ea119dbeec11eb219039ce0 ******/
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
		/****** BinTools_ShapeSet::BinTools_ShapeSet ******/
		/****** md5 signature: 00998afe0732062ff7e083d4a72a15a0 ******/
		%feature("compactdefaultargs") BinTools_ShapeSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds an empty ShapeSet. 
Input parameter: theWithTriangles flag to write triangulation data.
") BinTools_ShapeSet;
		 BinTools_ShapeSet();

		/****** BinTools_ShapeSet::Add ******/
		/****** md5 signature: e00e8e88523f332d4248798e366af3a6 ******/
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
Stores <S> and its sub-shape. Returns the index of <S>. The method AddGeometry is called on each sub-shape.
") Add;
		int Add(const TopoDS_Shape & S);

		/****** BinTools_ShapeSet::AddShape ******/
		/****** md5 signature: c53353d34d3c27129aeecdacd6371580 ******/
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
Stores the shape <S>.
") AddShape;
		virtual void AddShape(const TopoDS_Shape & S);

		/****** BinTools_ShapeSet::AddShapes ******/
		/****** md5 signature: e51de0c8f9d77467626b59e64779aeff ******/
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
Inserts the shape <S2> in the shape <S1>.
") AddShapes;
		virtual void AddShapes(TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** BinTools_ShapeSet::ChangeLocations ******/
		/****** md5 signature: 647c90bf8c4ec50f4f4adabd19dff9ef ******/
		%feature("compactdefaultargs") ChangeLocations;
		%feature("autodoc", "Return
-------
BinTools_LocationSet

Description
-----------
No available documentation.
") ChangeLocations;
		BinTools_LocationSet & ChangeLocations();

		/****** BinTools_ShapeSet::Clear ******/
		/****** md5 signature: 1c0d2ab59d0f6282725648dcdf130adb ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****** BinTools_ShapeSet::Index ******/
		/****** md5 signature: 27bedbe3f62518ea8f5e80df9093520c ******/
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
Returns the index of <S>.
") Index;
		int Index(const TopoDS_Shape & S);

		/****** BinTools_ShapeSet::Locations ******/
		/****** md5 signature: 1891bed2b7331683f81d8635ed2a6f3e ******/
		%feature("compactdefaultargs") Locations;
		%feature("autodoc", "Return
-------
BinTools_LocationSet

Description
-----------
No available documentation.
") Locations;
		const BinTools_LocationSet & Locations();

		/****** BinTools_ShapeSet::NbShapes ******/
		/****** md5 signature: 5033c6acdebfec4ad702502e01d3601a ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of shapes read from file.
") NbShapes;
		int NbShapes();

		/****** BinTools_ShapeSet::Read ******/
		/****** md5 signature: 9c0a247edeb3de19fc49c3c3e356a2d8 ******/
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
Reads the content of me from the binary stream <IS>. me is first cleared. //! Reads the locations. //! Reads the geometry calling ReadGeometry. //! Reads the shapes. For each shape Reads the type. calls ReadGeometry(T,S). Reads the flag, the subshapes.
") Read;
		void Read(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_ShapeSet::Read ******/
		/****** md5 signature: 629882fbeef7c3cdc28bb3851b74bda8 ******/
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
		void Read(std::istream &, TopoDS_Shape &);

		/****** BinTools_ShapeSet::ReadFlagsAndSubs ******/
		/****** md5 signature: e49d42518a72a8feff510086aa32a39d ******/
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
Reads from <IS> a shape flags and sub-shapes and modifies S.
") ReadFlagsAndSubs;
		virtual void ReadFlagsAndSubs(TopoDS_Shape & S, const TopAbs_ShapeEnum T, std::istream & IS, const int NbShapes);

		/****** BinTools_ShapeSet::ReadGeometry ******/
		/****** md5 signature: 8c49d87428ea54564c18dee1e735e34e ******/
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
Reads the geometry of me from the stream <IS>.
") ReadGeometry;
		virtual void ReadGeometry(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_ShapeSet::ReadPolygon3D ******/
		/****** md5 signature: cd88a23b4835946311db7bfe884e93c4 ******/
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
Reads the 3d polygons of me from the stream <IS>.
") ReadPolygon3D;
		void ReadPolygon3D(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_ShapeSet::ReadPolygonOnTriangulation ******/
		/****** md5 signature: c12c2902aa15103beb764ae29fc6d436 ******/
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
Reads the polygons on triangulation of me from the stream <IS>.
") ReadPolygonOnTriangulation;
		void ReadPolygonOnTriangulation(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_ShapeSet::ReadShape ******/
		/****** md5 signature: d4336c38e7a97a10044a8170fcfa8cf4 ******/
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
Reads a shape of type <T> from the stream <IS> and returns it in <S>.
") ReadShape;
		virtual void ReadShape(const TopAbs_ShapeEnum T, std::istream & IS, TopoDS_Shape & S);

		/****** BinTools_ShapeSet::ReadSubs ******/
		/****** md5 signature: 94680b5d5e2ede2df312efea2df68488 ******/
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
Reads from <IS> a shape and returns it in S. <NbShapes> is the number of tshapes in the set.
") ReadSubs;
		virtual void ReadSubs(TopoDS_Shape & S, std::istream & IS, const int NbShapes);

		/****** BinTools_ShapeSet::ReadTriangulation ******/
		/****** md5 signature: 90589deefe94d4f2b164d615d1250312 ******/
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
Reads the triangulation of me from the stream <IS>.
") ReadTriangulation;
		void ReadTriangulation(std::istream & IS, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_ShapeSet::Shape ******/
		/****** md5 signature: 1d3205c445c40f5ad97841ec23395a00 ******/
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
Returns the sub-shape of index <I>.
") Shape;
		const TopoDS_Shape Shape(const int I);

		/****** BinTools_ShapeSet::Write ******/
		/****** md5 signature: db74c1201e7c1126e5dda26cf6f9dd16 ******/
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
Writes the content of me on the stream <OS> in binary format that can be read back by Read. //! Writes the locations. //! Writes the geometry calling WriteGeometry. //! Dumps the shapes from last to first. For each shape: Write the type. calls WriteGeometry(S). Write the flags, the subshapes.
") Write;
		void Write(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_ShapeSet::Write ******/
		/****** md5 signature: eefc315f09415273c1edb96c8021d552 ******/
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
Writes on <OS> the shape <S>. Writes the orientation, the index of the TShape and the index of the Location.
") Write;
		void Write(const TopoDS_Shape & S, std::ostream &OutValue);

		/****** BinTools_ShapeSet::WriteGeometry ******/
		/****** md5 signature: 79b02143ea9e44b9406698e1fc0e4a65 ******/
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
Writes the geometry of me on the stream <OS> in a binary format that can be read back by Read.
") WriteGeometry;
		virtual void WriteGeometry(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_ShapeSet::WritePolygon3D ******/
		/****** md5 signature: f7a844b3f174b4082764be44bdeba902 ******/
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
Writes the 3d polygons on the stream <OS> in a format that can be read back by Read.
") WritePolygon3D;
		void WritePolygon3D(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_ShapeSet::WritePolygonOnTriangulation ******/
		/****** md5 signature: 42a0cb0fd4ac67791ede7550f408592e ******/
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
Writes the polygons on triangulation on the stream <OS> in a format that can be read back by Read.
") WritePolygonOnTriangulation;
		void WritePolygonOnTriangulation(std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BinTools_ShapeSet::WriteShape ******/
		/****** md5 signature: 7c621dc2ecbfe0ab8412c61c3966b71b ******/
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
Writes the shape <S> on the stream <OS> in a binary format that can be read back by Read.
") WriteShape;
		virtual void WriteShape(const TopoDS_Shape & S, std::ostream &OutValue);

		/****** BinTools_ShapeSet::WriteTriangulation ******/
		/****** md5 signature: 86067a9cabf0d76ba9ca5aaa8394eeef ******/
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
Writes the triangulation on the stream <OS> in a format that can be read back by Read.
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
		/****** BinTools_ShapeWriter::BinTools_ShapeWriter ******/
		/****** md5 signature: c3fd1614740ecac6a5e3b29e2072d4db ******/
		%feature("compactdefaultargs") BinTools_ShapeWriter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds an empty ShapeSet. Parameter <theWithTriangles> is added for XML Persistence.
") BinTools_ShapeWriter;
		 BinTools_ShapeWriter();

		/****** BinTools_ShapeWriter::Clear ******/
		/****** md5 signature: 1c0d2ab59d0f6282725648dcdf130adb ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****** BinTools_ShapeWriter::Write ******/
		/****** md5 signature: dd39017565fb90c4c244b2fdf56217fe ******/
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
		void Write(const TopoDS_Shape & theShape, std::ostream &OutValue);

		/****** BinTools_ShapeWriter::WriteLocation ******/
		/****** md5 signature: 650139b9f368324efb64446489116d9f ******/
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
