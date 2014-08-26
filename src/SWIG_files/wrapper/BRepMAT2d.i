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
%module BRepMAT2d

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

%include BRepMAT2d_required_python_modules.i
%include BRepMAT2d_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepMAT2d_BisectingLocus;
class BRepMAT2d_BisectingLocus {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMAT2d_BisectingLocus;
		 BRepMAT2d_BisectingLocus ();
		%feature("autodoc", "Args:
	anExplo(BRepMAT2d_Explorer)
	LineIndex(Standard_Integer)=1
	aSide(MAT_Side)=MAT_Left

Returns:
	None

No detailed docstring for this function.") Compute;
		void Compute (BRepMAT2d_Explorer & anExplo,const Standard_Integer LineIndex = 1,const MAT_Side aSide = MAT_Left);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Graph

No detailed docstring for this function.") Graph;
		Handle_MAT_Graph Graph ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NumberOfContours;
		Standard_Integer NumberOfContours ();
		%feature("autodoc", "Args:
	IndLine(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") NumberOfElts;
		Standard_Integer NumberOfElts (const Standard_Integer IndLine);
		%feature("autodoc", "Args:
	IndLine(Standard_Integer)
	Index(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") NumberOfSections;
		Standard_Integer NumberOfSections (const Standard_Integer IndLine,const Standard_Integer Index);
		%feature("autodoc", "Args:
	IndLine(Standard_Integer)
	Index(Standard_Integer)

Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") BasicElt;
		Handle_MAT_BasicElt BasicElt (const Standard_Integer IndLine,const Standard_Integer Index);
		%feature("autodoc", "Args:
	aBasicElt(Handle_MAT_BasicElt)

Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") GeomElt;
		Handle_Geom2d_Geometry GeomElt (const Handle_MAT_BasicElt & aBasicElt);
		%feature("autodoc", "Args:
	aNode(Handle_MAT_Node)

Returns:
	gp_Pnt2d

No detailed docstring for this function.") GeomElt;
		gp_Pnt2d GeomElt (const Handle_MAT_Node & aNode);
		%feature("autodoc", "Args:
	anArc(Handle_MAT_Arc)
	Reverse(Standard_Boolean)

Returns:
	Bisector_Bisec

No detailed docstring for this function.") GeomBis;
		Bisector_Bisec GeomBis (const Handle_MAT_Arc & anArc,Standard_Boolean & Reverse);
};


%feature("shadow") BRepMAT2d_BisectingLocus::~BRepMAT2d_BisectingLocus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMAT2d_BisectingLocus {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape;
class BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape;
		 BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape ();
		%feature("autodoc", "Args:
	aMap(BRepMAT2d_DataMapOfBasicEltShape)

Returns:
	None

No detailed docstring for this function.") BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape;
		 BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape (const BRepMAT2d_DataMapOfBasicEltShape & aMap);
		%feature("autodoc", "Args:
	aMap(BRepMAT2d_DataMapOfBasicEltShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepMAT2d_DataMapOfBasicEltShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") Key;
		const Handle_MAT_BasicElt & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value ();
};


%feature("shadow") BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape::~BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt;
class BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt;
		 BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt ();
		%feature("autodoc", "Args:
	aMap(BRepMAT2d_DataMapOfShapeSequenceOfBasicElt)

Returns:
	None

No detailed docstring for this function.") BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt;
		 BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt (const BRepMAT2d_DataMapOfShapeSequenceOfBasicElt & aMap);
		%feature("autodoc", "Args:
	aMap(BRepMAT2d_DataMapOfShapeSequenceOfBasicElt)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepMAT2d_DataMapOfShapeSequenceOfBasicElt & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMAT2d_SequenceOfBasicElt

No detailed docstring for this function.") Value;
		const BRepMAT2d_SequenceOfBasicElt & Value ();
};


%feature("shadow") BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt::~BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape;
class BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Handle_MAT_BasicElt)
	I(TopoDS_Shape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape;
		 BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape (const Handle_MAT_BasicElt & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") Key;
		Handle_MAT_BasicElt & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		TopoDS_Shape & Value ();
};


%feature("shadow") BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape::~BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape {
	Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape GetHandle() {
	return *(Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape*) &$self;
	}
};

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
%feature("shadow") Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape::~Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMAT2d_DataMapNodeOfDataMapOfBasicEltShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt;
class BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(BRepMAT2d_SequenceOfBasicElt)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt;
		 BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt (const TopoDS_Shape & K,const BRepMAT2d_SequenceOfBasicElt & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepMAT2d_SequenceOfBasicElt

No detailed docstring for this function.") Value;
		BRepMAT2d_SequenceOfBasicElt & Value ();
};


%feature("shadow") BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt::~BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt {
	Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt GetHandle() {
	return *(Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt*) &$self;
	}
};

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
%feature("shadow") Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt::~Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMAT2d_DataMapNodeOfDataMapOfShapeSequenceOfBasicElt {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMAT2d_DataMapOfBasicEltShape;
class BRepMAT2d_DataMapOfBasicEltShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepMAT2d_DataMapOfBasicEltShape;
		 BRepMAT2d_DataMapOfBasicEltShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepMAT2d_DataMapOfBasicEltShape)

Returns:
	BRepMAT2d_DataMapOfBasicEltShape

No detailed docstring for this function.") Assign;
		BRepMAT2d_DataMapOfBasicEltShape & Assign (const BRepMAT2d_DataMapOfBasicEltShape & Other);
		%feature("autodoc", "Args:
	Other(BRepMAT2d_DataMapOfBasicEltShape)

Returns:
	BRepMAT2d_DataMapOfBasicEltShape

No detailed docstring for this function.") operator=;
		BRepMAT2d_DataMapOfBasicEltShape & operator = (const BRepMAT2d_DataMapOfBasicEltShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_MAT_BasicElt)
	I(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const Handle_MAT_BasicElt & K,const TopoDS_Shape & I);
		%feature("autodoc", "Args:
	K(Handle_MAT_BasicElt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const Handle_MAT_BasicElt & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_BasicElt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const Handle_MAT_BasicElt & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_BasicElt)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Find;
		const TopoDS_Shape & Find (const Handle_MAT_BasicElt & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_BasicElt)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeFind;
		TopoDS_Shape & ChangeFind (const Handle_MAT_BasicElt & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_BasicElt)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const Handle_MAT_BasicElt & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_BasicElt)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_MAT_BasicElt & K);
};


%feature("shadow") BRepMAT2d_DataMapOfBasicEltShape::~BRepMAT2d_DataMapOfBasicEltShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMAT2d_DataMapOfBasicEltShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMAT2d_DataMapOfShapeSequenceOfBasicElt;
class BRepMAT2d_DataMapOfShapeSequenceOfBasicElt : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepMAT2d_DataMapOfShapeSequenceOfBasicElt;
		 BRepMAT2d_DataMapOfShapeSequenceOfBasicElt (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepMAT2d_DataMapOfShapeSequenceOfBasicElt)

Returns:
	BRepMAT2d_DataMapOfShapeSequenceOfBasicElt

No detailed docstring for this function.") Assign;
		BRepMAT2d_DataMapOfShapeSequenceOfBasicElt & Assign (const BRepMAT2d_DataMapOfShapeSequenceOfBasicElt & Other);
		%feature("autodoc", "Args:
	Other(BRepMAT2d_DataMapOfShapeSequenceOfBasicElt)

Returns:
	BRepMAT2d_DataMapOfShapeSequenceOfBasicElt

No detailed docstring for this function.") operator=;
		BRepMAT2d_DataMapOfShapeSequenceOfBasicElt & operator = (const BRepMAT2d_DataMapOfShapeSequenceOfBasicElt & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(BRepMAT2d_SequenceOfBasicElt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const BRepMAT2d_SequenceOfBasicElt & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	BRepMAT2d_SequenceOfBasicElt

No detailed docstring for this function.") Find;
		const BRepMAT2d_SequenceOfBasicElt & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	BRepMAT2d_SequenceOfBasicElt

No detailed docstring for this function.") ChangeFind;
		BRepMAT2d_SequenceOfBasicElt & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") BRepMAT2d_DataMapOfShapeSequenceOfBasicElt::~BRepMAT2d_DataMapOfShapeSequenceOfBasicElt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMAT2d_DataMapOfShapeSequenceOfBasicElt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMAT2d_Explorer;
class BRepMAT2d_Explorer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMAT2d_Explorer;
		 BRepMAT2d_Explorer ();
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") BRepMAT2d_Explorer;
		 BRepMAT2d_Explorer (const TopoDS_Face & aFace);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear the contents of <self>.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Face & aFace);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Number of contours.") NumberOfContours;
		Standard_Integer NumberOfContours ();
		%feature("autodoc", "Args:
	IndexContour(Standard_Integer)

Returns:
	Standard_Integer

Returns the Number of Curves in the Contour  number  
           <IndexContour>.") NumberOfCurves;
		Standard_Integer NumberOfCurves (const Standard_Integer IndexContour);
		%feature("autodoc", "Args:
	IndexContour(Standard_Integer)

Returns:
	None

Initialisation of  an Iterator on  the curves of  
           the Contour number <IndexContour>.") Init;
		void Init (const Standard_Integer IndexContour);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Return False if there is no more curves on the Contour  
           initialised by the method Init.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Move to the next curve of the current Contour.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

Returns the current curve on the current Contour.") Value;
		Handle_Geom2d_Curve Value ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		TopoDS_Shape Shape ();
		%feature("autodoc", "Args:
	IndexContour(Standard_Integer)

Returns:
	TColGeom2d_SequenceOfCurve

No detailed docstring for this function.") Contour;
		const TColGeom2d_SequenceOfCurve & Contour (const Standard_Integer IndexContour);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsModified;
		Standard_Boolean IsModified (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	TopoDS_Shape

If the shape is not modified, returns the shape itself.") ModifiedShape;
		TopoDS_Shape ModifiedShape (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfBoolean

No detailed docstring for this function.") GetIsClosed;
		const TColStd_SequenceOfBoolean & GetIsClosed ();
};


%feature("shadow") BRepMAT2d_Explorer::~BRepMAT2d_Explorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMAT2d_Explorer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMAT2d_LinkTopoBilo;
class BRepMAT2d_LinkTopoBilo {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMAT2d_LinkTopoBilo;
		 BRepMAT2d_LinkTopoBilo ();
		%feature("autodoc", "Args:
	Explo(BRepMAT2d_Explorer)
	BiLo(BRepMAT2d_BisectingLocus)

Returns:
	None

Constructs the links Between S and BiLo.  
 raises if <S> is not a face.") BRepMAT2d_LinkTopoBilo;
		 BRepMAT2d_LinkTopoBilo (const BRepMAT2d_Explorer & Explo,const BRepMAT2d_BisectingLocus & BiLo);
		%feature("autodoc", "Args:
	Explo(BRepMAT2d_Explorer)
	BiLo(BRepMAT2d_BisectingLocus)

Returns:
	None

Constructs the links Between S and BiLo.  
 raises if <S> is not a face or a wire.") Perform;
		void Perform (const BRepMAT2d_Explorer & Explo,const BRepMAT2d_BisectingLocus & BiLo);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initialise the Iterator on <S>  
         <S> is an edge or a vertex of the initial  
         wire or face.  raises if <S> is not an edge or a vertex.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there  is a current  BasicElt.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Proceed to the next BasicElt.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_BasicElt

Returns the current BasicElt.") Value;
		Handle_MAT_BasicElt Value ();
		%feature("autodoc", "Args:
	aBE(Handle_MAT_BasicElt)

Returns:
	TopoDS_Shape

Returns the Shape linked to <aBE>.") GeneratingShape;
		TopoDS_Shape GeneratingShape (const Handle_MAT_BasicElt & aBE);
};


%feature("shadow") BRepMAT2d_LinkTopoBilo::~BRepMAT2d_LinkTopoBilo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMAT2d_LinkTopoBilo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepMAT2d_SequenceNodeOfSequenceOfBasicElt;
class BRepMAT2d_SequenceNodeOfSequenceOfBasicElt : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_MAT_BasicElt)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepMAT2d_SequenceNodeOfSequenceOfBasicElt;
		 BRepMAT2d_SequenceNodeOfSequenceOfBasicElt (const Handle_MAT_BasicElt & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") Value;
		Handle_MAT_BasicElt & Value ();
};


%feature("shadow") BRepMAT2d_SequenceNodeOfSequenceOfBasicElt::~BRepMAT2d_SequenceNodeOfSequenceOfBasicElt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMAT2d_SequenceNodeOfSequenceOfBasicElt {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepMAT2d_SequenceNodeOfSequenceOfBasicElt {
	Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt GetHandle() {
	return *(Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt*) &$self;
	}
};

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
%feature("shadow") Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt::~Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepMAT2d_SequenceNodeOfSequenceOfBasicElt {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepMAT2d_SequenceOfBasicElt;
class BRepMAT2d_SequenceOfBasicElt : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepMAT2d_SequenceOfBasicElt;
		 BRepMAT2d_SequenceOfBasicElt ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(BRepMAT2d_SequenceOfBasicElt)

Returns:
	BRepMAT2d_SequenceOfBasicElt

No detailed docstring for this function.") Assign;
		const BRepMAT2d_SequenceOfBasicElt & Assign (const BRepMAT2d_SequenceOfBasicElt & Other);
		%feature("autodoc", "Args:
	Other(BRepMAT2d_SequenceOfBasicElt)

Returns:
	BRepMAT2d_SequenceOfBasicElt

No detailed docstring for this function.") operator=;
		const BRepMAT2d_SequenceOfBasicElt & operator = (const BRepMAT2d_SequenceOfBasicElt & Other);
		%feature("autodoc", "Args:
	T(Handle_MAT_BasicElt)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_MAT_BasicElt & T);
		%feature("autodoc", "Args:
	S(BRepMAT2d_SequenceOfBasicElt)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepMAT2d_SequenceOfBasicElt & S);
		%feature("autodoc", "Args:
	T(Handle_MAT_BasicElt)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_MAT_BasicElt & T);
		%feature("autodoc", "Args:
	S(BRepMAT2d_SequenceOfBasicElt)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepMAT2d_SequenceOfBasicElt & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_MAT_BasicElt)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_MAT_BasicElt & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepMAT2d_SequenceOfBasicElt)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepMAT2d_SequenceOfBasicElt & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_MAT_BasicElt)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_MAT_BasicElt & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepMAT2d_SequenceOfBasicElt)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepMAT2d_SequenceOfBasicElt & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") First;
		const Handle_MAT_BasicElt & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") Last;
		const Handle_MAT_BasicElt & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(BRepMAT2d_SequenceOfBasicElt)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,BRepMAT2d_SequenceOfBasicElt & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") Value;
		const Handle_MAT_BasicElt & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_MAT_BasicElt)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_MAT_BasicElt & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") ChangeValue;
		Handle_MAT_BasicElt & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") BRepMAT2d_SequenceOfBasicElt::~BRepMAT2d_SequenceOfBasicElt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepMAT2d_SequenceOfBasicElt {
	void _kill_pointed() {
		delete $self;
	}
};
