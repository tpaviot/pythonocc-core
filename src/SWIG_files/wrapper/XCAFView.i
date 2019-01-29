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
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=XCAFVIEWDOCSTRING) XCAFView

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include XCAFView_headers.i

/* templates */
/* end templates declaration */


/* typedefs */
/* end typedefs declaration */

/* public enums */
enum XCAFView_ProjectionType {
	XCAFView_ProjectionType_NoCamera = 0,
	XCAFView_ProjectionType_Parallel = 1,
	XCAFView_ProjectionType_Central = 2,
};

/* end public enums declaration */

%wrap_handle(XCAFView_Object)

%nodefaultctor XCAFView_Object;
class XCAFView_Object : public Standard_Transient {
	public:
		%feature("compactdefaultargs") BackPlaneDistance;
		%feature("autodoc", "	:rtype: float
") BackPlaneDistance;
		Standard_Real BackPlaneDistance ();
		%feature("compactdefaultargs") ClippingExpression;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") ClippingExpression;
		Handle_TCollection_HAsciiString ClippingExpression ();
		%feature("compactdefaultargs") CreateGDTPoints;
		%feature("autodoc", "	:param theLenght:
	:type theLenght: int
	:rtype: None
") CreateGDTPoints;
		void CreateGDTPoints (const Standard_Integer theLenght);
		%feature("compactdefaultargs") FrontPlaneDistance;
		%feature("autodoc", "	:rtype: float
") FrontPlaneDistance;
		Standard_Real FrontPlaneDistance ();
		%feature("compactdefaultargs") GDTPoint;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: gp_Pnt
") GDTPoint;
		gp_Pnt GDTPoint (const Standard_Integer theIndex);
		%feature("compactdefaultargs") HasBackPlaneClipping;
		%feature("autodoc", "	:rtype: bool
") HasBackPlaneClipping;
		Standard_Boolean HasBackPlaneClipping ();
		%feature("compactdefaultargs") HasFrontPlaneClipping;
		%feature("autodoc", "	:rtype: bool
") HasFrontPlaneClipping;
		Standard_Boolean HasFrontPlaneClipping ();
		%feature("compactdefaultargs") HasGDTPoints;
		%feature("autodoc", "	:rtype: bool
") HasGDTPoints;
		Standard_Boolean HasGDTPoints ();
		%feature("compactdefaultargs") HasViewVolumeSidesClipping;
		%feature("autodoc", "	:rtype: bool
") HasViewVolumeSidesClipping;
		Standard_Boolean HasViewVolumeSidesClipping ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") NbGDTPoints;
		%feature("autodoc", "	:rtype: int
") NbGDTPoints;
		Standard_Integer NbGDTPoints ();
		%feature("compactdefaultargs") ProjectionPoint;
		%feature("autodoc", "	:rtype: gp_Pnt
") ProjectionPoint;
		gp_Pnt ProjectionPoint ();
		%feature("compactdefaultargs") SetBackPlaneDistance;
		%feature("autodoc", "	:param theDistance:
	:type theDistance: float
	:rtype: None
") SetBackPlaneDistance;
		void SetBackPlaneDistance (Standard_Real theDistance);
		%feature("compactdefaultargs") SetClippingExpression;
		%feature("autodoc", "	:param theExpression:
	:type theExpression: Handle_TCollection_HAsciiString
	:rtype: None
") SetClippingExpression;
		void SetClippingExpression (Handle_TCollection_HAsciiString theExpression);
		%feature("compactdefaultargs") SetFrontPlaneDistance;
		%feature("autodoc", "	:param theDistance:
	:type theDistance: float
	:rtype: None
") SetFrontPlaneDistance;
		void SetFrontPlaneDistance (Standard_Real theDistance);
		%feature("compactdefaultargs") SetGDTPoint;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: None
") SetGDTPoint;
		void SetGDTPoint (const Standard_Integer theIndex,const gp_Pnt thePoint);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param theName:
	:type theName: Handle_TCollection_HAsciiString
	:rtype: None
") SetName;
		void SetName (Handle_TCollection_HAsciiString theName);
		%feature("compactdefaultargs") SetProjectionPoint;
		%feature("autodoc", "	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: None
") SetProjectionPoint;
		void SetProjectionPoint (gp_Pnt thePoint);
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	:param theType:
	:type theType: XCAFView_ProjectionType
	:rtype: None
") SetType;
		void SetType (XCAFView_ProjectionType theType);
		%feature("compactdefaultargs") SetUpDirection;
		%feature("autodoc", "	:param theDirection:
	:type theDirection: gp_Dir
	:rtype: None
") SetUpDirection;
		void SetUpDirection (gp_Dir theDirection);
		%feature("compactdefaultargs") SetViewDirection;
		%feature("autodoc", "	:param theDirection:
	:type theDirection: gp_Dir
	:rtype: None
") SetViewDirection;
		void SetViewDirection (gp_Dir theDirection);
		%feature("compactdefaultargs") SetViewVolumeSidesClipping;
		%feature("autodoc", "	:param theViewVolumeSidesClipping:
	:type theViewVolumeSidesClipping: bool
	:rtype: None
") SetViewVolumeSidesClipping;
		void SetViewVolumeSidesClipping (Standard_Boolean theViewVolumeSidesClipping);
		%feature("compactdefaultargs") SetWindowHorizontalSize;
		%feature("autodoc", "	:param theSize:
	:type theSize: float
	:rtype: None
") SetWindowHorizontalSize;
		void SetWindowHorizontalSize (Standard_Real theSize);
		%feature("compactdefaultargs") SetWindowVerticalSize;
		%feature("autodoc", "	:param theSize:
	:type theSize: float
	:rtype: None
") SetWindowVerticalSize;
		void SetWindowVerticalSize (Standard_Real theSize);
		%feature("compactdefaultargs") SetZoomFactor;
		%feature("autodoc", "	:param theZoomFactor:
	:type theZoomFactor: float
	:rtype: None
") SetZoomFactor;
		void SetZoomFactor (Standard_Real theZoomFactor);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: XCAFView_ProjectionType
") Type;
		XCAFView_ProjectionType Type ();
		%feature("compactdefaultargs") UnsetBackPlaneClipping;
		%feature("autodoc", "	:rtype: None
") UnsetBackPlaneClipping;
		void UnsetBackPlaneClipping ();
		%feature("compactdefaultargs") UnsetFrontPlaneClipping;
		%feature("autodoc", "	:rtype: None
") UnsetFrontPlaneClipping;
		void UnsetFrontPlaneClipping ();
		%feature("compactdefaultargs") UpDirection;
		%feature("autodoc", "	:rtype: gp_Dir
") UpDirection;
		gp_Dir UpDirection ();
		%feature("compactdefaultargs") ViewDirection;
		%feature("autodoc", "	:rtype: gp_Dir
") ViewDirection;
		gp_Dir ViewDirection ();
		%feature("compactdefaultargs") WindowHorizontalSize;
		%feature("autodoc", "	:rtype: float
") WindowHorizontalSize;
		Standard_Real WindowHorizontalSize ();
		%feature("compactdefaultargs") WindowVerticalSize;
		%feature("autodoc", "	:rtype: float
") WindowVerticalSize;
		Standard_Real WindowVerticalSize ();
		%feature("compactdefaultargs") XCAFView_Object;
		%feature("autodoc", "	:rtype: None
") XCAFView_Object;
		 XCAFView_Object ();
		%feature("compactdefaultargs") XCAFView_Object;
		%feature("autodoc", "	:param theObj:
	:type theObj: Handle_XCAFView_Object &
	:rtype: None
") XCAFView_Object;
		 XCAFView_Object (const Handle_XCAFView_Object & theObj);
		%feature("compactdefaultargs") ZoomFactor;
		%feature("autodoc", "	:rtype: float
") ZoomFactor;
		Standard_Real ZoomFactor ();
};


%make_alias(XCAFView_Object)

%extend XCAFView_Object {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
