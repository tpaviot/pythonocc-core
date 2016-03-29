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
%module (package="OCC") IVtkVTK

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


%include IVtkVTK_headers.i


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

%nodefaultctor IVtkVTK_ShapeData;
class IVtkVTK_ShapeData : public IVtk_IShapeData {
	public:
		%feature("compactdefaultargs") IVtkVTK_ShapeData;
		%feature("autodoc", "	* Constructor

	:rtype: None
") IVtkVTK_ShapeData;
		 IVtkVTK_ShapeData ();
		%feature("compactdefaultargs") DEFINE_STANDARD_RTTI;
		%feature("autodoc", "	* Insert a coordinate @param [in] theX X coordinate @param [in] theY Y coordinate @param [in] theZ Z coordinate returns id of added point

	:param InsertCoordinate(doubletheX,doubletheY,doubletheZ:
	:type InsertCoordinate(doubletheX,doubletheY,doubletheZ: IVtkVTK_ShapeData) Standard_EXPORT virtual IVtk_PointId
	:rtype: None
") DEFINE_STANDARD_RTTI;
		 DEFINE_STANDARD_RTTI (IVtkVTK_ShapeData) Standard_EXPORT virtual IVtk_PointId InsertCoordinate(doubletheX,doubletheY,doubletheZ);
		%feature("compactdefaultargs") InsertVertex;
		%feature("autodoc", "	* Insert a vertex. @param [in] theShapeID id of the subshape to which the vertex belongs. @param [in] thePointId id of the point that defines the coordinates of the vertex @param [in] theMeshType mesh type of the subshape (MT_Undefined by default)

	:param theShapeID:
	:type theShapeID: IVtk_IdType
	:param thePointId:
	:type thePointId: IVtk_PointId
	:param theMeshType:
	:type theMeshType: IVtk_MeshType
	:rtype: void
") InsertVertex;
		virtual void InsertVertex (const IVtk_IdType theShapeID,const IVtk_PointId thePointId,const IVtk_MeshType theMeshType);
		%feature("compactdefaultargs") InsertLine;
		%feature("autodoc", "	* Insert a line. @param [in] theShapeID id of the subshape to which the line belongs. @param [in] thePointId1 id of the first point @param [in] thePointId2 id of the second point @param [in] theMeshType mesh type of the subshape (MT_Undefined by default)

	:param theShapeID:
	:type theShapeID: IVtk_IdType
	:param thePointId1:
	:type thePointId1: IVtk_PointId
	:param thePointId2:
	:type thePointId2: IVtk_PointId
	:param theMeshType:
	:type theMeshType: IVtk_MeshType
	:rtype: void
") InsertLine;
		virtual void InsertLine (const IVtk_IdType theShapeID,const IVtk_PointId thePointId1,const IVtk_PointId thePointId2,const IVtk_MeshType theMeshType);
		%feature("compactdefaultargs") InsertLine;
		%feature("autodoc", "	* Insert a poly-line. @param [in] theShapeID id of the subshape to which the polyline belongs. @param [in] thePointIds vector of point ids @param [in] theMeshType mesh type of the subshape (MT_Undefined by default)

	:param theShapeID:
	:type theShapeID: IVtk_IdType
	:param thePointIds:
	:type thePointIds: IVtk_PointIdList *
	:param theMeshType:
	:type theMeshType: IVtk_MeshType
	:rtype: void
") InsertLine;
		virtual void InsertLine (const IVtk_IdType theShapeID,const IVtk_PointIdList * thePointIds,const IVtk_MeshType theMeshType);
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
	:param theMeshType:
	:type theMeshType: IVtk_MeshType
	:rtype: void
") InsertTriangle;
		virtual void InsertTriangle (const IVtk_IdType theShapeID,const IVtk_PointId thePointId1,const IVtk_PointId thePointId2,const IVtk_PointId thePointId3,const IVtk_MeshType theMeshType);
		%feature("compactdefaultargs") getVtkPolyData;
		%feature("autodoc", "	* @name Specific methods Get VTK PolyData. returns VTK PolyData

	:rtype: vtkSmartPointer< vtkPolyData>
") getVtkPolyData;
		vtkSmartPointer< vtkPolyData> getVtkPolyData ();
};


%extend IVtkVTK_ShapeData {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IVtkVTK_ShapeData(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IVtkVTK_ShapeData::Handle_IVtkVTK_ShapeData %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IVtkVTK_ShapeData;
class Handle_IVtkVTK_ShapeData : public Handle_IVtk_IShapeData {

    public:
        // constructors
        Handle_IVtkVTK_ShapeData();
        Handle_IVtkVTK_ShapeData(const Handle_IVtkVTK_ShapeData &aHandle);
        Handle_IVtkVTK_ShapeData(const IVtkVTK_ShapeData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IVtkVTK_ShapeData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IVtkVTK_ShapeData {
    IVtkVTK_ShapeData* GetObject() {
    return (IVtkVTK_ShapeData*)$self->Access();
    }
};

%nodefaultctor IVtkVTK_View;
class IVtkVTK_View : public IVtk_IView {
	public:
		%feature("compactdefaultargs") IVtkVTK_View;
		%feature("autodoc", "	:param theRenderer:
	:type theRenderer: vtkRenderer *
	:rtype: None
") IVtkVTK_View;
		 IVtkVTK_View (vtkRenderer * theRenderer);
		%feature("compactdefaultargs") IsPerspective;
		%feature("autodoc", "	* returns true if this is a perspective view, and false otherwise.

	:rtype: bool
") IsPerspective;
		virtual bool IsPerspective ();
		%feature("compactdefaultargs") GetDistance;
		%feature("autodoc", "	* returns The focal distance of the view

	:rtype: double
") GetDistance;
		virtual double GetDistance ();
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "	* returns The world coordinates of the view position

	:param theX:
	:type theX: double &
	:param theY:
	:type theY: double &
	:param theZ:
	:type theZ: double &
	:rtype: void
") GetPosition;
		virtual void GetPosition (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetViewUp;
		%feature("autodoc", "	* returns The 'view up' direction of the view

	:param theDx:
	:type theDx: double &
	:param theDy:
	:type theDy: double &
	:param theDz:
	:type theDz: double &
	:rtype: void
") GetViewUp;
		virtual void GetViewUp (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetDirectionOfProjection;
		%feature("autodoc", "	* returns The projection direction vector of this view

	:param theDx:
	:type theDx: double &
	:param theDy:
	:type theDy: double &
	:param theDz:
	:type theDz: double &
	:rtype: void
") GetDirectionOfProjection;
		virtual void GetDirectionOfProjection (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetScale;
		%feature("autodoc", "	* returns Three doubles containing scale components of the view transformation

	:param theX:
	:type theX: double &
	:param theY:
	:type theY: double &
	:param theZ:
	:type theZ: double &
	:rtype: void
") GetScale;
		virtual void GetScale (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetParallelScale;
		%feature("autodoc", "	* returns The current view's zoom factor (for parallel projection)

	:rtype: double
") GetParallelScale;
		virtual double GetParallelScale ();
		%feature("compactdefaultargs") GetViewAngle;
		%feature("autodoc", "	* returns The current view angle (for perspective projection)

	:rtype: double
") GetViewAngle;
		virtual double GetViewAngle ();
		%feature("compactdefaultargs") GetViewCenter;
		%feature("autodoc", "	* returns Two doubles containing the display coordinates of the view window center

	:param theX:
	:type theX: double &
	:param theY:
	:type theY: double &
	:rtype: void
") GetViewCenter;
		virtual void GetViewCenter (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") DisplayToWorld;
		%feature("autodoc", "	* Converts 3D display coordinates into 3D world coordinates. @param [in] theDisplayPnt 2d point of display coordinates @param [out] theWorldPnt 3d point of world coordinates returns true if conversion was successful, false otherwise

	:param theDisplayPnt:
	:type theDisplayPnt: gp_XY
	:param theWorldPnt:
	:type theWorldPnt: gp_XYZ
	:rtype: bool
") DisplayToWorld;
		virtual bool DisplayToWorld (const gp_XY & theDisplayPnt,gp_XYZ & theWorldPnt);
};


%extend IVtkVTK_View {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IVtkVTK_View(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IVtkVTK_View::Handle_IVtkVTK_View %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IVtkVTK_View;
class Handle_IVtkVTK_View : public Handle_IVtk_IView {

    public:
        // constructors
        Handle_IVtkVTK_View();
        Handle_IVtkVTK_View(const Handle_IVtkVTK_View &aHandle);
        Handle_IVtkVTK_View(const IVtkVTK_View *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IVtkVTK_View DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IVtkVTK_View {
    IVtkVTK_View* GetObject() {
    return (IVtkVTK_View*)$self->Access();
    }
};

