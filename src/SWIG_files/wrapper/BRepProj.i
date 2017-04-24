/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") BRepProj

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include BRepProj_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepProj_Projection;
class BRepProj_Projection {
	public:
		%feature("compactdefaultargs") BRepProj_Projection;
		%feature("autodoc", "	* Makes a Cylindrical projection of Wire om Shape

	:param Wire:
	:type Wire: TopoDS_Shape &
	:param Shape:
	:type Shape: TopoDS_Shape &
	:param D:
	:type D: gp_Dir
	:rtype: None
") BRepProj_Projection;
		 BRepProj_Projection (const TopoDS_Shape & Wire,const TopoDS_Shape & Shape,const gp_Dir & D);
		%feature("compactdefaultargs") BRepProj_Projection;
		%feature("autodoc", "	* Makes a Conical projection of Wire om Shape

	:param Wire:
	:type Wire: TopoDS_Shape &
	:param Shape:
	:type Shape: TopoDS_Shape &
	:param P:
	:type P: gp_Pnt
	:rtype: None
") BRepProj_Projection;
		 BRepProj_Projection (const TopoDS_Shape & Wire,const TopoDS_Shape & Shape,const gp_Pnt & P);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns False if the section failed

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Resets the iterator by resulting wires.

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if there is a current result wire

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Move to the next result wire.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "	* Returns the current result wire.

	:rtype: TopoDS_Wire
") Current;
		TopoDS_Wire Current ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns the complete result as compound of wires.

	:rtype: TopoDS_Compound
") Shape;
		TopoDS_Compound Shape ();
};


%extend BRepProj_Projection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
