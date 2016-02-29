/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") GccIter

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


%include GccIter_headers.i


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
enum GccIter_Type1 {
	GccIter_CuCuCu = 0,
	GccIter_CiCuCu = 1,
	GccIter_CiCiCu = 2,
	GccIter_CiLiCu = 3,
	GccIter_LiLiCu = 4,
	GccIter_LiCuCu = 5,
};

enum GccIter_Type2 {
	GccIter_CuCuOnCu = 0,
	GccIter_CiCuOnCu = 1,
	GccIter_LiCuOnCu = 2,
	GccIter_CuPtOnCu = 3,
	GccIter_CuCuOnLi = 4,
	GccIter_CiCuOnLi = 5,
	GccIter_LiCuOnLi = 6,
	GccIter_CuPtOnLi = 7,
	GccIter_CuCuOnCi = 8,
	GccIter_CiCuOnCi = 9,
	GccIter_LiCuOnCi = 10,
	GccIter_CuPtOnCi = 11,
};

enum GccIter_Type3 {
	GccIter_CuCu = 0,
	GccIter_CiCu = 1,
};

/* end public enums declaration */

