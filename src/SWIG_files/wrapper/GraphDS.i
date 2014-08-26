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
%module GraphDS

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

%include GraphDS_required_python_modules.i
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GraphDS_DataMapIteratorOfEntityRoleMap;
		 GraphDS_DataMapIteratorOfEntityRoleMap ();
		%feature("autodoc", "Args:
	aMap(GraphDS_EntityRoleMap)

Returns:
	None

No detailed docstring for this function.") GraphDS_DataMapIteratorOfEntityRoleMap;
		 GraphDS_DataMapIteratorOfEntityRoleMap (const GraphDS_EntityRoleMap & aMap);
		%feature("autodoc", "Args:
	aMap(GraphDS_EntityRoleMap)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const GraphDS_EntityRoleMap & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Key;
		const Handle_Standard_Transient & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	GraphDS_EntityRole

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)
	I(GraphDS_EntityRole)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") GraphDS_DataMapNodeOfEntityRoleMap;
		 GraphDS_DataMapNodeOfEntityRoleMap (const Handle_Standard_Transient & K,const GraphDS_EntityRole & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Key;
		Handle_Standard_Transient & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	GraphDS_EntityRole

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") GraphDS_EntityRoleMap;
		 GraphDS_EntityRoleMap (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(GraphDS_EntityRoleMap)

Returns:
	GraphDS_EntityRoleMap

No detailed docstring for this function.") Assign;
		GraphDS_EntityRoleMap & Assign (const GraphDS_EntityRoleMap & Other);
		%feature("autodoc", "Args:
	Other(GraphDS_EntityRoleMap)

Returns:
	GraphDS_EntityRoleMap

No detailed docstring for this function.") operator=;
		GraphDS_EntityRoleMap & operator = (const GraphDS_EntityRoleMap & Other);
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
	K(Handle_Standard_Transient)
	I(GraphDS_EntityRole)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const Handle_Standard_Transient & K,const GraphDS_EntityRole & I);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	GraphDS_EntityRole

No detailed docstring for this function.") Find;
		const GraphDS_EntityRole & Find (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	GraphDS_EntityRole

No detailed docstring for this function.") ChangeFind;
		GraphDS_EntityRole & ChangeFind (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
