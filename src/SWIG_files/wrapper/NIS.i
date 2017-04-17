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
%module (package="OCC") NIS

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


%include NIS_headers.i


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

%nodefaultctor NIS_Allocator;
class NIS_Allocator : public NCollection_IncAllocator {
	public:
		%feature("compactdefaultargs") NIS_Allocator;
		%feature("autodoc", "	* /** * Constructor. */

	:param theBlockSize: default value is 24600
	:type theBlockSize: size_t
	:rtype: None
") NIS_Allocator;
		 NIS_Allocator (const size_t theBlockSize = 24600);
		%feature("compactdefaultargs") NAllocated;
		%feature("autodoc", "	* /** * Query the total number of allocated bytes */

	:rtype: inline Standard_Size
") NAllocated;
		inline Standard_Size NAllocated ();
		%feature("compactdefaultargs") NFreed;
		%feature("autodoc", "	* /** * Query the total number of released bytes */

	:rtype: inline Standard_Size
") NFreed;
		inline Standard_Size NFreed ();
		%feature("compactdefaultargs") ResetCounters;
		%feature("autodoc", "	* /** * Set both counters to zero. Should be called with method Reset of the base * class NCollection_IncAlocator. */

	:rtype: None
") ResetCounters;
		void ResetCounters ();
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "	* /** * Allocate memory with given size. Returns NULL on failure */

	:param size:
	:type size: size_t
	:rtype: void *
") Allocate;
		virtual void * Allocate (const size_t size);
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "	:param anAddress:
	:type anAddress: void *
	:rtype: void
") Free;
		virtual void Free (void * anAddress);
};


%extend NIS_Allocator {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_NIS_Allocator(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_NIS_Allocator::Handle_NIS_Allocator %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_NIS_Allocator;
class Handle_NIS_Allocator : public Handle_NCollection_IncAllocator {

    public:
        // constructors
        Handle_NIS_Allocator();
        Handle_NIS_Allocator(const Handle_NIS_Allocator &aHandle);
        Handle_NIS_Allocator(const NIS_Allocator *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NIS_Allocator DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NIS_Allocator {
    NIS_Allocator* _get_reference() {
    return (NIS_Allocator*)$self->Access();
    }
};

%extend Handle_NIS_Allocator {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend NIS_Allocator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NIS_InteractiveContext;
class NIS_InteractiveContext : public Standard_Transient {
	public:
/* public enums */
enum SelectionMode {
	Mode_NoSelection = 0,
	Mode_Normal = 1,
	Mode_Additive = 2,
	Mode_Exclusive = 3,
};

/* end public enums declaration */

		%feature("compactdefaultargs") NIS_InteractiveContext;
		%feature("autodoc", "	* /** * Empty constructor. */

	:rtype: None
") NIS_InteractiveContext;
		 NIS_InteractiveContext ();
		%feature("compactdefaultargs") AttachView;
		%feature("autodoc", "	* ///@name Management of Views/** * Associate this Context with the given View. */

	:param theView:
	:type theView: Handle_NIS_View &
	:rtype: None
") AttachView;
		void AttachView (const Handle_NIS_View & theView);
		%feature("compactdefaultargs") DetachView;
		%feature("autodoc", "	* /** * Stop the association of the Context with the given View. */

	:param theView:
	:type theView: Handle_NIS_View &
	:rtype: None
") DetachView;
		void DetachView (const Handle_NIS_View & theView);
		%feature("compactdefaultargs") GetObject;
		%feature("autodoc", "	* /** * Query the InteractiveObject instance by its ID. */

	:param theID:
	:type theID: int
	:rtype: Handle_NIS_InteractiveObject
") GetObject;
		Handle_NIS_InteractiveObject GetObject (const Standard_Integer theID);
		%feature("compactdefaultargs") NbObjects;
		%feature("autodoc", "	* /** * Query the total number of InteractiveObject instances. This number can be * smaller than the greatest object ID, therefore you should not iterate till * this number using GetObject; use class NIS_ObjectsIterator instead. */

	:rtype: inline int
") NbObjects;
		inline Standard_Integer NbObjects ();
		%feature("compactdefaultargs") NbDrawers;
		%feature("autodoc", "	* /** * Query the total number of Drawers instances. */

	:rtype: inline int
") NbDrawers;
		inline Standard_Integer NbDrawers ();
		%feature("compactdefaultargs") GetDrawers;
		%feature("autodoc", "	* /** * Access to Drawers, can be used for specific operations where it is not * desirale to iterate InteractiveObjects. */

	:rtype: inline NCollection_Map<Handle_NIS_Drawer>::Iterator
") GetDrawers;
		inline NCollection_Map<Handle_NIS_Drawer>::Iterator GetDrawers ();
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* ///@name Management of Objects/** * Make the given interactive object visible in the current context. * If the object is not yet added to this context, it is added. Therefore * this method should follow the creation of an InteractiveObject instance * before it can be displayed. * @param theObj * <tt>[in/out]</tt>Interactive object instance. If the object is displayed * for the first time then the output value will be a new (cloned) object. * @param theDrawer * If this parameter is NULL, the default drawer is used for theObj, defined * by the object type. Otherwise the given Drawer (must be present in this * context) is used for theObj. Use the parameter to change the presentation * of theObj. * @param isUpdateViews * If True, the drawer receives isUpdate flag, then it will recompute * the presentations when Redraw event happens. You can leave the parameter * to False if you have to make a number of similar calls, then you would * call UpdateViews() in the end. */

	:param theObj:
	:type theObj: Handle_NIS_InteractiveObject &
	:param theDrawer: default value is NULL
	:type theDrawer: Handle_NIS_Drawer &
	:param isUpdateViews: default value is Standard_True
	:type isUpdateViews: bool
	:rtype: None
") Display;
		void Display (Handle_NIS_InteractiveObject & theObj,const Handle_NIS_Drawer & theDrawer = NULL,const Standard_Boolean isUpdateViews = Standard_True);
		%feature("compactdefaultargs") DisplayOnTop;
		%feature("autodoc", "	* /** * Make the given interactive object visible on top of other objects in * the current context. * If the object is not yet added to this context, it is added. Therefore * this method should follow the creation of an InteractiveObject instance * before it can be displayed. * @param theObj * Interactive object instance. * @param theDrawer * If this parameter is NULL, the default drawer is used for theObj, defined * by the object type. Otherwise the given Drawer (must be present in this * context) is used for theObj. Use the parameter to change the presentation * of theObj. * @param isUpdateViews * If True, the drawer receives isUpdate flag, then it will recompute * the presentations when Redraw event happens. You can leave the parameter * to False if you have to make a number of similar calls, then you would * call UpdateViews() in the end. */

	:param theObj:
	:type theObj: Handle_NIS_InteractiveObject &
	:param theDrawer: default value is NULL
	:type theDrawer: Handle_NIS_Drawer &
	:param isUpdateViews: default value is Standard_True
	:type isUpdateViews: bool
	:rtype: None
") DisplayOnTop;
		void DisplayOnTop (Handle_NIS_InteractiveObject & theObj,const Handle_NIS_Drawer & theDrawer = NULL,const Standard_Boolean isUpdateViews = Standard_True);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* /** * Make the given object invisible in the current InteractiveContext. * @param theObj * Interactive object instance. Must be already added to this context. * @param isUpdateViews * If True, the drawer receives isUpdate flag, then it will recompute * the presentations when Redraw event happens. You can leave the parameter * to False if you have to make a number of similar calls, then you would * call UpdateViews() in the end. */

	:param theObj:
	:type theObj: Handle_NIS_InteractiveObject &
	:param isUpdateViews: default value is Standard_True
	:type isUpdateViews: bool
	:rtype: None
") Erase;
		void Erase (const Handle_NIS_InteractiveObject & theObj,const Standard_Boolean isUpdateViews = Standard_True);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* /** * Remove the given object from its Interactive context. * @param theObj * Interactive object instance. Must be already added to this context. * @param isUpdateViews * If True, the drawer receives isUpdate flag, then it will recompute * the presentations when Redraw event happens. You can leave the parameter * to False if you have to make a number of similar calls, then you would * call UpdateViews() in the end. */

	:param theObj:
	:type theObj: Handle_NIS_InteractiveObject &
	:param isUpdateViews: default value is Standard_True
	:type isUpdateViews: bool
	:rtype: None
") Remove;
		void Remove (const Handle_NIS_InteractiveObject & theObj,const Standard_Boolean isUpdateViews = Standard_True);
		%feature("compactdefaultargs") DisplayAll;
		%feature("autodoc", "	* /** * Make all stored InteractiveObject instances visible, equivalent to * calling method Display() for all contained objects. */

	:rtype: None
") DisplayAll;
		void DisplayAll ();
		%feature("compactdefaultargs") EraseAll;
		%feature("autodoc", "	* /** * Make all stored InteractiveObject instances invisible, equivalent to * calling method Erase() for all contained objects. */

	:rtype: None
") EraseAll;
		void EraseAll ();
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "	* /** * Clean the context of its contained objects. Drawers are destroyed * and all presentations become empty. */

	:rtype: None
") RemoveAll;
		void RemoveAll ();
		%feature("compactdefaultargs") UpdateViews;
		%feature("autodoc", "	* /** * This method signals that the presenation should be refreshed in all updated * Drawers and in all Views. Calls Redraw() of each view from inside. */

	:rtype: None
") UpdateViews;
		void UpdateViews ();
		%feature("compactdefaultargs") RebuildViews;
		%feature("autodoc", "	* /** * Similar to UpdateViews but forces all presentations to be rebuilt whether * the drawers are marked as updated or not. */

	:rtype: None
") RebuildViews;
		void RebuildViews ();
		%feature("compactdefaultargs") GetBox;
		%feature("autodoc", "	* /** * Find the bounding box of all Objects displayed (visible) in the given View. * @param theBox * <tt>[out]</tt> Bounding box, updated (not reinitialized!) by the object * boxes. * @param theView * View instance where the objects are displayed. */

	:param theBox:
	:type theBox: Bnd_B3f &
	:param theView:
	:type theView: NIS_View *
	:rtype: None
") GetBox;
		void GetBox (Bnd_B3f & theBox,const NIS_View * theView);
		%feature("compactdefaultargs") GetFilter;
		%feature("autodoc", "	* ///@name Selection API/** * Query the current selection filter. Use the method SetFilter to install it. * By default returns a NULL handle. */

	:rtype: inline  Handle_NIS_SelectFilter
") GetFilter;
		Handle_NIS_SelectFilter GetFilter ();
		%feature("compactdefaultargs") SetFilter;
		%feature("autodoc", "	* /** * Install a selection filter. */

	:param theFilter:
	:type theFilter: Handle_NIS_SelectFilter &
	:rtype: inline void
") SetFilter;
		inline void SetFilter (const Handle_NIS_SelectFilter & theFilter);
		%feature("compactdefaultargs") GetSelectionMode;
		%feature("autodoc", "	* /** * Query the current selection mode. */

	:rtype: inline SelectionMode
") GetSelectionMode;
		inline SelectionMode GetSelectionMode ();
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "	* /** * Set the selection mode. */

	:param theMode:
	:type theMode: SelectionMode
	:rtype: inline void
") SetSelectionMode;
		inline void SetSelectionMode (const SelectionMode theMode);
		%feature("compactdefaultargs") ProcessSelection;
		%feature("autodoc", "	* /** * Set or unset the selected state of the object, also changing its hilight status. * If mySelectionMode == Mode_NoSelection this method does nothing (returns False always). * If the given object is NULL (e.g., if the mouse was clicked on empty area), * then the current selection is cleared (modes Normal and Additive only). * The selection algorithm with respect to the given object is defined by the current selection mode: * <ul> * <li>Mode_Normal - the selection state is toggled</li> * <li>Mode_Additive - the object is always added to the selection</li> * <li>Mode_Exclusive - the object is always removed from the selection</li> * </ul> * This method does not update the views. * @param O * Object to be selected or deselected * @param isMultiple * If True, then the objects are not automatically deselected. * returns * True if the selection status has been changed, False if nothing changed */

	:param O:
	:type O: Handle_NIS_InteractiveObject &
	:param isMultiple: default value is Standard_False
	:type isMultiple: bool
	:rtype: bool
") ProcessSelection;
		Standard_Boolean ProcessSelection (const Handle_NIS_InteractiveObject & O,const Standard_Boolean isMultiple = Standard_False);
		%feature("compactdefaultargs") ProcessSelection;
		%feature("autodoc", "	* /** * Process the selection of multiple objects. Equivalent to the other * ProcessSelection method, on a set of objects. Particularly, the current * selection mode is respected. * @param map * Container of IDs of objects to be processed * @param isMultiple * If True, then the objects are not automatically deselected. */

	:param map:
	:type map: TColStd_PackedMapOfInteger &
	:param isMultiple: default value is Standard_False
	:type isMultiple: bool
	:rtype: None
") ProcessSelection;
		void ProcessSelection (const TColStd_PackedMapOfInteger & map,const Standard_Boolean isMultiple = Standard_False);
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "	* /** * Set or unset the selected state of the object, also changing its hilight status. * This method does not update the views. * @param theObj * Object to be selected or deselected * @param isSelected * true if the object should be selected, False - if deselected. * returns * True if the selection status has been changed, False if noithing changed */

	:param theObj:
	:type theObj: Handle_NIS_InteractiveObject &
	:param isSelected: default value is Standard_True
	:type isSelected: bool
	:rtype: bool
") SetSelected;
		Standard_Boolean SetSelected (const Handle_NIS_InteractiveObject & theObj,const Standard_Boolean isSelected = Standard_True);
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "	* /** * Set the selection. Previously selected objects are deselected if they * are not included in the given map. * @param map * Container of IDs of objects to be selected * @param isAdded * If True, the given IDs are added to the current selection (nothing is * deselected). If False (default) - the previous selection is forgotten. */

	:param map:
	:type map: TColStd_PackedMapOfInteger &
	:param isAdded: default value is Standard_False
	:type isAdded: bool
	:rtype: None
") SetSelected;
		void SetSelected (const TColStd_PackedMapOfInteger & map,const Standard_Boolean isAdded = Standard_False);
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "	* /** * Query if the given object is selected. */

	:param theOb:
	:type theOb: Handle_NIS_InteractiveObject &
	:rtype: bool
") IsSelected;
		Standard_Boolean IsSelected (const Handle_NIS_InteractiveObject & theOb);
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "	* /** * Reset all previous selection. */

	:rtype: None
") ClearSelected;
		void ClearSelected ();
		%feature("compactdefaultargs") GetSelected;
		%feature("autodoc", "	* /** * Query the set of selected objects. * returns * Map of integer IDs of objects. */

	:rtype: inline  TColStd_PackedMapOfInteger
") GetSelected;
		inline const TColStd_PackedMapOfInteger & GetSelected ();
		%feature("compactdefaultargs") SetSelectable;
		%feature("autodoc", "	* /** * Define objects that can be selected by no means (isSelectable = false), * or make the objects selectable (isSelectable = true). * @param IDs * Container of IDs of objects to be set as selectable or not selectable * @param isSelectable * If False, the given IDs are made non-selectable by SetSelected methods, * If True, the given IDs are made selectable. */

	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger &
	:param isSelectable:
	:type isSelectable: bool
	:rtype: None
") SetSelectable;
		void SetSelectable (const TColStd_PackedMapOfInteger & IDs,const Standard_Boolean isSelectable);
		%feature("compactdefaultargs") IsSelectable;
		%feature("autodoc", "	* /** * Return True if the object can be selected (processing by SetSelected * methods), or False if can not be. * returns * Selectable state of the object. */

	:param objID:
	:type objID: int
	:rtype: inline bool
") IsSelectable;
		inline Standard_Boolean IsSelectable (const Standard_Integer objID);
		%feature("compactdefaultargs") SetShareDrawList;
		%feature("autodoc", "	* /** * Set or reset the flag that tells to NIS_Drawer to create shared DrawList. * The default mode (in Constructor) is True. */

	:param isShare:
	:type isShare: bool
	:rtype: inline void
") SetShareDrawList;
		inline void SetShareDrawList (Standard_Boolean isShare);
};


%extend NIS_InteractiveContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_NIS_InteractiveContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_NIS_InteractiveContext::Handle_NIS_InteractiveContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_NIS_InteractiveContext;
class Handle_NIS_InteractiveContext : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_NIS_InteractiveContext();
        Handle_NIS_InteractiveContext(const Handle_NIS_InteractiveContext &aHandle);
        Handle_NIS_InteractiveContext(const NIS_InteractiveContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NIS_InteractiveContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NIS_InteractiveContext {
    NIS_InteractiveContext* _get_reference() {
    return (NIS_InteractiveContext*)$self->Access();
    }
};

%extend Handle_NIS_InteractiveContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend NIS_InteractiveContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NIS_InteractiveObject;
class NIS_InteractiveObject : public Standard_Transient {
	public:
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* /** * Query the ID of the Object in its Context. */

	:rtype: inline int
") ID;
		inline Standard_Integer ID ();
		%feature("compactdefaultargs") DrawType;
		%feature("autodoc", "	* /** * Query the type of presentation. */

	:rtype: inline NIS_Drawer::DrawType
") DrawType;
		inline NIS_Drawer::DrawType DrawType ();
		%feature("compactdefaultargs") SetDrawer;
		%feature("autodoc", "	* /** * Replace the drawer. This method must not be called for Object that * has not yet been added to a Context (thus has empty drawer). * It is possible to have unassigned myDrawer or a DefaultDrawer as the * parameter value (but not both). The Context where we work is taken * from theDrawer first, then (if NULL) -- from myDrawer. * This method matches theDrawer with the available Drawers in the Context * and adds if no match is found. * returns * Reference to the finally stored or found Drawer instance inside * the Context. */

	:param theDrawer:
	:type theDrawer: Handle_NIS_Drawer &
	:param setUpdated: default value is Standard_True
	:type setUpdated: bool
	:rtype: Handle_NIS_Drawer
") SetDrawer;
		Handle_NIS_Drawer SetDrawer (const Handle_NIS_Drawer & theDrawer,const Standard_Boolean setUpdated = Standard_True);
		%feature("compactdefaultargs") GetDrawer;
		%feature("autodoc", "	* /** * Query the current drawer. */

	:rtype: inline  Handle_NIS_Drawer
") GetDrawer;
		Handle_NIS_Drawer GetDrawer ();
		%feature("compactdefaultargs") DefaultDrawer;
		%feature("autodoc", "	* /** * Create a default drawer instance. In the upper-level call (in subclass) * it is always called with NULL parameter. Then it should call the same * method of the superclass (except for NIS_InteractiveObject superclass type) * with the created Drawer instance as parameter. * @see NIS_Triangulated as example. */

	:param theDrv:
	:type theDrv: NIS_Drawer *
	:rtype: NIS_Drawer *
") DefaultDrawer;
		virtual NIS_Drawer * DefaultDrawer (NIS_Drawer * theDrv);
		%feature("compactdefaultargs") GetBox;
		%feature("autodoc", "	* /** * Query a 3D bounding box of the object. */

	:rtype: Bnd_B3f
") GetBox;
		const Bnd_B3f & GetBox ();
		%feature("compactdefaultargs") IsTransparent;
		%feature("autodoc", "	* /** * Query the Transparent state. */

	:rtype: inline bool
") IsTransparent;
		inline Standard_Boolean IsTransparent ();
		%feature("compactdefaultargs") IsHidden;
		%feature("autodoc", "	* /** * Query the Hidden state */

	:rtype: inline bool
") IsHidden;
		inline Standard_Boolean IsHidden ();
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	* /** * Query the Displayed state - opposite to IsHidden(). */

	:rtype: inline bool
") IsDisplayed;
		inline Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") IsDynHilighted;
		%feature("autodoc", "	* /** * Query the Dynamic Hilight state */

	:rtype: inline bool
") IsDynHilighted;
		inline Standard_Boolean IsDynHilighted ();
		%feature("compactdefaultargs") IsSelectable;
		%feature("autodoc", "	* /** * Query if the Object is selectable. */

	:rtype: bool
") IsSelectable;
		virtual Standard_Boolean IsSelectable ();
		%feature("compactdefaultargs") SetSelectable;
		%feature("autodoc", "	* /** * Set or change the selectable state of the Object. * @param isSel * True (default) - the Object will be selectable, False - it will be * ignored by selection/hilighting algorithms. */

	:param isSel: default value is Standard_True
	:type isSel: bool
	:rtype: void
") SetSelectable;
		virtual void SetSelectable (const Standard_Boolean isSel = Standard_True);
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	* /** * Query the Transparency factor. */

	:rtype: inline Standard_ShortReal
") Transparency;
		inline Standard_ShortReal Transparency ();
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* /** * Set the Transparency factor. */

	:param theValue: default value is 0.6
	:type theValue: float
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_Real theValue = 0.6);
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* /** * Present the Object as opaque (Normal draw type). */

	:rtype: inline void
") UnsetTransparency;
		inline void UnsetTransparency ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of theObject except its ID. * @param theAll * Allocator where the Dest should store its private data. * @param theDest * <tt>[in-out]</tt> The target object where the data are copied. */

	:param theAll:
	:type theAll: Handle_NCollection_BaseAllocator &
	:param theDest:
	:type theDest: Handle_NIS_InteractiveObject &
	:rtype: void
") Clone;
		virtual void Clone (const Handle_NCollection_BaseAllocator & theAll,Handle_NIS_InteractiveObject & theDest);
		%feature("compactdefaultargs") CloneWithID;
		%feature("autodoc", "	* /** * The same as Clone() but also copies the ID. */

	:param &:
	:type &: Handle_NCollection_BaseAllocator
	:param &:
	:type &: Handle_NIS_InteractiveObject
	:rtype: None
") CloneWithID;
		void CloneWithID (const Handle_NCollection_BaseAllocator &,Handle_NIS_InteractiveObject &);
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "	* /** * Intersect the InteractiveObject geometry with a line/ray. * @param theAxis * The line or ray in 3D space. * @param theOver * Half-thickness of the selecting line. * returns * If the return value is more than 0.1*RealLast() then no intersection is * detected. Otherwise returns the coordinate of thePnt on the ray. May be * negative. */

	:param theAxis:
	:type theAxis: gp_Ax1
	:param theOver:
	:type theOver: float
	:rtype: float
") Intersect;
		virtual Standard_Real Intersect (const gp_Ax1 & theAxis,const Standard_Real theOver);
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "	* /** * Intersect the InteractiveObject geometry with an oriented box. * The default implementation (in this abstract class) always returns True, * signalling that every object pre-selected by its bounding box is * automatically selected. The specializations should define a more correct behaviour. * The algorithm should transform the InteractiveObject geometry using the * parameter theTrf and then reject it with box theBox, like: * @code * gp_Pnt aPnt = ..... // aPnt is part of our geometry. * if (!theBox.IsOut (aPnt.Transformed(theTrf))) * return Standard_True; * @endcode * @param theBox * 3D box of selection * @param theTrf * Position/Orientation of the box. It coincides with theTrfInv that is * passed to NIS_InteractiveObject::selectObjects(). * @param isFull * True if full inclusion is required (full inside the tested box) for * the positive result, False - if only partial inclusion give a result. * returns * True if the InteractiveObject geometry intersects the box or is inside it */

	:param theBox:
	:type theBox: Bnd_B3f &
	:param theTrf:
	:type theTrf: gp_Trsf
	:param isFull:
	:type isFull: bool
	:rtype: bool
") Intersect;
		virtual Standard_Boolean Intersect (const Bnd_B3f & theBox,const gp_Trsf & theTrf,const Standard_Boolean isFull);
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "	* /** * Intersect the InteractiveObject geometry with a selection polygon. * The default implementation (in this abstract class) always returns True, * signalling that every object pre-selected by its bounding box is * automatically selected. The specializations should define a more correct behaviour. * The algorithm should transform the InteractiveObject geometry using the * parameter theTrf and then reject it with polygon. * @param thePolygon * the list of vertices of a free-form closed polygon without * self-intersections. The last point should not coincide with the first * point of the list. Any two neighbor points should not be confused. * @param theTrf * Position/Orientation of the polygon. It coincides with theTrfInv that is * passed to NIS_InteractiveContext::selectObjects(). * @param isFull * True if full inclusion is required (full inside the tested box) for * the positive result, False - if only partial inclusion give a result. * returns * True if the InteractiveObject geometry intersects the polygon or is inside it */

	:param thePolygon:
	:type thePolygon: NCollection_List<gp_XY>
	:param theTrf:
	:type theTrf: gp_Trsf
	:param isFull:
	:type isFull: bool
	:rtype: bool
") Intersect;
		virtual Standard_Boolean Intersect (const NCollection_List<gp_XY> & thePolygon,const gp_Trsf & theTrf,const Standard_Boolean isFull);
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "	* /** * Set the pointer to custom (arbitrary) data associated with the Object. */

	:param theAttributePtr:
	:type theAttributePtr: void *
	:rtype: inline void
") SetAttribute;
		inline void SetAttribute (void * theAttributePtr);
		%feature("compactdefaultargs") GetAttribute;
		%feature("autodoc", "	* /** * Query the associated custom (arbitrary) attribute pointer. */

	:rtype: inline void *
") GetAttribute;
		inline void * GetAttribute ();
};


%extend NIS_InteractiveObject {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_NIS_InteractiveObject(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_NIS_InteractiveObject::Handle_NIS_InteractiveObject %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_NIS_InteractiveObject;
class Handle_NIS_InteractiveObject : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_NIS_InteractiveObject();
        Handle_NIS_InteractiveObject(const Handle_NIS_InteractiveObject &aHandle);
        Handle_NIS_InteractiveObject(const NIS_InteractiveObject *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NIS_InteractiveObject DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NIS_InteractiveObject {
    NIS_InteractiveObject* _get_reference() {
    return (NIS_InteractiveObject*)$self->Access();
    }
};

%extend Handle_NIS_InteractiveObject {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend NIS_InteractiveObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NIS_ObjectsIterator;
class NIS_ObjectsIterator {
	public:
		%feature("compactdefaultargs") NIS_ObjectsIterator;
		%feature("autodoc", "	* /** * Empty Constructor. */

	:rtype: None
") NIS_ObjectsIterator;
		 NIS_ObjectsIterator ();
		%feature("compactdefaultargs") NIS_ObjectsIterator;
		%feature("autodoc", "	* /** * Constructor. * @param theCtx * Interactive context that is to be iterated for all objects. */

	:param theCtx:
	:type theCtx: Handle_NIS_InteractiveContext &
	:rtype: None
") NIS_ObjectsIterator;
		 NIS_ObjectsIterator (const Handle_NIS_InteractiveContext & theCtx);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* /** * Reset the Iterator to start the iterations of objects. * @param theCtx * Interactive context that is to be iterated for all objects. */

	:param theCtx:
	:type theCtx: Handle_NIS_InteractiveContext &
	:rtype: None
") Initialize;
		void Initialize (const Handle_NIS_InteractiveContext & theCtx);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* /** * Query if the Iterator has an object (not yet finished the iteration * process). */

	:rtype: inline bool
") More;
		inline Standard_Boolean More ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* /** * Returns the current object at the iteration pointer. If the iteration is * over (More() == False) this method returns NULL Handle. */

	:rtype: Handle_NIS_InteractiveObject
") Value;
		Handle_NIS_InteractiveObject Value ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* /** * Step forward to the next valid InteractiveObject instance. */

	:rtype: None
") Next;
		void Next ();
};


%extend NIS_ObjectsIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NIS_SelectFilter;
class NIS_SelectFilter : public Standard_Transient {
	public:
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "	* /** * Indicate that the given NIS_InteractiveObject passes the Filter. * returns * True - theObject is kept in the Selection, False - excluded from it. */

	:param theObject:
	:type theObject: NIS_InteractiveObject *
	:rtype: bool
") IsOk;
		Standard_Boolean IsOk (const NIS_InteractiveObject * theObject);
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "	* /** * Check if the type of InteractiveObject is allowed for selection. * Default implementation returns always True. * returns * True if objects of the given Type should be checked, False if such * objects are excluded from Selection before any checking. */

	:param theType:
	:type theType: Handle_Standard_Type &
	:rtype: bool
") ActsOn;
		virtual Standard_Boolean ActsOn (const Handle_Standard_Type & theType);
};


%extend NIS_SelectFilter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_NIS_SelectFilter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_NIS_SelectFilter::Handle_NIS_SelectFilter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_NIS_SelectFilter;
class Handle_NIS_SelectFilter : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_NIS_SelectFilter();
        Handle_NIS_SelectFilter(const Handle_NIS_SelectFilter &aHandle);
        Handle_NIS_SelectFilter(const NIS_SelectFilter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NIS_SelectFilter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NIS_SelectFilter {
    NIS_SelectFilter* _get_reference() {
    return (NIS_SelectFilter*)$self->Access();
    }
};

%extend Handle_NIS_SelectFilter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend NIS_SelectFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NIS_View;
class NIS_View : public V3d_View {
	public:
		%feature("compactdefaultargs") NIS_View;
		%feature("autodoc", "	* /** * Attach the view to the window. */

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:param theWindow: default value is NULL
	:type theWindow: Handle_Aspect_Window &
	:rtype: None
") NIS_View;
		 NIS_View (const Handle_V3d_Viewer & theViewer,const Handle_Aspect_Window & theWindow = NULL);
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "	* /** * Attach the view to the window. */

	:param theWindow:
	:type theWindow: Handle_Aspect_Window &
	:rtype: None
") SetWindow;
		void SetWindow (const Handle_Aspect_Window & theWindow);
		%feature("compactdefaultargs") SetHilightOnTop;
		%feature("autodoc", "	* /** * Indicate whether to draw hilighted objects on top of all other ones */

	:param theTop: default value is Standard_True
	:type theTop: bool
	:rtype: inline void
") SetHilightOnTop;
		inline void SetHilightOnTop (const Standard_Boolean theTop = Standard_True);
		%feature("compactdefaultargs") SetDynHilightSelected;
		%feature("autodoc", "	* /** * Indicate whether to hilight selected object dynamically * By default dynamic hilight works on all objects independently on its * selected/non-selected state. * This behaviour differs from the behaviour of AIS interactive context, * that doesn't hilight dynamically (on mouse movements) selected objects. * In the case both context are used in the same view the behaviour of both * context can be made consistent by setting this flag to False */

	:param theHilight: default value is Standard_True
	:type theHilight: bool
	:rtype: inline void
") SetDynHilightSelected;
		inline void SetDynHilightSelected (const Standard_Boolean theHilight = Standard_True);
		%feature("compactdefaultargs") FitAll3d;
		%feature("autodoc", "	* /** * Zoom the view to fit to visible objects size and positions. * @param theCoef * Relative margin in both X and Y dimensions. For example, value 1.0 * will fit to twice the actual size. * returns * True if operation performed, False if failed (most likely because of * very big actual scale) */

	:param theCoef: default value is 0.01
	:type theCoef: Quantity_Coefficient
	:rtype: bool
") FitAll3d;
		Standard_Boolean FitAll3d (const Quantity_Coefficient theCoef = 0.01);
		%feature("compactdefaultargs") GetBndBox;
		%feature("autodoc", "	* /** * Gets bounding box covering objects displayed in viewer. */

	:rtype: Bnd_B3f
") GetBndBox;
		Bnd_B3f GetBndBox ();
		%feature("compactdefaultargs") GetBndBox;
		%feature("autodoc", "	* /** * Gets bounding box covering objects displayed in viewer. * If operation is fails when Xmax < Xmin abd Ymax < Ymin */

	:param theXMin:
	:type theXMin: int &
	:param theXMax:
	:type theXMax: int &
	:param theYMin:
	:type theYMin: int &
	:param theYMax:
	:type theYMax: int &
	:rtype: None
") GetBndBox;
		void GetBndBox (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") DynamicHilight;
		%feature("autodoc", "	* /** * Set or unset the dynamically hilighted object, depending on the * given mouse coordinates. */

	:param theX:
	:type theX: int
	:param theY:
	:type theY: int
	:rtype: None
") DynamicHilight;
		void DynamicHilight (const Standard_Integer theX,const Standard_Integer theY);
		%feature("compactdefaultargs") DynamicUnhilight;
		%feature("autodoc", "	* /** * Unhilights the hilighted object if it coincides with the given * object instance. */

	:param &:
	:type &: Handle_NIS_InteractiveObject
	:rtype: None
") DynamicUnhilight;
		void DynamicUnhilight (const Handle_NIS_InteractiveObject &);
		%feature("compactdefaultargs") DynamicUnhilight;
		%feature("autodoc", "	* /** * Unhilights the currently hilighted object. */

	:rtype: inline void
") DynamicUnhilight;
		inline void DynamicUnhilight ();
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* /** * Set or unset the selected (hilighted) state of the object that is under * the coordinates theX, theY. * @param theX * X coordinate of the view window * @param theY * X coordinate of the view window * @param isForceMult * True if the effect of multi-Selection should be forced (e.g., when Shift * is pressed). * @param theRedraw * True to redraw view automatically (default value). */

	:param theX:
	:type theX: int
	:param theY:
	:type theY: int
	:param isForceMult: default value is Standard_False
	:type isForceMult: bool
	:param theRedraw: default value is Standard_True
	:type theRedraw: bool
	:rtype: None
") Select;
		void Select (const Standard_Integer theX,const Standard_Integer theY,const Standard_Boolean isForceMult = Standard_False,const Standard_Boolean theRedraw = Standard_True);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* /** * Set or unset the selected (hilighted) state of the objects that are * intersected by 2D box in the view * @param theXmin * left X coordinate of the view window * @param theYmin * lower Y coordinate of the view window * @param theXmax * right X coordinate of the view window * @param theYmax * upper Y coordinate of the view window * @param isForceMult * True if the effect of multi-Selection should be forced (e.g., when Shift * is pressed). * @param isFullyIncluded * True if only those objects are processed that are fully inside the * selection rectangle. False if objects fully or partially included in * the rectangle are processed. * @param theRedraw * True to redraw view automatically (default value). */

	:param theXmin:
	:type theXmin: int
	:param theYmin:
	:type theYmin: int
	:param theXmax:
	:type theXmax: int
	:param theYmax:
	:type theYmax: int
	:param isForceMult: default value is Standard_False
	:type isForceMult: bool
	:param isFullyIncluded: default value is Standard_False
	:type isFullyIncluded: bool
	:param theRedraw: default value is Standard_True
	:type theRedraw: bool
	:rtype: None
") Select;
		void Select (const Standard_Integer theXmin,const Standard_Integer theYmin,const Standard_Integer theXmax,const Standard_Integer theYmax,const Standard_Boolean isForceMult = Standard_False,const Standard_Boolean isFullyIncluded = Standard_False,const Standard_Boolean theRedraw = Standard_True);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* /** * Set or unset the selected (hilighted) state of the objects that are * intersected by 2D polygon in the view * @param thePolygon * defines the vertices of a free-form closed polygon without * self-intersections. The last point should not coincide with the first * point of the list. Points are interpreted as X and Y integer coordinates * of the view window. Any two neighbor points should not be confused. * @param isForceMult * True if the effect of multi-Selection should be forced (e.g., when Shift * is pressed). * @param isFullyIncluded * True if only those objects are processed that are fully inside the * selection rectangle. False if objects fully or partially included in * the rectangle are processed. * @param theRedraw * True to redraw view automatically (default value). */

	:param thePolygon:
	:type thePolygon: NCollection_List<gp_XY>
	:param isForceMult: default value is Standard_False
	:type isForceMult: bool
	:param isFullyIncluded: default value is Standard_False
	:type isFullyIncluded: bool
	:param theRedraw: default value is Standard_True
	:type theRedraw: bool
	:rtype: None
") Select;
		void Select (const NCollection_List<gp_XY> & thePolygon,const Standard_Boolean isForceMult = Standard_False,const Standard_Boolean isFullyIncluded = Standard_False,const Standard_Boolean theRedraw = Standard_True);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	* /** * Interactive selection by mouse click. Selection itself is performed in each * Interactive Context attached to this View, accordingto the local parameters * (mode, filter) of selection in each context. * @param theX * X coordinate of mouse pointer in the window. * @param theY * Y coordinate of mouse pointer in the window. * returns * the selected object picked by the minimal intersection distance among * all contexts attached to this View. */

	:param theX:
	:type theX: int
	:param theY:
	:type theY: int
	:rtype: Handle_NIS_InteractiveObject
") Pick;
		Handle_NIS_InteractiveObject Pick (const Standard_Integer theX,const Standard_Integer theY);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	* /** * Interactive selection by mouse click. Selection itself is performed in each * Interactive Context attached to this View, accordingto the local parameters * (mode, filter) of selection in each context. * @param theAxis * 3D axis for objects selection * @param theOver * Overlap for the selecting axis * @param isOnlySel * If False, any displayed object can be picked, otherwise only selectable * ones. * returns * the selected object picked by the minimal intersection distance among * all contexts attached to this View. */

	:param theAxis:
	:type theAxis: gp_Ax1
	:param theOver:
	:type theOver: float
	:param isOnlySel:
	:type isOnlySel: bool
	:rtype: Handle_NIS_InteractiveObject
") Pick;
		Handle_NIS_InteractiveObject Pick (const gp_Ax1 & theAxis,const Standard_Real theOver,const Standard_Boolean isOnlySel);
		%feature("compactdefaultargs") GetDetected;
		%feature("autodoc", "	* /** * Gets all objects detected by last call of Pick() method */

	:rtype: inline NCollection_Vector<NIS_InteractiveObject *>
") GetDetected;
		inline NCollection_Vector<NIS_InteractiveObject *> GetDetected ();
		%feature("compactdefaultargs") GetExListId;
		%feature("autodoc", "	* /** * Obtain the IDs of ex-lists. */

	:rtype: inline TColStd_PackedMapOfInteger
") GetExListId;
		inline TColStd_PackedMapOfInteger & GetExListId ();
};


%extend NIS_View {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_NIS_View(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_NIS_View::Handle_NIS_View %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_NIS_View;
class Handle_NIS_View : public Handle_V3d_View {

    public:
        // constructors
        Handle_NIS_View();
        Handle_NIS_View(const Handle_NIS_View &aHandle);
        Handle_NIS_View(const NIS_View *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NIS_View DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NIS_View {
    NIS_View* _get_reference() {
    return (NIS_View*)$self->Access();
    }
};

%extend Handle_NIS_View {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend NIS_View {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NIS_Surface;
class NIS_Surface : public NIS_InteractiveObject {
	public:
/* public enums */
enum DisplayMode {
	Shading = 0,
	Wireframe = 1,
};

/* end public enums declaration */

		%feature("compactdefaultargs") NIS_Surface;
		%feature("autodoc", "	* /** * Constructor */

	:param theTri:
	:type theTri: Handle_Poly_Triangulation &
	:param theAlloc: default value is 0L
	:type theAlloc: Handle_NCollection_BaseAllocator &
	:rtype: None
") NIS_Surface;
		 NIS_Surface (const Handle_Poly_Triangulation & theTri,const Handle_NCollection_BaseAllocator & theAlloc = 0L);
		%feature("compactdefaultargs") NIS_Surface;
		%feature("autodoc", "	* /** * Constructor. Creates the presentation of all faces in 'theShape' object. * @param theShape * Source geometry. It should contain triangulations inside. * @param theDeflection * Absolute deflection for meshing 'theShape' if such meshing is needed. * @param theAl * Allocator used for nodes and triangles in this presentation. */

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDeflection:
	:type theDeflection: float
	:param theAl: default value is 0L
	:type theAl: Handle_NCollection_BaseAllocator &
	:rtype: None
") NIS_Surface;
		 NIS_Surface (const TopoDS_Shape & theShape,const Standard_Real theDeflection,const Handle_NCollection_BaseAllocator & theAl = 0L);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* /** * Initialize the instance with a TopoDS_Shape. Used in constructor but can * be called any time to redefine the geometry. */

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDefl:
	:type theDefl: float
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & theShape,const Standard_Real theDefl);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* /** * Deallocate all internal data structures. */

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") NNodes;
		%feature("autodoc", "	* /** * Query the number of nodes. */

	:rtype: inline int
") NNodes;
		inline Standard_Integer NNodes ();
		%feature("compactdefaultargs") NTriangles;
		%feature("autodoc", "	* /** * Query the number of triangles. */

	:rtype: inline int
") NTriangles;
		inline Standard_Integer NTriangles ();
		%feature("compactdefaultargs") NEdges;
		%feature("autodoc", "	* /** * Query the number of edges for wireframe display. */

	:rtype: inline int
") NEdges;
		inline Standard_Integer NEdges ();
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "	* /** * Query the node by its index. * returns * pointer to array of 3 Standard_ShortReal values (X,Y,Z coordinates) */

	:param theIndex:
	:type theIndex: int
	:rtype: inline  Standard_ShortReal *
") Node;
		inline const Standard_ShortReal * Node (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "	* /** * Query the triangle by its index. * returns * pointer to array of 3 Standard_Integer values (nodes 0, 1, 2) */

	:param theIndex:
	:type theIndex: int
	:rtype: inline  int *
") Triangle;
		inline const Standard_Integer * Triangle (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* /** * Access to array of integers that represents an Edge. * returns * Pointer to array where the 0th element is the number of nodes in the edge * and the elements starting from the 1st are node indices. */

	:param theIndex:
	:type theIndex: int
	:rtype: inline  int *
") Edge;
		inline const Standard_Integer * Edge (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "	* /** * Query the normal vector at the given triangulation node (by index) * returns * pointer to array of 3 Standard_ShortReal values (X,Y,Z coordinates) */

	:param theIndex:
	:type theIndex: int
	:rtype: inline  Standard_ShortReal *
") Normal;
		inline const Standard_ShortReal * Normal (const Standard_Integer theIndex);
		%feature("compactdefaultargs") DefaultDrawer;
		%feature("autodoc", "	* /** * Create a default drawer instance. */

	:param :
	:type : NIS_Drawer *
	:rtype: NIS_Drawer *
") DefaultDrawer;
		virtual NIS_Drawer * DefaultDrawer (NIS_Drawer * );
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* /** * Set the normal color for presentation. * @param theColor * New color to use for the presentation. */

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetBackColor;
		%feature("autodoc", "	* /** * Set the color for presentation of the back side of triangles. * @param theColor * New color to use for the presentation. */

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetBackColor;
		void SetBackColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetPolygonOffset;
		%feature("autodoc", "	* /** * Set the offset for the presentation. * @param theValue * New offset to use for the presentation. */

	:param theValue:
	:type theValue: float
	:rtype: None
") SetPolygonOffset;
		void SetPolygonOffset (const Standard_Real theValue);
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "	* /** * Set the display mode: Shading or Wireframe. * The default mode is Shading. */

	:param theMode:
	:type theMode: DisplayMode
	:rtype: None
") SetDisplayMode;
		void SetDisplayMode (const DisplayMode theMode);
		%feature("compactdefaultargs") GetDisplayMode;
		%feature("autodoc", "	* /** * Query the current display mode: Shading or Wireframe. */

	:rtype: DisplayMode
") GetDisplayMode;
		DisplayMode GetDisplayMode ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* /** * Create a copy of theObject except its ID. * @param theAll * Allocator where the Dest should store its private data. * @param theDest * <tt>[in-out]</tt> The target object where the data are copied. If * passed NULL then the target should be created. */

	:param theAll:
	:type theAll: Handle_NCollection_BaseAllocator &
	:param theDest:
	:type theDest: Handle_NIS_InteractiveObject &
	:rtype: void
") Clone;
		virtual void Clone (const Handle_NCollection_BaseAllocator & theAll,Handle_NIS_InteractiveObject & theDest);
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "	* /** * Intersect the surface shading/wireframe geometry with a line/ray. * @param theAxis * The line or ray in 3D space. * @param theOver * Half-thickness of the selecting line - ignored. * returns * If the return value is more than 0.1*RealLast() then no intersection is * detected. Otherwise returns the coordinate of the nearest intersection * on the ray. May be negative. */

	:param theAxis:
	:type theAxis: gp_Ax1
	:param theOver:
	:type theOver: float
	:rtype: float
") Intersect;
		virtual Standard_Real Intersect (const gp_Ax1 & theAxis,const Standard_Real theOver);
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "	* /** * Intersect the surface shading/wireframe geometry with an oriented box. * @param theBox * 3D box of selection * @param theTrf * Position/Orientation of the box. * @param isFull * True if full inclusion is required, False - if partial. * returns * True if the InteractiveObject geometry intersects the box or is inside it */

	:param theBox:
	:type theBox: Bnd_B3f &
	:param theTrf:
	:type theTrf: gp_Trsf
	:param isFull:
	:type isFull: bool
	:rtype: bool
") Intersect;
		virtual Standard_Boolean Intersect (const Bnd_B3f & theBox,const gp_Trsf & theTrf,const Standard_Boolean isFull);
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "	* /** * Intersect the surface shading/wireframe geometry with a selection polygon. * @param thePolygon * the list of vertices of a free-form closed polygon without * self-intersections. The last point should not coincide with the first * point of the list. Any two neighbor points should not be confused. * @param theTrf * Position/Orientation of the polygon. * @param isFullIn * True if full inclusion is required, False - if partial. * returns * True if the InteractiveObject geometry intersects the polygon or is * inside it */

	:param thePolygon:
	:type thePolygon: NCollection_List<gp_XY>
	:param theTrf:
	:type theTrf: gp_Trsf
	:param isFullIn:
	:type isFullIn: bool
	:rtype: bool
") Intersect;
		virtual Standard_Boolean Intersect (const NCollection_List<gp_XY> & thePolygon,const gp_Trsf & theTrf,const Standard_Boolean isFullIn);
};


%extend NIS_Surface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_NIS_Surface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_NIS_Surface::Handle_NIS_Surface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_NIS_Surface;
class Handle_NIS_Surface : public Handle_NIS_InteractiveObject {

    public:
        // constructors
        Handle_NIS_Surface();
        Handle_NIS_Surface(const Handle_NIS_Surface &aHandle);
        Handle_NIS_Surface(const NIS_Surface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NIS_Surface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NIS_Surface {
    NIS_Surface* _get_reference() {
    return (NIS_Surface*)$self->Access();
    }
};

%extend Handle_NIS_Surface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend NIS_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NIS_SurfaceDrawer;
class NIS_SurfaceDrawer : public NIS_Drawer {
	public:
		%feature("compactdefaultargs") NIS_SurfaceDrawer;
		%feature("autodoc", "	* /** * Constructor. */

	:param theNormal:
	:type theNormal: Quantity_Color &
	:param theHilight: default value is Quantity_NOC_GRAY65
	:type theHilight: Quantity_Color &
	:param theDynHilight: default value is Quantity_NOC_CYAN1
	:type theDynHilight: Quantity_Color &
	:rtype: None
") NIS_SurfaceDrawer;
		 NIS_SurfaceDrawer (const Quantity_Color & theNormal,const Quantity_Color & theHilight = Quantity_NOC_GRAY65,const Quantity_Color & theDynHilight = Quantity_NOC_CYAN1);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* /** * Sets the color of the drawer. */

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetBackColor;
		%feature("autodoc", "	* /** * Define the color used for the back side of rendered triangles. * By default this color is the same as the 'Normal' color. */

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: inline void
") SetBackColor;
		inline void SetBackColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "	* /** * Sets the transformation to the drawer. */

	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: inline void
") SetTransformation;
		inline void SetTransformation (const gp_Trsf & theTrsf);
		%feature("compactdefaultargs") GetTransformation;
		%feature("autodoc", "	* /** * Returns the transformation to the drawer. */

	:rtype: inline  gp_Trsf
") GetTransformation;
		inline const gp_Trsf  GetTransformation ();
		%feature("compactdefaultargs") SetPolygonOffset;
		%feature("autodoc", "	* /** * Sets the surface offset */

	:param theOffset:
	:type theOffset: float
	:rtype: inline void
") SetPolygonOffset;
		inline void SetPolygonOffset (const Standard_Real theOffset);
		%feature("compactdefaultargs") GetPolygonOffset;
		%feature("autodoc", "	* /** * Get the surface offset. */

	:rtype: inline float
") GetPolygonOffset;
		inline Standard_Real GetPolygonOffset ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	* /** * Copy the relevant information from another instance of Drawer. * raises exception if theOther has incompatible type (test IsKind). */

	:param theOther:
	:type theOther: Handle_NIS_Drawer &
	:rtype: void
") Assign;
		virtual void Assign (const Handle_NIS_Drawer & theOther);
		%feature("compactdefaultargs") BeforeDraw;
		%feature("autodoc", "	* /** * Called before execution of Draw(), once per group of interactive objects. */

	:param theType:
	:type theType: NIS_Drawer::DrawType
	:param theDrawList:
	:type theDrawList: NIS_DrawList &
	:rtype: void
") BeforeDraw;
		virtual void BeforeDraw (const NIS_Drawer::DrawType theType,const NIS_DrawList & theDrawList);
		%feature("compactdefaultargs") AfterDraw;
		%feature("autodoc", "	* /** * Called after execution of Draw(), once per group of interactive objects. */

	:param theType:
	:type theType: NIS_Drawer::DrawType
	:param theDrawList:
	:type theDrawList: NIS_DrawList &
	:rtype: void
") AfterDraw;
		virtual void AfterDraw (const NIS_Drawer::DrawType theType,const NIS_DrawList & theDrawList);
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "	* /** * Main function: display the given interactive object in the given view. */

	:param &:
	:type &: Handle_NIS_InteractiveObject
	:param theType:
	:type theType: NIS_Drawer::DrawType
	:param theDrawList:
	:type theDrawList: NIS_DrawList &
	:rtype: void
") Draw;
		virtual void Draw (const Handle_NIS_InteractiveObject &,const NIS_Drawer::DrawType theType,const NIS_DrawList & theDrawList);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* /** * Matching two instances, for Map interface. */

	:param theOth:
	:type theOth: Handle_NIS_Drawer &
	:rtype: bool
") IsEqual;
		virtual Standard_Boolean IsEqual (const Handle_NIS_Drawer & theOth);
};


%extend NIS_SurfaceDrawer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_NIS_SurfaceDrawer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_NIS_SurfaceDrawer::Handle_NIS_SurfaceDrawer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_NIS_SurfaceDrawer;
class Handle_NIS_SurfaceDrawer : public Handle_NIS_Drawer {

    public:
        // constructors
        Handle_NIS_SurfaceDrawer();
        Handle_NIS_SurfaceDrawer(const Handle_NIS_SurfaceDrawer &aHandle);
        Handle_NIS_SurfaceDrawer(const NIS_SurfaceDrawer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NIS_SurfaceDrawer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NIS_SurfaceDrawer {
    NIS_SurfaceDrawer* _get_reference() {
    return (NIS_SurfaceDrawer*)$self->Access();
    }
};

%extend Handle_NIS_SurfaceDrawer {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend NIS_SurfaceDrawer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NIS_TriangulatedDrawer;
class NIS_TriangulatedDrawer : public NIS_Drawer {
	public:
		%feature("compactdefaultargs") NIS_TriangulatedDrawer;
		%feature("autodoc", "	* /** * Constructor. */

	:param theNormal:
	:type theNormal: Quantity_Color
	:param theHilight: default value is Quantity_NOC_GRAY80
	:type theHilight: Quantity_Color
	:param theDynHilight: default value is Quantity_NOC_CYAN1
	:type theDynHilight: Quantity_Color
	:rtype: None
") NIS_TriangulatedDrawer;
		 NIS_TriangulatedDrawer (const Quantity_Color theNormal,const Quantity_Color theHilight = Quantity_NOC_GRAY80,const Quantity_Color theDynHilight = Quantity_NOC_CYAN1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	* /** * Copy the relevant information from another instance of Drawer. * raises exception if theOther has incompatible type (test IsKind). */

	:param theOther:
	:type theOther: Handle_NIS_Drawer &
	:rtype: void
") Assign;
		virtual void Assign (const Handle_NIS_Drawer & theOther);
		%feature("compactdefaultargs") BeforeDraw;
		%feature("autodoc", "	* /** * Called before execution of Draw(), once per group of interactive objects. */

	:param theType:
	:type theType: NIS_Drawer::DrawType
	:param theDrawList:
	:type theDrawList: NIS_DrawList &
	:rtype: void
") BeforeDraw;
		virtual void BeforeDraw (const NIS_Drawer::DrawType theType,const NIS_DrawList & theDrawList);
		%feature("compactdefaultargs") AfterDraw;
		%feature("autodoc", "	* /** * Called after execution of Draw(), once per group of interactive objects. */

	:param theType:
	:type theType: NIS_Drawer::DrawType
	:param theDrawList:
	:type theDrawList: NIS_DrawList &
	:rtype: void
") AfterDraw;
		virtual void AfterDraw (const NIS_Drawer::DrawType theType,const NIS_DrawList & theDrawList);
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "	* /** * Main function: display the given interactive object in the given view. */

	:param &:
	:type &: Handle_NIS_InteractiveObject
	:param theType:
	:type theType: NIS_Drawer::DrawType
	:param theDrawList:
	:type theDrawList: NIS_DrawList &
	:rtype: void
") Draw;
		virtual void Draw (const Handle_NIS_InteractiveObject &,const NIS_Drawer::DrawType theType,const NIS_DrawList & theDrawList);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* /** * Matching two instances, for Map interface. */

	:param theOth:
	:type theOth: Handle_NIS_Drawer &
	:rtype: bool
") IsEqual;
		virtual Standard_Boolean IsEqual (const Handle_NIS_Drawer & theOth);
};


%extend NIS_TriangulatedDrawer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_NIS_TriangulatedDrawer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_NIS_TriangulatedDrawer::Handle_NIS_TriangulatedDrawer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_NIS_TriangulatedDrawer;
class Handle_NIS_TriangulatedDrawer : public Handle_NIS_Drawer {

    public:
        // constructors
        Handle_NIS_TriangulatedDrawer();
        Handle_NIS_TriangulatedDrawer(const Handle_NIS_TriangulatedDrawer &aHandle);
        Handle_NIS_TriangulatedDrawer(const NIS_TriangulatedDrawer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NIS_TriangulatedDrawer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NIS_TriangulatedDrawer {
    NIS_TriangulatedDrawer* _get_reference() {
    return (NIS_TriangulatedDrawer*)$self->Access();
    }
};

%extend Handle_NIS_TriangulatedDrawer {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend NIS_TriangulatedDrawer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
