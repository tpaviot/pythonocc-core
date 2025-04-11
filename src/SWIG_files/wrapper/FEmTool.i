/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define FEMTOOLDOCSTRING
"FEmTool module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_femtool.html"
%enddef
%module (package="OCC.Core", docstring=FEMTOOLDOCSTRING) FEmTool


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
%include ../common/ArrayMacros.i


%{
#include<FEmTool_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i

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

/* templates */
%template(FEmTool_ListIteratorOfListOfVectors) NCollection_TListIterator<opencascade::handle<TColStd_HArray1OfReal>>;
%template(FEmTool_ListOfVectors) NCollection_List<opencascade::handle<TColStd_HArray1OfReal>>;

%extend NCollection_List<opencascade::handle<TColStd_HArray1OfReal>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(FEmTool_SeqOfLinConstr) NCollection_Sequence<FEmTool_ListOfVectors>;

%extend NCollection_Sequence<FEmTool_ListOfVectors> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array2<opencascade::handle<TColStd_HArray1OfInteger>> FEmTool_AssemblyTable;
typedef NCollection_List<opencascade::handle<TColStd_HArray1OfReal>>::Iterator FEmTool_ListIteratorOfListOfVectors;
typedef NCollection_List<opencascade::handle<TColStd_HArray1OfReal>> FEmTool_ListOfVectors;
typedef NCollection_Sequence<FEmTool_ListOfVectors> FEmTool_SeqOfLinConstr;
/* end typedefs declaration */

/*************************
* class FEmTool_Assembly *
*************************/
/**********************
* class FEmTool_Curve *
**********************/
/************************************
* class FEmTool_ElementaryCriterion *
************************************/
/************************************
* class FEmTool_ElementsOfRefMatrix *
************************************/
/*****************************
* class FEmTool_SparseMatrix *
*****************************/
/******************************
* class FEmTool_LinearFlexion *
******************************/
/***************************
* class FEmTool_LinearJerk *
***************************/
/******************************
* class FEmTool_LinearTension *
******************************/
/******************************
* class FEmTool_ProfileMatrix *
******************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class FEmTool_Assembly:
	pass

@classnotwrapped
class FEmTool_Curve:
	pass

@classnotwrapped
class FEmTool_ElementaryCriterion:
	pass

@classnotwrapped
class FEmTool_ElementsOfRefMatrix:
	pass

@classnotwrapped
class FEmTool_LinearFlexion:
	pass

@classnotwrapped
class FEmTool_LinearJerk:
	pass

@classnotwrapped
class FEmTool_LinearTension:
	pass

@classnotwrapped
class FEmTool_ProfileMatrix:
	pass

@classnotwrapped
class FEmTool_SparseMatrix:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
class FEmTool_HAssemblyTable : public FEmTool_AssemblyTable, public Standard_Transient {
  public:
    FEmTool_HAssemblyTable(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    FEmTool_HAssemblyTable(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const FEmTool_AssemblyTable::value_type& theValue);
    FEmTool_HAssemblyTable(const FEmTool_AssemblyTable& theOther);
    const FEmTool_AssemblyTable& Array2 ();
    FEmTool_AssemblyTable& ChangeArray2 (); 
};
%make_alias(FEmTool_HAssemblyTable)


/* hsequence classes */
/* class aliases */
%pythoncode {
}
