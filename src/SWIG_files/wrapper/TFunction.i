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
%module (package="OCC") TFunction

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


%include TFunction_headers.i


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
enum TFunction_ExecutionStatus {
	TFunction_ES_WrongDefinition = 0,
	TFunction_ES_NotExecuted = 1,
	TFunction_ES_Executing = 2,
	TFunction_ES_Succeeded = 3,
	TFunction_ES_Failed = 4,
};

/* end public enums declaration */

%nodefaultctor TFunction_Array1OfDataMapOfGUIDDriver;
class TFunction_Array1OfDataMapOfGUIDDriver {
	public:
		%feature("compactdefaultargs") TFunction_Array1OfDataMapOfGUIDDriver;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TFunction_Array1OfDataMapOfGUIDDriver;
		 TFunction_Array1OfDataMapOfGUIDDriver (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TFunction_Array1OfDataMapOfGUIDDriver;
		%feature("autodoc", "	:param Item:
	:type Item: TFunction_DataMapOfGUIDDriver &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TFunction_Array1OfDataMapOfGUIDDriver;
		 TFunction_Array1OfDataMapOfGUIDDriver (const TFunction_DataMapOfGUIDDriver & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TFunction_DataMapOfGUIDDriver &
	:rtype: None
") Init;
		void Init (const TFunction_DataMapOfGUIDDriver & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TFunction_Array1OfDataMapOfGUIDDriver &
	:rtype: TFunction_Array1OfDataMapOfGUIDDriver
") Assign;
		const TFunction_Array1OfDataMapOfGUIDDriver & Assign (const TFunction_Array1OfDataMapOfGUIDDriver & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TFunction_Array1OfDataMapOfGUIDDriver &
	:rtype: TFunction_Array1OfDataMapOfGUIDDriver
") operator =;
		const TFunction_Array1OfDataMapOfGUIDDriver & operator = (const TFunction_Array1OfDataMapOfGUIDDriver & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: TFunction_DataMapOfGUIDDriver &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TFunction_DataMapOfGUIDDriver & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TFunction_DataMapOfGUIDDriver
") Value;
		const TFunction_DataMapOfGUIDDriver & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TFunction_DataMapOfGUIDDriver
") ChangeValue;
		TFunction_DataMapOfGUIDDriver & ChangeValue (const Standard_Integer Index);
};


%extend TFunction_Array1OfDataMapOfGUIDDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_DataMapIteratorOfDataMapOfGUIDDriver;
class TFunction_DataMapIteratorOfDataMapOfGUIDDriver : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TFunction_DataMapIteratorOfDataMapOfGUIDDriver;
		%feature("autodoc", "	:rtype: None
") TFunction_DataMapIteratorOfDataMapOfGUIDDriver;
		 TFunction_DataMapIteratorOfDataMapOfGUIDDriver ();
		%feature("compactdefaultargs") TFunction_DataMapIteratorOfDataMapOfGUIDDriver;
		%feature("autodoc", "	:param aMap:
	:type aMap: TFunction_DataMapOfGUIDDriver &
	:rtype: None
") TFunction_DataMapIteratorOfDataMapOfGUIDDriver;
		 TFunction_DataMapIteratorOfDataMapOfGUIDDriver (const TFunction_DataMapOfGUIDDriver & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TFunction_DataMapOfGUIDDriver &
	:rtype: None
") Initialize;
		void Initialize (const TFunction_DataMapOfGUIDDriver & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Standard_GUID
") Key;
		const Standard_GUID & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TFunction_Driver
") Value;
		Handle_TFunction_Driver Value ();
};


%extend TFunction_DataMapIteratorOfDataMapOfGUIDDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_DataMapIteratorOfDataMapOfLabelListOfLabel;
class TFunction_DataMapIteratorOfDataMapOfLabelListOfLabel : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TFunction_DataMapIteratorOfDataMapOfLabelListOfLabel;
		%feature("autodoc", "	:rtype: None
") TFunction_DataMapIteratorOfDataMapOfLabelListOfLabel;
		 TFunction_DataMapIteratorOfDataMapOfLabelListOfLabel ();
		%feature("compactdefaultargs") TFunction_DataMapIteratorOfDataMapOfLabelListOfLabel;
		%feature("autodoc", "	:param aMap:
	:type aMap: TFunction_DataMapOfLabelListOfLabel &
	:rtype: None
") TFunction_DataMapIteratorOfDataMapOfLabelListOfLabel;
		 TFunction_DataMapIteratorOfDataMapOfLabelListOfLabel (const TFunction_DataMapOfLabelListOfLabel & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TFunction_DataMapOfLabelListOfLabel &
	:rtype: None
") Initialize;
		void Initialize (const TFunction_DataMapOfLabelListOfLabel & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TDF_Label
") Key;
		const TDF_Label & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TDF_LabelList
") Value;
		const TDF_LabelList & Value ();
};


%extend TFunction_DataMapIteratorOfDataMapOfLabelListOfLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_DataMapNodeOfDataMapOfGUIDDriver;
class TFunction_DataMapNodeOfDataMapOfGUIDDriver : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TFunction_DataMapNodeOfDataMapOfGUIDDriver;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:param I:
	:type I: Handle_TFunction_Driver &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TFunction_DataMapNodeOfDataMapOfGUIDDriver;
		 TFunction_DataMapNodeOfDataMapOfGUIDDriver (const Standard_GUID & K,const Handle_TFunction_Driver & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Standard_GUID
") Key;
		Standard_GUID & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TFunction_Driver
") Value;
		Handle_TFunction_Driver Value ();
};


%extend TFunction_DataMapNodeOfDataMapOfGUIDDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TFunction_DataMapNodeOfDataMapOfGUIDDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TFunction_DataMapNodeOfDataMapOfGUIDDriver::Handle_TFunction_DataMapNodeOfDataMapOfGUIDDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TFunction_DataMapNodeOfDataMapOfGUIDDriver;
class Handle_TFunction_DataMapNodeOfDataMapOfGUIDDriver : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TFunction_DataMapNodeOfDataMapOfGUIDDriver();
        Handle_TFunction_DataMapNodeOfDataMapOfGUIDDriver(const Handle_TFunction_DataMapNodeOfDataMapOfGUIDDriver &aHandle);
        Handle_TFunction_DataMapNodeOfDataMapOfGUIDDriver(const TFunction_DataMapNodeOfDataMapOfGUIDDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TFunction_DataMapNodeOfDataMapOfGUIDDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TFunction_DataMapNodeOfDataMapOfGUIDDriver {
    TFunction_DataMapNodeOfDataMapOfGUIDDriver* _get_reference() {
    return (TFunction_DataMapNodeOfDataMapOfGUIDDriver*)$self->Access();
    }
};

%extend Handle_TFunction_DataMapNodeOfDataMapOfGUIDDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TFunction_DataMapNodeOfDataMapOfGUIDDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_DataMapNodeOfDataMapOfLabelListOfLabel;
class TFunction_DataMapNodeOfDataMapOfLabelListOfLabel : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TFunction_DataMapNodeOfDataMapOfLabelListOfLabel;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:param I:
	:type I: TDF_LabelList &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TFunction_DataMapNodeOfDataMapOfLabelListOfLabel;
		 TFunction_DataMapNodeOfDataMapOfLabelListOfLabel (const TDF_Label & K,const TDF_LabelList & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TDF_Label
") Key;
		TDF_Label & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TDF_LabelList
") Value;
		TDF_LabelList & Value ();
};


%extend TFunction_DataMapNodeOfDataMapOfLabelListOfLabel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TFunction_DataMapNodeOfDataMapOfLabelListOfLabel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TFunction_DataMapNodeOfDataMapOfLabelListOfLabel::Handle_TFunction_DataMapNodeOfDataMapOfLabelListOfLabel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TFunction_DataMapNodeOfDataMapOfLabelListOfLabel;
class Handle_TFunction_DataMapNodeOfDataMapOfLabelListOfLabel : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TFunction_DataMapNodeOfDataMapOfLabelListOfLabel();
        Handle_TFunction_DataMapNodeOfDataMapOfLabelListOfLabel(const Handle_TFunction_DataMapNodeOfDataMapOfLabelListOfLabel &aHandle);
        Handle_TFunction_DataMapNodeOfDataMapOfLabelListOfLabel(const TFunction_DataMapNodeOfDataMapOfLabelListOfLabel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TFunction_DataMapNodeOfDataMapOfLabelListOfLabel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TFunction_DataMapNodeOfDataMapOfLabelListOfLabel {
    TFunction_DataMapNodeOfDataMapOfLabelListOfLabel* _get_reference() {
    return (TFunction_DataMapNodeOfDataMapOfLabelListOfLabel*)$self->Access();
    }
};

%extend Handle_TFunction_DataMapNodeOfDataMapOfLabelListOfLabel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TFunction_DataMapNodeOfDataMapOfLabelListOfLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_DataMapOfGUIDDriver;
class TFunction_DataMapOfGUIDDriver : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TFunction_DataMapOfGUIDDriver;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TFunction_DataMapOfGUIDDriver;
		 TFunction_DataMapOfGUIDDriver (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TFunction_DataMapOfGUIDDriver &
	:rtype: TFunction_DataMapOfGUIDDriver
") Assign;
		TFunction_DataMapOfGUIDDriver & Assign (const TFunction_DataMapOfGUIDDriver & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TFunction_DataMapOfGUIDDriver &
	:rtype: TFunction_DataMapOfGUIDDriver
") operator =;
		TFunction_DataMapOfGUIDDriver & operator = (const TFunction_DataMapOfGUIDDriver & Other);
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
	:type K: Standard_GUID &
	:param I:
	:type I: Handle_TFunction_Driver &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_GUID & K,const Handle_TFunction_Driver & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_GUID & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_GUID & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: Handle_TFunction_Driver
") Find;
		Handle_TFunction_Driver Find (const Standard_GUID & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: Handle_TFunction_Driver
") ChangeFind;
		Handle_TFunction_Driver ChangeFind (const Standard_GUID & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_GUID & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Standard_GUID &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_GUID & K);
};


%extend TFunction_DataMapOfGUIDDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_DataMapOfLabelListOfLabel;
class TFunction_DataMapOfLabelListOfLabel : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TFunction_DataMapOfLabelListOfLabel;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TFunction_DataMapOfLabelListOfLabel;
		 TFunction_DataMapOfLabelListOfLabel (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TFunction_DataMapOfLabelListOfLabel &
	:rtype: TFunction_DataMapOfLabelListOfLabel
") Assign;
		TFunction_DataMapOfLabelListOfLabel & Assign (const TFunction_DataMapOfLabelListOfLabel & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TFunction_DataMapOfLabelListOfLabel &
	:rtype: TFunction_DataMapOfLabelListOfLabel
") operator =;
		TFunction_DataMapOfLabelListOfLabel & operator = (const TFunction_DataMapOfLabelListOfLabel & Other);
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
	:type K: TDF_Label &
	:param I:
	:type I: TDF_LabelList &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TDF_Label & K,const TDF_LabelList & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TDF_Label & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TDF_Label & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: TDF_LabelList
") Find;
		const TDF_LabelList & Find (const TDF_Label & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: TDF_LabelList
") ChangeFind;
		TDF_LabelList & ChangeFind (const TDF_Label & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TDF_Label & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TDF_Label & K);
};


%extend TFunction_DataMapOfLabelListOfLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_DoubleMapIteratorOfDoubleMapOfIntegerLabel;
class TFunction_DoubleMapIteratorOfDoubleMapOfIntegerLabel : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TFunction_DoubleMapIteratorOfDoubleMapOfIntegerLabel;
		%feature("autodoc", "	:rtype: None
") TFunction_DoubleMapIteratorOfDoubleMapOfIntegerLabel;
		 TFunction_DoubleMapIteratorOfDoubleMapOfIntegerLabel ();
		%feature("compactdefaultargs") TFunction_DoubleMapIteratorOfDoubleMapOfIntegerLabel;
		%feature("autodoc", "	:param aMap:
	:type aMap: TFunction_DoubleMapOfIntegerLabel &
	:rtype: None
") TFunction_DoubleMapIteratorOfDoubleMapOfIntegerLabel;
		 TFunction_DoubleMapIteratorOfDoubleMapOfIntegerLabel (const TFunction_DoubleMapOfIntegerLabel & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TFunction_DoubleMapOfIntegerLabel &
	:rtype: None
") Initialize;
		void Initialize (const TFunction_DoubleMapOfIntegerLabel & aMap);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: int
") Key1;
		const Standard_Integer & Key1 ();
		%feature("compactdefaultargs") Key2;
		%feature("autodoc", "	:rtype: TDF_Label
") Key2;
		const TDF_Label & Key2 ();
};


%extend TFunction_DoubleMapIteratorOfDoubleMapOfIntegerLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel;
class TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel;
		%feature("autodoc", "	:param K1:
	:type K1: int &
	:param K2:
	:type K2: TDF_Label &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel;
		 TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel (const Standard_Integer & K1,const TDF_Label & K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey1() {
                return (Standard_Integer) $self->Key1();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey1(Standard_Integer value ) {
                $self->Key1()=value;
                }
            };
            		%feature("compactdefaultargs") Key2;
		%feature("autodoc", "	:rtype: TDF_Label
") Key2;
		TDF_Label & Key2 ();
		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel::Handle_TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel;
class Handle_TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel();
        Handle_TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel(const Handle_TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel &aHandle);
        Handle_TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel(const TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel {
    TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel* _get_reference() {
    return (TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel*)$self->Access();
    }
};

%extend Handle_TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TFunction_DoubleMapNodeOfDoubleMapOfIntegerLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_DoubleMapOfIntegerLabel;
class TFunction_DoubleMapOfIntegerLabel : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TFunction_DoubleMapOfIntegerLabel;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TFunction_DoubleMapOfIntegerLabel;
		 TFunction_DoubleMapOfIntegerLabel (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TFunction_DoubleMapOfIntegerLabel &
	:rtype: TFunction_DoubleMapOfIntegerLabel
") Assign;
		TFunction_DoubleMapOfIntegerLabel & Assign (const TFunction_DoubleMapOfIntegerLabel & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TFunction_DoubleMapOfIntegerLabel &
	:rtype: TFunction_DoubleMapOfIntegerLabel
") operator =;
		TFunction_DoubleMapOfIntegerLabel & operator = (const TFunction_DoubleMapOfIntegerLabel & Other);
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
		%feature("autodoc", "	:param K1:
	:type K1: int &
	:param K2:
	:type K2: TDF_Label &
	:rtype: None
") Bind;
		void Bind (const Standard_Integer & K1,const TDF_Label & K2);
		%feature("compactdefaultargs") AreBound;
		%feature("autodoc", "	:param K1:
	:type K1: int &
	:param K2:
	:type K2: TDF_Label &
	:rtype: bool
") AreBound;
		Standard_Boolean AreBound (const Standard_Integer & K1,const TDF_Label & K2);
		%feature("compactdefaultargs") IsBound1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound1;
		Standard_Boolean IsBound1 (const Standard_Integer & K);
		%feature("compactdefaultargs") IsBound2;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: bool
") IsBound2;
		Standard_Boolean IsBound2 (const TDF_Label & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TDF_Label
") Find1;
		const TDF_Label & Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") Find2;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: int
") Find2;
		const Standard_Integer & Find2 (const TDF_Label & K);
		%feature("compactdefaultargs") UnBind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind1;
		Standard_Boolean UnBind1 (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind2;
		%feature("autodoc", "	:param K:
	:type K: TDF_Label &
	:rtype: bool
") UnBind2;
		Standard_Boolean UnBind2 (const TDF_Label & K);
};


%extend TFunction_DoubleMapOfIntegerLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_Driver;
class TFunction_Driver : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the label L for this function prior to its execution.

	:param L:
	:type L: TDF_Label &
	:rtype: None
") Init;
		void Init (const TDF_Label & L);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns the label of the driver for this function.

	:rtype: TDF_Label
") Label;
		TDF_Label Label ();
		%feature("compactdefaultargs") Validate;
		%feature("autodoc", "	* Validates labels of a function in <log>. This function is the one initialized in this function driver. Warning In regeneration mode, the solver must call this method even if the function is not executed. execution of function =====================

	:param log:
	:type log: TFunction_Logbook &
	:rtype: void
") Validate;
		virtual void Validate (TFunction_Logbook & log);
		%feature("compactdefaultargs") MustExecute;
		%feature("autodoc", "	* Analyzes the labels in the logbook log. Returns true if attributes have been modified. If the function label itself has been modified, the function must be executed.

	:param log:
	:type log: TFunction_Logbook &
	:rtype: bool
") MustExecute;
		virtual Standard_Boolean MustExecute (const TFunction_Logbook & log);
		%feature("compactdefaultargs") Execute;
		%feature("autodoc", "	* Executes the function in this function driver and puts the impacted labels in the logbook log. arguments & results of functions ================================

	:param log:
	:type log: TFunction_Logbook &
	:rtype: int
") Execute;
		virtual Standard_Integer Execute (TFunction_Logbook & log);
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	* The method fills-in the list by labels, where the arguments of the function are located.

	:param args:
	:type args: TDF_LabelList &
	:rtype: void
") Arguments;
		virtual void Arguments (TDF_LabelList & args);
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "	* The method fills-in the list by labels, where the results of the function are located.

	:param res:
	:type res: TDF_LabelList &
	:rtype: void
") Results;
		virtual void Results (TDF_LabelList & res);
};


%extend TFunction_Driver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TFunction_Driver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TFunction_Driver::Handle_TFunction_Driver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TFunction_Driver;
class Handle_TFunction_Driver : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TFunction_Driver();
        Handle_TFunction_Driver(const Handle_TFunction_Driver &aHandle);
        Handle_TFunction_Driver(const TFunction_Driver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TFunction_Driver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TFunction_Driver {
    TFunction_Driver* _get_reference() {
    return (TFunction_Driver*)$self->Access();
    }
};

%extend Handle_TFunction_Driver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TFunction_Driver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_DriverTable;
class TFunction_DriverTable : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the driver table. If a driver does not exist, creates it.

	:rtype: Handle_TFunction_DriverTable
") Get;
		static Handle_TFunction_DriverTable Get ();
		%feature("compactdefaultargs") TFunction_DriverTable;
		%feature("autodoc", "	* Default constructor

	:rtype: None
") TFunction_DriverTable;
		 TFunction_DriverTable ();
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "	* Returns true if the driver has been added successfully to the driver table.

	:param guid:
	:type guid: Standard_GUID &
	:param driver:
	:type driver: Handle_TFunction_Driver &
	:param thread: default value is 0
	:type thread: int
	:rtype: bool
") AddDriver;
		Standard_Boolean AddDriver (const Standard_GUID & guid,const Handle_TFunction_Driver & driver,const Standard_Integer thread = 0);
		%feature("compactdefaultargs") HasDriver;
		%feature("autodoc", "	* Returns true if the driver exists in the driver table.

	:param guid:
	:type guid: Standard_GUID &
	:param thread: default value is 0
	:type thread: int
	:rtype: bool
") HasDriver;
		Standard_Boolean HasDriver (const Standard_GUID & guid,const Standard_Integer thread = 0);
		%feature("compactdefaultargs") FindDriver;
		%feature("autodoc", "	* Returns true if the driver was found.

	:param guid:
	:type guid: Standard_GUID &
	:param driver:
	:type driver: Handle_TFunction_Driver &
	:param thread: default value is 0
	:type thread: int
	:rtype: bool
") FindDriver;
		Standard_Boolean FindDriver (const Standard_GUID & guid,Handle_TFunction_Driver & driver,const Standard_Integer thread = 0);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") RemoveDriver;
		%feature("autodoc", "	* Removes a driver with the given GUID. Returns true if the driver has been removed successfully.

	:param guid:
	:type guid: Standard_GUID &
	:param thread: default value is 0
	:type thread: int
	:rtype: bool
") RemoveDriver;
		Standard_Boolean RemoveDriver (const Standard_GUID & guid,const Standard_Integer thread = 0);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Removes all drivers. Returns true if the driver has been removed successfully.

	:rtype: None
") Clear;
		void Clear ();
};


%extend TFunction_DriverTable {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TFunction_DriverTable(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TFunction_DriverTable::Handle_TFunction_DriverTable %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TFunction_DriverTable;
class Handle_TFunction_DriverTable : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TFunction_DriverTable();
        Handle_TFunction_DriverTable(const Handle_TFunction_DriverTable &aHandle);
        Handle_TFunction_DriverTable(const TFunction_DriverTable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TFunction_DriverTable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TFunction_DriverTable {
    TFunction_DriverTable* _get_reference() {
    return (TFunction_DriverTable*)$self->Access();
    }
};

%extend Handle_TFunction_DriverTable {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TFunction_DriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_Function;
class TFunction_Function : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Static methods: ============== Finds or Creates a function attribute on the label <L>. Returns the function attribute.

	:param L:
	:type L: TDF_Label &
	:rtype: Handle_TFunction_Function
") Set;
		static Handle_TFunction_Function Set (const TDF_Label & L);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Finds or Creates a function attribute on the label <L>. Sets a driver ID to the function. Returns the function attribute.

	:param L:
	:type L: TDF_Label &
	:param DriverID:
	:type DriverID: Standard_GUID &
	:rtype: Handle_TFunction_Function
") Set;
		static Handle_TFunction_Function Set (const TDF_Label & L,const Standard_GUID & DriverID);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Returns the GUID for functions. Returns a function found on the label. Instance methods: ================

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") TFunction_Function;
		%feature("autodoc", "	:rtype: None
") TFunction_Function;
		 TFunction_Function ();
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "	* Returns the GUID for this function's driver.

	:rtype: Standard_GUID
") GetDriverGUID;
		const Standard_GUID & GetDriverGUID ();
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "	* Sets the driver for this function as that indentified by the GUID guid.

	:param guid:
	:type guid: Standard_GUID &
	:rtype: None
") SetDriverGUID;
		void SetDriverGUID (const Standard_GUID & guid);
		%feature("compactdefaultargs") Failed;
		%feature("autodoc", "	* Returns true if the execution failed

	:rtype: bool
") Failed;
		Standard_Boolean Failed ();
		%feature("compactdefaultargs") SetFailure;
		%feature("autodoc", "	* Sets the failed index.

	:param mode: default value is 0
	:type mode: int
	:rtype: None
") SetFailure;
		void SetFailure (const Standard_Integer mode = 0);
		%feature("compactdefaultargs") GetFailure;
		%feature("autodoc", "	* Returns an index of failure if the execution of this function failed. If this integer value is 0, no failure has occurred. Implementation of Attribute methods: ===================================

	:rtype: int
") GetFailure;
		Standard_Integer GetFailure ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: void
") Restore;
		virtual void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param aDataSet:
	:type aDataSet: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & aDataSet);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TFunction_Function {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TFunction_Function(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TFunction_Function::Handle_TFunction_Function %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TFunction_Function;
class Handle_TFunction_Function : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TFunction_Function();
        Handle_TFunction_Function(const Handle_TFunction_Function &aHandle);
        Handle_TFunction_Function(const TFunction_Function *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TFunction_Function DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TFunction_Function {
    TFunction_Function* _get_reference() {
    return (TFunction_Function*)$self->Access();
    }
};

%extend Handle_TFunction_Function {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TFunction_Function {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_GraphNode;
class TFunction_GraphNode : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Static methods ============== Finds or Creates a graph node attribute at the label <L>. Returns the attribute.

	:param L:
	:type L: TDF_Label &
	:rtype: Handle_TFunction_GraphNode
") Set;
		static Handle_TFunction_GraphNode Set (const TDF_Label & L);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Returns the GUID for GraphNode attribute. Instant methods =============== Constructor (empty).

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") TFunction_GraphNode;
		%feature("autodoc", "	:rtype: None
") TFunction_GraphNode;
		 TFunction_GraphNode ();
		%feature("compactdefaultargs") AddPrevious;
		%feature("autodoc", "	* Defines a reference to the function as a previous one.

	:param funcID:
	:type funcID: int
	:rtype: bool
") AddPrevious;
		Standard_Boolean AddPrevious (const Standard_Integer funcID);
		%feature("compactdefaultargs") AddPrevious;
		%feature("autodoc", "	* Defines a reference to the function as a previous one.

	:param func:
	:type func: TDF_Label &
	:rtype: bool
") AddPrevious;
		Standard_Boolean AddPrevious (const TDF_Label & func);
		%feature("compactdefaultargs") RemovePrevious;
		%feature("autodoc", "	* Removes a reference to the function as a previous one.

	:param funcID:
	:type funcID: int
	:rtype: bool
") RemovePrevious;
		Standard_Boolean RemovePrevious (const Standard_Integer funcID);
		%feature("compactdefaultargs") RemovePrevious;
		%feature("autodoc", "	* Removes a reference to the function as a previous one.

	:param func:
	:type func: TDF_Label &
	:rtype: bool
") RemovePrevious;
		Standard_Boolean RemovePrevious (const TDF_Label & func);
		%feature("compactdefaultargs") GetPrevious;
		%feature("autodoc", "	* Returns a map of previous functions.

	:rtype: TColStd_MapOfInteger
") GetPrevious;
		const TColStd_MapOfInteger & GetPrevious ();
		%feature("compactdefaultargs") RemoveAllPrevious;
		%feature("autodoc", "	* Clears a map of previous functions.

	:rtype: None
") RemoveAllPrevious;
		void RemoveAllPrevious ();
		%feature("compactdefaultargs") AddNext;
		%feature("autodoc", "	* Defines a reference to the function as a next one.

	:param funcID:
	:type funcID: int
	:rtype: bool
") AddNext;
		Standard_Boolean AddNext (const Standard_Integer funcID);
		%feature("compactdefaultargs") AddNext;
		%feature("autodoc", "	* Defines a reference to the function as a next one.

	:param func:
	:type func: TDF_Label &
	:rtype: bool
") AddNext;
		Standard_Boolean AddNext (const TDF_Label & func);
		%feature("compactdefaultargs") RemoveNext;
		%feature("autodoc", "	* Removes a reference to the function as a next one.

	:param funcID:
	:type funcID: int
	:rtype: bool
") RemoveNext;
		Standard_Boolean RemoveNext (const Standard_Integer funcID);
		%feature("compactdefaultargs") RemoveNext;
		%feature("autodoc", "	* Removes a reference to the function as a next one.

	:param func:
	:type func: TDF_Label &
	:rtype: bool
") RemoveNext;
		Standard_Boolean RemoveNext (const TDF_Label & func);
		%feature("compactdefaultargs") GetNext;
		%feature("autodoc", "	* Returns a map of next functions.

	:rtype: TColStd_MapOfInteger
") GetNext;
		const TColStd_MapOfInteger & GetNext ();
		%feature("compactdefaultargs") RemoveAllNext;
		%feature("autodoc", "	* Clears a map of next functions.

	:rtype: None
") RemoveAllNext;
		void RemoveAllNext ();
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "	* Returns the execution status of the function.

	:rtype: TFunction_ExecutionStatus
") GetStatus;
		TFunction_ExecutionStatus GetStatus ();
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Defines an execution status for a function. Implementation of Attribute methods ===================================

	:param status:
	:type status: TFunction_ExecutionStatus
	:rtype: None
") SetStatus;
		void SetStatus (const TFunction_ExecutionStatus status);
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: void
") Restore;
		virtual void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param aDataSet:
	:type aDataSet: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & aDataSet);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TFunction_GraphNode {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TFunction_GraphNode(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TFunction_GraphNode::Handle_TFunction_GraphNode %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TFunction_GraphNode;
class Handle_TFunction_GraphNode : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TFunction_GraphNode();
        Handle_TFunction_GraphNode(const Handle_TFunction_GraphNode &aHandle);
        Handle_TFunction_GraphNode(const TFunction_GraphNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TFunction_GraphNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TFunction_GraphNode {
    TFunction_GraphNode* _get_reference() {
    return (TFunction_GraphNode*)$self->Access();
    }
};

%extend Handle_TFunction_GraphNode {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TFunction_GraphNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_HArray1OfDataMapOfGUIDDriver;
class TFunction_HArray1OfDataMapOfGUIDDriver : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TFunction_HArray1OfDataMapOfGUIDDriver;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TFunction_HArray1OfDataMapOfGUIDDriver;
		 TFunction_HArray1OfDataMapOfGUIDDriver (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TFunction_HArray1OfDataMapOfGUIDDriver;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: TFunction_DataMapOfGUIDDriver &
	:rtype: None
") TFunction_HArray1OfDataMapOfGUIDDriver;
		 TFunction_HArray1OfDataMapOfGUIDDriver (const Standard_Integer Low,const Standard_Integer Up,const TFunction_DataMapOfGUIDDriver & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TFunction_DataMapOfGUIDDriver &
	:rtype: None
") Init;
		void Init (const TFunction_DataMapOfGUIDDriver & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: TFunction_DataMapOfGUIDDriver &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TFunction_DataMapOfGUIDDriver & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TFunction_DataMapOfGUIDDriver
") Value;
		const TFunction_DataMapOfGUIDDriver & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TFunction_DataMapOfGUIDDriver
") ChangeValue;
		TFunction_DataMapOfGUIDDriver & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TFunction_Array1OfDataMapOfGUIDDriver
") Array1;
		const TFunction_Array1OfDataMapOfGUIDDriver & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TFunction_Array1OfDataMapOfGUIDDriver
") ChangeArray1;
		TFunction_Array1OfDataMapOfGUIDDriver & ChangeArray1 ();
};


%extend TFunction_HArray1OfDataMapOfGUIDDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TFunction_HArray1OfDataMapOfGUIDDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TFunction_HArray1OfDataMapOfGUIDDriver::Handle_TFunction_HArray1OfDataMapOfGUIDDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TFunction_HArray1OfDataMapOfGUIDDriver;
class Handle_TFunction_HArray1OfDataMapOfGUIDDriver : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TFunction_HArray1OfDataMapOfGUIDDriver();
        Handle_TFunction_HArray1OfDataMapOfGUIDDriver(const Handle_TFunction_HArray1OfDataMapOfGUIDDriver &aHandle);
        Handle_TFunction_HArray1OfDataMapOfGUIDDriver(const TFunction_HArray1OfDataMapOfGUIDDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TFunction_HArray1OfDataMapOfGUIDDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TFunction_HArray1OfDataMapOfGUIDDriver {
    TFunction_HArray1OfDataMapOfGUIDDriver* _get_reference() {
    return (TFunction_HArray1OfDataMapOfGUIDDriver*)$self->Access();
    }
};

%extend Handle_TFunction_HArray1OfDataMapOfGUIDDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TFunction_HArray1OfDataMapOfGUIDDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TFunction_IFunction {
	public:
		%feature("compactdefaultargs") NewFunction;
		%feature("autodoc", "	* Sets a new function attached to a label <L> with <ID>. It creates a new TFunction_Function attribute initialized by the <ID>, a new TFunction_GraphNode with an empty list of dependencies and the status equal to TFunction_ES_WrongDefinition. It registers the function in the scope of functions for this document.

	:param L:
	:type L: TDF_Label &
	:param ID:
	:type ID: Standard_GUID &
	:rtype: bool
") NewFunction;
		static Standard_Boolean NewFunction (const TDF_Label & L,const Standard_GUID & ID);
		%feature("compactdefaultargs") DeleteFunction;
		%feature("autodoc", "	* Deletes a function attached to a label <L>. It deletes a TFunction_Function attribute and a TFunction_GraphNode. It deletes the functions from the scope of function of this document.

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") DeleteFunction;
		static Standard_Boolean DeleteFunction (const TDF_Label & L);
		%feature("compactdefaultargs") UpdateDependencies;
		%feature("autodoc", "	* Updates dependencies for all functions of the scope. It returns false in case of an error. An empty constructor.

	:param Access:
	:type Access: TDF_Label &
	:rtype: bool
") UpdateDependencies;
		static Standard_Boolean UpdateDependencies (const TDF_Label & Access);
		%feature("compactdefaultargs") TFunction_IFunction;
		%feature("autodoc", "	:rtype: None
") TFunction_IFunction;
		 TFunction_IFunction ();
		%feature("compactdefaultargs") TFunction_IFunction;
		%feature("autodoc", "	* A constructor. Initializes the interface by the label of function.

	:param L:
	:type L: TDF_Label &
	:rtype: None
") TFunction_IFunction;
		 TFunction_IFunction (const TDF_Label & L);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the interface by the label of function.

	:param L:
	:type L: TDF_Label &
	:rtype: None
") Init;
		void Init (const TDF_Label & L);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a label of the function.

	:rtype: TDF_Label
") Label;
		const TDF_Label & Label ();
		%feature("compactdefaultargs") UpdateDependencies;
		%feature("autodoc", "	* Updates the dependencies of this function only.

	:rtype: bool
") UpdateDependencies;
		Standard_Boolean UpdateDependencies ();
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	* The method fills-in the list by labels, where the arguments of the function are located.

	:param args:
	:type args: TDF_LabelList &
	:rtype: None
") Arguments;
		void Arguments (TDF_LabelList & args);
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "	* The method fills-in the list by labels, where the results of the function are located.

	:param res:
	:type res: TDF_LabelList &
	:rtype: None
") Results;
		void Results (TDF_LabelList & res);
		%feature("compactdefaultargs") GetPrevious;
		%feature("autodoc", "	* Returns a list of previous functions.

	:param prev:
	:type prev: TDF_LabelList &
	:rtype: None
") GetPrevious;
		void GetPrevious (TDF_LabelList & prev);
		%feature("compactdefaultargs") GetNext;
		%feature("autodoc", "	* Returns a list of next functions.

	:param prev:
	:type prev: TDF_LabelList &
	:rtype: None
") GetNext;
		void GetNext (TDF_LabelList & prev);
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "	* Returns the execution status of the function.

	:rtype: TFunction_ExecutionStatus
") GetStatus;
		TFunction_ExecutionStatus GetStatus ();
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* Defines an execution status for a function.

	:param status:
	:type status: TFunction_ExecutionStatus
	:rtype: None
") SetStatus;
		void SetStatus (const TFunction_ExecutionStatus status);
		%feature("compactdefaultargs") GetAllFunctions;
		%feature("autodoc", "	* Returns the scope of all functions.

	:rtype: TFunction_DoubleMapOfIntegerLabel
") GetAllFunctions;
		const TFunction_DoubleMapOfIntegerLabel & GetAllFunctions ();
		%feature("compactdefaultargs") GetLogbook;
		%feature("autodoc", "	* Returns the Logbook - keeper of modifications.

	:rtype: TFunction_Logbook
") GetLogbook;
		TFunction_Logbook & GetLogbook ();
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "	* Returns a driver of the function.

	:param thread: default value is 0
	:type thread: int
	:rtype: Handle_TFunction_Driver
") GetDriver;
		Handle_TFunction_Driver GetDriver (const Standard_Integer thread = 0);
		%feature("compactdefaultargs") GetGraphNode;
		%feature("autodoc", "	* Returns a graph node of the function.

	:rtype: Handle_TFunction_GraphNode
") GetGraphNode;
		Handle_TFunction_GraphNode GetGraphNode ();
};


%extend TFunction_IFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_Iterator;
class TFunction_Iterator {
	public:
		%feature("compactdefaultargs") TFunction_Iterator;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") TFunction_Iterator;
		 TFunction_Iterator ();
		%feature("compactdefaultargs") TFunction_Iterator;
		%feature("autodoc", "	* A constructor. Initializes the iterator.

	:param Access:
	:type Access: TDF_Label &
	:rtype: None
") TFunction_Iterator;
		 TFunction_Iterator (const TDF_Label & Access);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the Iterator.

	:param Access:
	:type Access: TDF_Label &
	:rtype: void
") Init;
		virtual void Init (const TDF_Label & Access);
		%feature("compactdefaultargs") SetUsageOfExecutionStatus;
		%feature("autodoc", "	* Defines the mode of iteration - usage or not of the execution status. If the iterator takes into account the execution status, the method ::Current() returns only 'not executed' functions while their status is not changed. If the iterator ignores the execution status, the method ::Current() returns the functions following their dependencies and ignoring the execution status.

	:param usage:
	:type usage: bool
	:rtype: None
") SetUsageOfExecutionStatus;
		void SetUsageOfExecutionStatus (const Standard_Boolean usage);
		%feature("compactdefaultargs") GetUsageOfExecutionStatus;
		%feature("autodoc", "	* Returns usage of execution status by the iterator.

	:rtype: bool
") GetUsageOfExecutionStatus;
		Standard_Boolean GetUsageOfExecutionStatus ();
		%feature("compactdefaultargs") GetMaxNbThreads;
		%feature("autodoc", "	* Analyses the graph of dependencies and returns maximum number of threads may be used to calculate the model.

	:rtype: int
") GetMaxNbThreads;
		virtual Standard_Integer GetMaxNbThreads ();
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "	* Returns the current list of functions. If the iterator uses the execution status, the returned list contains only the functions with 'not executed' status.

	:rtype: TDF_LabelList
") Current;
		virtual const TDF_LabelList & Current ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns false if the graph of functions is fully iterated.

	:rtype: bool
") More;
		virtual Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Switches the iterator to the next list of current functions.

	:rtype: void
") Next;
		virtual void Next ();
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "	* A help-function aimed to help the user to check the status of retrurned function. It calls TFunction_GraphNode::GetStatus() inside.

	:param func:
	:type func: TDF_Label &
	:rtype: TFunction_ExecutionStatus
") GetStatus;
		TFunction_ExecutionStatus GetStatus (const TDF_Label & func);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	* A help-function aimed to help the user to change the execution status of a function. It calls TFunction_GraphNode::SetStatus() inside.

	:param func:
	:type func: TDF_Label &
	:param status:
	:type status: TFunction_ExecutionStatus
	:rtype: None
") SetStatus;
		void SetStatus (const TDF_Label & func,const TFunction_ExecutionStatus status);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TFunction_Iterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_Logbook;
class TFunction_Logbook {
	public:
		%feature("compactdefaultargs") TFunction_Logbook;
		%feature("autodoc", "	* next methods are solving declaration ===================================

	:rtype: None
") TFunction_Logbook;
		 TFunction_Logbook ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears this logbook to its default, empty state.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") SetTouched;
		%feature("autodoc", "	* Sets the label L as a touched label in this logbook. In other words, L is understood to have been modified by the end user.

	:param L:
	:type L: TDF_Label &
	:rtype: None
") SetTouched;
		void SetTouched (const TDF_Label & L);
		%feature("compactdefaultargs") SetImpacted;
		%feature("autodoc", "	* Sets the label L as an impacted label in this logbook. This method is called by execution of the function driver.

	:param L:
	:type L: TDF_Label &
	:param WithChildren: default value is Standard_False
	:type WithChildren: bool
	:rtype: None
") SetImpacted;
		void SetImpacted (const TDF_Label & L,const Standard_Boolean WithChildren = Standard_False);
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "	* Sets the label L as a valid label in this logbook.

	:param L:
	:type L: TDF_Label &
	:param WithChildren: default value is Standard_False
	:type WithChildren: bool
	:rtype: None
") SetValid;
		void SetValid (const TDF_Label & L,const Standard_Boolean WithChildren = Standard_False);
		%feature("compactdefaultargs") ChangeValid;
		%feature("autodoc", "	:rtype: TDF_LabelMap
") ChangeValid;
		TDF_LabelMap & ChangeValid ();
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "	* Returns True if the label L is touched or impacted. This method is called by <TFunction_FunctionDriver::MustExecute>. If <WithChildren> is set to true, the method checks all the sublabels of <L> too. next method to consult solving result =====================================

	:param L:
	:type L: TDF_Label &
	:param WithChildren: default value is Standard_False
	:type WithChildren: bool
	:rtype: bool
") IsModified;
		Standard_Boolean IsModified (const TDF_Label & L,const Standard_Boolean WithChildren = Standard_False);
		%feature("compactdefaultargs") GetTouched;
		%feature("autodoc", "	* Returns the map of touched labels in this logbook. A touched label is the one modified by the end user.

	:rtype: TDF_LabelMap
") GetTouched;
		const TDF_LabelMap & GetTouched ();
		%feature("compactdefaultargs") GetImpacted;
		%feature("autodoc", "	* Returns the map of impacted labels contained in this logbook.

	:rtype: TDF_LabelMap
") GetImpacted;
		const TDF_LabelMap & GetImpacted ();
		%feature("compactdefaultargs") GetValid;
		%feature("autodoc", "	* Returns the map of valid labels in this logbook.

	:rtype: TDF_LabelMap
") GetValid;
		const TDF_LabelMap & GetValid ();
		%feature("compactdefaultargs") Done;
		%feature("autodoc", "	* Sets if the execution failed

	:param status:
	:type status: bool
	:rtype: None
") Done;
		void Done (const Standard_Boolean status);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TFunction_Logbook {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TFunction_Scope;
class TFunction_Scope : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Static methods ============== Finds or Creates a TFunction_Scope attribute at the root label accessed by <Access>. Returns the attribute.

	:param Access:
	:type Access: TDF_Label &
	:rtype: Handle_TFunction_Scope
") Set;
		static Handle_TFunction_Scope Set (const TDF_Label & Access);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Returns the GUID for Scope attribute. Instant methods =============== Constructor (empty).

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") TFunction_Scope;
		%feature("autodoc", "	:rtype: None
") TFunction_Scope;
		 TFunction_Scope ();
		%feature("compactdefaultargs") AddFunction;
		%feature("autodoc", "	* Adds a function to the scope of functions.

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") AddFunction;
		Standard_Boolean AddFunction (const TDF_Label & L);
		%feature("compactdefaultargs") RemoveFunction;
		%feature("autodoc", "	* Removes a function from the scope of functions.

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") RemoveFunction;
		Standard_Boolean RemoveFunction (const TDF_Label & L);
		%feature("compactdefaultargs") RemoveFunction;
		%feature("autodoc", "	* Removes a function from the scope of functions.

	:param ID:
	:type ID: int
	:rtype: bool
") RemoveFunction;
		Standard_Boolean RemoveFunction (const Standard_Integer ID);
		%feature("compactdefaultargs") RemoveAllFunctions;
		%feature("autodoc", "	* Removes all functions from the scope of functions.

	:rtype: None
") RemoveAllFunctions;
		void RemoveAllFunctions ();
		%feature("compactdefaultargs") HasFunction;
		%feature("autodoc", "	* Returns true if the function exists with such an ID.

	:param ID:
	:type ID: int
	:rtype: bool
") HasFunction;
		Standard_Boolean HasFunction (const Standard_Integer ID);
		%feature("compactdefaultargs") HasFunction;
		%feature("autodoc", "	* Returns true if the label contains a function of this scope.

	:param L:
	:type L: TDF_Label &
	:rtype: bool
") HasFunction;
		Standard_Boolean HasFunction (const TDF_Label & L);
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "	* Returns an ID of the function.

	:param L:
	:type L: TDF_Label &
	:rtype: int
") GetFunction;
		Standard_Integer GetFunction (const TDF_Label & L);
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "	* Returns the label of the function with this ID.

	:param ID:
	:type ID: int
	:rtype: TDF_Label
") GetFunction;
		const TDF_Label & GetFunction (const Standard_Integer ID);
		%feature("compactdefaultargs") GetLogbook;
		%feature("autodoc", "	* Returns the Logbook used in TFunction_Driver methods. Implementation of Attribute methods ===================================

	:rtype: TFunction_Logbook
") GetLogbook;
		TFunction_Logbook & GetLogbook ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: Handle_TDF_Attribute &
	:rtype: void
") Restore;
		virtual void Restore (const Handle_TDF_Attribute & with);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") GetFunctions;
		%feature("autodoc", "	* Returns the scope of functions.

	:rtype: TFunction_DoubleMapOfIntegerLabel
") GetFunctions;
		const TFunction_DoubleMapOfIntegerLabel & GetFunctions ();
		%feature("compactdefaultargs") ChangeFunctions;
		%feature("autodoc", "	* Returns the scope of functions for modification. Warning: Don't use this method if You are not sure what You do!

	:rtype: TFunction_DoubleMapOfIntegerLabel
") ChangeFunctions;
		TFunction_DoubleMapOfIntegerLabel & ChangeFunctions ();
		%feature("compactdefaultargs") SetFreeID;
		%feature("autodoc", "	:param ID:
	:type ID: int
	:rtype: None
") SetFreeID;
		void SetFreeID (const Standard_Integer ID);
		%feature("compactdefaultargs") GetFreeID;
		%feature("autodoc", "	:rtype: int
") GetFreeID;
		Standard_Integer GetFreeID ();
};


%extend TFunction_Scope {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TFunction_Scope(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TFunction_Scope::Handle_TFunction_Scope %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TFunction_Scope;
class Handle_TFunction_Scope : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TFunction_Scope();
        Handle_TFunction_Scope(const Handle_TFunction_Scope &aHandle);
        Handle_TFunction_Scope(const TFunction_Scope *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TFunction_Scope DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TFunction_Scope {
    TFunction_Scope* _get_reference() {
    return (TFunction_Scope*)$self->Access();
    }
};

%extend Handle_TFunction_Scope {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TFunction_Scope {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
