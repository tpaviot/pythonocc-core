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
		/****** md5 signature: 7148b5f863761651642e1ca9178d0a21 ******/
		%feature("compactdefaultargs") BackPlaneDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") BackPlaneDistance;
		double BackPlaneDistance();

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
		/****** md5 signature: 3585985071a93fbd303d83c0dab6688c ******/
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
		void CreateGDTPoints(const int theLenght);

		/****** XCAFView_Object::FrontPlaneDistance ******/
		/****** md5 signature: ee28f1561fd6c442260a8018d1536d82 ******/
		%feature("compactdefaultargs") FrontPlaneDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FrontPlaneDistance;
		double FrontPlaneDistance();

		/****** XCAFView_Object::GDTPoint ******/
		/****** md5 signature: 967b48da8f0cc2d4f06a7b3d0e3245c3 ******/
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
		gp_Pnt GDTPoint(const int theIndex);

		/****** XCAFView_Object::HasBackPlaneClipping ******/
		/****** md5 signature: 4c791c5f88ec6a0c9ecefb678505143f ******/
		%feature("compactdefaultargs") HasBackPlaneClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasBackPlaneClipping;
		bool HasBackPlaneClipping();

		/****** XCAFView_Object::HasFrontPlaneClipping ******/
		/****** md5 signature: 7547768de939a2e5fa88f0ca1d8546dc ******/
		%feature("compactdefaultargs") HasFrontPlaneClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasFrontPlaneClipping;
		bool HasFrontPlaneClipping();

		/****** XCAFView_Object::HasGDTPoints ******/
		/****** md5 signature: feb3a16979ec6f0f19144136b0deb638 ******/
		%feature("compactdefaultargs") HasGDTPoints;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasGDTPoints;
		bool HasGDTPoints();

		/****** XCAFView_Object::HasViewVolumeSidesClipping ******/
		/****** md5 signature: 68a58a3687d3b6137e2129de674fcde4 ******/
		%feature("compactdefaultargs") HasViewVolumeSidesClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasViewVolumeSidesClipping;
		bool HasViewVolumeSidesClipping();

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
		/****** md5 signature: 3a7a86701dcec1dec855c6284e770bd7 ******/
		%feature("compactdefaultargs") NbGDTPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbGDTPoints;
		int NbGDTPoints();

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
		/****** md5 signature: d3ef63e4235a6420b8f74a808ce2d417 ******/
		%feature("compactdefaultargs") SetBackPlaneDistance;
		%feature("autodoc", "
Parameters
----------
theDistance: double

Return
-------
None

Description
-----------
No available documentation.
") SetBackPlaneDistance;
		void SetBackPlaneDistance(double theDistance);

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
		/****** md5 signature: 1adc1e1d8f8eb899e05dcf0f9a9a188d ******/
		%feature("compactdefaultargs") SetFrontPlaneDistance;
		%feature("autodoc", "
Parameters
----------
theDistance: double

Return
-------
None

Description
-----------
No available documentation.
") SetFrontPlaneDistance;
		void SetFrontPlaneDistance(double theDistance);

		/****** XCAFView_Object::SetGDTPoint ******/
		/****** md5 signature: b2af18edf946eeeb1cc265acb1f5441e ******/
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
		void SetGDTPoint(const int theIndex, const gp_Pnt & thePoint);

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
		/****** md5 signature: fa0f56910724cdeab5a9879d404337df ******/
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
		void SetViewVolumeSidesClipping(bool theViewVolumeSidesClipping);

		/****** XCAFView_Object::SetWindowHorizontalSize ******/
		/****** md5 signature: eef94cdebdc8eda1416e9b18cc2d19f7 ******/
		%feature("compactdefaultargs") SetWindowHorizontalSize;
		%feature("autodoc", "
Parameters
----------
theSize: double

Return
-------
None

Description
-----------
No available documentation.
") SetWindowHorizontalSize;
		void SetWindowHorizontalSize(double theSize);

		/****** XCAFView_Object::SetWindowVerticalSize ******/
		/****** md5 signature: 437f0adc0f9a5dc2c0afe12c186ae859 ******/
		%feature("compactdefaultargs") SetWindowVerticalSize;
		%feature("autodoc", "
Parameters
----------
theSize: double

Return
-------
None

Description
-----------
No available documentation.
") SetWindowVerticalSize;
		void SetWindowVerticalSize(double theSize);

		/****** XCAFView_Object::SetZoomFactor ******/
		/****** md5 signature: 422c7b7c5a32ca0a56102e5da7be2e68 ******/
		%feature("compactdefaultargs") SetZoomFactor;
		%feature("autodoc", "
Parameters
----------
theZoomFactor: double

Return
-------
None

Description
-----------
No available documentation.
") SetZoomFactor;
		void SetZoomFactor(double theZoomFactor);

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
		/****** md5 signature: 291e22a884ebae42d869b5b3246e8162 ******/
		%feature("compactdefaultargs") WindowHorizontalSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") WindowHorizontalSize;
		double WindowHorizontalSize();

		/****** XCAFView_Object::WindowVerticalSize ******/
		/****** md5 signature: 0e1cd6cc839cbb266fa314b1e0b5ea9a ******/
		%feature("compactdefaultargs") WindowVerticalSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") WindowVerticalSize;
		double WindowVerticalSize();

		/****** XCAFView_Object::ZoomFactor ******/
		/****** md5 signature: 72108e802f11e6ec5a7ff36e77d257dd ******/
		%feature("compactdefaultargs") ZoomFactor;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ZoomFactor;
		double ZoomFactor();

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
