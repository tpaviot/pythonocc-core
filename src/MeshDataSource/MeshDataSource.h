#if !defined __MeshDS_DataSource__
#define __MeshDS_DataSource__


#include <algorithm>

#include <Standard.hxx>
#include <Standard_Type.hxx>
#include <Standard_Real.hxx>
#include <Standard_Address.hxx>
#include <Standard_Boolean.hxx>
#include <Standard_Integer.hxx>
#include <TColStd_PackedMapOfInteger.hxx>
#include <TColStd_HArray2OfInteger.hxx>
#include <TColStd_HArray2OfReal.hxx>
#include <TColStd_Array1OfReal.hxx>
#include <TColStd_Array1OfInteger.hxx>
#include <TColStd_HArray1OfInteger.hxx>
#include <MeshVS_EntityType.hxx>
#include <MeshVS_DataSource.hxx>
#include <Poly_Triangulation.hxx>
#include <vector>
#include <gp_Pnt.hxx>
#include <gp_Vec.hxx>

class MeshDS_DataSource;
DEFINE_STANDARD_HANDLE(MeshDS_DataSource, MeshVS_DataSource)

class MeshDS_DataSource : public MeshVS_DataSource
{
public:

	//! Initialize data source with vector of nodes and vector of elements (triangles or quadrangles) 
	//! Face normals are calculated using the three first nodes of each element
	//! Node normals are calculated averaging the normals of the neighboring elements
	MeshDS_DataSource(std::vector<gp_Pnt>& CoordData, std::vector<std::vector<int>>& Ele2NodeData);

	//! Initialize data source from vector of vertices and vector of faces (triangles)
	//!
	//!
	MeshDS_DataSource(double Vertices[][3], int Faces[][3]);

	MeshDS_DataSource(double* Vertices, int nVerts1, int nVerts2, int* Faces, int nFaces1, int nFaces2);

	//! Initialize data source from STL triangulation
	//! Face normals are calculated using the three nodes of each element
	//! Node normals are calculated averaging the normals of the neighboring elements 
	MeshDS_DataSource(const Handle(Poly_Triangulation)& polyTri);

	//! This method define the normal of the face for each element
	void SetElemNormals(std::vector<gp_Vec>& ElemNormalsData);

	//! This method define the normal of all nodes for each element
	void SetNodeNormals(std::vector<std::vector<gp_Vec>>& NodeNormalsData);

	//! Returns geometry information about node ( if IsElement is False ) or element ( IsElement is True )
	//! by co-ordinates. For element this method must return all its nodes co-ordinates in the strict order: X, Y, Z and
	//! with nodes order is the same as in wire bounding the face or link. NbNodes is number of nodes of element.
	//! It is recommended to return 1 for node. Type is an element type.
	Standard_Boolean GetGeom(const Standard_Integer ID, const Standard_Boolean IsElement, TColStd_Array1OfReal& Coords, Standard_Integer& NbNodes, MeshVS_EntityType& Type) const Standard_OVERRIDE;

	//! This method is similar to GetGeom, but returns only element or node type. This method is provided for
	//! a fine performance.
	Standard_Boolean GetGeomType(const Standard_Integer ID, const Standard_Boolean IsElement, MeshVS_EntityType& Type) const Standard_OVERRIDE;

	//! This method returns by number an address of any entity which represents element or node data structure.
	Standard_Address GetAddr(const Standard_Integer ID, const Standard_Boolean IsElement) const Standard_OVERRIDE;

	//! This method returns information about what node this element consist of.
	virtual Standard_Boolean GetNodesByElement(const Standard_Integer ID, TColStd_Array1OfInteger& NodeIDs, Standard_Integer& NbNodes) const Standard_OVERRIDE;

	//! This method returns map of all nodes the object consist of.
	const TColStd_PackedMapOfInteger& GetAllNodes() const Standard_OVERRIDE;

	//! This method returns map of all elements the object consist of.
	const TColStd_PackedMapOfInteger& GetAllElements() const Standard_OVERRIDE;

	//! This method calculates normal of face, which is using for correct reflection presentation.
	//! There is default method, for advance reflection this method can be redefined.
	virtual Standard_Boolean GetNormal(const Standard_Integer Id, const Standard_Integer Max, Standard_Real& nx, Standard_Real& ny, Standard_Real& nz) const Standard_OVERRIDE;

	//! This method return normal of node rankNode of face ElementId, which is using for smooth shading presentation.
	//! Returns false if normal isn't defined.
	virtual Standard_Boolean GetNodeNormal(const Standard_Integer rankNode, const Standard_Integer ElementId, Standard_Real& nx, Standard_Real& ny, Standard_Real& nz) const Standard_OVERRIDE;

	DEFINE_STANDARD_RTTIEXT(MeshDS_DataSource, MeshVS_DataSource)

protected:

private:
	TColStd_PackedMapOfInteger myNodes;
	TColStd_PackedMapOfInteger myElements;
	Handle(TColStd_HArray2OfInteger) myElemNodes;
	Handle(TColStd_HArray1OfInteger) myElemNumberNodes;
	Handle(TColStd_HArray2OfReal) myNodeCoords;
	Handle(TColStd_HArray2OfReal) myElemNormals;
	Handle(TColStd_HArray2OfReal) myNodeNormals;
	void InitializeFromData(std::vector<gp_Pnt>& CoordData, std::vector<std::vector<int>>& Ele2NodeData);
	void InitializeFromData(double* Vertices, const int nVerts1, const int nVerts2, int* Faces, const int nFaces1, const int nFaces2);
};

#endif
