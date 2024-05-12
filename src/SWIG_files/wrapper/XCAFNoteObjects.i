/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
%define XCAFNOTEOBJECTSDOCSTRING
"XCAFNoteObjects module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_xcafnoteobjects.html"
%enddef
%module (package="OCC.Core", docstring=XCAFNOTEOBJECTSDOCSTRING) XCAFNoteObjects


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
#include<XCAFNoteObjects_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TopoDS_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TopoDS.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(XCAFNoteObjects_NoteObject)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***********************************
* class XCAFNoteObjects_NoteObject *
***********************************/
class XCAFNoteObjects_NoteObject : public Standard_Transient {
	public:
		/****************** XCAFNoteObjects_NoteObject ******************/
		/**** md5 signature: 357f3a705f8cd028a73286f89bb8e6f5 ****/
		%feature("compactdefaultargs") XCAFNoteObjects_NoteObject;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty object.
") XCAFNoteObjects_NoteObject;
		 XCAFNoteObjects_NoteObject();

		/****************** XCAFNoteObjects_NoteObject ******************/
		/**** md5 signature: 1e85291b29eafb63444f490fe4fb2ff8 ****/
		%feature("compactdefaultargs") XCAFNoteObjects_NoteObject;
		%feature("autodoc", "
Parameters
----------
theObj: XCAFNoteObjects_NoteObject

Return
-------
None

Description
-----------
Copy constructor.
") XCAFNoteObjects_NoteObject;
		 XCAFNoteObjects_NoteObject(const opencascade::handle<XCAFNoteObjects_NoteObject> & theObj);

		/****************** GetPlane ******************/
		/**** md5 signature: 236cce5d8f8ab5feac0e3f6311bd05f0 ****/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns a right-handed coordinate system of the plane.
") GetPlane;
		const gp_Ax2 GetPlane();

		/****************** GetPoint ******************/
		/**** md5 signature: 75bde715a8ee43e7500d44b575591a80 ****/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the attachment point on the annotated object.
") GetPoint;
		const gp_Pnt GetPoint();

		/****************** GetPointText ******************/
		/**** md5 signature: 06c6e417556426891d63389a3d4f891d ****/
		%feature("compactdefaultargs") GetPointText;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the text position.
") GetPointText;
		const gp_Pnt GetPointText();

		/****************** GetPresentation ******************/
		/**** md5 signature: bbc5f4d37a92b27b1fad241f99fa7409 ****/
		%feature("compactdefaultargs") GetPresentation;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns a tessellated annotation if specified.
") GetPresentation;
		const TopoDS_Shape GetPresentation();

		/****************** HasPlane ******************/
		/**** md5 signature: 7cf03566771455c19f444d8a2236d65d ****/
		%feature("compactdefaultargs") HasPlane;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if plane is specified.
") HasPlane;
		Standard_Boolean HasPlane();

		/****************** HasPoint ******************/
		/**** md5 signature: 8de3c013a7c1611c02e38dffb22d1c6b ****/
		%feature("compactdefaultargs") HasPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the attachment point on the annotated object is specified.
") HasPoint;
		Standard_Boolean HasPoint();

		/****************** HasPointText ******************/
		/**** md5 signature: 0bf2ec86538f2cbb875c1c0a8313563e ****/
		%feature("compactdefaultargs") HasPointText;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the text position is specified.
") HasPointText;
		Standard_Boolean HasPointText();

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets data to the state after calling the default constructor.
") Reset;
		void Reset();

		/****************** SetPlane ******************/
		/**** md5 signature: eec35fdff3dc3078c0c5502bd3e3fc6e ****/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Ax2

Return
-------
None

Description
-----------
Sets a right-handed coordinate system of the plane.
") SetPlane;
		void SetPlane(const gp_Ax2 & thePlane);

		/****************** SetPoint ******************/
		/**** md5 signature: 29b33efc7a75a6b104a8306bb1983089 ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Sets the anchor point on the annotated object.
") SetPoint;
		void SetPoint(const gp_Pnt & thePnt);

		/****************** SetPointText ******************/
		/**** md5 signature: a0c6d16a6d2d423f3f567284b4d931b2 ****/
		%feature("compactdefaultargs") SetPointText;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Sets the text position.
") SetPointText;
		void SetPointText(const gp_Pnt & thePnt);

		/****************** SetPresentation ******************/
		/**** md5 signature: a7d37bb77417d96a9ced3154dcaff279 ****/
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "
Parameters
----------
thePresentation: TopoDS_Shape

Return
-------
None

Description
-----------
Sets a tessellated annotation.
") SetPresentation;
		void SetPresentation(const TopoDS_Shape & thePresentation);

};


%make_alias(XCAFNoteObjects_NoteObject)

%extend XCAFNoteObjects_NoteObject {
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
