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
#include<TopoDS_module.hxx>
#include<PrsMgr_module.hxx>
#include<TopLoc_module.hxx>
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
#include<Message_module.hxx>
#include<Media_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import SelectMgr.i
%import Prs3d.i
%import TopoDS.i
%import PrsMgr.i
%import TopLoc.i
%import V3d.i
%import Select3D.i
%import TopAbs.i
%import Graphic3d.i
%import Geom.i
%import gp.i
%import TColgp.i
%import Image.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class StdSelect_TypeOfResult(IntEnum):
	StdSelect_TOR_SIMPLE = 0
	StdSelect_TOR_MULTIPLE = 1
StdSelect_TOR_SIMPLE = StdSelect_TypeOfResult.StdSelect_TOR_SIMPLE
StdSelect_TOR_MULTIPLE = StdSelect_TypeOfResult.StdSelect_TOR_MULTIPLE

class StdSelect_SensitivityMode(IntEnum):
	StdSelect_SM_WINDOW = 0
	StdSelect_SM_VIEW = 1
StdSelect_SM_WINDOW = StdSelect_SensitivityMode.StdSelect_SM_WINDOW
StdSelect_SM_VIEW = StdSelect_SensitivityMode.StdSelect_SM_VIEW

class StdSelect_TypeOfFace(IntEnum):
	StdSelect_AnyFace = 0
	StdSelect_Plane = 1
	StdSelect_Cylinder = 2
	StdSelect_Sphere = 3
	StdSelect_Torus = 4
	StdSelect_Revol = 5
	StdSelect_Cone = 6
StdSelect_AnyFace = StdSelect_TypeOfFace.StdSelect_AnyFace
StdSelect_Plane = StdSelect_TypeOfFace.StdSelect_Plane
StdSelect_Cylinder = StdSelect_TypeOfFace.StdSelect_Cylinder
StdSelect_Sphere = StdSelect_TypeOfFace.StdSelect_Sphere
StdSelect_Torus = StdSelect_TypeOfFace.StdSelect_Torus
StdSelect_Revol = StdSelect_TypeOfFace.StdSelect_Revol
StdSelect_Cone = StdSelect_TypeOfFace.StdSelect_Cone

class StdSelect_TypeOfEdge(IntEnum):
	StdSelect_AnyEdge = 0
	StdSelect_Line = 1
	StdSelect_Circle = 2
StdSelect_AnyEdge = StdSelect_TypeOfEdge.StdSelect_AnyEdge
StdSelect_Line = StdSelect_TypeOfEdge.StdSelect_Line
StdSelect_Circle = StdSelect_TypeOfEdge.StdSelect_Circle

class StdSelect_DisplayMode(IntEnum):
	StdSelect_DM_Wireframe = 0
	StdSelect_DM_Shading = 1
	StdSelect_DM_HLR = 2
StdSelect_DM_Wireframe = StdSelect_DisplayMode.StdSelect_DM_Wireframe
StdSelect_DM_Shading = StdSelect_DisplayMode.StdSelect_DM_Shading
StdSelect_DM_HLR = StdSelect_DisplayMode.StdSelect_DM_HLR

class StdSelect_TypeOfSelectionImage(IntEnum):
	StdSelect_TypeOfSelectionImage_NormalizedDepth = 0
	StdSelect_TypeOfSelectionImage_NormalizedDepthInverted = 1
	StdSelect_TypeOfSelectionImage_UnnormalizedDepth = 2
	StdSelect_TypeOfSelectionImage_ColoredDetectedObject = 3
	StdSelect_TypeOfSelectionImage_ColoredEntity = 4
	StdSelect_TypeOfSelectionImage_ColoredOwner = 5
	StdSelect_TypeOfSelectionImage_ColoredSelectionMode = 6
StdSelect_TypeOfSelectionImage_NormalizedDepth = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_NormalizedDepth
StdSelect_TypeOfSelectionImage_NormalizedDepthInverted = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_NormalizedDepthInverted
StdSelect_TypeOfSelectionImage_UnnormalizedDepth = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_UnnormalizedDepth
StdSelect_TypeOfSelectionImage_ColoredDetectedObject = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_ColoredDetectedObject
StdSelect_TypeOfSelectionImage_ColoredEntity = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_ColoredEntity
StdSelect_TypeOfSelectionImage_ColoredOwner = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_ColoredOwner
StdSelect_TypeOfSelectionImage_ColoredSelectionMode = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_ColoredSelectionMode
};
/* end python proxy for enums */

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
%template(StdSelect_IndexedDataMapOfOwnerPrs) NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>,opencascade::handle<StdSelect_Prs>,TColStd_MapTransientHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>, opencascade::handle<StdSelect_Prs>, TColStd_MapTransientHasher> StdSelect_IndexedDataMapOfOwnerPrs;
/* end typedefs declaration */

/******************
* class StdSelect *
******************/
%rename(stdselect) StdSelect;
class StdSelect {
	public:
		/****************** SetDrawerForBRepOwner ******************/
		/**** md5 signature: 28622687f408d38c4fc3d96636f33dc6 ****/
		%feature("compactdefaultargs") SetDrawerForBRepOwner;
		%feature("autodoc", "Puts the same drawer in every brepowner of sensitiveprimitive used only for hilight of brepowner...

Parameters
----------
aSelection: SelectMgr_Selection
aDrawer: Prs3d_Drawer

Returns
-------
None
") SetDrawerForBRepOwner;
		static void SetDrawerForBRepOwner(const opencascade::handle<SelectMgr_Selection> & aSelection, const opencascade::handle<Prs3d_Drawer> & aDrawer);

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
		/****************** StdSelect_BRepOwner ******************/
		/**** md5 signature: 8773fa00a4c8a623aa2ca3b6dfcf84c7 ****/
		%feature("compactdefaultargs") StdSelect_BRepOwner;
		%feature("autodoc", "Constructs an owner specification framework defined by the priority apriority.

Parameters
----------
aPriority: int

Returns
-------
None
") StdSelect_BRepOwner;
		 StdSelect_BRepOwner(const Standard_Integer aPriority);

		/****************** StdSelect_BRepOwner ******************/
		/**** md5 signature: 91bc847f9d2053dee291e35c09dd4779 ****/
		%feature("compactdefaultargs") StdSelect_BRepOwner;
		%feature("autodoc", "Constructs an owner specification framework defined by the shape ashape and the priority apriority. ashape and apriority are stored in this framework. if more than one owner are detected during dynamic selection, the one with the highest priority is the one stored.

Parameters
----------
aShape: TopoDS_Shape
aPriority: int,optional
	default value is 0
ComesFromDecomposition: bool,optional
	default value is Standard_False

Returns
-------
None
") StdSelect_BRepOwner;
		 StdSelect_BRepOwner(const TopoDS_Shape & aShape, const Standard_Integer aPriority = 0, const Standard_Boolean ComesFromDecomposition = Standard_False);

		/****************** StdSelect_BRepOwner ******************/
		/**** md5 signature: 29703b0feb28228ed28f51236ea3f6ec ****/
		%feature("compactdefaultargs") StdSelect_BRepOwner;
		%feature("autodoc", "Constructs an owner specification framework defined by the shape ashape, the selectable object theorigin and the priority apriority. ashape, theorigin and apriority are stored in this framework. if more than one owner are detected during dynamic selection, the one with the highest priority is the one stored.

Parameters
----------
aShape: TopoDS_Shape
theOrigin: SelectMgr_SelectableObject
aPriority: int,optional
	default value is 0
FromDecomposition: bool,optional
	default value is Standard_False

Returns
-------
None
") StdSelect_BRepOwner;
		 StdSelect_BRepOwner(const TopoDS_Shape & aShape, const opencascade::handle<SelectMgr_SelectableObject> & theOrigin, const Standard_Integer aPriority = 0, const Standard_Boolean FromDecomposition = Standard_False);

		/****************** Clear ******************/
		/**** md5 signature: c601f9124e5aa6653d81cfc353a6cbdf ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the presentation manager object apm of all shapes with the selection mode amode.

Parameters
----------
aPM: PrsMgr_PresentationManager
aMode: int,optional
	default value is 0

Returns
-------
None
") Clear;
		virtual void Clear(const opencascade::handle<PrsMgr_PresentationManager> & aPM, const Standard_Integer aMode = 0);

		/****************** HasHilightMode ******************/
		/**** md5 signature: 35c4cc36b9d1287cbb8be9209c167aef ****/
		%feature("compactdefaultargs") HasHilightMode;
		%feature("autodoc", "Returns true if this framework has a highlight mode defined for it.

Returns
-------
bool
") HasHilightMode;
		Standard_Boolean HasHilightMode();

		/****************** HasShape ******************/
		/**** md5 signature: fd039c2e20d8353da74f37a8ffea2aaf ****/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "Returns false if no shape was set.

Returns
-------
bool
") HasShape;
		Standard_Boolean HasShape();

		/****************** HilightMode ******************/
		/**** md5 signature: 65e4b0407fae3cd6d737aa6b7e74bfa0 ****/
		%feature("compactdefaultargs") HilightMode;
		%feature("autodoc", "Returns the highlight mode for this framework. this defines the type of display used to highlight the owner of the shape when it is detected by the selector. the default type of display is wireframe, defined by the index 0.

Returns
-------
int
") HilightMode;
		Standard_Integer HilightMode();

		/****************** HilightWithColor ******************/
		/**** md5 signature: 56e556dd0edce796a3c3d12b272af59e ****/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePM: PrsMgr_PresentationManager3d
theStyle: Prs3d_Drawer
theMode: int,optional
	default value is 0

Returns
-------
None
") HilightWithColor;
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager3d> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode = 0);

		/****************** IsHilighted ******************/
		/**** md5 signature: 19f129c3adba382b625d88256f1470cb ****/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "Returns true if an object with the selection mode amode is highlighted in the presentation manager apm.

Parameters
----------
aPM: PrsMgr_PresentationManager
aMode: int,optional
	default value is 0

Returns
-------
bool
") IsHilighted;
		virtual Standard_Boolean IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & aPM, const Standard_Integer aMode = 0);

		/****************** ResetHilightMode ******************/
		/**** md5 signature: dc7107c584de9b0874ed480d1bc34a60 ****/
		%feature("compactdefaultargs") ResetHilightMode;
		%feature("autodoc", "Resets the higlight mode for this framework. this defines the type of display used to highlight the owner of the shape when it is detected by the selector. the default type of display is wireframe, defined by the index 0.

Returns
-------
None
") ResetHilightMode;
		void ResetHilightMode();

		/****************** SetHilightMode ******************/
		/**** md5 signature: e2eeb5d16bea7d1c9cb04b72dce3668c ****/
		%feature("compactdefaultargs") SetHilightMode;
		%feature("autodoc", "Sets the highlight mode for this framework. this defines the type of display used to highlight the owner of the shape when it is detected by the selector. the default type of display is wireframe, defined by the index 0.

Parameters
----------
theMode: int

Returns
-------
None
") SetHilightMode;
		void SetHilightMode(const Standard_Integer theMode);

		/****************** SetLocation ******************/
		/**** md5 signature: d7a193afcb3b08815e792796d7dcb913 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLoc: TopLoc_Location

Returns
-------
None
") SetLocation;
		virtual void SetLocation(const TopLoc_Location & aLoc);

		/****************** Shape ******************/
		/**** md5 signature: 1058569f5d639354fedf11e73741b7df ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the shape.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Unhilight ******************/
		/**** md5 signature: a1b62fcc891d4ccc3641ae435e157664 ****/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "Removes highlighting from the type of shape identified the selection mode amode in the presentation manager apm.

Parameters
----------
aPM: PrsMgr_PresentationManager
aMode: int,optional
	default value is 0

Returns
-------
None
") Unhilight;
		virtual void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & aPM, const Standard_Integer aMode = 0);

		/****************** UpdateHighlightTrsf ******************/
		/**** md5 signature: e61a4536040859fb2d3616b477fa8627 ****/
		%feature("compactdefaultargs") UpdateHighlightTrsf;
		%feature("autodoc", "Implements immediate application of location transformation of parent object to dynamic highlight structure.

Parameters
----------
theViewer: V3d_Viewer
theManager: PrsMgr_PresentationManager3d
theDispMode: int

Returns
-------
None
") UpdateHighlightTrsf;
		virtual void UpdateHighlightTrsf(const opencascade::handle<V3d_Viewer> & theViewer, const opencascade::handle<PrsMgr_PresentationManager3d> & theManager, const Standard_Integer theDispMode);

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
		/**** md5 signature: 80156af8bd1629db930e94f1fa305511 ****/
		%feature("compactdefaultargs") ComputeSensitive;
		%feature("autodoc", "Computes the sensitive primitives, stores them in the selectmgr_selection object, and returns this object. @param theshape shape to compute sensitive entities @param theowner selectable owner object @param theselection selection to append new sensitive entities @param thedeflection linear deflection @param thedeflangle angular deflection @param thenbponedge sensitivity parameters for edges and wires @param themaxiparam sensitivity parameters for infinite objects (the default value is 500) @param theautotriang flag to compute triangulation for the faces which have none.

Parameters
----------
theShape: TopoDS_Shape
theOwner: SelectMgr_EntityOwner
theSelection: SelectMgr_Selection
theDeflection: float
theDeflAngle: float
theNbPOnEdge: int
theMaxiParam: float
theAutoTriang: bool,optional
	default value is Standard_True

Returns
-------
None
") ComputeSensitive;
		static void ComputeSensitive(const TopoDS_Shape & theShape, const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const opencascade::handle<SelectMgr_Selection> & theSelection, const Standard_Real theDeflection, const Standard_Real theDeflAngle, const Standard_Integer theNbPOnEdge, const Standard_Real theMaxiParam, const Standard_Boolean theAutoTriang = Standard_True);

		/****************** GetEdgeSensitive ******************/
		/**** md5 signature: 60efc4b0470e1680eb7febd4c2b6e11a ****/
		%feature("compactdefaultargs") GetEdgeSensitive;
		%feature("autodoc", "Create a sensitive edge or sensitive wire. @param theshape either topods_edge or topods_wire to compute sensitive entities @param theowner selectable owner object @param theselection selection to append new sensitive entities @param thedeflection linear deflection @param thedeviationangle angular deflection @param thenbponedge sensitivity parameters @param themaxiparam sensitivity parameters.

Parameters
----------
theShape: TopoDS_Shape
theOwner: SelectMgr_EntityOwner
theSelection: SelectMgr_Selection
theDeflection: float
theDeviationAngle: float
theNbPOnEdge: int
theMaxiParam: float
theSensitive: Select3D_SensitiveEntity

Returns
-------
None
") GetEdgeSensitive;
		static void GetEdgeSensitive(const TopoDS_Shape & theShape, const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const opencascade::handle<SelectMgr_Selection> & theSelection, const Standard_Real theDeflection, const Standard_Real theDeviationAngle, const Standard_Integer theNbPOnEdge, const Standard_Real theMaxiParam, opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****************** GetSensitiveForFace ******************/
		/**** md5 signature: 2642b35a3a997e099ba05a1cdd42764e ****/
		%feature("compactdefaultargs") GetSensitiveForFace;
		%feature("autodoc", "Creates the 3d sensitive entities for face selection. @param theface face to compute sensitive entities @param theowner selectable owner object @param theoutlist output result list to append created entities @param theautotriang obsolete flag (has no effect) @param thenbponedge sensitivity parameters @param themaxiparam sensitivity parameters @param theinteriorflag flag indicating that face interior (true) or face boundary (false) should be selectable.

Parameters
----------
theFace: TopoDS_Face
theOwner: SelectMgr_EntityOwner
theOutList: Select3D_EntitySequence
theAutoTriang: bool,optional
	default value is Standard_True
theNbPOnEdge: int,optional
	default value is 9
theMaxiParam: float,optional
	default value is 500
theInteriorFlag: bool,optional
	default value is Standard_True

Returns
-------
bool
") GetSensitiveForFace;
		static Standard_Boolean GetSensitiveForFace(const TopoDS_Face & theFace, const opencascade::handle<SelectMgr_EntityOwner> & theOwner, Select3D_EntitySequence & theOutList, const Standard_Boolean theAutoTriang = Standard_True, const Standard_Integer theNbPOnEdge = 9, const Standard_Real theMaxiParam = 500, const Standard_Boolean theInteriorFlag = Standard_True);

		/****************** GetStandardPriority ******************/
		/**** md5 signature: 77ab177df5825b7d3b523657ebdeff33 ****/
		%feature("compactdefaultargs") GetStandardPriority;
		%feature("autodoc", "Returns the standard priority of the shape ashap having the type atype. this priority is passed to a stdselect_brepowner object. you can use the function load to modify the selection priority of an owner to make one entity more selectable than another one.

Parameters
----------
theShape: TopoDS_Shape
theType: TopAbs_ShapeEnum

Returns
-------
int
") GetStandardPriority;
		static Standard_Integer GetStandardPriority(const TopoDS_Shape & theShape, const TopAbs_ShapeEnum theType);

		/****************** Load ******************/
		/**** md5 signature: 8477e5de75530f0506e55281cd6bdad4 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Decomposition of <ashape> into sensitive entities following a mode of decomposition <atype>. these entities are stored in <aselection>. brepowners are created to store the identity of the picked shapes during the selection process. in those brepowners is also stored the original shape. but one can't get the selectable object which was decomposed to give the sensitive entities. maximal parameter is used for infinite objects, to limit the sensitive domain.... if autotriangulation = true, a triangulation will be computed for faces which have no existing one. if autotriangulation = false the old algorithm will be called to compute sensitive entities on faces.

Parameters
----------
aSelection: SelectMgr_Selection
aShape: TopoDS_Shape
aType: TopAbs_ShapeEnum
theDeflection: float
theDeviationAngle: float
AutoTriangulation: bool,optional
	default value is Standard_True
aPriority: int,optional
	default value is -1
NbPOnEdge: int,optional
	default value is 9
MaximalParameter: float,optional
	default value is 500

Returns
-------
None
") Load;
		static void Load(const opencascade::handle<SelectMgr_Selection> & aSelection, const TopoDS_Shape & aShape, const TopAbs_ShapeEnum aType, const Standard_Real theDeflection, const Standard_Real theDeviationAngle, const Standard_Boolean AutoTriangulation = Standard_True, const Standard_Integer aPriority = -1, const Standard_Integer NbPOnEdge = 9, const Standard_Real MaximalParameter = 500);

		/****************** Load ******************/
		/**** md5 signature: 00cf72412f1de1b90a4446a128411b90 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Same functionnalities ; the only difference is that the selectable object from which the selection comes is stored in each sensitive entityowner; decomposition of <ashape> into sensitive entities following a mode of decomposition <atype>. these entities are stored in <aselection> the major difference is that the known users are first inserted in the brepowners. the original shape is the last user... (see entityowner from selectbasics and brepowner)...

Parameters
----------
aSelection: SelectMgr_Selection
Origin: SelectMgr_SelectableObject
aShape: TopoDS_Shape
aType: TopAbs_ShapeEnum
theDeflection: float
theDeviationAngle: float
AutoTriangulation: bool,optional
	default value is Standard_True
aPriority: int,optional
	default value is -1
NbPOnEdge: int,optional
	default value is 9
MaximalParameter: float,optional
	default value is 500

Returns
-------
None
") Load;
		static void Load(const opencascade::handle<SelectMgr_Selection> & aSelection, const opencascade::handle<SelectMgr_SelectableObject> & Origin, const TopoDS_Shape & aShape, const TopAbs_ShapeEnum aType, const Standard_Real theDeflection, const Standard_Real theDeviationAngle, const Standard_Boolean AutoTriangulation = Standard_True, const Standard_Integer aPriority = -1, const Standard_Integer NbPOnEdge = 9, const Standard_Real MaximalParameter = 500);

		/****************** PreBuildBVH ******************/
		/**** md5 signature: ecf8f08d53cd37c0f9916bd367b2cda3 ****/
		%feature("compactdefaultargs") PreBuildBVH;
		%feature("autodoc", "Traverses the selection given and pre-builds bvh trees for heavyweight sensitive entities containing more than bvh_primitive_limit (defined in .cxx file) sub-elements.

Parameters
----------
theSelection: SelectMgr_Selection

Returns
-------
None
") PreBuildBVH;
		static void PreBuildBVH(const opencascade::handle<SelectMgr_Selection> & theSelection);

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
		/****************** StdSelect_EdgeFilter ******************/
		/**** md5 signature: e4775650662884361932e4cff149e05f ****/
		%feature("compactdefaultargs") StdSelect_EdgeFilter;
		%feature("autodoc", "Constructs an edge filter object defined by the type of edge edge.

Parameters
----------
Edge: StdSelect_TypeOfEdge

Returns
-------
None
") StdSelect_EdgeFilter;
		 StdSelect_EdgeFilter(const StdSelect_TypeOfEdge Edge);

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

		/****************** IsOk ******************/
		/**** md5 signature: 30e74b6ea22a70db5324b6f796325694 ****/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "No available documentation.

Parameters
----------
anobj: SelectMgr_EntityOwner

Returns
-------
bool
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

		/****************** SetType ******************/
		/**** md5 signature: 9ff2a941f7efaa209126e59324fff4c9 ****/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "Sets the type of edge anewtype. anewtype is to be highlighted in selection.

Parameters
----------
aNewType: StdSelect_TypeOfEdge

Returns
-------
None
") SetType;
		void SetType(const StdSelect_TypeOfEdge aNewType);

		/****************** Type ******************/
		/**** md5 signature: b9a5a542407499eb6b150b9bb210baed ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type of edge to be highlighted in selection.

Returns
-------
StdSelect_TypeOfEdge
") Type;
		StdSelect_TypeOfEdge Type();

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
		/****************** StdSelect_FaceFilter ******************/
		/**** md5 signature: a55d0450cb948e17b839168d8263b890 ****/
		%feature("compactdefaultargs") StdSelect_FaceFilter;
		%feature("autodoc", "Constructs a face filter object defined by the type of face atypeofface.

Parameters
----------
aTypeOfFace: StdSelect_TypeOfFace

Returns
-------
None
") StdSelect_FaceFilter;
		 StdSelect_FaceFilter(const StdSelect_TypeOfFace aTypeOfFace);

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

		/****************** IsOk ******************/
		/**** md5 signature: 30e74b6ea22a70db5324b6f796325694 ****/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "No available documentation.

Parameters
----------
anobj: SelectMgr_EntityOwner

Returns
-------
bool
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

		/****************** SetType ******************/
		/**** md5 signature: 0638cd0595471b313b288aafac7032f8 ****/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "Sets the type of face anewtype. anewtype is to be highlighted in selection.

Parameters
----------
aNewType: StdSelect_TypeOfFace

Returns
-------
None
") SetType;
		void SetType(const StdSelect_TypeOfFace aNewType);

		/****************** Type ******************/
		/**** md5 signature: 21e7cb1011c5e28655fe4b3b4d8f4eb2 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type of face to be highlighted in selection.

Returns
-------
StdSelect_TypeOfFace
") Type;
		StdSelect_TypeOfFace Type();

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
		/****************** StdSelect_Prs ******************/
		/**** md5 signature: 8caf3fbfd8fa47bd3fbd5631f225c2cd ****/
		%feature("compactdefaultargs") StdSelect_Prs;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStructureManager: Graphic3d_StructureManager

Returns
-------
None
") StdSelect_Prs;
		 StdSelect_Prs(const opencascade::handle<Graphic3d_StructureManager> & aStructureManager);

		/****************** Manager ******************/
		/**** md5 signature: 0a08a228bc1def91c35e81e77fa11554 ****/
		%feature("compactdefaultargs") Manager;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Graphic3d_StructureManager>
") Manager;
		const opencascade::handle<Graphic3d_StructureManager> & Manager();

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
		/****************** StdSelect_Shape ******************/
		/**** md5 signature: 46d5e430d7e4e7bc60ad9ed7b590adb7 ****/
		%feature("compactdefaultargs") StdSelect_Shape;
		%feature("autodoc", "No available documentation.

Parameters
----------
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer,optional
	default value is opencascade::handle<Prs3d_Drawer>()

Returns
-------
None
") StdSelect_Shape;
		 StdSelect_Shape(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer = opencascade::handle<Prs3d_Drawer>());

		/****************** Compute ******************/
		/**** md5 signature: 7a2e6142c1414b0e4f62cf86893d72b9 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPresentationManager: PrsMgr_PresentationManager3d
aPresentation: Prs3d_Presentation
aMode: int,optional
	default value is 0

Returns
-------
None
") Compute;
		void Compute(const opencascade::handle<PrsMgr_PresentationManager3d> & aPresentationManager, const opencascade::handle<Prs3d_Presentation> & aPresentation, const Standard_Integer aMode = 0);

		/****************** Compute ******************/
		/**** md5 signature: 09436ef6513347d4c96315939d8b75d5 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the presentation according to a point of view given by <aprojector>. to be used when the associated degenerated presentations have been transformed by <atrsf> which is not a pure translation. the hlr prs can't be deducted automatically warning :<atrsf> must be applied to the object to display before computation !!!.

Parameters
----------
aProjector: Prs3d_Projector
aTrsf: Geom_Transformation
aPresentation: Prs3d_Presentation

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Prs3d_Projector> & aProjector, const opencascade::handle<Geom_Transformation> & aTrsf, const opencascade::handle<Prs3d_Presentation> & aPresentation);

		/****************** Shape ******************/
		/**** md5 signature: 1058569f5d639354fedf11e73741b7df ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Shape ******************/
		/**** md5 signature: b6ccc379d64a40fe383a503374c25219 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") Shape;
		void Shape(const TopoDS_Shape & theShape);

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
		/****************** StdSelect_ShapeTypeFilter ******************/
		/**** md5 signature: 930631b428d28a84d447b9b9fae5babd ****/
		%feature("compactdefaultargs") StdSelect_ShapeTypeFilter;
		%feature("autodoc", "Constructs a filter object defined by the shape type atype.

Parameters
----------
aType: TopAbs_ShapeEnum

Returns
-------
None
") StdSelect_ShapeTypeFilter;
		 StdSelect_ShapeTypeFilter(const TopAbs_ShapeEnum aType);

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

		/****************** IsOk ******************/
		/**** md5 signature: 30e74b6ea22a70db5324b6f796325694 ****/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "No available documentation.

Parameters
----------
anobj: SelectMgr_EntityOwner

Returns
-------
bool
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

		/****************** Type ******************/
		/**** md5 signature: 3f27a65186b8053d282c2c0d8c4513b8 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type of shape selected by the filter.

Returns
-------
TopAbs_ShapeEnum
") Type;
		TopAbs_ShapeEnum Type();

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
		/****************** StdSelect_ViewerSelector3d ******************/
		/**** md5 signature: a7c4141a6ee789ee2f16677daaa6db68 ****/
		%feature("compactdefaultargs") StdSelect_ViewerSelector3d;
		%feature("autodoc", "Constructs an empty 3d selector object.

Returns
-------
None
") StdSelect_ViewerSelector3d;
		 StdSelect_ViewerSelector3d();

		/****************** ClearSensitive ******************/
		/**** md5 signature: bbfbdb95251072aaccc54e26ea15ada9 ****/
		%feature("compactdefaultargs") ClearSensitive;
		%feature("autodoc", "No available documentation.

Parameters
----------
theView: V3d_View

Returns
-------
None
") ClearSensitive;
		void ClearSensitive(const opencascade::handle<V3d_View> & theView);

		/****************** DisplaySensitive ******************/
		/**** md5 signature: 8dded899c4a255afc18ddc44c8d7a6f7 ****/
		%feature("compactdefaultargs") DisplaySensitive;
		%feature("autodoc", "Displays sensitives in view <theview>.

Parameters
----------
theView: V3d_View

Returns
-------
None
") DisplaySensitive;
		void DisplaySensitive(const opencascade::handle<V3d_View> & theView);

		/****************** DisplaySensitive ******************/
		/**** md5 signature: b1201290956c96d7a296cb8583c59abe ****/
		%feature("compactdefaultargs") DisplaySensitive;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSel: SelectMgr_Selection
theTrsf: gp_Trsf
theView: V3d_View
theToClearOthers: bool,optional
	default value is Standard_True

Returns
-------
None
") DisplaySensitive;
		void DisplaySensitive(const opencascade::handle<SelectMgr_Selection> & theSel, const gp_Trsf & theTrsf, const opencascade::handle<V3d_View> & theView, const Standard_Boolean theToClearOthers = Standard_True);

		/****************** Pick ******************/
		/**** md5 signature: 2bffaec90f889b1c8a589371f27c765d ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "Picks the sensitive entity at the pixel coordinates of the mouse <thexpix> and <theypix>. the selector looks for touched areas and owners.

Parameters
----------
theXPix: int
theYPix: int
theView: V3d_View

Returns
-------
None
") Pick;
		void Pick(const Standard_Integer theXPix, const Standard_Integer theYPix, const opencascade::handle<V3d_View> & theView);

		/****************** Pick ******************/
		/**** md5 signature: ac91d378236f4cd1507ea2ad52a93f76 ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "Picks the sensitive entity according to the minimum and maximum pixel values <thexpmin>, <theypmin>, <thexpmax> and <theypmax> defining a 2d area for selection in the 3d view aview.

Parameters
----------
theXPMin: int
theYPMin: int
theXPMax: int
theYPMax: int
theView: V3d_View

Returns
-------
None
") Pick;
		void Pick(const Standard_Integer theXPMin, const Standard_Integer theYPMin, const Standard_Integer theXPMax, const Standard_Integer theYPMax, const opencascade::handle<V3d_View> & theView);

		/****************** Pick ******************/
		/**** md5 signature: d9dd319057f3def6d1d43685fa1cdf94 ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "Pick action - input pixel values for polyline selection for selection.

Parameters
----------
thePolyline: TColgp_Array1OfPnt2d
theView: V3d_View

Returns
-------
None
") Pick;
		void Pick(const TColgp_Array1OfPnt2d & thePolyline, const opencascade::handle<V3d_View> & theView);

		/****************** PixelTolerance ******************/
		/**** md5 signature: 5b865b201c1641a73b871f7bcdb1eeb9 ****/
		%feature("compactdefaultargs") PixelTolerance;
		%feature("autodoc", "Returns the pixel tolerance.

Returns
-------
int
") PixelTolerance;
		Standard_Integer PixelTolerance();

		/****************** SetPixelTolerance ******************/
		/**** md5 signature: fda084bdc0d0a8e945d1f4e82a500297 ****/
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "Sets the pixel tolerance <thetolerance>.

Parameters
----------
theTolerance: int

Returns
-------
None
") SetPixelTolerance;
		void SetPixelTolerance(const Standard_Integer theTolerance);

		/****************** ToPixMap ******************/
		/**** md5 signature: c75f681b9842a1a990930b338f100d0b ****/
		%feature("compactdefaultargs") ToPixMap;
		%feature("autodoc", "Dump of detection results into image. this method performs axis picking for each pixel in the image and generates a color depending on picking results and selection image type. @param theimage result image, should be initialized @param theview 3d view defining camera position @param thetype type of image to define @param thepickedindex index of picked entity (1 means topmost).

Parameters
----------
theImage: Image_PixMap
theView: V3d_View
theType: StdSelect_TypeOfSelectionImage
thePickedIndex: int,optional
	default value is 1

Returns
-------
bool
") ToPixMap;
		Standard_Boolean ToPixMap(Image_PixMap & theImage, const opencascade::handle<V3d_View> & theView, const StdSelect_TypeOfSelectionImage theType, const Standard_Integer thePickedIndex = 1);

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
