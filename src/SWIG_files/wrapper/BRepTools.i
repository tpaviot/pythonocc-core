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
%define BREPTOOLSDOCSTRING
"BRepTools module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_breptools.html"
%enddef
%module (package="OCC.Core", docstring=BREPTOOLSDOCSTRING) BRepTools


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
#include<BRepTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<Bnd_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TopTools_module.hxx>
#include<BRep_module.hxx>
#include<Message_module.hxx>
#include<GeomAbs_module.hxx>
#include<TopLoc_module.hxx>
#include<gp_module.hxx>
#include<Poly_module.hxx>
#include<TopAbs_module.hxx>
#include<TShort_module.hxx>
#include<Poly_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import Bnd.i
%import Geom.i
%import Geom2d.i
%import TopTools.i
%import BRep.i
%import Message.i
%import GeomAbs.i
%import TopLoc.i
%import gp.i
%import Poly.i
%import TopAbs.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(BRepTools_History)
%wrap_handle(BRepTools_Modification)
%wrap_handle(BRepTools_ReShape)
%wrap_handle(BRepTools_GTrsfModification)
%wrap_handle(BRepTools_NurbsConvertModification)
%wrap_handle(BRepTools_TrsfModification)
/* end handles declaration */

/* templates */
%template(BRepTools_MapOfVertexPnt2d) NCollection_DataMap <TopoDS_Shape , TColgp_SequenceOfPnt2d , TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <TopoDS_Shape , TColgp_SequenceOfPnt2d , TopTools_ShapeMapHasher> BRepTools_MapOfVertexPnt2d;
typedef NCollection_DataMap <TopoDS_Shape , TColgp_SequenceOfPnt2d , TopTools_ShapeMapHasher>::Iterator BRepTools_DataMapIteratorOfMapOfVertexPnt2d;
/* end typedefs declaration */

/******************
* class BRepTools *
******************/
%rename(breptools) BRepTools;
class BRepTools {
	public:
		/****************** AddUVBounds ******************/
		%feature("compactdefaultargs") AddUVBounds;
		%feature("autodoc", "* Adds to the box <B> the bounding values in the parametric space of F.
	:param F:
	:type F: TopoDS_Face
	:param B:
	:type B: Bnd_Box2d
	:rtype: void") AddUVBounds;
		static void AddUVBounds (const TopoDS_Face & F,Bnd_Box2d & B);

		/****************** AddUVBounds ******************/
		%feature("compactdefaultargs") AddUVBounds;
		%feature("autodoc", "* Adds to the box <B> the bounding values of the wire in the parametric space of F.
	:param F:
	:type F: TopoDS_Face
	:param W:
	:type W: TopoDS_Wire
	:param B:
	:type B: Bnd_Box2d
	:rtype: void") AddUVBounds;
		static void AddUVBounds (const TopoDS_Face & F,const TopoDS_Wire & W,Bnd_Box2d & B);

		/****************** AddUVBounds ******************/
		%feature("compactdefaultargs") AddUVBounds;
		%feature("autodoc", "* Adds to the box <B> the bounding values of the edge in the parametric space of F.
	:param F:
	:type F: TopoDS_Face
	:param E:
	:type E: TopoDS_Edge
	:param B:
	:type B: Bnd_Box2d
	:rtype: void") AddUVBounds;
		static void AddUVBounds (const TopoDS_Face & F,const TopoDS_Edge & E,Bnd_Box2d & B);

		/****************** Clean ******************/
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "* Removes all the triangulations of the faces of <S> and removes all polygons on triangulations of the edges.
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") Clean;
		static void Clean (const TopoDS_Shape & S);

		/****************** CleanGeometry ******************/
		%feature("compactdefaultargs") CleanGeometry;
		%feature("autodoc", "* Removes geometry (curves and surfaces) from all edges and faces of the shape
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: void") CleanGeometry;
		static void CleanGeometry (const TopoDS_Shape & theShape);

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "* Returns True if the distance between the two vertices is lower than their tolerance.
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: bool") Compare;
		static Standard_Boolean Compare (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "* Returns True if the distance between the two edges is lower than their tolerance.
	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:rtype: bool") Compare;
		static Standard_Boolean Compare (const TopoDS_Edge & E1,const TopoDS_Edge & E2);

		/****************** DetectClosedness ******************/
		%feature("compactdefaultargs") DetectClosedness;
		%feature("autodoc", "* Detect closedness of face in U and V directions
	:param theFace:
	:type theFace: TopoDS_Face
	:param theUclosed:
	:type theUclosed: bool
	:param theVclosed:
	:type theVclosed: bool
	:rtype: void") DetectClosedness;
		static void DetectClosedness (const TopoDS_Face & theFace,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dumps the topological structure and the geometry of <Sh> on the stream <S>.
	:param Sh:
	:type Sh: TopoDS_Shape
	:param S:
	:type S: Standard_OStream
	:rtype: void") Dump;
		static void Dump (const TopoDS_Shape & Sh,Standard_OStream & S);

		/****************** EvalAndUpdateTol ******************/
		%feature("compactdefaultargs") EvalAndUpdateTol;
		%feature("autodoc", "* Evals real tolerance of edge <theE>. <theC3d>, <theC2d>, <theS>, <theF>, <theL> are correspondently 3d curve of edge, 2d curve on surface <theS> and rang of edge If calculated tolerance is more then current edge tolerance, edge is updated. Method returns actual tolerance of edge
	:param theE:
	:type theE: TopoDS_Edge
	:param theC3d:
	:type theC3d: Geom_Curve
	:param theC2d:
	:type theC2d: Geom2d_Curve
	:param theS:
	:type theS: Geom_Surface
	:param theF:
	:type theF: float
	:param theL:
	:type theL: float
	:rtype: float") EvalAndUpdateTol;
		static Standard_Real EvalAndUpdateTol (const TopoDS_Edge & theE,const opencascade::handle<Geom_Curve> & theC3d,const opencascade::handle<Geom2d_Curve> theC2d,const opencascade::handle<Geom_Surface> & theS,const Standard_Real theF,const Standard_Real theL);

		/****************** IsReallyClosed ******************/
		%feature("compactdefaultargs") IsReallyClosed;
		%feature("autodoc", "* Verifies that the edge <E> is found two times on the face <F> before calling BRep_Tool::IsClosed.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: bool") IsReallyClosed;
		static Standard_Boolean IsReallyClosed (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** Map3DEdges ******************/
		%feature("compactdefaultargs") Map3DEdges;
		%feature("autodoc", "* Stores in the map <M> all the 3D topology edges of <S>.
	:param S:
	:type S: TopoDS_Shape
	:param M:
	:type M: TopTools_IndexedMapOfShape
	:rtype: void") Map3DEdges;
		static void Map3DEdges (const TopoDS_Shape & S,TopTools_IndexedMapOfShape & M);

		/****************** OuterWire ******************/
		%feature("compactdefaultargs") OuterWire;
		%feature("autodoc", "* Returns the outer most wire of <F>. Returns a Null wire if <F> has no wires.
	:param F:
	:type F: TopoDS_Face
	:rtype: TopoDS_Wire") OuterWire;
		static TopoDS_Wire OuterWire (const TopoDS_Face & F);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "* Reads a Shape from <S> in returns it in <Sh>. <B> is used to build the shape.
	:param Sh:
	:type Sh: TopoDS_Shape
	:param S:
	:type S: Standard_IStream
	:param B:
	:type B: BRep_Builder
	:param PR: default value is NULL
	:type PR: Message_ProgressIndicator
	:rtype: void") Read;
		static void Read (TopoDS_Shape & Sh,Standard_IStream & S,const BRep_Builder & B,const opencascade::handle<Message_ProgressIndicator> & PR = NULL);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "* Reads a Shape from <File>, returns it in <Sh>. <B> is used to build the shape.
	:param Sh:
	:type Sh: TopoDS_Shape
	:param File:
	:type File: char *
	:param B:
	:type B: BRep_Builder
	:param PR: default value is NULL
	:type PR: Message_ProgressIndicator
	:rtype: bool") Read;
		static Standard_Boolean Read (TopoDS_Shape & Sh,const char * File,const BRep_Builder & B,const opencascade::handle<Message_ProgressIndicator> & PR = NULL);

		/****************** RemoveUnusedPCurves ******************/
		%feature("compactdefaultargs") RemoveUnusedPCurves;
		%feature("autodoc", "* Removes all the pcurves of the edges of <S> that refer to surfaces not belonging to any face of <S>
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") RemoveUnusedPCurves;
		static void RemoveUnusedPCurves (const TopoDS_Shape & S);

		/****************** Triangulation ******************/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "* verifies that each face from the shape <S> has got a triangulation with a deflection <= deflec and the edges a discretisation on this triangulation.
	:param S:
	:type S: TopoDS_Shape
	:param deflec:
	:type deflec: float
	:rtype: bool") Triangulation;
		static Standard_Boolean Triangulation (const TopoDS_Shape & S,const Standard_Real deflec);

		/****************** UVBounds ******************/
		%feature("compactdefaultargs") UVBounds;
		%feature("autodoc", "* Returns in UMin, UMax, VMin, VMax the bounding values in the parametric space of F.
	:param F:
	:type F: TopoDS_Face
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: void") UVBounds;
		static void UVBounds (const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** UVBounds ******************/
		%feature("compactdefaultargs") UVBounds;
		%feature("autodoc", "* Returns in UMin, UMax, VMin, VMax the bounding values of the wire in the parametric space of F.
	:param F:
	:type F: TopoDS_Face
	:param W:
	:type W: TopoDS_Wire
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: void") UVBounds;
		static void UVBounds (const TopoDS_Face & F,const TopoDS_Wire & W,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** UVBounds ******************/
		%feature("compactdefaultargs") UVBounds;
		%feature("autodoc", "* Returns in UMin, UMax, VMin, VMax the bounding values of the edge in the parametric space of F.
	:param F:
	:type F: TopoDS_Face
	:param E:
	:type E: TopoDS_Edge
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: void") UVBounds;
		static void UVBounds (const TopoDS_Face & F,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Update a vertex (nothing is done)
	:param V:
	:type V: TopoDS_Vertex
	:rtype: void") Update;
		static void Update (const TopoDS_Vertex & V);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Update an edge, compute 2d bounding boxes.
	:param E:
	:type E: TopoDS_Edge
	:rtype: void") Update;
		static void Update (const TopoDS_Edge & E);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Update a wire (nothing is done)
	:param W:
	:type W: TopoDS_Wire
	:rtype: void") Update;
		static void Update (const TopoDS_Wire & W);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Update a Face, update UV points.
	:param F:
	:type F: TopoDS_Face
	:rtype: void") Update;
		static void Update (const TopoDS_Face & F);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Update a shell (nothing is done)
	:param S:
	:type S: TopoDS_Shell
	:rtype: void") Update;
		static void Update (const TopoDS_Shell & S);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Update a solid (nothing is done)
	:param S:
	:type S: TopoDS_Solid
	:rtype: void") Update;
		static void Update (const TopoDS_Solid & S);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Update a composite solid (nothing is done)
	:param C:
	:type C: TopoDS_CompSolid
	:rtype: void") Update;
		static void Update (const TopoDS_CompSolid & C);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Update a compound (nothing is done)
	:param C:
	:type C: TopoDS_Compound
	:rtype: void") Update;
		static void Update (const TopoDS_Compound & C);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Update a shape, call the corect update.
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") Update;
		static void Update (const TopoDS_Shape & S);

		/****************** UpdateFaceUVPoints ******************/
		%feature("compactdefaultargs") UpdateFaceUVPoints;
		%feature("autodoc", "* For each edge of the face <F> reset the UV points to the bounding points of the parametric curve of the edge on the face.
	:param theF:
	:type theF: TopoDS_Face
	:rtype: void") UpdateFaceUVPoints;
		static void UpdateFaceUVPoints (const TopoDS_Face & theF);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Writes <Sh> on <S> in an ASCII format.
	:param Sh:
	:type Sh: TopoDS_Shape
	:param S:
	:type S: Standard_OStream
	:param PR: default value is NULL
	:type PR: Message_ProgressIndicator
	:rtype: void") Write;
		static void Write (const TopoDS_Shape & Sh,Standard_OStream & S,const opencascade::handle<Message_ProgressIndicator> & PR = NULL);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Writes <Sh> in <File>.
	:param Sh:
	:type Sh: TopoDS_Shape
	:param File:
	:type File: char *
	:param PR: default value is NULL
	:type PR: Message_ProgressIndicator
	:rtype: bool") Write;
		static Standard_Boolean Write (const TopoDS_Shape & Sh,const char * File,const opencascade::handle<Message_ProgressIndicator> & PR = NULL);

};


%extend BRepTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepTools_History *
**************************/
class BRepTools_History : public Standard_Transient {
	public:
/* public enums */
enum TRelationType {
	TRelationType_Removed = 0,
	TRelationType_Generated = 1,
	TRelationType_Modified = 2,
};

/* end public enums declaration */

		/****************** AddGenerated ******************/
		%feature("compactdefaultargs") AddGenerated;
		%feature("autodoc", "* Methods to set the history. Set the second shape as generated one from the first shape.
	:param theInitial:
	:type theInitial: TopoDS_Shape
	:param theGenerated:
	:type theGenerated: TopoDS_Shape
	:rtype: None") AddGenerated;
		void AddGenerated (const TopoDS_Shape & theInitial,const TopoDS_Shape & theGenerated);

		/****************** AddModified ******************/
		%feature("compactdefaultargs") AddModified;
		%feature("autodoc", "* Set the second shape as modified one from the first shape.
	:param theInitial:
	:type theInitial: TopoDS_Shape
	:param theModified:
	:type theModified: TopoDS_Shape
	:rtype: None") AddModified;
		void AddModified (const TopoDS_Shape & theInitial,const TopoDS_Shape & theModified);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the history.
	:rtype: None") Clear;
		void Clear ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Methods to read the history. Returns all shapes generated from the shape.
	:param theInitial:
	:type theInitial: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & theInitial);

		/****************** HasGenerated ******************/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "* Returns 'true' if there any shapes with Generated elements present
	:rtype: bool") HasGenerated;
		Standard_Boolean HasGenerated ();

		/****************** HasModified ******************/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "* Returns 'true' if there any Modified shapes present
	:rtype: bool") HasModified;
		Standard_Boolean HasModified ();

		/****************** HasRemoved ******************/
		%feature("compactdefaultargs") HasRemoved;
		%feature("autodoc", "* Returns 'true' if there any removed shapes present
	:rtype: bool") HasRemoved;
		Standard_Boolean HasRemoved ();

		/****************** IsRemoved ******************/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "* Returns 'true' if the shape is removed.
	:param theInitial:
	:type theInitial: TopoDS_Shape
	:rtype: bool") IsRemoved;
		Standard_Boolean IsRemoved (const TopoDS_Shape & theInitial);

		/****************** IsSupportedType ******************/
		%feature("compactdefaultargs") IsSupportedType;
		%feature("autodoc", "* Returns 'true' if the type of the shape is supported by the history.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: bool") IsSupportedType;
		static Standard_Boolean IsSupportedType (const TopoDS_Shape & theShape);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "* Returns all shapes modified from the shape.
	:param theInitial:
	:type theInitial: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Modified;
		const TopTools_ListOfShape & Modified (const TopoDS_Shape & theInitial);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Set the shape as removed one.
	:param theRemoved:
	:type theRemoved: TopoDS_Shape
	:rtype: None") Remove;
		void Remove (const TopoDS_Shape & theRemoved);

		/****************** ReplaceGenerated ******************/
		%feature("compactdefaultargs") ReplaceGenerated;
		%feature("autodoc", "* Set the second shape as the only generated one from the first one.
	:param theInitial:
	:type theInitial: TopoDS_Shape
	:param theGenerated:
	:type theGenerated: TopoDS_Shape
	:rtype: None") ReplaceGenerated;
		void ReplaceGenerated (const TopoDS_Shape & theInitial,const TopoDS_Shape & theGenerated);

		/****************** ReplaceModified ******************/
		%feature("compactdefaultargs") ReplaceModified;
		%feature("autodoc", "* Set the second shape as the only modified one from the first one.
	:param theInitial:
	:type theInitial: TopoDS_Shape
	:param theModified:
	:type theModified: TopoDS_Shape
	:rtype: None") ReplaceModified;
		void ReplaceModified (const TopoDS_Shape & theInitial,const TopoDS_Shape & theModified);

};


%make_alias(BRepTools_History)

%extend BRepTools_History {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepTools_Modification *
*******************************/
%nodefaultctor BRepTools_Modification;
class BRepTools_Modification : public Standard_Transient {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* Returns the continuity of <NewE> between <NewF1> and <NewF2>. <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).
	:param E:
	:type E: TopoDS_Edge
	:param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:param NewE:
	:type NewE: TopoDS_Edge
	:param NewF1:
	:type NewF1: TopoDS_Face
	:param NewF2:
	:type NewF2: TopoDS_Face
	:rtype: GeomAbs_Shape") Continuity;
		virtual GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);

		/****************** NewCurve ******************/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "* Returns true if the edge, E, has been modified. If the edge has been modified: - C is the new geometry associated with the edge, - L is its new location, and - Tol is the new tolerance. If the edge has not been modified, this function returns false, and the values of C, L and Tol are not significant.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom_Curve
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:rtype: bool") NewCurve;
		virtual Standard_Boolean NewCurve (const TopoDS_Edge & E,opencascade::handle<Geom_Curve> & C,TopLoc_Location & L,Standard_Real &OutValue);

		/****************** NewCurve2d ******************/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "* Returns true if the edge, E, has a new curve on surface on the face, F. If a new curve exists: - C is the new geometry of the edge, - L is the new location, and - Tol is the new tolerance. NewE is the new edge created from E, and NewF is the new face created from F. If there is no new curve on the face, this function returns false, and the values of C, L and Tol are not significant.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param NewE:
	:type NewE: TopoDS_Edge
	:param NewF:
	:type NewF: TopoDS_Face
	:param C:
	:type C: Geom2d_Curve
	:param Tol:
	:type Tol: float
	:rtype: bool") NewCurve2d;
		virtual Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,opencascade::handle<Geom2d_Curve> & C,Standard_Real &OutValue);

		/****************** NewParameter ******************/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "* Returns true if the vertex V has a new parameter on the edge E. If a new parameter exists: - P is the parameter, and - Tol is the new tolerance. If there is no new parameter this function returns false, and the values of P and Tol are not significant.
	:param V:
	:type V: TopoDS_Vertex
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: bool") NewParameter;
		virtual Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** NewPoint ******************/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "* Returns true if the vertex V has been modified. If V has been modified: - P is the new geometry of the vertex, and - Tol is the new tolerance. If the vertex has not been modified this function returns false, and the values of P and Tol are not significant.
	:param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: bool") NewPoint;
		virtual Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);

		/****************** NewPolygon ******************/
		%feature("compactdefaultargs") NewPolygon;
		%feature("autodoc", "* Returns true if the edge has been modified according to changed polygon. If the edge has been modified: - P is a new polygon
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: Poly_Polygon3D
	:rtype: bool") NewPolygon;
		virtual Standard_Boolean NewPolygon (const TopoDS_Edge & E,opencascade::handle<Poly_Polygon3D> & P);

		/****************** NewPolygonOnTriangulation ******************/
		%feature("compactdefaultargs") NewPolygonOnTriangulation;
		%feature("autodoc", "* Returns true if the edge has been modified according to changed polygon on triangulation. If the edge has been modified: - P is a new polygon on triangulation
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param P:
	:type P: Poly_PolygonOnTriangulation
	:rtype: bool") NewPolygonOnTriangulation;
		virtual Standard_Boolean NewPolygonOnTriangulation (const TopoDS_Edge & E,const TopoDS_Face & F,opencascade::handle<Poly_PolygonOnTriangulation> & P);

		/****************** NewSurface ******************/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "* Returns true if the face, F, has been modified. If the face has been modified: - S is the new geometry of the face, - L is its new location, and - Tol is the new tolerance. The flag, RevWires, is set to true when the modification reverses the normal of the surface, (i.e. the wires have to be reversed). The flag, RevFace, is set to true if the orientation of the modified face changes in the shells which contain it. If the face has not been modified this function returns false, and the values of S, L, Tol, RevWires and RevFace are not significant.
	:param F:
	:type F: TopoDS_Face
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool") NewSurface;
		virtual Standard_Boolean NewSurface (const TopoDS_Face & F,opencascade::handle<Geom_Surface> & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

		/****************** NewTriangulation ******************/
		%feature("compactdefaultargs") NewTriangulation;
		%feature("autodoc", "* Returns true if the face has been modified according to changed triangulation. If the face has been modified: - T is a new triangulation on the face
	:param F:
	:type F: TopoDS_Face
	:param T:
	:type T: Poly_Triangulation
	:rtype: bool") NewTriangulation;
		virtual Standard_Boolean NewTriangulation (const TopoDS_Face & F,opencascade::handle<Poly_Triangulation> & T);

};


%make_alias(BRepTools_Modification)

%extend BRepTools_Modification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepTools_Modifier *
***************************/
class BRepTools_Modifier {
	public:
		class NewCurveInfo {};
		class NewSurfaceInfo {};
		/****************** BRepTools_Modifier ******************/
		%feature("compactdefaultargs") BRepTools_Modifier;
		%feature("autodoc", "* Creates an empty Modifier.
	:param theMutableInput: default value is Standard_False
	:type theMutableInput: bool
	:rtype: None") BRepTools_Modifier;
		 BRepTools_Modifier (Standard_Boolean theMutableInput = Standard_False);

		/****************** BRepTools_Modifier ******************/
		%feature("compactdefaultargs") BRepTools_Modifier;
		%feature("autodoc", "* Creates a modifier on the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") BRepTools_Modifier;
		 BRepTools_Modifier (const TopoDS_Shape & S);

		/****************** BRepTools_Modifier ******************/
		%feature("compactdefaultargs") BRepTools_Modifier;
		%feature("autodoc", "* Creates a modifier on the shape <S>, and performs the modifications described by <M>.
	:param S:
	:type S: TopoDS_Shape
	:param M:
	:type M: BRepTools_Modification
	:rtype: None") BRepTools_Modifier;
		 BRepTools_Modifier (const TopoDS_Shape & S,const opencascade::handle<BRepTools_Modification> & M);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the modifier with the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns Standard_True if the modification has been computed successfully.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsMutableInput ******************/
		%feature("compactdefaultargs") IsMutableInput;
		%feature("autodoc", "* Returns the current mutable input state
	:rtype: bool") IsMutableInput;
		Standard_Boolean IsMutableInput ();

		/****************** ModifiedShape ******************/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "* Returns the modified shape corresponding to <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") ModifiedShape;
		const TopoDS_Shape  ModifiedShape (const TopoDS_Shape & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the modifications described by <M>.
	:param M:
	:type M: BRepTools_Modification
	:param aProgress: default value is NULL
	:type aProgress: Message_ProgressIndicator
	:rtype: None") Perform;
		void Perform (const opencascade::handle<BRepTools_Modification> & M,const opencascade::handle<Message_ProgressIndicator> & aProgress = NULL);

		/****************** SetMutableInput ******************/
		%feature("compactdefaultargs") SetMutableInput;
		%feature("autodoc", "* Sets the mutable input state If true then the input (original) shape can be modified during modification process
	:param theMutableInput:
	:type theMutableInput: bool
	:rtype: None") SetMutableInput;
		void SetMutableInput (Standard_Boolean theMutableInput);

};


%extend BRepTools_Modifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepTools_Quilt *
************************/
class BRepTools_Quilt {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Add the faces of <S> to the Quilt, the faces containing bounded edges are copied.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Add;
		void Add (const TopoDS_Shape & S);

		/****************** BRepTools_Quilt ******************/
		%feature("compactdefaultargs") BRepTools_Quilt;
		%feature("autodoc", ":rtype: None") BRepTools_Quilt;
		 BRepTools_Quilt ();

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "* Binds <Enew> to be the new edge instead of <Eold>. //! The faces of the added shape containing <Eold> will be copied to substitute <Eold> by <Enew>. //! The vertices of <Eold> will be bound to the vertices of <Enew> with the same orientation. //! If <Eold> and <Enew> have different orientations the curves are considered to be opposite and the pcurves of <Eold> will be copied and reversed in the new faces. //! <Eold> must belong to the next added shape, <Enew> must belong to a Shape added before.
	:param Eold:
	:type Eold: TopoDS_Edge
	:param Enew:
	:type Enew: TopoDS_Edge
	:rtype: None") Bind;
		void Bind (const TopoDS_Edge & Eold,const TopoDS_Edge & Enew);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "* Binds <VNew> to be a new vertex instead of <Vold>. //! The faces of the added shape containing <Vold> will be copied to substitute <Vold> by <Vnew>.
	:param Vold:
	:type Vold: TopoDS_Vertex
	:param Vnew:
	:type Vnew: TopoDS_Vertex
	:rtype: None") Bind;
		void Bind (const TopoDS_Vertex & Vold,const TopoDS_Vertex & Vnew);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Returns the shape substitued to <S> in the Quilt.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") Copy;
		const TopoDS_Shape  Copy (const TopoDS_Shape & S);

		/****************** IsCopied ******************/
		%feature("compactdefaultargs") IsCopied;
		%feature("autodoc", "* Returns True if <S> has been copied (<S> is a vertex, an edge or a face)
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsCopied;
		Standard_Boolean IsCopied (const TopoDS_Shape & S);

		/****************** Shells ******************/
		%feature("compactdefaultargs") Shells;
		%feature("autodoc", "* Returns a Compound of shells made from the current set of faces. The shells will be flagged as closed or not closed.
	:rtype: TopoDS_Shape") Shells;
		TopoDS_Shape Shells ();

};


%extend BRepTools_Quilt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepTools_ReShape *
**************************/
class BRepTools_ReShape : public Standard_Transient {
	public:
		class TReplacement {};
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "* Applies the substitutions requests to a shape. //! <until> gives the level of type until which requests are taken into account. For subshapes of the type <until> no rebuild and futher exploring are done. //! NOTE: each subshape can be replaced by shape of the same type or by shape containing only shapes of that type (for example, TopoDS_Edge can be replaced by TopoDS_Edge, TopoDS_Wire or TopoDS_Compound containing TopoDS_Edges). If incompatible shape type is encountered, it is ignored and flag FAIL1 is set in Status.
	:param shape:
	:type shape: TopoDS_Shape
	:param until: default value is TopAbs_SHAPE
	:type until: TopAbs_ShapeEnum
	:rtype: TopoDS_Shape") Apply;
		virtual TopoDS_Shape Apply (const TopoDS_Shape & shape,const TopAbs_ShapeEnum until = TopAbs_SHAPE);

		/****************** BRepTools_ReShape ******************/
		%feature("compactdefaultargs") BRepTools_ReShape;
		%feature("autodoc", "* Returns an empty Reshape
	:rtype: None") BRepTools_ReShape;
		 BRepTools_ReShape ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears all substitutions requests
	:rtype: void") Clear;
		virtual void Clear ();

		/****************** CopyVertex ******************/
		%feature("compactdefaultargs") CopyVertex;
		%feature("autodoc", "* Returns modified copy of vertex if original one is not recorded or returns modified original vertex otherwise.
	:param theV:
	:type theV: TopoDS_Vertex
	:param theTol: default value is -1.0
	:type theTol: float
	:rtype: TopoDS_Vertex") CopyVertex;
		TopoDS_Vertex CopyVertex (const TopoDS_Vertex & theV,const Standard_Real theTol = -1.0);

		/****************** CopyVertex ******************/
		%feature("compactdefaultargs") CopyVertex;
		%feature("autodoc", "* Returns modified copy of vertex if original one is not recorded or returns modified original vertex otherwise.
	:param theV:
	:type theV: TopoDS_Vertex
	:param theNewPos:
	:type theNewPos: gp_Pnt
	:param aTol:
	:type aTol: float
	:rtype: TopoDS_Vertex") CopyVertex;
		TopoDS_Vertex CopyVertex (const TopoDS_Vertex & theV,const gp_Pnt & theNewPos,const Standard_Real aTol);

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "* Returns the history of the substituted shapes.
	:rtype: opencascade::handle<BRepTools_History>") History;
		opencascade::handle<BRepTools_History> History ();

		/****************** IsNewShape ******************/
		%feature("compactdefaultargs") IsNewShape;
		%feature("autodoc", "* Checks if shape has been recorded by reshaper as a value
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: bool") IsNewShape;
		Standard_Boolean IsNewShape (const TopoDS_Shape & theShape);

		/****************** IsRecorded ******************/
		%feature("compactdefaultargs") IsRecorded;
		%feature("autodoc", "* Tells if a shape is recorded for Replace/Remove
	:param shape:
	:type shape: TopoDS_Shape
	:rtype: bool") IsRecorded;
		virtual Standard_Boolean IsRecorded (const TopoDS_Shape & shape);


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetModeConsiderLocation() {
            return (Standard_Boolean) $self->ModeConsiderLocation();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModeConsiderLocation(Standard_Boolean value) {
            $self->ModeConsiderLocation()=value;
            }
        };
		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Sets a request to Remove a Shape whatever the orientation
	:param shape:
	:type shape: TopoDS_Shape
	:rtype: void") Remove;
		virtual void Remove (const TopoDS_Shape & shape);

		/****************** Replace ******************/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "* Sets a request to Replace a Shape by a new one.
	:param shape:
	:type shape: TopoDS_Shape
	:param newshape:
	:type newshape: TopoDS_Shape
	:rtype: None") Replace;
		void Replace (const TopoDS_Shape & shape,const TopoDS_Shape & newshape);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns a complete substitution status for a shape 0 : not recorded, <newsh> = original <shape> < 0: to be removed, <newsh> is NULL > 0: to be replaced, <newsh> is a new item If <last> is False, returns status and new shape recorded in the map directly for the shape, if True and status > 0 then recursively searches for the last status and new shape.
	:param shape:
	:type shape: TopoDS_Shape
	:param newsh:
	:type newsh: TopoDS_Shape
	:param last: default value is Standard_False
	:type last: bool
	:rtype: int") Status;
		virtual Standard_Integer Status (const TopoDS_Shape & shape,TopoDS_Shape & newsh,const Standard_Boolean last = Standard_False);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the new value for an individual shape If not recorded, returns the original shape itself If to be Removed, returns a Null Shape Else, returns the replacing item
	:param shape:
	:type shape: TopoDS_Shape
	:rtype: TopoDS_Shape") Value;
		virtual TopoDS_Shape Value (const TopoDS_Shape & shape);

};


%make_alias(BRepTools_ReShape)

%extend BRepTools_ReShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepTools_ShapeSet *
***************************/
class BRepTools_ShapeSet : public TopTools_ShapeSet {
	public:
		/****************** AddGeometry ******************/
		%feature("compactdefaultargs") AddGeometry;
		%feature("autodoc", "* Stores the goemetry of <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") AddGeometry;
		virtual void AddGeometry (const TopoDS_Shape & S);

		/****************** AddShapes ******************/
		%feature("compactdefaultargs") AddShapes;
		%feature("autodoc", "* Inserts the shape <S2> in the shape <S1>. This method must be redefined to use the correct builder.
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: void") AddShapes;
		virtual void AddShapes (TopoDS_Shape & S1,const TopoDS_Shape & S2);

		/****************** BRepTools_ShapeSet ******************/
		%feature("compactdefaultargs") BRepTools_ShapeSet;
		%feature("autodoc", "* Builds an empty ShapeSet. Parameter <isWithTriangles> is added for XML Persistence
	:param isWithTriangles: default value is Standard_True
	:type isWithTriangles: bool
	:rtype: None") BRepTools_ShapeSet;
		 BRepTools_ShapeSet (const Standard_Boolean isWithTriangles = Standard_True);

		/****************** BRepTools_ShapeSet ******************/
		%feature("compactdefaultargs") BRepTools_ShapeSet;
		%feature("autodoc", "* Builds an empty ShapeSet. Parameter <isWithTriangles> is added for XML Persistence
	:param B:
	:type B: BRep_Builder
	:param isWithTriangles: default value is Standard_True
	:type isWithTriangles: bool
	:rtype: None") BRepTools_ShapeSet;
		 BRepTools_ShapeSet (const BRep_Builder & B,const Standard_Boolean isWithTriangles = Standard_True);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", ":param T:
	:type T: TopAbs_ShapeEnum
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") Check;
		virtual void Check (const TopAbs_ShapeEnum T,TopoDS_Shape & S);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the content of the set.
	:rtype: void") Clear;
		virtual void Clear ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpGeometryToString() {
            std::stringstream s;
            self->DumpGeometry(s);
            return s.str();}
        };
        		/****************** DumpGeometry ******************/
		%feature("compactdefaultargs") DumpGeometry;
		%feature("autodoc", "* Dumps the geometry of <S> on the stream <OS>.
	:param S:
	:type S: TopoDS_Shape
	:param OS:
	:type OS: Standard_OStream
	:rtype: void") DumpGeometry;
		virtual void DumpGeometry (const TopoDS_Shape & S,Standard_OStream & OS);


        %feature("autodoc", "1");
        %extend{
            std::string DumpPolygon3DToString() {
            std::stringstream s;
            self->DumpPolygon3D(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string DumpPolygonOnTriangulationToString() {
            std::stringstream s;
            self->DumpPolygonOnTriangulation(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string DumpTriangulationToString() {
            std::stringstream s;
            self->DumpTriangulation(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadGeometryFromString(std::string src) {
            std::stringstream s(src);
            self->ReadGeometry(s);}
        };
        		/****************** ReadGeometry ******************/
		%feature("compactdefaultargs") ReadGeometry;
		%feature("autodoc", "* Reads the geometry of a shape of type <T> from the stream <IS> and returns it in <S>.
	:param T:
	:type T: TopAbs_ShapeEnum
	:param IS:
	:type IS: Standard_IStream
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") ReadGeometry;
		virtual void ReadGeometry (const TopAbs_ShapeEnum T,Standard_IStream & IS,TopoDS_Shape & S);


        %feature("autodoc", "1");
        %extend{
            void ReadPolygon3DFromString(std::string src) {
            std::stringstream s(src);
            self->ReadPolygon3D(s);}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadPolygonOnTriangulationFromString(std::string src) {
            std::stringstream s(src);
            self->ReadPolygonOnTriangulation(s);}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadTriangulationFromString(std::string src) {
            std::stringstream s(src);
            self->ReadTriangulation(s);}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string WriteGeometryToString() {
            std::stringstream s;
            self->WriteGeometry(s);
            return s.str();}
        };
        		/****************** WriteGeometry ******************/
		%feature("compactdefaultargs") WriteGeometry;
		%feature("autodoc", "* Writes the geometry of <S> on the stream <OS> in a format that can be read back by Read.
	:param S:
	:type S: TopoDS_Shape
	:param OS:
	:type OS: Standard_OStream
	:rtype: void") WriteGeometry;
		virtual void WriteGeometry (const TopoDS_Shape & S,Standard_OStream & OS);

		/****************** WritePolygon3D ******************/
		%feature("compactdefaultargs") WritePolygon3D;
		%feature("autodoc", "* Writes the 3d polygons on the stream <OS> in a format that can be read back by Read.
	:param OS:
	:type OS: Standard_OStream
	:param Compact: default value is Standard_True
	:type Compact: bool
	:rtype: None") WritePolygon3D;
		void WritePolygon3D (Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);

		/****************** WritePolygonOnTriangulation ******************/
		%feature("compactdefaultargs") WritePolygonOnTriangulation;
		%feature("autodoc", "* Writes the polygons on triangulation on the stream <OS> in a format that can be read back by Read.
	:param OS:
	:type OS: Standard_OStream
	:param Compact: default value is Standard_True
	:type Compact: bool
	:rtype: None") WritePolygonOnTriangulation;
		void WritePolygonOnTriangulation (Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);

		/****************** WriteTriangulation ******************/
		%feature("compactdefaultargs") WriteTriangulation;
		%feature("autodoc", "* Writes the triangulation on the stream <OS> in a format that can be read back by Read.
	:param OS:
	:type OS: Standard_OStream
	:param Compact: default value is Standard_True
	:type Compact: bool
	:rtype: None") WriteTriangulation;
		void WriteTriangulation (Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);

};


%extend BRepTools_ShapeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepTools_Substitution *
*******************************/
class BRepTools_Substitution {
	public:
		/****************** BRepTools_Substitution ******************/
		%feature("compactdefaultargs") BRepTools_Substitution;
		%feature("autodoc", ":rtype: None") BRepTools_Substitution;
		 BRepTools_Substitution ();

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Build NewShape from <S> if its subshapes has modified. //! The methods <IsCopied> and <Copy> allows you to keep the resul of <Build>
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Build;
		void Build (const TopoDS_Shape & S);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Reset all the fields.
	:rtype: None") Clear;
		void Clear ();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Returns the set of shapes substitued to <S> .
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Copy;
		const TopTools_ListOfShape & Copy (const TopoDS_Shape & S);

		/****************** IsCopied ******************/
		%feature("compactdefaultargs") IsCopied;
		%feature("autodoc", "* Returns True if <S> has been replaced .
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsCopied;
		Standard_Boolean IsCopied (const TopoDS_Shape & S);

		/****************** Substitute ******************/
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "* <Oldshape> will be replaced by <NewShapes>. //! <NewShapes> can be empty , in this case <OldShape> will disparate from its ancestors. //! if an item of <NewShapes> is oriented FORWARD. it will be oriented as <OldShape> in its ancestors. else it will be reversed.
	:param OldShape:
	:type OldShape: TopoDS_Shape
	:param NewShapes:
	:type NewShapes: TopTools_ListOfShape
	:rtype: None") Substitute;
		void Substitute (const TopoDS_Shape & OldShape,const TopTools_ListOfShape & NewShapes);

};


%extend BRepTools_Substitution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepTools_WireExplorer *
*******************************/
class BRepTools_WireExplorer {
	public:
		/****************** BRepTools_WireExplorer ******************/
		%feature("compactdefaultargs") BRepTools_WireExplorer;
		%feature("autodoc", "* Constructs an empty explorer (which can be initialized using Init)
	:rtype: None") BRepTools_WireExplorer;
		 BRepTools_WireExplorer ();

		/****************** BRepTools_WireExplorer ******************/
		%feature("compactdefaultargs") BRepTools_WireExplorer;
		%feature("autodoc", "* IInitializes an exploration of the wire <W>.
	:param W:
	:type W: TopoDS_Wire
	:rtype: None") BRepTools_WireExplorer;
		 BRepTools_WireExplorer (const TopoDS_Wire & W);

		/****************** BRepTools_WireExplorer ******************/
		%feature("compactdefaultargs") BRepTools_WireExplorer;
		%feature("autodoc", "* Initializes an exploration of the wire <W>. F is used to select the edge connected to the previous in the parametric representation of <F>.
	:param W:
	:type W: TopoDS_Wire
	:param F:
	:type F: TopoDS_Face
	:rtype: None") BRepTools_WireExplorer;
		 BRepTools_WireExplorer (const TopoDS_Wire & W,const TopoDS_Face & F);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the content of the explorer.
	:rtype: None") Clear;
		void Clear ();

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "* Returns the current edge.
	:rtype: TopoDS_Edge") Current;
		const TopoDS_Edge  Current ();

		/****************** CurrentVertex ******************/
		%feature("compactdefaultargs") CurrentVertex;
		%feature("autodoc", "* Returns the vertex connecting the current edge to the previous one.
	:rtype: TopoDS_Vertex") CurrentVertex;
		const TopoDS_Vertex  CurrentVertex ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes an exploration of the wire <W>.
	:param W:
	:type W: TopoDS_Wire
	:rtype: None") Init;
		void Init (const TopoDS_Wire & W);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes an exploration of the wire <W>. F is used to select the edge connected to the previous in the parametric representation of <F>.
	:param W:
	:type W: TopoDS_Wire
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Init;
		void Init (const TopoDS_Wire & W,const TopoDS_Face & F);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes an exploration of the wire <W>. F is used to select the edge connected to the previous in the parametric representation of <F>. <UMIn>, <UMax>, <VMin>, <VMax> - the UV bounds of the face <F>.
	:param W:
	:type W: TopoDS_Wire
	:param F:
	:type F: TopoDS_Face
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None") Init;
		void Init (const TopoDS_Wire & W,const TopoDS_Face & F,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there is a current edge.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Proceeds to the next edge.
	:rtype: None") Next;
		void Next ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Returns an Orientation for the current edge.
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

};


%extend BRepTools_WireExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepTools_GTrsfModification *
************************************/
class BRepTools_GTrsfModification : public BRepTools_Modification {
	public:
		/****************** BRepTools_GTrsfModification ******************/
		%feature("compactdefaultargs") BRepTools_GTrsfModification;
		%feature("autodoc", ":param T:
	:type T: gp_GTrsf
	:rtype: None") BRepTools_GTrsfModification;
		 BRepTools_GTrsfModification (const gp_GTrsf & T);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* Returns the continuity of <NewE> between <NewF1> and <NewF2>. //! <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).
	:param E:
	:type E: TopoDS_Edge
	:param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:param NewE:
	:type NewE: TopoDS_Edge
	:param NewF1:
	:type NewF1: TopoDS_Face
	:param NewF2:
	:type NewF2: TopoDS_Face
	:rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);

		/****************** GTrsf ******************/
		%feature("compactdefaultargs") GTrsf;
		%feature("autodoc", "* Gives an access on the GTrsf.
	:rtype: gp_GTrsf") GTrsf;
		gp_GTrsf  GTrsf ();

		/****************** NewCurve ******************/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "* Returns Standard_True if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom_Curve
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:rtype: bool") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,opencascade::handle<Geom_Curve> & C,TopLoc_Location & L,Standard_Real &OutValue);

		/****************** NewCurve2d ******************/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "* Returns Standard_True if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param NewE:
	:type NewE: TopoDS_Edge
	:param NewF:
	:type NewF: TopoDS_Face
	:param C:
	:type C: Geom2d_Curve
	:param Tol:
	:type Tol: float
	:rtype: bool") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,opencascade::handle<Geom2d_Curve> & C,Standard_Real &OutValue);

		/****************** NewParameter ******************/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "* Returns Standard_True if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
	:param V:
	:type V: TopoDS_Vertex
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: bool") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** NewPoint ******************/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "* Returns Standard_True if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
	:param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: bool") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);

		/****************** NewSurface ******************/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "* Returns Standard_True if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location,<Tol> the new tolerance.<RevWires> has to be set to Standard_True when the modification reverses the normal of the surface.(the wires have to be reversed). <RevFace> has to be set to Standard_True if the orientation of the modified face changes in the shells which contain it. -- Here, <RevFace> will return Standard_True if the -- gp_Trsf is negative.
	:param F:
	:type F: TopoDS_Face
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,opencascade::handle<Geom_Surface> & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

};


%make_alias(BRepTools_GTrsfModification)

%extend BRepTools_GTrsfModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class BRepTools_NurbsConvertModification *
*******************************************/
class BRepTools_NurbsConvertModification : public BRepTools_Modification {
	public:
		/****************** BRepTools_NurbsConvertModification ******************/
		%feature("compactdefaultargs") BRepTools_NurbsConvertModification;
		%feature("autodoc", ":rtype: None") BRepTools_NurbsConvertModification;
		 BRepTools_NurbsConvertModification ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* Returns the continuity of <NewE> between <NewF1> and <NewF2>. //! <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).
	:param E:
	:type E: TopoDS_Edge
	:param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:param NewE:
	:type NewE: TopoDS_Edge
	:param NewF1:
	:type NewF1: TopoDS_Face
	:param NewF2:
	:type NewF2: TopoDS_Face
	:rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);

		/****************** GetUpdatedEdges ******************/
		%feature("compactdefaultargs") GetUpdatedEdges;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") GetUpdatedEdges;
		const TopTools_ListOfShape & GetUpdatedEdges ();

		/****************** NewCurve ******************/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "* Returns Standard_True if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom_Curve
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:rtype: bool") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,opencascade::handle<Geom_Curve> & C,TopLoc_Location & L,Standard_Real &OutValue);

		/****************** NewCurve2d ******************/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "* Returns Standard_True if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param NewE:
	:type NewE: TopoDS_Edge
	:param NewF:
	:type NewF: TopoDS_Face
	:param C:
	:type C: Geom2d_Curve
	:param Tol:
	:type Tol: float
	:rtype: bool") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,opencascade::handle<Geom2d_Curve> & C,Standard_Real &OutValue);

		/****************** NewParameter ******************/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "* Returns Standard_True if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
	:param V:
	:type V: TopoDS_Vertex
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: bool") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** NewPoint ******************/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "* Returns Standard_True if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.
	:param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: bool") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);

		/****************** NewSurface ******************/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "* Returns Standard_True if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location,<Tol> the new tolerance.<RevWires> has to be set to Standard_True when the modification reverses the normal of the surface.(the wires have to be reversed). <RevFace> has to be set to Standard_True if the orientation of the modified face changes in the shells which contain it. -- Here, <RevFace> will return Standard_True if the -- gp_Trsf is negative.
	:param F:
	:type F: TopoDS_Face
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,opencascade::handle<Geom_Surface> & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

};


%make_alias(BRepTools_NurbsConvertModification)

%extend BRepTools_NurbsConvertModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepTools_TrsfModification *
***********************************/
class BRepTools_TrsfModification : public BRepTools_Modification {
	public:
		/****************** BRepTools_TrsfModification ******************/
		%feature("compactdefaultargs") BRepTools_TrsfModification;
		%feature("autodoc", ":param T:
	:type T: gp_Trsf
	:rtype: None") BRepTools_TrsfModification;
		 BRepTools_TrsfModification (const gp_Trsf & T);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* Returns the continuity of <NewE> between <NewF1> and <NewF2>. //! <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).
	:param E:
	:type E: TopoDS_Edge
	:param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:param NewE:
	:type NewE: TopoDS_Edge
	:param NewF1:
	:type NewF1: TopoDS_Face
	:param NewF2:
	:type NewF2: TopoDS_Face
	:rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);

		/****************** NewCurve ******************/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "* Returns true if the edge E has been modified. If the edge has been modified: - C is the new geometric support of the edge, - L is the new location, and - Tol is the new tolerance. If the edge has not been modified, this function returns false, and the values of C, L and Tol are not significant.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom_Curve
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:rtype: bool") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,opencascade::handle<Geom_Curve> & C,TopLoc_Location & L,Standard_Real &OutValue);

		/****************** NewCurve2d ******************/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "* Returns true if the edge E has a new curve on surface on the face F. If a new curve exists: - C is the new geometric support of the edge, - L is the new location, and - Tol the new tolerance. If no new curve exists, this function returns false, and the values of C, L and Tol are not significant.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param NewE:
	:type NewE: TopoDS_Edge
	:param NewF:
	:type NewF: TopoDS_Face
	:param C:
	:type C: Geom2d_Curve
	:param Tol:
	:type Tol: float
	:rtype: bool") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,opencascade::handle<Geom2d_Curve> & C,Standard_Real &OutValue);

		/****************** NewParameter ******************/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "* Returns true if the Vertex V has a new parameter on the edge E. If a new parameter exists: - P is the parameter, and - Tol is the new tolerance. If no new parameter exists, this function returns false, and the values of P and Tol are not significant.
	:param V:
	:type V: TopoDS_Vertex
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: bool") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** NewPoint ******************/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "* Returns true if the vertex V has been modified. If the vertex has been modified: - P is the new geometry of the vertex, and - Tol is the new tolerance. If the vertex has not been modified this function returns false, and the values of P and Tol are not significant.
	:param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: bool") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);

		/****************** NewSurface ******************/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "* Returns true if the face F has been modified. If the face has been modified: - S is the new geometry of the face, - L is its new location, and - Tol is the new tolerance. RevWires is set to true when the modification reverses the normal of the surface (the wires have to be reversed). RevFace is set to true if the orientation of the modified face changes in the shells which contain it. For this class, RevFace returns true if the gp_Trsf associated with this modification is negative.
	:param F:
	:type F: TopoDS_Face
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,opencascade::handle<Geom_Surface> & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

		/****************** Trsf ******************/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "* Provides access to the gp_Trsf associated with this modification. The transformation can be changed.
	:rtype: gp_Trsf") Trsf;
		gp_Trsf  Trsf ();

};


%make_alias(BRepTools_TrsfModification)

%extend BRepTools_TrsfModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
