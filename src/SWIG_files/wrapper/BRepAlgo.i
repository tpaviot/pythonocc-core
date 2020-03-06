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
%define BREPALGODOCSTRING
"BRepAlgo module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepalgo.html"
%enddef
%module (package="OCC.Core", docstring=BREPALGODOCSTRING) BRepAlgo


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
#include<BRepAlgo_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<GeomAbs_module.hxx>
#include<TopTools_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<TopOpeBRepBuild_module.hxx>
#include<TopAbs_module.hxx>
#include<Adaptor3d_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<TopExp_module.hxx>
#include<TopLoc_module.hxx>
#include<IntSurf_module.hxx>
#include<BRep_module.hxx>
#include<TopOpeBRepDS_module.hxx>
#include<Bnd_module.hxx>
#include<Message_module.hxx>
#include<TShort_module.hxx>
#include<Intf_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<Poly_module.hxx>
#include<Extrema_module.hxx>
#include<BRepTools_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import GeomAbs.i
%import TopTools.i
%import BRepBuilderAPI.i
%import TopOpeBRepBuild.i
%import TopAbs.i
%import Adaptor3d.i
%import gp.i
%import Geom.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
enum BRepAlgo_CheckStatus {
	BRepAlgo_OK = 0,
	BRepAlgo_NOK = 1,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class BRepAlgo_CheckStatus:
	BRepAlgo_OK = 0
	BRepAlgo_NOK = 1
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BRepAlgo_AsDes)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*****************
* class BRepAlgo *
*****************/
%rename(brepalgo) BRepAlgo;
class BRepAlgo {
	public:
		/****************** ConcatenateWire ******************/
		%feature("compactdefaultargs") ConcatenateWire;
		%feature("autodoc", "This method makes a wire whose edges are c1 from a wire whose edges could be g1. it removes a vertex between g1 edges. option can be g1 or c1.

Parameters
----------
Wire: TopoDS_Wire
Option: GeomAbs_Shape
AngularTolerance: float,optional
	default value is 1.0e-4

Returns
-------
TopoDS_Wire
") ConcatenateWire;
		static TopoDS_Wire ConcatenateWire(const TopoDS_Wire & Wire, const GeomAbs_Shape Option, const Standard_Real AngularTolerance = 1.0e-4);

		/****************** ConcatenateWireC0 ******************/
		%feature("compactdefaultargs") ConcatenateWireC0;
		%feature("autodoc", "This method makes an edge from a wire. junction points between edges of wire may be sharp, resulting curve of the resulting edge may be c0.

Parameters
----------
Wire: TopoDS_Wire

Returns
-------
TopoDS_Edge
") ConcatenateWireC0;
		static TopoDS_Edge ConcatenateWireC0(const TopoDS_Wire & Wire);

		/****************** IsTopologicallyValid ******************/
		%feature("compactdefaultargs") IsTopologicallyValid;
		%feature("autodoc", "Checks if the shape is 'correct'. if not, returns <standard_false>, else returns <standard_true>. this method differs from the previous one in the fact that no geometric contols (intersection of wires, pcurve validity) are performed.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsTopologicallyValid;
		static Standard_Boolean IsTopologicallyValid(const TopoDS_Shape & S);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Checks if the shape is 'correct'. if not, returns <standard_false>, else returns <standard_true>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsValid;
		static Standard_Boolean IsValid(const TopoDS_Shape & S);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Checks if the generated and modified faces from the shapes <arguments> in the shape <result> are 'correct'. the args may be empty, then all faces will be checked. if <closed> is true, only closed shape are valid. if <geomctrl> is false the geometry of new vertices and edges are not verified and the auto-intersection of new wires are not searched.

Parameters
----------
theArgs: TopTools_ListOfShape
theResult: TopoDS_Shape
closedSolid: bool,optional
	default value is Standard_False
GeomCtrl: bool,optional
	default value is Standard_True

Returns
-------
bool
") IsValid;
		static Standard_Boolean IsValid(const TopTools_ListOfShape & theArgs, const TopoDS_Shape & theResult, const Standard_Boolean closedSolid = Standard_False, const Standard_Boolean GeomCtrl = Standard_True);

};


%extend BRepAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepAlgo_AsDes *
***********************/
class BRepAlgo_AsDes : public Standard_Transient {
	public:
		/****************** BRepAlgo_AsDes ******************/
		%feature("compactdefaultargs") BRepAlgo_AsDes;
		%feature("autodoc", "Creates an empty asdes.

Returns
-------
None
") BRepAlgo_AsDes;
		 BRepAlgo_AsDes();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Stores <ss> as a futur subshape of <s>.

Parameters
----------
S: TopoDS_Shape
SS: TopoDS_Shape

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & S, const TopoDS_Shape & SS);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Stores <ss> as futurs subshapes of <s>.

Parameters
----------
S: TopoDS_Shape
SS: TopTools_ListOfShape

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & S, const TopTools_ListOfShape & SS);

		/****************** Ascendant ******************/
		%feature("compactdefaultargs") Ascendant;
		%feature("autodoc", "Returns the shape containing <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Ascendant;
		const TopTools_ListOfShape & Ascendant(const TopoDS_Shape & S);

		/****************** ChangeDescendant ******************/
		%feature("compactdefaultargs") ChangeDescendant;
		%feature("autodoc", "Returns futur subhapes of <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") ChangeDescendant;
		TopTools_ListOfShape & ChangeDescendant(const TopoDS_Shape & S);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Descendant ******************/
		%feature("compactdefaultargs") Descendant;
		%feature("autodoc", "Returns futur subhapes of <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Descendant;
		const TopTools_ListOfShape & Descendant(const TopoDS_Shape & S);

		/****************** HasAscendant ******************/
		%feature("compactdefaultargs") HasAscendant;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") HasAscendant;
		Standard_Boolean HasAscendant(const TopoDS_Shape & S);

		/****************** HasCommonDescendant ******************/
		%feature("compactdefaultargs") HasCommonDescendant;
		%feature("autodoc", "Returns true if (s1> and <s2> has common descendants. stores in <lc> the commons descendants.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
LC: TopTools_ListOfShape

Returns
-------
bool
") HasCommonDescendant;
		Standard_Boolean HasCommonDescendant(const TopoDS_Shape & S1, const TopoDS_Shape & S2, TopTools_ListOfShape & LC);

		/****************** HasDescendant ******************/
		%feature("compactdefaultargs") HasDescendant;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") HasDescendant;
		Standard_Boolean HasDescendant(const TopoDS_Shape & S);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove <s> from me.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Remove;
		void Remove(const TopoDS_Shape & S);

		/****************** Replace ******************/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replace <olds> by <news>. <olds> disapear from <self>.

Parameters
----------
OldS: TopoDS_Shape
NewS: TopoDS_Shape

Returns
-------
None
") Replace;
		void Replace(const TopoDS_Shape & OldS, const TopoDS_Shape & NewS);

};


%make_alias(BRepAlgo_AsDes)

%extend BRepAlgo_AsDes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepAlgo_BooleanOperation *
**********************************/
%nodefaultctor BRepAlgo_BooleanOperation;
class BRepAlgo_BooleanOperation : public BRepBuilderAPI_MakeShape {
	public:
		/****************** Builder ******************/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepBuild_HBuilder>
") Builder;
		opencascade::handle<TopOpeBRepBuild_HBuilder> Builder();

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****************** Modified ******************/
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

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
St1: TopAbs_State
St2: TopAbs_State

Returns
-------
None
") Perform;
		void Perform(const TopAbs_State St1, const TopAbs_State St2);

		/****************** PerformDS ******************/
		%feature("compactdefaultargs") PerformDS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") PerformDS;
		void PerformDS();

		/****************** Shape1 ******************/
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", "Returns the first shape involved in this boolean operation.

Returns
-------
TopoDS_Shape
") Shape1;
		const TopoDS_Shape Shape1();

		/****************** Shape2 ******************/
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", "Returns the second shape involved in this boolean operation.

Returns
-------
TopoDS_Shape
") Shape2;
		const TopoDS_Shape Shape2();

};


%extend BRepAlgo_BooleanOperation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepAlgo_FaceRestrictor *
********************************/
class BRepAlgo_FaceRestrictor {
	public:
		/****************** BRepAlgo_FaceRestrictor ******************/
		%feature("compactdefaultargs") BRepAlgo_FaceRestrictor;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepAlgo_FaceRestrictor;
		 BRepAlgo_FaceRestrictor();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add the wire <w> to the set of wires. //! warning: the wires must be closed. //! the edges of <w> can be modified if they have not pcurves on the surface <s> of <f>. in this case if <proj> is false the first pcurve of the edge is positionned on <s>. if <proj> is true ,the pcurve on <s> is the projection of the curve 3d on <f>.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") Add;
		void Add(TopoDS_Wire & W);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all the wires.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Current;
		TopoDS_Face Current();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "The surface of <f> will be the the surface of each new faces built. <proj> is used to update pcurves on edges if necessary. see add().

Parameters
----------
F: TopoDS_Face
Proj: bool,optional
	default value is Standard_False
ControlOrientation: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & F, const Standard_Boolean Proj = Standard_False, const Standard_Boolean ControlOrientation = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Evaluate all the faces limited by the set of wires.

Returns
-------
None
") Perform;
		void Perform();

};


%extend BRepAlgo_FaceRestrictor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepAlgo_Image *
***********************/
class BRepAlgo_Image {
	public:
		/****************** BRepAlgo_Image ******************/
		%feature("compactdefaultargs") BRepAlgo_Image;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepAlgo_Image;
		 BRepAlgo_Image();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add <news> to the image of <olds>.

Parameters
----------
OldS: TopoDS_Shape
NewS: TopoDS_Shape

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & OldS, const TopoDS_Shape & NewS);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add <news> to the image of <olds>.

Parameters
----------
OldS: TopoDS_Shape
NewS: TopTools_ListOfShape

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & OldS, const TopTools_ListOfShape & NewS);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Links <news> as image of <olds>.

Parameters
----------
OldS: TopoDS_Shape
NewS: TopoDS_Shape

Returns
-------
None
") Bind;
		void Bind(const TopoDS_Shape & OldS, const TopoDS_Shape & NewS);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Links <news> as image of <olds>.

Parameters
----------
OldS: TopoDS_Shape
NewS: TopTools_ListOfShape

Returns
-------
None
") Bind;
		void Bind(const TopoDS_Shape & OldS, const TopTools_ListOfShape & NewS);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Compact ******************/
		%feature("compactdefaultargs") Compact;
		%feature("autodoc", "Keeps only the link between roots and lastimage.

Returns
-------
None
") Compact;
		void Compact();

		/****************** Filter ******************/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "Deletes in the images the shape of type <shapetype> which are not in <s>. warning: compact() must be call before.

Parameters
----------
S: TopoDS_Shape
ShapeType: TopAbs_ShapeEnum

Returns
-------
None
") Filter;
		void Filter(const TopoDS_Shape & S, const TopAbs_ShapeEnum ShapeType);

		/****************** HasImage ******************/
		%feature("compactdefaultargs") HasImage;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") HasImage;
		Standard_Boolean HasImage(const TopoDS_Shape & S);

		/****************** Image ******************/
		%feature("compactdefaultargs") Image;
		%feature("autodoc", "Returns the image of <s>. returns <s> in the list if hasimage(s) is false.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Image;
		const TopTools_ListOfShape & Image(const TopoDS_Shape & S);

		/****************** ImageFrom ******************/
		%feature("compactdefaultargs") ImageFrom;
		%feature("autodoc", "Returns the generator of <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") ImageFrom;
		const TopoDS_Shape ImageFrom(const TopoDS_Shape & S);

		/****************** IsImage ******************/
		%feature("compactdefaultargs") IsImage;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsImage;
		Standard_Boolean IsImage(const TopoDS_Shape & S);

		/****************** LastImage ******************/
		%feature("compactdefaultargs") LastImage;
		%feature("autodoc", "Stores in <l> the images of images of...images of <s>. <l> contains only <s> if hasimage(s) is false.

Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Returns
-------
None
") LastImage;
		void LastImage(const TopoDS_Shape & S, TopTools_ListOfShape & L);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove <s> to set of images.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Remove;
		void Remove(const TopoDS_Shape & S);

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the upper generator of <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Root;
		const TopoDS_Shape Root(const TopoDS_Shape & S);

		/****************** Roots ******************/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") Roots;
		const TopTools_ListOfShape & Roots();

		/****************** SetRoot ******************/
		%feature("compactdefaultargs") SetRoot;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") SetRoot;
		void SetRoot(const TopoDS_Shape & S);

};


%extend BRepAlgo_Image {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class BRepAlgo_Loop *
**********************/
class BRepAlgo_Loop {
	public:
		/****************** BRepAlgo_Loop ******************/
		%feature("compactdefaultargs") BRepAlgo_Loop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepAlgo_Loop;
		 BRepAlgo_Loop();

		/****************** AddConstEdge ******************/
		%feature("compactdefaultargs") AddConstEdge;
		%feature("autodoc", "Add <e> as const edge, e can be in the result.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") AddConstEdge;
		void AddConstEdge(const TopoDS_Edge & E);

		/****************** AddConstEdges ******************/
		%feature("compactdefaultargs") AddConstEdges;
		%feature("autodoc", "Add <le> as a set of const edges.

Parameters
----------
LE: TopTools_ListOfShape

Returns
-------
None
") AddConstEdges;
		void AddConstEdges(const TopTools_ListOfShape & LE);

		/****************** AddEdge ******************/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "Add e with <lv>. <e> will be copied and trim by vertices in <lv>.

Parameters
----------
E: TopoDS_Edge
LV: TopTools_ListOfShape

Returns
-------
None
") AddEdge;
		void AddEdge(TopoDS_Edge & E, const TopTools_ListOfShape & LV);

		/****************** CutEdge ******************/
		%feature("compactdefaultargs") CutEdge;
		%feature("autodoc", "Cut the edge <e> in several edges <ne> on the vertices<vone>.

Parameters
----------
E: TopoDS_Edge
VonE: TopTools_ListOfShape
NE: TopTools_ListOfShape

Returns
-------
None
") CutEdge;
		void CutEdge(const TopoDS_Edge & E, const TopTools_ListOfShape & VonE, TopTools_ListOfShape & NE);

		/****************** GetVerticesForSubstitute ******************/
		%feature("compactdefaultargs") GetVerticesForSubstitute;
		%feature("autodoc", "Returns the datamap of vertices with their substitutes.

Parameters
----------
VerVerMap: TopTools_DataMapOfShapeShape

Returns
-------
None
") GetVerticesForSubstitute;
		void GetVerticesForSubstitute(TopTools_DataMapOfShapeShape & VerVerMap);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init with <f> the set of edges must have pcurves on <f>.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & F);

		/****************** NewEdges ******************/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "Returns the list of new edges built from an edge <e> it can be an empty list.

Parameters
----------
E: TopoDS_Edge

Returns
-------
TopTools_ListOfShape
") NewEdges;
		const TopTools_ListOfShape & NewEdges(const TopoDS_Edge & E);

		/****************** NewFaces ******************/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "Returns the list of faces. warning: the method <wirestofaces> as to be called before. can be an empty list.

Returns
-------
TopTools_ListOfShape
") NewFaces;
		const TopTools_ListOfShape & NewFaces();

		/****************** NewWires ******************/
		%feature("compactdefaultargs") NewWires;
		%feature("autodoc", "Returns the list of wires performed. can be an empty list.

Returns
-------
TopTools_ListOfShape
") NewWires;
		const TopTools_ListOfShape & NewWires();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Make loops.

Returns
-------
None
") Perform;
		void Perform();

		/****************** VerticesForSubstitute ******************/
		%feature("compactdefaultargs") VerticesForSubstitute;
		%feature("autodoc", "No available documentation.

Parameters
----------
VerVerMap: TopTools_DataMapOfShapeShape

Returns
-------
None
") VerticesForSubstitute;
		void VerticesForSubstitute(TopTools_DataMapOfShapeShape & VerVerMap);

		/****************** WiresToFaces ******************/
		%feature("compactdefaultargs") WiresToFaces;
		%feature("autodoc", "Build faces from the wires result.

Returns
-------
None
") WiresToFaces;
		void WiresToFaces();

};


%extend BRepAlgo_Loop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepAlgo_NormalProjection *
**********************************/
class BRepAlgo_NormalProjection {
	public:
		/****************** BRepAlgo_NormalProjection ******************/
		%feature("compactdefaultargs") BRepAlgo_NormalProjection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepAlgo_NormalProjection;
		 BRepAlgo_NormalProjection();

		/****************** BRepAlgo_NormalProjection ******************/
		%feature("compactdefaultargs") BRepAlgo_NormalProjection;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") BRepAlgo_NormalProjection;
		 BRepAlgo_NormalProjection(const TopoDS_Shape & S);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add an edge or a wire to the list of shape to project.

Parameters
----------
ToProj: TopoDS_Shape

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & ToProj);

		/****************** Ancestor ******************/
		%feature("compactdefaultargs") Ancestor;
		%feature("autodoc", "For a resulting edge, returns the corresponding initial edge.

Parameters
----------
E: TopoDS_Edge

Returns
-------
TopoDS_Shape
") Ancestor;
		const TopoDS_Shape Ancestor(const TopoDS_Edge & E);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the result as a compound.

Returns
-------
None
") Build;
		void Build();

		/****************** BuildWire ******************/
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
		%feature("compactdefaultargs") Compute3d;
		%feature("autodoc", "If with3d = standard_false the 3dcurve is not computed the initial 3dcurve is kept to build the resulting edges.

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
		%feature("compactdefaultargs") Couple;
		%feature("autodoc", "For a projected edge, returns the corresponding initial face.

Parameters
----------
E: TopoDS_Edge

Returns
-------
TopoDS_Shape
") Couple;
		const TopoDS_Shape Couple(const TopoDS_Edge & E);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsElementary ******************/
		%feature("compactdefaultargs") IsElementary;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
bool
") IsElementary;
		Standard_Boolean IsElementary(const Adaptor3d_Curve & C);

		/****************** Projection ******************/
		%feature("compactdefaultargs") Projection;
		%feature("autodoc", "Returns the result.

Returns
-------
TopoDS_Shape
") Projection;
		const TopoDS_Shape Projection();

		/****************** SetDefaultParams ******************/
		%feature("compactdefaultargs") SetDefaultParams;
		%feature("autodoc", "Set the parameters used for computation in their default values.

Returns
-------
None
") SetDefaultParams;
		void SetDefaultParams();

		/****************** SetLimit ******************/
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
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "Set the parameters used for computation tol3d is the requiered tolerance between the 3d projected curve and its 2d representation internalcontinuity is the order of constraints used for approximation. maxdeg and maxseg are the maximum degree and the maximum number of segment for bspline resulting of an approximation.

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


%extend BRepAlgo_NormalProjection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class BRepAlgo_Tool *
**********************/
class BRepAlgo_Tool {
	public:
		/****************** Deboucle3D ******************/
		%feature("compactdefaultargs") Deboucle3D;
		%feature("autodoc", "Remove the non valid part of an offsetshape 1 - remove all the free boundary and the faces connex to such edges. 2 - remove all the shapes not valid in the result (according to the side of offseting) in this verion only the first point is implemented.

Parameters
----------
S: TopoDS_Shape
Boundary: TopTools_MapOfShape

Returns
-------
TopoDS_Shape
") Deboucle3D;
		static TopoDS_Shape Deboucle3D(const TopoDS_Shape & S, const TopTools_MapOfShape & Boundary);

};


%extend BRepAlgo_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepAlgo_Common *
************************/
class BRepAlgo_Common : public BRepAlgo_BooleanOperation {
	public:
		/****************** BRepAlgo_Common ******************/
		%feature("compactdefaultargs") BRepAlgo_Common;
		%feature("autodoc", "Constructs the common part of shapes s1 and s2.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") BRepAlgo_Common;
		 BRepAlgo_Common(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

};


%extend BRepAlgo_Common {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class BRepAlgo_Cut *
*********************/
class BRepAlgo_Cut : public BRepAlgo_BooleanOperation {
	public:
		/****************** BRepAlgo_Cut ******************/
		%feature("compactdefaultargs") BRepAlgo_Cut;
		%feature("autodoc", "Cuts the shape s2 from the shape s1.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") BRepAlgo_Cut;
		 BRepAlgo_Cut(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

};


%extend BRepAlgo_Cut {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class BRepAlgo_Fuse *
**********************/
class BRepAlgo_Fuse : public BRepAlgo_BooleanOperation {
	public:
		/****************** BRepAlgo_Fuse ******************/
		%feature("compactdefaultargs") BRepAlgo_Fuse;
		%feature("autodoc", "Fuse s1 and s2.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") BRepAlgo_Fuse;
		 BRepAlgo_Fuse(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

};


%extend BRepAlgo_Fuse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepAlgo_Section *
*************************/
class BRepAlgo_Section : public BRepAlgo_BooleanOperation {
	public:
		/****************** BRepAlgo_Section ******************/
		%feature("compactdefaultargs") BRepAlgo_Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sh1: TopoDS_Shape
Sh2: TopoDS_Shape
PerformNow: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgo_Section;
		 BRepAlgo_Section(const TopoDS_Shape & Sh1, const TopoDS_Shape & Sh2, const Standard_Boolean PerformNow = Standard_True);

		/****************** BRepAlgo_Section ******************/
		%feature("compactdefaultargs") BRepAlgo_Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sh: TopoDS_Shape
Pl: gp_Pln
PerformNow: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgo_Section;
		 BRepAlgo_Section(const TopoDS_Shape & Sh, const gp_Pln & Pl, const Standard_Boolean PerformNow = Standard_True);

		/****************** BRepAlgo_Section ******************/
		%feature("compactdefaultargs") BRepAlgo_Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sh: TopoDS_Shape
Sf: Geom_Surface
PerformNow: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgo_Section;
		 BRepAlgo_Section(const TopoDS_Shape & Sh, const opencascade::handle<Geom_Surface> & Sf, const Standard_Boolean PerformNow = Standard_True);

		/****************** BRepAlgo_Section ******************/
		%feature("compactdefaultargs") BRepAlgo_Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sf: Geom_Surface
Sh: TopoDS_Shape
PerformNow: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgo_Section;
		 BRepAlgo_Section(const opencascade::handle<Geom_Surface> & Sf, const TopoDS_Shape & Sh, const Standard_Boolean PerformNow = Standard_True);

		/****************** BRepAlgo_Section ******************/
		%feature("compactdefaultargs") BRepAlgo_Section;
		%feature("autodoc", "This and the above algorithms construct a framework for computing the section lines of - the two shapes sh1 and sh2, or - the shape sh and the plane pl, or - the shape sh and the surface sf, or - the surface sf and the shape sh, or - the two surfaces sf1 and sf2, and builds the result if performnow equals true, its default value. if performnow equals false, the intersection will be computed later by the function build. the constructed shape will be returned by the function shape. this is a compound object composed of edges. these intersection edges may be built: - on new intersection lines, or - on coincident portions of edges in the two intersected shapes. these intersection edges are independent: they are not chained or grouped in wires. if no intersection edge exists, the result is an empty compound object. note that other objects than topods_shape shapes involved in these syntaxes are converted into faces or shells before performing the computation of the intersection. a shape resulting from this conversion can be retrieved with the function shape1 or shape2. parametric 2d curves on intersection edges no parametric 2d curve (pcurve) is defined for each elementary edge of the result. to attach such parametric curves to the constructed edges you may use a constructor with the performnow flag equal to false; then you use: - the function computepcurveon1 to ask for the additional computation of a pcurve in the parametric space of the first shape, - the function computepcurveon2 to ask for the additional computation of a pcurve in the parametric space of the second shape, - in the end, the function build to construct the result. note that as a result, pcurves will only be added on edges built on new intersection lines. approximation of intersection edges the underlying 3d geometry attached to each elementary edge of the result is: - analytic where possible, provided the corresponding geometry corresponds to a type of analytic curve defined in the geom package; for example, the intersection of a cylindrical shape with a plane gives an ellipse or a circle; - or elsewhere, given as a succession of points grouped together in a bspline curve of degree 1. if you prefer to have an attached 3d geometry which is a bspline approximation of the computed set of points on computed elementary intersection edges whose underlying geometry is not analytic, you may use a constructor with the performnow flag equal to false. then you use: - the function approximation to ask for this computation option, and - the function build to construct the result. note that as a result, approximations will only be computed on edges built on new intersection lines. example you may also combine these computation options. in the following example: - each elementary edge of the computed intersection, built on a new intersection line, which does not correspond to an analytic geom curve, will be approximated by a bspline curve whose degree is not greater than 8. - each elementary edge built on a new intersection line, will have: - a pcurve in the parametric space of the shape s1, - no pcurve in the parametric space of the shape s2. // topods_shape s1 = ... , s2 = ... ; standard_boolean performnow = standard_false; brepalgo_section s ( s1, s2, performnow ); s.computepcurveon1 (standard_true); s.approximation (standard_true); s.build(); topods_shape r = s.shape();.

Parameters
----------
Sf1: Geom_Surface
Sf2: Geom_Surface
PerformNow: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAlgo_Section;
		 BRepAlgo_Section(const opencascade::handle<Geom_Surface> & Sf1, const opencascade::handle<Geom_Surface> & Sf2, const Standard_Boolean PerformNow = Standard_True);

		/****************** Approximation ******************/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "Defines an option for computation of further intersections. this computation will be performed by the function build in this framework. by default, the underlying 3d geometry attached to each elementary edge of the result of a computed intersection is: - analytic where possible, provided the corresponding geometry corresponds to a type of analytic curve defined in the geom package; for example the intersection of a cylindrical shape with a plane gives an ellipse or a circle; - or elsewhere, given as a succession of points grouped together in a bspline curve of degree 1. if approx equals true, when further computations are performed in this framework with the function build, these edges will have an attached 3d geometry which is a bspline approximation of the computed set of points. note that as a result, approximations will be computed on edges built only on new intersection lines.

Parameters
----------
B: bool

Returns
-------
None
") Approximation;
		void Approximation(const Standard_Boolean B);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Performs the computation of the section lines between the two parts defined at the time of construction of this framework or reinitialized with the init1 and init2 functions. the constructed shape will be returned by the function shape. this is a compound object composed of edges. these intersection edges may be built: - on new intersection lines, or - on coincident portions of edges in the two intersected shapes. these intersection edges are independent: they are not chained or grouped into wires. if no intersection edge exists, the result is an empty compound object. the shapes involved in the construction of the section lines can be retrieved with the function shape1 or shape2. note that other objects than topods_shape shapes given as arguments at the construction time of this framework, or to the init1 or init2 function, are converted into faces or shells before performing the computation of the intersection. parametric 2d curves on intersection edges no parametric 2d curve (pcurve) is defined for the elementary edges of the result. to attach parametric curves like this to the constructed edges you have to use: - the function computepcurveon1 to ask for the additional computation of a pcurve in the parametric space of the first shape, - the function computepcurveon2 to ask for the additional computation of a pcurve in the parametric space of the second shape. this must be done before calling this function. note that as a result, pcurves are added on edges built on new intersection lines only. approximation of intersection edges the underlying 3d geometry attached to each elementary edge of the result is: - analytic where possible provided the corresponding geometry corresponds to a type of analytic curve defined in the geom package; for example, the intersection of a cylindrical shape with a plane gives an ellipse or a circle; or - elsewhere, given as a succession of points grouped together in a bspline curve of degree 1. if, on computed elementary intersection edges whose underlying geometry is not analytic, you prefer to have an attached 3d geometry which is a bspline approximation of the computed set of points, you have to use the function approximation to ask for this computation option before calling this function. you may also have combined these computation options: look at the example given above to illustrate the use of the constructors.

Returns
-------
None
") Build;
		void Build();

		/****************** ComputePCurveOn1 ******************/
		%feature("compactdefaultargs") ComputePCurveOn1;
		%feature("autodoc", "Indicates if the pcurve must be (or not) performed on first part.

Parameters
----------
B: bool

Returns
-------
None
") ComputePCurveOn1;
		void ComputePCurveOn1(const Standard_Boolean B);

		/****************** ComputePCurveOn2 ******************/
		%feature("compactdefaultargs") ComputePCurveOn2;
		%feature("autodoc", "Define options for the computation of further intersections which will be performed by the function build in this framework. by default, no parametric 2d curve (pcurve) is defined for the elementary edges of the result. if computepcurve1 equals true, further computations performed in this framework with the function build will attach an additional pcurve in the parametric space of the first shape to the constructed edges. if computepcurve2 equals true, the additional pcurve will be attached to the constructed edges in the parametric space of the second shape. these two functions may be used together. note that as a result, pcurves will only be added onto edges built on new intersection lines.

Parameters
----------
B: bool

Returns
-------
None
") ComputePCurveOn2;
		void ComputePCurveOn2(const Standard_Boolean B);

		/****************** HasAncestorFaceOn1 ******************/
		%feature("compactdefaultargs") HasAncestorFaceOn1;
		%feature("autodoc", "Identifies the ancestor faces of the new intersection edge e resulting from the last computation performed in this framework, that is, the faces of the two original shapes on which the edge e lies: - hasancestorfaceon1 gives the ancestor face in the first shape, and these functions return: - true if an ancestor face f is found, or - false if not. an ancestor face is identifiable for the edge e if the three following conditions are satisfied: - the first part on which this algorithm performed its last computation is a shape, that is, it was not given as a surface or a plane at the time of construction of this algorithm or at a later time by the init1 function, - e is one of the elementary edges built by the last computation of this section algorithm, - the edge e is built on an intersection curve. in other words, e is a new edge built on the intersection curve, not on edges belonging to the intersecting shapes. to use these functions properly, you have to test the returned boolean value before using the ancestor face: f is significant only if the returned boolean value equals true.

Parameters
----------
E: TopoDS_Shape
F: TopoDS_Shape

Returns
-------
bool
") HasAncestorFaceOn1;
		Standard_Boolean HasAncestorFaceOn1(const TopoDS_Shape & E, TopoDS_Shape & F);

		/****************** HasAncestorFaceOn2 ******************/
		%feature("compactdefaultargs") HasAncestorFaceOn2;
		%feature("autodoc", "Identifies the ancestor faces of the new intersection edge e resulting from the last computation performed in this framework, that is, the faces of the two original shapes on which the edge e lies: - hasancestorfaceon2 gives the ancestor face in the second shape. these functions return: - true if an ancestor face f is found, or - false if not. an ancestor face is identifiable for the edge e if the three following conditions are satisfied: - the first part on which this algorithm performed its last computation is a shape, that is, it was not given as a surface or a plane at the time of construction of this algorithm or at a later time by the init1 function, - e is one of the elementary edges built by the last computation of this section algorithm, - the edge e is built on an intersection curve. in other words, e is a new edge built on the intersection curve, not on edges belonging to the intersecting shapes. to use these functions properly, you have to test the returned boolean value before using the ancestor face: f is significant only if the returned boolean value equals true.

Parameters
----------
E: TopoDS_Shape
F: TopoDS_Shape

Returns
-------
bool
") HasAncestorFaceOn2;
		Standard_Boolean HasAncestorFaceOn2(const TopoDS_Shape & E, TopoDS_Shape & F);

		/****************** Init1 ******************/
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "Initializes the first part.

Parameters
----------
S1: TopoDS_Shape

Returns
-------
None
") Init1;
		void Init1(const TopoDS_Shape & S1);

		/****************** Init1 ******************/
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "Initializes the first part.

Parameters
----------
Pl: gp_Pln

Returns
-------
None
") Init1;
		void Init1(const gp_Pln & Pl);

		/****************** Init1 ******************/
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "Initializes the first part.

Parameters
----------
Sf: Geom_Surface

Returns
-------
None
") Init1;
		void Init1(const opencascade::handle<Geom_Surface> & Sf);

		/****************** Init2 ******************/
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "Initialize second part.

Parameters
----------
S2: TopoDS_Shape

Returns
-------
None
") Init2;
		void Init2(const TopoDS_Shape & S2);

		/****************** Init2 ******************/
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "Initializes the second part.

Parameters
----------
Pl: gp_Pln

Returns
-------
None
") Init2;
		void Init2(const gp_Pln & Pl);

		/****************** Init2 ******************/
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "This and the above algorithms reinitialize the first and the second parts on which this algorithm is going to perform the intersection computation. this is done with either: the surface sf, the plane pl or the shape sh. you use the function build to construct the result.

Parameters
----------
Sf: Geom_Surface

Returns
-------
None
") Init2;
		void Init2(const opencascade::handle<Geom_Surface> & Sf);

};


%extend BRepAlgo_Section {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
