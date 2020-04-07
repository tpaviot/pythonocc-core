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
%define BREPEXTREMADOCSTRING
"BRepExtrema module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepextrema.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<BRepExtrema_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<Extrema_module.hxx>
#include<gp_module.hxx>
#include<Bnd_module.hxx>
#include<BVH_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import Extrema.i
%import gp.i
%import Bnd.i
%import BVH.i

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

/* python proy classes for enums */
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
%template(BRepExtrema_ShapeList) NCollection_Vector<TopoDS_Face>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<Standard_Integer, TColStd_PackedMapOfInteger> BRepExtrema_MapOfIntegerPackedMapOfInteger;
typedef NCollection_Sequence<BRepExtrema_SolutionElem> BRepExtrema_SeqOfSolution;
typedef NCollection_Vector<TopoDS_Face> BRepExtrema_ShapeList;
/* end typedefs declaration */

/***********************************
* class BRepExtrema_DistShapeShape *
***********************************/
class BRepExtrema_DistShapeShape {
	public:
		/****************** BRepExtrema_DistShapeShape ******************/
		%feature("compactdefaultargs") BRepExtrema_DistShapeShape;
		%feature("autodoc", "Create empty tool .

Returns
-------
None
") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape();

		/****************** BRepExtrema_DistShapeShape ******************/
		%feature("compactdefaultargs") BRepExtrema_DistShapeShape;
		%feature("autodoc", "Computation of the minimum distance (value and pair of points) using default deflection default value is precision::confusion(). .

Parameters
----------
Shape1: TopoDS_Shape
Shape2: TopoDS_Shape
F: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
A: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape(const TopoDS_Shape & Shape1, const TopoDS_Shape & Shape2, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****************** BRepExtrema_DistShapeShape ******************/
		%feature("compactdefaultargs") BRepExtrema_DistShapeShape;
		%feature("autodoc", "Create tool and load both shapes into it .

Parameters
----------
Shape1: TopoDS_Shape
Shape2: TopoDS_Shape
theDeflection: float
F: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
A: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape(const TopoDS_Shape & Shape1, const TopoDS_Shape & Shape2, const Standard_Real theDeflection, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** InnerSolution ******************/
		%feature("compactdefaultargs") InnerSolution;
		%feature("autodoc", "True if one of the shapes is a solid and the other shape is completely or partially inside the solid. .

Returns
-------
bool
") InnerSolution;
		Standard_Boolean InnerSolution();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the minimum distance is found. .

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LoadS1 ******************/
		%feature("compactdefaultargs") LoadS1;
		%feature("autodoc", "Load first shape into extrema .

Parameters
----------
Shape1: TopoDS_Shape

Returns
-------
None
") LoadS1;
		void LoadS1(const TopoDS_Shape & Shape1);

		/****************** LoadS2 ******************/
		%feature("compactdefaultargs") LoadS2;
		%feature("autodoc", "Load second shape into extrema .

Parameters
----------
Shape1: TopoDS_Shape

Returns
-------
None
") LoadS2;
		void LoadS2(const TopoDS_Shape & Shape1);

		/****************** NbSolution ******************/
		%feature("compactdefaultargs") NbSolution;
		%feature("autodoc", "Returns the number of solutions satisfying the minimum distance. .

Returns
-------
int
") NbSolution;
		Standard_Integer NbSolution();

		/****************** ParOnEdgeS1 ******************/
		%feature("compactdefaultargs") ParOnEdgeS1;
		%feature("autodoc", "Gives the corresponding parameter t if the nth solution is situated on an egde of the first shape .

Parameters
----------
N: int

Returns
-------
t: float
") ParOnEdgeS1;
		void ParOnEdgeS1(const Standard_Integer N, Standard_Real &OutValue);

		/****************** ParOnEdgeS2 ******************/
		%feature("compactdefaultargs") ParOnEdgeS2;
		%feature("autodoc", "Gives the corresponding parameter t if the nth solution is situated on an egde of the first shape .

Parameters
----------
N: int

Returns
-------
t: float
") ParOnEdgeS2;
		void ParOnEdgeS2(const Standard_Integer N, Standard_Real &OutValue);

		/****************** ParOnFaceS1 ******************/
		%feature("compactdefaultargs") ParOnFaceS1;
		%feature("autodoc", "Gives the corresponding parameters (u,v) if the nth solution is situated on an face of the first shape .

Parameters
----------
N: int

Returns
-------
u: float
v: float
") ParOnFaceS1;
		void ParOnFaceS1(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParOnFaceS2 ******************/
		%feature("compactdefaultargs") ParOnFaceS2;
		%feature("autodoc", "Gives the corresponding parameters (u,v) if the nth solution is situated on an face of the second shape .

Parameters
----------
N: int

Returns
-------
u: float
v: float
") ParOnFaceS2;
		void ParOnFaceS2(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computation of the minimum distance (value and  couple of points). parameter thedeflection is used  to specify a maximum deviation of extreme distances  from the minimum one.  returns isdone status. .

Returns
-------
bool
") Perform;
		Standard_Boolean Perform();

		/****************** PointOnShape1 ******************/
		%feature("compactdefaultargs") PointOnShape1;
		%feature("autodoc", "Returns the point corresponding to the <n>th solution on the first shape .

Parameters
----------
N: int

Returns
-------
gp_Pnt
") PointOnShape1;
		const gp_Pnt PointOnShape1(const Standard_Integer N);

		/****************** PointOnShape2 ******************/
		%feature("compactdefaultargs") PointOnShape2;
		%feature("autodoc", "Returns the point corresponding to the <n>th solution on the second shape .

Parameters
----------
N: int

Returns
-------
gp_Pnt
") PointOnShape2;
		const gp_Pnt PointOnShape2(const Standard_Integer N);

		/****************** SetAlgo ******************/
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Extrema_ExtAlgo

Returns
-------
None
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****************** SetDeflection ******************/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDeflection: float

Returns
-------
None
") SetDeflection;
		void SetDeflection(const Standard_Real theDeflection);

		/****************** SetFlag ******************/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Extrema_ExtFlag

Returns
-------
None
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

		/****************** SupportOnShape1 ******************/
		%feature("compactdefaultargs") SupportOnShape1;
		%feature("autodoc", "Gives the support where the nth solution on the first shape is situated. this support can be a vertex, an edge or a face. .

Parameters
----------
N: int

Returns
-------
TopoDS_Shape
") SupportOnShape1;
		TopoDS_Shape SupportOnShape1(const Standard_Integer N);

		/****************** SupportOnShape2 ******************/
		%feature("compactdefaultargs") SupportOnShape2;
		%feature("autodoc", "Gives the support where the nth solution on the second shape is situated. this support can be a vertex, an edge or a face. .

Parameters
----------
N: int

Returns
-------
TopoDS_Shape
") SupportOnShape2;
		TopoDS_Shape SupportOnShape2(const Standard_Integer N);

		/****************** SupportTypeShape1 ******************/
		%feature("compactdefaultargs") SupportTypeShape1;
		%feature("autodoc", "Gives the type of the support where the nth solution on the first shape is situated: isvertex => the nth solution on the first shape is a vertex isonedge => the nth soluion on the first shape is on a edge isinface => the nth solution on the first shape is inside a face the corresponding support is obtained by the method supportonshape1 .

Parameters
----------
N: int

Returns
-------
BRepExtrema_SupportType
") SupportTypeShape1;
		BRepExtrema_SupportType SupportTypeShape1(const Standard_Integer N);

		/****************** SupportTypeShape2 ******************/
		%feature("compactdefaultargs") SupportTypeShape2;
		%feature("autodoc", "Gives the type of the support where the nth solution on the second shape is situated: isvertex => the nth solution on the second shape is a vertex isonedge => the nth soluion on the secondt shape is on a edge isinface => the nth solution on the second shape is inside a face the corresponding support is obtained by the method supportonshape2 .

Parameters
----------
N: int

Returns
-------
BRepExtrema_SupportType
") SupportTypeShape2;
		BRepExtrema_SupportType SupportTypeShape2(const Standard_Integer N);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the minimum distance. .

Returns
-------
float
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
		%feature("compactdefaultargs") BRepExtrema_DistanceSS;
		%feature("autodoc", "Computes the distance between two shapes ( face edge vertex). .

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
B1: Bnd_Box
B2: Bnd_Box
DstRef: float
F: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
A: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") BRepExtrema_DistanceSS;
		 BRepExtrema_DistanceSS(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Bnd_Box & B1, const Bnd_Box & B2, const Standard_Real DstRef, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****************** BRepExtrema_DistanceSS ******************/
		%feature("compactdefaultargs") BRepExtrema_DistanceSS;
		%feature("autodoc", "Computes the distance between two shapes ( face edge vertex). parameter thedeflection is used to specify a maximum deviation of extreme distances from the minimum one. default value is precision::confusion(). .

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
B1: Bnd_Box
B2: Bnd_Box
DstRef: float
aDeflection: float
F: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
A: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") BRepExtrema_DistanceSS;
		 BRepExtrema_DistanceSS(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Bnd_Box & B1, const Bnd_Box & B2, const Standard_Real DstRef, const Standard_Real aDeflection, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****************** DistValue ******************/
		%feature("compactdefaultargs") DistValue;
		%feature("autodoc", "Returns the distance value .

Returns
-------
float
") DistValue;
		Standard_Real DistValue();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distance has been computed .

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Seq1Value ******************/
		%feature("compactdefaultargs") Seq1Value;
		%feature("autodoc", "Returns the list of solutions on the first shape .

Returns
-------
BRepExtrema_SeqOfSolution
") Seq1Value;
		const BRepExtrema_SeqOfSolution & Seq1Value();

		/****************** Seq2Value ******************/
		%feature("compactdefaultargs") Seq2Value;
		%feature("autodoc", "Returns the list of solutions on the second shape .

Returns
-------
BRepExtrema_SeqOfSolution
") Seq2Value;
		const BRepExtrema_SeqOfSolution & Seq2Value();

		/****************** SetAlgo ******************/
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "Sets the flag controlling ...

Parameters
----------
A: Extrema_ExtAlgo

Returns
-------
None
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****************** SetFlag ******************/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "Sets the flag controlling minimum and maximum search.

Parameters
----------
F: Extrema_ExtFlag

Returns
-------
None
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

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

/* python proy classes for enums */
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
		%feature("compactdefaultargs") PreCheckElements;
		%feature("autodoc", "Checks if two mesh elements should be tested for overlapping/intersection (used for detection correct/incorrect cases of shared edges and vertices).

Parameters
----------
Standard_Integer: 
Standard_Integer: 

Returns
-------
BRepExtrema_ElementFilter::FilterResult
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
		%feature("compactdefaultargs") BRepExtrema_ExtCC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepExtrema_ExtCC;
		 BRepExtrema_ExtCC();

		/****************** BRepExtrema_ExtCC ******************/
		%feature("compactdefaultargs") BRepExtrema_ExtCC;
		%feature("autodoc", "It calculates all the distances. .

Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge

Returns
-------
None
") BRepExtrema_ExtCC;
		 BRepExtrema_ExtCC(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
E2: TopoDS_Edge

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Edge & E2);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found. .

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if e1 and e2 are parallel. .

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances. .

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** ParameterOnE1 ******************/
		%feature("compactdefaultargs") ParameterOnE1;
		%feature("autodoc", "Returns the parameter on the first edge of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
float
") ParameterOnE1;
		Standard_Real ParameterOnE1(const Standard_Integer N);

		/****************** ParameterOnE2 ******************/
		%feature("compactdefaultargs") ParameterOnE2;
		%feature("autodoc", "Returns the parameter on the second edge of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
float
") ParameterOnE2;
		Standard_Real ParameterOnE2(const Standard_Integer N);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "An exception is raised if the fields have not been initialized. .

Parameters
----------
E1: TopoDS_Edge

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Edge & E1);

		/****************** PointOnE1 ******************/
		%feature("compactdefaultargs") PointOnE1;
		%feature("autodoc", "Returns the point of the <n>th extremum distance on the edge e1. .

Parameters
----------
N: int

Returns
-------
gp_Pnt
") PointOnE1;
		gp_Pnt PointOnE1(const Standard_Integer N);

		/****************** PointOnE2 ******************/
		%feature("compactdefaultargs") PointOnE2;
		%feature("autodoc", "Returns the point of the <n>th extremum distance on the edge e2. .

Parameters
----------
N: int

Returns
-------
gp_Pnt
") PointOnE2;
		gp_Pnt PointOnE2(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the <n>th extremum square distance. .

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the edges is a trimmed curve, dist11 is a square distance between the point on e1 of parameter firstparameter and the point of parameter firstparameter on e2. .

Parameters
----------
P11: gp_Pnt
P12: gp_Pnt
P21: gp_Pnt
P22: gp_Pnt

Returns
-------
dist11: float
distP12: float
distP21: float
distP22: float
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
		%feature("compactdefaultargs") BRepExtrema_ExtCF;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepExtrema_ExtCF;
		 BRepExtrema_ExtCF();

		/****************** BRepExtrema_ExtCF ******************/
		%feature("compactdefaultargs") BRepExtrema_ExtCF;
		%feature("autodoc", "It calculates all the distances. .

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") BRepExtrema_ExtCF;
		 BRepExtrema_ExtCF(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found. .

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the curve is on a parallel surface. .

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances. .

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** ParameterOnEdge ******************/
		%feature("compactdefaultargs") ParameterOnEdge;
		%feature("autodoc", "Returns the parameters on the edge of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
float
") ParameterOnEdge;
		Standard_Real ParameterOnEdge(const Standard_Integer N);

		/****************** ParameterOnFace ******************/
		%feature("compactdefaultargs") ParameterOnFace;
		%feature("autodoc", "Returns the parameters on the face of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
U: float
V: float
") ParameterOnFace;
		void ParameterOnFace(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "An exception is raised if the fields have not been initialized. be careful: this method uses the face only for classify not for the fields. .

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** PointOnEdge ******************/
		%feature("compactdefaultargs") PointOnEdge;
		%feature("autodoc", "Returns the point of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
gp_Pnt
") PointOnEdge;
		gp_Pnt PointOnEdge(const Standard_Integer N);

		/****************** PointOnFace ******************/
		%feature("compactdefaultargs") PointOnFace;
		%feature("autodoc", "Returns the point of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
gp_Pnt
") PointOnFace;
		gp_Pnt PointOnFace(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the <n>th extremum square distance. .

Parameters
----------
N: int

Returns
-------
float
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
		%feature("compactdefaultargs") BRepExtrema_ExtFF;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepExtrema_ExtFF;
		 BRepExtrema_ExtFF();

		/****************** BRepExtrema_ExtFF ******************/
		%feature("compactdefaultargs") BRepExtrema_ExtFF;
		%feature("autodoc", "It calculates all the distances. .

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Returns
-------
None
") BRepExtrema_ExtFF;
		 BRepExtrema_ExtFF(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
F2: TopoDS_Face

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Face & F2);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found. .

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the surfaces are parallel. .

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances. .

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** ParameterOnFace1 ******************/
		%feature("compactdefaultargs") ParameterOnFace1;
		%feature("autodoc", "Returns the parameters on the face f1 of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
U: float
V: float
") ParameterOnFace1;
		void ParameterOnFace1(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParameterOnFace2 ******************/
		%feature("compactdefaultargs") ParameterOnFace2;
		%feature("autodoc", "Returns the parameters on the face f2 of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
U: float
V: float
") ParameterOnFace2;
		void ParameterOnFace2(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "An exception is raised if the fields have not been initialized. be careful: this method uses the face f2 only for classify, not for the fields. .

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** PointOnFace1 ******************/
		%feature("compactdefaultargs") PointOnFace1;
		%feature("autodoc", "Returns the point of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
gp_Pnt
") PointOnFace1;
		gp_Pnt PointOnFace1(const Standard_Integer N);

		/****************** PointOnFace2 ******************/
		%feature("compactdefaultargs") PointOnFace2;
		%feature("autodoc", "Returns the point of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
gp_Pnt
") PointOnFace2;
		gp_Pnt PointOnFace2(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the <n>th extremum square distance. .

Parameters
----------
N: int

Returns
-------
float
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
		%feature("compactdefaultargs") BRepExtrema_ExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepExtrema_ExtPC;
		 BRepExtrema_ExtPC();

		/****************** BRepExtrema_ExtPC ******************/
		%feature("compactdefaultargs") BRepExtrema_ExtPC;
		%feature("autodoc", "It calculates all the distances. .

Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Returns
-------
None
") BRepExtrema_ExtPC;
		 BRepExtrema_ExtPC(const TopoDS_Vertex & V, const TopoDS_Edge & E);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Edge & E);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found. .

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the <n>th extremum distance is a minimum. .

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances. .

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on the edge of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Standard_Integer N);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "An exception is raised if the fields have not been initialized. .

Parameters
----------
V: TopoDS_Vertex

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Vertex & V);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the <n>th extremum square distance. .

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the curve is a trimmed curve, dist1 is a square distance between <p> and the point of parameter firstparameter <pnt1> and dist2 is a square distance between <p> and the point of parameter lastparameter <pnt2>. .

Parameters
----------
pnt1: gp_Pnt
pnt2: gp_Pnt

Returns
-------
dist1: float
dist2: float
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
		%feature("compactdefaultargs") BRepExtrema_ExtPF;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepExtrema_ExtPF;
		 BRepExtrema_ExtPF();

		/****************** BRepExtrema_ExtPF ******************/
		%feature("compactdefaultargs") BRepExtrema_ExtPF;
		%feature("autodoc", "It calculates all the distances. .

Parameters
----------
TheVertex: TopoDS_Vertex
TheFace: TopoDS_Face
TheFlag: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
TheAlgo: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") BRepExtrema_ExtPF;
		 BRepExtrema_ExtPF(const TopoDS_Vertex & TheVertex, const TopoDS_Face & TheFace, const Extrema_ExtFlag TheFlag = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo TheAlgo = Extrema_ExtAlgo_Grad);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheFace: TopoDS_Face
TheFlag: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
TheAlgo: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Face & TheFace, const Extrema_ExtFlag TheFlag = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo TheAlgo = Extrema_ExtAlgo_Grad);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found. .

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances. .

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameters on the face of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
U: float
V: float
") Parameter;
		void Parameter(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "An exception is raised if the fields have not been initialized. be careful: this method uses the face only for classify not for the fields. .

Parameters
----------
TheVertex: TopoDS_Vertex
TheFace: TopoDS_Face

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Vertex & TheVertex, const TopoDS_Face & TheFace);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the <n>th extremum distance. .

Parameters
----------
N: int

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point(const Standard_Integer N);

		/****************** SetAlgo ******************/
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Extrema_ExtAlgo

Returns
-------
None
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****************** SetFlag ******************/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Extrema_ExtFlag

Returns
-------
None
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the <n>th extremum square distance. .

Parameters
----------
N: int

Returns
-------
float
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
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns standard_true if ok.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
dist: float
") Distance;
		static Standard_Boolean Distance(const TopoDS_Shape & S1, const TopoDS_Shape & S2, gp_Pnt & P1, gp_Pnt & P2, Standard_Real &OutValue);

};


%extend BRepExtrema_Poly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepExtrema_ShapeProximity *
***********************************/
class BRepExtrema_ShapeProximity {
	public:
		/****************** BRepExtrema_ShapeProximity ******************/
		%feature("compactdefaultargs") BRepExtrema_ShapeProximity;
		%feature("autodoc", "Creates empty proximity tool.

Parameters
----------
theTolerance: float,optional
	default value is 0.0

Returns
-------
None
") BRepExtrema_ShapeProximity;
		 BRepExtrema_ShapeProximity(const Standard_Real theTolerance = 0.0);

		/****************** BRepExtrema_ShapeProximity ******************/
		%feature("compactdefaultargs") BRepExtrema_ShapeProximity;
		%feature("autodoc", "Creates proximity tool for the given two shapes.

Parameters
----------
theShape1: TopoDS_Shape
theShape2: TopoDS_Shape
theTolerance: float,optional
	default value is 0.0

Returns
-------
None
") BRepExtrema_ShapeProximity;
		 BRepExtrema_ShapeProximity(const TopoDS_Shape & theShape1, const TopoDS_Shape & theShape2, const Standard_Real theTolerance = 0.0);

		/****************** ElementSet1 ******************/
		%feature("compactdefaultargs") ElementSet1;
		%feature("autodoc", "Returns set of all the face triangles of the 1st shape.

Returns
-------
opencascade::handle<BRepExtrema_TriangleSet>
") ElementSet1;
		const opencascade::handle<BRepExtrema_TriangleSet> & ElementSet1();

		/****************** ElementSet2 ******************/
		%feature("compactdefaultargs") ElementSet2;
		%feature("autodoc", "Returns set of all the face triangles of the 2nd shape.

Returns
-------
opencascade::handle<BRepExtrema_TriangleSet>
") ElementSet2;
		const opencascade::handle<BRepExtrema_TriangleSet> & ElementSet2();

		/****************** GetSubShape1 ******************/
		%feature("compactdefaultargs") GetSubShape1;
		%feature("autodoc", "Returns sub-shape from 1st shape with the given index (started from 0).

Parameters
----------
theID: int

Returns
-------
TopoDS_Face
") GetSubShape1;
		const TopoDS_Face GetSubShape1(const Standard_Integer theID);

		/****************** GetSubShape2 ******************/
		%feature("compactdefaultargs") GetSubShape2;
		%feature("autodoc", "Returns sub-shape from 1st shape with the given index (started from 0).

Parameters
----------
theID: int

Returns
-------
TopoDS_Face
") GetSubShape2;
		const TopoDS_Face GetSubShape2(const Standard_Integer theID);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the search is completed.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LoadShape1 ******************/
		%feature("compactdefaultargs") LoadShape1;
		%feature("autodoc", "Loads 1st shape into proximity tool.

Parameters
----------
theShape1: TopoDS_Shape

Returns
-------
bool
") LoadShape1;
		Standard_Boolean LoadShape1(const TopoDS_Shape & theShape1);

		/****************** LoadShape2 ******************/
		%feature("compactdefaultargs") LoadShape2;
		%feature("autodoc", "Loads 2nd shape into proximity tool.

Parameters
----------
theShape2: TopoDS_Shape

Returns
-------
bool
") LoadShape2;
		Standard_Boolean LoadShape2(const TopoDS_Shape & theShape2);

		/****************** OverlapSubShapes1 ******************/
		%feature("compactdefaultargs") OverlapSubShapes1;
		%feature("autodoc", "Returns set of ids of overlapped faces of 1st shape (started from 0).

Returns
-------
BRepExtrema_MapOfIntegerPackedMapOfInteger
") OverlapSubShapes1;
		const BRepExtrema_MapOfIntegerPackedMapOfInteger & OverlapSubShapes1();

		/****************** OverlapSubShapes2 ******************/
		%feature("compactdefaultargs") OverlapSubShapes2;
		%feature("autodoc", "Returns set of ids of overlapped faces of 2nd shape (started from 0).

Returns
-------
BRepExtrema_MapOfIntegerPackedMapOfInteger
") OverlapSubShapes2;
		const BRepExtrema_MapOfIntegerPackedMapOfInteger & OverlapSubShapes2();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs search of overlapped faces.

Returns
-------
None
") Perform;
		void Perform();

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets tolerance value for overlap test (distance between shapes).

Parameters
----------
theTolerance: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTolerance);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns tolerance value for overlap test (distance between shapes).

Returns
-------
float
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
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem();

		/****************** BRepExtrema_SolutionElem ******************/
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "This constructor is used when the solution of a distance is a vertex. the different initialized fields are: @param thedist the distance @param thepoint the solution point @param thesoltype the type of solution @param thevertex and the vertex.

Parameters
----------
theDist: float
thePoint: gp_Pnt
theSolType: BRepExtrema_SupportType
theVertex: TopoDS_Vertex

Returns
-------
None
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem(const Standard_Real theDist, const gp_Pnt & thePoint, const BRepExtrema_SupportType theSolType, const TopoDS_Vertex & theVertex);

		/****************** BRepExtrema_SolutionElem ******************/
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "This constructor is used when the solution of distance is on an edge. the different initialized fields are: @param thedist the distance @param thepoint the solution point @param thesoltype the type of solution @param theedge the edge @param theparam the parameter to locate the solution.

Parameters
----------
theDist: float
thePoint: gp_Pnt
theSolType: BRepExtrema_SupportType
theEdge: TopoDS_Edge
theParam: float

Returns
-------
None
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem(const Standard_Real theDist, const gp_Pnt & thePoint, const BRepExtrema_SupportType theSolType, const TopoDS_Edge & theEdge, const Standard_Real theParam);

		/****************** BRepExtrema_SolutionElem ******************/
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "This constructor is used when the solution of distance is in a face. the different initialized fields are: @param thedist the distance @param thepoint the solution point @param thesoltype the type of solution @param theface the face @param theu u parameter to locate the solution @param thev v parameter to locate the solution.

Parameters
----------
theDist: float
thePoint: gp_Pnt
theSolType: BRepExtrema_SupportType
theFace: TopoDS_Face
theU: float
theV: float

Returns
-------
None
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem(const Standard_Real theDist, const gp_Pnt & thePoint, const BRepExtrema_SupportType theSolType, const TopoDS_Face & theFace, const Standard_Real theU, const Standard_Real theV);

		/****************** Dist ******************/
		%feature("compactdefaultargs") Dist;
		%feature("autodoc", "Returns the value of the minimum distance.

Returns
-------
float
") Dist;
		Standard_Real Dist();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the vertex if the solution is an edge.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** EdgeParameter ******************/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "Returns the parameter value if the solution is on edge.

Parameters
----------

Returns
-------
theParam: float
") EdgeParameter;
		void EdgeParameter(Standard_Real &OutValue);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the vertex if the solution is an face.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** FaceParameter ******************/
		%feature("compactdefaultargs") FaceParameter;
		%feature("autodoc", "Returns the parameters u and v if the solution is in a face.

Parameters
----------

Returns
-------
theU: float
theV: float
") FaceParameter;
		void FaceParameter(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the solution point.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** SupportKind ******************/
		%feature("compactdefaultargs") SupportKind;
		%feature("autodoc", "Returns the support type: isvertex => the solution is a vertex. isonedge => the solution belongs to an edge. isinface => the solution is inside a face.

Returns
-------
BRepExtrema_SupportType
") SupportKind;
		BRepExtrema_SupportType SupportKind();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex if the solution is a vertex.

Returns
-------
TopoDS_Vertex
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
		%feature("compactdefaultargs") BRepExtrema_TriangleSet;
		%feature("autodoc", "Creates empty triangle set.

Returns
-------
None
") BRepExtrema_TriangleSet;
		 BRepExtrema_TriangleSet();

		/****************** BRepExtrema_TriangleSet ******************/
		%feature("compactdefaultargs") BRepExtrema_TriangleSet;
		%feature("autodoc", "Creates triangle set from the given face.

Parameters
----------
theFaces: BRepExtrema_ShapeList

Returns
-------
None
") BRepExtrema_TriangleSet;
		 BRepExtrema_TriangleSet(const BRepExtrema_ShapeList & theFaces);

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Returns aabb of the given triangle.

Parameters
----------
theIndex: int

Returns
-------
BVH_Box<float, 3 >
") Box;
		BVH_Box<Standard_Real, 3 > Box(const Standard_Integer theIndex);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns centroid position along specified axis.

Parameters
----------
theIndex: int
theAxis: int

Returns
-------
float
") Center;
		Standard_Real Center(const Standard_Integer theIndex, const Standard_Integer theAxis);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears triangle set data.

Returns
-------
None
") Clear;
		void Clear();

		/****************** GetFaceID ******************/
		%feature("compactdefaultargs") GetFaceID;
		%feature("autodoc", "Returns face id of the given triangle.

Parameters
----------
theIndex: int

Returns
-------
int
") GetFaceID;
		Standard_Integer GetFaceID(const Standard_Integer theIndex);

		/****************** GetVertices ******************/
		%feature("compactdefaultargs") GetVertices;
		%feature("autodoc", "Returns vertices of the given triangle.

Parameters
----------
theIndex: int
theVertex1: BVH_Vec3d
theVertex2: BVH_Vec3d
theVertex3: BVH_Vec3d

Returns
-------
None
") GetVertices;
		void GetVertices(const Standard_Integer theIndex, BVH_Vec3d & theVertex1, BVH_Vec3d & theVertex2, BVH_Vec3d & theVertex3);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes triangle set.

Parameters
----------
theFaces: BRepExtrema_ShapeList

Returns
-------
bool
") Init;
		Standard_Boolean Init(const BRepExtrema_ShapeList & theFaces);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns total number of triangles.

Returns
-------
int
") Size;
		Standard_Integer Size();

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "Swaps indices of two specified triangles.

Parameters
----------
theIndex1: int
theIndex2: int

Returns
-------
None
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
		%feature("compactdefaultargs") BRepExtrema_SelfIntersection;
		%feature("autodoc", "Creates unitialized self-intersection tool.

Parameters
----------
theTolerance: float,optional
	default value is 0.0

Returns
-------
None
") BRepExtrema_SelfIntersection;
		 BRepExtrema_SelfIntersection(const Standard_Real theTolerance = 0.0);

		/****************** BRepExtrema_SelfIntersection ******************/
		%feature("compactdefaultargs") BRepExtrema_SelfIntersection;
		%feature("autodoc", "Creates self-intersection tool for the given shape.

Parameters
----------
theShape: TopoDS_Shape
theTolerance: float,optional
	default value is 0.0

Returns
-------
None
") BRepExtrema_SelfIntersection;
		 BRepExtrema_SelfIntersection(const TopoDS_Shape & theShape, const Standard_Real theTolerance = 0.0);

		/****************** ElementSet ******************/
		%feature("compactdefaultargs") ElementSet;
		%feature("autodoc", "Returns set of all the face triangles of the shape.

Returns
-------
opencascade::handle<BRepExtrema_TriangleSet>
") ElementSet;
		const opencascade::handle<BRepExtrema_TriangleSet> & ElementSet();

		/****************** GetSubShape ******************/
		%feature("compactdefaultargs") GetSubShape;
		%feature("autodoc", "Returns sub-shape from the shape for the given index (started from 0).

Parameters
----------
theID: int

Returns
-------
TopoDS_Face
") GetSubShape;
		const TopoDS_Face GetSubShape(const Standard_Integer theID);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the detection is completed.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LoadShape ******************/
		%feature("compactdefaultargs") LoadShape;
		%feature("autodoc", "Loads shape for detection of self-intersections.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
bool
") LoadShape;
		Standard_Boolean LoadShape(const TopoDS_Shape & theShape);

		/****************** OverlapElements ******************/
		%feature("compactdefaultargs") OverlapElements;
		%feature("autodoc", "Returns set of ids of overlapped sub-shapes (started from 0).

Returns
-------
BRepExtrema_MapOfIntegerPackedMapOfInteger
") OverlapElements;
		const BRepExtrema_MapOfIntegerPackedMapOfInteger & OverlapElements();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs detection of self-intersections.

Returns
-------
None
") Perform;
		void Perform();

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets tolerance value used for self-intersection test.

Parameters
----------
theTolerance: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTolerance);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns tolerance value used for self-intersection test.

Returns
-------
float
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
