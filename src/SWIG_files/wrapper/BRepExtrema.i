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
%define BREPEXTREMADOCSTRING
"BRepExtrema module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_brepextrema.html"
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
%template(BRepExtrema_MapOfIntegerPackedMapOfInteger) NCollection_DataMap<Standard_Integer,TColStd_PackedMapOfInteger>;

%extend NCollection_DataMap<Standard_Integer,TColStd_PackedMapOfInteger> {
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
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(BRepExtrema_ShapeList) NCollection_Vector<TopoDS_Shape>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<Standard_Integer, TColStd_PackedMapOfInteger> BRepExtrema_MapOfIntegerPackedMapOfInteger;
typedef NCollection_Sequence<BRepExtrema_SolutionElem> BRepExtrema_SeqOfSolution;
typedef NCollection_Vector<TopoDS_Shape> BRepExtrema_ShapeList;
/* end typedefs declaration */

/***********************************
* class BRepExtrema_DistShapeShape *
***********************************/
class BRepExtrema_DistShapeShape {
	public:
		/****************** BRepExtrema_DistShapeShape ******************/
		/**** md5 signature: 7db35b07b02f16eafa8b496ba9a55793 ****/
		%feature("compactdefaultargs") BRepExtrema_DistShapeShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create empty tool.
") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape();

		/****************** BRepExtrema_DistShapeShape ******************/
		/**** md5 signature: fb63ccf57bfd5b8006463aca52b50b43 ****/
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
Create tool and computation of the minimum distance (value and pair of points) using default deflection in single thread mode. default deflection value is precision::confusion(). @param shape1 - the first shape for distance computation @param shape2 - the second shape for distance computation @param f and @param a are not used in computation and are obsolete. @param therange - the progress indicator of algorithm.
") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape(const TopoDS_Shape & Shape1, const TopoDS_Shape & Shape2, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** BRepExtrema_DistShapeShape ******************/
		/**** md5 signature: 23775d8af1aa9dd27bd9eeda417a5eb6 ****/
		%feature("compactdefaultargs") BRepExtrema_DistShapeShape;
		%feature("autodoc", "
Parameters
----------
Shape1: TopoDS_Shape
Shape2: TopoDS_Shape
theDeflection: float
F: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
A: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Create tool and computation of the minimum distance (value and pair of points) in single thread mode. default deflection value is precision::confusion(). @param shape1 - the first shape for distance computation @param shape2 - the second shape for distance computation @param thedeflection - the presition of distance computation @param f and @param a are not used in computation and are obsolete. @param therange - the progress indicator of algorithm.
") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape(const TopoDS_Shape & Shape1, const TopoDS_Shape & Shape2, const Standard_Real theDeflection, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** Dump ******************/
		/**** md5 signature: d37b43e0b2386dc096d5d707876db157 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Prints on the stream o information on the current state of the object. .
") Dump;
		void Dump(std::ostream &OutValue);

		/****************** InnerSolution ******************/
		/**** md5 signature: c2076c783e4f1c4305057f88c3c68086 ****/
		%feature("compactdefaultargs") InnerSolution;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if one of the shapes is a solid and the other shape is completely or partially inside the solid. .
") InnerSolution;
		Standard_Boolean InnerSolution();

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the minimum distance is found. .
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMultiThread ******************/
		/**** md5 signature: 08be58fd82e87eae912617f53af96d42 ****/
		%feature("compactdefaultargs") IsMultiThread;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns standard_true then computation will be performed in parallel default value is standard_false.
") IsMultiThread;
		Standard_Boolean IsMultiThread();

		/****************** LoadS1 ******************/
		/**** md5 signature: 7408ca5426be01fa3948ad765f9b1d2b ****/
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
Load first shape into extrema .
") LoadS1;
		void LoadS1(const TopoDS_Shape & Shape1);

		/****************** LoadS2 ******************/
		/**** md5 signature: 3b40248cbf67bbe15af62d523554bf15 ****/
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
Load second shape into extrema .
") LoadS2;
		void LoadS2(const TopoDS_Shape & Shape1);

		/****************** NbSolution ******************/
		/**** md5 signature: 69ebe2fff65cc6ae065919ee69973470 ****/
		%feature("compactdefaultargs") NbSolution;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of solutions satisfying the minimum distance. .
") NbSolution;
		Standard_Integer NbSolution();

		/****************** ParOnEdgeS1 ******************/
		/**** md5 signature: afb7f68aca62bff04cd6998990b30f1f ****/
		%feature("compactdefaultargs") ParOnEdgeS1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
t: float

Description
-----------
Gives the corresponding parameter t if the nth solution is situated on an edge of the first shape .
") ParOnEdgeS1;
		void ParOnEdgeS1(const Standard_Integer N, Standard_Real &OutValue);

		/****************** ParOnEdgeS2 ******************/
		/**** md5 signature: 4d4566624bf7e1ee75387e3cf5ccea3f ****/
		%feature("compactdefaultargs") ParOnEdgeS2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
t: float

Description
-----------
Gives the corresponding parameter t if the nth solution is situated on an edge of the first shape .
") ParOnEdgeS2;
		void ParOnEdgeS2(const Standard_Integer N, Standard_Real &OutValue);

		/****************** ParOnFaceS1 ******************/
		/**** md5 signature: e9a4cf66ddad2a301281fbccd9d64530 ****/
		%feature("compactdefaultargs") ParOnFaceS1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
u: float
v: float

Description
-----------
Gives the corresponding parameters (u,v) if the nth solution is situated on an face of the first shape .
") ParOnFaceS1;
		void ParOnFaceS1(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParOnFaceS2 ******************/
		/**** md5 signature: 9d0355118b8cc8a3c8b3a22b0070eeef ****/
		%feature("compactdefaultargs") ParOnFaceS2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
u: float
v: float

Description
-----------
Gives the corresponding parameters (u,v) if the nth solution is situated on an face of the second shape .
") ParOnFaceS2;
		void ParOnFaceS2(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: 5319bf8ef7123f90bd8ce53457a93026 ****/
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
Computation of the minimum distance (value and  couple of points). parameter thedeflection is used  to specify a maximum deviation of extreme distances  from the minimum one.  returns isdone status. therange - the progress indicator of algorithm.
") Perform;
		Standard_Boolean Perform(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** PointOnShape1 ******************/
		/**** md5 signature: aa31e70d94110b0eb2d311dc4396c549 ****/
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
Returns the point corresponding to the <n>th solution on the first shape .
") PointOnShape1;
		const gp_Pnt PointOnShape1(const Standard_Integer N);

		/****************** PointOnShape2 ******************/
		/**** md5 signature: 0f8ff2bc21fd8c668ed617d92a32b6a6 ****/
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
Returns the point corresponding to the <n>th solution on the second shape .
") PointOnShape2;
		const gp_Pnt PointOnShape2(const Standard_Integer N);

		/****************** SetAlgo ******************/
		/**** md5 signature: cad6f54c64a4b69da22bb042d2e4fe8a ****/
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
Sets unused parameter obsolete .
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****************** SetDeflection ******************/
		/**** md5 signature: ef17e8202a75f8963ebbbf02897eb710 ****/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "
Parameters
----------
theDeflection: float

Return
-------
None

Description
-----------
Sets deflection to computation of the minimum distance .
") SetDeflection;
		void SetDeflection(const Standard_Real theDeflection);

		/****************** SetFlag ******************/
		/**** md5 signature: 7ce767aa4373b85a8cea83f409a2ebfb ****/
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
Sets unused parameter obsolete .
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

		/****************** SetMultiThread ******************/
		/**** md5 signature: 3237c51f1bfac929cf9e320d71541b3b ****/
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
If ismultithread == standard_true then computation will be performed in parallel.
") SetMultiThread;
		void SetMultiThread(Standard_Boolean theIsMultiThread);

		/****************** SupportOnShape1 ******************/
		/**** md5 signature: ec03df7c72ee60180aae731839ed29e5 ****/
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
Gives the support where the nth solution on the first shape is situated. this support can be a vertex, an edge or a face. .
") SupportOnShape1;
		TopoDS_Shape SupportOnShape1(const Standard_Integer N);

		/****************** SupportOnShape2 ******************/
		/**** md5 signature: 5ae538fab82518e2a60395aa1afe995a ****/
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
Gives the support where the nth solution on the second shape is situated. this support can be a vertex, an edge or a face. .
") SupportOnShape2;
		TopoDS_Shape SupportOnShape2(const Standard_Integer N);

		/****************** SupportTypeShape1 ******************/
		/**** md5 signature: 0b4baacce2f902c0aa135d1e7af4ab5e ****/
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
Gives the type of the support where the nth solution on the first shape is situated: isvertex => the nth solution on the first shape is a vertex isonedge => the nth soluion on the first shape is on a edge isinface => the nth solution on the first shape is inside a face the corresponding support is obtained by the method supportonshape1 .
") SupportTypeShape1;
		BRepExtrema_SupportType SupportTypeShape1(const Standard_Integer N);

		/****************** SupportTypeShape2 ******************/
		/**** md5 signature: 038fff84390f528e52f9203e7f8d1ef4 ****/
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
Gives the type of the support where the nth solution on the second shape is situated: isvertex => the nth solution on the second shape is a vertex isonedge => the nth soluion on the secondt shape is on a edge isinface => the nth solution on the second shape is inside a face the corresponding support is obtained by the method supportonshape2 .
") SupportTypeShape2;
		BRepExtrema_SupportType SupportTypeShape2(const Standard_Integer N);

		/****************** Value ******************/
		/**** md5 signature: 52655a2fb6642856b2c68a9331826787 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the minimum distance. .
") Value;
		Standard_Real Value();

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
		/****************** BRepExtrema_DistanceSS ******************/
		/**** md5 signature: 990d62108850fe2e8efc715b0327cf72 ****/
		%feature("compactdefaultargs") BRepExtrema_DistanceSS;
		%feature("autodoc", "
Parameters
----------
theS1: TopoDS_Shape
theS2: TopoDS_Shape
theBox1: Bnd_Box
theBox2: Bnd_Box
theDstRef: float
theDeflection: float (optional, default to Precision::Confusion())
theExtFlag: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
theExtAlgo: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
Computes the distance between two shapes (face edge vertex). @param thes1 - first shape @param thes2 - second shape @param thebox1 - bounding box of first shape @param thebox2 - bounding box of second shape @param thedstref - initial distance between the shapes to start with @param thedeflection - maximum deviation of extreme distances from the minimum one (default is precision::confusion()). @param theextflag - specifies which extrema solutions to look for (default is minmax, applied only to point-face extrema) @param theextalgo - specifies which extrema algorithm is to be used (default is grad algo, applied only to point-face extrema).
") BRepExtrema_DistanceSS;
		 BRepExtrema_DistanceSS(const TopoDS_Shape & theS1, const TopoDS_Shape & theS2, const Bnd_Box & theBox1, const Bnd_Box & theBox2, const Standard_Real theDstRef, const Standard_Real theDeflection = Precision::Confusion(), const Extrema_ExtFlag theExtFlag = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo theExtAlgo = Extrema_ExtAlgo_Grad);

		/****************** DistValue ******************/
		/**** md5 signature: 67516fa96bcaeb61c2a5da2a5ca3b852 ****/
		%feature("compactdefaultargs") DistValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the distance value.
") DistValue;
		Standard_Real DistValue();

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the distance has been computed, false otherwise.
") IsDone;
		Standard_Boolean IsDone();

		/****************** Seq1Value ******************/
		/**** md5 signature: ce2418343fae9ea2a5448ab18333e3bf ****/
		%feature("compactdefaultargs") Seq1Value;
		%feature("autodoc", "Return
-------
BRepExtrema_SeqOfSolution

Description
-----------
Returns the list of solutions on the first shape.
") Seq1Value;
		const BRepExtrema_SeqOfSolution & Seq1Value();

		/****************** Seq2Value ******************/
		/**** md5 signature: 9e0d543064a1ba8b316c893c878533f4 ****/
		%feature("compactdefaultargs") Seq2Value;
		%feature("autodoc", "Return
-------
BRepExtrema_SeqOfSolution

Description
-----------
Returns the list of solutions on the second shape.
") Seq2Value;
		const BRepExtrema_SeqOfSolution & Seq2Value();

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

		/****************** PreCheckElements ******************/
		/**** md5 signature: 1c8fc782390654d40badc34a2b0b8ab0 ****/
		%feature("compactdefaultargs") PreCheckElements;
		%feature("autodoc", "
Parameters
----------
Standard_Integer: 
Standard_Integer: 

Return
-------
BRepExtrema_ElementFilter::FilterResult

Description
-----------
Checks if two mesh elements should be tested for overlapping/intersection (used for detection correct/incorrect cases of shared edges and vertices).
") PreCheckElements;
		virtual BRepExtrema_ElementFilter::FilterResult PreCheckElements(const Standard_Integer, const Standard_Integer);

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
		/****************** BRepExtrema_ExtCC ******************/
		/**** md5 signature: 7e35ce50b3a79f26d0e456e259852e75 ****/
		%feature("compactdefaultargs") BRepExtrema_ExtCC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepExtrema_ExtCC;
		 BRepExtrema_ExtCC();

		/****************** BRepExtrema_ExtCC ******************/
		/**** md5 signature: 21fcfba4a98ca2696fdd04abc944df8d ****/
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
It calculates all the distances. .
") BRepExtrema_ExtCC;
		 BRepExtrema_ExtCC(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****************** Initialize ******************/
		/**** md5 signature: c89b77664746a64b0d7d6a1d193b3d58 ****/
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

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found. .
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 1a61f067818333b9699057e51665b906 ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if e1 and e2 are parallel. .
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		/**** md5 signature: 5a5d42851c4a5f73b150985c361524ae ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances. .
") NbExt;
		Standard_Integer NbExt();

		/****************** ParameterOnE1 ******************/
		/**** md5 signature: 7cd5e9a46a0df5cc207b6b3fab147d6f ****/
		%feature("compactdefaultargs") ParameterOnE1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the parameter on the first edge of the <n>th extremum distance. .
") ParameterOnE1;
		Standard_Real ParameterOnE1(const Standard_Integer N);

		/****************** ParameterOnE2 ******************/
		/**** md5 signature: 6e63de9677713c8464fd20b1eedca902 ****/
		%feature("compactdefaultargs") ParameterOnE2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the parameter on the second edge of the <n>th extremum distance. .
") ParameterOnE2;
		Standard_Real ParameterOnE2(const Standard_Integer N);

		/****************** Perform ******************/
		/**** md5 signature: f7179778f701b048ae69059d84e58974 ****/
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
An exception is raised if the fields have not been initialized. .
") Perform;
		void Perform(const TopoDS_Edge & E1);

		/****************** PointOnE1 ******************/
		/**** md5 signature: 466ab7ad202dd5c3aa0008d57c2de183 ****/
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
Returns the point of the <n>th extremum distance on the edge e1. .
") PointOnE1;
		gp_Pnt PointOnE1(const Standard_Integer N);

		/****************** PointOnE2 ******************/
		/**** md5 signature: fcf209840f22ac0e18c183b2e534bb8b ****/
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
Returns the point of the <n>th extremum distance on the edge e2. .
") PointOnE2;
		gp_Pnt PointOnE2(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 84f99c4c6de2197ef464c1aadcb7580e ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the <n>th extremum square distance. .
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		/**** md5 signature: 4e321915bc6b3619a20bb8a4fec39fce ****/
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
dist11: float
distP12: float
distP21: float
distP22: float

Description
-----------
If the edges is a trimmed curve, dist11 is a square distance between the point on e1 of parameter firstparameter and the point of parameter firstparameter on e2. .
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
		/****************** BRepExtrema_ExtCF ******************/
		/**** md5 signature: 9c886b088d845caa22a1107cfe5a0ff6 ****/
		%feature("compactdefaultargs") BRepExtrema_ExtCF;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepExtrema_ExtCF;
		 BRepExtrema_ExtCF();

		/****************** BRepExtrema_ExtCF ******************/
		/**** md5 signature: 16020da834cdf79577c7d512faaaae03 ****/
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
It calculates all the distances. .
") BRepExtrema_ExtCF;
		 BRepExtrema_ExtCF(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Initialize ******************/
		/**** md5 signature: cf258179577adbc75b4efbc5847934f6 ****/
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

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found. .
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 1a61f067818333b9699057e51665b906 ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the curve is on a parallel surface. .
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		/**** md5 signature: 5a5d42851c4a5f73b150985c361524ae ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances. .
") NbExt;
		Standard_Integer NbExt();

		/****************** ParameterOnEdge ******************/
		/**** md5 signature: 76a0a1f9b7fb5ec2017023399a9da861 ****/
		%feature("compactdefaultargs") ParameterOnEdge;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the parameters on the edge of the <n>th extremum distance. .
") ParameterOnEdge;
		Standard_Real ParameterOnEdge(const Standard_Integer N);

		/****************** ParameterOnFace ******************/
		/**** md5 signature: 791ddf842d14bc9cd39246b45e9b766e ****/
		%feature("compactdefaultargs") ParameterOnFace;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
U: float
V: float

Description
-----------
Returns the parameters on the face of the <n>th extremum distance. .
") ParameterOnFace;
		void ParameterOnFace(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: e2ae2dd62a61e8e392541e0c53f605ce ****/
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
An exception is raised if the fields have not been initialized. be careful: this method uses the face only for classify not for the fields. .
") Perform;
		void Perform(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** PointOnEdge ******************/
		/**** md5 signature: 6d64189e4537e032129d9312b9eb6263 ****/
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
Returns the point of the <n>th extremum distance. .
") PointOnEdge;
		gp_Pnt PointOnEdge(const Standard_Integer N);

		/****************** PointOnFace ******************/
		/**** md5 signature: 921e10384fe2543ffe77c7f9bda2de77 ****/
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
Returns the point of the <n>th extremum distance. .
") PointOnFace;
		gp_Pnt PointOnFace(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 84f99c4c6de2197ef464c1aadcb7580e ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the <n>th extremum square distance. .
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

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
		/****************** BRepExtrema_ExtFF ******************/
		/**** md5 signature: b136a0fce002315d921532e24a9581b2 ****/
		%feature("compactdefaultargs") BRepExtrema_ExtFF;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepExtrema_ExtFF;
		 BRepExtrema_ExtFF();

		/****************** BRepExtrema_ExtFF ******************/
		/**** md5 signature: 70b7a7554f1d0147af0991d67e7e29d2 ****/
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
It calculates all the distances. .
") BRepExtrema_ExtFF;
		 BRepExtrema_ExtFF(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** Initialize ******************/
		/**** md5 signature: 9cbae6cf246b55baed45100dd3ac1d25 ****/
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

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found. .
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 1a61f067818333b9699057e51665b906 ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the surfaces are parallel. .
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		/**** md5 signature: 5a5d42851c4a5f73b150985c361524ae ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances. .
") NbExt;
		Standard_Integer NbExt();

		/****************** ParameterOnFace1 ******************/
		/**** md5 signature: d7c60f4fb2661a9fdc0ee70663af522b ****/
		%feature("compactdefaultargs") ParameterOnFace1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
U: float
V: float

Description
-----------
Returns the parameters on the face f1 of the <n>th extremum distance. .
") ParameterOnFace1;
		void ParameterOnFace1(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParameterOnFace2 ******************/
		/**** md5 signature: f042c9bcc857cbeda7df4acc0988844e ****/
		%feature("compactdefaultargs") ParameterOnFace2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
U: float
V: float

Description
-----------
Returns the parameters on the face f2 of the <n>th extremum distance. .
") ParameterOnFace2;
		void ParameterOnFace2(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: 20b101b6609f56b4df981165ffc5760a ****/
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
An exception is raised if the fields have not been initialized. be careful: this method uses the face f2 only for classify, not for the fields. .
") Perform;
		void Perform(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** PointOnFace1 ******************/
		/**** md5 signature: 71044a562d7c935beafd57e5845e6288 ****/
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
Returns the point of the <n>th extremum distance. .
") PointOnFace1;
		gp_Pnt PointOnFace1(const Standard_Integer N);

		/****************** PointOnFace2 ******************/
		/**** md5 signature: 10275aa7fa44a810eda6023c45c85baa ****/
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
Returns the point of the <n>th extremum distance. .
") PointOnFace2;
		gp_Pnt PointOnFace2(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 84f99c4c6de2197ef464c1aadcb7580e ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the <n>th extremum square distance. .
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

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
		/****************** BRepExtrema_ExtPC ******************/
		/**** md5 signature: 7363107ba31731bcfd5377ab6afd269f ****/
		%feature("compactdefaultargs") BRepExtrema_ExtPC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepExtrema_ExtPC;
		 BRepExtrema_ExtPC();

		/****************** BRepExtrema_ExtPC ******************/
		/**** md5 signature: 77947b9170dd4391d353244f4f6218cc ****/
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
It calculates all the distances. .
") BRepExtrema_ExtPC;
		 BRepExtrema_ExtPC(const TopoDS_Vertex & V, const TopoDS_Edge & E);

		/****************** Initialize ******************/
		/**** md5 signature: b0b8cb0790e5e63c5a8b3b133b757731 ****/
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

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found. .
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: f1999d585543ddaf57e9197353e4f49c ****/
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
Returns true if the <n>th extremum distance is a minimum. .
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 5a5d42851c4a5f73b150985c361524ae ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances. .
") NbExt;
		Standard_Integer NbExt();

		/****************** Parameter ******************/
		/**** md5 signature: 1b2ac4d8f834bb1c7b0d2ed42b0a050c ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the parameter on the edge of the <n>th extremum distance. .
") Parameter;
		Standard_Real Parameter(const Standard_Integer N);

		/****************** Perform ******************/
		/**** md5 signature: f794a3745eea09bbd96f5aefe65dee12 ****/
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
An exception is raised if the fields have not been initialized. .
") Perform;
		void Perform(const TopoDS_Vertex & V);

		/****************** Point ******************/
		/**** md5 signature: d05a4ad43ced02adf85358c081d42318 ****/
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
Returns the point of the <n>th extremum distance. .
") Point;
		gp_Pnt Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 84f99c4c6de2197ef464c1aadcb7580e ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the <n>th extremum square distance. .
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		/**** md5 signature: 739eb38534e2c59aa37a147e06ae1d68 ****/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "
Parameters
----------
pnt1: gp_Pnt
pnt2: gp_Pnt

Return
-------
dist1: float
dist2: float

Description
-----------
If the curve is a trimmed curve, dist1 is a square distance between <p> and the point of parameter firstparameter <pnt1> and dist2 is a square distance between <p> and the point of parameter lastparameter <pnt2>. .
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
		/****************** BRepExtrema_ExtPF ******************/
		/**** md5 signature: 59679f7b84a26ede08f2011ca81a3d9a ****/
		%feature("compactdefaultargs") BRepExtrema_ExtPF;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepExtrema_ExtPF;
		 BRepExtrema_ExtPF();

		/****************** BRepExtrema_ExtPF ******************/
		/**** md5 signature: 9f029172528aafcb8c173bb3e47a6d64 ****/
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
It calculates all the distances. .
") BRepExtrema_ExtPF;
		 BRepExtrema_ExtPF(const TopoDS_Vertex & TheVertex, const TopoDS_Face & TheFace, const Extrema_ExtFlag TheFlag = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo TheAlgo = Extrema_ExtAlgo_Grad);

		/****************** Initialize ******************/
		/**** md5 signature: b186eacda6514ba3cf68a60d6462c860 ****/
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

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found. .
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		/**** md5 signature: 5a5d42851c4a5f73b150985c361524ae ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances. .
") NbExt;
		Standard_Integer NbExt();

		/****************** Parameter ******************/
		/**** md5 signature: ac3a14addcd496ddf44c121b63d7a1b0 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
U: float
V: float

Description
-----------
Returns the parameters on the face of the <n>th extremum distance. .
") Parameter;
		void Parameter(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: 8abaa691a7bf98cb37f090b7a876264b ****/
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
An exception is raised if the fields have not been initialized. be careful: this method uses the face only for classify not for the fields. .
") Perform;
		void Perform(const TopoDS_Vertex & TheVertex, const TopoDS_Face & TheFace);

		/****************** Point ******************/
		/**** md5 signature: d05a4ad43ced02adf85358c081d42318 ****/
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
Returns the point of the <n>th extremum distance. .
") Point;
		gp_Pnt Point(const Standard_Integer N);

		/****************** SetAlgo ******************/
		/**** md5 signature: cad6f54c64a4b69da22bb042d2e4fe8a ****/
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

		/****************** SetFlag ******************/
		/**** md5 signature: 7ce767aa4373b85a8cea83f409a2ebfb ****/
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

		/****************** SquareDistance ******************/
		/**** md5 signature: 84f99c4c6de2197ef464c1aadcb7580e ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the <n>th extremum square distance. .
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

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
		/****************** Distance ******************/
		/**** md5 signature: 3cdcfe9983fe73f7dd6f4609cda88011 ****/
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
dist: float

Description
-----------
Returns standard_true if ok.
") Distance;
		static Standard_Boolean Distance(const TopoDS_Shape & S1, const TopoDS_Shape & S2, gp_Pnt & P1, gp_Pnt & P2, Standard_Real &OutValue);

};


%extend BRepExtrema_Poly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepExtrema_ProximityDistTool *
**************************************/
class BRepExtrema_ProximityDistTool : public BVH_Distance<Standard_Real,3,BVH_Vec3d,BRepExtrema_TriangleSet> {
	public:
typedef typename BVH_Tools<Standard_Real , 3>::BVH_PrjStateInTriangle BVH_PrjState;
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

		/****************** BRepExtrema_ProximityDistTool ******************/
		/**** md5 signature: 2988f1cc0151ca5566402211c63fd7de ****/
		%feature("compactdefaultargs") BRepExtrema_ProximityDistTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates new unitialized tool.
") BRepExtrema_ProximityDistTool;
		 BRepExtrema_ProximityDistTool();

		/****************** BRepExtrema_ProximityDistTool ******************/
		/**** md5 signature: b080844c8fa666dae8c0e8db8d27e87e ****/
		%feature("compactdefaultargs") BRepExtrema_ProximityDistTool;
		%feature("autodoc", "
Parameters
----------
theSet1: BRepExtrema_TriangleSet
theNbSamples1: int
theAddVertices1: BVH_Array3d
theAddStatus1: NCollection_Vector<ProxPnt_Status>
theSet2: BRepExtrema_TriangleSet
theShapeList1: BRepExtrema_ShapeList
theShapeList2: BRepExtrema_ShapeList

Return
-------
None

Description
-----------
Creates new tool for the given element sets.
") BRepExtrema_ProximityDistTool;
		 BRepExtrema_ProximityDistTool(const opencascade::handle<BRepExtrema_TriangleSet> & theSet1, const Standard_Integer theNbSamples1, const BVH_Array3d & theAddVertices1, const NCollection_Vector<ProxPnt_Status> & theAddStatus1, const opencascade::handle<BRepExtrema_TriangleSet> & theSet2, const BRepExtrema_ShapeList & theShapeList1, const BRepExtrema_ShapeList & theShapeList2);

		/****************** Accept ******************/
		/**** md5 signature: 47868288da8d60ae3574004f3eef6f3b ****/
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "
Parameters
----------
theSgmIdx: int
&: float

Return
-------
bool

Description
-----------
Defines the rules for leaf acceptance.
") Accept;
		virtual Standard_Boolean Accept(const Standard_Integer theSgmIdx, const Standard_Real &);

		/****************** IsEdgeOnBorder ******************/
		/**** md5 signature: 7f2df1d45fe4dd10cb81da19c83428fd ****/
		%feature("compactdefaultargs") IsEdgeOnBorder;
		%feature("autodoc", "
Parameters
----------
theTrgIdx: int
theFirstEdgeNodeIdx: int
theSecondEdgeNodeIdx: int
theTr: Handle ( Poly_Triangulation )

Return
-------
bool

Description
-----------
Returns true if the edge is on the boarder.
") IsEdgeOnBorder;
		static Standard_Boolean IsEdgeOnBorder(const Standard_Integer theTrgIdx, const Standard_Integer theFirstEdgeNodeIdx, const Standard_Integer theSecondEdgeNodeIdx, const Handle ( Poly_Triangulation ) & theTr);

		/****************** IsNodeOnBorder ******************/
		/**** md5 signature: 6a6c9031bf497d7acf6e95de1f2784f6 ****/
		%feature("compactdefaultargs") IsNodeOnBorder;
		%feature("autodoc", "
Parameters
----------
theNodeIdx: int
theTr: Handle ( Poly_Triangulation )

Return
-------
bool

Description
-----------
Returns true if the node is on the boarder.
") IsNodeOnBorder;
		static Standard_Boolean IsNodeOnBorder(const Standard_Integer theNodeIdx, const Handle ( Poly_Triangulation ) & theTr);

		/****************** LoadShapeLists ******************/
		/**** md5 signature: 2ec9bfacd5c06102fdebe80e35402ca0 ****/
		%feature("compactdefaultargs") LoadShapeLists;
		%feature("autodoc", "
Parameters
----------
theShapeList1: BRepExtrema_ShapeList
theShapeList2: BRepExtrema_ShapeList

Return
-------
None

Description
-----------
Loads the given list of subshapes into the tool.
") LoadShapeLists;
		void LoadShapeLists(const BRepExtrema_ShapeList & theShapeList1, const BRepExtrema_ShapeList & theShapeList2);

		/****************** LoadTriangleSets ******************/
		/**** md5 signature: dfd78a7a416eff23ee78d969d7e3cf4f ****/
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

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs searching of the proximity distance.
") Perform;
		void Perform();

		/****************** ProximityDistance ******************/
		/**** md5 signature: 1c229c100cac62e1d3970eed3dcb9856 ****/
		%feature("compactdefaultargs") ProximityDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the computed distance.
") ProximityDistance;
		Standard_Real ProximityDistance();

		/****************** ProximityPoints ******************/
		/**** md5 signature: 54701e724238367b6b602dfb87695880 ****/
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

		/****************** ProximityPointsStatus ******************/
		/**** md5 signature: cbb67aeda5a68bd79cbb58089638d3f8 ****/
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

		/****************** RejectNode ******************/
		/**** md5 signature: 62cfd38e542b7e9753f6f91b3eb7777b ****/
		%feature("compactdefaultargs") RejectNode;
		%feature("autodoc", "
Parameters
----------
theCornerMin: BVH_Vec3d
theCornerMax: BVH_Vec3d

Return
-------
theMetric: float

Description
-----------
Defines the rules for node rejection by bounding box.
") RejectNode;
		virtual Standard_Boolean RejectNode(const BVH_Vec3d & theCornerMin, const BVH_Vec3d & theCornerMax, Standard_Real &OutValue);

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
		/****************** BRepExtrema_ShapeProximity ******************/
		/**** md5 signature: 73b29b290349b3955b499c712de97888 ****/
		%feature("compactdefaultargs") BRepExtrema_ShapeProximity;
		%feature("autodoc", "
Parameters
----------
theTolerance: float (optional, default to Precision::Infinite())

Return
-------
None

Description
-----------
Creates empty proximity tool.
") BRepExtrema_ShapeProximity;
		 BRepExtrema_ShapeProximity(const Standard_Real theTolerance = Precision::Infinite());

		/****************** BRepExtrema_ShapeProximity ******************/
		/**** md5 signature: 531da26b6a3f5440b741fe549c9ade34 ****/
		%feature("compactdefaultargs") BRepExtrema_ShapeProximity;
		%feature("autodoc", "
Parameters
----------
theShape1: TopoDS_Shape
theShape2: TopoDS_Shape
theTolerance: float (optional, default to Precision::Infinite())

Return
-------
None

Description
-----------
Creates proximity tool for the given two shapes.
") BRepExtrema_ShapeProximity;
		 BRepExtrema_ShapeProximity(const TopoDS_Shape & theShape1, const TopoDS_Shape & theShape2, const Standard_Real theTolerance = Precision::Infinite());

		/****************** ElementSet1 ******************/
		/**** md5 signature: f5328b7099eceb0eda7e749d56fd8afa ****/
		%feature("compactdefaultargs") ElementSet1;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepExtrema_TriangleSet>

Description
-----------
Returns set of all the face triangles of the 1st shape.
") ElementSet1;
		const opencascade::handle<BRepExtrema_TriangleSet> & ElementSet1();

		/****************** ElementSet2 ******************/
		/**** md5 signature: e2ee7df49652a0d3ac07499a44f9b24b ****/
		%feature("compactdefaultargs") ElementSet2;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepExtrema_TriangleSet>

Description
-----------
Returns set of all the face triangles of the 2nd shape.
") ElementSet2;
		const opencascade::handle<BRepExtrema_TriangleSet> & ElementSet2();

		/****************** GetSubShape1 ******************/
		/**** md5 signature: 9d27a6a3fa6ff016ce6fb25c224de40d ****/
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
		const TopoDS_Shape GetSubShape1(const Standard_Integer theID);

		/****************** GetSubShape2 ******************/
		/**** md5 signature: 25abd1b9ef769c834795d782c0a14dbc ****/
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
		const TopoDS_Shape GetSubShape2(const Standard_Integer theID);

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the search is completed.
") IsDone;
		Standard_Boolean IsDone();

		/****************** LoadShape1 ******************/
		/**** md5 signature: ed5dc6256ef0f54993af8d5f42643204 ****/
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
		Standard_Boolean LoadShape1(const TopoDS_Shape & theShape1);

		/****************** LoadShape2 ******************/
		/**** md5 signature: 24b356a69585081561c46ecbe63fdbeb ****/
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
		Standard_Boolean LoadShape2(const TopoDS_Shape & theShape2);

		/****************** OverlapSubShapes1 ******************/
		/**** md5 signature: 9710dae176016573e5f78f6d7f31bfa4 ****/
		%feature("compactdefaultargs") OverlapSubShapes1;
		%feature("autodoc", "Return
-------
BRepExtrema_MapOfIntegerPackedMapOfInteger

Description
-----------
Returns set of ids of overlapped faces of 1st shape (started from 0).
") OverlapSubShapes1;
		const BRepExtrema_MapOfIntegerPackedMapOfInteger & OverlapSubShapes1();

		/****************** OverlapSubShapes2 ******************/
		/**** md5 signature: fc9b72c448de7230c8960bcd7b47e9f5 ****/
		%feature("compactdefaultargs") OverlapSubShapes2;
		%feature("autodoc", "Return
-------
BRepExtrema_MapOfIntegerPackedMapOfInteger

Description
-----------
Returns set of ids of overlapped faces of 2nd shape (started from 0).
") OverlapSubShapes2;
		const BRepExtrema_MapOfIntegerPackedMapOfInteger & OverlapSubShapes2();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs search of overlapped faces.
") Perform;
		void Perform();

		/****************** ProxPntStatus1 ******************/
		/**** md5 signature: 5b5a621c79fd72dfa7174da351c8990f ****/
		%feature("compactdefaultargs") ProxPntStatus1;
		%feature("autodoc", "Return
-------
ProxPnt_Status

Description
-----------
Returns the status of point on the 1st shape, which could be used as a reference point for the value of the proximity.
") ProxPntStatus1;
		const ProxPnt_Status  ProxPntStatus1();

		/****************** ProxPntStatus2 ******************/
		/**** md5 signature: 5f8c6ad089fa3dc1014ee2eaced6a8ee ****/
		%feature("compactdefaultargs") ProxPntStatus2;
		%feature("autodoc", "Return
-------
ProxPnt_Status

Description
-----------
Returns the status of point on the 2nd shape, which could be used as a reference point for the value of the proximity.
") ProxPntStatus2;
		const ProxPnt_Status  ProxPntStatus2();

		/****************** Proximity ******************/
		/**** md5 signature: b971efcb1300162fab46e37d2a70dacd ****/
		%feature("compactdefaultargs") Proximity;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns proximity value calculated for the whole input shapes.
") Proximity;
		Standard_Real Proximity();

		/****************** ProximityPoint1 ******************/
		/**** md5 signature: 7b89ebcbe2c3263efa38d81948de688a ****/
		%feature("compactdefaultargs") ProximityPoint1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the 1st shape, which could be used as a reference point for the value of the proximity.
") ProximityPoint1;
		const gp_Pnt ProximityPoint1();

		/****************** ProximityPoint2 ******************/
		/**** md5 signature: 694a8c2b488abd3573c6ab1ad209c1ff ****/
		%feature("compactdefaultargs") ProximityPoint2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point on the 2nd shape, which could be used as a reference point for the value of the proximity.
") ProximityPoint2;
		const gp_Pnt ProximityPoint2();

		/****************** SetNbSamples1 ******************/
		/**** md5 signature: 7c440e0080448ca35e32063181dbc6db ****/
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
Set number of sample points on the 1st shape used to compute the proximity value. in case of 0, all triangulation nodes will be used.
") SetNbSamples1;
		void SetNbSamples1(const Standard_Integer theNbSamples);

		/****************** SetNbSamples2 ******************/
		/**** md5 signature: 1328b53fc399af111069fbfe7e25a24f ****/
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
Set number of sample points on the 2nd shape used to compute the proximity value. in case of 0, all triangulation nodes will be used.
") SetNbSamples2;
		void SetNbSamples2(const Standard_Integer theNbSamples);

		/****************** SetTolerance ******************/
		/**** md5 signature: 2df6ca87a12fc10518568e45d2ce38db ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: float

Return
-------
None

Description
-----------
Sets tolerance value for overlap test (distance between shapes).
") SetTolerance;
		void SetTolerance(const Standard_Real theTolerance);

		/****************** Tolerance ******************/
		/**** md5 signature: 327dcbe220ae5ba3e0203f32c61c38db ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns tolerance value for overlap test (distance between shapes).
") Tolerance;
		Standard_Real Tolerance();

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
		/****************** BRepExtrema_SolutionElem ******************/
		/**** md5 signature: b1847c030d573d5fa6dbdfd7597b2246 ****/
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem();

		/****************** BRepExtrema_SolutionElem ******************/
		/**** md5 signature: d15292718a8e41bab3cfe61e1983013d ****/
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "
Parameters
----------
theDist: float
thePoint: gp_Pnt
theSolType: BRepExtrema_SupportType
theVertex: TopoDS_Vertex

Return
-------
None

Description
-----------
This constructor is used when the solution of a distance is a vertex. the different initialized fields are: @param thedist the distance @param thepoint the solution point @param thesoltype the type of solution @param thevertex and the vertex.
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem(const Standard_Real theDist, const gp_Pnt & thePoint, const BRepExtrema_SupportType theSolType, const TopoDS_Vertex & theVertex);

		/****************** BRepExtrema_SolutionElem ******************/
		/**** md5 signature: c44286d6515ce27f7cdab988b0bd4b89 ****/
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "
Parameters
----------
theDist: float
thePoint: gp_Pnt
theSolType: BRepExtrema_SupportType
theEdge: TopoDS_Edge
theParam: float

Return
-------
None

Description
-----------
This constructor is used when the solution of distance is on an edge. the different initialized fields are: @param thedist the distance @param thepoint the solution point @param thesoltype the type of solution @param theedge the edge @param theparam the parameter to locate the solution.
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem(const Standard_Real theDist, const gp_Pnt & thePoint, const BRepExtrema_SupportType theSolType, const TopoDS_Edge & theEdge, const Standard_Real theParam);

		/****************** BRepExtrema_SolutionElem ******************/
		/**** md5 signature: 95f0e109da6e223843501141c53cfc0f ****/
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "
Parameters
----------
theDist: float
thePoint: gp_Pnt
theSolType: BRepExtrema_SupportType
theFace: TopoDS_Face
theU: float
theV: float

Return
-------
None

Description
-----------
This constructor is used when the solution of distance is in a face. the different initialized fields are: @param thedist the distance @param thepoint the solution point @param thesoltype the type of solution @param theface the face @param theu u parameter to locate the solution @param thev v parameter to locate the solution.
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem(const Standard_Real theDist, const gp_Pnt & thePoint, const BRepExtrema_SupportType theSolType, const TopoDS_Face & theFace, const Standard_Real theU, const Standard_Real theV);

		/****************** Dist ******************/
		/**** md5 signature: f5307862a51cb97e3c26c8ff9fd2151c ****/
		%feature("compactdefaultargs") Dist;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the minimum distance.
") Dist;
		Standard_Real Dist();

		/****************** Edge ******************/
		/**** md5 signature: 657c12d9769667081fd960b688690cc0 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the vertex if the solution is an edge.
") Edge;
		const TopoDS_Edge Edge();

		/****************** EdgeParameter ******************/
		/**** md5 signature: e1e03ab8d7f734e6c45a0e3ecbfe3c1f ****/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "
Parameters
----------

Return
-------
theParam: float

Description
-----------
Returns the parameter value if the solution is on edge.
") EdgeParameter;
		void EdgeParameter(Standard_Real &OutValue);

		/****************** Face ******************/
		/**** md5 signature: 95406b8d0d556c0537e0768c48713f21 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the vertex if the solution is an face.
") Face;
		const TopoDS_Face Face();

		/****************** FaceParameter ******************/
		/**** md5 signature: 79577ec832d73e33d7d345390f41289a ****/
		%feature("compactdefaultargs") FaceParameter;
		%feature("autodoc", "
Parameters
----------

Return
-------
theU: float
theV: float

Description
-----------
Returns the parameters u and v if the solution is in a face.
") FaceParameter;
		void FaceParameter(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Point ******************/
		/**** md5 signature: 4e742d9ca138939180edee86d3b37a8f ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the solution point.
") Point;
		const gp_Pnt Point();

		/****************** SupportKind ******************/
		/**** md5 signature: 078ef3765b64d7d1760ca2fcb79509bc ****/
		%feature("compactdefaultargs") SupportKind;
		%feature("autodoc", "Return
-------
BRepExtrema_SupportType

Description
-----------
Returns the support type: isvertex => the solution is a vertex. isonedge => the solution belongs to an edge. isinface => the solution is inside a face.
") SupportKind;
		BRepExtrema_SupportType SupportKind();

		/****************** Vertex ******************/
		/**** md5 signature: f6b9d30df043abdbae2c9dffcc672395 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the vertex if the solution is a vertex.
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
		/****************** BRepExtrema_TriangleSet ******************/
		/**** md5 signature: c837909c9b9498946edb006a58e7df80 ****/
		%feature("compactdefaultargs") BRepExtrema_TriangleSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates empty triangle set.
") BRepExtrema_TriangleSet;
		 BRepExtrema_TriangleSet();

		/****************** BRepExtrema_TriangleSet ******************/
		/**** md5 signature: 0d12ee30e72748f6fc3d4890d0d61603 ****/
		%feature("compactdefaultargs") BRepExtrema_TriangleSet;
		%feature("autodoc", "
Parameters
----------
theFaces: BRepExtrema_ShapeList

Return
-------
None

Description
-----------
Creates triangle set from the given face.
") BRepExtrema_TriangleSet;
		 BRepExtrema_TriangleSet(const BRepExtrema_ShapeList & theFaces);

		/****************** Box ******************/
		/**** md5 signature: 01168dd0900939e91f004003e5b0a1da ****/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BVH_Box<float, 3 >

Description
-----------
Returns aabb of the given triangle.
") Box;
		BVH_Box<Standard_Real, 3 > Box(const Standard_Integer theIndex);

		/****************** Center ******************/
		/**** md5 signature: 1fbde3997a3e0d75df8f855e85efeedc ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theAxis: int

Return
-------
float

Description
-----------
Returns centroid position along specified axis.
") Center;
		Standard_Real Center(const Standard_Integer theIndex, const Standard_Integer theAxis);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears triangle set data.
") Clear;
		void Clear();

		/****************** GetFaceID ******************/
		/**** md5 signature: 636c69728e1d37778f46c7e7689817a2 ****/
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
Returns face id of the given triangle.
") GetFaceID;
		Standard_Integer GetFaceID(const Standard_Integer theIndex);

		/****************** GetShapeIDOfVtx ******************/
		/**** md5 signature: 94f7f027601fc3d870fcd3c7c286a3d2 ****/
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
Returns shape id of the given vertex index.
") GetShapeIDOfVtx;
		Standard_Integer GetShapeIDOfVtx(const Standard_Integer theIndex);

		/****************** GetTrgIdxInShape ******************/
		/**** md5 signature: 76f60b043a2db13c82e06a83b90203aa ****/
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
Returns triangle index (before swapping) in tringulation of the shape, which triangle belongs, with the given trg id in whole set (after swapping).
") GetTrgIdxInShape;
		Standard_Integer GetTrgIdxInShape(const Standard_Integer theIndex);

		/****************** GetVertices ******************/
		/**** md5 signature: 6895166cb2c145e3ff7ace9664551209 ****/
		%feature("compactdefaultargs") GetVertices;
		%feature("autodoc", "Return
-------
BVH_Array3d

Description
-----------
Returns all vertices.
") GetVertices;
		const BVH_Array3d & GetVertices();

		/****************** GetVertices ******************/
		/**** md5 signature: 8f9f04b5f9949be6710853ac95fdc36d ****/
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
		void GetVertices(const Standard_Integer theIndex, BVH_Vec3d & theVertex1, BVH_Vec3d & theVertex2, BVH_Vec3d & theVertex3);

		/****************** GetVtxIdxInShape ******************/
		/**** md5 signature: 638e97ebafbd36318e5edb25c78cf4af ****/
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
Returns vertex index in tringulation of the shape, which vertex belongs, with the given vtx id in whole set.
") GetVtxIdxInShape;
		Standard_Integer GetVtxIdxInShape(const Standard_Integer theIndex);

		/****************** GetVtxIndices ******************/
		/**** md5 signature: fb0daffb3cedb2be1930b6e0eebab39e ****/
		%feature("compactdefaultargs") GetVtxIndices;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theVtxIndices: NCollection_Array1<int>

Return
-------
None

Description
-----------
Returns vertex indices of the given triangle.
") GetVtxIndices;
		void GetVtxIndices(const Standard_Integer theIndex, NCollection_Array1<Standard_Integer> & theVtxIndices);

		/****************** Init ******************/
		/**** md5 signature: e68262ad9df79c968a16107c49147612 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theShapes: BRepExtrema_ShapeList

Return
-------
bool

Description
-----------
Initializes triangle set.
") Init;
		Standard_Boolean Init(const BRepExtrema_ShapeList & theShapes);

		/****************** Size ******************/
		/**** md5 signature: 35f6071839104c52ab17204b65e7eae6 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns total number of triangles.
") Size;
		Standard_Integer Size();

		/****************** Swap ******************/
		/**** md5 signature: 36f2c771aee4a57de3f442eef1aadf04 ****/
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
		void Swap(const Standard_Integer theIndex1, const Standard_Integer theIndex2);

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
		/****************** BRepExtrema_SelfIntersection ******************/
		/**** md5 signature: 784f69b5e04a39d4d2d873ee9d2c141b ****/
		%feature("compactdefaultargs") BRepExtrema_SelfIntersection;
		%feature("autodoc", "
Parameters
----------
theTolerance: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Creates uninitialized self-intersection tool.
") BRepExtrema_SelfIntersection;
		 BRepExtrema_SelfIntersection(const Standard_Real theTolerance = 0.0);

		/****************** BRepExtrema_SelfIntersection ******************/
		/**** md5 signature: f3bc92ec46be4be78a76c38666f37a6a ****/
		%feature("compactdefaultargs") BRepExtrema_SelfIntersection;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theTolerance: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Creates self-intersection tool for the given shape.
") BRepExtrema_SelfIntersection;
		 BRepExtrema_SelfIntersection(const TopoDS_Shape & theShape, const Standard_Real theTolerance = 0.0);

		/****************** ElementSet ******************/
		/**** md5 signature: 7eda4cbdd51c64f2d775e378bb0a6592 ****/
		%feature("compactdefaultargs") ElementSet;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepExtrema_TriangleSet>

Description
-----------
Returns set of all the face triangles of the shape.
") ElementSet;
		const opencascade::handle<BRepExtrema_TriangleSet> & ElementSet();

		/****************** GetSubShape ******************/
		/**** md5 signature: b2411a4e8fd4710be5089ebd533dcd9a ****/
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
		const TopoDS_Face GetSubShape(const Standard_Integer theID);

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the detection is completed.
") IsDone;
		Standard_Boolean IsDone();

		/****************** LoadShape ******************/
		/**** md5 signature: fd6ee24742b56495b9bca6600e71814f ****/
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
		Standard_Boolean LoadShape(const TopoDS_Shape & theShape);

		/****************** OverlapElements ******************/
		/**** md5 signature: f356c9dc69a122d5e32fcee210f9c533 ****/
		%feature("compactdefaultargs") OverlapElements;
		%feature("autodoc", "Return
-------
BRepExtrema_MapOfIntegerPackedMapOfInteger

Description
-----------
Returns set of ids of overlapped sub-shapes (started from 0).
") OverlapElements;
		const BRepExtrema_MapOfIntegerPackedMapOfInteger & OverlapElements();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs detection of self-intersections.
") Perform;
		void Perform();

		/****************** SetTolerance ******************/
		/**** md5 signature: 2df6ca87a12fc10518568e45d2ce38db ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: float

Return
-------
None

Description
-----------
Sets tolerance value used for self-intersection test.
") SetTolerance;
		void SetTolerance(const Standard_Real theTolerance);

		/****************** Tolerance ******************/
		/**** md5 signature: 327dcbe220ae5ba3e0203f32c61c38db ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns tolerance value used for self-intersection test.
") Tolerance;
		Standard_Real Tolerance();

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
