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
%define STEPTOTOPODSDOCSTRING
"StepToTopoDS module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_steptotopods.html"
%enddef
%module (package="OCC.Core", docstring=STEPTOTOPODSDOCSTRING) StepToTopoDS


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
#include<StepData_Factors.hxx>
#include<StepToTopoDS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepRepr_module.hxx>
#include<StepShape_module.hxx>
#include<StepGeom_module.hxx>
#include<TCollection_module.hxx>
#include<Geom_module.hxx>
#include<TopoDS_module.hxx>
#include<Transfer_module.hxx>
#include<Geom2d_module.hxx>
#include<StepData_module.hxx>
#include<gp_module.hxx>
#include<Message_module.hxx>
#include<StepVisual_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<Interface_module.hxx>
#include<TopLoc_module.hxx>
#include<Transfer_module.hxx>
#include<StepData_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<Resource_module.hxx>
#include<TDF_module.hxx>
#include<IFSelect_module.hxx>
#include<TDocStd_module.hxx>
#include<TopTools_module.hxx>
#include<XSControl_module.hxx>
#include<PCDM_module.hxx>
#include<DE_module.hxx>
#include<CDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepRepr.i
%import StepShape.i
%import StepGeom.i
%import TCollection.i
%import Geom.i
%import TopoDS.i
%import Transfer.i
%import Geom2d.i
%import StepData.i
%import gp.i
%import Message.i
%import StepVisual.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum StepToTopoDS_BuilderError {
	StepToTopoDS_BuilderDone = 0,
	StepToTopoDS_BuilderOther = 1,
};

enum StepToTopoDS_GeometricToolError {
	StepToTopoDS_GeometricToolDone = 0,
	StepToTopoDS_GeometricToolIsDegenerated = 1,
	StepToTopoDS_GeometricToolHasNoPCurve = 2,
	StepToTopoDS_GeometricToolWrong3dParameters = 3,
	StepToTopoDS_GeometricToolNoProjectiOnCurve = 4,
	StepToTopoDS_GeometricToolOther = 5,
};

enum StepToTopoDS_TranslateEdgeError {
	StepToTopoDS_TranslateEdgeDone = 0,
	StepToTopoDS_TranslateEdgeOther = 1,
};

enum StepToTopoDS_TranslateEdgeLoopError {
	StepToTopoDS_TranslateEdgeLoopDone = 0,
	StepToTopoDS_TranslateEdgeLoopOther = 1,
};

enum StepToTopoDS_TranslateFaceError {
	StepToTopoDS_TranslateFaceDone = 0,
	StepToTopoDS_TranslateFaceOther = 1,
};

enum StepToTopoDS_TranslatePolyLoopError {
	StepToTopoDS_TranslatePolyLoopDone = 0,
	StepToTopoDS_TranslatePolyLoopOther = 1,
};

enum StepToTopoDS_TranslateShellError {
	StepToTopoDS_TranslateShellDone = 0,
	StepToTopoDS_TranslateShellOther = 1,
};

enum StepToTopoDS_TranslateSolidError {
	StepToTopoDS_TranslateSolidDone = 0,
	StepToTopoDS_TranslateSolidOther = 1,
};

enum StepToTopoDS_TranslateVertexError {
	StepToTopoDS_TranslateVertexDone = 0,
	StepToTopoDS_TranslateVertexOther = 1,
};

enum StepToTopoDS_TranslateVertexLoopError {
	StepToTopoDS_TranslateVertexLoopDone = 0,
	StepToTopoDS_TranslateVertexLoopOther = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class StepToTopoDS_BuilderError(IntEnum):
	StepToTopoDS_BuilderDone = 0
	StepToTopoDS_BuilderOther = 1
StepToTopoDS_BuilderDone = StepToTopoDS_BuilderError.StepToTopoDS_BuilderDone
StepToTopoDS_BuilderOther = StepToTopoDS_BuilderError.StepToTopoDS_BuilderOther

class StepToTopoDS_GeometricToolError(IntEnum):
	StepToTopoDS_GeometricToolDone = 0
	StepToTopoDS_GeometricToolIsDegenerated = 1
	StepToTopoDS_GeometricToolHasNoPCurve = 2
	StepToTopoDS_GeometricToolWrong3dParameters = 3
	StepToTopoDS_GeometricToolNoProjectiOnCurve = 4
	StepToTopoDS_GeometricToolOther = 5
StepToTopoDS_GeometricToolDone = StepToTopoDS_GeometricToolError.StepToTopoDS_GeometricToolDone
StepToTopoDS_GeometricToolIsDegenerated = StepToTopoDS_GeometricToolError.StepToTopoDS_GeometricToolIsDegenerated
StepToTopoDS_GeometricToolHasNoPCurve = StepToTopoDS_GeometricToolError.StepToTopoDS_GeometricToolHasNoPCurve
StepToTopoDS_GeometricToolWrong3dParameters = StepToTopoDS_GeometricToolError.StepToTopoDS_GeometricToolWrong3dParameters
StepToTopoDS_GeometricToolNoProjectiOnCurve = StepToTopoDS_GeometricToolError.StepToTopoDS_GeometricToolNoProjectiOnCurve
StepToTopoDS_GeometricToolOther = StepToTopoDS_GeometricToolError.StepToTopoDS_GeometricToolOther

class StepToTopoDS_TranslateEdgeError(IntEnum):
	StepToTopoDS_TranslateEdgeDone = 0
	StepToTopoDS_TranslateEdgeOther = 1
StepToTopoDS_TranslateEdgeDone = StepToTopoDS_TranslateEdgeError.StepToTopoDS_TranslateEdgeDone
StepToTopoDS_TranslateEdgeOther = StepToTopoDS_TranslateEdgeError.StepToTopoDS_TranslateEdgeOther

class StepToTopoDS_TranslateEdgeLoopError(IntEnum):
	StepToTopoDS_TranslateEdgeLoopDone = 0
	StepToTopoDS_TranslateEdgeLoopOther = 1
StepToTopoDS_TranslateEdgeLoopDone = StepToTopoDS_TranslateEdgeLoopError.StepToTopoDS_TranslateEdgeLoopDone
StepToTopoDS_TranslateEdgeLoopOther = StepToTopoDS_TranslateEdgeLoopError.StepToTopoDS_TranslateEdgeLoopOther

class StepToTopoDS_TranslateFaceError(IntEnum):
	StepToTopoDS_TranslateFaceDone = 0
	StepToTopoDS_TranslateFaceOther = 1
StepToTopoDS_TranslateFaceDone = StepToTopoDS_TranslateFaceError.StepToTopoDS_TranslateFaceDone
StepToTopoDS_TranslateFaceOther = StepToTopoDS_TranslateFaceError.StepToTopoDS_TranslateFaceOther

class StepToTopoDS_TranslatePolyLoopError(IntEnum):
	StepToTopoDS_TranslatePolyLoopDone = 0
	StepToTopoDS_TranslatePolyLoopOther = 1
StepToTopoDS_TranslatePolyLoopDone = StepToTopoDS_TranslatePolyLoopError.StepToTopoDS_TranslatePolyLoopDone
StepToTopoDS_TranslatePolyLoopOther = StepToTopoDS_TranslatePolyLoopError.StepToTopoDS_TranslatePolyLoopOther

class StepToTopoDS_TranslateShellError(IntEnum):
	StepToTopoDS_TranslateShellDone = 0
	StepToTopoDS_TranslateShellOther = 1
StepToTopoDS_TranslateShellDone = StepToTopoDS_TranslateShellError.StepToTopoDS_TranslateShellDone
StepToTopoDS_TranslateShellOther = StepToTopoDS_TranslateShellError.StepToTopoDS_TranslateShellOther

class StepToTopoDS_TranslateSolidError(IntEnum):
	StepToTopoDS_TranslateSolidDone = 0
	StepToTopoDS_TranslateSolidOther = 1
StepToTopoDS_TranslateSolidDone = StepToTopoDS_TranslateSolidError.StepToTopoDS_TranslateSolidDone
StepToTopoDS_TranslateSolidOther = StepToTopoDS_TranslateSolidError.StepToTopoDS_TranslateSolidOther

class StepToTopoDS_TranslateVertexError(IntEnum):
	StepToTopoDS_TranslateVertexDone = 0
	StepToTopoDS_TranslateVertexOther = 1
StepToTopoDS_TranslateVertexDone = StepToTopoDS_TranslateVertexError.StepToTopoDS_TranslateVertexDone
StepToTopoDS_TranslateVertexOther = StepToTopoDS_TranslateVertexError.StepToTopoDS_TranslateVertexOther

class StepToTopoDS_TranslateVertexLoopError(IntEnum):
	StepToTopoDS_TranslateVertexLoopDone = 0
	StepToTopoDS_TranslateVertexLoopOther = 1
StepToTopoDS_TranslateVertexLoopDone = StepToTopoDS_TranslateVertexLoopError.StepToTopoDS_TranslateVertexLoopDone
StepToTopoDS_TranslateVertexLoopOther = StepToTopoDS_TranslateVertexLoopError.StepToTopoDS_TranslateVertexLoopOther
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(StepToTopoDS_DataMapOfRI) NCollection_DataMap<opencascade::handle<StepRepr_RepresentationItem>,TopoDS_Shape>;
%template(StepToTopoDS_DataMapOfRINames) NCollection_DataMap<TCollection_AsciiString,TopoDS_Shape>;
%template(StepToTopoDS_DataMapOfTRI) NCollection_DataMap<opencascade::handle<StepShape_TopologicalRepresentationItem>,TopoDS_Shape>;
%template(StepToTopoDS_PointEdgeMap) NCollection_DataMap<StepToTopoDS_PointPair,TopoDS_Edge>;
%template(StepToTopoDS_PointVertexMap) NCollection_DataMap<opencascade::handle<StepGeom_CartesianPoint>,TopoDS_Vertex>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<opencascade::handle<StepRepr_RepresentationItem>, TopoDS_Shape>::Iterator StepToTopoDS_DataMapIteratorOfDataMapOfRI;
typedef NCollection_DataMap<TCollection_AsciiString, TopoDS_Shape>::Iterator StepToTopoDS_DataMapIteratorOfDataMapOfRINames;
typedef NCollection_DataMap<opencascade::handle<StepShape_TopologicalRepresentationItem>, TopoDS_Shape>::Iterator StepToTopoDS_DataMapIteratorOfDataMapOfTRI;
typedef NCollection_DataMap<StepToTopoDS_PointPair, TopoDS_Edge>::Iterator StepToTopoDS_DataMapIteratorOfPointEdgeMap;
typedef NCollection_DataMap<opencascade::handle<StepGeom_CartesianPoint>, TopoDS_Vertex>::Iterator StepToTopoDS_DataMapIteratorOfPointVertexMap;
typedef NCollection_DataMap<opencascade::handle<StepRepr_RepresentationItem>, TopoDS_Shape> StepToTopoDS_DataMapOfRI;
typedef NCollection_DataMap<TCollection_AsciiString, TopoDS_Shape> StepToTopoDS_DataMapOfRINames;
typedef NCollection_DataMap<opencascade::handle<StepShape_TopologicalRepresentationItem>, TopoDS_Shape> StepToTopoDS_DataMapOfTRI;
typedef NCollection_DataMap<StepToTopoDS_PointPair, TopoDS_Edge> StepToTopoDS_PointEdgeMap;
typedef NCollection_DataMap<opencascade::handle<StepGeom_CartesianPoint>, TopoDS_Vertex> StepToTopoDS_PointVertexMap;
/* end typedefs declaration */

/*********************
* class StepToTopoDS *
*********************/
%rename(steptotopods) StepToTopoDS;
class StepToTopoDS {
	public:
		/****** StepToTopoDS::DecodeBuilderError ******/
		/****** md5 signature: d71a875d14655678f1fac2d82f46f3d7 ******/
		%feature("compactdefaultargs") DecodeBuilderError;
		%feature("autodoc", "
Parameters
----------
Error: StepToTopoDS_BuilderError

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") DecodeBuilderError;
		static opencascade::handle<TCollection_HAsciiString> DecodeBuilderError(const StepToTopoDS_BuilderError Error);

		/****** StepToTopoDS::DecodeEdgeError ******/
		/****** md5 signature: 162c7a22b6733e03bf205f8c6feb7a25 ******/
		%feature("compactdefaultargs") DecodeEdgeError;
		%feature("autodoc", "
Parameters
----------
Error: StepToTopoDS_TranslateEdgeError

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") DecodeEdgeError;
		static opencascade::handle<TCollection_HAsciiString> DecodeEdgeError(const StepToTopoDS_TranslateEdgeError Error);

		/****** StepToTopoDS::DecodeFaceError ******/
		/****** md5 signature: b617c00a43a67259f10a615382ce5a68 ******/
		%feature("compactdefaultargs") DecodeFaceError;
		%feature("autodoc", "
Parameters
----------
Error: StepToTopoDS_TranslateFaceError

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") DecodeFaceError;
		static opencascade::handle<TCollection_HAsciiString> DecodeFaceError(const StepToTopoDS_TranslateFaceError Error);

		/****** StepToTopoDS::DecodeGeometricToolError ******/
		/****** md5 signature: 284e670ce83fabf0c21eb4fab38169f7 ******/
		%feature("compactdefaultargs") DecodeGeometricToolError;
		%feature("autodoc", "
Parameters
----------
Error: StepToTopoDS_GeometricToolError

Return
-------
str

Description
-----------
No available documentation.
") DecodeGeometricToolError;
		static Standard_CString DecodeGeometricToolError(const StepToTopoDS_GeometricToolError Error);

		/****** StepToTopoDS::DecodePolyLoopError ******/
		/****** md5 signature: 2ca2e1443a619e76fe6a0cc8a856a348 ******/
		%feature("compactdefaultargs") DecodePolyLoopError;
		%feature("autodoc", "
Parameters
----------
Error: StepToTopoDS_TranslatePolyLoopError

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") DecodePolyLoopError;
		static opencascade::handle<TCollection_HAsciiString> DecodePolyLoopError(const StepToTopoDS_TranslatePolyLoopError Error);

		/****** StepToTopoDS::DecodeShellError ******/
		/****** md5 signature: 9e24abf3232d43c607fca654a7ef839d ******/
		%feature("compactdefaultargs") DecodeShellError;
		%feature("autodoc", "
Parameters
----------
Error: StepToTopoDS_TranslateShellError

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") DecodeShellError;
		static opencascade::handle<TCollection_HAsciiString> DecodeShellError(const StepToTopoDS_TranslateShellError Error);

		/****** StepToTopoDS::DecodeVertexError ******/
		/****** md5 signature: 3f5b57353135ca50c63bfa5a1198be21 ******/
		%feature("compactdefaultargs") DecodeVertexError;
		%feature("autodoc", "
Parameters
----------
Error: StepToTopoDS_TranslateVertexError

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") DecodeVertexError;
		static opencascade::handle<TCollection_HAsciiString> DecodeVertexError(const StepToTopoDS_TranslateVertexError Error);

		/****** StepToTopoDS::DecodeVertexLoopError ******/
		/****** md5 signature: bc1dd64ab12f098f461796aa5039267e ******/
		%feature("compactdefaultargs") DecodeVertexLoopError;
		%feature("autodoc", "
Parameters
----------
Error: StepToTopoDS_TranslateVertexLoopError

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") DecodeVertexLoopError;
		static opencascade::handle<TCollection_HAsciiString> DecodeVertexLoopError(const StepToTopoDS_TranslateVertexLoopError Error);

};


%extend StepToTopoDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepToTopoDS_GeometricTool *
***********************************/
class StepToTopoDS_GeometricTool {
	public:
		/****** StepToTopoDS_GeometricTool::IsLikeSeam ******/
		/****** md5 signature: 8679cc7de3782f930b4e1a99f45f83be ******/
		%feature("compactdefaultargs") IsLikeSeam;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_SurfaceCurve
S: StepGeom_Surface
E: StepShape_Edge
EL: StepShape_EdgeLoop

Return
-------
bool

Description
-----------
No available documentation.
") IsLikeSeam;
		static Standard_Boolean IsLikeSeam(const opencascade::handle<StepGeom_SurfaceCurve> & SC, const opencascade::handle<StepGeom_Surface> & S, const opencascade::handle<StepShape_Edge> & E, const opencascade::handle<StepShape_EdgeLoop> & EL);

		/****** StepToTopoDS_GeometricTool::IsSeamCurve ******/
		/****** md5 signature: bc0405a968c33fae0a13d6001e05f654 ******/
		%feature("compactdefaultargs") IsSeamCurve;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_SurfaceCurve
S: StepGeom_Surface
E: StepShape_Edge
EL: StepShape_EdgeLoop

Return
-------
bool

Description
-----------
No available documentation.
") IsSeamCurve;
		static Standard_Boolean IsSeamCurve(const opencascade::handle<StepGeom_SurfaceCurve> & SC, const opencascade::handle<StepGeom_Surface> & S, const opencascade::handle<StepShape_Edge> & E, const opencascade::handle<StepShape_EdgeLoop> & EL);

		/****** StepToTopoDS_GeometricTool::PCurve ******/
		/****** md5 signature: d9795b143e7c3626dd1864ca2e08f388 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_SurfaceCurve
S: StepGeom_Surface
PC: StepGeom_Pcurve
last: int (optional, default to 0)

Return
-------
int

Description
-----------
No available documentation.
") PCurve;
		static Standard_Integer PCurve(const opencascade::handle<StepGeom_SurfaceCurve> & SC, const opencascade::handle<StepGeom_Surface> & S, opencascade::handle<StepGeom_Pcurve> & PC, const Standard_Integer last = 0);

		/****** StepToTopoDS_GeometricTool::UpdateParam3d ******/
		/****** md5 signature: b718a006868f7ff304524fa58ad7846f ******/
		%feature("compactdefaultargs") UpdateParam3d;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
preci: float

Return
-------
w1: float
w2: float

Description
-----------
No available documentation.
") UpdateParam3d;
		static Standard_Boolean UpdateParam3d(const opencascade::handle<Geom_Curve> & C, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Real preci);

};


%extend StepToTopoDS_GeometricTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepToTopoDS_NMTool *
****************************/
class StepToTopoDS_NMTool {
	public:
		/****** StepToTopoDS_NMTool::StepToTopoDS_NMTool ******/
		/****** md5 signature: 8a7fb7b63397aa883e18cd7601fd9dc0 ******/
		%feature("compactdefaultargs") StepToTopoDS_NMTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_NMTool;
		 StepToTopoDS_NMTool();

		/****** StepToTopoDS_NMTool::StepToTopoDS_NMTool ******/
		/****** md5 signature: c00fee9bdc72c8f972685d998a33740d ******/
		%feature("compactdefaultargs") StepToTopoDS_NMTool;
		%feature("autodoc", "
Parameters
----------
MapOfRI: StepToTopoDS_DataMapOfRI
MapOfRINames: StepToTopoDS_DataMapOfRINames

Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_NMTool;
		 StepToTopoDS_NMTool(const StepToTopoDS_DataMapOfRI & MapOfRI, const StepToTopoDS_DataMapOfRINames & MapOfRINames);

		/****** StepToTopoDS_NMTool::Bind ******/
		/****** md5 signature: 0e1f9e51d96cb0b02f6de30681908e07 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
RI: StepRepr_RepresentationItem
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Bind;
		void Bind(const opencascade::handle<StepRepr_RepresentationItem> & RI, const TopoDS_Shape & S);

		/****** StepToTopoDS_NMTool::Bind ******/
		/****** md5 signature: e4d9798a62ddf4517cb0c0ae926f62fb ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
RIName: str
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Bind;
		void Bind(TCollection_AsciiString RIName, const TopoDS_Shape & S);

		/****** StepToTopoDS_NMTool::CleanUp ******/
		/****** md5 signature: f3a256cc048719bbee06926323c3a77c ******/
		%feature("compactdefaultargs") CleanUp;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") CleanUp;
		void CleanUp();

		/****** StepToTopoDS_NMTool::Find ******/
		/****** md5 signature: 41b58c9cb17ece127101e06f2746b3d9 ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
RI: StepRepr_RepresentationItem

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Find;
		const TopoDS_Shape Find(const opencascade::handle<StepRepr_RepresentationItem> & RI);

		/****** StepToTopoDS_NMTool::Find ******/
		/****** md5 signature: d0c0d2e124c08e23451667b20c927dbf ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
RIName: str

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Find;
		const TopoDS_Shape Find(TCollection_AsciiString RIName);

		/****** StepToTopoDS_NMTool::Init ******/
		/****** md5 signature: ef9b81781232fa5ed79ae79f4d4e8a14 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
MapOfRI: StepToTopoDS_DataMapOfRI
MapOfRINames: StepToTopoDS_DataMapOfRINames

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const StepToTopoDS_DataMapOfRI & MapOfRI, const StepToTopoDS_DataMapOfRINames & MapOfRINames);

		/****** StepToTopoDS_NMTool::IsActive ******/
		/****** md5 signature: 0ca6af43e1e5c31f31cae2bed4a28e09 ******/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsActive;
		Standard_Boolean IsActive();

		/****** StepToTopoDS_NMTool::IsBound ******/
		/****** md5 signature: e08f20c0a82c0ec3e65d80414ab167d8 ******/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "
Parameters
----------
RI: StepRepr_RepresentationItem

Return
-------
bool

Description
-----------
No available documentation.
") IsBound;
		Standard_Boolean IsBound(const opencascade::handle<StepRepr_RepresentationItem> & RI);

		/****** StepToTopoDS_NMTool::IsBound ******/
		/****** md5 signature: a0afe6290fba9e98e79003a4a77154d9 ******/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "
Parameters
----------
RIName: str

Return
-------
bool

Description
-----------
No available documentation.
") IsBound;
		Standard_Boolean IsBound(TCollection_AsciiString RIName);

		/****** StepToTopoDS_NMTool::IsIDEASCase ******/
		/****** md5 signature: cb4d1921b8ccac1de00b7adf6143ebbf ******/
		%feature("compactdefaultargs") IsIDEASCase;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsIDEASCase;
		Standard_Boolean IsIDEASCase();

		/****** StepToTopoDS_NMTool::IsPureNMShell ******/
		/****** md5 signature: c02b194ff295d3ed0926c9e34201611e ******/
		%feature("compactdefaultargs") IsPureNMShell;
		%feature("autodoc", "
Parameters
----------
Shell: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") IsPureNMShell;
		Standard_Boolean IsPureNMShell(const TopoDS_Shape & Shell);

		/****** StepToTopoDS_NMTool::IsSuspectedAsClosing ******/
		/****** md5 signature: 33012a3b2e76b3143c5496ff8ee156e4 ******/
		%feature("compactdefaultargs") IsSuspectedAsClosing;
		%feature("autodoc", "
Parameters
----------
BaseShell: TopoDS_Shape
SuspectedShell: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") IsSuspectedAsClosing;
		Standard_Boolean IsSuspectedAsClosing(const TopoDS_Shape & BaseShell, const TopoDS_Shape & SuspectedShell);

		/****** StepToTopoDS_NMTool::RegisterNMEdge ******/
		/****** md5 signature: 289ad7c7ef45ab4177fdb4383800e6eb ******/
		%feature("compactdefaultargs") RegisterNMEdge;
		%feature("autodoc", "
Parameters
----------
Edge: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") RegisterNMEdge;
		void RegisterNMEdge(const TopoDS_Shape & Edge);

		/****** StepToTopoDS_NMTool::SetActive ******/
		/****** md5 signature: 3358e8f54abcc6d559a2d43b25856b04 ******/
		%feature("compactdefaultargs") SetActive;
		%feature("autodoc", "
Parameters
----------
isActive: bool

Return
-------
None

Description
-----------
No available documentation.
") SetActive;
		void SetActive(const Standard_Boolean isActive);

		/****** StepToTopoDS_NMTool::SetIDEASCase ******/
		/****** md5 signature: cedc3302b7a18f309680ea12dc03ce1d ******/
		%feature("compactdefaultargs") SetIDEASCase;
		%feature("autodoc", "
Parameters
----------
IDEASCase: bool

Return
-------
None

Description
-----------
No available documentation.
") SetIDEASCase;
		void SetIDEASCase(const Standard_Boolean IDEASCase);

};


%extend StepToTopoDS_NMTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepToTopoDS_PointPair *
*******************************/
class StepToTopoDS_PointPair {
	public:
		/****** StepToTopoDS_PointPair::StepToTopoDS_PointPair ******/
		/****** md5 signature: 7284d27a9958c9cec16be257b5e8b5f6 ******/
		%feature("compactdefaultargs") StepToTopoDS_PointPair;
		%feature("autodoc", "
Parameters
----------
P1: StepGeom_CartesianPoint
P2: StepGeom_CartesianPoint

Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_PointPair;
		 StepToTopoDS_PointPair(const opencascade::handle<StepGeom_CartesianPoint> & P1, const opencascade::handle<StepGeom_CartesianPoint> & P2);

		/****** StepToTopoDS_PointPair::GetPoint1 ******/
		/****** md5 signature: 762e680df7b171f7aefd031bdf263f8f ******/
		%feature("compactdefaultargs") GetPoint1;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CartesianPoint>

Description
-----------
No available documentation.
") GetPoint1;
		const opencascade::handle<StepGeom_CartesianPoint> & GetPoint1();

		/****** StepToTopoDS_PointPair::GetPoint2 ******/
		/****** md5 signature: 02e97b5316a9c4451f94ed54bea2c26c ******/
		%feature("compactdefaultargs") GetPoint2;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CartesianPoint>

Description
-----------
No available documentation.
") GetPoint2;
		const opencascade::handle<StepGeom_CartesianPoint> & GetPoint2();


%extend{
    bool __eq_wrapper__(const StepToTopoDS_PointPair other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend StepToTopoDS_PointPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StepToTopoDS_Root *
**************************/
%nodefaultctor StepToTopoDS_Root;
class StepToTopoDS_Root {
	public:
		/****** StepToTopoDS_Root::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** StepToTopoDS_Root::MaxTol ******/
		/****** md5 signature: 0c3136ae5bf1b934384f3b243669f341 ******/
		%feature("compactdefaultargs") MaxTol;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of 'MaxTol'.
") MaxTol;
		Standard_Real MaxTol();

		/****** StepToTopoDS_Root::Precision ******/
		/****** md5 signature: 34c7e39bd57a685873eea74fa4629747 ******/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of 'MyPrecision'.
") Precision;
		Standard_Real Precision();

		/****** StepToTopoDS_Root::SetMaxTol ******/
		/****** md5 signature: 3f6da2f43671d4077fc62f3d70405103 ******/
		%feature("compactdefaultargs") SetMaxTol;
		%feature("autodoc", "
Parameters
----------
maxpreci: float

Return
-------
None

Description
-----------
Sets the value of MaxTol.
") SetMaxTol;
		void SetMaxTol(const Standard_Real maxpreci);

		/****** StepToTopoDS_Root::SetPrecision ******/
		/****** md5 signature: a601cf881702916ad1a5bcd1fec314c4 ******/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "
Parameters
----------
preci: float

Return
-------
None

Description
-----------
Sets the value of 'MyPrecision'.
") SetPrecision;
		void SetPrecision(const Standard_Real preci);

};


%extend StepToTopoDS_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StepToTopoDS_Tool *
**************************/
class StepToTopoDS_Tool {
	public:
		/****** StepToTopoDS_Tool::StepToTopoDS_Tool ******/
		/****** md5 signature: 37ddd00f4f3d89e89568df64cb1766ae ******/
		%feature("compactdefaultargs") StepToTopoDS_Tool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_Tool;
		 StepToTopoDS_Tool();

		/****** StepToTopoDS_Tool::StepToTopoDS_Tool ******/
		/****** md5 signature: 0e3019727b994e205f600dbbfb87a9d4 ******/
		%feature("compactdefaultargs") StepToTopoDS_Tool;
		%feature("autodoc", "
Parameters
----------
Map: StepToTopoDS_DataMapOfTRI
TP: Transfer_TransientProcess

Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_Tool;
		 StepToTopoDS_Tool(const StepToTopoDS_DataMapOfTRI & Map, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****** StepToTopoDS_Tool::AddContinuity ******/
		/****** md5 signature: 6bd98ccfa80e29978afa53b8e5391289 ******/
		%feature("compactdefaultargs") AddContinuity;
		%feature("autodoc", "
Parameters
----------
GeomSurf: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") AddContinuity;
		void AddContinuity(const opencascade::handle<Geom_Surface> & GeomSurf);

		/****** StepToTopoDS_Tool::AddContinuity ******/
		/****** md5 signature: 3dd755d2e434fd84b1e8ddbfa6b02515 ******/
		%feature("compactdefaultargs") AddContinuity;
		%feature("autodoc", "
Parameters
----------
GeomCurve: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") AddContinuity;
		void AddContinuity(const opencascade::handle<Geom_Curve> & GeomCurve);

		/****** StepToTopoDS_Tool::AddContinuity ******/
		/****** md5 signature: b35c992d7d0bafabfc21330d79f4392c ******/
		%feature("compactdefaultargs") AddContinuity;
		%feature("autodoc", "
Parameters
----------
GeomCur2d: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") AddContinuity;
		void AddContinuity(const opencascade::handle<Geom2d_Curve> & GeomCur2d);

		/****** StepToTopoDS_Tool::Bind ******/
		/****** md5 signature: 26d0bd5a0067d6f22f22bb4a056e4a27 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
TRI: StepShape_TopologicalRepresentationItem
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Bind;
		void Bind(const opencascade::handle<StepShape_TopologicalRepresentationItem> & TRI, const TopoDS_Shape & S);

		/****** StepToTopoDS_Tool::BindEdge ******/
		/****** md5 signature: 6bbff798f80940386071b572b53645bb ******/
		%feature("compactdefaultargs") BindEdge;
		%feature("autodoc", "
Parameters
----------
PP: StepToTopoDS_PointPair
E: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") BindEdge;
		void BindEdge(const StepToTopoDS_PointPair & PP, const TopoDS_Edge & E);

		/****** StepToTopoDS_Tool::BindVertex ******/
		/****** md5 signature: 8cf1569a233a895e015a7bc9d0c12abc ******/
		%feature("compactdefaultargs") BindVertex;
		%feature("autodoc", "
Parameters
----------
P: StepGeom_CartesianPoint
V: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BindVertex;
		void BindVertex(const opencascade::handle<StepGeom_CartesianPoint> & P, const TopoDS_Vertex & V);

		/****** StepToTopoDS_Tool::C0Cur2 ******/
		/****** md5 signature: 9a3c8d2a52e73c10476694616729c501 ******/
		%feature("compactdefaultargs") C0Cur2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") C0Cur2;
		Standard_Integer C0Cur2();

		/****** StepToTopoDS_Tool::C0Cur3 ******/
		/****** md5 signature: 4b70fd03acd100a17ceac3467f643b9f ******/
		%feature("compactdefaultargs") C0Cur3;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") C0Cur3;
		Standard_Integer C0Cur3();

		/****** StepToTopoDS_Tool::C0Surf ******/
		/****** md5 signature: 1d1f443b87aa9f4c8fdaca9dcd415125 ******/
		%feature("compactdefaultargs") C0Surf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") C0Surf;
		Standard_Integer C0Surf();

		/****** StepToTopoDS_Tool::C1Cur2 ******/
		/****** md5 signature: 5165103cea6ca16472978a608fac6da2 ******/
		%feature("compactdefaultargs") C1Cur2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") C1Cur2;
		Standard_Integer C1Cur2();

		/****** StepToTopoDS_Tool::C1Cur3 ******/
		/****** md5 signature: ed9f826927d7d364767f1dc6cd6dbedb ******/
		%feature("compactdefaultargs") C1Cur3;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") C1Cur3;
		Standard_Integer C1Cur3();

		/****** StepToTopoDS_Tool::C1Surf ******/
		/****** md5 signature: c3dd392675d3c9f4bd535e84e79bfed0 ******/
		%feature("compactdefaultargs") C1Surf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") C1Surf;
		Standard_Integer C1Surf();

		/****** StepToTopoDS_Tool::C2Cur2 ******/
		/****** md5 signature: 33bfbc0a9b43a47d4de6aae761d4bfcd ******/
		%feature("compactdefaultargs") C2Cur2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") C2Cur2;
		Standard_Integer C2Cur2();

		/****** StepToTopoDS_Tool::C2Cur3 ******/
		/****** md5 signature: 5ea4af3965ebfad4d7252ae1d29b610c ******/
		%feature("compactdefaultargs") C2Cur3;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") C2Cur3;
		Standard_Integer C2Cur3();

		/****** StepToTopoDS_Tool::C2Surf ******/
		/****** md5 signature: 44c8e649ffd1799e17d180e6d1c0a50b ******/
		%feature("compactdefaultargs") C2Surf;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") C2Surf;
		Standard_Integer C2Surf();

		/****** StepToTopoDS_Tool::ClearEdgeMap ******/
		/****** md5 signature: df4ff618308a41b0936dbfff4eb45a43 ******/
		%feature("compactdefaultargs") ClearEdgeMap;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearEdgeMap;
		void ClearEdgeMap();

		/****** StepToTopoDS_Tool::ClearVertexMap ******/
		/****** md5 signature: 4532b934dfe6cbf1bf08d3c04bf6a888 ******/
		%feature("compactdefaultargs") ClearVertexMap;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearVertexMap;
		void ClearVertexMap();

		/****** StepToTopoDS_Tool::ComputePCurve ******/
		/****** md5 signature: 7b637da529b500d53a5464e6f1fbd737 ******/
		%feature("compactdefaultargs") ComputePCurve;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") ComputePCurve;
		void ComputePCurve(const Standard_Boolean B);

		/****** StepToTopoDS_Tool::ComputePCurve ******/
		/****** md5 signature: 74d11cdda39e479e1084d7acd1e233ab ******/
		%feature("compactdefaultargs") ComputePCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ComputePCurve;
		Standard_Boolean ComputePCurve();

		/****** StepToTopoDS_Tool::Find ******/
		/****** md5 signature: 07990a09985772dd69645bed88d612b9 ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
TRI: StepShape_TopologicalRepresentationItem

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Find;
		const TopoDS_Shape Find(const opencascade::handle<StepShape_TopologicalRepresentationItem> & TRI);

		/****** StepToTopoDS_Tool::FindEdge ******/
		/****** md5 signature: b8111e1d4706b5ae6529116af61f4855 ******/
		%feature("compactdefaultargs") FindEdge;
		%feature("autodoc", "
Parameters
----------
PP: StepToTopoDS_PointPair

Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") FindEdge;
		const TopoDS_Edge FindEdge(const StepToTopoDS_PointPair & PP);

		/****** StepToTopoDS_Tool::FindVertex ******/
		/****** md5 signature: fa6b0cae3dc78456dca625eec6293582 ******/
		%feature("compactdefaultargs") FindVertex;
		%feature("autodoc", "
Parameters
----------
P: StepGeom_CartesianPoint

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") FindVertex;
		const TopoDS_Vertex FindVertex(const opencascade::handle<StepGeom_CartesianPoint> & P);

		/****** StepToTopoDS_Tool::Init ******/
		/****** md5 signature: 38779a42bc009839efb56b7c461bec15 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Map: StepToTopoDS_DataMapOfTRI
TP: Transfer_TransientProcess

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const StepToTopoDS_DataMapOfTRI & Map, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****** StepToTopoDS_Tool::IsBound ******/
		/****** md5 signature: c5355b23030d16e694b385e8d1d07943 ******/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "
Parameters
----------
TRI: StepShape_TopologicalRepresentationItem

Return
-------
bool

Description
-----------
No available documentation.
") IsBound;
		Standard_Boolean IsBound(const opencascade::handle<StepShape_TopologicalRepresentationItem> & TRI);

		/****** StepToTopoDS_Tool::IsEdgeBound ******/
		/****** md5 signature: 757cdba30731313e735cd951daf5f42d ******/
		%feature("compactdefaultargs") IsEdgeBound;
		%feature("autodoc", "
Parameters
----------
PP: StepToTopoDS_PointPair

Return
-------
bool

Description
-----------
No available documentation.
") IsEdgeBound;
		Standard_Boolean IsEdgeBound(const StepToTopoDS_PointPair & PP);

		/****** StepToTopoDS_Tool::IsVertexBound ******/
		/****** md5 signature: 4e0a89f426cdea92ba4121657ac5c75f ******/
		%feature("compactdefaultargs") IsVertexBound;
		%feature("autodoc", "
Parameters
----------
PG: StepGeom_CartesianPoint

Return
-------
bool

Description
-----------
No available documentation.
") IsVertexBound;
		Standard_Boolean IsVertexBound(const opencascade::handle<StepGeom_CartesianPoint> & PG);

		/****** StepToTopoDS_Tool::TransientProcess ******/
		/****** md5 signature: cda5aa33365159e82c6213003de44419 ******/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_TransientProcess>

Description
-----------
No available documentation.
") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess();

};


%extend StepToTopoDS_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class hash<StepToTopoDS_PointPair> *
*************************************/
/*****************************
* class StepToTopoDS_Builder *
*****************************/
/*************************************
* class StepToTopoDS_MakeTransformed *
*************************************/
class StepToTopoDS_MakeTransformed : public StepToTopoDS_Root {
	public:
		/****** StepToTopoDS_MakeTransformed::StepToTopoDS_MakeTransformed ******/
		/****** md5 signature: e017844d82ed89c10dab9aa8462b786b ******/
		%feature("compactdefaultargs") StepToTopoDS_MakeTransformed;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_MakeTransformed;
		 StepToTopoDS_MakeTransformed();

		/****** StepToTopoDS_MakeTransformed::Compute ******/
		/****** md5 signature: 5cd7e1c6855232730bec321c83e33cc9 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
Origin: StepGeom_Axis2Placement3d
Target: StepGeom_Axis2Placement3d
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
bool

Description
-----------
Computes a transformation to pass from an Origin placement to a Target placement. Returns True when done If not done, the transformation will by Identity.
") Compute;
		Standard_Boolean Compute(const opencascade::handle<StepGeom_Axis2Placement3d> & Origin, const opencascade::handle<StepGeom_Axis2Placement3d> & Target, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_MakeTransformed::Compute ******/
		/****** md5 signature: 1470c41ebaa70d29191869fc016e5854 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
Operator: StepGeom_CartesianTransformationOperator3d
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
bool

Description
-----------
Computes a transformation defined by an operator 3D.
") Compute;
		Standard_Boolean Compute(const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & Operator, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_MakeTransformed::Transform ******/
		/****** md5 signature: ae541322c2f3f8d7777b0df5eb5a3d2d ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
bool

Description
-----------
Applies the computed transformation to a shape Returns False if the transformation is Identity.
") Transform;
		Standard_Boolean Transform(TopoDS_Shape & shape);

		/****** StepToTopoDS_MakeTransformed::Transformation ******/
		/****** md5 signature: 567e6ee373139970f4679dbb49e28e7c ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the computed transformation (Identity if not yet or if failed).
") Transformation;
		const gp_Trsf Transformation();

		/****** StepToTopoDS_MakeTransformed::TranslateMappedItem ******/
		/****** md5 signature: 7ea6e39684fd9dce318c0cb002b1f7ec ******/
		%feature("compactdefaultargs") TranslateMappedItem;
		%feature("autodoc", "
Parameters
----------
mapit: StepRepr_MappedItem
TP: Transfer_TransientProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
TopoDS_Shape

Description
-----------
Translates a MappedItem. More precisely A MappedItem has a MappingSource and a MappingTarget MappingSource has a MappedRepresentation and a MappingOrigin MappedRepresentation is the basic item to be instanced MappingOrigin is the starting placement MappingTarget is the final placement //! Hence, the transformation from MappingOrigin and MappingTarget is computed, the MappedRepr. is converted to a Shape, then transformed as an instance of this Shape.
") TranslateMappedItem;
		TopoDS_Shape TranslateMappedItem(const opencascade::handle<StepRepr_MappedItem> & mapit, const opencascade::handle<Transfer_TransientProcess> & TP, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend StepToTopoDS_MakeTransformed {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepToTopoDS_TranslateCompositeCurve *
*********************************************/
class StepToTopoDS_TranslateCompositeCurve : public StepToTopoDS_Root {
	public:
		/****** StepToTopoDS_TranslateCompositeCurve::StepToTopoDS_TranslateCompositeCurve ******/
		/****** md5 signature: 6257d03934cc757cf941eeb16439ba16 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateCompositeCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepToTopoDS_TranslateCompositeCurve;
		 StepToTopoDS_TranslateCompositeCurve();

		/****** StepToTopoDS_TranslateCompositeCurve::StepToTopoDS_TranslateCompositeCurve ******/
		/****** md5 signature: fedb86982be7efe3d21febabb6803bbf ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateCompositeCurve;
		%feature("autodoc", "
Parameters
----------
CC: StepGeom_CompositeCurve
TP: Transfer_TransientProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
Translates standalone composite_curve.
") StepToTopoDS_TranslateCompositeCurve;
		 StepToTopoDS_TranslateCompositeCurve(const opencascade::handle<StepGeom_CompositeCurve> & CC, const opencascade::handle<Transfer_TransientProcess> & TP, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateCompositeCurve::StepToTopoDS_TranslateCompositeCurve ******/
		/****** md5 signature: cd23a87497f350ec66c1e0589ab3a5a6 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateCompositeCurve;
		%feature("autodoc", "
Parameters
----------
CC: StepGeom_CompositeCurve
TP: Transfer_TransientProcess
S: StepGeom_Surface
Surf: Geom_Surface
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
Translates composite_curve lying on surface.
") StepToTopoDS_TranslateCompositeCurve;
		 StepToTopoDS_TranslateCompositeCurve(const opencascade::handle<StepGeom_CompositeCurve> & CC, const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<StepGeom_Surface> & S, const opencascade::handle<Geom_Surface> & Surf, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateCompositeCurve::Init ******/
		/****** md5 signature: f12819ffc5b90666db7d8cc2a451bd03 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
CC: StepGeom_CompositeCurve
TP: Transfer_TransientProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
bool

Description
-----------
Translates standalone composite_curve.
") Init;
		Standard_Boolean Init(const opencascade::handle<StepGeom_CompositeCurve> & CC, const opencascade::handle<Transfer_TransientProcess> & TP, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateCompositeCurve::Init ******/
		/****** md5 signature: b39e75f0123ac30e0dda52f7e3ccd40b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
CC: StepGeom_CompositeCurve
TP: Transfer_TransientProcess
S: StepGeom_Surface
Surf: Geom_Surface
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
bool

Description
-----------
Translates composite_curve lying on surface.
") Init;
		Standard_Boolean Init(const opencascade::handle<StepGeom_CompositeCurve> & CC, const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<StepGeom_Surface> & S, const opencascade::handle<Geom_Surface> & Surf, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateCompositeCurve::IsInfiniteSegment ******/
		/****** md5 signature: be0b48bb5bf6dd8b382853323416d189 ******/
		%feature("compactdefaultargs") IsInfiniteSegment;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if composite_curve contains a segment with infinite parameters.
") IsInfiniteSegment;
		Standard_Boolean IsInfiniteSegment();

		/****** StepToTopoDS_TranslateCompositeCurve::Value ******/
		/****** md5 signature: eb9143e5c5c30ac8712cf3bfb04cba14 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns result of last translation or null wire if failed.
") Value;
		const TopoDS_Wire Value();

};


%extend StepToTopoDS_TranslateCompositeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepToTopoDS_TranslateCurveBoundedSurface *
**************************************************/
class StepToTopoDS_TranslateCurveBoundedSurface : public StepToTopoDS_Root {
	public:
		/****** StepToTopoDS_TranslateCurveBoundedSurface::StepToTopoDS_TranslateCurveBoundedSurface ******/
		/****** md5 signature: b546faeadcbb5cf9880e5ea86c03f574 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateCurveBoundedSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create empty tool.
") StepToTopoDS_TranslateCurveBoundedSurface;
		 StepToTopoDS_TranslateCurveBoundedSurface();

		/****** StepToTopoDS_TranslateCurveBoundedSurface::StepToTopoDS_TranslateCurveBoundedSurface ******/
		/****** md5 signature: 517f1848045ec7dc69cc7f6eba397f49 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateCurveBoundedSurface;
		%feature("autodoc", "
Parameters
----------
CBS: StepGeom_CurveBoundedSurface
TP: Transfer_TransientProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
Translate surface.
") StepToTopoDS_TranslateCurveBoundedSurface;
		 StepToTopoDS_TranslateCurveBoundedSurface(const opencascade::handle<StepGeom_CurveBoundedSurface> & CBS, const opencascade::handle<Transfer_TransientProcess> & TP, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateCurveBoundedSurface::Init ******/
		/****** md5 signature: 02dabe9fafa9aed159ba1e4abfed9464 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
CBS: StepGeom_CurveBoundedSurface
TP: Transfer_TransientProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
bool

Description
-----------
Translate surface.
") Init;
		Standard_Boolean Init(const opencascade::handle<StepGeom_CurveBoundedSurface> & CBS, const opencascade::handle<Transfer_TransientProcess> & TP, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateCurveBoundedSurface::Value ******/
		/****** md5 signature: b5b497eab24ec930cccd989e4142789f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns result of last translation or null wire if failed.
") Value;
		const TopoDS_Face Value();

};


%extend StepToTopoDS_TranslateCurveBoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepToTopoDS_TranslateEdge *
***********************************/
class StepToTopoDS_TranslateEdge : public StepToTopoDS_Root {
	public:
		/****** StepToTopoDS_TranslateEdge::StepToTopoDS_TranslateEdge ******/
		/****** md5 signature: 67f1752d7e20a192995a7282c080bdb5 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslateEdge;
		 StepToTopoDS_TranslateEdge();

		/****** StepToTopoDS_TranslateEdge::StepToTopoDS_TranslateEdge ******/
		/****** md5 signature: 1b6d3c73ca7fadceef5c60ad8f38a2b2 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdge;
		%feature("autodoc", "
Parameters
----------
E: StepShape_Edge
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslateEdge;
		 StepToTopoDS_TranslateEdge(const opencascade::handle<StepShape_Edge> & E, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateEdge::Error ******/
		/****** md5 signature: 7959af5964376dbce1968ae8ef06cbcb ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
StepToTopoDS_TranslateEdgeError

Description
-----------
No available documentation.
") Error;
		StepToTopoDS_TranslateEdgeError Error();

		/****** StepToTopoDS_TranslateEdge::Init ******/
		/****** md5 signature: 03396f596ca8bbf71ff182475b06081e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
E: StepShape_Edge
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepShape_Edge> & E, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateEdge::MakeFromCurve3D ******/
		/****** md5 signature: 4a83fad499df6e0a4548c3e5701bac04 ******/
		%feature("compactdefaultargs") MakeFromCurve3D;
		%feature("autodoc", "
Parameters
----------
C3D: StepGeom_Curve
EC: StepShape_EdgeCurve
Vend: StepShape_Vertex
preci: float
E: TopoDS_Edge
V1: TopoDS_Vertex
V2: TopoDS_Vertex
T: StepToTopoDS_Tool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
Warning! C3D is assumed to be a Curve 3D ... other cases to checked before calling this.
") MakeFromCurve3D;
		void MakeFromCurve3D(const opencascade::handle<StepGeom_Curve> & C3D, const opencascade::handle<StepShape_EdgeCurve> & EC, const opencascade::handle<StepShape_Vertex> & Vend, const Standard_Real preci, TopoDS_Edge & E, TopoDS_Vertex & V1, TopoDS_Vertex & V2, StepToTopoDS_Tool & T, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateEdge::MakePCurve ******/
		/****** md5 signature: 5664428a49342e7b43f833222fd3d277 ******/
		%feature("compactdefaultargs") MakePCurve;
		%feature("autodoc", "
Parameters
----------
PCU: StepGeom_Pcurve
ConvSurf: Geom_Surface
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") MakePCurve;
		opencascade::handle<Geom2d_Curve> MakePCurve(const opencascade::handle<StepGeom_Pcurve> & PCU, const opencascade::handle<Geom_Surface> & ConvSurf, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateEdge::Value ******/
		/****** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Value;
		const TopoDS_Shape Value();

};


%extend StepToTopoDS_TranslateEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepToTopoDS_TranslateEdgeLoop *
***************************************/
class StepToTopoDS_TranslateEdgeLoop : public StepToTopoDS_Root {
	public:
		/****** StepToTopoDS_TranslateEdgeLoop::StepToTopoDS_TranslateEdgeLoop ******/
		/****** md5 signature: 3c19b5dcaa2b6dabda6b6c90ff860d43 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdgeLoop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslateEdgeLoop;
		 StepToTopoDS_TranslateEdgeLoop();

		/****** StepToTopoDS_TranslateEdgeLoop::StepToTopoDS_TranslateEdgeLoop ******/
		/****** md5 signature: b69c84ac9076d785a81a11fa0ca071a7 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdgeLoop;
		%feature("autodoc", "
Parameters
----------
FB: StepShape_FaceBound
F: TopoDS_Face
S: Geom_Surface
SS: StepGeom_Surface
ss: bool
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslateEdgeLoop;
		 StepToTopoDS_TranslateEdgeLoop(const opencascade::handle<StepShape_FaceBound> & FB, const TopoDS_Face & F, const opencascade::handle<Geom_Surface> & S, const opencascade::handle<StepGeom_Surface> & SS, const Standard_Boolean ss, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateEdgeLoop::Error ******/
		/****** md5 signature: 972d261b46108646d94d6f19a66c3792 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
StepToTopoDS_TranslateEdgeLoopError

Description
-----------
No available documentation.
") Error;
		StepToTopoDS_TranslateEdgeLoopError Error();

		/****** StepToTopoDS_TranslateEdgeLoop::Init ******/
		/****** md5 signature: a241387537f09f0e196b6072c89dae01 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
FB: StepShape_FaceBound
F: TopoDS_Face
S: Geom_Surface
SS: StepGeom_Surface
ss: bool
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepShape_FaceBound> & FB, const TopoDS_Face & F, const opencascade::handle<Geom_Surface> & S, const opencascade::handle<StepGeom_Surface> & SS, const Standard_Boolean ss, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateEdgeLoop::Value ******/
		/****** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Value;
		const TopoDS_Shape Value();

};


%extend StepToTopoDS_TranslateEdgeLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepToTopoDS_TranslateFace *
***********************************/
class StepToTopoDS_TranslateFace : public StepToTopoDS_Root {
	public:
		/****** StepToTopoDS_TranslateFace::StepToTopoDS_TranslateFace ******/
		/****** md5 signature: fe774e5c33e076954c36e443cd166036 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslateFace;
		 StepToTopoDS_TranslateFace();

		/****** StepToTopoDS_TranslateFace::StepToTopoDS_TranslateFace ******/
		/****** md5 signature: 0b53dddeffb51ab747c4b588191808eb ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateFace;
		%feature("autodoc", "
Parameters
----------
FS: StepShape_FaceSurface
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslateFace;
		 StepToTopoDS_TranslateFace(const opencascade::handle<StepShape_FaceSurface> & FS, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateFace::StepToTopoDS_TranslateFace ******/
		/****** md5 signature: 20c63c8c7b7431286d2ad3734f4533c4 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateFace;
		%feature("autodoc", "
Parameters
----------
theTF: StepVisual_TessellatedFace
theTool: StepToTopoDS_Tool
theNMTool: StepToTopoDS_NMTool
theReadTessellatedWhenNoBRepOnly: bool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
theHasGeom: bool

Description
-----------
No available documentation.
") StepToTopoDS_TranslateFace;
		 StepToTopoDS_TranslateFace(const opencascade::handle<StepVisual_TessellatedFace> & theTF, StepToTopoDS_Tool & theTool, StepToTopoDS_NMTool & theNMTool, const Standard_Boolean theReadTessellatedWhenNoBRepOnly, Standard_Boolean &OutValue, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateFace::StepToTopoDS_TranslateFace ******/
		/****** md5 signature: 191744b86b3b1d4835c95065fd16b27c ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateFace;
		%feature("autodoc", "
Parameters
----------
theTSS: StepVisual_TessellatedSurfaceSet
theTool: StepToTopoDS_Tool
theNMTool: StepToTopoDS_NMTool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslateFace;
		 StepToTopoDS_TranslateFace(const opencascade::handle<StepVisual_TessellatedSurfaceSet> & theTSS, StepToTopoDS_Tool & theTool, StepToTopoDS_NMTool & theNMTool, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateFace::Error ******/
		/****** md5 signature: d8d7070b3c140555673282970df02982 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
StepToTopoDS_TranslateFaceError

Description
-----------
No available documentation.
") Error;
		StepToTopoDS_TranslateFaceError Error();

		/****** StepToTopoDS_TranslateFace::Init ******/
		/****** md5 signature: 7a40633bd2ccc722de211015597b9c6f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theFaceSurface: StepShape_FaceSurface
theTopoDSTool: StepToTopoDS_Tool
theTopoDSToolNM: StepToTopoDS_NMTool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepShape_FaceSurface> & theFaceSurface, StepToTopoDS_Tool & theTopoDSTool, StepToTopoDS_NMTool & theTopoDSToolNM, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateFace::Init ******/
		/****** md5 signature: f8b1ddb204d420d9a75edda6910f8f51 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theTF: StepVisual_TessellatedFace
theTool: StepToTopoDS_Tool
theNMTool: StepToTopoDS_NMTool
theReadTessellatedWhenNoBRepOnly: bool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
theHasGeom: bool

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_TessellatedFace> & theTF, StepToTopoDS_Tool & theTool, StepToTopoDS_NMTool & theNMTool, const Standard_Boolean theReadTessellatedWhenNoBRepOnly, Standard_Boolean &OutValue, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateFace::Init ******/
		/****** md5 signature: 63f60feaa0826c9bc433b1ae9858c91d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theTSS: StepVisual_TessellatedSurfaceSet
theTool: StepToTopoDS_Tool
theNMTool: StepToTopoDS_NMTool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_TessellatedSurfaceSet> & theTSS, StepToTopoDS_Tool & theTool, StepToTopoDS_NMTool & theNMTool, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateFace::Value ******/
		/****** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Value;
		const TopoDS_Shape Value();

};


%extend StepToTopoDS_TranslateFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepToTopoDS_TranslatePolyLoop *
***************************************/
class StepToTopoDS_TranslatePolyLoop : public StepToTopoDS_Root {
	public:
		/****** StepToTopoDS_TranslatePolyLoop::StepToTopoDS_TranslatePolyLoop ******/
		/****** md5 signature: 6815f851fee46c2ec164f46ad6a5c770 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslatePolyLoop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslatePolyLoop;
		 StepToTopoDS_TranslatePolyLoop();

		/****** StepToTopoDS_TranslatePolyLoop::StepToTopoDS_TranslatePolyLoop ******/
		/****** md5 signature: 2d5172ae951ea308fc8b86512eec110c ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslatePolyLoop;
		%feature("autodoc", "
Parameters
----------
PL: StepShape_PolyLoop
T: StepToTopoDS_Tool
S: Geom_Surface
F: TopoDS_Face
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslatePolyLoop;
		 StepToTopoDS_TranslatePolyLoop(const opencascade::handle<StepShape_PolyLoop> & PL, StepToTopoDS_Tool & T, const opencascade::handle<Geom_Surface> & S, const TopoDS_Face & F, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslatePolyLoop::Error ******/
		/****** md5 signature: 962c2106db55809a22bc9095ee479fa7 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
StepToTopoDS_TranslatePolyLoopError

Description
-----------
No available documentation.
") Error;
		StepToTopoDS_TranslatePolyLoopError Error();

		/****** StepToTopoDS_TranslatePolyLoop::Init ******/
		/****** md5 signature: c979ccce26bc3163ed084f9861304325 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
PL: StepShape_PolyLoop
T: StepToTopoDS_Tool
S: Geom_Surface
F: TopoDS_Face
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepShape_PolyLoop> & PL, StepToTopoDS_Tool & T, const opencascade::handle<Geom_Surface> & S, const TopoDS_Face & F, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslatePolyLoop::Value ******/
		/****** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Value;
		const TopoDS_Shape Value();

};


%extend StepToTopoDS_TranslatePolyLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepToTopoDS_TranslateShell *
************************************/
class StepToTopoDS_TranslateShell : public StepToTopoDS_Root {
	public:
		/****** StepToTopoDS_TranslateShell::StepToTopoDS_TranslateShell ******/
		/****** md5 signature: af07629395766e1161453a2892bab3e5 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateShell;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslateShell;
		 StepToTopoDS_TranslateShell();

		/****** StepToTopoDS_TranslateShell::Error ******/
		/****** md5 signature: fa654c6e3e1001e67d10206a2c654b17 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
StepToTopoDS_TranslateShellError

Description
-----------
No available documentation.
") Error;
		StepToTopoDS_TranslateShellError Error();

		/****** StepToTopoDS_TranslateShell::Init ******/
		/****** md5 signature: c9991958b569a1aef542a58476bee4c9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
CFS: StepShape_ConnectedFaceSet
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepShape_ConnectedFaceSet> & CFS, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** StepToTopoDS_TranslateShell::Init ******/
		/****** md5 signature: c995c3ed6c5b6ddec51ddd1747572b5a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theTSh: StepVisual_TessellatedShell
theTool: StepToTopoDS_Tool
theNMTool: StepToTopoDS_NMTool
theReadTessellatedWhenNoBRepOnly: bool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
theHasGeom: bool

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_TessellatedShell> & theTSh, StepToTopoDS_Tool & theTool, StepToTopoDS_NMTool & theNMTool, const Standard_Boolean theReadTessellatedWhenNoBRepOnly, Standard_Boolean &OutValue, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** StepToTopoDS_TranslateShell::Value ******/
		/****** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Value;
		const TopoDS_Shape Value();

};


%extend StepToTopoDS_TranslateShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepToTopoDS_TranslateSolid *
************************************/
class StepToTopoDS_TranslateSolid : public StepToTopoDS_Root {
	public:
		/****** StepToTopoDS_TranslateSolid::StepToTopoDS_TranslateSolid ******/
		/****** md5 signature: a1bc59a82f7fc42c5d1fbed6c7a86f9d ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslateSolid;
		 StepToTopoDS_TranslateSolid();

		/****** StepToTopoDS_TranslateSolid::Error ******/
		/****** md5 signature: 182aa85674e767b1a95f9e67d85aa82e ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
StepToTopoDS_TranslateSolidError

Description
-----------
No available documentation.
") Error;
		StepToTopoDS_TranslateSolidError Error();

		/****** StepToTopoDS_TranslateSolid::Init ******/
		/****** md5 signature: 87f802daa9b96fd3345170a5c29381ae ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theTSo: StepVisual_TessellatedSolid
theTP: Transfer_TransientProcess
theTool: StepToTopoDS_Tool
theNMTool: StepToTopoDS_NMTool
theReadTessellatedWhenNoBRepOnly: bool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
theHasGeom: bool

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_TessellatedSolid> & theTSo, const opencascade::handle<Transfer_TransientProcess> & theTP, StepToTopoDS_Tool & theTool, StepToTopoDS_NMTool & theNMTool, const Standard_Boolean theReadTessellatedWhenNoBRepOnly, Standard_Boolean &OutValue, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** StepToTopoDS_TranslateSolid::Value ******/
		/****** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Value;
		const TopoDS_Shape Value();

};


%extend StepToTopoDS_TranslateSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepToTopoDS_TranslateVertex *
*************************************/
class StepToTopoDS_TranslateVertex : public StepToTopoDS_Root {
	public:
		/****** StepToTopoDS_TranslateVertex::StepToTopoDS_TranslateVertex ******/
		/****** md5 signature: 5cdb5f6424559263f1047127f97964d5 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslateVertex;
		 StepToTopoDS_TranslateVertex();

		/****** StepToTopoDS_TranslateVertex::StepToTopoDS_TranslateVertex ******/
		/****** md5 signature: 8186c206dd3b21a50afb29f08c0700e6 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertex;
		%feature("autodoc", "
Parameters
----------
V: StepShape_Vertex
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslateVertex;
		 StepToTopoDS_TranslateVertex(const opencascade::handle<StepShape_Vertex> & V, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateVertex::Error ******/
		/****** md5 signature: ce1730d22af9104c4c4fb1b6d3448148 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
StepToTopoDS_TranslateVertexError

Description
-----------
No available documentation.
") Error;
		StepToTopoDS_TranslateVertexError Error();

		/****** StepToTopoDS_TranslateVertex::Init ******/
		/****** md5 signature: 56fb258930816e103c4ca26c36ce88f2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
V: StepShape_Vertex
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepShape_Vertex> & V, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateVertex::Value ******/
		/****** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Value;
		const TopoDS_Shape Value();

};


%extend StepToTopoDS_TranslateVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepToTopoDS_TranslateVertexLoop *
*****************************************/
class StepToTopoDS_TranslateVertexLoop : public StepToTopoDS_Root {
	public:
		/****** StepToTopoDS_TranslateVertexLoop::StepToTopoDS_TranslateVertexLoop ******/
		/****** md5 signature: ad56fa19c94f4aceb198b1be577f32c2 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertexLoop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslateVertexLoop;
		 StepToTopoDS_TranslateVertexLoop();

		/****** StepToTopoDS_TranslateVertexLoop::StepToTopoDS_TranslateVertexLoop ******/
		/****** md5 signature: 58e82aed351df4288ad89cf2e11784d8 ******/
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertexLoop;
		%feature("autodoc", "
Parameters
----------
VL: StepShape_VertexLoop
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") StepToTopoDS_TranslateVertexLoop;
		 StepToTopoDS_TranslateVertexLoop(const opencascade::handle<StepShape_VertexLoop> & VL, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateVertexLoop::Error ******/
		/****** md5 signature: 60bfd24853f7287af19ff4ca1ce94fd9 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
StepToTopoDS_TranslateVertexLoopError

Description
-----------
No available documentation.
") Error;
		StepToTopoDS_TranslateVertexLoopError Error();

		/****** StepToTopoDS_TranslateVertexLoop::Init ******/
		/****** md5 signature: 72cbbf5a5d7d4445e9b0f408aecae6ed ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
VL: StepShape_VertexLoop
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepShape_VertexLoop> & VL, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** StepToTopoDS_TranslateVertexLoop::Value ******/
		/****** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Value;
		const TopoDS_Shape Value();

};


%extend StepToTopoDS_TranslateVertexLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class StepToTopoDS_Builder:
	pass

@classnotwrapped
class StepToTopoDS_PointVertexMap:
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
def steptotopods_DecodeBuilderError(*args):
	return steptotopods.DecodeBuilderError(*args)

@deprecated
def steptotopods_DecodeEdgeError(*args):
	return steptotopods.DecodeEdgeError(*args)

@deprecated
def steptotopods_DecodeFaceError(*args):
	return steptotopods.DecodeFaceError(*args)

@deprecated
def steptotopods_DecodeGeometricToolError(*args):
	return steptotopods.DecodeGeometricToolError(*args)

@deprecated
def steptotopods_DecodePolyLoopError(*args):
	return steptotopods.DecodePolyLoopError(*args)

@deprecated
def steptotopods_DecodeShellError(*args):
	return steptotopods.DecodeShellError(*args)

@deprecated
def steptotopods_DecodeVertexError(*args):
	return steptotopods.DecodeVertexError(*args)

@deprecated
def steptotopods_DecodeVertexLoopError(*args):
	return steptotopods.DecodeVertexLoopError(*args)

@deprecated
def StepToTopoDS_GeometricTool_IsLikeSeam(*args):
	return StepToTopoDS_GeometricTool.IsLikeSeam(*args)

@deprecated
def StepToTopoDS_GeometricTool_IsSeamCurve(*args):
	return StepToTopoDS_GeometricTool.IsSeamCurve(*args)

@deprecated
def StepToTopoDS_GeometricTool_PCurve(*args):
	return StepToTopoDS_GeometricTool.PCurve(*args)

@deprecated
def StepToTopoDS_GeometricTool_UpdateParam3d(*args):
	return StepToTopoDS_GeometricTool.UpdateParam3d(*args)

}
