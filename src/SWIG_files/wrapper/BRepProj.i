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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************************
* class BRepProj_Projection *
****************************/
class BRepProj_Projection {
	public:
		/****************** BRepProj_Projection ******************/
		/**** md5 signature: 05a528b4fa808ed3e5606951be3f247c ****/
		%feature("compactdefaultargs") BRepProj_Projection;
		%feature("autodoc", "Makes a cylindrical projection of wire om shape.

Parameters
----------
Wire: TopoDS_Shape
Shape: TopoDS_Shape
D: gp_Dir

Returns
-------
None
") BRepProj_Projection;
		 BRepProj_Projection(const TopoDS_Shape & Wire, const TopoDS_Shape & Shape, const gp_Dir & D);

		/****************** BRepProj_Projection ******************/
		/**** md5 signature: 66694c5d0609b9bd950faaceb10748b1 ****/
		%feature("compactdefaultargs") BRepProj_Projection;
		%feature("autodoc", "Makes a conical projection of wire om shape.

Parameters
----------
Wire: TopoDS_Shape
Shape: TopoDS_Shape
P: gp_Pnt

Returns
-------
None
") BRepProj_Projection;
		 BRepProj_Projection(const TopoDS_Shape & Wire, const TopoDS_Shape & Shape, const gp_Pnt & P);

		/****************** Current ******************/
		/**** md5 signature: f1373d555d44b8af5f09b63aa71dbac4 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Returns the current result wire.

Returns
-------
TopoDS_Wire
") Current;
		TopoDS_Wire Current();

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Resets the iterator by resulting wires.

Returns
-------
None
") Init;
		void Init();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns false if the section failed.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current result wire.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move to the next result wire.

Returns
-------
None
") Next;
		void Next();

		/****************** Shape ******************/
		/**** md5 signature: 1b3c03b494fbe92ca2dc8e2599c5e3a1 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the complete result as compound of wires.

Returns
-------
TopoDS_Compound
") Shape;
		TopoDS_Compound Shape();

};


%extend BRepProj_Projection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
