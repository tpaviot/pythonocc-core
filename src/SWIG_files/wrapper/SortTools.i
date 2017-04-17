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
%module (package="OCC") SortTools

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


%include SortTools_headers.i


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

class SortTools_HeapSortOfInteger {
	public:
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfInteger &
	:param Comp:
	:type Comp: TCollection_CompareOfInteger &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfInteger & TheArray,const TCollection_CompareOfInteger & Comp);
};


%extend SortTools_HeapSortOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class SortTools_HeapSortOfReal {
	public:
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfReal &
	:param Comp:
	:type Comp: TCollection_CompareOfReal &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfReal & TheArray,const TCollection_CompareOfReal & Comp);
};


%extend SortTools_HeapSortOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class SortTools_QuickSortOfInteger {
	public:
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfInteger &
	:param Comp:
	:type Comp: TCollection_CompareOfInteger &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfInteger & TheArray,const TCollection_CompareOfInteger & Comp);
};


%extend SortTools_QuickSortOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class SortTools_QuickSortOfReal {
	public:
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfReal &
	:param Comp:
	:type Comp: TCollection_CompareOfReal &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfReal & TheArray,const TCollection_CompareOfReal & Comp);
};


%extend SortTools_QuickSortOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class SortTools_ShellSortOfInteger {
	public:
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfInteger &
	:param Comp:
	:type Comp: TCollection_CompareOfInteger &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfInteger & TheArray,const TCollection_CompareOfInteger & Comp);
};


%extend SortTools_ShellSortOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class SortTools_ShellSortOfReal {
	public:
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfReal &
	:param Comp:
	:type Comp: TCollection_CompareOfReal &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfReal & TheArray,const TCollection_CompareOfReal & Comp);
};


%extend SortTools_ShellSortOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class SortTools_StraightInsertionSortOfInteger {
	public:
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfInteger &
	:param Comp:
	:type Comp: TCollection_CompareOfInteger &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfInteger & TheArray,const TCollection_CompareOfInteger & Comp);
};


%extend SortTools_StraightInsertionSortOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class SortTools_StraightInsertionSortOfReal {
	public:
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfReal &
	:param Comp:
	:type Comp: TCollection_CompareOfReal &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfReal & TheArray,const TCollection_CompareOfReal & Comp);
};


%extend SortTools_StraightInsertionSortOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
