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
%module (package="OCC") GEOMAlgo

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../SWIG_files/common/CommonIncludes.i
%include ../SWIG_files/common/ExceptionCatcher.i
%include ../SWIG_files/common/FunctionTransformers.i
%include ../SWIG_files/common/Operators.i


%include GEOMAlgo_headers.i


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

%nodefaultctor GEOMAlgo_Splitter;
class GEOMAlgo_Splitter : public BOPAlgo_Builder {
	public:
		%feature("compactdefaultargs") GEOMAlgo_Splitter;
		%feature("autodoc", "	:rtype: None
") GEOMAlgo_Splitter;
		 GEOMAlgo_Splitter ();
		%feature("compactdefaultargs") GEOMAlgo_Splitter;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") GEOMAlgo_Splitter;
		 GEOMAlgo_Splitter (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") AddTool;
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") AddTool;
		void AddTool (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") Tools;
		%feature("autodoc", "	:rtype: BOPCol_ListOfShape
") Tools;
		const BOPCol_ListOfShape & Tools ();
		%feature("compactdefaultargs") SetLimit;
		%feature("autodoc", "	:param aLimit:
	:type aLimit: TopAbs_ShapeEnum
	:rtype: None
") SetLimit;
		void SetLimit (const TopAbs_ShapeEnum aLimit);
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "	:rtype: TopAbs_ShapeEnum
") Limit;
		TopAbs_ShapeEnum Limit ();
		%feature("compactdefaultargs") SetLimitMode;
		%feature("autodoc", "	:param aMode:
	:type aMode: int
	:rtype: None
") SetLimitMode;
		void SetLimitMode (const Standard_Integer aMode);
		%feature("compactdefaultargs") LimitMode;
		%feature("autodoc", "	:rtype: int
") LimitMode;
		Standard_Integer LimitMode ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: void
") Clear;
		virtual void Clear ();
};


%extend GEOMAlgo_Splitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
