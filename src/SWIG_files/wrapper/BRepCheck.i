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
%module (package="OCC") BRepCheck

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


%include BRepCheck_headers.i


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
enum BRepCheck_Status {
	BRepCheck_NoError = 0,
	BRepCheck_InvalidPointOnCurve = 1,
	BRepCheck_InvalidPointOnCurveOnSurface = 2,
	BRepCheck_InvalidPointOnSurface = 3,
	BRepCheck_No3DCurve = 4,
	BRepCheck_Multiple3DCurve = 5,
	BRepCheck_Invalid3DCurve = 6,
	BRepCheck_NoCurveOnSurface = 7,
	BRepCheck_InvalidCurveOnSurface = 8,
	BRepCheck_InvalidCurveOnClosedSurface = 9,
	BRepCheck_InvalidSameRangeFlag = 10,
	BRepCheck_InvalidSameParameterFlag = 11,
	BRepCheck_InvalidDegeneratedFlag = 12,
	BRepCheck_FreeEdge = 13,
	BRepCheck_InvalidMultiConnexity = 14,
	BRepCheck_InvalidRange = 15,
	BRepCheck_EmptyWire = 16,
	BRepCheck_RedundantEdge = 17,
	BRepCheck_SelfIntersectingWire = 18,
	BRepCheck_NoSurface = 19,
	BRepCheck_InvalidWire = 20,
	BRepCheck_RedundantWire = 21,
	BRepCheck_IntersectingWires = 22,
	BRepCheck_InvalidImbricationOfWires = 23,
	BRepCheck_EmptyShell = 24,
	BRepCheck_RedundantFace = 25,
	BRepCheck_InvalidImbricationOfShells = 26,
	BRepCheck_UnorientableShape = 27,
	BRepCheck_NotClosed = 28,
	BRepCheck_NotConnected = 29,
	BRepCheck_SubshapeNotInShape = 30,
	BRepCheck_BadOrientation = 31,
	BRepCheck_BadOrientationOfSubshape = 32,
	BRepCheck_InvalidPolygonOnTriangulation = 33,
	BRepCheck_InvalidToleranceValue = 34,
	BRepCheck_EnclosedRegion = 35,
	BRepCheck_CheckFail = 36,
};

/* end public enums declaration */

%rename(brepcheck) BRepCheck;
class BRepCheck {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param List:
	:type List: BRepCheck_ListOfStatus &
	:param Stat:
	:type Stat: BRepCheck_Status
	:rtype: void
") Add;
		static void Add (BRepCheck_ListOfStatus & List,const BRepCheck_Status Stat);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param Stat:
	:type Stat: BRepCheck_Status
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Print;
		static void Print (const BRepCheck_Status Stat,Standard_OStream & OS);
		%feature("compactdefaultargs") SelfIntersection;
		%feature("autodoc", "	:param W:
	:type W: TopoDS_Wire &
	:param F:
	:type F: TopoDS_Face &
	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:rtype: bool
") SelfIntersection;
		static Standard_Boolean SelfIntersection (const TopoDS_Wire & W,const TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2);
};


%extend BRepCheck {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_Analyzer;
class BRepCheck_Analyzer {
	public:
		%feature("compactdefaultargs") BRepCheck_Analyzer;
		%feature("autodoc", "	* Constructs a shape validation object defined by the shape S. <S> is the shape to control. <GeomControls> If False only topological informaions are checked. The geometricals controls are For a Vertex : BRepCheck_InvalidToleranceValue NYI For an Edge : BRepCheck_InvalidCurveOnClosedSurface, BRepCheck_InvalidCurveOnSurface, BRepCheck_InvalidSameParameterFlag, BRepCheck_InvalidToleranceValue NYI For a face : BRepCheck_UnorientableShape, BRepCheck_IntersectingWires, BRepCheck_InvalidToleranceValue NYI For a wire : BRepCheck_SelfIntersectingWire

	:param S:
	:type S: TopoDS_Shape &
	:param GeomControls: default value is Standard_True
	:type GeomControls: bool
	:rtype: None
") BRepCheck_Analyzer;
		 BRepCheck_Analyzer (const TopoDS_Shape & S,const Standard_Boolean GeomControls = Standard_True);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* <S> is the shape to control. <GeomControls> If False only topological informaions are checked. The geometricals controls are For a Vertex : BRepCheck_InvalidTolerance NYI For an Edge : BRepCheck_InvalidCurveOnClosedSurface, BRepCheck_InvalidCurveOnSurface, BRepCheck_InvalidSameParameterFlag, BRepCheck_InvalidTolerance NYI For a face : BRepCheck_UnorientableShape, BRepCheck_IntersectingWires, BRepCheck_InvalidTolerance NYI For a wire : BRepCheck_SelfIntersectingWire

	:param S:
	:type S: TopoDS_Shape &
	:param GeomControls: default value is Standard_True
	:type GeomControls: bool
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S,const Standard_Boolean GeomControls = Standard_True);
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* <S> is a subshape of the original shape. Returns <STandard_True> if no default has been detected on <S> and any of its subshape.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsValid;
		Standard_Boolean IsValid (const TopoDS_Shape & S);
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Returns true if no defect is detected on the shape S or any of its subshapes. Returns true if the shape S is valid. This function checks whether a given shape is valid by checking that: - the topology is correct - parameterization of edges in particular is correct. For the topology to be correct, the following conditions must be satisfied: - edges should have at least two vertices if they are not degenerate edges. The vertices should be within the range of the bounding edges at the tolerance specified in the vertex, - edges should share at least one face. The representation of the edges should be within the tolerance criterion assigned to them. - wires defining a face should not self-intersect and should be closed, - there should be one wire which contains all other wires inside a face, - wires should be correctly oriented with respect to each of the edges, - faces should be correctly oriented, in particular with respect to adjacent faces if these faces define a solid, - shells defining a solid should be closed. There should be one enclosing shell if the shape is a solid; To check parameterization of edge, there are 2 approaches depending on the edge?s contextual situation. - if the edge is either single, or it is in the context of a wire or a compound, its parameterization is defined by the parameterization of its 3D curve and is considered as valid. - If the edge is in the context of a face, it should have SameParameter and SameRange flags set to Standard_True. To check these flags, you should call the function BRep_Tool::SameParameter and BRep_Tool::SameRange for an edge. If at least one of these flags is set to Standard_False, the edge is considered as invalid without any additional check. If the edge is contained by a face, and it has SameParameter and SameRange flags set to Standard_True, IsValid checks whether representation of the edge on face, in context of which the edge is considered, has the same parameterization up to the tolerance value coded on the edge. For a given parameter t on the edge having C as a 3D curve and one PCurve P on a surface S (base surface of the reference face), this checks that |C(t) - S(P(t))| is less than or equal to tolerance, where tolerance is the tolerance value coded on the edge.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	:param SubS:
	:type SubS: TopoDS_Shape &
	:rtype: Handle_BRepCheck_Result
") Result;
		Handle_BRepCheck_Result Result (const TopoDS_Shape & SubS);
};


%extend BRepCheck_Analyzer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus;
class BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus;
		%feature("autodoc", "	:rtype: None
") BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus;
		 BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus ();
		%feature("compactdefaultargs") BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepCheck_DataMapOfShapeListOfStatus &
	:rtype: None
") BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus;
		 BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus (const BRepCheck_DataMapOfShapeListOfStatus & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepCheck_DataMapOfShapeListOfStatus &
	:rtype: None
") Initialize;
		void Initialize (const BRepCheck_DataMapOfShapeListOfStatus & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepCheck_ListOfStatus
") Value;
		const BRepCheck_ListOfStatus & Value ();
};


%extend BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_DataMapIteratorOfDataMapOfShapeResult;
class BRepCheck_DataMapIteratorOfDataMapOfShapeResult : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepCheck_DataMapIteratorOfDataMapOfShapeResult;
		%feature("autodoc", "	:rtype: None
") BRepCheck_DataMapIteratorOfDataMapOfShapeResult;
		 BRepCheck_DataMapIteratorOfDataMapOfShapeResult ();
		%feature("compactdefaultargs") BRepCheck_DataMapIteratorOfDataMapOfShapeResult;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepCheck_DataMapOfShapeResult &
	:rtype: None
") BRepCheck_DataMapIteratorOfDataMapOfShapeResult;
		 BRepCheck_DataMapIteratorOfDataMapOfShapeResult (const BRepCheck_DataMapOfShapeResult & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepCheck_DataMapOfShapeResult &
	:rtype: None
") Initialize;
		void Initialize (const BRepCheck_DataMapOfShapeResult & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_BRepCheck_Result
") Value;
		Handle_BRepCheck_Result Value ();
};


%extend BRepCheck_DataMapIteratorOfDataMapOfShapeResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus;
class BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: BRepCheck_ListOfStatus &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus;
		 BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus (const TopoDS_Shape & K,const BRepCheck_ListOfStatus & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepCheck_ListOfStatus
") Value;
		BRepCheck_ListOfStatus & Value ();
};


%extend BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus::Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus;
class Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus();
        Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus(const Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus &aHandle);
        Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus(const BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus {
    BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus* _get_reference() {
    return (BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus*)$self->Access();
    }
};

%extend Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_DataMapNodeOfDataMapOfShapeResult;
class BRepCheck_DataMapNodeOfDataMapOfShapeResult : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepCheck_DataMapNodeOfDataMapOfShapeResult;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Handle_BRepCheck_Result &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepCheck_DataMapNodeOfDataMapOfShapeResult;
		 BRepCheck_DataMapNodeOfDataMapOfShapeResult (const TopoDS_Shape & K,const Handle_BRepCheck_Result & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_BRepCheck_Result
") Value;
		Handle_BRepCheck_Result Value ();
};


%extend BRepCheck_DataMapNodeOfDataMapOfShapeResult {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult::Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult;
class Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult();
        Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult(const Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult &aHandle);
        Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult(const BRepCheck_DataMapNodeOfDataMapOfShapeResult *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult {
    BRepCheck_DataMapNodeOfDataMapOfShapeResult* _get_reference() {
    return (BRepCheck_DataMapNodeOfDataMapOfShapeResult*)$self->Access();
    }
};

%extend Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepCheck_DataMapNodeOfDataMapOfShapeResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_DataMapOfShapeListOfStatus;
class BRepCheck_DataMapOfShapeListOfStatus : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepCheck_DataMapOfShapeListOfStatus;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepCheck_DataMapOfShapeListOfStatus;
		 BRepCheck_DataMapOfShapeListOfStatus (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepCheck_DataMapOfShapeListOfStatus &
	:rtype: BRepCheck_DataMapOfShapeListOfStatus
") Assign;
		BRepCheck_DataMapOfShapeListOfStatus & Assign (const BRepCheck_DataMapOfShapeListOfStatus & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepCheck_DataMapOfShapeListOfStatus &
	:rtype: BRepCheck_DataMapOfShapeListOfStatus
") operator =;
		BRepCheck_DataMapOfShapeListOfStatus & operator = (const BRepCheck_DataMapOfShapeListOfStatus & Other);
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
	:type I: BRepCheck_ListOfStatus &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const BRepCheck_ListOfStatus & I);
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
	:rtype: BRepCheck_ListOfStatus
") Find;
		const BRepCheck_ListOfStatus & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: BRepCheck_ListOfStatus
") ChangeFind;
		BRepCheck_ListOfStatus & ChangeFind (const TopoDS_Shape & K);
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


%extend BRepCheck_DataMapOfShapeListOfStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_DataMapOfShapeResult;
class BRepCheck_DataMapOfShapeResult : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepCheck_DataMapOfShapeResult;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepCheck_DataMapOfShapeResult;
		 BRepCheck_DataMapOfShapeResult (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepCheck_DataMapOfShapeResult &
	:rtype: BRepCheck_DataMapOfShapeResult
") Assign;
		BRepCheck_DataMapOfShapeResult & Assign (const BRepCheck_DataMapOfShapeResult & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepCheck_DataMapOfShapeResult &
	:rtype: BRepCheck_DataMapOfShapeResult
") operator =;
		BRepCheck_DataMapOfShapeResult & operator = (const BRepCheck_DataMapOfShapeResult & Other);
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
	:type I: Handle_BRepCheck_Result &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Handle_BRepCheck_Result & I);
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
	:rtype: Handle_BRepCheck_Result
") Find;
		Handle_BRepCheck_Result Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Handle_BRepCheck_Result
") ChangeFind;
		Handle_BRepCheck_Result ChangeFind (const TopoDS_Shape & K);
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


%extend BRepCheck_DataMapOfShapeResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_ListIteratorOfListOfStatus;
class BRepCheck_ListIteratorOfListOfStatus {
	public:
		%feature("compactdefaultargs") BRepCheck_ListIteratorOfListOfStatus;
		%feature("autodoc", "	:rtype: None
") BRepCheck_ListIteratorOfListOfStatus;
		 BRepCheck_ListIteratorOfListOfStatus ();
		%feature("compactdefaultargs") BRepCheck_ListIteratorOfListOfStatus;
		%feature("autodoc", "	:param L:
	:type L: BRepCheck_ListOfStatus &
	:rtype: None
") BRepCheck_ListIteratorOfListOfStatus;
		 BRepCheck_ListIteratorOfListOfStatus (const BRepCheck_ListOfStatus & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: BRepCheck_ListOfStatus &
	:rtype: None
") Initialize;
		void Initialize (const BRepCheck_ListOfStatus & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepCheck_Status
") Value;
		BRepCheck_Status & Value ();
};


%extend BRepCheck_ListIteratorOfListOfStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_ListNodeOfListOfStatus;
class BRepCheck_ListNodeOfListOfStatus : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepCheck_ListNodeOfListOfStatus;
		%feature("autodoc", "	:param I:
	:type I: BRepCheck_Status &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepCheck_ListNodeOfListOfStatus;
		 BRepCheck_ListNodeOfListOfStatus (const BRepCheck_Status & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepCheck_Status
") Value;
		BRepCheck_Status & Value ();
};


%extend BRepCheck_ListNodeOfListOfStatus {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepCheck_ListNodeOfListOfStatus(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepCheck_ListNodeOfListOfStatus::Handle_BRepCheck_ListNodeOfListOfStatus %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepCheck_ListNodeOfListOfStatus;
class Handle_BRepCheck_ListNodeOfListOfStatus : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepCheck_ListNodeOfListOfStatus();
        Handle_BRepCheck_ListNodeOfListOfStatus(const Handle_BRepCheck_ListNodeOfListOfStatus &aHandle);
        Handle_BRepCheck_ListNodeOfListOfStatus(const BRepCheck_ListNodeOfListOfStatus *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_ListNodeOfListOfStatus DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_ListNodeOfListOfStatus {
    BRepCheck_ListNodeOfListOfStatus* _get_reference() {
    return (BRepCheck_ListNodeOfListOfStatus*)$self->Access();
    }
};

%extend Handle_BRepCheck_ListNodeOfListOfStatus {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepCheck_ListNodeOfListOfStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_ListOfStatus;
class BRepCheck_ListOfStatus {
	public:
		%feature("compactdefaultargs") BRepCheck_ListOfStatus;
		%feature("autodoc", "	:rtype: None
") BRepCheck_ListOfStatus;
		 BRepCheck_ListOfStatus ();
		%feature("compactdefaultargs") BRepCheck_ListOfStatus;
		%feature("autodoc", "	:param Other:
	:type Other: BRepCheck_ListOfStatus &
	:rtype: None
") BRepCheck_ListOfStatus;
		 BRepCheck_ListOfStatus (const BRepCheck_ListOfStatus & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepCheck_ListOfStatus &
	:rtype: None
") Assign;
		void Assign (const BRepCheck_ListOfStatus & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepCheck_ListOfStatus &
	:rtype: None
") operator =;
		void operator = (const BRepCheck_ListOfStatus & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: BRepCheck_Status &
	:rtype: None
") Prepend;
		void Prepend (const BRepCheck_Status & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: BRepCheck_Status &
	:param theIt:
	:type theIt: BRepCheck_ListIteratorOfListOfStatus &
	:rtype: None
") Prepend;
		void Prepend (const BRepCheck_Status & I,BRepCheck_ListIteratorOfListOfStatus & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: BRepCheck_ListOfStatus &
	:rtype: None
") Prepend;
		void Prepend (BRepCheck_ListOfStatus & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: BRepCheck_Status &
	:rtype: None
") Append;
		void Append (const BRepCheck_Status & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: BRepCheck_Status &
	:param theIt:
	:type theIt: BRepCheck_ListIteratorOfListOfStatus &
	:rtype: None
") Append;
		void Append (const BRepCheck_Status & I,BRepCheck_ListIteratorOfListOfStatus & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: BRepCheck_ListOfStatus &
	:rtype: None
") Append;
		void Append (BRepCheck_ListOfStatus & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: BRepCheck_Status
") First;
		BRepCheck_Status & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: BRepCheck_Status
") Last;
		BRepCheck_Status & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: BRepCheck_ListIteratorOfListOfStatus &
	:rtype: None
") Remove;
		void Remove (BRepCheck_ListIteratorOfListOfStatus & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: BRepCheck_Status &
	:param It:
	:type It: BRepCheck_ListIteratorOfListOfStatus &
	:rtype: None
") InsertBefore;
		void InsertBefore (const BRepCheck_Status & I,BRepCheck_ListIteratorOfListOfStatus & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: BRepCheck_ListOfStatus &
	:param It:
	:type It: BRepCheck_ListIteratorOfListOfStatus &
	:rtype: None
") InsertBefore;
		void InsertBefore (BRepCheck_ListOfStatus & Other,BRepCheck_ListIteratorOfListOfStatus & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: BRepCheck_Status &
	:param It:
	:type It: BRepCheck_ListIteratorOfListOfStatus &
	:rtype: None
") InsertAfter;
		void InsertAfter (const BRepCheck_Status & I,BRepCheck_ListIteratorOfListOfStatus & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: BRepCheck_ListOfStatus &
	:param It:
	:type It: BRepCheck_ListIteratorOfListOfStatus &
	:rtype: None
") InsertAfter;
		void InsertAfter (BRepCheck_ListOfStatus & Other,BRepCheck_ListIteratorOfListOfStatus & It);
};


%extend BRepCheck_ListOfStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_Result;
class BRepCheck_Result : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "	:param ContextShape:
	:type ContextShape: TopoDS_Shape &
	:rtype: void
") InContext;
		virtual void InContext (const TopoDS_Shape & ContextShape);
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "	:rtype: void
") Minimum;
		virtual void Minimum ();
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "	:rtype: void
") Blind;
		virtual void Blind ();
		%feature("compactdefaultargs") SetFailStatus;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") SetFailStatus;
		void SetFailStatus (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:rtype: BRepCheck_ListOfStatus
") Status;
		const BRepCheck_ListOfStatus & Status ();
		%feature("compactdefaultargs") IsMinimum;
		%feature("autodoc", "	:rtype: bool
") IsMinimum;
		Standard_Boolean IsMinimum ();
		%feature("compactdefaultargs") IsBlind;
		%feature("autodoc", "	:rtype: bool
") IsBlind;
		Standard_Boolean IsBlind ();
		%feature("compactdefaultargs") StatusOnShape;
		%feature("autodoc", "	* If not already done, performs the InContext control and returns the list of status.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: BRepCheck_ListOfStatus
") StatusOnShape;
		const BRepCheck_ListOfStatus & StatusOnShape (const TopoDS_Shape & S);
		%feature("compactdefaultargs") InitContextIterator;
		%feature("autodoc", "	:rtype: None
") InitContextIterator;
		void InitContextIterator ();
		%feature("compactdefaultargs") MoreShapeInContext;
		%feature("autodoc", "	:rtype: bool
") MoreShapeInContext;
		Standard_Boolean MoreShapeInContext ();
		%feature("compactdefaultargs") ContextualShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") ContextualShape;
		const TopoDS_Shape  ContextualShape ();
		%feature("compactdefaultargs") StatusOnShape;
		%feature("autodoc", "	:rtype: BRepCheck_ListOfStatus
") StatusOnShape;
		const BRepCheck_ListOfStatus & StatusOnShape ();
		%feature("compactdefaultargs") NextShapeInContext;
		%feature("autodoc", "	:rtype: None
") NextShapeInContext;
		void NextShapeInContext ();
};


%extend BRepCheck_Result {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepCheck_Result(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepCheck_Result::Handle_BRepCheck_Result %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepCheck_Result;
class Handle_BRepCheck_Result : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepCheck_Result();
        Handle_BRepCheck_Result(const Handle_BRepCheck_Result &aHandle);
        Handle_BRepCheck_Result(const BRepCheck_Result *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_Result DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Result {
    BRepCheck_Result* _get_reference() {
    return (BRepCheck_Result*)$self->Access();
    }
};

%extend Handle_BRepCheck_Result {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepCheck_Result {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_Edge;
class BRepCheck_Edge : public BRepCheck_Result {
	public:
		%feature("compactdefaultargs") BRepCheck_Edge;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") BRepCheck_Edge;
		 BRepCheck_Edge (const TopoDS_Edge & E);
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "	:param ContextShape:
	:type ContextShape: TopoDS_Shape &
	:rtype: None
") InContext;
		void InContext (const TopoDS_Shape & ContextShape);
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "	:rtype: None
") Minimum;
		void Minimum ();
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "	:rtype: None
") Blind;
		void Blind ();
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "	:rtype: bool
") GeometricControls;
		Standard_Boolean GeometricControls ();
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") GeometricControls;
		void GeometricControls (const Standard_Boolean B);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Sets status of Edge;

	:param theStatus:
	:type theStatus: BRepCheck_Status
	:rtype: None
") SetStatus;
		void SetStatus (const BRepCheck_Status theStatus);
		%feature("compactdefaultargs") CheckPolygonOnTriangulation;
		%feature("autodoc", "	* Checks, if polygon on triangulation of heEdge is out of 3D-curve of this edge.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:rtype: BRepCheck_Status
") CheckPolygonOnTriangulation;
		BRepCheck_Status CheckPolygonOnTriangulation (const TopoDS_Edge & theEdge);
};


%extend BRepCheck_Edge {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepCheck_Edge(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepCheck_Edge::Handle_BRepCheck_Edge %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepCheck_Edge;
class Handle_BRepCheck_Edge : public Handle_BRepCheck_Result {

    public:
        // constructors
        Handle_BRepCheck_Edge();
        Handle_BRepCheck_Edge(const Handle_BRepCheck_Edge &aHandle);
        Handle_BRepCheck_Edge(const BRepCheck_Edge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_Edge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Edge {
    BRepCheck_Edge* _get_reference() {
    return (BRepCheck_Edge*)$self->Access();
    }
};

%extend Handle_BRepCheck_Edge {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepCheck_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_Face;
class BRepCheck_Face : public BRepCheck_Result {
	public:
		%feature("compactdefaultargs") BRepCheck_Face;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") BRepCheck_Face;
		 BRepCheck_Face (const TopoDS_Face & F);
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "	:param ContextShape:
	:type ContextShape: TopoDS_Shape &
	:rtype: None
") InContext;
		void InContext (const TopoDS_Shape & ContextShape);
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "	:rtype: None
") Minimum;
		void Minimum ();
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "	:rtype: None
") Blind;
		void Blind ();
		%feature("compactdefaultargs") IntersectWires;
		%feature("autodoc", "	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status
") IntersectWires;
		BRepCheck_Status IntersectWires (const Standard_Boolean Update = Standard_False);
		%feature("compactdefaultargs") ClassifyWires;
		%feature("autodoc", "	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status
") ClassifyWires;
		BRepCheck_Status ClassifyWires (const Standard_Boolean Update = Standard_False);
		%feature("compactdefaultargs") OrientationOfWires;
		%feature("autodoc", "	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status
") OrientationOfWires;
		BRepCheck_Status OrientationOfWires (const Standard_Boolean Update = Standard_False);
		%feature("compactdefaultargs") SetUnorientable;
		%feature("autodoc", "	:rtype: None
") SetUnorientable;
		void SetUnorientable ();
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Sets status of Face;

	:param theStatus:
	:type theStatus: BRepCheck_Status
	:rtype: None
") SetStatus;
		void SetStatus (const BRepCheck_Status theStatus);
		%feature("compactdefaultargs") IsUnorientable;
		%feature("autodoc", "	:rtype: bool
") IsUnorientable;
		Standard_Boolean IsUnorientable ();
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "	:rtype: bool
") GeometricControls;
		Standard_Boolean GeometricControls ();
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") GeometricControls;
		void GeometricControls (const Standard_Boolean B);
};


%extend BRepCheck_Face {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepCheck_Face(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepCheck_Face::Handle_BRepCheck_Face %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepCheck_Face;
class Handle_BRepCheck_Face : public Handle_BRepCheck_Result {

    public:
        // constructors
        Handle_BRepCheck_Face();
        Handle_BRepCheck_Face(const Handle_BRepCheck_Face &aHandle);
        Handle_BRepCheck_Face(const BRepCheck_Face *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_Face DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Face {
    BRepCheck_Face* _get_reference() {
    return (BRepCheck_Face*)$self->Access();
    }
};

%extend Handle_BRepCheck_Face {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepCheck_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_Shell;
class BRepCheck_Shell : public BRepCheck_Result {
	public:
		%feature("compactdefaultargs") BRepCheck_Shell;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") BRepCheck_Shell;
		 BRepCheck_Shell (const TopoDS_Shell & S);
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "	:param ContextShape:
	:type ContextShape: TopoDS_Shape &
	:rtype: None
") InContext;
		void InContext (const TopoDS_Shape & ContextShape);
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "	:rtype: None
") Minimum;
		void Minimum ();
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "	:rtype: None
") Blind;
		void Blind ();
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	* Checks if the oriented faces of the shell give a closed shell. If the wire is closed, returns BRepCheck_NoError.If <Update> is set to Standard_True, registers the status in the list.

	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status
") Closed;
		BRepCheck_Status Closed (const Standard_Boolean Update = Standard_False);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* Checks if the oriented faces of the shell are correctly oriented. An internal call is made to the method Closed. If <Update> is set to Standard_True, registers the status in the list.

	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status
") Orientation;
		BRepCheck_Status Orientation (const Standard_Boolean Update = Standard_False);
		%feature("compactdefaultargs") SetUnorientable;
		%feature("autodoc", "	:rtype: None
") SetUnorientable;
		void SetUnorientable ();
		%feature("compactdefaultargs") IsUnorientable;
		%feature("autodoc", "	:rtype: bool
") IsUnorientable;
		Standard_Boolean IsUnorientable ();
		%feature("compactdefaultargs") NbConnectedSet;
		%feature("autodoc", "	:param theSets:
	:type theSets: TopTools_ListOfShape &
	:rtype: int
") NbConnectedSet;
		Standard_Integer NbConnectedSet (TopTools_ListOfShape & theSets);
};


%extend BRepCheck_Shell {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepCheck_Shell(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepCheck_Shell::Handle_BRepCheck_Shell %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepCheck_Shell;
class Handle_BRepCheck_Shell : public Handle_BRepCheck_Result {

    public:
        // constructors
        Handle_BRepCheck_Shell();
        Handle_BRepCheck_Shell(const Handle_BRepCheck_Shell &aHandle);
        Handle_BRepCheck_Shell(const BRepCheck_Shell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_Shell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Shell {
    BRepCheck_Shell* _get_reference() {
    return (BRepCheck_Shell*)$self->Access();
    }
};

%extend Handle_BRepCheck_Shell {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepCheck_Shell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_Solid;
class BRepCheck_Solid : public BRepCheck_Result {
	public:
		%feature("compactdefaultargs") BRepCheck_Solid;
		%feature("autodoc", "	* Constructor <theS> is the solid to check

	:param theS:
	:type theS: TopoDS_Solid &
	:rtype: None
") BRepCheck_Solid;
		 BRepCheck_Solid (const TopoDS_Solid & theS);
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "	* Checks the solid in context of the shape <theContextShape>

	:param theContextShape:
	:type theContextShape: TopoDS_Shape &
	:rtype: void
") InContext;
		virtual void InContext (const TopoDS_Shape & theContextShape);
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "	* Checks the solid per se. //! The scan area is: 1. Shells that overlaps each other Status: BRepCheck_InvalidImbricationOfShells //! 2. Detached parts of the solid (vertices, edges) that have non-internal orientation Status: BRepCheck_BadOrientationOfSubshape //! 3. For closed, non-internal shells: 3.1 Shells containing entities of the solid that are outside towards the shells Status: BRepCheck_SubshapeNotInShape //! 3.2 Shells that encloses other Shells (for non-holes) Status: BRepCheck_EnclosedRegion

	:rtype: void
") Minimum;
		virtual void Minimum ();
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "	* see the parent class for more details

	:rtype: void
") Blind;
		virtual void Blind ();
};


%extend BRepCheck_Solid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepCheck_Solid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepCheck_Solid::Handle_BRepCheck_Solid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepCheck_Solid;
class Handle_BRepCheck_Solid : public Handle_BRepCheck_Result {

    public:
        // constructors
        Handle_BRepCheck_Solid();
        Handle_BRepCheck_Solid(const Handle_BRepCheck_Solid &aHandle);
        Handle_BRepCheck_Solid(const BRepCheck_Solid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_Solid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Solid {
    BRepCheck_Solid* _get_reference() {
    return (BRepCheck_Solid*)$self->Access();
    }
};

%extend Handle_BRepCheck_Solid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepCheck_Solid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_Vertex;
class BRepCheck_Vertex : public BRepCheck_Result {
	public:
		%feature("compactdefaultargs") BRepCheck_Vertex;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") BRepCheck_Vertex;
		 BRepCheck_Vertex (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "	:param ContextShape:
	:type ContextShape: TopoDS_Shape &
	:rtype: None
") InContext;
		void InContext (const TopoDS_Shape & ContextShape);
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "	:rtype: None
") Minimum;
		void Minimum ();
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "	:rtype: None
") Blind;
		void Blind ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
};


%extend BRepCheck_Vertex {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepCheck_Vertex(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepCheck_Vertex::Handle_BRepCheck_Vertex %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepCheck_Vertex;
class Handle_BRepCheck_Vertex : public Handle_BRepCheck_Result {

    public:
        // constructors
        Handle_BRepCheck_Vertex();
        Handle_BRepCheck_Vertex(const Handle_BRepCheck_Vertex &aHandle);
        Handle_BRepCheck_Vertex(const BRepCheck_Vertex *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_Vertex DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Vertex {
    BRepCheck_Vertex* _get_reference() {
    return (BRepCheck_Vertex*)$self->Access();
    }
};

%extend Handle_BRepCheck_Vertex {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepCheck_Vertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepCheck_Wire;
class BRepCheck_Wire : public BRepCheck_Result {
	public:
		%feature("compactdefaultargs") BRepCheck_Wire;
		%feature("autodoc", "	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") BRepCheck_Wire;
		 BRepCheck_Wire (const TopoDS_Wire & W);
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "	* if <ContextShape> is a face, consequently checks SelfIntersect(), Closed(), Orientation() and Closed2d until faulty is found

	:param ContextShape:
	:type ContextShape: TopoDS_Shape &
	:rtype: None
") InContext;
		void InContext (const TopoDS_Shape & ContextShape);
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "	* checks that the wire is not empty and 'connex'. Called by constructor

	:rtype: None
") Minimum;
		void Minimum ();
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "	* Does nothing

	:rtype: None
") Blind;
		void Blind ();
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	* Checks if the oriented edges of the wire give a closed wire. If the wire is closed, returns BRepCheck_NoError. Warning : if the first and last edge are infinite, the wire will be considered as a closed one. If <Update> is set to Standard_True, registers the status in the list. May return (and registers): **BRepCheck_NotConnected, if wire is not topologically closed **BRepCheck_RedundantEdge, if an edge is in wire more than 3 times or in case of 2 occurences if not with FORWARD and REVERSED orientation. **BRepCheck_NoError

	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status
") Closed;
		BRepCheck_Status Closed (const Standard_Boolean Update = Standard_False);
		%feature("compactdefaultargs") Closed2d;
		%feature("autodoc", "	* Checks if edges of the wire give a wire closed in 2d space. Returns BRepCheck_NoError, or BRepCheck_NotClosed If <Update> is set to Standard_True, registers the status in the list.

	:param F:
	:type F: TopoDS_Face &
	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status
") Closed2d;
		BRepCheck_Status Closed2d (const TopoDS_Face & F,const Standard_Boolean Update = Standard_False);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* Checks if the oriented edges of the wire are correctly oriented. An internal call is made to the method Closed. If no face exists, call the method with a null face (TopoDS_face()). If <Update> is set to Standard_True, registers the status in the list. May return (and registers): BRepCheck_InvalidDegeneratedFlag, BRepCheck_BadOrientationOfSubshape, BRepCheck_NotClosed, BRepCheck_NoError

	:param F:
	:type F: TopoDS_Face &
	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status
") Orientation;
		BRepCheck_Status Orientation (const TopoDS_Face & F,const Standard_Boolean Update = Standard_False);
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "	* Checks if the wire intersect itself on the face <F>. <E1> and <E2> are the first intersecting edges found. <E2> may be a null edge when a self-intersecting edge is found.If <Update> is set to Standard_True, registers the status in the list. May return (and register): BRepCheck_EmptyWire, BRepCheck_SelfIntersectingWire, BRepCheck_NoCurveOnSurface, BRepCheck_NoError

	:param F:
	:type F: TopoDS_Face &
	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status
") SelfIntersect;
		BRepCheck_Status SelfIntersect (const TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2,const Standard_Boolean Update = Standard_False);
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "	* report SelfIntersect() check would be (is) done

	:rtype: bool
") GeometricControls;
		Standard_Boolean GeometricControls ();
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "	* set SelfIntersect() to be checked

	:param B:
	:type B: bool
	:rtype: None
") GeometricControls;
		void GeometricControls (const Standard_Boolean B);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Sets status of Wire;

	:param theStatus:
	:type theStatus: BRepCheck_Status
	:rtype: None
") SetStatus;
		void SetStatus (const BRepCheck_Status theStatus);
};


%extend BRepCheck_Wire {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepCheck_Wire(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepCheck_Wire::Handle_BRepCheck_Wire %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepCheck_Wire;
class Handle_BRepCheck_Wire : public Handle_BRepCheck_Result {

    public:
        // constructors
        Handle_BRepCheck_Wire();
        Handle_BRepCheck_Wire(const Handle_BRepCheck_Wire &aHandle);
        Handle_BRepCheck_Wire(const BRepCheck_Wire *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_Wire DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Wire {
    BRepCheck_Wire* _get_reference() {
    return (BRepCheck_Wire*)$self->Access();
    }
};

%extend Handle_BRepCheck_Wire {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepCheck_Wire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
