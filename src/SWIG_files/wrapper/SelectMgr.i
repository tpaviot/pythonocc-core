/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)


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
%define SELECTMGRDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=SELECTMGRDOCSTRING) SelectMgr

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%include SelectMgr_headers.i

/* templates */
%template(SelectMgr_FrustumCache) NCollection_DataMap <Standard_Integer , SelectMgr_SelectingVolumeManager>;
%template(SelectMgr_SequenceOfFilter) NCollection_Sequence <Handle_SelectMgr_Filter>;
%template(SelectMgr_SequenceOfSelector) NCollection_Sequence <Handle_SelectMgr_ViewerSelector>;
%template(SelectMgr_SequenceOfSelection) NCollection_Sequence <Handle_SelectMgr_Selection>;
%template(SelectMgr_Vec3) NCollection_Vec3 <Standard_Real>;
%template(SelectMgr_Vec4) NCollection_Vec4 <Standard_Real>;
%template(SelectMgr_Mat4) NCollection_Mat4 <Standard_Real>;
%template(SelectMgr_IndexedDataMapOfOwnerCriterion) NCollection_IndexedDataMap <Handle_SelectBasics_EntityOwner , SelectMgr_SortCriterion , TColStd_MapTransientHasher>;
%template(SelectMgr_ListOfFilter) NCollection_List <Handle_SelectMgr_Filter>;
%template(SelectMgr_ListIteratorOfListOfFilter) NCollection_TListIterator<Handle_SelectMgr_Filter>;
%template(SelectMgr_IndexedMapOfHSensitive) NCollection_IndexedMap <Handle_SelectMgr_SensitiveEntity>;
%template(SelectMgr_DataMapOfObjectSelectors) NCollection_DataMap <Handle_SelectMgr_SelectableObject , SelectMgr_SequenceOfSelector , TColStd_MapTransientHasher>;
%template(SelectMgr_SequenceOfOwner) NCollection_Sequence <Handle_SelectMgr_EntityOwner>;
/* end templates declaration */


/* typedefs */
typedef NCollection_DataMap <Handle_SelectMgr_SelectableObject , Handle_SelectMgr_SensitiveEntitySet>::Iterator SelectMgr_MapOfObjectSensitivesIterator;
typedef NCollection_DataMap <Standard_Integer , SelectMgr_SelectingVolumeManager> SelectMgr_FrustumCache;
typedef NCollection_Sequence <Handle_SelectMgr_Filter> SelectMgr_SequenceOfFilter;
typedef NCollection_Sequence <Handle_SelectMgr_ViewerSelector> SelectMgr_SequenceOfSelector;
typedef SelectMgr_SelectableObject * SelectMgr_SOPtr;
typedef NCollection_Sequence <Handle_SelectMgr_Selection> SelectMgr_SequenceOfSelection;
typedef NCollection_Vec3 <Standard_Real> SelectMgr_Vec3;
typedef NCollection_Vec4 <Standard_Real> SelectMgr_Vec4;
typedef NCollection_Mat4 <Standard_Real> SelectMgr_Mat4;
typedef NCollection_IndexedDataMap <Handle_SelectBasics_EntityOwner , SelectMgr_SortCriterion , TColStd_MapTransientHasher> SelectMgr_IndexedDataMapOfOwnerCriterion;
typedef NCollection_List <Handle_SelectMgr_Filter> SelectMgr_ListOfFilter;
typedef NCollection_List <Handle_SelectMgr_Filter>::Iterator SelectMgr_ListIteratorOfListOfFilter;
typedef NCollection_IndexedMap <Handle_SelectMgr_SensitiveEntity> SelectMgr_IndexedMapOfHSensitive;
typedef NCollection_DataMap <Handle_SelectMgr_SelectableObject , SelectMgr_SequenceOfSelector , TColStd_MapTransientHasher> SelectMgr_DataMapOfObjectSelectors;
typedef NCollection_DataMap <Handle_SelectMgr_SelectableObject , SelectMgr_SequenceOfSelector , TColStd_MapTransientHasher>::Iterator SelectMgr_DataMapIteratorOfDataMapOfObjectSelectors;
typedef NCollection_Shared<NCollection_IndexedMap <Handle_SelectMgr_EntityOwner>> SelectMgr_IndexedMapOfOwner;
typedef NCollection_Sequence <Handle_SelectMgr_EntityOwner> SelectMgr_SequenceOfOwner;
/* end typedefs declaration */

/* public enums */
enum SelectMgr_TypeOfUpdate {
	SelectMgr_TOU_Full = 0,
	SelectMgr_TOU_Partial = 1,
	SelectMgr_TOU_None = 2,
};

enum SelectMgr_TypeOfBVHUpdate {
	SelectMgr_TBU_Add = 0,
	SelectMgr_TBU_Remove = 1,
	SelectMgr_TBU_Renew = 2,
	SelectMgr_TBU_Invalidate = 3,
	SelectMgr_TBU_None = 4,
};

enum SelectMgr_StateOfSelection {
	SelectMgr_SOS_Activated = 0,
	SelectMgr_SOS_Deactivated = 1,
	SelectMgr_SOS_Sleeping = 2,
	SelectMgr_SOS_Any = 3,
	SelectMgr_SOS_Unknown = 4,
};

enum SelectMgr_PickingStrategy {
	SelectMgr_PickingStrategy_FirstAcceptable = 0,
	SelectMgr_PickingStrategy_OnlyTopmost = 1,
};

/* end public enums declaration */

%wrap_handle(SelectMgr_EntityOwner)
%wrap_handle(SelectMgr_Filter)
%wrap_handle(SelectMgr_SelectableObject)
%wrap_handle(SelectMgr_Selection)
%wrap_handle(SelectMgr_SelectionManager)
%wrap_handle(SelectMgr_SensitiveEntity)
%wrap_handle(SelectMgr_CompositionFilter)
%wrap_handle(SelectMgr_AndFilter)
%wrap_handle(SelectMgr_OrFilter)

%nodefaultctor SelectMgr_EntityOwner;
class SelectMgr_EntityOwner : public SelectBasics_EntityOwner {
	public:
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the owners matching the value of the selection mode aMode from the presentation manager object aPM.

	:param aPM:
	:type aPM: Handle_PrsMgr_PresentationManager &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: void
") Clear;
		virtual void Clear (const Handle_PrsMgr_PresentationManager & aPM,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") ComesFromDecomposition;
		%feature("autodoc", "	* Returns True if this owner points to a part of object and False for entire object.

	:rtype: bool
") ComesFromDecomposition;
		Standard_Boolean ComesFromDecomposition ();
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "	:rtype: bool
") HasLocation;
		virtual Standard_Boolean HasLocation ();
		%feature("compactdefaultargs") HasSelectable;
		%feature("autodoc", "	* Returns true if there is a selectable object to serve as an owner.

	:rtype: bool
") HasSelectable;
		Standard_Boolean HasSelectable ();
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "	* Highlights selectable object's presentation with mode theMode in presentation manager with given highlight style. Also a check for auto-highlight is performed - if selectable object manages highlighting on its own, execution will be passed to SelectMgr_SelectableObject::HilightOwnerWithColor method

	:param thePM:
	:type thePM: Handle_PrsMgr_PresentationManager3d &
	:param theStyle:
	:type theStyle: Handle_Prs3d_Drawer &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void
") HilightWithColor;
		virtual void HilightWithColor (const Handle_PrsMgr_PresentationManager3d & thePM,const Handle_Prs3d_Drawer & theStyle,const Standard_Integer theMode = 0);
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
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "	* Returns true if the presentation manager aPM highlights selections corresponding to the selection mode aMode.

	:param aPM:
	:type aPM: Handle_PrsMgr_PresentationManager &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: bool
") IsHilighted;
		virtual Standard_Boolean IsHilighted (const Handle_PrsMgr_PresentationManager & aPM,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") IsSameSelectable;
		%feature("autodoc", "	* Returns true if pointer to selectable object of this owner is equal to the given one

	:param theOther:
	:type theOther: Handle_SelectMgr_SelectableObject &
	:rtype: bool
") IsSameSelectable;
		Standard_Boolean IsSameSelectable (const Handle_SelectMgr_SelectableObject & theOther);
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "	* returns Standard_True if the owner is selected.

	:rtype: bool
") IsSelected;
		Standard_Boolean IsSelected ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	:rtype: TopLoc_Location
") Location;
		virtual TopLoc_Location Location ();
		%feature("compactdefaultargs") ResetLocation;
		%feature("autodoc", "	:rtype: void
") ResetLocation;
		virtual void ResetLocation ();
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
		%feature("compactdefaultargs") Selectable;
		%feature("autodoc", "	* Returns a selectable object detected in the working context.

	:rtype: Handle_SelectMgr_SelectableObject
") Selectable;
		virtual Handle_SelectMgr_SelectableObject Selectable ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the selectable object.

	:param theSelObj:
	:type theSelObj: Handle_SelectMgr_SelectableObject &
	:rtype: None
") Set;
		void Set (const Handle_SelectMgr_SelectableObject & theSelObj);
		%feature("compactdefaultargs") SetComesFromDecomposition;
		%feature("autodoc", "	* Sets flag indicating this owner points to a part of object (True) or to entire object (False).

	:param theIsFromDecomposition:
	:type theIsFromDecomposition: bool
	:rtype: None
") SetComesFromDecomposition;
		void SetComesFromDecomposition (const Standard_Boolean theIsFromDecomposition);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: void
") SetLocation;
		virtual void SetLocation (const TopLoc_Location & aLoc);
		%feature("compactdefaultargs") SetSelectable;
		%feature("autodoc", "	* Sets the selectable object.

	:param theSelObj:
	:type theSelObj: Handle_SelectMgr_SelectableObject &
	:rtype: void
") SetSelectable;
		virtual void SetSelectable (const Handle_SelectMgr_SelectableObject & theSelObj);
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "	* Set the state of the owner. @param theIsSelected [in] shows if owner is selected.

	:param theIsSelected:
	:type theIsSelected: bool
	:rtype: None
") SetSelected;
		void SetSelected (const Standard_Boolean theIsSelected);
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set Z layer ID and update all presentations.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: void
") SetZLayer;
		virtual void SetZLayer (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* Set the state of the owner. The method is deprecated. Use SetSelected() instead.

	:param theStatus:
	:type theStatus: int
	:rtype: None
") State;
		void State (const Standard_Integer theStatus);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	:rtype: int
") State;
		Standard_Integer State ();
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "	* Removes highlighting from the owner of a detected selectable object in the presentation manager. This object could be the owner of a sensitive primitive. @param thePrsMgr presentation manager @param theMode obsolete argument for compatibility, should be ignored by implementations

	:param thePrsMgr:
	:type thePrsMgr: Handle_PrsMgr_PresentationManager &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void
") Unhilight;
		virtual void Unhilight (const Handle_PrsMgr_PresentationManager & thePrsMgr,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") UpdateHighlightTrsf;
		%feature("autodoc", "	* Implements immediate application of location transformation of parent object to dynamic highlight structure

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:param theManager:
	:type theManager: Handle_PrsMgr_PresentationManager3d &
	:param theDispMode:
	:type theDispMode: int
	:rtype: void
") UpdateHighlightTrsf;
		virtual void UpdateHighlightTrsf (const Handle_V3d_Viewer & theViewer,const Handle_PrsMgr_PresentationManager3d & theManager,const Standard_Integer theDispMode);
};


%make_alias(SelectMgr_EntityOwner)

%extend SelectMgr_EntityOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_Filter;
class SelectMgr_Filter : public Standard_Transient {
	public:
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "	* Returns true in an AIS local context, if this filter operates on a type of subshape defined in a filter class inheriting this framework. This function completes IsOk in an AIS local context.

	:param aStandardMode:
	:type aStandardMode: TopAbs_ShapeEnum
	:rtype: bool
") ActsOn;
		virtual Standard_Boolean ActsOn (const TopAbs_ShapeEnum aStandardMode);
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	* Indicates that the selected Interactive Object passes the filter. The owner, anObj, can be either direct or user. A direct owner is the corresponding construction element, whereas a user is the compound shape of which the entity forms a part. When an object is detected by the mouse - in AIS, this is done through a context selector - its owner is passed to the filter as an argument. If the object returns Standard_True, it is kept; if not, it is rejected. If you are creating a filter class inheriting this framework, and the daughter class is to be used in an AIS local context, you will need to implement the virtual function ActsOn.

	:param anObj:
	:type anObj: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsOk;
		virtual Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anObj);
};


%make_alias(SelectMgr_Filter)

%extend SelectMgr_Filter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SelectableObject;
class SelectMgr_SelectableObject : public PrsMgr_PresentableObject {
	public:
		%feature("compactdefaultargs") AddSelection;
		%feature("autodoc", "	* Adds the selection aSelection with the selection mode index aMode to this framework.

	:param aSelection:
	:type aSelection: Handle_SelectMgr_Selection &
	:param aMode:
	:type aMode: int
	:rtype: None
") AddSelection;
		void AddSelection (const Handle_SelectMgr_Selection & aSelection,const Standard_Integer aMode);
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of selectable object by storing its minimum and maximum 3d coordinates to output parameters

	:param theBndBox:
	:type theBndBox: Bnd_Box &
	:rtype: void
") BoundingBox;
		virtual void BoundingBox (Bnd_Box & theBndBox);
		%feature("compactdefaultargs") ClearDynamicHighlight;
		%feature("autodoc", "	* Method that needs to be implemented when the object manages selection and dynamic highlighting on its own. Clears or invalidates dynamic highlight presentation. By default it clears immediate draw of given presentation manager.

	:param theMgr:
	:type theMgr: Handle_PrsMgr_PresentationManager3d &
	:rtype: void
") ClearDynamicHighlight;
		virtual void ClearDynamicHighlight (const Handle_PrsMgr_PresentationManager3d & theMgr);
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "	* Method which clear all selected owners belonging to this selectable object ( for fast presentation draw )

	:rtype: void
") ClearSelected;
		virtual void ClearSelected ();
		%feature("compactdefaultargs") ClearSelections;
		%feature("autodoc", "	* Empties all the selections in the SelectableObject <update> parameter defines whether all object's selections should be flagged for further update or not. This improved method can be used to recompute an object's selection (without redisplaying the object completely) when some selection mode is activated not for the first time.

	:param update: default value is Standard_False
	:type update: bool
	:rtype: None
") ClearSelections;
		void ClearSelections (const Standard_Boolean update = Standard_False);
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "	* Recovers and calculates any sensitive primitive, aSelection, available in Shape mode, specified by aMode. As a rule, these are sensitive faces. This method is defined as virtual. This enables you to implement it in the creation of a new class of AIS Interactive Object. You need to do this and in so doing, redefine this method, if you create a class which enriches the list of signatures and types.

	:param aSelection:
	:type aSelection: Handle_SelectMgr_Selection &
	:param aMode:
	:type aMode: int
	:rtype: void
") ComputeSelection;
		virtual void ComputeSelection (const Handle_SelectMgr_Selection & aSelection,const Standard_Integer aMode);
		%feature("compactdefaultargs") CurrentSelection;
		%feature("autodoc", "	* Returns the current selection in this framework.

	:rtype: Handle_SelectMgr_Selection
") CurrentSelection;
		Handle_SelectMgr_Selection CurrentSelection ();
		%feature("compactdefaultargs") ErasePresentations;
		%feature("autodoc", "	* Removes presentations returned by GetHilightPresentation() and GetSelectPresentation().

	:param theToRemove:
	:type theToRemove: bool
	:rtype: void
") ErasePresentations;
		virtual void ErasePresentations (Standard_Boolean theToRemove);
		%feature("compactdefaultargs") GetAssemblyOwner;
		%feature("autodoc", "	* Returns common entity owner if the object is an assembly

	:rtype: Handle_SelectMgr_EntityOwner
") GetAssemblyOwner;
		Handle_SelectMgr_EntityOwner GetAssemblyOwner ();
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
		%feature("compactdefaultargs") GlobalSelOwner;
		%feature("autodoc", "	* Returns the owner of mode for selection of object as a whole

	:rtype: Handle_SelectMgr_EntityOwner
") GlobalSelOwner;
		virtual Handle_SelectMgr_EntityOwner GlobalSelOwner ();
		%feature("compactdefaultargs") GlobalSelectionMode;
		%feature("autodoc", "	* Returns the mode for selection of object as a whole

	:rtype: int
") GlobalSelectionMode;
		Standard_Integer GlobalSelectionMode ();
		%feature("compactdefaultargs") HasSelection;
		%feature("autodoc", "	* Returns true if a selection corresponding to the selection mode theMode was computed for this object.

	:param theMode:
	:type theMode: int
	:rtype: bool
") HasSelection;
		virtual Standard_Boolean HasSelection (const Standard_Integer theMode);
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "	* Method which hilight an owner belonging to this selectable object ( for fast presentation draw )

	:param thePM:
	:type thePM: Handle_PrsMgr_PresentationManager3d &
	:param theStyle:
	:type theStyle: Handle_Prs3d_Drawer &
	:param theOwner:
	:type theOwner: Handle_SelectMgr_EntityOwner &
	:rtype: void
") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor (const Handle_PrsMgr_PresentationManager3d & thePM,const Handle_Prs3d_Drawer & theStyle,const Handle_SelectMgr_EntityOwner & theOwner);
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "	* Method which draws selected owners ( for fast presentation draw )

	:param PM:
	:type PM: Handle_PrsMgr_PresentationManager3d &
	:param Seq:
	:type Seq: SelectMgr_SequenceOfOwner &
	:rtype: void
") HilightSelected;
		virtual void HilightSelected (const Handle_PrsMgr_PresentationManager3d & PM,const SelectMgr_SequenceOfOwner & Seq);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Begins the iteration scanning for sensitive primitives.

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "	* If returns True, the old mechanism for highlighting selected objects is used (HilightSelected Method may be empty). If returns False, the HilightSelected method will be fully responsible for highlighting selected entity owners belonging to this selectable object.

	:rtype: bool
") IsAutoHilight;
		virtual Standard_Boolean IsAutoHilight ();
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
		%feature("compactdefaultargs") ResetTransformation;
		%feature("autodoc", "	:rtype: None
") ResetTransformation;
		void ResetTransformation ();
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "	* Returns the selection Selection having the selection mode aMode.

	:param aMode:
	:type aMode: int
	:rtype: Handle_SelectMgr_Selection
") Selection;
		Handle_SelectMgr_Selection Selection (const Standard_Integer aMode);
		%feature("compactdefaultargs") SetAssemblyOwner;
		%feature("autodoc", "	* Sets common entity owner for assembly sensitive object entities

	:param theOwner:
	:type theOwner: Handle_SelectMgr_EntityOwner &
	:param theMode: default value is -1
	:type theMode: int
	:rtype: None
") SetAssemblyOwner;
		void SetAssemblyOwner (const Handle_SelectMgr_EntityOwner & theOwner,const Standard_Integer theMode = -1);
		%feature("compactdefaultargs") SetAutoHilight;
		%feature("autodoc", "	* Set AutoHilight property to true or false Sets up Transform Persistence Mode for this object

	:param newAutoHilight:
	:type newAutoHilight: bool
	:rtype: void
") SetAutoHilight;
		virtual void SetAutoHilight (const Standard_Boolean newAutoHilight);
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
};


%make_alias(SelectMgr_SelectableObject)

%extend SelectMgr_SelectableObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SelectableObjectSet;
class SelectMgr_SelectableObjectSet {
	public:
		class Iterator {};
/* public enums */
enum BVHSubset {
	BVHSubset_3d = 0,
	BVHSubset_3dPersistent = 1,
	BVHSubset_2dPersistent = 2,
	BVHSubsetNb = 3,
};

/* end public enums declaration */

		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Adds the new selectable object to the set. The selectable object is placed into one of the predefined subsets depending on its persistence type. After adding an object, this method marks the corresponding BVH tree for rebuild. returns true if selectable object is added, otherwise returns false (selectable object is already in the set).

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:rtype: bool
") Append;
		Standard_Boolean Append (const Handle_SelectMgr_SelectableObject & theObject);
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "	* Returns computed BVH for the theSubset given.

	:param theSubset:
	:type theSubset: BVHSubset
	:rtype: opencascade::handle<BVH_Tree<float, 3> >
") BVH;
		const opencascade::handle<BVH_Tree<Standard_Real, 3> > & BVH (const BVHSubset theSubset);
		%feature("compactdefaultargs") ChangeSubset;
		%feature("autodoc", "	* Performs necessary updates when object's persistence types changes. This method should be called right after changing transformation persistence flags of the objects and before updating BVH tree - to provide up-to-date state of the object set.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:rtype: None
") ChangeSubset;
		void ChangeSubset (const Handle_SelectMgr_SelectableObject & theObject);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Returns true if this objects set contains theObject given.

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_SelectMgr_SelectableObject & theObject);
		%feature("compactdefaultargs") GetObjectById;
		%feature("autodoc", "	* Returns object from subset theSubset by theIndex given. The method allows to get selectable object referred by the index of an element of the subset's BVH tree.

	:param theSubset:
	:type theSubset: BVHSubset
	:param theIndex:
	:type theIndex: int
	:rtype: Handle_SelectMgr_SelectableObject
") GetObjectById;
		Handle_SelectMgr_SelectableObject GetObjectById (const BVHSubset theSubset,const Standard_Integer theIndex);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns true if the object set does not contain any selectable objects.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns true if the specified object subset is empty.

	:param theSubset:
	:type theSubset: BVHSubset
	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty (const BVHSubset theSubset);
		%feature("compactdefaultargs") MarkDirty;
		%feature("autodoc", "	* Marks every BVH subset for update.

	:rtype: None
") MarkDirty;
		void MarkDirty ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the selectable object from the set. The selectable object is removed from the subset it has been placed into. After removing an object, this method marks the corresponding BVH tree for rebuild. returns true if selectable object is removed, otherwise returns false (selectable object is not in the set).

	:param theObject:
	:type theObject: Handle_SelectMgr_SelectableObject &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_SelectMgr_SelectableObject & theObject);
		%feature("compactdefaultargs") SelectMgr_SelectableObjectSet;
		%feature("autodoc", "	* Creates new empty objects set and initializes BVH tree builders for each subset.

	:rtype: None
") SelectMgr_SelectableObjectSet;
		 SelectMgr_SelectableObjectSet ();
		%feature("compactdefaultargs") UpdateBVH;
		%feature("autodoc", "	* Updates outdated BVH trees and remembers the last state of the camera view-projection matrices and viewport (window) dimensions.

	:param theCamera:
	:type theCamera: Handle_Graphic3d_Camera &
	:param theProjectionMat:
	:type theProjectionMat: Graphic3d_Mat4d &
	:param theWorldViewMat:
	:type theWorldViewMat: Graphic3d_Mat4d &
	:param theViewState:
	:type theViewState: Graphic3d_WorldViewProjState &
	:param theViewportWidth:
	:type theViewportWidth: int
	:param theViewportHeight:
	:type theViewportHeight: int
	:rtype: None
") UpdateBVH;
		void UpdateBVH (const Handle_Graphic3d_Camera & theCamera,const Graphic3d_Mat4d & theProjectionMat,const Graphic3d_Mat4d & theWorldViewMat,const Graphic3d_WorldViewProjState & theViewState,const Standard_Integer theViewportWidth,const Standard_Integer theViewportHeight);
};


%extend SelectMgr_SelectableObjectSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SelectingVolumeManager;
class SelectMgr_SelectingVolumeManager : public SelectBasics_SelectingVolumeManager {
	public:
		%feature("compactdefaultargs") AllowOverlapDetection;
		%feature("autodoc", "	* Is used for rectangular selection only If theIsToAllow is false, only fully included sensitives will be detected, otherwise the algorithm will mark both included and overlapped entities as matched

	:param theIsToAllow:
	:type theIsToAllow: bool
	:rtype: void
") AllowOverlapDetection;
		virtual void AllowOverlapDetection (const Standard_Boolean theIsToAllow);
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
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "	* Returns current camera definition.

	:rtype: Handle_Graphic3d_Camera
") Camera;
		Handle_Graphic3d_Camera Camera ();
		%feature("compactdefaultargs") DetectedPoint;
		%feature("autodoc", "	* Calculates the point on a view ray that was detected during the run of selection algo by given depth. Throws exception if active selection type is not Point.

	:param theDepth:
	:type theDepth: float
	:rtype: gp_Pnt
") DetectedPoint;
		virtual gp_Pnt DetectedPoint (const Standard_Real theDepth);
		%feature("compactdefaultargs") DistToGeometryCenter;
		%feature("autodoc", "	* Measures distance between 3d projection of user-picked screen point and given point theCOG

	:param theCOG:
	:type theCOG: gp_Pnt
	:rtype: float
") DistToGeometryCenter;
		virtual Standard_Real DistToGeometryCenter (const gp_Pnt & theCOG);
		%feature("compactdefaultargs") GetActiveSelectionType;
		%feature("autodoc", "	:rtype: int
") GetActiveSelectionType;
		virtual Standard_Integer GetActiveSelectionType ();
		%feature("compactdefaultargs") GetFarPickedPnt;
		%feature("autodoc", "	* Valid only for point and rectangular selection. Returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto far view frustum plane

	:rtype: gp_Pnt
") GetFarPickedPnt;
		virtual gp_Pnt GetFarPickedPnt ();
		%feature("compactdefaultargs") GetNearPickedPnt;
		%feature("autodoc", "	* Valid only for point and rectangular selection. Returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto near view frustum plane

	:rtype: gp_Pnt
") GetNearPickedPnt;
		virtual gp_Pnt GetNearPickedPnt ();
		%feature("compactdefaultargs") GetPlanes;
		%feature("autodoc", "	* Stores plane equation coefficients (in the following form: Ax + By + Cz + D = 0) to the given vector

	:param thePlaneEquations:
	:type thePlaneEquations: NCollection_Vector<SelectMgr_Vec4> &
	:rtype: None
") GetPlanes;
		void GetPlanes (NCollection_Vector<SelectMgr_Vec4> & thePlaneEquations);
		%feature("compactdefaultargs") GetVertices;
		%feature("autodoc", "	* A set of helper functions that return rectangular selecting frustum data

	:rtype: gp_Pnt *
") GetVertices;
		const gp_Pnt * GetVertices ();
		%feature("compactdefaultargs") IsClipped;
		%feature("autodoc", "	* Checks if the point of sensitive in which selection was detected belongs to the region defined by clipping planes

	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane &
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") IsClipped;
		virtual Standard_Boolean IsClipped (const Graphic3d_SequenceOfHClipPlane & thePlanes,const Standard_Real & theDepth);
		%feature("compactdefaultargs") IsOverlapAllowed;
		%feature("autodoc", "	:rtype: bool
") IsOverlapAllowed;
		virtual Standard_Boolean IsOverlapAllowed ();
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
		%feature("autodoc", "	* SAT intersection test between defined volume and given ordered set of points, representing line segments. The test may be considered of interior part or boundary line defined by segments depending on given sensitivity type

	:param theArrayOfPts:
	:type theArrayOfPts: TColgp_Array1OfPnt
	:param theSensType:
	:type theSensType: int
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") Overlaps;
		virtual Standard_Boolean Overlaps (const TColgp_Array1OfPnt & theArrayOfPts,Standard_Integer theSensType,Standard_Real &OutValue);
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
		%feature("compactdefaultargs") ProjectionMatrix;
		%feature("autodoc", "	* returns current projection transformation common for all selecting volumes

	:rtype: Graphic3d_Mat4d
") ProjectionMatrix;
		const Graphic3d_Mat4d & ProjectionMatrix ();
		%feature("compactdefaultargs") ScaleAndTransform;
		%feature("autodoc", "	* IMPORTANT: Scaling makes sense only for frustum built on a single point! Note that this method does not perform any checks on type of the frustum. //! Returns a copy of the frustum resized according to the scale factor given and transforms it using the matrix given. There are no default parameters, but in case if: - transformation only is needed: @theScaleFactor must be initialized as any negative value; - scale only is needed: @theTrsf must be set to gp_Identity. Builder is an optional argument that represents corresponding settings for re-constructing transformed frustum from scratch. Can be null if reconstruction is not expected furthermore.

	:param theScaleFactor:
	:type theScaleFactor: int
	:param theTrsf:
	:type theTrsf: gp_GTrsf
	:param theBuilder: default value is NULL
	:type theBuilder: Handle_SelectMgr_FrustumBuilder &
	:rtype: SelectMgr_SelectingVolumeManager
") ScaleAndTransform;
		virtual SelectMgr_SelectingVolumeManager ScaleAndTransform (const Standard_Integer theScaleFactor,const gp_GTrsf & theTrsf,const Handle_SelectMgr_FrustumBuilder & theBuilder = NULL);
		%feature("compactdefaultargs") SelectMgr_SelectingVolumeManager;
		%feature("autodoc", "	* Creates instances of all available selecting volume types

	:param theToAllocateFrustums: default value is Standard_True
	:type theToAllocateFrustums: bool
	:rtype: None
") SelectMgr_SelectingVolumeManager;
		 SelectMgr_SelectingVolumeManager (Standard_Boolean theToAllocateFrustums = Standard_True);
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
	:param theWorldView:
	:type theWorldView: Graphic3d_Mat4d &
	:param theIsOrthographic:
	:type theIsOrthographic: bool
	:param theWVPState: default value is Graphic3d_WorldViewProjState()
	:type theWVPState: Graphic3d_WorldViewProjState &
	:rtype: None
") SetCamera;
		void SetCamera (const Graphic3d_Mat4d & theProjection,const Graphic3d_Mat4d & theWorldView,const Standard_Boolean theIsOrthographic,const Graphic3d_WorldViewProjState & theWVPState = Graphic3d_WorldViewProjState());
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "	* Updates pixel tolerance in all selecting volumes

	:param theTolerance:
	:type theTolerance: int
	:rtype: None
") SetPixelTolerance;
		void SetPixelTolerance (const Standard_Integer theTolerance);
		%feature("compactdefaultargs") SetViewClipping;
		%feature("autodoc", "	* Valid for point selection only! Computes depth range for global (defined for the whole view) clipping planes.

	:param thePlanes:
	:type thePlanes: Handle_Graphic3d_SequenceOfHClipPlane &
	:rtype: None
") SetViewClipping;
		void SetViewClipping (const Handle_Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("compactdefaultargs") SetViewClippingEnabled;
		%feature("autodoc", "	* Set if view clipping plane is enabled or not. returns previous flag value

	:param theToEnable:
	:type theToEnable: bool
	:rtype: bool
") SetViewClippingEnabled;
		Standard_Boolean SetViewClippingEnabled (const Standard_Boolean theToEnable);
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
		%feature("compactdefaultargs") SetWindowSize;
		%feature("autodoc", "	* Updates window size in all selecting volumes

	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:rtype: None
") SetWindowSize;
		void SetWindowSize (const Standard_Integer theWidth,const Standard_Integer theHeight);
		%feature("compactdefaultargs") ViewClipping;
		%feature("autodoc", "	* Return view clipping planes.

	:rtype: Handle_Graphic3d_SequenceOfHClipPlane
") ViewClipping;
		Handle_Graphic3d_SequenceOfHClipPlane ViewClipping ();
		%feature("compactdefaultargs") WindowSize;
		%feature("autodoc", "	:param theWidth:
	:type theWidth: int &
	:param theHeight:
	:type theHeight: int &
	:rtype: None
") WindowSize;
		void WindowSize (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") WorldViewMatrix;
		%feature("autodoc", "	* returns current world view transformation common for all selecting volumes

	:rtype: Graphic3d_Mat4d
") WorldViewMatrix;
		const Graphic3d_Mat4d & WorldViewMatrix ();
		%feature("compactdefaultargs") WorldViewProjState;
		%feature("autodoc", "	* returns current camera world view projection transformation state common for all selecting volumes

	:rtype: Graphic3d_WorldViewProjState
") WorldViewProjState;
		const Graphic3d_WorldViewProjState & WorldViewProjState ();
};


%extend SelectMgr_SelectingVolumeManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_Selection;
class SelectMgr_Selection : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the sensitive primitive aprimitive to the list of stored entities in this object. Raises NullObject if the primitive is a null handle.

	:param theSensitive:
	:type theSensitive: Handle_SelectBasics_SensitiveEntity &
	:rtype: None
") Add;
		void Add (const Handle_SelectBasics_SensitiveEntity & theSensitive);
		%feature("compactdefaultargs") BVHUpdateStatus;
		%feature("autodoc", "	:rtype: SelectMgr_TypeOfBVHUpdate
") BVHUpdateStatus;
		SelectMgr_TypeOfBVHUpdate BVHUpdateStatus ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* empties the selection from all the stored entities

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") GetSelectionState;
		%feature("autodoc", "	* Returns status of selection

	:rtype: SelectMgr_StateOfSelection
") GetSelectionState;
		SelectMgr_StateOfSelection GetSelectionState ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Begins an iteration scanning for sensitive primitives.

	:rtype: None
") Init;
		void Init ();
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
		%feature("compactdefaultargs") SelectMgr_Selection;
		%feature("autodoc", "	* Constructs a selection object defined by the selection mode IdMode. The default setting 0 is the selection mode for a shape in its entirety.

	:param theModeIdx: default value is 0
	:type theModeIdx: int
	:rtype: None
") SelectMgr_Selection;
		 SelectMgr_Selection (const Standard_Integer theModeIdx = 0);
		%feature("compactdefaultargs") Sensitive;
		%feature("autodoc", "	* Returns any sensitive primitive in this framework.

	:rtype: Handle_SelectMgr_SensitiveEntity
") Sensitive;
		Handle_SelectMgr_SensitiveEntity Sensitive ();
		%feature("compactdefaultargs") Sensitivity;
		%feature("autodoc", "	* Returns sensitivity of the selection

	:rtype: int
") Sensitivity;
		Standard_Integer Sensitivity ();
		%feature("compactdefaultargs") SetSelectionState;
		%feature("autodoc", "	* Sets status of selection

	:param theState:
	:type theState: SelectMgr_StateOfSelection
	:rtype: None
") SetSelectionState;
		void SetSelectionState (const SelectMgr_StateOfSelection theState);
		%feature("compactdefaultargs") SetSensitivity;
		%feature("autodoc", "	* Changes sensitivity of the selection and all its entities to the given value. IMPORTANT: This method does not update any outer selection structures, so for proper updates use SelectMgr_SelectionManager::SetSelectionSensitivity method.

	:param theNewSens:
	:type theNewSens: int
	:rtype: None
") SetSensitivity;
		void SetSensitivity (const Standard_Integer theNewSens);
		%feature("compactdefaultargs") UpdateBVHStatus;
		%feature("autodoc", "	:param theStatus:
	:type theStatus: SelectMgr_TypeOfBVHUpdate
	:rtype: None
") UpdateBVHStatus;
		void UpdateBVHStatus (const SelectMgr_TypeOfBVHUpdate theStatus);
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
};


%make_alias(SelectMgr_Selection)

%extend SelectMgr_Selection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SelectionManager;
class SelectMgr_SelectionManager : public Standard_Transient {
	public:
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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the viewer selector theSelector to the list of known items.

	:param theSelector:
	:type theSelector: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") Add;
		void Add (const Handle_SelectMgr_ViewerSelector & theSelector);
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
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes viewer selector theSelector from the list of known items.

	:param theSelector:
	:type theSelector: Handle_SelectMgr_ViewerSelector &
	:rtype: None
") Remove;
		void Remove (const Handle_SelectMgr_ViewerSelector & theSelector);
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
		%feature("compactdefaultargs") SelectMgr_SelectionManager;
		%feature("autodoc", "	* Constructs an empty selection manager object.

	:rtype: None
") SelectMgr_SelectionManager;
		 SelectMgr_SelectionManager ();
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
		%feature("compactdefaultargs") UpdateSelection;
		%feature("autodoc", "	* Re-adds selectable object in BVHs in all viewer selectors.

	:param theObj:
	:type theObj: Handle_SelectMgr_SelectableObject &
	:rtype: None
") UpdateSelection;
		void UpdateSelection (const Handle_SelectMgr_SelectableObject & theObj);
};


%make_alias(SelectMgr_SelectionManager)

%extend SelectMgr_SelectionManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SensitiveEntity;
class SelectMgr_SensitiveEntity : public Standard_Transient {
	public:
		%feature("compactdefaultargs") BaseSensitive;
		%feature("autodoc", "	* Returns related instance of SelectBasics class

	:rtype: Handle_SelectBasics_SensitiveEntity
") BaseSensitive;
		Handle_SelectBasics_SensitiveEntity BaseSensitive ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears up all resources and memory

	:rtype: None
") Clear;
		void Clear ();
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
		%feature("compactdefaultargs") SelectMgr_SensitiveEntity;
		%feature("autodoc", "	* Creates new inactive for selection object with base entity theEntity

	:param theEntity:
	:type theEntity: Handle_SelectBasics_SensitiveEntity &
	:rtype: None
") SelectMgr_SensitiveEntity;
		 SelectMgr_SensitiveEntity (const Handle_SelectBasics_SensitiveEntity & theEntity);
		%feature("compactdefaultargs") SetActiveForSelection;
		%feature("autodoc", "	* Marks entity as active for selection

	:rtype: None
") SetActiveForSelection;
		void SetActiveForSelection ();
};


%make_alias(SelectMgr_SensitiveEntity)

%extend SelectMgr_SensitiveEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_SortCriterion;
class SelectMgr_SortCriterion {
	public:
		Handle_SelectBasics_SensitiveEntity Entity;
		gp_Pnt Point;
		float Depth;
		float MinDist;
		float Tolerance;
		int Priority;
		int ZLayerPosition;
		bool ToPreferClosest;
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "	* Compare with another item.

	:param theOther:
	:type theOther: SelectMgr_SortCriterion &
	:rtype: bool
") IsGreater;
		bool IsGreater (const SelectMgr_SortCriterion & theOther);
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "	* Compare with another item.

	:param theOther:
	:type theOther: SelectMgr_SortCriterion &
	:rtype: bool
") IsLower;
		bool IsLower (const SelectMgr_SortCriterion & theOther);
		%feature("compactdefaultargs") SelectMgr_SortCriterion;
		%feature("autodoc", "	* //!< whether closest object is preferred even if has less priority Empty constructor.

	:rtype: None
") SelectMgr_SortCriterion;
		 SelectMgr_SortCriterion ();
		%feature("compactdefaultargs") operator <;
		%feature("autodoc", "	* Comparison operator.

	:param theOther:
	:type theOther: SelectMgr_SortCriterion &
	:rtype: bool
") operator <;
		bool operator < (const SelectMgr_SortCriterion & theOther);
		%feature("compactdefaultargs") operator >;
		%feature("autodoc", "	* Comparison operator.

	:param theOther:
	:type theOther: SelectMgr_SortCriterion &
	:rtype: bool
") operator >;
		bool operator > (const SelectMgr_SortCriterion & theOther);
};


%extend SelectMgr_SortCriterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_ViewClipRange;
class SelectMgr_ViewClipRange {
	public:
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Invalidates view clipping range

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Returns true if clip range is set and depth of each matched primitive must be tested for satisfying the defined interval

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("compactdefaultargs") MaxDepth;
		%feature("autodoc", "	* Returns the upper bound of valid depth range

	:rtype: float
") MaxDepth;
		Standard_Real MaxDepth ();
		%feature("compactdefaultargs") MinDepth;
		%feature("autodoc", "	* Returns the lower bound of valid depth range

	:rtype: float
") MinDepth;
		Standard_Real MinDepth ();
		%feature("compactdefaultargs") SelectMgr_ViewClipRange;
		%feature("autodoc", "	* Creates new empty view clip range

	:rtype: None
") SelectMgr_ViewClipRange;
		 SelectMgr_ViewClipRange ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets boundaries and validates view clipping range

	:param theDepthMin:
	:type theDepthMin: float
	:param theDepthMax:
	:type theDepthMax: float
	:rtype: None
") Set;
		void Set (const Standard_Real theDepthMin,const Standard_Real theDepthMax);
};


%extend SelectMgr_ViewClipRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_CompositionFilter;
class SelectMgr_CompositionFilter : public SelectMgr_Filter {
	public:
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "	:param aStandardMode:
	:type aStandardMode: TopAbs_ShapeEnum
	:rtype: bool
") ActsOn;
		virtual Standard_Boolean ActsOn (const TopAbs_ShapeEnum aStandardMode);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the filter afilter to a filter object created by a filter class inheriting this framework.

	:param afilter:
	:type afilter: Handle_SelectMgr_Filter &
	:rtype: None
") Add;
		void Add (const Handle_SelectMgr_Filter & afilter);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the filters used in this framework.

	:rtype: None
") Clear;
		void Clear ();
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
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes the filter aFilter from this framework.

	:param aFilter:
	:type aFilter: Handle_SelectMgr_Filter &
	:rtype: None
") Remove;
		void Remove (const Handle_SelectMgr_Filter & aFilter);
		%feature("compactdefaultargs") StoredFilters;
		%feature("autodoc", "	* Returns the list of stored filters from this framework.

	:rtype: SelectMgr_ListOfFilter
") StoredFilters;
		const SelectMgr_ListOfFilter & StoredFilters ();
};


%make_alias(SelectMgr_CompositionFilter)

%extend SelectMgr_CompositionFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_AndFilter;
class SelectMgr_AndFilter : public SelectMgr_CompositionFilter {
	public:
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	:param anobj:
	:type anobj: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsOk;
		Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anobj);
		%feature("compactdefaultargs") SelectMgr_AndFilter;
		%feature("autodoc", "	* Constructs an empty selection filter object for two or more types of entity.

	:rtype: None
") SelectMgr_AndFilter;
		 SelectMgr_AndFilter ();
};


%make_alias(SelectMgr_AndFilter)

%extend SelectMgr_AndFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectMgr_OrFilter;
class SelectMgr_OrFilter : public SelectMgr_CompositionFilter {
	public:
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	:param anobj:
	:type anobj: Handle_SelectMgr_EntityOwner &
	:rtype: bool
") IsOk;
		Standard_Boolean IsOk (const Handle_SelectMgr_EntityOwner & anobj);
		%feature("compactdefaultargs") SelectMgr_OrFilter;
		%feature("autodoc", "	* Constructs an empty or selection filter.

	:rtype: None
") SelectMgr_OrFilter;
		 SelectMgr_OrFilter ();
		%feature("compactdefaultargs") SetDisabledObjects;
		%feature("autodoc", "	* Disable selection of specified objects.

	:param theObjects:
	:type theObjects: Handle_Graphic3d_NMapOfTransient &
	:rtype: None
") SetDisabledObjects;
		void SetDisabledObjects (const Handle_Graphic3d_NMapOfTransient & theObjects);
};


%make_alias(SelectMgr_OrFilter)

%extend SelectMgr_OrFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
