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
%module (package="OCC") XCAFPrs

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


%include XCAFPrs_headers.i


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

%rename(xcafprs) XCAFPrs;
class XCAFPrs {
	public:
		%feature("compactdefaultargs") CollectStyleSettings;
		%feature("autodoc", "	* Collect styles defined for shape on label L and its components and subshapes and fills a map of shape - style correspondence The location <loc> is for internal use, it should be Null location for external call

	:param L:
	:type L: TDF_Label &
	:param loc:
	:type loc: TopLoc_Location &
	:param settings:
	:type settings: XCAFPrs_DataMapOfShapeStyle &
	:rtype: void
") CollectStyleSettings;
		static void CollectStyleSettings (const TDF_Label & L,const TopLoc_Location & loc,XCAFPrs_DataMapOfShapeStyle & settings);
		%feature("compactdefaultargs") SetViewNameMode;
		%feature("autodoc", "	* Set ViewNameMode for indicate display names or not.

	:param viewNameMode:
	:type viewNameMode: bool
	:rtype: void
") SetViewNameMode;
		static void SetViewNameMode (const Standard_Boolean viewNameMode);
		%feature("compactdefaultargs") GetViewNameMode;
		%feature("autodoc", "	:rtype: bool
") GetViewNameMode;
		static Standard_Boolean GetViewNameMode ();
};


%extend XCAFPrs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_AISObject;
class XCAFPrs_AISObject : public AIS_ColoredShape {
	public:
		%feature("compactdefaultargs") XCAFPrs_AISObject;
		%feature("autodoc", "	* Creates an object to visualise the shape label.

	:param theLabel:
	:type theLabel: TDF_Label &
	:rtype: None
") XCAFPrs_AISObject;
		 XCAFPrs_AISObject (const TDF_Label & theLabel);
};


%extend XCAFPrs_AISObject {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFPrs_AISObject(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFPrs_AISObject::Handle_XCAFPrs_AISObject %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFPrs_AISObject;
class Handle_XCAFPrs_AISObject : public Handle_AIS_ColoredShape {

    public:
        // constructors
        Handle_XCAFPrs_AISObject();
        Handle_XCAFPrs_AISObject(const Handle_XCAFPrs_AISObject &aHandle);
        Handle_XCAFPrs_AISObject(const XCAFPrs_AISObject *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFPrs_AISObject DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFPrs_AISObject {
    XCAFPrs_AISObject* _get_reference() {
    return (XCAFPrs_AISObject*)$self->Access();
    }
};

%extend Handle_XCAFPrs_AISObject {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFPrs_AISObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_DataMapIteratorOfDataMapOfShapeStyle;
class XCAFPrs_DataMapIteratorOfDataMapOfShapeStyle : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") XCAFPrs_DataMapIteratorOfDataMapOfShapeStyle;
		%feature("autodoc", "	:rtype: None
") XCAFPrs_DataMapIteratorOfDataMapOfShapeStyle;
		 XCAFPrs_DataMapIteratorOfDataMapOfShapeStyle ();
		%feature("compactdefaultargs") XCAFPrs_DataMapIteratorOfDataMapOfShapeStyle;
		%feature("autodoc", "	:param aMap:
	:type aMap: XCAFPrs_DataMapOfShapeStyle &
	:rtype: None
") XCAFPrs_DataMapIteratorOfDataMapOfShapeStyle;
		 XCAFPrs_DataMapIteratorOfDataMapOfShapeStyle (const XCAFPrs_DataMapOfShapeStyle & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: XCAFPrs_DataMapOfShapeStyle &
	:rtype: None
") Initialize;
		void Initialize (const XCAFPrs_DataMapOfShapeStyle & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: XCAFPrs_Style
") Value;
		const XCAFPrs_Style & Value ();
};


%extend XCAFPrs_DataMapIteratorOfDataMapOfShapeStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_DataMapIteratorOfDataMapOfStyleShape;
class XCAFPrs_DataMapIteratorOfDataMapOfStyleShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") XCAFPrs_DataMapIteratorOfDataMapOfStyleShape;
		%feature("autodoc", "	:rtype: None
") XCAFPrs_DataMapIteratorOfDataMapOfStyleShape;
		 XCAFPrs_DataMapIteratorOfDataMapOfStyleShape ();
		%feature("compactdefaultargs") XCAFPrs_DataMapIteratorOfDataMapOfStyleShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: XCAFPrs_DataMapOfStyleShape &
	:rtype: None
") XCAFPrs_DataMapIteratorOfDataMapOfStyleShape;
		 XCAFPrs_DataMapIteratorOfDataMapOfStyleShape (const XCAFPrs_DataMapOfStyleShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: XCAFPrs_DataMapOfStyleShape &
	:rtype: None
") Initialize;
		void Initialize (const XCAFPrs_DataMapOfStyleShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: XCAFPrs_Style
") Key;
		const XCAFPrs_Style & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend XCAFPrs_DataMapIteratorOfDataMapOfStyleShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient;
class XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient;
		%feature("autodoc", "	:rtype: None
") XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient;
		 XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient ();
		%feature("compactdefaultargs") XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient;
		%feature("autodoc", "	:param aMap:
	:type aMap: XCAFPrs_DataMapOfStyleTransient &
	:rtype: None
") XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient;
		 XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient (const XCAFPrs_DataMapOfStyleTransient & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: XCAFPrs_DataMapOfStyleTransient &
	:rtype: None
") Initialize;
		void Initialize (const XCAFPrs_DataMapOfStyleTransient & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: XCAFPrs_Style
") Key;
		const XCAFPrs_Style & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend XCAFPrs_DataMapIteratorOfDataMapOfStyleTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_DataMapNodeOfDataMapOfShapeStyle;
class XCAFPrs_DataMapNodeOfDataMapOfShapeStyle : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") XCAFPrs_DataMapNodeOfDataMapOfShapeStyle;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: XCAFPrs_Style &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") XCAFPrs_DataMapNodeOfDataMapOfShapeStyle;
		 XCAFPrs_DataMapNodeOfDataMapOfShapeStyle (const TopoDS_Shape & K,const XCAFPrs_Style & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: XCAFPrs_Style
") Value;
		XCAFPrs_Style & Value ();
};


%extend XCAFPrs_DataMapNodeOfDataMapOfShapeStyle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFPrs_DataMapNodeOfDataMapOfShapeStyle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFPrs_DataMapNodeOfDataMapOfShapeStyle::Handle_XCAFPrs_DataMapNodeOfDataMapOfShapeStyle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFPrs_DataMapNodeOfDataMapOfShapeStyle;
class Handle_XCAFPrs_DataMapNodeOfDataMapOfShapeStyle : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_XCAFPrs_DataMapNodeOfDataMapOfShapeStyle();
        Handle_XCAFPrs_DataMapNodeOfDataMapOfShapeStyle(const Handle_XCAFPrs_DataMapNodeOfDataMapOfShapeStyle &aHandle);
        Handle_XCAFPrs_DataMapNodeOfDataMapOfShapeStyle(const XCAFPrs_DataMapNodeOfDataMapOfShapeStyle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFPrs_DataMapNodeOfDataMapOfShapeStyle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFPrs_DataMapNodeOfDataMapOfShapeStyle {
    XCAFPrs_DataMapNodeOfDataMapOfShapeStyle* _get_reference() {
    return (XCAFPrs_DataMapNodeOfDataMapOfShapeStyle*)$self->Access();
    }
};

%extend Handle_XCAFPrs_DataMapNodeOfDataMapOfShapeStyle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFPrs_DataMapNodeOfDataMapOfShapeStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_DataMapNodeOfDataMapOfStyleShape;
class XCAFPrs_DataMapNodeOfDataMapOfStyleShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") XCAFPrs_DataMapNodeOfDataMapOfStyleShape;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") XCAFPrs_DataMapNodeOfDataMapOfStyleShape;
		 XCAFPrs_DataMapNodeOfDataMapOfStyleShape (const XCAFPrs_Style & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: XCAFPrs_Style
") Key;
		XCAFPrs_Style & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend XCAFPrs_DataMapNodeOfDataMapOfStyleShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleShape::Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleShape;
class Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleShape();
        Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleShape(const Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleShape &aHandle);
        Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleShape(const XCAFPrs_DataMapNodeOfDataMapOfStyleShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleShape {
    XCAFPrs_DataMapNodeOfDataMapOfStyleShape* _get_reference() {
    return (XCAFPrs_DataMapNodeOfDataMapOfStyleShape*)$self->Access();
    }
};

%extend Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFPrs_DataMapNodeOfDataMapOfStyleShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_DataMapNodeOfDataMapOfStyleTransient;
class XCAFPrs_DataMapNodeOfDataMapOfStyleTransient : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") XCAFPrs_DataMapNodeOfDataMapOfStyleTransient;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:param I:
	:type I: Handle_Standard_Transient &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") XCAFPrs_DataMapNodeOfDataMapOfStyleTransient;
		 XCAFPrs_DataMapNodeOfDataMapOfStyleTransient (const XCAFPrs_Style & K,const Handle_Standard_Transient & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: XCAFPrs_Style
") Key;
		XCAFPrs_Style & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
};


%extend XCAFPrs_DataMapNodeOfDataMapOfStyleTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleTransient::Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleTransient;
class Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleTransient : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleTransient();
        Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleTransient(const Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleTransient &aHandle);
        Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleTransient(const XCAFPrs_DataMapNodeOfDataMapOfStyleTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleTransient {
    XCAFPrs_DataMapNodeOfDataMapOfStyleTransient* _get_reference() {
    return (XCAFPrs_DataMapNodeOfDataMapOfStyleTransient*)$self->Access();
    }
};

%extend Handle_XCAFPrs_DataMapNodeOfDataMapOfStyleTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFPrs_DataMapNodeOfDataMapOfStyleTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_DataMapOfShapeStyle;
class XCAFPrs_DataMapOfShapeStyle : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") XCAFPrs_DataMapOfShapeStyle;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") XCAFPrs_DataMapOfShapeStyle;
		 XCAFPrs_DataMapOfShapeStyle (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: XCAFPrs_DataMapOfShapeStyle &
	:rtype: XCAFPrs_DataMapOfShapeStyle
") Assign;
		XCAFPrs_DataMapOfShapeStyle & Assign (const XCAFPrs_DataMapOfShapeStyle & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: XCAFPrs_DataMapOfShapeStyle &
	:rtype: XCAFPrs_DataMapOfShapeStyle
") operator =;
		XCAFPrs_DataMapOfShapeStyle & operator = (const XCAFPrs_DataMapOfShapeStyle & Other);
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
	:type I: XCAFPrs_Style &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const XCAFPrs_Style & I);
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
	:rtype: XCAFPrs_Style
") Find;
		const XCAFPrs_Style & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: XCAFPrs_Style
") ChangeFind;
		XCAFPrs_Style & ChangeFind (const TopoDS_Shape & K);
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


%extend XCAFPrs_DataMapOfShapeStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_DataMapOfStyleShape;
class XCAFPrs_DataMapOfStyleShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") XCAFPrs_DataMapOfStyleShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") XCAFPrs_DataMapOfStyleShape;
		 XCAFPrs_DataMapOfStyleShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: XCAFPrs_DataMapOfStyleShape &
	:rtype: XCAFPrs_DataMapOfStyleShape
") Assign;
		XCAFPrs_DataMapOfStyleShape & Assign (const XCAFPrs_DataMapOfStyleShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: XCAFPrs_DataMapOfStyleShape &
	:rtype: XCAFPrs_DataMapOfStyleShape
") operator =;
		XCAFPrs_DataMapOfStyleShape & operator = (const XCAFPrs_DataMapOfStyleShape & Other);
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
	:type K: XCAFPrs_Style &
	:param I:
	:type I: TopoDS_Shape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const XCAFPrs_Style & K,const TopoDS_Shape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const XCAFPrs_Style & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const XCAFPrs_Style & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (const XCAFPrs_Style & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:rtype: TopoDS_Shape
") ChangeFind;
		TopoDS_Shape  ChangeFind (const XCAFPrs_Style & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const XCAFPrs_Style & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const XCAFPrs_Style & K);
};


%extend XCAFPrs_DataMapOfStyleShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_DataMapOfStyleTransient;
class XCAFPrs_DataMapOfStyleTransient : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") XCAFPrs_DataMapOfStyleTransient;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") XCAFPrs_DataMapOfStyleTransient;
		 XCAFPrs_DataMapOfStyleTransient (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: XCAFPrs_DataMapOfStyleTransient &
	:rtype: XCAFPrs_DataMapOfStyleTransient
") Assign;
		XCAFPrs_DataMapOfStyleTransient & Assign (const XCAFPrs_DataMapOfStyleTransient & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: XCAFPrs_DataMapOfStyleTransient &
	:rtype: XCAFPrs_DataMapOfStyleTransient
") operator =;
		XCAFPrs_DataMapOfStyleTransient & operator = (const XCAFPrs_DataMapOfStyleTransient & Other);
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
	:type K: XCAFPrs_Style &
	:param I:
	:type I: Handle_Standard_Transient &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const XCAFPrs_Style & K,const Handle_Standard_Transient & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const XCAFPrs_Style & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const XCAFPrs_Style & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:rtype: Handle_Standard_Transient
") Find;
		Handle_Standard_Transient Find (const XCAFPrs_Style & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:rtype: Handle_Standard_Transient
") ChangeFind;
		Handle_Standard_Transient ChangeFind (const XCAFPrs_Style & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const XCAFPrs_Style & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: XCAFPrs_Style &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const XCAFPrs_Style & K);
};


%extend XCAFPrs_DataMapOfStyleTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_Driver;
class XCAFPrs_Driver : public TPrsStd_Driver {
	public:
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	:param L:
	:type L: TDF_Label &
	:param ais:
	:type ais: Handle_AIS_InteractiveObject &
	:rtype: bool
") Update;
		virtual Standard_Boolean Update (const TDF_Label & L,Handle_AIS_InteractiveObject & ais);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* returns GUID of the driver

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
};


%extend XCAFPrs_Driver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFPrs_Driver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFPrs_Driver::Handle_XCAFPrs_Driver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFPrs_Driver;
class Handle_XCAFPrs_Driver : public Handle_TPrsStd_Driver {

    public:
        // constructors
        Handle_XCAFPrs_Driver();
        Handle_XCAFPrs_Driver(const Handle_XCAFPrs_Driver &aHandle);
        Handle_XCAFPrs_Driver(const XCAFPrs_Driver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFPrs_Driver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFPrs_Driver {
    XCAFPrs_Driver* _get_reference() {
    return (XCAFPrs_Driver*)$self->Access();
    }
};

%extend Handle_XCAFPrs_Driver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFPrs_Driver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFPrs_Style;
class XCAFPrs_Style {
	public:
		%feature("compactdefaultargs") XCAFPrs_Style;
		%feature("autodoc", "	:rtype: None
") XCAFPrs_Style;
		 XCAFPrs_Style ();
		%feature("compactdefaultargs") IsSetColorSurf;
		%feature("autodoc", "	:rtype: bool
") IsSetColorSurf;
		Standard_Boolean IsSetColorSurf ();
		%feature("compactdefaultargs") GetColorSurf;
		%feature("autodoc", "	:rtype: Quantity_Color
") GetColorSurf;
		Quantity_Color GetColorSurf ();
		%feature("compactdefaultargs") SetColorSurf;
		%feature("autodoc", "	:param col:
	:type col: Quantity_Color &
	:rtype: None
") SetColorSurf;
		void SetColorSurf (const Quantity_Color & col);
		%feature("compactdefaultargs") UnSetColorSurf;
		%feature("autodoc", "	* Manage surface color setting

	:rtype: None
") UnSetColorSurf;
		void UnSetColorSurf ();
		%feature("compactdefaultargs") IsSetColorCurv;
		%feature("autodoc", "	:rtype: bool
") IsSetColorCurv;
		Standard_Boolean IsSetColorCurv ();
		%feature("compactdefaultargs") GetColorCurv;
		%feature("autodoc", "	:rtype: Quantity_Color
") GetColorCurv;
		Quantity_Color GetColorCurv ();
		%feature("compactdefaultargs") SetColorCurv;
		%feature("autodoc", "	:param col:
	:type col: Quantity_Color &
	:rtype: None
") SetColorCurv;
		void SetColorCurv (const Quantity_Color & col);
		%feature("compactdefaultargs") UnSetColorCurv;
		%feature("autodoc", "	* Manage curve color setting

	:rtype: None
") UnSetColorCurv;
		void UnSetColorCurv ();
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "	:param visibility:
	:type visibility: bool
	:rtype: None
") SetVisibility;
		void SetVisibility (const Standard_Boolean visibility);
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "	* Manage visibility Note: Setting visibility to False makes colors undefined This is necessary for HashCode

	:rtype: bool
") IsVisible;
		Standard_Boolean IsVisible ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returs True if styles are the same Methods for using Style as key in maps

	:param other:
	:type other: XCAFPrs_Style &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const XCAFPrs_Style & other);

        %extend{
            bool __eq_wrapper__(const XCAFPrs_Style  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns a HasCode value for the Key <K> in the range 0..Upper.

	:param S:
	:type S: XCAFPrs_Style &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const XCAFPrs_Style & S,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True when the two keys are the same. Two same keys must have the same hashcode, the contrary is not necessary.

	:param S1:
	:type S1: XCAFPrs_Style &
	:param S2:
	:type S2: XCAFPrs_Style &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const XCAFPrs_Style & S1,const XCAFPrs_Style & S2);
};


%extend XCAFPrs_Style {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
