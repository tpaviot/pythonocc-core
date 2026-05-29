/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define BREPEXTREMADOCSTRING
"BRepExtrema module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepextrema.html"
%enddef
%module (package="OCC.Core", docstring=BREPEXTREMADOCSTRING) BRepExtrema


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
#include<BRepExtrema_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<Extrema_module.hxx>
#include<Message_module.hxx>
#include<gp_module.hxx>
#include<Bnd_module.hxx>
#include<BVH_module.hxx>
#include<Poly_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<TShort_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import Extrema.i
%import Message.i
%import gp.i
%import Bnd.i
%import BVH.i
%import Poly.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum BRepExtrema_SupportType {
	BRepExtrema_IsVertex = 0,
	BRepExtrema_IsOnEdge = 1,
	BRepExtrema_IsInFace = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class BRepExtrema_SupportType(IntEnum):
	BRepExtrema_IsVertex = 0
	BRepExtrema_IsOnEdge = 1
	BRepExtrema_IsInFace = 2
BRepExtrema_IsVertex = BRepExtrema_SupportType.BRepExtrema_IsVertex
BRepExtrema_IsOnEdge = BRepExtrema_SupportType.BRepExtrema_IsOnEdge
BRepExtrema_IsInFace = BRepExtrema_SupportType.BRepExtrema_IsInFace
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BRepExtrema_TriangleSet)
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<int,TColStd_PackedMapOfInteger>::Items;
%ignore NCollection_DataMap<int,TColStd_PackedMapOfInteger>::KeyValues;
%template(BRepExtrema_MapOfIntegerPackedMapOfInteger) NCollection_DataMap<int,TColStd_PackedMapOfInteger>;

%extend NCollection_DataMap<int,TColStd_PackedMapOfInteger> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (BRepExtrema_MapOfIntegerPackedMapOfInteger::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(BRepExtrema_SeqOfSolution) NCollection_Sequence<BRepExtrema_SolutionElem>;

%extend NCollection_Sequence<BRepExtrema_SolutionElem> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<int, TColStd_PackedMapOfInteger> BRepExtrema_MapOfIntegerPackedMapOfInteger;
typedef NCollection_Sequence<BRepExtrema_SolutionElem> BRepExtrema_SeqOfSolution;
/* end typedefs declaration */

/***********************************
* class BRepExtrema_DistShapeShape *
***********************************/
class BRepExtrema_DistShapeShape {
	public:
		/****** BRepExtrema_DistShapeShape::BRepExtrema_DistShapeShape ******/
		/****** md5 signature: 7db35b07b02f16eafa8b496ba9a55793 ******/
		%feature("compactdefaultargs") BRepExtrema_DistShapeShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
create empty tool.
") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape();

		/****** BRepExtrema_DistShapeShape::BRepExtrema_DistShapeShape ******/
		/****** md5 signature: fb63ccf57bfd5b8006463aca52b50b43 ******/
		%feature("compactdefaultargs") BRepExtrema_DistShapeShape;
		%feature("autodoc", "
Parameters
----------
Shape1: TopoDS_Shape
Shape2: TopoDS_Shape
F: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
A: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
create tool and computation of the minimum distance (value and pair of points) using default deflection in single thread mode. Default deflection value is Precision::Confusion(). 
Parameter Shape1 - the first shape for distance computation 
Parameter Shape2 - the second shape for distance computation 
Parameter F and 
Parameter A are not used in computation and are obsolete. 
Parameter theRange - the progress indicator of algorithm.
") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape(const TopoDS_Shape & Shape1, const TopoDS_Shape & Shape2, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepExtrema_DistShapeShape::BRepExtrema_DistShapeShape ******/
		/****** md5 signature: df5790da970776757c8aca3ef7847c9e ******/
		%feature("compactdefaultargs") BRepExtrema_DistShapeShape;
		%feature("autodoc", "
Parameters
----------
Shape1: TopoDS_Shape
Shape2: TopoDS_Shape
theDeflection: double
F: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
A: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
create tool and computation of the minimum distance (value and pair of points) in single thread mode. Default deflection value is Precision::Confusion(). 
Parameter Shape1 - the first shape for distance computation 
Parameter Shape2 - the second shape for distance computation 
Parameter theDeflection - the presition of distance computation 
Parameter F and 
Parameter A are not used in computation and are obsolete. 
Parameter theRange - the progress indicator of algorithm.
") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape(const TopoDS_Shape & Shape1, const TopoDS_Shape & Shape2, const double theDeflection, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepExtrema_DistShapeShape::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** BRepExtrema_DistShapeShape::InnerSolution ******/
		/****** md5 signature: f63a201990b656840ae86cdf372926d2 ******/
		%feature("compactdefaultargs") InnerSolution;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if one of the shapes is a solid and the other shape is completely or partially inside the solid.
") InnerSolution;
		bool InnerSolution();

		/****** BRepExtrema_DistShapeShape::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the minimum distance is found.
") IsDone;
		bool IsDone();

		/****** BRepExtrema_DistShapeShape::IsMultiThread ******/
		/****** md5 signature: c30d99807a1f3ae547a73abef8eaab08 ******/
		%feature("compactdefaultargs") IsMultiThread;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true then computation will be performed in parallel Default value is false.
") IsMultiThread;
		bool IsMultiThread();

		/****** BRepExtrema_DistShapeShape::LoadS1 ******/
		/****** md5 signature: 7408ca5426be01fa3948ad765f9b1d2b ******/
		%feature("compactdefaultargs") LoadS1;
		%feature("autodoc", "
Parameters
----------
Shape1: TopoDS_Shape

Return
-------
None

Description
-----------
load first shape into extrema.
") LoadS1;
		void LoadS1(const TopoDS_Shape & Shape1);

		/****** BRepExtrema_DistShapeShape::LoadS2 ******/
		/****** md5 signature: 3b40248cbf67bbe15af62d523554bf15 ******/
		%feature("compactdefaultargs") LoadS2;
		%feature("autodoc", "
Parameters
----------
Shape1: TopoDS_Shape

Return
-------
None

Description
-----------
load second shape into extrema.
") LoadS2;
		void LoadS2(const TopoDS_Shape & Shape1);

		/****** BRepExtrema_DistShapeShape::NbSolution ******/
		/****** md5 signature: b677baacc489a002ee4a2e4836249fba ******/
		%feature("compactdefaultargs") NbSolution;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of solutions satisfying the minimum distance.
") NbSolution;
		int NbSolution();

		/****** BRepExtrema_DistShapeShape::ParOnEdgeS1 ******/
		/****** md5 signature: 6e3043c8ea18548fb9bb6fe33f70a20f ******/
		%feature("compactdefaultargs") ParOnEdgeS1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
t: double

Description
-----------
gives the corresponding parameter t if the Nth solution is situated on an Edge of the first shape.
") ParOnEdgeS1;
		void ParOnEdgeS1(const int N, Standard_Real &OutValue);

		/****** BRepExtrema_DistShapeShape::ParOnEdgeS2 ******/
		/****** md5 signature: 5bde6d31e4ca304b9fb0b692d274aca4 ******/
		%feature("compactdefaultargs") ParOnEdgeS2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
t: double

Description
-----------
gives the corresponding parameter t if the Nth solution is situated on an Edge of the first shape.
") ParOnEdgeS2;
		void ParOnEdgeS2(const int N, Standard_Real &OutValue);

		/****** BRepExtrema_DistShapeShape::ParOnFaceS1 ******/
		/****** md5 signature: 9702f2fffd0fcb2c277d5efe81b761b1 ******/
		%feature("compactdefaultargs") ParOnFaceS1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
u: double
v: double

Description
-----------
gives the corresponding parameters (U,V) if the Nth solution is situated on an face of the first shape.
") ParOnFaceS1;
		void ParOnFaceS1(const int N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepExtrema_DistShapeShape::ParOnFaceS2 ******/
		/****** md5 signature: 9bd67d4d91678f1efbd1f761850a81c8 ******/
		%feature("compactdefaultargs") ParOnFaceS2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
u: double
v: double

Description
-----------
gives the corresponding parameters (U,V) if the Nth solution is situated on an Face of the second shape.
") ParOnFaceS2;
		void ParOnFaceS2(const int N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepExtrema_DistShapeShape::Perform ******/
		/****** md5 signature: 89fccb147dc477a65d64fa6589cf2713 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
computation of the minimum distance (value and couple of points). Parameter theDeflection is used to specify a maximum deviation of extreme distances from the minimum one. Returns IsDone status. theRange - the progress indicator of algorithm.
") Perform;
		bool Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepExtrema_DistShapeShape::PointOnShape1 ******/
		/****** md5 signature: 71ce0da69a88f7e598d7dea18b42c140 ******/
		%feature("compactdefaultargs") PointOnShape1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
gp_Pnt

Description
-----------
Returns the Point corresponding to the <N>th solution on the first Shape.
") PointOnShape1;
		const gp_Pnt PointOnShape1(const int N);

		/****** BRepExtrema_DistShapeShape::PointOnShape2 ******/
		/****** md5 signature: 2ec847799a05de3a905962d96403f368 ******/
		%feature("compactdefaultargs") PointOnShape2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
gp_Pnt

Description
-----------
Returns the Point corresponding to the <N>th solution on the second Shape.
") PointOnShape2;
		const gp_Pnt PointOnShape2(const int N);

		/****** BRepExtrema_DistShapeShape::SetAlgo ******/
		/****** md5 signature: cad6f54c64a4b69da22bb042d2e4fe8a ******/
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "
Parameters
----------
A: Extrema_ExtAlgo

Return
-------
None

Description
-----------
Sets unused parameter Obsolete.
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****** BRepExtrema_DistShapeShape::SetDeflection ******/
		/****** md5 signature: 4ffc3b2c2f617266ffb800b5de7b581b ******/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "
Parameters
----------
theDeflection: double

Return
-------
None

Description
-----------
Sets deflection to computation of the minimum distance.
") SetDeflection;
		void SetDeflection(const double theDeflection);

		/****** BRepExtrema_DistShapeShape::SetFlag ******/
		/****** md5 signature: 7ce767aa4373b85a8cea83f409a2ebfb ******/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "
Parameters
----------
F: Extrema_ExtFlag

Return
-------
None

Description
-----------
Sets unused parameter Obsolete.
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

		/****** BRepExtrema_DistShapeShape::SetMultiThread ******/
		/****** md5 signature: 46419191b8dc769cffc4baf65914e4d9 ******/
		%feature("compactdefaultargs") SetMultiThread;
		%feature("autodoc", "
Parameters
----------
theIsMultiThread: bool

Return
-------
None

Description
-----------
If isMultiThread == true then computation will be performed in parallel.
") SetMultiThread;
		void SetMultiThread(bool theIsMultiThread);

		/****** BRepExtrema_DistShapeShape::SupportOnShape1 ******/
		/****** md5 signature: 85cfbf9d34ebe10f35d13d6ba3aa49e0 ******/
		%feature("compactdefaultargs") SupportOnShape1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
TopoDS_Shape

Description
-----------
gives the support where the Nth solution on the first shape is situated. This support can be a Vertex, an Edge or a Face.
") SupportOnShape1;
		TopoDS_Shape SupportOnShape1(const int N);

		/****** BRepExtrema_DistShapeShape::SupportOnShape2 ******/
		/****** md5 signature: d288c3d726a924897ea82b0707a35db4 ******/
		%feature("compactdefaultargs") SupportOnShape2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
TopoDS_Shape

Description
-----------
gives the support where the Nth solution on the second shape is situated. This support can be a Vertex, an Edge or a Face.
") SupportOnShape2;
		TopoDS_Shape SupportOnShape2(const int N);

		/****** BRepExtrema_DistShapeShape::SupportTypeShape1 ******/
		/****** md5 signature: eb2183fcc1c158cf27722bfc3ce6bce4 ******/
		%feature("compactdefaultargs") SupportTypeShape1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
BRepExtrema_SupportType

Description
-----------
gives the type of the support where the Nth solution on the first shape is situated: IsVertex => the Nth solution on the first shape is a Vertex IsOnEdge => the Nth soluion on the first shape is on a Edge IsInFace => the Nth solution on the first shape is inside a face the corresponding support is obtained by the method SupportOnShape1.
") SupportTypeShape1;
		BRepExtrema_SupportType SupportTypeShape1(const int N);

		/****** BRepExtrema_DistShapeShape::SupportTypeShape2 ******/
		/****** md5 signature: 0aea00316768588d084b7e66096f1aa9 ******/
		%feature("compactdefaultargs") SupportTypeShape2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
BRepExtrema_SupportType

Description
-----------
gives the type of the support where the Nth solution on the second shape is situated: IsVertex => the Nth solution on the second shape is a Vertex IsOnEdge => the Nth soluion on the secondt shape is on a Edge IsInFace => the Nth solution on the second shape is inside a face the corresponding support is obtained by the method SupportOnShape2.
") SupportTypeShape2;
		BRepExtrema_SupportType SupportTypeShape2(const int N);

		/****** BRepExtrema_DistShapeShape::Value ******/
		/****** md5 signature: dbdf6d9f5299cb6ef730d686d81d15db ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the minimum distance.
") Value;
		double Value();

};


%extend BRepExtrema_DistShapeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepExtrema_DistanceSS *
*******************************/
class BRepExtrema_DistanceSS {
	public:
		/****** BRepExtrema_DistanceSS::BRepExtrema_DistanceSS ******/
		/****** md5 signature: 2d3b69e788286c0c2afb700eaa8d2bb6 ******/
		%feature("compactdefaultargs") BRepExtrema_DistanceSS;
		%feature("autodoc", "
Parameters
----------
theS1: TopoDS_Shape
theS2: TopoDS_Shape
theBox1: Bnd_Box
theBox2: Bnd_Box
theDstRef: double
theDeflection: double (optional, default to Precision::Confusion())
theExtFlag: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
theExtAlgo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
Computes the distance between two Shapes (face edge vertex). 
Parameter theS1 - First shape 
Parameter theS2 - Second shape 
Parameter theBox1 - Bounding box of first shape 
Parameter theBox2 - Bounding box of second shape 
Parameter theDstRef - Initial distance between the shapes to start with 
Parameter theDeflection - Maximum deviation of extreme distances from the minimum one (default is Precision::Confusion()). 
Parameter theExtFlag - Specifies which extrema solutions to look for (default is MINMAX, applied only to point-face extrema) 
Parameter theExtAlgo - Specifies which extrema algorithm is to be used (default is Grad algo, applied only to point-face extrema).
") BRepExtrema_DistanceSS;
		 BRepExtrema_DistanceSS(const TopoDS_Shape & theS1, const TopoDS_Shape & theS2, const Bnd_Box & theBox1, const Bnd_Box & theBox2, const double theDstRef, const double theDeflection = Precision::Confusion(), const Extrema_ExtFlag theExtFlag = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo theExtAlgo = Extrema_ExtAlgo_Grad);

		/****** BRepExtrema_DistanceSS::DistValue ******/
		/****** md5 signature: 169384faa94bb97bd469c1265d73cabb ******/
		%feature("compactdefaultargs") DistValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the distance value.
") DistValue;
		double DistValue();

		/****** BRepExtrema_DistanceSS::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the distance has been computed, false otherwise.
") IsDone;
		bool IsDone();

		/****** BRepExtrema_DistanceSS::Seq1Value ******/
		/****** md5 signature: 6bdee6a94c8f1f387b4b4371e0d0421f ******/
		%feature("compactdefaultargs") Seq1Value;
		%feature("autodoc", "Return
-------
NCollection_Sequence<BRepExtrema_SolutionElem>

Description
-----------
Returns the list of solutions on the first shape.
") Seq1Value;
		const NCollection_Sequence<BRepExtrema_SolutionElem> & Seq1Value();

		/****** BRepExtrema_DistanceSS::Seq2Value ******/
		/****** md5 signature: aef75d29e93edd04bb0318a5a1892971 ******/
		%feature("compactdefaultargs") Seq2Value;
		%feature("autodoc", "Return
-------
NCollection_Sequence<BRepExtrema_SolutionElem>

Description
-----------
Returns the list of solutions on the second shape.
") Seq2Value;
		const NCollection_Sequence<BRepExtrema_SolutionElem> & Seq2Value();

};


%extend BRepExtrema_DistanceSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepExtrema_ElementFilter *
**********************************/
class BRepExtrema_ElementFilter {
	public:
/* public enums */
enum FilterResult {
	NoCheck = 0,
	Overlap = 1,
	DoCheck = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class FilterResult(IntEnum):
	NoCheck = 0
	Overlap = 1
	DoCheck = 2
NoCheck = FilterResult.NoCheck
Overlap = FilterResult.Overlap
DoCheck = FilterResult.DoCheck
};
/* end python proxy for enums */

		/****** BRepExtrema_ElementFilter::PreCheckElements ******/
		/****** md5 signature: 8f53c4747ea073acbfbca4b8175e14bb ******/
		%feature("compactdefaultargs") PreCheckElements;
		%feature("autodoc", "
Parameters
----------
: int
: int

Return
-------
BRepExtrema_ElementFilter::FilterResult

Description
-----------
Checks if two mesh elements should be tested for overlapping/intersection (used for detection correct/incorrect cases of shared edges and vertices).
") PreCheckElements;
		virtual BRepExtrema_ElementFilter::FilterResult PreCheckElements(const int , const int );

};


%extend BRepExtrema_ElementFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepExtrema_ExtCC *
**************************/
class BRepExtrema_ExtCC {
	public:
		/****** BRepExtrema_ExtCC::BRepExtrema_ExtCC ******/
		/****** md5 signature: f27ec8015f8b08790bc90a2dc535ceff ******/
		%feature("compactdefaultargs") BRepExtrema_ExtCC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepExtrema_ExtCC;
		 BRepExtrema_ExtCC();

		/****** BRepExtrema_ExtCC::BRepExtrema_ExtCC ******/
		/****** md5 signature: 21fcfba4a98ca2696fdd04abc944df8d ******/
		%feature("compactdefaultargs") BRepExtrema_ExtCC;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge

Return
-------
None

Description
-----------
It calculates all the distances.
") BRepExtrema_ExtCC;
		 BRepExtrema_ExtCC(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****** BRepExtrema_ExtCC::Initialize ******/
		/****** md5 signature: c89b77664746a64b0d7d6a1d193b3d58 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
E2: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const TopoDS_Edge & E2);

		/****** BRepExtrema_ExtCC::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		bool IsDone();

		/****** BRepExtrema_ExtCC::IsParallel ******/
		/****** md5 signature: 7046a6b3b457e744360b84ad9c060428 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if E1 and E2 are parallel.
") IsParallel;
		bool IsParallel();

		/****** BRepExtrema_ExtCC::NbExt ******/
		/****** md5 signature: b929c74e4c26b17971ccf28a2d5db248 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** BRepExtrema_ExtCC::ParameterOnE1 ******/
		/****** md5 signature: b792df09ee33ee4a5419271d1bbbdfc0 ******/
		%feature("compactdefaultargs") ParameterOnE1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the parameter on the first edge of the <N>th extremum distance.
") ParameterOnE1;
		double ParameterOnE1(const int N);

		/****** BRepExtrema_ExtCC::ParameterOnE2 ******/
		/****** md5 signature: fbfc56829b3937ea3223006d93f1896a ******/
		%feature("compactdefaultargs") ParameterOnE2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the parameter on the second edge of the <N>th extremum distance.
") ParameterOnE2;
		double ParameterOnE2(const int N);

		/****** BRepExtrema_ExtCC::Perform ******/
		/****** md5 signature: f7179778f701b048ae69059d84e58974 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Edge

Return
-------
None

Description
-----------
An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const TopoDS_Edge & E1);

		/****** BRepExtrema_ExtCC::PointOnE1 ******/
		/****** md5 signature: 6b7e02cd122f0f7c64429aa86d56a51e ******/
		%feature("compactdefaultargs") PointOnE1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
gp_Pnt

Description
-----------
Returns the Point of the <N>th extremum distance on the edge E1.
") PointOnE1;
		gp_Pnt PointOnE1(const int N);

		/****** BRepExtrema_ExtCC::PointOnE2 ******/
		/****** md5 signature: 836191817b35caa3b5c335dc77e3bd4a ******/
		%feature("compactdefaultargs") PointOnE2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
gp_Pnt

Description
-----------
Returns the Point of the <N>th extremum distance on the edge E2.
") PointOnE2;
		gp_Pnt PointOnE2(const int N);

		/****** BRepExtrema_ExtCC::SquareDistance ******/
		/****** md5 signature: 27a2efb909e350829b258f395631ada6 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the <N>th extremum square distance.
") SquareDistance;
		double SquareDistance(const int N);

		/****** BRepExtrema_ExtCC::TrimmedSquareDistances ******/
		/****** md5 signature: a0b2e07311146f31be6f8f46c6371a1a ******/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "
Parameters
----------
P11: gp_Pnt
P12: gp_Pnt
P21: gp_Pnt
P22: gp_Pnt

Return
-------
dist11: double
distP12: double
distP21: double
distP22: double

Description
-----------
if the edges is a trimmed curve, dist11 is a square distance between the point on E1 of parameter FirstParameter and the point of parameter FirstParameter on E2.
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & P11, gp_Pnt & P12, gp_Pnt & P21, gp_Pnt & P22);

};


%extend BRepExtrema_ExtCC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepExtrema_ExtCF *
**************************/
class BRepExtrema_ExtCF {
	public:
		/****** BRepExtrema_ExtCF::BRepExtrema_ExtCF ******/
		/****** md5 signature: 3d0330d4f1fca7c803db78493829ef17 ******/
		%feature("compactdefaultargs") BRepExtrema_ExtCF;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepExtrema_ExtCF;
		 BRepExtrema_ExtCF();

		/****** BRepExtrema_ExtCF::BRepExtrema_ExtCF ******/
		/****** md5 signature: 16020da834cdf79577c7d512faaaae03 ******/
		%feature("compactdefaultargs") BRepExtrema_ExtCF;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
It calculates all the distances.
") BRepExtrema_ExtCF;
		 BRepExtrema_ExtCF(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepExtrema_ExtCF::Initialize ******/
		/****** md5 signature: cf258179577adbc75b4efbc5847934f6 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepExtrema_ExtCF::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		bool IsDone();

		/****** BRepExtrema_ExtCF::IsParallel ******/
		/****** md5 signature: 7046a6b3b457e744360b84ad9c060428 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is on a parallel surface.
") IsParallel;
		bool IsParallel();

		/****** BRepExtrema_ExtCF::NbExt ******/
		/****** md5 signature: b929c74e4c26b17971ccf28a2d5db248 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** BRepExtrema_ExtCF::ParameterOnEdge ******/
		/****** md5 signature: 3e101ccf5826b466fa6e763624fa0d4b ******/
		%feature("compactdefaultargs") ParameterOnEdge;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the parameters on the Edge of the <N>th extremum distance.
") ParameterOnEdge;
		double ParameterOnEdge(const int N);

		/****** BRepExtrema_ExtCF::ParameterOnFace ******/
		/****** md5 signature: f9faeb7390e93677e4cd0cc4473b08c4 ******/
		%feature("compactdefaultargs") ParameterOnFace;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
U: double
V: double

Description
-----------
Returns the parameters on the Face of the <N>th extremum distance.
") ParameterOnFace;
		void ParameterOnFace(const int N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepExtrema_ExtCF::Perform ******/
		/****** md5 signature: e2ae2dd62a61e8e392541e0c53f605ce ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
An exception is raised if the fields have not been initialized. Be careful: this method uses the Face only for classify not for the fields.
") Perform;
		void Perform(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepExtrema_ExtCF::PointOnEdge ******/
		/****** md5 signature: 5d782bb10592521ec990eb257aabf507 ******/
		%feature("compactdefaultargs") PointOnEdge;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
gp_Pnt

Description
-----------
Returns the Point of the <N>th extremum distance.
") PointOnEdge;
		gp_Pnt PointOnEdge(const int N);

		/****** BRepExtrema_ExtCF::PointOnFace ******/
		/****** md5 signature: b1b2c684fe49855124af7d64bd025453 ******/
		%feature("compactdefaultargs") PointOnFace;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
gp_Pnt

Description
-----------
Returns the Point of the <N>th extremum distance.
") PointOnFace;
		gp_Pnt PointOnFace(const int N);

		/****** BRepExtrema_ExtCF::SquareDistance ******/
		/****** md5 signature: 27a2efb909e350829b258f395631ada6 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the <N>th extremum square distance.
") SquareDistance;
		double SquareDistance(const int N);

};


%extend BRepExtrema_ExtCF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepExtrema_ExtFF *
**************************/
class BRepExtrema_ExtFF {
	public:
		/****** BRepExtrema_ExtFF::BRepExtrema_ExtFF ******/
		/****** md5 signature: a64e34ebc6bc6ca74fbb8ae1e71627ee ******/
		%feature("compactdefaultargs") BRepExtrema_ExtFF;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepExtrema_ExtFF;
		 BRepExtrema_ExtFF();

		/****** BRepExtrema_ExtFF::BRepExtrema_ExtFF ******/
		/****** md5 signature: 70b7a7554f1d0147af0991d67e7e29d2 ******/
		%feature("compactdefaultargs") BRepExtrema_ExtFF;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Return
-------
None

Description
-----------
It calculates all the distances.
") BRepExtrema_ExtFF;
		 BRepExtrema_ExtFF(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** BRepExtrema_ExtFF::Initialize ******/
		/****** md5 signature: 9cbae6cf246b55baed45100dd3ac1d25 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
F2: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const TopoDS_Face & F2);

		/****** BRepExtrema_ExtFF::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		bool IsDone();

		/****** BRepExtrema_ExtFF::IsParallel ******/
		/****** md5 signature: 7046a6b3b457e744360b84ad9c060428 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the surfaces are parallel.
") IsParallel;
		bool IsParallel();

		/****** BRepExtrema_ExtFF::NbExt ******/
		/****** md5 signature: b929c74e4c26b17971ccf28a2d5db248 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** BRepExtrema_ExtFF::ParameterOnFace1 ******/
		/****** md5 signature: ce8937bd7ba8113f18402082543d2e8f ******/
		%feature("compactdefaultargs") ParameterOnFace1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
U: double
V: double

Description
-----------
Returns the parameters on the Face F1 of the <N>th extremum distance.
") ParameterOnFace1;
		void ParameterOnFace1(const int N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepExtrema_ExtFF::ParameterOnFace2 ******/
		/****** md5 signature: 1f399e35d657e1a34b17c711ef4a7f33 ******/
		%feature("compactdefaultargs") ParameterOnFace2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
U: double
V: double

Description
-----------
Returns the parameters on the Face F2 of the <N>th extremum distance.
") ParameterOnFace2;
		void ParameterOnFace2(const int N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepExtrema_ExtFF::Perform ******/
		/****** md5 signature: 20b101b6609f56b4df981165ffc5760a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Return
-------
None

Description
-----------
An exception is raised if the fields have not been initialized. Be careful: this method uses the Face F2 only for classify, not for the fields.
") Perform;
		void Perform(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** BRepExtrema_ExtFF::PointOnFace1 ******/
		/****** md5 signature: af875db41a201d74dd065c0a77ab912a ******/
		%feature("compactdefaultargs") PointOnFace1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
gp_Pnt

Description
-----------
Returns the Point of the <N>th extremum distance.
") PointOnFace1;
		gp_Pnt PointOnFace1(const int N);

		/****** BRepExtrema_ExtFF::PointOnFace2 ******/
		/****** md5 signature: e53c9700e3b5cb462b645f485269bf42 ******/
		%feature("compactdefaultargs") PointOnFace2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
gp_Pnt

Description
-----------
Returns the Point of the <N>th extremum distance.
") PointOnFace2;
		gp_Pnt PointOnFace2(const int N);

		/****** BRepExtrema_ExtFF::SquareDistance ******/
		/****** md5 signature: 27a2efb909e350829b258f395631ada6 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the <N>th extremum square distance.
") SquareDistance;
		double SquareDistance(const int N);

};


%extend BRepExtrema_ExtFF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepExtrema_ExtPC *
**************************/
class BRepExtrema_ExtPC {
	public:
		/****** BRepExtrema_ExtPC::BRepExtrema_ExtPC ******/
		/****** md5 signature: aed1510f482df96afbd2448e9dc3ad5e ******/
		%feature("compactdefaultargs") BRepExtrema_ExtPC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepExtrema_ExtPC;
		 BRepExtrema_ExtPC();

		/****** BRepExtrema_ExtPC::BRepExtrema_ExtPC ******/
		/****** md5 signature: 77947b9170dd4391d353244f4f6218cc ******/
		%feature("compactdefaultargs") BRepExtrema_ExtPC;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
None

Description
-----------
It calculates all the distances.
") BRepExtrema_ExtPC;
		 BRepExtrema_ExtPC(const TopoDS_Vertex & V, const TopoDS_Edge & E);

		/****** BRepExtrema_ExtPC::Initialize ******/
		/****** md5 signature: b0b8cb0790e5e63c5a8b3b133b757731 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const TopoDS_Edge & E);

		/****** BRepExtrema_ExtPC::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		bool IsDone();

		/****** BRepExtrema_ExtPC::IsMin ******/
		/****** md5 signature: 46359f68be3f14ae47fa35b95044ee05 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the <N>th extremum distance is a minimum.
") IsMin;
		bool IsMin(const int N);

		/****** BRepExtrema_ExtPC::NbExt ******/
		/****** md5 signature: b929c74e4c26b17971ccf28a2d5db248 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** BRepExtrema_ExtPC::Parameter ******/
		/****** md5 signature: c0b94be9130cc7c0531d74f6121a3f6a ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the parameter on the edge of the <N>th extremum distance.
") Parameter;
		double Parameter(const int N);

		/****** BRepExtrema_ExtPC::Perform ******/
		/****** md5 signature: f794a3745eea09bbd96f5aefe65dee12 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
None

Description
-----------
An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const TopoDS_Vertex & V);

		/****** BRepExtrema_ExtPC::Point ******/
		/****** md5 signature: 18324d842e072a0737e0f7ebcad758c8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
gp_Pnt

Description
-----------
Returns the Point of the <N>th extremum distance.
") Point;
		gp_Pnt Point(const int N);

		/****** BRepExtrema_ExtPC::SquareDistance ******/
		/****** md5 signature: 27a2efb909e350829b258f395631ada6 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the <N>th extremum square distance.
") SquareDistance;
		double SquareDistance(const int N);

		/****** BRepExtrema_ExtPC::TrimmedSquareDistances ******/
		/****** md5 signature: d97917db09a71e84c60649329554868d ******/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "
Parameters
----------
pnt1: gp_Pnt
pnt2: gp_Pnt

Return
-------
dist1: double
dist2: double

Description
-----------
if the curve is a trimmed curve, dist1 is a square distance between <P> and the point of parameter FirstParameter <pnt1> and dist2 is a square distance between <P> and the point of parameter LastParameter <pnt2>.
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & pnt1, gp_Pnt & pnt2);

};


%extend BRepExtrema_ExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepExtrema_ExtPF *
**************************/
class BRepExtrema_ExtPF {
	public:
		/****** BRepExtrema_ExtPF::BRepExtrema_ExtPF ******/
		/****** md5 signature: db42aa2b85921b9e84c315a2a8e27f22 ******/
		%feature("compactdefaultargs") BRepExtrema_ExtPF;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepExtrema_ExtPF;
		 BRepExtrema_ExtPF();

		/****** BRepExtrema_ExtPF::BRepExtrema_ExtPF ******/
		/****** md5 signature: 9f029172528aafcb8c173bb3e47a6d64 ******/
		%feature("compactdefaultargs") BRepExtrema_ExtPF;
		%feature("autodoc", "
Parameters
----------
TheVertex: TopoDS_Vertex
TheFace: TopoDS_Face
TheFlag: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
TheAlgo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
It calculates all the distances.
") BRepExtrema_ExtPF;
		 BRepExtrema_ExtPF(const TopoDS_Vertex & TheVertex, const TopoDS_Face & TheFace, const Extrema_ExtFlag TheFlag = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo TheAlgo = Extrema_ExtAlgo_Grad);

		/****** BRepExtrema_ExtPF::Initialize ******/
		/****** md5 signature: b186eacda6514ba3cf68a60d6462c860 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
TheFace: TopoDS_Face
TheFlag: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
TheAlgo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const TopoDS_Face & TheFace, const Extrema_ExtFlag TheFlag = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo TheAlgo = Extrema_ExtAlgo_Grad);

		/****** BRepExtrema_ExtPF::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		bool IsDone();

		/****** BRepExtrema_ExtPF::NbExt ******/
		/****** md5 signature: b929c74e4c26b17971ccf28a2d5db248 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** BRepExtrema_ExtPF::Parameter ******/
		/****** md5 signature: e6aabd9fa100460be8cec4849b374ca5 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
U: double
V: double

Description
-----------
Returns the parameters on the Face of the <N>th extremum distance.
") Parameter;
		void Parameter(const int N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepExtrema_ExtPF::Perform ******/
		/****** md5 signature: 8abaa691a7bf98cb37f090b7a876264b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
TheVertex: TopoDS_Vertex
TheFace: TopoDS_Face

Return
-------
None

Description
-----------
An exception is raised if the fields have not been initialized. Be careful: this method uses the Face only for classify not for the fields.
") Perform;
		void Perform(const TopoDS_Vertex & TheVertex, const TopoDS_Face & TheFace);

		/****** BRepExtrema_ExtPF::Point ******/
		/****** md5 signature: 18324d842e072a0737e0f7ebcad758c8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
gp_Pnt

Description
-----------
Returns the Point of the <N>th extremum distance.
") Point;
		gp_Pnt Point(const int N);

		/****** BRepExtrema_ExtPF::SetAlgo ******/
		/****** md5 signature: cad6f54c64a4b69da22bb042d2e4fe8a ******/
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "
Parameters
----------
A: Extrema_ExtAlgo

Return
-------
None

Description
-----------
No available documentation.
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****** BRepExtrema_ExtPF::SetFlag ******/
		/****** md5 signature: 7ce767aa4373b85a8cea83f409a2ebfb ******/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "
Parameters
----------
F: Extrema_ExtFlag

Return
-------
None

Description
-----------
No available documentation.
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

		/****** BRepExtrema_ExtPF::SquareDistance ******/
		/****** md5 signature: 27a2efb909e350829b258f395631ada6 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the <N>th extremum square distance.
") SquareDistance;
		double SquareDistance(const int N);

};


%extend BRepExtrema_ExtPF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepExtrema_OverlapTool *
********************************/
/*************************
* class BRepExtrema_Poly *
*************************/
class BRepExtrema_Poly {
	public:
		/****** BRepExtrema_Poly::Distance ******/
		/****** md5 signature: b2cb728fc85f6973103c90dcedce40bd ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
P1: gp_Pnt
P2: gp_Pnt

Return
-------
dist: double

Description
-----------
returns true if OK.
") Distance;
		static bool Distance(const TopoDS_Shape & S1, const TopoDS_Shape & S2, gp_Pnt & P1, gp_Pnt & P2, Standard_Real &OutValue);

};


%extend BRepExtrema_Poly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepExtrema_ProximityDistTool *
**************************************/
class BRepExtrema_ProximityDistTool : public BVH_Distance<double,3,BVH_Vec3d,BRepExtrema_TriangleSet> {
	public:
typedef typename BVH_Tools<double , 3>::BVH_PrjStateInTriangle BVH_PrjState;
		class PrjState {};
/* public enums */
enum ProxPnt_Status {
	ProxPnt_Status_BORDER = 0,
	ProxPnt_Status_MIDDLE = 1,
	ProxPnt_Status_UNKNOWN = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class ProxPnt_Status(IntEnum):
	ProxPnt_Status_BORDER = 0
	ProxPnt_Status_MIDDLE = 1
	ProxPnt_Status_UNKNOWN = 2
ProxPnt_Status_BORDER = ProxPnt_Status.ProxPnt_Status_BORDER
ProxPnt_Status_MIDDLE = ProxPnt_Status.ProxPnt_Status_MIDDLE
ProxPnt_Status_UNKNOWN = ProxPnt_Status.ProxPnt_Status_UNKNOWN
};
/* end python proxy for enums */

		/****** BRepExtrema_ProximityDistTool::BRepExtrema_ProximityDistTool ******/
		/****** md5 signature: 2988f1cc0151ca5566402211c63fd7de ******/
		%feature("compactdefaultargs") BRepExtrema_ProximityDistTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates new uninitialized tool.
") BRepExtrema_ProximityDistTool;
		 BRepExtrema_ProximityDistTool();

		/****** BRepExtrema_ProximityDistTool::BRepExtrema_ProximityDistTool ******/
		/****** md5 signature: f58ca06ab8d0f4273a5cc4e36556594f ******/
		%feature("compactdefaultargs") BRepExtrema_ProximityDistTool;
		%feature("autodoc", "
Parameters
----------
theSet1: BRepExtrema_TriangleSet
theNbSamples1: int
theAddVertices1: BVH_Array3d
theAddStatus1: NCollection_DynamicArray<ProxPnt_Status>
theSet2: BRepExtrema_TriangleSet
theShapeList1: NCollection_DynamicArray<TopoDS_Shape>
theShapeList2: NCollection_DynamicArray<TopoDS_Shape>

Return
-------
None

Description
-----------
Creates new tool for the given element sets.
") BRepExtrema_ProximityDistTool;
		 BRepExtrema_ProximityDistTool(const opencascade::handle<BRepExtrema_TriangleSet> & theSet1, const int theNbSamples1, const BVH_Array3d & theAddVertices1, const NCollection_DynamicArray<ProxPnt_Status> & theAddStatus1, const opencascade::handle<BRepExtrema_TriangleSet> & theSet2, const NCollection_DynamicArray<TopoDS_Shape> & theShapeList1, const NCollection_DynamicArray<TopoDS_Shape> & theShapeList2);

		/****** BRepExtrema_ProximityDistTool::Accept ******/
		/****** md5 signature: feff45cb8bb6d83ad5082c08f8992019 ******/
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "
Parameters
----------
theSgmIdx: int
&: double

Return
-------
bool

Description
-----------
Defines the rules for leaf acceptance.
") Accept;
		bool Accept(const int theSgmIdx, const double &);

		/****** BRepExtrema_ProximityDistTool::IsEdgeOnBorder ******/
		/****** md5 signature: 4902c90bdc7ec9379c8f66aff7fbe533 ******/
		%feature("compactdefaultargs") IsEdgeOnBorder;
		%feature("autodoc", "
Parameters
----------
theTrgIdx: int
theFirstEdgeNodeIdx: int
theSecondEdgeNodeIdx: int
theTr: Poly_Triangulation

Return
-------
bool

Description
-----------
Returns true if the edge is on the boarder.
") IsEdgeOnBorder;
		static bool IsEdgeOnBorder(const int theTrgIdx, const int theFirstEdgeNodeIdx, const int theSecondEdgeNodeIdx, const opencascade::handle<Poly_Triangulation> & theTr);

		/****** BRepExtrema_ProximityDistTool::IsNodeOnBorder ******/
		/****** md5 signature: 65f7c7df4bb2932be0fa398082ba2bb7 ******/
		%feature("compactdefaultargs") IsNodeOnBorder;
		%feature("autodoc", "
Parameters
----------
theNodeIdx: int
theTr: Poly_Triangulation

Return
-------
bool

Description
-----------
Returns true if the node is on the boarder.
") IsNodeOnBorder;
		static bool IsNodeOnBorder(const int theNodeIdx, const opencascade::handle<Poly_Triangulation> & theTr);

		/****** BRepExtrema_ProximityDistTool::LoadShapeLists ******/
		/****** md5 signature: 5ac867dd73c90ed82c0be2161b0a1af4 ******/
		%feature("compactdefaultargs") LoadShapeLists;
		%feature("autodoc", "
Parameters
----------
theShapeList1: NCollection_DynamicArray<TopoDS_Shape>
theShapeList2: NCollection_DynamicArray<TopoDS_Shape>

Return
-------
None

Description
-----------
Loads the given list of subshapes into the tool.
") LoadShapeLists;
		void LoadShapeLists(const NCollection_DynamicArray<TopoDS_Shape> & theShapeList1, const NCollection_DynamicArray<TopoDS_Shape> & theShapeList2);

		/****** BRepExtrema_ProximityDistTool::LoadTriangleSets ******/
		/****** md5 signature: dfd78a7a416eff23ee78d969d7e3cf4f ******/
		%feature("compactdefaultargs") LoadTriangleSets;
		%feature("autodoc", "
Parameters
----------
theSet1: BRepExtrema_TriangleSet
theSet2: BRepExtrema_TriangleSet

Return
-------
None

Description
-----------
Loads the given element sets into the tool.
") LoadTriangleSets;
		void LoadTriangleSets(const opencascade::handle<BRepExtrema_TriangleSet> & theSet1, const opencascade::handle<BRepExtrema_TriangleSet> & theSet2);

		/****** BRepExtrema_ProximityDistTool::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs searching of the proximity distance.
") Perform;
		void Perform();

		/****** BRepExtrema_ProximityDistTool::ProximityDistance ******/
		/****** md5 signature: b9f8223992704558cc673ceb61a5dd7b ******/
		%feature("compactdefaultargs") ProximityDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the computed distance.
") ProximityDistance;
		double ProximityDistance();

		/****** BRepExtrema_ProximityDistTool::ProximityPoints ******/
		/****** md5 signature: 54701e724238367b6b602dfb87695880 ******/
		%feature("compactdefaultargs") ProximityPoints;
		%feature("autodoc", "
Parameters
----------
thePoint1: BVH_Vec3d
thePoint2: BVH_Vec3d

Return
-------
None

Description
-----------
Returns points on triangles sets, which provide the proximity distance.
") ProximityPoints;
		void ProximityPoints(BVH_Vec3d & thePoint1, BVH_Vec3d & thePoint2);

		/****** BRepExtrema_ProximityDistTool::ProximityPointsStatus ******/
		/****** md5 signature: cbb67aeda5a68bd79cbb58089638d3f8 ******/
		%feature("compactdefaultargs") ProximityPointsStatus;
		%feature("autodoc", "
Parameters
----------
thePointStatus1: ProxPnt_Status
thePointStatus2: ProxPnt_Status

Return
-------
None

Description
-----------
Returns status of points on triangles sets, which provide the proximity distance.
") ProximityPointsStatus;
		void ProximityPointsStatus(ProxPnt_Status thePointStatus1, ProxPnt_Status thePointStatus2);

		/****** BRepExtrema_ProximityDistTool::RejectNode ******/
		/****** md5 signature: 1c3665c6e1b0c7b8692c69debd418dd6 ******/
		%feature("compactdefaultargs") RejectNode;
		%feature("autodoc", "
Parameters
----------
theCornerMin: BVH_Vec3d
theCornerMax: BVH_Vec3d

Return
-------
theMetric: double

Description
-----------
Defines the rules for node rejection by bounding box.
") RejectNode;
		bool RejectNode(const BVH_Vec3d & theCornerMin, const BVH_Vec3d & theCornerMax, Standard_Real &OutValue);

};


%extend BRepExtrema_ProximityDistTool {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def LoadAdditionalPointsFirstSet(self):
		pass
	}
};

/***********************************
* class BRepExtrema_ShapeProximity *
***********************************/
class BRepExtrema_ShapeProximity {
	public:
		/****** BRepExtrema_ShapeProximity::BRepExtrema_ShapeProximity ******/
		/****** md5 signature: 8f9bb40434ea5bc110eab5a1ebcaba1a ******/
		%feature("compactdefaultargs") BRepExtrema_ShapeProximity;
		%feature("autodoc", "
Parameters
----------
theTolerance: double (optional, default to Precision::Infinite())

Return
-------
None

Description
-----------
Creates empty proximity tool.
") BRepExtrema_ShapeProximity;
		 BRepExtrema_ShapeProximity(const double theTolerance = Precision::Infinite());

		/****** BRepExtrema_ShapeProximity::BRepExtrema_ShapeProximity ******/
		/****** md5 signature: cd34a5227726f21118024807660a7ec2 ******/
		%feature("compactdefaultargs") BRepExtrema_ShapeProximity;
		%feature("autodoc", "
Parameters
----------
theShape1: TopoDS_Shape
theShape2: TopoDS_Shape
theTolerance: double (optional, default to Precision::Infinite())

Return
-------
None

Description
-----------
Creates proximity tool for the given two shapes.
") BRepExtrema_ShapeProximity;
		 BRepExtrema_ShapeProximity(const TopoDS_Shape & theShape1, const TopoDS_Shape & theShape2, const double theTolerance = Precision::Infinite());

		/****** BRepExtrema_ShapeProximity::ElementSet1 ******/
		/****** md5 signature: f5328b7099eceb0eda7e749d56fd8afa ******/
		%feature("compactdefaultargs") ElementSet1;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepExtrema_TriangleSet>

Description
-----------
Returns set of all the face triangles of the 1st shape.
") ElementSet1;
		const opencascade::handle<BRepExtrema_TriangleSet> & ElementSet1();

		/****** BRepExtrema_ShapeProximity::ElementSet2 ******/
		/****** md5 signature: e2ee7df49652a0d3ac07499a44f9b24b ******/
		%feature("compactdefaultargs") ElementSet2;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepExtrema_TriangleSet>

Description
-----------
Returns set of all the face triangles of the 2nd shape.
") ElementSet2;
		const opencascade::handle<BRepExtrema_TriangleSet> & ElementSet2();

		/****** BRepExtrema_ShapeProximity::GetSubShape1 ******/
		/****** md5 signature: 26d9bc8bf3ad3380e7ad0d0b4894a7c8 ******/
		%feature("compactdefaultargs") GetSubShape1;
		%feature("autodoc", "
Parameters
----------
theID: int

Return
-------
TopoDS_Shape

Description
-----------
Returns sub-shape from 1st shape with the given index (started from 0).
") GetSubShape1;
		const TopoDS_Shape GetSubShape1(const int theID);

		/****** BRepExtrema_ShapeProximity::GetSubShape2 ******/
		/****** md5 signature: 14d4e0b4a80a3c1418d732f1b1b92a14 ******/
		%feature("compactdefaultargs") GetSubShape2;
		%feature("autodoc", "
Parameters
----------
theID: int

Return
-------
TopoDS_Shape

Description
-----------
Returns sub-shape from 1st shape with the given index (started from 0).
") GetSubShape2;
		const TopoDS_Shape GetSubShape2(const int theID);

		/****** BRepExtrema_ShapeProximity::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the search is completed.
") IsDone;
		bool IsDone();

		/****** BRepExtrema_ShapeProximity::LoadShape1 ******/
		/****** md5 signature: 5b4dc4c355020d24c714c32112f9b454 ******/
		%feature("compactdefaultargs") LoadShape1;
		%feature("autodoc", "
Parameters
----------
theShape1: TopoDS_Shape

Return
-------
bool

Description
-----------
Loads 1st shape into proximity tool.
") LoadShape1;
		bool LoadShape1(const TopoDS_Shape & theShape1);

		/****** BRepExtrema_ShapeProximity::LoadShape2 ******/
		/****** md5 signature: c036b63fa4a9907cd26b35618a26b8de ******/
		%feature("compactdefaultargs") LoadShape2;
		%feature("autodoc", "
Parameters
----------
theShape2: TopoDS_Shape

Return
-------
bool

Description
-----------
Loads 2nd shape into proximity tool.
") LoadShape2;
		bool LoadShape2(const TopoDS_Shape & theShape2);

		/****** BRepExtrema_ShapeProximity::OverlapSubShapes1 ******/
		/****** md5 signature: ddfa995c82a5309bbbdd3797b8941327 ******/
		%feature("compactdefaultargs") OverlapSubShapes1;
		%feature("autodoc", "Return
-------
NCollection_DataMap<int, TColStd_PackedMapOfInteger>

Description
-----------
Returns set of IDs of overlapped faces of 1st shape (started from 0).
") OverlapSubShapes1;
		const NCollection_DataMap<int, TColStd_PackedMapOfInteger> & OverlapSubShapes1();

		/****** BRepExtrema_ShapeProximity::OverlapSubShapes2 ******/
		/****** md5 signature: b65acab9a7109f5acf0a6ff3b5f91e05 ******/
		%feature("compactdefaultargs") OverlapSubShapes2;
		%feature("autodoc", "Return
-------
NCollection_DataMap<int, TColStd_PackedMapOfInteger>

Description
-----------
Returns set of IDs of overlapped faces of 2nd shape (started from 0).
") OverlapSubShapes2;
		const NCollection_DataMap<int, TColStd_PackedMapOfInteger> & OverlapSubShapes2();

		/****** BRepExtrema_ShapeProximity::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs search of overlapped faces.
") Perform;
		void Perform();

		/****** BRepExtrema_ShapeProximity::ProxPntStatus1 ******/
		/****** md5 signature: 5b5a621c79fd72dfa7174da351c8990f ******/
		%feature("compactdefaultargs") ProxPntStatus1;
		%feature("autodoc", "Return
-------
ProxPnt_Status

Description
-----------
Returns the status of point on the 1st shape, which could be used as a reference point for the value of the proximity.
") ProxPntStatus1;
		const ProxPnt_Status  ProxPntStatus1();

		/****** BRepExtrema_ShapeProximity::ProxPntStatus2 ******/
		/****** md5 signature: 5f8c6ad089fa3dc1014ee2eaced6a8ee ******/
		%feature("compactdefaultargs") ProxPntStatus2;
		%feature("autodoc", "Return
-------
ProxPnt_Status

Description
-----------
Returns the status of point on the 2nd shape, which could be used as a reference point for the value of the proximity.
") ProxPntStatus2;
		const ProxPnt_Status  ProxPntStatus2();

		/****** BRepExtrema_ShapeProximity::Proximity ******/
		/****** md5 signature: 8d5b67a91339e4723d9f46e2f21ac2f2 ******/
		%feature("compactdefaultargs") Proximity;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns proximity value calculated for the whole input shapes.
") Proximity;
		double Proximity();

		/****** BRepExtrema_ShapeProximity::ProximityPoint1 ******/
		/****** md5 signature: 7b89ebcbe2c3263efa38d81948de688a ******/
		%feature("compactdefaultargs") ProximityPoint1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the 1st shape, which could be used as a reference point for the value of the proximity.
") ProximityPoint1;
		const gp_Pnt ProximityPoint1();

		/****** BRepExtrema_ShapeProximity::ProximityPoint2 ******/
		/****** md5 signature: 694a8c2b488abd3573c6ab1ad209c1ff ******/
		%feature("compactdefaultargs") ProximityPoint2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the 2nd shape, which could be used as a reference point for the value of the proximity.
") ProximityPoint2;
		const gp_Pnt ProximityPoint2();

		/****** BRepExtrema_ShapeProximity::SetNbSamples1 ******/
		/****** md5 signature: c6dd01806e10367797b54638f272af12 ******/
		%feature("compactdefaultargs") SetNbSamples1;
		%feature("autodoc", "
Parameters
----------
theNbSamples: int

Return
-------
None

Description
-----------
Set number of sample points on the 1st shape used to compute the proximity value. In case of 0, all triangulation nodes will be used.
") SetNbSamples1;
		void SetNbSamples1(const int theNbSamples);

		/****** BRepExtrema_ShapeProximity::SetNbSamples2 ******/
		/****** md5 signature: 49512f0a90d4dbb277415e0fd72fde03 ******/
		%feature("compactdefaultargs") SetNbSamples2;
		%feature("autodoc", "
Parameters
----------
theNbSamples: int

Return
-------
None

Description
-----------
Set number of sample points on the 2nd shape used to compute the proximity value. In case of 0, all triangulation nodes will be used.
") SetNbSamples2;
		void SetNbSamples2(const int theNbSamples);

		/****** BRepExtrema_ShapeProximity::SetTolerance ******/
		/****** md5 signature: de1d8196b7a6b9be7e63e964a0a3482e ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: double

Return
-------
None

Description
-----------
Sets tolerance value for overlap test (distance between shapes).
") SetTolerance;
		void SetTolerance(const double theTolerance);

		/****** BRepExtrema_ShapeProximity::Tolerance ******/
		/****** md5 signature: 0f371f25723fe3719d8c637d644b341d ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns tolerance value for overlap test (distance between shapes).
") Tolerance;
		double Tolerance();

};


%extend BRepExtrema_ShapeProximity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepExtrema_SolutionElem *
*********************************/
class BRepExtrema_SolutionElem {
	public:
		/****** BRepExtrema_SolutionElem::BRepExtrema_SolutionElem ******/
		/****** md5 signature: b1847c030d573d5fa6dbdfd7597b2246 ******/
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem();

		/****** BRepExtrema_SolutionElem::BRepExtrema_SolutionElem ******/
		/****** md5 signature: dbf1336abebb61797c557e54d7371307 ******/
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "
Parameters
----------
theDist: double
thePoint: gp_Pnt
theSolType: BRepExtrema_SupportType
theVertex: TopoDS_Vertex

Return
-------
None

Description
-----------
This constructor is used when the solution of a distance is a Vertex. The different initialized fields are: 
Parameter theDist the distance 
Parameter thePoint the solution point 
Parameter theSolType the type of solution 
Parameter theVertex and the Vertex.
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem(const double theDist, const gp_Pnt & thePoint, const BRepExtrema_SupportType theSolType, const TopoDS_Vertex & theVertex);

		/****** BRepExtrema_SolutionElem::BRepExtrema_SolutionElem ******/
		/****** md5 signature: 7b038236fb6d66e114d43a705e0f202e ******/
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "
Parameters
----------
theDist: double
thePoint: gp_Pnt
theSolType: BRepExtrema_SupportType
theEdge: TopoDS_Edge
theParam: double

Return
-------
None

Description
-----------
This constructor is used when the solution of distance is on an Edge. The different initialized fields are: 
Parameter theDist the distance 
Parameter thePoint the solution point 
Parameter theSolType the type of solution 
Parameter theEdge the Edge 
Parameter theParam the parameter to locate the solution.
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem(const double theDist, const gp_Pnt & thePoint, const BRepExtrema_SupportType theSolType, const TopoDS_Edge & theEdge, const double theParam);

		/****** BRepExtrema_SolutionElem::BRepExtrema_SolutionElem ******/
		/****** md5 signature: 11783917c1739c0eb6d675eadf4c65a8 ******/
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "
Parameters
----------
theDist: double
thePoint: gp_Pnt
theSolType: BRepExtrema_SupportType
theFace: TopoDS_Face
theU: double
theV: double

Return
-------
None

Description
-----------
This constructor is used when the solution of distance is in a Face. The different initialized fields are: 
Parameter theDist the distance 
Parameter thePoint the solution point 
Parameter theSolType the type of solution 
Parameter theFace the Face 
Parameter theU U parameter to locate the solution 
Parameter theV V parameter to locate the solution.
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem(const double theDist, const gp_Pnt & thePoint, const BRepExtrema_SupportType theSolType, const TopoDS_Face & theFace, const double theU, const double theV);

		/****** BRepExtrema_SolutionElem::Dist ******/
		/****** md5 signature: 1bf6c4975f76c36133743a4daf03160e ******/
		%feature("compactdefaultargs") Dist;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the minimum distance.
") Dist;
		double Dist();

		/****** BRepExtrema_SolutionElem::Edge ******/
		/****** md5 signature: 657c12d9769667081fd960b688690cc0 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the vertex if the solution is an Edge.
") Edge;
		const TopoDS_Edge Edge();

		/****** BRepExtrema_SolutionElem::EdgeParameter ******/
		/****** md5 signature: 543e8b19712b45f42ddb985db0d7787c ******/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "
Parameters
----------

Return
-------
theParam: double

Description
-----------
Returns the parameter value if the solution is on Edge.
") EdgeParameter;
		void EdgeParameter(Standard_Real &OutValue);

		/****** BRepExtrema_SolutionElem::Face ******/
		/****** md5 signature: 95406b8d0d556c0537e0768c48713f21 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the vertex if the solution is an Face.
") Face;
		const TopoDS_Face Face();

		/****** BRepExtrema_SolutionElem::FaceParameter ******/
		/****** md5 signature: e4b4680bfb00ddc27bb0f71d9770cd57 ******/
		%feature("compactdefaultargs") FaceParameter;
		%feature("autodoc", "
Parameters
----------

Return
-------
theU: double
theV: double

Description
-----------
Returns the parameters U and V if the solution is in a Face.
") FaceParameter;
		void FaceParameter(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepExtrema_SolutionElem::Point ******/
		/****** md5 signature: 4e742d9ca138939180edee86d3b37a8f ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the solution point.
") Point;
		const gp_Pnt Point();

		/****** BRepExtrema_SolutionElem::SupportKind ******/
		/****** md5 signature: 078ef3765b64d7d1760ca2fcb79509bc ******/
		%feature("compactdefaultargs") SupportKind;
		%feature("autodoc", "Return
-------
BRepExtrema_SupportType

Description
-----------
Returns the Support type: IsVertex => The solution is a vertex. IsOnEdge => The solution belongs to an Edge. IsInFace => The solution is inside a Face.
") SupportKind;
		BRepExtrema_SupportType SupportKind();

		/****** BRepExtrema_SolutionElem::Vertex ******/
		/****** md5 signature: f6b9d30df043abdbae2c9dffcc672395 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the vertex if the solution is a Vertex.
") Vertex;
		const TopoDS_Vertex Vertex();

};


%extend BRepExtrema_SolutionElem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepExtrema_TriangleSet *
********************************/
class BRepExtrema_TriangleSet : public BVH_PrimitiveSet3d {
	public:
		/****** BRepExtrema_TriangleSet::BRepExtrema_TriangleSet ******/
		/****** md5 signature: c837909c9b9498946edb006a58e7df80 ******/
		%feature("compactdefaultargs") BRepExtrema_TriangleSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates empty triangle set.
") BRepExtrema_TriangleSet;
		 BRepExtrema_TriangleSet();

		/****** BRepExtrema_TriangleSet::BRepExtrema_TriangleSet ******/
		/****** md5 signature: f03b54e2ad99b1afef975e241b96aeb6 ******/
		%feature("compactdefaultargs") BRepExtrema_TriangleSet;
		%feature("autodoc", "
Parameters
----------
theFaces: NCollection_DynamicArray<TopoDS_Shape>

Return
-------
None

Description
-----------
Creates triangle set from the given face.
") BRepExtrema_TriangleSet;
		 BRepExtrema_TriangleSet(const NCollection_DynamicArray<TopoDS_Shape> & theFaces);

		/****** BRepExtrema_TriangleSet::Box ******/
		/****** md5 signature: c4a58a7b23b1d2f9be7f06a31f83343b ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BVH_Box<double, 3 >

Description
-----------
Returns AABB of the given triangle.
") Box;
		BVH_Box<double, 3 > Box(const int theIndex);

		/****** BRepExtrema_TriangleSet::Center ******/
		/****** md5 signature: e1de2d1f4b9b0e292d065694299e03dd ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theAxis: int

Return
-------
double

Description
-----------
Returns centroid position along specified axis.
") Center;
		double Center(const int theIndex, const int theAxis);

		/****** BRepExtrema_TriangleSet::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears triangle set data.
") Clear;
		void Clear();

		/****** BRepExtrema_TriangleSet::GetFaceID ******/
		/****** md5 signature: b63d2657e909345ac17d51b2b72e75f0 ******/
		%feature("compactdefaultargs") GetFaceID;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Returns face ID of the given triangle.
") GetFaceID;
		int GetFaceID(const int theIndex);

		/****** BRepExtrema_TriangleSet::GetShapeIDOfVtx ******/
		/****** md5 signature: 1b3bbe9a9dbce085b63a3da9b018f366 ******/
		%feature("compactdefaultargs") GetShapeIDOfVtx;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Returns shape ID of the given vertex index.
") GetShapeIDOfVtx;
		int GetShapeIDOfVtx(const int theIndex);

		/****** BRepExtrema_TriangleSet::GetTrgIdxInShape ******/
		/****** md5 signature: 790c53af393bba92fa2e82a130edbe85 ******/
		%feature("compactdefaultargs") GetTrgIdxInShape;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Returns triangle index (before swapping) in tringulation of the shape, which triangle belongs, with the given trg ID in whole set (after swapping).
") GetTrgIdxInShape;
		int GetTrgIdxInShape(const int theIndex);

		/****** BRepExtrema_TriangleSet::GetVertices ******/
		/****** md5 signature: 6895166cb2c145e3ff7ace9664551209 ******/
		%feature("compactdefaultargs") GetVertices;
		%feature("autodoc", "Return
-------
BVH_Array3d

Description
-----------
Returns all vertices.
") GetVertices;
		const BVH_Array3d & GetVertices();

		/****** BRepExtrema_TriangleSet::GetVertices ******/
		/****** md5 signature: 748682425107e58c2626024d74118d70 ******/
		%feature("compactdefaultargs") GetVertices;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theVertex1: BVH_Vec3d
theVertex2: BVH_Vec3d
theVertex3: BVH_Vec3d

Return
-------
None

Description
-----------
Returns vertices of the given triangle.
") GetVertices;
		void GetVertices(const int theIndex, BVH_Vec3d & theVertex1, BVH_Vec3d & theVertex2, BVH_Vec3d & theVertex3);

		/****** BRepExtrema_TriangleSet::GetVtxIdxInShape ******/
		/****** md5 signature: 82b6cf150bcbec38bb994febafada940 ******/
		%feature("compactdefaultargs") GetVtxIdxInShape;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Returns vertex index in tringulation of the shape, which vertex belongs, with the given vtx ID in whole set.
") GetVtxIdxInShape;
		int GetVtxIdxInShape(const int theIndex);

		/****** BRepExtrema_TriangleSet::GetVtxIndices ******/
		/****** md5 signature: 2f27cf915fc45cae7156d495d445527e ******/
		%feature("compactdefaultargs") GetVtxIndices;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theVtxIndices: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Returns vertex indices of the given triangle.
") GetVtxIndices;
		void GetVtxIndices(const int theIndex, TColStd_Array1OfInteger & theVtxIndices);

		/****** BRepExtrema_TriangleSet::Init ******/
		/****** md5 signature: 65684ddd634da51819aa678ddea0100b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theShapes: NCollection_DynamicArray<TopoDS_Shape>

Return
-------
bool

Description
-----------
Initializes triangle set.
") Init;
		bool Init(const NCollection_DynamicArray<TopoDS_Shape> & theShapes);

		/****** BRepExtrema_TriangleSet::Size ******/
		/****** md5 signature: 1813690848b6a5332bd4875ba3d8d381 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns total number of triangles.
") Size;
		int Size();

		/****** BRepExtrema_TriangleSet::Swap ******/
		/****** md5 signature: 457a7645599fd5a96086a4098d4e94c5 ******/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "
Parameters
----------
theIndex1: int
theIndex2: int

Return
-------
None

Description
-----------
Swaps indices of two specified triangles.
") Swap;
		void Swap(const int theIndex1, const int theIndex2);

};


%make_alias(BRepExtrema_TriangleSet)

%extend BRepExtrema_TriangleSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepExtrema_SelfIntersection *
*************************************/
class BRepExtrema_SelfIntersection : public BRepExtrema_ElementFilter {
	public:
		/****** BRepExtrema_SelfIntersection::BRepExtrema_SelfIntersection ******/
		/****** md5 signature: b26a6d44b5fb895e49b176b3c93780bb ******/
		%feature("compactdefaultargs") BRepExtrema_SelfIntersection;
		%feature("autodoc", "
Parameters
----------
theTolerance: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Creates uninitialized self-intersection tool.
") BRepExtrema_SelfIntersection;
		 BRepExtrema_SelfIntersection(const double theTolerance = 0.0);

		/****** BRepExtrema_SelfIntersection::BRepExtrema_SelfIntersection ******/
		/****** md5 signature: 201431672d85eea904bb0d7973a5edec ******/
		%feature("compactdefaultargs") BRepExtrema_SelfIntersection;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theTolerance: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Creates self-intersection tool for the given shape.
") BRepExtrema_SelfIntersection;
		 BRepExtrema_SelfIntersection(const TopoDS_Shape & theShape, const double theTolerance = 0.0);

		/****** BRepExtrema_SelfIntersection::ElementSet ******/
		/****** md5 signature: 7eda4cbdd51c64f2d775e378bb0a6592 ******/
		%feature("compactdefaultargs") ElementSet;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepExtrema_TriangleSet>

Description
-----------
Returns set of all the face triangles of the shape.
") ElementSet;
		const opencascade::handle<BRepExtrema_TriangleSet> & ElementSet();

		/****** BRepExtrema_SelfIntersection::GetSubShape ******/
		/****** md5 signature: 920633e9e6f6224a451645c3e13f79bf ******/
		%feature("compactdefaultargs") GetSubShape;
		%feature("autodoc", "
Parameters
----------
theID: int

Return
-------
TopoDS_Face

Description
-----------
Returns sub-shape from the shape for the given index (started from 0).
") GetSubShape;
		const TopoDS_Face GetSubShape(const int theID);

		/****** BRepExtrema_SelfIntersection::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the detection is completed.
") IsDone;
		bool IsDone();

		/****** BRepExtrema_SelfIntersection::LoadShape ******/
		/****** md5 signature: 742c69dc305a1b6f40ee3f5a222c0012 ******/
		%feature("compactdefaultargs") LoadShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Loads shape for detection of self-intersections.
") LoadShape;
		bool LoadShape(const TopoDS_Shape & theShape);

		/****** BRepExtrema_SelfIntersection::OverlapElements ******/
		/****** md5 signature: abc4498b816796b12d5a869c2bc96e34 ******/
		%feature("compactdefaultargs") OverlapElements;
		%feature("autodoc", "Return
-------
NCollection_DataMap<int, TColStd_PackedMapOfInteger>

Description
-----------
Returns set of IDs of overlapped sub-shapes (started from 0).
") OverlapElements;
		const NCollection_DataMap<int, TColStd_PackedMapOfInteger> & OverlapElements();

		/****** BRepExtrema_SelfIntersection::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs detection of self-intersections.
") Perform;
		void Perform();

		/****** BRepExtrema_SelfIntersection::SetTolerance ******/
		/****** md5 signature: de1d8196b7a6b9be7e63e964a0a3482e ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: double

Return
-------
None

Description
-----------
Sets tolerance value used for self-intersection test.
") SetTolerance;
		void SetTolerance(const double theTolerance);

		/****** BRepExtrema_SelfIntersection::Tolerance ******/
		/****** md5 signature: 0f371f25723fe3719d8c637d644b341d ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns tolerance value used for self-intersection test.
") Tolerance;
		double Tolerance();

};


%extend BRepExtrema_SelfIntersection {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def OverlapTriangles(self):
		pass
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BRepExtrema_OverlapTool:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def BRepExtrema_Poly_Distance(*args):
	return BRepExtrema_Poly.Distance(*args)

@deprecated
def BRepExtrema_ProximityDistTool_IsEdgeOnBorder(*args):
	return BRepExtrema_ProximityDistTool.IsEdgeOnBorder(*args)

@deprecated
def BRepExtrema_ProximityDistTool_IsNodeOnBorder(*args):
	return BRepExtrema_ProximityDistTool.IsNodeOnBorder(*args)

}
