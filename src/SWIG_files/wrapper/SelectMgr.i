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
"SelectMgr module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_selectmgr.html"
%enddef
%module (package="OCC.Core", docstring=SELECTMGRDOCSTRING) SelectMgr


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


%{
#include<SelectMgr_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<PrsMgr_module.hxx>
#include<Graphic3d_module.hxx>
#include<Aspect_module.hxx>
#include<Prs3d_module.hxx>
#include<TopLoc_module.hxx>
#include<V3d_module.hxx>
#include<TopAbs_module.hxx>
#include<BVH_module.hxx>
#include<SelectBasics_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<Select3D_module.hxx>
#include<Bnd_module.hxx>
#include<TopTools_module.hxx>
#include<Message_module.hxx>
#include<TShort_module.hxx>
#include<SelectBasics_module.hxx>
#include<Visual3d_module.hxx>
#include<gp_module.hxx>
#include<HLRAlgo_module.hxx>
#include<TColQuantity_module.hxx>
#include<Geom_module.hxx>
#include<Aspect_module.hxx>
#include<Poly_module.hxx>
#include<TopoDS_module.hxx>
#include<V3d_module.hxx>
#include<Select3D_module.hxx>
#include<Graphic3d_module.hxx>
#include<Quantity_module.hxx>
#include<BVH_module.hxx>
#include<Prs3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import PrsMgr.i
%import Graphic3d.i
%import Aspect.i
%import Prs3d.i
%import TopLoc.i
%import V3d.i
%import TopAbs.i
%import BVH.i
%import SelectBasics.i
%import gp.i
%import TColgp.i
%import Select3D.i
%import Bnd.i
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
	SelectMgr_SOS_Any = - 2,
	SelectMgr_SOS_Unknown = - 1,
	SelectMgr_SOS_Deactivated = 0,
	SelectMgr_SOS_Activated = 1,
};

enum SelectMgr_PickingStrategy {
	SelectMgr_PickingStrategy_FirstAcceptable = 0,
	SelectMgr_PickingStrategy_OnlyTopmost = 1,
};

/* end public enums declaration */

/* handles */
%wrap_handle(SelectMgr_EntityOwner)
%wrap_handle(SelectMgr_Filter)
%wrap_handle(SelectMgr_SelectableObject)
%wrap_handle(SelectMgr_Selection)
%wrap_handle(SelectMgr_SelectionManager)
%wrap_handle(SelectMgr_SensitiveEntity)
%wrap_handle(SelectMgr_CompositionFilter)
%wrap_handle(SelectMgr_AndFilter)
%wrap_handle(SelectMgr_OrFilter)
/* end handles declaration */

/* templates */
%template(SelectMgr_FrustumCache) NCollection_DataMap <Standard_Integer , SelectMgr_SelectingVolumeManager>;

%extend NCollection_DataMap <Standard_Integer , SelectMgr_SelectingVolumeManager> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (SelectMgr_FrustumCache::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(SelectMgr_SequenceOfFilter) NCollection_Sequence <opencascade::handle <SelectMgr_Filter>>;
%template(SelectMgr_SequenceOfSelection) NCollection_Sequence <opencascade::handle <SelectMgr_Selection>>;
%template(SelectMgr_Vec3) NCollection_Vec3 <Standard_Real>;
%template(SelectMgr_Vec4) NCollection_Vec4 <Standard_Real>;
%template(SelectMgr_Mat4) NCollection_Mat4 <Standard_Real>;
%template(SelectMgr_IndexedDataMapOfOwnerCriterion) NCollection_IndexedDataMap <opencascade::handle <SelectMgr_EntityOwner>, SelectMgr_SortCriterion , TColStd_MapTransientHasher>;
%template(SelectMgr_ListOfFilter) NCollection_List <opencascade::handle <SelectMgr_Filter>>;
%template(SelectMgr_ListIteratorOfListOfFilter) NCollection_TListIterator<opencascade::handle<SelectMgr_Filter>>;
%template(SelectMgr_IndexedMapOfHSensitive) NCollection_IndexedMap <opencascade::handle <SelectMgr_SensitiveEntity>>;
%template(SelectMgr_SequenceOfOwner) NCollection_Sequence <opencascade::handle <SelectMgr_EntityOwner>>;
/* end templates declaration */

/* typedefs */
typedef SelectMgr_EntityOwner SelectBasics_EntityOwner;
typedef NCollection_DataMap <opencascade::handle <SelectMgr_SelectableObject>, opencascade::handle <SelectMgr_SensitiveEntitySet>>::Iterator SelectMgr_MapOfObjectSensitivesIterator;
typedef NCollection_DataMap <Standard_Integer , SelectMgr_SelectingVolumeManager> SelectMgr_FrustumCache;
typedef NCollection_Sequence <opencascade::handle <SelectMgr_Filter>> SelectMgr_SequenceOfFilter;
typedef SelectMgr_SelectableObject * SelectMgr_SOPtr;
typedef NCollection_Sequence <opencascade::handle <SelectMgr_Selection>> SelectMgr_SequenceOfSelection;
typedef NCollection_Vec3 <Standard_Real> SelectMgr_Vec3;
typedef NCollection_Vec4 <Standard_Real> SelectMgr_Vec4;
typedef NCollection_Mat4 <Standard_Real> SelectMgr_Mat4;
typedef NCollection_IndexedDataMap <opencascade::handle <SelectMgr_EntityOwner>, SelectMgr_SortCriterion , TColStd_MapTransientHasher> SelectMgr_IndexedDataMapOfOwnerCriterion;
typedef NCollection_List <opencascade::handle <SelectMgr_Filter>> SelectMgr_ListOfFilter;
typedef NCollection_List <opencascade::handle <SelectMgr_Filter>>::Iterator SelectMgr_ListIteratorOfListOfFilter;
typedef NCollection_IndexedMap <opencascade::handle <SelectMgr_SensitiveEntity>> SelectMgr_IndexedMapOfHSensitive;
typedef NCollection_Shared<NCollection_IndexedMap <opencascade::handle <SelectMgr_EntityOwner>>> SelectMgr_IndexedMapOfOwner;
typedef NCollection_Sequence <opencascade::handle <SelectMgr_EntityOwner>> SelectMgr_SequenceOfOwner;
/* end typedefs declaration */

/******************************
* class SelectMgr_BaseFrustum *
******************************/
/******************************
* class SelectMgr_EntityOwner *
******************************/
class SelectMgr_EntityOwner : public Standard_Transient {
	public:
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the owners matching the value of the selection mode aMode from the presentation manager object aPM. /// TODO
	:param thePrsMgr:
	:type thePrsMgr: PrsMgr_PresentationManager
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None") Clear;
		void Clear (const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr,const Standard_Integer theMode = 0);

		/****************** ComesFromDecomposition ******************/
		%feature("compactdefaultargs") ComesFromDecomposition;
		%feature("autodoc", "* Returns True if this owner points to a part of object and False for entire object.
	:rtype: bool") ComesFromDecomposition;
		Standard_Boolean ComesFromDecomposition ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** HandleMouseClick ******************/
		%feature("compactdefaultargs") HandleMouseClick;
		%feature("autodoc", "* Handle mouse button click event. Does nothing by default and returns False. @param thePoint mouse cursor position @param theButton clicked button @param theModifiers key modifiers @param theIsDoubleClick flag indicating double mouse click returns True if object handled click
	:param thePoint:
	:type thePoint: Graphic3d_Vec2i
	:param theButton:
	:type theButton: Aspect_VKeyMouse
	:param theModifiers:
	:type theModifiers: Aspect_VKeyFlags
	:param theIsDoubleClick:
	:type theIsDoubleClick: bool
	:rtype: bool") HandleMouseClick;
		Standard_Boolean HandleMouseClick (const Graphic3d_Vec2i & thePoint,Aspect_VKeyMouse theButton,Aspect_VKeyFlags theModifiers,bool theIsDoubleClick);

		/****************** HasLocation ******************/
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "* Returns True if selectable has transformation.
	:rtype: bool") HasLocation;
		Standard_Boolean HasLocation ();

		/****************** HasSelectable ******************/
		%feature("compactdefaultargs") HasSelectable;
		%feature("autodoc", "* Returns true if there is a selectable object to serve as an owner.
	:rtype: bool") HasSelectable;
		Standard_Boolean HasSelectable ();

		/****************** HilightWithColor ******************/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "* Highlights selectable object's presentation with display mode in presentation manager with given highlight style. Also a check for auto-highlight is performed - if selectable object manages highlighting on its own, execution will be passed to SelectMgr_SelectableObject::HilightOwnerWithColor method.
	:param thePrsMgr:
	:type thePrsMgr: PrsMgr_PresentationManager
	:param theStyle:
	:type theStyle: Prs3d_Drawer
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void") HilightWithColor;
		virtual void HilightWithColor (const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr,const opencascade::handle<Prs3d_Drawer> & theStyle,const Standard_Integer theMode = 0);

		/****************** IsAutoHilight ******************/
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "* if owner is not auto hilighted, for group contains many such owners will be called one method HilightSelected of SelectableObject
	:rtype: bool") IsAutoHilight;
		Standard_Boolean IsAutoHilight ();

		/****************** IsForcedHilight ******************/
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "* if this method returns True the owner will always call method Hilight for SelectableObject when the owner is detected. By default it always return False.
	:rtype: bool") IsForcedHilight;
		Standard_Boolean IsForcedHilight ();

		/****************** IsHilighted ******************/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "* Returns true if the presentation manager highlights selections corresponding to the selection mode.
	:param thePrsMgr:
	:type thePrsMgr: PrsMgr_PresentationManager
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool") IsHilighted;
		Standard_Boolean IsHilighted (const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr,const Standard_Integer theMode = 0);

		/****************** IsSameSelectable ******************/
		%feature("compactdefaultargs") IsSameSelectable;
		%feature("autodoc", "* Returns true if pointer to selectable object of this owner is equal to the given one
	:param theOther:
	:type theOther: SelectMgr_SelectableObject
	:rtype: bool") IsSameSelectable;
		Standard_Boolean IsSameSelectable (const opencascade::handle<SelectMgr_SelectableObject> & theOther);

		/****************** IsSelected ******************/
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "* returns Standard_True if the owner is selected.
	:rtype: bool") IsSelected;
		Standard_Boolean IsSelected ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns transformation of selectable.
	:rtype: TopLoc_Location") Location;
		TopLoc_Location Location ();

		/****************** Priority ******************/
		%feature("compactdefaultargs") Priority;
		%feature("autodoc", "* Return selection priority (within range [0-9]) for results with the same depth; 0 by default. Example - selection of shapes: the owners are selectable objects (presentations) a user can give vertex priority [3], edges [2] faces [1] shape [0], so that if during selection one vertex one edge and one face are simultaneously detected, the vertex will only be hilighted.
	:rtype: int") Priority;
		Standard_Integer Priority ();

		/****************** SelectMgr_EntityOwner ******************/
		%feature("compactdefaultargs") SelectMgr_EntityOwner;
		%feature("autodoc", "* Initializes the selection priority aPriority.
	:param aPriority: default value is 0
	:type aPriority: int
	:rtype: None") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner (const Standard_Integer aPriority = 0);

		/****************** SelectMgr_EntityOwner ******************/
		%feature("compactdefaultargs") SelectMgr_EntityOwner;
		%feature("autodoc", "* Constructs a framework with the selectable object anSO being attributed the selection priority aPriority.
	:param aSO:
	:type aSO: SelectMgr_SelectableObject
	:param aPriority: default value is 0
	:type aPriority: int
	:rtype: None") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner (const opencascade::handle<SelectMgr_SelectableObject> & aSO,const Standard_Integer aPriority = 0);

		/****************** SelectMgr_EntityOwner ******************/
		%feature("compactdefaultargs") SelectMgr_EntityOwner;
		%feature("autodoc", "* Constructs a framework from existing one anSO being attributed the selection priority aPriority.
	:param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:param aPriority: default value is 0
	:type aPriority: int
	:rtype: None") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner (const opencascade::handle<SelectMgr_EntityOwner> & theOwner,const Standard_Integer aPriority = 0);

		/****************** Selectable ******************/
		%feature("compactdefaultargs") Selectable;
		%feature("autodoc", "* Returns a selectable object detected in the working context.
	:rtype: opencascade::handle<SelectMgr_SelectableObject>") Selectable;
		opencascade::handle<SelectMgr_SelectableObject> Selectable ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the selectable object.
	:param theSelObj:
	:type theSelObj: SelectMgr_SelectableObject
	:rtype: None") Set;
		void Set (const opencascade::handle<SelectMgr_SelectableObject> & theSelObj);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* sets the selectable priority of the owner
	:param thePriority:
	:type thePriority: int
	:rtype: None") Set;
		void Set (const Standard_Integer thePriority);

		/****************** SetComesFromDecomposition ******************/
		%feature("compactdefaultargs") SetComesFromDecomposition;
		%feature("autodoc", "* Sets flag indicating this owner points to a part of object (True) or to entire object (False).
	:param theIsFromDecomposition:
	:type theIsFromDecomposition: bool
	:rtype: None") SetComesFromDecomposition;
		void SetComesFromDecomposition (const Standard_Boolean theIsFromDecomposition);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "* Change owner location (callback for handling change of location of selectable object).
	:param theLocation:
	:type theLocation: TopLoc_Location
	:rtype: None") SetLocation;
		void SetLocation (const TopLoc_Location & theLocation);

		/****************** SetPriority ******************/
		%feature("compactdefaultargs") SetPriority;
		%feature("autodoc", "* Sets the selectable priority of the owner within range [0-9].
	:param thePriority:
	:type thePriority: int
	:rtype: None") SetPriority;
		void SetPriority (Standard_Integer thePriority);

		/****************** SetSelectable ******************/
		%feature("compactdefaultargs") SetSelectable;
		%feature("autodoc", "* Sets the selectable object.
	:param theSelObj:
	:type theSelObj: SelectMgr_SelectableObject
	:rtype: None") SetSelectable;
		void SetSelectable (const opencascade::handle<SelectMgr_SelectableObject> & theSelObj);

		/****************** SetSelected ******************/
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "* Set the state of the owner. @param theIsSelected [in] shows if owner is selected.
	:param theIsSelected:
	:type theIsSelected: bool
	:rtype: None") SetSelected;
		void SetSelected (const Standard_Boolean theIsSelected);

		/****************** SetZLayer ******************/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "* Set Z layer ID and update all presentations.
	:param theLayerId:
	:type theLayerId: int
	:rtype: None") SetZLayer;
		void SetZLayer (int theLayerId);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "* Returns selection state.
	:rtype: int") State;
		Standard_Integer State ();

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "* Set the state of the owner. The method is deprecated. Use SetSelected() instead.
	:param theStatus:
	:type theStatus: int
	:rtype: None") State;
		void State (const Standard_Integer theStatus);

		/****************** Unhilight ******************/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "* Removes highlighting from the owner of a detected selectable object in the presentation manager. This object could be the owner of a sensitive primitive. @param thePrsMgr presentation manager @param theMode obsolete argument for compatibility, should be ignored by implementations
	:param thePrsMgr:
	:type thePrsMgr: PrsMgr_PresentationManager
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None") Unhilight;
		void Unhilight (const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr,const Standard_Integer theMode = 0);

		/****************** UpdateHighlightTrsf ******************/
		%feature("compactdefaultargs") UpdateHighlightTrsf;
		%feature("autodoc", "* Implements immediate application of location transformation of parent object to dynamic highlight structure
	:param theViewer:
	:type theViewer: V3d_Viewer
	:param theManager:
	:type theManager: PrsMgr_PresentationManager
	:param theDispMode:
	:type theDispMode: int
	:rtype: None") UpdateHighlightTrsf;
		void UpdateHighlightTrsf (const opencascade::handle<V3d_Viewer> & theViewer,const opencascade::handle<PrsMgr_PresentationManager> & theManager,const Standard_Integer theDispMode);

};


%make_alias(SelectMgr_EntityOwner)

%extend SelectMgr_EntityOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class SelectMgr_Filter *
*************************/
%nodefaultctor SelectMgr_Filter;
class SelectMgr_Filter : public Standard_Transient {
	public:
		/****************** ActsOn ******************/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "* Returns true in an AIS local context, if this filter operates on a type of subshape defined in a filter class inheriting this framework. This function completes IsOk in an AIS local context.
	:param aStandardMode:
	:type aStandardMode: TopAbs_ShapeEnum
	:rtype: bool") ActsOn;
		virtual Standard_Boolean ActsOn (const TopAbs_ShapeEnum aStandardMode);

		/****************** IsOk ******************/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "* Indicates that the selected Interactive Object passes the filter. The owner, anObj, can be either direct or user. A direct owner is the corresponding construction element, whereas a user is the compound shape of which the entity forms a part. When an object is detected by the mouse - in AIS, this is done through a context selector - its owner is passed to the filter as an argument. If the object returns Standard_True, it is kept; if not, it is rejected. If you are creating a filter class inheriting this framework, and the daughter class is to be used in an AIS local context, you will need to implement the virtual function ActsOn.
	:param anObj:
	:type anObj: SelectMgr_EntityOwner
	:rtype: bool") IsOk;
		virtual Standard_Boolean IsOk (const opencascade::handle<SelectMgr_EntityOwner> & anObj);

};


%make_alias(SelectMgr_Filter)

%extend SelectMgr_Filter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class SelectMgr_FrustumBuilder *
*********************************/
/***********************************
* class SelectMgr_SelectableObject *
***********************************/
%nodefaultctor SelectMgr_SelectableObject;
class SelectMgr_SelectableObject : public PrsMgr_PresentableObject {
	public:
		/****************** AcceptShapeDecomposition ******************/
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "* Informs the graphic context that the interactive Object may be decomposed into sub-shapes for dynamic selection. The most used Interactive Object is AIS_Shape.
	:rtype: bool") AcceptShapeDecomposition;
		Standard_Boolean AcceptShapeDecomposition ();

		/****************** AddSelection ******************/
		%feature("compactdefaultargs") AddSelection;
		%feature("autodoc", "* Adds the selection aSelection with the selection mode index aMode to this framework.
	:param aSelection:
	:type aSelection: SelectMgr_Selection
	:param aMode:
	:type aMode: int
	:rtype: None") AddSelection;
		void AddSelection (const opencascade::handle<SelectMgr_Selection> & aSelection,const Standard_Integer aMode);

		/****************** ClearDynamicHighlight ******************/
		%feature("compactdefaultargs") ClearDynamicHighlight;
		%feature("autodoc", "* Method that needs to be implemented when the object manages selection and dynamic highlighting on its own. Clears or invalidates dynamic highlight presentation. By default it clears immediate draw of given presentation manager.
	:param theMgr:
	:type theMgr: PrsMgr_PresentationManager
	:rtype: void") ClearDynamicHighlight;
		virtual void ClearDynamicHighlight (const opencascade::handle<PrsMgr_PresentationManager> & theMgr);

		/****************** ClearSelected ******************/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "* Method which clear all selected owners belonging to this selectable object ( for fast presentation draw )
	:rtype: void") ClearSelected;
		virtual void ClearSelected ();

		/****************** ClearSelections ******************/
		%feature("compactdefaultargs") ClearSelections;
		%feature("autodoc", "* Empties all the selections in the SelectableObject <update> parameter defines whether all object's selections should be flagged for further update or not. This improved method can be used to recompute an object's selection (without redisplaying the object completely) when some selection mode is activated not for the first time.
	:param update: default value is Standard_False
	:type update: bool
	:rtype: None") ClearSelections;
		void ClearSelections (const Standard_Boolean update = Standard_False);

		/****************** ComputeSelection ******************/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "* Computes sensitive primitives for the given selection mode - key interface method of Selectable Object. @param theSelection selection to fill @param theMode selection mode to create sensitive primitives
	:param theSelection:
	:type theSelection: SelectMgr_Selection
	:param theMode:
	:type theMode: int
	:rtype: None") ComputeSelection;
		void ComputeSelection (const opencascade::handle<SelectMgr_Selection> & theSelection,const Standard_Integer theMode);

		/****************** CurrentSelection ******************/
		%feature("compactdefaultargs") CurrentSelection;
		%feature("autodoc", "* Returns the current selection in this framework.
	:rtype: opencascade::handle<SelectMgr_Selection>") CurrentSelection;
		const opencascade::handle<SelectMgr_Selection> & CurrentSelection ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** ErasePresentations ******************/
		%feature("compactdefaultargs") ErasePresentations;
		%feature("autodoc", "* Removes presentations returned by GetHilightPresentation() and GetSelectPresentation().
	:param theToRemove:
	:type theToRemove: bool
	:rtype: void") ErasePresentations;
		virtual void ErasePresentations (Standard_Boolean theToRemove);

		/****************** GetAssemblyOwner ******************/
		%feature("compactdefaultargs") GetAssemblyOwner;
		%feature("autodoc", "* Returns common entity owner if the object is an assembly
	:rtype: opencascade::handle<SelectMgr_EntityOwner>") GetAssemblyOwner;
		virtual const opencascade::handle<SelectMgr_EntityOwner> & GetAssemblyOwner ();

		/****************** GetHilightPresentation ******************/
		%feature("compactdefaultargs") GetHilightPresentation;
		%feature("autodoc", "* Creates or returns existing presentation for highlighting detected object. @param thePrsMgr presentation manager to create new presentation returns existing or newly created presentation (when thePrsMgr is not NULL)
	:param thePrsMgr:
	:type thePrsMgr: PrsMgr_PresentationManager
	:rtype: opencascade::handle<Prs3d_Presentation>") GetHilightPresentation;
		opencascade::handle<Prs3d_Presentation> GetHilightPresentation (const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr);

		/****************** GetSelectPresentation ******************/
		%feature("compactdefaultargs") GetSelectPresentation;
		%feature("autodoc", "* Creates or returns existing presentation for highlighting selected object. @param thePrsMgr presentation manager to create new presentation returns existing or newly created presentation (when thePrsMgr is not NULL)
	:param thePrsMgr:
	:type thePrsMgr: PrsMgr_PresentationManager
	:rtype: opencascade::handle<Prs3d_Presentation>") GetSelectPresentation;
		opencascade::handle<Prs3d_Presentation> GetSelectPresentation (const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr);

		/****************** GlobalSelOwner ******************/
		%feature("compactdefaultargs") GlobalSelOwner;
		%feature("autodoc", "* Returns the owner of mode for selection of object as a whole
	:rtype: opencascade::handle<SelectMgr_EntityOwner>") GlobalSelOwner;
		virtual opencascade::handle<SelectMgr_EntityOwner> GlobalSelOwner ();

		/****************** GlobalSelectionMode ******************/
		%feature("compactdefaultargs") GlobalSelectionMode;
		%feature("autodoc", "* Returns the mode for selection of object as a whole; 0 by default.
	:rtype: int") GlobalSelectionMode;
		Standard_Integer GlobalSelectionMode ();

		/****************** HasSelection ******************/
		%feature("compactdefaultargs") HasSelection;
		%feature("autodoc", "* Returns true if a selection corresponding to the selection mode theMode was computed for this object.
	:param theMode:
	:type theMode: int
	:rtype: bool") HasSelection;
		Standard_Boolean HasSelection (const Standard_Integer theMode);

		/****************** HilightOwnerWithColor ******************/
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "* Method which hilight an owner belonging to this selectable object ( for fast presentation draw )
	:param thePM:
	:type thePM: PrsMgr_PresentationManager
	:param theStyle:
	:type theStyle: Prs3d_Drawer
	:param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:rtype: void") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor (const opencascade::handle<PrsMgr_PresentationManager> & thePM,const opencascade::handle<Prs3d_Drawer> & theStyle,const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****************** HilightSelected ******************/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "* Method which draws selected owners ( for fast presentation draw )
	:param thePrsMgr:
	:type thePrsMgr: PrsMgr_PresentationManager
	:param theSeq:
	:type theSeq: SelectMgr_SequenceOfOwner
	:rtype: void") HilightSelected;
		virtual void HilightSelected (const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr,const SelectMgr_SequenceOfOwner & theSeq);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Begins the iteration scanning for sensitive primitives.
	:rtype: None") Init;
		void Init ();

		/****************** IsAutoHilight ******************/
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "* If returns True, the old mechanism for highlighting selected objects is used (HilightSelected Method may be empty). If returns False, the HilightSelected method will be fully responsible for highlighting selected entity owners belonging to this selectable object.
	:rtype: bool") IsAutoHilight;
		Standard_Boolean IsAutoHilight ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Continues the iteration scanning for sensitive primitives.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Continues the iteration scanning for sensitive primitives.
	:rtype: None") Next;
		void Next ();

		/****************** RecomputePrimitives ******************/
		%feature("compactdefaultargs") RecomputePrimitives;
		%feature("autodoc", "* Re-computes the sensitive primitives for all modes. IMPORTANT: Do not use this method to update selection primitives except implementing custom selection manager! This method does not take into account necessary BVH updates, but may invalidate the pointers it refers to. TO UPDATE SELECTION properly from outside classes, use method UpdateSelection.
	:rtype: None") RecomputePrimitives;
		void RecomputePrimitives ();

		/****************** RecomputePrimitives ******************/
		%feature("compactdefaultargs") RecomputePrimitives;
		%feature("autodoc", "* Re-computes the sensitive primitives which correspond to the <theMode>th selection mode. IMPORTANT: Do not use this method to update selection primitives except implementing custom selection manager! selection manager! This method does not take into account necessary BVH updates, but may invalidate the pointers it refers to. TO UPDATE SELECTION properly from outside classes, use method UpdateSelection.
	:param theMode:
	:type theMode: int
	:rtype: None") RecomputePrimitives;
		void RecomputePrimitives (const Standard_Integer theMode);

		/****************** ResetTransformation ******************/
		%feature("compactdefaultargs") ResetTransformation;
		%feature("autodoc", ":rtype: None") ResetTransformation;
		void ResetTransformation ();

		/****************** Selection ******************/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "* Returns the selection having specified selection mode or NULL.
	:param theMode:
	:type theMode: int
	:rtype: opencascade::handle<SelectMgr_Selection>") Selection;
		const opencascade::handle<SelectMgr_Selection> & Selection (const Standard_Integer theMode);

		/****************** Selections ******************/
		%feature("compactdefaultargs") Selections;
		%feature("autodoc", "* Return the sequence of selections.
	:rtype: SelectMgr_SequenceOfSelection") Selections;
		const SelectMgr_SequenceOfSelection & Selections ();

		/****************** SetAssemblyOwner ******************/
		%feature("compactdefaultargs") SetAssemblyOwner;
		%feature("autodoc", "* Sets common entity owner for assembly sensitive object entities
	:param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:param theMode: default value is -1
	:type theMode: int
	:rtype: None") SetAssemblyOwner;
		void SetAssemblyOwner (const opencascade::handle<SelectMgr_EntityOwner> & theOwner,const Standard_Integer theMode = -1);

		/****************** SetAutoHilight ******************/
		%feature("compactdefaultargs") SetAutoHilight;
		%feature("autodoc", "* Set AutoHilight property to true or false.
	:param theAutoHilight:
	:type theAutoHilight: bool
	:rtype: None") SetAutoHilight;
		void SetAutoHilight (const Standard_Boolean theAutoHilight);

		/****************** SetZLayer ******************/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "* Set Z layer ID and update all presentations of the selectable object. The layers mechanism allows drawing objects in higher layers in overlay of objects in lower layers.
	:param theLayerId:
	:type theLayerId: int
	:rtype: void") SetZLayer;
		virtual void SetZLayer (int theLayerId);

		/****************** UpdateSelection ******************/
		%feature("compactdefaultargs") UpdateSelection;
		%feature("autodoc", "* Sets update status FULL to selections of the object. Must be used as the only method of UpdateSelection from outer classes to prevent BVH structures from being outdated.
	:param theMode: default value is -1
	:type theMode: int
	:rtype: None") UpdateSelection;
		void UpdateSelection (const Standard_Integer theMode = -1);

		/****************** UpdateTransformation ******************/
		%feature("compactdefaultargs") UpdateTransformation;
		%feature("autodoc", "* Recomputes the location of the selection aSelection.
	:rtype: void") UpdateTransformation;
		virtual void UpdateTransformation ();

		/****************** UpdateTransformations ******************/
		%feature("compactdefaultargs") UpdateTransformations;
		%feature("autodoc", "* Updates locations in all sensitive entities from <aSelection> and in corresponding entity owners.
	:param aSelection:
	:type aSelection: SelectMgr_Selection
	:rtype: void") UpdateTransformations;
		virtual void UpdateTransformations (const opencascade::handle<SelectMgr_Selection> & aSelection);

};


%make_alias(SelectMgr_SelectableObject)

%extend SelectMgr_SelectableObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class SelectMgr_SelectableObjectSet *
**************************************/
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

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "* Adds the new selectable object to the set. The selectable object is placed into one of the predefined subsets depending on its persistence type. After adding an object, this method marks the corresponding BVH tree for rebuild. returns true if selectable object is added, otherwise returns false (selectable object is already in the set).
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:rtype: bool") Append;
		Standard_Boolean Append (const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****************** BVH ******************/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "* Returns computed BVH for the theSubset given.
	:param theSubset:
	:type theSubset: BVHSubset
	:rtype: opencascade::handle<BVH_Tree<float, 3> >") BVH;
		const opencascade::handle<BVH_Tree<Standard_Real, 3> > & BVH (const BVHSubset theSubset);

		/****************** ChangeSubset ******************/
		%feature("compactdefaultargs") ChangeSubset;
		%feature("autodoc", "* Performs necessary updates when object's persistence types changes. This method should be called right after changing transformation persistence flags of the objects and before updating BVH tree - to provide up-to-date state of the object set.
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:rtype: None") ChangeSubset;
		void ChangeSubset (const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* Returns true if this objects set contains theObject given.
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:rtype: bool") Contains;
		Standard_Boolean Contains (const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****************** GetObjectById ******************/
		%feature("compactdefaultargs") GetObjectById;
		%feature("autodoc", "* Returns object from subset theSubset by theIndex given. The method allows to get selectable object referred by the index of an element of the subset's BVH tree.
	:param theSubset:
	:type theSubset: BVHSubset
	:param theIndex:
	:type theIndex: int
	:rtype: opencascade::handle<SelectMgr_SelectableObject>") GetObjectById;
		const opencascade::handle<SelectMgr_SelectableObject> & GetObjectById (const BVHSubset theSubset,const Standard_Integer theIndex);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns true if the object set does not contain any selectable objects.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns true if the specified object subset is empty.
	:param theSubset:
	:type theSubset: BVHSubset
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty (const BVHSubset theSubset);

		/****************** MarkDirty ******************/
		%feature("compactdefaultargs") MarkDirty;
		%feature("autodoc", "* Marks every BVH subset for update.
	:rtype: None") MarkDirty;
		void MarkDirty ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes the selectable object from the set. The selectable object is removed from the subset it has been placed into. After removing an object, this method marks the corresponding BVH tree for rebuild. returns true if selectable object is removed, otherwise returns false (selectable object is not in the set).
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:rtype: bool") Remove;
		Standard_Boolean Remove (const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****************** SelectMgr_SelectableObjectSet ******************/
		%feature("compactdefaultargs") SelectMgr_SelectableObjectSet;
		%feature("autodoc", "* Creates new empty objects set and initializes BVH tree builders for each subset.
	:rtype: None") SelectMgr_SelectableObjectSet;
		 SelectMgr_SelectableObjectSet ();

		/****************** UpdateBVH ******************/
		%feature("compactdefaultargs") UpdateBVH;
		%feature("autodoc", "* Updates outdated BVH trees and remembers the last state of the camera view-projection matrices and viewport (window) dimensions.
	:param theCamera:
	:type theCamera: Graphic3d_Camera
	:param theProjectionMat:
	:type theProjectionMat: Graphic3d_Mat4d
	:param theWorldViewMat:
	:type theWorldViewMat: Graphic3d_Mat4d
	:param theViewState:
	:type theViewState: Graphic3d_WorldViewProjState
	:param theViewportWidth:
	:type theViewportWidth: int
	:param theViewportHeight:
	:type theViewportHeight: int
	:rtype: None") UpdateBVH;
		void UpdateBVH (const opencascade::handle<Graphic3d_Camera> & theCamera,const Graphic3d_Mat4d & theProjectionMat,const Graphic3d_Mat4d & theWorldViewMat,const Graphic3d_WorldViewProjState & theViewState,const Standard_Integer theViewportWidth,const Standard_Integer theViewportHeight);

};


%extend SelectMgr_SelectableObjectSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class SelectMgr_SelectingVolumeManager *
*****************************************/
class SelectMgr_SelectingVolumeManager : public SelectBasics_SelectingVolumeManager {
	public:
		/****************** AllowOverlapDetection ******************/
		%feature("compactdefaultargs") AllowOverlapDetection;
		%feature("autodoc", "* Is used for rectangular selection only If theIsToAllow is false, only fully included sensitives will be detected, otherwise the algorithm will mark both included and overlapped entities as matched
	:param theIsToAllow:
	:type theIsToAllow: bool
	:rtype: void") AllowOverlapDetection;
		virtual void AllowOverlapDetection (const Standard_Boolean theIsToAllow);

		/****************** BuildSelectingVolume ******************/
		%feature("compactdefaultargs") BuildSelectingVolume;
		%feature("autodoc", "* Builds rectangular selecting frustum for point selection
	:param thePoint:
	:type thePoint: gp_Pnt2d
	:rtype: None") BuildSelectingVolume;
		void BuildSelectingVolume (const gp_Pnt2d & thePoint);

		/****************** BuildSelectingVolume ******************/
		%feature("compactdefaultargs") BuildSelectingVolume;
		%feature("autodoc", "* Builds rectangular selecting frustum for box selection
	:param theMinPt:
	:type theMinPt: gp_Pnt2d
	:param theMaxPt:
	:type theMaxPt: gp_Pnt2d
	:rtype: None") BuildSelectingVolume;
		void BuildSelectingVolume (const gp_Pnt2d & theMinPt,const gp_Pnt2d & theMaxPt);

		/****************** BuildSelectingVolume ******************/
		%feature("compactdefaultargs") BuildSelectingVolume;
		%feature("autodoc", "* Builds set of triangular selecting frustums for polyline selection
	:param thePoints:
	:type thePoints: TColgp_Array1OfPnt2d
	:rtype: None") BuildSelectingVolume;
		void BuildSelectingVolume (const TColgp_Array1OfPnt2d & thePoints);

		/****************** Camera ******************/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "* Returns current camera definition.
	:rtype: opencascade::handle<Graphic3d_Camera>") Camera;
		const opencascade::handle<Graphic3d_Camera> & Camera ();

		/****************** DetectedPoint ******************/
		%feature("compactdefaultargs") DetectedPoint;
		%feature("autodoc", "* Calculates the point on a view ray that was detected during the run of selection algo by given depth. Throws exception if active selection type is not Point.
	:param theDepth:
	:type theDepth: float
	:rtype: gp_Pnt") DetectedPoint;
		virtual gp_Pnt DetectedPoint (const Standard_Real theDepth);

		/****************** DistToGeometryCenter ******************/
		%feature("compactdefaultargs") DistToGeometryCenter;
		%feature("autodoc", "* Measures distance between 3d projection of user-picked screen point and given point theCOG
	:param theCOG:
	:type theCOG: gp_Pnt
	:rtype: float") DistToGeometryCenter;
		virtual Standard_Real DistToGeometryCenter (const gp_Pnt & theCOG);

		/****************** GetActiveSelectionType ******************/
		%feature("compactdefaultargs") GetActiveSelectionType;
		%feature("autodoc", ":rtype: int") GetActiveSelectionType;
		virtual Standard_Integer GetActiveSelectionType ();

		/****************** GetFarPickedPnt ******************/
		%feature("compactdefaultargs") GetFarPickedPnt;
		%feature("autodoc", "* Valid only for point and rectangular selection. Returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto far view frustum plane
	:rtype: gp_Pnt") GetFarPickedPnt;
		virtual gp_Pnt GetFarPickedPnt ();

		/****************** GetMousePosition ******************/
		%feature("compactdefaultargs") GetMousePosition;
		%feature("autodoc", "* Return mouse coordinates for Point selection mode.
	:rtype: gp_Pnt2d") GetMousePosition;
		gp_Pnt2d GetMousePosition ();

		/****************** GetNearPickedPnt ******************/
		%feature("compactdefaultargs") GetNearPickedPnt;
		%feature("autodoc", "* Valid only for point and rectangular selection. Returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto near view frustum plane
	:rtype: gp_Pnt") GetNearPickedPnt;
		virtual gp_Pnt GetNearPickedPnt ();

		/****************** GetPlanes ******************/
		%feature("compactdefaultargs") GetPlanes;
		%feature("autodoc", "* Stores plane equation coefficients (in the following form: Ax + By + Cz + D = 0) to the given vector
	:param thePlaneEquations:
	:type thePlaneEquations: NCollection_Vector<SelectMgr_Vec4>
	:rtype: None") GetPlanes;
		void GetPlanes (NCollection_Vector<SelectMgr_Vec4> & thePlaneEquations);

		/****************** GetVertices ******************/
		%feature("compactdefaultargs") GetVertices;
		%feature("autodoc", "* A set of helper functions that return rectangular selecting frustum data
	:rtype: gp_Pnt *") GetVertices;
		const gp_Pnt * GetVertices ();

		/****************** IsOverlapAllowed ******************/
		%feature("compactdefaultargs") IsOverlapAllowed;
		%feature("autodoc", ":rtype: bool") IsOverlapAllowed;
		virtual Standard_Boolean IsOverlapAllowed ();

		/****************** ObjectClipping ******************/
		%feature("compactdefaultargs") ObjectClipping;
		%feature("autodoc", "* Return object clipping planes.
	:rtype: opencascade::handle<Graphic3d_SequenceOfHClipPlane>") ObjectClipping;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ObjectClipping ();

		/****************** Overlaps ******************/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "* SAT intersection test between defined volume and given axis-aligned box
	:param theBoxMin:
	:type theBoxMin: SelectMgr_Vec3
	:param theBoxMax:
	:type theBoxMax: SelectMgr_Vec3
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Overlaps;
		virtual Standard_Boolean Overlaps (const SelectMgr_Vec3 & theBoxMin,const SelectMgr_Vec3 & theBoxMax,SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "* Returns true if selecting volume is overlapped by axis-aligned bounding box with minimum corner at point theMinPt and maximum at point theMaxPt
	:param theBoxMin:
	:type theBoxMin: SelectMgr_Vec3
	:param theBoxMax:
	:type theBoxMax: SelectMgr_Vec3
	:param theInside: default value is NULL
	:type theInside: bool *
	:rtype: bool") Overlaps;
		virtual Standard_Boolean Overlaps (const SelectMgr_Vec3 & theBoxMin,const SelectMgr_Vec3 & theBoxMax,Standard_Boolean * theInside = NULL);

		/****************** Overlaps ******************/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "* Intersection test between defined volume and given point
	:param thePnt:
	:type thePnt: gp_Pnt
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Overlaps;
		virtual Standard_Boolean Overlaps (const gp_Pnt & thePnt,SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "* Intersection test between defined volume and given point
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: bool") Overlaps;
		virtual Standard_Boolean Overlaps (const gp_Pnt & thePnt);

		/****************** Overlaps ******************/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "* SAT intersection test between defined volume and given ordered set of points, representing line segments. The test may be considered of interior part or boundary line defined by segments depending on given sensitivity type
	:param theArrayOfPts:
	:type theArrayOfPts: TColgp_HArray1OfPnt
	:param theSensType:
	:type theSensType: int
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Overlaps;
		virtual Standard_Boolean Overlaps (const opencascade::handle<TColgp_HArray1OfPnt> & theArrayOfPts,Standard_Integer theSensType,SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "* SAT intersection test between defined volume and given ordered set of points, representing line segments. The test may be considered of interior part or boundary line defined by segments depending on given sensitivity type
	:param theArrayOfPts:
	:type theArrayOfPts: TColgp_Array1OfPnt
	:param theSensType:
	:type theSensType: int
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Overlaps;
		virtual Standard_Boolean Overlaps (const TColgp_Array1OfPnt & theArrayOfPts,Standard_Integer theSensType,SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "* Checks if line segment overlaps selecting frustum
	:param thePnt1:
	:type thePnt1: gp_Pnt
	:param thePnt2:
	:type thePnt2: gp_Pnt
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Overlaps;
		virtual Standard_Boolean Overlaps (const gp_Pnt & thePnt1,const gp_Pnt & thePnt2,SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "* SAT intersection test between defined volume and given triangle. The test may be considered of interior part or boundary line defined by triangle vertices depending on given sensitivity type
	:param thePnt1:
	:type thePnt1: gp_Pnt
	:param thePnt2:
	:type thePnt2: gp_Pnt
	:param thePnt3:
	:type thePnt3: gp_Pnt
	:param theSensType:
	:type theSensType: int
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Overlaps;
		virtual Standard_Boolean Overlaps (const gp_Pnt & thePnt1,const gp_Pnt & thePnt2,const gp_Pnt & thePnt3,Standard_Integer theSensType,SelectBasics_PickResult & thePickResult);

		/****************** ProjectionMatrix ******************/
		%feature("compactdefaultargs") ProjectionMatrix;
		%feature("autodoc", "* returns current projection transformation common for all selecting volumes
	:rtype: Graphic3d_Mat4d") ProjectionMatrix;
		const Graphic3d_Mat4d & ProjectionMatrix ();

		/****************** ScaleAndTransform ******************/
		%feature("compactdefaultargs") ScaleAndTransform;
		%feature("autodoc", "* IMPORTANT: Scaling makes sense only for frustum built on a single point! Note that this method does not perform any checks on type of the frustum. //! Returns a copy of the frustum resized according to the scale factor given and transforms it using the matrix given. There are no default parameters, but in case if: - transformation only is needed: @theScaleFactor must be initialized as any negative value; - scale only is needed: @theTrsf must be set to gp_Identity. Builder is an optional argument that represents corresponding settings for re-constructing transformed frustum from scratch. Can be null if reconstruction is not expected furthermore.
	:param theScaleFactor:
	:type theScaleFactor: int
	:param theTrsf:
	:type theTrsf: gp_GTrsf
	:param theBuilder: default value is NULL
	:type theBuilder: SelectMgr_FrustumBuilder
	:rtype: SelectMgr_SelectingVolumeManager") ScaleAndTransform;
		virtual SelectMgr_SelectingVolumeManager ScaleAndTransform (const Standard_Integer theScaleFactor,const gp_GTrsf & theTrsf,const opencascade::handle<SelectMgr_FrustumBuilder> & theBuilder = NULL);

		/****************** SelectMgr_SelectingVolumeManager ******************/
		%feature("compactdefaultargs") SelectMgr_SelectingVolumeManager;
		%feature("autodoc", "* Creates instances of all available selecting volume types
	:param theToAllocateFrustums: default value is Standard_True
	:type theToAllocateFrustums: bool
	:rtype: None") SelectMgr_SelectingVolumeManager;
		 SelectMgr_SelectingVolumeManager (Standard_Boolean theToAllocateFrustums = Standard_True);

		/****************** SetActiveSelectionType ******************/
		%feature("compactdefaultargs") SetActiveSelectionType;
		%feature("autodoc", ":param theType:
	:type theType: SelectionType
	:rtype: None") SetActiveSelectionType;
		void SetActiveSelectionType (const SelectionType & theType);

		/****************** SetCamera ******************/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "* Updates camera projection and orientation matrices in all selecting volumes
	:param theCamera:
	:type theCamera: Graphic3d_Camera
	:rtype: None") SetCamera;
		void SetCamera (const opencascade::handle<Graphic3d_Camera> theCamera);

		/****************** SetCamera ******************/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "* Updates camera projection and orientation matrices in all selecting volumes
	:param theProjection:
	:type theProjection: Graphic3d_Mat4d
	:param theWorldView:
	:type theWorldView: Graphic3d_Mat4d
	:param theIsOrthographic:
	:type theIsOrthographic: bool
	:param theWVPState: default value is Graphic3d_WorldViewProjState()
	:type theWVPState: Graphic3d_WorldViewProjState
	:rtype: None") SetCamera;
		void SetCamera (const Graphic3d_Mat4d & theProjection,const Graphic3d_Mat4d & theWorldView,const Standard_Boolean theIsOrthographic,const Graphic3d_WorldViewProjState & theWVPState = Graphic3d_WorldViewProjState());

		/****************** SetPixelTolerance ******************/
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "* Updates pixel tolerance in all selecting volumes
	:param theTolerance:
	:type theTolerance: int
	:rtype: None") SetPixelTolerance;
		void SetPixelTolerance (const Standard_Integer theTolerance);

		/****************** SetViewClipRanges ******************/
		%feature("compactdefaultargs") SetViewClipRanges;
		%feature("autodoc", "* Set clipping range.
	:param theRange:
	:type theRange: SelectMgr_ViewClipRange
	:rtype: None") SetViewClipRanges;
		void SetViewClipRanges (const SelectMgr_ViewClipRange & theRange);

		/****************** SetViewClipping ******************/
		%feature("compactdefaultargs") SetViewClipping;
		%feature("autodoc", "* Valid for point selection only! Computes depth range for clipping planes. @param theViewPlanes global view planes @param theObjPlanes object planes
	:param theViewPlanes:
	:type theViewPlanes: Graphic3d_SequenceOfHClipPlane
	:param theObjPlanes:
	:type theObjPlanes: Graphic3d_SequenceOfHClipPlane
	:rtype: None") SetViewClipping;
		void SetViewClipping (const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & theViewPlanes,const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & theObjPlanes);

		/****************** SetViewClipping ******************/
		%feature("compactdefaultargs") SetViewClipping;
		%feature("autodoc", "* Copy clipping planes from another volume manager.
	:param theOther:
	:type theOther: SelectMgr_SelectingVolumeManager
	:rtype: None") SetViewClipping;
		void SetViewClipping (const SelectMgr_SelectingVolumeManager & theOther);

		/****************** SetViewport ******************/
		%feature("compactdefaultargs") SetViewport;
		%feature("autodoc", "* Updates viewport in all selecting volumes
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theWidth:
	:type theWidth: float
	:param theHeight:
	:type theHeight: float
	:rtype: None") SetViewport;
		void SetViewport (const Standard_Real theX,const Standard_Real theY,const Standard_Real theWidth,const Standard_Real theHeight);

		/****************** SetWindowSize ******************/
		%feature("compactdefaultargs") SetWindowSize;
		%feature("autodoc", "* Updates window size in all selecting volumes
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:rtype: None") SetWindowSize;
		void SetWindowSize (const Standard_Integer theWidth,const Standard_Integer theHeight);

		/****************** ViewClipRanges ******************/
		%feature("compactdefaultargs") ViewClipRanges;
		%feature("autodoc", "* Return clipping range.
	:rtype: SelectMgr_ViewClipRange") ViewClipRanges;
		const SelectMgr_ViewClipRange & ViewClipRanges ();

		/****************** ViewClipping ******************/
		%feature("compactdefaultargs") ViewClipping;
		%feature("autodoc", "* Return view clipping planes.
	:rtype: opencascade::handle<Graphic3d_SequenceOfHClipPlane>") ViewClipping;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ViewClipping ();

		/****************** WindowSize ******************/
		%feature("compactdefaultargs") WindowSize;
		%feature("autodoc", ":param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:rtype: None") WindowSize;
		void WindowSize (Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** WorldViewMatrix ******************/
		%feature("compactdefaultargs") WorldViewMatrix;
		%feature("autodoc", "* returns current world view transformation common for all selecting volumes
	:rtype: Graphic3d_Mat4d") WorldViewMatrix;
		const Graphic3d_Mat4d & WorldViewMatrix ();

		/****************** WorldViewProjState ******************/
		%feature("compactdefaultargs") WorldViewProjState;
		%feature("autodoc", "* returns current camera world view projection transformation state common for all selecting volumes
	:rtype: Graphic3d_WorldViewProjState") WorldViewProjState;
		const Graphic3d_WorldViewProjState & WorldViewProjState ();

};


%extend SelectMgr_SelectingVolumeManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class SelectMgr_Selection *
****************************/
class SelectMgr_Selection : public Standard_Transient {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the sensitive primitive to the list of stored entities in this object. Raises NullObject if the primitive is a null handle.
	:param theSensitive:
	:type theSensitive: Select3D_SensitiveEntity
	:rtype: None") Add;
		void Add (const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****************** BVHUpdateStatus ******************/
		%feature("compactdefaultargs") BVHUpdateStatus;
		%feature("autodoc", ":rtype: SelectMgr_TypeOfBVHUpdate") BVHUpdateStatus;
		SelectMgr_TypeOfBVHUpdate BVHUpdateStatus ();

		/****************** ChangeEntities ******************/
		%feature("compactdefaultargs") ChangeEntities;
		%feature("autodoc", "* Return entities.
	:rtype: NCollection_Vector<opencascade::handle<SelectMgr_SensitiveEntity> >") ChangeEntities;
		NCollection_Vector<opencascade::handle<SelectMgr_SensitiveEntity> > & ChangeEntities ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* empties the selection from all the stored entities
	:rtype: None") Clear;
		void Clear ();

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", ":rtype: None") Destroy;
		void Destroy ();

		/****************** Entities ******************/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "* Return entities.
	:rtype: NCollection_Vector<opencascade::handle<SelectMgr_SensitiveEntity> >") Entities;
		const NCollection_Vector<opencascade::handle<SelectMgr_SensitiveEntity> > & Entities ();

		/****************** GetSelectionState ******************/
		%feature("compactdefaultargs") GetSelectionState;
		%feature("autodoc", "* Returns status of selection
	:rtype: SelectMgr_StateOfSelection") GetSelectionState;
		SelectMgr_StateOfSelection GetSelectionState ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Begins an iteration scanning for sensitive primitives.
	:rtype: None") Init;
		void Init ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* returns true if no sensitive entity is stored.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** Mode ******************/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "* returns the selection mode represented by this selection
	:rtype: int") Mode;
		Standard_Integer Mode ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Continues the iteration scanning for sensitive primitives with the mode defined in this framework.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Returns the next sensitive primitive found in the iteration. This is a scan for entities with the mode defined in this framework.
	:rtype: None") Next;
		void Next ();

		/****************** SelectMgr_Selection ******************/
		%feature("compactdefaultargs") SelectMgr_Selection;
		%feature("autodoc", "* Constructs a selection object defined by the selection mode IdMode. The default setting 0 is the selection mode for a shape in its entirety.
	:param theModeIdx: default value is 0
	:type theModeIdx: int
	:rtype: None") SelectMgr_Selection;
		 SelectMgr_Selection (const Standard_Integer theModeIdx = 0);

		/****************** Sensitive ******************/
		%feature("compactdefaultargs") Sensitive;
		%feature("autodoc", "* Returns any sensitive primitive in this framework.
	:rtype: opencascade::handle<SelectMgr_SensitiveEntity>") Sensitive;
		const opencascade::handle<SelectMgr_SensitiveEntity> & Sensitive ();

		/****************** Sensitivity ******************/
		%feature("compactdefaultargs") Sensitivity;
		%feature("autodoc", "* Returns sensitivity of the selection
	:rtype: int") Sensitivity;
		Standard_Integer Sensitivity ();

		/****************** SetSelectionState ******************/
		%feature("compactdefaultargs") SetSelectionState;
		%feature("autodoc", "* Sets status of selection
	:param theState:
	:type theState: SelectMgr_StateOfSelection
	:rtype: None") SetSelectionState;
		void SetSelectionState (const SelectMgr_StateOfSelection theState);

		/****************** SetSensitivity ******************/
		%feature("compactdefaultargs") SetSensitivity;
		%feature("autodoc", "* Changes sensitivity of the selection and all its entities to the given value. IMPORTANT: This method does not update any outer selection structures, so for proper updates use SelectMgr_SelectionManager::SetSelectionSensitivity method.
	:param theNewSens:
	:type theNewSens: int
	:rtype: None") SetSensitivity;
		void SetSensitivity (const Standard_Integer theNewSens);

		/****************** UpdateBVHStatus ******************/
		%feature("compactdefaultargs") UpdateBVHStatus;
		%feature("autodoc", ":param theStatus:
	:type theStatus: SelectMgr_TypeOfBVHUpdate
	:rtype: None") UpdateBVHStatus;
		void UpdateBVHStatus (const SelectMgr_TypeOfBVHUpdate theStatus);

		/****************** UpdateStatus ******************/
		%feature("compactdefaultargs") UpdateStatus;
		%feature("autodoc", "* Returns the flag UpdateFlag. This flage gives the update status of this framework in a ViewerSelector object: - full - partial, or - none.
	:rtype: SelectMgr_TypeOfUpdate") UpdateStatus;
		SelectMgr_TypeOfUpdate UpdateStatus ();

		/****************** UpdateStatus ******************/
		%feature("compactdefaultargs") UpdateStatus;
		%feature("autodoc", ":param theStatus:
	:type theStatus: SelectMgr_TypeOfUpdate
	:rtype: None") UpdateStatus;
		void UpdateStatus (const SelectMgr_TypeOfUpdate theStatus);

};


%make_alias(SelectMgr_Selection)

%extend SelectMgr_Selection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class SelectMgr_SelectionManager *
***********************************/
class SelectMgr_SelectionManager : public Standard_Transient {
	public:
		/****************** Activate ******************/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "* Activates the selection mode theMode in the selector theSelector for the selectable object anObject. By default, theMode is equal to 0. If theSelector is set to default (NULL), the selection with the mode theMode will be activated in all the viewers available.
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None") Activate;
		void Activate (const opencascade::handle<SelectMgr_SelectableObject> & theObject,const Standard_Integer theMode = 0);

		/****************** ClearSelectionStructures ******************/
		%feature("compactdefaultargs") ClearSelectionStructures;
		%feature("autodoc", "* Removes sensitive entities from all viewer selectors after method Clear() was called to the selection they belonged to or it was recomputed somehow.
	:param theObj:
	:type theObj: SelectMgr_SelectableObject
	:param theMode: default value is -1
	:type theMode: int
	:rtype: None") ClearSelectionStructures;
		void ClearSelectionStructures (const opencascade::handle<SelectMgr_SelectableObject> & theObj,const Standard_Integer theMode = -1);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* Returns true if the manager contains the selectable object theObject.
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:rtype: bool") Contains;
		Standard_Boolean Contains (const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****************** Deactivate ******************/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "* Deactivates mode theMode of theObject in theSelector. If theMode value is set to default (-1), all active selection modes will be deactivated. Likewise, if theSelector value is set to default (NULL), theMode will be deactivated in all viewer selectors.
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:param theMode: default value is -1
	:type theMode: int
	:rtype: None") Deactivate;
		void Deactivate (const opencascade::handle<SelectMgr_SelectableObject> & theObject,const Standard_Integer theMode = -1);

		/****************** IsActivated ******************/
		%feature("compactdefaultargs") IsActivated;
		%feature("autodoc", "* Returns true if the selection with theMode is active for the selectable object theObject and selector theSelector. If all parameters are set to default values, it returns it there is any active selection in any known viewer selector for object theObject.
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:param theMode: default value is -1
	:type theMode: int
	:rtype: bool") IsActivated;
		Standard_Boolean IsActivated (const opencascade::handle<SelectMgr_SelectableObject> & theObject,const Standard_Integer theMode = -1);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Loads and computes selection mode theMode (if it is not equal to -1) in global context and adds selectable object to BVH tree. If the object theObject has an already calculated selection with mode theMode and it was removed, the selection will be recalculated.
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:param theMode: default value is -1
	:type theMode: int
	:rtype: None") Load;
		void Load (const opencascade::handle<SelectMgr_SelectableObject> & theObject,const Standard_Integer theMode = -1);

		/****************** RecomputeSelection ******************/
		%feature("compactdefaultargs") RecomputeSelection;
		%feature("autodoc", "* Recomputes activated selections of theObject for all known viewer selectors according to theMode specified. If theMode is set to default (-1), then all activated selections will be recomputed. If theIsForce is set to true, then selection mode theMode for object theObject will be recomputed regardless of its activation status.
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:param theIsForce: default value is Standard_False
	:type theIsForce: bool
	:param theMode: default value is -1
	:type theMode: int
	:rtype: None") RecomputeSelection;
		void RecomputeSelection (const opencascade::handle<SelectMgr_SelectableObject> & theObject,const Standard_Boolean theIsForce = Standard_False,const Standard_Integer theMode = -1);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes selectable object theObject from all viewer selectors it was added to previously, removes it from all contexts and clears all computed selections of theObject.
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:rtype: None") Remove;
		void Remove (const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****************** RestoreSelectionStructures ******************/
		%feature("compactdefaultargs") RestoreSelectionStructures;
		%feature("autodoc", "* Re-adds newly calculated sensitive entities of recomputed selection defined by mode theMode to all viewer selectors contained that selection.
	:param theObj:
	:type theObj: SelectMgr_SelectableObject
	:param theMode: default value is -1
	:type theMode: int
	:rtype: None") RestoreSelectionStructures;
		void RestoreSelectionStructures (const opencascade::handle<SelectMgr_SelectableObject> & theObj,const Standard_Integer theMode = -1);

		/****************** SelectMgr_SelectionManager ******************/
		%feature("compactdefaultargs") SelectMgr_SelectionManager;
		%feature("autodoc", "* Constructs an empty selection manager object.
	:param theSelector:
	:type theSelector: SelectMgr_ViewerSelector
	:rtype: None") SelectMgr_SelectionManager;
		 SelectMgr_SelectionManager (const opencascade::handle<SelectMgr_ViewerSelector> & theSelector);

		/****************** Selector ******************/
		%feature("compactdefaultargs") Selector;
		%feature("autodoc", "* Return the Selector.
	:rtype: opencascade::handle<SelectMgr_ViewerSelector>") Selector;
		const opencascade::handle<SelectMgr_ViewerSelector> & Selector ();

		/****************** SetSelectionSensitivity ******************/
		%feature("compactdefaultargs") SetSelectionSensitivity;
		%feature("autodoc", "* Allows to manage sensitivity of a particular selection of interactive object theObject and changes previous sensitivity value of all sensitive entities in selection with theMode to the given theNewSensitivity.
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:param theMode:
	:type theMode: int
	:param theNewSens:
	:type theNewSens: int
	:rtype: None") SetSelectionSensitivity;
		void SetSelectionSensitivity (const opencascade::handle<SelectMgr_SelectableObject> & theObject,const Standard_Integer theMode,const Standard_Integer theNewSens);

		/****************** SetUpdateMode ******************/
		%feature("compactdefaultargs") SetUpdateMode;
		%feature("autodoc", "* Sets type of update of all selections of theObject to the given theType.
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:param theType:
	:type theType: SelectMgr_TypeOfUpdate
	:rtype: None") SetUpdateMode;
		void SetUpdateMode (const opencascade::handle<SelectMgr_SelectableObject> & theObject,const SelectMgr_TypeOfUpdate theType);

		/****************** SetUpdateMode ******************/
		%feature("compactdefaultargs") SetUpdateMode;
		%feature("autodoc", "* Sets type of update of selection with theMode of theObject to the given theType.
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:param theMode:
	:type theMode: int
	:param theType:
	:type theType: SelectMgr_TypeOfUpdate
	:rtype: None") SetUpdateMode;
		void SetUpdateMode (const opencascade::handle<SelectMgr_SelectableObject> & theObject,const Standard_Integer theMode,const SelectMgr_TypeOfUpdate theType);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Updates all selections of theObject in all viewer selectors according to its current update status. If theIsForce is set to true, the call is equal to recomputation.
	:param theObject:
	:type theObject: SelectMgr_SelectableObject
	:param theIsForce: default value is Standard_True
	:type theIsForce: bool
	:rtype: None") Update;
		void Update (const opencascade::handle<SelectMgr_SelectableObject> & theObject,const Standard_Boolean theIsForce = Standard_True);

		/****************** UpdateSelection ******************/
		%feature("compactdefaultargs") UpdateSelection;
		%feature("autodoc", "* Re-adds selectable object in BVHs in all viewer selectors.
	:param theObj:
	:type theObj: SelectMgr_SelectableObject
	:rtype: None") UpdateSelection;
		void UpdateSelection (const opencascade::handle<SelectMgr_SelectableObject> & theObj);

};


%make_alias(SelectMgr_SelectionManager)

%extend SelectMgr_SelectionManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class SelectMgr_SensitiveEntity *
**********************************/
class SelectMgr_SensitiveEntity : public Standard_Transient {
	public:
		/****************** BaseSensitive ******************/
		%feature("compactdefaultargs") BaseSensitive;
		%feature("autodoc", "* Returns related instance of SelectBasics class
	:rtype: opencascade::handle<Select3D_SensitiveEntity>") BaseSensitive;
		const opencascade::handle<Select3D_SensitiveEntity> & BaseSensitive ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears up all resources and memory
	:rtype: None") Clear;
		void Clear ();

		/****************** IsActiveForSelection ******************/
		%feature("compactdefaultargs") IsActiveForSelection;
		%feature("autodoc", "* Returns true if this entity belongs to the active selection mode of parent object
	:rtype: bool") IsActiveForSelection;
		Standard_Boolean IsActiveForSelection ();

		/****************** ResetSelectionActiveStatus ******************/
		%feature("compactdefaultargs") ResetSelectionActiveStatus;
		%feature("autodoc", "* Marks entity as inactive for selection
	:rtype: None") ResetSelectionActiveStatus;
		void ResetSelectionActiveStatus ();

		/****************** SelectMgr_SensitiveEntity ******************/
		%feature("compactdefaultargs") SelectMgr_SensitiveEntity;
		%feature("autodoc", "* Creates new inactive for selection object with base entity theEntity
	:param theEntity:
	:type theEntity: Select3D_SensitiveEntity
	:rtype: None") SelectMgr_SensitiveEntity;
		 SelectMgr_SensitiveEntity (const opencascade::handle<Select3D_SensitiveEntity> & theEntity);

		/****************** SetActiveForSelection ******************/
		%feature("compactdefaultargs") SetActiveForSelection;
		%feature("autodoc", "* Marks entity as active for selection
	:rtype: None") SetActiveForSelection;
		void SetActiveForSelection ();

};


%make_alias(SelectMgr_SensitiveEntity)

%extend SelectMgr_SensitiveEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class SelectMgr_SensitiveEntitySet *
*************************************/
/********************************
* class SelectMgr_SortCriterion *
********************************/
class SelectMgr_SortCriterion {
	public:
		opencascade::handle<Select3D_SensitiveEntity> Entity;
		gp_Pnt Point;
		float Depth;
		float MinDist;
		float Tolerance;
		int Priority;
		int ZLayerPosition;
		int NbOwnerMatches;
		bool ToPreferClosest;
		/****************** IsGreater ******************/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "* Compare with another item.
	:param theOther:
	:type theOther: SelectMgr_SortCriterion
	:rtype: bool") IsGreater;
		bool IsGreater (const SelectMgr_SortCriterion & theOther);

		/****************** IsLower ******************/
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "* Compare with another item.
	:param theOther:
	:type theOther: SelectMgr_SortCriterion
	:rtype: bool") IsLower;
		bool IsLower (const SelectMgr_SortCriterion & theOther);

		/****************** SelectMgr_SortCriterion ******************/
		%feature("compactdefaultargs") SelectMgr_SortCriterion;
		%feature("autodoc", "* //!< whether closest object is preferred even if has less priority Empty constructor.
	:rtype: None") SelectMgr_SortCriterion;
		 SelectMgr_SortCriterion ();

		/****************** operator > ******************/
		%feature("compactdefaultargs") operator >;
		%feature("autodoc", "* Comparison operator.
	:param theOther:
	:type theOther: SelectMgr_SortCriterion
	:rtype: bool") operator >;
		bool operator > (const SelectMgr_SortCriterion & theOther);

};


%extend SelectMgr_SortCriterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class SelectMgr_ToleranceMap *
*******************************/
/********************************
* class SelectMgr_ViewClipRange *
********************************/
class SelectMgr_ViewClipRange {
	public:
		/****************** AddClipSubRange ******************/
		%feature("compactdefaultargs") AddClipSubRange;
		%feature("autodoc", "* Adds a clipping sub-range (for clipping chains).
	:param theRange:
	:type theRange: Bnd_Range
	:rtype: None") AddClipSubRange;
		void AddClipSubRange (const Bnd_Range & theRange);

		/****************** AddClippingPlanes ******************/
		%feature("compactdefaultargs") AddClippingPlanes;
		%feature("autodoc", "* Add clipping planes. Planes and picking ray should be defined in the same coordinate system.
	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane
	:param thePickRay:
	:type thePickRay: gp_Ax1
	:rtype: None") AddClippingPlanes;
		void AddClippingPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes,const gp_Ax1 & thePickRay);

		/****************** ChangeUnclipRange ******************/
		%feature("compactdefaultargs") ChangeUnclipRange;
		%feature("autodoc", "* Returns the main unclipped range; [-inf, inf] by default.
	:rtype: Bnd_Range") ChangeUnclipRange;
		Bnd_Range & ChangeUnclipRange ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** GetNearestDepth ******************/
		%feature("compactdefaultargs") GetNearestDepth;
		%feature("autodoc", "* Calculates the min not clipped value from the range. Returns False if the whole range is clipped.
	:param theRange:
	:type theRange: Bnd_Range
	:param theDepth:
	:type theDepth: float
	:rtype: bool") GetNearestDepth;
		Standard_Boolean GetNearestDepth (const Bnd_Range & theRange,Standard_Real &OutValue);

		/****************** IsClipped ******************/
		%feature("compactdefaultargs") IsClipped;
		%feature("autodoc", "* Check if the given depth is not within clipping range(s), e.g. True means depth is clipped.
	:param theDepth:
	:type theDepth: float
	:rtype: bool") IsClipped;
		Standard_Boolean IsClipped (const Standard_Real theDepth);

		/****************** SelectMgr_ViewClipRange ******************/
		%feature("compactdefaultargs") SelectMgr_ViewClipRange;
		%feature("autodoc", "* Creates an empty clip range.
	:rtype: None") SelectMgr_ViewClipRange;
		 SelectMgr_ViewClipRange ();

		/****************** SetVoid ******************/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "* Clears clipping range.
	:rtype: None") SetVoid;
		void SetVoid ();

};


%extend SelectMgr_ViewClipRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class SelectMgr_ViewerSelector *
*********************************/
/************************************
* class SelectMgr_CompositionFilter *
************************************/
%nodefaultctor SelectMgr_CompositionFilter;
class SelectMgr_CompositionFilter : public SelectMgr_Filter {
	public:
		/****************** ActsOn ******************/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", ":param aStandardMode:
	:type aStandardMode: TopAbs_ShapeEnum
	:rtype: bool") ActsOn;
		virtual Standard_Boolean ActsOn (const TopAbs_ShapeEnum aStandardMode);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the filter afilter to a filter object created by a filter class inheriting this framework.
	:param afilter:
	:type afilter: SelectMgr_Filter
	:rtype: None") Add;
		void Add (const opencascade::handle<SelectMgr_Filter> & afilter);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the filters used in this framework.
	:rtype: None") Clear;
		void Clear ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns true if this framework is empty.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "* Returns true if the filter aFilter is in this framework.
	:param aFilter:
	:type aFilter: SelectMgr_Filter
	:rtype: bool") IsIn;
		Standard_Boolean IsIn (const opencascade::handle<SelectMgr_Filter> & aFilter);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes the filter aFilter from this framework.
	:param aFilter:
	:type aFilter: SelectMgr_Filter
	:rtype: None") Remove;
		void Remove (const opencascade::handle<SelectMgr_Filter> & aFilter);

		/****************** StoredFilters ******************/
		%feature("compactdefaultargs") StoredFilters;
		%feature("autodoc", "* Returns the list of stored filters from this framework.
	:rtype: SelectMgr_ListOfFilter") StoredFilters;
		const SelectMgr_ListOfFilter & StoredFilters ();

};


%make_alias(SelectMgr_CompositionFilter)

%extend SelectMgr_CompositionFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class SelectMgr_Frustum *
**************************/
/*************************************
* class SelectMgr_RectangularFrustum *
*************************************/
/************************************
* class SelectMgr_TriangularFrustum *
************************************/
/***************************************
* class SelectMgr_TriangularFrustumSet *
***************************************/
/****************************
* class SelectMgr_AndFilter *
****************************/
class SelectMgr_AndFilter : public SelectMgr_CompositionFilter {
	public:
		/****************** IsOk ******************/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", ":param anobj:
	:type anobj: SelectMgr_EntityOwner
	:rtype: bool") IsOk;
		Standard_Boolean IsOk (const opencascade::handle<SelectMgr_EntityOwner> & anobj);

		/****************** SelectMgr_AndFilter ******************/
		%feature("compactdefaultargs") SelectMgr_AndFilter;
		%feature("autodoc", "* Constructs an empty selection filter object for two or more types of entity.
	:rtype: None") SelectMgr_AndFilter;
		 SelectMgr_AndFilter ();

};


%make_alias(SelectMgr_AndFilter)

%extend SelectMgr_AndFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class SelectMgr_OrFilter *
***************************/
class SelectMgr_OrFilter : public SelectMgr_CompositionFilter {
	public:
		/****************** IsOk ******************/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", ":param anobj:
	:type anobj: SelectMgr_EntityOwner
	:rtype: bool") IsOk;
		Standard_Boolean IsOk (const opencascade::handle<SelectMgr_EntityOwner> & anobj);

		/****************** SelectMgr_OrFilter ******************/
		%feature("compactdefaultargs") SelectMgr_OrFilter;
		%feature("autodoc", "* Constructs an empty or selection filter.
	:rtype: None") SelectMgr_OrFilter;
		 SelectMgr_OrFilter ();

		/****************** SetDisabledObjects ******************/
		%feature("compactdefaultargs") SetDisabledObjects;
		%feature("autodoc", "* Disable selection of specified objects.
	:param theObjects:
	:type theObjects: Graphic3d_NMapOfTransient
	:rtype: None") SetDisabledObjects;
		void SetDisabledObjects (const opencascade::handle<Graphic3d_NMapOfTransient> & theObjects);

};


%make_alias(SelectMgr_OrFilter)

%extend SelectMgr_OrFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
