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
%module (package="OCC") SMDS

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


%include <boost_shared_ptr.i>
%shared_ptr(SMDS_Iterator<const SMDS_MeshElement *>)
%shared_ptr(SMDS_Iterator<const SMDS_MeshNode *>)
%shared_ptr(SMDS_Iterator<const SMDS_Mesh0DElement *>)
%shared_ptr(SMDS_Iterator<const SMDS_MeshEdge *>)
%shared_ptr(SMDS_Iterator<const SMDS_MeshFace *>)
%shared_ptr(SMDS_Iterator<const SMDS_MeshVolume *>)
%shared_ptr(SMDS_IteratorOfElements)

%include SMDS_headers.i


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
typedef SMDS_Iterator <const SMDS_MeshFace *> SMDS_FaceIterator;
typedef boost::shared_ptr <SMDS_Position> SMDS_PositionPtr;
typedef SMDS_Iterator <const SMDS_MeshNode *> SMDS_NodeIterator;
typedef NCollection_DataMap <int , SMDS_MeshElement *> SMDS_IdElementMap;
typedef boost::shared_ptr <SMDS_Iterator <const SMDS_Mesh0DElement *>> SMDS_0DElementIteratorPtr;
typedef boost::shared_ptr <SMDS_Iterator <const SMDS_MeshFace *>> SMDS_FaceIteratorPtr;
typedef SMDS_Iterator <const SMDS_Mesh0DElement *> SMDS_0DElementIterator;
typedef SMDS_Iterator <const SMDS_MeshVolume *> SMDS_VolumeIterator;
typedef SMDS_Iterator <const SMDS_MeshEdge *> SMDS_EdgeIterator;
typedef boost::shared_ptr <SMDS_Iterator <const SMDS_MeshElement *>> SMDS_ElemIteratorPtr;
typedef boost::shared_ptr <SMDS_Iterator <const SMDS_MeshNode *>> SMDS_NodeIteratorPtr;
typedef boost::shared_ptr <SMDS_Iterator <const SMDS_MeshEdge *>> SMDS_EdgeIteratorPtr;
typedef SMDS_Iterator <const SMDS_MeshElement *> SMDS_ElemIterator;
typedef boost::shared_ptr <SMDS_Iterator <const SMDS_MeshVolume *>> SMDS_VolumeIteratorPtr;
/* end typedefs declaration */

/* public enums */
enum SMDS_TypeOfPosition {
	SMDS_TOP_UNSPEC = - 1,
	SMDS_TOP_VERTEX = 0,
	SMDS_TOP_EDGE = 1,
	SMDS_TOP_FACE = 2,
	SMDS_TOP_3DSPACE = 3,
};

/* end public enums declaration */

%nodefaultctor SMDS_Iterator;
template<typename VALUE> class SMDS_Iterator {
	public:
		%feature("compactdefaultargs") more;
		%feature("autodoc", "	* /// Return true if and only if there are other object in this iterator

	:rtype: bool
") more;
		bool more ();
		%feature("compactdefaultargs") next;
		%feature("autodoc", "	* /// Return the current object and step to the next one

	:rtype: VALUE
") next;
		VALUE next ();
		%feature("compactdefaultargs") remove;
		%feature("autodoc", "	* /// Delete the current element and step to the next one

	:rtype: None
") remove;
		void remove ();
};


%template(SMDS_ElemIteratorPtr) SMDS_Iterator<const SMDS_MeshElement *>;
%template(SMDS_NodeIteratorPtr) SMDS_Iterator<const SMDS_MeshNode *>;
%template(SMDS_0DElementIteratorPtr) SMDS_Iterator<const SMDS_Mesh0DElement *>;
%template(SMDS_EdgeIteratorPtr) SMDS_Iterator<const SMDS_MeshEdge *>;
%template(SMDS_FaceIteratorPtr) SMDS_Iterator<const SMDS_MeshFace *>;
%template(SMDS_VolumeIteratorPtr) SMDS_Iterator<const SMDS_MeshVolume *>;

%extend SMDS_Iterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_EdgePosition;
class SMDS_EdgePosition : public SMDS_Position {
	public:
		%feature("compactdefaultargs") SMDS_EdgePosition;
		%feature("autodoc", "	:param aEdgeId: default value is 0
	:type aEdgeId: int
	:param aUParam: default value is 0
	:type aUParam: double
	:rtype: None
") SMDS_EdgePosition;
		 SMDS_EdgePosition (const int aEdgeId = 0,const double aUParam = 0);
		%feature("compactdefaultargs") Coords;
		%feature("autodoc", "	:rtype: double *
") Coords;
		virtual double * Coords ();
		%feature("compactdefaultargs") GetTypeOfPosition;
		%feature("autodoc", "	:rtype: SMDS_TypeOfPosition
") GetTypeOfPosition;
		SMDS_TypeOfPosition GetTypeOfPosition ();
		%feature("compactdefaultargs") SetUParameter;
		%feature("autodoc", "	:param aUparam:
	:type aUparam: double
	:rtype: None
") SetUParameter;
		void SetUParameter (double aUparam);
		%feature("compactdefaultargs") GetUParameter;
		%feature("autodoc", "	:rtype: double
") GetUParameter;
		double GetUParameter ();
};


%extend SMDS_EdgePosition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_FacePosition;
class SMDS_FacePosition : public SMDS_Position {
	public:
		%feature("compactdefaultargs") SMDS_FacePosition;
		%feature("autodoc", "	:param aFaceId: default value is 0
	:type aFaceId: int
	:param aUParam: default value is 0
	:type aUParam: double
	:param aVParam: default value is 0
	:type aVParam: double
	:rtype: None
") SMDS_FacePosition;
		 SMDS_FacePosition (int aFaceId = 0,double aUParam = 0,double aVParam = 0);
		%feature("compactdefaultargs") Coords;
		%feature("autodoc", "	:rtype: double *
") Coords;
		virtual double * Coords ();
		%feature("compactdefaultargs") GetTypeOfPosition;
		%feature("autodoc", "	:rtype: SMDS_TypeOfPosition
") GetTypeOfPosition;
		SMDS_TypeOfPosition GetTypeOfPosition ();
		%feature("compactdefaultargs") SetUParameter;
		%feature("autodoc", "	:param aUparam:
	:type aUparam: double
	:rtype: None
") SetUParameter;
		void SetUParameter (double aUparam);
		%feature("compactdefaultargs") SetVParameter;
		%feature("autodoc", "	:param aVparam:
	:type aVparam: double
	:rtype: None
") SetVParameter;
		void SetVParameter (double aVparam);
		%feature("compactdefaultargs") GetUParameter;
		%feature("autodoc", "	:rtype: double
") GetUParameter;
		double GetUParameter ();
		%feature("compactdefaultargs") GetVParameter;
		%feature("autodoc", "	:rtype: double
") GetVParameter;
		double GetVParameter ();
};


%extend SMDS_FacePosition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_IteratorOfElements;
class SMDS_IteratorOfElements : public SMDS_ElemIterator {
	public:
		%feature("compactdefaultargs") SMDS_IteratorOfElements;
		%feature("autodoc", "	* ///////////////////////////////////////////////////////////////////////////// /// Create an iterator which look for elements of type type which are linked /// to the element element. it is the iterator to get connectivity of element //////////////////////////////////////////////////////////////////////////////

	:param element:
	:type element: SMDS_MeshElement *
	:param type:
	:type type: SMDSAbs_ElementType
	:param it:
	:type it: SMDS_ElemIteratorPtr &
	:rtype: None
") SMDS_IteratorOfElements;
		 SMDS_IteratorOfElements (const SMDS_MeshElement * element,SMDSAbs_ElementType type,const SMDS_ElemIteratorPtr & it);
		%feature("compactdefaultargs") more;
		%feature("autodoc", "	:rtype: bool
") more;
		bool more ();
		%feature("compactdefaultargs") next;
		%feature("autodoc", "	:rtype: SMDS_MeshElement *
") next;
		const SMDS_MeshElement * next ();
};


%extend SMDS_IteratorOfElements {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_Mesh;
class SMDS_Mesh : public SMDS_MeshObject {
	public:
typedef NCollection_Map <SMDS_MeshNode *> SetOfNodes;
typedef NCollection_Map <SMDS_Mesh0DElement *> SetOf0DElements;
typedef NCollection_Map <SMDS_MeshEdge *> SetOfEdges;
typedef NCollection_Map <SMDS_MeshFace *> SetOfFaces;
typedef NCollection_Map <SMDS_MeshVolume *> SetOfVolumes;
		%feature("compactdefaultargs") SMDS_Mesh;
		%feature("autodoc", "	:rtype: None
") SMDS_Mesh;
		 SMDS_Mesh ();
		%feature("compactdefaultargs") nodesIterator;
		%feature("autodoc", "	:rtype: SMDS_NodeIteratorPtr
") nodesIterator;
		SMDS_NodeIteratorPtr nodesIterator ();
		%feature("compactdefaultargs") elements0dIterator;
		%feature("autodoc", "	:rtype: SMDS_0DElementIteratorPtr
") elements0dIterator;
		SMDS_0DElementIteratorPtr elements0dIterator ();
		%feature("compactdefaultargs") edgesIterator;
		%feature("autodoc", "	:rtype: SMDS_EdgeIteratorPtr
") edgesIterator;
		SMDS_EdgeIteratorPtr edgesIterator ();
		%feature("compactdefaultargs") facesIterator;
		%feature("autodoc", "	:rtype: SMDS_FaceIteratorPtr
") facesIterator;
		SMDS_FaceIteratorPtr facesIterator ();
		%feature("compactdefaultargs") volumesIterator;
		%feature("autodoc", "	:rtype: SMDS_VolumeIteratorPtr
") volumesIterator;
		SMDS_VolumeIteratorPtr volumesIterator ();
		%feature("compactdefaultargs") elementsIterator;
		%feature("autodoc", "	:param type: default value is SMDSAbs_All
	:type type: SMDSAbs_ElementType
	:rtype: SMDS_ElemIteratorPtr
") elementsIterator;
		SMDS_ElemIteratorPtr elementsIterator (SMDSAbs_ElementType type = SMDSAbs_All);
		%feature("compactdefaultargs") GetElementType;
		%feature("autodoc", "	:param id:
	:type id: int
	:param iselem:
	:type iselem: bool
	:rtype: SMDSAbs_ElementType
") GetElementType;
		SMDSAbs_ElementType GetElementType (const int id,const bool iselem);
		%feature("compactdefaultargs") AddSubMesh;
		%feature("autodoc", "	:rtype: SMDS_Mesh *
") AddSubMesh;
		SMDS_Mesh * AddSubMesh ();
		%feature("compactdefaultargs") AddNodeWithID;
		%feature("autodoc", "	:param x:
	:type x: double
	:param y:
	:type y: double
	:param z:
	:type z: double
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshNode *
") AddNodeWithID;
		SMDS_MeshNode * AddNodeWithID (double x,double y,double z,int ID);
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "	:param x:
	:type x: double
	:param y:
	:type y: double
	:param z:
	:type z: double
	:rtype: SMDS_MeshNode *
") AddNode;
		SMDS_MeshNode * AddNode (double x,double y,double z);
		%feature("compactdefaultargs") Add0DElementWithID;
		%feature("autodoc", "	:param n:
	:type n: int
	:param ID:
	:type ID: int
	:rtype: SMDS_Mesh0DElement *
") Add0DElementWithID;
		SMDS_Mesh0DElement * Add0DElementWithID (int n,int ID);
		%feature("compactdefaultargs") Add0DElementWithID;
		%feature("autodoc", "	:param n:
	:type n: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_Mesh0DElement *
") Add0DElementWithID;
		SMDS_Mesh0DElement * Add0DElementWithID (const SMDS_MeshNode * n,int ID);
		%feature("compactdefaultargs") Add0DElement;
		%feature("autodoc", "	:param n:
	:type n: SMDS_MeshNode *
	:rtype: SMDS_Mesh0DElement *
") Add0DElement;
		SMDS_Mesh0DElement * Add0DElement (const SMDS_MeshNode * n);
		%feature("compactdefaultargs") AddEdgeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshEdge *
") AddEdgeWithID;
		SMDS_MeshEdge * AddEdgeWithID (int n1,int n2,int ID);
		%feature("compactdefaultargs") AddEdgeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshEdge *
") AddEdgeWithID;
		SMDS_MeshEdge * AddEdgeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,int ID);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:rtype: SMDS_MeshEdge *
") AddEdge;
		SMDS_MeshEdge * AddEdge (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2);
		%feature("compactdefaultargs") AddEdgeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n12:
	:type n12: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshEdge *
") AddEdgeWithID;
		SMDS_MeshEdge * AddEdgeWithID (int n1,int n2,int n12,int ID);
		%feature("compactdefaultargs") AddEdgeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshEdge *
") AddEdgeWithID;
		SMDS_MeshEdge * AddEdgeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n12,int ID);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:rtype: SMDS_MeshEdge *
") AddEdge;
		SMDS_MeshEdge * AddEdge (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n12);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (int n1,int n2,int n3,int ID);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,int ID);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:rtype: SMDS_MeshFace *
") AddFace;
		SMDS_MeshFace * AddFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (int n1,int n2,int n3,int n4,int ID);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,int ID);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:rtype: SMDS_MeshFace *
") AddFace;
		SMDS_MeshFace * AddFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param e1:
	:type e1: SMDS_MeshEdge *
	:param e2:
	:type e2: SMDS_MeshEdge *
	:param e3:
	:type e3: SMDS_MeshEdge *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (const SMDS_MeshEdge * e1,const SMDS_MeshEdge * e2,const SMDS_MeshEdge * e3,int ID);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param e1:
	:type e1: SMDS_MeshEdge *
	:param e2:
	:type e2: SMDS_MeshEdge *
	:param e3:
	:type e3: SMDS_MeshEdge *
	:rtype: SMDS_MeshFace *
") AddFace;
		SMDS_MeshFace * AddFace (const SMDS_MeshEdge * e1,const SMDS_MeshEdge * e2,const SMDS_MeshEdge * e3);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param e1:
	:type e1: SMDS_MeshEdge *
	:param e2:
	:type e2: SMDS_MeshEdge *
	:param e3:
	:type e3: SMDS_MeshEdge *
	:param e4:
	:type e4: SMDS_MeshEdge *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (const SMDS_MeshEdge * e1,const SMDS_MeshEdge * e2,const SMDS_MeshEdge * e3,const SMDS_MeshEdge * e4,int ID);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param e1:
	:type e1: SMDS_MeshEdge *
	:param e2:
	:type e2: SMDS_MeshEdge *
	:param e3:
	:type e3: SMDS_MeshEdge *
	:param e4:
	:type e4: SMDS_MeshEdge *
	:rtype: SMDS_MeshFace *
") AddFace;
		SMDS_MeshFace * AddFace (const SMDS_MeshEdge * e1,const SMDS_MeshEdge * e2,const SMDS_MeshEdge * e3,const SMDS_MeshEdge * e4);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n31:
	:type n31: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (int n1,int n2,int n3,int n12,int n23,int n31,int ID);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31,int ID);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:rtype: SMDS_MeshFace *
") AddFace;
		SMDS_MeshFace * AddFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n34:
	:type n34: int
	:param n41:
	:type n41: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (int n1,int n2,int n3,int n4,int n12,int n23,int n34,int n41,int ID);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41,int ID);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:rtype: SMDS_MeshFace *
") AddFace;
		SMDS_MeshFace * AddFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n5,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n6:
	:type n6: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n5,int n6,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n6:
	:type n6: int
	:param n7:
	:type n7: int
	:param n8:
	:type n8: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n5,int n6,int n7,int n8,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:param n7:
	:type n7: SMDS_MeshNode *
	:param n8:
	:type n8: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n7,const SMDS_MeshNode * n8,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:param n7:
	:type n7: SMDS_MeshNode *
	:param n8:
	:type n8: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n7,const SMDS_MeshNode * n8);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param f1:
	:type f1: SMDS_MeshFace *
	:param f2:
	:type f2: SMDS_MeshFace *
	:param f3:
	:type f3: SMDS_MeshFace *
	:param f4:
	:type f4: SMDS_MeshFace *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshFace * f1,const SMDS_MeshFace * f2,const SMDS_MeshFace * f3,const SMDS_MeshFace * f4,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param f1:
	:type f1: SMDS_MeshFace *
	:param f2:
	:type f2: SMDS_MeshFace *
	:param f3:
	:type f3: SMDS_MeshFace *
	:param f4:
	:type f4: SMDS_MeshFace *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshFace * f1,const SMDS_MeshFace * f2,const SMDS_MeshFace * f3,const SMDS_MeshFace * f4);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param f1:
	:type f1: SMDS_MeshFace *
	:param f2:
	:type f2: SMDS_MeshFace *
	:param f3:
	:type f3: SMDS_MeshFace *
	:param f4:
	:type f4: SMDS_MeshFace *
	:param f5:
	:type f5: SMDS_MeshFace *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshFace * f1,const SMDS_MeshFace * f2,const SMDS_MeshFace * f3,const SMDS_MeshFace * f4,const SMDS_MeshFace * f5,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param f1:
	:type f1: SMDS_MeshFace *
	:param f2:
	:type f2: SMDS_MeshFace *
	:param f3:
	:type f3: SMDS_MeshFace *
	:param f4:
	:type f4: SMDS_MeshFace *
	:param f5:
	:type f5: SMDS_MeshFace *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshFace * f1,const SMDS_MeshFace * f2,const SMDS_MeshFace * f3,const SMDS_MeshFace * f4,const SMDS_MeshFace * f5);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param f1:
	:type f1: SMDS_MeshFace *
	:param f2:
	:type f2: SMDS_MeshFace *
	:param f3:
	:type f3: SMDS_MeshFace *
	:param f4:
	:type f4: SMDS_MeshFace *
	:param f5:
	:type f5: SMDS_MeshFace *
	:param f6:
	:type f6: SMDS_MeshFace *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshFace * f1,const SMDS_MeshFace * f2,const SMDS_MeshFace * f3,const SMDS_MeshFace * f4,const SMDS_MeshFace * f5,const SMDS_MeshFace * f6,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param f1:
	:type f1: SMDS_MeshFace *
	:param f2:
	:type f2: SMDS_MeshFace *
	:param f3:
	:type f3: SMDS_MeshFace *
	:param f4:
	:type f4: SMDS_MeshFace *
	:param f5:
	:type f5: SMDS_MeshFace *
	:param f6:
	:type f6: SMDS_MeshFace *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshFace * f1,const SMDS_MeshFace * f2,const SMDS_MeshFace * f3,const SMDS_MeshFace * f4,const SMDS_MeshFace * f5,const SMDS_MeshFace * f6);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n31:
	:type n31: int
	:param n14:
	:type n14: int
	:param n24:
	:type n24: int
	:param n34:
	:type n34: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n12,int n23,int n31,int n14,int n24,int n34,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:param n14:
	:type n14: SMDS_MeshNode *
	:param n24:
	:type n24: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31,const SMDS_MeshNode * n14,const SMDS_MeshNode * n24,const SMDS_MeshNode * n34,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:param n14:
	:type n14: SMDS_MeshNode *
	:param n24:
	:type n24: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31,const SMDS_MeshNode * n14,const SMDS_MeshNode * n24,const SMDS_MeshNode * n34);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n34:
	:type n34: int
	:param n41:
	:type n41: int
	:param n15:
	:type n15: int
	:param n25:
	:type n25: int
	:param n35:
	:type n35: int
	:param n45:
	:type n45: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n5,int n12,int n23,int n34,int n41,int n15,int n25,int n35,int n45,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:param n15:
	:type n15: SMDS_MeshNode *
	:param n25:
	:type n25: SMDS_MeshNode *
	:param n35:
	:type n35: SMDS_MeshNode *
	:param n45:
	:type n45: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41,const SMDS_MeshNode * n15,const SMDS_MeshNode * n25,const SMDS_MeshNode * n35,const SMDS_MeshNode * n45,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:param n15:
	:type n15: SMDS_MeshNode *
	:param n25:
	:type n25: SMDS_MeshNode *
	:param n35:
	:type n35: SMDS_MeshNode *
	:param n45:
	:type n45: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41,const SMDS_MeshNode * n15,const SMDS_MeshNode * n25,const SMDS_MeshNode * n35,const SMDS_MeshNode * n45);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n6:
	:type n6: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n31:
	:type n31: int
	:param n45:
	:type n45: int
	:param n56:
	:type n56: int
	:param n64:
	:type n64: int
	:param n14:
	:type n14: int
	:param n25:
	:type n25: int
	:param n36:
	:type n36: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n5,int n6,int n12,int n23,int n31,int n45,int n56,int n64,int n14,int n25,int n36,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:param n45:
	:type n45: SMDS_MeshNode *
	:param n56:
	:type n56: SMDS_MeshNode *
	:param n64:
	:type n64: SMDS_MeshNode *
	:param n14:
	:type n14: SMDS_MeshNode *
	:param n25:
	:type n25: SMDS_MeshNode *
	:param n36:
	:type n36: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31,const SMDS_MeshNode * n45,const SMDS_MeshNode * n56,const SMDS_MeshNode * n64,const SMDS_MeshNode * n14,const SMDS_MeshNode * n25,const SMDS_MeshNode * n36,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:param n45:
	:type n45: SMDS_MeshNode *
	:param n56:
	:type n56: SMDS_MeshNode *
	:param n64:
	:type n64: SMDS_MeshNode *
	:param n14:
	:type n14: SMDS_MeshNode *
	:param n25:
	:type n25: SMDS_MeshNode *
	:param n36:
	:type n36: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31,const SMDS_MeshNode * n45,const SMDS_MeshNode * n56,const SMDS_MeshNode * n64,const SMDS_MeshNode * n14,const SMDS_MeshNode * n25,const SMDS_MeshNode * n36);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n6:
	:type n6: int
	:param n7:
	:type n7: int
	:param n8:
	:type n8: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n34:
	:type n34: int
	:param n41:
	:type n41: int
	:param n56:
	:type n56: int
	:param n67:
	:type n67: int
	:param n78:
	:type n78: int
	:param n85:
	:type n85: int
	:param n15:
	:type n15: int
	:param n26:
	:type n26: int
	:param n37:
	:type n37: int
	:param n48:
	:type n48: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n5,int n6,int n7,int n8,int n12,int n23,int n34,int n41,int n56,int n67,int n78,int n85,int n15,int n26,int n37,int n48,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:param n7:
	:type n7: SMDS_MeshNode *
	:param n8:
	:type n8: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:param n56:
	:type n56: SMDS_MeshNode *
	:param n67:
	:type n67: SMDS_MeshNode *
	:param n78:
	:type n78: SMDS_MeshNode *
	:param n85:
	:type n85: SMDS_MeshNode *
	:param n15:
	:type n15: SMDS_MeshNode *
	:param n26:
	:type n26: SMDS_MeshNode *
	:param n37:
	:type n37: SMDS_MeshNode *
	:param n48:
	:type n48: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n7,const SMDS_MeshNode * n8,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41,const SMDS_MeshNode * n56,const SMDS_MeshNode * n67,const SMDS_MeshNode * n78,const SMDS_MeshNode * n85,const SMDS_MeshNode * n15,const SMDS_MeshNode * n26,const SMDS_MeshNode * n37,const SMDS_MeshNode * n48,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:param n7:
	:type n7: SMDS_MeshNode *
	:param n8:
	:type n8: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:param n56:
	:type n56: SMDS_MeshNode *
	:param n67:
	:type n67: SMDS_MeshNode *
	:param n78:
	:type n78: SMDS_MeshNode *
	:param n85:
	:type n85: SMDS_MeshNode *
	:param n15:
	:type n15: SMDS_MeshNode *
	:param n26:
	:type n26: SMDS_MeshNode *
	:param n37:
	:type n37: SMDS_MeshNode *
	:param n48:
	:type n48: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n7,const SMDS_MeshNode * n8,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41,const SMDS_MeshNode * n56,const SMDS_MeshNode * n67,const SMDS_MeshNode * n78,const SMDS_MeshNode * n85,const SMDS_MeshNode * n15,const SMDS_MeshNode * n26,const SMDS_MeshNode * n37,const SMDS_MeshNode * n48);
		%feature("compactdefaultargs") AddPolygonalFaceWithID;
		%feature("autodoc", "	:param nodes_ids:
	:type nodes_ids: std::vector<int>
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddPolygonalFaceWithID;
		SMDS_MeshFace * AddPolygonalFaceWithID (std::vector<int> nodes_ids,const int ID);
		%feature("compactdefaultargs") AddPolygonalFaceWithID;
		%feature("autodoc", "	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *>
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddPolygonalFaceWithID;
		SMDS_MeshFace * AddPolygonalFaceWithID (std::vector<const SMDS_MeshNode *> nodes,const int ID);
		%feature("compactdefaultargs") AddPolygonalFace;
		%feature("autodoc", "	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *>
	:rtype: SMDS_MeshFace *
") AddPolygonalFace;
		SMDS_MeshFace * AddPolygonalFace (std::vector<const SMDS_MeshNode *> nodes);
		%feature("compactdefaultargs") AddPolyhedralVolumeWithID;
		%feature("autodoc", "	:param nodes_ids:
	:type nodes_ids: std::vector<int>
	:param quantities:
	:type quantities: std::vector<int>
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddPolyhedralVolumeWithID;
		SMDS_MeshVolume * AddPolyhedralVolumeWithID (std::vector<int> nodes_ids,std::vector<int> quantities,const int ID);
		%feature("compactdefaultargs") AddPolyhedralVolumeWithID;
		%feature("autodoc", "	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *>
	:param quantities:
	:type quantities: std::vector<int>
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddPolyhedralVolumeWithID;
		SMDS_MeshVolume * AddPolyhedralVolumeWithID (std::vector<const SMDS_MeshNode *> nodes,std::vector<int> quantities,const int ID);
		%feature("compactdefaultargs") AddPolyhedralVolume;
		%feature("autodoc", "	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *>
	:param quantities:
	:type quantities: std::vector<int>
	:rtype: SMDS_MeshVolume *
") AddPolyhedralVolume;
		SMDS_MeshVolume * AddPolyhedralVolume (std::vector<const SMDS_MeshNode *> nodes,std::vector<int> quantities);
		%feature("compactdefaultargs") RemoveElement;
		%feature("autodoc", "	:param elem:
	:type elem: SMDS_MeshElement *
	:param removedElems:
	:type removedElems: std::list< SMDS_MeshElement *> &
	:param removedNodes:
	:type removedNodes: std::list< SMDS_MeshElement *> &
	:param removenodes: default value is false
	:type removenodes: bool
	:rtype: None
") RemoveElement;
		void RemoveElement (const SMDS_MeshElement * elem,std::list<const SMDS_MeshElement *> & removedElems,std::list<const SMDS_MeshElement *> & removedNodes,bool removenodes = false);
		%feature("compactdefaultargs") RemoveElement;
		%feature("autodoc", "	:param elem:
	:type elem: SMDS_MeshElement *
	:param removenodes: default value is false
	:type removenodes: bool
	:rtype: None
") RemoveElement;
		void RemoveElement (const SMDS_MeshElement * elem,bool removenodes = false);
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "	:param node:
	:type node: SMDS_MeshNode *
	:rtype: None
") RemoveNode;
		void RemoveNode (const SMDS_MeshNode * node);
		%feature("compactdefaultargs") Remove0DElement;
		%feature("autodoc", "	:param elem0d:
	:type elem0d: SMDS_Mesh0DElement *
	:rtype: None
") Remove0DElement;
		void Remove0DElement (const SMDS_Mesh0DElement * elem0d);
		%feature("compactdefaultargs") RemoveEdge;
		%feature("autodoc", "	:param edge:
	:type edge: SMDS_MeshEdge *
	:rtype: None
") RemoveEdge;
		void RemoveEdge (const SMDS_MeshEdge * edge);
		%feature("compactdefaultargs") RemoveFace;
		%feature("autodoc", "	:param face:
	:type face: SMDS_MeshFace *
	:rtype: None
") RemoveFace;
		void RemoveFace (const SMDS_MeshFace * face);
		%feature("compactdefaultargs") RemoveVolume;
		%feature("autodoc", "	:param volume:
	:type volume: SMDS_MeshVolume *
	:rtype: None
") RemoveVolume;
		void RemoveVolume (const SMDS_MeshVolume * volume);
		%feature("compactdefaultargs") RemoveFreeElement;
		%feature("autodoc", "	* /*! Remove only the given element and only if it is free. * Method does not work for meshes with descendants. * Implemented for fast cleaning of meshes. */

	:param elem:
	:type elem: SMDS_MeshElement *
	:rtype: None
") RemoveFreeElement;
		void RemoveFreeElement (const SMDS_MeshElement * elem);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") RemoveFromParent;
		%feature("autodoc", "	:rtype: bool
") RemoveFromParent;
		bool RemoveFromParent ();
		%feature("compactdefaultargs") RemoveSubMesh;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMDS_Mesh *
	:rtype: bool
") RemoveSubMesh;
		bool RemoveSubMesh (const SMDS_Mesh * aMesh);
		%feature("compactdefaultargs") ChangePolyhedronNodes;
		%feature("autodoc", "	:param elem:
	:type elem: SMDS_MeshElement *
	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *> &
	:param quantities:
	:type quantities: std::vector<int> &
	:rtype: bool
") ChangePolyhedronNodes;
		bool ChangePolyhedronNodes (const SMDS_MeshElement * elem,const std::vector<const SMDS_MeshNode *> & nodes,const std::vector<int> & quantities);
		%feature("compactdefaultargs") Renumber;
		%feature("autodoc", "	:param isNodes:
	:type isNodes: bool
	:param startID: default value is 1
	:type startID: int
	:param deltaID: default value is 1
	:type deltaID: int
	:rtype: None
") Renumber;
		void Renumber (const bool isNodes,const int startID = 1,const int deltaID = 1);
		%feature("compactdefaultargs") FindNode;
		%feature("autodoc", "	:param idnode:
	:type idnode: int
	:rtype: SMDS_MeshNode *
") FindNode;
		const SMDS_MeshNode * FindNode (int idnode);
		%feature("compactdefaultargs") Find0DElement;
		%feature("autodoc", "	:param idnode:
	:type idnode: int
	:rtype: SMDS_Mesh0DElement *
") Find0DElement;
		const SMDS_Mesh0DElement * Find0DElement (int idnode);
		%feature("compactdefaultargs") FindEdge;
		%feature("autodoc", "	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:rtype: SMDS_MeshEdge *
") FindEdge;
		const SMDS_MeshEdge * FindEdge (int idnode1,int idnode2);
		%feature("compactdefaultargs") FindEdge;
		%feature("autodoc", "	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:rtype: SMDS_MeshEdge *
") FindEdge;
		const SMDS_MeshEdge * FindEdge (int idnode1,int idnode2,int idnode3);
		%feature("compactdefaultargs") FindFace;
		%feature("autodoc", "	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:rtype: SMDS_MeshFace *
") FindFace;
		const SMDS_MeshFace * FindFace (int idnode1,int idnode2,int idnode3);
		%feature("compactdefaultargs") FindFace;
		%feature("autodoc", "	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:param idnode4:
	:type idnode4: int
	:rtype: SMDS_MeshFace *
") FindFace;
		const SMDS_MeshFace * FindFace (int idnode1,int idnode2,int idnode3,int idnode4);
		%feature("compactdefaultargs") FindFace;
		%feature("autodoc", "	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:param idnode4:
	:type idnode4: int
	:param idnode5:
	:type idnode5: int
	:param idnode6:
	:type idnode6: int
	:rtype: SMDS_MeshFace *
") FindFace;
		const SMDS_MeshFace * FindFace (int idnode1,int idnode2,int idnode3,int idnode4,int idnode5,int idnode6);
		%feature("compactdefaultargs") FindFace;
		%feature("autodoc", "	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:param idnode4:
	:type idnode4: int
	:param idnode5:
	:type idnode5: int
	:param idnode6:
	:type idnode6: int
	:param idnode7:
	:type idnode7: int
	:param idnode8:
	:type idnode8: int
	:rtype: SMDS_MeshFace *
") FindFace;
		const SMDS_MeshFace * FindFace (int idnode1,int idnode2,int idnode3,int idnode4,int idnode5,int idnode6,int idnode7,int idnode8);
		%feature("compactdefaultargs") FindElement;
		%feature("autodoc", "	:param IDelem:
	:type IDelem: int
	:rtype: SMDS_MeshElement *
") FindElement;
		const SMDS_MeshElement * FindElement (int IDelem);
		%feature("compactdefaultargs") Find0DElement;
		%feature("autodoc", "	:param n:
	:type n: SMDS_MeshNode *
	:rtype: SMDS_Mesh0DElement *
") Find0DElement;
		static const SMDS_Mesh0DElement * Find0DElement (const SMDS_MeshNode * n);
		%feature("compactdefaultargs") FindEdge;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:rtype: SMDS_MeshEdge *
") FindEdge;
		static const SMDS_MeshEdge * FindEdge (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2);
		%feature("compactdefaultargs") FindEdge;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:rtype: SMDS_MeshEdge *
") FindEdge;
		static const SMDS_MeshEdge * FindEdge (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3);
		%feature("compactdefaultargs") FindFace;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:rtype: SMDS_MeshFace *
") FindFace;
		static const SMDS_MeshFace * FindFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3);
		%feature("compactdefaultargs") FindFace;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:rtype: SMDS_MeshFace *
") FindFace;
		static const SMDS_MeshFace * FindFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4);
		%feature("compactdefaultargs") FindFace;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:rtype: SMDS_MeshFace *
") FindFace;
		static const SMDS_MeshFace * FindFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6);
		%feature("compactdefaultargs") FindFace;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:param n7:
	:type n7: SMDS_MeshNode *
	:param n8:
	:type n8: SMDS_MeshNode *
	:rtype: SMDS_MeshFace *
") FindFace;
		static const SMDS_MeshFace * FindFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n7,const SMDS_MeshNode * n8);
		%feature("compactdefaultargs") FindFace;
		%feature("autodoc", "	:param nodes_ids:
	:type nodes_ids: std::vector<int>
	:rtype: SMDS_MeshFace *
") FindFace;
		const SMDS_MeshFace * FindFace (std::vector<int> nodes_ids);
		%feature("compactdefaultargs") FindFace;
		%feature("autodoc", "	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *>
	:rtype: SMDS_MeshFace *
") FindFace;
		static const SMDS_MeshFace * FindFace (std::vector<const SMDS_MeshNode *> nodes);
		%feature("compactdefaultargs") CheckMemory;
		%feature("autodoc", "	* /*! * \brief Raise an exception if free memory (ram+swap) too low * \param doNotRaise - if true, suppres exception, just return free memory size * etval int - amount of available memory in MB or negative number in failure case */

	:param doNotRaise: default value is false
	:type doNotRaise: bool
	:rtype: int
") CheckMemory;
		static int CheckMemory (const bool doNotRaise = false);
		%feature("compactdefaultargs") MaxNodeID;
		%feature("autodoc", "	:rtype: int
") MaxNodeID;
		int MaxNodeID ();
		%feature("compactdefaultargs") MinNodeID;
		%feature("autodoc", "	:rtype: int
") MinNodeID;
		int MinNodeID ();
		%feature("compactdefaultargs") MaxElementID;
		%feature("autodoc", "	:rtype: int
") MaxElementID;
		int MaxElementID ();
		%feature("compactdefaultargs") MinElementID;
		%feature("autodoc", "	:rtype: int
") MinElementID;
		int MinElementID ();
		%feature("compactdefaultargs") GetMeshInfo;
		%feature("autodoc", "	:rtype: SMDS_MeshInfo
") GetMeshInfo;
		const SMDS_MeshInfo & GetMeshInfo ();
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") Nb0DElements;
		%feature("autodoc", "	:rtype: int
") Nb0DElements;
		int Nb0DElements ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		int NbEdges ();
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "	:rtype: int
") NbFaces;
		int NbFaces ();
		%feature("compactdefaultargs") NbVolumes;
		%feature("autodoc", "	:rtype: int
") NbVolumes;
		int NbVolumes ();
		%feature("compactdefaultargs") NbSubMesh;
		%feature("autodoc", "	:rtype: int
") NbSubMesh;
		int NbSubMesh ();
		%feature("compactdefaultargs") DumpNodes;
		%feature("autodoc", "	:rtype: None
") DumpNodes;
		void DumpNodes ();
		%feature("compactdefaultargs") Dump0DElements;
		%feature("autodoc", "	:rtype: None
") Dump0DElements;
		void Dump0DElements ();
		%feature("compactdefaultargs") DumpEdges;
		%feature("autodoc", "	:rtype: None
") DumpEdges;
		void DumpEdges ();
		%feature("compactdefaultargs") DumpFaces;
		%feature("autodoc", "	:rtype: None
") DumpFaces;
		void DumpFaces ();
		%feature("compactdefaultargs") DumpVolumes;
		%feature("autodoc", "	:rtype: None
") DumpVolumes;
		void DumpVolumes ();
		%feature("compactdefaultargs") DebugStats;
		%feature("autodoc", "	:rtype: None
") DebugStats;
		void DebugStats ();
		%feature("compactdefaultargs") hasConstructionEdges;
		%feature("autodoc", "	:rtype: bool
") hasConstructionEdges;
		bool hasConstructionEdges ();
		%feature("compactdefaultargs") hasConstructionFaces;
		%feature("autodoc", "	:rtype: bool
") hasConstructionFaces;
		bool hasConstructionFaces ();
		%feature("compactdefaultargs") hasInverseElements;
		%feature("autodoc", "	:rtype: bool
") hasInverseElements;
		bool hasInverseElements ();
		%feature("compactdefaultargs") setConstructionEdges;
		%feature("autodoc", "	:param :
	:type : bool
	:rtype: None
") setConstructionEdges;
		void setConstructionEdges (bool );
		%feature("compactdefaultargs") setConstructionFaces;
		%feature("autodoc", "	:param :
	:type : bool
	:rtype: None
") setConstructionFaces;
		void setConstructionFaces (bool );
		%feature("compactdefaultargs") setInverseElements;
		%feature("autodoc", "	:param :
	:type : bool
	:rtype: None
") setInverseElements;
		void setInverseElements (bool );
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* /*! * Checks if the element is present in mesh. * Useful to determine dead pointers. * Use this function for debug purpose only! Do not check in the code * using it even in _DEBUG_ mode */

	:param elem:
	:type elem: SMDS_MeshElement *
	:rtype: bool
") Contains;
		bool Contains (const SMDS_MeshElement * elem);
};


%extend SMDS_Mesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_MeshElement;
class SMDS_MeshElement : public SMDS_MeshObject {
	public:
		%feature("compactdefaultargs") nodesIterator;
		%feature("autodoc", "	:rtype: SMDS_ElemIteratorPtr
") nodesIterator;
		SMDS_ElemIteratorPtr nodesIterator ();
		%feature("compactdefaultargs") edgesIterator;
		%feature("autodoc", "	:rtype: SMDS_ElemIteratorPtr
") edgesIterator;
		SMDS_ElemIteratorPtr edgesIterator ();
		%feature("compactdefaultargs") facesIterator;
		%feature("autodoc", "	:rtype: SMDS_ElemIteratorPtr
") facesIterator;
		SMDS_ElemIteratorPtr facesIterator ();
		%feature("compactdefaultargs") elementsIterator;
		%feature("autodoc", "	:param type:
	:type type: SMDSAbs_ElementType
	:rtype: SMDS_ElemIteratorPtr
") elementsIterator;
		SMDS_ElemIteratorPtr elementsIterator (SMDSAbs_ElementType type);
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		int NbEdges ();
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "	:rtype: int
") NbFaces;
		int NbFaces ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: int
") GetID;
		int GetID ();
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* ///Return the type of the current element

	:rtype: SMDSAbs_ElementType
") GetType;
		SMDSAbs_ElementType GetType ();
		%feature("compactdefaultargs") IsPoly;
		%feature("autodoc", "	:rtype: bool
") IsPoly;
		bool IsPoly ();
		%feature("compactdefaultargs") IsQuadratic;
		%feature("autodoc", "	:rtype: bool
") IsQuadratic;
		bool IsQuadratic ();
		%feature("compactdefaultargs") GetEntityType;
		%feature("autodoc", "	* Return type of entity

	:rtype: SMDSAbs_EntityType
") GetEntityType;
		SMDSAbs_EntityType GetEntityType ();
		%feature("compactdefaultargs") IsMediumNode;
		%feature("autodoc", "	:param node:
	:type node: SMDS_MeshNode *
	:rtype: bool
") IsMediumNode;
		bool IsMediumNode (const SMDS_MeshNode * node);
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* /*! * \brief Return node by its index * \param ind - node index * etval const SMDS_MeshNode* - the node */

	:param ind:
	:type ind: int
	:rtype: SMDS_MeshNode *
") GetNode;
		const SMDS_MeshNode * GetNode (const int ind);
		%feature("compactdefaultargs") GetNodeWrap;
		%feature("autodoc", "	* /*! * \brief Return node by its index * \param ind - node index * etval const SMDS_MeshNode* - the node * * Index is wrapped if it is out of a valid range */

	:param ind:
	:type ind: int
	:rtype: SMDS_MeshNode *
") GetNodeWrap;
		const SMDS_MeshNode * GetNodeWrap (const int ind);
		%feature("compactdefaultargs") IsValidIndex;
		%feature("autodoc", "	* /*! * \brief Return true if index of node is valid (0 <= ind < NbNodes()) * \param ind - node index * etval bool - index check result */

	:param ind:
	:type ind: int
	:rtype: bool
") IsValidIndex;
		bool IsValidIndex (const int ind);
		%feature("compactdefaultargs") WrappedIndex;
		%feature("autodoc", "	* /*! * \brief Return a valid node index, fixing the given one if necessary * \param ind - node index * etval int - valid node index */

	:param ind:
	:type ind: int
	:rtype: int
") WrappedIndex;
		int WrappedIndex (const int ind);
		%feature("compactdefaultargs") GetNodeIndex;
		%feature("autodoc", "	* /*! * \brief Check if a node belongs to the element * \param node - the node to check * etval int - node index within the element, -1 if not found */

	:param node:
	:type node: SMDS_MeshNode *
	:rtype: int
") GetNodeIndex;
		int GetNodeIndex (const SMDS_MeshNode * node);
};


%extend SMDS_MeshElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_MeshGroup;
class SMDS_MeshGroup : public SMDS_MeshObject {
	public:
		%feature("compactdefaultargs") SMDS_MeshGroup;
		%feature("autodoc", "	:param theMesh:
	:type theMesh: SMDS_Mesh *
	:param theType: default value is SMDSAbs_All
	:type theType: SMDSAbs_ElementType
	:rtype: None
") SMDS_MeshGroup;
		 SMDS_MeshGroup (const SMDS_Mesh * theMesh,const SMDSAbs_ElementType theType = SMDSAbs_All);
		%feature("compactdefaultargs") AddSubGroup;
		%feature("autodoc", "	:param theType: default value is SMDSAbs_All
	:type theType: SMDSAbs_ElementType
	:rtype: SMDS_MeshGroup *
") AddSubGroup;
		const SMDS_MeshGroup * AddSubGroup (const SMDSAbs_ElementType theType = SMDSAbs_All);
		%feature("compactdefaultargs") RemoveSubGroup;
		%feature("autodoc", "	:param theGroup:
	:type theGroup: SMDS_MeshGroup *
	:rtype: bool
") RemoveSubGroup;
		bool RemoveSubGroup (const SMDS_MeshGroup * theGroup);
		%feature("compactdefaultargs") RemoveFromParent;
		%feature("autodoc", "	:rtype: bool
") RemoveFromParent;
		bool RemoveFromParent ();
		%feature("compactdefaultargs") GetMesh;
		%feature("autodoc", "	:rtype: SMDS_Mesh *
") GetMesh;
		const SMDS_Mesh * GetMesh ();
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	:param theType:
	:type theType: SMDSAbs_ElementType
	:rtype: None
") SetType;
		void SetType (const SMDSAbs_ElementType theType);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param theElem:
	:type theElem: SMDS_MeshElement *
	:rtype: None
") Add;
		void Add (const SMDS_MeshElement * theElem);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param theElem:
	:type theElem: SMDS_MeshElement *
	:rtype: bool
") Remove;
		bool Remove (const SMDS_MeshElement * theElem);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		bool IsEmpty ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		int Extent ();
		%feature("compactdefaultargs") SubGroupsNb;
		%feature("autodoc", "	:rtype: int
") SubGroupsNb;
		int SubGroupsNb ();
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: SMDSAbs_ElementType
") GetType;
		SMDSAbs_ElementType GetType ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param theElem:
	:type theElem: SMDS_MeshElement *
	:rtype: bool
") Contains;
		bool Contains (const SMDS_MeshElement * theElem);
		%feature("compactdefaultargs") InitIterator;
		%feature("autodoc", "	:rtype: None
") InitIterator;
		void InitIterator ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		bool More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: SMDS_MeshElement *
") Next;
		const SMDS_MeshElement * Next ();
		%feature("compactdefaultargs") InitSubGroupsIterator;
		%feature("autodoc", "	:rtype: None
") InitSubGroupsIterator;
		void InitSubGroupsIterator ();
		%feature("compactdefaultargs") MoreSubGroups;
		%feature("autodoc", "	:rtype: bool
") MoreSubGroups;
		bool MoreSubGroups ();
		%feature("compactdefaultargs") NextSubGroup;
		%feature("autodoc", "	:rtype: SMDS_MeshGroup *
") NextSubGroup;
		const SMDS_MeshGroup * NextSubGroup ();
};


%extend SMDS_MeshGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_MeshIDFactory;
class SMDS_MeshIDFactory : public SMDS_MeshObject {
	public:
		%feature("compactdefaultargs") GetFreeID;
		%feature("autodoc", "	:rtype: int
") GetFreeID;
		int GetFreeID ();
		%feature("compactdefaultargs") ReleaseID;
		%feature("autodoc", "	:param ID:
	:type ID: int
	:rtype: None
") ReleaseID;
		void ReleaseID (int ID);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
};


%extend SMDS_MeshIDFactory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_SpacePosition;
class SMDS_SpacePosition : public SMDS_Position {
	public:
		%feature("compactdefaultargs") SMDS_SpacePosition;
		%feature("autodoc", "	:param x: default value is 0
	:type x: double
	:param y: default value is 0
	:type y: double
	:param z: default value is 0
	:type z: double
	:rtype: None
") SMDS_SpacePosition;
		 SMDS_SpacePosition (double x = 0,double y = 0,double z = 0);
		%feature("compactdefaultargs") Coords;
		%feature("autodoc", "	:rtype: double *
") Coords;
		virtual double * Coords ();
		%feature("compactdefaultargs") originSpacePosition;
		%feature("autodoc", "	:rtype: SMDS_PositionPtr
") originSpacePosition;
		static SMDS_PositionPtr originSpacePosition ();
};


%extend SMDS_SpacePosition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_VertexPosition;
class SMDS_VertexPosition : public SMDS_Position {
	public:
		%feature("compactdefaultargs") GetTypeOfPosition;
		%feature("autodoc", "	:rtype: SMDS_TypeOfPosition
") GetTypeOfPosition;
		SMDS_TypeOfPosition GetTypeOfPosition ();
		%feature("compactdefaultargs") SMDS_VertexPosition;
		%feature("autodoc", "	:param aVertexId: default value is 0
	:type aVertexId: int
	:rtype: None
") SMDS_VertexPosition;
		 SMDS_VertexPosition (int aVertexId = 0);
		%feature("compactdefaultargs") Coords;
		%feature("autodoc", "	:rtype: double *
") Coords;
		const double * Coords ();
};


%extend SMDS_VertexPosition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_Mesh0DElement;
class SMDS_Mesh0DElement : public SMDS_MeshElement {
	public:
		%feature("compactdefaultargs") SMDS_Mesh0DElement;
		%feature("autodoc", "	:param node:
	:type node: SMDS_MeshNode *
	:rtype: None
") SMDS_Mesh0DElement;
		 SMDS_Mesh0DElement (const SMDS_MeshNode * node);
		%feature("compactdefaultargs") ChangeNode;
		%feature("autodoc", "	:param node:
	:type node: SMDS_MeshNode *
	:rtype: bool
") ChangeNode;
		bool ChangeNode (const SMDS_MeshNode * node);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param OS:
	:type OS: std::ostream &
	:rtype: None
") Print;
		void Print (std::ostream & OS);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: SMDSAbs_ElementType
") GetType;
		SMDSAbs_ElementType GetType ();
		%feature("compactdefaultargs") GetEntityType;
		%feature("autodoc", "	:rtype: SMDSAbs_EntityType
") GetEntityType;
		SMDSAbs_EntityType GetEntityType ();
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		int NbEdges ();
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* /*! * \brief Return node by its index * \param ind - node index * etval const SMDS_MeshNode* - the node */

	:param ind:
	:type ind: int
	:rtype: SMDS_MeshNode *
") GetNode;
		const SMDS_MeshNode * GetNode (const int ind);
};


%extend SMDS_Mesh0DElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_MeshEdge;
class SMDS_MeshEdge : public SMDS_MeshElement {
	public:
		%feature("compactdefaultargs") SMDS_MeshEdge;
		%feature("autodoc", "	:param node1:
	:type node1: SMDS_MeshNode *
	:param node2:
	:type node2: SMDS_MeshNode *
	:rtype: None
") SMDS_MeshEdge;
		 SMDS_MeshEdge (const SMDS_MeshNode * node1,const SMDS_MeshNode * node2);
		%feature("compactdefaultargs") ChangeNodes;
		%feature("autodoc", "	:param node1:
	:type node1: SMDS_MeshNode *
	:param node2:
	:type node2: SMDS_MeshNode *
	:rtype: bool
") ChangeNodes;
		bool ChangeNodes (const SMDS_MeshNode * node1,const SMDS_MeshNode * node2);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param OS:
	:type OS: std::ostream &
	:rtype: None
") Print;
		void Print (std::ostream & OS);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: SMDSAbs_ElementType
") GetType;
		SMDSAbs_ElementType GetType ();
		%feature("compactdefaultargs") GetEntityType;
		%feature("autodoc", "	:rtype: SMDSAbs_EntityType
") GetEntityType;
		SMDSAbs_EntityType GetEntityType ();
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		int NbEdges ();
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* /*! * \brief Return node by its index * \param ind - node index * etval const SMDS_MeshNode* - the node */

	:param ind:
	:type ind: int
	:rtype: SMDS_MeshNode *
") GetNode;
		const SMDS_MeshNode * GetNode (const int ind);
};


%extend SMDS_MeshEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_MeshElementIDFactory;
class SMDS_MeshElementIDFactory : public SMDS_MeshIDFactory {
	public:
		%feature("compactdefaultargs") SMDS_MeshElementIDFactory;
		%feature("autodoc", "	:rtype: None
") SMDS_MeshElementIDFactory;
		 SMDS_MeshElementIDFactory ();
		%feature("compactdefaultargs") BindID;
		%feature("autodoc", "	:param ID:
	:type ID: int
	:param elem:
	:type elem: SMDS_MeshElement *
	:rtype: bool
") BindID;
		bool BindID (int ID,SMDS_MeshElement * elem);
		%feature("compactdefaultargs") MeshElement;
		%feature("autodoc", "	:param ID:
	:type ID: int
	:rtype: SMDS_MeshElement *
") MeshElement;
		SMDS_MeshElement * MeshElement (int ID);
		%feature("compactdefaultargs") GetFreeID;
		%feature("autodoc", "	:rtype: int
") GetFreeID;
		int GetFreeID ();
		%feature("compactdefaultargs") ReleaseID;
		%feature("autodoc", "	:param ID:
	:type ID: int
	:rtype: None
") ReleaseID;
		void ReleaseID (int ID);
		%feature("compactdefaultargs") GetMaxID;
		%feature("autodoc", "	:rtype: int
") GetMaxID;
		int GetMaxID ();
		%feature("compactdefaultargs") GetMinID;
		%feature("autodoc", "	:rtype: int
") GetMinID;
		int GetMinID ();
		%feature("compactdefaultargs") elementsIterator;
		%feature("autodoc", "	:rtype: SMDS_ElemIteratorPtr
") elementsIterator;
		SMDS_ElemIteratorPtr elementsIterator ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
};


%extend SMDS_MeshElementIDFactory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_MeshFace;
class SMDS_MeshFace : public SMDS_MeshElement {
	public:
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: SMDSAbs_ElementType
") GetType;
		SMDSAbs_ElementType GetType ();
};


%extend SMDS_MeshFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_MeshNode;
class SMDS_MeshNode : public SMDS_MeshElement {
	public:
		%feature("compactdefaultargs") SMDS_MeshNode;
		%feature("autodoc", "	:param x:
	:type x: double
	:param y:
	:type y: double
	:param z:
	:type z: double
	:rtype: None
") SMDS_MeshNode;
		 SMDS_MeshNode (double x,double y,double z);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param OS:
	:type OS: std::ostream &
	:rtype: None
") Print;
		void Print (std::ostream & OS);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	:rtype: double
") X;
		double X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	:rtype: double
") Y;
		double Y ();
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	:rtype: double
") Z;
		double Z ();
		%feature("compactdefaultargs") AddInverseElement;
		%feature("autodoc", "	:param ME:
	:type ME: SMDS_MeshElement *
	:rtype: None
") AddInverseElement;
		void AddInverseElement (const SMDS_MeshElement * ME);
		%feature("compactdefaultargs") RemoveInverseElement;
		%feature("autodoc", "	:param parent:
	:type parent: SMDS_MeshElement *
	:rtype: None
") RemoveInverseElement;
		void RemoveInverseElement (const SMDS_MeshElement * parent);
		%feature("compactdefaultargs") ClearInverseElements;
		%feature("autodoc", "	:rtype: None
") ClearInverseElements;
		void ClearInverseElements ();
		%feature("compactdefaultargs") emptyInverseElements;
		%feature("autodoc", "	:rtype: bool
") emptyInverseElements;
		bool emptyInverseElements ();
		%feature("compactdefaultargs") GetInverseElementIterator;
		%feature("autodoc", "	:param type: default value is SMDSAbs_All
	:type type: SMDSAbs_ElementType
	:rtype: SMDS_ElemIteratorPtr
") GetInverseElementIterator;
		SMDS_ElemIteratorPtr GetInverseElementIterator (SMDSAbs_ElementType type = SMDSAbs_All);
		%feature("compactdefaultargs") NbInverseElements;
		%feature("autodoc", "	:param type: default value is SMDSAbs_All
	:type type: SMDSAbs_ElementType
	:rtype: int
") NbInverseElements;
		int NbInverseElements (SMDSAbs_ElementType type = SMDSAbs_All);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	:param aPos:
	:type aPos: SMDS_PositionPtr &
	:rtype: None
") SetPosition;
		void SetPosition (const SMDS_PositionPtr & aPos);
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "	:rtype: SMDS_PositionPtr
") GetPosition;
		const SMDS_PositionPtr & GetPosition ();
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: SMDSAbs_ElementType
") GetType;
		SMDSAbs_ElementType GetType ();
		%feature("compactdefaultargs") GetEntityType;
		%feature("autodoc", "	:rtype: SMDSAbs_EntityType
") GetEntityType;
		SMDSAbs_EntityType GetEntityType ();
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") setXYZ;
		%feature("autodoc", "	:param x:
	:type x: double
	:param y:
	:type y: double
	:param z:
	:type z: double
	:rtype: None
") setXYZ;
		void setXYZ (double x,double y,double z);
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* /*! * \brief Return node by its index * \param ind - node index * etval const SMDS_MeshNode* - the node */

	:param :
	:type : int
	:rtype: SMDS_MeshNode *
") GetNode;
		const SMDS_MeshNode * GetNode (const int );
};


%extend SMDS_MeshNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_MeshVolume;
class SMDS_MeshVolume : public SMDS_MeshElement {
	public:
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: SMDSAbs_ElementType
") GetType;
		SMDSAbs_ElementType GetType ();
};


%extend SMDS_MeshVolume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_FaceOfEdges;
class SMDS_FaceOfEdges : public SMDS_MeshFace {
	public:
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param OS:
	:type OS: std::ostream &
	:rtype: None
") Print;
		void Print (std::ostream & OS);
		%feature("compactdefaultargs") SMDS_FaceOfEdges;
		%feature("autodoc", "	:param edge1:
	:type edge1: SMDS_MeshEdge *
	:param edge2:
	:type edge2: SMDS_MeshEdge *
	:param edge3:
	:type edge3: SMDS_MeshEdge *
	:rtype: None
") SMDS_FaceOfEdges;
		 SMDS_FaceOfEdges (const SMDS_MeshEdge * edge1,const SMDS_MeshEdge * edge2,const SMDS_MeshEdge * edge3);
		%feature("compactdefaultargs") SMDS_FaceOfEdges;
		%feature("autodoc", "	:param edge1:
	:type edge1: SMDS_MeshEdge *
	:param edge2:
	:type edge2: SMDS_MeshEdge *
	:param edge3:
	:type edge3: SMDS_MeshEdge *
	:param edge4:
	:type edge4: SMDS_MeshEdge *
	:rtype: None
") SMDS_FaceOfEdges;
		 SMDS_FaceOfEdges (const SMDS_MeshEdge * edge1,const SMDS_MeshEdge * edge2,const SMDS_MeshEdge * edge3,const SMDS_MeshEdge * edge4);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: SMDSAbs_ElementType
") GetType;
		SMDSAbs_ElementType GetType ();
		%feature("compactdefaultargs") GetEntityType;
		%feature("autodoc", "	:rtype: SMDSAbs_EntityType
") GetEntityType;
		SMDSAbs_EntityType GetEntityType ();
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		int NbEdges ();
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "	:rtype: int
") NbFaces;
		int NbFaces ();
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* /*! * \brief Return node by its index * \param ind - node index * etval const SMDS_MeshNode* - the node */

	:param ind:
	:type ind: int
	:rtype: SMDS_MeshNode *
") GetNode;
		const SMDS_MeshNode * GetNode (const int ind);
};


%extend SMDS_FaceOfEdges {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_FaceOfNodes;
class SMDS_FaceOfNodes : public SMDS_MeshFace {
	public:
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param OS:
	:type OS: std::ostream &
	:rtype: None
") Print;
		void Print (std::ostream & OS);
		%feature("compactdefaultargs") SMDS_FaceOfNodes;
		%feature("autodoc", "	:param node1:
	:type node1: SMDS_MeshNode *
	:param node2:
	:type node2: SMDS_MeshNode *
	:param node3:
	:type node3: SMDS_MeshNode *
	:rtype: None
") SMDS_FaceOfNodes;
		 SMDS_FaceOfNodes (const SMDS_MeshNode * node1,const SMDS_MeshNode * node2,const SMDS_MeshNode * node3);
		%feature("compactdefaultargs") SMDS_FaceOfNodes;
		%feature("autodoc", "	:param node1:
	:type node1: SMDS_MeshNode *
	:param node2:
	:type node2: SMDS_MeshNode *
	:param node3:
	:type node3: SMDS_MeshNode *
	:param node4:
	:type node4: SMDS_MeshNode *
	:rtype: None
") SMDS_FaceOfNodes;
		 SMDS_FaceOfNodes (const SMDS_MeshNode * node1,const SMDS_MeshNode * node2,const SMDS_MeshNode * node3,const SMDS_MeshNode * node4);
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		int NbEdges ();
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "	:rtype: int
") NbFaces;
		int NbFaces ();
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* /*! * \brief Return node by its index * \param ind - node index * etval const SMDS_MeshNode* - the node */

	:param ind:
	:type ind: int
	:rtype: SMDS_MeshNode *
") GetNode;
		const SMDS_MeshNode * GetNode (const int ind);
		%feature("compactdefaultargs") GetEntityType;
		%feature("autodoc", "	:rtype: SMDSAbs_EntityType
") GetEntityType;
		SMDSAbs_EntityType GetEntityType ();
};


%extend SMDS_FaceOfNodes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_PolygonalFaceOfNodes;
class SMDS_PolygonalFaceOfNodes : public SMDS_MeshFace {
	public:
		%feature("compactdefaultargs") SMDS_PolygonalFaceOfNodes;
		%feature("autodoc", "	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *>
	:rtype: None
") SMDS_PolygonalFaceOfNodes;
		 SMDS_PolygonalFaceOfNodes (std::vector<const SMDS_MeshNode *> nodes);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: SMDSAbs_ElementType
") GetType;
		SMDSAbs_ElementType GetType ();
		%feature("compactdefaultargs") GetEntityType;
		%feature("autodoc", "	:rtype: SMDSAbs_EntityType
") GetEntityType;
		SMDSAbs_EntityType GetEntityType ();
		%feature("compactdefaultargs") IsPoly;
		%feature("autodoc", "	:rtype: bool
") IsPoly;
		bool IsPoly ();
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		int NbEdges ();
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "	:rtype: int
") NbFaces;
		int NbFaces ();
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param OS:
	:type OS: std::ostream &
	:rtype: None
") Print;
		void Print (std::ostream & OS);
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* /*! * \brief Return node by its index * \param ind - node index * etval const SMDS_MeshNode* - the node */

	:param ind:
	:type ind: int
	:rtype: SMDS_MeshNode *
") GetNode;
		const SMDS_MeshNode * GetNode (const int ind);
};


%extend SMDS_PolygonalFaceOfNodes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_QuadraticEdge;
class SMDS_QuadraticEdge : public SMDS_MeshEdge {
	public:
		%feature("compactdefaultargs") SMDS_QuadraticEdge;
		%feature("autodoc", "	:param node1:
	:type node1: SMDS_MeshNode *
	:param node2:
	:type node2: SMDS_MeshNode *
	:param node12:
	:type node12: SMDS_MeshNode *
	:rtype: None
") SMDS_QuadraticEdge;
		 SMDS_QuadraticEdge (const SMDS_MeshNode * node1,const SMDS_MeshNode * node2,const SMDS_MeshNode * node12);
		%feature("compactdefaultargs") ChangeNodes;
		%feature("autodoc", "	:param node1:
	:type node1: SMDS_MeshNode *
	:param node2:
	:type node2: SMDS_MeshNode *
	:param node12:
	:type node12: SMDS_MeshNode *
	:rtype: bool
") ChangeNodes;
		bool ChangeNodes (const SMDS_MeshNode * node1,const SMDS_MeshNode * node2,const SMDS_MeshNode * node12);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param OS:
	:type OS: std::ostream &
	:rtype: None
") Print;
		void Print (std::ostream & OS);
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") GetEntityType;
		%feature("autodoc", "	:rtype: SMDSAbs_EntityType
") GetEntityType;
		SMDSAbs_EntityType GetEntityType ();
		%feature("compactdefaultargs") IsQuadratic;
		%feature("autodoc", "	:rtype: bool
") IsQuadratic;
		bool IsQuadratic ();
		%feature("compactdefaultargs") IsMediumNode;
		%feature("autodoc", "	:param node:
	:type node: SMDS_MeshNode *
	:rtype: bool
") IsMediumNode;
		bool IsMediumNode (const SMDS_MeshNode * node);
		%feature("compactdefaultargs") interlacedNodesIterator;
		%feature("autodoc", "	:rtype: SMDS_NodeIteratorPtr
") interlacedNodesIterator;
		SMDS_NodeIteratorPtr interlacedNodesIterator ();
		%feature("compactdefaultargs") interlacedNodesElemIterator;
		%feature("autodoc", "	:rtype: SMDS_ElemIteratorPtr
") interlacedNodesElemIterator;
		SMDS_ElemIteratorPtr interlacedNodesElemIterator ();
};


%extend SMDS_QuadraticEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_QuadraticFaceOfNodes;
class SMDS_QuadraticFaceOfNodes : public SMDS_MeshFace {
	public:
		%feature("compactdefaultargs") SMDS_QuadraticFaceOfNodes;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:rtype: None
") SMDS_QuadraticFaceOfNodes;
		 SMDS_QuadraticFaceOfNodes (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31);
		%feature("compactdefaultargs") SMDS_QuadraticFaceOfNodes;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:rtype: None
") SMDS_QuadraticFaceOfNodes;
		 SMDS_QuadraticFaceOfNodes (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41);
		%feature("compactdefaultargs") GetEntityType;
		%feature("autodoc", "	:rtype: SMDSAbs_EntityType
") GetEntityType;
		SMDSAbs_EntityType GetEntityType ();
		%feature("compactdefaultargs") IsQuadratic;
		%feature("autodoc", "	:rtype: bool
") IsQuadratic;
		bool IsQuadratic ();
		%feature("compactdefaultargs") IsMediumNode;
		%feature("autodoc", "	:param node:
	:type node: SMDS_MeshNode *
	:rtype: bool
") IsMediumNode;
		bool IsMediumNode (const SMDS_MeshNode * node);
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		int NbEdges ();
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "	:rtype: int
") NbFaces;
		int NbFaces ();
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param OS:
	:type OS: std::ostream &
	:rtype: None
") Print;
		void Print (std::ostream & OS);
		%feature("compactdefaultargs") interlacedNodesIterator;
		%feature("autodoc", "	:rtype: SMDS_NodeIteratorPtr
") interlacedNodesIterator;
		SMDS_NodeIteratorPtr interlacedNodesIterator ();
		%feature("compactdefaultargs") interlacedNodesElemIterator;
		%feature("autodoc", "	:rtype: SMDS_ElemIteratorPtr
") interlacedNodesElemIterator;
		SMDS_ElemIteratorPtr interlacedNodesElemIterator ();
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* /*! * \brief Return node by its index * \param ind - node index * etval const SMDS_MeshNode* - the node */

	:param ind:
	:type ind: int
	:rtype: SMDS_MeshNode *
") GetNode;
		const SMDS_MeshNode * GetNode (const int ind);
};


%extend SMDS_QuadraticFaceOfNodes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_QuadraticVolumeOfNodes;
class SMDS_QuadraticVolumeOfNodes : public SMDS_MeshVolume {
	public:
		%feature("compactdefaultargs") SMDS_QuadraticVolumeOfNodes;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:param n14:
	:type n14: SMDS_MeshNode *
	:param n24:
	:type n24: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:rtype: None
") SMDS_QuadraticVolumeOfNodes;
		 SMDS_QuadraticVolumeOfNodes (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31,const SMDS_MeshNode * n14,const SMDS_MeshNode * n24,const SMDS_MeshNode * n34);
		%feature("compactdefaultargs") SMDS_QuadraticVolumeOfNodes;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:param n15:
	:type n15: SMDS_MeshNode *
	:param n25:
	:type n25: SMDS_MeshNode *
	:param n35:
	:type n35: SMDS_MeshNode *
	:param n45:
	:type n45: SMDS_MeshNode *
	:rtype: None
") SMDS_QuadraticVolumeOfNodes;
		 SMDS_QuadraticVolumeOfNodes (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41,const SMDS_MeshNode * n15,const SMDS_MeshNode * n25,const SMDS_MeshNode * n35,const SMDS_MeshNode * n45);
		%feature("compactdefaultargs") SMDS_QuadraticVolumeOfNodes;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:param n45:
	:type n45: SMDS_MeshNode *
	:param n56:
	:type n56: SMDS_MeshNode *
	:param n64:
	:type n64: SMDS_MeshNode *
	:param n14:
	:type n14: SMDS_MeshNode *
	:param n25:
	:type n25: SMDS_MeshNode *
	:param n36:
	:type n36: SMDS_MeshNode *
	:rtype: None
") SMDS_QuadraticVolumeOfNodes;
		 SMDS_QuadraticVolumeOfNodes (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31,const SMDS_MeshNode * n45,const SMDS_MeshNode * n56,const SMDS_MeshNode * n64,const SMDS_MeshNode * n14,const SMDS_MeshNode * n25,const SMDS_MeshNode * n36);
		%feature("compactdefaultargs") SMDS_QuadraticVolumeOfNodes;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:param n7:
	:type n7: SMDS_MeshNode *
	:param n8:
	:type n8: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:param n56:
	:type n56: SMDS_MeshNode *
	:param n67:
	:type n67: SMDS_MeshNode *
	:param n78:
	:type n78: SMDS_MeshNode *
	:param n85:
	:type n85: SMDS_MeshNode *
	:param n15:
	:type n15: SMDS_MeshNode *
	:param n26:
	:type n26: SMDS_MeshNode *
	:param n37:
	:type n37: SMDS_MeshNode *
	:param n48:
	:type n48: SMDS_MeshNode *
	:rtype: None
") SMDS_QuadraticVolumeOfNodes;
		 SMDS_QuadraticVolumeOfNodes (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n7,const SMDS_MeshNode * n8,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41,const SMDS_MeshNode * n56,const SMDS_MeshNode * n67,const SMDS_MeshNode * n78,const SMDS_MeshNode * n85,const SMDS_MeshNode * n15,const SMDS_MeshNode * n26,const SMDS_MeshNode * n37,const SMDS_MeshNode * n48);
		%feature("compactdefaultargs") GetEntityType;
		%feature("autodoc", "	:rtype: SMDSAbs_EntityType
") GetEntityType;
		SMDSAbs_EntityType GetEntityType ();
		%feature("compactdefaultargs") IsQuadratic;
		%feature("autodoc", "	:rtype: bool
") IsQuadratic;
		bool IsQuadratic ();
		%feature("compactdefaultargs") IsMediumNode;
		%feature("autodoc", "	:param node:
	:type node: SMDS_MeshNode *
	:rtype: bool
") IsMediumNode;
		bool IsMediumNode (const SMDS_MeshNode * node);
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		int NbEdges ();
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "	:rtype: int
") NbFaces;
		int NbFaces ();
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param OS:
	:type OS: std::ostream &
	:rtype: None
") Print;
		void Print (std::ostream & OS);
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* /*! * \brief Return node by its index * \param ind - node index * etval const SMDS_MeshNode* - the node */

	:param ind:
	:type ind: int
	:rtype: SMDS_MeshNode *
") GetNode;
		const SMDS_MeshNode * GetNode (const int ind);
};


%extend SMDS_QuadraticVolumeOfNodes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_VolumeOfFaces;
class SMDS_VolumeOfFaces : public SMDS_MeshVolume {
	public:
		%feature("compactdefaultargs") SMDS_VolumeOfFaces;
		%feature("autodoc", "	:param face1:
	:type face1: SMDS_MeshFace *
	:param face2:
	:type face2: SMDS_MeshFace *
	:param face3:
	:type face3: SMDS_MeshFace *
	:param face4:
	:type face4: SMDS_MeshFace *
	:rtype: None
") SMDS_VolumeOfFaces;
		 SMDS_VolumeOfFaces (const SMDS_MeshFace * face1,const SMDS_MeshFace * face2,const SMDS_MeshFace * face3,const SMDS_MeshFace * face4);
		%feature("compactdefaultargs") SMDS_VolumeOfFaces;
		%feature("autodoc", "	:param face1:
	:type face1: SMDS_MeshFace *
	:param face2:
	:type face2: SMDS_MeshFace *
	:param face3:
	:type face3: SMDS_MeshFace *
	:param face4:
	:type face4: SMDS_MeshFace *
	:param face5:
	:type face5: SMDS_MeshFace *
	:rtype: None
") SMDS_VolumeOfFaces;
		 SMDS_VolumeOfFaces (const SMDS_MeshFace * face1,const SMDS_MeshFace * face2,const SMDS_MeshFace * face3,const SMDS_MeshFace * face4,const SMDS_MeshFace * face5);
		%feature("compactdefaultargs") SMDS_VolumeOfFaces;
		%feature("autodoc", "	:param face1:
	:type face1: SMDS_MeshFace *
	:param face2:
	:type face2: SMDS_MeshFace *
	:param face3:
	:type face3: SMDS_MeshFace *
	:param face4:
	:type face4: SMDS_MeshFace *
	:param face5:
	:type face5: SMDS_MeshFace *
	:param face6:
	:type face6: SMDS_MeshFace *
	:rtype: None
") SMDS_VolumeOfFaces;
		 SMDS_VolumeOfFaces (const SMDS_MeshFace * face1,const SMDS_MeshFace * face2,const SMDS_MeshFace * face3,const SMDS_MeshFace * face4,const SMDS_MeshFace * face5,const SMDS_MeshFace * face6);
		%feature("compactdefaultargs") GetEntityType;
		%feature("autodoc", "	:rtype: SMDSAbs_EntityType
") GetEntityType;
		SMDSAbs_EntityType GetEntityType ();
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param OS:
	:type OS: std::ostream &
	:rtype: None
") Print;
		void Print (std::ostream & OS);
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "	:rtype: int
") NbFaces;
		int NbFaces ();
};


%extend SMDS_VolumeOfFaces {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_VolumeOfNodes;
class SMDS_VolumeOfNodes : public SMDS_MeshVolume {
	public:
		%feature("compactdefaultargs") SMDS_VolumeOfNodes;
		%feature("autodoc", "	:param node1:
	:type node1: SMDS_MeshNode *
	:param node2:
	:type node2: SMDS_MeshNode *
	:param node3:
	:type node3: SMDS_MeshNode *
	:param node4:
	:type node4: SMDS_MeshNode *
	:rtype: None
") SMDS_VolumeOfNodes;
		 SMDS_VolumeOfNodes (const SMDS_MeshNode * node1,const SMDS_MeshNode * node2,const SMDS_MeshNode * node3,const SMDS_MeshNode * node4);
		%feature("compactdefaultargs") SMDS_VolumeOfNodes;
		%feature("autodoc", "	:param node1:
	:type node1: SMDS_MeshNode *
	:param node2:
	:type node2: SMDS_MeshNode *
	:param node3:
	:type node3: SMDS_MeshNode *
	:param node4:
	:type node4: SMDS_MeshNode *
	:param node5:
	:type node5: SMDS_MeshNode *
	:rtype: None
") SMDS_VolumeOfNodes;
		 SMDS_VolumeOfNodes (const SMDS_MeshNode * node1,const SMDS_MeshNode * node2,const SMDS_MeshNode * node3,const SMDS_MeshNode * node4,const SMDS_MeshNode * node5);
		%feature("compactdefaultargs") SMDS_VolumeOfNodes;
		%feature("autodoc", "	:param node1:
	:type node1: SMDS_MeshNode *
	:param node2:
	:type node2: SMDS_MeshNode *
	:param node3:
	:type node3: SMDS_MeshNode *
	:param node4:
	:type node4: SMDS_MeshNode *
	:param node5:
	:type node5: SMDS_MeshNode *
	:param node6:
	:type node6: SMDS_MeshNode *
	:rtype: None
") SMDS_VolumeOfNodes;
		 SMDS_VolumeOfNodes (const SMDS_MeshNode * node1,const SMDS_MeshNode * node2,const SMDS_MeshNode * node3,const SMDS_MeshNode * node4,const SMDS_MeshNode * node5,const SMDS_MeshNode * node6);
		%feature("compactdefaultargs") SMDS_VolumeOfNodes;
		%feature("autodoc", "	:param node1:
	:type node1: SMDS_MeshNode *
	:param node2:
	:type node2: SMDS_MeshNode *
	:param node3:
	:type node3: SMDS_MeshNode *
	:param node4:
	:type node4: SMDS_MeshNode *
	:param node5:
	:type node5: SMDS_MeshNode *
	:param node6:
	:type node6: SMDS_MeshNode *
	:param node7:
	:type node7: SMDS_MeshNode *
	:param node8:
	:type node8: SMDS_MeshNode *
	:rtype: None
") SMDS_VolumeOfNodes;
		 SMDS_VolumeOfNodes (const SMDS_MeshNode * node1,const SMDS_MeshNode * node2,const SMDS_MeshNode * node3,const SMDS_MeshNode * node4,const SMDS_MeshNode * node5,const SMDS_MeshNode * node6,const SMDS_MeshNode * node7,const SMDS_MeshNode * node8);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param OS:
	:type OS: std::ostream &
	:rtype: None
") Print;
		void Print (std::ostream & OS);
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "	:rtype: int
") NbFaces;
		int NbFaces ();
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		int NbEdges ();
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: SMDSAbs_ElementType
") GetType;
		SMDSAbs_ElementType GetType ();
		%feature("compactdefaultargs") GetEntityType;
		%feature("autodoc", "	:rtype: SMDSAbs_EntityType
") GetEntityType;
		SMDSAbs_EntityType GetEntityType ();
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* /*! * \brief Return node by its index * \param ind - node index * etval const SMDS_MeshNode* - the node */

	:param ind:
	:type ind: int
	:rtype: SMDS_MeshNode *
") GetNode;
		const SMDS_MeshNode * GetNode (const int ind);
};


%extend SMDS_VolumeOfNodes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMDS_PolyhedralVolumeOfNodes;
class SMDS_PolyhedralVolumeOfNodes : public SMDS_VolumeOfNodes {
	public:
		%feature("compactdefaultargs") SMDS_PolyhedralVolumeOfNodes;
		%feature("autodoc", "	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *>
	:param quantities:
	:type quantities: std::vector<int>
	:rtype: None
") SMDS_PolyhedralVolumeOfNodes;
		 SMDS_PolyhedralVolumeOfNodes (std::vector<const SMDS_MeshNode *> nodes,std::vector<int> quantities);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: SMDSAbs_ElementType
") GetType;
		SMDSAbs_ElementType GetType ();
		%feature("compactdefaultargs") GetEntityType;
		%feature("autodoc", "	:rtype: SMDSAbs_EntityType
") GetEntityType;
		SMDSAbs_EntityType GetEntityType ();
		%feature("compactdefaultargs") IsPoly;
		%feature("autodoc", "	:rtype: bool
") IsPoly;
		bool IsPoly ();
		%feature("compactdefaultargs") ChangeNodes;
		%feature("autodoc", "	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *> &
	:param quantities:
	:type quantities: std::vector<int> &
	:rtype: bool
") ChangeNodes;
		bool ChangeNodes (const std::vector<const SMDS_MeshNode *> & nodes,const std::vector<int> & quantities);
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		int NbEdges ();
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "	:rtype: int
") NbFaces;
		int NbFaces ();
		%feature("compactdefaultargs") NbFaceNodes;
		%feature("autodoc", "	:param face_ind:
	:type face_ind: int
	:rtype: int
") NbFaceNodes;
		int NbFaceNodes (const int face_ind);
		%feature("compactdefaultargs") GetFaceNode;
		%feature("autodoc", "	:param face_ind:
	:type face_ind: int
	:param node_ind:
	:type node_ind: int
	:rtype: SMDS_MeshNode *
") GetFaceNode;
		const SMDS_MeshNode * GetFaceNode (const int face_ind,const int node_ind);
		%feature("compactdefaultargs") GetQuanities;
		%feature("autodoc", "	:rtype: std::vector<int>
") GetQuanities;
		const std::vector<int> & GetQuanities ();
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	:param OS:
	:type OS: std::ostream &
	:rtype: None
") Print;
		void Print (std::ostream & OS);
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "	* /*! * \brief Return node by its index */

	:param ind:
	:type ind: int
	:rtype: SMDS_MeshNode *
") GetNode;
		const SMDS_MeshNode * GetNode (const int ind);
		%feature("compactdefaultargs") uniqueNodesIterator;
		%feature("autodoc", "	* /*! * \brief Return iterator on unique nodes */

	:rtype: SMDS_ElemIteratorPtr
") uniqueNodesIterator;
		SMDS_ElemIteratorPtr uniqueNodesIterator ();
		%feature("compactdefaultargs") NbUniqueNodes;
		%feature("autodoc", "	* /*! * \brief Return nb of unique nodes */

	:rtype: int
") NbUniqueNodes;
		int NbUniqueNodes ();
};


%extend SMDS_PolyhedralVolumeOfNodes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
