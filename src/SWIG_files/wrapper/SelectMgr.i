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
%module (package="OCC") SelectMgr

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


%include SelectMgr_headers.i


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
typedef NCollection_DataMap <Handle_SelectMgr_EntityOwner , Standard_Integer> SelectMgr_MapOfOwnerDetectedEntities;
typedef NCollection_Handle <NCollection_IndexedMap <Handle_SelectMgr_EntityOwner>> Handle_SelectMgr_IndexedMapOfOwner;
typedef SelectMgr_SelectableObject * SelectMgr_SOPtr;
typedef NCollection_Mat4 <Standard_Real> SelectMgr_Mat4;
typedef NCollection_DataMap <Standard_Integer , SelectMgr_SelectingVolumeManager> SelectMgr_FrustumCache;
typedef NCollection_List <SelectMgr_HTriangularFrustum> SelectMgr_TriangFrustums;
typedef NCollection_IndexedMap <Handle_SelectMgr_SensitiveEntity> SelectMgr_IndexedMapOfHSensitive;
typedef NCollection_DataMap <Handle_SelectMgr_EntityOwner , Standard_Integer>::Iterator SelectMgr_MapOfOwnerDetectedEntitiesIterator;
typedef NCollection_IndexedMap <Handle_SelectMgr_EntityOwner> SelectMgr_IndexedMapOfOwner;
typedef NCollection_Sequence <Handle_SelectMgr_Selection> SelectMgr_SequenceOfSelection;
typedef NCollection_DataMap <Handle_SelectMgr_SelectableObject , NCollection_Handle <SelectMgr_SensitiveEntitySet>> SelectMgr_MapOfObjectSensitives;
typedef NCollection_DataMap <Handle_SelectMgr_SelectableObject , NCollection_Handle <SelectMgr_SensitiveEntitySet>>::Iterator SelectMgr_MapOfObjectSensitivesIterator;
typedef NCollection_Vec3 <Standard_Real> SelectMgr_Vec3;
typedef NCollection_List <SelectMgr_HTriangularFrustum>::Iterator SelectMgr_TriangFrustumsIter;
typedef NCollection_Vec4 <Standard_Real> SelectMgr_Vec4;
typedef NCollection_Handle <SelectMgr_TriangularFrustum> SelectMgr_HTriangularFrustum;
/* end typedefs declaration */

/* public enums */
enum SelectMgr_StateOfSelection {
	SelectMgr_SOS_Activated = 0,
	SelectMgr_SOS_Deactivated = 1,
	SelectMgr_SOS_Sleeping = 2,
	SelectMgr_SOS_Any = 3,
	SelectMgr_SOS_Unknown = 4,
};

enum SelectMgr_TypeOfBVHUpdate {
	SelectMgr_TBU_Add = 0,
	SelectMgr_TBU_Remove = 1,
	SelectMgr_TBU_Renew = 2,
	SelectMgr_TBU_Invalidate = 3,
	SelectMgr_TBU_None = 4,
};

enum SelectMgr_TypeOfUpdate {
	SelectMgr_TOU_Full = 0,
	SelectMgr_TOU_Partial = 1,
	SelectMgr_TOU_None = 2,
};

/* end public enums declaration */

%nodefaultctor SelectMgr_DataMapIteratorOfDataMapOfObjectSelectors;
class SelectMgr_DataMapIteratorOfDataMapOfObjectSelectors : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") SelectMgr_DataMapIteratorOfDataMapOfObjectSelectors;
		%feature("autodoc", "	:rtype: None
") SelectMgr_DataMapIteratorOfDataMapOfObjectSelectors;
		 SelectMgr_DataMapIteratorOfDataMapOfObjectSelectors ();
		%feature("compactdefaultargs") SelectMgr_DataMapIteratorOfDataMapOfObjectSelectors;
		%feature("autodoc", "	:param aMap:
	:type aMap: SelectMgr_DataMapOfObjectSelectors &
	:rtype: None
") SelectMgr_DataMapIteratorOfDataMapOfObjectSelectors;
		 SelectMgr_DataMapIteratorOfDataMapOfObjectSelectors (const SelectMgr_DataMapOfObjectSelectors & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: SelectMgr_DataMapOfObjectSelectors &
	:rtype: None
") Initialize;
		void Initialize (const SelectMgr_DataMapOfObjectSelectors & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_SelectableObject
") Key;
		Handle_SelectMgr_SelectableObject Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: SelectMgr_SequenceOfSelector
") Value;
		const SelectMgr_SequenceOfSelector & Value ();
};


%extend SelectMgr_DataMapIteratorOfDataMapOfObjectSelectors {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_DataMapNodeOfDataMapOfObjectSelectors;
class SelectMgr_DataMapNodeOfDataMapOfObjectSelectors : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") SelectMgr_DataMapNodeOfDataMapOfObjectSelectors;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:param I:
	:type I: SelectMgr_SequenceOfSelector &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") SelectMgr_DataMapNodeOfDataMapOfObjectSelectors;
		 SelectMgr_DataMapNodeOfDataMapOfObjectSelectors (const Handle_SelectMgr_SelectableObject & K,const SelectMgr_SequenceOfSelector & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_SelectableObject
") Key;
		Handle_SelectMgr_SelectableObject Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: SelectMgr_SequenceOfSelector
") Value;
		SelectMgr_SequenceOfSelector & Value ();
};


%extend SelectMgr_DataMapNodeOfDataMapOfObjectSelectors {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_DataMapNodeOfDataMapOfObjectSelectors(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_DataMapNodeOfDataMapOfObjectSelectors::Handle_SelectMgr_DataMapNodeOfDataMapOfObjectSelectors %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_DataMapNodeOfDataMapOfObjectSelectors;
class Handle_SelectMgr_DataMapNodeOfDataMapOfObjectSelectors : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_SelectMgr_DataMapNodeOfDataMapOfObjectSelectors();
        Handle_SelectMgr_DataMapNodeOfDataMapOfObjectSelectors(const Handle_SelectMgr_DataMapNodeOfDataMapOfObjectSelectors &aHandle);
        Handle_SelectMgr_DataMapNodeOfDataMapOfObjectSelectors(const SelectMgr_DataMapNodeOfDataMapOfObjectSelectors *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_DataMapNodeOfDataMapOfObjectSelectors DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_DataMapNodeOfDataMapOfObjectSelectors {
    SelectMgr_DataMapNodeOfDataMapOfObjectSelectors* _get_reference() {
    return (SelectMgr_DataMapNodeOfDataMapOfObjectSelectors*)$self->Access();
    }
};

%extend Handle_SelectMgr_DataMapNodeOfDataMapOfObjectSelectors {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_DataMapNodeOfDataMapOfObjectSelectors {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_DataMapOfObjectSelectors;
class SelectMgr_DataMapOfObjectSelectors : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") SelectMgr_DataMapOfObjectSelectors;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") SelectMgr_DataMapOfObjectSelectors;
		 SelectMgr_DataMapOfObjectSelectors (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_DataMapOfObjectSelectors &
	:rtype: SelectMgr_DataMapOfObjectSelectors
") Assign;
		SelectMgr_DataMapOfObjectSelectors & Assign (const SelectMgr_DataMapOfObjectSelectors & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_DataMapOfObjectSelectors &
	:rtype: SelectMgr_DataMapOfObjectSelectors
") operator =;
		SelectMgr_DataMapOfObjectSelectors & operator = (const SelectMgr_DataMapOfObjectSelectors & Other);
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
	:type K: Handle_SelectMgr_SelectableObject &
	:param I:
	:type I: SelectMgr_SequenceOfSelector &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_SelectMgr_SelectableObject & K,const SelectMgr_SequenceOfSelector & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_SelectMgr_SelectableObject & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_SelectMgr_SelectableObject & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:rtype: SelectMgr_SequenceOfSelector
") Find;
		const SelectMgr_SequenceOfSelector & Find (const Handle_SelectMgr_SelectableObject & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:rtype: SelectMgr_SequenceOfSelector
") ChangeFind;
		SelectMgr_SequenceOfSelector & ChangeFind (const Handle_SelectMgr_SelectableObject & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_SelectMgr_SelectableObject & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectMgr_SelectableObject &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_SelectMgr_SelectableObject & K);
};


%extend SelectMgr_DataMapOfObjectSelectors {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_EntityOwner;
class SelectMgr_EntityOwner : public SelectBasics_EntityOwner {
	public:
		%feature("compactdefaultargs") SelectMgr_EntityOwner;
		%feature("autodoc", "	* Initializes the selection priority aPriority.

	:param aPriority: default value is 0
	:type aPriority: int
	:rtype: None
") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner (const Standard_Integer aPriority = 0);
		%feature("compactdefaultargs") SelectMgr_EntityOwner;
		%feature("autodoc", "	* Constructs a framework with the selectable object anSO being attributed the selection priority aPriority.

	:param aSO:
	:type aSO: Handle_SelectMgr_SelectableObject &
	:param aPriority: default value is 0
	:type aPriority: int
	:rtype: None
") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner (const Handle_SelectMgr_SelectableObject & aSO,const Standard_Integer aPriority = 0);
		%feature("compactdefaultargs") SelectMgr_EntityOwner;
		%feature("autodoc", "	* Constructs a framework from existing one anSO being attributed the selection priority aPriority.

	:param theOwner:
	:type theOwner: Handle_SelectMgr_EntityOwner &
	:param aPriority: default value is 0
	:type aPriority: int
	:rtype: None
") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner (const Handle_SelectMgr_EntityOwner & theOwner,const Standard_Integer aPriority = 0);
		%feature("compactdefaultargs") HasSelectable;
		%feature("autodoc", "	* Returns true if there is a selectable object to serve as an owner.

	:rtype: bool
") HasSelectable;
		Standard_Boolean HasSelectable ();
		%feature("compactdefaultargs") Selectable;
		%feature("autodoc", "	* Returns a selectable object detected in the working context.

	:rtype: Handle_SelectMgr_SelectableObject
") Selectable;
		virtual Handle_SelectMgr_SelectableObject Selectable ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the selectable object anSO to be used by the second constructor above.

	:param aSO:
	:type aSO: Handle_SelectMgr_SelectableObject &
	:rtype: None
") Set;
		void Set (const Handle_SelectMgr_SelectableObject & aSO);
		%feature("compactdefaultargs") Hilight;
		%feature("autodoc", "	* Provides a framework to highlight any selectable object found subsequently which can serve as an owner of a sensitive primitive.

	:rtype: void
") Hilight;
		virtual void Hilight ();
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	* Returns true if the presentation manager aPM highlights selections corresponding to the selection mode aMode.

	:param aPM:
	:type aPM: Handle_PrsMgr_PresentationManager &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: bool
") IsHilighted;
		virtual Standard_Boolean IsHilighted (const Handle_PrsMgr_PresentationManager & aPM,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") Hilight;
		%feature("autodoc", "	* Highlights the owner of a detected selectable object in the presentation manager aPM. This object could be the owner of a sensitive primitive. The display mode for the highlight is aMode; this has the default value of 0, that is, wireframe mode.

	:param aPM:
	:type aPM: Handle_PrsMgr_PresentationManager &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: void
") Hilight;
		virtual void Hilight (const Handle_PrsMgr_PresentationManager & aPM,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "	:param aPM:
	:type aPM: Handle_PrsMgr_PresentationManager3d &
	:param aColor:
	:type aColor: Quantity_NameOfColor
	:param aMode: default value is 0
	:type aMode: int
	:rtype: void
") HilightWithColor;
		virtual void HilightWithColor (const Handle_PrsMgr_PresentationManager3d & aPM,const Quantity_NameOfColor aColor,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "	* Removes highlighting from the owner of a detected selectable object in the presentation manager aPM. This object could be the owner of a sensitive primitive. The display mode for the highlight is aMode; this has the default value of 0, that is, wireframe mode.

	:param aPM:
	:type aPM: Handle_PrsMgr_PresentationManager &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: void
") Unhilight;
		virtual void Unhilight (const Handle_PrsMgr_PresentationManager & aPM,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the owners matching the value of the selection mode aMode from the presentation manager object aPM.

	:param aPM:
	:type aPM: Handle_PrsMgr_PresentationManager &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: void
") Clear;
		virtual void Clear (const Handle_PrsMgr_PresentationManager & aPM,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "	:rtype: bool
") HasLocation;
		virtual Standard_Boolean HasLocation ();
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: void
") SetLocation;
		virtual void SetLocation (const TopLoc_Location & aLoc);
		%feature("compactdefaultargs") ResetLocation;
		%feature("autodoc", "	:rtype: void
") ResetLocation;
		virtual void ResetLocation ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	:rtype: TopLoc_Location
") Location;
		virtual TopLoc_Location Location ();
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "	* Set the state of the owner. @param theIsSelected [in] shows if owner is selected.

	:param theIsSelected:
	:type theIsSelected: bool
	:rtype: None
") SetSelected;
		void SetSelected (const Standard_Boolean theIsSelected);
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "	* returns Standard_True if the owner is selected.

	:rtype: bool
") IsSelected;
		Standard_Boolean IsSelected ();
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* Set the state of the owner. The method is deprecated. Use SetSelected() instead.

	:param aStatus:
	:type aStatus: int
	:rtype: None
") State;
		void State (const Standard_Integer aStatus);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	:rtype: int
") State;
		Standard_Integer State ();
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "	* if owner is not auto hilighted, for group contains many such owners will be called one method HilightSelected of SelectableObject

	:rtype: bool
") IsAutoHilight;
		virtual Standard_Boolean IsAutoHilight ();
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "	* if this method returns True the owner will allways call method Hilight for SelectableObject when the owner is detected. By default it always return False.

	:rtype: bool
") IsForcedHilight;
		virtual Standard_Boolean IsForcedHilight ();
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set Z layer ID and update all presentations.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: void
") SetZLayer;
		virtual void SetZLayer (const Graphic3d_ZLayerId theLayerId);
};


%extend SelectMgr_EntityOwner {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_EntityOwner(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_EntityOwner::Handle_SelectMgr_EntityOwner %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_EntityOwner;
class Handle_SelectMgr_EntityOwner : public Handle_SelectBasics_EntityOwner {

    public:
        // constructors
        Handle_SelectMgr_EntityOwner();
        Handle_SelectMgr_EntityOwner(const Handle_SelectMgr_EntityOwner &aHandle);
        Handle_SelectMgr_EntityOwner(const SelectMgr_EntityOwner *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_EntityOwner DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_EntityOwner {
    SelectMgr_EntityOwner* _get_reference() {
    return (SelectMgr_EntityOwner*)$self->Access();
    }
};

%extend Handle_SelectMgr_EntityOwner {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_EntityOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_Filter;
class SelectMgr_Filter : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	* Indicates that the selected Interactive Object passes the filter. The owner, anObj, can be either direct or user. A direct owner is the corresponding construction element, whereas a user is the compound shape of which the entity forms a part. When an object is detected by the mouse - in AIS, this is done through a context selector - its owner is passed to the filter as an argument. If the object returns Standard_True, it is kept; if not, it is rejected. If you are creating a filter class inheriting this framework, and the daughter class is to be used in an AIS local context, you will need to implement the virtual function ActsOn.

	:param anObj:
	:type anObj: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsOk;
		virtual Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anObj);
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "	* Returns true in an AIS local context, if this filter operates on a type of subshape defined in a filter class inheriting this framework. This function completes IsOk in an AIS local context.

	:param aStandardMode:
	:type aStandardMode: TopAbs_ShapeEnum
	:rtype: bool
") ActsOn;
		virtual Standard_Boolean ActsOn (const TopAbs_ShapeEnum aStandardMode);
};


%extend SelectMgr_Filter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_Filter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_Filter::Handle_SelectMgr_Filter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_Filter;
class Handle_SelectMgr_Filter : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_SelectMgr_Filter();
        Handle_SelectMgr_Filter(const Handle_SelectMgr_Filter &aHandle);
        Handle_SelectMgr_Filter(const SelectMgr_Filter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_Filter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_Filter {
    SelectMgr_Filter* _get_reference() {
    return (SelectMgr_Filter*)$self->Access();
    }
};

%extend Handle_SelectMgr_Filter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_Filter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion;
class SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_SelectBasics_EntityOwner &
	:param K2:
	:type K2: int
	:param I:
	:type I: SelectMgr_SortCriterion &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion;
		 SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion (const Handle_SelectBasics_EntityOwner & K1,const Standard_Integer K2,const SelectMgr_SortCriterion & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Handle_SelectBasics_EntityOwner
") Key1;
		Handle_SelectBasics_EntityOwner Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: SelectMgr_SortCriterion
") Value;
		SelectMgr_SortCriterion & Value ();
};


%extend SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion::Handle_SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion;
class Handle_SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion();
        Handle_SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion(const Handle_SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion &aHandle);
        Handle_SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion(const SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion {
    SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion* _get_reference() {
    return (SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion*)$self->Access();
    }
};

%extend Handle_SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_IndexedDataMapOfOwnerCriterion;
class SelectMgr_IndexedDataMapOfOwnerCriterion : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") SelectMgr_IndexedDataMapOfOwnerCriterion;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") SelectMgr_IndexedDataMapOfOwnerCriterion;
		 SelectMgr_IndexedDataMapOfOwnerCriterion (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_IndexedDataMapOfOwnerCriterion &
	:rtype: SelectMgr_IndexedDataMapOfOwnerCriterion
") Assign;
		SelectMgr_IndexedDataMapOfOwnerCriterion & Assign (const SelectMgr_IndexedDataMapOfOwnerCriterion & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_IndexedDataMapOfOwnerCriterion &
	:rtype: SelectMgr_IndexedDataMapOfOwnerCriterion
") operator =;
		SelectMgr_IndexedDataMapOfOwnerCriterion & operator = (const SelectMgr_IndexedDataMapOfOwnerCriterion & Other);
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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectBasics_EntityOwner &
	:param I:
	:type I: SelectMgr_SortCriterion &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_SelectBasics_EntityOwner & K,const SelectMgr_SortCriterion & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: Handle_SelectBasics_EntityOwner &
	:param T:
	:type T: SelectMgr_SortCriterion &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const Handle_SelectBasics_EntityOwner & K,const SelectMgr_SortCriterion & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectBasics_EntityOwner &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_SelectBasics_EntityOwner & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_SelectBasics_EntityOwner
") FindKey;
		Handle_SelectBasics_EntityOwner FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: SelectMgr_SortCriterion
") FindFromIndex;
		const SelectMgr_SortCriterion & FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: SelectMgr_SortCriterion
") ChangeFromIndex;
		SelectMgr_SortCriterion & ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectBasics_EntityOwner &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const Handle_SelectBasics_EntityOwner & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectBasics_EntityOwner &
	:rtype: SelectMgr_SortCriterion
") FindFromKey;
		const SelectMgr_SortCriterion & FindFromKey (const Handle_SelectBasics_EntityOwner & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectBasics_EntityOwner &
	:rtype: SelectMgr_SortCriterion
") ChangeFromKey;
		SelectMgr_SortCriterion & ChangeFromKey (const Handle_SelectBasics_EntityOwner & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectBasics_EntityOwner &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const Handle_SelectBasics_EntityOwner & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: Handle_SelectBasics_EntityOwner &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const Handle_SelectBasics_EntityOwner & K);
};


%extend SelectMgr_IndexedDataMapOfOwnerCriterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_ListIteratorOfListOfFilter;
class SelectMgr_ListIteratorOfListOfFilter {
	public:
		%feature("compactdefaultargs") SelectMgr_ListIteratorOfListOfFilter;
		%feature("autodoc", "	:rtype: None
") SelectMgr_ListIteratorOfListOfFilter;
		 SelectMgr_ListIteratorOfListOfFilter ();
		%feature("compactdefaultargs") SelectMgr_ListIteratorOfListOfFilter;
		%feature("autodoc", "	:param L:
	:type L: SelectMgr_ListOfFilter &
	:rtype: None
") SelectMgr_ListIteratorOfListOfFilter;
		 SelectMgr_ListIteratorOfListOfFilter (const SelectMgr_ListOfFilter & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: SelectMgr_ListOfFilter &
	:rtype: None
") Initialize;
		void Initialize (const SelectMgr_ListOfFilter & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_Filter
") Value;
		Handle_SelectMgr_Filter Value ();
};


%extend SelectMgr_ListIteratorOfListOfFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_ListNodeOfListOfFilter;
class SelectMgr_ListNodeOfListOfFilter : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") SelectMgr_ListNodeOfListOfFilter;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectMgr_Filter &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") SelectMgr_ListNodeOfListOfFilter;
		 SelectMgr_ListNodeOfListOfFilter (const Handle_SelectMgr_Filter & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_Filter
") Value;
		Handle_SelectMgr_Filter Value ();
};


%extend SelectMgr_ListNodeOfListOfFilter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_ListNodeOfListOfFilter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_ListNodeOfListOfFilter::Handle_SelectMgr_ListNodeOfListOfFilter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_ListNodeOfListOfFilter;
class Handle_SelectMgr_ListNodeOfListOfFilter : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_SelectMgr_ListNodeOfListOfFilter();
        Handle_SelectMgr_ListNodeOfListOfFilter(const Handle_SelectMgr_ListNodeOfListOfFilter &aHandle);
        Handle_SelectMgr_ListNodeOfListOfFilter(const SelectMgr_ListNodeOfListOfFilter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_ListNodeOfListOfFilter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_ListNodeOfListOfFilter {
    SelectMgr_ListNodeOfListOfFilter* _get_reference() {
    return (SelectMgr_ListNodeOfListOfFilter*)$self->Access();
    }
};

%extend Handle_SelectMgr_ListNodeOfListOfFilter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_ListNodeOfListOfFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_ListOfFilter;
class SelectMgr_ListOfFilter {
	public:
		%feature("compactdefaultargs") SelectMgr_ListOfFilter;
		%feature("autodoc", "	:rtype: None
") SelectMgr_ListOfFilter;
		 SelectMgr_ListOfFilter ();
		%feature("compactdefaultargs") SelectMgr_ListOfFilter;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_ListOfFilter &
	:rtype: None
") SelectMgr_ListOfFilter;
		 SelectMgr_ListOfFilter (const SelectMgr_ListOfFilter & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_ListOfFilter &
	:rtype: None
") Assign;
		void Assign (const SelectMgr_ListOfFilter & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_ListOfFilter &
	:rtype: None
") operator =;
		void operator = (const SelectMgr_ListOfFilter & Other);
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
	:type I: Handle_SelectMgr_Filter &
	:rtype: None
") Prepend;
		void Prepend (const Handle_SelectMgr_Filter & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectMgr_Filter &
	:param theIt:
	:type theIt: SelectMgr_ListIteratorOfListOfFilter &
	:rtype: None
") Prepend;
		void Prepend (const Handle_SelectMgr_Filter & I,SelectMgr_ListIteratorOfListOfFilter & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_ListOfFilter &
	:rtype: None
") Prepend;
		void Prepend (SelectMgr_ListOfFilter & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectMgr_Filter &
	:rtype: None
") Append;
		void Append (const Handle_SelectMgr_Filter & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectMgr_Filter &
	:param theIt:
	:type theIt: SelectMgr_ListIteratorOfListOfFilter &
	:rtype: None
") Append;
		void Append (const Handle_SelectMgr_Filter & I,SelectMgr_ListIteratorOfListOfFilter & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_ListOfFilter &
	:rtype: None
") Append;
		void Append (SelectMgr_ListOfFilter & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_Filter
") First;
		Handle_SelectMgr_Filter First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_Filter
") Last;
		Handle_SelectMgr_Filter Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: SelectMgr_ListIteratorOfListOfFilter &
	:rtype: None
") Remove;
		void Remove (SelectMgr_ListIteratorOfListOfFilter & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectMgr_Filter &
	:param It:
	:type It: SelectMgr_ListIteratorOfListOfFilter &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_SelectMgr_Filter & I,SelectMgr_ListIteratorOfListOfFilter & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_ListOfFilter &
	:param It:
	:type It: SelectMgr_ListIteratorOfListOfFilter &
	:rtype: None
") InsertBefore;
		void InsertBefore (SelectMgr_ListOfFilter & Other,SelectMgr_ListIteratorOfListOfFilter & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectMgr_Filter &
	:param It:
	:type It: SelectMgr_ListIteratorOfListOfFilter &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_SelectMgr_Filter & I,SelectMgr_ListIteratorOfListOfFilter & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_ListOfFilter &
	:param It:
	:type It: SelectMgr_ListIteratorOfListOfFilter &
	:rtype: None
") InsertAfter;
		void InsertAfter (SelectMgr_ListOfFilter & Other,SelectMgr_ListIteratorOfListOfFilter & It);
};


%extend SelectMgr_ListOfFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SelectableObject;
class SelectMgr_SelectableObject : public PrsMgr_PresentableObject {
	public:
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "	* Recovers and calculates any sensitive primitive, aSelection, available in Shape mode, specified by aMode. As a rule, these are sensitive faces. This method is defined as virtual. This enables you to implement it in the creation of a new class of AIS Interactive Object. You need to do this and in so doing, redefine this method, if you create a class which enriches the list of signatures and types.

	:param aSelection:
	:type aSelection: Handle_SelectMgr_Selection &
	:param aMode:
	:type aMode: int
	:rtype: void
") ComputeSelection;
		virtual void ComputeSelection (const Handle_SelectMgr_Selection & aSelection,const Standard_Integer aMode);
		%feature("compactdefaultargs") RecomputePrimitives;
		%feature("autodoc", "	* Re-computes the sensitive primitives for all modes. IMPORTANT: Do not use this method to update selection primitives except implementing custom selection manager! This method does not take into account necessary BVH updates, but may invalidate the pointers it refers to. TO UPDATE SELECTION properly from outside classes, use method UpdateSelection.

	:rtype: None
") RecomputePrimitives;
		void RecomputePrimitives ();
		%feature("compactdefaultargs") RecomputePrimitives;
		%feature("autodoc", "	* Re-computes the sensitive primitives which correspond to the <theMode>th selection mode. IMPORTANT: Do not use this method to update selection primitives except implementing custom selection manager! selection manager! This method does not take into account necessary BVH updates, but may invalidate the pointers it refers to. TO UPDATE SELECTION properly from outside classes, use method UpdateSelection.

	:param theMode:
	:type theMode: int
	:rtype: None
") RecomputePrimitives;
		void RecomputePrimitives (const Standard_Integer theMode);
		%feature("compactdefaultargs") AddSelection;
		%feature("autodoc", "	* Adds the selection aSelection with the selection mode index aMode to this framework.

	:param aSelection:
	:type aSelection: Handle_SelectMgr_Selection &
	:param aMode:
	:type aMode: int
	:rtype: None
") AddSelection;
		void AddSelection (const Handle_SelectMgr_Selection & aSelection,const Standard_Integer aMode);
		%feature("compactdefaultargs") ClearSelections;
		%feature("autodoc", "	* Empties all the selections in the SelectableObject <update> parameter defines whether all object's selections should be flagged for further update or not. This improved method can be used to recompute an object's selection (without redisplaying the object completely) when some selection mode is activated not for the first time.

	:param update: default value is Standard_False
	:type update: bool
	:rtype: None
") ClearSelections;
		void ClearSelections (const Standard_Boolean update = Standard_False);
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "	* Returns the selection Selection having the selection mode aMode.

	:param aMode:
	:type aMode: int
	:rtype: Handle_SelectMgr_Selection
") Selection;
		Handle_SelectMgr_Selection Selection (const Standard_Integer aMode);
		%feature("compactdefaultargs") HasSelection;
		%feature("autodoc", "	* Returns true if a selection corresponding to the selection mode aMode is present in this framework.

	:param aMode:
	:type aMode: int
	:rtype: bool
") HasSelection;
		Standard_Boolean HasSelection (const Standard_Integer aMode);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Begins the iteration scanning for sensitive primitives.

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Continues the iteration scanning for sensitive primitives.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Continues the iteration scanning for sensitive primitives.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") CurrentSelection;
		%feature("autodoc", "	* Returns the current selection in this framework.

	:rtype: Handle_SelectMgr_Selection
") CurrentSelection;
		Handle_SelectMgr_Selection CurrentSelection ();
		%feature("compactdefaultargs") ResetTransformation;
		%feature("autodoc", "	:rtype: None
") ResetTransformation;
		void ResetTransformation ();
		%feature("compactdefaultargs") UpdateTransformation;
		%feature("autodoc", "	* Recomputes the location of the selection aSelection.

	:rtype: void
") UpdateTransformation;
		virtual void UpdateTransformation ();
		%feature("compactdefaultargs") UpdateTransformations;
		%feature("autodoc", "	* Updates locations in all sensitive entities from <aSelection> and in corresponding entity owners.

	:param aSelection:
	:type aSelection: Handle_SelectMgr_Selection &
	:rtype: void
") UpdateTransformations;
		virtual void UpdateTransformations (const Handle_SelectMgr_Selection & aSelection);
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "	* Method which draws selected owners ( for fast presentation draw )

	:param PM:
	:type PM: Handle_PrsMgr_PresentationManager3d &
	:param Seq:
	:type Seq: SelectMgr_SequenceOfOwner &
	:rtype: void
") HilightSelected;
		virtual void HilightSelected (const Handle_PrsMgr_PresentationManager3d & PM,const SelectMgr_SequenceOfOwner & Seq);
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "	* Method which clear all selected owners belonging to this selectable object ( for fast presentation draw )

	:rtype: void
") ClearSelected;
		virtual void ClearSelected ();
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "	* Method which hilight an owner belonging to this selectable object ( for fast presentation draw )

	:param thePM:
	:type thePM: Handle_PrsMgr_PresentationManager3d &
	:param theColor:
	:type theColor: Quantity_NameOfColor
	:param theOwner:
	:type theOwner: Handle_SelectMgr_EntityOwner &
	:rtype: void
") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor (const Handle_PrsMgr_PresentationManager3d & thePM,const Quantity_NameOfColor theColor,const Handle_SelectMgr_EntityOwner & theOwner);
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "	* If returns True, the old mechanism for highlighting selected objects is used (HilightSelected Method may be empty). If returns False, the HilightSelected method will be fully responsible for highlighting selected entity owners belonging to this selectable object.

	:rtype: bool
") IsAutoHilight;
		virtual Standard_Boolean IsAutoHilight ();
		%feature("compactdefaultargs") SetAutoHilight;
		%feature("autodoc", "	* Set AutoHilight property to true or false Sets up Transform Persistence Mode for this object

	:param newAutoHilight:
	:type newAutoHilight: bool
	:rtype: void
") SetAutoHilight;
		virtual void SetAutoHilight (const Standard_Boolean newAutoHilight);
		%feature("compactdefaultargs") GetHilightPresentation;
		%feature("autodoc", "	:param TheMgr:
	:type TheMgr: Handle_PrsMgr_PresentationManager3d &
	:rtype: Handle_Prs3d_Presentation
") GetHilightPresentation;
		Handle_Prs3d_Presentation GetHilightPresentation (const Handle_PrsMgr_PresentationManager3d & TheMgr);
		%feature("compactdefaultargs") GetSelectPresentation;
		%feature("autodoc", "	:param TheMgr:
	:type TheMgr: Handle_PrsMgr_PresentationManager3d &
	:rtype: Handle_Prs3d_Presentation
") GetSelectPresentation;
		Handle_Prs3d_Presentation GetSelectPresentation (const Handle_PrsMgr_PresentationManager3d & TheMgr);
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set Z layer ID and update all presentations of the selectable object. The layers mechanism allows drawing objects in higher layers in overlay of objects in lower layers.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: void
") SetZLayer;
		virtual void SetZLayer (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") UpdateSelection;
		%feature("autodoc", "	* Sets update status FULL to selections of the object. Must be used as the only method of UpdateSelection from outer classes to prevent BVH structures from being outdated.

	:param theMode: default value is -1
	:type theMode: int
	:rtype: None
") UpdateSelection;
		void UpdateSelection (const Standard_Integer theMode = -1);
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of selectable object by storing its minimum and maximum 3d coordinates to output parameters

	:param theBndBox:
	:type theBndBox: Bnd_Box &
	:rtype: void
") BoundingBox;
		virtual void BoundingBox (Bnd_Box & theBndBox);
		%feature("compactdefaultargs") SetAttributes;
		%feature("autodoc", "	* Initializes the drawing tool theDrawer.

	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") SetAttributes;
		virtual void SetAttributes (const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "	* Returns the attributes settings.

	:rtype: Handle_Prs3d_Drawer
") Attributes;
		Handle_Prs3d_Drawer Attributes ();
		%feature("compactdefaultargs") UnsetAttributes;
		%feature("autodoc", "	* Clears settings provided by the drawing tool theDrawer.

	:rtype: void
") UnsetAttributes;
		virtual void UnsetAttributes ();
		%feature("compactdefaultargs") SetHilightAttributes;
		%feature("autodoc", "	* Initializes the hilight drawing tool theDrawer.

	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") SetHilightAttributes;
		virtual void SetHilightAttributes (const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") HilightAttributes;
		%feature("autodoc", "	* Returns the hilight attributes settings.

	:rtype: Handle_Prs3d_Drawer
") HilightAttributes;
		Handle_Prs3d_Drawer HilightAttributes ();
		%feature("compactdefaultargs") UnsetHilightAttributes;
		%feature("autodoc", "	* Clears settings provided by the hilight drawing tool theDrawer.

	:rtype: void
") UnsetHilightAttributes;
		virtual void UnsetHilightAttributes ();
		%feature("compactdefaultargs") InitDefaultHilightAttributes;
		%feature("autodoc", "	* Initializes theDrawer by default hilight settings.

	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") InitDefaultHilightAttributes;
		static void InitDefaultHilightAttributes (const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") SetAssemblyOwner;
		%feature("autodoc", "	* Sets common entity owner for assembly sensitive object entities

	:param theOwner:
	:type theOwner: Handle_SelectMgr_EntityOwner &
	:param theMode: default value is -1
	:type theMode: int
	:rtype: None
") SetAssemblyOwner;
		void SetAssemblyOwner (const Handle_SelectMgr_EntityOwner & theOwner,const Standard_Integer theMode = -1);
		%feature("compactdefaultargs") GetAssemblyOwner;
		%feature("autodoc", "	* Returns common entity owner if the object is an assembly

	:rtype: Handle_SelectMgr_EntityOwner
") GetAssemblyOwner;
		Handle_SelectMgr_EntityOwner GetAssemblyOwner ();
		%feature("compactdefaultargs") BndBoxOfSelected;
		%feature("autodoc", "	* Returns a bounding box of sensitive entities with the owners given if they are a part of activated selection

	:param theOwners:
	:type theOwners: Handle_SelectMgr_IndexedMapOfOwner &
	:rtype: Bnd_Box
") BndBoxOfSelected;
		Bnd_Box BndBoxOfSelected (Handle_SelectMgr_IndexedMapOfOwner & theOwners);
};


%extend SelectMgr_SelectableObject {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_SelectableObject(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_SelectableObject::Handle_SelectMgr_SelectableObject %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_SelectableObject;
class Handle_SelectMgr_SelectableObject : public Handle_PrsMgr_PresentableObject {

    public:
        // constructors
        Handle_SelectMgr_SelectableObject();
        Handle_SelectMgr_SelectableObject(const Handle_SelectMgr_SelectableObject &aHandle);
        Handle_SelectMgr_SelectableObject(const SelectMgr_SelectableObject *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_SelectableObject DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_SelectableObject {
    SelectMgr_SelectableObject* _get_reference() {
    return (SelectMgr_SelectableObject*)$self->Access();
    }
};

%extend Handle_SelectMgr_SelectableObject {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_SelectableObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SelectingVolumeManager;
class SelectMgr_SelectingVolumeManager : public SelectBasics_SelectingVolumeManager {
	public:
		%feature("compactdefaultargs") SelectMgr_SelectingVolumeManager;
		%feature("autodoc", "	* Creates instances of all available selecting volume types

	:param theToAllocateFrustums: default value is Standard_True
	:type theToAllocateFrustums: bool
	:rtype: None
") SelectMgr_SelectingVolumeManager;
		 SelectMgr_SelectingVolumeManager (Standard_Boolean theToAllocateFrustums = Standard_True);
		%feature("compactdefaultargs") ScaleAndTransform;
		%feature("autodoc", "	* IMPORTANT: Scaling makes sense only for frustum built on a single point! Note that this method does not perform any checks on type of the frustum. //! Returns a copy of the frustum resized according to the scale factor given and transforms it using the matrix given. There are no default parameters, but in case if: - transformation only is needed: @theScaleFactor must be initialized as any negative value; - scale only is needed: @theTrsf must be set to gp_Identity.

	:param theScaleFactor:
	:type theScaleFactor: int
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: SelectMgr_SelectingVolumeManager
") ScaleAndTransform;
		virtual SelectMgr_SelectingVolumeManager ScaleAndTransform (const Standard_Integer theScaleFactor,const gp_Trsf & theTrsf);
		%feature("compactdefaultargs") GetActiveSelectionType;
		%feature("autodoc", "	:rtype: int
") GetActiveSelectionType;
		virtual Standard_Integer GetActiveSelectionType ();
		%feature("compactdefaultargs") SetActiveSelectionType;
		%feature("autodoc", "	:param theType:
	:type theType: SelectionType &
	:rtype: None
") SetActiveSelectionType;
		void SetActiveSelectionType (const SelectionType & theType);
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "	* Updates camera projection and orientation matrices in all selecting volumes

	:param theCamera:
	:type theCamera: Handle_Graphic3d_Camera
	:rtype: None
") SetCamera;
		void SetCamera (const Handle_Graphic3d_Camera theCamera);
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "	* Updates camera projection and orientation matrices in all selecting volumes

	:param theProjection:
	:type theProjection: Graphic3d_Mat4d &
	:param theOrientation:
	:type theOrientation: Graphic3d_Mat4d &
	:param theIsOrthographic:
	:type theIsOrthographic: bool
	:rtype: None
") SetCamera;
		void SetCamera (const Graphic3d_Mat4d & theProjection,const Graphic3d_Mat4d & theOrientation,const Standard_Boolean theIsOrthographic);
		%feature("compactdefaultargs") SetViewport;
		%feature("autodoc", "	* Updates viewport in all selecting volumes

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theWidth:
	:type theWidth: float
	:param theHeight:
	:type theHeight: float
	:rtype: None
") SetViewport;
		void SetViewport (const Standard_Real theX,const Standard_Real theY,const Standard_Real theWidth,const Standard_Real theHeight);
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "	* Updates pixel tolerance in all selecting volumes

	:param theTolerance:
	:type theTolerance: int
	:rtype: None
") SetPixelTolerance;
		void SetPixelTolerance (const Standard_Integer theTolerance);
		%feature("compactdefaultargs") SetWindowSize;
		%feature("autodoc", "	* Updates window size in all selecting volumes

	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:rtype: None
") SetWindowSize;
		void SetWindowSize (const Standard_Integer theWidth,const Standard_Integer theHeight);
		%feature("compactdefaultargs") BuildSelectingVolume;
		%feature("autodoc", "	* Builds rectangular selecting frustum for point selection

	:param thePoint:
	:type thePoint: gp_Pnt2d
	:rtype: None
") BuildSelectingVolume;
		void BuildSelectingVolume (const gp_Pnt2d & thePoint);
		%feature("compactdefaultargs") BuildSelectingVolume;
		%feature("autodoc", "	* Builds rectangular selecting frustum for box selection

	:param theMinPt:
	:type theMinPt: gp_Pnt2d
	:param theMaxPt:
	:type theMaxPt: gp_Pnt2d
	:rtype: None
") BuildSelectingVolume;
		void BuildSelectingVolume (const gp_Pnt2d & theMinPt,const gp_Pnt2d & theMaxPt);
		%feature("compactdefaultargs") BuildSelectingVolume;
		%feature("autodoc", "	* Builds set of triangular selecting frustums for polyline selection

	:param thePoints:
	:type thePoints: TColgp_Array1OfPnt2d
	:rtype: None
") BuildSelectingVolume;
		void BuildSelectingVolume (const TColgp_Array1OfPnt2d & thePoints);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* SAT intersection test between defined volume and given axis-aligned box

	:param theBoxMin:
	:type theBoxMin: SelectMgr_Vec3 &
	:param theBoxMax:
	:type theBoxMax: SelectMgr_Vec3 &
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") Overlaps;
		virtual Standard_Boolean Overlaps (const SelectMgr_Vec3 & theBoxMin,const SelectMgr_Vec3 & theBoxMax,Standard_Real &OutValue);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Returns true if selecting volume is overlapped by axis-aligned bounding box with minimum corner at point theMinPt and maximum at point theMaxPt

	:param theBoxMin:
	:type theBoxMin: SelectMgr_Vec3 &
	:param theBoxMax:
	:type theBoxMax: SelectMgr_Vec3 &
	:param theInside: default value is NULL
	:type theInside: bool *
	:rtype: bool
") Overlaps;
		virtual Standard_Boolean Overlaps (const SelectMgr_Vec3 & theBoxMin,const SelectMgr_Vec3 & theBoxMax,Standard_Boolean * theInside = NULL);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Intersection test between defined volume and given point

	:param thePnt:
	:type thePnt: gp_Pnt
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") Overlaps;
		virtual Standard_Boolean Overlaps (const gp_Pnt & thePnt,Standard_Real &OutValue);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Intersection test between defined volume and given point

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: bool
") Overlaps;
		virtual Standard_Boolean Overlaps (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* SAT intersection test between defined volume and given ordered set of points, representing line segments. The test may be considered of interior part or boundary line defined by segments depending on given sensitivity type

	:param theArrayOfPts:
	:type theArrayOfPts: Handle_TColgp_HArray1OfPnt
	:param theSensType:
	:type theSensType: int
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") Overlaps;
		virtual Standard_Boolean Overlaps (const Handle_TColgp_HArray1OfPnt & theArrayOfPts,Standard_Integer theSensType,Standard_Real &OutValue);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Checks if line segment overlaps selecting frustum

	:param thePnt1:
	:type thePnt1: gp_Pnt
	:param thePnt2:
	:type thePnt2: gp_Pnt
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") Overlaps;
		virtual Standard_Boolean Overlaps (const gp_Pnt & thePnt1,const gp_Pnt & thePnt2,Standard_Real &OutValue);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* SAT intersection test between defined volume and given triangle. The test may be considered of interior part or boundary line defined by triangle vertices depending on given sensitivity type

	:param thePnt1:
	:type thePnt1: gp_Pnt
	:param thePnt2:
	:type thePnt2: gp_Pnt
	:param thePnt3:
	:type thePnt3: gp_Pnt
	:param theSensType:
	:type theSensType: int
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") Overlaps;
		virtual Standard_Boolean Overlaps (const gp_Pnt & thePnt1,const gp_Pnt & thePnt2,const gp_Pnt & thePnt3,Standard_Integer theSensType,Standard_Real &OutValue);
		%feature("compactdefaultargs") DistToGeometryCenter;
		%feature("autodoc", "	* Measures distance between 3d projection of user-picked screen point and given point theCOG

	:param theCOG:
	:type theCOG: gp_Pnt
	:rtype: float
") DistToGeometryCenter;
		virtual Standard_Real DistToGeometryCenter (const gp_Pnt & theCOG);
		%feature("compactdefaultargs") DetectedPoint;
		%feature("autodoc", "	* Calculates the point on a view ray that was detected during the run of selection algo by given depth. Is valid for point selection only

	:param theDepth:
	:type theDepth: float
	:rtype: gp_Pnt
") DetectedPoint;
		virtual gp_Pnt DetectedPoint (const Standard_Real theDepth);
		%feature("compactdefaultargs") IsClipped;
		%feature("autodoc", "	* Checks if the point of sensitive in which selection was detected belongs to the region defined by clipping planes

	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane &
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") IsClipped;
		virtual Standard_Boolean IsClipped (const Graphic3d_SequenceOfHClipPlane & thePlanes,const Standard_Real & theDepth);
		%feature("compactdefaultargs") AllowOverlapDetection;
		%feature("autodoc", "	* Is used for rectangular selection only If theIsToAllow is false, only fully included sensitives will be detected, otherwise the algorithm will mark both included and overlapped entities as matched

	:param theIsToAllow:
	:type theIsToAllow: bool
	:rtype: void
") AllowOverlapDetection;
		virtual void AllowOverlapDetection (const Standard_Boolean theIsToAllow);
		%feature("compactdefaultargs") IsOverlapAllowed;
		%feature("autodoc", "	:rtype: bool
") IsOverlapAllowed;
		virtual Standard_Boolean IsOverlapAllowed ();
		%feature("compactdefaultargs") GetVertices;
		%feature("autodoc", "	* A set of helper functions that return rectangular selecting frustum data

	:rtype: gp_Pnt *
") GetVertices;
		const gp_Pnt * GetVertices ();
		%feature("compactdefaultargs") GetNearPnt;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetNearPnt;
		gp_Pnt GetNearPnt ();
		%feature("compactdefaultargs") GetFarPnt;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetFarPnt;
		gp_Pnt GetFarPnt ();
};


%extend SelectMgr_SelectingVolumeManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_Selection;
class SelectMgr_Selection : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") SelectMgr_Selection;
		%feature("autodoc", "	* Constructs a selection object defined by the selection mode IdMode. The default setting 0 is the selection mode for a shape in its entirety.

	:param theModeIdx: default value is 0
	:type theModeIdx: int
	:rtype: None
") SelectMgr_Selection;
		 SelectMgr_Selection (const Standard_Integer theModeIdx = 0);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the sensitive primitive aprimitive to the list of stored entities in this object. Raises NullObject if the primitive is a null handle.

	:param theSensitive:
	:type theSensitive: Handle_SelectBasics_SensitiveEntity &
	:rtype: None
") Add;
		void Add (const Handle_SelectBasics_SensitiveEntity & theSensitive);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* empties the selection from all the stored entities

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* returns true if no sensitive entity is stored.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "	* returns the selection mode represented by this selection

	:rtype: int
") Mode;
		Standard_Integer Mode ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Begins an iteration scanning for sensitive primitives.

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Continues the iteration scanning for sensitive primitives with the mode defined in this framework.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Returns the next sensitive primitive found in the iteration. This is a scan for entities with the mode defined in this framework.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Sensitive;
		%feature("autodoc", "	* Returns any sensitive primitive in this framework.

	:rtype: Handle_SelectMgr_SensitiveEntity
") Sensitive;
		Handle_SelectMgr_SensitiveEntity Sensitive ();
		%feature("compactdefaultargs") UpdateStatus;
		%feature("autodoc", "	* Returns the flag UpdateFlag. This flage gives the update status of this framework in a ViewerSelector object: - full - partial, or - none.

	:rtype: SelectMgr_TypeOfUpdate
") UpdateStatus;
		SelectMgr_TypeOfUpdate UpdateStatus ();
		%feature("compactdefaultargs") UpdateStatus;
		%feature("autodoc", "	:param theStatus:
	:type theStatus: SelectMgr_TypeOfUpdate
	:rtype: None
") UpdateStatus;
		void UpdateStatus (const SelectMgr_TypeOfUpdate theStatus);
		%feature("compactdefaultargs") UpdateBVHStatus;
		%feature("autodoc", "	:param theStatus:
	:type theStatus: SelectMgr_TypeOfBVHUpdate
	:rtype: None
") UpdateBVHStatus;
		void UpdateBVHStatus (const SelectMgr_TypeOfBVHUpdate theStatus);
		%feature("compactdefaultargs") BVHUpdateStatus;
		%feature("autodoc", "	:rtype: SelectMgr_TypeOfBVHUpdate
") BVHUpdateStatus;
		SelectMgr_TypeOfBVHUpdate BVHUpdateStatus ();
		%feature("compactdefaultargs") GetSelectionState;
		%feature("autodoc", "	* Returns status of selection

	:rtype: SelectMgr_StateOfSelection
") GetSelectionState;
		const SelectMgr_StateOfSelection GetSelectionState ();
		%feature("compactdefaultargs") SetSelectionState;
		%feature("autodoc", "	* Sets status of selection

	:param theState:
	:type theState: SelectMgr_StateOfSelection
	:rtype: None
") SetSelectionState;
		void SetSelectionState (const SelectMgr_StateOfSelection theState);
		%feature("compactdefaultargs") Sensitivity;
		%feature("autodoc", "	* Returns sensitivity of the selection

	:rtype: int
") Sensitivity;
		Standard_Integer Sensitivity ();
		%feature("compactdefaultargs") SetSensitivity;
		%feature("autodoc", "	* Changes sensitivity of the selection and all its entities to the given value. IMPORTANT: This method does not update any outer selection structures, so for proper updates use SelectMgr_SelectionManager::SetSelectionSensitivity method.

	:param theNewSens:
	:type theNewSens: int
	:rtype: None
") SetSensitivity;
		void SetSensitivity (const Standard_Integer theNewSens);
};


%extend SelectMgr_Selection {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_Selection(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_Selection::Handle_SelectMgr_Selection %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_Selection;
class Handle_SelectMgr_Selection : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_SelectMgr_Selection();
        Handle_SelectMgr_Selection(const Handle_SelectMgr_Selection &aHandle);
        Handle_SelectMgr_Selection(const SelectMgr_Selection *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_Selection DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_Selection {
    SelectMgr_Selection* _get_reference() {
    return (SelectMgr_Selection*)$self->Access();
    }
};

%extend Handle_SelectMgr_Selection {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_Selection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SelectionManager;
class SelectMgr_SelectionManager : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") SelectMgr_SelectionManager;
		%feature("autodoc", "	* Constructs an empty selection manager object.

	:rtype: None
") SelectMgr_SelectionManager;
		 SelectMgr_SelectionManager ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the viewer selector theSelector to the list of known items.

	:param theSelector:
	:type theSelector: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") Add;
		void Add (const Handle_SelectMgr_ViewerSelector & theSelector);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes viewer selector theSelector from the list of known items.

	:param theSelector:
	:type theSelector: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") Remove;
		void Remove (const Handle_SelectMgr_ViewerSelector & theSelector);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Returns true if the manager contains the viewer selector theSelector in a list of known items.

	:param theSelector:
	:type theSelector: Handle_SelectMgr_ViewerSelector &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_SelectMgr_ViewerSelector & theSelector);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Returns true if the manager contains the selectable object theObject.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_SelectMgr_SelectableObject & theObject);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Loads and computes selection mode theMode (if it is not equal to -1) in global context and adds selectable object to BVH tree. If the object theObject has an already calculated selection with mode theMode and it was removed, the selection will be recalculated.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theMode: default value is -1
	:type theMode: int
	:rtype: None
") Load;
		void Load (const Handle_SelectMgr_SelectableObject & theObject,const Standard_Integer theMode = -1);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Loads and computes selection mode theMode (if it is not equal to -1) and adds selectable object to BVH tree. Does not perform check of existance of theObject in global context before addition, but adds theSelector to local context.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theSelector:
	:type theSelector: Handle_SelectMgr_ViewerSelector &
	:param theMode: default value is -1
	:type theMode: int
	:rtype: None
") Load;
		void Load (const Handle_SelectMgr_SelectableObject & theObject,const Handle_SelectMgr_ViewerSelector & theSelector,const Standard_Integer theMode = -1);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes selectable object theObject from all viewer selectors it was added to previously, removes it from all contexts and clears all computed selections of theObject.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:rtype: None
") Remove;
		void Remove (const Handle_SelectMgr_SelectableObject & theObject);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes theObject from theSelector, does not clear selections and unbind theObject from context maps.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theSelector:
	:type theSelector: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") Remove;
		void Remove (const Handle_SelectMgr_SelectableObject & theObject,const Handle_SelectMgr_ViewerSelector & theSelector);
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "	* Activates the selection mode theMode in the selector theSelector for the selectable object anObject. By default, theMode is equal to 0. If theSelector is set to default (NULL), the selection with the mode theMode will be activated in all the viewers available.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theMode: default value is 0
	:type theMode: int
	:param theSelector: default value is NULL
	:type theSelector: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") Activate;
		void Activate (const Handle_SelectMgr_SelectableObject & theObject,const Standard_Integer theMode = 0,const Handle_SelectMgr_ViewerSelector & theSelector = NULL);
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* Deactivates mode theMode of theObject in theSelector. If theMode value is set to default (-1), all avtive selection modes will be deactivated. Likewise, if theSelector value is set to default (NULL), theMode will be deactivated in all viewer selectors.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theMode: default value is -1
	:type theMode: int
	:param theSelector: default value is NULL
	:type theSelector: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") Deactivate;
		void Deactivate (const Handle_SelectMgr_SelectableObject & theObject,const Standard_Integer theMode = -1,const Handle_SelectMgr_ViewerSelector & theSelector = NULL);
		%feature("compactdefaultargs") IsActivated;
		%feature("autodoc", "	* Returns true if the selection with theMode is active for the selectable object theObject and selector theSelector. If all parameters are set to default values, it returns it there is any active selection in any known viewer selector for object theObject.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theMode: default value is -1
	:type theMode: int
	:param theSelector: default value is NULL
	:type theSelector: Handle_SelectMgr_ViewerSelector &
	:rtype: bool
") IsActivated;
		Standard_Boolean IsActivated (const Handle_SelectMgr_SelectableObject & theObject,const Standard_Integer theMode = -1,const Handle_SelectMgr_ViewerSelector & theSelector = NULL);
		%feature("compactdefaultargs") ClearSelectionStructures;
		%feature("autodoc", "	* Removes sensitive entities from all viewer selectors after method Clear() was called to the selection they belonged to or it was recomputed somehow.

	:param theObj:
	:type theObj: Handle_SelectMgr_SelectableObject &
	:param theMode: default value is -1
	:type theMode: int
	:param theSelector: default value is NULL
	:type theSelector: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") ClearSelectionStructures;
		void ClearSelectionStructures (const Handle_SelectMgr_SelectableObject & theObj,const Standard_Integer theMode = -1,const Handle_SelectMgr_ViewerSelector & theSelector = NULL);
		%feature("compactdefaultargs") RestoreSelectionStructures;
		%feature("autodoc", "	* Re-adds newely calculated sensitive entities of recomputed selection defined by mode theMode to all viewer selectors contained that selection.

	:param theObj:
	:type theObj: Handle_SelectMgr_SelectableObject &
	:param theMode: default value is -1
	:type theMode: int
	:param theSelector: default value is NULL
	:type theSelector: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") RestoreSelectionStructures;
		void RestoreSelectionStructures (const Handle_SelectMgr_SelectableObject & theObj,const Standard_Integer theMode = -1,const Handle_SelectMgr_ViewerSelector & theSelector = NULL);
		%feature("compactdefaultargs") RecomputeSelection;
		%feature("autodoc", "	* Recomputes activated selections of theObject for all known viewer selectors according to theMode specified. If theMode is set to default (-1), then all activated selections will be recomputed. If theIsForce is set to true, then selection mode theMode for object theObject will be recomputed regardless of its activation status.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theIsForce: default value is Standard_False
	:type theIsForce: bool
	:param theMode: default value is -1
	:type theMode: int
	:rtype: None
") RecomputeSelection;
		void RecomputeSelection (const Handle_SelectMgr_SelectableObject & theObject,const Standard_Boolean theIsForce = Standard_False,const Standard_Integer theMode = -1);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates all selections of theObject in all viewer selectors according to its current update status. If theIsForce is set to true, the call is equal to recomputation.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theIsForce: default value is Standard_True
	:type theIsForce: bool
	:rtype: None
") Update;
		void Update (const Handle_SelectMgr_SelectableObject & theObject,const Standard_Boolean theIsForce = Standard_True);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates all selections of theObject in specified viewer selector according to its current update status. If theIsForce is set to true, the call is equal to recomputation.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theSelector:
	:type theSelector: Handle_SelectMgr_ViewerSelector &
	:param theIsForce: default value is Standard_True
	:type theIsForce: bool
	:rtype: None
") Update;
		void Update (const Handle_SelectMgr_SelectableObject & theObject,const Handle_SelectMgr_ViewerSelector & theSelector,const Standard_Boolean theIsForce = Standard_True);
		%feature("compactdefaultargs") SetUpdateMode;
		%feature("autodoc", "	* Sets type of update of all selections of theObject to the given theType.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theType:
	:type theType: SelectMgr_TypeOfUpdate
	:rtype: None
") SetUpdateMode;
		void SetUpdateMode (const Handle_SelectMgr_SelectableObject & theObject,const SelectMgr_TypeOfUpdate theType);
		%feature("compactdefaultargs") SetUpdateMode;
		%feature("autodoc", "	* Sets type of update of selection with theMode of theObject to the given theType.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theMode:
	:type theMode: int
	:param theType:
	:type theType: SelectMgr_TypeOfUpdate
	:rtype: None
") SetUpdateMode;
		void SetUpdateMode (const Handle_SelectMgr_SelectableObject & theObject,const Standard_Integer theMode,const SelectMgr_TypeOfUpdate theType);
		%feature("compactdefaultargs") SetSelectionSensitivity;
		%feature("autodoc", "	* Allows to manage sensitivity of a particular selection of interactive object theObject and changes previous sensitivity value of all sensitive entities in selection with theMode to the given theNewSensitivity.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theMode:
	:type theMode: int
	:param theNewSens:
	:type theNewSens: int
	:rtype: None
") SetSelectionSensitivity;
		void SetSelectionSensitivity (const Handle_SelectMgr_SelectableObject & theObject,const Standard_Integer theMode,const Standard_Integer theNewSens);
};


%extend SelectMgr_SelectionManager {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_SelectionManager(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_SelectionManager::Handle_SelectMgr_SelectionManager %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_SelectionManager;
class Handle_SelectMgr_SelectionManager : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_SelectMgr_SelectionManager();
        Handle_SelectMgr_SelectionManager(const Handle_SelectMgr_SelectionManager &aHandle);
        Handle_SelectMgr_SelectionManager(const SelectMgr_SelectionManager *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_SelectionManager DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_SelectionManager {
    SelectMgr_SelectionManager* _get_reference() {
    return (SelectMgr_SelectionManager*)$self->Access();
    }
};

%extend Handle_SelectMgr_SelectionManager {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_SelectionManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SensitiveEntity;
class SelectMgr_SensitiveEntity : public Standard_Transient {
	public:
		%feature("compactdefaultargs") SelectMgr_SensitiveEntity;
		%feature("autodoc", "	* Creates new inactive for selection object with base entity theEntity

	:param theEntity:
	:type theEntity: Handle_SelectBasics_SensitiveEntity &
	:rtype: None
") SelectMgr_SensitiveEntity;
		 SelectMgr_SensitiveEntity (const Handle_SelectBasics_SensitiveEntity & theEntity);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears up all resources and memory

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") BaseSensitive;
		%feature("autodoc", "	* Returns related instance of SelectBasics class

	:rtype: Handle_SelectBasics_SensitiveEntity
") BaseSensitive;
		Handle_SelectBasics_SensitiveEntity BaseSensitive ();
		%feature("compactdefaultargs") IsActiveForSelection;
		%feature("autodoc", "	* Returns true if this entity belongs to the active selection mode of parent object

	:rtype: bool
") IsActiveForSelection;
		Standard_Boolean IsActiveForSelection ();
		%feature("compactdefaultargs") ResetSelectionActiveStatus;
		%feature("autodoc", "	* Marks entity as inactive for selection

	:rtype: None
") ResetSelectionActiveStatus;
		void ResetSelectionActiveStatus ();
		%feature("compactdefaultargs") SetActiveForSelection;
		%feature("autodoc", "	* Marks entity as active for selection

	:rtype: None
") SetActiveForSelection;
		void SetActiveForSelection ();
};


%extend SelectMgr_SensitiveEntity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_SensitiveEntity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_SensitiveEntity::Handle_SelectMgr_SensitiveEntity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_SensitiveEntity;
class Handle_SelectMgr_SensitiveEntity : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_SelectMgr_SensitiveEntity();
        Handle_SelectMgr_SensitiveEntity(const Handle_SelectMgr_SensitiveEntity &aHandle);
        Handle_SelectMgr_SensitiveEntity(const SelectMgr_SensitiveEntity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_SensitiveEntity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_SensitiveEntity {
    SelectMgr_SensitiveEntity* _get_reference() {
    return (SelectMgr_SensitiveEntity*)$self->Access();
    }
};

%extend Handle_SelectMgr_SensitiveEntity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_SensitiveEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SequenceNodeOfSequenceOfFilter;
class SelectMgr_SequenceNodeOfSequenceOfFilter : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") SelectMgr_SequenceNodeOfSequenceOfFilter;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectMgr_Filter &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") SelectMgr_SequenceNodeOfSequenceOfFilter;
		 SelectMgr_SequenceNodeOfSequenceOfFilter (const Handle_SelectMgr_Filter & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_Filter
") Value;
		Handle_SelectMgr_Filter Value ();
};


%extend SelectMgr_SequenceNodeOfSequenceOfFilter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_SequenceNodeOfSequenceOfFilter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_SequenceNodeOfSequenceOfFilter::Handle_SelectMgr_SequenceNodeOfSequenceOfFilter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_SequenceNodeOfSequenceOfFilter;
class Handle_SelectMgr_SequenceNodeOfSequenceOfFilter : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_SelectMgr_SequenceNodeOfSequenceOfFilter();
        Handle_SelectMgr_SequenceNodeOfSequenceOfFilter(const Handle_SelectMgr_SequenceNodeOfSequenceOfFilter &aHandle);
        Handle_SelectMgr_SequenceNodeOfSequenceOfFilter(const SelectMgr_SequenceNodeOfSequenceOfFilter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_SequenceNodeOfSequenceOfFilter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_SequenceNodeOfSequenceOfFilter {
    SelectMgr_SequenceNodeOfSequenceOfFilter* _get_reference() {
    return (SelectMgr_SequenceNodeOfSequenceOfFilter*)$self->Access();
    }
};

%extend Handle_SelectMgr_SequenceNodeOfSequenceOfFilter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_SequenceNodeOfSequenceOfFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SequenceNodeOfSequenceOfOwner;
class SelectMgr_SequenceNodeOfSequenceOfOwner : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") SelectMgr_SequenceNodeOfSequenceOfOwner;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectMgr_EntityOwner &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") SelectMgr_SequenceNodeOfSequenceOfOwner;
		 SelectMgr_SequenceNodeOfSequenceOfOwner (const Handle_SelectMgr_EntityOwner & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_EntityOwner
") Value;
		Handle_SelectMgr_EntityOwner Value ();
};


%extend SelectMgr_SequenceNodeOfSequenceOfOwner {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_SequenceNodeOfSequenceOfOwner(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_SequenceNodeOfSequenceOfOwner::Handle_SelectMgr_SequenceNodeOfSequenceOfOwner %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_SequenceNodeOfSequenceOfOwner;
class Handle_SelectMgr_SequenceNodeOfSequenceOfOwner : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_SelectMgr_SequenceNodeOfSequenceOfOwner();
        Handle_SelectMgr_SequenceNodeOfSequenceOfOwner(const Handle_SelectMgr_SequenceNodeOfSequenceOfOwner &aHandle);
        Handle_SelectMgr_SequenceNodeOfSequenceOfOwner(const SelectMgr_SequenceNodeOfSequenceOfOwner *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_SequenceNodeOfSequenceOfOwner DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_SequenceNodeOfSequenceOfOwner {
    SelectMgr_SequenceNodeOfSequenceOfOwner* _get_reference() {
    return (SelectMgr_SequenceNodeOfSequenceOfOwner*)$self->Access();
    }
};

%extend Handle_SelectMgr_SequenceNodeOfSequenceOfOwner {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_SequenceNodeOfSequenceOfOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SequenceNodeOfSequenceOfSelector;
class SelectMgr_SequenceNodeOfSequenceOfSelector : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") SelectMgr_SequenceNodeOfSequenceOfSelector;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectMgr_ViewerSelector &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") SelectMgr_SequenceNodeOfSequenceOfSelector;
		 SelectMgr_SequenceNodeOfSequenceOfSelector (const Handle_SelectMgr_ViewerSelector & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_ViewerSelector
") Value;
		Handle_SelectMgr_ViewerSelector Value ();
};


%extend SelectMgr_SequenceNodeOfSequenceOfSelector {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_SequenceNodeOfSequenceOfSelector(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_SequenceNodeOfSequenceOfSelector::Handle_SelectMgr_SequenceNodeOfSequenceOfSelector %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_SequenceNodeOfSequenceOfSelector;
class Handle_SelectMgr_SequenceNodeOfSequenceOfSelector : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_SelectMgr_SequenceNodeOfSequenceOfSelector();
        Handle_SelectMgr_SequenceNodeOfSequenceOfSelector(const Handle_SelectMgr_SequenceNodeOfSequenceOfSelector &aHandle);
        Handle_SelectMgr_SequenceNodeOfSequenceOfSelector(const SelectMgr_SequenceNodeOfSequenceOfSelector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_SequenceNodeOfSequenceOfSelector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_SequenceNodeOfSequenceOfSelector {
    SelectMgr_SequenceNodeOfSequenceOfSelector* _get_reference() {
    return (SelectMgr_SequenceNodeOfSequenceOfSelector*)$self->Access();
    }
};

%extend Handle_SelectMgr_SequenceNodeOfSequenceOfSelector {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_SequenceNodeOfSequenceOfSelector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SequenceOfFilter;
class SelectMgr_SequenceOfFilter : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") SelectMgr_SequenceOfFilter;
		%feature("autodoc", "	:rtype: None
") SelectMgr_SequenceOfFilter;
		 SelectMgr_SequenceOfFilter ();
		%feature("compactdefaultargs") SelectMgr_SequenceOfFilter;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_SequenceOfFilter &
	:rtype: None
") SelectMgr_SequenceOfFilter;
		 SelectMgr_SequenceOfFilter (const SelectMgr_SequenceOfFilter & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_SequenceOfFilter &
	:rtype: SelectMgr_SequenceOfFilter
") Assign;
		const SelectMgr_SequenceOfFilter & Assign (const SelectMgr_SequenceOfFilter & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_SequenceOfFilter &
	:rtype: SelectMgr_SequenceOfFilter
") operator =;
		const SelectMgr_SequenceOfFilter & operator = (const SelectMgr_SequenceOfFilter & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_SelectMgr_Filter &
	:rtype: None
") Append;
		void Append (const Handle_SelectMgr_Filter & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: SelectMgr_SequenceOfFilter &
	:rtype: None
") Append;
		void Append (SelectMgr_SequenceOfFilter & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_SelectMgr_Filter &
	:rtype: None
") Prepend;
		void Prepend (const Handle_SelectMgr_Filter & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: SelectMgr_SequenceOfFilter &
	:rtype: None
") Prepend;
		void Prepend (SelectMgr_SequenceOfFilter & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_SelectMgr_Filter &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_SelectMgr_Filter & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: SelectMgr_SequenceOfFilter &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,SelectMgr_SequenceOfFilter & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_SelectMgr_Filter &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_SelectMgr_Filter & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: SelectMgr_SequenceOfFilter &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,SelectMgr_SequenceOfFilter & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_Filter
") First;
		Handle_SelectMgr_Filter First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_Filter
") Last;
		Handle_SelectMgr_Filter Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: SelectMgr_SequenceOfFilter &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,SelectMgr_SequenceOfFilter & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_SelectMgr_Filter
") Value;
		Handle_SelectMgr_Filter Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_SelectMgr_Filter &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_SelectMgr_Filter & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_SelectMgr_Filter
") ChangeValue;
		Handle_SelectMgr_Filter ChangeValue (const Standard_Integer Index);
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


%extend SelectMgr_SequenceOfFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SequenceOfOwner;
class SelectMgr_SequenceOfOwner : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") SelectMgr_SequenceOfOwner;
		%feature("autodoc", "	:rtype: None
") SelectMgr_SequenceOfOwner;
		 SelectMgr_SequenceOfOwner ();
		%feature("compactdefaultargs") SelectMgr_SequenceOfOwner;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_SequenceOfOwner &
	:rtype: None
") SelectMgr_SequenceOfOwner;
		 SelectMgr_SequenceOfOwner (const SelectMgr_SequenceOfOwner & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_SequenceOfOwner &
	:rtype: SelectMgr_SequenceOfOwner
") Assign;
		const SelectMgr_SequenceOfOwner & Assign (const SelectMgr_SequenceOfOwner & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_SequenceOfOwner &
	:rtype: SelectMgr_SequenceOfOwner
") operator =;
		const SelectMgr_SequenceOfOwner & operator = (const SelectMgr_SequenceOfOwner & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_SelectMgr_EntityOwner &
	:rtype: None
") Append;
		void Append (const Handle_SelectMgr_EntityOwner & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: SelectMgr_SequenceOfOwner &
	:rtype: None
") Append;
		void Append (SelectMgr_SequenceOfOwner & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_SelectMgr_EntityOwner &
	:rtype: None
") Prepend;
		void Prepend (const Handle_SelectMgr_EntityOwner & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: SelectMgr_SequenceOfOwner &
	:rtype: None
") Prepend;
		void Prepend (SelectMgr_SequenceOfOwner & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_SelectMgr_EntityOwner &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_SelectMgr_EntityOwner & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: SelectMgr_SequenceOfOwner &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,SelectMgr_SequenceOfOwner & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_SelectMgr_EntityOwner &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_SelectMgr_EntityOwner & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: SelectMgr_SequenceOfOwner &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,SelectMgr_SequenceOfOwner & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_EntityOwner
") First;
		Handle_SelectMgr_EntityOwner First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_EntityOwner
") Last;
		Handle_SelectMgr_EntityOwner Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: SelectMgr_SequenceOfOwner &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,SelectMgr_SequenceOfOwner & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_SelectMgr_EntityOwner
") Value;
		Handle_SelectMgr_EntityOwner Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_SelectMgr_EntityOwner &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_SelectMgr_EntityOwner & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_SelectMgr_EntityOwner
") ChangeValue;
		Handle_SelectMgr_EntityOwner ChangeValue (const Standard_Integer Index);
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


%extend SelectMgr_SequenceOfOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SequenceOfSelector;
class SelectMgr_SequenceOfSelector : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") SelectMgr_SequenceOfSelector;
		%feature("autodoc", "	:rtype: None
") SelectMgr_SequenceOfSelector;
		 SelectMgr_SequenceOfSelector ();
		%feature("compactdefaultargs") SelectMgr_SequenceOfSelector;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_SequenceOfSelector &
	:rtype: None
") SelectMgr_SequenceOfSelector;
		 SelectMgr_SequenceOfSelector (const SelectMgr_SequenceOfSelector & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_SequenceOfSelector &
	:rtype: SelectMgr_SequenceOfSelector
") Assign;
		const SelectMgr_SequenceOfSelector & Assign (const SelectMgr_SequenceOfSelector & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: SelectMgr_SequenceOfSelector &
	:rtype: SelectMgr_SequenceOfSelector
") operator =;
		const SelectMgr_SequenceOfSelector & operator = (const SelectMgr_SequenceOfSelector & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") Append;
		void Append (const Handle_SelectMgr_ViewerSelector & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: SelectMgr_SequenceOfSelector &
	:rtype: None
") Append;
		void Append (SelectMgr_SequenceOfSelector & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") Prepend;
		void Prepend (const Handle_SelectMgr_ViewerSelector & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: SelectMgr_SequenceOfSelector &
	:rtype: None
") Prepend;
		void Prepend (SelectMgr_SequenceOfSelector & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_SelectMgr_ViewerSelector & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: SelectMgr_SequenceOfSelector &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,SelectMgr_SequenceOfSelector & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_SelectMgr_ViewerSelector & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: SelectMgr_SequenceOfSelector &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,SelectMgr_SequenceOfSelector & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_ViewerSelector
") First;
		Handle_SelectMgr_ViewerSelector First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_SelectMgr_ViewerSelector
") Last;
		Handle_SelectMgr_ViewerSelector Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: SelectMgr_SequenceOfSelector &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,SelectMgr_SequenceOfSelector & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_SelectMgr_ViewerSelector
") Value;
		Handle_SelectMgr_ViewerSelector Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_SelectMgr_ViewerSelector & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_SelectMgr_ViewerSelector
") ChangeValue;
		Handle_SelectMgr_ViewerSelector ChangeValue (const Standard_Integer Index);
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


%extend SelectMgr_SequenceOfSelector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SortCriterion;
class SelectMgr_SortCriterion {
	public:
		%feature("compactdefaultargs") SelectMgr_SortCriterion;
		%feature("autodoc", "	:rtype: None
") SelectMgr_SortCriterion;
		 SelectMgr_SortCriterion ();
		%feature("compactdefaultargs") SelectMgr_SortCriterion;
		%feature("autodoc", "	* Defines parameters of selection criterion: - Priority: selection priority - Depth: distance from the view plane to the entity - MinDist: distance from the clicked point to the entity on the view plane - Tol: tolerance used for selecting candidates - PreferClosest: specify whether closest object is preferred even if if has less priority

	:param thePriority:
	:type thePriority: int
	:param theDepth:
	:type theDepth: float
	:param theMinDist:
	:type theMinDist: float
	:param theTol:
	:type theTol: float
	:param PreferClosest:
	:type PreferClosest: bool
	:rtype: None
") SelectMgr_SortCriterion;
		 SelectMgr_SortCriterion (const Standard_Integer thePriority,const Standard_Real theDepth,const Standard_Real theMinDist,const Standard_Real theTol,const Standard_Boolean PreferClosest);
		%feature("compactdefaultargs") SetPriority;
		%feature("autodoc", "	:param P:
	:type P: int
	:rtype: None
") SetPriority;
		void SetPriority (const Standard_Integer P);
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "	:param D:
	:type D: float
	:rtype: None
") SetDepth;
		void SetDepth (const Standard_Real D);
		%feature("compactdefaultargs") SetMinDist;
		%feature("autodoc", "	:param D:
	:type D: float
	:rtype: None
") SetMinDist;
		void SetMinDist (const Standard_Real D);
		%feature("compactdefaultargs") SetTol;
		%feature("autodoc", "	:param T:
	:type T: float
	:rtype: None
") SetTol;
		void SetTol (const Standard_Real T);
		%feature("compactdefaultargs") Priority;
		%feature("autodoc", "	:rtype: int
") Priority;
		Standard_Integer Priority ();
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	:rtype: float
") Depth;
		Standard_Real Depth ();
		%feature("compactdefaultargs") MinDist;
		%feature("autodoc", "	:rtype: float
") MinDist;
		Standard_Real MinDist ();
		%feature("compactdefaultargs") Tol;
		%feature("autodoc", "	:rtype: float
") Tol;
		Standard_Real Tol ();
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "	:param anOtherCriterion:
	:type anOtherCriterion: SelectMgr_SortCriterion &
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const SelectMgr_SortCriterion & anOtherCriterion);
		%feature("compactdefaultargs") operator >;
		%feature("autodoc", "	:param anOtherCriterion:
	:type anOtherCriterion: SelectMgr_SortCriterion &
	:rtype: bool
") operator >;
		Standard_Boolean operator > (const SelectMgr_SortCriterion & anOtherCriterion);
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "	:param anOtherCriterion:
	:type anOtherCriterion: SelectMgr_SortCriterion &
	:rtype: bool
") IsLower;
		Standard_Boolean IsLower (const SelectMgr_SortCriterion & anOtherCriterion);
		%feature("compactdefaultargs") operator <;
		%feature("autodoc", "	:param anOtherCriterion:
	:type anOtherCriterion: SelectMgr_SortCriterion &
	:rtype: bool
") operator <;
		Standard_Boolean operator < (const SelectMgr_SortCriterion & anOtherCriterion);
};


%extend SelectMgr_SortCriterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_ViewerSelector;
class SelectMgr_ViewerSelector : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Empties all the tables, removes all selections...

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Sensitivity;
		%feature("autodoc", "	* returns the Sensitivity of picking

	:rtype: int
") Sensitivity;
		Standard_Integer Sensitivity ();
		%feature("compactdefaultargs") SortResult;
		%feature("autodoc", "	* Sorts the detected entites by priority and distance. to be redefined if other criterion are used...

	:rtype: None
") SortResult;
		void SortResult ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Begins an iteration scanning for the owners detected at a position in the view.

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Continues the interation scanning for the owners detected at a position in the view, or - continues the iteration scanning for the owner closest to the position in the view.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Returns the next owner found in the iteration. This is a scan for the owners detected at a position in the view.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Picked;
		%feature("autodoc", "	* Returns the current selected entity detected by the selector;

	:rtype: Handle_SelectMgr_EntityOwner
") Picked;
		Handle_SelectMgr_EntityOwner Picked ();
		%feature("compactdefaultargs") OnePicked;
		%feature("autodoc", "	* Returns the picked element with the highest priority, and which is the closest to the last successful mouse position.

	:rtype: Handle_SelectMgr_EntityOwner
") OnePicked;
		Handle_SelectMgr_EntityOwner OnePicked ();
		%feature("compactdefaultargs") SetPickClosest;
		%feature("autodoc", "	* Set preference of selecting one object for OnePicked() method: - If True, objects with less depth (distance fron the view plane) are preferred regardless of priority (priority is used then to choose among objects with similar depth), - If False, objects with higher priority are preferred regardless of the depth which is used to choose among objects of the same priority.

	:param preferClosest:
	:type preferClosest: bool
	:rtype: None
") SetPickClosest;
		void SetPickClosest (const Standard_Boolean preferClosest);
		%feature("compactdefaultargs") NbPicked;
		%feature("autodoc", "	* Returns the number of owners found at a position in the view by the Init - More - Next - Picked iteration.

	:rtype: int
") NbPicked;
		Standard_Integer NbPicked ();
		%feature("compactdefaultargs") Picked;
		%feature("autodoc", "	* Returns the entity which is at rank <aRank> in the list of stored ones.

	:param aRank:
	:type aRank: int
	:rtype: Handle_SelectMgr_EntityOwner
") Picked;
		Handle_SelectMgr_EntityOwner Picked (const Standard_Integer aRank);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_SelectMgr_SelectableObject & theObject);
		%feature("compactdefaultargs") Modes;
		%feature("autodoc", "	* Returns the list of selection modes ModeList found in this selector for the selectable object aSelectableObject. Returns true if aSelectableObject is referenced inside this selector; returns false if the object is not present in this selector.

	:param theSelectableObject:
	:type theSelectableObject: Handle_SelectMgr_SelectableObject &
	:param theModeList:
	:type theModeList: TColStd_ListOfInteger &
	:param theWantedState: default value is SelectMgr_SOS_Any
	:type theWantedState: SelectMgr_StateOfSelection
	:rtype: bool
") Modes;
		Standard_Boolean Modes (const Handle_SelectMgr_SelectableObject & theSelectableObject,TColStd_ListOfInteger & theModeList,const SelectMgr_StateOfSelection theWantedState = SelectMgr_SOS_Any);
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "	* Returns true if the selectable object aSelectableObject having the selection mode aMode is active in this selector.

	:param theSelectableObject:
	:type theSelectableObject: Handle_SelectMgr_SelectableObject &
	:param theMode:
	:type theMode: int
	:rtype: bool
") IsActive;
		Standard_Boolean IsActive (const Handle_SelectMgr_SelectableObject & theSelectableObject,const Standard_Integer theMode);
		%feature("compactdefaultargs") IsInside;
		%feature("autodoc", "	* Returns true if the selectable object aSelectableObject having the selection mode aMode is in this selector.

	:param theSelectableObject:
	:type theSelectableObject: Handle_SelectMgr_SelectableObject &
	:param theMode:
	:type theMode: int
	:rtype: bool
") IsInside;
		Standard_Boolean IsInside (const Handle_SelectMgr_SelectableObject & theSelectableObject,const Standard_Integer theMode);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the selection status Status of the selection aSelection.

	:param theSelection:
	:type theSelection: Handle_SelectMgr_Selection &
	:rtype: SelectMgr_StateOfSelection
") Status;
		SelectMgr_StateOfSelection Status (const Handle_SelectMgr_Selection & theSelection);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:param theSelectableObject:
	:type theSelectableObject: Handle_SelectMgr_SelectableObject &
	:rtype: TCollection_AsciiString
") Status;
		TCollection_AsciiString Status (const Handle_SelectMgr_SelectableObject & theSelectableObject);
		%feature("compactdefaultargs") ActiveOwners;
		%feature("autodoc", "	* Returns the list of active entity owners

	:param theOwners:
	:type theOwners: NCollection_List<Handle_SelectBasics_EntityOwner> &
	:rtype: None
") ActiveOwners;
		void ActiveOwners (NCollection_List<Handle_SelectBasics_EntityOwner> & theOwners);
		%feature("compactdefaultargs") AddSelectableObject;
		%feature("autodoc", "	* Adds new object to the map of selectable objects

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:rtype: None
") AddSelectableObject;
		void AddSelectableObject (const Handle_SelectMgr_SelectableObject & theObject);
		%feature("compactdefaultargs") AddSelectionToObject;
		%feature("autodoc", "	* Adds new selection to the object and builds its BVH tree

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theSelection:
	:type theSelection: Handle_SelectMgr_Selection &
	:rtype: None
") AddSelectionToObject;
		void AddSelectionToObject (const Handle_SelectMgr_SelectableObject & theObject,const Handle_SelectMgr_Selection & theSelection);
		%feature("compactdefaultargs") RemoveSelectableObject;
		%feature("autodoc", "	* Removes selectable object from map of selectable ones

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:rtype: None
") RemoveSelectableObject;
		void RemoveSelectableObject (const Handle_SelectMgr_SelectableObject & theObject);
		%feature("compactdefaultargs") RemoveSelectionOfObject;
		%feature("autodoc", "	* Removes selection of the object and marks its BVH tree for rebuild

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theSelection:
	:type theSelection: Handle_SelectMgr_Selection &
	:rtype: None
") RemoveSelectionOfObject;
		void RemoveSelectionOfObject (const Handle_SelectMgr_SelectableObject & theObject,const Handle_SelectMgr_Selection & theSelection);
		%feature("compactdefaultargs") RebuildObjectsTree;
		%feature("autodoc", "	* Marks BVH of selectable objects for rebuild. Parameter theIsForce set as true guarantees that 1st level BVH for the viewer selector will be rebuilt during this call

	:param theIsForce: default value is Standard_False
	:type theIsForce: bool
	:rtype: None
") RebuildObjectsTree;
		void RebuildObjectsTree (const Standard_Boolean theIsForce = Standard_False);
		%feature("compactdefaultargs") RebuildSensitivesTree;
		%feature("autodoc", "	* Marks BVH of sensitive entities of particular selectable object for rebuild. Parameter theIsForce set as true guarantees that 2nd level BVH for the object given will be rebuilt during this call

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:param theIsForce: default value is Standard_False
	:type theIsForce: bool
	:rtype: None
") RebuildSensitivesTree;
		void RebuildSensitivesTree (const Handle_SelectMgr_SelectableObject & theObject,const Standard_Boolean theIsForce = Standard_False);
		%feature("compactdefaultargs") InitDetected;
		%feature("autodoc", "	* Initializes internal iterator for stored detected sensitive entities

	:rtype: None
") InitDetected;
		void InitDetected ();
		%feature("compactdefaultargs") NextDetected;
		%feature("autodoc", "	* Makes a step along the map of detected sensitive entities and their owners

	:rtype: None
") NextDetected;
		void NextDetected ();
		%feature("compactdefaultargs") MoreDetected;
		%feature("autodoc", "	* Returns true if iterator of map of detected sensitive entities has reached its end

	:rtype: bool
") MoreDetected;
		Standard_Boolean MoreDetected ();
		%feature("compactdefaultargs") DetectedEntity;
		%feature("autodoc", "	* Returns sensitive entity that was detected during the previous run of selection algorithm

	:rtype: Handle_SelectBasics_SensitiveEntity
") DetectedEntity;
		Handle_SelectBasics_SensitiveEntity DetectedEntity ();
		%feature("compactdefaultargs") GetManager;
		%feature("autodoc", "	* Returns instance of selecting volume manager of the viewer selector

	:rtype: SelectMgr_SelectingVolumeManager
") GetManager;
		SelectMgr_SelectingVolumeManager & GetManager ();
};


%extend SelectMgr_ViewerSelector {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_ViewerSelector(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_ViewerSelector::Handle_SelectMgr_ViewerSelector %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_ViewerSelector;
class Handle_SelectMgr_ViewerSelector : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_SelectMgr_ViewerSelector();
        Handle_SelectMgr_ViewerSelector(const Handle_SelectMgr_ViewerSelector &aHandle);
        Handle_SelectMgr_ViewerSelector(const SelectMgr_ViewerSelector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_ViewerSelector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_ViewerSelector {
    SelectMgr_ViewerSelector* _get_reference() {
    return (SelectMgr_ViewerSelector*)$self->Access();
    }
};

%extend Handle_SelectMgr_ViewerSelector {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_ViewerSelector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_CompositionFilter;
class SelectMgr_CompositionFilter : public SelectMgr_Filter {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the filter afilter to a filter object created by a filter class inheriting this framework.

	:param afilter:
	:type afilter: Handle_SelectMgr_Filter &
	:rtype: None
") Add;
		void Add (const Handle_SelectMgr_Filter & afilter);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the filter aFilter from this framework.

	:param aFilter:
	:type aFilter: Handle_SelectMgr_Filter &
	:rtype: None
") Remove;
		void Remove (const Handle_SelectMgr_Filter & aFilter);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns true if this framework is empty.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "	* Returns true if the filter aFilter is in this framework.

	:param aFilter:
	:type aFilter: Handle_SelectMgr_Filter &
	:rtype: bool
") IsIn;
		Standard_Boolean IsIn (const Handle_SelectMgr_Filter & aFilter);
		%feature("compactdefaultargs") StoredFilters;
		%feature("autodoc", "	* Returns the list of stored filters from this framework.

	:rtype: SelectMgr_ListOfFilter
") StoredFilters;
		const SelectMgr_ListOfFilter & StoredFilters ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the filters used in this framework.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "	:param aStandardMode:
	:type aStandardMode: TopAbs_ShapeEnum
	:rtype: bool
") ActsOn;
		virtual Standard_Boolean ActsOn (const TopAbs_ShapeEnum aStandardMode);
};


%extend SelectMgr_CompositionFilter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_CompositionFilter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_CompositionFilter::Handle_SelectMgr_CompositionFilter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_CompositionFilter;
class Handle_SelectMgr_CompositionFilter : public Handle_SelectMgr_Filter {

    public:
        // constructors
        Handle_SelectMgr_CompositionFilter();
        Handle_SelectMgr_CompositionFilter(const Handle_SelectMgr_CompositionFilter &aHandle);
        Handle_SelectMgr_CompositionFilter(const SelectMgr_CompositionFilter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_CompositionFilter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_CompositionFilter {
    SelectMgr_CompositionFilter* _get_reference() {
    return (SelectMgr_CompositionFilter*)$self->Access();
    }
};

%extend Handle_SelectMgr_CompositionFilter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_CompositionFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_AndFilter;
class SelectMgr_AndFilter : public SelectMgr_CompositionFilter {
	public:
		%feature("compactdefaultargs") SelectMgr_AndFilter;
		%feature("autodoc", "	* Constructs an empty selection filter object for two or more types of entity.

	:rtype: None
") SelectMgr_AndFilter;
		 SelectMgr_AndFilter ();
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	:param anobj:
	:type anobj: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsOk;
		Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anobj);
};


%extend SelectMgr_AndFilter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_AndFilter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_AndFilter::Handle_SelectMgr_AndFilter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_AndFilter;
class Handle_SelectMgr_AndFilter : public Handle_SelectMgr_CompositionFilter {

    public:
        // constructors
        Handle_SelectMgr_AndFilter();
        Handle_SelectMgr_AndFilter(const Handle_SelectMgr_AndFilter &aHandle);
        Handle_SelectMgr_AndFilter(const SelectMgr_AndFilter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_AndFilter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_AndFilter {
    SelectMgr_AndFilter* _get_reference() {
    return (SelectMgr_AndFilter*)$self->Access();
    }
};

%extend Handle_SelectMgr_AndFilter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_AndFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_OrFilter;
class SelectMgr_OrFilter : public SelectMgr_CompositionFilter {
	public:
		%feature("compactdefaultargs") SelectMgr_OrFilter;
		%feature("autodoc", "	* Constructs an empty or selection filter.

	:rtype: None
") SelectMgr_OrFilter;
		 SelectMgr_OrFilter ();
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	:param anobj:
	:type anobj: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsOk;
		Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anobj);
		%feature("compactdefaultargs") SetDisabledObjects;
		%feature("autodoc", "	* Disable selection of specified objects.

	:param theObjects:
	:type theObjects: Handle_Graphic3d_NMapOfTransient &
	:rtype: None
") SetDisabledObjects;
		void SetDisabledObjects (const Handle_Graphic3d_NMapOfTransient & theObjects);
};


%extend SelectMgr_OrFilter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectMgr_OrFilter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectMgr_OrFilter::Handle_SelectMgr_OrFilter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectMgr_OrFilter;
class Handle_SelectMgr_OrFilter : public Handle_SelectMgr_CompositionFilter {

    public:
        // constructors
        Handle_SelectMgr_OrFilter();
        Handle_SelectMgr_OrFilter(const Handle_SelectMgr_OrFilter &aHandle);
        Handle_SelectMgr_OrFilter(const SelectMgr_OrFilter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectMgr_OrFilter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectMgr_OrFilter {
    SelectMgr_OrFilter* _get_reference() {
    return (SelectMgr_OrFilter*)$self->Access();
    }
};

%extend Handle_SelectMgr_OrFilter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectMgr_OrFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
