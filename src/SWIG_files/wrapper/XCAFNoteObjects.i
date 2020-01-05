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
%define XCAFNOTEOBJECTSDOCSTRING
"XCAFNoteObjects module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xcafnoteobjects.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<XCAFNoteObjects_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TopoDS.i
/* public enums */
/* end public enums declaration */

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
		/****************** GetPlane ******************/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "* Returns a right-handed coordinate system of the plane
	:rtype: gp_Ax2") GetPlane;
		const gp_Ax2  GetPlane ();

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "* Returns the attachment point on the annotated object
	:rtype: gp_Pnt") GetPoint;
		const gp_Pnt  GetPoint ();

		/****************** GetPointText ******************/
		%feature("compactdefaultargs") GetPointText;
		%feature("autodoc", "* Returns the text position
	:rtype: gp_Pnt") GetPointText;
		const gp_Pnt  GetPointText ();

		/****************** GetPresentation ******************/
		%feature("compactdefaultargs") GetPresentation;
		%feature("autodoc", "* Returns a tesselated annotation if specified
	:rtype: TopoDS_Shape") GetPresentation;
		const TopoDS_Shape  GetPresentation ();

		/****************** HasPlane ******************/
		%feature("compactdefaultargs") HasPlane;
		%feature("autodoc", "* Returns True if plane is specified
	:rtype: bool") HasPlane;
		Standard_Boolean HasPlane ();

		/****************** HasPoint ******************/
		%feature("compactdefaultargs") HasPoint;
		%feature("autodoc", "* Returns True if the attachment point on the annotated object is specified
	:rtype: bool") HasPoint;
		Standard_Boolean HasPoint ();

		/****************** HasPointText ******************/
		%feature("compactdefaultargs") HasPointText;
		%feature("autodoc", "* Returns True if the text position is specified
	:rtype: bool") HasPointText;
		Standard_Boolean HasPointText ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Resets data to the state after calling the default constructor
	:rtype: None") Reset;
		void Reset ();

		/****************** SetPlane ******************/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "* Sets a right-handed coordinate system of the plane
	:param thePlane:
	:type thePlane: gp_Ax2
	:rtype: None") SetPlane;
		void SetPlane (const gp_Ax2 & thePlane);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "* Sets the anchor point on the annotated object
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None") SetPoint;
		void SetPoint (const gp_Pnt & thePnt);

		/****************** SetPointText ******************/
		%feature("compactdefaultargs") SetPointText;
		%feature("autodoc", "* Sets the text position
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None") SetPointText;
		void SetPointText (const gp_Pnt & thePnt);

		/****************** SetPresentation ******************/
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "* Sets a tesselated annotation
	:param thePresentation:
	:type thePresentation: TopoDS_Shape
	:rtype: None") SetPresentation;
		void SetPresentation (const TopoDS_Shape & thePresentation);

		/****************** XCAFNoteObjects_NoteObject ******************/
		%feature("compactdefaultargs") XCAFNoteObjects_NoteObject;
		%feature("autodoc", "* Empty object
	:rtype: None") XCAFNoteObjects_NoteObject;
		 XCAFNoteObjects_NoteObject ();

		/****************** XCAFNoteObjects_NoteObject ******************/
		%feature("compactdefaultargs") XCAFNoteObjects_NoteObject;
		%feature("autodoc", "* Copy constructor.
	:param theObj:
	:type theObj: XCAFNoteObjects_NoteObject
	:rtype: None") XCAFNoteObjects_NoteObject;
		 XCAFNoteObjects_NoteObject (const opencascade::handle<XCAFNoteObjects_NoteObject> & theObj);

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
