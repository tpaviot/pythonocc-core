/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define BREPOFFSETAPIDOCSTRING
"BRepOffsetAPI module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepoffsetapi.html"
%enddef
%module (package="OCC.Core", docstring=BREPOFFSETAPIDOCSTRING) BRepOffsetAPI


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
#include<BRepOffsetAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Message_module.hxx>
#include<TopTools_module.hxx>
#include<Draft_module.hxx>
#include<Geom_module.hxx>
#include<GeomAbs_module.hxx>
#include<BRepFill_module.hxx>
#include<BRepOffset_module.hxx>
#include<BRepPrimAPI_module.hxx>
#include<GeomFill_module.hxx>
#include<Law_module.hxx>
#include<Approx_module.hxx>
#include<Bnd_module.hxx>
#include<AppParCurves_module.hxx>
#include<MAT_module.hxx>
#include<TColgp_module.hxx>
#include<BRepAlgo_module.hxx>
#include<FEmTool_module.hxx>
#include<TopOpeBRepBuild_module.hxx>
#include<Plate_module.hxx>
#include<Bisector_module.hxx>
#include<TColStd_module.hxx>
#include<PLib_module.hxx>
#include<BRepMAT2d_module.hxx>
#include<TColGeom2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<BRepClass3d_module.hxx>
#include<BRep_module.hxx>
#include<BRepTools_module.hxx>
#include<Quantity_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopLoc_module.hxx>
#include<AdvApp2Var_module.hxx>
#include<TColGeom_module.hxx>
#include<IntSurf_module.hxx>
#include<Message_module.hxx>
#include<Convert_module.hxx>
#include<Intf_module.hxx>
#include<TShort_module.hxx>
#include<TopOpeBRepDS_module.hxx>
#include<Poly_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<Extrema_module.hxx>
#include<Geom2d_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<GeomPlate_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom_module.hxx>
#include<BRepAlgo_module.hxx>
#include<ChFiDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepBuilderAPI.i
%import TopoDS.i
%import gp.i
%import Message.i
%import TopTools.i
%import Draft.i
%import Geom.i
%import GeomAbs.i
%import BRepFill.i
%import BRepOffset.i
%import BRepPrimAPI.i
%import GeomFill.i
%import Law.i
%import Approx.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(BRepOffsetAPI_SequenceOfSequenceOfReal) NCollection_Sequence<TColStd_SequenceOfReal>;

%extend NCollection_Sequence<TColStd_SequenceOfReal> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(BRepOffsetAPI_SequenceOfSequenceOfShape) NCollection_Sequence<TopTools_SequenceOfShape>;

%extend NCollection_Sequence<TopTools_SequenceOfShape> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<TColStd_SequenceOfReal> BRepOffsetAPI_SequenceOfSequenceOfReal;
typedef NCollection_Sequence<TopTools_SequenceOfShape> BRepOffsetAPI_SequenceOfSequenceOfShape;
typedef BRepBuilderAPI_Sewing BRepOffsetAPI_Sewing;
/* end typedefs declaration */

/*********************************
* class BRepOffsetAPI_DraftAngle *
*********************************/
class BRepOffsetAPI_DraftAngle : public BRepBuilderAPI_ModifyShape {
	public:
		/****** BRepOffsetAPI_DraftAngle::BRepOffsetAPI_DraftAngle ******/
		/****** md5 signature: b9af936a89856f8fb520f412bc5baac1 ******/
		%feature("compactdefaultargs") BRepOffsetAPI_DraftAngle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty algorithm to perform taper-adding transformations on faces of a shape. Use the Init function to define the shape to be tapered.
") BRepOffsetAPI_DraftAngle;
		 BRepOffsetAPI_DraftAngle();

		/****** BRepOffsetAPI_DraftAngle::BRepOffsetAPI_DraftAngle ******/
		/****** md5 signature: 0e4d1cafe2cf2c602b747516c3fa76bf ******/
		%feature("compactdefaultargs") BRepOffsetAPI_DraftAngle;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initializes an algorithm to perform taper-adding transformations on faces of the shape S. S will be referred to as the initial shape of the algorithm.
") BRepOffsetAPI_DraftAngle;
		 BRepOffsetAPI_DraftAngle(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_DraftAngle::Add ******/
		/****** md5 signature: 4ce7b2535b631733771b79ec806daaad ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Direction: gp_Dir
Angle: float
NeutralPlane: gp_Pln
Flag: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Adds the face F, the direction Direction, the angle Angle, the plane NeutralPlane, and the flag Flag to the framework created at construction time, and with this data, defines the taper-adding transformation. F is a face, which belongs to the initial shape of this algorithm or to the shape loaded by the function Init. Only planar, cylindrical or conical faces can be tapered: - If the face F is planar, it is tapered by inclining it through the angle Angle about the line of intersection between the plane NeutralPlane and F. Direction indicates the side of NeutralPlane from which matter is removed if Angle is positive or added if Angle is negative. - If F is cylindrical or conical, it is transformed in the same way on a single face, resulting in a conical face if F is cylindrical, and a conical or cylindrical face if it is already conical. The taper-adding transformation is propagated from the face F along the series of planar, cylindrical or conical faces containing F, which are tangential to one another. Use the function AddDone to check if this taper-adding transformation is successful. Warning Nothing is done if: - the face F does not belong to the initial shape of this algorithm, or - the face F is not planar, cylindrical or conical. Exceptions - Standard_NullObject if the initial shape is not defined, i.e. if this algorithm has not been initialized with the non-empty constructor or the Init function. - Standard_ConstructionError if the previous call to Add has failed. The function AddDone ought to have been used to check for this, and the function Remove to cancel the results of the unsuccessful taper-adding transformation and to retrieve the previous shape.
") Add;
		void Add(const TopoDS_Face & F, const gp_Dir & Direction, const Standard_Real Angle, const gp_Pln & NeutralPlane, const Standard_Boolean Flag = Standard_True);

		/****** BRepOffsetAPI_DraftAngle::AddDone ******/
		/****** md5 signature: 225f23d0ffea018222bcb24ee9311796 ******/
		%feature("compactdefaultargs") AddDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the previous taper-adding transformation performed by this algorithm in the last call to Add, was successful. If AddDone returns false: - the function ProblematicShape returns the face on which the error occurred, - the function Remove has to be used to cancel the results of the unsuccessful taper-adding transformation and to retrieve the previous shape. Exceptions Standard_NullObject if the initial shape has not been defined, i.e. if this algorithm has not been initialized with the non-empty constructor or the .Init function.
") AddDone;
		Standard_Boolean AddDone();

		/****** BRepOffsetAPI_DraftAngle::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Builds the resulting shape (redefined from MakeShape).
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffsetAPI_DraftAngle::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Cancels the results of all taper-adding transformations performed by this algorithm on the initial shape. These results will have been defined by successive calls to the function Add.
") Clear;
		void Clear();

		/****** BRepOffsetAPI_DraftAngle::ConnectedFaces ******/
		/****** md5 signature: be55b5929554f7dfde3eec1b9ab3f977 ******/
		%feature("compactdefaultargs") ConnectedFaces;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
TopTools_ListOfShape

Description
-----------
Returns all the faces which have been added together with the face <F>.
") ConnectedFaces;
		const TopTools_ListOfShape & ConnectedFaces(const TopoDS_Face & F);

		/****** BRepOffsetAPI_DraftAngle::CorrectWires ******/
		/****** md5 signature: 81ca023a91873cfa63a02fb08e0cbd78 ******/
		%feature("compactdefaultargs") CorrectWires;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") CorrectWires;
		void CorrectWires();

		/****** BRepOffsetAPI_DraftAngle::Generated ******/
		/****** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes generated from the shape <S>.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_DraftAngle::Init ******/
		/****** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initializes, or reinitializes this taper-adding algorithm with the shape S. S will be referred to as the initial shape of this algorithm.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_DraftAngle::Modified ******/
		/****** md5 signature: 73ccfe97b4ed94547a190332224ffe23 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes modified from the shape <S>.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_DraftAngle::ModifiedFaces ******/
		/****** md5 signature: cd09c09ae96bda548c679db0e897d478 ******/
		%feature("compactdefaultargs") ModifiedFaces;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns all the faces on which a modification has been given.
") ModifiedFaces;
		const TopTools_ListOfShape & ModifiedFaces();

		/****** BRepOffsetAPI_DraftAngle::ModifiedShape ******/
		/****** md5 signature: 52b70a5b01905688e2ddbc00ab060e3c ******/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the modified shape corresponding to <S>. S can correspond to the entire initial shape or to its subshape. Raises exceptions Standard_NoSuchObject if S is not the initial shape or a subshape of the initial shape to which the transformation has been applied.
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_DraftAngle::ProblematicShape ******/
		/****** md5 signature: 4b993ee84b1645cd4a03936d51cfc6ec ******/
		%feature("compactdefaultargs") ProblematicShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the shape on which an error occurred after an unsuccessful call to Add or when IsDone returns false. Exceptions Standard_NullObject if the initial shape has not been defined, i.e. if this algorithm has not been initialized with the non-empty constructor or the Init function.
") ProblematicShape;
		const TopoDS_Shape ProblematicShape();

		/****** BRepOffsetAPI_DraftAngle::Remove ******/
		/****** md5 signature: 2dda97e74bdcd077a8ecce9d227e7fa7 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Cancels the taper-adding transformation previously performed by this algorithm on the face F and the series of tangential faces which contain F, and retrieves the shape before the last taper-adding transformation. Warning You will have to use this function if the previous call to Add fails. Use the function AddDone to check it. Exceptions - Standard_NullObject if the initial shape has not been defined, i.e. if this algorithm has not been initialized with the non-empty constructor or the Init function. - Standard_NoSuchObject if F has not been added or has already been removed.
") Remove;
		void Remove(const TopoDS_Face & F);

		/****** BRepOffsetAPI_DraftAngle::Status ******/
		/****** md5 signature: 26dc5cff0cd2168b2136c6f9bb9e099c ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
Draft_ErrorStatus

Description
-----------
Returns an error status when an error has occurred (Face, Edge or Vertex recomputation problem). Otherwise returns Draft_NoError. The method may be called if AddDone returns Standard_False, or when IsDone returns Standard_False.
") Status;
		Draft_ErrorStatus Status();

};


%extend BRepOffsetAPI_DraftAngle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class BRepOffsetAPI_FindContigousEdges *
*****************************************/
class BRepOffsetAPI_FindContigousEdges {
	public:
		/****** BRepOffsetAPI_FindContigousEdges::BRepOffsetAPI_FindContigousEdges ******/
		/****** md5 signature: fd7a2ffb22004077f79a7dae2c0d118b ******/
		%feature("compactdefaultargs") BRepOffsetAPI_FindContigousEdges;
		%feature("autodoc", "
Parameters
----------
tolerance: float (optional, default to 1.0e-06)
option: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Initializes an algorithm for identifying contiguous edges on shapes with tolerance as the tolerance of contiguity (defaulted to 1.0e-6). This tolerance value is used to determine whether two edges or sections of edges are coincident. Use the function Add to define the shapes to be checked. Set option to false. This argument (defaulted to true) will serve in subsequent software releases for performing an analysis of degenerated shapes.
") BRepOffsetAPI_FindContigousEdges;
		 BRepOffsetAPI_FindContigousEdges(const Standard_Real tolerance = 1.0e-06, const Standard_Boolean option = Standard_True);

		/****** BRepOffsetAPI_FindContigousEdges::Add ******/
		/****** md5 signature: e2be6f2074943772e403ebcbe671347a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
None

Description
-----------
Adds the shape shape to the list of shapes to be checked by this algorithm. Once all the shapes to be checked have been added, use the function Perform to find the contiguous edges and the function ContigousEdge to return these edges.
") Add;
		void Add(const TopoDS_Shape & shape);

		/****** BRepOffsetAPI_FindContigousEdges::ContigousEdge ******/
		/****** md5 signature: 528f0ebefe61a096548f88451970603d ******/
		%feature("compactdefaultargs") ContigousEdge;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
TopoDS_Edge

Description
-----------
Returns the contiguous edge of index index found by the function Perform on the shapes added to this algorithm. Exceptions Standard_OutOfRange if: - index is less than 1, or - index is greater than the number of contiguous edges found by the function Perform on the shapes added to this algorithm.
") ContigousEdge;
		const TopoDS_Edge ContigousEdge(const Standard_Integer index);

		/****** BRepOffsetAPI_FindContigousEdges::ContigousEdgeCouple ******/
		/****** md5 signature: 783b24657c04ecf4547ffd8cfddcc368 ******/
		%feature("compactdefaultargs") ContigousEdgeCouple;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
TopTools_ListOfShape

Description
-----------
Returns a list of edges coincident with the contiguous edge of index index found by the function Perform. There are as many edges in the list as there are faces adjacent to this contiguous edge. Exceptions Standard_OutOfRange if: - index is less than 1, or - index is greater than the number of contiguous edges found by the function Perform on the shapes added to this algorithm.
") ContigousEdgeCouple;
		const TopTools_ListOfShape & ContigousEdgeCouple(const Standard_Integer index);

		/****** BRepOffsetAPI_FindContigousEdges::DegeneratedShape ******/
		/****** md5 signature: e6eb24cfb41ed6276abbd22e81382ad4 ******/
		%feature("compactdefaultargs") DegeneratedShape;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
TopoDS_Shape

Description
-----------
Gives a degenerated shape.
") DegeneratedShape;
		const TopoDS_Shape DegeneratedShape(const Standard_Integer index);

		/****** BRepOffsetAPI_FindContigousEdges::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Dump properties of resulting shape.
") Dump;
		void Dump();

		/****** BRepOffsetAPI_FindContigousEdges::Init ******/
		/****** md5 signature: dd6c1b1cc9e67e536ec1bfeda1eb7f2d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
tolerance: float
option: bool

Return
-------
None

Description
-----------
Initializes this algorithm for identifying contiguous edges on shapes using the tolerance of contiguity tolerance. This tolerance value is used to determine whether two edges or sections of edges are coincident. Use the function Add to define the shapes to be checked. Sets <option> to false.
") Init;
		void Init(const Standard_Real tolerance, const Standard_Boolean option);

		/****** BRepOffsetAPI_FindContigousEdges::IsDegenerated ******/
		/****** md5 signature: 84979167278e746e62a21a790a7cd87e ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
bool

Description
-----------
Indicates if a input shape is degenerated.
") IsDegenerated;
		Standard_Boolean IsDegenerated(const TopoDS_Shape & shape);

		/****** BRepOffsetAPI_FindContigousEdges::IsModified ******/
		/****** md5 signature: 1d5d4f025b62ca0ccc6672d39cdf22fc ******/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the copy of the initial shape shape was modified by the function Perform (i.e. if one or more of its edges was broken down into contiguous and non-contiguous sections). Warning Returns false if shape is not one of the initial shapes added to this algorithm.
") IsModified;
		Standard_Boolean IsModified(const TopoDS_Shape & shape);

		/****** BRepOffsetAPI_FindContigousEdges::Modified ******/
		/****** md5 signature: 8eae36e55014fa2f45331a4af35cda4c ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Gives a modifieded shape Raises NoSuchObject if shape has not been modified.
") Modified;
		const TopoDS_Shape Modified(const TopoDS_Shape & shape);

		/****** BRepOffsetAPI_FindContigousEdges::NbContigousEdges ******/
		/****** md5 signature: c293fac1d421e2d1f7207054b4a45923 ******/
		%feature("compactdefaultargs") NbContigousEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of contiguous edges found by the function Perform on the shapes added to this algorithm.
") NbContigousEdges;
		Standard_Integer NbContigousEdges();

		/****** BRepOffsetAPI_FindContigousEdges::NbDegeneratedShapes ******/
		/****** md5 signature: 002576d80bfb4575f6cdfeeff5b81a1e ******/
		%feature("compactdefaultargs") NbDegeneratedShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the number of degenerated shapes.
") NbDegeneratedShapes;
		Standard_Integer NbDegeneratedShapes();

		/****** BRepOffsetAPI_FindContigousEdges::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Finds coincident parts of edges of two or more shapes added to this algorithm and breaks down these edges into contiguous and non-contiguous sections on copies of the initial shapes. The function ContigousEdge returns contiguous edges. The function Modified can be used to return modified copies of the initial shapes where one or more edges were broken down into contiguous and non-contiguous sections. Warning This function must be used once all the shapes to be checked have been added. It is not possible to add further shapes subsequently and then to repeat the call to Perform.
") Perform;
		void Perform();

		/****** BRepOffsetAPI_FindContigousEdges::SectionToBoundary ******/
		/****** md5 signature: 8753cd22e70a557633e4602d07baeefe ******/
		%feature("compactdefaultargs") SectionToBoundary;
		%feature("autodoc", "
Parameters
----------
section: TopoDS_Edge

Return
-------
TopoDS_Edge

Description
-----------
Returns the edge on the initial shape, of which the modified copy contains the edge section. section is coincident with a contiguous edge found by the function Perform. Use the function ContigousEdgeCouple to obtain a valid section. This information is useful for verification purposes, since it provides a means of determining the surface to which the contiguous edge belongs. Exceptions Standard_NoSuchObject if section is not coincident with a contiguous edge. Use the function ContigousEdgeCouple to obtain a valid section.
") SectionToBoundary;
		const TopoDS_Edge SectionToBoundary(const TopoDS_Edge & section);

};


%extend BRepOffsetAPI_FindContigousEdges {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def NbEdges(self):
		pass
	}
};

/********************************
* class BRepOffsetAPI_MakeDraft *
********************************/
class BRepOffsetAPI_MakeDraft : public BRepBuilderAPI_MakeShape {
	public:
		/****** BRepOffsetAPI_MakeDraft::BRepOffsetAPI_MakeDraft ******/
		/****** md5 signature: 71eb0e38473fd7d62078ab8ae3d81222 ******/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeDraft;
		%feature("autodoc", "
Parameters
----------
Shape: TopoDS_Shape
Dir: gp_Dir
Angle: float

Return
-------
None

Description
-----------
Constructs the draft surface object defined by the shape Shape, the direction Dir, and the angle Angle. Shape must be a TopoDS_Wire, Topo_DS_Face or TopoDS_Shell with free boundaries. Exceptions Standard_NotDone if Shape is not a TopoDS_Wire, Topo_DS_Face or TopoDS_Shell with free boundaries.
") BRepOffsetAPI_MakeDraft;
		 BRepOffsetAPI_MakeDraft(const TopoDS_Shape & Shape, const gp_Dir & Dir, const Standard_Real Angle);

		/****** BRepOffsetAPI_MakeDraft::Generated ******/
		/****** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes generated from the shape <S>.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_MakeDraft::Perform ******/
		/****** md5 signature: b03f32ebc120d00e3e8e32d44b202b9d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
LengthMax: float

Return
-------
None

Description
-----------
Performs the draft using the length LengthMax as the maximum length for the corner edge between two draft faces.
") Perform;
		void Perform(const Standard_Real LengthMax);

		/****** BRepOffsetAPI_MakeDraft::Perform ******/
		/****** md5 signature: 3a80e47101026da2c90ae735de0ac1b9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Surface: Geom_Surface
KeepInsideSurface: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs the draft up to the surface Surface. If KeepInsideSurface is true, the part of Surface inside the draft is kept in the result.
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & Surface, const Standard_Boolean KeepInsideSurface = Standard_True);

		/****** BRepOffsetAPI_MakeDraft::Perform ******/
		/****** md5 signature: c18fafced10e4c987e315cfc1b3d96ad ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
StopShape: TopoDS_Shape
KeepOutSide: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs the draft up to the shape StopShape. If KeepOutSide is true, the part of StopShape which is outside the Draft is kept in the result.
") Perform;
		void Perform(const TopoDS_Shape & StopShape, const Standard_Boolean KeepOutSide = Standard_True);

		/****** BRepOffsetAPI_MakeDraft::SetDraft ******/
		/****** md5 signature: 6a0b2e71733b262480aa38daaecff626 ******/
		%feature("compactdefaultargs") SetDraft;
		%feature("autodoc", "
Parameters
----------
IsInternal: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets the direction of the draft for this object. If IsInternal is true, the draft is internal to the argument Shape used in the constructor.
") SetDraft;
		void SetDraft(const Standard_Boolean IsInternal = Standard_False);

		/****** BRepOffsetAPI_MakeDraft::SetOptions ******/
		/****** md5 signature: 736d57b77de1cd53364406245ccef568 ******/
		%feature("compactdefaultargs") SetOptions;
		%feature("autodoc", "
Parameters
----------
Style: BRepBuilderAPI_TransitionMode (optional, default to BRepBuilderAPI_RightCorner)
AngleMin: float (optional, default to 0.01)
AngleMax: float (optional, default to 3.0)

Return
-------
None

Description
-----------
Sets the options of this draft tool. If a transition has to be performed, it can be defined by the mode Style as RightCorner or RoundCorner, RightCorner being a corner defined by a sharp angle, and RoundCorner being a rounded corner. AngleMin is an angular tolerance used to detect whether a transition has to be performed or not. AngleMax sets the maximum value within which a RightCorner transition can be performed. AngleMin and AngleMax are expressed in radians.
") SetOptions;
		void SetOptions(const BRepBuilderAPI_TransitionMode Style = BRepBuilderAPI_RightCorner, const Standard_Real AngleMin = 0.01, const Standard_Real AngleMax = 3.0);

		/****** BRepOffsetAPI_MakeDraft::Shell ******/
		/****** md5 signature: 3ea4686086a18491532865f1cfbce9ad ******/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Return
-------
TopoDS_Shell

Description
-----------
Returns the shell resulting from performance of the draft along the wire.
") Shell;
		TopoDS_Shell Shell();

};


%extend BRepOffsetAPI_MakeDraft {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepOffsetAPI_MakeEvolved *
**********************************/
class BRepOffsetAPI_MakeEvolved : public BRepBuilderAPI_MakeShape {
	public:
		/****** BRepOffsetAPI_MakeEvolved::BRepOffsetAPI_MakeEvolved ******/
		/****** md5 signature: 10d85cbe93d42416417568f3ca2d5c30 ******/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeEvolved;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepOffsetAPI_MakeEvolved;
		 BRepOffsetAPI_MakeEvolved();

		/****** BRepOffsetAPI_MakeEvolved::BRepOffsetAPI_MakeEvolved ******/
		/****** md5 signature: ca863b02acd410c7e5d5badc6d5c93f9 ******/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeEvolved;
		%feature("autodoc", "
Parameters
----------
theSpine: TopoDS_Shape
theProfile: TopoDS_Wire
theJoinType: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
theIsAxeProf: bool (optional, default to Standard_True)
theIsSolid: bool (optional, default to Standard_False)
theIsProfOnSpine: bool (optional, default to Standard_False)
theTol: float (optional, default to 0.0000001)
theIsVolume: bool (optional, default to Standard_False)
theRunInParallel: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs an evolved shape by sweeping the profile (theProfile) along the spine (theSpine). theSpine can be shape only of type wire or face. See description to this class for detailed information.
") BRepOffsetAPI_MakeEvolved;
		 BRepOffsetAPI_MakeEvolved(const TopoDS_Shape & theSpine, const TopoDS_Wire & theProfile, const GeomAbs_JoinType theJoinType = GeomAbs_Arc, const Standard_Boolean theIsAxeProf = Standard_True, const Standard_Boolean theIsSolid = Standard_False, const Standard_Boolean theIsProfOnSpine = Standard_False, const Standard_Real theTol = 0.0000001, const Standard_Boolean theIsVolume = Standard_False, const Standard_Boolean theRunInParallel = Standard_False);

		/****** BRepOffsetAPI_MakeEvolved::Bottom ******/
		/****** md5 signature: 25476ceb1dec30bd7775d9279e3f641c ******/
		%feature("compactdefaultargs") Bottom;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return the face Bottom if <Solid> is True in the constructor.
") Bottom;
		const TopoDS_Shape Bottom();

		/****** BRepOffsetAPI_MakeEvolved::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Builds the resulting shape (redefined from MakeShape).
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffsetAPI_MakeEvolved::Evolved ******/
		/****** md5 signature: 9cd16375e762072934864900214c9cab ******/
		%feature("compactdefaultargs") Evolved;
		%feature("autodoc", "Return
-------
BRepFill_Evolved

Description
-----------
No available documentation.
") Evolved;
		const BRepFill_Evolved & Evolved();

		/****** BRepOffsetAPI_MakeEvolved::GeneratedShapes ******/
		/****** md5 signature: d6b410f91bd0b638e68b4f66ed161f82 ******/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "
Parameters
----------
SpineShape: TopoDS_Shape
ProfShape: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the shapes created from a subshape <SpineShape> of the spine and a subshape <ProfShape> on the profile.
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes(const TopoDS_Shape & SpineShape, const TopoDS_Shape & ProfShape);

		/****** BRepOffsetAPI_MakeEvolved::Top ******/
		/****** md5 signature: c5b73d85ae980e083fd62982344b1f23 ******/
		%feature("compactdefaultargs") Top;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return the face Top if <Solid> is True in the constructor.
") Top;
		const TopoDS_Shape Top();

};


%extend BRepOffsetAPI_MakeEvolved {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepOffsetAPI_MakeFilling *
**********************************/
class BRepOffsetAPI_MakeFilling : public BRepBuilderAPI_MakeShape {
	public:
		/****** BRepOffsetAPI_MakeFilling::BRepOffsetAPI_MakeFilling ******/
		/****** md5 signature: 6b2c1458dee21e3098205eace85ff1c2 ******/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeFilling;
		%feature("autodoc", "
Parameters
----------
Degree: int (optional, default to 3)
NbPtsOnCur: int (optional, default to 15)
NbIter: int (optional, default to 2)
Anisotropie: bool (optional, default to Standard_False)
Tol2d: float (optional, default to 0.00001)
Tol3d: float (optional, default to 0.0001)
TolAng: float (optional, default to 0.01)
TolCurv: float (optional, default to 0.1)
MaxDeg: int (optional, default to 8)
MaxSegments: int (optional, default to 9)

Return
-------
None

Description
-----------
Constructs a wire filling object defined by - the energy minimizing criterion Degree - the number of points on the curve NbPntsOnCur - the number of iterations NbIter - the Boolean Anisotropie - the 2D tolerance Tol2d - the 3D tolerance Tol3d - the angular tolerance TolAng - the tolerance for curvature TolCur - the highest polynomial degree MaxDeg - the greatest number of segments MaxSeg. If the Boolean Anistropie is true, the algorithm's performance is better in cases where the ratio of the length U and the length V indicate a great difference between the two. In other words, when the surface is, for example, extremely long.
") BRepOffsetAPI_MakeFilling;
		 BRepOffsetAPI_MakeFilling(const Standard_Integer Degree = 3, const Standard_Integer NbPtsOnCur = 15, const Standard_Integer NbIter = 2, const Standard_Boolean Anisotropie = Standard_False, const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1, const Standard_Integer MaxDeg = 8, const Standard_Integer MaxSegments = 9);

		/****** BRepOffsetAPI_MakeFilling::Add ******/
		/****** md5 signature: f3f101643ae89de07cd1205b58a9a0bc ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Constr: TopoDS_Edge
Order: GeomAbs_Shape
IsBound: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
Adds a new constraint which also defines an edge of the wire of the face Order: Order of the constraint: GeomAbs_C0: the surface has to pass by 3D representation of the edge GeomAbs_G1: the surface has to pass by 3D representation of the edge and to respect tangency with the first face of the edge GeomAbs_G2: the surface has to pass by 3D representation of the edge and to respect tangency and curvature with the first face of the edge. Raises ConstructionError if the edge has no representation on a face and Order is GeomAbs_G1 or GeomAbs_G2.
") Add;
		Standard_Integer Add(const TopoDS_Edge & Constr, const GeomAbs_Shape Order, const Standard_Boolean IsBound = Standard_True);

		/****** BRepOffsetAPI_MakeFilling::Add ******/
		/****** md5 signature: 415312c3d021976e6e2f3b6a96253fb7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Constr: TopoDS_Edge
Support: TopoDS_Face
Order: GeomAbs_Shape
IsBound: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
Adds a new constraint which also defines an edge of the wire of the face Order: Order of the constraint: GeomAbs_C0: the surface has to pass by 3D representation of the edge GeomAbs_G1: the surface has to pass by 3D representation of the edge and to respect tangency with the given face GeomAbs_G2: the surface has to pass by 3D representation of the edge and to respect tangency and curvature with the given face. Raises ConstructionError if the edge has no 2d representation on the given face.
") Add;
		Standard_Integer Add(const TopoDS_Edge & Constr, const TopoDS_Face & Support, const GeomAbs_Shape Order, const Standard_Boolean IsBound = Standard_True);

		/****** BRepOffsetAPI_MakeFilling::Add ******/
		/****** md5 signature: c110c3c507d8423f3ffde002d65004bf ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Support: TopoDS_Face
Order: GeomAbs_Shape

Return
-------
int

Description
-----------
Adds a free constraint on a face. The corresponding edge has to be automatically recomputed. It is always a bound.
") Add;
		Standard_Integer Add(const TopoDS_Face & Support, const GeomAbs_Shape Order);

		/****** BRepOffsetAPI_MakeFilling::Add ******/
		/****** md5 signature: 1323f2a6b2ca8774ee472101d9518362 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt

Return
-------
int

Description
-----------
Adds a punctual constraint.
") Add;
		Standard_Integer Add(const gp_Pnt & Point);

		/****** BRepOffsetAPI_MakeFilling::Add ******/
		/****** md5 signature: 66afaf29b06657fd99d38717aeeeb9f6 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Support: TopoDS_Face
Order: GeomAbs_Shape

Return
-------
int

Description
-----------
Adds a punctual constraint.
") Add;
		Standard_Integer Add(const Standard_Real U, const Standard_Real V, const TopoDS_Face & Support, const GeomAbs_Shape Order);

		/****** BRepOffsetAPI_MakeFilling::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Builds the resulting faces.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffsetAPI_MakeFilling::G0Error ******/
		/****** md5 signature: ba177a9a7bac2d394577a179fd8040ef ******/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the maximum distance between the result and the constraints. This is set at construction time.
") G0Error;
		Standard_Real G0Error();

		/****** BRepOffsetAPI_MakeFilling::G0Error ******/
		/****** md5 signature: f99dce5527bffb3ecaa2d1093b4a3635 ******/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the maximum distance attained between the result and the constraint Index. This is set at construction time.
") G0Error;
		Standard_Real G0Error(const Standard_Integer Index);

		/****** BRepOffsetAPI_MakeFilling::G1Error ******/
		/****** md5 signature: 0a0e55267bc5572a38177b75a97dfedc ******/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the maximum angle between the result and the constraints. This is set at construction time.
") G1Error;
		Standard_Real G1Error();

		/****** BRepOffsetAPI_MakeFilling::G1Error ******/
		/****** md5 signature: 0d786918d533628c34e845fd87da5a9b ******/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the maximum angle between the result and the constraints. This is set at construction time.
") G1Error;
		Standard_Real G1Error(const Standard_Integer Index);

		/****** BRepOffsetAPI_MakeFilling::G2Error ******/
		/****** md5 signature: 0eac129a84e8ae945532a18ff833414e ******/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the maximum angle between the result and the constraints. This is set at construction time.
") G2Error;
		Standard_Real G2Error();

		/****** BRepOffsetAPI_MakeFilling::G2Error ******/
		/****** md5 signature: 02032765271044476a9ce38570208342 ******/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the greatest difference in curvature found between the result and the constraint Index.
") G2Error;
		Standard_Real G2Error(const Standard_Integer Index);

		/****** BRepOffsetAPI_MakeFilling::Generated ******/
		/****** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes generated from the shape <S>.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_MakeFilling::IsDone ******/
		/****** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests whether computation of the filling plate has been completed.
") IsDone;
		virtual Standard_Boolean IsDone();

		/****** BRepOffsetAPI_MakeFilling::LoadInitSurface ******/
		/****** md5 signature: f3dc564cdf464b4c186eaa11f91e9fe8 ******/
		%feature("compactdefaultargs") LoadInitSurface;
		%feature("autodoc", "
Parameters
----------
Surf: TopoDS_Face

Return
-------
None

Description
-----------
Loads the initial surface Surf to begin the construction of the surface. This optional function is useful if the surface resulting from construction for the algorithm is likely to be complex. The support surface of the face under construction is computed by a deformation of Surf which satisfies the given constraints. The set of bounding edges defines the wire of the face. If no initial surface is given, the algorithm computes it automatically. If the set of edges is not connected (Free constraint), missing edges are automatically computed. Important: the initial surface must have orthogonal local coordinates, i.e. partial derivatives dS/du and dS/dv must be orthogonal at each point of surface. If this condition breaks, distortions of resulting surface are possible.
") LoadInitSurface;
		void LoadInitSurface(const TopoDS_Face & Surf);

		/****** BRepOffsetAPI_MakeFilling::SetApproxParam ******/
		/****** md5 signature: 24678d9cf0187a1e2d5fe74dfef72b0d ******/
		%feature("compactdefaultargs") SetApproxParam;
		%feature("autodoc", "
Parameters
----------
MaxDeg: int (optional, default to 8)
MaxSegments: int (optional, default to 9)

Return
-------
None

Description
-----------
Sets the parameters used to approximate the filling surface. These include: - MaxDeg - the highest degree which the polynomial defining the filling surface can have - MaxSegments - the greatest number of segments which the filling surface can have.
") SetApproxParam;
		void SetApproxParam(const Standard_Integer MaxDeg = 8, const Standard_Integer MaxSegments = 9);

		/****** BRepOffsetAPI_MakeFilling::SetConstrParam ******/
		/****** md5 signature: 2d967f76f30735b0413b7afac7004fa6 ******/
		%feature("compactdefaultargs") SetConstrParam;
		%feature("autodoc", "
Parameters
----------
Tol2d: float (optional, default to 0.00001)
Tol3d: float (optional, default to 0.0001)
TolAng: float (optional, default to 0.01)
TolCurv: float (optional, default to 0.1)

Return
-------
None

Description
-----------
Sets the values of Tolerances used to control the constraint. Tol2d: Tol3d: it is the maximum distance allowed between the support surface and the constraints TolAng: it is the maximum angle allowed between the normal of the surface and the constraints TolCurv: it is the maximum difference of curvature allowed between the surface and the constraint.
") SetConstrParam;
		void SetConstrParam(const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1);

		/****** BRepOffsetAPI_MakeFilling::SetResolParam ******/
		/****** md5 signature: 96cad4665171fb74735ecc8d46155136 ******/
		%feature("compactdefaultargs") SetResolParam;
		%feature("autodoc", "
Parameters
----------
Degree: int (optional, default to 3)
NbPtsOnCur: int (optional, default to 15)
NbIter: int (optional, default to 2)
Anisotropie: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets the parameters used for resolution. The default values of these parameters have been chosen for a good ratio quality/performance. Degree: it is the order of energy criterion to minimize for computing the deformation of the surface. The default value is 3 The recommended value is i+2 where i is the maximum order of the constraints. NbPtsOnCur: it is the average number of points for discretisation of the edges. NbIter: it is the maximum number of iterations of the process. For each iteration the number of discretisation points is increased. Anisotropie:.
") SetResolParam;
		void SetResolParam(const Standard_Integer Degree = 3, const Standard_Integer NbPtsOnCur = 15, const Standard_Integer NbIter = 2, const Standard_Boolean Anisotropie = Standard_False);

};


%extend BRepOffsetAPI_MakeFilling {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepOffsetAPI_MakeOffset *
*********************************/
class BRepOffsetAPI_MakeOffset : public BRepBuilderAPI_MakeShape {
	public:
		/****** BRepOffsetAPI_MakeOffset::BRepOffsetAPI_MakeOffset ******/
		/****** md5 signature: 88d16e162a6684102baaab1a8f41cc87 ******/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an algorithm for creating an empty offset.
") BRepOffsetAPI_MakeOffset;
		 BRepOffsetAPI_MakeOffset();

		/****** BRepOffsetAPI_MakeOffset::BRepOffsetAPI_MakeOffset ******/
		/****** md5 signature: 6c382c138f0e83f35d2532782330627a ******/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffset;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
IsOpenResult: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs an algorithm for creating an algorithm to build parallels to the spine Spine.
") BRepOffsetAPI_MakeOffset;
		 BRepOffsetAPI_MakeOffset(const TopoDS_Face & Spine, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****** BRepOffsetAPI_MakeOffset::BRepOffsetAPI_MakeOffset ******/
		/****** md5 signature: edca00730463e7bdc67c3ca57a3de792 ******/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffset;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
IsOpenResult: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") BRepOffsetAPI_MakeOffset;
		 BRepOffsetAPI_MakeOffset(const TopoDS_Wire & Spine, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****** BRepOffsetAPI_MakeOffset::AddWire ******/
		/****** md5 signature: f11eaa49e4d45e90c9ae3f7a4166b6ad ******/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire

Return
-------
None

Description
-----------
Initializes the algorithm to construct parallels to the wire Spine.
") AddWire;
		void AddWire(const TopoDS_Wire & Spine);

		/****** BRepOffsetAPI_MakeOffset::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Builds the resulting shape (redefined from MakeShape).
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffsetAPI_MakeOffset::ConvertFace ******/
		/****** md5 signature: 4995d6c46f75b841a5ec1eeddfe269b6 ******/
		%feature("compactdefaultargs") ConvertFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theAngleTolerance: float

Return
-------
TopoDS_Face

Description
-----------
Converts each wire of the face into contour consisting only of arcs and segments. New 3D curves are built too.
") ConvertFace;
		static TopoDS_Face ConvertFace(const TopoDS_Face & theFace, const Standard_Real theAngleTolerance);

		/****** BRepOffsetAPI_MakeOffset::Generated ******/
		/****** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
returns a list of the created shapes from the shape <S>.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_MakeOffset::Init ******/
		/****** md5 signature: 04028fd0677eb2fad3b6134f24c0b959 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
IsOpenResult: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the algorithm to construct parallels to the spine Spine. Join defines the type of parallel generated by the salient vertices of the spine. The default type is GeomAbs_Arc where the vertices generate sections of a circle. If join type is GeomAbs_Intersection, the edges that intersect in a salient vertex generate the edges prolonged until intersection.
") Init;
		void Init(const TopoDS_Face & Spine, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****** BRepOffsetAPI_MakeOffset::Init ******/
		/****** md5 signature: 36efcaeec9c18f0906259d528d83ea6b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
IsOpenResult: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initialize the evaluation of Offsetting.
") Init;
		void Init(const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****** BRepOffsetAPI_MakeOffset::Perform ******/
		/****** md5 signature: 50205eaf73b49f4d2b44f0537bf87989 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Offset: float
Alt: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Computes a parallel to the spine at distance Offset and at an altitude Alt from the plane of the spine in relation to the normal to the spine. Exceptions: StdFail_NotDone if the offset is not built.
") Perform;
		void Perform(const Standard_Real Offset, const Standard_Real Alt = 0.0);

		/****** BRepOffsetAPI_MakeOffset::SetApprox ******/
		/****** md5 signature: 57e45b5381196ac1a2610a07df3f37fa ******/
		%feature("compactdefaultargs") SetApprox;
		%feature("autodoc", "
Parameters
----------
ToApprox: bool

Return
-------
None

Description
-----------
Set approximation flag for conversion input contours into ones consisting of 2D circular arcs and 2D linear segments only.
") SetApprox;
		void SetApprox(const Standard_Boolean ToApprox);

};


%extend BRepOffsetAPI_MakeOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepOffsetAPI_MakeOffsetShape *
**************************************/
class BRepOffsetAPI_MakeOffsetShape : public BRepBuilderAPI_MakeShape {
	public:
		/****** BRepOffsetAPI_MakeOffsetShape::BRepOffsetAPI_MakeOffsetShape ******/
		/****** md5 signature: d913edb15df090e4ff503886c9e1f814 ******/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffsetShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor does nothing.
") BRepOffsetAPI_MakeOffsetShape;
		 BRepOffsetAPI_MakeOffsetShape();

		/****** BRepOffsetAPI_MakeOffsetShape::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Does nothing.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffsetAPI_MakeOffsetShape::Generated ******/
		/****** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes generated from the shape <S>.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_MakeOffsetShape::GetJoinType ******/
		/****** md5 signature: 98bbd653674d56f0804dd681f91e2cf5 ******/
		%feature("compactdefaultargs") GetJoinType;
		%feature("autodoc", "Return
-------
GeomAbs_JoinType

Description
-----------
Returns offset join type.
") GetJoinType;
		GeomAbs_JoinType GetJoinType();

		/****** BRepOffsetAPI_MakeOffsetShape::IsDeleted ******/
		/****** md5 signature: 28be7c17a3b2776f59567554f488bbf5 ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the shape has been removed from the result.
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_MakeOffsetShape::MakeOffset ******/
		/****** md5 signature: 3130f0edba2681c2d8feeda712784d5d ******/
		%feature("compactdefaultargs") MakeOffset;
		%feature("autodoc", "Return
-------
BRepOffset_MakeOffset

Description
-----------
Returns instance of the underlying intersection / arc algorithm.
") MakeOffset;
		virtual const BRepOffset_MakeOffset & MakeOffset();

		/****** BRepOffsetAPI_MakeOffsetShape::Modified ******/
		/****** md5 signature: 73ccfe97b4ed94547a190332224ffe23 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes Modified from the shape <S>.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_MakeOffsetShape::PerformByJoin ******/
		/****** md5 signature: 95722a888d9ea1332d96f8f0377af232 ******/
		%feature("compactdefaultargs") PerformByJoin;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Offset: float
Tol: float
Mode: BRepOffset_Mode (optional, default to BRepOffset_Skin)
Intersection: bool (optional, default to Standard_False)
SelfInter: bool (optional, default to Standard_False)
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
RemoveIntEdges: bool (optional, default to Standard_False)
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Constructs a shape parallel to the shape S, where - S may be a face, a shell, a solid or a compound of these shape kinds; - Offset is the offset value. The offset shape is constructed: - outside S, if Offset is positive, - inside S, if Offset is negative; - Tol defines the coincidence tolerance criterion for generated shapes; - Mode defines the construction type of parallels applied to the free edges of shape S; currently, only one construction type is implemented, namely the one where the free edges do not generate parallels; this corresponds to the default value BRepOffset_Skin; - Intersection specifies how the algorithm must work in order to limit the parallels to two adjacent shapes: - if Intersection is false (default value), the intersection is calculated with the parallels to the two adjacent shapes, - if Intersection is true, the intersection is calculated by taking all generated parallels into account; this computation method is more general as it avoids some self-intersections generated in the offset shape from features of small dimensions on shape S, however this method has not been completely implemented and therefore is not recommended for use; - SelfInter tells the algorithm whether a computation to eliminate self-intersections must be applied to the resulting shape; however, as this functionality is not yet implemented, it is recommended to use the default value (false); - Join defines how to fill the holes that may appear between parallels to the two adjacent faces. It may take values GeomAbs_Arc or GeomAbs_Intersection: - if Join is equal to GeomAbs_Arc, then pipes are generated between two free edges of two adjacent parallels, and spheres are generated on 'images' of vertices; it is the default value, - if Join is equal to GeomAbs_Intersection, then the parallels to the two adjacent faces are enlarged and intersected, so that there are no free edges on parallels to faces. RemoveIntEdges flag defines whether to remove the INTERNAL edges from the result or not. Warnings 1. All the faces of the shape S should be based on the surfaces with continuity at least C1. 2. The offset value should be sufficiently small to avoid self-intersections in resulting shape. Otherwise these self-intersections may appear inside an offset face if its initial surface is not plane or sphere or cylinder, also some non-adjacent offset faces may intersect each other. Also, some offset surfaces may 'turn inside out'. 3. The algorithm may fail if the shape S contains vertices where more than 3 edges converge. 4. Since 3d-offset algorithm involves intersection of surfaces, it is under limitations of surface intersection algorithm. 5. A result cannot be generated if the underlying geometry of S is BSpline with continuity C0. Exceptions Geom_UndefinedDerivative if the underlying geometry of S is BSpline with continuity C0.
") PerformByJoin;
		void PerformByJoin(const TopoDS_Shape & S, const Standard_Real Offset, const Standard_Real Tol, const BRepOffset_Mode Mode = BRepOffset_Skin, const Standard_Boolean Intersection = Standard_False, const Standard_Boolean SelfInter = Standard_False, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean RemoveIntEdges = Standard_False, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffsetAPI_MakeOffsetShape::PerformBySimple ******/
		/****** md5 signature: 005d9d4f6366bed358be54e547e045db ******/
		%feature("compactdefaultargs") PerformBySimple;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theOffsetValue: float

Return
-------
None

Description
-----------
Constructs offset shape for the given one using simple algorithm without intersections computation.
") PerformBySimple;
		void PerformBySimple(const TopoDS_Shape & theS, const Standard_Real theOffsetValue);

};


%extend BRepOffsetAPI_MakeOffsetShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepOffsetAPI_MakePipe *
*******************************/
class BRepOffsetAPI_MakePipe : public BRepPrimAPI_MakeSweep {
	public:
		/****** BRepOffsetAPI_MakePipe::BRepOffsetAPI_MakePipe ******/
		/****** md5 signature: 9a0f7eb2c8727a0bca36fe46f7e3eec3 ******/
		%feature("compactdefaultargs") BRepOffsetAPI_MakePipe;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Shape

Return
-------
None

Description
-----------
Constructs a pipe by sweeping the shape Profile along the wire Spine.The angle made by the spine with the profile is maintained along the length of the pipe. Warning Spine must be G1 continuous; that is, on the connection vertex of two edges of the wire, the tangent vectors on the left and on the right must have the same direction, though not necessarily the same magnitude. Exceptions Standard_DomainError if the profile is a solid or a composite solid.
") BRepOffsetAPI_MakePipe;
		 BRepOffsetAPI_MakePipe(const TopoDS_Wire & Spine, const TopoDS_Shape & Profile);

		/****** BRepOffsetAPI_MakePipe::BRepOffsetAPI_MakePipe ******/
		/****** md5 signature: 7fdb4b4ef91c75cd892ca136b43bf5da ******/
		%feature("compactdefaultargs") BRepOffsetAPI_MakePipe;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Shape
aMode: GeomFill_Trihedron
ForceApproxC1: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
the same as previous but with setting of mode of sweep and the flag that indicates attempt to approximate a C1-continuous surface if a swept surface proved to be C0.
") BRepOffsetAPI_MakePipe;
		 BRepOffsetAPI_MakePipe(const TopoDS_Wire & Spine, const TopoDS_Shape & Profile, const GeomFill_Trihedron aMode, const Standard_Boolean ForceApproxC1 = Standard_False);

		/****** BRepOffsetAPI_MakePipe::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Builds the resulting shape (redefined from MakeShape).
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffsetAPI_MakePipe::ErrorOnSurface ******/
		/****** md5 signature: b6b87ca0efc7814953c22829fefc7f65 ******/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ErrorOnSurface;
		Standard_Real ErrorOnSurface();

		/****** BRepOffsetAPI_MakePipe::FirstShape ******/
		/****** md5 signature: 58fcb2a790a0aa12dce93bc2307abc16 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the bottom of the prism.
") FirstShape;
		TopoDS_Shape FirstShape();

		/****** BRepOffsetAPI_MakePipe::Generated ******/
		/****** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_MakePipe::Generated ******/
		/****** md5 signature: da81408487ea6911b58fe475fd4ea546 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
SSpine: TopoDS_Shape
SProfile: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Generated;
		TopoDS_Shape Generated(const TopoDS_Shape & SSpine, const TopoDS_Shape & SProfile);

		/****** BRepOffsetAPI_MakePipe::LastShape ******/
		/****** md5 signature: 00d36051126aa083896abae0c2f17b32 ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the top of the prism.
") LastShape;
		TopoDS_Shape LastShape();

		/****** BRepOffsetAPI_MakePipe::Pipe ******/
		/****** md5 signature: 976ad7a0864ead36b17759e50cc7cebd ******/
		%feature("compactdefaultargs") Pipe;
		%feature("autodoc", "Return
-------
BRepFill_Pipe

Description
-----------
No available documentation.
") Pipe;
		const BRepFill_Pipe & Pipe();

};


%extend BRepOffsetAPI_MakePipe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepOffsetAPI_MakePipeShell *
************************************/
class BRepOffsetAPI_MakePipeShell : public BRepPrimAPI_MakeSweep {
	public:
		/****** BRepOffsetAPI_MakePipeShell::BRepOffsetAPI_MakePipeShell ******/
		/****** md5 signature: 2de09d18cf07159481a80873b4b5d90c ******/
		%feature("compactdefaultargs") BRepOffsetAPI_MakePipeShell;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire

Return
-------
None

Description
-----------
Constructs the shell-generating framework defined by the wire Spine. Sets an sweep's mode If no mode are set, the mode use in MakePipe is used.
") BRepOffsetAPI_MakePipeShell;
		 BRepOffsetAPI_MakePipeShell(const TopoDS_Wire & Spine);

		/****** BRepOffsetAPI_MakePipeShell::Add ******/
		/****** md5 signature: 4646415ed2583fb1eb7c020fef17efa7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape
WithContact: bool (optional, default to Standard_False)
WithCorrection: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Adds the section Profile to this framework. First and last sections may be punctual, so the shape Profile may be both wire and vertex. Correspondent point on spine is computed automatically. If WithContact is true, the section is translated to be in contact with the spine. If WithCorrection is true, the section is rotated to be orthogonal to the spine?s tangent in the correspondent point. This option has no sense if the section is punctual (Profile is of type TopoDS_Vertex).
") Add;
		void Add(const TopoDS_Shape & Profile, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****** BRepOffsetAPI_MakePipeShell::Add ******/
		/****** md5 signature: ea9d6839d1fe733dcb8684defcce8b79 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape
Location: TopoDS_Vertex
WithContact: bool (optional, default to Standard_False)
WithCorrection: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Adds the section Profile to this framework. Correspondent point on the spine is given by Location. Warning: To be effective, it is not recommended to combine methods Add and SetLaw.
") Add;
		void Add(const TopoDS_Shape & Profile, const TopoDS_Vertex & Location, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****** BRepOffsetAPI_MakePipeShell::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Builds the resulting shape (redefined from MakeShape).
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffsetAPI_MakePipeShell::Delete ******/
		/****** md5 signature: 12e4f2f3609a7b21fcf42ba451fc7b90 ******/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape

Return
-------
None

Description
-----------
Removes the section Profile from this framework.
") Delete;
		void Delete(const TopoDS_Shape & Profile);

		/****** BRepOffsetAPI_MakePipeShell::ErrorOnSurface ******/
		/****** md5 signature: b6b87ca0efc7814953c22829fefc7f65 ******/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ErrorOnSurface;
		Standard_Real ErrorOnSurface();

		/****** BRepOffsetAPI_MakePipeShell::FirstShape ******/
		/****** md5 signature: 9141e4a066781501fc49e6dc1e5e4641 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the bottom of the sweep.
") FirstShape;
		virtual TopoDS_Shape FirstShape();

		/****** BRepOffsetAPI_MakePipeShell::Generated ******/
		/****** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns a list of new shapes generated from the shape S by the shell-generating algorithm. This function is redefined from BRepOffsetAPI_MakeShape::Generated. S can be an edge or a vertex of a given Profile (see methods Add).
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_MakePipeShell::GetStatus ******/
		/****** md5 signature: 7fc2662f43e326653463499b95ca8153 ******/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Return
-------
BRepBuilderAPI_PipeError

Description
-----------
Get a status, when Simulate or Build failed. It can be BRepBuilderAPI_PipeDone, BRepBuilderAPI_PipeNotDone, BRepBuilderAPI_PlaneNotIntersectGuide, BRepBuilderAPI_ImpossibleContact.
") GetStatus;
		BRepBuilderAPI_PipeError GetStatus();

		/****** BRepOffsetAPI_MakePipeShell::IsReady ******/
		/****** md5 signature: 68a96b040fc0b59848125a1a3ef33dcb ******/
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this tool object is ready to build the shape, i.e. has a definition for the wire section Profile.
") IsReady;
		Standard_Boolean IsReady();

		/****** BRepOffsetAPI_MakePipeShell::LastShape ******/
		/****** md5 signature: 6f7d02deb40719f75425be30543f3deb ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the top of the sweep.
") LastShape;
		virtual TopoDS_Shape LastShape();

		/****** BRepOffsetAPI_MakePipeShell::MakeSolid ******/
		/****** md5 signature: cac327adfb21fa10211d68dabc53974b ******/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Transforms the sweeping Shell in Solid. If a propfile is not closed returns False.
") MakeSolid;
		Standard_Boolean MakeSolid();

		/****** BRepOffsetAPI_MakePipeShell::Profiles ******/
		/****** md5 signature: 1b2b499d210731d9c45ae6c16e16db56 ******/
		%feature("compactdefaultargs") Profiles;
		%feature("autodoc", "
Parameters
----------
theProfiles: TopTools_ListOfShape

Return
-------
None

Description
-----------
Returns the list of original profiles.
") Profiles;
		void Profiles(TopTools_ListOfShape & theProfiles);

		/****** BRepOffsetAPI_MakePipeShell::SetDiscreteMode ******/
		/****** md5 signature: 0366446a5945e513e46ee5778018b32d ******/
		%feature("compactdefaultargs") SetDiscreteMode;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets a Discrete trihedron to perform the sweeping.
") SetDiscreteMode;
		void SetDiscreteMode();

		/****** BRepOffsetAPI_MakePipeShell::SetForceApproxC1 ******/
		/****** md5 signature: ef99bf0713e14fbe9531aef549b5c75b ******/
		%feature("compactdefaultargs") SetForceApproxC1;
		%feature("autodoc", "
Parameters
----------
ForceApproxC1: bool

Return
-------
None

Description
-----------
Set the flag that indicates attempt to approximate a C1-continuous surface if a swept surface proved to be C0.
") SetForceApproxC1;
		void SetForceApproxC1(const Standard_Boolean ForceApproxC1);

		/****** BRepOffsetAPI_MakePipeShell::SetLaw ******/
		/****** md5 signature: af186f09c05a666850d65baf0970c9c2 ******/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape
L: Law_Function
WithContact: bool (optional, default to Standard_False)
WithCorrection: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets the evolution law defined by the wire Profile with its position (Location, WithContact, WithCorrection are the same options as in methods Add) and a homotetic law defined by the function L. Warning: To be effective, it is not recommended to combine methods Add and SetLaw.
") SetLaw;
		void SetLaw(const TopoDS_Shape & Profile, const opencascade::handle<Law_Function> & L, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****** BRepOffsetAPI_MakePipeShell::SetLaw ******/
		/****** md5 signature: d67cbe53520bea57d641b9a7a96a4fae ******/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape
L: Law_Function
Location: TopoDS_Vertex
WithContact: bool (optional, default to Standard_False)
WithCorrection: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets the evolution law defined by the wire Profile with its position (Location, WithContact, WithCorrection are the same options as in methods Add) and a homotetic law defined by the function L. Warning: To be effective, it is not recommended to combine methods Add and SetLaw.
") SetLaw;
		void SetLaw(const TopoDS_Shape & Profile, const opencascade::handle<Law_Function> & L, const TopoDS_Vertex & Location, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****** BRepOffsetAPI_MakePipeShell::SetMaxDegree ******/
		/****** md5 signature: 2a3ad6060a0d872631abe8d437d6229f ******/
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "
Parameters
----------
NewMaxDegree: int

Return
-------
None

Description
-----------
Define the maximum V degree of resulting surface.
") SetMaxDegree;
		void SetMaxDegree(const Standard_Integer NewMaxDegree);

		/****** BRepOffsetAPI_MakePipeShell::SetMaxSegments ******/
		/****** md5 signature: 7215f32d76e44b535e90a1a1c2957613 ******/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "
Parameters
----------
NewMaxSegments: int

Return
-------
None

Description
-----------
Define the maximum number of spans in V-direction on resulting surface.
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer NewMaxSegments);

		/****** BRepOffsetAPI_MakePipeShell::SetMode ******/
		/****** md5 signature: 20857301a5924ef00dcb05d83545dafe ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
IsFrenet: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets a Frenet or a CorrectedFrenet trihedron to perform the sweeping If IsFrenet is false, a corrected Frenet trihedron is used.
") SetMode;
		void SetMode(const Standard_Boolean IsFrenet = Standard_False);

		/****** BRepOffsetAPI_MakePipeShell::SetMode ******/
		/****** md5 signature: 53e884a5bc116ff1835f19ced706e8c7 ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
Axe: gp_Ax2

Return
-------
None

Description
-----------
Sets a fixed trihedron to perform the sweeping all sections will be parallel.
") SetMode;
		void SetMode(const gp_Ax2 & Axe);

		/****** BRepOffsetAPI_MakePipeShell::SetMode ******/
		/****** md5 signature: 58a4bdd8c9c0ebb3412c56dad6c67f67 ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
BiNormal: gp_Dir

Return
-------
None

Description
-----------
Sets a fixed BiNormal direction to perform the -- sweeping. Angular relations between the section(s) and <BiNormal> will be constant.
") SetMode;
		void SetMode(const gp_Dir & BiNormal);

		/****** BRepOffsetAPI_MakePipeShell::SetMode ******/
		/****** md5 signature: f11f503b2f352f2900bc069378318b41 ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
SpineSupport: TopoDS_Shape

Return
-------
bool

Description
-----------
Sets support to the spine to define the BiNormal of the trihedron, like the normal to the surfaces. Warning: To be effective, Each edge of the <spine> must have a representation on one face of<SpineSupport>.
") SetMode;
		Standard_Boolean SetMode(const TopoDS_Shape & SpineSupport);

		/****** BRepOffsetAPI_MakePipeShell::SetMode ******/
		/****** md5 signature: b56b51364ac5002747edc4b052d16a76 ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
AuxiliarySpine: TopoDS_Wire
CurvilinearEquivalence: bool
KeepContact: BRepFill_TypeOfContact (optional, default to BRepFill_NoContact)

Return
-------
None

Description
-----------
Sets an auxiliary spine to define the Normal For each Point of the Spine P, an Point Q is evalued on <AuxiliarySpine> If <CurvilinearEquivalence> Q split <AuxiliarySpine> with the same length ratio than P split <Spline>. Else the plan define by P and the tangent to the <Spine> intersect <AuxiliarySpine> in Q. If <KeepContact> equals BRepFill_NoContact: The Normal is defined by the vector PQ. If <KeepContact> equals BRepFill_Contact: The Normal is defined to achieve that the sweeped section is in contact to the auxiliarySpine. The width of section is constant all along the path. In other words, the auxiliary spine lies on the swept surface, but not necessarily is a boundary of this surface. However, the auxiliary spine has to be close enough to the main spine to provide intersection with any section all along the path. If <KeepContact> equals BRepFill_ContactOnBorder: The auxiliary spine becomes a boundary of the swept surface and the width of section varies along the path. Give section to sweep. Possibilities are: - Give one or several section - Give one profile and an homotetic law. - Automatic compute of correspondence between spine, and section on the sweeped shape - correspondence between spine, and section on the sweeped shape defined by a vertex of the spine.
") SetMode;
		void SetMode(const TopoDS_Wire & AuxiliarySpine, const Standard_Boolean CurvilinearEquivalence, const BRepFill_TypeOfContact KeepContact = BRepFill_NoContact);

		/****** BRepOffsetAPI_MakePipeShell::SetTolerance ******/
		/****** md5 signature: 7a6605305c5a1448579b26f09880877f ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: float (optional, default to 1.0e-4)
BoundTol: float (optional, default to 1.0e-4)
TolAngular: float (optional, default to 1.0e-2)

Return
-------
None

Description
-----------
Sets the following tolerance values - 3D tolerance Tol3d - boundary tolerance BoundTol - angular tolerance TolAngular.
") SetTolerance;
		void SetTolerance(const Standard_Real Tol3d = 1.0e-4, const Standard_Real BoundTol = 1.0e-4, const Standard_Real TolAngular = 1.0e-2);

		/****** BRepOffsetAPI_MakePipeShell::SetTransitionMode ******/
		/****** md5 signature: 52d1ed1eb716770e53a2e79bdf9a0449 ******/
		%feature("compactdefaultargs") SetTransitionMode;
		%feature("autodoc", "
Parameters
----------
Mode: BRepBuilderAPI_TransitionMode (optional, default to BRepBuilderAPI_Transformed)

Return
-------
None

Description
-----------
Sets the transition mode to manage discontinuities on the swept shape caused by fractures on the spine. The transition mode can be BRepBuilderAPI_Transformed (default value), BRepBuilderAPI_RightCorner, BRepBuilderAPI_RoundCorner: -  RepBuilderAPI_Transformed: discontinuities are treated by modification of the sweeping mode. The pipe is 'transformed' at the fractures of the spine. This mode assumes building a self-intersected shell. -  BRepBuilderAPI_RightCorner: discontinuities are treated like right corner. Two pieces of the pipe corresponding to two adjacent segments of the spine are extended and intersected at a fracture of the spine. -  BRepBuilderAPI_RoundCorner: discontinuities are treated like round corner. The corner is treated as rotation of the profile around an axis which passes through the point of the spine's fracture. This axis is based on cross product of directions tangent to the adjacent segments of the spine at their common point. Warnings The mode BRepBuilderAPI_RightCorner provides a valid result if intersection of two pieces of the pipe (corresponding to two adjacent segments of the spine) in the neighborhood of the spine?s fracture is connected and planar. This condition can be violated if the spine is non-linear in some neighborhood of the fracture or if the profile was set with a scaling law. The last mode, BRepBuilderAPI_RoundCorner, will assuredly provide a good result only if a profile was set with option WithCorrection = True, i.e. it is strictly orthogonal to the spine.
") SetTransitionMode;
		void SetTransitionMode(const BRepBuilderAPI_TransitionMode Mode = BRepBuilderAPI_Transformed);

		/****** BRepOffsetAPI_MakePipeShell::Simulate ******/
		/****** md5 signature: b923147c061b5747b67b09a6323794bf ******/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "
Parameters
----------
NumberOfSection: int
Result: TopTools_ListOfShape

Return
-------
None

Description
-----------
Simulates the resulting shape by calculating its cross-sections. The spine is divided by this cross-sections into (NumberOfSection - 1) equal parts, the number of cross-sections is NumberOfSection. The cross-sections are wires and they are returned in the list Result. This gives a rapid preview of the resulting shape, which will be obtained using the settings you have provided. Raises NotDone if <self> it is not Ready.
") Simulate;
		void Simulate(const Standard_Integer NumberOfSection, TopTools_ListOfShape & Result);

		/****** BRepOffsetAPI_MakePipeShell::Spine ******/
		/****** md5 signature: 6331688635fc3e41ab0cf89de46bd269 ******/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the spine.
") Spine;
		const TopoDS_Wire Spine();

};


%extend BRepOffsetAPI_MakePipeShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepOffsetAPI_MiddlePath *
*********************************/
class BRepOffsetAPI_MiddlePath : public BRepBuilderAPI_MakeShape {
	public:
		/****** BRepOffsetAPI_MiddlePath::BRepOffsetAPI_MiddlePath ******/
		/****** md5 signature: c964dfce8ffed5f9be691f524371850a ******/
		%feature("compactdefaultargs") BRepOffsetAPI_MiddlePath;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
StartShape: TopoDS_Shape
EndShape: TopoDS_Shape

Return
-------
None

Description
-----------
General constructor. StartShape and EndShape may be a wire or a face.
") BRepOffsetAPI_MiddlePath;
		 BRepOffsetAPI_MiddlePath(const TopoDS_Shape & aShape, const TopoDS_Shape & StartShape, const TopoDS_Shape & EndShape);

		/****** BRepOffsetAPI_MiddlePath::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

};


%extend BRepOffsetAPI_MiddlePath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BRepOffsetAPI_NormalProjection *
***************************************/
class BRepOffsetAPI_NormalProjection : public BRepBuilderAPI_MakeShape {
	public:
		/****** BRepOffsetAPI_NormalProjection::BRepOffsetAPI_NormalProjection ******/
		/****** md5 signature: 0c4037ae49bf91992e6b54c49ed0e578 ******/
		%feature("compactdefaultargs") BRepOffsetAPI_NormalProjection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty framework to define projection on a shape according to the normal from each point to be projected to the shape.
") BRepOffsetAPI_NormalProjection;
		 BRepOffsetAPI_NormalProjection();

		/****** BRepOffsetAPI_NormalProjection::BRepOffsetAPI_NormalProjection ******/
		/****** md5 signature: 626de6f3a5351392edd43bc27dfabdc0 ******/
		%feature("compactdefaultargs") BRepOffsetAPI_NormalProjection;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Constructs a framework to define projection onto the basis shape S according to the normal from each point to be projected from the shape added to this framework by Add. Default parameters of the algorithm: Tol3D = 1.e-04, Tol2D =sqr(tol3d) , InternalContinuity = GeomAbs_C2, MaxDegree = 14, MaxSeg = 16.
") BRepOffsetAPI_NormalProjection;
		 BRepOffsetAPI_NormalProjection(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_NormalProjection::Add ******/
		/****** md5 signature: 819f71062dd96e4b529bccdf1bb50cf1 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
ToProj: TopoDS_Shape

Return
-------
None

Description
-----------
Adds the shape ToProj to the framework for calculation of the projection by Compute3d. ToProj is an edge or a wire and will be projected onto the basis shape. Exceptions Standard_ConstructionError if ToProj is not added.
") Add;
		void Add(const TopoDS_Shape & ToProj);

		/****** BRepOffsetAPI_NormalProjection::Ancestor ******/
		/****** md5 signature: 551c6ce85c529cb60615765a58d47215 ******/
		%feature("compactdefaultargs") Ancestor;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
TopoDS_Shape

Description
-----------
Returns the initial edge corresponding to the edge E resulting from the computation of the projection. Exceptions StdFail_NotDone if no edge was found. Standard_NoSuchObject if an edge corresponding to E has already been found.
") Ancestor;
		const TopoDS_Shape Ancestor(const TopoDS_Edge & E);

		/****** BRepOffsetAPI_NormalProjection::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Builds the result of the projection as a compound of wires. Tries to build oriented wires.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffsetAPI_NormalProjection::BuildWire ******/
		/****** md5 signature: e5fb4f3952649b872b4fb3c469f5b161 ******/
		%feature("compactdefaultargs") BuildWire;
		%feature("autodoc", "
Parameters
----------
Liste: TopTools_ListOfShape

Return
-------
bool

Description
-----------
build the result as a list of wire if possible in -- a first returns a wire only if there is only a wire.
") BuildWire;
		Standard_Boolean BuildWire(TopTools_ListOfShape & Liste);

		/****** BRepOffsetAPI_NormalProjection::Compute3d ******/
		/****** md5 signature: a18b9a3fc4a7d346645e19e03d893102 ******/
		%feature("compactdefaultargs") Compute3d;
		%feature("autodoc", "
Parameters
----------
With3d: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Returns true if a 3D curve is computed. If not, false is returned and an initial 3D curve is kept to build the resulting edges.
") Compute3d;
		void Compute3d(const Standard_Boolean With3d = Standard_True);

		/****** BRepOffsetAPI_NormalProjection::Couple ******/
		/****** md5 signature: cbe6db4e25bf42b45544f6235fc33773 ******/
		%feature("compactdefaultargs") Couple;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
TopoDS_Shape

Description
-----------
Returns the initial face corresponding to the projected edge E. Exceptions StdFail_NotDone if no face was found. Standard_NoSuchObject if a face corresponding to E has already been found.
") Couple;
		const TopoDS_Shape Couple(const TopoDS_Edge & E);

		/****** BRepOffsetAPI_NormalProjection::Generated ******/
		/****** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes generated from the shape <S>.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_NormalProjection::Init ******/
		/****** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initializes the empty constructor framework with the shape S.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_NormalProjection::IsDone ******/
		/****** md5 signature: c9aa3a454774a145a334d5dad12c1786 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the object was correctly built by the shape construction algorithm. If at the construction time of the shape, the algorithm cannot be completed, or the original data is corrupted, IsDone returns false and therefore protects the use of functions to access the result of the construction (typically the Shape function).
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepOffsetAPI_NormalProjection::Projection ******/
		/****** md5 signature: d96e6638e8d3c59fa6809c83eda77a82 ******/
		%feature("compactdefaultargs") Projection;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Performs the projection. The construction of the result is performed by Build. Exceptions StdFail_NotDone if the projection was not performed.
") Projection;
		const TopoDS_Shape Projection();

		/****** BRepOffsetAPI_NormalProjection::SetLimit ******/
		/****** md5 signature: 2affba7d2b02ca0d9a96522f0a57d409 ******/
		%feature("compactdefaultargs") SetLimit;
		%feature("autodoc", "
Parameters
----------
FaceBoundaries: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Manage limitation of projected edges.
") SetLimit;
		void SetLimit(const Standard_Boolean FaceBoundaries = Standard_True);

		/****** BRepOffsetAPI_NormalProjection::SetMaxDistance ******/
		/****** md5 signature: 7c596903416448c58cc2576fe5ca8153 ******/
		%feature("compactdefaultargs") SetMaxDistance;
		%feature("autodoc", "
Parameters
----------
MaxDist: float

Return
-------
None

Description
-----------
Sets the maximum distance between target shape and shape to project. If this condition is not satisfied then corresponding part of solution is discarded. if MaxDist < 0 then this method does not affect the algorithm.
") SetMaxDistance;
		void SetMaxDistance(const Standard_Real MaxDist);

		/****** BRepOffsetAPI_NormalProjection::SetParams ******/
		/****** md5 signature: 145439fe62b19bd0fd3e24e9c7dd4c4d ******/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "
Parameters
----------
Tol3D: float
Tol2D: float
InternalContinuity: GeomAbs_Shape
MaxDegree: int
MaxSeg: int

Return
-------
None

Description
-----------
Sets the parameters used for computation Tol3 is the required tolerance between the 3d projected curve and its 2d representation InternalContinuity is the order of constraints used for approximation MaxDeg and MaxSeg are the maximum degree and the maximum number of segment for BSpline resulting of an approximation.
") SetParams;
		void SetParams(const Standard_Real Tol3D, const Standard_Real Tol2D, const GeomAbs_Shape InternalContinuity, const Standard_Integer MaxDegree, const Standard_Integer MaxSeg);

};


%extend BRepOffsetAPI_NormalProjection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepOffsetAPI_ThruSections *
***********************************/
class BRepOffsetAPI_ThruSections : public BRepBuilderAPI_MakeShape {
	public:
		/****** BRepOffsetAPI_ThruSections::BRepOffsetAPI_ThruSections ******/
		/****** md5 signature: 2d1d68118a0d4fb22ccde1e154fbe87e ******/
		%feature("compactdefaultargs") BRepOffsetAPI_ThruSections;
		%feature("autodoc", "
Parameters
----------
isSolid: bool (optional, default to Standard_False)
ruled: bool (optional, default to Standard_False)
pres3d: float (optional, default to 1.0e-06)

Return
-------
None

Description
-----------
Initializes an algorithm for building a shell or a solid passing through a set of sections, where: - isSolid is set to true if the construction algorithm is required to build a solid or to false if it is required to build a shell (the default value), - ruled is set to true if the faces generated between the edges of two consecutive wires are ruled surfaces or to false (the default value) if they are smoothed out by approximation, - pres3d defines the precision criterion used by the approximation algorithm; the default value is 1.0e-6. Use AddWire and AddVertex to define the successive sections of the shell or solid to be built.
") BRepOffsetAPI_ThruSections;
		 BRepOffsetAPI_ThruSections(const Standard_Boolean isSolid = Standard_False, const Standard_Boolean ruled = Standard_False, const Standard_Real pres3d = 1.0e-06);

		/****** BRepOffsetAPI_ThruSections::AddVertex ******/
		/****** md5 signature: b3427ef9c13bb9d306f4377b747f6e3c ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
aVertex: TopoDS_Vertex

Return
-------
None

Description
-----------
Adds the vertex Vertex (punctual section) to the set of sections through which the shell or solid is built. A vertex may be added to the set of sections only as first or last section. At least one wire must be added to the set of sections by the method AddWire. Use the Build function to construct the shape.
") AddVertex;
		void AddVertex(const TopoDS_Vertex & aVertex);

		/****** BRepOffsetAPI_ThruSections::AddWire ******/
		/****** md5 signature: 91c116931995adc0c5abeaf5746c9601 ******/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire

Return
-------
None

Description
-----------
Adds the wire wire to the set of sections through which the shell or solid is built. Use the Build function to construct the shape.
") AddWire;
		void AddWire(const TopoDS_Wire & wire);

		/****** BRepOffsetAPI_ThruSections::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffsetAPI_ThruSections::CheckCompatibility ******/
		/****** md5 signature: 9d9925f6850c3d616051e8fa827482f4 ******/
		%feature("compactdefaultargs") CheckCompatibility;
		%feature("autodoc", "
Parameters
----------
check: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets/unsets the option to compute origin and orientation on wires to avoid twisted results and update wires to have same number of edges.
") CheckCompatibility;
		void CheckCompatibility(const Standard_Boolean check = Standard_True);

		/****** BRepOffsetAPI_ThruSections::Continuity ******/
		/****** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
returns the Continuity used in the approximation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** BRepOffsetAPI_ThruSections::CriteriumWeight ******/
		/****** md5 signature: 4b68323f3c03d233f69e27404a58a42c ******/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "
Parameters
----------

Return
-------
W1: float
W2: float
W3: float

Description
-----------
returns the Weights associed to the criterium used in the optimization.
") CriteriumWeight;
		void CriteriumWeight(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepOffsetAPI_ThruSections::FirstShape ******/
		/****** md5 signature: 7feb91b88f8f76be63dd0e52049cfbe6 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the bottom of the loft if solid.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****** BRepOffsetAPI_ThruSections::Generated ******/
		/****** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns a list of new shapes generated from the shape S by the shell-generating algorithm. This function is redefined from BRepBuilderAPI_MakeShape::Generated. S can be an edge or a vertex of a given Profile (see methods AddWire and AddVertex).
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepOffsetAPI_ThruSections::GeneratedFace ******/
		/****** md5 signature: 03196f2ef499f6adc08e797085c3e792 ******/
		%feature("compactdefaultargs") GeneratedFace;
		%feature("autodoc", "
Parameters
----------
Edge: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
if Ruled Returns the Face generated by each edge except the last wire if smoothed Returns the Face generated by each edge of the first wire.
") GeneratedFace;
		TopoDS_Shape GeneratedFace(const TopoDS_Shape & Edge);

		/****** BRepOffsetAPI_ThruSections::GetStatus ******/
		/****** md5 signature: d01d66bd030c1232d59d2b7253fc3b10 ******/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Return
-------
BRepFill_ThruSectionErrorStatus

Description
-----------
Returns the status of thrusection operation.
") GetStatus;
		BRepFill_ThruSectionErrorStatus GetStatus();

		/****** BRepOffsetAPI_ThruSections::Init ******/
		/****** md5 signature: 82b061dc05f66b08422610d2d7504487 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
isSolid: bool (optional, default to Standard_False)
ruled: bool (optional, default to Standard_False)
pres3d: float (optional, default to 1.0e-06)

Return
-------
None

Description
-----------
Initializes this algorithm for building a shell or a solid passing through a set of sections, where: - isSolid is set to true if this construction algorithm is required to build a solid or to false if it is required to build a shell. false is the default value; - ruled is set to true if the faces generated between the edges of two consecutive wires are ruled surfaces or to false (the default value) if they are smoothed out by approximation, - pres3d defines the precision criterion used by the approximation algorithm; the default value is 1.0e-6. Use AddWire and AddVertex to define the successive sections of the shell or solid to be built.
") Init;
		void Init(const Standard_Boolean isSolid = Standard_False, const Standard_Boolean ruled = Standard_False, const Standard_Real pres3d = 1.0e-06);

		/****** BRepOffsetAPI_ThruSections::IsMutableInput ******/
		/****** md5 signature: 2df16e5a957577cfce65832aa2d90512 ******/
		%feature("compactdefaultargs") IsMutableInput;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the current mutable input state.
") IsMutableInput;
		Standard_Boolean IsMutableInput();

		/****** BRepOffsetAPI_ThruSections::LastShape ******/
		/****** md5 signature: e1c69c3678b816cb0e3d73096b528c5f ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the top of the loft if solid.
") LastShape;
		const TopoDS_Shape LastShape();

		/****** BRepOffsetAPI_ThruSections::MaxDegree ******/
		/****** md5 signature: 2c79ca8c281a4e3978650b16dd11f77d ******/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the maximal U degree of result surface.
") MaxDegree;
		Standard_Integer MaxDegree();

		/****** BRepOffsetAPI_ThruSections::ParType ******/
		/****** md5 signature: 97fa11d31bc8075ba4a84bf8b926a855 ******/
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "Return
-------
Approx_ParametrizationType

Description
-----------
returns the type of parametrization used in the approximation.
") ParType;
		Approx_ParametrizationType ParType();

		/****** BRepOffsetAPI_ThruSections::SetContinuity ******/
		/****** md5 signature: 41a91b0ea6e9b248a1b48c05882f4281 ******/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
C: GeomAbs_Shape

Return
-------
None

Description
-----------
Define the Continuity used in the approximation.
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape C);

		/****** BRepOffsetAPI_ThruSections::SetCriteriumWeight ******/
		/****** md5 signature: f8c7045bd0e7f781a0984d023e8b1268 ******/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "
Parameters
----------
W1: float
W2: float
W3: float

Return
-------
None

Description
-----------
define the Weights associed to the criterium used in the optimization. //! if Wi <= 0.
") SetCriteriumWeight;
		void SetCriteriumWeight(const Standard_Real W1, const Standard_Real W2, const Standard_Real W3);

		/****** BRepOffsetAPI_ThruSections::SetMaxDegree ******/
		/****** md5 signature: 764b2b655767f13bc2f68fea914b035d ******/
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "
Parameters
----------
MaxDeg: int

Return
-------
None

Description
-----------
Define the maximal U degree of result surface.
") SetMaxDegree;
		void SetMaxDegree(const Standard_Integer MaxDeg);

		/****** BRepOffsetAPI_ThruSections::SetMutableInput ******/
		/****** md5 signature: a0db619cccd4a2c2b443a5ab39c10ef8 ******/
		%feature("compactdefaultargs") SetMutableInput;
		%feature("autodoc", "
Parameters
----------
theIsMutableInput: bool

Return
-------
None

Description
-----------
Sets the mutable input state. If true then the input profile can be modified inside the thrusection operation. Default value is true.
") SetMutableInput;
		void SetMutableInput(const Standard_Boolean theIsMutableInput);

		/****** BRepOffsetAPI_ThruSections::SetParType ******/
		/****** md5 signature: ff343d7833ad3cc796439eb5cefa88ba ******/
		%feature("compactdefaultargs") SetParType;
		%feature("autodoc", "
Parameters
----------
ParType: Approx_ParametrizationType

Return
-------
None

Description
-----------
Define the type of parametrization used in the approximation.
") SetParType;
		void SetParType(const Approx_ParametrizationType ParType);

		/****** BRepOffsetAPI_ThruSections::SetSmoothing ******/
		/****** md5 signature: bd2468fb64c3e1eaeaa057fe519f5331 ******/
		%feature("compactdefaultargs") SetSmoothing;
		%feature("autodoc", "
Parameters
----------
UseSmoothing: bool

Return
-------
None

Description
-----------
Define the approximation algorithm.
") SetSmoothing;
		void SetSmoothing(const Standard_Boolean UseSmoothing);

		/****** BRepOffsetAPI_ThruSections::UseSmoothing ******/
		/****** md5 signature: 6d5d2a8f22f593639c02abb00ea646e6 ******/
		%feature("compactdefaultargs") UseSmoothing;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Define the approximation algorithm.
") UseSmoothing;
		Standard_Boolean UseSmoothing();

		/****** BRepOffsetAPI_ThruSections::Wires ******/
		/****** md5 signature: 7af6829b521050de003f1b861d6f8640 ******/
		%feature("compactdefaultargs") Wires;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of original wires.
") Wires;
		const TopTools_ListOfShape & Wires();

};


%extend BRepOffsetAPI_ThruSections {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepOffsetAPI_MakeThickSolid *
*************************************/
class BRepOffsetAPI_MakeThickSolid : public BRepOffsetAPI_MakeOffsetShape {
	public:
		/****** BRepOffsetAPI_MakeThickSolid::BRepOffsetAPI_MakeThickSolid ******/
		/****** md5 signature: 06d7c93c29e576765f1416bf7911cecc ******/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeThickSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor does nothing.
") BRepOffsetAPI_MakeThickSolid;
		 BRepOffsetAPI_MakeThickSolid();

		/****** BRepOffsetAPI_MakeThickSolid::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffsetAPI_MakeThickSolid::MakeThickSolidByJoin ******/
		/****** md5 signature: dcb05ab3a700af2d16599d05a81891dd ******/
		%feature("compactdefaultargs") MakeThickSolidByJoin;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
ClosingFaces: TopTools_ListOfShape
Offset: float
Tol: float
Mode: BRepOffset_Mode (optional, default to BRepOffset_Skin)
Intersection: bool (optional, default to Standard_False)
SelfInter: bool (optional, default to Standard_False)
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
RemoveIntEdges: bool (optional, default to Standard_False)
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Constructs a hollowed solid from the solid S by removing the set of faces ClosingFaces from S, where: Offset defines the thickness of the walls. Its sign indicates which side of the surface of the solid the hollowed shape is built on; - Tol defines the tolerance criterion for coincidence in generated shapes; - Mode defines the construction type of parallels applied to free edges of shape S. Currently, only one construction type is implemented, namely the one where the free edges do not generate parallels; this corresponds to the default value BRepOffset_Skin; Intersection specifies how the algorithm must work in order to limit the parallels to two adjacent shapes: - if Intersection is false (default value), the intersection is calculated with the parallels to the two adjacent shapes, - if Intersection is true, the intersection is calculated by taking account of all parallels generated; this computation method is more general as it avoids self-intersections generated in the offset shape from features of small dimensions on shape S, however this method has not been completely implemented and therefore is not recommended for use; - SelfInter tells the algorithm whether a computation to eliminate self-intersections needs to be applied to the resulting shape. However, as this functionality is not yet implemented, you should use the default value (false); - Join defines how to fill the holes that may appear between parallels to the two adjacent faces. It may take values GeomAbs_Arc or GeomAbs_Intersection: - if Join is equal to GeomAbs_Arc, then pipes are generated between two free edges of two adjacent parallels, and spheres are generated on 'images' of vertices; it is the default value, - if Join is equal to GeomAbs_Intersection, then the parallels to the two adjacent faces are enlarged and intersected, so that there are no free edges on parallels to faces. RemoveIntEdges flag defines whether to remove the INTERNAL edges from the result or not. Warnings Since the algorithm of MakeThickSolid is based on MakeOffsetShape algorithm, the warnings are the same as for MakeOffsetShape.
") MakeThickSolidByJoin;
		void MakeThickSolidByJoin(const TopoDS_Shape & S, const TopTools_ListOfShape & ClosingFaces, const Standard_Real Offset, const Standard_Real Tol, const BRepOffset_Mode Mode = BRepOffset_Skin, const Standard_Boolean Intersection = Standard_False, const Standard_Boolean SelfInter = Standard_False, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean RemoveIntEdges = Standard_False, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepOffsetAPI_MakeThickSolid::MakeThickSolidBySimple ******/
		/****** md5 signature: 61ce1557142588e14d9829f511172d15 ******/
		%feature("compactdefaultargs") MakeThickSolidBySimple;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theOffsetValue: float

Return
-------
None

Description
-----------
Constructs solid using simple algorithm. According to its nature it is not possible to set list of the closing faces. This algorithm does not support faces removing. It is caused by fact that intersections are not computed during offset creation. Non-closed shell or face is expected as input.
") MakeThickSolidBySimple;
		void MakeThickSolidBySimple(const TopoDS_Shape & theS, const Standard_Real theOffsetValue);

		/****** BRepOffsetAPI_MakeThickSolid::Modified ******/
		/****** md5 signature: 73ccfe97b4ed94547a190332224ffe23 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes modified from the shape <S>.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

};


%extend BRepOffsetAPI_MakeThickSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
BRepOffsetAPI_Sewing=OCC.Core.BRepBuilderAPI.BRepBuilderAPI_Sewing
}
/* deprecated methods */
%pythoncode {
@deprecated
def BRepOffsetAPI_MakeOffset_ConvertFace(*args):
	return BRepOffsetAPI_MakeOffset.ConvertFace(*args)

}
