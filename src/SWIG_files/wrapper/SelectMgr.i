/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module SelectMgr

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include SelectMgr_required_python_modules.i
%include SelectMgr_headers.i

/* typedefs */
typedef SelectMgr_DataMapOfObjectOwners::Iterator SelectMgr_DataMapIteratorOfMapOfObjectOwners;
typedef SelectMgr_SelectableObject * SelectMgr_SOPtr;
/* end typedefs declaration */

/* public enums */
enum SelectMgr_StateOfSelection {
	SelectMgr_SOS_Activated = 0,
	SelectMgr_SOS_Deactivated = 1,
	SelectMgr_SOS_Sleeping = 2,
	SelectMgr_SOS_Any = 3,
	SelectMgr_SOS_Unknown = 4,
};

enum SelectMgr_TypeOfUpdate {
	SelectMgr_TOU_Full = 0,
	SelectMgr_TOU_Partial = 1,
	SelectMgr_TOU_None = 2,
};

/* end public enums declaration */

