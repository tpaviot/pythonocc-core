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
%module (package="OCC") GraphDS

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

%include GraphDS_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum GraphDS_EntityRole {
	GraphDS_OnlyInput = 0,
	GraphDS_OnlyOutput = 1,
	GraphDS_InputAndOutput = 2,
};

enum GraphDS_RelationRole {
	GraphDS_OnlyFront = 0,
	GraphDS_OnlyBack = 1,
	GraphDS_FrontAndBack = 2,
};

/* end public enums declaration */

%nodefaultctor GraphDS_DataMapIteratorOfEntityRoleMap;
class GraphDS_DataMapIteratorOfEntityRoleMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") GraphDS_DataMapIteratorOfEntityRoleMap;
		 GraphDS_DataMapIteratorOfEntityRoleMap ();
		%feature("autodoc", "	:param aMap:
	:type aMap: GraphDS_EntityRoleMap &
	:rtype: None
") GraphDS_DataMapIteratorOfEntityRoleMap;
		 GraphDS_DataMapIteratorOfEntityRoleMap (const GraphDS_EntityRoleMap & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: GraphDS_EntityRoleMap &
	:rtype: None
") Initialize;
		void Initialize (const GraphDS_EntityRoleMap & aMap);
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key;
		const Handle_Standard_Transient & Key ();
		%feature("autodoc", "	:rtype: GraphDS_EntityRole
") Value;
		const GraphDS_EntityRole & Value ();
};


%feature("shadow") GraphDS_DataMapIteratorOfEntityRoleMap::~GraphDS_DataMapIteratorOfEntityRoleMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GraphDS_DataMapIteratorOfEntityRoleMap {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GraphDS_DataMapNodeOfEntityRoleMap;
class GraphDS_DataMapNodeOfEntityRoleMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:param I:
	:type I: GraphDS_EntityRole &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") GraphDS_DataMapNodeOfEntityRoleMap;
		 GraphDS_DataMapNodeOfEntityRoleMap (const Handle_Standard_Transient & K,const GraphDS_EntityRole & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key;
		Handle_Standard_Transient & Key ();
		%feature("autodoc", "	:rtype: GraphDS_EntityRole
") Value;
		GraphDS_EntityRole & Value ();
};


%feature("shadow") GraphDS_DataMapNodeOfEntityRoleMap::~GraphDS_DataMapNodeOfEntityRoleMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GraphDS_DataMapNodeOfEntityRoleMap {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GraphDS_DataMapNodeOfEntityRoleMap {
	Handle_GraphDS_DataMapNodeOfEntityRoleMap GetHandle() {
	return *(Handle_GraphDS_DataMapNodeOfEntityRoleMap*) &$self;
	}
};

%nodefaultctor Handle_GraphDS_DataMapNodeOfEntityRoleMap;
class Handle_GraphDS_DataMapNodeOfEntityRoleMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_GraphDS_DataMapNodeOfEntityRoleMap();
        Handle_GraphDS_DataMapNodeOfEntityRoleMap(const Handle_GraphDS_DataMapNodeOfEntityRoleMap &aHandle);
        Handle_GraphDS_DataMapNodeOfEntityRoleMap(const GraphDS_DataMapNodeOfEntityRoleMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GraphDS_DataMapNodeOfEntityRoleMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GraphDS_DataMapNodeOfEntityRoleMap {
    GraphDS_DataMapNodeOfEntityRoleMap* GetObject() {
    return (GraphDS_DataMapNodeOfEntityRoleMap*)$self->Access();
    }
};
%feature("shadow") Handle_GraphDS_DataMapNodeOfEntityRoleMap::~Handle_GraphDS_DataMapNodeOfEntityRoleMap %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GraphDS_DataMapNodeOfEntityRoleMap {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GraphDS_EntityRoleMap;
class GraphDS_EntityRoleMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") GraphDS_EntityRoleMap;
		 GraphDS_EntityRoleMap (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: GraphDS_EntityRoleMap &
	:rtype: GraphDS_EntityRoleMap
") Assign;
		GraphDS_EntityRoleMap & Assign (const GraphDS_EntityRoleMap & Other);
		%feature("autodoc", "	:param Other:
	:type Other: GraphDS_EntityRoleMap &
	:rtype: GraphDS_EntityRoleMap
") operator=;
		GraphDS_EntityRoleMap & operator = (const GraphDS_EntityRoleMap & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:param I:
	:type I: GraphDS_EntityRole &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_Standard_Transient & K,const GraphDS_EntityRole & I);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: GraphDS_EntityRole
") Find;
		const GraphDS_EntityRole & Find (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: GraphDS_EntityRole
") ChangeFind;
		GraphDS_EntityRole & ChangeFind (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_Standard_Transient & K);
};


%feature("shadow") GraphDS_EntityRoleMap::~GraphDS_EntityRoleMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GraphDS_EntityRoleMap {
	void _kill_pointed() {
		delete $self;
	}
};
