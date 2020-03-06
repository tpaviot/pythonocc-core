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

class XCAFView_ProjectionType:
	XCAFView_ProjectionType_NoCamera = 0
	XCAFView_ProjectionType_Parallel = 1
	XCAFView_ProjectionType_Central = 2
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
		%feature("compactdefaultargs") XCAFView_Object;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XCAFView_Object;
		 XCAFView_Object();

		/****************** XCAFView_Object ******************/
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
		%feature("compactdefaultargs") BackPlaneDistance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") BackPlaneDistance;
		Standard_Real BackPlaneDistance();

		/****************** ClippingExpression ******************/
		%feature("compactdefaultargs") ClippingExpression;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ClippingExpression;
		opencascade::handle<TCollection_HAsciiString> ClippingExpression();

		/****************** CreateGDTPoints ******************/
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
		%feature("compactdefaultargs") FrontPlaneDistance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FrontPlaneDistance;
		Standard_Real FrontPlaneDistance();

		/****************** GDTPoint ******************/
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
		%feature("compactdefaultargs") HasBackPlaneClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasBackPlaneClipping;
		Standard_Boolean HasBackPlaneClipping();

		/****************** HasFrontPlaneClipping ******************/
		%feature("compactdefaultargs") HasFrontPlaneClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasFrontPlaneClipping;
		Standard_Boolean HasFrontPlaneClipping();

		/****************** HasGDTPoints ******************/
		%feature("compactdefaultargs") HasGDTPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasGDTPoints;
		Standard_Boolean HasGDTPoints();

		/****************** HasViewVolumeSidesClipping ******************/
		%feature("compactdefaultargs") HasViewVolumeSidesClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasViewVolumeSidesClipping;
		Standard_Boolean HasViewVolumeSidesClipping();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbGDTPoints ******************/
		%feature("compactdefaultargs") NbGDTPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbGDTPoints;
		Standard_Integer NbGDTPoints();

		/****************** ProjectionPoint ******************/
		%feature("compactdefaultargs") ProjectionPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") ProjectionPoint;
		gp_Pnt ProjectionPoint();

		/****************** SetBackPlaneDistance ******************/
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
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
XCAFView_ProjectionType
") Type;
		XCAFView_ProjectionType Type();

		/****************** UnsetBackPlaneClipping ******************/
		%feature("compactdefaultargs") UnsetBackPlaneClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetBackPlaneClipping;
		void UnsetBackPlaneClipping();

		/****************** UnsetFrontPlaneClipping ******************/
		%feature("compactdefaultargs") UnsetFrontPlaneClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UnsetFrontPlaneClipping;
		void UnsetFrontPlaneClipping();

		/****************** UpDirection ******************/
		%feature("compactdefaultargs") UpDirection;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") UpDirection;
		gp_Dir UpDirection();

		/****************** ViewDirection ******************/
		%feature("compactdefaultargs") ViewDirection;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") ViewDirection;
		gp_Dir ViewDirection();

		/****************** WindowHorizontalSize ******************/
		%feature("compactdefaultargs") WindowHorizontalSize;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") WindowHorizontalSize;
		Standard_Real WindowHorizontalSize();

		/****************** WindowVerticalSize ******************/
		%feature("compactdefaultargs") WindowVerticalSize;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") WindowVerticalSize;
		Standard_Real WindowVerticalSize();

		/****************** ZoomFactor ******************/
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
