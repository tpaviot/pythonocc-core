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
%module (package="OCC") Draft

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


%include Draft_headers.i


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
enum Draft_ErrorStatus {
	Draft_NoError = 0,
	Draft_FaceRecomputation = 1,
	Draft_EdgeRecomputation = 2,
	Draft_VertexRecomputation = 3,
};

/* end public enums declaration */

%rename(draft) Draft;
class Draft {
	public:
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Returns the draft angle of the face <F> using the direction <Direction>. The method is valid for : - Plane faces, - Cylindrical or conical faces, when the direction of the axis of the surface is colinear with the direction. Otherwise, the exception DomainError is raised.

	:param F:
	:type F: TopoDS_Face &
	:param Direction:
	:type Direction: gp_Dir
	:rtype: float
") Angle;
		static Standard_Real Angle (const TopoDS_Face & F,const gp_Dir & Direction);
};


%extend Draft {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo;
class Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo;
		%feature("autodoc", "	:rtype: None
") Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo;
		 Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo ();
		%feature("compactdefaultargs") Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo;
		%feature("autodoc", "	:param aMap:
	:type aMap: Draft_DataMapOfEdgeEdgeInfo &
	:rtype: None
") Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo;
		 Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo (const Draft_DataMapOfEdgeEdgeInfo & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: Draft_DataMapOfEdgeEdgeInfo &
	:rtype: None
") Initialize;
		void Initialize (const Draft_DataMapOfEdgeEdgeInfo & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Key;
		const TopoDS_Edge  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Draft_EdgeInfo
") Value;
		const Draft_EdgeInfo & Value ();
};


%extend Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Draft_DataMapIteratorOfDataMapOfFaceFaceInfo;
class Draft_DataMapIteratorOfDataMapOfFaceFaceInfo : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") Draft_DataMapIteratorOfDataMapOfFaceFaceInfo;
		%feature("autodoc", "	:rtype: None
") Draft_DataMapIteratorOfDataMapOfFaceFaceInfo;
		 Draft_DataMapIteratorOfDataMapOfFaceFaceInfo ();
		%feature("compactdefaultargs") Draft_DataMapIteratorOfDataMapOfFaceFaceInfo;
		%feature("autodoc", "	:param aMap:
	:type aMap: Draft_DataMapOfFaceFaceInfo &
	:rtype: None
") Draft_DataMapIteratorOfDataMapOfFaceFaceInfo;
		 Draft_DataMapIteratorOfDataMapOfFaceFaceInfo (const Draft_DataMapOfFaceFaceInfo & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: Draft_DataMapOfFaceFaceInfo &
	:rtype: None
") Initialize;
		void Initialize (const Draft_DataMapOfFaceFaceInfo & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Key;
		const TopoDS_Face  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Draft_FaceInfo
") Value;
		const Draft_FaceInfo & Value ();
};


%extend Draft_DataMapIteratorOfDataMapOfFaceFaceInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Draft_DataMapIteratorOfDataMapOfVertexVertexInfo;
class Draft_DataMapIteratorOfDataMapOfVertexVertexInfo : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") Draft_DataMapIteratorOfDataMapOfVertexVertexInfo;
		%feature("autodoc", "	:rtype: None
") Draft_DataMapIteratorOfDataMapOfVertexVertexInfo;
		 Draft_DataMapIteratorOfDataMapOfVertexVertexInfo ();
		%feature("compactdefaultargs") Draft_DataMapIteratorOfDataMapOfVertexVertexInfo;
		%feature("autodoc", "	:param aMap:
	:type aMap: Draft_DataMapOfVertexVertexInfo &
	:rtype: None
") Draft_DataMapIteratorOfDataMapOfVertexVertexInfo;
		 Draft_DataMapIteratorOfDataMapOfVertexVertexInfo (const Draft_DataMapOfVertexVertexInfo & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: Draft_DataMapOfVertexVertexInfo &
	:rtype: None
") Initialize;
		void Initialize (const Draft_DataMapOfVertexVertexInfo & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Key;
		const TopoDS_Vertex  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Draft_VertexInfo
") Value;
		const Draft_VertexInfo & Value ();
};


%extend Draft_DataMapIteratorOfDataMapOfVertexVertexInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo;
class Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Edge &
	:param I:
	:type I: Draft_EdgeInfo &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo;
		 Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo (const TopoDS_Edge & K,const Draft_EdgeInfo & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Key;
		TopoDS_Edge  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Draft_EdgeInfo
") Value;
		Draft_EdgeInfo & Value ();
};


%extend Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo::Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo;
class Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo();
        Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo(const Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo &aHandle);
        Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo(const Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo {
    Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo* _get_reference() {
    return (Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo*)$self->Access();
    }
};

%extend Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Draft_DataMapNodeOfDataMapOfFaceFaceInfo;
class Draft_DataMapNodeOfDataMapOfFaceFaceInfo : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Draft_DataMapNodeOfDataMapOfFaceFaceInfo;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:param I:
	:type I: Draft_FaceInfo &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Draft_DataMapNodeOfDataMapOfFaceFaceInfo;
		 Draft_DataMapNodeOfDataMapOfFaceFaceInfo (const TopoDS_Face & K,const Draft_FaceInfo & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Key;
		TopoDS_Face  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Draft_FaceInfo
") Value;
		Draft_FaceInfo & Value ();
};


%extend Draft_DataMapNodeOfDataMapOfFaceFaceInfo {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo::Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo;
class Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo();
        Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo(const Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo &aHandle);
        Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo(const Draft_DataMapNodeOfDataMapOfFaceFaceInfo *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo {
    Draft_DataMapNodeOfDataMapOfFaceFaceInfo* _get_reference() {
    return (Draft_DataMapNodeOfDataMapOfFaceFaceInfo*)$self->Access();
    }
};

%extend Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Draft_DataMapNodeOfDataMapOfFaceFaceInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Draft_DataMapNodeOfDataMapOfVertexVertexInfo;
class Draft_DataMapNodeOfDataMapOfVertexVertexInfo : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Draft_DataMapNodeOfDataMapOfVertexVertexInfo;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:param I:
	:type I: Draft_VertexInfo &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Draft_DataMapNodeOfDataMapOfVertexVertexInfo;
		 Draft_DataMapNodeOfDataMapOfVertexVertexInfo (const TopoDS_Vertex & K,const Draft_VertexInfo & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Key;
		TopoDS_Vertex  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Draft_VertexInfo
") Value;
		Draft_VertexInfo & Value ();
};


%extend Draft_DataMapNodeOfDataMapOfVertexVertexInfo {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo::Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo;
class Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo();
        Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo(const Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo &aHandle);
        Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo(const Draft_DataMapNodeOfDataMapOfVertexVertexInfo *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo {
    Draft_DataMapNodeOfDataMapOfVertexVertexInfo* _get_reference() {
    return (Draft_DataMapNodeOfDataMapOfVertexVertexInfo*)$self->Access();
    }
};

%extend Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Draft_DataMapNodeOfDataMapOfVertexVertexInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Draft_DataMapOfEdgeEdgeInfo;
class Draft_DataMapOfEdgeEdgeInfo : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Draft_DataMapOfEdgeEdgeInfo;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Draft_DataMapOfEdgeEdgeInfo;
		 Draft_DataMapOfEdgeEdgeInfo (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Draft_DataMapOfEdgeEdgeInfo &
	:rtype: Draft_DataMapOfEdgeEdgeInfo
") Assign;
		Draft_DataMapOfEdgeEdgeInfo & Assign (const Draft_DataMapOfEdgeEdgeInfo & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Draft_DataMapOfEdgeEdgeInfo &
	:rtype: Draft_DataMapOfEdgeEdgeInfo
") operator =;
		Draft_DataMapOfEdgeEdgeInfo & operator = (const Draft_DataMapOfEdgeEdgeInfo & Other);
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
	:type K: TopoDS_Edge &
	:param I:
	:type I: Draft_EdgeInfo &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Edge & K,const Draft_EdgeInfo & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Edge &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Edge & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Edge &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Edge & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Edge &
	:rtype: Draft_EdgeInfo
") Find;
		const Draft_EdgeInfo & Find (const TopoDS_Edge & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Edge &
	:rtype: Draft_EdgeInfo
") ChangeFind;
		Draft_EdgeInfo & ChangeFind (const TopoDS_Edge & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Edge &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Edge & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Edge &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Edge & K);
};


%extend Draft_DataMapOfEdgeEdgeInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Draft_DataMapOfFaceFaceInfo;
class Draft_DataMapOfFaceFaceInfo : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Draft_DataMapOfFaceFaceInfo;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Draft_DataMapOfFaceFaceInfo;
		 Draft_DataMapOfFaceFaceInfo (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Draft_DataMapOfFaceFaceInfo &
	:rtype: Draft_DataMapOfFaceFaceInfo
") Assign;
		Draft_DataMapOfFaceFaceInfo & Assign (const Draft_DataMapOfFaceFaceInfo & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Draft_DataMapOfFaceFaceInfo &
	:rtype: Draft_DataMapOfFaceFaceInfo
") operator =;
		Draft_DataMapOfFaceFaceInfo & operator = (const Draft_DataMapOfFaceFaceInfo & Other);
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
	:type K: TopoDS_Face &
	:param I:
	:type I: Draft_FaceInfo &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Face & K,const Draft_FaceInfo & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Face & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Face & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:rtype: Draft_FaceInfo
") Find;
		const Draft_FaceInfo & Find (const TopoDS_Face & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:rtype: Draft_FaceInfo
") ChangeFind;
		Draft_FaceInfo & ChangeFind (const TopoDS_Face & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Face & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Face &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Face & K);
};


%extend Draft_DataMapOfFaceFaceInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Draft_DataMapOfVertexVertexInfo;
class Draft_DataMapOfVertexVertexInfo : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Draft_DataMapOfVertexVertexInfo;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Draft_DataMapOfVertexVertexInfo;
		 Draft_DataMapOfVertexVertexInfo (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Draft_DataMapOfVertexVertexInfo &
	:rtype: Draft_DataMapOfVertexVertexInfo
") Assign;
		Draft_DataMapOfVertexVertexInfo & Assign (const Draft_DataMapOfVertexVertexInfo & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Draft_DataMapOfVertexVertexInfo &
	:rtype: Draft_DataMapOfVertexVertexInfo
") operator =;
		Draft_DataMapOfVertexVertexInfo & operator = (const Draft_DataMapOfVertexVertexInfo & Other);
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
	:type K: TopoDS_Vertex &
	:param I:
	:type I: Draft_VertexInfo &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Vertex & K,const Draft_VertexInfo & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: Draft_VertexInfo
") Find;
		const Draft_VertexInfo & Find (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: Draft_VertexInfo
") ChangeFind;
		Draft_VertexInfo & ChangeFind (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Vertex & K);
};


%extend Draft_DataMapOfVertexVertexInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Draft_EdgeInfo;
class Draft_EdgeInfo {
	public:
		%feature("compactdefaultargs") Draft_EdgeInfo;
		%feature("autodoc", "	:rtype: None
") Draft_EdgeInfo;
		 Draft_EdgeInfo ();
		%feature("compactdefaultargs") Draft_EdgeInfo;
		%feature("autodoc", "	:param HasNewGeometry:
	:type HasNewGeometry: bool
	:rtype: None
") Draft_EdgeInfo;
		 Draft_EdgeInfo (const Standard_Boolean HasNewGeometry);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const TopoDS_Face & F);
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") RootFace;
		void RootFace (const TopoDS_Face & F);
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Tangent;
		void Tangent (const gp_Pnt & P);
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent (gp_Pnt & P);
		%feature("compactdefaultargs") NewGeometry;
		%feature("autodoc", "	:rtype: bool
") NewGeometry;
		Standard_Boolean NewGeometry ();
		%feature("compactdefaultargs") SetNewGeometry;
		%feature("autodoc", "	:param NewGeom:
	:type NewGeom: bool
	:rtype: None
") SetNewGeometry;
		void SetNewGeometry (const Standard_Boolean NewGeom);
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") Geometry;
		Handle_Geom_Curve Geometry ();
		%feature("compactdefaultargs") FirstFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") FirstFace;
		const TopoDS_Face  FirstFace ();
		%feature("compactdefaultargs") SecondFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") SecondFace;
		const TopoDS_Face  SecondFace ();
		%feature("compactdefaultargs") FirstPC;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") FirstPC;
		Handle_Geom2d_Curve FirstPC ();
		%feature("compactdefaultargs") SecondPC;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") SecondPC;
		Handle_Geom2d_Curve SecondPC ();
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") ChangeGeometry;
		Handle_Geom_Curve ChangeGeometry ();
		%feature("compactdefaultargs") ChangeFirstPC;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") ChangeFirstPC;
		Handle_Geom2d_Curve ChangeFirstPC ();
		%feature("compactdefaultargs") ChangeSecondPC;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") ChangeSecondPC;
		Handle_Geom2d_Curve ChangeSecondPC ();
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") RootFace;
		const TopoDS_Face  RootFace ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:param tol:
	:type tol: float
	:rtype: None
") Tolerance;
		void Tolerance (const Standard_Real tol);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
};


%extend Draft_EdgeInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Draft_FaceInfo;
class Draft_FaceInfo {
	public:
		%feature("compactdefaultargs") Draft_FaceInfo;
		%feature("autodoc", "	:rtype: None
") Draft_FaceInfo;
		 Draft_FaceInfo ();
		%feature("compactdefaultargs") Draft_FaceInfo;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:param HasNewGeometry:
	:type HasNewGeometry: bool
	:rtype: None
") Draft_FaceInfo;
		 Draft_FaceInfo (const Handle_Geom_Surface & S,const Standard_Boolean HasNewGeometry);
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") RootFace;
		void RootFace (const TopoDS_Face & F);
		%feature("compactdefaultargs") NewGeometry;
		%feature("autodoc", "	:rtype: bool
") NewGeometry;
		Standard_Boolean NewGeometry ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const TopoDS_Face & F);
		%feature("compactdefaultargs") FirstFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") FirstFace;
		const TopoDS_Face  FirstFace ();
		%feature("compactdefaultargs") SecondFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") SecondFace;
		const TopoDS_Face  SecondFace ();
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") Geometry;
		Handle_Geom_Surface Geometry ();
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") ChangeGeometry;
		Handle_Geom_Surface ChangeGeometry ();
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") RootFace;
		const TopoDS_Face  RootFace ();
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") ChangeCurve;
		Handle_Geom_Curve ChangeCurve ();
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") Curve;
		Handle_Geom_Curve Curve ();
};


%extend Draft_FaceInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Draft_Modification;
class Draft_Modification : public BRepTools_Modification {
	public:
		%feature("compactdefaultargs") Draft_Modification;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Draft_Modification;
		 Draft_Modification (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Resets on the same shape.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Changes the basis shape and resets.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the face F and propagates the draft modification to its neighbour faces if they are tangent. If an error occurs, will return False and ProblematicShape will return the 'bad' face.

	:param F:
	:type F: TopoDS_Face &
	:param Direction:
	:type Direction: gp_Dir
	:param Angle:
	:type Angle: float
	:param NeutralPlane:
	:type NeutralPlane: gp_Pln
	:param Flag: default value is Standard_True
	:type Flag: bool
	:rtype: bool
") Add;
		Standard_Boolean Add (const TopoDS_Face & F,const gp_Dir & Direction,const Standard_Real Angle,const gp_Pln & NeutralPlane,const Standard_Boolean Flag = Standard_True);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the face F and the neighbour faces if they are tangent. It will be necessary to call this method if the method Add returns Standard_False, to unset ProblematicFace.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Remove;
		void Remove (const TopoDS_Face & F);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the draft angle modification and sets the value returned by the method IsDone. If an error occurs, IsDone will return Standard_False, and an error status will be given by the method Error, and the shape on which the problem appeared will be given by ProblematicShape

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if Perform has been succesfully called. Otherwise more information can be obtained using the methods Error() and ProblematicShape().

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: Draft_ErrorStatus
") Error;
		Draft_ErrorStatus Error ();
		%feature("compactdefaultargs") ProblematicShape;
		%feature("autodoc", "	* Returns the shape (Face, Edge or Vertex) on which an error occured.

	:rtype: TopoDS_Shape
") ProblematicShape;
		const TopoDS_Shape  ProblematicShape ();
		%feature("compactdefaultargs") ConnectedFaces;
		%feature("autodoc", "	* Returns all the faces which have been added together with the face <F>.

	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") ConnectedFaces;
		const TopTools_ListOfShape & ConnectedFaces (const TopoDS_Face & F);
		%feature("compactdefaultargs") ModifiedFaces;
		%feature("autodoc", "	* Returns all the faces on which a modification has been given.

	:rtype: TopTools_ListOfShape
") ModifiedFaces;
		const TopTools_ListOfShape & ModifiedFaces ();
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "	* Returns Standard_True if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location,<Tol> the new tolerance.<RevWires> has to be set to Standard_True when the modification reverses the normal of the surface.(the wires have to be reversed). <RevFace> has to be set to Standard_True if the orientation of the modified face changes in the shells which contain it. Here it will be set to Standard_False. //! Otherwise, returns Standard_False, and <S>, <L>, <Tol> , <RevWires> ,<RevFace> are not significant.

	:param F:
	:type F: TopoDS_Face &
	:param S:
	:type S: Handle_Geom_Surface &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool
") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "	* Returns Standard_True if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.

	:param E:
	:type E: TopoDS_Edge &
	:param C:
	:type C: Handle_Geom_Curve &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "	* Returns Standard_True if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "	* Returns Standard_True if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. //! Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant. //! <NewE> is the new edge created from <E>. <NewF> is the new face created from <F>. They may be usefull.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF:
	:type NewF: TopoDS_Face &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "	* Returns Standard_True if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:param P:
	:type P: float &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	* Returns the continuity of <NewE> between <NewF1> and <NewF2>. //! <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).

	:param E:
	:type E: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF1:
	:type NewF1: TopoDS_Face &
	:param NewF2:
	:type NewF2: TopoDS_Face &
	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);
};


%extend Draft_Modification {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Draft_Modification(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Draft_Modification::Handle_Draft_Modification %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Draft_Modification;
class Handle_Draft_Modification : public Handle_BRepTools_Modification {

    public:
        // constructors
        Handle_Draft_Modification();
        Handle_Draft_Modification(const Handle_Draft_Modification &aHandle);
        Handle_Draft_Modification(const Draft_Modification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Draft_Modification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Draft_Modification {
    Draft_Modification* _get_reference() {
    return (Draft_Modification*)$self->Access();
    }
};

%extend Handle_Draft_Modification {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Draft_Modification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Draft_VertexInfo;
class Draft_VertexInfo {
	public:
		%feature("compactdefaultargs") Draft_VertexInfo;
		%feature("autodoc", "	:rtype: None
") Draft_VertexInfo;
		 Draft_VertexInfo ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "	:rtype: gp_Pnt
") Geometry;
		const gp_Pnt  Geometry ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: float
") Parameter;
		Standard_Real Parameter (const TopoDS_Edge & E);
		%feature("compactdefaultargs") InitEdgeIterator;
		%feature("autodoc", "	:rtype: None
") InitEdgeIterator;
		void InitEdgeIterator ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "	:rtype: None
") NextEdge;
		void NextEdge ();
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "	:rtype: bool
") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "	:rtype: gp_Pnt
") ChangeGeometry;
		gp_Pnt  ChangeGeometry ();
		%feature("compactdefaultargs") ChangeParameter;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: float
") ChangeParameter;
		Standard_Real & ChangeParameter (const TopoDS_Edge & E);
};


%extend Draft_VertexInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
