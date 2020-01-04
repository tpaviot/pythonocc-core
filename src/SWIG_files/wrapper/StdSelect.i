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
%define STDSELECTDOCSTRING
"StdSelect module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stdselect.html"
%enddef
%module (package="OCC.Core", docstring=STDSELECTDOCSTRING) StdSelect


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
#include<StdSelect_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<SelectMgr_module.hxx>
#include<Prs3d_module.hxx>
#include<PrsMgr_module.hxx>
#include<TopLoc_module.hxx>
#include<TopoDS_module.hxx>
#include<V3d_module.hxx>
#include<Select3D_module.hxx>
#include<TopAbs_module.hxx>
#include<Graphic3d_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<Image_module.hxx>
#include<Bnd_module.hxx>
#include<TShort_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Poly_module.hxx>
#include<TopTools_module.hxx>
#include<Quantity_module.hxx>
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import SelectMgr.i
%import Prs3d.i
%import PrsMgr.i
%import TopLoc.i
%import TopoDS.i
%import V3d.i
%import Select3D.i
%import TopAbs.i
%import Graphic3d.i
%import Geom.i
%import gp.i
%import TColgp.i
%import Image.i
/* public enums */
enum StdSelect_TypeOfResult {
	StdSelect_TOR_SIMPLE = 0,
	StdSelect_TOR_MULTIPLE = 1,
};

enum StdSelect_SensitivityMode {
	StdSelect_SM_WINDOW = 0,
	StdSelect_SM_VIEW = 1,
};

enum StdSelect_TypeOfFace {
	StdSelect_AnyFace = 0,
	StdSelect_Plane = 1,
	StdSelect_Cylinder = 2,
	StdSelect_Sphere = 3,
	StdSelect_Torus = 4,
	StdSelect_Revol = 5,
	StdSelect_Cone = 6,
};

enum StdSelect_TypeOfEdge {
	StdSelect_AnyEdge = 0,
	StdSelect_Line = 1,
	StdSelect_Circle = 2,
};

enum StdSelect_DisplayMode {
	StdSelect_DM_Wireframe = 0,
	StdSelect_DM_Shading = 1,
	StdSelect_DM_HLR = 2,
};

enum StdSelect_TypeOfSelectionImage {
	StdSelect_TypeOfSelectionImage_NormalizedDepth = 0,
	StdSelect_TypeOfSelectionImage_NormalizedDepthInverted = 1,
	StdSelect_TypeOfSelectionImage_UnnormalizedDepth = 2,
	StdSelect_TypeOfSelectionImage_ColoredDetectedObject = 3,
	StdSelect_TypeOfSelectionImage_ColoredEntity = 4,
	StdSelect_TypeOfSelectionImage_ColoredOwner = 5,
	StdSelect_TypeOfSelectionImage_ColoredSelectionMode = 6,
};

/* end public enums declaration */

/* handles */
%wrap_handle(StdSelect_BRepOwner)
%wrap_handle(StdSelect_EdgeFilter)
%wrap_handle(StdSelect_FaceFilter)
%wrap_handle(StdSelect_Prs)
%wrap_handle(StdSelect_Shape)
%wrap_handle(StdSelect_ShapeTypeFilter)
%wrap_handle(StdSelect_ViewerSelector3d)
/* end handles declaration */

/* templates */
%template(StdSelect_IndexedDataMapOfOwnerPrs) NCollection_IndexedDataMap <opencascade::handle <SelectMgr_EntityOwner>, opencascade::handle <StdSelect_Prs>, TColStd_MapTransientHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedDataMap <opencascade::handle <SelectMgr_EntityOwner>, opencascade::handle <StdSelect_Prs>, TColStd_MapTransientHasher> StdSelect_IndexedDataMapOfOwnerPrs;
/* end typedefs declaration */

/******************
* class StdSelect *
******************/
%rename(stdselect) StdSelect;
class StdSelect {
	public:
		/****************** SetDrawerForBRepOwner ******************/
		%feature("compactdefaultargs") SetDrawerForBRepOwner;
		%feature("autodoc", "* puts The same drawer in every BRepOwner Of SensitivePrimitive Used Only for hilight Of BRepOwner...
	:param aSelection:
	:type aSelection: SelectMgr_Selection
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: void") SetDrawerForBRepOwner;
		static void SetDrawerForBRepOwner (const opencascade::handle<SelectMgr_Selection> & aSelection,const opencascade::handle<Prs3d_Drawer> & aDrawer);

};


%extend StdSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StdSelect_BRepOwner *
****************************/
class StdSelect_BRepOwner : public SelectMgr_EntityOwner {
	public:
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the presentation manager object aPM of all shapes with the selection mode aMode.
	:param aPM:
	:type aPM: PrsMgr_PresentationManager
	:param aMode: default value is 0
	:type aMode: int
	:rtype: void") Clear;
		virtual void Clear (const opencascade::handle<PrsMgr_PresentationManager> & aPM,const Standard_Integer aMode = 0);

		/****************** HasHilightMode ******************/
		%feature("compactdefaultargs") HasHilightMode;
		%feature("autodoc", "* Returns true if this framework has a highlight mode defined for it.
	:rtype: bool") HasHilightMode;
		Standard_Boolean HasHilightMode ();

		/****************** HasShape ******************/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "* returns False if no shape was set
	:rtype: bool") HasShape;
		Standard_Boolean HasShape ();

		/****************** HilightMode ******************/
		%feature("compactdefaultargs") HilightMode;
		%feature("autodoc", "* Returns the highlight mode for this framework. This defines the type of display used to highlight the owner of the shape when it is detected by the selector. The default type of display is wireframe, defined by the index 0.
	:rtype: int") HilightMode;
		Standard_Integer HilightMode ();

		/****************** HilightWithColor ******************/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", ":param thePM:
	:type thePM: PrsMgr_PresentationManager3d
	:param theStyle:
	:type theStyle: Prs3d_Drawer
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void") HilightWithColor;
		virtual void HilightWithColor (const opencascade::handle<PrsMgr_PresentationManager3d> & thePM,const opencascade::handle<Prs3d_Drawer> & theStyle,const Standard_Integer theMode = 0);

		/****************** IsHilighted ******************/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "* Returns true if an object with the selection mode aMode is highlighted in the presentation manager aPM.
	:param aPM:
	:type aPM: PrsMgr_PresentationManager
	:param aMode: default value is 0
	:type aMode: int
	:rtype: bool") IsHilighted;
		virtual Standard_Boolean IsHilighted (const opencascade::handle<PrsMgr_PresentationManager> & aPM,const Standard_Integer aMode = 0);

		/****************** ResetHilightMode ******************/
		%feature("compactdefaultargs") ResetHilightMode;
		%feature("autodoc", "* Resets the higlight mode for this framework. This defines the type of display used to highlight the owner of the shape when it is detected by the selector. The default type of display is wireframe, defined by the index 0.
	:rtype: None") ResetHilightMode;
		void ResetHilightMode ();

		/****************** SetHilightMode ******************/
		%feature("compactdefaultargs") SetHilightMode;
		%feature("autodoc", "* Sets the highlight mode for this framework. This defines the type of display used to highlight the owner of the shape when it is detected by the selector. The default type of display is wireframe, defined by the index 0.
	:param theMode:
	:type theMode: int
	:rtype: None") SetHilightMode;
		void SetHilightMode (const Standard_Integer theMode);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", ":param aLoc:
	:type aLoc: TopLoc_Location
	:rtype: void") SetLocation;
		virtual void SetLocation (const TopLoc_Location & aLoc);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns the shape.
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** StdSelect_BRepOwner ******************/
		%feature("compactdefaultargs") StdSelect_BRepOwner;
		%feature("autodoc", "* Constructs an owner specification framework defined by the priority aPriority.
	:param aPriority:
	:type aPriority: int
	:rtype: None") StdSelect_BRepOwner;
		 StdSelect_BRepOwner (const Standard_Integer aPriority);

		/****************** StdSelect_BRepOwner ******************/
		%feature("compactdefaultargs") StdSelect_BRepOwner;
		%feature("autodoc", "* Constructs an owner specification framework defined by the shape aShape and the priority aPriority. aShape and aPriority are stored in this framework. If more than one owner are detected during dynamic selection, the one with the highest priority is the one stored.
	:param aShape:
	:type aShape: TopoDS_Shape
	:param aPriority: default value is 0
	:type aPriority: int
	:param ComesFromDecomposition: default value is Standard_False
	:type ComesFromDecomposition: bool
	:rtype: None") StdSelect_BRepOwner;
		 StdSelect_BRepOwner (const TopoDS_Shape & aShape,const Standard_Integer aPriority = 0,const Standard_Boolean ComesFromDecomposition = Standard_False);

		/****************** StdSelect_BRepOwner ******************/
		%feature("compactdefaultargs") StdSelect_BRepOwner;
		%feature("autodoc", "* Constructs an owner specification framework defined by the shape aShape, the selectable object theOrigin and the priority aPriority. aShape, theOrigin and aPriority are stored in this framework. If more than one owner are detected during dynamic selection, the one with the highest priority is the one stored.
	:param aShape:
	:type aShape: TopoDS_Shape
	:param theOrigin:
	:type theOrigin: SelectMgr_SelectableObject
	:param aPriority: default value is 0
	:type aPriority: int
	:param FromDecomposition: default value is Standard_False
	:type FromDecomposition: bool
	:rtype: None") StdSelect_BRepOwner;
		 StdSelect_BRepOwner (const TopoDS_Shape & aShape,const opencascade::handle<SelectMgr_SelectableObject> & theOrigin,const Standard_Integer aPriority = 0,const Standard_Boolean FromDecomposition = Standard_False);

		/****************** Unhilight ******************/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "* Removes highlighting from the type of shape identified the selection mode aMode in the presentation manager aPM.
	:param aPM:
	:type aPM: PrsMgr_PresentationManager
	:param aMode: default value is 0
	:type aMode: int
	:rtype: void") Unhilight;
		virtual void Unhilight (const opencascade::handle<PrsMgr_PresentationManager> & aPM,const Standard_Integer aMode = 0);

		/****************** UpdateHighlightTrsf ******************/
		%feature("compactdefaultargs") UpdateHighlightTrsf;
		%feature("autodoc", "* Implements immediate application of location transformation of parent object to dynamic highlight structure
	:param theViewer:
	:type theViewer: V3d_Viewer
	:param theManager:
	:type theManager: PrsMgr_PresentationManager3d
	:param theDispMode:
	:type theDispMode: int
	:rtype: void") UpdateHighlightTrsf;
		virtual void UpdateHighlightTrsf (const opencascade::handle<V3d_Viewer> & theViewer,const opencascade::handle<PrsMgr_PresentationManager3d> & theManager,const Standard_Integer theDispMode);

};


%make_alias(StdSelect_BRepOwner)

%extend StdSelect_BRepOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StdSelect_BRepSelectionTool *
************************************/
class StdSelect_BRepSelectionTool {
	public:
		/****************** ComputeSensitive ******************/
		%feature("compactdefaultargs") ComputeSensitive;
		%feature("autodoc", "* Computes the sensitive primitives, stores them in the SelectMgr_Selection object, and returns this object. @param theShape shape to compute sensitive entities @param theOwner selectable owner object @param theSelection selection to append new sensitive entities @param theDeflection linear deflection @param theDeflAngle angular deflection @param theNbPOnEdge sensitivity parameters for edges and wires @param theMaxiParam sensitivity parameters for infinite objects (the default value is 500) @param theAutoTriang flag to compute triangulation for the faces which have none
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:param theSelection:
	:type theSelection: SelectMgr_Selection
	:param theDeflection:
	:type theDeflection: float
	:param theDeflAngle:
	:type theDeflAngle: float
	:param theNbPOnEdge:
	:type theNbPOnEdge: int
	:param theMaxiParam:
	:type theMaxiParam: float
	:param theAutoTriang: default value is Standard_True
	:type theAutoTriang: bool
	:rtype: void") ComputeSensitive;
		static void ComputeSensitive (const TopoDS_Shape & theShape,const opencascade::handle<SelectMgr_EntityOwner> & theOwner,const opencascade::handle<SelectMgr_Selection> & theSelection,const Standard_Real theDeflection,const Standard_Real theDeflAngle,const Standard_Integer theNbPOnEdge,const Standard_Real theMaxiParam,const Standard_Boolean theAutoTriang = Standard_True);

		/****************** GetEdgeSensitive ******************/
		%feature("compactdefaultargs") GetEdgeSensitive;
		%feature("autodoc", "* Create a sensitive edge or sensitive wire. @param theShape either TopoDS_Edge or TopoDS_Wire to compute sensitive entities @param theOwner selectable owner object @param theSelection selection to append new sensitive entities @param theDeflection linear deflection @param theDeviationAngle angular deflection @param theNbPOnEdge sensitivity parameters @param theMaxiParam sensitivity parameters
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:param theSelection:
	:type theSelection: SelectMgr_Selection
	:param theDeflection:
	:type theDeflection: float
	:param theDeviationAngle:
	:type theDeviationAngle: float
	:param theNbPOnEdge:
	:type theNbPOnEdge: int
	:param theMaxiParam:
	:type theMaxiParam: float
	:param theSensitive:
	:type theSensitive: Select3D_SensitiveEntity
	:rtype: void") GetEdgeSensitive;
		static void GetEdgeSensitive (const TopoDS_Shape & theShape,const opencascade::handle<SelectMgr_EntityOwner> & theOwner,const opencascade::handle<SelectMgr_Selection> & theSelection,const Standard_Real theDeflection,const Standard_Real theDeviationAngle,const Standard_Integer theNbPOnEdge,const Standard_Real theMaxiParam,opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****************** GetSensitiveForFace ******************/
		%feature("compactdefaultargs") GetSensitiveForFace;
		%feature("autodoc", "* Creates the 3D sensitive entities for Face selection. @param theFace face to compute sensitive entities @param theOwner selectable owner object @param theOutList output result list to append created entities @param theAutoTriang obsolete flag (has no effect) @param theNbPOnEdge sensitivity parameters @param theMaxiParam sensitivity parameters @param theInteriorFlag flag indicating that face interior (True) or face boundary (False) should be selectable
	:param theFace:
	:type theFace: TopoDS_Face
	:param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:param theOutList:
	:type theOutList: Select3D_EntitySequence
	:param theAutoTriang: default value is Standard_True
	:type theAutoTriang: bool
	:param theNbPOnEdge: default value is 9
	:type theNbPOnEdge: int
	:param theMaxiParam: default value is 500
	:type theMaxiParam: float
	:param theInteriorFlag: default value is Standard_True
	:type theInteriorFlag: bool
	:rtype: bool") GetSensitiveForFace;
		static Standard_Boolean GetSensitiveForFace (const TopoDS_Face & theFace,const opencascade::handle<SelectMgr_EntityOwner> & theOwner,Select3D_EntitySequence & theOutList,const Standard_Boolean theAutoTriang = Standard_True,const Standard_Integer theNbPOnEdge = 9,const Standard_Real theMaxiParam = 500,const Standard_Boolean theInteriorFlag = Standard_True);

		/****************** GetStandardPriority ******************/
		%feature("compactdefaultargs") GetStandardPriority;
		%feature("autodoc", "* Returns the standard priority of the shape aShap having the type aType. This priority is passed to a StdSelect_BRepOwner object. You can use the function Load to modify the selection priority of an owner to make one entity more selectable than another one.
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theType:
	:type theType: TopAbs_ShapeEnum
	:rtype: int") GetStandardPriority;
		static Standard_Integer GetStandardPriority (const TopoDS_Shape & theShape,const TopAbs_ShapeEnum theType);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Decomposition of <aShape> into sensitive entities following a mode of decomposition <aType>. These entities are stored in <aSelection>. BrepOwners are created to store the identity of the picked shapes during the selection process. In those BRepOwners is also stored the original shape. But One can't get the selectable object which was decomposed to give the sensitive entities. maximal parameter is used for infinite objects, to limit the sensitive Domain.... If AutoTriangulation = True, a Triangulation will be computed for faces which have no existing one. if AutoTriangulation = False the old algorithm will be called to compute sensitive entities on faces.
	:param aSelection:
	:type aSelection: SelectMgr_Selection
	:param aShape:
	:type aShape: TopoDS_Shape
	:param aType:
	:type aType: TopAbs_ShapeEnum
	:param theDeflection:
	:type theDeflection: float
	:param theDeviationAngle:
	:type theDeviationAngle: float
	:param AutoTriangulation: default value is Standard_True
	:type AutoTriangulation: bool
	:param aPriority: default value is -1
	:type aPriority: int
	:param NbPOnEdge: default value is 9
	:type NbPOnEdge: int
	:param MaximalParameter: default value is 500
	:type MaximalParameter: float
	:rtype: void") Load;
		static void Load (const opencascade::handle<SelectMgr_Selection> & aSelection,const TopoDS_Shape & aShape,const TopAbs_ShapeEnum aType,const Standard_Real theDeflection,const Standard_Real theDeviationAngle,const Standard_Boolean AutoTriangulation = Standard_True,const Standard_Integer aPriority = -1,const Standard_Integer NbPOnEdge = 9,const Standard_Real MaximalParameter = 500);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Same functionnalities ; the only difference is that the selectable object from which the selection comes is stored in each Sensitive EntityOwner; decomposition of <aShape> into sensitive entities following a mode of decomposition <aType>. These entities are stored in <aSelection> The Major difference is that the known users are first inserted in the BRepOwners. the original shape is the last user... (see EntityOwner from SelectBasics and BrepOwner)...
	:param aSelection:
	:type aSelection: SelectMgr_Selection
	:param Origin:
	:type Origin: SelectMgr_SelectableObject
	:param aShape:
	:type aShape: TopoDS_Shape
	:param aType:
	:type aType: TopAbs_ShapeEnum
	:param theDeflection:
	:type theDeflection: float
	:param theDeviationAngle:
	:type theDeviationAngle: float
	:param AutoTriangulation: default value is Standard_True
	:type AutoTriangulation: bool
	:param aPriority: default value is -1
	:type aPriority: int
	:param NbPOnEdge: default value is 9
	:type NbPOnEdge: int
	:param MaximalParameter: default value is 500
	:type MaximalParameter: float
	:rtype: void") Load;
		static void Load (const opencascade::handle<SelectMgr_Selection> & aSelection,const opencascade::handle<SelectMgr_SelectableObject> & Origin,const TopoDS_Shape & aShape,const TopAbs_ShapeEnum aType,const Standard_Real theDeflection,const Standard_Real theDeviationAngle,const Standard_Boolean AutoTriangulation = Standard_True,const Standard_Integer aPriority = -1,const Standard_Integer NbPOnEdge = 9,const Standard_Real MaximalParameter = 500);

		/****************** PreBuildBVH ******************/
		%feature("compactdefaultargs") PreBuildBVH;
		%feature("autodoc", "* Traverses the selection given and pre-builds BVH trees for heavyweight sensitive entities containing more than BVH_PRIMITIVE_LIMIT (defined in .cxx file) sub-elements.
	:param theSelection:
	:type theSelection: SelectMgr_Selection
	:rtype: void") PreBuildBVH;
		static void PreBuildBVH (const opencascade::handle<SelectMgr_Selection> & theSelection);

};


%extend StdSelect_BRepSelectionTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StdSelect_EdgeFilter *
*****************************/
class StdSelect_EdgeFilter : public SelectMgr_Filter {
	public:
		/****************** ActsOn ******************/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", ":param aStandardMode:
	:type aStandardMode: TopAbs_ShapeEnum
	:rtype: bool") ActsOn;
		virtual Standard_Boolean ActsOn (const TopAbs_ShapeEnum aStandardMode);

		/****************** IsOk ******************/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", ":param anobj:
	:type anobj: SelectMgr_EntityOwner
	:rtype: bool") IsOk;
		virtual Standard_Boolean IsOk (const opencascade::handle<SelectMgr_EntityOwner> & anobj);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "* Sets the type of edge aNewType. aNewType is to be highlighted in selection.
	:param aNewType:
	:type aNewType: StdSelect_TypeOfEdge
	:rtype: None") SetType;
		void SetType (const StdSelect_TypeOfEdge aNewType);

		/****************** StdSelect_EdgeFilter ******************/
		%feature("compactdefaultargs") StdSelect_EdgeFilter;
		%feature("autodoc", "* Constructs an edge filter object defined by the type of edge Edge.
	:param Edge:
	:type Edge: StdSelect_TypeOfEdge
	:rtype: None") StdSelect_EdgeFilter;
		 StdSelect_EdgeFilter (const StdSelect_TypeOfEdge Edge);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the type of edge to be highlighted in selection.
	:rtype: StdSelect_TypeOfEdge") Type;
		StdSelect_TypeOfEdge Type ();

};


%make_alias(StdSelect_EdgeFilter)

%extend StdSelect_EdgeFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StdSelect_FaceFilter *
*****************************/
class StdSelect_FaceFilter : public SelectMgr_Filter {
	public:
		/****************** ActsOn ******************/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", ":param aStandardMode:
	:type aStandardMode: TopAbs_ShapeEnum
	:rtype: bool") ActsOn;
		virtual Standard_Boolean ActsOn (const TopAbs_ShapeEnum aStandardMode);

		/****************** IsOk ******************/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", ":param anobj:
	:type anobj: SelectMgr_EntityOwner
	:rtype: bool") IsOk;
		virtual Standard_Boolean IsOk (const opencascade::handle<SelectMgr_EntityOwner> & anobj);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "* Sets the type of face aNewType. aNewType is to be highlighted in selection.
	:param aNewType:
	:type aNewType: StdSelect_TypeOfFace
	:rtype: None") SetType;
		void SetType (const StdSelect_TypeOfFace aNewType);

		/****************** StdSelect_FaceFilter ******************/
		%feature("compactdefaultargs") StdSelect_FaceFilter;
		%feature("autodoc", "* Constructs a face filter object defined by the type of face aTypeOfFace.
	:param aTypeOfFace:
	:type aTypeOfFace: StdSelect_TypeOfFace
	:rtype: None") StdSelect_FaceFilter;
		 StdSelect_FaceFilter (const StdSelect_TypeOfFace aTypeOfFace);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the type of face to be highlighted in selection.
	:rtype: StdSelect_TypeOfFace") Type;
		StdSelect_TypeOfFace Type ();

};


%make_alias(StdSelect_FaceFilter)

%extend StdSelect_FaceFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class StdSelect_Prs *
**********************/
class StdSelect_Prs : public Prs3d_Presentation {
	public:
		/****************** Manager ******************/
		%feature("compactdefaultargs") Manager;
		%feature("autodoc", ":rtype: opencascade::handle<Graphic3d_StructureManager>") Manager;
		const opencascade::handle<Graphic3d_StructureManager> & Manager ();

		/****************** StdSelect_Prs ******************/
		%feature("compactdefaultargs") StdSelect_Prs;
		%feature("autodoc", ":param aStructureManager:
	:type aStructureManager: Graphic3d_StructureManager
	:rtype: None") StdSelect_Prs;
		 StdSelect_Prs (const opencascade::handle<Graphic3d_StructureManager> & aStructureManager);

};


%make_alias(StdSelect_Prs)

%extend StdSelect_Prs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StdSelect_Shape *
************************/
class StdSelect_Shape : public PrsMgr_PresentableObject {
	public:
		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", ":param aPresentationManager:
	:type aPresentationManager: PrsMgr_PresentationManager3d
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None") Compute;
		void Compute (const opencascade::handle<PrsMgr_PresentationManager3d> & aPresentationManager,const opencascade::handle<Prs3d_Presentation> & aPresentation,const Standard_Integer aMode = 0);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* computes the presentation according to a point of view given by <aProjector>. To be Used when the associated degenerated Presentations have been transformed by <aTrsf> which is not a Pure Translation. The HLR Prs can't be deducted automatically WARNING :<aTrsf> must be applied to the object to display before computation !!!
	:param aProjector:
	:type aProjector: Prs3d_Projector
	:param aTrsf:
	:type aTrsf: Geom_Transformation
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:rtype: void") Compute;
		virtual void Compute (const opencascade::handle<Prs3d_Projector> & aProjector,const opencascade::handle<Geom_Transformation> & aTrsf,const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") Shape;
		void Shape (const TopoDS_Shape & theShape);

		/****************** StdSelect_Shape ******************/
		%feature("compactdefaultargs") StdSelect_Shape;
		%feature("autodoc", ":param theShape:
	:type theShape: TopoDS_Shape
	:param theDrawer: default value is opencascade::handle<Prs3d_Drawer>()
	:type theDrawer: Prs3d_Drawer
	:rtype: None") StdSelect_Shape;
		 StdSelect_Shape (const TopoDS_Shape & theShape,const opencascade::handle<Prs3d_Drawer> & theDrawer = opencascade::handle<Prs3d_Drawer>());

};


%make_alias(StdSelect_Shape)

%extend StdSelect_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StdSelect_ShapeTypeFilter *
**********************************/
class StdSelect_ShapeTypeFilter : public SelectMgr_Filter {
	public:
		/****************** ActsOn ******************/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", ":param aStandardMode:
	:type aStandardMode: TopAbs_ShapeEnum
	:rtype: bool") ActsOn;
		virtual Standard_Boolean ActsOn (const TopAbs_ShapeEnum aStandardMode);

		/****************** IsOk ******************/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", ":param anobj:
	:type anobj: SelectMgr_EntityOwner
	:rtype: bool") IsOk;
		virtual Standard_Boolean IsOk (const opencascade::handle<SelectMgr_EntityOwner> & anobj);

		/****************** StdSelect_ShapeTypeFilter ******************/
		%feature("compactdefaultargs") StdSelect_ShapeTypeFilter;
		%feature("autodoc", "* Constructs a filter object defined by the shape type aType.
	:param aType:
	:type aType: TopAbs_ShapeEnum
	:rtype: None") StdSelect_ShapeTypeFilter;
		 StdSelect_ShapeTypeFilter (const TopAbs_ShapeEnum aType);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the type of shape selected by the filter.
	:rtype: TopAbs_ShapeEnum") Type;
		TopAbs_ShapeEnum Type ();

};


%make_alias(StdSelect_ShapeTypeFilter)

%extend StdSelect_ShapeTypeFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StdSelect_ViewerSelector3d *
***********************************/
class StdSelect_ViewerSelector3d : public SelectMgr_ViewerSelector {
	public:
		/****************** ClearSensitive ******************/
		%feature("compactdefaultargs") ClearSensitive;
		%feature("autodoc", ":param theView:
	:type theView: V3d_View
	:rtype: None") ClearSensitive;
		void ClearSensitive (const opencascade::handle<V3d_View> & theView);

		/****************** DisplaySensitive ******************/
		%feature("compactdefaultargs") DisplaySensitive;
		%feature("autodoc", "* Displays sensitives in view <theView>.
	:param theView:
	:type theView: V3d_View
	:rtype: None") DisplaySensitive;
		void DisplaySensitive (const opencascade::handle<V3d_View> & theView);

		/****************** DisplaySensitive ******************/
		%feature("compactdefaultargs") DisplaySensitive;
		%feature("autodoc", ":param theSel:
	:type theSel: SelectMgr_Selection
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:param theView:
	:type theView: V3d_View
	:param theToClearOthers: default value is Standard_True
	:type theToClearOthers: bool
	:rtype: None") DisplaySensitive;
		void DisplaySensitive (const opencascade::handle<SelectMgr_Selection> & theSel,const gp_Trsf & theTrsf,const opencascade::handle<V3d_View> & theView,const Standard_Boolean theToClearOthers = Standard_True);

		/****************** Pick ******************/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "* Picks the sensitive entity at the pixel coordinates of the mouse <theXPix> and <theYPix>. The selector looks for touched areas and owners.
	:param theXPix:
	:type theXPix: int
	:param theYPix:
	:type theYPix: int
	:param theView:
	:type theView: V3d_View
	:rtype: None") Pick;
		void Pick (const Standard_Integer theXPix,const Standard_Integer theYPix,const opencascade::handle<V3d_View> & theView);

		/****************** Pick ******************/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "* Picks the sensitive entity according to the minimum and maximum pixel values <theXPMin>, <theYPMin>, <theXPMax> and <theYPMax> defining a 2D area for selection in the 3D view aView.
	:param theXPMin:
	:type theXPMin: int
	:param theYPMin:
	:type theYPMin: int
	:param theXPMax:
	:type theXPMax: int
	:param theYPMax:
	:type theYPMax: int
	:param theView:
	:type theView: V3d_View
	:rtype: None") Pick;
		void Pick (const Standard_Integer theXPMin,const Standard_Integer theYPMin,const Standard_Integer theXPMax,const Standard_Integer theYPMax,const opencascade::handle<V3d_View> & theView);

		/****************** Pick ******************/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "* pick action - input pixel values for polyline selection for selection.
	:param thePolyline:
	:type thePolyline: TColgp_Array1OfPnt2d
	:param theView:
	:type theView: V3d_View
	:rtype: None") Pick;
		void Pick (const TColgp_Array1OfPnt2d & thePolyline,const opencascade::handle<V3d_View> & theView);

		/****************** PixelTolerance ******************/
		%feature("compactdefaultargs") PixelTolerance;
		%feature("autodoc", "* Returns the pixel tolerance.
	:rtype: int") PixelTolerance;
		Standard_Integer PixelTolerance ();

		/****************** SetPixelTolerance ******************/
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "* Sets the pixel tolerance <theTolerance>.
	:param theTolerance:
	:type theTolerance: int
	:rtype: None") SetPixelTolerance;
		void SetPixelTolerance (const Standard_Integer theTolerance);

		/****************** StdSelect_ViewerSelector3d ******************/
		%feature("compactdefaultargs") StdSelect_ViewerSelector3d;
		%feature("autodoc", "* Constructs an empty 3D selector object.
	:rtype: None") StdSelect_ViewerSelector3d;
		 StdSelect_ViewerSelector3d ();

		/****************** ToPixMap ******************/
		%feature("compactdefaultargs") ToPixMap;
		%feature("autodoc", "* Dump of detection results into image. This method performs axis picking for each pixel in the image and generates a color depending on picking results and selection image type. @param theImage result image, should be initialized @param theView 3D view defining camera position @param theType type of image to define @param thePickedIndex index of picked entity (1 means topmost)
	:param theImage:
	:type theImage: Image_PixMap
	:param theView:
	:type theView: V3d_View
	:param theType:
	:type theType: StdSelect_TypeOfSelectionImage
	:param thePickedIndex: default value is 1
	:type thePickedIndex: int
	:rtype: bool") ToPixMap;
		Standard_Boolean ToPixMap (Image_PixMap & theImage,const opencascade::handle<V3d_View> & theView,const StdSelect_TypeOfSelectionImage theType,const Standard_Integer thePickedIndex = 1);

};


%make_alias(StdSelect_ViewerSelector3d)

%extend StdSelect_ViewerSelector3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
