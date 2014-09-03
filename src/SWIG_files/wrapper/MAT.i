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
		%feature("autodoc", "Args:
	ArcIndex(Standard_Integer)
	GeomIndex(Standard_Integer)
	FirstElement(Handle_MAT_BasicElt)
	SecondElement(Handle_MAT_BasicElt)

Returns:
	None

No detailed docstring for this function.") MAT_Arc;
		 MAT_Arc (const Standard_Integer ArcIndex,const Standard_Integer GeomIndex,const Handle_MAT_BasicElt & FirstElement,const Handle_MAT_BasicElt & SecondElement);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the index of <self> in Graph.theArcs.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns  the index associated  of the  geometric  
           representation of <self>.") GeomIndex;
		Standard_Integer GeomIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_BasicElt

Returns one of the BasicElt equidistant from <self>.") FirstElement;
		Handle_MAT_BasicElt FirstElement ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_BasicElt

Returns the other BasicElt equidistant from <self>.") SecondElement;
		Handle_MAT_BasicElt SecondElement ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Node

Returns one Node extremity of <self>.") FirstNode;
		Handle_MAT_Node FirstNode ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Node

Returns the other Node extremity of <self>.") SecondNode;
		Handle_MAT_Node SecondNode ();
		%feature("autodoc", "Args:
	aNode(Handle_MAT_Node)

Returns:
	Handle_MAT_Node

an Arc has two Node, if <aNode> egal one  
           Returns the other.  
 if <aNode> is not oh <self>") TheOtherNode;
		Handle_MAT_Node TheOtherNode (const Handle_MAT_Node & aNode);
		%feature("autodoc", "Args:
	aNode(Handle_MAT_Node)
	aSide(MAT_Side)

Returns:
	Standard_Boolean

Returnst True is there is an arc linked to  
           the Node <aNode> located on the side <aSide> of <self>;  if <aNode> is not on <self>") HasNeighbour;
		Standard_Boolean HasNeighbour (const Handle_MAT_Node & aNode,const MAT_Side aSide);
		%feature("autodoc", "Args:
	aNode(Handle_MAT_Node)
	aSide(MAT_Side)

Returns:
	Handle_MAT_Arc

Returns the first arc linked to the Node <aNode>  
           located on the side <aSide> of <self>;  if HasNeighbour() returns FALSE.") Neighbour;
		Handle_MAT_Arc Neighbour (const Handle_MAT_Node & aNode,const MAT_Side aSide);
		%feature("autodoc", "Args:
	anInteger(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetIndex;
		void SetIndex (const Standard_Integer anInteger);
		%feature("autodoc", "Args:
	anInteger(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetGeomIndex;
		void SetGeomIndex (const Standard_Integer anInteger);
		%feature("autodoc", "Args:
	aBasicElt(Handle_MAT_BasicElt)

Returns:
	None

No detailed docstring for this function.") SetFirstElement;
		void SetFirstElement (const Handle_MAT_BasicElt & aBasicElt);
		%feature("autodoc", "Args:
	aBasicElt(Handle_MAT_BasicElt)

Returns:
	None

No detailed docstring for this function.") SetSecondElement;
		void SetSecondElement (const Handle_MAT_BasicElt & aBasicElt);
		%feature("autodoc", "Args:
	aNode(Handle_MAT_Node)

Returns:
	None

No detailed docstring for this function.") SetFirstNode;
		void SetFirstNode (const Handle_MAT_Node & aNode);
		%feature("autodoc", "Args:
	aNode(Handle_MAT_Node)

Returns:
	None

No detailed docstring for this function.") SetSecondNode;
		void SetSecondNode (const Handle_MAT_Node & aNode);
		%feature("autodoc", "Args:
	aSide(MAT_Side)
	anArc(Handle_MAT_Arc)

Returns:
	None

No detailed docstring for this function.") SetFirstArc;
		void SetFirstArc (const MAT_Side aSide,const Handle_MAT_Arc & anArc);
		%feature("autodoc", "Args:
	aSide(MAT_Side)
	anArc(Handle_MAT_Arc)

Returns:
	None

No detailed docstring for this function.") SetSecondArc;
		void SetSecondArc (const MAT_Side aSide,const Handle_MAT_Arc & anArc);
		%feature("autodoc", "Args:
	aSide(MAT_Side)
	aNode(Handle_MAT_Node)
	anArc(Handle_MAT_Arc)

Returns:
	None

No detailed docstring for this function.") SetNeighbour;
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
		%feature("autodoc", "Args:
	anInteger(Standard_Integer)

Returns:
	None

Constructor, <anInteger> is the <index> of <self>.") MAT_BasicElt;
		 MAT_BasicElt (const Standard_Integer anInteger);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Arc

Return <startArcLeft> or <startArcRight> corresponding  
           to <aSide>.") StartArc;
		Handle_MAT_Arc StartArc ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Arc

Return <endArcLeft> or <endArcRight> corresponding  
           to <aSide>.") EndArc;
		Handle_MAT_Arc EndArc ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Return the <index> of <self> in Graph.TheBasicElts.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Return the <GeomIndex> of <self>.") GeomIndex;
		Standard_Integer GeomIndex ();
		%feature("autodoc", "Args:
	anArc(Handle_MAT_Arc)

Returns:
	None

No detailed docstring for this function.") SetStartArc;
		void SetStartArc (const Handle_MAT_Arc & anArc);
		%feature("autodoc", "Args:
	anArc(Handle_MAT_Arc)

Returns:
	None

No detailed docstring for this function.") SetEndArc;
		void SetEndArc (const Handle_MAT_Arc & anArc);
		%feature("autodoc", "Args:
	anInteger(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetIndex;
		void SetIndex (const Standard_Integer anInteger);
		%feature("autodoc", "Args:
	anInteger(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetGeomIndex;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT_Bisector;
		 MAT_Bisector ();
		%feature("autodoc", "Args:
	abisector(Handle_MAT_Bisector)

Returns:
	None

No detailed docstring for this function.") AddBisector;
		void AddBisector (const Handle_MAT_Bisector & abisector);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_ListOfBisector

No detailed docstring for this function.") List;
		Handle_MAT_ListOfBisector List ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") FirstBisector;
		Handle_MAT_Bisector FirstBisector ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") LastBisector;
		Handle_MAT_Bisector LastBisector ();
		%feature("autodoc", "Args:
	anumber(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BisectorNumber;
		void BisectorNumber (const Standard_Integer anumber);
		%feature("autodoc", "Args:
	anumber(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IndexNumber;
		void IndexNumber (const Standard_Integer anumber);
		%feature("autodoc", "Args:
	anedge(Handle_MAT_Edge)

Returns:
	None

No detailed docstring for this function.") FirstEdge;
		void FirstEdge (const Handle_MAT_Edge & anedge);
		%feature("autodoc", "Args:
	anedge(Handle_MAT_Edge)

Returns:
	None

No detailed docstring for this function.") SecondEdge;
		void SecondEdge (const Handle_MAT_Edge & anedge);
		%feature("autodoc", "Args:
	apoint(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IssuePoint;
		void IssuePoint (const Standard_Integer apoint);
		%feature("autodoc", "Args:
	apoint(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") EndPoint;
		void EndPoint (const Standard_Integer apoint);
		%feature("autodoc", "Args:
	areal(Standard_Real)

Returns:
	None

No detailed docstring for this function.") DistIssuePoint;
		void DistIssuePoint (const Standard_Real areal);
		%feature("autodoc", "Args:
	avector(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") FirstVector;
		void FirstVector (const Standard_Integer avector);
		%feature("autodoc", "Args:
	avector(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SecondVector;
		void SecondVector (const Standard_Integer avector);
		%feature("autodoc", "Args:
	asense(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Sense;
		void Sense (const Standard_Real asense);
		%feature("autodoc", "Args:
	aparameter(Standard_Real)

Returns:
	None

No detailed docstring for this function.") FirstParameter;
		void FirstParameter (const Standard_Real aparameter);
		%feature("autodoc", "Args:
	aparameter(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SecondParameter;
		void SecondParameter (const Standard_Real aparameter);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") BisectorNumber;
		Standard_Integer BisectorNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IndexNumber;
		Standard_Integer IndexNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Edge

No detailed docstring for this function.") FirstEdge;
		Handle_MAT_Edge FirstEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Edge

No detailed docstring for this function.") SecondEdge;
		Handle_MAT_Edge SecondEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IssuePoint;
		Standard_Integer IssuePoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") EndPoint;
		Standard_Integer EndPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") DistIssuePoint;
		Standard_Real DistIssuePoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FirstVector;
		Standard_Integer FirstVector ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") SecondVector;
		Standard_Integer SecondVector ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Sense;
		Standard_Real Sense ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SecondParameter;
		Standard_Real SecondParameter ();
		%feature("autodoc", "Args:
	ashift(Standard_Integer)
	alevel(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT_DataMapIteratorOfDataMapOfIntegerArc;
		 MAT_DataMapIteratorOfDataMapOfIntegerArc ();
		%feature("autodoc", "Args:
	aMap(MAT_DataMapOfIntegerArc)

Returns:
	None

No detailed docstring for this function.") MAT_DataMapIteratorOfDataMapOfIntegerArc;
		 MAT_DataMapIteratorOfDataMapOfIntegerArc (const MAT_DataMapOfIntegerArc & aMap);
		%feature("autodoc", "Args:
	aMap(MAT_DataMapOfIntegerArc)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const MAT_DataMapOfIntegerArc & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Arc

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT_DataMapIteratorOfDataMapOfIntegerBasicElt;
		 MAT_DataMapIteratorOfDataMapOfIntegerBasicElt ();
		%feature("autodoc", "Args:
	aMap(MAT_DataMapOfIntegerBasicElt)

Returns:
	None

No detailed docstring for this function.") MAT_DataMapIteratorOfDataMapOfIntegerBasicElt;
		 MAT_DataMapIteratorOfDataMapOfIntegerBasicElt (const MAT_DataMapOfIntegerBasicElt & aMap);
		%feature("autodoc", "Args:
	aMap(MAT_DataMapOfIntegerBasicElt)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const MAT_DataMapOfIntegerBasicElt & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT_DataMapIteratorOfDataMapOfIntegerBisector;
		 MAT_DataMapIteratorOfDataMapOfIntegerBisector ();
		%feature("autodoc", "Args:
	aMap(MAT_DataMapOfIntegerBisector)

Returns:
	None

No detailed docstring for this function.") MAT_DataMapIteratorOfDataMapOfIntegerBisector;
		 MAT_DataMapIteratorOfDataMapOfIntegerBisector (const MAT_DataMapOfIntegerBisector & aMap);
		%feature("autodoc", "Args:
	aMap(MAT_DataMapOfIntegerBisector)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const MAT_DataMapOfIntegerBisector & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT_DataMapIteratorOfDataMapOfIntegerNode;
		 MAT_DataMapIteratorOfDataMapOfIntegerNode ();
		%feature("autodoc", "Args:
	aMap(MAT_DataMapOfIntegerNode)

Returns:
	None

No detailed docstring for this function.") MAT_DataMapIteratorOfDataMapOfIntegerNode;
		 MAT_DataMapIteratorOfDataMapOfIntegerNode (const MAT_DataMapOfIntegerNode & aMap);
		%feature("autodoc", "Args:
	aMap(MAT_DataMapOfIntegerNode)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const MAT_DataMapOfIntegerNode & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Node

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Handle_MAT_Arc)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT_DataMapNodeOfDataMapOfIntegerArc;
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
            		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Arc

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Handle_MAT_BasicElt)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT_DataMapNodeOfDataMapOfIntegerBasicElt;
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
            		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Handle_MAT_Bisector)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT_DataMapNodeOfDataMapOfIntegerBisector;
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
            		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Handle_MAT_Node)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT_DataMapNodeOfDataMapOfIntegerNode;
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
            		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Node

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") MAT_DataMapOfIntegerArc;
		 MAT_DataMapOfIntegerArc (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(MAT_DataMapOfIntegerArc)

Returns:
	MAT_DataMapOfIntegerArc

No detailed docstring for this function.") Assign;
		MAT_DataMapOfIntegerArc & Assign (const MAT_DataMapOfIntegerArc & Other);
		%feature("autodoc", "Args:
	Other(MAT_DataMapOfIntegerArc)

Returns:
	MAT_DataMapOfIntegerArc

No detailed docstring for this function.") operator=;
		MAT_DataMapOfIntegerArc & operator = (const MAT_DataMapOfIntegerArc & Other);
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
	K(Standard_Integer)
	I(Handle_MAT_Arc)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Handle_MAT_Arc & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_MAT_Arc

No detailed docstring for this function.") Find;
		const Handle_MAT_Arc & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_MAT_Arc

No detailed docstring for this function.") ChangeFind;
		Handle_MAT_Arc & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") MAT_DataMapOfIntegerBasicElt;
		 MAT_DataMapOfIntegerBasicElt (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(MAT_DataMapOfIntegerBasicElt)

Returns:
	MAT_DataMapOfIntegerBasicElt

No detailed docstring for this function.") Assign;
		MAT_DataMapOfIntegerBasicElt & Assign (const MAT_DataMapOfIntegerBasicElt & Other);
		%feature("autodoc", "Args:
	Other(MAT_DataMapOfIntegerBasicElt)

Returns:
	MAT_DataMapOfIntegerBasicElt

No detailed docstring for this function.") operator=;
		MAT_DataMapOfIntegerBasicElt & operator = (const MAT_DataMapOfIntegerBasicElt & Other);
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
	K(Standard_Integer)
	I(Handle_MAT_BasicElt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Handle_MAT_BasicElt & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") Find;
		const Handle_MAT_BasicElt & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") ChangeFind;
		Handle_MAT_BasicElt & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") MAT_DataMapOfIntegerBisector;
		 MAT_DataMapOfIntegerBisector (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(MAT_DataMapOfIntegerBisector)

Returns:
	MAT_DataMapOfIntegerBisector

No detailed docstring for this function.") Assign;
		MAT_DataMapOfIntegerBisector & Assign (const MAT_DataMapOfIntegerBisector & Other);
		%feature("autodoc", "Args:
	Other(MAT_DataMapOfIntegerBisector)

Returns:
	MAT_DataMapOfIntegerBisector

No detailed docstring for this function.") operator=;
		MAT_DataMapOfIntegerBisector & operator = (const MAT_DataMapOfIntegerBisector & Other);
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
	K(Standard_Integer)
	I(Handle_MAT_Bisector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Handle_MAT_Bisector & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") Find;
		const Handle_MAT_Bisector & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") ChangeFind;
		Handle_MAT_Bisector & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") MAT_DataMapOfIntegerNode;
		 MAT_DataMapOfIntegerNode (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(MAT_DataMapOfIntegerNode)

Returns:
	MAT_DataMapOfIntegerNode

No detailed docstring for this function.") Assign;
		MAT_DataMapOfIntegerNode & Assign (const MAT_DataMapOfIntegerNode & Other);
		%feature("autodoc", "Args:
	Other(MAT_DataMapOfIntegerNode)

Returns:
	MAT_DataMapOfIntegerNode

No detailed docstring for this function.") operator=;
		MAT_DataMapOfIntegerNode & operator = (const MAT_DataMapOfIntegerNode & Other);
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
	K(Standard_Integer)
	I(Handle_MAT_Node)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Handle_MAT_Node & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_MAT_Node

No detailed docstring for this function.") Find;
		const Handle_MAT_Node & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_MAT_Node

No detailed docstring for this function.") ChangeFind;
		Handle_MAT_Node & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT_Edge;
		 MAT_Edge ();
		%feature("autodoc", "Args:
	anumber(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") EdgeNumber;
		void EdgeNumber (const Standard_Integer anumber);
		%feature("autodoc", "Args:
	abisector(Handle_MAT_Bisector)

Returns:
	None

No detailed docstring for this function.") FirstBisector;
		void FirstBisector (const Handle_MAT_Bisector & abisector);
		%feature("autodoc", "Args:
	abisector(Handle_MAT_Bisector)

Returns:
	None

No detailed docstring for this function.") SecondBisector;
		void SecondBisector (const Handle_MAT_Bisector & abisector);
		%feature("autodoc", "Args:
	adistance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Distance;
		void Distance (const Standard_Real adistance);
		%feature("autodoc", "Args:
	apoint(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntersectionPoint;
		void IntersectionPoint (const Standard_Integer apoint);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") EdgeNumber;
		Standard_Integer EdgeNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") FirstBisector;
		Handle_MAT_Bisector FirstBisector ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") SecondBisector;
		Handle_MAT_Bisector SecondBisector ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Distance;
		Standard_Real Distance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IntersectionPoint;
		Standard_Integer IntersectionPoint ();
		%feature("autodoc", "Args:
	ashift(Standard_Integer)
	alevel(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") MAT_Graph;
		 MAT_Graph ();
		%feature("autodoc", "Args:
	SemiInfinite(Standard_Boolean)
	TheRoots(Handle_MAT_ListOfBisector)
	NbBasicElts(Standard_Integer)
	NbArcs(Standard_Integer)

Returns:
	None

Construct <self> from the result of the method  
           <CreateMat> of the class <MAT> from <MAT>.  
 
           <SemiInfinite> : if some bisector are infinites.  
           <TheRoots>     : Set of the bisectors.  
           <NbBasicElts>  : Number of Basic Elements.  
           <NbArcs>       : Number of Arcs = Number of Bisectors.") Perform;
		void Perform (const Standard_Boolean SemiInfinite,const Handle_MAT_ListOfBisector & TheRoots,const Standard_Integer NbBasicElts,const Standard_Integer NbArcs);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_MAT_Arc

Return the Arc of index <Index> in <theArcs>.") Arc;
		Handle_MAT_Arc Arc (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_MAT_BasicElt

Return the BasicElt of index <Index> in <theBasicElts>.") BasicElt;
		Handle_MAT_BasicElt BasicElt (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_MAT_Node

Return the Node of index <Index> in <theNodes>.") Node;
		Handle_MAT_Node Node (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Return the number of arcs of <self>.") NumberOfArcs;
		Standard_Integer NumberOfArcs ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Return the number of nodes of <self>.") NumberOfNodes;
		Standard_Integer NumberOfNodes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Return the number of basic elements of <self>.") NumberOfBasicElts;
		Standard_Integer NumberOfBasicElts ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Return the number of infinites nodes of <self>.") NumberOfInfiniteNodes;
		Standard_Integer NumberOfInfiniteNodes ();
		%feature("autodoc", "Args:
	IndexElt1(Standard_Integer)
	IndexElt2(Standard_Integer)
	MergeArc1(Standard_Boolean)
	GeomIndexArc1(Standard_Integer)
	GeomIndexArc2(Standard_Integer)
	MergeArc2(Standard_Boolean)
	GeomIndexArc3(Standard_Integer)
	GeomIndexArc4(Standard_Integer)

Returns:
	None

Merge two BasicElts.  The End of the BasicElt Elt1  
         of  IndexElt1 becomes The End of the BasicElt Elt2  
         of  IndexElt2.   Elt2 is replaced in  the  arcs  by  
         Elt1, Elt2 is eliminated.  
 
         <MergeArc1> is True  if the fusion  of the BasicElts  =>  
         a fusion  of two Arcs which separated  the same  elements.  
         In this case <GeomIndexArc1> and  <GeomIndexArc2>  are the  
         Geometric  Index of this  arcs.  
 
         If the  BasicElt corresponds to a close line ,  
         the StartArc and the EndArc of Elt1 can separate the same  
         elements .  
         In this case there is a fusion of this arcs, <MergeArc2>  
         is true and <GeomIndexArc3> and  <GeomIndexArc4>  are the  
         Geometric  Index of this  arcs.") FusionOfBasicElts;
		void FusionOfBasicElts (const Standard_Integer IndexElt1,const Standard_Integer IndexElt2,Standard_Boolean & MergeArc1,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Boolean & MergeArc2,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") CompactArcs;
		void CompactArcs ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") CompactNodes;
		void CompactNodes ();
		%feature("autodoc", "Args:
	NewMap(MAT_DataMapOfIntegerBasicElt)

Returns:
	None

No detailed docstring for this function.") ChangeBasicElts;
		void ChangeBasicElts (const MAT_DataMapOfIntegerBasicElt & NewMap);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") ChangeBasicElt;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT_ListOfBisector;
		 MAT_ListOfBisector ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") First;
		void First ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Last;
		void Last ();
		%feature("autodoc", "Args:
	aniten(Handle_MAT_Bisector)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_MAT_Bisector & aniten);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Previous;
		void Previous ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") Current;
		Handle_MAT_Bisector Current ();
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Bisector)

Returns:
	None

No detailed docstring for this function.") Current;
		void Current (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") FirstItem;
		Handle_MAT_Bisector FirstItem ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") LastItem;
		Handle_MAT_Bisector LastItem ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") PreviousItem;
		Handle_MAT_Bisector PreviousItem ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") NextItem;
		Handle_MAT_Bisector NextItem ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Number;
		Standard_Integer Number ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	anindex(Standard_Integer)

Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") Brackets;
		Handle_MAT_Bisector Brackets (const Standard_Integer anindex);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Unlink;
		void Unlink ();
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Bisector)

Returns:
	None

No detailed docstring for this function.") LinkBefore;
		void LinkBefore (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Bisector)

Returns:
	None

No detailed docstring for this function.") LinkAfter;
		void LinkAfter (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Bisector)

Returns:
	None

No detailed docstring for this function.") FrontAdd;
		void FrontAdd (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Bisector)

Returns:
	None

No detailed docstring for this function.") BackAdd;
		void BackAdd (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Permute;
		void Permute ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Loop;
		void Loop ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	ashift(Standard_Integer)
	alevel(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT_ListOfEdge;
		 MAT_ListOfEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") First;
		void First ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Last;
		void Last ();
		%feature("autodoc", "Args:
	aniten(Handle_MAT_Edge)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_MAT_Edge & aniten);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Previous;
		void Previous ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Edge

No detailed docstring for this function.") Current;
		Handle_MAT_Edge Current ();
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Edge)

Returns:
	None

No detailed docstring for this function.") Current;
		void Current (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Edge

No detailed docstring for this function.") FirstItem;
		Handle_MAT_Edge FirstItem ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Edge

No detailed docstring for this function.") LastItem;
		Handle_MAT_Edge LastItem ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Edge

No detailed docstring for this function.") PreviousItem;
		Handle_MAT_Edge PreviousItem ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Edge

No detailed docstring for this function.") NextItem;
		Handle_MAT_Edge NextItem ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Number;
		Standard_Integer Number ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	anindex(Standard_Integer)

Returns:
	Handle_MAT_Edge

No detailed docstring for this function.") Brackets;
		Handle_MAT_Edge Brackets (const Standard_Integer anindex);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Unlink;
		void Unlink ();
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Edge)

Returns:
	None

No detailed docstring for this function.") LinkBefore;
		void LinkBefore (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Edge)

Returns:
	None

No detailed docstring for this function.") LinkAfter;
		void LinkAfter (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Edge)

Returns:
	None

No detailed docstring for this function.") FrontAdd;
		void FrontAdd (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Edge)

Returns:
	None

No detailed docstring for this function.") BackAdd;
		void BackAdd (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Permute;
		void Permute ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Loop;
		void Loop ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	ashift(Standard_Integer)
	alevel(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	GeomIndex(Standard_Integer)
	LinkedArc(Handle_MAT_Arc)
	Distance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") MAT_Node;
		 MAT_Node (const Standard_Integer GeomIndex,const Handle_MAT_Arc & LinkedArc,const Standard_Real Distance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the index associated of the geometric  
           representation of <self>.") GeomIndex;
		Standard_Integer GeomIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the index associated of the node") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	S(MAT_SequenceOfArc)

Returns:
	None

Returns in <S> the Arcs linked to <self>.") LinkedArcs;
		void LinkedArcs (MAT_SequenceOfArc & S);
		%feature("autodoc", "Args:
	S(MAT_SequenceOfBasicElt)

Returns:
	None

Returns  in <S> the BasicElts equidistant  
         to <self>.") NearElts;
		void NearElts (MAT_SequenceOfBasicElt & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Distance;
		Standard_Real Distance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

//!Returns True if <self> is a pending Node.  
         (ie : the number of Arc Linked = 1)") PendingNode;
		Standard_Boolean PendingNode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if <self> belongs to the figure.") OnBasicElt;
		Standard_Boolean OnBasicElt ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distance of <self> is Infinite") Infinite;
		Standard_Boolean Infinite ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

Set the index associated of the node") SetIndex;
		void SetIndex (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anArc(Handle_MAT_Arc)

Returns:
	None

No detailed docstring for this function.") SetLinkedArc;
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
		%feature("autodoc", "Args:
	I(Handle_MAT_Arc)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT_SequenceNodeOfSequenceOfArc;
		 MAT_SequenceNodeOfSequenceOfArc (const Handle_MAT_Arc & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Arc

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_MAT_BasicElt)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT_SequenceNodeOfSequenceOfBasicElt;
		 MAT_SequenceNodeOfSequenceOfBasicElt (const Handle_MAT_BasicElt & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_BasicElt

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT_SequenceOfArc;
		 MAT_SequenceOfArc ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(MAT_SequenceOfArc)

Returns:
	MAT_SequenceOfArc

No detailed docstring for this function.") Assign;
		const MAT_SequenceOfArc & Assign (const MAT_SequenceOfArc & Other);
		%feature("autodoc", "Args:
	Other(MAT_SequenceOfArc)

Returns:
	MAT_SequenceOfArc

No detailed docstring for this function.") operator=;
		const MAT_SequenceOfArc & operator = (const MAT_SequenceOfArc & Other);
		%feature("autodoc", "Args:
	T(Handle_MAT_Arc)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_MAT_Arc & T);
		%feature("autodoc", "Args:
	S(MAT_SequenceOfArc)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (MAT_SequenceOfArc & S);
		%feature("autodoc", "Args:
	T(Handle_MAT_Arc)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_MAT_Arc & T);
		%feature("autodoc", "Args:
	S(MAT_SequenceOfArc)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (MAT_SequenceOfArc & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_MAT_Arc)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_MAT_Arc & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(MAT_SequenceOfArc)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,MAT_SequenceOfArc & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_MAT_Arc)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_MAT_Arc & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(MAT_SequenceOfArc)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,MAT_SequenceOfArc & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Arc

No detailed docstring for this function.") First;
		const Handle_MAT_Arc & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Arc

No detailed docstring for this function.") Last;
		const Handle_MAT_Arc & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(MAT_SequenceOfArc)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,MAT_SequenceOfArc & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_MAT_Arc

No detailed docstring for this function.") Value;
		const Handle_MAT_Arc & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_MAT_Arc)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_MAT_Arc & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_MAT_Arc

No detailed docstring for this function.") ChangeValue;
		Handle_MAT_Arc & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT_SequenceOfBasicElt;
		 MAT_SequenceOfBasicElt ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(MAT_SequenceOfBasicElt)

Returns:
	MAT_SequenceOfBasicElt

No detailed docstring for this function.") Assign;
		const MAT_SequenceOfBasicElt & Assign (const MAT_SequenceOfBasicElt & Other);
		%feature("autodoc", "Args:
	Other(MAT_SequenceOfBasicElt)

Returns:
	MAT_SequenceOfBasicElt

No detailed docstring for this function.") operator=;
		const MAT_SequenceOfBasicElt & operator = (const MAT_SequenceOfBasicElt & Other);
		%feature("autodoc", "Args:
	T(Handle_MAT_BasicElt)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_MAT_BasicElt & T);
		%feature("autodoc", "Args:
	S(MAT_SequenceOfBasicElt)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (MAT_SequenceOfBasicElt & S);
		%feature("autodoc", "Args:
	T(Handle_MAT_BasicElt)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_MAT_BasicElt & T);
		%feature("autodoc", "Args:
	S(MAT_SequenceOfBasicElt)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (MAT_SequenceOfBasicElt & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_MAT_BasicElt)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_MAT_BasicElt & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(MAT_SequenceOfBasicElt)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,MAT_SequenceOfBasicElt & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_MAT_BasicElt)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_MAT_BasicElt & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(MAT_SequenceOfBasicElt)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,MAT_SequenceOfBasicElt & S);
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
	Sub(MAT_SequenceOfBasicElt)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,MAT_SequenceOfBasicElt & Sub);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT_TListNodeOfListOfBisector;
		 MAT_TListNodeOfListOfBisector ();
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Bisector)

Returns:
	None

No detailed docstring for this function.") MAT_TListNodeOfListOfBisector;
		 MAT_TListNodeOfListOfBisector (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") GetItem;
		Handle_MAT_Bisector GetItem ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_TListNodeOfListOfBisector

No detailed docstring for this function.") Next;
		Handle_MAT_TListNodeOfListOfBisector Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_TListNodeOfListOfBisector

No detailed docstring for this function.") Previous;
		Handle_MAT_TListNodeOfListOfBisector Previous ();
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Bisector)

Returns:
	None

No detailed docstring for this function.") SetItem;
		void SetItem (const Handle_MAT_Bisector & anitem);
		%feature("autodoc", "Args:
	atlistnode(Handle_MAT_TListNodeOfListOfBisector)

Returns:
	None

No detailed docstring for this function.") Next;
		void Next (const Handle_MAT_TListNodeOfListOfBisector & atlistnode);
		%feature("autodoc", "Args:
	atlistnode(Handle_MAT_TListNodeOfListOfBisector)

Returns:
	None

No detailed docstring for this function.") Previous;
		void Previous (const Handle_MAT_TListNodeOfListOfBisector & atlistnode);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dummy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT_TListNodeOfListOfEdge;
		 MAT_TListNodeOfListOfEdge ();
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Edge)

Returns:
	None

No detailed docstring for this function.") MAT_TListNodeOfListOfEdge;
		 MAT_TListNodeOfListOfEdge (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Edge

No detailed docstring for this function.") GetItem;
		Handle_MAT_Edge GetItem ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_TListNodeOfListOfEdge

No detailed docstring for this function.") Next;
		Handle_MAT_TListNodeOfListOfEdge Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_TListNodeOfListOfEdge

No detailed docstring for this function.") Previous;
		Handle_MAT_TListNodeOfListOfEdge Previous ();
		%feature("autodoc", "Args:
	anitem(Handle_MAT_Edge)

Returns:
	None

No detailed docstring for this function.") SetItem;
		void SetItem (const Handle_MAT_Edge & anitem);
		%feature("autodoc", "Args:
	atlistnode(Handle_MAT_TListNodeOfListOfEdge)

Returns:
	None

No detailed docstring for this function.") Next;
		void Next (const Handle_MAT_TListNodeOfListOfEdge & atlistnode);
		%feature("autodoc", "Args:
	atlistnode(Handle_MAT_TListNodeOfListOfEdge)

Returns:
	None

No detailed docstring for this function.") Previous;
		void Previous (const Handle_MAT_TListNodeOfListOfEdge & atlistnode);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dummy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT_Zone;
		 MAT_Zone ();
		%feature("autodoc", "Args:
	aBasicElt(Handle_MAT_BasicElt)

Returns:
	None

Compute the frontier of the Zone of proximity.") MAT_Zone;
		 MAT_Zone (const Handle_MAT_BasicElt & aBasicElt);
		%feature("autodoc", "Args:
	aBasicElt(Handle_MAT_BasicElt)

Returns:
	None

Compute the frontier of the Zone of proximity.") Perform;
		void Perform (const Handle_MAT_BasicElt & aBasicElt);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Return the number Of Arcs On the frontier of <self>.") NumberOfArcs;
		Standard_Integer NumberOfArcs ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_MAT_Arc

Return the  Arc number <Index>  on the frontier.  
 of  <self>.") ArcOnFrontier;
		Handle_MAT_Arc ArcOnFrontier (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Return TRUE if <self> is not empty .") NoEmptyZone;
		Standard_Boolean NoEmptyZone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Return TRUE if <self> is Limited.") Limited;
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

