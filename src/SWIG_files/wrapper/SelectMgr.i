/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
#include<Media_module.hxx>
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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class SelectMgr_TypeOfUpdate(IntEnum):
	SelectMgr_TOU_Full = 0
	SelectMgr_TOU_Partial = 1
	SelectMgr_TOU_None = 2
SelectMgr_TOU_Full = SelectMgr_TypeOfUpdate.SelectMgr_TOU_Full
SelectMgr_TOU_Partial = SelectMgr_TypeOfUpdate.SelectMgr_TOU_Partial
SelectMgr_TOU_None = SelectMgr_TypeOfUpdate.SelectMgr_TOU_None

class SelectMgr_TypeOfBVHUpdate(IntEnum):
	SelectMgr_TBU_Add = 0
	SelectMgr_TBU_Remove = 1
	SelectMgr_TBU_Renew = 2
	SelectMgr_TBU_Invalidate = 3
	SelectMgr_TBU_None = 4
SelectMgr_TBU_Add = SelectMgr_TypeOfBVHUpdate.SelectMgr_TBU_Add
SelectMgr_TBU_Remove = SelectMgr_TypeOfBVHUpdate.SelectMgr_TBU_Remove
SelectMgr_TBU_Renew = SelectMgr_TypeOfBVHUpdate.SelectMgr_TBU_Renew
SelectMgr_TBU_Invalidate = SelectMgr_TypeOfBVHUpdate.SelectMgr_TBU_Invalidate
SelectMgr_TBU_None = SelectMgr_TypeOfBVHUpdate.SelectMgr_TBU_None

class SelectMgr_StateOfSelection(IntEnum):
	SelectMgr_SOS_Any = - 2
	SelectMgr_SOS_Unknown = - 1
	SelectMgr_SOS_Deactivated = 0
	SelectMgr_SOS_Activated = 1
SelectMgr_SOS_Any = SelectMgr_StateOfSelection.SelectMgr_SOS_Any
SelectMgr_SOS_Unknown = SelectMgr_StateOfSelection.SelectMgr_SOS_Unknown
SelectMgr_SOS_Deactivated = SelectMgr_StateOfSelection.SelectMgr_SOS_Deactivated
SelectMgr_SOS_Activated = SelectMgr_StateOfSelection.SelectMgr_SOS_Activated

class SelectMgr_PickingStrategy(IntEnum):
	SelectMgr_PickingStrategy_FirstAcceptable = 0
	SelectMgr_PickingStrategy_OnlyTopmost = 1
SelectMgr_PickingStrategy_FirstAcceptable = SelectMgr_PickingStrategy.SelectMgr_PickingStrategy_FirstAcceptable
SelectMgr_PickingStrategy_OnlyTopmost = SelectMgr_PickingStrategy.SelectMgr_PickingStrategy_OnlyTopmost
};
/* end python proxy for enums */

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
%template(SelectMgr_FrustumCache) NCollection_DataMap<Standard_Integer,SelectMgr_SelectingVolumeManager>;

%extend NCollection_DataMap<Standard_Integer,SelectMgr_SelectingVolumeManager> {
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
%template(SelectMgr_IndexedDataMapOfOwnerCriterion) NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>,SelectMgr_SortCriterion,TColStd_MapTransientHasher>;
%template(SelectMgr_IndexedMapOfHSensitive) NCollection_IndexedMap<opencascade::handle<SelectMgr_SensitiveEntity>>;
%template(SelectMgr_ListIteratorOfListOfFilter) NCollection_TListIterator<opencascade::handle<SelectMgr_Filter>>;
%template(SelectMgr_ListOfFilter) NCollection_List<opencascade::handle<SelectMgr_Filter>>;

%extend NCollection_List<opencascade::handle<SelectMgr_Filter>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(SelectMgr_Mat4) NCollection_Mat4<Standard_Real>;
%template(SelectMgr_SequenceOfFilter) NCollection_Sequence<opencascade::handle<SelectMgr_Filter>>;

%extend NCollection_Sequence<opencascade::handle<SelectMgr_Filter>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(SelectMgr_SequenceOfOwner) NCollection_Sequence<opencascade::handle<SelectMgr_EntityOwner>>;

%extend NCollection_Sequence<opencascade::handle<SelectMgr_EntityOwner>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(SelectMgr_SequenceOfSelection) NCollection_Sequence<opencascade::handle<SelectMgr_Selection>>;

%extend NCollection_Sequence<opencascade::handle<SelectMgr_Selection>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(SelectMgr_Vec3) NCollection_Vec3<Standard_Real>;
%template(SelectMgr_Vec4) NCollection_Vec4<Standard_Real>;
/* end templates declaration */

/* typedefs */
typedef SelectMgr_EntityOwner SelectBasics_EntityOwner;
typedef NCollection_DataMap<Standard_Integer, SelectMgr_SelectingVolumeManager> SelectMgr_FrustumCache;
typedef NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>, SelectMgr_SortCriterion, TColStd_MapTransientHasher> SelectMgr_IndexedDataMapOfOwnerCriterion;
typedef NCollection_IndexedMap<opencascade::handle<SelectMgr_SensitiveEntity>> SelectMgr_IndexedMapOfHSensitive;
typedef NCollection_Shared<NCollection_IndexedMap<opencascade::handle<SelectMgr_EntityOwner>>> SelectMgr_IndexedMapOfOwner;
typedef NCollection_List<opencascade::handle<SelectMgr_Filter>>::Iterator SelectMgr_ListIteratorOfListOfFilter;
typedef NCollection_List<opencascade::handle<SelectMgr_Filter>> SelectMgr_ListOfFilter;
typedef NCollection_DataMap<opencascade::handle<SelectMgr_SelectableObject>, opencascade::handle<SelectMgr_SensitiveEntitySet>>::Iterator SelectMgr_MapOfObjectSensitivesIterator;
typedef NCollection_Mat4<Standard_Real> SelectMgr_Mat4;
typedef SelectMgr_SelectableObject * SelectMgr_SOPtr;
typedef NCollection_Sequence<opencascade::handle<SelectMgr_Filter>> SelectMgr_SequenceOfFilter;
typedef NCollection_Sequence<opencascade::handle<SelectMgr_EntityOwner>> SelectMgr_SequenceOfOwner;
typedef NCollection_Sequence<opencascade::handle<SelectMgr_Selection>> SelectMgr_SequenceOfSelection;
typedef NCollection_Vec3<Standard_Real> SelectMgr_Vec3;
typedef NCollection_Vec4<Standard_Real> SelectMgr_Vec4;
/* end typedefs declaration */

/******************************
* class SelectMgr_BaseFrustum *
******************************/
/******************************
* class SelectMgr_EntityOwner *
******************************/
class SelectMgr_EntityOwner : public Standard_Transient {
	public:
		/****************** SelectMgr_EntityOwner ******************/
		/**** md5 signature: 35168c30f579c463b76f662a6c83bb98 ****/
		%feature("compactdefaultargs") SelectMgr_EntityOwner;
		%feature("autodoc", "Initializes the selection priority apriority.

Parameters
----------
aPriority: int,optional
	default value is 0

Returns
-------
None
") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner(const Standard_Integer aPriority = 0);

		/****************** SelectMgr_EntityOwner ******************/
		/**** md5 signature: 49230bdc1e89f7028e9f12f710ed7815 ****/
		%feature("compactdefaultargs") SelectMgr_EntityOwner;
		%feature("autodoc", "Constructs a framework with the selectable object anso being attributed the selection priority apriority.

Parameters
----------
aSO: SelectMgr_SelectableObject
aPriority: int,optional
	default value is 0

Returns
-------
None
") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner(const opencascade::handle<SelectMgr_SelectableObject> & aSO, const Standard_Integer aPriority = 0);

		/****************** SelectMgr_EntityOwner ******************/
		/**** md5 signature: 963caefd0a499900c1583ec550ee8e1f ****/
		%feature("compactdefaultargs") SelectMgr_EntityOwner;
		%feature("autodoc", "Constructs a framework from existing one anso being attributed the selection priority apriority.

Parameters
----------
theOwner: SelectMgr_EntityOwner
aPriority: int,optional
	default value is 0

Returns
-------
None
") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const Standard_Integer aPriority = 0);

		/****************** Clear ******************/
		/**** md5 signature: d5969540eab52130ef3a242724a4b637 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the owners matching the value of the selection mode amode from the presentation manager object apm.

Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theMode: int,optional
	default value is 0

Returns
-------
None
") Clear;
		virtual void Clear(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const Standard_Integer theMode = 0);

		/****************** ComesFromDecomposition ******************/
		/**** md5 signature: 6889a701c50209599d441be5b1dd1509 ****/
		%feature("compactdefaultargs") ComesFromDecomposition;
		%feature("autodoc", "Returns true if this owner points to a part of object and false for entire object.

Returns
-------
bool
") ComesFromDecomposition;
		Standard_Boolean ComesFromDecomposition();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** HandleMouseClick ******************/
		/**** md5 signature: add80052ddbdb459ce100ea351ce9701 ****/
		%feature("compactdefaultargs") HandleMouseClick;
		%feature("autodoc", "Handle mouse button click event. does nothing by default and returns false. @param thepoint mouse cursor position @param thebutton clicked button @param themodifiers key modifiers @param theisdoubleclick flag indicating double mouse click returns true if object handled click.

Parameters
----------
thePoint: Graphic3d_Vec2i
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsDoubleClick: bool

Returns
-------
bool
") HandleMouseClick;
		virtual Standard_Boolean HandleMouseClick(const Graphic3d_Vec2i & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsDoubleClick);

		/****************** HasLocation ******************/
		/**** md5 signature: 570d972f6c1bbb3a38c176a3dd7778ef ****/
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "Returns true if selectable has transformation.

Returns
-------
bool
") HasLocation;
		virtual Standard_Boolean HasLocation();

		/****************** HasSelectable ******************/
		/**** md5 signature: f14bd3f82c22c452db3e0247d683264e ****/
		%feature("compactdefaultargs") HasSelectable;
		%feature("autodoc", "Returns true if there is a selectable object to serve as an owner.

Returns
-------
bool
") HasSelectable;
		Standard_Boolean HasSelectable();

		/****************** HilightWithColor ******************/
		/**** md5 signature: 87de798bf932a923cf132ba96810aaa6 ****/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "Highlights selectable object's presentation with display mode in presentation manager with given highlight style. also a check for auto-highlight is performed - if selectable object manages highlighting on its own, execution will be passed to selectmgr_selectableobject::hilightownerwithcolor method.

Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theMode: int,optional
	default value is 0

Returns
-------
None
") HilightWithColor;
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode = 0);

		/****************** IsAutoHilight ******************/
		/**** md5 signature: 57ad8a813588ecd393319c64b612a682 ****/
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "If owner is not auto hilighted, for group contains many such owners will be called one method hilightselected of selectableobject.

Returns
-------
bool
") IsAutoHilight;
		virtual Standard_Boolean IsAutoHilight();

		/****************** IsForcedHilight ******************/
		/**** md5 signature: e492510bd7de6d5d862a5155125b20af ****/
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "If this method returns true the owner will always call method hilight for selectableobject when the owner is detected. by default it always return false.

Returns
-------
bool
") IsForcedHilight;
		virtual Standard_Boolean IsForcedHilight();

		/****************** IsHilighted ******************/
		/**** md5 signature: c2a9996f63892a7491634f477b938b73 ****/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "Returns true if the presentation manager highlights selections corresponding to the selection mode.

Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theMode: int,optional
	default value is 0

Returns
-------
bool
") IsHilighted;
		virtual Standard_Boolean IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const Standard_Integer theMode = 0);

		/****************** IsSameSelectable ******************/
		/**** md5 signature: 1bb45ad41a756386595dad93200478e4 ****/
		%feature("compactdefaultargs") IsSameSelectable;
		%feature("autodoc", "Returns true if pointer to selectable object of this owner is equal to the given one.

Parameters
----------
theOther: SelectMgr_SelectableObject

Returns
-------
bool
") IsSameSelectable;
		Standard_Boolean IsSameSelectable(const opencascade::handle<SelectMgr_SelectableObject> & theOther);

		/****************** IsSelected ******************/
		/**** md5 signature: 949447744d8f6a94eaf4d4702b6e976e ****/
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "Returns standard_true if the owner is selected.

Returns
-------
bool
") IsSelected;
		Standard_Boolean IsSelected();

		/****************** Location ******************/
		/**** md5 signature: e9a3bfb3f4a14a9bfddfb515790cf3eb ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns transformation of selectable.

Returns
-------
TopLoc_Location
") Location;
		virtual TopLoc_Location Location();

		/****************** Priority ******************/
		/**** md5 signature: 29598227ed02533258ae1cec0309a089 ****/
		%feature("compactdefaultargs") Priority;
		%feature("autodoc", "Return selection priority (within range [0-9]) for results with the same depth; 0 by default. example - selection of shapes: the owners are selectable objects (presentations) a user can give vertex priority [3], edges [2] faces [1] shape [0], so that if during selection one vertex one edge and one face are simultaneously detected, the vertex will only be hilighted.

Returns
-------
int
") Priority;
		Standard_Integer Priority();

		/****************** Selectable ******************/
		/**** md5 signature: 1129a474cddb2058eec6858748c2e93e ****/
		%feature("compactdefaultargs") Selectable;
		%feature("autodoc", "Returns a selectable object detected in the working context.

Returns
-------
opencascade::handle<SelectMgr_SelectableObject>
") Selectable;
		virtual opencascade::handle<SelectMgr_SelectableObject> Selectable();

		/****************** Set ******************/
		/**** md5 signature: cc7bacf3830beb70c8bc9e3ab1dc0545 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the selectable object.

Parameters
----------
theSelObj: SelectMgr_SelectableObject

Returns
-------
None
") Set;
		void Set(const opencascade::handle<SelectMgr_SelectableObject> & theSelObj);

		/****************** Set ******************/
		/**** md5 signature: 564f8abfa67cc280ba647fed234e9d47 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the selectable priority of the owner.

Parameters
----------
thePriority: int

Returns
-------
None
") Set;
		void Set(const Standard_Integer thePriority);

		/****************** SetComesFromDecomposition ******************/
		/**** md5 signature: 1f91b108a62300af0000a6a7d35e4ae4 ****/
		%feature("compactdefaultargs") SetComesFromDecomposition;
		%feature("autodoc", "Sets flag indicating this owner points to a part of object (true) or to entire object (false).

Parameters
----------
theIsFromDecomposition: bool

Returns
-------
None
") SetComesFromDecomposition;
		void SetComesFromDecomposition(const Standard_Boolean theIsFromDecomposition);

		/****************** SetLocation ******************/
		/**** md5 signature: dd06d202f1158d966018e729323ed547 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Change owner location (callback for handling change of location of selectable object).

Parameters
----------
theLocation: TopLoc_Location

Returns
-------
None
") SetLocation;
		virtual void SetLocation(const TopLoc_Location & theLocation);

		/****************** SetPriority ******************/
		/**** md5 signature: 5a3925a66ebc3ef4e73998b083d530f0 ****/
		%feature("compactdefaultargs") SetPriority;
		%feature("autodoc", "Sets the selectable priority of the owner within range [0-9].

Parameters
----------
thePriority: int

Returns
-------
None
") SetPriority;
		void SetPriority(Standard_Integer thePriority);

		/****************** SetSelectable ******************/
		/**** md5 signature: e52841913b79e2faa76a838b7d71be1e ****/
		%feature("compactdefaultargs") SetSelectable;
		%feature("autodoc", "Sets the selectable object.

Parameters
----------
theSelObj: SelectMgr_SelectableObject

Returns
-------
None
") SetSelectable;
		virtual void SetSelectable(const opencascade::handle<SelectMgr_SelectableObject> & theSelObj);

		/****************** SetSelected ******************/
		/**** md5 signature: 72905a85c59ef2eff422043539e45a2f ****/
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "Set the state of the owner. @param theisselected [in] shows if owner is selected.

Parameters
----------
theIsSelected: bool

Returns
-------
None
") SetSelected;
		void SetSelected(const Standard_Boolean theIsSelected);

		/****************** SetZLayer ******************/
		/**** md5 signature: 097fb5f9f23c2585b930c488f4f747a6 ****/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "Set z layer id and update all presentations.

Parameters
----------
theLayerId: int

Returns
-------
None
") SetZLayer;
		virtual void SetZLayer(int theLayerId);

		/****************** State ******************/
		/**** md5 signature: cbcf7744d9e5fcb1ad5d29c138e1a232 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Returns selection state.

Returns
-------
int
") State;
		Standard_Integer State();

		/****************** State ******************/
		/**** md5 signature: 51fdbf7fc9500926f62a89a3197e7573 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Set the state of the owner. the method is deprecated. use setselected() instead.

Parameters
----------
theStatus: int

Returns
-------
None
") State;
		void State(const Standard_Integer theStatus);

		/****************** Unhilight ******************/
		/**** md5 signature: 9c4c49a0201108c6e27232bac86bc1b7 ****/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "Removes highlighting from the owner of a detected selectable object in the presentation manager. this object could be the owner of a sensitive primitive. @param theprsmgr presentation manager @param themode obsolete argument for compatibility, should be ignored by implementations.

Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theMode: int,optional
	default value is 0

Returns
-------
None
") Unhilight;
		virtual void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const Standard_Integer theMode = 0);

		/****************** UpdateHighlightTrsf ******************/
		/**** md5 signature: 07c213110f2fd76110957bf075cb3ba6 ****/
		%feature("compactdefaultargs") UpdateHighlightTrsf;
		%feature("autodoc", "Implements immediate application of location transformation of parent object to dynamic highlight structure.

Parameters
----------
theViewer: V3d_Viewer
theManager: PrsMgr_PresentationManager
theDispMode: int

Returns
-------
None
") UpdateHighlightTrsf;
		virtual void UpdateHighlightTrsf(const opencascade::handle<V3d_Viewer> & theViewer, const opencascade::handle<PrsMgr_PresentationManager> & theManager, const Standard_Integer theDispMode);

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
		/**** md5 signature: 407a8b9f2b0dbde254a1972ae65281ce ****/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "Returns true in an ais local context, if this filter operates on a type of subshape defined in a filter class inheriting this framework. this function completes isok in an ais local context.

Parameters
----------
aStandardMode: TopAbs_ShapeEnum

Returns
-------
bool
") ActsOn;
		virtual Standard_Boolean ActsOn(const TopAbs_ShapeEnum aStandardMode);

		/****************** IsOk ******************/
		/**** md5 signature: 51f35075b94a4376cf4141b785d2a894 ****/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "Indicates that the selected interactive object passes the filter. the owner, anobj, can be either direct or user. a direct owner is the corresponding construction element, whereas a user is the compound shape of which the entity forms a part. when an object is detected by the mouse - in ais, this is done through a context selector - its owner is passed to the filter as an argument. if the object returns standard_true, it is kept; if not, it is rejected. if you are creating a filter class inheriting this framework, and the daughter class is to be used in an ais local context, you will need to implement the virtual function actson.

Parameters
----------
anObj: SelectMgr_EntityOwner

Returns
-------
bool
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anObj);

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
		/**** md5 signature: e91796345b7fc54f8d0048f595a2ed30 ****/
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "Informs the graphic context that the interactive object may be decomposed into sub-shapes for dynamic selection. the most used interactive object is ais_shape.

Returns
-------
bool
") AcceptShapeDecomposition;
		virtual Standard_Boolean AcceptShapeDecomposition();

		/****************** AddSelection ******************/
		/**** md5 signature: cac436c748f6c092baaa6c3df83291a7 ****/
		%feature("compactdefaultargs") AddSelection;
		%feature("autodoc", "Adds the selection aselection with the selection mode index amode to this framework.

Parameters
----------
aSelection: SelectMgr_Selection
aMode: int

Returns
-------
None
") AddSelection;
		void AddSelection(const opencascade::handle<SelectMgr_Selection> & aSelection, const Standard_Integer aMode);

		/****************** ClearDynamicHighlight ******************/
		/**** md5 signature: d0352ce4e2dd5f23d593337c0a535955 ****/
		%feature("compactdefaultargs") ClearDynamicHighlight;
		%feature("autodoc", "Method that needs to be implemented when the object manages selection and dynamic highlighting on its own. clears or invalidates dynamic highlight presentation. by default it clears immediate draw of given presentation manager.

Parameters
----------
theMgr: PrsMgr_PresentationManager

Returns
-------
None
") ClearDynamicHighlight;
		virtual void ClearDynamicHighlight(const opencascade::handle<PrsMgr_PresentationManager> & theMgr);

		/****************** ClearSelected ******************/
		/**** md5 signature: 2b22db8388f6c0f9639f0af72b3eb147 ****/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "Method which clear all selected owners belonging to this selectable object ( for fast presentation draw ).

Returns
-------
None
") ClearSelected;
		virtual void ClearSelected();

		/****************** ClearSelections ******************/
		/**** md5 signature: 44c3292e3b886615f6924e9b2367fc77 ****/
		%feature("compactdefaultargs") ClearSelections;
		%feature("autodoc", "Empties all the selections in the selectableobject <update> parameter defines whether all object's selections should be flagged for further update or not. this improved method can be used to recompute an object's selection (without redisplaying the object completely) when some selection mode is activated not for the first time.

Parameters
----------
update: bool,optional
	default value is Standard_False

Returns
-------
None
") ClearSelections;
		void ClearSelections(const Standard_Boolean update = Standard_False);

		/****************** ComputeSelection ******************/
		/**** md5 signature: 8d0bfeee3da226e839feb2c670764fef ****/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "Computes sensitive primitives for the given selection mode - key interface method of selectable object. @param theselection selection to fill @param themode selection mode to create sensitive primitives.

Parameters
----------
theSelection: SelectMgr_Selection
theMode: int

Returns
-------
None
") ComputeSelection;
		virtual void ComputeSelection(const opencascade::handle<SelectMgr_Selection> & theSelection, const Standard_Integer theMode);

		/****************** CurrentSelection ******************/
		/**** md5 signature: f316c76b335213804220e205e017bdaf ****/
		%feature("compactdefaultargs") CurrentSelection;
		%feature("autodoc", "Returns the current selection in this framework.

Returns
-------
opencascade::handle<SelectMgr_Selection>
") CurrentSelection;
		const opencascade::handle<SelectMgr_Selection> & CurrentSelection();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** ErasePresentations ******************/
		/**** md5 signature: 1ca7dc31012600af9ffc1ee563cb7a3d ****/
		%feature("compactdefaultargs") ErasePresentations;
		%feature("autodoc", "Removes presentations returned by gethilightpresentation() and getselectpresentation().

Parameters
----------
theToRemove: bool

Returns
-------
None
") ErasePresentations;
		virtual void ErasePresentations(Standard_Boolean theToRemove);

		/****************** GetAssemblyOwner ******************/
		/**** md5 signature: 900d00bb218b878c5876856e4f4dd9c9 ****/
		%feature("compactdefaultargs") GetAssemblyOwner;
		%feature("autodoc", "Returns common entity owner if the object is an assembly.

Returns
-------
opencascade::handle<SelectMgr_EntityOwner>
") GetAssemblyOwner;
		virtual const opencascade::handle<SelectMgr_EntityOwner> & GetAssemblyOwner();

		/****************** GetHilightPresentation ******************/
		/**** md5 signature: 860dc61249cfe54918e23e3a89f05dba ****/
		%feature("compactdefaultargs") GetHilightPresentation;
		%feature("autodoc", "Creates or returns existing presentation for highlighting detected object. @param theprsmgr presentation manager to create new presentation returns existing or newly created presentation (when theprsmgr is not null).

Parameters
----------
thePrsMgr: PrsMgr_PresentationManager

Returns
-------
opencascade::handle<Prs3d_Presentation>
") GetHilightPresentation;
		opencascade::handle<Prs3d_Presentation> GetHilightPresentation(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr);

		/****************** GetSelectPresentation ******************/
		/**** md5 signature: 102f80315a16547a5c736148a3ed8c5e ****/
		%feature("compactdefaultargs") GetSelectPresentation;
		%feature("autodoc", "Creates or returns existing presentation for highlighting selected object. @param theprsmgr presentation manager to create new presentation returns existing or newly created presentation (when theprsmgr is not null).

Parameters
----------
thePrsMgr: PrsMgr_PresentationManager

Returns
-------
opencascade::handle<Prs3d_Presentation>
") GetSelectPresentation;
		opencascade::handle<Prs3d_Presentation> GetSelectPresentation(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr);

		/****************** GlobalSelOwner ******************/
		/**** md5 signature: 52d515777b1b4640e22e2f23da2e24cb ****/
		%feature("compactdefaultargs") GlobalSelOwner;
		%feature("autodoc", "Returns the owner of mode for selection of object as a whole.

Returns
-------
opencascade::handle<SelectMgr_EntityOwner>
") GlobalSelOwner;
		virtual opencascade::handle<SelectMgr_EntityOwner> GlobalSelOwner();

		/****************** GlobalSelectionMode ******************/
		/**** md5 signature: b62d625b048f2bad09afcaf87f73c7b5 ****/
		%feature("compactdefaultargs") GlobalSelectionMode;
		%feature("autodoc", "Returns the mode for selection of object as a whole; 0 by default.

Returns
-------
int
") GlobalSelectionMode;
		Standard_Integer GlobalSelectionMode();

		/****************** HasSelection ******************/
		/**** md5 signature: 7e69da611555aafed675e49f59e44aae ****/
		%feature("compactdefaultargs") HasSelection;
		%feature("autodoc", "Returns true if a selection corresponding to the selection mode themode was computed for this object.

Parameters
----------
theMode: int

Returns
-------
bool
") HasSelection;
		Standard_Boolean HasSelection(const Standard_Integer theMode);

		/****************** HilightOwnerWithColor ******************/
		/**** md5 signature: 32e4307dcba2e0851cedfe1c57a6fe79 ****/
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "Method which hilight an owner belonging to this selectable object ( for fast presentation draw ).

Parameters
----------
thePM: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theOwner: SelectMgr_EntityOwner

Returns
-------
None
") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****************** HilightSelected ******************/
		/**** md5 signature: f94c01d8d1821db083be9af276986e33 ****/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "Method which draws selected owners ( for fast presentation draw ).

Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theSeq: SelectMgr_SequenceOfOwner

Returns
-------
None
") HilightSelected;
		virtual void HilightSelected(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const SelectMgr_SequenceOfOwner & theSeq);

		/****************** Init ******************/
		/**** md5 signature: ca2feb116ce485f3e8278f79ba5f5d53 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Begins the iteration scanning for sensitive primitives.

Returns
-------
None
") Init;
		void Init();

		/****************** IsAutoHilight ******************/
		/**** md5 signature: 57ad8a813588ecd393319c64b612a682 ****/
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "If returns true, the old mechanism for highlighting selected objects is used (hilightselected method may be empty). if returns false, the hilightselected method will be fully responsible for highlighting selected entity owners belonging to this selectable object.

Returns
-------
bool
") IsAutoHilight;
		virtual Standard_Boolean IsAutoHilight();

		/****************** More ******************/
		/**** md5 signature: cff271d3b32940da94bada40648f9096 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Continues the iteration scanning for sensitive primitives.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: 1201a55f750036045cd397a65f07fc7d ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Continues the iteration scanning for sensitive primitives.

Returns
-------
None
") Next;
		void Next();

		/****************** RecomputePrimitives ******************/
		/**** md5 signature: 7bd2e52f5f2cfac7f6ff872dd5ea905f ****/
		%feature("compactdefaultargs") RecomputePrimitives;
		%feature("autodoc", "Re-computes the sensitive primitives for all modes. important: do not use this method to update selection primitives except implementing custom selection manager! this method does not take into account necessary bvh updates, but may invalidate the pointers it refers to. to update selection properly from outside classes, use method updateselection.

Returns
-------
None
") RecomputePrimitives;
		void RecomputePrimitives();

		/****************** RecomputePrimitives ******************/
		/**** md5 signature: 993e0181ff78c9354c78b4324e89d177 ****/
		%feature("compactdefaultargs") RecomputePrimitives;
		%feature("autodoc", "Re-computes the sensitive primitives which correspond to the <themode>th selection mode. important: do not use this method to update selection primitives except implementing custom selection manager! selection manager! this method does not take into account necessary bvh updates, but may invalidate the pointers it refers to. to update selection properly from outside classes, use method updateselection.

Parameters
----------
theMode: int

Returns
-------
None
") RecomputePrimitives;
		void RecomputePrimitives(const Standard_Integer theMode);

		/****************** ResetTransformation ******************/
		/**** md5 signature: d978328fb77e88b2f8f47675588dbd84 ****/
		%feature("compactdefaultargs") ResetTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ResetTransformation;
		void ResetTransformation();

		/****************** Selection ******************/
		/**** md5 signature: a2a4e40226667fb0b77f24a46a478797 ****/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "Returns the selection having specified selection mode or null.

Parameters
----------
theMode: int

Returns
-------
opencascade::handle<SelectMgr_Selection>
") Selection;
		const opencascade::handle<SelectMgr_Selection> & Selection(const Standard_Integer theMode);

		/****************** Selections ******************/
		/**** md5 signature: 413e1776ab243e15ff928a23847812cf ****/
		%feature("compactdefaultargs") Selections;
		%feature("autodoc", "Return the sequence of selections.

Returns
-------
SelectMgr_SequenceOfSelection
") Selections;
		const SelectMgr_SequenceOfSelection & Selections();

		/****************** SetAssemblyOwner ******************/
		/**** md5 signature: 663f1306acce95f2b2821e2f2d0c0996 ****/
		%feature("compactdefaultargs") SetAssemblyOwner;
		%feature("autodoc", "Sets common entity owner for assembly sensitive object entities.

Parameters
----------
theOwner: SelectMgr_EntityOwner
theMode: int,optional
	default value is -1

Returns
-------
None
") SetAssemblyOwner;
		void SetAssemblyOwner(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const Standard_Integer theMode = -1);

		/****************** SetAutoHilight ******************/
		/**** md5 signature: 4e6ead318d652bf286a0ac61daa1670d ****/
		%feature("compactdefaultargs") SetAutoHilight;
		%feature("autodoc", "Set autohilight property to true or false.

Parameters
----------
theAutoHilight: bool

Returns
-------
None
") SetAutoHilight;
		virtual void SetAutoHilight(const Standard_Boolean theAutoHilight);

		/****************** SetZLayer ******************/
		/**** md5 signature: d310515d289158ffbf4d4de5b7ae68aa ****/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "Set z layer id and update all presentations of the selectable object. the layers mechanism allows drawing objects in higher layers in overlay of objects in lower layers.

Parameters
----------
theLayerId: int

Returns
-------
None
") SetZLayer;
		virtual void SetZLayer(int theLayerId);

		/****************** UpdateSelection ******************/
		/**** md5 signature: 14cfc18078e541b47973a9e8aa6256f9 ****/
		%feature("compactdefaultargs") UpdateSelection;
		%feature("autodoc", "Sets update status full to selections of the object. must be used as the only method of updateselection from outer classes to prevent bvh structures from being outdated.

Parameters
----------
theMode: int,optional
	default value is -1

Returns
-------
None
") UpdateSelection;
		void UpdateSelection(const Standard_Integer theMode = -1);

		/****************** UpdateTransformation ******************/
		/**** md5 signature: 9663287750e621d117128f238516c453 ****/
		%feature("compactdefaultargs") UpdateTransformation;
		%feature("autodoc", "Recomputes the location of the selection aselection.

Returns
-------
None
") UpdateTransformation;
		virtual void UpdateTransformation();

		/****************** UpdateTransformations ******************/
		/**** md5 signature: d665fe0a491bfbd565adb55b2ded1bc9 ****/
		%feature("compactdefaultargs") UpdateTransformations;
		%feature("autodoc", "Updates locations in all sensitive entities from <aselection> and in corresponding entity owners.

Parameters
----------
aSelection: SelectMgr_Selection

Returns
-------
None
") UpdateTransformations;
		virtual void UpdateTransformations(const opencascade::handle<SelectMgr_Selection> & aSelection);

};


%make_alias(SelectMgr_SelectableObject)

%extend SelectMgr_SelectableObject {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def BndBoxOfSelected(self):
		pass
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

/* python proy classes for enums */
%pythoncode {

class BVHSubset(IntEnum):
	BVHSubset_3d = 0
	BVHSubset_3dPersistent = 1
	BVHSubset_2dPersistent = 2
	BVHSubsetNb = 3
BVHSubset_3d = BVHSubset.BVHSubset_3d
BVHSubset_3dPersistent = BVHSubset.BVHSubset_3dPersistent
BVHSubset_2dPersistent = BVHSubset.BVHSubset_2dPersistent
BVHSubsetNb = BVHSubset.BVHSubsetNb
};
/* end python proxy for enums */

		/****************** SelectMgr_SelectableObjectSet ******************/
		/**** md5 signature: 827041285772c96eab6193d719a82b9c ****/
		%feature("compactdefaultargs") SelectMgr_SelectableObjectSet;
		%feature("autodoc", "Creates new empty objects set and initializes bvh tree builders for each subset.

Returns
-------
None
") SelectMgr_SelectableObjectSet;
		 SelectMgr_SelectableObjectSet();

		/****************** Append ******************/
		/**** md5 signature: d4ae1cd7ff5ae331cbc8478e22f2b054 ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Adds the new selectable object to the set. the selectable object is placed into one of the predefined subsets depending on its persistence type. after adding an object, this method marks the corresponding bvh tree for rebuild. returns true if selectable object is added, otherwise returns false (selectable object is already in the set).

Parameters
----------
theObject: SelectMgr_SelectableObject

Returns
-------
bool
") Append;
		Standard_Boolean Append(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****************** BVH ******************/
		/**** md5 signature: c3375b42ee73cb25b0751e5122f7ae72 ****/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "Returns computed bvh for the thesubset given.

Parameters
----------
theSubset: BVHSubset

Returns
-------
opencascade::handle<BVH_Tree<float, 3>>
") BVH;
		const opencascade::handle<BVH_Tree<Standard_Real, 3>> & BVH(BVHSubset theSubset);

		/****************** ChangeSubset ******************/
		/**** md5 signature: cbec19f3893244976644826379ec6795 ****/
		%feature("compactdefaultargs") ChangeSubset;
		%feature("autodoc", "Performs necessary updates when object's persistence types changes. this method should be called right after changing transformation persistence flags of the objects and before updating bvh tree - to provide up-to-date state of the object set.

Parameters
----------
theObject: SelectMgr_SelectableObject

Returns
-------
None
") ChangeSubset;
		void ChangeSubset(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****************** Contains ******************/
		/**** md5 signature: c1f9a600c1e0fefbd7b5415244e3f42a ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Returns true if this objects set contains theobject given.

Parameters
----------
theObject: SelectMgr_SelectableObject

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****************** GetObjectById ******************/
		/**** md5 signature: 319a1ac965d889d963a38ef514f73d63 ****/
		%feature("compactdefaultargs") GetObjectById;
		%feature("autodoc", "Returns object from subset thesubset by theindex given. the method allows to get selectable object referred by the index of an element of the subset's bvh tree.

Parameters
----------
theSubset: BVHSubset
theIndex: int

Returns
-------
opencascade::handle<SelectMgr_SelectableObject>
") GetObjectById;
		const opencascade::handle<SelectMgr_SelectableObject> & GetObjectById(BVHSubset theSubset, const Standard_Integer theIndex);

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the object set does not contain any selectable objects.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsEmpty ******************/
		/**** md5 signature: 2d7141d3da6354df6cf3d6cf009cdabd ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the specified object subset is empty.

Parameters
----------
theSubset: BVHSubset

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty(BVHSubset theSubset);

		/****************** MarkDirty ******************/
		/**** md5 signature: 37381481e073d0bb85d53a543d2b10a1 ****/
		%feature("compactdefaultargs") MarkDirty;
		%feature("autodoc", "Marks every bvh subset for update.

Returns
-------
None
") MarkDirty;
		void MarkDirty();

		/****************** Remove ******************/
		/**** md5 signature: 38409779e63904bdbcb8289aacd622e4 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes the selectable object from the set. the selectable object is removed from the subset it has been placed into. after removing an object, this method marks the corresponding bvh tree for rebuild. returns true if selectable object is removed, otherwise returns false (selectable object is not in the set).

Parameters
----------
theObject: SelectMgr_SelectableObject

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****************** UpdateBVH ******************/
		/**** md5 signature: 7b761a008dcdefa3ae620aa5abc335b0 ****/
		%feature("compactdefaultargs") UpdateBVH;
		%feature("autodoc", "Updates outdated bvh trees and remembers the last state of the camera view-projection matrices and viewport (window) dimensions.

Parameters
----------
theCamera: Graphic3d_Camera
theProjectionMat: Graphic3d_Mat4d
theWorldViewMat: Graphic3d_Mat4d
theViewState: Graphic3d_WorldViewProjState
theViewportWidth: int
theViewportHeight: int

Returns
-------
None
") UpdateBVH;
		void UpdateBVH(const opencascade::handle<Graphic3d_Camera> & theCamera, const Graphic3d_Mat4d & theProjectionMat, const Graphic3d_Mat4d & theWorldViewMat, const Graphic3d_WorldViewProjState & theViewState, const Standard_Integer theViewportWidth, const Standard_Integer theViewportHeight);

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
		/****************** SelectMgr_SelectingVolumeManager ******************/
		/**** md5 signature: 88c9baa84730ed8c95f865643313b569 ****/
		%feature("compactdefaultargs") SelectMgr_SelectingVolumeManager;
		%feature("autodoc", "Creates instances of all available selecting volume types.

Parameters
----------
theToAllocateFrustums: bool,optional
	default value is Standard_True

Returns
-------
None
") SelectMgr_SelectingVolumeManager;
		 SelectMgr_SelectingVolumeManager(Standard_Boolean theToAllocateFrustums = Standard_True);

		/****************** AllowOverlapDetection ******************/
		/**** md5 signature: 835f65572d504a5580a4fc1007d46f5c ****/
		%feature("compactdefaultargs") AllowOverlapDetection;
		%feature("autodoc", "Is used for rectangular selection only if theistoallow is false, only fully included sensitives will be detected, otherwise the algorithm will mark both included and overlapped entities as matched.

Parameters
----------
theIsToAllow: bool

Returns
-------
None
") AllowOverlapDetection;
		virtual void AllowOverlapDetection(const Standard_Boolean theIsToAllow);

		/****************** BuildSelectingVolume ******************/
		/**** md5 signature: d3870be043d44dc3c4c9021e9328557f ****/
		%feature("compactdefaultargs") BuildSelectingVolume;
		%feature("autodoc", "Builds rectangular selecting frustum for point selection.

Parameters
----------
thePoint: gp_Pnt2d

Returns
-------
None
") BuildSelectingVolume;
		void BuildSelectingVolume(const gp_Pnt2d & thePoint);

		/****************** BuildSelectingVolume ******************/
		/**** md5 signature: 6d5dfec62c478092fcbc8add0168a788 ****/
		%feature("compactdefaultargs") BuildSelectingVolume;
		%feature("autodoc", "Builds rectangular selecting frustum for box selection.

Parameters
----------
theMinPt: gp_Pnt2d
theMaxPt: gp_Pnt2d

Returns
-------
None
") BuildSelectingVolume;
		void BuildSelectingVolume(const gp_Pnt2d & theMinPt, const gp_Pnt2d & theMaxPt);

		/****************** BuildSelectingVolume ******************/
		/**** md5 signature: 0b768a2e513c26decf9d0f6a27302911 ****/
		%feature("compactdefaultargs") BuildSelectingVolume;
		%feature("autodoc", "Builds set of triangular selecting frustums for polyline selection.

Parameters
----------
thePoints: TColgp_Array1OfPnt2d

Returns
-------
None
") BuildSelectingVolume;
		void BuildSelectingVolume(const TColgp_Array1OfPnt2d & thePoints);

		/****************** Camera ******************/
		/**** md5 signature: 9722357b74290d4bf6f13f9113469012 ****/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "Returns current camera definition.

Returns
-------
opencascade::handle<Graphic3d_Camera>
") Camera;
		const opencascade::handle<Graphic3d_Camera> & Camera();

		/****************** DetectedPoint ******************/
		/**** md5 signature: f5119614d059d473f2e98823f778528f ****/
		%feature("compactdefaultargs") DetectedPoint;
		%feature("autodoc", "Calculates the point on a view ray that was detected during the run of selection algo by given depth. throws exception if active selection type is not point.

Parameters
----------
theDepth: float

Returns
-------
gp_Pnt
") DetectedPoint;
		virtual gp_Pnt DetectedPoint(const Standard_Real theDepth);

		/****************** DistToGeometryCenter ******************/
		/**** md5 signature: ef4883136b3d59dc96190e78632a000d ****/
		%feature("compactdefaultargs") DistToGeometryCenter;
		%feature("autodoc", "Measures distance between 3d projection of user-picked screen point and given point thecog.

Parameters
----------
theCOG: gp_Pnt

Returns
-------
float
") DistToGeometryCenter;
		virtual Standard_Real DistToGeometryCenter(const gp_Pnt & theCOG);

		/****************** GetActiveSelectionType ******************/
		/**** md5 signature: 6be7281ca743652d206dad6a0c6f5952 ****/
		%feature("compactdefaultargs") GetActiveSelectionType;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetActiveSelectionType;
		virtual Standard_Integer GetActiveSelectionType();

		/****************** GetFarPickedPnt ******************/
		/**** md5 signature: 2ffbc3246baa8ae88d6d155b2475b10c ****/
		%feature("compactdefaultargs") GetFarPickedPnt;
		%feature("autodoc", "Valid only for point and rectangular selection. returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto far view frustum plane.

Returns
-------
gp_Pnt
") GetFarPickedPnt;
		virtual gp_Pnt GetFarPickedPnt();

		/****************** GetMousePosition ******************/
		/**** md5 signature: 3146c30fdc649573d84878daffdc7e57 ****/
		%feature("compactdefaultargs") GetMousePosition;
		%feature("autodoc", "Return mouse coordinates for point selection mode.

Returns
-------
gp_Pnt2d
") GetMousePosition;
		virtual gp_Pnt2d GetMousePosition();

		/****************** GetNearPickedPnt ******************/
		/**** md5 signature: d103f12e1b34a4596056c78f0c8a540b ****/
		%feature("compactdefaultargs") GetNearPickedPnt;
		%feature("autodoc", "Valid only for point and rectangular selection. returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto near view frustum plane.

Returns
-------
gp_Pnt
") GetNearPickedPnt;
		virtual gp_Pnt GetNearPickedPnt();

		/****************** GetPlanes ******************/
		/**** md5 signature: c2c102a337ece46bfdb7552bb588b2d8 ****/
		%feature("compactdefaultargs") GetPlanes;
		%feature("autodoc", "Stores plane equation coefficients (in the following form: ax + by + cz + d = 0) to the given vector.

Parameters
----------
thePlaneEquations: NCollection_Vector<SelectMgr_Vec4>

Returns
-------
None
") GetPlanes;
		virtual void GetPlanes(NCollection_Vector<SelectMgr_Vec4> & thePlaneEquations);

		/****************** GetVertices ******************/
		/**** md5 signature: 97f9768e715df9214ec06c43990766fc ****/
		%feature("compactdefaultargs") GetVertices;
		%feature("autodoc", "A set of helper functions that return rectangular selecting frustum data.

Returns
-------
gp_Pnt *
") GetVertices;
		const gp_Pnt * GetVertices();

		/****************** IsOverlapAllowed ******************/
		/**** md5 signature: 7d8f9be9184a75e442465114e308659f ****/
		%feature("compactdefaultargs") IsOverlapAllowed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOverlapAllowed;
		virtual Standard_Boolean IsOverlapAllowed();

		/****************** ObjectClipping ******************/
		/**** md5 signature: f6c35522166321d4f812458a964f18cf ****/
		%feature("compactdefaultargs") ObjectClipping;
		%feature("autodoc", "Return object clipping planes.

Returns
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>
") ObjectClipping;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ObjectClipping();

		/****************** Overlaps ******************/
		/**** md5 signature: e9d23145a7798aafba1bb50a37f94425 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Sat intersection test between defined volume and given axis-aligned box.

Parameters
----------
theBoxMin: SelectMgr_Vec3
theBoxMax: SelectMgr_Vec3
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const SelectMgr_Vec3 & theBoxMin, const SelectMgr_Vec3 & theBoxMax, SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		/**** md5 signature: 95c6b8b1e7c428ad28d82cfbc1693720 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Returns true if selecting volume is overlapped by axis-aligned bounding box with minimum corner at point theminpt and maximum at point themaxpt.

Parameters
----------
theBoxMin: SelectMgr_Vec3
theBoxMax: SelectMgr_Vec3
theInside: bool *,optional
	default value is NULL

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const SelectMgr_Vec3 & theBoxMin, const SelectMgr_Vec3 & theBoxMax, Standard_Boolean * theInside = NULL);

		/****************** Overlaps ******************/
		/**** md5 signature: 0acf2b0e4ea6a2d5d856c5c32c6cbab7 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Intersection test between defined volume and given point.

Parameters
----------
thePnt: gp_Pnt
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const gp_Pnt & thePnt, SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		/**** md5 signature: 15d41c8f739c0ce842f61077e7fdebb2 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Intersection test between defined volume and given point.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const gp_Pnt & thePnt);

		/****************** Overlaps ******************/
		/**** md5 signature: 1ef89a6f633473ae7690385aaae28b92 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Sat intersection test between defined volume and given ordered set of points, representing line segments. the test may be considered of interior part or boundary line defined by segments depending on given sensitivity type.

Parameters
----------
theArrayOfPts: TColgp_HArray1OfPnt
theSensType: int
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const opencascade::handle<TColgp_HArray1OfPnt> & theArrayOfPts, Standard_Integer theSensType, SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		/**** md5 signature: fb7b41afbb828318fc5f75597be730a4 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Sat intersection test between defined volume and given ordered set of points, representing line segments. the test may be considered of interior part or boundary line defined by segments depending on given sensitivity type.

Parameters
----------
theArrayOfPts: TColgp_Array1OfPnt
theSensType: int
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const TColgp_Array1OfPnt & theArrayOfPts, Standard_Integer theSensType, SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		/**** md5 signature: 5a4fdd6cf5990d69cb44c2752d9cf429 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Checks if line segment overlaps selecting frustum.

Parameters
----------
thePnt1: gp_Pnt
thePnt2: gp_Pnt
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		/**** md5 signature: 9a5e1237922eff21a936edd5cd4e2233 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Sat intersection test between defined volume and given triangle. the test may be considered of interior part or boundary line defined by triangle vertices depending on given sensitivity type.

Parameters
----------
thePnt1: gp_Pnt
thePnt2: gp_Pnt
thePnt3: gp_Pnt
theSensType: int
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const gp_Pnt & thePnt3, Standard_Integer theSensType, SelectBasics_PickResult & thePickResult);

		/****************** ProjectionMatrix ******************/
		/**** md5 signature: ba648dd7b6de7cfe7eaed2ae24ad2b05 ****/
		%feature("compactdefaultargs") ProjectionMatrix;
		%feature("autodoc", "Returns current projection transformation common for all selecting volumes.

Returns
-------
Graphic3d_Mat4d
") ProjectionMatrix;
		const Graphic3d_Mat4d & ProjectionMatrix();

		/****************** ScaleAndTransform ******************/
		/**** md5 signature: 97fa1c93c915db40ef5183e7034a43db ****/
		%feature("compactdefaultargs") ScaleAndTransform;
		%feature("autodoc", "Important: scaling makes sense only for frustum built on a single point! note that this method does not perform any checks on type of the frustum. //! returns a copy of the frustum resized according to the scale factor given and transforms it using the matrix given. there are no default parameters, but in case if: - transformation only is needed: @thescalefactor must be initialized as any negative value; - scale only is needed: @thetrsf must be set to gp_identity. builder is an optional argument that represents corresponding settings for re-constructing transformed frustum from scratch. can be null if reconstruction is not expected furthermore.

Parameters
----------
theScaleFactor: int
theTrsf: gp_GTrsf
theBuilder: SelectMgr_FrustumBuilder,optional
	default value is NULL

Returns
-------
SelectMgr_SelectingVolumeManager
") ScaleAndTransform;
		virtual SelectMgr_SelectingVolumeManager ScaleAndTransform(const Standard_Integer theScaleFactor, const gp_GTrsf & theTrsf, const opencascade::handle<SelectMgr_FrustumBuilder> & theBuilder = NULL);

		/****************** SetActiveSelectionType ******************/
		/**** md5 signature: bb196b52c241933538bbab6aeca4322f ****/
		%feature("compactdefaultargs") SetActiveSelectionType;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: SelectionType

Returns
-------
None
") SetActiveSelectionType;
		void SetActiveSelectionType(const SelectionType & theType);

		/****************** SetCamera ******************/
		/**** md5 signature: 11f06b5f3493f65ebc339cf1e1252d99 ****/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "Updates camera projection and orientation matrices in all selecting volumes.

Parameters
----------
theCamera: Graphic3d_Camera

Returns
-------
None
") SetCamera;
		void SetCamera(const opencascade::handle<Graphic3d_Camera > theCamera);

		/****************** SetCamera ******************/
		/**** md5 signature: 9622e55d8fd1b9fc5d3e3394bdbf36b9 ****/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "Updates camera projection and orientation matrices in all selecting volumes.

Parameters
----------
theProjection: Graphic3d_Mat4d
theWorldView: Graphic3d_Mat4d
theIsOrthographic: bool
theWVPState: Graphic3d_WorldViewProjState,optional
	default value is Graphic3d_WorldViewProjState()

Returns
-------
None
") SetCamera;
		void SetCamera(const Graphic3d_Mat4d & theProjection, const Graphic3d_Mat4d & theWorldView, const Standard_Boolean theIsOrthographic, const Graphic3d_WorldViewProjState & theWVPState = Graphic3d_WorldViewProjState());

		/****************** SetPixelTolerance ******************/
		/**** md5 signature: fda084bdc0d0a8e945d1f4e82a500297 ****/
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "Updates pixel tolerance in all selecting volumes.

Parameters
----------
theTolerance: int

Returns
-------
None
") SetPixelTolerance;
		void SetPixelTolerance(const Standard_Integer theTolerance);

		/****************** SetViewClipRanges ******************/
		/**** md5 signature: 93d9d36012f3af07e2014408dc48db5e ****/
		%feature("compactdefaultargs") SetViewClipRanges;
		%feature("autodoc", "Set clipping range.

Parameters
----------
theRange: SelectMgr_ViewClipRange

Returns
-------
None
") SetViewClipRanges;
		void SetViewClipRanges(const SelectMgr_ViewClipRange & theRange);

		/****************** SetViewClipping ******************/
		/**** md5 signature: 948648bc7d149e0bb646586b6b554c78 ****/
		%feature("compactdefaultargs") SetViewClipping;
		%feature("autodoc", "Valid for point selection only! computes depth range for clipping planes. @param theviewplanes global view planes @param theobjplanes object planes.

Parameters
----------
theViewPlanes: Graphic3d_SequenceOfHClipPlane
theObjPlanes: Graphic3d_SequenceOfHClipPlane

Returns
-------
None
") SetViewClipping;
		void SetViewClipping(const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & theViewPlanes, const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & theObjPlanes);

		/****************** SetViewClipping ******************/
		/**** md5 signature: 4bbee3b7345b92c8790bf91a52eda8f9 ****/
		%feature("compactdefaultargs") SetViewClipping;
		%feature("autodoc", "Copy clipping planes from another volume manager.

Parameters
----------
theOther: SelectMgr_SelectingVolumeManager

Returns
-------
None
") SetViewClipping;
		void SetViewClipping(const SelectMgr_SelectingVolumeManager & theOther);

		/****************** SetViewport ******************/
		/**** md5 signature: 8a132d12573d3301f6dc1103aa3c5d06 ****/
		%feature("compactdefaultargs") SetViewport;
		%feature("autodoc", "Updates viewport in all selecting volumes.

Parameters
----------
theX: float
theY: float
theWidth: float
theHeight: float

Returns
-------
None
") SetViewport;
		void SetViewport(const Standard_Real theX, const Standard_Real theY, const Standard_Real theWidth, const Standard_Real theHeight);

		/****************** SetWindowSize ******************/
		/**** md5 signature: 8f5369c74a4835dacda32c89cfdc6f2a ****/
		%feature("compactdefaultargs") SetWindowSize;
		%feature("autodoc", "Updates window size in all selecting volumes.

Parameters
----------
theWidth: int
theHeight: int

Returns
-------
None
") SetWindowSize;
		void SetWindowSize(const Standard_Integer theWidth, const Standard_Integer theHeight);

		/****************** ViewClipRanges ******************/
		/**** md5 signature: 4220e845cb705bc0e9750141f885c41f ****/
		%feature("compactdefaultargs") ViewClipRanges;
		%feature("autodoc", "Return clipping range.

Returns
-------
SelectMgr_ViewClipRange
") ViewClipRanges;
		const SelectMgr_ViewClipRange & ViewClipRanges();

		/****************** ViewClipping ******************/
		/**** md5 signature: 7e2b1776e743c0bba9fdb2ed8c5b003c ****/
		%feature("compactdefaultargs") ViewClipping;
		%feature("autodoc", "Return view clipping planes.

Returns
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>
") ViewClipping;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ViewClipping();

		/****************** WindowSize ******************/
		/**** md5 signature: b6b9e026658a5426a88d46691f9f9543 ****/
		%feature("compactdefaultargs") WindowSize;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
theWidth: int
theHeight: int
") WindowSize;
		void WindowSize(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** WorldViewMatrix ******************/
		/**** md5 signature: 23c687dcb922de6c82abce119f4be06f ****/
		%feature("compactdefaultargs") WorldViewMatrix;
		%feature("autodoc", "Returns current world view transformation common for all selecting volumes.

Returns
-------
Graphic3d_Mat4d
") WorldViewMatrix;
		const Graphic3d_Mat4d & WorldViewMatrix();

		/****************** WorldViewProjState ******************/
		/**** md5 signature: 6eef6074aae24be463d73d71bdf53e19 ****/
		%feature("compactdefaultargs") WorldViewProjState;
		%feature("autodoc", "Returns current camera world view projection transformation state common for all selecting volumes.

Returns
-------
Graphic3d_WorldViewProjState
") WorldViewProjState;
		const Graphic3d_WorldViewProjState & WorldViewProjState();

};


%extend SelectMgr_SelectingVolumeManager {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def ActiveVolume(self):
		pass
	}
};

/****************************
* class SelectMgr_Selection *
****************************/
class SelectMgr_Selection : public Standard_Transient {
	public:
		/****************** SelectMgr_Selection ******************/
		/**** md5 signature: 9ac3ca045be3031d968cd042caaac23f ****/
		%feature("compactdefaultargs") SelectMgr_Selection;
		%feature("autodoc", "Constructs a selection object defined by the selection mode idmode. the default setting 0 is the selection mode for a shape in its entirety.

Parameters
----------
theModeIdx: int,optional
	default value is 0

Returns
-------
None
") SelectMgr_Selection;
		 SelectMgr_Selection(const Standard_Integer theModeIdx = 0);

		/****************** Add ******************/
		/**** md5 signature: 71a26d66d0f562b3cb53c9a86dd02409 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the sensitive primitive to the list of stored entities in this object. raises nullobject if the primitive is a null handle.

Parameters
----------
theSensitive: Select3D_SensitiveEntity

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****************** BVHUpdateStatus ******************/
		/**** md5 signature: 1110c41ad7c435b224c56e67bbd4e6f9 ****/
		%feature("compactdefaultargs") BVHUpdateStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
SelectMgr_TypeOfBVHUpdate
") BVHUpdateStatus;
		SelectMgr_TypeOfBVHUpdate BVHUpdateStatus();

		/****************** ChangeEntities ******************/
		/**** md5 signature: adcd43d4b51e901d1edf4ce65316d338 ****/
		%feature("compactdefaultargs") ChangeEntities;
		%feature("autodoc", "Return entities.

Returns
-------
NCollection_Vector<opencascade::handle<SelectMgr_SensitiveEntity>>
") ChangeEntities;
		NCollection_Vector<opencascade::handle<SelectMgr_SensitiveEntity>> & ChangeEntities();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Empties the selection from all the stored entities.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Entities ******************/
		/**** md5 signature: 09e4230714e880893271b506a744f5d3 ****/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "Return entities.

Returns
-------
NCollection_Vector<opencascade::handle<SelectMgr_SensitiveEntity>>
") Entities;
		const NCollection_Vector<opencascade::handle<SelectMgr_SensitiveEntity>> & Entities();

		/****************** GetSelectionState ******************/
		/**** md5 signature: a623ca145bbd40bbc568a61186b88449 ****/
		%feature("compactdefaultargs") GetSelectionState;
		%feature("autodoc", "Returns status of selection.

Returns
-------
SelectMgr_StateOfSelection
") GetSelectionState;
		SelectMgr_StateOfSelection GetSelectionState();

		/****************** Init ******************/
		/**** md5 signature: ca2feb116ce485f3e8278f79ba5f5d53 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Begins an iteration scanning for sensitive primitives.

Returns
-------
None
") Init;
		void Init();

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if no sensitive entity is stored.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Mode ******************/
		/**** md5 signature: b35445cddc9deccdf8a4cb5a0f8a439b ****/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Returns the selection mode represented by this selection.

Returns
-------
int
") Mode;
		Standard_Integer Mode();

		/****************** More ******************/
		/**** md5 signature: cff271d3b32940da94bada40648f9096 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Continues the iteration scanning for sensitive primitives with the mode defined in this framework.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: 1201a55f750036045cd397a65f07fc7d ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next sensitive primitive found in the iteration. this is a scan for entities with the mode defined in this framework.

Returns
-------
None
") Next;
		void Next();

		/****************** Sensitive ******************/
		/**** md5 signature: 2434eea769a8cac14257f785690f38e4 ****/
		%feature("compactdefaultargs") Sensitive;
		%feature("autodoc", "Returns any sensitive primitive in this framework.

Returns
-------
opencascade::handle<SelectMgr_SensitiveEntity>
") Sensitive;
		const opencascade::handle<SelectMgr_SensitiveEntity> & Sensitive();

		/****************** Sensitivity ******************/
		/**** md5 signature: 894e656cca525e78bf786c9f7c8e748c ****/
		%feature("compactdefaultargs") Sensitivity;
		%feature("autodoc", "Returns sensitivity of the selection.

Returns
-------
int
") Sensitivity;
		Standard_Integer Sensitivity();

		/****************** SetSelectionState ******************/
		/**** md5 signature: 52315cee0ff9f6ef54aa507592384dcb ****/
		%feature("compactdefaultargs") SetSelectionState;
		%feature("autodoc", "Sets status of selection.

Parameters
----------
theState: SelectMgr_StateOfSelection

Returns
-------
None
") SetSelectionState;
		void SetSelectionState(const SelectMgr_StateOfSelection theState);

		/****************** SetSensitivity ******************/
		/**** md5 signature: f2ec8e66d8f4652f3773fe91d3990c07 ****/
		%feature("compactdefaultargs") SetSensitivity;
		%feature("autodoc", "Changes sensitivity of the selection and all its entities to the given value. important: this method does not update any outer selection structures, so for proper updates use selectmgr_selectionmanager::setselectionsensitivity method.

Parameters
----------
theNewSens: int

Returns
-------
None
") SetSensitivity;
		void SetSensitivity(const Standard_Integer theNewSens);

		/****************** UpdateBVHStatus ******************/
		/**** md5 signature: 625f0bf1e7f890f4f4f356ca8beab0d9 ****/
		%feature("compactdefaultargs") UpdateBVHStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
theStatus: SelectMgr_TypeOfBVHUpdate

Returns
-------
None
") UpdateBVHStatus;
		void UpdateBVHStatus(const SelectMgr_TypeOfBVHUpdate theStatus);

		/****************** UpdateStatus ******************/
		/**** md5 signature: c898c727f89f53f62f8406c0076e8e77 ****/
		%feature("compactdefaultargs") UpdateStatus;
		%feature("autodoc", "Returns the flag updateflag. this flage gives the update status of this framework in a viewerselector object: - full - partial, or - none.

Returns
-------
SelectMgr_TypeOfUpdate
") UpdateStatus;
		SelectMgr_TypeOfUpdate UpdateStatus();

		/****************** UpdateStatus ******************/
		/**** md5 signature: defd205153f48235659901d7ab5173ed ****/
		%feature("compactdefaultargs") UpdateStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
theStatus: SelectMgr_TypeOfUpdate

Returns
-------
None
") UpdateStatus;
		void UpdateStatus(const SelectMgr_TypeOfUpdate theStatus);

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
		/****************** SelectMgr_SelectionManager ******************/
		/**** md5 signature: a33a6ce5e04db4fec58e33077a28c9e2 ****/
		%feature("compactdefaultargs") SelectMgr_SelectionManager;
		%feature("autodoc", "Constructs an empty selection manager object.

Parameters
----------
theSelector: SelectMgr_ViewerSelector

Returns
-------
None
") SelectMgr_SelectionManager;
		 SelectMgr_SelectionManager(const opencascade::handle<SelectMgr_ViewerSelector> & theSelector);

		/****************** Activate ******************/
		/**** md5 signature: 37a9576e90f83c38812f4f39f0f7470d ****/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "Activates the selection mode themode in the selector theselector for the selectable object anobject. by default, themode is equal to 0. if theselector is set to default (null), the selection with the mode themode will be activated in all the viewers available.

Parameters
----------
theObject: SelectMgr_SelectableObject
theMode: int,optional
	default value is 0

Returns
-------
None
") Activate;
		void Activate(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Integer theMode = 0);

		/****************** ClearSelectionStructures ******************/
		/**** md5 signature: ebfea862f43b96343951ec99b7fdaf01 ****/
		%feature("compactdefaultargs") ClearSelectionStructures;
		%feature("autodoc", "Removes sensitive entities from all viewer selectors after method clear() was called to the selection they belonged to or it was recomputed somehow.

Parameters
----------
theObj: SelectMgr_SelectableObject
theMode: int,optional
	default value is -1

Returns
-------
None
") ClearSelectionStructures;
		void ClearSelectionStructures(const opencascade::handle<SelectMgr_SelectableObject> & theObj, const Standard_Integer theMode = -1);

		/****************** Contains ******************/
		/**** md5 signature: 78a3e6bbff753619951717c11cf591d9 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Returns true if the manager contains the selectable object theobject.

Parameters
----------
theObject: SelectMgr_SelectableObject

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****************** Deactivate ******************/
		/**** md5 signature: d5b2c3b0bad1d008ddd47b0f6bf05482 ****/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "Deactivates mode themode of theobject in theselector. if themode value is set to default (-1), all active selection modes will be deactivated. likewise, if theselector value is set to default (null), themode will be deactivated in all viewer selectors.

Parameters
----------
theObject: SelectMgr_SelectableObject
theMode: int,optional
	default value is -1

Returns
-------
None
") Deactivate;
		void Deactivate(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Integer theMode = -1);

		/****************** IsActivated ******************/
		/**** md5 signature: 7740a684256eb944801d8f6eb45d6b6e ****/
		%feature("compactdefaultargs") IsActivated;
		%feature("autodoc", "Returns true if the selection with themode is active for the selectable object theobject and selector theselector. if all parameters are set to default values, it returns it there is any active selection in any known viewer selector for object theobject.

Parameters
----------
theObject: SelectMgr_SelectableObject
theMode: int,optional
	default value is -1

Returns
-------
bool
") IsActivated;
		Standard_Boolean IsActivated(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Integer theMode = -1);

		/****************** Load ******************/
		/**** md5 signature: e6b1abe0ec87c3850182d093010bd2a9 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loads and computes selection mode themode (if it is not equal to -1) in global context and adds selectable object to bvh tree. if the object theobject has an already calculated selection with mode themode and it was removed, the selection will be recalculated.

Parameters
----------
theObject: SelectMgr_SelectableObject
theMode: int,optional
	default value is -1

Returns
-------
None
") Load;
		void Load(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Integer theMode = -1);

		/****************** RecomputeSelection ******************/
		/**** md5 signature: e300f8385906c722b92102da39866740 ****/
		%feature("compactdefaultargs") RecomputeSelection;
		%feature("autodoc", "Recomputes activated selections of theobject for all known viewer selectors according to themode specified. if themode is set to default (-1), then all activated selections will be recomputed. if theisforce is set to true, then selection mode themode for object theobject will be recomputed regardless of its activation status.

Parameters
----------
theObject: SelectMgr_SelectableObject
theIsForce: bool,optional
	default value is Standard_False
theMode: int,optional
	default value is -1

Returns
-------
None
") RecomputeSelection;
		void RecomputeSelection(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Boolean theIsForce = Standard_False, const Standard_Integer theMode = -1);

		/****************** Remove ******************/
		/**** md5 signature: 5c3ed8204b6dc5eb677f6f9a648ae5af ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes selectable object theobject from all viewer selectors it was added to previously, removes it from all contexts and clears all computed selections of theobject.

Parameters
----------
theObject: SelectMgr_SelectableObject

Returns
-------
None
") Remove;
		void Remove(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****************** RestoreSelectionStructures ******************/
		/**** md5 signature: 36d61c341ed8fda882c98e9c56dffe4b ****/
		%feature("compactdefaultargs") RestoreSelectionStructures;
		%feature("autodoc", "Re-adds newly calculated sensitive entities of recomputed selection defined by mode themode to all viewer selectors contained that selection.

Parameters
----------
theObj: SelectMgr_SelectableObject
theMode: int,optional
	default value is -1

Returns
-------
None
") RestoreSelectionStructures;
		void RestoreSelectionStructures(const opencascade::handle<SelectMgr_SelectableObject> & theObj, const Standard_Integer theMode = -1);

		/****************** Selector ******************/
		/**** md5 signature: e8522c885bf82402a0d8d84a7ddb20d4 ****/
		%feature("compactdefaultargs") Selector;
		%feature("autodoc", "Return the selector.

Returns
-------
opencascade::handle<SelectMgr_ViewerSelector>
") Selector;
		const opencascade::handle<SelectMgr_ViewerSelector> & Selector();

		/****************** SetSelectionSensitivity ******************/
		/**** md5 signature: 96fed071fae2e728644acb87b701b105 ****/
		%feature("compactdefaultargs") SetSelectionSensitivity;
		%feature("autodoc", "Allows to manage sensitivity of a particular selection of interactive object theobject and changes previous sensitivity value of all sensitive entities in selection with themode to the given thenewsensitivity.

Parameters
----------
theObject: SelectMgr_SelectableObject
theMode: int
theNewSens: int

Returns
-------
None
") SetSelectionSensitivity;
		void SetSelectionSensitivity(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Integer theMode, const Standard_Integer theNewSens);

		/****************** SetUpdateMode ******************/
		/**** md5 signature: 217adbac30d2e6e8e02226954bf1cf79 ****/
		%feature("compactdefaultargs") SetUpdateMode;
		%feature("autodoc", "Sets type of update of all selections of theobject to the given thetype.

Parameters
----------
theObject: SelectMgr_SelectableObject
theType: SelectMgr_TypeOfUpdate

Returns
-------
None
") SetUpdateMode;
		void SetUpdateMode(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const SelectMgr_TypeOfUpdate theType);

		/****************** SetUpdateMode ******************/
		/**** md5 signature: 03c8b733d6c03b59708a515b2907828a ****/
		%feature("compactdefaultargs") SetUpdateMode;
		%feature("autodoc", "Sets type of update of selection with themode of theobject to the given thetype.

Parameters
----------
theObject: SelectMgr_SelectableObject
theMode: int
theType: SelectMgr_TypeOfUpdate

Returns
-------
None
") SetUpdateMode;
		void SetUpdateMode(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Integer theMode, const SelectMgr_TypeOfUpdate theType);

		/****************** Update ******************/
		/**** md5 signature: 343dab128743b4328530093d30198fd7 ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Updates all selections of theobject in all viewer selectors according to its current update status. if theisforce is set to true, the call is equal to recomputation.

Parameters
----------
theObject: SelectMgr_SelectableObject
theIsForce: bool,optional
	default value is Standard_True

Returns
-------
None
") Update;
		void Update(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Boolean theIsForce = Standard_True);

		/****************** UpdateSelection ******************/
		/**** md5 signature: 90140c94519afc73ed5d79551b57949f ****/
		%feature("compactdefaultargs") UpdateSelection;
		%feature("autodoc", "Re-adds selectable object in bvhs in all viewer selectors.

Parameters
----------
theObj: SelectMgr_SelectableObject

Returns
-------
None
") UpdateSelection;
		void UpdateSelection(const opencascade::handle<SelectMgr_SelectableObject> & theObj);

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
		/****************** SelectMgr_SensitiveEntity ******************/
		/**** md5 signature: 296820d294b82944d37fce98c6b9e5d5 ****/
		%feature("compactdefaultargs") SelectMgr_SensitiveEntity;
		%feature("autodoc", "Creates new inactive for selection object with base entity theentity.

Parameters
----------
theEntity: Select3D_SensitiveEntity

Returns
-------
None
") SelectMgr_SensitiveEntity;
		 SelectMgr_SensitiveEntity(const opencascade::handle<Select3D_SensitiveEntity> & theEntity);

		/****************** BaseSensitive ******************/
		/**** md5 signature: 16a2410d165ca7cb125aa41b7e51de25 ****/
		%feature("compactdefaultargs") BaseSensitive;
		%feature("autodoc", "Returns related instance of selectbasics class.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") BaseSensitive;
		const opencascade::handle<Select3D_SensitiveEntity> & BaseSensitive();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears up all resources and memory.

Returns
-------
None
") Clear;
		void Clear();

		/****************** IsActiveForSelection ******************/
		/**** md5 signature: 3187ce5cffb320503d698db8ebb12ce6 ****/
		%feature("compactdefaultargs") IsActiveForSelection;
		%feature("autodoc", "Returns true if this entity belongs to the active selection mode of parent object.

Returns
-------
bool
") IsActiveForSelection;
		Standard_Boolean IsActiveForSelection();

		/****************** ResetSelectionActiveStatus ******************/
		/**** md5 signature: 402136f369578fcfbf1be5ee51c22a53 ****/
		%feature("compactdefaultargs") ResetSelectionActiveStatus;
		%feature("autodoc", "Marks entity as inactive for selection.

Returns
-------
None
") ResetSelectionActiveStatus;
		void ResetSelectionActiveStatus();

		/****************** SetActiveForSelection ******************/
		/**** md5 signature: 6d7c1b09ac81855201e92a9953e1b83e ****/
		%feature("compactdefaultargs") SetActiveForSelection;
		%feature("autodoc", "Marks entity as active for selection.

Returns
-------
None
") SetActiveForSelection;
		void SetActiveForSelection();

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
		opencascade::handle<Select3D_SensitiveEntity > Entity;
		gp_Pnt Point;
		float Depth;
		float MinDist;
		float Tolerance;
		int Priority;
		int ZLayerPosition;
		int NbOwnerMatches;
		bool ToPreferClosest;
		/****************** SelectMgr_SortCriterion ******************/
		/**** md5 signature: 7c43477619c7a9df7500d7db5ac6145a ****/
		%feature("compactdefaultargs") SelectMgr_SortCriterion;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") SelectMgr_SortCriterion;
		 SelectMgr_SortCriterion();

		/****************** IsGreater ******************/
		/**** md5 signature: 8d16844e2bb3ff1693ac0f263f7862b1 ****/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "Compare with another item.

Parameters
----------
theOther: SelectMgr_SortCriterion

Returns
-------
bool
") IsGreater;
		bool IsGreater(const SelectMgr_SortCriterion & theOther);

		/****************** IsLower ******************/
		/**** md5 signature: c7311d9bab7ef7a0e8a2028fca0cc401 ****/
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "Compare with another item.

Parameters
----------
theOther: SelectMgr_SortCriterion

Returns
-------
bool
") IsLower;
		bool IsLower(const SelectMgr_SortCriterion & theOther);

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
		/****************** SelectMgr_ViewClipRange ******************/
		/**** md5 signature: 26502fffc9d3cfab4e9764855bb46286 ****/
		%feature("compactdefaultargs") SelectMgr_ViewClipRange;
		%feature("autodoc", "Creates an empty clip range.

Returns
-------
None
") SelectMgr_ViewClipRange;
		 SelectMgr_ViewClipRange();

		/****************** AddClipSubRange ******************/
		/**** md5 signature: 629945498bfae195a79192ef4690f13f ****/
		%feature("compactdefaultargs") AddClipSubRange;
		%feature("autodoc", "Adds a clipping sub-range (for clipping chains).

Parameters
----------
theRange: Bnd_Range

Returns
-------
None
") AddClipSubRange;
		void AddClipSubRange(const Bnd_Range & theRange);

		/****************** AddClippingPlanes ******************/
		/**** md5 signature: 530c5e2e47a475c0ff904682df4ec3ab ****/
		%feature("compactdefaultargs") AddClippingPlanes;
		%feature("autodoc", "Add clipping planes. planes and picking ray should be defined in the same coordinate system.

Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane
thePickRay: gp_Ax1

Returns
-------
None
") AddClippingPlanes;
		void AddClippingPlanes(const Graphic3d_SequenceOfHClipPlane & thePlanes, const gp_Ax1 & thePickRay);

		/****************** ChangeUnclipRange ******************/
		/**** md5 signature: 58b75e3eeaf4dd4dbdda4bc0bfa4ec3e ****/
		%feature("compactdefaultargs") ChangeUnclipRange;
		%feature("autodoc", "Returns the main unclipped range; [-inf, inf] by default.

Returns
-------
Bnd_Range
") ChangeUnclipRange;
		Bnd_Range & ChangeUnclipRange();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** GetNearestDepth ******************/
		/**** md5 signature: a7d31c5d6b83b64f1f6f7f0def838d0f ****/
		%feature("compactdefaultargs") GetNearestDepth;
		%feature("autodoc", "Calculates the min not clipped value from the range. returns false if the whole range is clipped.

Parameters
----------
theRange: Bnd_Range

Returns
-------
theDepth: float
") GetNearestDepth;
		Standard_Boolean GetNearestDepth(const Bnd_Range & theRange, Standard_Real &OutValue);

		/****************** IsClipped ******************/
		/**** md5 signature: 28a5904272062fde8c7fd50816e6a223 ****/
		%feature("compactdefaultargs") IsClipped;
		%feature("autodoc", "Check if the given depth is not within clipping range(s), e.g. true means depth is clipped.

Parameters
----------
theDepth: float

Returns
-------
bool
") IsClipped;
		Standard_Boolean IsClipped(const Standard_Real theDepth);

		/****************** SetVoid ******************/
		/**** md5 signature: 4e44fd52f6a76368c77b381fe1482a21 ****/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Clears clipping range.

Returns
-------
None
") SetVoid;
		void SetVoid();

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
		/**** md5 signature: 82ed0e718f9bead84301083a624d455d ****/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStandardMode: TopAbs_ShapeEnum

Returns
-------
bool
") ActsOn;
		virtual Standard_Boolean ActsOn(const TopAbs_ShapeEnum aStandardMode);

		/****************** Add ******************/
		/**** md5 signature: 3b329e3d0b8dfe710a9ec4b55242b939 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the filter afilter to a filter object created by a filter class inheriting this framework.

Parameters
----------
afilter: SelectMgr_Filter

Returns
-------
None
") Add;
		void Add(const opencascade::handle<SelectMgr_Filter> & afilter);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the filters used in this framework.

Returns
-------
None
") Clear;
		void Clear();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if this framework is empty.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsIn ******************/
		/**** md5 signature: bcb650ce8ef2a28332648c8155fc9140 ****/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "Returns true if the filter afilter is in this framework.

Parameters
----------
aFilter: SelectMgr_Filter

Returns
-------
bool
") IsIn;
		Standard_Boolean IsIn(const opencascade::handle<SelectMgr_Filter> & aFilter);

		/****************** Remove ******************/
		/**** md5 signature: 997660465968b9e15e5a0b93f7971147 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes the filter afilter from this framework.

Parameters
----------
aFilter: SelectMgr_Filter

Returns
-------
None
") Remove;
		void Remove(const opencascade::handle<SelectMgr_Filter> & aFilter);

		/****************** StoredFilters ******************/
		/**** md5 signature: a04e070cce1cdb1ca6b68764c2c7326f ****/
		%feature("compactdefaultargs") StoredFilters;
		%feature("autodoc", "Returns the list of stored filters from this framework.

Returns
-------
SelectMgr_ListOfFilter
") StoredFilters;
		const SelectMgr_ListOfFilter & StoredFilters();

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
		/****************** SelectMgr_AndFilter ******************/
		/**** md5 signature: 040688957c50b7c42a3f153f0a8f5f71 ****/
		%feature("compactdefaultargs") SelectMgr_AndFilter;
		%feature("autodoc", "Constructs an empty selection filter object for two or more types of entity.

Returns
-------
None
") SelectMgr_AndFilter;
		 SelectMgr_AndFilter();

		/****************** IsOk ******************/
		/**** md5 signature: 22a33e4e2022519dc44ef8862044fea0 ****/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "No available documentation.

Parameters
----------
anobj: SelectMgr_EntityOwner

Returns
-------
bool
") IsOk;
		Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

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
		/****************** SelectMgr_OrFilter ******************/
		/**** md5 signature: ad84449df83b0d757e01c20b3606f4da ****/
		%feature("compactdefaultargs") SelectMgr_OrFilter;
		%feature("autodoc", "Constructs an empty or selection filter.

Returns
-------
None
") SelectMgr_OrFilter;
		 SelectMgr_OrFilter();

		/****************** IsOk ******************/
		/**** md5 signature: 22a33e4e2022519dc44ef8862044fea0 ****/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "No available documentation.

Parameters
----------
anobj: SelectMgr_EntityOwner

Returns
-------
bool
") IsOk;
		Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

		/****************** SetDisabledObjects ******************/
		/**** md5 signature: cc2c53c8fee7b059ac3f6d19a9d335dc ****/
		%feature("compactdefaultargs") SetDisabledObjects;
		%feature("autodoc", "Disable selection of specified objects.

Parameters
----------
theObjects: Graphic3d_NMapOfTransient

Returns
-------
None
") SetDisabledObjects;
		void SetDisabledObjects(const opencascade::handle<Graphic3d_NMapOfTransient> & theObjects);

};


%make_alias(SelectMgr_OrFilter)

%extend SelectMgr_OrFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class SelectMgr_Frustum:
	pass

@classnotwrapped
class SelectMgr_FrustumBuilder:
	pass

@classnotwrapped
class SelectMgr_BaseFrustum:
	pass

@classnotwrapped
class SelectMgr_TriangularFrustum:
	pass

@classnotwrapped
class SelectMgr_RectangularFrustum:
	pass

@classnotwrapped
class SelectMgr_TriangularFrustumSet:
	pass

@classnotwrapped
class SelectMgr_ToleranceMap:
	pass

@classnotwrapped
class SelectMgr_ViewerSelector:
	pass

@classnotwrapped
class SelectMgr_SensitiveEntitySet:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
