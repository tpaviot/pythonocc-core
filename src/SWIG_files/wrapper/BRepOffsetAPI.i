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
%define BREPOFFSETAPIDOCSTRING
"BRepOffsetAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepoffsetapi.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<BRepOffsetAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
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

/* python proy classes for enums */
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
		/****************** BRepOffsetAPI_DraftAngle ******************/
		/**** md5 signature: b9af936a89856f8fb520f412bc5baac1 ****/
		%feature("compactdefaultargs") BRepOffsetAPI_DraftAngle;
		%feature("autodoc", "Constructs an empty algorithm to perform taper-adding transformations on faces of a shape. use the init function to define the shape to be tapered.

Returns
-------
None
") BRepOffsetAPI_DraftAngle;
		 BRepOffsetAPI_DraftAngle();

		/****************** BRepOffsetAPI_DraftAngle ******************/
		/**** md5 signature: 0e4d1cafe2cf2c602b747516c3fa76bf ****/
		%feature("compactdefaultargs") BRepOffsetAPI_DraftAngle;
		%feature("autodoc", "Initializes an algorithm to perform taper-adding transformations on faces of the shape s. s will be referred to as the initial shape of the algorithm.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") BRepOffsetAPI_DraftAngle;
		 BRepOffsetAPI_DraftAngle(const TopoDS_Shape & S);

		/****************** Add ******************/
		/**** md5 signature: 4ce7b2535b631733771b79ec806daaad ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the face f, the direction direction, the angle angle, the plane neutralplane, and the flag flag to the framework created at construction time, and with this data, defines the taper-adding transformation. f is a face, which belongs to the initial shape of this algorithm or to the shape loaded by the function init. only planar, cylindrical or conical faces can be tapered: - if the face f is planar, it is tapered by inclining it through the angle angle about the line of intersection between the plane neutralplane and f. direction indicates the side of neutralplane from which matter is removed if angle is positive or added if angle is negative. - if f is cylindrical or conical, it is transformed in the same way on a single face, resulting in a conical face if f is cylindrical, and a conical or cylindrical face if it is already conical. the taper-adding transformation is propagated from the face f along the series of planar, cylindrical or conical faces containing f, which are tangential to one another. use the function adddone to check if this taper-adding transformation is successful. warning nothing is done if: - the face f does not belong to the initial shape of this algorithm, or - the face f is not planar, cylindrical or conical. exceptions - standard_nullobject if the initial shape is not defined, i.e. if this algorithm has not been initialized with the non-empty constructor or the init function. - standard_constructionerror if the previous call to add has failed. the function adddone ought to have been used to check for this, and the function remove to cancel the results of the unsuccessful taper-adding transformation and to retrieve the previous shape.

Parameters
----------
F: TopoDS_Face
Direction: gp_Dir
Angle: float
NeutralPlane: gp_Pln
Flag: bool,optional
	default value is Standard_True

Returns
-------
None
") Add;
		void Add(const TopoDS_Face & F, const gp_Dir & Direction, const Standard_Real Angle, const gp_Pln & NeutralPlane, const Standard_Boolean Flag = Standard_True);

		/****************** AddDone ******************/
		/**** md5 signature: 225f23d0ffea018222bcb24ee9311796 ****/
		%feature("compactdefaultargs") AddDone;
		%feature("autodoc", "Returns true if the previous taper-adding transformation performed by this algorithm in the last call to add, was successful. if adddone returns false: - the function problematicshape returns the face on which the error occurred, - the function remove has to be used to cancel the results of the unsuccessful taper-adding transformation and to retrieve the previous shape. exceptions standard_nullobject if the initial shape has not been defined, i.e. if this algorithm has not been initialized with the non-empty constructor or the .init function.

Returns
-------
bool
") AddDone;
		Standard_Boolean AddDone();

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the resulting shape (redefined from makeshape).

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Cancels the results of all taper-adding transformations performed by this algorithm on the initial shape. these results will have been defined by successive calls to the function add.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ConnectedFaces ******************/
		/**** md5 signature: be55b5929554f7dfde3eec1b9ab3f977 ****/
		%feature("compactdefaultargs") ConnectedFaces;
		%feature("autodoc", "Returns all the faces which have been added together with the face <f>.

Parameters
----------
F: TopoDS_Face

Returns
-------
TopTools_ListOfShape
") ConnectedFaces;
		const TopTools_ListOfShape & ConnectedFaces(const TopoDS_Face & F);

		/****************** CorrectWires ******************/
		/**** md5 signature: 81ca023a91873cfa63a02fb08e0cbd78 ****/
		%feature("compactdefaultargs") CorrectWires;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") CorrectWires;
		void CorrectWires();

		/****************** Generated ******************/
		/**** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes, or reinitializes this taper-adding algorithm with the shape s. s will be referred to as the initial shape of this algorithm.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** Modified ******************/
		/**** md5 signature: 73ccfe97b4ed94547a190332224ffe23 ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****************** ModifiedFaces ******************/
		/**** md5 signature: cd09c09ae96bda548c679db0e897d478 ****/
		%feature("compactdefaultargs") ModifiedFaces;
		%feature("autodoc", "Returns all the faces on which a modification has been given.

Returns
-------
TopTools_ListOfShape
") ModifiedFaces;
		const TopTools_ListOfShape & ModifiedFaces();

		/****************** ModifiedShape ******************/
		/**** md5 signature: 52b70a5b01905688e2ddbc00ab060e3c ****/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "Returns the modified shape corresponding to <s>. s can correspond to the entire initial shape or to its subshape. raises exceptions standard_nosuchobject if s is not the initial shape or a subshape of the initial shape to which the transformation has been applied. .

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

		/****************** ProblematicShape ******************/
		/**** md5 signature: 4b993ee84b1645cd4a03936d51cfc6ec ****/
		%feature("compactdefaultargs") ProblematicShape;
		%feature("autodoc", "Returns the shape on which an error occurred after an unsuccessful call to add or when isdone returns false. exceptions standard_nullobject if the initial shape has not been defined, i.e. if this algorithm has not been initialized with the non-empty constructor or the init function.

Returns
-------
TopoDS_Shape
") ProblematicShape;
		const TopoDS_Shape ProblematicShape();

		/****************** Remove ******************/
		/**** md5 signature: 2dda97e74bdcd077a8ecce9d227e7fa7 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Cancels the taper-adding transformation previously performed by this algorithm on the face f and the series of tangential faces which contain f, and retrieves the shape before the last taper-adding transformation. warning you will have to use this function if the previous call to add fails. use the function adddone to check it. exceptions - standard_nullobject if the initial shape has not been defined, i.e. if this algorithm has not been initialized with the non-empty constructor or the init function. - standard_nosuchobject if f has not been added or has already been removed.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") Remove;
		void Remove(const TopoDS_Face & F);

		/****************** Status ******************/
		/**** md5 signature: 26dc5cff0cd2168b2136c6f9bb9e099c ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns an error status when an error has occured (face, edge or vertex recomputaion problem). otherwise returns draft_noerror. the method may be called if adddone returns standard_false, or when isdone returns standard_false.

Returns
-------
Draft_ErrorStatus
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
		/****************** BRepOffsetAPI_FindContigousEdges ******************/
		/**** md5 signature: fd7a2ffb22004077f79a7dae2c0d118b ****/
		%feature("compactdefaultargs") BRepOffsetAPI_FindContigousEdges;
		%feature("autodoc", "Initializes an algorithm for identifying contiguous edges on shapes with tolerance as the tolerance of contiguity (defaulted to 1.0e-6). this tolerance value is used to determine whether two edges or sections of edges are coincident. use the function add to define the shapes to be checked. set option to false. this argument (defaulted to true) will serve in subsequent software releases for performing an analysis of degenerated shapes.

Parameters
----------
tolerance: float,optional
	default value is 1.0e-06
option: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepOffsetAPI_FindContigousEdges;
		 BRepOffsetAPI_FindContigousEdges(const Standard_Real tolerance = 1.0e-06, const Standard_Boolean option = Standard_True);

		/****************** Add ******************/
		/**** md5 signature: e2be6f2074943772e403ebcbe671347a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the shape shape to the list of shapes to be checked by this algorithm. once all the shapes to be checked have been added, use the function perform to find the contiguous edges and the function contigousedge to return these edges.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & shape);

		/****************** ContigousEdge ******************/
		/**** md5 signature: 528f0ebefe61a096548f88451970603d ****/
		%feature("compactdefaultargs") ContigousEdge;
		%feature("autodoc", "Returns the contiguous edge of index index found by the function perform on the shapes added to this algorithm. exceptions standard_outofrange if: - index is less than 1, or - index is greater than the number of contiguous edges found by the function perform on the shapes added to this algorithm.

Parameters
----------
index: int

Returns
-------
TopoDS_Edge
") ContigousEdge;
		const TopoDS_Edge ContigousEdge(const Standard_Integer index);

		/****************** ContigousEdgeCouple ******************/
		/**** md5 signature: 783b24657c04ecf4547ffd8cfddcc368 ****/
		%feature("compactdefaultargs") ContigousEdgeCouple;
		%feature("autodoc", "Returns a list of edges coincident with the contiguous edge of index index found by the function perform. there are as many edges in the list as there are faces adjacent to this contiguous edge. exceptions standard_outofrange if: - index is less than 1, or - index is greater than the number of contiguous edges found by the function perform on the shapes added to this algorithm.

Parameters
----------
index: int

Returns
-------
TopTools_ListOfShape
") ContigousEdgeCouple;
		const TopTools_ListOfShape & ContigousEdgeCouple(const Standard_Integer index);

		/****************** DegeneratedShape ******************/
		/**** md5 signature: e6eb24cfb41ed6276abbd22e81382ad4 ****/
		%feature("compactdefaultargs") DegeneratedShape;
		%feature("autodoc", "Gives a degenerated shape.

Parameters
----------
index: int

Returns
-------
TopoDS_Shape
") DegeneratedShape;
		const TopoDS_Shape DegeneratedShape(const Standard_Integer index);

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump properties of resulting shape.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Init ******************/
		/**** md5 signature: dd6c1b1cc9e67e536ec1bfeda1eb7f2d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm for identifying contiguous edges on shapes using the tolerance of contiguity tolerance. this tolerance value is used to determine whether two edges or sections of edges are coincident. use the function add to define the shapes to be checked. sets <option> to false.

Parameters
----------
tolerance: float
option: bool

Returns
-------
None
") Init;
		void Init(const Standard_Real tolerance, const Standard_Boolean option);

		/****************** IsDegenerated ******************/
		/**** md5 signature: 84979167278e746e62a21a790a7cd87e ****/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Indicates if a input shape is degenerated.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
bool
") IsDegenerated;
		Standard_Boolean IsDegenerated(const TopoDS_Shape & shape);

		/****************** IsModified ******************/
		/**** md5 signature: 1d5d4f025b62ca0ccc6672d39cdf22fc ****/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Returns true if the copy of the initial shape shape was modified by the function perform (i.e. if one or more of its edges was broken down into contiguous and non-contiguous sections). warning returns false if shape is not one of the initial shapes added to this algorithm.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
bool
") IsModified;
		Standard_Boolean IsModified(const TopoDS_Shape & shape);

		/****************** Modified ******************/
		/**** md5 signature: 8eae36e55014fa2f45331a4af35cda4c ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Gives a modifieded shape raises nosuchobject if shape has not been modified.

Parameters
----------
shape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Modified;
		const TopoDS_Shape Modified(const TopoDS_Shape & shape);

		/****************** NbContigousEdges ******************/
		/**** md5 signature: c293fac1d421e2d1f7207054b4a45923 ****/
		%feature("compactdefaultargs") NbContigousEdges;
		%feature("autodoc", "Returns the number of contiguous edges found by the function perform on the shapes added to this algorithm.

Returns
-------
int
") NbContigousEdges;
		Standard_Integer NbContigousEdges();

		/****************** NbDegeneratedShapes ******************/
		/**** md5 signature: 002576d80bfb4575f6cdfeeff5b81a1e ****/
		%feature("compactdefaultargs") NbDegeneratedShapes;
		%feature("autodoc", "Gives the number of degenerated shapes.

Returns
-------
int
") NbDegeneratedShapes;
		Standard_Integer NbDegeneratedShapes();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Finds coincident parts of edges of two or more shapes added to this algorithm and breaks down these edges into contiguous and non-contiguous sections on copies of the initial shapes. the function contigousedge returns contiguous edges. the function modified can be used to return modified copies of the initial shapes where one or more edges were broken down into contiguous and non-contiguous sections. warning this function must be used once all the shapes to be checked have been added. it is not possible to add further shapes subsequently and then to repeat the call to perform.

Returns
-------
None
") Perform;
		void Perform();

		/****************** SectionToBoundary ******************/
		/**** md5 signature: 8753cd22e70a557633e4602d07baeefe ****/
		%feature("compactdefaultargs") SectionToBoundary;
		%feature("autodoc", "Returns the edge on the initial shape, of which the modified copy contains the edge section. section is coincident with a contiguous edge found by the function perform. use the function contigousedgecouple to obtain a valid section. this information is useful for verification purposes, since it provides a means of determining the surface to which the contiguous edge belongs. exceptions standard_nosuchobject if section is not coincident with a contiguous edge. use the function contigousedgecouple to obtain a valid section.

Parameters
----------
section: TopoDS_Edge

Returns
-------
TopoDS_Edge
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
		/****************** BRepOffsetAPI_MakeDraft ******************/
		/**** md5 signature: 71eb0e38473fd7d62078ab8ae3d81222 ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeDraft;
		%feature("autodoc", "Constructs the draft surface object defined by the shape shape, the direction dir, and the angle angle. shape must be a topods_wire, topo_ds_face or topods_shell with free boundaries. exceptions standard_notdone if shape is not a topods_wire, topo_ds_face or topods_shell with free boundaries.

Parameters
----------
Shape: TopoDS_Shape
Dir: gp_Dir
Angle: float

Returns
-------
None
") BRepOffsetAPI_MakeDraft;
		 BRepOffsetAPI_MakeDraft(const TopoDS_Shape & Shape, const gp_Dir & Dir, const Standard_Real Angle);

		/****************** Generated ******************/
		/**** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** Perform ******************/
		/**** md5 signature: b03f32ebc120d00e3e8e32d44b202b9d ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the draft using the length lengthmax as the maximum length for the corner edge between two draft faces.

Parameters
----------
LengthMax: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real LengthMax);

		/****************** Perform ******************/
		/**** md5 signature: 3a80e47101026da2c90ae735de0ac1b9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the draft up to the surface surface. if keepinsidesurface is true, the part of surface inside the draft is kept in the result.

Parameters
----------
Surface: Geom_Surface
KeepInsideSurface: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & Surface, const Standard_Boolean KeepInsideSurface = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: c18fafced10e4c987e315cfc1b3d96ad ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the draft up to the shape stopshape. if keepoutside is true, the part of stopshape which is outside the draft is kept in the result.

Parameters
----------
StopShape: TopoDS_Shape
KeepOutSide: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & StopShape, const Standard_Boolean KeepOutSide = Standard_True);

		/****************** SetDraft ******************/
		/**** md5 signature: 6a0b2e71733b262480aa38daaecff626 ****/
		%feature("compactdefaultargs") SetDraft;
		%feature("autodoc", "Sets the direction of the draft for this object. if isinternal is true, the draft is internal to the argument shape used in the constructor.

Parameters
----------
IsInternal: bool,optional
	default value is Standard_False

Returns
-------
None
") SetDraft;
		void SetDraft(const Standard_Boolean IsInternal = Standard_False);

		/****************** SetOptions ******************/
		/**** md5 signature: 736d57b77de1cd53364406245ccef568 ****/
		%feature("compactdefaultargs") SetOptions;
		%feature("autodoc", "Sets the options of this draft tool. if a transition has to be performed, it can be defined by the mode style as rightcorner or roundcorner, rightcorner being a corner defined by a sharp angle, and roundcorner being a rounded corner. anglemin is an angular tolerance used to detect whether a transition has to be performed or not. anglemax sets the maximum value within which a rightcorner transition can be performed. anglemin and anglemax are expressed in radians.

Parameters
----------
Style: BRepBuilderAPI_TransitionMode,optional
	default value is BRepBuilderAPI_RightCorner
AngleMin: float,optional
	default value is 0.01
AngleMax: float,optional
	default value is 3.0

Returns
-------
None
") SetOptions;
		void SetOptions(const BRepBuilderAPI_TransitionMode Style = BRepBuilderAPI_RightCorner, const Standard_Real AngleMin = 0.01, const Standard_Real AngleMax = 3.0);

		/****************** Shell ******************/
		/**** md5 signature: 3ea4686086a18491532865f1cfbce9ad ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the shell resulting from performance of the draft along the wire.

Returns
-------
TopoDS_Shell
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
		/****************** BRepOffsetAPI_MakeEvolved ******************/
		/**** md5 signature: 10d85cbe93d42416417568f3ca2d5c30 ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeEvolved;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepOffsetAPI_MakeEvolved;
		 BRepOffsetAPI_MakeEvolved();

		/****************** BRepOffsetAPI_MakeEvolved ******************/
		/**** md5 signature: ca863b02acd410c7e5d5badc6d5c93f9 ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeEvolved;
		%feature("autodoc", "Constructs an evolved shape by sweeping the profile (theprofile) along the spine (thespine). thespine can be shape only of type wire or face. see description to this class for detailed information.

Parameters
----------
theSpine: TopoDS_Shape
theProfile: TopoDS_Wire
theJoinType: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
theIsAxeProf: bool,optional
	default value is Standard_True
theIsSolid: bool,optional
	default value is Standard_False
theIsProfOnSpine: bool,optional
	default value is Standard_False
theTol: float,optional
	default value is 0.0000001
theIsVolume: bool,optional
	default value is Standard_False
theRunInParallel: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepOffsetAPI_MakeEvolved;
		 BRepOffsetAPI_MakeEvolved(const TopoDS_Shape & theSpine, const TopoDS_Wire & theProfile, const GeomAbs_JoinType theJoinType = GeomAbs_Arc, const Standard_Boolean theIsAxeProf = Standard_True, const Standard_Boolean theIsSolid = Standard_False, const Standard_Boolean theIsProfOnSpine = Standard_False, const Standard_Real theTol = 0.0000001, const Standard_Boolean theIsVolume = Standard_False, const Standard_Boolean theRunInParallel = Standard_False);

		/****************** Bottom ******************/
		/**** md5 signature: 25476ceb1dec30bd7775d9279e3f641c ****/
		%feature("compactdefaultargs") Bottom;
		%feature("autodoc", "Return the face bottom if <solid> is true in the constructor.

Returns
-------
TopoDS_Shape
") Bottom;
		const TopoDS_Shape Bottom();

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the resulting shape (redefined from makeshape).

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Evolved ******************/
		/**** md5 signature: 9cd16375e762072934864900214c9cab ****/
		%feature("compactdefaultargs") Evolved;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepFill_Evolved
") Evolved;
		const BRepFill_Evolved & Evolved();

		/****************** GeneratedShapes ******************/
		/**** md5 signature: d6b410f91bd0b638e68b4f66ed161f82 ****/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "Returns the shapes created from a subshape <spineshape> of the spine and a subshape <profshape> on the profile.

Parameters
----------
SpineShape: TopoDS_Shape
ProfShape: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes(const TopoDS_Shape & SpineShape, const TopoDS_Shape & ProfShape);

		/****************** Top ******************/
		/**** md5 signature: c5b73d85ae980e083fd62982344b1f23 ****/
		%feature("compactdefaultargs") Top;
		%feature("autodoc", "Return the face top if <solid> is true in the constructor.

Returns
-------
TopoDS_Shape
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
		/****************** BRepOffsetAPI_MakeFilling ******************/
		/**** md5 signature: 6b2c1458dee21e3098205eace85ff1c2 ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeFilling;
		%feature("autodoc", "Constructs a wire filling object defined by - the energy minimizing criterion degree - the number of points on the curve nbpntsoncur - the number of iterations nbiter - the boolean anisotropie - the 2d tolerance tol2d - the 3d tolerance tol3d - the angular tolerance tolang - the tolerance for curvature tolcur - the highest polynomial degree maxdeg - the greatest number of segments maxseg. if the boolean anistropie is true, the algorithm's performance is better in cases where the ratio of the length u and the length v indicate a great difference between the two. in other words, when the surface is, for example, extremely long.

Parameters
----------
Degree: int,optional
	default value is 3
NbPtsOnCur: int,optional
	default value is 15
NbIter: int,optional
	default value is 2
Anisotropie: bool,optional
	default value is Standard_False
Tol2d: float,optional
	default value is 0.00001
Tol3d: float,optional
	default value is 0.0001
TolAng: float,optional
	default value is 0.01
TolCurv: float,optional
	default value is 0.1
MaxDeg: int,optional
	default value is 8
MaxSegments: int,optional
	default value is 9

Returns
-------
None
") BRepOffsetAPI_MakeFilling;
		 BRepOffsetAPI_MakeFilling(const Standard_Integer Degree = 3, const Standard_Integer NbPtsOnCur = 15, const Standard_Integer NbIter = 2, const Standard_Boolean Anisotropie = Standard_False, const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1, const Standard_Integer MaxDeg = 8, const Standard_Integer MaxSegments = 9);

		/****************** Add ******************/
		/**** md5 signature: f3f101643ae89de07cd1205b58a9a0bc ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a new constraint which also defines an edge of the wire of the face order: order of the constraint: geomabs_c0 : the surface has to pass by 3d representation of the edge geomabs_g1 : the surface has to pass by 3d representation of the edge and to respect tangency with the first face of the edge geomabs_g2 : the surface has to pass by 3d representation of the edge and to respect tangency and curvature with the first face of the edge. raises constructionerror if the edge has no representation on a face and order is geomabs_g1 or geomabs_g2.

Parameters
----------
Constr: TopoDS_Edge
Order: GeomAbs_Shape
IsBound: bool,optional
	default value is Standard_True

Returns
-------
int
") Add;
		Standard_Integer Add(const TopoDS_Edge & Constr, const GeomAbs_Shape Order, const Standard_Boolean IsBound = Standard_True);

		/****************** Add ******************/
		/**** md5 signature: 415312c3d021976e6e2f3b6a96253fb7 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a new constraint which also defines an edge of the wire of the face order: order of the constraint: geomabs_c0 : the surface has to pass by 3d representation of the edge geomabs_g1 : the surface has to pass by 3d representation of the edge and to respect tangency with the given face geomabs_g2 : the surface has to pass by 3d representation of the edge and to respect tangency and curvature with the given face. raises constructionerror if the edge has no 2d representation on the given face.

Parameters
----------
Constr: TopoDS_Edge
Support: TopoDS_Face
Order: GeomAbs_Shape
IsBound: bool,optional
	default value is Standard_True

Returns
-------
int
") Add;
		Standard_Integer Add(const TopoDS_Edge & Constr, const TopoDS_Face & Support, const GeomAbs_Shape Order, const Standard_Boolean IsBound = Standard_True);

		/****************** Add ******************/
		/**** md5 signature: c110c3c507d8423f3ffde002d65004bf ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a free constraint on a face. the corresponding edge has to be automatically recomputed. it is always a bound.

Parameters
----------
Support: TopoDS_Face
Order: GeomAbs_Shape

Returns
-------
int
") Add;
		Standard_Integer Add(const TopoDS_Face & Support, const GeomAbs_Shape Order);

		/****************** Add ******************/
		/**** md5 signature: 1323f2a6b2ca8774ee472101d9518362 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a punctual constraint.

Parameters
----------
Point: gp_Pnt

Returns
-------
int
") Add;
		Standard_Integer Add(const gp_Pnt & Point);

		/****************** Add ******************/
		/**** md5 signature: 66afaf29b06657fd99d38717aeeeb9f6 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a punctual constraint.

Parameters
----------
U: float
V: float
Support: TopoDS_Face
Order: GeomAbs_Shape

Returns
-------
int
") Add;
		Standard_Integer Add(const Standard_Real U, const Standard_Real V, const TopoDS_Face & Support, const GeomAbs_Shape Order);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the resulting faces.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** G0Error ******************/
		/**** md5 signature: ba177a9a7bac2d394577a179fd8040ef ****/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "Returns the maximum distance between the result and the constraints. this is set at construction time.

Returns
-------
float
") G0Error;
		Standard_Real G0Error();

		/****************** G0Error ******************/
		/**** md5 signature: f99dce5527bffb3ecaa2d1093b4a3635 ****/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "Returns the maximum distance attained between the result and the constraint index. this is set at construction time.

Parameters
----------
Index: int

Returns
-------
float
") G0Error;
		Standard_Real G0Error(const Standard_Integer Index);

		/****************** G1Error ******************/
		/**** md5 signature: 0a0e55267bc5572a38177b75a97dfedc ****/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "Returns the maximum angle between the result and the constraints. this is set at construction time.

Returns
-------
float
") G1Error;
		Standard_Real G1Error();

		/****************** G1Error ******************/
		/**** md5 signature: 0d786918d533628c34e845fd87da5a9b ****/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "Returns the maximum angle between the result and the constraints. this is set at construction time.

Parameters
----------
Index: int

Returns
-------
float
") G1Error;
		Standard_Real G1Error(const Standard_Integer Index);

		/****************** G2Error ******************/
		/**** md5 signature: 0eac129a84e8ae945532a18ff833414e ****/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "Returns the maximum angle between the result and the constraints. this is set at construction time.

Returns
-------
float
") G2Error;
		Standard_Real G2Error();

		/****************** G2Error ******************/
		/**** md5 signature: 02032765271044476a9ce38570208342 ****/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "Returns the greatest difference in curvature found between the result and the constraint index.

Parameters
----------
Index: int

Returns
-------
float
") G2Error;
		Standard_Real G2Error(const Standard_Integer Index);

		/****************** Generated ******************/
		/**** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		/**** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Tests whether computation of the filling plate has been completed.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** LoadInitSurface ******************/
		/**** md5 signature: f3dc564cdf464b4c186eaa11f91e9fe8 ****/
		%feature("compactdefaultargs") LoadInitSurface;
		%feature("autodoc", "Loads the initial surface surf to begin the construction of the surface. this optional function is useful if the surface resulting from construction for the algorithm is likely to be complex. the support surface of the face under construction is computed by a deformation of surf which satisfies the given constraints. the set of bounding edges defines the wire of the face. if no initial surface is given, the algorithm computes it automatically. if the set of edges is not connected (free constraint), missing edges are automatically computed. important: the initial surface must have orthogonal local coordinates, i.e. partial derivatives ds/du and ds/dv must be orthogonal at each point of surface. if this condition breaks, distortions of resulting surface are possible.

Parameters
----------
Surf: TopoDS_Face

Returns
-------
None
") LoadInitSurface;
		void LoadInitSurface(const TopoDS_Face & Surf);

		/****************** SetApproxParam ******************/
		/**** md5 signature: 24678d9cf0187a1e2d5fe74dfef72b0d ****/
		%feature("compactdefaultargs") SetApproxParam;
		%feature("autodoc", "Sets the parameters used to approximate the filling surface. these include: - maxdeg - the highest degree which the polynomial defining the filling surface can have - maxsegments - the greatest number of segments which the filling surface can have.

Parameters
----------
MaxDeg: int,optional
	default value is 8
MaxSegments: int,optional
	default value is 9

Returns
-------
None
") SetApproxParam;
		void SetApproxParam(const Standard_Integer MaxDeg = 8, const Standard_Integer MaxSegments = 9);

		/****************** SetConstrParam ******************/
		/**** md5 signature: 2d967f76f30735b0413b7afac7004fa6 ****/
		%feature("compactdefaultargs") SetConstrParam;
		%feature("autodoc", "Sets the values of tolerances used to control the constraint. tol2d: tol3d: it is the maximum distance allowed between the support surface and the constraints tolang: it is the maximum angle allowed between the normal of the surface and the constraints tolcurv: it is the maximum difference of curvature allowed between the surface and the constraint.

Parameters
----------
Tol2d: float,optional
	default value is 0.00001
Tol3d: float,optional
	default value is 0.0001
TolAng: float,optional
	default value is 0.01
TolCurv: float,optional
	default value is 0.1

Returns
-------
None
") SetConstrParam;
		void SetConstrParam(const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1);

		/****************** SetResolParam ******************/
		/**** md5 signature: 96cad4665171fb74735ecc8d46155136 ****/
		%feature("compactdefaultargs") SetResolParam;
		%feature("autodoc", "Sets the parameters used for resolution. the default values of these parameters have been chosen for a good ratio quality/performance. degree: it is the order of energy criterion to minimize for computing the deformation of the surface. the default value is 3 the recommanded value is i+2 where i is the maximum order of the constraints. nbptsoncur: it is the average number of points for discretisation of the edges. nbiter: it is the maximum number of iterations of the process. for each iteration the number of discretisation points is increased. anisotropie:.

Parameters
----------
Degree: int,optional
	default value is 3
NbPtsOnCur: int,optional
	default value is 15
NbIter: int,optional
	default value is 2
Anisotropie: bool,optional
	default value is Standard_False

Returns
-------
None
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
		/****************** BRepOffsetAPI_MakeOffset ******************/
		/**** md5 signature: 88d16e162a6684102baaab1a8f41cc87 ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffset;
		%feature("autodoc", "Constructs an algorithm for creating an empty offset.

Returns
-------
None
") BRepOffsetAPI_MakeOffset;
		 BRepOffsetAPI_MakeOffset();

		/****************** BRepOffsetAPI_MakeOffset ******************/
		/**** md5 signature: 6c382c138f0e83f35d2532782330627a ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffset;
		%feature("autodoc", "Constructs an algorithm for creating an algorithm to build parallels to the spine spine.

Parameters
----------
Spine: TopoDS_Face
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
IsOpenResult: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepOffsetAPI_MakeOffset;
		 BRepOffsetAPI_MakeOffset(const TopoDS_Face & Spine, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****************** BRepOffsetAPI_MakeOffset ******************/
		/**** md5 signature: edca00730463e7bdc67c3ca57a3de792 ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffset;
		%feature("autodoc", "No available documentation.

Parameters
----------
Spine: TopoDS_Wire
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
IsOpenResult: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepOffsetAPI_MakeOffset;
		 BRepOffsetAPI_MakeOffset(const TopoDS_Wire & Spine, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****************** AddWire ******************/
		/**** md5 signature: f11eaa49e4d45e90c9ae3f7a4166b6ad ****/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "Initializes the algorithm to construct parallels to the wire spine.

Parameters
----------
Spine: TopoDS_Wire

Returns
-------
None
") AddWire;
		void AddWire(const TopoDS_Wire & Spine);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the resulting shape (redefined from makeshape).

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Generated ******************/
		/**** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns a list of the created shapes from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** Init ******************/
		/**** md5 signature: 04028fd0677eb2fad3b6134f24c0b959 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the algorithm to construct parallels to the spine spine. join defines the type of parallel generated by the salient vertices of the spine. the default type is geomabs_arc where the vertices generate sections of a circle. if join type is geomabs_intersection, the edges that intersect in a salient vertex generate the edges prolonged until intersection.

Parameters
----------
Spine: TopoDS_Face
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
IsOpenResult: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & Spine, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****************** Init ******************/
		/**** md5 signature: 36efcaeec9c18f0906259d528d83ea6b ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the evaluation of offseting.

Parameters
----------
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
IsOpenResult: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: 50205eaf73b49f4d2b44f0537bf87989 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes a parallel to the spine at distance offset and at an altitude alt from the plane of the spine in relation to the normal to the spine. exceptions: stdfail_notdone if the offset is not built.

Parameters
----------
Offset: float
Alt: float,optional
	default value is 0.0

Returns
-------
None
") Perform;
		void Perform(const Standard_Real Offset, const Standard_Real Alt = 0.0);

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
		/****************** BRepOffsetAPI_MakeOffsetShape ******************/
		/**** md5 signature: d913edb15df090e4ff503886c9e1f814 ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffsetShape;
		%feature("autodoc", "Constructor does nothing.

Returns
-------
None
") BRepOffsetAPI_MakeOffsetShape;
		 BRepOffsetAPI_MakeOffsetShape();

		/****************** BRepOffsetAPI_MakeOffsetShape ******************/
		/**** md5 signature: 8a8fe72515b618d61b455b9b1b3afd7c ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeOffsetShape;
		%feature("autodoc", "Deprecated constructor. please avoid usage of this constructor.

Parameters
----------
S: TopoDS_Shape
Offset: float
Tol: float
Mode: BRepOffset_Mode,optional
	default value is BRepOffset_Skin
Intersection: bool,optional
	default value is Standard_False
SelfInter: bool,optional
	default value is Standard_False
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
RemoveIntEdges: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepOffsetAPI_MakeOffsetShape;
		 BRepOffsetAPI_MakeOffsetShape(const TopoDS_Shape & S, const Standard_Real Offset, const Standard_Real Tol, const BRepOffset_Mode Mode = BRepOffset_Skin, const Standard_Boolean Intersection = Standard_False, const Standard_Boolean SelfInter = Standard_False, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean RemoveIntEdges = Standard_False);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Does nothing.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Generated ******************/
		/**** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** GeneratedEdge ******************/
		/**** md5 signature: f0bfb2d646d07d429ca951574c9bb754 ****/
		%feature("compactdefaultargs") GeneratedEdge;
		%feature("autodoc", "Returns the list of edges generated from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") GeneratedEdge;
		const TopTools_ListOfShape & GeneratedEdge(const TopoDS_Shape & S);

		/****************** GetJoinType ******************/
		/**** md5 signature: 98bbd653674d56f0804dd681f91e2cf5 ****/
		%feature("compactdefaultargs") GetJoinType;
		%feature("autodoc", "Returns offset join type.

Returns
-------
GeomAbs_JoinType
") GetJoinType;
		GeomAbs_JoinType GetJoinType();

		/****************** MakeOffset ******************/
		/**** md5 signature: 3130f0edba2681c2d8feeda712784d5d ****/
		%feature("compactdefaultargs") MakeOffset;
		%feature("autodoc", "Returns instance of the unrelying intersection / arc algorithm.

Returns
-------
BRepOffset_MakeOffset
") MakeOffset;
		virtual const BRepOffset_MakeOffset & MakeOffset();

		/****************** PerformByJoin ******************/
		/**** md5 signature: 6ac254a6e8ed9352884246b2f9d9a1a7 ****/
		%feature("compactdefaultargs") PerformByJoin;
		%feature("autodoc", "Constructs a shape parallel to the shape s, where - s may be a face, a shell, a solid or a compound of these shape kinds; - offset is the offset value. the offset shape is constructed: - outside s, if offset is positive, - inside s, if offset is negative; - tol defines the coincidence tolerance criterion for generated shapes; - mode defines the construction type of parallels applied to the free edges of shape s; currently, only one construction type is implemented, namely the one where the free edges do not generate parallels; this corresponds to the default value brepoffset_skin; - intersection specifies how the algorithm must work in order to limit the parallels to two adjacent shapes: - if intersection is false (default value), the intersection is calculated with the parallels to the two adjacent shapes, - if intersection is true, the intersection is calculated by taking all generated parallels into account; this computation method is more general as it avoids some self-intersections generated in the offset shape from features of small dimensions on shape s, however this method has not been completely implemented and therefore is not recommended for use; - selfinter tells the algorithm whether a computation to eliminate self-intersections must be applied to the resulting shape; however, as this functionality is not yet implemented, it is recommended to use the default value (false); - join defines how to fill the holes that may appear between parallels to the two adjacent faces. it may take values geomabs_arc or geomabs_intersection: - if join is equal to geomabs_arc, then pipes are generated between two free edges of two adjacent parallels, and spheres are generated on 'images' of vertices; it is the default value, - if join is equal to geomabs_intersection, then the parallels to the two adjacent faces are enlarged and intersected, so that there are no free edges on parallels to faces. removeintedges flag defines whether to remove the internal edges from the result or not. warnings 1. all the faces of the shape s should be based on the surfaces with continuity at least c1. 2. the offset value should be sufficiently small to avoid self-intersections in resulting shape. otherwise these self-intersections may appear inside an offset face if its initial surface is not plane or sphere or cylinder, also some non-adjacent offset faces may intersect each other. also, some offset surfaces may 'turn inside out'. 3. the algorithm may fail if the shape s contains vertices where more than 3 edges converge. 4. since 3d-offset algorithm involves intersection of surfaces, it is under limitations of surface intersection algorithm. 5. a result cannot be generated if the underlying geometry of s is bspline with continuity c0. exceptions geom_undefinedderivative if the underlying geometry of s is bspline with continuity c0.

Parameters
----------
S: TopoDS_Shape
Offset: float
Tol: float
Mode: BRepOffset_Mode,optional
	default value is BRepOffset_Skin
Intersection: bool,optional
	default value is Standard_False
SelfInter: bool,optional
	default value is Standard_False
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
RemoveIntEdges: bool,optional
	default value is Standard_False

Returns
-------
None
") PerformByJoin;
		void PerformByJoin(const TopoDS_Shape & S, const Standard_Real Offset, const Standard_Real Tol, const BRepOffset_Mode Mode = BRepOffset_Skin, const Standard_Boolean Intersection = Standard_False, const Standard_Boolean SelfInter = Standard_False, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean RemoveIntEdges = Standard_False);

		/****************** PerformBySimple ******************/
		/**** md5 signature: 005d9d4f6366bed358be54e547e045db ****/
		%feature("compactdefaultargs") PerformBySimple;
		%feature("autodoc", "Constructs offset shape for the given one using simple algorithm without intersections computation.

Parameters
----------
theS: TopoDS_Shape
theOffsetValue: float

Returns
-------
None
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
		/****************** BRepOffsetAPI_MakePipe ******************/
		/**** md5 signature: 9a0f7eb2c8727a0bca36fe46f7e3eec3 ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakePipe;
		%feature("autodoc", "Constructs a pipe by sweeping the shape profile along the wire spine.the angle made by the spine with the profile is maintained along the length of the pipe. warning spine must be g1 continuous; that is, on the connection vertex of two edges of the wire, the tangent vectors on the left and on the right must have the same direction, though not necessarily the same magnitude. exceptions standard_domainerror if the profile is a solid or a composite solid.

Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Shape

Returns
-------
None
") BRepOffsetAPI_MakePipe;
		 BRepOffsetAPI_MakePipe(const TopoDS_Wire & Spine, const TopoDS_Shape & Profile);

		/****************** BRepOffsetAPI_MakePipe ******************/
		/**** md5 signature: 7fdb4b4ef91c75cd892ca136b43bf5da ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakePipe;
		%feature("autodoc", "The same as previous but with setting of mode of sweep and the flag that indicates attempt to approximate a c1-continuous surface if a swept surface proved to be c0.

Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Shape
aMode: GeomFill_Trihedron
ForceApproxC1: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepOffsetAPI_MakePipe;
		 BRepOffsetAPI_MakePipe(const TopoDS_Wire & Spine, const TopoDS_Shape & Profile, const GeomFill_Trihedron aMode, const Standard_Boolean ForceApproxC1 = Standard_False);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the resulting shape (redefined from makeshape).

Returns
-------
None
") Build;
		virtual void Build();

		/****************** ErrorOnSurface ******************/
		/**** md5 signature: b6b87ca0efc7814953c22829fefc7f65 ****/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ErrorOnSurface;
		Standard_Real ErrorOnSurface();

		/****************** FirstShape ******************/
		/**** md5 signature: 58fcb2a790a0aa12dce93bc2307abc16 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the topods shape of the bottom of the prism.

Returns
-------
TopoDS_Shape
") FirstShape;
		TopoDS_Shape FirstShape();

		/****************** Generated ******************/
		/**** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** Generated ******************/
		/**** md5 signature: da81408487ea6911b58fe475fd4ea546 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "No available documentation.

Parameters
----------
SSpine: TopoDS_Shape
SProfile: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Generated;
		TopoDS_Shape Generated(const TopoDS_Shape & SSpine, const TopoDS_Shape & SProfile);

		/****************** LastShape ******************/
		/**** md5 signature: 00d36051126aa083896abae0c2f17b32 ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the top of the prism.

Returns
-------
TopoDS_Shape
") LastShape;
		TopoDS_Shape LastShape();

		/****************** Pipe ******************/
		/**** md5 signature: 976ad7a0864ead36b17759e50cc7cebd ****/
		%feature("compactdefaultargs") Pipe;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepFill_Pipe
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
		/****************** BRepOffsetAPI_MakePipeShell ******************/
		/**** md5 signature: 2de09d18cf07159481a80873b4b5d90c ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakePipeShell;
		%feature("autodoc", "Constructs the shell-generating framework defined by the wire spine. sets an sweep's mode if no mode are setted, the mode use in makepipe is used.

Parameters
----------
Spine: TopoDS_Wire

Returns
-------
None
") BRepOffsetAPI_MakePipeShell;
		 BRepOffsetAPI_MakePipeShell(const TopoDS_Wire & Spine);

		/****************** Add ******************/
		/**** md5 signature: 4646415ed2583fb1eb7c020fef17efa7 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the section profile to this framework. first and last sections may be punctual, so the shape profile may be both wire and vertex. correspondent point on spine is computed automatically. if withcontact is true, the section is translated to be in contact with the spine. if withcorrection is true, the section is rotated to be orthogonal to the spine?s tangent in the correspondent point. this option has no sense if the section is punctual (profile is of type topods_vertex).

Parameters
----------
Profile: TopoDS_Shape
WithContact: bool,optional
	default value is Standard_False
WithCorrection: bool,optional
	default value is Standard_False

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & Profile, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****************** Add ******************/
		/**** md5 signature: ea9d6839d1fe733dcb8684defcce8b79 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the section profile to this framework. correspondent point on the spine is given by location. warning: to be effective, it is not recommended to combine methods add and setlaw.

Parameters
----------
Profile: TopoDS_Shape
Location: TopoDS_Vertex
WithContact: bool,optional
	default value is Standard_False
WithCorrection: bool,optional
	default value is Standard_False

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & Profile, const TopoDS_Vertex & Location, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the resulting shape (redefined from makeshape).

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Delete ******************/
		/**** md5 signature: 12e4f2f3609a7b21fcf42ba451fc7b90 ****/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "Removes the section profile from this framework.

Parameters
----------
Profile: TopoDS_Shape

Returns
-------
None
") Delete;
		void Delete(const TopoDS_Shape & Profile);

		/****************** ErrorOnSurface ******************/
		/**** md5 signature: b6b87ca0efc7814953c22829fefc7f65 ****/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ErrorOnSurface;
		Standard_Real ErrorOnSurface();

		/****************** FirstShape ******************/
		/**** md5 signature: 9141e4a066781501fc49e6dc1e5e4641 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the topods shape of the bottom of the sweep.

Returns
-------
TopoDS_Shape
") FirstShape;
		virtual TopoDS_Shape FirstShape();

		/****************** Generated ******************/
		/**** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns a list of new shapes generated from the shape s by the shell-generating algorithm. this function is redefined from brepoffsetapi_makeshape::generated. s can be an edge or a vertex of a given profile (see methods add).

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** GetStatus ******************/
		/**** md5 signature: 7fc2662f43e326653463499b95ca8153 ****/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Get a status, when simulate or build failed. it can be brepbuilderapi_pipedone, brepbuilderapi_pipenotdone, brepbuilderapi_planenotintersectguide, brepbuilderapi_impossiblecontact.

Returns
-------
BRepBuilderAPI_PipeError
") GetStatus;
		BRepBuilderAPI_PipeError GetStatus();

		/****************** IsReady ******************/
		/**** md5 signature: 68a96b040fc0b59848125a1a3ef33dcb ****/
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "Returns true if this tool object is ready to build the shape, i.e. has a definition for the wire section profile.

Returns
-------
bool
") IsReady;
		Standard_Boolean IsReady();

		/****************** LastShape ******************/
		/**** md5 signature: 6f7d02deb40719f75425be30543f3deb ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the top of the sweep.

Returns
-------
TopoDS_Shape
") LastShape;
		virtual TopoDS_Shape LastShape();

		/****************** MakeSolid ******************/
		/**** md5 signature: cac327adfb21fa10211d68dabc53974b ****/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "Transforms the sweeping shell in solid. if a propfile is not closed returns false.

Returns
-------
bool
") MakeSolid;
		Standard_Boolean MakeSolid();

		/****************** Profiles ******************/
		/**** md5 signature: 1b2b499d210731d9c45ae6c16e16db56 ****/
		%feature("compactdefaultargs") Profiles;
		%feature("autodoc", "Returns the list of original profiles.

Parameters
----------
theProfiles: TopTools_ListOfShape

Returns
-------
None
") Profiles;
		void Profiles(TopTools_ListOfShape & theProfiles);

		/****************** SetDiscreteMode ******************/
		/**** md5 signature: 0366446a5945e513e46ee5778018b32d ****/
		%feature("compactdefaultargs") SetDiscreteMode;
		%feature("autodoc", "Sets a discrete trihedron to perform the sweeping.

Returns
-------
None
") SetDiscreteMode;
		void SetDiscreteMode();

		/****************** SetForceApproxC1 ******************/
		/**** md5 signature: ef99bf0713e14fbe9531aef549b5c75b ****/
		%feature("compactdefaultargs") SetForceApproxC1;
		%feature("autodoc", "Set the flag that indicates attempt to approximate a c1-continuous surface if a swept surface proved to be c0.

Parameters
----------
ForceApproxC1: bool

Returns
-------
None
") SetForceApproxC1;
		void SetForceApproxC1(const Standard_Boolean ForceApproxC1);

		/****************** SetLaw ******************/
		/**** md5 signature: af186f09c05a666850d65baf0970c9c2 ****/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "Sets the evolution law defined by the wire profile with its position (location, withcontact, withcorrection are the same options as in methods add) and a homotetic law defined by the function l. warning: to be effective, it is not recommended to combine methods add and setlaw.

Parameters
----------
Profile: TopoDS_Shape
L: Law_Function
WithContact: bool,optional
	default value is Standard_False
WithCorrection: bool,optional
	default value is Standard_False

Returns
-------
None
") SetLaw;
		void SetLaw(const TopoDS_Shape & Profile, const opencascade::handle<Law_Function> & L, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****************** SetLaw ******************/
		/**** md5 signature: d67cbe53520bea57d641b9a7a96a4fae ****/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "Sets the evolution law defined by the wire profile with its position (location, withcontact, withcorrection are the same options as in methods add) and a homotetic law defined by the function l. warning: to be effective, it is not recommended to combine methods add and setlaw.

Parameters
----------
Profile: TopoDS_Shape
L: Law_Function
Location: TopoDS_Vertex
WithContact: bool,optional
	default value is Standard_False
WithCorrection: bool,optional
	default value is Standard_False

Returns
-------
None
") SetLaw;
		void SetLaw(const TopoDS_Shape & Profile, const opencascade::handle<Law_Function> & L, const TopoDS_Vertex & Location, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****************** SetMaxDegree ******************/
		/**** md5 signature: 2a3ad6060a0d872631abe8d437d6229f ****/
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "Define the maximum v degree of resulting surface.

Parameters
----------
NewMaxDegree: int

Returns
-------
None
") SetMaxDegree;
		void SetMaxDegree(const Standard_Integer NewMaxDegree);

		/****************** SetMaxSegments ******************/
		/**** md5 signature: 7215f32d76e44b535e90a1a1c2957613 ****/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "Define the maximum number of spans in v-direction on resulting surface.

Parameters
----------
NewMaxSegments: int

Returns
-------
None
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer NewMaxSegments);

		/****************** SetMode ******************/
		/**** md5 signature: 20857301a5924ef00dcb05d83545dafe ****/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "Sets a frenet or a correctedfrenet trihedron to perform the sweeping if isfrenet is false, a corrected frenet trihedron is used.

Parameters
----------
IsFrenet: bool,optional
	default value is Standard_False

Returns
-------
None
") SetMode;
		void SetMode(const Standard_Boolean IsFrenet = Standard_False);

		/****************** SetMode ******************/
		/**** md5 signature: 53e884a5bc116ff1835f19ced706e8c7 ****/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "Sets a fixed trihedron to perform the sweeping all sections will be parallel.

Parameters
----------
Axe: gp_Ax2

Returns
-------
None
") SetMode;
		void SetMode(const gp_Ax2 & Axe);

		/****************** SetMode ******************/
		/**** md5 signature: 58a4bdd8c9c0ebb3412c56dad6c67f67 ****/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "Sets a fixed binormal direction to perform the -- sweeping. angular relations beetween the section(s) and <binormal> will be constant.

Parameters
----------
BiNormal: gp_Dir

Returns
-------
None
") SetMode;
		void SetMode(const gp_Dir & BiNormal);

		/****************** SetMode ******************/
		/**** md5 signature: f11f503b2f352f2900bc069378318b41 ****/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "Sets support to the spine to define the binormal of the trihedron, like the normal to the surfaces. warning: to be effective, each edge of the <spine> must have an representaion on one face of<spinesupport>.

Parameters
----------
SpineSupport: TopoDS_Shape

Returns
-------
bool
") SetMode;
		Standard_Boolean SetMode(const TopoDS_Shape & SpineSupport);

		/****************** SetMode ******************/
		/**** md5 signature: b56b51364ac5002747edc4b052d16a76 ****/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "Sets an auxiliary spine to define the normal for each point of the spine p, an point q is evalued on <auxiliaryspine> if <curvilinearequivalence> q split <auxiliaryspine> with the same length ratio than p split <spline>. else the plan define by p and the tangent to the <spine> intersect <auxiliaryspine> in q. if <keepcontact> equals brepfill_nocontact: the normal is defined by the vector pq. if <keepcontact> equals brepfill_contact: the normal is defined to achieve that the sweeped section is in contact to the auxiliaryspine. the width of section is constant all along the path. in other words, the auxiliary spine lies on the swept surface, but not necessarily is a boundary of this surface. however, the auxiliary spine has to be close enough to the main spine to provide intersection with any section all along the path. if <keepcontact> equals brepfill_contactonborder: the auxiliary spine becomes a boundary of the swept surface and the width of section varies along the path. give section to sweep. possibilities are : - give one or sevral section - give one profile and an homotetic law. - automatic compute of correspondance beetween spine, and section on the sweeped shape - correspondance beetween spine, and section on the sweeped shape defined by a vertex of the spine.

Parameters
----------
AuxiliarySpine: TopoDS_Wire
CurvilinearEquivalence: bool
KeepContact: BRepFill_TypeOfContact,optional
	default value is BRepFill_NoContact

Returns
-------
None
") SetMode;
		void SetMode(const TopoDS_Wire & AuxiliarySpine, const Standard_Boolean CurvilinearEquivalence, const BRepFill_TypeOfContact KeepContact = BRepFill_NoContact);

		/****************** SetTolerance ******************/
		/**** md5 signature: 7a6605305c5a1448579b26f09880877f ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets the following tolerance values - 3d tolerance tol3d - boundary tolerance boundtol - angular tolerance tolangular.

Parameters
----------
Tol3d: float,optional
	default value is 1.0e-4
BoundTol: float,optional
	default value is 1.0e-4
TolAngular: float,optional
	default value is 1.0e-2

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol3d = 1.0e-4, const Standard_Real BoundTol = 1.0e-4, const Standard_Real TolAngular = 1.0e-2);

		/****************** SetTransitionMode ******************/
		/**** md5 signature: 52d1ed1eb716770e53a2e79bdf9a0449 ****/
		%feature("compactdefaultargs") SetTransitionMode;
		%feature("autodoc", "Sets the transition mode to manage discontinuities on the swept shape caused by fractures on the spine. the transition mode can be brepbuilderapi_transformed (default value), brepbuilderapi_rightcorner, brepbuilderapi_roundcorner: -  repbuilderapi_transformed: discontinuities are treated by modification of the sweeping mode. the pipe is 'transformed' at the fractures of the spine. this mode assumes building a self-intersected shell. -  brepbuilderapi_rightcorner: discontinuities are treated like right corner. two pieces of the pipe corresponding to two adjacent segments of the spine are extended and intersected at a fracture of the spine. -  brepbuilderapi_roundcorner: discontinuities are treated like round corner. the corner is treated as rotation of the profile around an axis which passes through the point of the spine's fracture. this axis is based on cross product of directions tangent to the adjacent segments of the spine at their common point. warnings the mode brepbuilderapi_rightcorner provides a valid result if intersection of two pieces of the pipe (corresponding to two adjacent segments of the spine) in the neighborhood of the spine?s fracture is connected and planar. this condition can be violated if the spine is non-linear in some neighborhood of the fracture or if the profile was set with a scaling law. the last mode, brepbuilderapi_roundcorner, will assuredly provide a good result only if a profile was set with option withcorrection = true, i.e. it is strictly orthogonal to the spine.

Parameters
----------
Mode: BRepBuilderAPI_TransitionMode,optional
	default value is BRepBuilderAPI_Transformed

Returns
-------
None
") SetTransitionMode;
		void SetTransitionMode(const BRepBuilderAPI_TransitionMode Mode = BRepBuilderAPI_Transformed);

		/****************** Simulate ******************/
		/**** md5 signature: b923147c061b5747b67b09a6323794bf ****/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "Simulates the resulting shape by calculating its cross-sections. the spine is devided by this cross-sections into (numberofsection - 1) equal parts, the number of cross-sections is numberofsection. the cross-sections are wires and they are returned in the list result. this gives a rapid preview of the resulting shape, which will be obtained using the settings you have provided. raises notdone if <self> it is not ready.

Parameters
----------
NumberOfSection: int
Result: TopTools_ListOfShape

Returns
-------
None
") Simulate;
		void Simulate(const Standard_Integer NumberOfSection, TopTools_ListOfShape & Result);

		/****************** Spine ******************/
		/**** md5 signature: 6331688635fc3e41ab0cf89de46bd269 ****/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "Returns the spine.

Returns
-------
TopoDS_Wire
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
		/****************** BRepOffsetAPI_MiddlePath ******************/
		/**** md5 signature: c964dfce8ffed5f9be691f524371850a ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MiddlePath;
		%feature("autodoc", "General constructor. startshape and endshape may be a wire or a face.

Parameters
----------
aShape: TopoDS_Shape
StartShape: TopoDS_Shape
EndShape: TopoDS_Shape

Returns
-------
None
") BRepOffsetAPI_MiddlePath;
		 BRepOffsetAPI_MiddlePath(const TopoDS_Shape & aShape, const TopoDS_Shape & StartShape, const TopoDS_Shape & EndShape);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Build;
		virtual void Build();

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
		/****************** BRepOffsetAPI_NormalProjection ******************/
		/**** md5 signature: 0c4037ae49bf91992e6b54c49ed0e578 ****/
		%feature("compactdefaultargs") BRepOffsetAPI_NormalProjection;
		%feature("autodoc", "Constructs an empty framework to define projection on a shape according to the normal from each point to be projected to the shape.

Returns
-------
None
") BRepOffsetAPI_NormalProjection;
		 BRepOffsetAPI_NormalProjection();

		/****************** BRepOffsetAPI_NormalProjection ******************/
		/**** md5 signature: 626de6f3a5351392edd43bc27dfabdc0 ****/
		%feature("compactdefaultargs") BRepOffsetAPI_NormalProjection;
		%feature("autodoc", "Constructs a framework to define projection onto the basis shape s according to the normal from each point to be projected from the shape added to this framework by add. default parameters of the algorithm: tol3d = 1.e-04, tol2d =sqr(tol3d) , internalcontinuity = geomabs_c2, maxdegree = 14, maxseg = 16.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") BRepOffsetAPI_NormalProjection;
		 BRepOffsetAPI_NormalProjection(const TopoDS_Shape & S);

		/****************** Add ******************/
		/**** md5 signature: 819f71062dd96e4b529bccdf1bb50cf1 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the shape toproj to the framework for calculation of the projection by compute3d. toproj is an edge or a wire and will be projected onto the basis shape. exceptions standard_constructionerror if toproj is not added.

Parameters
----------
ToProj: TopoDS_Shape

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & ToProj);

		/****************** Ancestor ******************/
		/**** md5 signature: 551c6ce85c529cb60615765a58d47215 ****/
		%feature("compactdefaultargs") Ancestor;
		%feature("autodoc", "Returns the initial edge corresponding to the edge e resulting from the computation of the projection. exceptions stdfail_notdone if no edge was found. standard_nosuchobject if an edge corresponding to e has already been found.

Parameters
----------
E: TopoDS_Edge

Returns
-------
TopoDS_Shape
") Ancestor;
		const TopoDS_Shape Ancestor(const TopoDS_Edge & E);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the result of the projection as a compound of wires. tries to build oriented wires.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** BuildWire ******************/
		/**** md5 signature: e5fb4f3952649b872b4fb3c469f5b161 ****/
		%feature("compactdefaultargs") BuildWire;
		%feature("autodoc", "Build the result as a list of wire if possible in -- a first returns a wire only if there is only a wire.

Parameters
----------
Liste: TopTools_ListOfShape

Returns
-------
bool
") BuildWire;
		Standard_Boolean BuildWire(TopTools_ListOfShape & Liste);

		/****************** Compute3d ******************/
		/**** md5 signature: a18b9a3fc4a7d346645e19e03d893102 ****/
		%feature("compactdefaultargs") Compute3d;
		%feature("autodoc", "Returns true if a 3d curve is computed. if not, false is returned and an initial 3d curve is kept to build the resulting edges.

Parameters
----------
With3d: bool,optional
	default value is Standard_True

Returns
-------
None
") Compute3d;
		void Compute3d(const Standard_Boolean With3d = Standard_True);

		/****************** Couple ******************/
		/**** md5 signature: cbe6db4e25bf42b45544f6235fc33773 ****/
		%feature("compactdefaultargs") Couple;
		%feature("autodoc", "Returns the initial face corresponding to the projected edge e. exceptions stdfail_notdone if no face was found. standard_nosuchobject if if a face corresponding to e has already been found.

Parameters
----------
E: TopoDS_Edge

Returns
-------
TopoDS_Shape
") Couple;
		const TopoDS_Shape Couple(const TopoDS_Edge & E);

		/****************** Generated ******************/
		/**** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the empty constructor framework with the shape s.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		/**** md5 signature: c9aa3a454774a145a334d5dad12c1786 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the object was correctly built by the shape construction algorithm. if at the construction time of the shape, the algorithm cannot be completed, or the original data is corrupted, isdone returns false and therefore protects the use of functions to access the result of the construction (typically the shape function).

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Projection ******************/
		/**** md5 signature: d96e6638e8d3c59fa6809c83eda77a82 ****/
		%feature("compactdefaultargs") Projection;
		%feature("autodoc", "Performs the projection. the construction of the result is performed by build. exceptions stdfail_notdone if the projection was not performed.

Returns
-------
TopoDS_Shape
") Projection;
		const TopoDS_Shape Projection();

		/****************** SetLimit ******************/
		/**** md5 signature: 2affba7d2b02ca0d9a96522f0a57d409 ****/
		%feature("compactdefaultargs") SetLimit;
		%feature("autodoc", "Manage limitation of projected edges.

Parameters
----------
FaceBoundaries: bool,optional
	default value is Standard_True

Returns
-------
None
") SetLimit;
		void SetLimit(const Standard_Boolean FaceBoundaries = Standard_True);

		/****************** SetMaxDistance ******************/
		/**** md5 signature: 7c596903416448c58cc2576fe5ca8153 ****/
		%feature("compactdefaultargs") SetMaxDistance;
		%feature("autodoc", "Sets the maximum distance between target shape and shape to project. if this condition is not satisfied then corresponding part of solution is discarded. if maxdist < 0 then this method does not affect the algorithm.

Parameters
----------
MaxDist: float

Returns
-------
None
") SetMaxDistance;
		void SetMaxDistance(const Standard_Real MaxDist);

		/****************** SetParams ******************/
		/**** md5 signature: 145439fe62b19bd0fd3e24e9c7dd4c4d ****/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "Sets the parameters used for computation tol3 is the requiered tolerance between the 3d projected curve and its 2d representation internalcontinuity is the order of constraints used for approximation maxdeg and maxseg are the maximum degree and the maximum number of segment for bspline resulting of an approximation.

Parameters
----------
Tol3D: float
Tol2D: float
InternalContinuity: GeomAbs_Shape
MaxDegree: int
MaxSeg: int

Returns
-------
None
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
		/****************** BRepOffsetAPI_ThruSections ******************/
		/**** md5 signature: 2d1d68118a0d4fb22ccde1e154fbe87e ****/
		%feature("compactdefaultargs") BRepOffsetAPI_ThruSections;
		%feature("autodoc", "Initializes an algorithm for building a shell or a solid passing through a set of sections, where: - issolid is set to true if the construction algorithm is required to build a solid or to false if it is required to build a shell (the default value), - ruled is set to true if the faces generated between the edges of two consecutive wires are ruled surfaces or to false (the default value) if they are smoothed out by approximation, - pres3d defines the precision criterion used by the approximation algorithm; the default value is 1.0e-6. use addwire and addvertex to define the successive sections of the shell or solid to be built.

Parameters
----------
isSolid: bool,optional
	default value is Standard_False
ruled: bool,optional
	default value is Standard_False
pres3d: float,optional
	default value is 1.0e-06

Returns
-------
None
") BRepOffsetAPI_ThruSections;
		 BRepOffsetAPI_ThruSections(const Standard_Boolean isSolid = Standard_False, const Standard_Boolean ruled = Standard_False, const Standard_Real pres3d = 1.0e-06);

		/****************** AddVertex ******************/
		/**** md5 signature: b3427ef9c13bb9d306f4377b747f6e3c ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds the vertex vertex (punctual section) to the set of sections through which the shell or solid is built. a vertex may be added to the set of sections only as first or last section. at least one wire must be added to the set of sections by the method addwire. use the build function to construct the shape.

Parameters
----------
aVertex: TopoDS_Vertex

Returns
-------
None
") AddVertex;
		void AddVertex(const TopoDS_Vertex & aVertex);

		/****************** AddWire ******************/
		/**** md5 signature: 91c116931995adc0c5abeaf5746c9601 ****/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "Adds the wire wire to the set of sections through which the shell or solid is built. use the build function to construct the shape.

Parameters
----------
wire: TopoDS_Wire

Returns
-------
None
") AddWire;
		void AddWire(const TopoDS_Wire & wire);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** CheckCompatibility ******************/
		/**** md5 signature: 9d9925f6850c3d616051e8fa827482f4 ****/
		%feature("compactdefaultargs") CheckCompatibility;
		%feature("autodoc", "Sets/unsets the option to compute origin and orientation on wires to avoid twisted results and update wires to have same number of edges.

Parameters
----------
check: bool,optional
	default value is Standard_True

Returns
-------
None
") CheckCompatibility;
		void CheckCompatibility(const Standard_Boolean check = Standard_True);

		/****************** Continuity ******************/
		/**** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity used in the approximation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** CriteriumWeight ******************/
		/**** md5 signature: 4b68323f3c03d233f69e27404a58a42c ****/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "Returns the weights associed to the criterium used in the optimization.

Parameters
----------

Returns
-------
W1: float
W2: float
W3: float
") CriteriumWeight;
		void CriteriumWeight(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** FirstShape ******************/
		/**** md5 signature: 7feb91b88f8f76be63dd0e52049cfbe6 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the topods shape of the bottom of the loft if solid.

Returns
-------
TopoDS_Shape
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** Generated ******************/
		/**** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns a list of new shapes generated from the shape s by the shell-generating algorithm. this function is redefined from brepbuilderapi_makeshape::generated. s can be an edge or a vertex of a given profile (see methods addwire and addvertex).

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** GeneratedFace ******************/
		/**** md5 signature: 03196f2ef499f6adc08e797085c3e792 ****/
		%feature("compactdefaultargs") GeneratedFace;
		%feature("autodoc", "If ruled returns the face generated by each edge except the last wire if smoothed returns the face generated by each edge of the first wire.

Parameters
----------
Edge: TopoDS_Shape

Returns
-------
TopoDS_Shape
") GeneratedFace;
		TopoDS_Shape GeneratedFace(const TopoDS_Shape & Edge);

		/****************** Init ******************/
		/**** md5 signature: 82b061dc05f66b08422610d2d7504487 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm for building a shell or a solid passing through a set of sections, where: - issolid is set to true if this construction algorithm is required to build a solid or to false if it is required to build a shell. false is the default value; - ruled is set to true if the faces generated between the edges of two consecutive wires are ruled surfaces or to false (the default value) if they are smoothed out by approximation, - pres3d defines the precision criterion used by the approximation algorithm; the default value is 1.0e-6. use addwire and addvertex to define the successive sections of the shell or solid to be built.

Parameters
----------
isSolid: bool,optional
	default value is Standard_False
ruled: bool,optional
	default value is Standard_False
pres3d: float,optional
	default value is 1.0e-06

Returns
-------
None
") Init;
		void Init(const Standard_Boolean isSolid = Standard_False, const Standard_Boolean ruled = Standard_False, const Standard_Real pres3d = 1.0e-06);

		/****************** LastShape ******************/
		/**** md5 signature: e1c69c3678b816cb0e3d73096b528c5f ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the top of the loft if solid.

Returns
-------
TopoDS_Shape
") LastShape;
		const TopoDS_Shape LastShape();

		/****************** MaxDegree ******************/
		/**** md5 signature: 2c79ca8c281a4e3978650b16dd11f77d ****/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Returns the maximal u degree of result surface.

Returns
-------
int
") MaxDegree;
		Standard_Integer MaxDegree();

		/****************** ParType ******************/
		/**** md5 signature: 97fa11d31bc8075ba4a84bf8b926a855 ****/
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "Returns the type of parametrization used in the approximation.

Returns
-------
Approx_ParametrizationType
") ParType;
		Approx_ParametrizationType ParType();

		/****************** SetContinuity ******************/
		/**** md5 signature: 41a91b0ea6e9b248a1b48c05882f4281 ****/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "Define the continuity used in the approximation.

Parameters
----------
C: GeomAbs_Shape

Returns
-------
None
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape C);

		/****************** SetCriteriumWeight ******************/
		/**** md5 signature: f8c7045bd0e7f781a0984d023e8b1268 ****/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "Define the weights associed to the criterium used in the optimization. //! if wi <= 0.

Parameters
----------
W1: float
W2: float
W3: float

Returns
-------
None
") SetCriteriumWeight;
		void SetCriteriumWeight(const Standard_Real W1, const Standard_Real W2, const Standard_Real W3);

		/****************** SetMaxDegree ******************/
		/**** md5 signature: 764b2b655767f13bc2f68fea914b035d ****/
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "Define the maximal u degree of result surface.

Parameters
----------
MaxDeg: int

Returns
-------
None
") SetMaxDegree;
		void SetMaxDegree(const Standard_Integer MaxDeg);

		/****************** SetParType ******************/
		/**** md5 signature: ff343d7833ad3cc796439eb5cefa88ba ****/
		%feature("compactdefaultargs") SetParType;
		%feature("autodoc", "Define the type of parametrization used in the approximation.

Parameters
----------
ParType: Approx_ParametrizationType

Returns
-------
None
") SetParType;
		void SetParType(const Approx_ParametrizationType ParType);

		/****************** SetSmoothing ******************/
		/**** md5 signature: bd2468fb64c3e1eaeaa057fe519f5331 ****/
		%feature("compactdefaultargs") SetSmoothing;
		%feature("autodoc", "Define the approximation algorithm.

Parameters
----------
UseSmoothing: bool

Returns
-------
None
") SetSmoothing;
		void SetSmoothing(const Standard_Boolean UseSmoothing);

		/****************** UseSmoothing ******************/
		/**** md5 signature: 6d5d2a8f22f593639c02abb00ea646e6 ****/
		%feature("compactdefaultargs") UseSmoothing;
		%feature("autodoc", "Define the approximation algorithm.

Returns
-------
bool
") UseSmoothing;
		Standard_Boolean UseSmoothing();

		/****************** Wires ******************/
		/**** md5 signature: 7af6829b521050de003f1b861d6f8640 ****/
		%feature("compactdefaultargs") Wires;
		%feature("autodoc", "Returns the list of original wires.

Returns
-------
TopTools_ListOfShape
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
		/****************** BRepOffsetAPI_MakeThickSolid ******************/
		/**** md5 signature: 06d7c93c29e576765f1416bf7911cecc ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeThickSolid;
		%feature("autodoc", "Constructor does nothing.

Returns
-------
None
") BRepOffsetAPI_MakeThickSolid;
		 BRepOffsetAPI_MakeThickSolid();

		/****************** BRepOffsetAPI_MakeThickSolid ******************/
		/**** md5 signature: a45a9aa567bf7cf5a87b43fb0a945bcf ****/
		%feature("compactdefaultargs") BRepOffsetAPI_MakeThickSolid;
		%feature("autodoc", "Deprecated constructor. please avoid usage of this constructor.

Parameters
----------
S: TopoDS_Shape
ClosingFaces: TopTools_ListOfShape
Offset: float
Tol: float
Mode: BRepOffset_Mode,optional
	default value is BRepOffset_Skin
Intersection: bool,optional
	default value is Standard_False
SelfInter: bool,optional
	default value is Standard_False
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
RemoveIntEdges: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepOffsetAPI_MakeThickSolid;
		 BRepOffsetAPI_MakeThickSolid(const TopoDS_Shape & S, const TopTools_ListOfShape & ClosingFaces, const Standard_Real Offset, const Standard_Real Tol, const BRepOffset_Mode Mode = BRepOffset_Skin, const Standard_Boolean Intersection = Standard_False, const Standard_Boolean SelfInter = Standard_False, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean RemoveIntEdges = Standard_False);

		/****************** Build ******************/
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** MakeThickSolidByJoin ******************/
		/**** md5 signature: 383198924d6bc560c2c63216873b3dfd ****/
		%feature("compactdefaultargs") MakeThickSolidByJoin;
		%feature("autodoc", "Constructs a hollowed solid from the solid s by removing the set of faces closingfaces from s, where: offset defines the thickness of the walls. its sign indicates which side of the surface of the solid the hollowed shape is built on; - tol defines the tolerance criterion for coincidence in generated shapes; - mode defines the construction type of parallels applied to free edges of shape s. currently, only one construction type is implemented, namely the one where the free edges do not generate parallels; this corresponds to the default value brepoffset_skin; intersection specifies how the algorithm must work in order to limit the parallels to two adjacent shapes: - if intersection is false (default value), the intersection is calculated with the parallels to the two adjacent shapes, - if intersection is true, the intersection is calculated by taking account of all parallels generated; this computation method is more general as it avoids self-intersections generated in the offset shape from features of small dimensions on shape s, however this method has not been completely implemented and therefore is not recommended for use; - selfinter tells the algorithm whether a computation to eliminate self-intersections needs to be applied to the resulting shape. however, as this functionality is not yet implemented, you should use the default value (false); - join defines how to fill the holes that may appear between parallels to the two adjacent faces. it may take values geomabs_arc or geomabs_intersection: - if join is equal to geomabs_arc, then pipes are generated between two free edges of two adjacent parallels, and spheres are generated on 'images' of vertices; it is the default value, - if join is equal to geomabs_intersection, then the parallels to the two adjacent faces are enlarged and intersected, so that there are no free edges on parallels to faces. removeintedges flag defines whether to remove the internal edges from the result or not. warnings since the algorithm of makethicksolid is based on makeoffsetshape algorithm, the warnings are the same as for makeoffsetshape.

Parameters
----------
S: TopoDS_Shape
ClosingFaces: TopTools_ListOfShape
Offset: float
Tol: float
Mode: BRepOffset_Mode,optional
	default value is BRepOffset_Skin
Intersection: bool,optional
	default value is Standard_False
SelfInter: bool,optional
	default value is Standard_False
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
RemoveIntEdges: bool,optional
	default value is Standard_False

Returns
-------
None
") MakeThickSolidByJoin;
		void MakeThickSolidByJoin(const TopoDS_Shape & S, const TopTools_ListOfShape & ClosingFaces, const Standard_Real Offset, const Standard_Real Tol, const BRepOffset_Mode Mode = BRepOffset_Skin, const Standard_Boolean Intersection = Standard_False, const Standard_Boolean SelfInter = Standard_False, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean RemoveIntEdges = Standard_False);

		/****************** MakeThickSolidBySimple ******************/
		/**** md5 signature: 61ce1557142588e14d9829f511172d15 ****/
		%feature("compactdefaultargs") MakeThickSolidBySimple;
		%feature("autodoc", "Constructs solid using simple algorithm. according to its nature it is not possible to set list of the closing faces. this algorithm does not support faces removing. it is caused by fact that intersections are not computed during offset creation. non-closed shell or face is expected as input.

Parameters
----------
theS: TopoDS_Shape
theOffsetValue: float

Returns
-------
None
") MakeThickSolidBySimple;
		void MakeThickSolidBySimple(const TopoDS_Shape & theS, const Standard_Real theOffsetValue);

		/****************** Modified ******************/
		/**** md5 signature: 73ccfe97b4ed94547a190332224ffe23 ****/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
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
