/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stdselect.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<TopTools_module.hxx>
#include<TopAbs_module.hxx>
#include<Bnd_module.hxx>
#include<TShort_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Poly_module.hxx>
#include<TopTools_module.hxx>
#include<Quantity_module.hxx>
#include<TopTools_module.hxx>
#include<Message_module.hxx>
#include<Media_module.hxx>
#include<BRep_module.hxx>
#include<Geom2d_module.hxx>
#include<StdPrs_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Graphic3d_module.hxx>
#include<Geom_module.hxx>
#include<Aspect_module.hxx>
#include<AIS_module.hxx>
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
%import TopTools.i
%import TopAbs.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum StdSelect_TypeOfEdge {
	StdSelect_AnyEdge = 0,
	StdSelect_Line = 1,
	StdSelect_Circle = 2,
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

enum StdSelect_TypeOfSelectionImage {
	StdSelect_TypeOfSelectionImage_NormalizedDepth = 0,
	StdSelect_TypeOfSelectionImage_NormalizedDepthInverted = 1,
	StdSelect_TypeOfSelectionImage_UnnormalizedDepth = 2,
	StdSelect_TypeOfSelectionImage_ColoredDetectedObject = 3,
	StdSelect_TypeOfSelectionImage_ColoredEntity = 4,
	StdSelect_TypeOfSelectionImage_ColoredEntityType = 5,
	StdSelect_TypeOfSelectionImage_ColoredOwner = 6,
	StdSelect_TypeOfSelectionImage_ColoredSelectionMode = 7,
	StdSelect_TypeOfSelectionImage_SurfaceNormal = 8,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class StdSelect_TypeOfEdge(IntEnum):
	StdSelect_AnyEdge = 0
	StdSelect_Line = 1
	StdSelect_Circle = 2
StdSelect_AnyEdge = StdSelect_TypeOfEdge.StdSelect_AnyEdge
StdSelect_Line = StdSelect_TypeOfEdge.StdSelect_Line
StdSelect_Circle = StdSelect_TypeOfEdge.StdSelect_Circle

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

class StdSelect_TypeOfSelectionImage(IntEnum):
	StdSelect_TypeOfSelectionImage_NormalizedDepth = 0
	StdSelect_TypeOfSelectionImage_NormalizedDepthInverted = 1
	StdSelect_TypeOfSelectionImage_UnnormalizedDepth = 2
	StdSelect_TypeOfSelectionImage_ColoredDetectedObject = 3
	StdSelect_TypeOfSelectionImage_ColoredEntity = 4
	StdSelect_TypeOfSelectionImage_ColoredEntityType = 5
	StdSelect_TypeOfSelectionImage_ColoredOwner = 6
	StdSelect_TypeOfSelectionImage_ColoredSelectionMode = 7
	StdSelect_TypeOfSelectionImage_SurfaceNormal = 8
StdSelect_TypeOfSelectionImage_NormalizedDepth = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_NormalizedDepth
StdSelect_TypeOfSelectionImage_NormalizedDepthInverted = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_NormalizedDepthInverted
StdSelect_TypeOfSelectionImage_UnnormalizedDepth = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_UnnormalizedDepth
StdSelect_TypeOfSelectionImage_ColoredDetectedObject = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_ColoredDetectedObject
StdSelect_TypeOfSelectionImage_ColoredEntity = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_ColoredEntity
StdSelect_TypeOfSelectionImage_ColoredEntityType = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_ColoredEntityType
StdSelect_TypeOfSelectionImage_ColoredOwner = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_ColoredOwner
StdSelect_TypeOfSelectionImage_ColoredSelectionMode = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_ColoredSelectionMode
StdSelect_TypeOfSelectionImage_SurfaceNormal = StdSelect_TypeOfSelectionImage.StdSelect_TypeOfSelectionImage_SurfaceNormal
};
/* end python proxy for enums */

/* handles */
%wrap_handle(StdSelect_BRepOwner)
%wrap_handle(StdSelect_EdgeFilter)
%wrap_handle(StdSelect_FaceFilter)
%wrap_handle(StdSelect_Shape)
%wrap_handle(StdSelect_ShapeTypeFilter)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************
* class StdSelect *
******************/
%rename(stdselect) StdSelect;
class StdSelect {
	public:
		/****** StdSelect::SetDrawerForBRepOwner ******/
		/****** md5 signature: 28622687f408d38c4fc3d96636f33dc6 ******/
		%feature("compactdefaultargs") SetDrawerForBRepOwner;
		%feature("autodoc", "
Parameters
----------
aSelection: SelectMgr_Selection
aDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
puts The same drawer in every BRepOwner Of SensitivePrimitive Used Only for hilight Of BRepOwner...
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
		/****** StdSelect_BRepOwner::StdSelect_BRepOwner ******/
		/****** md5 signature: 8773fa00a4c8a623aa2ca3b6dfcf84c7 ******/
		%feature("compactdefaultargs") StdSelect_BRepOwner;
		%feature("autodoc", "
Parameters
----------
aPriority: int

Return
-------
None

Description
-----------
Constructs an owner specification framework defined by the priority aPriority.
") StdSelect_BRepOwner;
		 StdSelect_BRepOwner(const Standard_Integer aPriority);

		/****** StdSelect_BRepOwner::StdSelect_BRepOwner ******/
		/****** md5 signature: 91bc847f9d2053dee291e35c09dd4779 ******/
		%feature("compactdefaultargs") StdSelect_BRepOwner;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aPriority: int (optional, default to 0)
ComesFromDecomposition: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs an owner specification framework defined by the shape aShape and the priority aPriority. aShape and aPriority are stored in this framework. If more than one owner are detected during dynamic selection, the one with the highest priority is the one stored.
") StdSelect_BRepOwner;
		 StdSelect_BRepOwner(const TopoDS_Shape & aShape, const Standard_Integer aPriority = 0, const Standard_Boolean ComesFromDecomposition = Standard_False);

		/****** StdSelect_BRepOwner::StdSelect_BRepOwner ******/
		/****** md5 signature: 29703b0feb28228ed28f51236ea3f6ec ******/
		%feature("compactdefaultargs") StdSelect_BRepOwner;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
theOrigin: SelectMgr_SelectableObject
aPriority: int (optional, default to 0)
FromDecomposition: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs an owner specification framework defined by the shape aShape, the selectable object theOrigin and the priority aPriority. aShape, theOrigin and aPriority are stored in this framework. If more than one owner are detected during dynamic selection, the one with the highest priority is the one stored.
") StdSelect_BRepOwner;
		 StdSelect_BRepOwner(const TopoDS_Shape & aShape, const opencascade::handle<SelectMgr_SelectableObject> & theOrigin, const Standard_Integer aPriority = 0, const Standard_Boolean FromDecomposition = Standard_False);

		/****** StdSelect_BRepOwner::Clear ******/
		/****** md5 signature: c601f9124e5aa6653d81cfc353a6cbdf ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
aPM: PrsMgr_PresentationManager
aMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Clears the presentation manager object aPM of all shapes with the selection mode aMode.
") Clear;
		virtual void Clear(const opencascade::handle<PrsMgr_PresentationManager> & aPM, const Standard_Integer aMode = 0);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** StdSelect_BRepOwner::HasHilightMode ******/
		/****** md5 signature: 35c4cc36b9d1287cbb8be9209c167aef ******/
		%feature("compactdefaultargs") HasHilightMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this framework has a highlight mode defined for it.
") HasHilightMode;
		Standard_Boolean HasHilightMode();

		/****** StdSelect_BRepOwner::HasShape ******/
		/****** md5 signature: fd039c2e20d8353da74f37a8ffea2aaf ******/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if no shape was set.
") HasShape;
		Standard_Boolean HasShape();

		/****** StdSelect_BRepOwner::HilightMode ******/
		/****** md5 signature: 65e4b0407fae3cd6d737aa6b7e74bfa0 ******/
		%feature("compactdefaultargs") HilightMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the highlight mode for this framework. This defines the type of display used to highlight the owner of the shape when it is detected by the selector. The default type of display is wireframe, defined by the index 0.
") HilightMode;
		Standard_Integer HilightMode();

		/****** StdSelect_BRepOwner::HilightWithColor ******/
		/****** md5 signature: ff872ded3a30d3b368f40f78eef3d5d8 ******/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theMode: int

Return
-------
None

Description
-----------
No available documentation.
") HilightWithColor;
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode);

		/****** StdSelect_BRepOwner::IsHilighted ******/
		/****** md5 signature: 19f129c3adba382b625d88256f1470cb ******/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "
Parameters
----------
aPM: PrsMgr_PresentationManager
aMode: int (optional, default to 0)

Return
-------
bool

Description
-----------
Returns true if an object with the selection mode aMode is highlighted in the presentation manager aPM.
") IsHilighted;
		virtual Standard_Boolean IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & aPM, const Standard_Integer aMode = 0);

		/****** StdSelect_BRepOwner::ResetHilightMode ******/
		/****** md5 signature: dc7107c584de9b0874ed480d1bc34a60 ******/
		%feature("compactdefaultargs") ResetHilightMode;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets the higlight mode for this framework. This defines the type of display used to highlight the owner of the shape when it is detected by the selector. The default type of display is wireframe, defined by the index 0.
") ResetHilightMode;
		void ResetHilightMode();

		/****** StdSelect_BRepOwner::SetHilightMode ******/
		/****** md5 signature: e2eeb5d16bea7d1c9cb04b72dce3668c ******/
		%feature("compactdefaultargs") SetHilightMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
Sets the highlight mode for this framework. This defines the type of display used to highlight the owner of the shape when it is detected by the selector. The default type of display is wireframe, defined by the index 0.
") SetHilightMode;
		void SetHilightMode(const Standard_Integer theMode);

		/****** StdSelect_BRepOwner::SetLocation ******/
		/****** md5 signature: d7a193afcb3b08815e792796d7dcb913 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
aLoc: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") SetLocation;
		virtual void SetLocation(const TopLoc_Location & aLoc);

		/****** StdSelect_BRepOwner::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the shape.
") Shape;
		const TopoDS_Shape Shape();

		/****** StdSelect_BRepOwner::Unhilight ******/
		/****** md5 signature: a1b62fcc891d4ccc3641ae435e157664 ******/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "
Parameters
----------
aPM: PrsMgr_PresentationManager
aMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Removes highlighting from the type of shape identified the selection mode aMode in the presentation manager aPM.
") Unhilight;
		virtual void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & aPM, const Standard_Integer aMode = 0);

		/****** StdSelect_BRepOwner::UpdateHighlightTrsf ******/
		/****** md5 signature: 5cda4347f3f81c378d7a079e96459f5e ******/
		%feature("compactdefaultargs") UpdateHighlightTrsf;
		%feature("autodoc", "
Parameters
----------
theViewer: V3d_Viewer
theManager: PrsMgr_PresentationManager
theDispMode: int

Return
-------
None

Description
-----------
Implements immediate application of location transformation of parent object to dynamic highlight structure.
") UpdateHighlightTrsf;
		virtual void UpdateHighlightTrsf(const opencascade::handle<V3d_Viewer> & theViewer, const opencascade::handle<PrsMgr_PresentationManager> & theManager, const Standard_Integer theDispMode);

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
		/****** StdSelect_BRepSelectionTool::ComputeSensitive ******/
		/****** md5 signature: 80156af8bd1629db930e94f1fa305511 ******/
		%feature("compactdefaultargs") ComputeSensitive;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theOwner: SelectMgr_EntityOwner
theSelection: SelectMgr_Selection
theDeflection: float
theDeflAngle: float
theNbPOnEdge: int
theMaxiParam: float
theAutoTriang: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Computes the sensitive primitives, stores them in the SelectMgr_Selection object, and returns this object. 
Input parameter: theShape shape to compute sensitive entities 
Input parameter: theOwner selectable owner object 
Input parameter: theSelection selection to append new sensitive entities 
Input parameter: theDeflection linear deflection 
Input parameter: theDeflAngle angular deflection 
Input parameter: theNbPOnEdge sensitivity parameters for edges and wires 
Input parameter: theMaxiParam sensitivity parameters for infinite objects (the default value is 500) 
Input parameter: theAutoTriang flag to compute triangulation for the faces which have none.
") ComputeSensitive;
		static void ComputeSensitive(const TopoDS_Shape & theShape, const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const opencascade::handle<SelectMgr_Selection> & theSelection, const Standard_Real theDeflection, const Standard_Real theDeflAngle, const Standard_Integer theNbPOnEdge, const Standard_Real theMaxiParam, const Standard_Boolean theAutoTriang = Standard_True);

		/****** StdSelect_BRepSelectionTool::GetEdgeSensitive ******/
		/****** md5 signature: 60efc4b0470e1680eb7febd4c2b6e11a ******/
		%feature("compactdefaultargs") GetEdgeSensitive;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Create a sensitive edge or sensitive wire. 
Input parameter: theShape either TopoDS_Edge or TopoDS_Wire to compute sensitive entities 
Input parameter: theOwner selectable owner object 
Input parameter: theSelection selection to append new sensitive entities 
Input parameter: theDeflection linear deflection 
Input parameter: theDeviationAngle angular deflection 
Input parameter: theNbPOnEdge sensitivity parameters @param[out] theMaxiParam sensitivity parameters.
") GetEdgeSensitive;
		static void GetEdgeSensitive(const TopoDS_Shape & theShape, const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const opencascade::handle<SelectMgr_Selection> & theSelection, const Standard_Real theDeflection, const Standard_Real theDeviationAngle, const Standard_Integer theNbPOnEdge, const Standard_Real theMaxiParam, opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****** StdSelect_BRepSelectionTool::GetSensitiveForCylinder ******/
		/****** md5 signature: eac39b3b0583dbd2fd17b15718b9faca ******/
		%feature("compactdefaultargs") GetSensitiveForCylinder;
		%feature("autodoc", "
Parameters
----------
theSubfacesMap: TopTools_IndexedMapOfShape
theOwner: SelectMgr_EntityOwner
theSelection: SelectMgr_Selection

Return
-------
bool

Description
-----------
Creates a sensitive cylinder. 
Input parameter: theSubfacesMap map of cylinder faces 
Input parameter: theOwner selectable owner object 
Input parameter: theSelection selection to append new sensitive entities.
") GetSensitiveForCylinder;
		static Standard_Boolean GetSensitiveForCylinder(const TopTools_IndexedMapOfShape & theSubfacesMap, const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const opencascade::handle<SelectMgr_Selection> & theSelection);

		/****** StdSelect_BRepSelectionTool::GetSensitiveForFace ******/
		/****** md5 signature: 2642b35a3a997e099ba05a1cdd42764e ******/
		%feature("compactdefaultargs") GetSensitiveForFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theOwner: SelectMgr_EntityOwner
theOutList: Select3D_EntitySequence
theAutoTriang: bool (optional, default to Standard_True)
theNbPOnEdge: int (optional, default to 9)
theMaxiParam: float (optional, default to 500)
theInteriorFlag: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Creates the 3D sensitive entities for Face selection. 
Input parameter: theFace face to compute sensitive entities 
Input parameter: theOwner selectable owner object @param[out] theOutList output result list to append created entities 
Input parameter: theAutoTriang obsolete flag (has no effect) 
Input parameter: theNbPOnEdge sensitivity parameters 
Input parameter: theMaxiParam sensitivity parameters 
Input parameter: theInteriorFlag flag indicating that face interior (True) or face boundary (False) should be selectable.
") GetSensitiveForFace;
		static Standard_Boolean GetSensitiveForFace(const TopoDS_Face & theFace, const opencascade::handle<SelectMgr_EntityOwner> & theOwner, Select3D_EntitySequence & theOutList, const Standard_Boolean theAutoTriang = Standard_True, const Standard_Integer theNbPOnEdge = 9, const Standard_Real theMaxiParam = 500, const Standard_Boolean theInteriorFlag = Standard_True);

		/****** StdSelect_BRepSelectionTool::GetStandardPriority ******/
		/****** md5 signature: 77ab177df5825b7d3b523657ebdeff33 ******/
		%feature("compactdefaultargs") GetStandardPriority;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theType: TopAbs_ShapeEnum

Return
-------
int

Description
-----------
Returns the standard priority of the shape aShap having the type aType. This priority is passed to a StdSelect_BRepOwner object. You can use the function Load to modify the selection priority of an owner to make one entity more selectable than another one.
") GetStandardPriority;
		static Standard_Integer GetStandardPriority(const TopoDS_Shape & theShape, const TopAbs_ShapeEnum theType);

		/****** StdSelect_BRepSelectionTool::Load ******/
		/****** md5 signature: 8477e5de75530f0506e55281cd6bdad4 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
aSelection: SelectMgr_Selection
aShape: TopoDS_Shape
aType: TopAbs_ShapeEnum
theDeflection: float
theDeviationAngle: float
AutoTriangulation: bool (optional, default to Standard_True)
aPriority: int (optional, default to -1)
NbPOnEdge: int (optional, default to 9)
MaximalParameter: float (optional, default to 500)

Return
-------
None

Description
-----------
Decomposition of <aShape> into sensitive entities following a mode of decomposition <aType>. These entities are stored in <aSelection>. BrepOwners are created to store the identity of the picked shapes during the selection process. In those BRepOwners is also stored the original shape. But One can't get the selectable object which was decomposed to give the sensitive entities. maximal parameter is used for infinite objects, to limit the sensitive Domain.... If AutoTriangulation = True, a Triangulation will be computed for faces which have no existing one. if AutoTriangulation = False the old algorithm will be called to compute sensitive entities on faces.
") Load;
		static void Load(const opencascade::handle<SelectMgr_Selection> & aSelection, const TopoDS_Shape & aShape, const TopAbs_ShapeEnum aType, const Standard_Real theDeflection, const Standard_Real theDeviationAngle, const Standard_Boolean AutoTriangulation = Standard_True, const Standard_Integer aPriority = -1, const Standard_Integer NbPOnEdge = 9, const Standard_Real MaximalParameter = 500);

		/****** StdSelect_BRepSelectionTool::Load ******/
		/****** md5 signature: 00cf72412f1de1b90a4446a128411b90 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
aSelection: SelectMgr_Selection
Origin: SelectMgr_SelectableObject
aShape: TopoDS_Shape
aType: TopAbs_ShapeEnum
theDeflection: float
theDeviationAngle: float
AutoTriangulation: bool (optional, default to Standard_True)
aPriority: int (optional, default to -1)
NbPOnEdge: int (optional, default to 9)
MaximalParameter: float (optional, default to 500)

Return
-------
None

Description
-----------
Same functionalities ; the only difference is that the selectable object from which the selection comes is stored in each Sensitive EntityOwner; decomposition of <aShape> into sensitive entities following a mode of decomposition <aType>. These entities are stored in <aSelection> The Major difference is that the known users are first inserted in the BRepOwners. the original shape is the last user... (see EntityOwner from SelectBasics and BrepOwner)...
") Load;
		static void Load(const opencascade::handle<SelectMgr_Selection> & aSelection, const opencascade::handle<SelectMgr_SelectableObject> & Origin, const TopoDS_Shape & aShape, const TopAbs_ShapeEnum aType, const Standard_Real theDeflection, const Standard_Real theDeviationAngle, const Standard_Boolean AutoTriangulation = Standard_True, const Standard_Integer aPriority = -1, const Standard_Integer NbPOnEdge = 9, const Standard_Real MaximalParameter = 500);

		/****** StdSelect_BRepSelectionTool::PreBuildBVH ******/
		/****** md5 signature: ecf8f08d53cd37c0f9916bd367b2cda3 ******/
		%feature("compactdefaultargs") PreBuildBVH;
		%feature("autodoc", "
Parameters
----------
theSelection: SelectMgr_Selection

Return
-------
None

Description
-----------
Traverses the selection given and pre-builds BVH trees for heavyweight sensitive entities containing more than BVH_PRIMITIVE_LIMIT (defined in .cxx file) sub-elements.
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
		/****** StdSelect_EdgeFilter::StdSelect_EdgeFilter ******/
		/****** md5 signature: e4775650662884361932e4cff149e05f ******/
		%feature("compactdefaultargs") StdSelect_EdgeFilter;
		%feature("autodoc", "
Parameters
----------
Edge: StdSelect_TypeOfEdge

Return
-------
None

Description
-----------
Constructs an edge filter object defined by the type of edge Edge.
") StdSelect_EdgeFilter;
		 StdSelect_EdgeFilter(const StdSelect_TypeOfEdge Edge);

		/****** StdSelect_EdgeFilter::ActsOn ******/
		/****** md5 signature: 82ed0e718f9bead84301083a624d455d ******/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "
Parameters
----------
aStandardMode: TopAbs_ShapeEnum

Return
-------
bool

Description
-----------
No available documentation.
") ActsOn;
		virtual Standard_Boolean ActsOn(const TopAbs_ShapeEnum aStandardMode);

		/****** StdSelect_EdgeFilter::IsOk ******/
		/****** md5 signature: 30e74b6ea22a70db5324b6f796325694 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "
Parameters
----------
anobj: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
No available documentation.
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

		/****** StdSelect_EdgeFilter::SetType ******/
		/****** md5 signature: 9ff2a941f7efaa209126e59324fff4c9 ******/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "
Parameters
----------
aNewType: StdSelect_TypeOfEdge

Return
-------
None

Description
-----------
Sets the type of edge aNewType. aNewType is to be highlighted in selection.
") SetType;
		void SetType(const StdSelect_TypeOfEdge aNewType);

		/****** StdSelect_EdgeFilter::Type ******/
		/****** md5 signature: b9a5a542407499eb6b150b9bb210baed ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
StdSelect_TypeOfEdge

Description
-----------
Returns the type of edge to be highlighted in selection.
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
		/****** StdSelect_FaceFilter::StdSelect_FaceFilter ******/
		/****** md5 signature: a55d0450cb948e17b839168d8263b890 ******/
		%feature("compactdefaultargs") StdSelect_FaceFilter;
		%feature("autodoc", "
Parameters
----------
aTypeOfFace: StdSelect_TypeOfFace

Return
-------
None

Description
-----------
Constructs a face filter object defined by the type of face aTypeOfFace.
") StdSelect_FaceFilter;
		 StdSelect_FaceFilter(const StdSelect_TypeOfFace aTypeOfFace);

		/****** StdSelect_FaceFilter::ActsOn ******/
		/****** md5 signature: 82ed0e718f9bead84301083a624d455d ******/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "
Parameters
----------
aStandardMode: TopAbs_ShapeEnum

Return
-------
bool

Description
-----------
No available documentation.
") ActsOn;
		virtual Standard_Boolean ActsOn(const TopAbs_ShapeEnum aStandardMode);

		/****** StdSelect_FaceFilter::IsOk ******/
		/****** md5 signature: 30e74b6ea22a70db5324b6f796325694 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "
Parameters
----------
anobj: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
No available documentation.
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

		/****** StdSelect_FaceFilter::SetType ******/
		/****** md5 signature: 0638cd0595471b313b288aafac7032f8 ******/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "
Parameters
----------
aNewType: StdSelect_TypeOfFace

Return
-------
None

Description
-----------
Sets the type of face aNewType. aNewType is to be highlighted in selection.
") SetType;
		void SetType(const StdSelect_TypeOfFace aNewType);

		/****** StdSelect_FaceFilter::Type ******/
		/****** md5 signature: 21e7cb1011c5e28655fe4b3b4d8f4eb2 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
StdSelect_TypeOfFace

Description
-----------
Returns the type of face to be highlighted in selection.
") Type;
		StdSelect_TypeOfFace Type();

};


%make_alias(StdSelect_FaceFilter)

%extend StdSelect_FaceFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StdSelect_Shape *
************************/
class StdSelect_Shape : public PrsMgr_PresentableObject {
	public:
		/****** StdSelect_Shape::StdSelect_Shape ******/
		/****** md5 signature: 46d5e430d7e4e7bc60ad9ed7b590adb7 ******/
		%feature("compactdefaultargs") StdSelect_Shape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer (optional, default to opencascade::handle<Prs3d_Drawer>())

Return
-------
None

Description
-----------
No available documentation.
") StdSelect_Shape;
		 StdSelect_Shape(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer = opencascade::handle<Prs3d_Drawer>());

		/****** StdSelect_Shape::Compute ******/
		/****** md5 signature: f53f89fd95d4c315c88ee451ac3f4363 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
thePrs: Prs3d_Presentation
theMode: int

Return
-------
None

Description
-----------
No available documentation.
") Compute;
		virtual void Compute(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const opencascade::handle<Prs3d_Presentation> & thePrs, const Standard_Integer theMode);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** StdSelect_Shape::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****** StdSelect_Shape::Shape ******/
		/****** md5 signature: b6ccc379d64a40fe383a503374c25219 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StdSelect_ShapeTypeFilter::StdSelect_ShapeTypeFilter ******/
		/****** md5 signature: 930631b428d28a84d447b9b9fae5babd ******/
		%feature("compactdefaultargs") StdSelect_ShapeTypeFilter;
		%feature("autodoc", "
Parameters
----------
aType: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
Constructs a filter object defined by the shape type aType.
") StdSelect_ShapeTypeFilter;
		 StdSelect_ShapeTypeFilter(const TopAbs_ShapeEnum aType);

		/****** StdSelect_ShapeTypeFilter::ActsOn ******/
		/****** md5 signature: 82ed0e718f9bead84301083a624d455d ******/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "
Parameters
----------
aStandardMode: TopAbs_ShapeEnum

Return
-------
bool

Description
-----------
No available documentation.
") ActsOn;
		virtual Standard_Boolean ActsOn(const TopAbs_ShapeEnum aStandardMode);

		/****** StdSelect_ShapeTypeFilter::IsOk ******/
		/****** md5 signature: 30e74b6ea22a70db5324b6f796325694 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "
Parameters
----------
anobj: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
No available documentation.
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

		/****** StdSelect_ShapeTypeFilter::Type ******/
		/****** md5 signature: 9abae9197ed7edaf140269b2fe59aeea ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns the type of shape selected by the filter.
") Type;
		TopAbs_ShapeEnum Type();

};


%make_alias(StdSelect_ShapeTypeFilter)

%extend StdSelect_ShapeTypeFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def stdselect_SetDrawerForBRepOwner(*args):
	return stdselect.SetDrawerForBRepOwner(*args)

@deprecated
def StdSelect_BRepSelectionTool_ComputeSensitive(*args):
	return StdSelect_BRepSelectionTool.ComputeSensitive(*args)

@deprecated
def StdSelect_BRepSelectionTool_GetEdgeSensitive(*args):
	return StdSelect_BRepSelectionTool.GetEdgeSensitive(*args)

@deprecated
def StdSelect_BRepSelectionTool_GetSensitiveForCylinder(*args):
	return StdSelect_BRepSelectionTool.GetSensitiveForCylinder(*args)

@deprecated
def StdSelect_BRepSelectionTool_GetSensitiveForFace(*args):
	return StdSelect_BRepSelectionTool.GetSensitiveForFace(*args)

@deprecated
def StdSelect_BRepSelectionTool_GetStandardPriority(*args):
	return StdSelect_BRepSelectionTool.GetStandardPriority(*args)

@deprecated
def StdSelect_BRepSelectionTool_Load(*args):
	return StdSelect_BRepSelectionTool.Load(*args)

@deprecated
def StdSelect_BRepSelectionTool_Load(*args):
	return StdSelect_BRepSelectionTool.Load(*args)

@deprecated
def StdSelect_BRepSelectionTool_PreBuildBVH(*args):
	return StdSelect_BRepSelectionTool.PreBuildBVH(*args)

}
