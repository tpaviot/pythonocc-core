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
%module (package="OCC") NCollection

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


%include NCollection_headers.i


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
typedef NCollection_UtfString <Standard_Utf16Char> NCollection_Utf16String;
typedef unsigned __int64 uint64_t;
typedef NCollection_UtfString <Standard_Utf8Char> NCollection_Utf8String;
typedef void ( * NCollection_DelMapNode ) ( NCollection_ListNode * , Handle_NCollection_BaseAllocator & theAl );
typedef NCollection_UtfIterator <Standard_Utf16Char> NCollection_Utf16Iter;
typedef NCollection_UtfIterator <Standard_Utf32Char> NCollection_Utf32Iter;
typedef NCollection_UtfIterator <Standard_Utf8Char> NCollection_Utf8Iter;
typedef NCollection_UtfIterator <Standard_WideChar> NCollection_UtfWideIter;
typedef size_t Standard_Size;
typedef NCollection_UtfString <Standard_Utf32Char> NCollection_Utf32String;
typedef NCollection_Utf8String NCollection_String;
typedef NCollection_UtfString <Standard_WideChar> NCollection_UtfWideString;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

