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
%module (package="OCC") BRepMAT2d

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


%include BRepMAT2d_headers.i


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

%nodefaultctor BRepMAT2d_BisectingLocus;
class BRepMAT2d_BisectingLocus {
	public:
		%feature("compactdefaultargs") BRepMAT2d_BisectingLocus;
		%feature("autodoc", "	:rtype: None
") BRepMAT2d_BisectingLocus;
		 BRepMAT2d_BisectingLocus ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param anExplo:
	:type anExplo: BRepMAT2d_Explorer &
	:param LineIndex: default value is 1
	:type LineIndex: int
	:param aSide: default value is MAT_Left
	:type aSide: MAT_Side
	:rtype: None
") Compute;
		void Compute (BRepMAT2d_Explorer & anExplo,const Standard_Integer LineIndex = 1,const MAT_Side aSide = MAT_Left);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "	:rtype: Handle_MAT_Graph
") Graph;
		Handle_MAT_Graph Graph ();
		%feature("compactdefaultargs") NumberOfContours;
		%feature("autodoc", "	:rtype: int
") NumberOfContours;
		Standard_Integer NumberOfContours ();
		%feature("compactdefaultargs") NumberOfElts;
		%feature("autodoc", "	:param IndLine:
	:type IndLine: int
	:rtype: int
") NumberOfElts;
		Standard_Integer NumberOfElts (const Standard_Integer IndLine);
		%feature("compactdefaultargs") NumberOfSections;
		%feature("autodoc", "	:param IndLine:
	:type IndLine: int
	:param Index:
	:type Index: int
	:rtype: int
") NumberOfSections;
		Standard_Integer NumberOfSections (const Standard_Integer IndLine,const Standard_Integer Index);
		%feature("compactdefaultargs") BasicElt;
		%feature("autodoc", "	:param IndLine:
	:type IndLine: int
	:param Index:
	:type Index: int
	:rtype: Handle_MAT_BasicElt
") BasicElt;
		Handle_MAT_BasicElt BasicElt (const Standard_Integer IndLine,const Standard_Integer Index);
		%feature("compactdefaultargs") GeomElt;
		%feature("autodoc", "	:param aBasicElt:
	:type aBasicElt: Handle_MAT_BasicElt &
	:rtype: Handle_Geom2d_Geometry
") GeomElt;
		Handle_Geom2d_Geometry GeomElt (const Handle_MAT_BasicElt & aBasicElt);
		%feature("compactdefaultargs") GeomElt;
		%feature("autodoc", "	:param aNode:
	:type aNode: Handle_MAT_Node &
	:rtype: gp_Pnt2d
") GeomElt;
		gp_Pnt2d GeomElt (const Handle_MAT_Node & aNode);
		%feature("compactdefaultargs") GeomBis;
		%feature("autodoc", "	:param anArc:
	:type anArc: Handle_MAT_Arc &
	:param Reverse:
	:type Reverse: bool
	:rtype: Bisector_Bisec
") GeomBis;
		Bisector_Bisec GeomBis (const Handle_MAT_Arc & anArc,Standard_Boolean &OutValue);
};


%nodefaultctor BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape;
class BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape;
		%feature("autodoc", "	:rtype: None
") BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape;
		 BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape ();
		%feature("compactdefaultargs") BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMAT2d_DataMapOfBasicEltShape &
	:rtype: None
") BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape;
		 BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape (const BRepMAT2d_DataMapOfBasicEltShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMAT2d_DataMapOfBasicEltShape &
	:rtype: None
") Initialize;
		void Initialize (const BRepMAT2d_DataMapOfBasicEltShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_MAT_BasicElt
") Key;
		Handle_MAT_BasicElt Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%nodefaultctor BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt;
class BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt;
		%feature("autodoc", "	:rtype: None
") BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt;
		 BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt ();
		%feature("compactdefaultargs") BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMAT2d_DataMapOfShapeSequenceOfBasicElt &
	:rtype: None
") BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt;
		 BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt (const BRepMAT2d_DataMapOfShapeSequenceOfBasicElt & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepMAT2d_DataMapOfShapeSequenceOfBasicElt &
	:rtype: None
") Initialize;
		void Initialize (const BRepMAT2d_DataMapOfShapeSequenceOfBasicElt & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepMAT2d_SequenceOfBasicElt
") Value;
		const BRepMAT2d_SequenceOfBasicElt & Value ();
};


%nodefaultctor BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape;
class BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_BasicElt &
	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape;
		 BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape (const Handle_MAT_BasicElt & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_MAT_BasicElt
") Key;
		Handle_MAT_BasicElt Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape::Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape;
class Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape();
        Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape(const Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape &aHandle);
        Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape(const BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape {
    BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape* GetObject() {
    return (BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape*)$self->Access();
    }
};

%nodefaultctor BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt;
class BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: BRepMAT2d_SequenceOfBasicElt &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt;
		 BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt (const TopoDS_Shape & K,const BRepMAT2d_SequenceOfBasicElt & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepMAT2d_SequenceOfBasicElt
") Value;
		BRepMAT2d_SequenceOfBasicElt & Value ();
};


%extend BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt::Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt;
class Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt();
        Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt(const Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt &aHandle);
        Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt(const BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt {
    BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt* GetObject() {
    return (BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt*)$self->Access();
    }
};

%nodefaultctor BRepMAT2d_DataMapOfBasicEltShape;
class BRepMAT2d_DataMapOfBasicEltShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepMAT2d_DataMapOfBasicEltShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepMAT2d_DataMapOfBasicEltShape;
		 BRepMAT2d_DataMapOfBasicEltShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMAT2d_DataMapOfBasicEltShape &
	:rtype: BRepMAT2d_DataMapOfBasicEltShape
") Assign;
		BRepMAT2d_DataMapOfBasicEltShape & Assign (const BRepMAT2d_DataMapOfBasicEltShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMAT2d_DataMapOfBasicEltShape &
	:rtype: BRepMAT2d_DataMapOfBasicEltShape
") operator=;
		BRepMAT2d_DataMapOfBasicEltShape & operator = (const BRepMAT2d_DataMapOfBasicEltShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_BasicElt &
	:param I:
	:type I: TopoDS_Shape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_MAT_BasicElt & K,const TopoDS_Shape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_BasicElt &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_MAT_BasicElt & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_BasicElt &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_MAT_BasicElt & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_BasicElt &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (const Handle_MAT_BasicElt & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_BasicElt &
	:rtype: TopoDS_Shape
") ChangeFind;
		TopoDS_Shape  ChangeFind (const Handle_MAT_BasicElt & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_BasicElt &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_MAT_BasicElt & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_BasicElt &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_MAT_BasicElt & K);
};


%nodefaultctor BRepMAT2d_DataMapOfShapeSequenceOfBasicElt;
class BRepMAT2d_DataMapOfShapeSequenceOfBasicElt : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepMAT2d_DataMapOfShapeSequenceOfBasicElt;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepMAT2d_DataMapOfShapeSequenceOfBasicElt;
		 BRepMAT2d_DataMapOfShapeSequenceOfBasicElt (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMAT2d_DataMapOfShapeSequenceOfBasicElt &
	:rtype: BRepMAT2d_DataMapOfShapeSequenceOfBasicElt
") Assign;
		BRepMAT2d_DataMapOfShapeSequenceOfBasicElt & Assign (const BRepMAT2d_DataMapOfShapeSequenceOfBasicElt & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMAT2d_DataMapOfShapeSequenceOfBasicElt &
	:rtype: BRepMAT2d_DataMapOfShapeSequenceOfBasicElt
") operator=;
		BRepMAT2d_DataMapOfShapeSequenceOfBasicElt & operator = (const BRepMAT2d_DataMapOfShapeSequenceOfBasicElt & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: BRepMAT2d_SequenceOfBasicElt &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const BRepMAT2d_SequenceOfBasicElt & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: BRepMAT2d_SequenceOfBasicElt
") Find;
		const BRepMAT2d_SequenceOfBasicElt & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: BRepMAT2d_SequenceOfBasicElt
") ChangeFind;
		BRepMAT2d_SequenceOfBasicElt & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%nodefaultctor BRepMAT2d_Explorer;
class BRepMAT2d_Explorer {
	public:
		%feature("compactdefaultargs") BRepMAT2d_Explorer;
		%feature("autodoc", "	:rtype: None
") BRepMAT2d_Explorer;
		 BRepMAT2d_Explorer ();
		%feature("compactdefaultargs") BRepMAT2d_Explorer;
		%feature("autodoc", "	:param aFace:
	:type aFace: TopoDS_Face &
	:rtype: None
") BRepMAT2d_Explorer;
		 BRepMAT2d_Explorer (const TopoDS_Face & aFace);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear the contents of <self>.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param aFace:
	:type aFace: TopoDS_Face &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Face & aFace);
		%feature("compactdefaultargs") NumberOfContours;
		%feature("autodoc", "	* Returns the Number of contours.

	:rtype: int
") NumberOfContours;
		Standard_Integer NumberOfContours ();
		%feature("compactdefaultargs") NumberOfCurves;
		%feature("autodoc", "	* Returns the Number of Curves in the Contour number  <IndexContour>.

	:param IndexContour:
	:type IndexContour: int
	:rtype: int
") NumberOfCurves;
		Standard_Integer NumberOfCurves (const Standard_Integer IndexContour);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialisation of an Iterator on the curves of  the Contour number <IndexContour>.

	:param IndexContour:
	:type IndexContour: int
	:rtype: None
") Init;
		void Init (const Standard_Integer IndexContour);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Return False if there is no more curves on the Contour  initialised by the method Init.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Move to the next curve of the current Contour.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current curve on the current Contour.

	:rtype: Handle_Geom2d_Curve
") Value;
		Handle_Geom2d_Curve Value ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();
		%feature("compactdefaultargs") Contour;
		%feature("autodoc", "	:param IndexContour:
	:type IndexContour: int
	:rtype: TColGeom2d_SequenceOfCurve
") Contour;
		const TColGeom2d_SequenceOfCurve & Contour (const Standard_Integer IndexContour);
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") IsModified;
		Standard_Boolean IsModified (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "	* If the shape is not modified, returns the shape itself.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ModifiedShape;
		TopoDS_Shape ModifiedShape (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") GetIsClosed;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfBoolean
") GetIsClosed;
		const TColStd_SequenceOfBoolean & GetIsClosed ();
};


%nodefaultctor BRepMAT2d_LinkTopoBilo;
class BRepMAT2d_LinkTopoBilo {
	public:
		%feature("compactdefaultargs") BRepMAT2d_LinkTopoBilo;
		%feature("autodoc", "	:rtype: None
") BRepMAT2d_LinkTopoBilo;
		 BRepMAT2d_LinkTopoBilo ();
		%feature("compactdefaultargs") BRepMAT2d_LinkTopoBilo;
		%feature("autodoc", "	* Constructs the links Between S and BiLo. raises if <S> is not a face.

	:param Explo:
	:type Explo: BRepMAT2d_Explorer &
	:param BiLo:
	:type BiLo: BRepMAT2d_BisectingLocus &
	:rtype: None
") BRepMAT2d_LinkTopoBilo;
		 BRepMAT2d_LinkTopoBilo (const BRepMAT2d_Explorer & Explo,const BRepMAT2d_BisectingLocus & BiLo);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Constructs the links Between S and BiLo. raises if <S> is not a face or a wire.

	:param Explo:
	:type Explo: BRepMAT2d_Explorer &
	:param BiLo:
	:type BiLo: BRepMAT2d_BisectingLocus &
	:rtype: None
") Perform;
		void Perform (const BRepMAT2d_Explorer & Explo,const BRepMAT2d_BisectingLocus & BiLo);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialise the Iterator on <S> <S> is an edge or a vertex of the initial wire or face. raises if <S> is not an edge or a vertex.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if there is a current BasicElt.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Proceed to the next BasicElt.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current BasicElt.

	:rtype: Handle_MAT_BasicElt
") Value;
		Handle_MAT_BasicElt Value ();
		%feature("compactdefaultargs") GeneratingShape;
		%feature("autodoc", "	* Returns the Shape linked to <aBE>.

	:param aBE:
	:type aBE: Handle_MAT_BasicElt &
	:rtype: TopoDS_Shape
") GeneratingShape;
		TopoDS_Shape GeneratingShape (const Handle_MAT_BasicElt & aBE);
};


%nodefaultctor BRepMAT2d_SequenceNodeOfSequenceOfBasicElt;
class BRepMAT2d_SequenceNodeOfSequenceOfBasicElt : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") BRepMAT2d_SequenceNodeOfSequenceOfBasicElt;
		%feature("autodoc", "	:param I:
	:type I: Handle_MAT_BasicElt &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") BRepMAT2d_SequenceNodeOfSequenceOfBasicElt;
		 BRepMAT2d_SequenceNodeOfSequenceOfBasicElt (const Handle_MAT_BasicElt & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MAT_BasicElt
") Value;
		Handle_MAT_BasicElt Value ();
};


%extend BRepMAT2d_SequenceNodeOfSequenceOfBasicElt {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt::Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt;
class Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt();
        Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt(const Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt &aHandle);
        Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt(const BRepMAT2d_SequenceNodeOfSequenceOfBasicElt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt {
    BRepMAT2d_SequenceNodeOfSequenceOfBasicElt* GetObject() {
    return (BRepMAT2d_SequenceNodeOfSequenceOfBasicElt*)$self->Access();
    }
};

%nodefaultctor BRepMAT2d_SequenceOfBasicElt;
class BRepMAT2d_SequenceOfBasicElt : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") BRepMAT2d_SequenceOfBasicElt;
		%feature("autodoc", "	:rtype: None
") BRepMAT2d_SequenceOfBasicElt;
		 BRepMAT2d_SequenceOfBasicElt ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMAT2d_SequenceOfBasicElt &
	:rtype: BRepMAT2d_SequenceOfBasicElt
") Assign;
		const BRepMAT2d_SequenceOfBasicElt & Assign (const BRepMAT2d_SequenceOfBasicElt & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepMAT2d_SequenceOfBasicElt &
	:rtype: BRepMAT2d_SequenceOfBasicElt
") operator=;
		const BRepMAT2d_SequenceOfBasicElt & operator = (const BRepMAT2d_SequenceOfBasicElt & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_MAT_BasicElt &
	:rtype: None
") Append;
		void Append (const Handle_MAT_BasicElt & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: BRepMAT2d_SequenceOfBasicElt &
	:rtype: None
") Append;
		void Append (BRepMAT2d_SequenceOfBasicElt & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_MAT_BasicElt &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MAT_BasicElt & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: BRepMAT2d_SequenceOfBasicElt &
	:rtype: None
") Prepend;
		void Prepend (BRepMAT2d_SequenceOfBasicElt & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_MAT_BasicElt &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_MAT_BasicElt & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepMAT2d_SequenceOfBasicElt &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepMAT2d_SequenceOfBasicElt & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_MAT_BasicElt &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_MAT_BasicElt & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepMAT2d_SequenceOfBasicElt &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepMAT2d_SequenceOfBasicElt & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_MAT_BasicElt
") First;
		Handle_MAT_BasicElt First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_MAT_BasicElt
") Last;
		Handle_MAT_BasicElt Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: BRepMAT2d_SequenceOfBasicElt &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,BRepMAT2d_SequenceOfBasicElt & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_MAT_BasicElt
") Value;
		Handle_MAT_BasicElt Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_MAT_BasicElt &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_MAT_BasicElt & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_MAT_BasicElt
") ChangeValue;
		Handle_MAT_BasicElt ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


