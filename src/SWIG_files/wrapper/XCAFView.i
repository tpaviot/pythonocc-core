/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_xcafview.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
		/****** XCAFView_Object::XCAFView_Object ******/
		/****** md5 signature: 26ce653870ccdec920dcbae3ab909356 ******/
		%feature("compactdefaultargs") XCAFView_Object;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XCAFView_Object;
		 XCAFView_Object();

		/****** XCAFView_Object::XCAFView_Object ******/
		/****** md5 signature: f8e301489d23f4598c759665d31bdc88 ******/
		%feature("compactdefaultargs") XCAFView_Object;
		%feature("autodoc", "
Parameters
----------
theObj: XCAFView_Object

Return
-------
None

Description
-----------
No available documentation.
") XCAFView_Object;
		 XCAFView_Object(const opencascade::handle<XCAFView_Object> & theObj);

		/****** XCAFView_Object::BackPlaneDistance ******/
		/****** md5 signature: c1c25d1808cea203dfc63ffc325003b3 ******/
		%feature("compactdefaultargs") BackPlaneDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") BackPlaneDistance;
		Standard_Real BackPlaneDistance();

		/****** XCAFView_Object::ClippingExpression ******/
		/****** md5 signature: e45478706e1196e137725a20cefd9687 ******/
		%feature("compactdefaultargs") ClippingExpression;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") ClippingExpression;
		opencascade::handle<TCollection_HAsciiString> ClippingExpression();

		/****** XCAFView_Object::CreateGDTPoints ******/
		/****** md5 signature: d124bf536f975261e19a6f1e118ac509 ******/
		%feature("compactdefaultargs") CreateGDTPoints;
		%feature("autodoc", "
Parameters
----------
theLenght: int

Return
-------
None

Description
-----------
No available documentation.
") CreateGDTPoints;
		void CreateGDTPoints(const Standard_Integer theLenght);

		/****** XCAFView_Object::FrontPlaneDistance ******/
		/****** md5 signature: 46b64b674ae4f0d138a3933e44b5a504 ******/
		%feature("compactdefaultargs") FrontPlaneDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FrontPlaneDistance;
		Standard_Real FrontPlaneDistance();

		/****** XCAFView_Object::GDTPoint ******/
		/****** md5 signature: 07b7df86a4b242da9ab06a2f83eab29d ******/
		%feature("compactdefaultargs") GDTPoint;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") GDTPoint;
		gp_Pnt GDTPoint(const Standard_Integer theIndex);

		/****** XCAFView_Object::HasBackPlaneClipping ******/
		/****** md5 signature: ecc9f51e5c54049b8180bc3d82fecd3c ******/
		%feature("compactdefaultargs") HasBackPlaneClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasBackPlaneClipping;
		Standard_Boolean HasBackPlaneClipping();

		/****** XCAFView_Object::HasFrontPlaneClipping ******/
		/****** md5 signature: a3e22d2f9ba08e42c94401138774b26e ******/
		%feature("compactdefaultargs") HasFrontPlaneClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasFrontPlaneClipping;
		Standard_Boolean HasFrontPlaneClipping();

		/****** XCAFView_Object::HasGDTPoints ******/
		/****** md5 signature: 18e8604b8670eafae4689f3bcb664edb ******/
		%feature("compactdefaultargs") HasGDTPoints;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasGDTPoints;
		Standard_Boolean HasGDTPoints();

		/****** XCAFView_Object::HasViewVolumeSidesClipping ******/
		/****** md5 signature: c6a4308226e4aae2e161c2fae714018a ******/
		%feature("compactdefaultargs") HasViewVolumeSidesClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasViewVolumeSidesClipping;
		Standard_Boolean HasViewVolumeSidesClipping();

		/****** XCAFView_Object::Name ******/
		/****** md5 signature: a2f16cf431bd3ce387ff8e8fc2eeffe1 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** XCAFView_Object::NbGDTPoints ******/
		/****** md5 signature: a5494b7b540b3c6bd6cbbe02319a6eeb ******/
		%feature("compactdefaultargs") NbGDTPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbGDTPoints;
		Standard_Integer NbGDTPoints();

		/****** XCAFView_Object::ProjectionPoint ******/
		/****** md5 signature: c85ce9f39d341a982dc7b405825f2581 ******/
		%feature("compactdefaultargs") ProjectionPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") ProjectionPoint;
		gp_Pnt ProjectionPoint();

		/****** XCAFView_Object::SetBackPlaneDistance ******/
		/****** md5 signature: 5e87ab6fe25726e46af15c428a6bd268 ******/
		%feature("compactdefaultargs") SetBackPlaneDistance;
		%feature("autodoc", "
Parameters
----------
theDistance: float

Return
-------
None

Description
-----------
No available documentation.
") SetBackPlaneDistance;
		void SetBackPlaneDistance(Standard_Real theDistance);

		/****** XCAFView_Object::SetClippingExpression ******/
		/****** md5 signature: b789225cb90d8555ec9c0d4ceb58f915 ******/
		%feature("compactdefaultargs") SetClippingExpression;
		%feature("autodoc", "
Parameters
----------
theExpression: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetClippingExpression;
		void SetClippingExpression(opencascade::handle<TCollection_HAsciiString > theExpression);

		/****** XCAFView_Object::SetFrontPlaneDistance ******/
		/****** md5 signature: 443b1317d6f4077efa5428592305573d ******/
		%feature("compactdefaultargs") SetFrontPlaneDistance;
		%feature("autodoc", "
Parameters
----------
theDistance: float

Return
-------
None

Description
-----------
No available documentation.
") SetFrontPlaneDistance;
		void SetFrontPlaneDistance(Standard_Real theDistance);

		/****** XCAFView_Object::SetGDTPoint ******/
		/****** md5 signature: 3dee4280a8434a0d76707dbe5f8b7819 ******/
		%feature("compactdefaultargs") SetGDTPoint;
		%feature("autodoc", "
Parameters
----------
theIndex: int
thePoint: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetGDTPoint;
		void SetGDTPoint(const Standard_Integer theIndex, const gp_Pnt & thePoint);

		/****** XCAFView_Object::SetName ******/
		/****** md5 signature: 5a1093e3141e426b70566411902bc345 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(opencascade::handle<TCollection_HAsciiString > theName);

		/****** XCAFView_Object::SetProjectionPoint ******/
		/****** md5 signature: 19026b95ec0255a010e1c46d7876ef42 ******/
		%feature("compactdefaultargs") SetProjectionPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetProjectionPoint;
		void SetProjectionPoint(const gp_Pnt & thePoint);

		/****** XCAFView_Object::SetType ******/
		/****** md5 signature: f0d13799e0fc97053a52a9b545460075 ******/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "
Parameters
----------
theType: XCAFView_ProjectionType

Return
-------
None

Description
-----------
No available documentation.
") SetType;
		void SetType(XCAFView_ProjectionType theType);

		/****** XCAFView_Object::SetUpDirection ******/
		/****** md5 signature: dff1fffc8f21df6ca1742b9919dd9f4d ******/
		%feature("compactdefaultargs") SetUpDirection;
		%feature("autodoc", "
Parameters
----------
theDirection: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") SetUpDirection;
		void SetUpDirection(const gp_Dir & theDirection);

		/****** XCAFView_Object::SetViewDirection ******/
		/****** md5 signature: d2b48e3c989a7dd82d24ce335e3b28eb ******/
		%feature("compactdefaultargs") SetViewDirection;
		%feature("autodoc", "
Parameters
----------
theDirection: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") SetViewDirection;
		void SetViewDirection(const gp_Dir & theDirection);

		/****** XCAFView_Object::SetViewVolumeSidesClipping ******/
		/****** md5 signature: 8e109040f01baed9ca80d38d53a8743b ******/
		%feature("compactdefaultargs") SetViewVolumeSidesClipping;
		%feature("autodoc", "
Parameters
----------
theViewVolumeSidesClipping: bool

Return
-------
None

Description
-----------
No available documentation.
") SetViewVolumeSidesClipping;
		void SetViewVolumeSidesClipping(Standard_Boolean theViewVolumeSidesClipping);

		/****** XCAFView_Object::SetWindowHorizontalSize ******/
		/****** md5 signature: 42c3fca900471278cb988aa4a0f4205d ******/
		%feature("compactdefaultargs") SetWindowHorizontalSize;
		%feature("autodoc", "
Parameters
----------
theSize: float

Return
-------
None

Description
-----------
No available documentation.
") SetWindowHorizontalSize;
		void SetWindowHorizontalSize(Standard_Real theSize);

		/****** XCAFView_Object::SetWindowVerticalSize ******/
		/****** md5 signature: e0fc956b19454b156da6371c5775699b ******/
		%feature("compactdefaultargs") SetWindowVerticalSize;
		%feature("autodoc", "
Parameters
----------
theSize: float

Return
-------
None

Description
-----------
No available documentation.
") SetWindowVerticalSize;
		void SetWindowVerticalSize(Standard_Real theSize);

		/****** XCAFView_Object::SetZoomFactor ******/
		/****** md5 signature: 1b1c2f60b468087057daf9984dce5697 ******/
		%feature("compactdefaultargs") SetZoomFactor;
		%feature("autodoc", "
Parameters
----------
theZoomFactor: float

Return
-------
None

Description
-----------
No available documentation.
") SetZoomFactor;
		void SetZoomFactor(Standard_Real theZoomFactor);

		/****** XCAFView_Object::Type ******/
		/****** md5 signature: 32aa483fbc3733810fa598642ebbd7a6 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
XCAFView_ProjectionType

Description
-----------
No available documentation.
") Type;
		XCAFView_ProjectionType Type();

		/****** XCAFView_Object::UnsetBackPlaneClipping ******/
		/****** md5 signature: 193430871ceb6f70110096911a73384d ******/
		%feature("compactdefaultargs") UnsetBackPlaneClipping;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetBackPlaneClipping;
		void UnsetBackPlaneClipping();

		/****** XCAFView_Object::UnsetFrontPlaneClipping ******/
		/****** md5 signature: cb76e740d876095da6d5e7d8592c35ae ******/
		%feature("compactdefaultargs") UnsetFrontPlaneClipping;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnsetFrontPlaneClipping;
		void UnsetFrontPlaneClipping();

		/****** XCAFView_Object::UpDirection ******/
		/****** md5 signature: 90819ca369ece69dcc65f5431c46ca9a ******/
		%feature("compactdefaultargs") UpDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") UpDirection;
		gp_Dir UpDirection();

		/****** XCAFView_Object::ViewDirection ******/
		/****** md5 signature: e5b4ef6b1c3592b2af932d02de30ae78 ******/
		%feature("compactdefaultargs") ViewDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") ViewDirection;
		gp_Dir ViewDirection();

		/****** XCAFView_Object::WindowHorizontalSize ******/
		/****** md5 signature: 54afb51de6fb2f5b86db9ff4102ffbca ******/
		%feature("compactdefaultargs") WindowHorizontalSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") WindowHorizontalSize;
		Standard_Real WindowHorizontalSize();

		/****** XCAFView_Object::WindowVerticalSize ******/
		/****** md5 signature: 5c230d606147b30d953d21382aadf8bf ******/
		%feature("compactdefaultargs") WindowVerticalSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") WindowVerticalSize;
		Standard_Real WindowVerticalSize();

		/****** XCAFView_Object::ZoomFactor ******/
		/****** md5 signature: b045662a2fb19f056c34656290eccae4 ******/
		%feature("compactdefaultargs") ZoomFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
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
/* class aliases */
%pythoncode {
}
