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
%module (package="OCC") BOPCol

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


%include BOPCol_headers.i


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
typedef NCollection_DataMap <TopoDS_Shape , BOPCol_ListOfShape , TopTools_ShapeMapHasher> BOPCol_DataMapOfShapeListOfShape;
typedef NCollection_Map <Standard_Integer , TColStd_MapIntegerHasher> BOPCol_MapOfInteger;
typedef BOPCol_MapOfOrientedShape::Iterator BOPCol_MapIteratorOfMapOfOrientedShape;
typedef BOPCol_DataMapOfShapeShape::Iterator BOPCol_DataMapIteratorOfDataMapOfShapeShape;
typedef NCollection_UBTree <Standard_Integer , Bnd_Box> BOPCol_BoxBndTree;
typedef NCollection_IndexedDataMap <Standard_Integer , BOPCol_ListOfInteger , TColStd_MapIntegerHasher> BOPCol_IndexedDataMapOfIntegerListOfInteger;
typedef NCollection_DataMap <Standard_Integer , BOPCol_ListOfInteger , TColStd_MapIntegerHasher> BOPCol_DataMapOfIntegerListOfInteger;
typedef NCollection_DataMap <Standard_Integer , BOPCol_MapOfInteger , TColStd_MapIntegerHasher> BOPCol_DataMapOfIntegerMapOfInteger;
typedef BOPCol_ListOfListOfShape::Iterator BOPCol_ListIteratorOfListOfListOfShape;
typedef BOPCol_DataMapOfTransientAddress::Iterator BOPCol_DataMapIteratorOfDataMapOfTransientAddress;
typedef NCollection_IndexedDataMap <TopoDS_Shape , Bnd_Box , TopTools_ShapeMapHasher> BOPCol_IndexedDataMapOfShapeBox;
typedef BOPCol_ListOfShape::Iterator BOPCol_ListIteratorOfListOfShape;
typedef BOPCol_DataMapOfIntegerReal::Iterator BOPCol_DataMapIteratorOfDataMapOfIntegerReal;
typedef NCollection_Sequence <gp_Pnt2d> BOPCol_SequenceOfPnt2d;
typedef Standard_Integer * BOPCol_PInteger;
typedef NCollection_DataMap <Standard_Integer , Standard_Real , TColStd_MapIntegerHasher> BOPCol_DataMapOfIntegerReal;
typedef BOPCol_DataMapOfIntegerMapOfInteger::Iterator BOPCol_DataMapIteratorOfDataMapOfIntegerMapOfInteger;
typedef BOPCol_DataMapOfShapeInteger::Iterator BOPCol_DataMapIteratorOfDataMapOfShapeInteger;
typedef NCollection_IndexedMap <TopoDS_Shape , TopTools_ShapeMapHasher> BOPCol_IndexedMapOfShape;
typedef BOPCol_ListOfInteger::Iterator BOPCol_ListIteratorOfListOfInteger;
typedef NCollection_DataMap <Standard_Integer , Standard_Integer , TColStd_MapIntegerHasher> BOPCol_DataMapOfIntegerInteger;
typedef BOPCol_DataMapOfShapeAddress::Iterator BOPCol_DataMapIteratorOfDataMapOfShapeAddress;
typedef Handle_NCollection_BaseAllocator BOPCol_BaseAllocator;
typedef BOPCol_DataMapOfIntegerShape::Iterator BOPCol_DataMapIteratorOfDataMapOfIntegerShape;
typedef NCollection_Sequence <TopoDS_Shape> BOPCol_SequenceOfShape;
typedef NCollection_DataMap <Handle_Standard_Transient , Standard_Address , TColStd_MapTransientHasher> BOPCol_DataMapOfTransientAddress;
typedef NCollection_List <TopoDS_Shape> BOPCol_ListOfShape;
typedef BOPCol_DataMapOfIntegerInteger::Iterator BOPCol_DataMapIteratorOfDataMapOfIntegerInteger;
typedef NCollection_IndexedMap <Standard_Integer , TColStd_MapIntegerHasher> BOPCol_IndexedMapOfInteger;
typedef NCollection_DataMap <TopoDS_Shape , TopoDS_Shape , TopTools_ShapeMapHasher> BOPCol_DataMapOfShapeShape;
typedef NCollection_List <Standard_Integer> BOPCol_ListOfInteger;
typedef NCollection_DataMap <TopoDS_Shape , Standard_Integer , TopTools_ShapeMapHasher> BOPCol_DataMapOfShapeInteger;
typedef NCollection_DataMap <Standard_Integer , TopoDS_Shape , TColStd_MapIntegerHasher> BOPCol_DataMapOfIntegerShape;
typedef NCollection_Sequence <Standard_Real> BOPCol_SequenceOfReal;
typedef BOPCol_DataMapOfIntegerListOfShape::Iterator BOPCol_DataMapIteratorOfDataMapOfIntegerListOfShape;
typedef NCollection_IndexedDataMap <TopoDS_Shape , BOPCol_ListOfShape , TopTools_ShapeMapHasher> BOPCol_IndexedDataMapOfShapeListOfShape;
typedef BOPCol_ListOfInteger * BOPCol_PListOfInteger;
typedef NCollection_List <BOPCol_ListOfShape> BOPCol_ListOfListOfShape;
typedef NCollection_UBTree <Standard_Integer , Bnd_Box2d> BOPCol_Box2DBndTree;
typedef NCollection_DataMap <Standard_Integer , BOPCol_ListOfShape , TColStd_MapIntegerHasher> BOPCol_DataMapOfIntegerListOfShape;
typedef BOPCol_MapOfShape::Iterator BOPCol_MapIteratorOfMapOfShape;
typedef BOPCol_MapOfInteger::Iterator BOPCol_MapIteratorOfMapOfInteger;
typedef BOPCol_Array1 <Standard_Integer> BOPDS_VectorOfInteger;
typedef NCollection_DataMap <TopoDS_Shape , Standard_Address , TopTools_ShapeMapHasher> BOPCol_DataMapOfShapeAddress;
typedef NCollection_IndexedDataMap <TopoDS_Shape , Standard_Integer , TopTools_ShapeMapHasher> BOPCol_IndexedDataMapOfShapeInteger;
typedef NCollection_Map <TopoDS_Shape , TopTools_ShapeMapHasher> BOPCol_MapOfShape;
typedef BOPCol_DataMapOfShapeListOfShape::Iterator BOPCol_DataMapIteratorOfDataMapOfShapeListOfShape;
typedef BOPCol_DataMapOfIntegerListOfInteger::Iterator BOPCol_DataMapIteratorOfDataMapOfIntegerListOfInteger;
typedef NCollection_Map <TopoDS_Shape , TopTools_OrientedShapeMapHasher> BOPCol_MapOfOrientedShape;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

