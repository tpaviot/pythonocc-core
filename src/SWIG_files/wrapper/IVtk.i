/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") IVtk

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


%include IVtk_headers.i


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
typedef IVtk_IdType IVtk_PointId;
typedef NCollection_List <IVtk_PointId> IVtk_PointIdList;
typedef NCollection_List <IVtk_IdType> IVtk_ShapeIdList;
typedef Standard_Size IVtk_IdType;
typedef NCollection_List<IVtk_IShape::Handle> IVtk_ShapePtrList;
typedef IVtk_IdType IVtk_EdgeId;
typedef NCollection_Map <IVtk_IdType> IVtk_IdTypeMap;
typedef NCollection_List<IVtk_SelectionMode> IVtk_SelectionModeList;
typedef NCollection_DataMap <IVtk_IdType , IVtk_ShapeIdList> IVtk_SubShapeMap;
typedef NCollection_List <gp_XY> IVtk_Pnt2dList;
typedef IVtk_IdType IVtk_FaceId;
/* end typedefs declaration */

/* public enums */
enum IVtk_SelectionMode {
	SM_None = - 1,
	SM_Shape = 0,
	SM_Vertex = 1,
	SM_Edge = 2,
	SM_Wire = 3,
	SM_Face = 4,
	SM_Shell = 5,
	SM_Solid = 6,
	SM_CompSolid = 7,
	SM_Compound = 8,
};

enum IVtk_MeshType {
	MT_Undefined = - 1,
	MT_IsoLine = 0,
	MT_FreeVertex = 1,
	MT_SharedVertex = 2,
	MT_FreeEdge = 3,
	MT_BoundaryEdge = 4,
	MT_SharedEdge = 5,
	MT_WireFrameFace = 6,
	MT_ShadedFace = 7,
};

enum IVtk_DisplayMode {
	DM_Wireframe = 0,
	DM_Shading = 1,
};

/* end public enums declaration */

%nodefaultctor IVtk_Interface;
class IVtk_Interface : public Standard_Transient {
	public:
		%feature("compactdefaultargs") DEFINE_STANDARD_RTTI;
		%feature("autodoc", "	:param ~IVtk_Interface(:
	:type ~IVtk_Interface(: IVtk_Interface) virtual
	:rtype: None
") DEFINE_STANDARD_RTTI;
		 DEFINE_STANDARD_RTTI (IVtk_Interface) virtual ~IVtk_Interface();
};


%nodefaultctor IVtk_IShape;
class IVtk_IShape : public IVtk_Interface {
	public:
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	:rtype: IVtk_IdType
") GetId;
		IVtk_IdType GetId ();
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param theId:
	:type theId: IVtk_IdType
	:rtype: None
") SetId;
		void SetId (const IVtk_IdType theId);
		%feature("compactdefaultargs") GetSubIds;
		%feature("autodoc", "	* Get ids of sub-shapes composing a sub-shape with the given id

	:param theId:
	:type theId: IVtk_IdType
	:rtype: IVtk_ShapeIdList
") GetSubIds;
		IVtk_ShapeIdList GetSubIds (const IVtk_IdType theId);
};


%nodefaultctor IVtk_IShapeData;
class IVtk_IShapeData : public IVtk_Interface {
	public:
		%feature("compactdefaultargs") InsertVertex;
		%feature("autodoc", "	* Insert a vertex. @param [in] theShapeID id of the sub-shape to which the vertex belongs. @param [in] thePointId id of the point that defines the coordinates of the vertex @param [in] theMeshType mesh type of the sub-shape (MT_Undefined by default)

	:param theShapeID:
	:type theShapeID: IVtk_IdType
	:param thePointId:
	:type thePointId: IVtk_PointId
	:param theMeshType: default value is MT_Undefined
	:type theMeshType: IVtk_MeshType
	:rtype: None
") InsertVertex;
		void InsertVertex (const IVtk_IdType theShapeID,const IVtk_PointId thePointId,const IVtk_MeshType theMeshType = MT_Undefined);
		%feature("compactdefaultargs") InsertLine;
		%feature("autodoc", "	* Insert a line. @param [in] theShapeID id of the subshape to which the line belongs. @param [in] thePointId1 id of the first point @param [in] thePointId2 id of the second point @param [in] theMeshType mesh type of the subshape (MT_Undefined by default)

	:param theShapeID:
	:type theShapeID: IVtk_IdType
	:param thePointId1:
	:type thePointId1: IVtk_PointId
	:param thePointId2:
	:type thePointId2: IVtk_PointId
	:param theMeshType: default value is MT_Undefined
	:type theMeshType: IVtk_MeshType
	:rtype: None
") InsertLine;
		void InsertLine (const IVtk_IdType theShapeID,const IVtk_PointId thePointId1,const IVtk_PointId thePointId2,const IVtk_MeshType theMeshType = MT_Undefined);
		%feature("compactdefaultargs") InsertLine;
		%feature("autodoc", "	* Insert a poly-line. @param [in] shapeID id of the subshape to which the polyline belongs. @param [in] pointIds vector of point ids @param [in] meshType mesh type of the subshape (MT_Undefined by default)

	:param theShapeID:
	:type theShapeID: IVtk_IdType
	:param thePointIds:
	:type thePointIds: IVtk_PointIdList *
	:param theMeshType: default value is MT_Undefined
	:type theMeshType: IVtk_MeshType
	:rtype: None
") InsertLine;
		void InsertLine (const IVtk_IdType theShapeID,const IVtk_PointIdList * thePointIds,const IVtk_MeshType theMeshType = MT_Undefined);
		%feature("compactdefaultargs") InsertTriangle;
		%feature("autodoc", "	* Insert a triangle @param [in] theShapeID id of the subshape to which the triangle belongs. @param [in] thePointId1 id of the first point @param [in] thePointId2 id of the second point @param [in] thePointId3 id of the third point @param [in] theMeshType mesh type of the subshape (MT_Undefined by default)

	:param theShapeID:
	:type theShapeID: IVtk_IdType
	:param thePointId1:
	:type thePointId1: IVtk_PointId
	:param thePointId2:
	:type thePointId2: IVtk_PointId
	:param thePointId3:
	:type thePointId3: IVtk_PointId
	:param theMeshType: default value is MT_Undefined
	:type theMeshType: IVtk_MeshType
	:rtype: None
") InsertTriangle;
		void InsertTriangle (const IVtk_IdType theShapeID,const IVtk_PointId thePointId1,const IVtk_PointId thePointId2,const IVtk_PointId thePointId3,const IVtk_MeshType theMeshType = MT_Undefined);
};


%nodefaultctor IVtk_IShapeMesher;
class IVtk_IShapeMesher : public IVtk_Interface {
	public:
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	:param theShape:
	:type theShape: IVtk_IShape::Handle &
	:param theData:
	:type theData: IVtk_IShapeData::Handle &
	:rtype: None
") Build;
		void Build (const IVtk_IShape::Handle & theShape,const IVtk_IShapeData::Handle & theData);
};


%nodefaultctor IVtk_IShapePickerAlgo;
class IVtk_IShapePickerAlgo : public IVtk_Interface {
	public:
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	:rtype: None
") Modified;
		void Modified ();
		%feature("compactdefaultargs") NbPicked;
		%feature("autodoc", "	:rtype: int
") NbPicked;
		int NbPicked ();
		%feature("compactdefaultargs") GetSelectionModes;
		%feature("autodoc", "	* Get activated selection modes for a shape. @param [in] theShape a shape with activated selection mode(s) returns list of active selection modes

	:param theShape:
	:type theShape: IVtk_IShape::Handle &
	:rtype: IVtk_SelectionModeList
") GetSelectionModes;
		IVtk_SelectionModeList GetSelectionModes (const IVtk_IShape::Handle & theShape);
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "	* Activates/deactivates the given selection mode for the shape. If mode == SM_None, the shape becomes non-selectable and is removed from the internal selection data. @param [in] theShape Shape for which the selection mode should be activated @param [in] theMode Selection mode to be activated @param [in] theIsTurnOn Flag to turn on/off the selection mode

	:param theShape:
	:type theShape: IVtk_IShape::Handle &
	:param theMode:
	:type theMode: IVtk_SelectionMode
	:param theIsTurnOn: default value is true
	:type theIsTurnOn: bool
	:rtype: None
") SetSelectionMode;
		void SetSelectionMode (const IVtk_IShape::Handle & theShape,const IVtk_SelectionMode theMode,const bool theIsTurnOn = true);
		%feature("compactdefaultargs") SetSelectionMode;
		%feature("autodoc", "	* Activates/deactivates the given selection mode for the shape. If mode == SM_None, the shape becomes non-selectable and is removed from the internal selection data. @param [in] theShapes List of shapes for which the selection mode should be activated @param [in] theMode Selection mode to be activated @param [in] theIsTurnOn Flag to turn on/off the selection mode

	:param theShapes:
	:type theShapes: IVtk_ShapePtrList &
	:param theMode:
	:type theMode: IVtk_SelectionMode
	:param theIsTurnOn: default value is true
	:type theIsTurnOn: bool
	:rtype: None
") SetSelectionMode;
		void SetSelectionMode (const IVtk_ShapePtrList & theShapes,const IVtk_SelectionMode theMode,const bool theIsTurnOn = true);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	:param theX:
	:type theX: double
	:param theY:
	:type theY: double
	:rtype: bool
") Pick;
		bool Pick (const double theX,const double theY);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	:param theXMin:
	:type theXMin: double
	:param theYMin:
	:type theYMin: double
	:param theXMax:
	:type theXMax: double
	:param theYMax:
	:type theYMax: double
	:rtype: bool
") Pick;
		bool Pick (const double theXMin,const double theYMin,const double theXMax,const double theYMax);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	:param :
	:type : double * *
	:param theNbPoints:
	:type theNbPoints: int
	:rtype: bool
") Pick;
		bool Pick (double * * ,const int theNbPoints);
		%feature("compactdefaultargs") ShapesPicked;
		%feature("autodoc", "	* returns the list of picked top-level shape IDs, in the order of increasing depth (the ID of the shape closest to the eye is the first in the list)

	:rtype: IVtk_ShapeIdList
") ShapesPicked;
		const IVtk_ShapeIdList & ShapesPicked ();
		%feature("compactdefaultargs") SubShapesPicked;
		%feature("autodoc", "	* @param [in] theId Top-level shape ID @param [out] theShapeList the list of picked sub-shape IDs for the given top-level shape ID, in the order of increasing depth (the ID of the sub-shape closest to the eye is the first in the list)

	:param theId:
	:type theId: IVtk_IdType
	:param theShapeList:
	:type theShapeList: IVtk_ShapeIdList &
	:rtype: None
") SubShapesPicked;
		void SubShapesPicked (const IVtk_IdType theId,IVtk_ShapeIdList & theShapeList);
};


%nodefaultctor IVtk_IView;
class IVtk_IView : public IVtk_Interface {
	public:
		%feature("compactdefaultargs") IsPerspective;
		%feature("autodoc", "	* returns true if this is a perspective view, and false otherwise.

	:rtype: bool
") IsPerspective;
		bool IsPerspective ();
		%feature("compactdefaultargs") GetDistance;
		%feature("autodoc", "	* returns The focal distance of the view

	:rtype: double
") GetDistance;
		double GetDistance ();
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "	* returns The world coordinates of the view position

	:param theX:
	:type theX: double &
	:param theY:
	:type theY: double &
	:param theZ:
	:type theZ: double &
	:rtype: None
") GetPosition;
		void GetPosition (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetViewUp;
		%feature("autodoc", "	* returns The 'view up' direction of the view

	:param theDx:
	:type theDx: double &
	:param theDy:
	:type theDy: double &
	:param theDz:
	:type theDz: double &
	:rtype: None
") GetViewUp;
		void GetViewUp (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetDirectionOfProjection;
		%feature("autodoc", "	* returns The projection direction vector of this view

	:param theDx:
	:type theDx: double &
	:param theDy:
	:type theDy: double &
	:param theDz:
	:type theDz: double &
	:rtype: None
") GetDirectionOfProjection;
		void GetDirectionOfProjection (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetScale;
		%feature("autodoc", "	* returns Three doubles contaning scale components of the view transformation

	:param theX:
	:type theX: double &
	:param theY:
	:type theY: double &
	:param theZ:
	:type theZ: double &
	:rtype: None
") GetScale;
		void GetScale (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetParallelScale;
		%feature("autodoc", "	* returns The current view's zoom factor (for parallel projection)

	:rtype: double
") GetParallelScale;
		double GetParallelScale ();
		%feature("compactdefaultargs") GetViewAngle;
		%feature("autodoc", "	* returns The current view angle (for perspective projection)

	:rtype: double
") GetViewAngle;
		double GetViewAngle ();
		%feature("compactdefaultargs") GetViewCenter;
		%feature("autodoc", "	* returns Two doubles containing the display coordinates of the view window center

	:param theX:
	:type theX: double &
	:param theY:
	:type theY: double &
	:rtype: None
") GetViewCenter;
		void GetViewCenter (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") DisplayToWorld;
		%feature("autodoc", "	* Converts 3D display coordinates into 3D world coordinates. @param [in] theDisplayPnt 2d point of display coordinates @param [out] theWorldPnt 3d point of world coordinates returns true if conversion was successful, false otherwise

	:param theDisplayPnt:
	:type theDisplayPnt: gp_XY
	:param theWorldPnt:
	:type theWorldPnt: gp_XYZ
	:rtype: bool
") DisplayToWorld;
		bool DisplayToWorld (const gp_XY & theDisplayPnt,gp_XYZ & theWorldPnt);
};


