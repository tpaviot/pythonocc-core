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
%define XCAFVIEWDOCSTRING
"XCAFView module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xcafview.html"
%enddef
%module (package="OCC.Core", docstring=XCAFVIEWDOCSTRING) XCAFView


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
#include<XCAFView_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum XCAFView_ProjectionType {
	XCAFView_ProjectionType_NoCamera = 0,
	XCAFView_ProjectionType_Parallel = 1,
	XCAFView_ProjectionType_Central = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class XCAFView_ProjectionType(IntEnum):
	XCAFView_ProjectionType_NoCamera = 0
	XCAFView_ProjectionType_Parallel = 1
	XCAFView_ProjectionType_Central = 2
XCAFView_ProjectionType_NoCamera = XCAFView_ProjectionType.XCAFView_ProjectionType_NoCamera
XCAFView_ProjectionType_Parallel = XCAFView_ProjectionType.XCAFView_ProjectionType_Parallel
XCAFView_ProjectionType_Central = XCAFView_ProjectionType.XCAFView_ProjectionType_Central
};
/* end python proxy for enums */

/* handles */
%wrap_handle(XCAFView_Object)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/************************
* class XCAFView_Object *
************************/
class XCAFView_Object : public Standard_Transient {
	public:
		/****************** XCAFView_Object ******************/
		/**** md5 signature: 26ce653870ccdec920dcbae3ab909356 ****/
		%feature("compactdefaultargs") XCAFView_Object;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFView_Object;
		 XCAFView_Object();

		/****************** XCAFView_Object ******************/
		/**** md5 signature: f8e301489d23f4598c759665d31bdc88 ****/
		%feature("compactdefaultargs") XCAFView_Object;
		%feature("autodoc", "No available documentation.

Parameters
----------
theObj: XCAFView_Object

Returns
-------
None
") XCAFView_Object;
		 XCAFView_Object(const opencascade::handle<XCAFView_Object> & theObj);

		/****************** BackPlaneDistance ******************/
		/**** md5 signature: c1c25d1808cea203dfc63ffc325003b3 ****/
		%feature("compactdefaultargs") BackPlaneDistance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") BackPlaneDistance;
		Standard_Real BackPlaneDistance();

		/****************** ClippingExpression ******************/
		/**** md5 signature: e45478706e1196e137725a20cefd9687 ****/
		%feature("compactdefaultargs") ClippingExpression;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ClippingExpression;
		opencascade::handle<TCollection_HAsciiString> ClippingExpression();

		/****************** CreateGDTPoints ******************/
		/**** md5 signature: d124bf536f975261e19a6f1e118ac509 ****/
		%feature("compactdefaultargs") CreateGDTPoints;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLenght: int

Returns
-------
None
") CreateGDTPoints;
		void CreateGDTPoints(const Standard_Integer theLenght);

		/****************** FrontPlaneDistance ******************/
		/**** md5 signature: 46b64b674ae4f0d138a3933e44b5a504 ****/
		%feature("compactdefaultargs") FrontPlaneDistance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FrontPlaneDistance;
		Standard_Real FrontPlaneDistance();

		/****************** GDTPoint ******************/
		/**** md5 signature: 07b7df86a4b242da9ab06a2f83eab29d ****/
		%feature("compactdefaultargs") GDTPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt
") GDTPoint;
		gp_Pnt GDTPoint(const Standard_Integer theIndex);

		/****************** HasBackPlaneClipping ******************/
		/**** md5 signature: ecc9f51e5c54049b8180bc3d82fecd3c ****/
		%feature("compactdefaultargs") HasBackPlaneClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasBackPlaneClipping;
		Standard_Boolean HasBackPlaneClipping();

		/****************** HasFrontPlaneClipping ******************/
		/**** md5 signature: a3e22d2f9ba08e42c94401138774b26e ****/
		%feature("compactdefaultargs") HasFrontPlaneClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasFrontPlaneClipping;
		Standard_Boolean HasFrontPlaneClipping();

		/****************** HasGDTPoints ******************/
		/**** md5 signature: 18e8604b8670eafae4689f3bcb664edb ****/
		%feature("compactdefaultargs") HasGDTPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasGDTPoints;
		Standard_Boolean HasGDTPoints();

		/****************** HasViewVolumeSidesClipping ******************/
		/**** md5 signature: c6a4308226e4aae2e161c2fae714018a ****/
		%feature("compactdefaultargs") HasViewVolumeSidesClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasViewVolumeSidesClipping;
		Standard_Boolean HasViewVolumeSidesClipping();

		/****************** Name ******************/
		/**** md5 signature: a2f16cf431bd3ce387ff8e8fc2eeffe1 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbGDTPoints ******************/
		/**** md5 signature: a5494b7b540b3c6bd6cbbe02319a6eeb ****/
		%feature("compactdefaultargs") NbGDTPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbGDTPoints;
		Standard_Integer NbGDTPoints();

		/****************** ProjectionPoint ******************/
		/**** md5 signature: c85ce9f39d341a982dc7b405825f2581 ****/
		%feature("compactdefaultargs") ProjectionPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") ProjectionPoint;
		gp_Pnt ProjectionPoint();

		/****************** SetBackPlaneDistance ******************/
		/**** md5 signature: 5e87ab6fe25726e46af15c428a6bd268 ****/
		%feature("compactdefaultargs") SetBackPlaneDistance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDistance: float

Returns
-------
None
") SetBackPlaneDistance;
		void SetBackPlaneDistance(Standard_Real theDistance);

		/****************** SetClippingExpression ******************/
		/**** md5 signature: b789225cb90d8555ec9c0d4ceb58f915 ****/
		%feature("compactdefaultargs") SetClippingExpression;
		%feature("autodoc", "No available documentation.

Parameters
----------
theExpression: TCollection_HAsciiString

Returns
-------
None
") SetClippingExpression;
		void SetClippingExpression(opencascade::handle<TCollection_HAsciiString > theExpression);

		/****************** SetFrontPlaneDistance ******************/
		/**** md5 signature: 443b1317d6f4077efa5428592305573d ****/
		%feature("compactdefaultargs") SetFrontPlaneDistance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDistance: float

Returns
-------
None
") SetFrontPlaneDistance;
		void SetFrontPlaneDistance(Standard_Real theDistance);

		/****************** SetGDTPoint ******************/
		/**** md5 signature: 1b80ce6b104bf1b4c24025ca4ac7da98 ****/
		%feature("compactdefaultargs") SetGDTPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int
thePoint: gp_Pnt

Returns
-------
None
") SetGDTPoint;
		void SetGDTPoint(const Standard_Integer theIndex, const gp_Pnt thePoint);

		/****************** SetName ******************/
		/**** md5 signature: 5a1093e3141e426b70566411902bc345 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(opencascade::handle<TCollection_HAsciiString > theName);

		/****************** SetProjectionPoint ******************/
		/**** md5 signature: dd8878886718206f128b1eeb580bb2f6 ****/
		%feature("compactdefaultargs") SetProjectionPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePoint: gp_Pnt

Returns
-------
None
") SetProjectionPoint;
		void SetProjectionPoint(gp_Pnt thePoint);

		/****************** SetType ******************/
		/**** md5 signature: f0d13799e0fc97053a52a9b545460075 ****/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: XCAFView_ProjectionType

Returns
-------
None
") SetType;
		void SetType(XCAFView_ProjectionType theType);

		/****************** SetUpDirection ******************/
		/**** md5 signature: 9575d938efb3f7d1648686e4a69aca9d ****/
		%feature("compactdefaultargs") SetUpDirection;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDirection: gp_Dir

Returns
-------
None
") SetUpDirection;
		void SetUpDirection(gp_Dir theDirection);

		/****************** SetViewDirection ******************/
		/**** md5 signature: 40115a55468d95b120feb5a29a8c10f3 ****/
		%feature("compactdefaultargs") SetViewDirection;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDirection: gp_Dir

Returns
-------
None
") SetViewDirection;
		void SetViewDirection(gp_Dir theDirection);

		/****************** SetViewVolumeSidesClipping ******************/
		/**** md5 signature: 8e109040f01baed9ca80d38d53a8743b ****/
		%feature("compactdefaultargs") SetViewVolumeSidesClipping;
		%feature("autodoc", "No available documentation.

Parameters
----------
theViewVolumeSidesClipping: bool

Returns
-------
None
") SetViewVolumeSidesClipping;
		void SetViewVolumeSidesClipping(Standard_Boolean theViewVolumeSidesClipping);

		/****************** SetWindowHorizontalSize ******************/
		/**** md5 signature: 42c3fca900471278cb988aa4a0f4205d ****/
		%feature("compactdefaultargs") SetWindowHorizontalSize;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSize: float

Returns
-------
None
") SetWindowHorizontalSize;
		void SetWindowHorizontalSize(Standard_Real theSize);

		/****************** SetWindowVerticalSize ******************/
		/**** md5 signature: e0fc956b19454b156da6371c5775699b ****/
		%feature("compactdefaultargs") SetWindowVerticalSize;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSize: float

Returns
-------
None
") SetWindowVerticalSize;
		void SetWindowVerticalSize(Standard_Real theSize);

		/****************** SetZoomFactor ******************/
		/**** md5 signature: 1b1c2f60b468087057daf9984dce5697 ****/
		%feature("compactdefaultargs") SetZoomFactor;
		%feature("autodoc", "No available documentation.

Parameters
----------
theZoomFactor: float

Returns
-------
None
") SetZoomFactor;
		void SetZoomFactor(Standard_Real theZoomFactor);

		/****************** Type ******************/
		/**** md5 signature: 32aa483fbc3733810fa598642ebbd7a6 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
XCAFView_ProjectionType
") Type;
		XCAFView_ProjectionType Type();

		/****************** UnsetBackPlaneClipping ******************/
		/**** md5 signature: 193430871ceb6f70110096911a73384d ****/
		%feature("compactdefaultargs") UnsetBackPlaneClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetBackPlaneClipping;
		void UnsetBackPlaneClipping();

		/****************** UnsetFrontPlaneClipping ******************/
		/**** md5 signature: cb76e740d876095da6d5e7d8592c35ae ****/
		%feature("compactdefaultargs") UnsetFrontPlaneClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetFrontPlaneClipping;
		void UnsetFrontPlaneClipping();

		/****************** UpDirection ******************/
		/**** md5 signature: 90819ca369ece69dcc65f5431c46ca9a ****/
		%feature("compactdefaultargs") UpDirection;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") UpDirection;
		gp_Dir UpDirection();

		/****************** ViewDirection ******************/
		/**** md5 signature: e5b4ef6b1c3592b2af932d02de30ae78 ****/
		%feature("compactdefaultargs") ViewDirection;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") ViewDirection;
		gp_Dir ViewDirection();

		/****************** WindowHorizontalSize ******************/
		/**** md5 signature: 54afb51de6fb2f5b86db9ff4102ffbca ****/
		%feature("compactdefaultargs") WindowHorizontalSize;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") WindowHorizontalSize;
		Standard_Real WindowHorizontalSize();

		/****************** WindowVerticalSize ******************/
		/**** md5 signature: 5c230d606147b30d953d21382aadf8bf ****/
		%feature("compactdefaultargs") WindowVerticalSize;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") WindowVerticalSize;
		Standard_Real WindowVerticalSize();

		/****************** ZoomFactor ******************/
		/**** md5 signature: b045662a2fb19f056c34656290eccae4 ****/
		%feature("compactdefaultargs") ZoomFactor;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ZoomFactor;
		Standard_Real ZoomFactor();

};


%make_alias(XCAFView_Object)

%extend XCAFView_Object {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
