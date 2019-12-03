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
%define BREPPROJDOCSTRING
"BRepProj module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepproj.html"
%enddef
%module (package="OCC.Core", docstring=BREPPROJDOCSTRING) BRepProj


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
#include<BRepProj_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import gp.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************************
* class BRepProj_Projection *
****************************/
%nodefaultctor BRepProj_Projection;
class BRepProj_Projection {
	public:
		/****************** BRepProj_Projection ******************/
		%feature("compactdefaultargs") BRepProj_Projection;
		%feature("autodoc", "* Makes a Cylindrical projection of Wire om Shape
	:param Wire:
	:type Wire: TopoDS_Shape
	:param Shape:
	:type Shape: TopoDS_Shape
	:param D:
	:type D: gp_Dir
	:rtype: None") BRepProj_Projection;
		 BRepProj_Projection (const TopoDS_Shape & Wire,const TopoDS_Shape & Shape,const gp_Dir & D);

		/****************** BRepProj_Projection ******************/
		%feature("compactdefaultargs") BRepProj_Projection;
		%feature("autodoc", "* Makes a Conical projection of Wire om Shape
	:param Wire:
	:type Wire: TopoDS_Shape
	:param Shape:
	:type Shape: TopoDS_Shape
	:param P:
	:type P: gp_Pnt
	:rtype: None") BRepProj_Projection;
		 BRepProj_Projection (const TopoDS_Shape & Wire,const TopoDS_Shape & Shape,const gp_Pnt & P);

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "* Returns the current result wire.
	:rtype: TopoDS_Wire") Current;
		TopoDS_Wire Current ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Resets the iterator by resulting wires.
	:rtype: None") Init;
		void Init ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns False if the section failed
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there is a current result wire
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Move to the next result wire.
	:rtype: None") Next;
		void Next ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns the complete result as compound of wires.
	:rtype: TopoDS_Compound") Shape;
		TopoDS_Compound Shape ();

};


%extend BRepProj_Projection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
