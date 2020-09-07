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
%define STEPTOTOPODSDOCSTRING
"StepToTopoDS module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_steptotopods.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<StepToTopoDS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepRepr_module.hxx>
#include<StepGeom_module.hxx>
#include<StepShape_module.hxx>
#include<TCollection_module.hxx>
#include<Geom_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Transfer_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<Interface_module.hxx>
#include<TopLoc_module.hxx>
#include<Transfer_module.hxx>
#include<StepData_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepRepr.i
%import StepGeom.i
%import StepShape.i
%import TCollection.i
%import Geom.i
%import TopoDS.i
%import gp.i
%import Transfer.i
%import Geom2d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum StepToTopoDS_GeometricToolError {
	StepToTopoDS_GeometricToolDone = 0,
	StepToTopoDS_GeometricToolIsDegenerated = 1,
	StepToTopoDS_GeometricToolHasNoPCurve = 2,
	StepToTopoDS_GeometricToolWrong3dParameters = 3,
	StepToTopoDS_GeometricToolNoProjectiOnCurve = 4,
	StepToTopoDS_GeometricToolOther = 5,
};

enum StepToTopoDS_TranslateShellError {
	StepToTopoDS_TranslateShellDone = 0,
	StepToTopoDS_TranslateShellOther = 1,
};

enum StepToTopoDS_TranslatePolyLoopError {
	StepToTopoDS_TranslatePolyLoopDone = 0,
	StepToTopoDS_TranslatePolyLoopOther = 1,
};

enum StepToTopoDS_TranslateEdgeError {
	StepToTopoDS_TranslateEdgeDone = 0,
	StepToTopoDS_TranslateEdgeOther = 1,
};

enum StepToTopoDS_BuilderError {
	StepToTopoDS_BuilderDone = 0,
	StepToTopoDS_BuilderOther = 1,
};

enum StepToTopoDS_TranslateFaceError {
	StepToTopoDS_TranslateFaceDone = 0,
	StepToTopoDS_TranslateFaceOther = 1,
};

enum StepToTopoDS_TranslateVertexLoopError {
	StepToTopoDS_TranslateVertexLoopDone = 0,
	StepToTopoDS_TranslateVertexLoopOther = 1,
};

enum StepToTopoDS_TranslateEdgeLoopError {
	StepToTopoDS_TranslateEdgeLoopDone = 0,
	StepToTopoDS_TranslateEdgeLoopOther = 1,
};

enum StepToTopoDS_TranslateVertexError {
	StepToTopoDS_TranslateVertexDone = 0,
	StepToTopoDS_TranslateVertexOther = 1,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

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

class StepToTopoDS_TranslateShellError(IntEnum):
	StepToTopoDS_TranslateShellDone = 0
	StepToTopoDS_TranslateShellOther = 1
StepToTopoDS_TranslateShellDone = StepToTopoDS_TranslateShellError.StepToTopoDS_TranslateShellDone
StepToTopoDS_TranslateShellOther = StepToTopoDS_TranslateShellError.StepToTopoDS_TranslateShellOther

class StepToTopoDS_TranslatePolyLoopError(IntEnum):
	StepToTopoDS_TranslatePolyLoopDone = 0
	StepToTopoDS_TranslatePolyLoopOther = 1
StepToTopoDS_TranslatePolyLoopDone = StepToTopoDS_TranslatePolyLoopError.StepToTopoDS_TranslatePolyLoopDone
StepToTopoDS_TranslatePolyLoopOther = StepToTopoDS_TranslatePolyLoopError.StepToTopoDS_TranslatePolyLoopOther

class StepToTopoDS_TranslateEdgeError(IntEnum):
	StepToTopoDS_TranslateEdgeDone = 0
	StepToTopoDS_TranslateEdgeOther = 1
StepToTopoDS_TranslateEdgeDone = StepToTopoDS_TranslateEdgeError.StepToTopoDS_TranslateEdgeDone
StepToTopoDS_TranslateEdgeOther = StepToTopoDS_TranslateEdgeError.StepToTopoDS_TranslateEdgeOther

class StepToTopoDS_BuilderError(IntEnum):
	StepToTopoDS_BuilderDone = 0
	StepToTopoDS_BuilderOther = 1
StepToTopoDS_BuilderDone = StepToTopoDS_BuilderError.StepToTopoDS_BuilderDone
StepToTopoDS_BuilderOther = StepToTopoDS_BuilderError.StepToTopoDS_BuilderOther

class StepToTopoDS_TranslateFaceError(IntEnum):
	StepToTopoDS_TranslateFaceDone = 0
	StepToTopoDS_TranslateFaceOther = 1
StepToTopoDS_TranslateFaceDone = StepToTopoDS_TranslateFaceError.StepToTopoDS_TranslateFaceDone
StepToTopoDS_TranslateFaceOther = StepToTopoDS_TranslateFaceError.StepToTopoDS_TranslateFaceOther

class StepToTopoDS_TranslateVertexLoopError(IntEnum):
	StepToTopoDS_TranslateVertexLoopDone = 0
	StepToTopoDS_TranslateVertexLoopOther = 1
StepToTopoDS_TranslateVertexLoopDone = StepToTopoDS_TranslateVertexLoopError.StepToTopoDS_TranslateVertexLoopDone
StepToTopoDS_TranslateVertexLoopOther = StepToTopoDS_TranslateVertexLoopError.StepToTopoDS_TranslateVertexLoopOther

class StepToTopoDS_TranslateEdgeLoopError(IntEnum):
	StepToTopoDS_TranslateEdgeLoopDone = 0
	StepToTopoDS_TranslateEdgeLoopOther = 1
StepToTopoDS_TranslateEdgeLoopDone = StepToTopoDS_TranslateEdgeLoopError.StepToTopoDS_TranslateEdgeLoopDone
StepToTopoDS_TranslateEdgeLoopOther = StepToTopoDS_TranslateEdgeLoopError.StepToTopoDS_TranslateEdgeLoopOther

class StepToTopoDS_TranslateVertexError(IntEnum):
	StepToTopoDS_TranslateVertexDone = 0
	StepToTopoDS_TranslateVertexOther = 1
StepToTopoDS_TranslateVertexDone = StepToTopoDS_TranslateVertexError.StepToTopoDS_TranslateVertexDone
StepToTopoDS_TranslateVertexOther = StepToTopoDS_TranslateVertexError.StepToTopoDS_TranslateVertexOther
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(StepToTopoDS_DataMapOfRI) NCollection_DataMap<opencascade::handle<StepRepr_RepresentationItem>,TopoDS_Shape,TColStd_MapTransientHasher>;
%template(StepToTopoDS_DataMapOfRINames) NCollection_DataMap<TCollection_AsciiString,TopoDS_Shape,TCollection_AsciiString>;
%template(StepToTopoDS_DataMapOfTRI) NCollection_DataMap<opencascade::handle<StepShape_TopologicalRepresentationItem>,TopoDS_Shape,TColStd_MapTransientHasher>;
%template(StepToTopoDS_PointEdgeMap) NCollection_DataMap<StepToTopoDS_PointPair,TopoDS_Edge,StepToTopoDS_PointPairHasher>;
%template(StepToTopoDS_PointVertexMap) NCollection_DataMap<opencascade::handle<StepGeom_CartesianPoint>,TopoDS_Vertex,StepToTopoDS_CartesianPointHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<opencascade::handle<StepRepr_RepresentationItem>, TopoDS_Shape, TColStd_MapTransientHasher>::Iterator StepToTopoDS_DataMapIteratorOfDataMapOfRI;
typedef NCollection_DataMap<TCollection_AsciiString, TopoDS_Shape, TCollection_AsciiString>::Iterator StepToTopoDS_DataMapIteratorOfDataMapOfRINames;
typedef NCollection_DataMap<opencascade::handle<StepShape_TopologicalRepresentationItem>, TopoDS_Shape, TColStd_MapTransientHasher>::Iterator StepToTopoDS_DataMapIteratorOfDataMapOfTRI;
typedef NCollection_DataMap<StepToTopoDS_PointPair, TopoDS_Edge, StepToTopoDS_PointPairHasher>::Iterator StepToTopoDS_DataMapIteratorOfPointEdgeMap;
typedef NCollection_DataMap<opencascade::handle<StepGeom_CartesianPoint>, TopoDS_Vertex, StepToTopoDS_CartesianPointHasher>::Iterator StepToTopoDS_DataMapIteratorOfPointVertexMap;
typedef NCollection_DataMap<opencascade::handle<StepRepr_RepresentationItem>, TopoDS_Shape, TColStd_MapTransientHasher> StepToTopoDS_DataMapOfRI;
typedef NCollection_DataMap<TCollection_AsciiString, TopoDS_Shape, TCollection_AsciiString> StepToTopoDS_DataMapOfRINames;
typedef NCollection_DataMap<opencascade::handle<StepShape_TopologicalRepresentationItem>, TopoDS_Shape, TColStd_MapTransientHasher> StepToTopoDS_DataMapOfTRI;
typedef NCollection_DataMap<StepToTopoDS_PointPair, TopoDS_Edge, StepToTopoDS_PointPairHasher> StepToTopoDS_PointEdgeMap;
typedef NCollection_DataMap<opencascade::handle<StepGeom_CartesianPoint>, TopoDS_Vertex, StepToTopoDS_CartesianPointHasher> StepToTopoDS_PointVertexMap;
/* end typedefs declaration */

/*********************
* class StepToTopoDS *
*********************/
%rename(steptotopods) StepToTopoDS;
class StepToTopoDS {
	public:
		/****************** DecodeBuilderError ******************/
		/**** md5 signature: d71a875d14655678f1fac2d82f46f3d7 ****/
		%feature("compactdefaultargs") DecodeBuilderError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Error: StepToTopoDS_BuilderError

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DecodeBuilderError;
		static opencascade::handle<TCollection_HAsciiString> DecodeBuilderError(const StepToTopoDS_BuilderError Error);

		/****************** DecodeEdgeError ******************/
		/**** md5 signature: 162c7a22b6733e03bf205f8c6feb7a25 ****/
		%feature("compactdefaultargs") DecodeEdgeError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Error: StepToTopoDS_TranslateEdgeError

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DecodeEdgeError;
		static opencascade::handle<TCollection_HAsciiString> DecodeEdgeError(const StepToTopoDS_TranslateEdgeError Error);

		/****************** DecodeFaceError ******************/
		/**** md5 signature: b617c00a43a67259f10a615382ce5a68 ****/
		%feature("compactdefaultargs") DecodeFaceError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Error: StepToTopoDS_TranslateFaceError

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DecodeFaceError;
		static opencascade::handle<TCollection_HAsciiString> DecodeFaceError(const StepToTopoDS_TranslateFaceError Error);

		/****************** DecodeGeometricToolError ******************/
		/**** md5 signature: 284e670ce83fabf0c21eb4fab38169f7 ****/
		%feature("compactdefaultargs") DecodeGeometricToolError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Error: StepToTopoDS_GeometricToolError

Returns
-------
char *
") DecodeGeometricToolError;
		static const char * DecodeGeometricToolError(const StepToTopoDS_GeometricToolError Error);

		/****************** DecodePolyLoopError ******************/
		/**** md5 signature: 2ca2e1443a619e76fe6a0cc8a856a348 ****/
		%feature("compactdefaultargs") DecodePolyLoopError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Error: StepToTopoDS_TranslatePolyLoopError

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DecodePolyLoopError;
		static opencascade::handle<TCollection_HAsciiString> DecodePolyLoopError(const StepToTopoDS_TranslatePolyLoopError Error);

		/****************** DecodeShellError ******************/
		/**** md5 signature: 9e24abf3232d43c607fca654a7ef839d ****/
		%feature("compactdefaultargs") DecodeShellError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Error: StepToTopoDS_TranslateShellError

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DecodeShellError;
		static opencascade::handle<TCollection_HAsciiString> DecodeShellError(const StepToTopoDS_TranslateShellError Error);

		/****************** DecodeVertexError ******************/
		/**** md5 signature: 3f5b57353135ca50c63bfa5a1198be21 ****/
		%feature("compactdefaultargs") DecodeVertexError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Error: StepToTopoDS_TranslateVertexError

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DecodeVertexError;
		static opencascade::handle<TCollection_HAsciiString> DecodeVertexError(const StepToTopoDS_TranslateVertexError Error);

		/****************** DecodeVertexLoopError ******************/
		/**** md5 signature: bc1dd64ab12f098f461796aa5039267e ****/
		%feature("compactdefaultargs") DecodeVertexLoopError;
		%feature("autodoc", "No available documentation.

Parameters
----------
Error: StepToTopoDS_TranslateVertexLoopError

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DecodeVertexLoopError;
		static opencascade::handle<TCollection_HAsciiString> DecodeVertexLoopError(const StepToTopoDS_TranslateVertexLoopError Error);

};


%extend StepToTopoDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepToTopoDS_CartesianPointHasher *
******************************************/
class StepToTopoDS_CartesianPointHasher {
	public:
		/****************** HashCode ******************/
		/**** md5 signature: ad7715c7dfea95e15d5cb8c8bcf0d5bc ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the cartesian point, in the range [1, theupperbound] @param thecartesianpoint the cartesian point which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theCartesianPoint: Handle ( StepGeom_CartesianPoint )
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const Handle ( StepGeom_CartesianPoint ) & theCartesianPoint, Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: 4636634074af2fe56217175232fc9a6a ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two cartesianpoint are the same.

Parameters
----------
K1: StepGeom_CartesianPoint
K2: StepGeom_CartesianPoint

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const opencascade::handle<StepGeom_CartesianPoint> & K1, const opencascade::handle<StepGeom_CartesianPoint> & K2);

};


%extend StepToTopoDS_CartesianPointHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepToTopoDS_GeometricTool *
***********************************/
class StepToTopoDS_GeometricTool {
	public:
		/****************** IsLikeSeam ******************/
		/**** md5 signature: 8679cc7de3782f930b4e1a99f45f83be ****/
		%feature("compactdefaultargs") IsLikeSeam;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_SurfaceCurve
S: StepGeom_Surface
E: StepShape_Edge
EL: StepShape_EdgeLoop

Returns
-------
bool
") IsLikeSeam;
		static Standard_Boolean IsLikeSeam(const opencascade::handle<StepGeom_SurfaceCurve> & SC, const opencascade::handle<StepGeom_Surface> & S, const opencascade::handle<StepShape_Edge> & E, const opencascade::handle<StepShape_EdgeLoop> & EL);

		/****************** IsSeamCurve ******************/
		/**** md5 signature: bc0405a968c33fae0a13d6001e05f654 ****/
		%feature("compactdefaultargs") IsSeamCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_SurfaceCurve
S: StepGeom_Surface
E: StepShape_Edge
EL: StepShape_EdgeLoop

Returns
-------
bool
") IsSeamCurve;
		static Standard_Boolean IsSeamCurve(const opencascade::handle<StepGeom_SurfaceCurve> & SC, const opencascade::handle<StepGeom_Surface> & S, const opencascade::handle<StepShape_Edge> & E, const opencascade::handle<StepShape_EdgeLoop> & EL);

		/****************** PCurve ******************/
		/**** md5 signature: d9795b143e7c3626dd1864ca2e08f388 ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_SurfaceCurve
S: StepGeom_Surface
PC: StepGeom_Pcurve
last: int,optional
	default value is 0

Returns
-------
int
") PCurve;
		static Standard_Integer PCurve(const opencascade::handle<StepGeom_SurfaceCurve> & SC, const opencascade::handle<StepGeom_Surface> & S, opencascade::handle<StepGeom_Pcurve> & PC, const Standard_Integer last = 0);

		/****************** UpdateParam3d ******************/
		/**** md5 signature: b718a006868f7ff304524fa58ad7846f ****/
		%feature("compactdefaultargs") UpdateParam3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve
preci: float

Returns
-------
w1: float
w2: float
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
		/****************** StepToTopoDS_NMTool ******************/
		/**** md5 signature: 8a7fb7b63397aa883e18cd7601fd9dc0 ****/
		%feature("compactdefaultargs") StepToTopoDS_NMTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepToTopoDS_NMTool;
		 StepToTopoDS_NMTool();

		/****************** StepToTopoDS_NMTool ******************/
		/**** md5 signature: c00fee9bdc72c8f972685d998a33740d ****/
		%feature("compactdefaultargs") StepToTopoDS_NMTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
MapOfRI: StepToTopoDS_DataMapOfRI
MapOfRINames: StepToTopoDS_DataMapOfRINames

Returns
-------
None
") StepToTopoDS_NMTool;
		 StepToTopoDS_NMTool(const StepToTopoDS_DataMapOfRI & MapOfRI, const StepToTopoDS_DataMapOfRINames & MapOfRINames);

		/****************** Bind ******************/
		/**** md5 signature: 0e1f9e51d96cb0b02f6de30681908e07 ****/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "No available documentation.

Parameters
----------
RI: StepRepr_RepresentationItem
S: TopoDS_Shape

Returns
-------
None
") Bind;
		void Bind(const opencascade::handle<StepRepr_RepresentationItem> & RI, const TopoDS_Shape & S);

		/****************** Bind ******************/
		/**** md5 signature: e4d9798a62ddf4517cb0c0ae926f62fb ****/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "No available documentation.

Parameters
----------
RIName: TCollection_AsciiString
S: TopoDS_Shape

Returns
-------
None
") Bind;
		void Bind(const TCollection_AsciiString & RIName, const TopoDS_Shape & S);

		/****************** CleanUp ******************/
		/**** md5 signature: f3a256cc048719bbee06926323c3a77c ****/
		%feature("compactdefaultargs") CleanUp;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") CleanUp;
		void CleanUp();

		/****************** Find ******************/
		/**** md5 signature: 41b58c9cb17ece127101e06f2746b3d9 ****/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "No available documentation.

Parameters
----------
RI: StepRepr_RepresentationItem

Returns
-------
TopoDS_Shape
") Find;
		const TopoDS_Shape Find(const opencascade::handle<StepRepr_RepresentationItem> & RI);

		/****************** Find ******************/
		/**** md5 signature: d0c0d2e124c08e23451667b20c927dbf ****/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "No available documentation.

Parameters
----------
RIName: TCollection_AsciiString

Returns
-------
TopoDS_Shape
") Find;
		const TopoDS_Shape Find(const TCollection_AsciiString & RIName);

		/****************** Init ******************/
		/**** md5 signature: ef9b81781232fa5ed79ae79f4d4e8a14 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
MapOfRI: StepToTopoDS_DataMapOfRI
MapOfRINames: StepToTopoDS_DataMapOfRINames

Returns
-------
None
") Init;
		void Init(const StepToTopoDS_DataMapOfRI & MapOfRI, const StepToTopoDS_DataMapOfRINames & MapOfRINames);

		/****************** IsActive ******************/
		/**** md5 signature: 0ca6af43e1e5c31f31cae2bed4a28e09 ****/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsActive;
		Standard_Boolean IsActive();

		/****************** IsBound ******************/
		/**** md5 signature: e08f20c0a82c0ec3e65d80414ab167d8 ****/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "No available documentation.

Parameters
----------
RI: StepRepr_RepresentationItem

Returns
-------
bool
") IsBound;
		Standard_Boolean IsBound(const opencascade::handle<StepRepr_RepresentationItem> & RI);

		/****************** IsBound ******************/
		/**** md5 signature: a0afe6290fba9e98e79003a4a77154d9 ****/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "No available documentation.

Parameters
----------
RIName: TCollection_AsciiString

Returns
-------
bool
") IsBound;
		Standard_Boolean IsBound(const TCollection_AsciiString & RIName);

		/****************** IsIDEASCase ******************/
		/**** md5 signature: cb4d1921b8ccac1de00b7adf6143ebbf ****/
		%feature("compactdefaultargs") IsIDEASCase;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsIDEASCase;
		Standard_Boolean IsIDEASCase();

		/****************** IsPureNMShell ******************/
		/**** md5 signature: c02b194ff295d3ed0926c9e34201611e ****/
		%feature("compactdefaultargs") IsPureNMShell;
		%feature("autodoc", "No available documentation.

Parameters
----------
Shell: TopoDS_Shape

Returns
-------
bool
") IsPureNMShell;
		Standard_Boolean IsPureNMShell(const TopoDS_Shape & Shell);

		/****************** IsSuspectedAsClosing ******************/
		/**** md5 signature: 33012a3b2e76b3143c5496ff8ee156e4 ****/
		%feature("compactdefaultargs") IsSuspectedAsClosing;
		%feature("autodoc", "No available documentation.

Parameters
----------
BaseShell: TopoDS_Shape
SuspectedShell: TopoDS_Shape

Returns
-------
bool
") IsSuspectedAsClosing;
		Standard_Boolean IsSuspectedAsClosing(const TopoDS_Shape & BaseShell, const TopoDS_Shape & SuspectedShell);

		/****************** RegisterNMEdge ******************/
		/**** md5 signature: 289ad7c7ef45ab4177fdb4383800e6eb ****/
		%feature("compactdefaultargs") RegisterNMEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
Edge: TopoDS_Shape

Returns
-------
None
") RegisterNMEdge;
		void RegisterNMEdge(const TopoDS_Shape & Edge);

		/****************** SetActive ******************/
		/**** md5 signature: 3358e8f54abcc6d559a2d43b25856b04 ****/
		%feature("compactdefaultargs") SetActive;
		%feature("autodoc", "No available documentation.

Parameters
----------
isActive: bool

Returns
-------
None
") SetActive;
		void SetActive(const Standard_Boolean isActive);

		/****************** SetIDEASCase ******************/
		/**** md5 signature: cedc3302b7a18f309680ea12dc03ce1d ****/
		%feature("compactdefaultargs") SetIDEASCase;
		%feature("autodoc", "No available documentation.

Parameters
----------
IDEASCase: bool

Returns
-------
None
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
		/****************** StepToTopoDS_PointPair ******************/
		/**** md5 signature: 7284d27a9958c9cec16be257b5e8b5f6 ****/
		%feature("compactdefaultargs") StepToTopoDS_PointPair;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: StepGeom_CartesianPoint
P2: StepGeom_CartesianPoint

Returns
-------
None
") StepToTopoDS_PointPair;
		 StepToTopoDS_PointPair(const opencascade::handle<StepGeom_CartesianPoint> & P1, const opencascade::handle<StepGeom_CartesianPoint> & P2);

};


%extend StepToTopoDS_PointPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepToTopoDS_PointPairHasher *
*************************************/
class StepToTopoDS_PointPairHasher {
	public:
		/****************** HashCode ******************/
		/**** md5 signature: dcb519fee842577e3ec4e768de7a2e76 ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the point pair, in the range [1, theupperbound] @param thepointpair the point pair which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
thePointPair: StepToTopoDS_PointPair
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const StepToTopoDS_PointPair & thePointPair, Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: eab63b5288acc5d348e988bf2699b761 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two pointpair are the same.

Parameters
----------
K1: StepToTopoDS_PointPair
K2: StepToTopoDS_PointPair

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const StepToTopoDS_PointPair & K1, const StepToTopoDS_PointPair & K2);

};


%extend StepToTopoDS_PointPairHasher {
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
		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxTol ******************/
		/**** md5 signature: 0c3136ae5bf1b934384f3b243669f341 ****/
		%feature("compactdefaultargs") MaxTol;
		%feature("autodoc", "Returns the value of 'maxtol'.

Returns
-------
float
") MaxTol;
		Standard_Real MaxTol();

		/****************** Precision ******************/
		/**** md5 signature: 34c7e39bd57a685873eea74fa4629747 ****/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Returns the value of 'myprecision'.

Returns
-------
float
") Precision;
		Standard_Real Precision();

		/****************** SetMaxTol ******************/
		/**** md5 signature: 3f6da2f43671d4077fc62f3d70405103 ****/
		%feature("compactdefaultargs") SetMaxTol;
		%feature("autodoc", "Sets the value of maxtol.

Parameters
----------
maxpreci: float

Returns
-------
None
") SetMaxTol;
		void SetMaxTol(const Standard_Real maxpreci);

		/****************** SetPrecision ******************/
		/**** md5 signature: a601cf881702916ad1a5bcd1fec314c4 ****/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "Sets the value of 'myprecision'.

Parameters
----------
preci: float

Returns
-------
None
") SetPrecision;
		void SetPrecision(const Standard_Real preci);

};


%extend StepToTopoDS_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepToTopoDS_Builder *
*****************************/
/*************************************
* class StepToTopoDS_MakeTransformed *
*************************************/
class StepToTopoDS_MakeTransformed : public StepToTopoDS_Root {
	public:
		/****************** StepToTopoDS_MakeTransformed ******************/
		/**** md5 signature: e017844d82ed89c10dab9aa8462b786b ****/
		%feature("compactdefaultargs") StepToTopoDS_MakeTransformed;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepToTopoDS_MakeTransformed;
		 StepToTopoDS_MakeTransformed();

		/****************** Compute ******************/
		/**** md5 signature: ef952eb1263e44bab9e69d95af7ec6c7 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes a transformation to pass from an origin placement to a target placement. returns true when done if not done, the transformation will by identity.

Parameters
----------
Origin: StepGeom_Axis2Placement3d
Target: StepGeom_Axis2Placement3d

Returns
-------
bool
") Compute;
		Standard_Boolean Compute(const opencascade::handle<StepGeom_Axis2Placement3d> & Origin, const opencascade::handle<StepGeom_Axis2Placement3d> & Target);

		/****************** Compute ******************/
		/**** md5 signature: 72b8bc3c3cadc1c01529b12985800b95 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes a transformation defined by an operator 3d.

Parameters
----------
Operator: StepGeom_CartesianTransformationOperator3d

Returns
-------
bool
") Compute;
		Standard_Boolean Compute(const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & Operator);

		/****************** Transform ******************/
		/**** md5 signature: ae541322c2f3f8d7777b0df5eb5a3d2d ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the computed transformation to a shape returns false if the transformation is identity.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
bool
") Transform;
		Standard_Boolean Transform(TopoDS_Shape & shape);

		/****************** Transformation ******************/
		/**** md5 signature: 567e6ee373139970f4679dbb49e28e7c ****/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Returns the computed transformation (identity if not yet or if failed).

Returns
-------
gp_Trsf
") Transformation;
		const gp_Trsf Transformation();

		/****************** TranslateMappedItem ******************/
		/**** md5 signature: 1d1508d9a18582e9e3dcf12391aa3ace ****/
		%feature("compactdefaultargs") TranslateMappedItem;
		%feature("autodoc", "Translates a mappeditem. more precisely a mappeditem has a mappingsource and a mappingtarget mappingsource has a mappedrepresentation and a mappingorigin mappedrepresentation is the basic item to be instanced mappingorigin is the starting placement mappingtarget is the final placement //! hence, the transformation from mappingorigin and mappingtarget is computed, the mappedrepr. is converted to a shape, then transformed as an instance of this shape.

Parameters
----------
mapit: StepRepr_MappedItem
TP: Transfer_TransientProcess

Returns
-------
TopoDS_Shape
") TranslateMappedItem;
		TopoDS_Shape TranslateMappedItem(const opencascade::handle<StepRepr_MappedItem> & mapit, const opencascade::handle<Transfer_TransientProcess> & TP);

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
		/****************** StepToTopoDS_TranslateCompositeCurve ******************/
		/**** md5 signature: 6257d03934cc757cf941eeb16439ba16 ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateCompositeCurve;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepToTopoDS_TranslateCompositeCurve;
		 StepToTopoDS_TranslateCompositeCurve();

		/****************** StepToTopoDS_TranslateCompositeCurve ******************/
		/**** md5 signature: 8d0dbb01c599d183bec5649adfee8fdc ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateCompositeCurve;
		%feature("autodoc", "Translates standalone composite_curve.

Parameters
----------
CC: StepGeom_CompositeCurve
TP: Transfer_TransientProcess

Returns
-------
None
") StepToTopoDS_TranslateCompositeCurve;
		 StepToTopoDS_TranslateCompositeCurve(const opencascade::handle<StepGeom_CompositeCurve> & CC, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** StepToTopoDS_TranslateCompositeCurve ******************/
		/**** md5 signature: 84f0f9b8f6c086cdda37021da670d9bf ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateCompositeCurve;
		%feature("autodoc", "Translates composite_curve lying on surface.

Parameters
----------
CC: StepGeom_CompositeCurve
TP: Transfer_TransientProcess
S: StepGeom_Surface
Surf: Geom_Surface

Returns
-------
None
") StepToTopoDS_TranslateCompositeCurve;
		 StepToTopoDS_TranslateCompositeCurve(const opencascade::handle<StepGeom_CompositeCurve> & CC, const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<StepGeom_Surface> & S, const opencascade::handle<Geom_Surface> & Surf);

		/****************** Init ******************/
		/**** md5 signature: 0bbaf2475e507a45e42b4dd9eba98125 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Translates standalone composite_curve.

Parameters
----------
CC: StepGeom_CompositeCurve
TP: Transfer_TransientProcess

Returns
-------
bool
") Init;
		Standard_Boolean Init(const opencascade::handle<StepGeom_CompositeCurve> & CC, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** Init ******************/
		/**** md5 signature: 4887ea50532f0701757e4d2cdeec08db ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Translates composite_curve lying on surface.

Parameters
----------
CC: StepGeom_CompositeCurve
TP: Transfer_TransientProcess
S: StepGeom_Surface
Surf: Geom_Surface

Returns
-------
bool
") Init;
		Standard_Boolean Init(const opencascade::handle<StepGeom_CompositeCurve> & CC, const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<StepGeom_Surface> & S, const opencascade::handle<Geom_Surface> & Surf);

		/****************** IsInfiniteSegment ******************/
		/**** md5 signature: be0b48bb5bf6dd8b382853323416d189 ****/
		%feature("compactdefaultargs") IsInfiniteSegment;
		%feature("autodoc", "Returns true if composite_curve contains a segment with infinite parameters.

Returns
-------
bool
") IsInfiniteSegment;
		Standard_Boolean IsInfiniteSegment();

		/****************** Value ******************/
		/**** md5 signature: eb9143e5c5c30ac8712cf3bfb04cba14 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns result of last translation or null wire if failed.

Returns
-------
TopoDS_Wire
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
		/****************** StepToTopoDS_TranslateCurveBoundedSurface ******************/
		/**** md5 signature: b546faeadcbb5cf9880e5ea86c03f574 ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateCurveBoundedSurface;
		%feature("autodoc", "Create empty tool.

Returns
-------
None
") StepToTopoDS_TranslateCurveBoundedSurface;
		 StepToTopoDS_TranslateCurveBoundedSurface();

		/****************** StepToTopoDS_TranslateCurveBoundedSurface ******************/
		/**** md5 signature: 7014b036cf85af0c3c8c2042001e5ce3 ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateCurveBoundedSurface;
		%feature("autodoc", "Translate surface.

Parameters
----------
CBS: StepGeom_CurveBoundedSurface
TP: Transfer_TransientProcess

Returns
-------
None
") StepToTopoDS_TranslateCurveBoundedSurface;
		 StepToTopoDS_TranslateCurveBoundedSurface(const opencascade::handle<StepGeom_CurveBoundedSurface> & CBS, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** Init ******************/
		/**** md5 signature: c9ed3cf9b1bbfb4d29066736d02538a8 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Translate surface.

Parameters
----------
CBS: StepGeom_CurveBoundedSurface
TP: Transfer_TransientProcess

Returns
-------
bool
") Init;
		Standard_Boolean Init(const opencascade::handle<StepGeom_CurveBoundedSurface> & CBS, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** Value ******************/
		/**** md5 signature: b5b497eab24ec930cccd989e4142789f ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns result of last translation or null wire if failed.

Returns
-------
TopoDS_Face
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
		/****************** StepToTopoDS_TranslateEdge ******************/
		/**** md5 signature: 67f1752d7e20a192995a7282c080bdb5 ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepToTopoDS_TranslateEdge;
		 StepToTopoDS_TranslateEdge();

		/****************** StepToTopoDS_TranslateEdge ******************/
		/**** md5 signature: 1b1152b46d8fe1bdbc89506b6264b46a ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: StepShape_Edge
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool

Returns
-------
None
") StepToTopoDS_TranslateEdge;
		 StepToTopoDS_TranslateEdge(const opencascade::handle<StepShape_Edge> & E, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool);

		/****************** Error ******************/
		/**** md5 signature: 7959af5964376dbce1968ae8ef06cbcb ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
StepToTopoDS_TranslateEdgeError
") Error;
		StepToTopoDS_TranslateEdgeError Error();

		/****************** Init ******************/
		/**** md5 signature: fa466c026f7d2ba6dc36e270a126d96d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: StepShape_Edge
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepShape_Edge> & E, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool);

		/****************** MakeFromCurve3D ******************/
		/**** md5 signature: 9bec30f36d980a31f18231e661d987ba ****/
		%feature("compactdefaultargs") MakeFromCurve3D;
		%feature("autodoc", "Warning! c3d is assumed to be a curve 3d ... other cases to checked before calling this.

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

Returns
-------
None
") MakeFromCurve3D;
		void MakeFromCurve3D(const opencascade::handle<StepGeom_Curve> & C3D, const opencascade::handle<StepShape_EdgeCurve> & EC, const opencascade::handle<StepShape_Vertex> & Vend, const Standard_Real preci, TopoDS_Edge & E, TopoDS_Vertex & V1, TopoDS_Vertex & V2, StepToTopoDS_Tool & T);

		/****************** MakePCurve ******************/
		/**** md5 signature: aceaed334313f8c0903695bf0bbdd42f ****/
		%feature("compactdefaultargs") MakePCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
PCU: StepGeom_Pcurve
ConvSurf: Geom_Surface

Returns
-------
opencascade::handle<Geom2d_Curve>
") MakePCurve;
		opencascade::handle<Geom2d_Curve> MakePCurve(const opencascade::handle<StepGeom_Pcurve> & PCU, const opencascade::handle<Geom_Surface> & ConvSurf);

		/****************** Value ******************/
		/**** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		/****************** StepToTopoDS_TranslateEdgeLoop ******************/
		/**** md5 signature: 3c19b5dcaa2b6dabda6b6c90ff860d43 ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdgeLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepToTopoDS_TranslateEdgeLoop;
		 StepToTopoDS_TranslateEdgeLoop();

		/****************** StepToTopoDS_TranslateEdgeLoop ******************/
		/**** md5 signature: eccc4c3cfcc7c4cc95831b5e98b69b3d ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdgeLoop;
		%feature("autodoc", "No available documentation.

Parameters
----------
FB: StepShape_FaceBound
F: TopoDS_Face
S: Geom_Surface
SS: StepGeom_Surface
ss: bool
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool

Returns
-------
None
") StepToTopoDS_TranslateEdgeLoop;
		 StepToTopoDS_TranslateEdgeLoop(const opencascade::handle<StepShape_FaceBound> & FB, const TopoDS_Face & F, const opencascade::handle<Geom_Surface> & S, const opencascade::handle<StepGeom_Surface> & SS, const Standard_Boolean ss, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool);

		/****************** Error ******************/
		/**** md5 signature: 972d261b46108646d94d6f19a66c3792 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
StepToTopoDS_TranslateEdgeLoopError
") Error;
		StepToTopoDS_TranslateEdgeLoopError Error();

		/****************** Init ******************/
		/**** md5 signature: f66bea236097a4bc705f4602912be975 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
FB: StepShape_FaceBound
F: TopoDS_Face
S: Geom_Surface
SS: StepGeom_Surface
ss: bool
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepShape_FaceBound> & FB, const TopoDS_Face & F, const opencascade::handle<Geom_Surface> & S, const opencascade::handle<StepGeom_Surface> & SS, const Standard_Boolean ss, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool);

		/****************** Value ******************/
		/**** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		/****************** StepToTopoDS_TranslateFace ******************/
		/**** md5 signature: fe774e5c33e076954c36e443cd166036 ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepToTopoDS_TranslateFace;
		 StepToTopoDS_TranslateFace();

		/****************** StepToTopoDS_TranslateFace ******************/
		/**** md5 signature: 202b10159c363ae03f23988045b9d57d ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
FS: StepShape_FaceSurface
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool

Returns
-------
None
") StepToTopoDS_TranslateFace;
		 StepToTopoDS_TranslateFace(const opencascade::handle<StepShape_FaceSurface> & FS, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool);

		/****************** Error ******************/
		/**** md5 signature: d8d7070b3c140555673282970df02982 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
StepToTopoDS_TranslateFaceError
") Error;
		StepToTopoDS_TranslateFaceError Error();

		/****************** Init ******************/
		/**** md5 signature: da30c4e3ea286db183e2d9c22d2bfc6a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
FS: StepShape_FaceSurface
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepShape_FaceSurface> & FS, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool);

		/****************** Value ******************/
		/**** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		/****************** StepToTopoDS_TranslatePolyLoop ******************/
		/**** md5 signature: 6815f851fee46c2ec164f46ad6a5c770 ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslatePolyLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepToTopoDS_TranslatePolyLoop;
		 StepToTopoDS_TranslatePolyLoop();

		/****************** StepToTopoDS_TranslatePolyLoop ******************/
		/**** md5 signature: d120fb12f9cb2c1529a3e1d2d2037fca ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslatePolyLoop;
		%feature("autodoc", "No available documentation.

Parameters
----------
PL: StepShape_PolyLoop
T: StepToTopoDS_Tool
S: Geom_Surface
F: TopoDS_Face

Returns
-------
None
") StepToTopoDS_TranslatePolyLoop;
		 StepToTopoDS_TranslatePolyLoop(const opencascade::handle<StepShape_PolyLoop> & PL, StepToTopoDS_Tool & T, const opencascade::handle<Geom_Surface> & S, const TopoDS_Face & F);

		/****************** Error ******************/
		/**** md5 signature: 962c2106db55809a22bc9095ee479fa7 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
StepToTopoDS_TranslatePolyLoopError
") Error;
		StepToTopoDS_TranslatePolyLoopError Error();

		/****************** Init ******************/
		/**** md5 signature: 4cb4106fcf2e34b54540c7d08d9a55d6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
PL: StepShape_PolyLoop
T: StepToTopoDS_Tool
S: Geom_Surface
F: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepShape_PolyLoop> & PL, StepToTopoDS_Tool & T, const opencascade::handle<Geom_Surface> & S, const TopoDS_Face & F);

		/****************** Value ******************/
		/**** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		/****************** StepToTopoDS_TranslateShell ******************/
		/**** md5 signature: af07629395766e1161453a2892bab3e5 ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateShell;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepToTopoDS_TranslateShell;
		 StepToTopoDS_TranslateShell();

		/****************** StepToTopoDS_TranslateShell ******************/
		/**** md5 signature: c64dac141f5411feeeabb688e921ba62 ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateShell;
		%feature("autodoc", "No available documentation.

Parameters
----------
CFS: StepShape_ConnectedFaceSet
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool

Returns
-------
None
") StepToTopoDS_TranslateShell;
		 StepToTopoDS_TranslateShell(const opencascade::handle<StepShape_ConnectedFaceSet> & CFS, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool);

		/****************** Error ******************/
		/**** md5 signature: fa654c6e3e1001e67d10206a2c654b17 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
StepToTopoDS_TranslateShellError
") Error;
		StepToTopoDS_TranslateShellError Error();

		/****************** Init ******************/
		/**** md5 signature: 18d2efe1b2856a58c5c16d94e73b7060 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
CFS: StepShape_ConnectedFaceSet
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepShape_ConnectedFaceSet> & CFS, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool);

		/****************** Value ******************/
		/**** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Value;
		const TopoDS_Shape Value();

};


%extend StepToTopoDS_TranslateShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepToTopoDS_TranslateVertex *
*************************************/
class StepToTopoDS_TranslateVertex : public StepToTopoDS_Root {
	public:
		/****************** StepToTopoDS_TranslateVertex ******************/
		/**** md5 signature: 5cdb5f6424559263f1047127f97964d5 ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepToTopoDS_TranslateVertex;
		 StepToTopoDS_TranslateVertex();

		/****************** StepToTopoDS_TranslateVertex ******************/
		/**** md5 signature: 03a5c946d2630696d8076a4c21a0f4c1 ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: StepShape_Vertex
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool

Returns
-------
None
") StepToTopoDS_TranslateVertex;
		 StepToTopoDS_TranslateVertex(const opencascade::handle<StepShape_Vertex> & V, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool);

		/****************** Error ******************/
		/**** md5 signature: ce1730d22af9104c4c4fb1b6d3448148 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
StepToTopoDS_TranslateVertexError
") Error;
		StepToTopoDS_TranslateVertexError Error();

		/****************** Init ******************/
		/**** md5 signature: 1c35f9b19e50e212ed8c85799d430c4a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: StepShape_Vertex
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepShape_Vertex> & V, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool);

		/****************** Value ******************/
		/**** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		/****************** StepToTopoDS_TranslateVertexLoop ******************/
		/**** md5 signature: ad56fa19c94f4aceb198b1be577f32c2 ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertexLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepToTopoDS_TranslateVertexLoop;
		 StepToTopoDS_TranslateVertexLoop();

		/****************** StepToTopoDS_TranslateVertexLoop ******************/
		/**** md5 signature: b01661a976f607b43c4e6cbd449e3f3c ****/
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertexLoop;
		%feature("autodoc", "No available documentation.

Parameters
----------
VL: StepShape_VertexLoop
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool

Returns
-------
None
") StepToTopoDS_TranslateVertexLoop;
		 StepToTopoDS_TranslateVertexLoop(const opencascade::handle<StepShape_VertexLoop> & VL, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool);

		/****************** Error ******************/
		/**** md5 signature: 60bfd24853f7287af19ff4ca1ce94fd9 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
StepToTopoDS_TranslateVertexLoopError
") Error;
		StepToTopoDS_TranslateVertexLoopError Error();

		/****************** Init ******************/
		/**** md5 signature: ce3ad894374cb777b1a0e1e217d780fe ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
VL: StepShape_VertexLoop
T: StepToTopoDS_Tool
NMTool: StepToTopoDS_NMTool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepShape_VertexLoop> & VL, StepToTopoDS_Tool & T, StepToTopoDS_NMTool & NMTool);

		/****************** Value ******************/
		/**** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
