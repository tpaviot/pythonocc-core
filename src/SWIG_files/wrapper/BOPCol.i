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
typedef BOPCol_DataMapOfIntegerShape::Iterator BOPCol_DataMapIteratorOfDataMapOfIntegerShape;
typedef NCollection_IndexedDataMap <Standard_Integer , BOPCol_ListOfInteger , TColStd_MapIntegerHasher> BOPCol_IndexedDataMapOfIntegerListOfInteger;
typedef NCollection_DataMap <Standard_Integer , BOPCol_ListOfInteger , TColStd_MapIntegerHasher> BOPCol_DataMapOfIntegerListOfInteger;
typedef NCollection_DataMap <Standard_Integer , BOPCol_MapOfInteger , TColStd_MapIntegerHasher> BOPCol_DataMapOfIntegerMapOfInteger;
typedef BOPCol_ListOfListOfShape::Iterator BOPCol_ListIteratorOfListOfListOfShape;
typedef BOPCol_DataMapOfTransientAddress::Iterator BOPCol_DataMapIteratorOfDataMapOfTransientAddress;
typedef NCollection_IndexedDataMap <TopoDS_Shape , Bnd_Box , TopTools_ShapeMapHasher> BOPCol_IndexedDataMapOfShapeBox;
typedef BOPCol_ListOfShape::Iterator BOPCol_ListIteratorOfListOfShape;
typedef BOPCol_DataMapOfIntegerReal::Iterator BOPCol_DataMapIteratorOfDataMapOfIntegerReal;
typedef BOPCol_DataMapOfShapeListOfShape::Iterator BOPCol_DataMapIteratorOfDataMapOfShapeListOfShape;
typedef Standard_Integer * BOPCol_PInteger;
typedef BOPCol_DataMapOfShapeAddress::Iterator BOPCol_DataMapIteratorOfDataMapOfShapeAddress;
typedef NCollection_DataMap <Standard_Integer , Standard_Real , TColStd_MapIntegerHasher> BOPCol_DataMapOfIntegerReal;
typedef BOPCol_DataMapOfIntegerMapOfInteger::Iterator BOPCol_DataMapIteratorOfDataMapOfIntegerMapOfInteger;
typedef BOPCol_DataMapOfShapeInteger::Iterator BOPCol_DataMapIteratorOfDataMapOfShapeInteger;
typedef NCollection_DataMap <TopoDS_Shape , Standard_Real , TopTools_ShapeMapHasher> BOPCol_DataMapOfShapeReal;
typedef BOPCol_ListOfInteger::Iterator BOPCol_ListIteratorOfListOfInteger;
typedef NCollection_DataMap <Standard_Integer , Standard_Integer , TColStd_MapIntegerHasher> BOPCol_DataMapOfIntegerInteger;
typedef NCollection_List <TopoDS_Shape> BOPCol_ListOfShape;
typedef Handle_NCollection_BaseAllocator BOPCol_BaseAllocator;
typedef NCollection_UBTree <Standard_Integer , Bnd_Box> BOPCol_BoxBndTree;
typedef NCollection_Sequence <TopoDS_Shape> BOPCol_SequenceOfShape;
typedef NCollection_DataMap <Handle_Standard_Transient , Standard_Address , TColStd_MapTransientHasher> BOPCol_DataMapOfTransientAddress;
typedef NCollection_IndexedMap <TopoDS_Shape , TopTools_ShapeMapHasher> BOPCol_IndexedMapOfShape;
typedef NCollection_IndexedMap <Standard_Integer , TColStd_MapIntegerHasher> BOPCol_IndexedMapOfInteger;
typedef BOPCol_DataMapOfShapeReal::Iterator BOPCol_DataMapIteratorOfDataMapOfShapeReal;
typedef BOPCol_DataMapOfIntegerInteger::Iterator BOPCol_DataMapIteratorOfDataMapOfIntegerInteger;
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
typedef NCollection_DataMap <TopoDS_Shape , TopoDS_Shape , TopTools_ShapeMapHasher> BOPCol_DataMapOfShapeShape;
typedef BOPCol_MapOfShape::Iterator BOPCol_MapIteratorOfMapOfShape;
typedef BOPCol_MapOfInteger::Iterator BOPCol_MapIteratorOfMapOfInteger;
typedef NCollection_DataMap <TopoDS_Shape , Standard_Address , TopTools_ShapeMapHasher> BOPCol_DataMapOfShapeAddress;
typedef NCollection_IndexedDataMap <TopoDS_Shape , Standard_Integer , TopTools_ShapeMapHasher> BOPCol_IndexedDataMapOfShapeInteger;
typedef NCollection_Map <TopoDS_Shape , TopTools_ShapeMapHasher> BOPCol_MapOfShape;
typedef NCollection_Sequence <gp_Pnt2d> BOPCol_SequenceOfPnt2d;
typedef BOPCol_DataMapOfIntegerListOfInteger::Iterator BOPCol_DataMapIteratorOfDataMapOfIntegerListOfInteger;
typedef NCollection_Map <TopoDS_Shape , TopTools_OrientedShapeMapHasher> BOPCol_MapOfOrientedShape;
typedef NCollection_IndexedDataMap <TopoDS_Shape , TopoDS_Shape , TopTools_ShapeMapHasher> BOPCol_IndexedDataMapOfShapeShape;
typedef NCollection_IndexedMap <TopoDS_Shape , TopTools_OrientedShapeMapHasher> BOPCol_IndexedMapOfOrientedShape;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BOPCol_Box2DBndTreeSelector;
class BOPCol_Box2DBndTreeSelector : public BOPCol_Box2DBndTree::Selector {
	public:
		%feature("compactdefaultargs") BOPCol_Box2DBndTreeSelector;
		%feature("autodoc", "	:rtype: None
") BOPCol_Box2DBndTreeSelector;
		 BOPCol_Box2DBndTreeSelector ();
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "	:param &:
	:type &: Bnd_Box2d
	:rtype: bool
") Reject;
		virtual Standard_Boolean Reject (const Bnd_Box2d &);
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "	:param &:
	:type &: int
	:rtype: bool
") Accept;
		virtual Standard_Boolean Accept (const Standard_Integer &);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") SetBox;
		%feature("autodoc", "	:param &:
	:type &: Bnd_Box2d
	:rtype: None
") SetBox;
		void SetBox (const Bnd_Box2d &);
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "	:rtype: BOPCol_ListOfInteger
") Indices;
		const BOPCol_ListOfInteger & Indices ();
};


%extend BOPCol_Box2DBndTreeSelector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPCol_BoxBndTreeSelector;
class BOPCol_BoxBndTreeSelector : public BOPCol_BoxBndTree::Selector {
	public:
		%feature("compactdefaultargs") BOPCol_BoxBndTreeSelector;
		%feature("autodoc", "	:rtype: None
") BOPCol_BoxBndTreeSelector;
		 BOPCol_BoxBndTreeSelector ();
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "	:param &:
	:type &: Bnd_Box
	:rtype: bool
") Reject;
		virtual Standard_Boolean Reject (const Bnd_Box &);
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "	:param &:
	:type &: int
	:rtype: bool
") Accept;
		virtual Standard_Boolean Accept (const Standard_Integer &);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") SetBox;
		%feature("autodoc", "	:param &:
	:type &: Bnd_Box
	:rtype: None
") SetBox;
		void SetBox (const Bnd_Box &);
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "	:rtype: BOPCol_ListOfInteger
") Indices;
		const BOPCol_ListOfInteger & Indices ();
};


%extend BOPCol_BoxBndTreeSelector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
