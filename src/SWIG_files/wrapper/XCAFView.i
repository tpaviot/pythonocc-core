/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
enum XCAFView_ProjectionType {
	XCAFView_ProjectionType_NoCamera = 0,
	XCAFView_ProjectionType_Parallel = 1,
	XCAFView_ProjectionType_Central = 2,
};

/* end public enums declaration */

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
		/****************** BackPlaneDistance ******************/
		%feature("compactdefaultargs") BackPlaneDistance;
		%feature("autodoc", ":rtype: float") BackPlaneDistance;
		Standard_Real BackPlaneDistance ();

		/****************** ClippingExpression ******************/
		%feature("compactdefaultargs") ClippingExpression;
		%feature("autodoc", ":rtype: opencascade::handle<TCollection_HAsciiString>") ClippingExpression;
		opencascade::handle<TCollection_HAsciiString> ClippingExpression ();

		/****************** CreateGDTPoints ******************/
		%feature("compactdefaultargs") CreateGDTPoints;
		%feature("autodoc", ":param theLenght:
	:type theLenght: int
	:rtype: None") CreateGDTPoints;
		void CreateGDTPoints (const Standard_Integer theLenght);

		/****************** FrontPlaneDistance ******************/
		%feature("compactdefaultargs") FrontPlaneDistance;
		%feature("autodoc", ":rtype: float") FrontPlaneDistance;
		Standard_Real FrontPlaneDistance ();

		/****************** GDTPoint ******************/
		%feature("compactdefaultargs") GDTPoint;
		%feature("autodoc", ":param theIndex:
	:type theIndex: int
	:rtype: gp_Pnt") GDTPoint;
		gp_Pnt GDTPoint (const Standard_Integer theIndex);

		/****************** HasBackPlaneClipping ******************/
		%feature("compactdefaultargs") HasBackPlaneClipping;
		%feature("autodoc", ":rtype: bool") HasBackPlaneClipping;
		Standard_Boolean HasBackPlaneClipping ();

		/****************** HasFrontPlaneClipping ******************/
		%feature("compactdefaultargs") HasFrontPlaneClipping;
		%feature("autodoc", ":rtype: bool") HasFrontPlaneClipping;
		Standard_Boolean HasFrontPlaneClipping ();

		/****************** HasGDTPoints ******************/
		%feature("compactdefaultargs") HasGDTPoints;
		%feature("autodoc", ":rtype: bool") HasGDTPoints;
		Standard_Boolean HasGDTPoints ();

		/****************** HasViewVolumeSidesClipping ******************/
		%feature("compactdefaultargs") HasViewVolumeSidesClipping;
		%feature("autodoc", ":rtype: bool") HasViewVolumeSidesClipping;
		Standard_Boolean HasViewVolumeSidesClipping ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", ":rtype: opencascade::handle<TCollection_HAsciiString>") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();

		/****************** NbGDTPoints ******************/
		%feature("compactdefaultargs") NbGDTPoints;
		%feature("autodoc", ":rtype: int") NbGDTPoints;
		Standard_Integer NbGDTPoints ();

		/****************** ProjectionPoint ******************/
		%feature("compactdefaultargs") ProjectionPoint;
		%feature("autodoc", ":rtype: gp_Pnt") ProjectionPoint;
		gp_Pnt ProjectionPoint ();

		/****************** SetBackPlaneDistance ******************/
		%feature("compactdefaultargs") SetBackPlaneDistance;
		%feature("autodoc", ":param theDistance:
	:type theDistance: float
	:rtype: None") SetBackPlaneDistance;
		void SetBackPlaneDistance (Standard_Real theDistance);

		/****************** SetClippingExpression ******************/
		%feature("compactdefaultargs") SetClippingExpression;
		%feature("autodoc", ":param theExpression:
	:type theExpression: TCollection_HAsciiString
	:rtype: None") SetClippingExpression;
		void SetClippingExpression (opencascade::handle<TCollection_HAsciiString> theExpression);

		/****************** SetFrontPlaneDistance ******************/
		%feature("compactdefaultargs") SetFrontPlaneDistance;
		%feature("autodoc", ":param theDistance:
	:type theDistance: float
	:rtype: None") SetFrontPlaneDistance;
		void SetFrontPlaneDistance (Standard_Real theDistance);

		/****************** SetGDTPoint ******************/
		%feature("compactdefaultargs") SetGDTPoint;
		%feature("autodoc", ":param theIndex:
	:type theIndex: int
	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: None") SetGDTPoint;
		void SetGDTPoint (const Standard_Integer theIndex,const gp_Pnt thePoint);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", ":param theName:
	:type theName: TCollection_HAsciiString
	:rtype: None") SetName;
		void SetName (opencascade::handle<TCollection_HAsciiString> theName);

		/****************** SetProjectionPoint ******************/
		%feature("compactdefaultargs") SetProjectionPoint;
		%feature("autodoc", ":param thePoint:
	:type thePoint: gp_Pnt
	:rtype: None") SetProjectionPoint;
		void SetProjectionPoint (gp_Pnt thePoint);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", ":param theType:
	:type theType: XCAFView_ProjectionType
	:rtype: None") SetType;
		void SetType (XCAFView_ProjectionType theType);

		/****************** SetUpDirection ******************/
		%feature("compactdefaultargs") SetUpDirection;
		%feature("autodoc", ":param theDirection:
	:type theDirection: gp_Dir
	:rtype: None") SetUpDirection;
		void SetUpDirection (gp_Dir theDirection);

		/****************** SetViewDirection ******************/
		%feature("compactdefaultargs") SetViewDirection;
		%feature("autodoc", ":param theDirection:
	:type theDirection: gp_Dir
	:rtype: None") SetViewDirection;
		void SetViewDirection (gp_Dir theDirection);

		/****************** SetViewVolumeSidesClipping ******************/
		%feature("compactdefaultargs") SetViewVolumeSidesClipping;
		%feature("autodoc", ":param theViewVolumeSidesClipping:
	:type theViewVolumeSidesClipping: bool
	:rtype: None") SetViewVolumeSidesClipping;
		void SetViewVolumeSidesClipping (Standard_Boolean theViewVolumeSidesClipping);

		/****************** SetWindowHorizontalSize ******************/
		%feature("compactdefaultargs") SetWindowHorizontalSize;
		%feature("autodoc", ":param theSize:
	:type theSize: float
	:rtype: None") SetWindowHorizontalSize;
		void SetWindowHorizontalSize (Standard_Real theSize);

		/****************** SetWindowVerticalSize ******************/
		%feature("compactdefaultargs") SetWindowVerticalSize;
		%feature("autodoc", ":param theSize:
	:type theSize: float
	:rtype: None") SetWindowVerticalSize;
		void SetWindowVerticalSize (Standard_Real theSize);

		/****************** SetZoomFactor ******************/
		%feature("compactdefaultargs") SetZoomFactor;
		%feature("autodoc", ":param theZoomFactor:
	:type theZoomFactor: float
	:rtype: None") SetZoomFactor;
		void SetZoomFactor (Standard_Real theZoomFactor);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", ":rtype: XCAFView_ProjectionType") Type;
		XCAFView_ProjectionType Type ();

		/****************** UnsetBackPlaneClipping ******************/
		%feature("compactdefaultargs") UnsetBackPlaneClipping;
		%feature("autodoc", ":rtype: None") UnsetBackPlaneClipping;
		void UnsetBackPlaneClipping ();

		/****************** UnsetFrontPlaneClipping ******************/
		%feature("compactdefaultargs") UnsetFrontPlaneClipping;
		%feature("autodoc", ":rtype: None") UnsetFrontPlaneClipping;
		void UnsetFrontPlaneClipping ();

		/****************** UpDirection ******************/
		%feature("compactdefaultargs") UpDirection;
		%feature("autodoc", ":rtype: gp_Dir") UpDirection;
		gp_Dir UpDirection ();

		/****************** ViewDirection ******************/
		%feature("compactdefaultargs") ViewDirection;
		%feature("autodoc", ":rtype: gp_Dir") ViewDirection;
		gp_Dir ViewDirection ();

		/****************** WindowHorizontalSize ******************/
		%feature("compactdefaultargs") WindowHorizontalSize;
		%feature("autodoc", ":rtype: float") WindowHorizontalSize;
		Standard_Real WindowHorizontalSize ();

		/****************** WindowVerticalSize ******************/
		%feature("compactdefaultargs") WindowVerticalSize;
		%feature("autodoc", ":rtype: float") WindowVerticalSize;
		Standard_Real WindowVerticalSize ();

		/****************** XCAFView_Object ******************/
		%feature("compactdefaultargs") XCAFView_Object;
		%feature("autodoc", ":rtype: None") XCAFView_Object;
		 XCAFView_Object ();

		/****************** XCAFView_Object ******************/
		%feature("compactdefaultargs") XCAFView_Object;
		%feature("autodoc", ":param theObj:
	:type theObj: XCAFView_Object
	:rtype: None") XCAFView_Object;
		 XCAFView_Object (const opencascade::handle<XCAFView_Object> & theObj);

		/****************** ZoomFactor ******************/
		%feature("compactdefaultargs") ZoomFactor;
		%feature("autodoc", ":rtype: float") ZoomFactor;
		Standard_Real ZoomFactor ();

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
