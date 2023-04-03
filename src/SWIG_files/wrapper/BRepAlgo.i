/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_brepalgo.html"
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
%include ../common/EnumTemplates.i
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
#include<TopAbs_module.hxx>
#include<Adaptor3d_module.hxx>
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
#include<Geom_module.hxx>
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
%import TopAbs.i
%import Adaptor3d.i

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
		/**** md5 signature: 1a32b306b59aab7db7f1be46215b37ef ****/
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
		/**** md5 signature: 80cfe190357e01a0436f222bec60fa13 ****/
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

		/****************** ConvertFace ******************/
		/**** md5 signature: 4995d6c46f75b841a5ec1eeddfe269b6 ****/
		%feature("compactdefaultargs") ConvertFace;
		%feature("autodoc", "Method of face conversion. the api corresponds to the method convertwire. this is a shortcut for calling convertwire() for each wire in theface.

Parameters
----------
theFace: TopoDS_Face
theAngleTolerance: float

Returns
-------
TopoDS_Face
") ConvertFace;
		static TopoDS_Face ConvertFace(const TopoDS_Face & theFace, const Standard_Real theAngleTolerance);

		/****************** ConvertWire ******************/
		/**** md5 signature: 803ac9affea1e0a7a42b271f20e61001 ****/
		%feature("compactdefaultargs") ConvertWire;
		%feature("autodoc", "Method of wire conversion, calls brepalgo_approx internally. @param thewire input wire object. @param theangletolerance angle (in radians) defining the continuity of the wire: if two vectors differ by less than this angle, the result will be smooth (zero angle of tangent lines between curve elements). returns the new topods_wire object consisting of edges each representing an arc of circle or a linear segment. the accuracy of conversion is defined as the maximal tolerance of edges in thewire.

Parameters
----------
theWire: TopoDS_Wire
theAngleTolerance: float
theFace: TopoDS_Face

Returns
-------
TopoDS_Wire
") ConvertWire;
		static TopoDS_Wire ConvertWire(const TopoDS_Wire & theWire, const Standard_Real theAngleTolerance, const TopoDS_Face & theFace);

		/****************** IsTopologicallyValid ******************/
		/**** md5 signature: 862e9687e6641e5b5520e1bc35a7dd50 ****/
		%feature("compactdefaultargs") IsTopologicallyValid;
		%feature("autodoc", "Checks if the shape is 'correct'. if not, returns false, else returns true. this method differs from the previous one in the fact that no geometric controls (intersection of wires, pcurve validity) are performed.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsTopologicallyValid;
		static Standard_Boolean IsTopologicallyValid(const TopoDS_Shape & S);

		/****************** IsValid ******************/
		/**** md5 signature: f6c51d6a17d819532ca2912c3fc6a304 ****/
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
		/**** md5 signature: a6a7c5ea6808afc2c6c282f452e359df ****/
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
		/**** md5 signature: c38ef1363f12544146fc23652e8830a6 ****/
		%feature("compactdefaultargs") BRepAlgo_AsDes;
		%feature("autodoc", "Creates an empty asdes.

Returns
-------
None
") BRepAlgo_AsDes;
		 BRepAlgo_AsDes();

		/****************** Add ******************/
		/**** md5 signature: 21aba0cbf9c8c8c11e064d9e2e6a5fc5 ****/
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
		/**** md5 signature: daedb93f45ca97af04bcfee2319db368 ****/
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
		/**** md5 signature: 0f9934446c2b983d1dfe0f2d9e5cbbab ****/
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
		/**** md5 signature: 4e3d115ec5f7066ca927facb2b62a0bd ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Descendant ******************/
		/**** md5 signature: d8b2fd69d6ffe678b09cae4efb7ca892 ****/
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
		/**** md5 signature: 0061ff91c4aff940f5e0352c160d969d ****/
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
		/**** md5 signature: 05dfab339e3899f1fa3e137bc970f96e ****/
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
		/**** md5 signature: 33b990046a91014730d870870286c8bc ****/
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
		/**** md5 signature: add61cba503919d35888054f3de3699f ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove thes from me.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
None
") Remove;
		void Remove(const TopoDS_Shape & theS);

		/****************** Replace ******************/
		/**** md5 signature: 7efbf7d2833396fcda557293d6dcc3ee ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replace theolds by thenews. theolds disappear from this.

Parameters
----------
theOldS: TopoDS_Shape
theNewS: TopoDS_Shape

Returns
-------
None
") Replace;
		void Replace(const TopoDS_Shape & theOldS, const TopoDS_Shape & theNewS);

};


%make_alias(BRepAlgo_AsDes)

%extend BRepAlgo_AsDes {
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
		/**** md5 signature: 82683998c51ff8824cac4f9f6d46eb4a ****/
		%feature("compactdefaultargs") BRepAlgo_FaceRestrictor;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepAlgo_FaceRestrictor;
		 BRepAlgo_FaceRestrictor();

		/****************** Add ******************/
		/**** md5 signature: a6ce79dcf272de14f2ac11be8579ec3c ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all the wires.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Current ******************/
		/**** md5 signature: 9fb8c8be97ea707acffa5681bd8041e7 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Current;
		TopoDS_Face Current();

		/****************** Init ******************/
		/**** md5 signature: 8a340284dcc52534c4ed6303f8706321 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "The surface of <f> will be the surface of each new faces built. <proj> is used to update pcurves on edges if necessary. see add().

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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
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
		/**** md5 signature: 565a5b0a190c69489d75a611c64badca ****/
		%feature("compactdefaultargs") BRepAlgo_Image;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepAlgo_Image;
		 BRepAlgo_Image();

		/****************** Add ******************/
		/**** md5 signature: b8225f975bf15fd818dbd9e49f0d729d ****/
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
		/**** md5 signature: 1f4f782b77630d9c71cd4cdce8e3437f ****/
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
		/**** md5 signature: 94395a7acc1c19970a6c18429f703cbd ****/
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
		/**** md5 signature: e46b9362344bef9a466680c15824c045 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Compact ******************/
		/**** md5 signature: 9a98bd4200c1c286e12857cb2eb1f23a ****/
		%feature("compactdefaultargs") Compact;
		%feature("autodoc", "Keeps only the link between roots and lastimage.

Returns
-------
None
") Compact;
		void Compact();

		/****************** Filter ******************/
		/**** md5 signature: e4937792550998c8721aa07df5c84e90 ****/
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
		/**** md5 signature: b3bc7608851b977522a41dfadb246e5f ****/
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
		/**** md5 signature: a0b14766d744925d80794ae4914acb1c ****/
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
		/**** md5 signature: 2290fb99e58edb77e8d51c7bee3ddaa5 ****/
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
		/**** md5 signature: 5d4abe9bfc888b8046977ea97f0d29c3 ****/
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
		/**** md5 signature: f49808c3101a3f0962d4a981cc2e0fa3 ****/
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
		/**** md5 signature: 05a88c75d9ea5ff51b2f8c0a39e09679 ****/
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

		/****************** RemoveRoot ******************/
		/**** md5 signature: 690c4fd21a18576f149a066c30568867 ****/
		%feature("compactdefaultargs") RemoveRoot;
		%feature("autodoc", "Removes the root <theroot> from the list of roots and up and down maps.

Parameters
----------
Root: TopoDS_Shape

Returns
-------
None
") RemoveRoot;
		void RemoveRoot(const TopoDS_Shape & Root);

		/****************** ReplaceRoot ******************/
		/**** md5 signature: 285b3a580e43af49c3fb24e085a66aef ****/
		%feature("compactdefaultargs") ReplaceRoot;
		%feature("autodoc", "Replaces the <oldroot> with the <newroot>, so all images of the <oldroot> become the images of the <newroot>. the <oldroot> is removed.

Parameters
----------
OldRoot: TopoDS_Shape
NewRoot: TopoDS_Shape

Returns
-------
None
") ReplaceRoot;
		void ReplaceRoot(const TopoDS_Shape & OldRoot, const TopoDS_Shape & NewRoot);

		/****************** Root ******************/
		/**** md5 signature: b928b7ce7a4d68875a739516be55eb7c ****/
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
		/**** md5 signature: 82f242faa3e008b8cefc3123c93c72c8 ****/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") Roots;
		const TopTools_ListOfShape & Roots();

		/****************** SetRoot ******************/
		/**** md5 signature: 81eb99d7d9d22432167b234cf063481a ****/
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
		/**** md5 signature: 25f06f5c44068f0a3075667be6a6a58b ****/
		%feature("compactdefaultargs") BRepAlgo_Loop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepAlgo_Loop;
		 BRepAlgo_Loop();

		/****************** AddConstEdge ******************/
		/**** md5 signature: c7f7273f1289f10b479203d0e90b817d ****/
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
		/**** md5 signature: bb5e3e5bda091bc51538ebc7c94a845d ****/
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
		/**** md5 signature: 1d4fc83e654194c8544ee17710aa8d90 ****/
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
		/**** md5 signature: c3ea87f98f6a4b2923c6235d7b903c58 ****/
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

		/****************** GetTolConf ******************/
		/**** md5 signature: 7e9f7b87eb3b20edee9e3a86157928cd ****/
		%feature("compactdefaultargs") GetTolConf;
		%feature("autodoc", "Get maximal tolerance used for comparing distaces between vertices. .

Returns
-------
float
") GetTolConf;
		Standard_Real GetTolConf();

		/****************** GetVerticesForSubstitute ******************/
		/**** md5 signature: 3b0ea732ecf076dde3f931f0997c07aa ****/
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
		/**** md5 signature: a8dfaa68079e743e08190fe58d950a9a ****/
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
		/**** md5 signature: ca2bf0bfae43c579574670d69e837949 ****/
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
		/**** md5 signature: 1760fdb1c9e5525f7aa9e149d10051e7 ****/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "Returns the list of faces. warning: the method <wirestofaces> as to be called before. can be an empty list.

Returns
-------
TopTools_ListOfShape
") NewFaces;
		const TopTools_ListOfShape & NewFaces();

		/****************** NewWires ******************/
		/**** md5 signature: e3fe3b335b8953ae48d1acc70c50f835 ****/
		%feature("compactdefaultargs") NewWires;
		%feature("autodoc", "Returns the list of wires performed. can be an empty list.

Returns
-------
TopTools_ListOfShape
") NewWires;
		const TopTools_ListOfShape & NewWires();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Make loops.

Returns
-------
None
") Perform;
		void Perform();

		/****************** SetImageVV ******************/
		/**** md5 signature: e4e1ed7e9cd079a003f1ab409e87973e ****/
		%feature("compactdefaultargs") SetImageVV;
		%feature("autodoc", "Sets the image vertex - vertex.

Parameters
----------
theImageVV: BRepAlgo_Image

Returns
-------
None
") SetImageVV;
		void SetImageVV(const BRepAlgo_Image & theImageVV);

		/****************** SetTolConf ******************/
		/**** md5 signature: 1c312d5c00a3d856c91eb31857ae32c6 ****/
		%feature("compactdefaultargs") SetTolConf;
		%feature("autodoc", "Set maximal tolerance used for comparing distaces between vertices. .

Parameters
----------
theTolConf: float

Returns
-------
None
") SetTolConf;
		void SetTolConf(const Standard_Real theTolConf);

		/****************** UpdateVEmap ******************/
		/**** md5 signature: 491681c63af221fbd7247e01d389bbc0 ****/
		%feature("compactdefaultargs") UpdateVEmap;
		%feature("autodoc", "Update ve map according to image vertex - vertex.

Parameters
----------
theVEmap: TopTools_IndexedDataMapOfShapeListOfShape

Returns
-------
None
") UpdateVEmap;
		void UpdateVEmap(TopTools_IndexedDataMapOfShapeListOfShape & theVEmap);

		/****************** VerticesForSubstitute ******************/
		/**** md5 signature: b26ff2366762048c84c096651ba2d80c ****/
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
		/**** md5 signature: ba4d21c35d79af050089e2828b0fc192 ****/
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
		/**** md5 signature: 9701a9046a8430d62899e04270a74739 ****/
		%feature("compactdefaultargs") BRepAlgo_NormalProjection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepAlgo_NormalProjection;
		 BRepAlgo_NormalProjection();

		/****************** BRepAlgo_NormalProjection ******************/
		/**** md5 signature: 420e8a2be230db44d7bc7c2631e1f8fe ****/
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
		/**** md5 signature: 819f71062dd96e4b529bccdf1bb50cf1 ****/
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
		/**** md5 signature: 551c6ce85c529cb60615765a58d47215 ****/
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
		/**** md5 signature: 634d88e5c99c5ce236c07b337243d591 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the result as a compound.

Returns
-------
None
") Build;
		void Build();

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
		/**** md5 signature: cbe6db4e25bf42b45544f6235fc33773 ****/
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
		/**** md5 signature: 20432e4d7ffc2a154be36ff0a467a19b ****/
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
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsElementary ******************/
		/**** md5 signature: 946351933089b0d0f29c01807aef61fe ****/
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
		/**** md5 signature: d96e6638e8d3c59fa6809c83eda77a82 ****/
		%feature("compactdefaultargs") Projection;
		%feature("autodoc", "Returns the result.

Returns
-------
TopoDS_Shape
") Projection;
		const TopoDS_Shape Projection();

		/****************** SetDefaultParams ******************/
		/**** md5 signature: 41db5be74abe064c4ef67334ff98774d ****/
		%feature("compactdefaultargs") SetDefaultParams;
		%feature("autodoc", "Set the parameters used for computation in their default values.

Returns
-------
None
") SetDefaultParams;
		void SetDefaultParams();

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
		%feature("autodoc", "Set the parameters used for computation tol3d is the required tolerance between the 3d projected curve and its 2d representation internalcontinuity is the order of constraints used for approximation. maxdeg and maxseg are the maximum degree and the maximum number of segment for bspline resulting of an approximation.

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

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
