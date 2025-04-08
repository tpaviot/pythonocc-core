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
%define BREPALGODOCSTRING
"BRepAlgo module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_brepalgo.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
		/****** BRepAlgo::ConcatenateWire ******/
		/****** md5 signature: 1a32b306b59aab7db7f1be46215b37ef ******/
		%feature("compactdefaultargs") ConcatenateWire;
		%feature("autodoc", "
Parameters
----------
Wire: TopoDS_Wire
Option: GeomAbs_Shape
AngularTolerance: float (optional, default to 1.0e-4)

Return
-------
TopoDS_Wire

Description
-----------
this method makes a wire whose edges are C1 from a Wire whose edges could be G1. It removes a vertex between G1 edges. Option can be G1 or C1.
") ConcatenateWire;
		static TopoDS_Wire ConcatenateWire(const TopoDS_Wire & Wire, const GeomAbs_Shape Option, const Standard_Real AngularTolerance = 1.0e-4);

		/****** BRepAlgo::ConcatenateWireC0 ******/
		/****** md5 signature: 80cfe190357e01a0436f222bec60fa13 ******/
		%feature("compactdefaultargs") ConcatenateWireC0;
		%feature("autodoc", "
Parameters
----------
Wire: TopoDS_Wire

Return
-------
TopoDS_Edge

Description
-----------
this method makes an edge from a wire. Junction points between edges of wire may be sharp, resulting curve of the resulting edge may be C0.
") ConcatenateWireC0;
		static TopoDS_Edge ConcatenateWireC0(const TopoDS_Wire & Wire);

		/****** BRepAlgo::ConvertFace ******/
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
Method of face conversion. The API corresponds to the method ConvertWire. This is a shortcut for calling ConvertWire() for each wire in theFace.
") ConvertFace;
		static TopoDS_Face ConvertFace(const TopoDS_Face & theFace, const Standard_Real theAngleTolerance);

		/****** BRepAlgo::ConvertWire ******/
		/****** md5 signature: 803ac9affea1e0a7a42b271f20e61001 ******/
		%feature("compactdefaultargs") ConvertWire;
		%feature("autodoc", "
Parameters
----------
theWire: TopoDS_Wire
theAngleTolerance: float
theFace: TopoDS_Face

Return
-------
TopoDS_Wire

Description
-----------
Method of wire conversion, calls BRepAlgo_Approx internally. 
Parameter theWire Input Wire object. 
Parameter theAngleTolerance Angle (in radians) defining the continuity of the wire: if two vectors differ by less than this angle, the result will be smooth (zero angle of tangent lines between curve elements). 
Return: The new TopoDS_Wire object consisting of edges each representing an arc of circle or a linear segment. The accuracy of conversion is defined as the maximal tolerance of edges in theWire.
") ConvertWire;
		static TopoDS_Wire ConvertWire(const TopoDS_Wire & theWire, const Standard_Real theAngleTolerance, const TopoDS_Face & theFace);

		/****** BRepAlgo::IsTopologicallyValid ******/
		/****** md5 signature: 862e9687e6641e5b5520e1bc35a7dd50 ******/
		%feature("compactdefaultargs") IsTopologicallyValid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Checks if the shape is 'correct'. If not, returns False, else returns True. This method differs from the previous one in the fact that no geometric controls (intersection of wires, pcurve validity) are performed.
") IsTopologicallyValid;
		static Standard_Boolean IsTopologicallyValid(const TopoDS_Shape & S);

		/****** BRepAlgo::IsValid ******/
		/****** md5 signature: f6c51d6a17d819532ca2912c3fc6a304 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Checks if the shape is 'correct'. If not, returns <Standard_False>, else returns <Standard_True>.
") IsValid;
		static Standard_Boolean IsValid(const TopoDS_Shape & S);

		/****** BRepAlgo::IsValid ******/
		/****** md5 signature: a6a7c5ea6808afc2c6c282f452e359df ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
theArgs: TopTools_ListOfShape
theResult: TopoDS_Shape
closedSolid: bool (optional, default to Standard_False)
GeomCtrl: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Checks if the Generated and Modified Faces from the shapes <arguments> in the shape <result> are 'correct'. The args may be empty, then all faces will be checked. If <Closed> is True, only closed shape are valid. If <GeomCtrl> is False the geometry of new vertices and edges are not verified and the auto-intersection of new wires are not searched.
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
		/****** BRepAlgo_AsDes::BRepAlgo_AsDes ******/
		/****** md5 signature: c38ef1363f12544146fc23652e8830a6 ******/
		%feature("compactdefaultargs") BRepAlgo_AsDes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty AsDes.
") BRepAlgo_AsDes;
		 BRepAlgo_AsDes();

		/****** BRepAlgo_AsDes::Add ******/
		/****** md5 signature: 21aba0cbf9c8c8c11e064d9e2e6a5fc5 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
SS: TopoDS_Shape

Return
-------
None

Description
-----------
Stores <SS> as a futur subshape of <S>.
") Add;
		void Add(const TopoDS_Shape & S, const TopoDS_Shape & SS);

		/****** BRepAlgo_AsDes::Add ******/
		/****** md5 signature: daedb93f45ca97af04bcfee2319db368 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
SS: TopTools_ListOfShape

Return
-------
None

Description
-----------
Stores <SS> as futurs SubShapes of <S>.
") Add;
		void Add(const TopoDS_Shape & S, const TopTools_ListOfShape & SS);

		/****** BRepAlgo_AsDes::Ascendant ******/
		/****** md5 signature: 0f9934446c2b983d1dfe0f2d9e5cbbab ******/
		%feature("compactdefaultargs") Ascendant;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the Shape containing <S>.
") Ascendant;
		const TopTools_ListOfShape & Ascendant(const TopoDS_Shape & S);

		/****** BRepAlgo_AsDes::ChangeDescendant ******/
		/****** md5 signature: 4e3d115ec5f7066ca927facb2b62a0bd ******/
		%feature("compactdefaultargs") ChangeDescendant;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns futur subhapes of <S>.
") ChangeDescendant;
		TopTools_ListOfShape & ChangeDescendant(const TopoDS_Shape & S);

		/****** BRepAlgo_AsDes::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** BRepAlgo_AsDes::Descendant ******/
		/****** md5 signature: d8b2fd69d6ffe678b09cae4efb7ca892 ******/
		%feature("compactdefaultargs") Descendant;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns futur subhapes of <S>.
") Descendant;
		const TopTools_ListOfShape & Descendant(const TopoDS_Shape & S);

		/****** BRepAlgo_AsDes::HasAscendant ******/
		/****** md5 signature: 0061ff91c4aff940f5e0352c160d969d ******/
		%feature("compactdefaultargs") HasAscendant;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") HasAscendant;
		Standard_Boolean HasAscendant(const TopoDS_Shape & S);

		/****** BRepAlgo_AsDes::HasCommonDescendant ******/
		/****** md5 signature: 05dfab339e3899f1fa3e137bc970f96e ******/
		%feature("compactdefaultargs") HasCommonDescendant;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
LC: TopTools_ListOfShape

Return
-------
bool

Description
-----------
Returns True if (S1> and <S2> has common Descendants. Stores in <LC> the Commons Descendants.
") HasCommonDescendant;
		Standard_Boolean HasCommonDescendant(const TopoDS_Shape & S1, const TopoDS_Shape & S2, TopTools_ListOfShape & LC);

		/****** BRepAlgo_AsDes::HasDescendant ******/
		/****** md5 signature: 33b990046a91014730d870870286c8bc ******/
		%feature("compactdefaultargs") HasDescendant;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") HasDescendant;
		Standard_Boolean HasDescendant(const TopoDS_Shape & S);

		/****** BRepAlgo_AsDes::Remove ******/
		/****** md5 signature: add61cba503919d35888054f3de3699f ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
None

Description
-----------
Remove theS from me.
") Remove;
		void Remove(const TopoDS_Shape & theS);

		/****** BRepAlgo_AsDes::Replace ******/
		/****** md5 signature: 7efbf7d2833396fcda557293d6dcc3ee ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
theOldS: TopoDS_Shape
theNewS: TopoDS_Shape

Return
-------
None

Description
-----------
Replace theOldS by theNewS. theOldS disappear from this.
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
		/****** BRepAlgo_FaceRestrictor::BRepAlgo_FaceRestrictor ******/
		/****** md5 signature: 82683998c51ff8824cac4f9f6d46eb4a ******/
		%feature("compactdefaultargs") BRepAlgo_FaceRestrictor;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepAlgo_FaceRestrictor;
		 BRepAlgo_FaceRestrictor();

		/****** BRepAlgo_FaceRestrictor::Add ******/
		/****** md5 signature: a6ce79dcf272de14f2ac11be8579ec3c ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
Add the wire <W> to the set of wires. //! Warning: The Wires must be closed. //! The edges of <W> can be modified if they don't have pcurves on the surface <S> of <F>. In this case if <Proj> is false the first pcurve of the edge is positioned on <S>. if <Proj> is True, the Pcurve On <S> is the projection of the curve 3d on <F>.
") Add;
		void Add(TopoDS_Wire & W);

		/****** BRepAlgo_FaceRestrictor::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all the Wires.
") Clear;
		void Clear();

		/****** BRepAlgo_FaceRestrictor::Current ******/
		/****** md5 signature: 9fb8c8be97ea707acffa5681bd8041e7 ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Current;
		TopoDS_Face Current();

		/****** BRepAlgo_FaceRestrictor::Init ******/
		/****** md5 signature: 8a340284dcc52534c4ed6303f8706321 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Proj: bool (optional, default to Standard_False)
ControlOrientation: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
the surface of <F> will be the surface of each new faces built. <Proj> is used to update pcurves on edges if necessary. See Add().
") Init;
		void Init(const TopoDS_Face & F, const Standard_Boolean Proj = Standard_False, const Standard_Boolean ControlOrientation = Standard_False);

		/****** BRepAlgo_FaceRestrictor::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepAlgo_FaceRestrictor::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****** BRepAlgo_FaceRestrictor::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** BRepAlgo_FaceRestrictor::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Evaluate all the faces limited by the set of Wires.
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
		/****** BRepAlgo_Image::BRepAlgo_Image ******/
		/****** md5 signature: 565a5b0a190c69489d75a611c64badca ******/
		%feature("compactdefaultargs") BRepAlgo_Image;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepAlgo_Image;
		 BRepAlgo_Image();

		/****** BRepAlgo_Image::Add ******/
		/****** md5 signature: b8225f975bf15fd818dbd9e49f0d729d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
OldS: TopoDS_Shape
NewS: TopoDS_Shape

Return
-------
None

Description
-----------
Add <NewS> to the image of <OldS>.
") Add;
		void Add(const TopoDS_Shape & OldS, const TopoDS_Shape & NewS);

		/****** BRepAlgo_Image::Add ******/
		/****** md5 signature: 1f4f782b77630d9c71cd4cdce8e3437f ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
OldS: TopoDS_Shape
NewS: TopTools_ListOfShape

Return
-------
None

Description
-----------
Add <NewS> to the image of <OldS>.
") Add;
		void Add(const TopoDS_Shape & OldS, const TopTools_ListOfShape & NewS);

		/****** BRepAlgo_Image::Bind ******/
		/****** md5 signature: 94395a7acc1c19970a6c18429f703cbd ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
OldS: TopoDS_Shape
NewS: TopoDS_Shape

Return
-------
None

Description
-----------
Links <NewS> as image of <OldS>.
") Bind;
		void Bind(const TopoDS_Shape & OldS, const TopoDS_Shape & NewS);

		/****** BRepAlgo_Image::Bind ******/
		/****** md5 signature: e46b9362344bef9a466680c15824c045 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
OldS: TopoDS_Shape
NewS: TopTools_ListOfShape

Return
-------
None

Description
-----------
Links <NewS> as image of <OldS>.
") Bind;
		void Bind(const TopoDS_Shape & OldS, const TopTools_ListOfShape & NewS);

		/****** BRepAlgo_Image::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** BRepAlgo_Image::Compact ******/
		/****** md5 signature: 9a98bd4200c1c286e12857cb2eb1f23a ******/
		%feature("compactdefaultargs") Compact;
		%feature("autodoc", "Return
-------
None

Description
-----------
Keeps only the link between roots and lastimage.
") Compact;
		void Compact();

		/****** BRepAlgo_Image::Filter ******/
		/****** md5 signature: e4937792550998c8721aa07df5c84e90 ******/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
ShapeType: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
Deletes in the images the shape of type <ShapeType> which are not in <S>. Warning: Compact() must be call before.
") Filter;
		void Filter(const TopoDS_Shape & S, const TopAbs_ShapeEnum ShapeType);

		/****** BRepAlgo_Image::HasImage ******/
		/****** md5 signature: b3bc7608851b977522a41dfadb246e5f ******/
		%feature("compactdefaultargs") HasImage;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") HasImage;
		Standard_Boolean HasImage(const TopoDS_Shape & S);

		/****** BRepAlgo_Image::Image ******/
		/****** md5 signature: a0b14766d744925d80794ae4914acb1c ******/
		%feature("compactdefaultargs") Image;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the Image of <S>. Returns <S> in the list if HasImage(S) is false.
") Image;
		const TopTools_ListOfShape & Image(const TopoDS_Shape & S);

		/****** BRepAlgo_Image::ImageFrom ******/
		/****** md5 signature: 2290fb99e58edb77e8d51c7bee3ddaa5 ******/
		%feature("compactdefaultargs") ImageFrom;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the generator of <S>.
") ImageFrom;
		const TopoDS_Shape ImageFrom(const TopoDS_Shape & S);

		/****** BRepAlgo_Image::IsImage ******/
		/****** md5 signature: 5d4abe9bfc888b8046977ea97f0d29c3 ******/
		%feature("compactdefaultargs") IsImage;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") IsImage;
		Standard_Boolean IsImage(const TopoDS_Shape & S);

		/****** BRepAlgo_Image::LastImage ******/
		/****** md5 signature: f49808c3101a3f0962d4a981cc2e0fa3 ******/
		%feature("compactdefaultargs") LastImage;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
Stores in <L> the images of images of...images of <S>. <L> contains only <S> if HasImage(S) is false.
") LastImage;
		void LastImage(const TopoDS_Shape & S, TopTools_ListOfShape & L);

		/****** BRepAlgo_Image::Remove ******/
		/****** md5 signature: 05a88c75d9ea5ff51b2f8c0a39e09679 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Remove <S> to set of images.
") Remove;
		void Remove(const TopoDS_Shape & S);

		/****** BRepAlgo_Image::RemoveRoot ******/
		/****** md5 signature: 690c4fd21a18576f149a066c30568867 ******/
		%feature("compactdefaultargs") RemoveRoot;
		%feature("autodoc", "
Parameters
----------
Root: TopoDS_Shape

Return
-------
None

Description
-----------
Removes the root <theRoot> from the list of roots and up and down maps.
") RemoveRoot;
		void RemoveRoot(const TopoDS_Shape & Root);

		/****** BRepAlgo_Image::ReplaceRoot ******/
		/****** md5 signature: 285b3a580e43af49c3fb24e085a66aef ******/
		%feature("compactdefaultargs") ReplaceRoot;
		%feature("autodoc", "
Parameters
----------
OldRoot: TopoDS_Shape
NewRoot: TopoDS_Shape

Return
-------
None

Description
-----------
Replaces the <OldRoot> with the <NewRoot>, so all images of the <OldRoot> become the images of the <NewRoot>. The <OldRoot> is removed.
") ReplaceRoot;
		void ReplaceRoot(const TopoDS_Shape & OldRoot, const TopoDS_Shape & NewRoot);

		/****** BRepAlgo_Image::Root ******/
		/****** md5 signature: b928b7ce7a4d68875a739516be55eb7c ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns the upper generator of <S>.
") Root;
		const TopoDS_Shape Root(const TopoDS_Shape & S);

		/****** BRepAlgo_Image::Roots ******/
		/****** md5 signature: 82f242faa3e008b8cefc3123c93c72c8 ******/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Roots;
		const TopTools_ListOfShape & Roots();

		/****** BRepAlgo_Image::SetRoot ******/
		/****** md5 signature: 81eb99d7d9d22432167b234cf063481a ******/
		%feature("compactdefaultargs") SetRoot;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
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
		/****** BRepAlgo_Loop::BRepAlgo_Loop ******/
		/****** md5 signature: 25f06f5c44068f0a3075667be6a6a58b ******/
		%feature("compactdefaultargs") BRepAlgo_Loop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepAlgo_Loop;
		 BRepAlgo_Loop();

		/****** BRepAlgo_Loop::AddConstEdge ******/
		/****** md5 signature: c7f7273f1289f10b479203d0e90b817d ******/
		%feature("compactdefaultargs") AddConstEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
Add <E> as const edge, E can be in the result.
") AddConstEdge;
		void AddConstEdge(const TopoDS_Edge & E);

		/****** BRepAlgo_Loop::AddConstEdges ******/
		/****** md5 signature: bb5e3e5bda091bc51538ebc7c94a845d ******/
		%feature("compactdefaultargs") AddConstEdges;
		%feature("autodoc", "
Parameters
----------
LE: TopTools_ListOfShape

Return
-------
None

Description
-----------
Add <LE> as a set of const edges.
") AddConstEdges;
		void AddConstEdges(const TopTools_ListOfShape & LE);

		/****** BRepAlgo_Loop::AddEdge ******/
		/****** md5 signature: 1d4fc83e654194c8544ee17710aa8d90 ******/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
LV: TopTools_ListOfShape

Return
-------
None

Description
-----------
Add E with <LV>. <E> will be copied and trim by vertices in <LV>.
") AddEdge;
		void AddEdge(TopoDS_Edge & E, const TopTools_ListOfShape & LV);

		/****** BRepAlgo_Loop::CutEdge ******/
		/****** md5 signature: c3ea87f98f6a4b2923c6235d7b903c58 ******/
		%feature("compactdefaultargs") CutEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
VonE: TopTools_ListOfShape
NE: TopTools_ListOfShape

Return
-------
None

Description
-----------
Cut the edge <E> in several edges <NE> on the vertices<VonE>.
") CutEdge;
		void CutEdge(const TopoDS_Edge & E, const TopTools_ListOfShape & VonE, TopTools_ListOfShape & NE);

		/****** BRepAlgo_Loop::GetTolConf ******/
		/****** md5 signature: 7e9f7b87eb3b20edee9e3a86157928cd ******/
		%feature("compactdefaultargs") GetTolConf;
		%feature("autodoc", "Return
-------
float

Description
-----------
Get maximal tolerance used for comparing distances between vertices.
") GetTolConf;
		Standard_Real GetTolConf();

		/****** BRepAlgo_Loop::GetVerticesForSubstitute ******/
		/****** md5 signature: 3b0ea732ecf076dde3f931f0997c07aa ******/
		%feature("compactdefaultargs") GetVerticesForSubstitute;
		%feature("autodoc", "
Parameters
----------
VerVerMap: TopTools_DataMapOfShapeShape

Return
-------
None

Description
-----------
Returns the datamap of vertices with their substitutes.
") GetVerticesForSubstitute;
		void GetVerticesForSubstitute(TopTools_DataMapOfShapeShape & VerVerMap);

		/****** BRepAlgo_Loop::Init ******/
		/****** md5 signature: a8dfaa68079e743e08190fe58d950a9a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Init with <F> the set of edges must have pcurves on <F>.
") Init;
		void Init(const TopoDS_Face & F);

		/****** BRepAlgo_Loop::NewEdges ******/
		/****** md5 signature: ca2bf0bfae43c579574670d69e837949 ******/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of new edges built from an edge <E> it can be an empty list.
") NewEdges;
		const TopTools_ListOfShape & NewEdges(const TopoDS_Edge & E);

		/****** BRepAlgo_Loop::NewFaces ******/
		/****** md5 signature: 1760fdb1c9e5525f7aa9e149d10051e7 ******/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of faces. Warning: The method <WiresToFaces> as to be called before. can be an empty list.
") NewFaces;
		const TopTools_ListOfShape & NewFaces();

		/****** BRepAlgo_Loop::NewWires ******/
		/****** md5 signature: e3fe3b335b8953ae48d1acc70c50f835 ******/
		%feature("compactdefaultargs") NewWires;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of wires performed. can be an empty list.
") NewWires;
		const TopTools_ListOfShape & NewWires();

		/****** BRepAlgo_Loop::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Make loops.
") Perform;
		void Perform();

		/****** BRepAlgo_Loop::SetImageVV ******/
		/****** md5 signature: e4e1ed7e9cd079a003f1ab409e87973e ******/
		%feature("compactdefaultargs") SetImageVV;
		%feature("autodoc", "
Parameters
----------
theImageVV: BRepAlgo_Image

Return
-------
None

Description
-----------
Sets the Image Vertex - Vertex.
") SetImageVV;
		void SetImageVV(const BRepAlgo_Image & theImageVV);

		/****** BRepAlgo_Loop::SetTolConf ******/
		/****** md5 signature: 1c312d5c00a3d856c91eb31857ae32c6 ******/
		%feature("compactdefaultargs") SetTolConf;
		%feature("autodoc", "
Parameters
----------
theTolConf: float

Return
-------
None

Description
-----------
Set maximal tolerance used for comparing distances between vertices.
") SetTolConf;
		void SetTolConf(const Standard_Real theTolConf);

		/****** BRepAlgo_Loop::UpdateVEmap ******/
		/****** md5 signature: 491681c63af221fbd7247e01d389bbc0 ******/
		%feature("compactdefaultargs") UpdateVEmap;
		%feature("autodoc", "
Parameters
----------
theVEmap: TopTools_IndexedDataMapOfShapeListOfShape

Return
-------
None

Description
-----------
Update VE map according to Image Vertex - Vertex.
") UpdateVEmap;
		void UpdateVEmap(TopTools_IndexedDataMapOfShapeListOfShape & theVEmap);

		/****** BRepAlgo_Loop::VerticesForSubstitute ******/
		/****** md5 signature: b26ff2366762048c84c096651ba2d80c ******/
		%feature("compactdefaultargs") VerticesForSubstitute;
		%feature("autodoc", "
Parameters
----------
VerVerMap: TopTools_DataMapOfShapeShape

Return
-------
None

Description
-----------
No available documentation.
") VerticesForSubstitute;
		void VerticesForSubstitute(TopTools_DataMapOfShapeShape & VerVerMap);

		/****** BRepAlgo_Loop::WiresToFaces ******/
		/****** md5 signature: ba4d21c35d79af050089e2828b0fc192 ******/
		%feature("compactdefaultargs") WiresToFaces;
		%feature("autodoc", "Return
-------
None

Description
-----------
Build faces from the wires result.
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
		/****** BRepAlgo_NormalProjection::BRepAlgo_NormalProjection ******/
		/****** md5 signature: 9701a9046a8430d62899e04270a74739 ******/
		%feature("compactdefaultargs") BRepAlgo_NormalProjection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepAlgo_NormalProjection;
		 BRepAlgo_NormalProjection();

		/****** BRepAlgo_NormalProjection::BRepAlgo_NormalProjection ******/
		/****** md5 signature: 420e8a2be230db44d7bc7c2631e1f8fe ******/
		%feature("compactdefaultargs") BRepAlgo_NormalProjection;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") BRepAlgo_NormalProjection;
		 BRepAlgo_NormalProjection(const TopoDS_Shape & S);

		/****** BRepAlgo_NormalProjection::Add ******/
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
Add an edge or a wire to the list of shape to project.
") Add;
		void Add(const TopoDS_Shape & ToProj);

		/****** BRepAlgo_NormalProjection::Ancestor ******/
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
For a resulting edge, returns the corresponding initial edge.
") Ancestor;
		const TopoDS_Shape Ancestor(const TopoDS_Edge & E);

		/****** BRepAlgo_NormalProjection::Build ******/
		/****** md5 signature: 634d88e5c99c5ce236c07b337243d591 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds the result as a compound.
") Build;
		void Build();

		/****** BRepAlgo_NormalProjection::BuildWire ******/
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

		/****** BRepAlgo_NormalProjection::Compute3d ******/
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
if With3d = Standard_False the 3dcurve is not computed the initial 3dcurve is kept to build the resulting edges.
") Compute3d;
		void Compute3d(const Standard_Boolean With3d = Standard_True);

		/****** BRepAlgo_NormalProjection::Couple ******/
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
For a projected edge, returns the corresponding initial face.
") Couple;
		const TopoDS_Shape Couple(const TopoDS_Edge & E);

		/****** BRepAlgo_NormalProjection::Generated ******/
		/****** md5 signature: 20432e4d7ffc2a154be36ff0a467a19b ******/
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
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepAlgo_NormalProjection::Init ******/
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
No available documentation.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** BRepAlgo_NormalProjection::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepAlgo_NormalProjection::IsElementary ******/
		/****** md5 signature: 946351933089b0d0f29c01807aef61fe ******/
		%feature("compactdefaultargs") IsElementary;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsElementary;
		Standard_Boolean IsElementary(const Adaptor3d_Curve & C);

		/****** BRepAlgo_NormalProjection::Projection ******/
		/****** md5 signature: d96e6638e8d3c59fa6809c83eda77a82 ******/
		%feature("compactdefaultargs") Projection;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns the result.
") Projection;
		const TopoDS_Shape Projection();

		/****** BRepAlgo_NormalProjection::SetDefaultParams ******/
		/****** md5 signature: 41db5be74abe064c4ef67334ff98774d ******/
		%feature("compactdefaultargs") SetDefaultParams;
		%feature("autodoc", "Return
-------
None

Description
-----------
Set the parameters used for computation in their default values.
") SetDefaultParams;
		void SetDefaultParams();

		/****** BRepAlgo_NormalProjection::SetLimit ******/
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

		/****** BRepAlgo_NormalProjection::SetMaxDistance ******/
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

		/****** BRepAlgo_NormalProjection::SetParams ******/
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
Set the parameters used for computation Tol3d is the required tolerance between the 3d projected curve and its 2d representation InternalContinuity is the order of constraints used for approximation. MaxDeg and MaxSeg are the maximum degree and the maximum number of segment for BSpline resulting of an approximation.
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
/* deprecated methods */
%pythoncode {
@deprecated
def brepalgo_ConcatenateWire(*args):
	return brepalgo.ConcatenateWire(*args)

@deprecated
def brepalgo_ConcatenateWireC0(*args):
	return brepalgo.ConcatenateWireC0(*args)

@deprecated
def brepalgo_ConvertFace(*args):
	return brepalgo.ConvertFace(*args)

@deprecated
def brepalgo_ConvertWire(*args):
	return brepalgo.ConvertWire(*args)

@deprecated
def brepalgo_IsTopologicallyValid(*args):
	return brepalgo.IsTopologicallyValid(*args)

@deprecated
def brepalgo_IsValid(*args):
	return brepalgo.IsValid(*args)

@deprecated
def brepalgo_IsValid(*args):
	return brepalgo.IsValid(*args)

}
