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
%module (package="OCC") MAT

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

%include MAT_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum MAT_Side {
	MAT_Left = 0,
	MAT_Right = 1,
};

/* end public enums declaration */

%nodefaultctor MAT_Arc;
class MAT_Arc : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param ArcIndex:
	:type ArcIndex: Standard_Integer
	:param GeomIndex:
	:type GeomIndex: Standard_Integer
	:param FirstElement:
	:type FirstElement: Handle_MAT_BasicElt &
	:param SecondElement:
	:type SecondElement: Handle_MAT_BasicElt &
	:rtype: None
") MAT_Arc;
		 MAT_Arc (const Standard_Integer ArcIndex,const Standard_Integer GeomIndex,const Handle_MAT_BasicElt & FirstElement,const Handle_MAT_BasicElt & SecondElement);
		%feature("autodoc", "	* Returns the index of <self> in Graph.theArcs.

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	* Returns the index associated of the geometric  representation of <self>.

	:rtype: int
") GeomIndex;
		Standard_Integer GeomIndex ();
		%feature("autodoc", "	* Returns one of the BasicElt equidistant from <self>.

	:rtype: Handle_MAT_BasicElt
") FirstElement;
		Handle_MAT_BasicElt FirstElement ();
		%feature("autodoc", "	* Returns the other BasicElt equidistant from <self>.

	:rtype: Handle_MAT_BasicElt
") SecondElement;
		Handle_MAT_BasicElt SecondElement ();
		%feature("autodoc", "	* Returns one Node extremity of <self>.

	:rtype: Handle_MAT_Node
") FirstNode;
		Handle_MAT_Node FirstNode ();
		%feature("autodoc", "	* Returns the other Node extremity of <self>.

	:rtype: Handle_MAT_Node
") SecondNode;
		Handle_MAT_Node SecondNode ();
		%feature("autodoc", "	* an Arc has two Node, if <aNode> egal one  Returns the other. if <aNode> is not oh <self>

	:param aNode:
	:type aNode: Handle_MAT_Node &
	:rtype: Handle_MAT_Node
") TheOtherNode;
		Handle_MAT_Node TheOtherNode (const Handle_MAT_Node & aNode);
		%feature("autodoc", "	* Returnst True is there is an arc linked to  the Node <aNode> located on the side <aSide> of <self>; if <aNode> is not on <self>

	:param aNode:
	:type aNode: Handle_MAT_Node &
	:param aSide:
	:type aSide: MAT_Side
	:rtype: bool
") HasNeighbour;
		Standard_Boolean HasNeighbour (const Handle_MAT_Node & aNode,const MAT_Side aSide);
		%feature("autodoc", "	* Returns the first arc linked to the Node <aNode>  located on the side <aSide> of <self>; if HasNeighbour() returns False.

	:param aNode:
	:type aNode: Handle_MAT_Node &
	:param aSide:
	:type aSide: MAT_Side
	:rtype: Handle_MAT_Arc
") Neighbour;
		Handle_MAT_Arc Neighbour (const Handle_MAT_Node & aNode,const MAT_Side aSide);
		%feature("autodoc", "	:param anInteger:
	:type anInteger: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer anInteger);
		%feature("autodoc", "	:param anInteger:
	:type anInteger: Standard_Integer
	:rtype: None
") SetGeomIndex;
		void SetGeomIndex (const Standard_Integer anInteger);
		%feature("autodoc", "	:param aBasicElt:
	:type aBasicElt: Handle_MAT_BasicElt &
	:rtype: None
") SetFirstElement;
		void SetFirstElement (const Handle_MAT_BasicElt & aBasicElt);
		%feature("autodoc", "	:param aBasicElt:
	:type aBasicElt: Handle_MAT_BasicElt &
	:rtype: None
") SetSecondElement;
		void SetSecondElement (const Handle_MAT_BasicElt & aBasicElt);
		%feature("autodoc", "	:param aNode:
	:type aNode: Handle_MAT_Node &
	:rtype: None
") SetFirstNode;
		void SetFirstNode (const Handle_MAT_Node & aNode);
		%feature("autodoc", "	:param aNode:
	:type aNode: Handle_MAT_Node &
	:rtype: None
") SetSecondNode;
		void SetSecondNode (const Handle_MAT_Node & aNode);
		%feature("autodoc", "	:param aSide:
	:type aSide: MAT_Side
	:param anArc:
	:type anArc: Handle_MAT_Arc &
	:rtype: None
") SetFirstArc;
		void SetFirstArc (const MAT_Side aSide,const Handle_MAT_Arc & anArc);
		%feature("autodoc", "	:param aSide:
	:type aSide: MAT_Side
	:param anArc:
	:type anArc: Handle_MAT_Arc &
	:rtype: None
") SetSecondArc;
		void SetSecondArc (const MAT_Side aSide,const Handle_MAT_Arc & anArc);
		%feature("autodoc", "	:param aSide:
	:type aSide: MAT_Side
	:param aNode:
	:type aNode: Handle_MAT_Node &
	:param anArc:
	:type anArc: Handle_MAT_Arc &
	:rtype: None
") SetNeighbour;
		void SetNeighbour (const MAT_Side aSide,const Handle_MAT_Node & aNode,const Handle_MAT_Arc & anArc);
};


%feature("shadow") MAT_Arc::~MAT_Arc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_Arc {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_Arc {
	Handle_MAT_Arc GetHandle() {
	return *(Handle_MAT_Arc*) &$self;
	}
};

%nodefaultctor Handle_MAT_Arc;
class Handle_MAT_Arc : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MAT_Arc();
        Handle_MAT_Arc(const Handle_MAT_Arc &aHandle);
        Handle_MAT_Arc(const MAT_Arc *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_Arc DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_Arc {
    MAT_Arc* GetObject() {
    return (MAT_Arc*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_Arc::~Handle_MAT_Arc %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_Arc {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_BasicElt;
class MAT_BasicElt : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Constructor, <anInteger> is the <index> of <self>.

	:param anInteger:
	:type anInteger: Standard_Integer
	:rtype: None
") MAT_BasicElt;
		 MAT_BasicElt (const Standard_Integer anInteger);
		%feature("autodoc", "	* Return <startArcLeft> or <startArcRight> corresponding  to <aSide>.

	:rtype: Handle_MAT_Arc
") StartArc;
		Handle_MAT_Arc StartArc ();
		%feature("autodoc", "	* Return <endArcLeft> or <endArcRight> corresponding  to <aSide>.

	:rtype: Handle_MAT_Arc
") EndArc;
		Handle_MAT_Arc EndArc ();
		%feature("autodoc", "	* Return the <index> of <self> in Graph.TheBasicElts.

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	* Return the <GeomIndex> of <self>.

	:rtype: int
") GeomIndex;
		Standard_Integer GeomIndex ();
		%feature("autodoc", "	:param anArc:
	:type anArc: Handle_MAT_Arc &
	:rtype: None
") SetStartArc;
		void SetStartArc (const Handle_MAT_Arc & anArc);
		%feature("autodoc", "	:param anArc:
	:type anArc: Handle_MAT_Arc &
	:rtype: None
") SetEndArc;
		void SetEndArc (const Handle_MAT_Arc & anArc);
		%feature("autodoc", "	:param anInteger:
	:type anInteger: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer anInteger);
		%feature("autodoc", "	:param anInteger:
	:type anInteger: Standard_Integer
	:rtype: None
") SetGeomIndex;
		void SetGeomIndex (const Standard_Integer anInteger);
};


%feature("shadow") MAT_BasicElt::~MAT_BasicElt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_BasicElt {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_BasicElt {
	Handle_MAT_BasicElt GetHandle() {
	return *(Handle_MAT_BasicElt*) &$self;
	}
};

%nodefaultctor Handle_MAT_BasicElt;
class Handle_MAT_BasicElt : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MAT_BasicElt();
        Handle_MAT_BasicElt(const Handle_MAT_BasicElt &aHandle);
        Handle_MAT_BasicElt(const MAT_BasicElt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_BasicElt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_BasicElt {
    MAT_BasicElt* GetObject() {
    return (MAT_BasicElt*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_BasicElt::~Handle_MAT_BasicElt %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_BasicElt {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_Bisector;
class MAT_Bisector : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") MAT_Bisector;
		 MAT_Bisector ();
		%feature("autodoc", "	:param abisector:
	:type abisector: Handle_MAT_Bisector &
	:rtype: None
") AddBisector;
		void AddBisector (const Handle_MAT_Bisector & abisector);
		%feature("autodoc", "	:rtype: Handle_MAT_ListOfBisector
") List;
		Handle_MAT_ListOfBisector List ();
		%feature("autodoc", "	:rtype: Handle_MAT_Bisector
") FirstBisector;
		Handle_MAT_Bisector FirstBisector ();
		%feature("autodoc", "	:rtype: Handle_MAT_Bisector
") LastBisector;
		Handle_MAT_Bisector LastBisector ();
		%feature("autodoc", "	:param anumber:
	:type anumber: Standard_Integer
	:rtype: None
") BisectorNumber;
		void BisectorNumber (const Standard_Integer anumber);
		%feature("autodoc", "	:param anumber:
	:type anumber: Standard_Integer
	:rtype: None
") IndexNumber;
		void IndexNumber (const Standard_Integer anumber);
		%feature("autodoc", "	:param anedge:
	:type anedge: Handle_MAT_Edge &
	:rtype: None
") FirstEdge;
		void FirstEdge (const Handle_MAT_Edge & anedge);
		%feature("autodoc", "	:param anedge:
	:type anedge: Handle_MAT_Edge &
	:rtype: None
") SecondEdge;
		void SecondEdge (const Handle_MAT_Edge & anedge);
		%feature("autodoc", "	:param apoint:
	:type apoint: Standard_Integer
	:rtype: None
") IssuePoint;
		void IssuePoint (const Standard_Integer apoint);
		%feature("autodoc", "	:param apoint:
	:type apoint: Standard_Integer
	:rtype: None
") EndPoint;
		void EndPoint (const Standard_Integer apoint);
		%feature("autodoc", "	:param areal:
	:type areal: float
	:rtype: None
") DistIssuePoint;
		void DistIssuePoint (const Standard_Real areal);
		%feature("autodoc", "	:param avector:
	:type avector: Standard_Integer
	:rtype: None
") FirstVector;
		void FirstVector (const Standard_Integer avector);
		%feature("autodoc", "	:param avector:
	:type avector: Standard_Integer
	:rtype: None
") SecondVector;
		void SecondVector (const Standard_Integer avector);
		%feature("autodoc", "	:param asense:
	:type asense: float
	:rtype: None
") Sense;
		void Sense (const Standard_Real asense);
		%feature("autodoc", "	:param aparameter:
	:type aparameter: float
	:rtype: None
") FirstParameter;
		void FirstParameter (const Standard_Real aparameter);
		%feature("autodoc", "	:param aparameter:
	:type aparameter: float
	:rtype: None
") SecondParameter;
		void SecondParameter (const Standard_Real aparameter);
		%feature("autodoc", "	:rtype: int
") BisectorNumber;
		Standard_Integer BisectorNumber ();
		%feature("autodoc", "	:rtype: int
") IndexNumber;
		Standard_Integer IndexNumber ();
		%feature("autodoc", "	:rtype: Handle_MAT_Edge
") FirstEdge;
		Handle_MAT_Edge FirstEdge ();
		%feature("autodoc", "	:rtype: Handle_MAT_Edge
") SecondEdge;
		Handle_MAT_Edge SecondEdge ();
		%feature("autodoc", "	:rtype: int
") IssuePoint;
		Standard_Integer IssuePoint ();
		%feature("autodoc", "	:rtype: int
") EndPoint;
		Standard_Integer EndPoint ();
		%feature("autodoc", "	:rtype: float
") DistIssuePoint;
		Standard_Real DistIssuePoint ();
		%feature("autodoc", "	:rtype: int
") FirstVector;
		Standard_Integer FirstVector ();
		%feature("autodoc", "	:rtype: int
") SecondVector;
		Standard_Integer SecondVector ();
		%feature("autodoc", "	:rtype: float
") Sense;
		Standard_Real Sense ();
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") SecondParameter;
		Standard_Real SecondParameter ();
		%feature("autodoc", "	:param ashift:
	:type ashift: Standard_Integer
	:param alevel:
	:type alevel: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer ashift,const Standard_Integer alevel);
};


%feature("shadow") MAT_Bisector::~MAT_Bisector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_Bisector {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_Bisector {
	Handle_MAT_Bisector GetHandle() {
	return *(Handle_MAT_Bisector*) &$self;
	}
};

%nodefaultctor Handle_MAT_Bisector;
class Handle_MAT_Bisector : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MAT_Bisector();
        Handle_MAT_Bisector(const Handle_MAT_Bisector &aHandle);
        Handle_MAT_Bisector(const MAT_Bisector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_Bisector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_Bisector {
    MAT_Bisector* GetObject() {
    return (MAT_Bisector*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_Bisector::~Handle_MAT_Bisector %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_Bisector {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_DataMapIteratorOfDataMapOfIntegerArc;
class MAT_DataMapIteratorOfDataMapOfIntegerArc : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") MAT_DataMapIteratorOfDataMapOfIntegerArc;
		 MAT_DataMapIteratorOfDataMapOfIntegerArc ();
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT_DataMapOfIntegerArc &
	:rtype: None
") MAT_DataMapIteratorOfDataMapOfIntegerArc;
		 MAT_DataMapIteratorOfDataMapOfIntegerArc (const MAT_DataMapOfIntegerArc & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT_DataMapOfIntegerArc &
	:rtype: None
") Initialize;
		void Initialize (const MAT_DataMapOfIntegerArc & aMap);
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "	:rtype: Handle_MAT_Arc
") Value;
		const Handle_MAT_Arc & Value ();
};


%feature("shadow") MAT_DataMapIteratorOfDataMapOfIntegerArc::~MAT_DataMapIteratorOfDataMapOfIntegerArc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_DataMapIteratorOfDataMapOfIntegerArc {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT_DataMapIteratorOfDataMapOfIntegerBasicElt;
class MAT_DataMapIteratorOfDataMapOfIntegerBasicElt : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") MAT_DataMapIteratorOfDataMapOfIntegerBasicElt;
		 MAT_DataMapIteratorOfDataMapOfIntegerBasicElt ();
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT_DataMapOfIntegerBasicElt &
	:rtype: None
") MAT_DataMapIteratorOfDataMapOfIntegerBasicElt;
		 MAT_DataMapIteratorOfDataMapOfIntegerBasicElt (const MAT_DataMapOfIntegerBasicElt & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT_DataMapOfIntegerBasicElt &
	:rtype: None
") Initialize;
		void Initialize (const MAT_DataMapOfIntegerBasicElt & aMap);
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "	:rtype: Handle_MAT_BasicElt
") Value;
		const Handle_MAT_BasicElt & Value ();
};


%feature("shadow") MAT_DataMapIteratorOfDataMapOfIntegerBasicElt::~MAT_DataMapIteratorOfDataMapOfIntegerBasicElt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_DataMapIteratorOfDataMapOfIntegerBasicElt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT_DataMapIteratorOfDataMapOfIntegerBisector;
class MAT_DataMapIteratorOfDataMapOfIntegerBisector : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") MAT_DataMapIteratorOfDataMapOfIntegerBisector;
		 MAT_DataMapIteratorOfDataMapOfIntegerBisector ();
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT_DataMapOfIntegerBisector &
	:rtype: None
") MAT_DataMapIteratorOfDataMapOfIntegerBisector;
		 MAT_DataMapIteratorOfDataMapOfIntegerBisector (const MAT_DataMapOfIntegerBisector & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT_DataMapOfIntegerBisector &
	:rtype: None
") Initialize;
		void Initialize (const MAT_DataMapOfIntegerBisector & aMap);
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "	:rtype: Handle_MAT_Bisector
") Value;
		const Handle_MAT_Bisector & Value ();
};


%feature("shadow") MAT_DataMapIteratorOfDataMapOfIntegerBisector::~MAT_DataMapIteratorOfDataMapOfIntegerBisector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_DataMapIteratorOfDataMapOfIntegerBisector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT_DataMapIteratorOfDataMapOfIntegerNode;
class MAT_DataMapIteratorOfDataMapOfIntegerNode : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") MAT_DataMapIteratorOfDataMapOfIntegerNode;
		 MAT_DataMapIteratorOfDataMapOfIntegerNode ();
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT_DataMapOfIntegerNode &
	:rtype: None
") MAT_DataMapIteratorOfDataMapOfIntegerNode;
		 MAT_DataMapIteratorOfDataMapOfIntegerNode (const MAT_DataMapOfIntegerNode & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT_DataMapOfIntegerNode &
	:rtype: None
") Initialize;
		void Initialize (const MAT_DataMapOfIntegerNode & aMap);
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "	:rtype: Handle_MAT_Node
") Value;
		const Handle_MAT_Node & Value ();
};


%feature("shadow") MAT_DataMapIteratorOfDataMapOfIntegerNode::~MAT_DataMapIteratorOfDataMapOfIntegerNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_DataMapIteratorOfDataMapOfIntegerNode {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT_DataMapNodeOfDataMapOfIntegerArc;
class MAT_DataMapNodeOfDataMapOfIntegerArc : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: Handle_MAT_Arc &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MAT_DataMapNodeOfDataMapOfIntegerArc;
		 MAT_DataMapNodeOfDataMapOfIntegerArc (Standard_Integer &OutValue,const Handle_MAT_Arc & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("autodoc", "	:rtype: Handle_MAT_Arc
") Value;
		Handle_MAT_Arc & Value ();
};


%feature("shadow") MAT_DataMapNodeOfDataMapOfIntegerArc::~MAT_DataMapNodeOfDataMapOfIntegerArc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_DataMapNodeOfDataMapOfIntegerArc {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_DataMapNodeOfDataMapOfIntegerArc {
	Handle_MAT_DataMapNodeOfDataMapOfIntegerArc GetHandle() {
	return *(Handle_MAT_DataMapNodeOfDataMapOfIntegerArc*) &$self;
	}
};

%nodefaultctor Handle_MAT_DataMapNodeOfDataMapOfIntegerArc;
class Handle_MAT_DataMapNodeOfDataMapOfIntegerArc : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MAT_DataMapNodeOfDataMapOfIntegerArc();
        Handle_MAT_DataMapNodeOfDataMapOfIntegerArc(const Handle_MAT_DataMapNodeOfDataMapOfIntegerArc &aHandle);
        Handle_MAT_DataMapNodeOfDataMapOfIntegerArc(const MAT_DataMapNodeOfDataMapOfIntegerArc *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_DataMapNodeOfDataMapOfIntegerArc DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_DataMapNodeOfDataMapOfIntegerArc {
    MAT_DataMapNodeOfDataMapOfIntegerArc* GetObject() {
    return (MAT_DataMapNodeOfDataMapOfIntegerArc*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_DataMapNodeOfDataMapOfIntegerArc::~Handle_MAT_DataMapNodeOfDataMapOfIntegerArc %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_DataMapNodeOfDataMapOfIntegerArc {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_DataMapNodeOfDataMapOfIntegerBasicElt;
class MAT_DataMapNodeOfDataMapOfIntegerBasicElt : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: Handle_MAT_BasicElt &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MAT_DataMapNodeOfDataMapOfIntegerBasicElt;
		 MAT_DataMapNodeOfDataMapOfIntegerBasicElt (Standard_Integer &OutValue,const Handle_MAT_BasicElt & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("autodoc", "	:rtype: Handle_MAT_BasicElt
") Value;
		Handle_MAT_BasicElt & Value ();
};


%feature("shadow") MAT_DataMapNodeOfDataMapOfIntegerBasicElt::~MAT_DataMapNodeOfDataMapOfIntegerBasicElt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_DataMapNodeOfDataMapOfIntegerBasicElt {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_DataMapNodeOfDataMapOfIntegerBasicElt {
	Handle_MAT_DataMapNodeOfDataMapOfIntegerBasicElt GetHandle() {
	return *(Handle_MAT_DataMapNodeOfDataMapOfIntegerBasicElt*) &$self;
	}
};

%nodefaultctor Handle_MAT_DataMapNodeOfDataMapOfIntegerBasicElt;
class Handle_MAT_DataMapNodeOfDataMapOfIntegerBasicElt : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MAT_DataMapNodeOfDataMapOfIntegerBasicElt();
        Handle_MAT_DataMapNodeOfDataMapOfIntegerBasicElt(const Handle_MAT_DataMapNodeOfDataMapOfIntegerBasicElt &aHandle);
        Handle_MAT_DataMapNodeOfDataMapOfIntegerBasicElt(const MAT_DataMapNodeOfDataMapOfIntegerBasicElt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_DataMapNodeOfDataMapOfIntegerBasicElt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_DataMapNodeOfDataMapOfIntegerBasicElt {
    MAT_DataMapNodeOfDataMapOfIntegerBasicElt* GetObject() {
    return (MAT_DataMapNodeOfDataMapOfIntegerBasicElt*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_DataMapNodeOfDataMapOfIntegerBasicElt::~Handle_MAT_DataMapNodeOfDataMapOfIntegerBasicElt %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_DataMapNodeOfDataMapOfIntegerBasicElt {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_DataMapNodeOfDataMapOfIntegerBisector;
class MAT_DataMapNodeOfDataMapOfIntegerBisector : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: Handle_MAT_Bisector &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MAT_DataMapNodeOfDataMapOfIntegerBisector;
		 MAT_DataMapNodeOfDataMapOfIntegerBisector (Standard_Integer &OutValue,const Handle_MAT_Bisector & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("autodoc", "	:rtype: Handle_MAT_Bisector
") Value;
		Handle_MAT_Bisector & Value ();
};


%feature("shadow") MAT_DataMapNodeOfDataMapOfIntegerBisector::~MAT_DataMapNodeOfDataMapOfIntegerBisector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_DataMapNodeOfDataMapOfIntegerBisector {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_DataMapNodeOfDataMapOfIntegerBisector {
	Handle_MAT_DataMapNodeOfDataMapOfIntegerBisector GetHandle() {
	return *(Handle_MAT_DataMapNodeOfDataMapOfIntegerBisector*) &$self;
	}
};

%nodefaultctor Handle_MAT_DataMapNodeOfDataMapOfIntegerBisector;
class Handle_MAT_DataMapNodeOfDataMapOfIntegerBisector : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MAT_DataMapNodeOfDataMapOfIntegerBisector();
        Handle_MAT_DataMapNodeOfDataMapOfIntegerBisector(const Handle_MAT_DataMapNodeOfDataMapOfIntegerBisector &aHandle);
        Handle_MAT_DataMapNodeOfDataMapOfIntegerBisector(const MAT_DataMapNodeOfDataMapOfIntegerBisector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_DataMapNodeOfDataMapOfIntegerBisector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_DataMapNodeOfDataMapOfIntegerBisector {
    MAT_DataMapNodeOfDataMapOfIntegerBisector* GetObject() {
    return (MAT_DataMapNodeOfDataMapOfIntegerBisector*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_DataMapNodeOfDataMapOfIntegerBisector::~Handle_MAT_DataMapNodeOfDataMapOfIntegerBisector %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_DataMapNodeOfDataMapOfIntegerBisector {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_DataMapNodeOfDataMapOfIntegerNode;
class MAT_DataMapNodeOfDataMapOfIntegerNode : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: Handle_MAT_Node &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MAT_DataMapNodeOfDataMapOfIntegerNode;
		 MAT_DataMapNodeOfDataMapOfIntegerNode (Standard_Integer &OutValue,const Handle_MAT_Node & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("autodoc", "	:rtype: Handle_MAT_Node
") Value;
		Handle_MAT_Node & Value ();
};


%feature("shadow") MAT_DataMapNodeOfDataMapOfIntegerNode::~MAT_DataMapNodeOfDataMapOfIntegerNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_DataMapNodeOfDataMapOfIntegerNode {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_DataMapNodeOfDataMapOfIntegerNode {
	Handle_MAT_DataMapNodeOfDataMapOfIntegerNode GetHandle() {
	return *(Handle_MAT_DataMapNodeOfDataMapOfIntegerNode*) &$self;
	}
};

%nodefaultctor Handle_MAT_DataMapNodeOfDataMapOfIntegerNode;
class Handle_MAT_DataMapNodeOfDataMapOfIntegerNode : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MAT_DataMapNodeOfDataMapOfIntegerNode();
        Handle_MAT_DataMapNodeOfDataMapOfIntegerNode(const Handle_MAT_DataMapNodeOfDataMapOfIntegerNode &aHandle);
        Handle_MAT_DataMapNodeOfDataMapOfIntegerNode(const MAT_DataMapNodeOfDataMapOfIntegerNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_DataMapNodeOfDataMapOfIntegerNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_DataMapNodeOfDataMapOfIntegerNode {
    MAT_DataMapNodeOfDataMapOfIntegerNode* GetObject() {
    return (MAT_DataMapNodeOfDataMapOfIntegerNode*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_DataMapNodeOfDataMapOfIntegerNode::~Handle_MAT_DataMapNodeOfDataMapOfIntegerNode %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_DataMapNodeOfDataMapOfIntegerNode {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_DataMapOfIntegerArc;
class MAT_DataMapOfIntegerArc : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") MAT_DataMapOfIntegerArc;
		 MAT_DataMapOfIntegerArc (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: MAT_DataMapOfIntegerArc &
	:rtype: MAT_DataMapOfIntegerArc
") Assign;
		MAT_DataMapOfIntegerArc & Assign (const MAT_DataMapOfIntegerArc & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT_DataMapOfIntegerArc &
	:rtype: MAT_DataMapOfIntegerArc
") operator=;
		MAT_DataMapOfIntegerArc & operator = (const MAT_DataMapOfIntegerArc & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: Handle_MAT_Arc &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Handle_MAT_Arc & I);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Handle_MAT_Arc
") Find;
		const Handle_MAT_Arc & Find (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Handle_MAT_Arc
") ChangeFind;
		Handle_MAT_Arc & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") MAT_DataMapOfIntegerArc::~MAT_DataMapOfIntegerArc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_DataMapOfIntegerArc {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT_DataMapOfIntegerBasicElt;
class MAT_DataMapOfIntegerBasicElt : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") MAT_DataMapOfIntegerBasicElt;
		 MAT_DataMapOfIntegerBasicElt (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: MAT_DataMapOfIntegerBasicElt &
	:rtype: MAT_DataMapOfIntegerBasicElt
") Assign;
		MAT_DataMapOfIntegerBasicElt & Assign (const MAT_DataMapOfIntegerBasicElt & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT_DataMapOfIntegerBasicElt &
	:rtype: MAT_DataMapOfIntegerBasicElt
") operator=;
		MAT_DataMapOfIntegerBasicElt & operator = (const MAT_DataMapOfIntegerBasicElt & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: Handle_MAT_BasicElt &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Handle_MAT_BasicElt & I);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Handle_MAT_BasicElt
") Find;
		const Handle_MAT_BasicElt & Find (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Handle_MAT_BasicElt
") ChangeFind;
		Handle_MAT_BasicElt & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") MAT_DataMapOfIntegerBasicElt::~MAT_DataMapOfIntegerBasicElt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_DataMapOfIntegerBasicElt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT_DataMapOfIntegerBisector;
class MAT_DataMapOfIntegerBisector : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") MAT_DataMapOfIntegerBisector;
		 MAT_DataMapOfIntegerBisector (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: MAT_DataMapOfIntegerBisector &
	:rtype: MAT_DataMapOfIntegerBisector
") Assign;
		MAT_DataMapOfIntegerBisector & Assign (const MAT_DataMapOfIntegerBisector & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT_DataMapOfIntegerBisector &
	:rtype: MAT_DataMapOfIntegerBisector
") operator=;
		MAT_DataMapOfIntegerBisector & operator = (const MAT_DataMapOfIntegerBisector & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: Handle_MAT_Bisector &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Handle_MAT_Bisector & I);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Handle_MAT_Bisector
") Find;
		const Handle_MAT_Bisector & Find (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Handle_MAT_Bisector
") ChangeFind;
		Handle_MAT_Bisector & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") MAT_DataMapOfIntegerBisector::~MAT_DataMapOfIntegerBisector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_DataMapOfIntegerBisector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT_DataMapOfIntegerNode;
class MAT_DataMapOfIntegerNode : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") MAT_DataMapOfIntegerNode;
		 MAT_DataMapOfIntegerNode (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: MAT_DataMapOfIntegerNode &
	:rtype: MAT_DataMapOfIntegerNode
") Assign;
		MAT_DataMapOfIntegerNode & Assign (const MAT_DataMapOfIntegerNode & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT_DataMapOfIntegerNode &
	:rtype: MAT_DataMapOfIntegerNode
") operator=;
		MAT_DataMapOfIntegerNode & operator = (const MAT_DataMapOfIntegerNode & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: Handle_MAT_Node &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Handle_MAT_Node & I);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Handle_MAT_Node
") Find;
		const Handle_MAT_Node & Find (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Handle_MAT_Node
") ChangeFind;
		Handle_MAT_Node & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") MAT_DataMapOfIntegerNode::~MAT_DataMapOfIntegerNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_DataMapOfIntegerNode {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT_Edge;
class MAT_Edge : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") MAT_Edge;
		 MAT_Edge ();
		%feature("autodoc", "	:param anumber:
	:type anumber: Standard_Integer
	:rtype: None
") EdgeNumber;
		void EdgeNumber (const Standard_Integer anumber);
		%feature("autodoc", "	:param abisector:
	:type abisector: Handle_MAT_Bisector &
	:rtype: None
") FirstBisector;
		void FirstBisector (const Handle_MAT_Bisector & abisector);
		%feature("autodoc", "	:param abisector:
	:type abisector: Handle_MAT_Bisector &
	:rtype: None
") SecondBisector;
		void SecondBisector (const Handle_MAT_Bisector & abisector);
		%feature("autodoc", "	:param adistance:
	:type adistance: float
	:rtype: None
") Distance;
		void Distance (const Standard_Real adistance);
		%feature("autodoc", "	:param apoint:
	:type apoint: Standard_Integer
	:rtype: None
") IntersectionPoint;
		void IntersectionPoint (const Standard_Integer apoint);
		%feature("autodoc", "	:rtype: int
") EdgeNumber;
		Standard_Integer EdgeNumber ();
		%feature("autodoc", "	:rtype: Handle_MAT_Bisector
") FirstBisector;
		Handle_MAT_Bisector FirstBisector ();
		%feature("autodoc", "	:rtype: Handle_MAT_Bisector
") SecondBisector;
		Handle_MAT_Bisector SecondBisector ();
		%feature("autodoc", "	:rtype: float
") Distance;
		Standard_Real Distance ();
		%feature("autodoc", "	:rtype: int
") IntersectionPoint;
		Standard_Integer IntersectionPoint ();
		%feature("autodoc", "	:param ashift:
	:type ashift: Standard_Integer
	:param alevel:
	:type alevel: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer ashift,const Standard_Integer alevel);
};


%feature("shadow") MAT_Edge::~MAT_Edge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_Edge {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_Edge {
	Handle_MAT_Edge GetHandle() {
	return *(Handle_MAT_Edge*) &$self;
	}
};

%nodefaultctor Handle_MAT_Edge;
class Handle_MAT_Edge : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MAT_Edge();
        Handle_MAT_Edge(const Handle_MAT_Edge &aHandle);
        Handle_MAT_Edge(const MAT_Edge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_Edge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_Edge {
    MAT_Edge* GetObject() {
    return (MAT_Edge*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_Edge::~Handle_MAT_Edge %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_Edge {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_Graph;
class MAT_Graph : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") MAT_Graph;
		 MAT_Graph ();
		%feature("autodoc", "	* Construct <self> from the result of the method  <CreateMat> of the class <MAT> from <MAT>. <SemiInfinite> : if some bisector are infinites.  <TheRoots> : Set of the bisectors.  <NbBasicElts> : Number of Basic Elements.  <NbArcs> : Number of Arcs = Number of Bisectors.

	:param SemiInfinite:
	:type SemiInfinite: bool
	:param TheRoots:
	:type TheRoots: Handle_MAT_ListOfBisector &
	:param NbBasicElts:
	:type NbBasicElts: Standard_Integer
	:param NbArcs:
	:type NbArcs: Standard_Integer
	:rtype: None
") Perform;
		void Perform (const Standard_Boolean SemiInfinite,const Handle_MAT_ListOfBisector & TheRoots,const Standard_Integer NbBasicElts,const Standard_Integer NbArcs);
		%feature("autodoc", "	* Return the Arc of index <Index> in <theArcs>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_MAT_Arc
") Arc;
		Handle_MAT_Arc Arc (const Standard_Integer Index);
		%feature("autodoc", "	* Return the BasicElt of index <Index> in <theBasicElts>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_MAT_BasicElt
") BasicElt;
		Handle_MAT_BasicElt BasicElt (const Standard_Integer Index);
		%feature("autodoc", "	* Return the Node of index <Index> in <theNodes>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_MAT_Node
") Node;
		Handle_MAT_Node Node (const Standard_Integer Index);
		%feature("autodoc", "	* Return the number of arcs of <self>.

	:rtype: int
") NumberOfArcs;
		Standard_Integer NumberOfArcs ();
		%feature("autodoc", "	* Return the number of nodes of <self>.

	:rtype: int
") NumberOfNodes;
		Standard_Integer NumberOfNodes ();
		%feature("autodoc", "	* Return the number of basic elements of <self>.

	:rtype: int
") NumberOfBasicElts;
		Standard_Integer NumberOfBasicElts ();
		%feature("autodoc", "	* Return the number of infinites nodes of <self>.

	:rtype: int
") NumberOfInfiniteNodes;
		Standard_Integer NumberOfInfiniteNodes ();
		%feature("autodoc", "	* Merge two BasicElts. The End of the BasicElt Elt1 of IndexElt1 becomes The End of the BasicElt Elt2 of IndexElt2. Elt2 is replaced in the arcs by Elt1, Elt2 is eliminated.  <MergeArc1> is True if the fusion of the BasicElts => a fusion of two Arcs which separated the same elements. In this case <GeomIndexArc1> and <GeomIndexArc2> are the Geometric Index of this arcs.  If the BasicElt corresponds to a close line , the StartArc and the EndArc of Elt1 can separate the same elements . In this case there is a fusion of this arcs, <MergeArc2> is true and <GeomIndexArc3> and <GeomIndexArc4> are the Geometric Index of this arcs.

	:param IndexElt1:
	:type IndexElt1: Standard_Integer
	:param IndexElt2:
	:type IndexElt2: Standard_Integer
	:param MergeArc1:
	:type MergeArc1: bool
	:param GeomIndexArc1:
	:type GeomIndexArc1: Standard_Integer &
	:param GeomIndexArc2:
	:type GeomIndexArc2: Standard_Integer &
	:param MergeArc2:
	:type MergeArc2: bool
	:param GeomIndexArc3:
	:type GeomIndexArc3: Standard_Integer &
	:param GeomIndexArc4:
	:type GeomIndexArc4: Standard_Integer &
	:rtype: None
") FusionOfBasicElts;
		void FusionOfBasicElts (const Standard_Integer IndexElt1,const Standard_Integer IndexElt2,Standard_Boolean & MergeArc1,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Boolean & MergeArc2,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:rtype: None
") CompactArcs;
		void CompactArcs ();
		%feature("autodoc", "	:rtype: None
") CompactNodes;
		void CompactNodes ();
		%feature("autodoc", "	:param NewMap:
	:type NewMap: MAT_DataMapOfIntegerBasicElt &
	:rtype: None
") ChangeBasicElts;
		void ChangeBasicElts (const MAT_DataMapOfIntegerBasicElt & NewMap);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_MAT_BasicElt
") ChangeBasicElt;
		Handle_MAT_BasicElt ChangeBasicElt (const Standard_Integer Index);
};


%feature("shadow") MAT_Graph::~MAT_Graph %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_Graph {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_Graph {
	Handle_MAT_Graph GetHandle() {
	return *(Handle_MAT_Graph*) &$self;
	}
};

%nodefaultctor Handle_MAT_Graph;
class Handle_MAT_Graph : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MAT_Graph();
        Handle_MAT_Graph(const Handle_MAT_Graph &aHandle);
        Handle_MAT_Graph(const MAT_Graph *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_Graph DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_Graph {
    MAT_Graph* GetObject() {
    return (MAT_Graph*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_Graph::~Handle_MAT_Graph %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_Graph {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_ListOfBisector;
class MAT_ListOfBisector : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") MAT_ListOfBisector;
		 MAT_ListOfBisector ();
		%feature("autodoc", "	:rtype: None
") First;
		void First ();
		%feature("autodoc", "	:rtype: None
") Last;
		void Last ();
		%feature("autodoc", "	:param aniten:
	:type aniten: Handle_MAT_Bisector &
	:rtype: None
") Init;
		void Init (const Handle_MAT_Bisector & aniten);
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: None
") Previous;
		void Previous ();
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: Handle_MAT_Bisector
") Current;
		Handle_MAT_Bisector Current ();
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Bisector &
	:rtype: None
") Current;
		void Current (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "	:rtype: Handle_MAT_Bisector
") FirstItem;
		Handle_MAT_Bisector FirstItem ();
		%feature("autodoc", "	:rtype: Handle_MAT_Bisector
") LastItem;
		Handle_MAT_Bisector LastItem ();
		%feature("autodoc", "	:rtype: Handle_MAT_Bisector
") PreviousItem;
		Handle_MAT_Bisector PreviousItem ();
		%feature("autodoc", "	:rtype: Handle_MAT_Bisector
") NextItem;
		Handle_MAT_Bisector NextItem ();
		%feature("autodoc", "	:rtype: int
") Number;
		Standard_Integer Number ();
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	:param anindex:
	:type anindex: Standard_Integer
	:rtype: Handle_MAT_Bisector
") Brackets;
		Handle_MAT_Bisector Brackets (const Standard_Integer anindex);
		%feature("autodoc", "	:rtype: None
") Unlink;
		void Unlink ();
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Bisector &
	:rtype: None
") LinkBefore;
		void LinkBefore (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Bisector &
	:rtype: None
") LinkAfter;
		void LinkAfter (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Bisector &
	:rtype: None
") FrontAdd;
		void FrontAdd (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Bisector &
	:rtype: None
") BackAdd;
		void BackAdd (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "	:rtype: None
") Permute;
		void Permute ();
		%feature("autodoc", "	:rtype: None
") Loop;
		void Loop ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param ashift:
	:type ashift: Standard_Integer
	:param alevel:
	:type alevel: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer ashift,const Standard_Integer alevel);
};


%feature("shadow") MAT_ListOfBisector::~MAT_ListOfBisector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_ListOfBisector {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_ListOfBisector {
	Handle_MAT_ListOfBisector GetHandle() {
	return *(Handle_MAT_ListOfBisector*) &$self;
	}
};

%nodefaultctor Handle_MAT_ListOfBisector;
class Handle_MAT_ListOfBisector : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MAT_ListOfBisector();
        Handle_MAT_ListOfBisector(const Handle_MAT_ListOfBisector &aHandle);
        Handle_MAT_ListOfBisector(const MAT_ListOfBisector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_ListOfBisector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_ListOfBisector {
    MAT_ListOfBisector* GetObject() {
    return (MAT_ListOfBisector*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_ListOfBisector::~Handle_MAT_ListOfBisector %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_ListOfBisector {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_ListOfEdge;
class MAT_ListOfEdge : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") MAT_ListOfEdge;
		 MAT_ListOfEdge ();
		%feature("autodoc", "	:rtype: None
") First;
		void First ();
		%feature("autodoc", "	:rtype: None
") Last;
		void Last ();
		%feature("autodoc", "	:param aniten:
	:type aniten: Handle_MAT_Edge &
	:rtype: None
") Init;
		void Init (const Handle_MAT_Edge & aniten);
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: None
") Previous;
		void Previous ();
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: Handle_MAT_Edge
") Current;
		Handle_MAT_Edge Current ();
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Edge &
	:rtype: None
") Current;
		void Current (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "	:rtype: Handle_MAT_Edge
") FirstItem;
		Handle_MAT_Edge FirstItem ();
		%feature("autodoc", "	:rtype: Handle_MAT_Edge
") LastItem;
		Handle_MAT_Edge LastItem ();
		%feature("autodoc", "	:rtype: Handle_MAT_Edge
") PreviousItem;
		Handle_MAT_Edge PreviousItem ();
		%feature("autodoc", "	:rtype: Handle_MAT_Edge
") NextItem;
		Handle_MAT_Edge NextItem ();
		%feature("autodoc", "	:rtype: int
") Number;
		Standard_Integer Number ();
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	:param anindex:
	:type anindex: Standard_Integer
	:rtype: Handle_MAT_Edge
") Brackets;
		Handle_MAT_Edge Brackets (const Standard_Integer anindex);
		%feature("autodoc", "	:rtype: None
") Unlink;
		void Unlink ();
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Edge &
	:rtype: None
") LinkBefore;
		void LinkBefore (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Edge &
	:rtype: None
") LinkAfter;
		void LinkAfter (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Edge &
	:rtype: None
") FrontAdd;
		void FrontAdd (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Edge &
	:rtype: None
") BackAdd;
		void BackAdd (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "	:rtype: None
") Permute;
		void Permute ();
		%feature("autodoc", "	:rtype: None
") Loop;
		void Loop ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param ashift:
	:type ashift: Standard_Integer
	:param alevel:
	:type alevel: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer ashift,const Standard_Integer alevel);
};


%feature("shadow") MAT_ListOfEdge::~MAT_ListOfEdge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_ListOfEdge {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_ListOfEdge {
	Handle_MAT_ListOfEdge GetHandle() {
	return *(Handle_MAT_ListOfEdge*) &$self;
	}
};

%nodefaultctor Handle_MAT_ListOfEdge;
class Handle_MAT_ListOfEdge : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MAT_ListOfEdge();
        Handle_MAT_ListOfEdge(const Handle_MAT_ListOfEdge &aHandle);
        Handle_MAT_ListOfEdge(const MAT_ListOfEdge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_ListOfEdge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_ListOfEdge {
    MAT_ListOfEdge* GetObject() {
    return (MAT_ListOfEdge*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_ListOfEdge::~Handle_MAT_ListOfEdge %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_ListOfEdge {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_Node;
class MAT_Node : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param GeomIndex:
	:type GeomIndex: Standard_Integer
	:param LinkedArc:
	:type LinkedArc: Handle_MAT_Arc &
	:param Distance:
	:type Distance: float
	:rtype: None
") MAT_Node;
		 MAT_Node (const Standard_Integer GeomIndex,const Handle_MAT_Arc & LinkedArc,const Standard_Real Distance);
		%feature("autodoc", "	* Returns the index associated of the geometric  representation of <self>.

	:rtype: int
") GeomIndex;
		Standard_Integer GeomIndex ();
		%feature("autodoc", "	* Returns the index associated of the node

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	* Returns in <S> the Arcs linked to <self>.

	:param S:
	:type S: MAT_SequenceOfArc &
	:rtype: None
") LinkedArcs;
		void LinkedArcs (MAT_SequenceOfArc & S);
		%feature("autodoc", "	* Returns in <S> the BasicElts equidistant to <self>.

	:param S:
	:type S: MAT_SequenceOfBasicElt &
	:rtype: None
") NearElts;
		void NearElts (MAT_SequenceOfBasicElt & S);
		%feature("autodoc", "	:rtype: float
") Distance;
		Standard_Real Distance ();
		%feature("autodoc", "	* //!Returns True if <self> is a pending Node. (ie : the number of Arc Linked = 1)

	:rtype: bool
") PendingNode;
		Standard_Boolean PendingNode ();
		%feature("autodoc", "	* Returns True if <self> belongs to the figure.

	:rtype: bool
") OnBasicElt;
		Standard_Boolean OnBasicElt ();
		%feature("autodoc", "	* Returns True if the distance of <self> is Infinite

	:rtype: bool
") Infinite;
		Standard_Boolean Infinite ();
		%feature("autodoc", "	* Set the index associated of the node

	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anArc:
	:type anArc: Handle_MAT_Arc &
	:rtype: None
") SetLinkedArc;
		void SetLinkedArc (const Handle_MAT_Arc & anArc);
};


%feature("shadow") MAT_Node::~MAT_Node %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_Node {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_Node {
	Handle_MAT_Node GetHandle() {
	return *(Handle_MAT_Node*) &$self;
	}
};

%nodefaultctor Handle_MAT_Node;
class Handle_MAT_Node : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MAT_Node();
        Handle_MAT_Node(const Handle_MAT_Node &aHandle);
        Handle_MAT_Node(const MAT_Node *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_Node DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_Node {
    MAT_Node* GetObject() {
    return (MAT_Node*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_Node::~Handle_MAT_Node %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_Node {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_SequenceNodeOfSequenceOfArc;
class MAT_SequenceNodeOfSequenceOfArc : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_MAT_Arc &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") MAT_SequenceNodeOfSequenceOfArc;
		 MAT_SequenceNodeOfSequenceOfArc (const Handle_MAT_Arc & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_MAT_Arc
") Value;
		Handle_MAT_Arc & Value ();
};


%feature("shadow") MAT_SequenceNodeOfSequenceOfArc::~MAT_SequenceNodeOfSequenceOfArc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_SequenceNodeOfSequenceOfArc {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_SequenceNodeOfSequenceOfArc {
	Handle_MAT_SequenceNodeOfSequenceOfArc GetHandle() {
	return *(Handle_MAT_SequenceNodeOfSequenceOfArc*) &$self;
	}
};

%nodefaultctor Handle_MAT_SequenceNodeOfSequenceOfArc;
class Handle_MAT_SequenceNodeOfSequenceOfArc : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_MAT_SequenceNodeOfSequenceOfArc();
        Handle_MAT_SequenceNodeOfSequenceOfArc(const Handle_MAT_SequenceNodeOfSequenceOfArc &aHandle);
        Handle_MAT_SequenceNodeOfSequenceOfArc(const MAT_SequenceNodeOfSequenceOfArc *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_SequenceNodeOfSequenceOfArc DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_SequenceNodeOfSequenceOfArc {
    MAT_SequenceNodeOfSequenceOfArc* GetObject() {
    return (MAT_SequenceNodeOfSequenceOfArc*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_SequenceNodeOfSequenceOfArc::~Handle_MAT_SequenceNodeOfSequenceOfArc %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_SequenceNodeOfSequenceOfArc {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_SequenceNodeOfSequenceOfBasicElt;
class MAT_SequenceNodeOfSequenceOfBasicElt : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_MAT_BasicElt &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") MAT_SequenceNodeOfSequenceOfBasicElt;
		 MAT_SequenceNodeOfSequenceOfBasicElt (const Handle_MAT_BasicElt & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_MAT_BasicElt
") Value;
		Handle_MAT_BasicElt & Value ();
};


%feature("shadow") MAT_SequenceNodeOfSequenceOfBasicElt::~MAT_SequenceNodeOfSequenceOfBasicElt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_SequenceNodeOfSequenceOfBasicElt {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_SequenceNodeOfSequenceOfBasicElt {
	Handle_MAT_SequenceNodeOfSequenceOfBasicElt GetHandle() {
	return *(Handle_MAT_SequenceNodeOfSequenceOfBasicElt*) &$self;
	}
};

%nodefaultctor Handle_MAT_SequenceNodeOfSequenceOfBasicElt;
class Handle_MAT_SequenceNodeOfSequenceOfBasicElt : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_MAT_SequenceNodeOfSequenceOfBasicElt();
        Handle_MAT_SequenceNodeOfSequenceOfBasicElt(const Handle_MAT_SequenceNodeOfSequenceOfBasicElt &aHandle);
        Handle_MAT_SequenceNodeOfSequenceOfBasicElt(const MAT_SequenceNodeOfSequenceOfBasicElt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_SequenceNodeOfSequenceOfBasicElt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_SequenceNodeOfSequenceOfBasicElt {
    MAT_SequenceNodeOfSequenceOfBasicElt* GetObject() {
    return (MAT_SequenceNodeOfSequenceOfBasicElt*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_SequenceNodeOfSequenceOfBasicElt::~Handle_MAT_SequenceNodeOfSequenceOfBasicElt %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_SequenceNodeOfSequenceOfBasicElt {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_SequenceOfArc;
class MAT_SequenceOfArc : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") MAT_SequenceOfArc;
		 MAT_SequenceOfArc ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: MAT_SequenceOfArc &
	:rtype: MAT_SequenceOfArc
") Assign;
		const MAT_SequenceOfArc & Assign (const MAT_SequenceOfArc & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT_SequenceOfArc &
	:rtype: MAT_SequenceOfArc
") operator=;
		const MAT_SequenceOfArc & operator = (const MAT_SequenceOfArc & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_MAT_Arc &
	:rtype: None
") Append;
		void Append (const Handle_MAT_Arc & T);
		%feature("autodoc", "	:param S:
	:type S: MAT_SequenceOfArc &
	:rtype: None
") Append;
		void Append (MAT_SequenceOfArc & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_MAT_Arc &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MAT_Arc & T);
		%feature("autodoc", "	:param S:
	:type S: MAT_SequenceOfArc &
	:rtype: None
") Prepend;
		void Prepend (MAT_SequenceOfArc & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_MAT_Arc &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_MAT_Arc & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: MAT_SequenceOfArc &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,MAT_SequenceOfArc & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_MAT_Arc &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_MAT_Arc & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: MAT_SequenceOfArc &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,MAT_SequenceOfArc & S);
		%feature("autodoc", "	:rtype: Handle_MAT_Arc
") First;
		const Handle_MAT_Arc & First ();
		%feature("autodoc", "	:rtype: Handle_MAT_Arc
") Last;
		const Handle_MAT_Arc & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: MAT_SequenceOfArc &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,MAT_SequenceOfArc & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_MAT_Arc
") Value;
		const Handle_MAT_Arc & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_MAT_Arc &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_MAT_Arc & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_MAT_Arc
") ChangeValue;
		Handle_MAT_Arc & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") MAT_SequenceOfArc::~MAT_SequenceOfArc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_SequenceOfArc {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT_SequenceOfBasicElt;
class MAT_SequenceOfBasicElt : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") MAT_SequenceOfBasicElt;
		 MAT_SequenceOfBasicElt ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: MAT_SequenceOfBasicElt &
	:rtype: MAT_SequenceOfBasicElt
") Assign;
		const MAT_SequenceOfBasicElt & Assign (const MAT_SequenceOfBasicElt & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT_SequenceOfBasicElt &
	:rtype: MAT_SequenceOfBasicElt
") operator=;
		const MAT_SequenceOfBasicElt & operator = (const MAT_SequenceOfBasicElt & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_MAT_BasicElt &
	:rtype: None
") Append;
		void Append (const Handle_MAT_BasicElt & T);
		%feature("autodoc", "	:param S:
	:type S: MAT_SequenceOfBasicElt &
	:rtype: None
") Append;
		void Append (MAT_SequenceOfBasicElt & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_MAT_BasicElt &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MAT_BasicElt & T);
		%feature("autodoc", "	:param S:
	:type S: MAT_SequenceOfBasicElt &
	:rtype: None
") Prepend;
		void Prepend (MAT_SequenceOfBasicElt & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_MAT_BasicElt &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_MAT_BasicElt & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: MAT_SequenceOfBasicElt &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,MAT_SequenceOfBasicElt & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_MAT_BasicElt &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_MAT_BasicElt & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: MAT_SequenceOfBasicElt &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,MAT_SequenceOfBasicElt & S);
		%feature("autodoc", "	:rtype: Handle_MAT_BasicElt
") First;
		const Handle_MAT_BasicElt & First ();
		%feature("autodoc", "	:rtype: Handle_MAT_BasicElt
") Last;
		const Handle_MAT_BasicElt & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: MAT_SequenceOfBasicElt &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,MAT_SequenceOfBasicElt & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_MAT_BasicElt
") Value;
		const Handle_MAT_BasicElt & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_MAT_BasicElt &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_MAT_BasicElt & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_MAT_BasicElt
") ChangeValue;
		Handle_MAT_BasicElt & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") MAT_SequenceOfBasicElt::~MAT_SequenceOfBasicElt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_SequenceOfBasicElt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT_TListNodeOfListOfBisector;
class MAT_TListNodeOfListOfBisector : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") MAT_TListNodeOfListOfBisector;
		 MAT_TListNodeOfListOfBisector ();
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Bisector &
	:rtype: None
") MAT_TListNodeOfListOfBisector;
		 MAT_TListNodeOfListOfBisector (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "	:rtype: Handle_MAT_Bisector
") GetItem;
		Handle_MAT_Bisector GetItem ();
		%feature("autodoc", "	:rtype: Handle_MAT_TListNodeOfListOfBisector
") Next;
		Handle_MAT_TListNodeOfListOfBisector Next ();
		%feature("autodoc", "	:rtype: Handle_MAT_TListNodeOfListOfBisector
") Previous;
		Handle_MAT_TListNodeOfListOfBisector Previous ();
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Bisector &
	:rtype: None
") SetItem;
		void SetItem (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "	:param atlistnode:
	:type atlistnode: Handle_MAT_TListNodeOfListOfBisector &
	:rtype: None
") Next;
		void Next (const Handle_MAT_TListNodeOfListOfBisector & atlistnode);
		%feature("autodoc", "	:param atlistnode:
	:type atlistnode: Handle_MAT_TListNodeOfListOfBisector &
	:rtype: None
") Previous;
		void Previous (const Handle_MAT_TListNodeOfListOfBisector & atlistnode);
		%feature("autodoc", "	:rtype: None
") Dummy;
		void Dummy ();
};


%feature("shadow") MAT_TListNodeOfListOfBisector::~MAT_TListNodeOfListOfBisector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_TListNodeOfListOfBisector {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_TListNodeOfListOfBisector {
	Handle_MAT_TListNodeOfListOfBisector GetHandle() {
	return *(Handle_MAT_TListNodeOfListOfBisector*) &$self;
	}
};

%nodefaultctor Handle_MAT_TListNodeOfListOfBisector;
class Handle_MAT_TListNodeOfListOfBisector : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MAT_TListNodeOfListOfBisector();
        Handle_MAT_TListNodeOfListOfBisector(const Handle_MAT_TListNodeOfListOfBisector &aHandle);
        Handle_MAT_TListNodeOfListOfBisector(const MAT_TListNodeOfListOfBisector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_TListNodeOfListOfBisector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_TListNodeOfListOfBisector {
    MAT_TListNodeOfListOfBisector* GetObject() {
    return (MAT_TListNodeOfListOfBisector*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_TListNodeOfListOfBisector::~Handle_MAT_TListNodeOfListOfBisector %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_TListNodeOfListOfBisector {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_TListNodeOfListOfEdge;
class MAT_TListNodeOfListOfEdge : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") MAT_TListNodeOfListOfEdge;
		 MAT_TListNodeOfListOfEdge ();
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Edge &
	:rtype: None
") MAT_TListNodeOfListOfEdge;
		 MAT_TListNodeOfListOfEdge (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "	:rtype: Handle_MAT_Edge
") GetItem;
		Handle_MAT_Edge GetItem ();
		%feature("autodoc", "	:rtype: Handle_MAT_TListNodeOfListOfEdge
") Next;
		Handle_MAT_TListNodeOfListOfEdge Next ();
		%feature("autodoc", "	:rtype: Handle_MAT_TListNodeOfListOfEdge
") Previous;
		Handle_MAT_TListNodeOfListOfEdge Previous ();
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_MAT_Edge &
	:rtype: None
") SetItem;
		void SetItem (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "	:param atlistnode:
	:type atlistnode: Handle_MAT_TListNodeOfListOfEdge &
	:rtype: None
") Next;
		void Next (const Handle_MAT_TListNodeOfListOfEdge & atlistnode);
		%feature("autodoc", "	:param atlistnode:
	:type atlistnode: Handle_MAT_TListNodeOfListOfEdge &
	:rtype: None
") Previous;
		void Previous (const Handle_MAT_TListNodeOfListOfEdge & atlistnode);
		%feature("autodoc", "	:rtype: None
") Dummy;
		void Dummy ();
};


%feature("shadow") MAT_TListNodeOfListOfEdge::~MAT_TListNodeOfListOfEdge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_TListNodeOfListOfEdge {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_TListNodeOfListOfEdge {
	Handle_MAT_TListNodeOfListOfEdge GetHandle() {
	return *(Handle_MAT_TListNodeOfListOfEdge*) &$self;
	}
};

%nodefaultctor Handle_MAT_TListNodeOfListOfEdge;
class Handle_MAT_TListNodeOfListOfEdge : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MAT_TListNodeOfListOfEdge();
        Handle_MAT_TListNodeOfListOfEdge(const Handle_MAT_TListNodeOfListOfEdge &aHandle);
        Handle_MAT_TListNodeOfListOfEdge(const MAT_TListNodeOfListOfEdge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_TListNodeOfListOfEdge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_TListNodeOfListOfEdge {
    MAT_TListNodeOfListOfEdge* GetObject() {
    return (MAT_TListNodeOfListOfEdge*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_TListNodeOfListOfEdge::~Handle_MAT_TListNodeOfListOfEdge %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_TListNodeOfListOfEdge {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT_Zone;
class MAT_Zone : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") MAT_Zone;
		 MAT_Zone ();
		%feature("autodoc", "	* Compute the frontier of the Zone of proximity.

	:param aBasicElt:
	:type aBasicElt: Handle_MAT_BasicElt &
	:rtype: None
") MAT_Zone;
		 MAT_Zone (const Handle_MAT_BasicElt & aBasicElt);
		%feature("autodoc", "	* Compute the frontier of the Zone of proximity.

	:param aBasicElt:
	:type aBasicElt: Handle_MAT_BasicElt &
	:rtype: None
") Perform;
		void Perform (const Handle_MAT_BasicElt & aBasicElt);
		%feature("autodoc", "	* Return the number Of Arcs On the frontier of <self>.

	:rtype: int
") NumberOfArcs;
		Standard_Integer NumberOfArcs ();
		%feature("autodoc", "	* Return the Arc number <Index> on the frontier. of <self>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_MAT_Arc
") ArcOnFrontier;
		Handle_MAT_Arc ArcOnFrontier (const Standard_Integer Index);
		%feature("autodoc", "	* Return True if <self> is not empty .

	:rtype: bool
") NoEmptyZone;
		Standard_Boolean NoEmptyZone ();
		%feature("autodoc", "	* Return True if <self> is Limited.

	:rtype: bool
") Limited;
		Standard_Boolean Limited ();
};


%feature("shadow") MAT_Zone::~MAT_Zone %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT_Zone {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT_Zone {
	Handle_MAT_Zone GetHandle() {
	return *(Handle_MAT_Zone*) &$self;
	}
};

%nodefaultctor Handle_MAT_Zone;
class Handle_MAT_Zone : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MAT_Zone();
        Handle_MAT_Zone(const Handle_MAT_Zone &aHandle);
        Handle_MAT_Zone(const MAT_Zone *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT_Zone DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT_Zone {
    MAT_Zone* GetObject() {
    return (MAT_Zone*)$self->Access();
    }
};
%feature("shadow") Handle_MAT_Zone::~Handle_MAT_Zone %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT_Zone {
    void _kill_pointed() {
        delete $self;
    }
};

