/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") BRepExtrema

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


%include BRepExtrema_headers.i


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
typedef NCollection_Sequence <BRepExtrema_SolutionElem> BRepExtrema_SeqOfSolution;
/* end typedefs declaration */

/* public enums */
enum BRepExtrema_SupportType {
	BRepExtrema_IsVertex = 0,
	BRepExtrema_IsOnEdge = 1,
	BRepExtrema_IsInFace = 2,
};

/* end public enums declaration */

%nodefaultctor BRepExtrema_DistShapeShape;
class BRepExtrema_DistShapeShape {
	public:
		%feature("compactdefaultargs") BRepExtrema_DistShapeShape;
		%feature("autodoc", "	* create empty tool

	:rtype: None
") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape ();
		%feature("compactdefaultargs") BRepExtrema_DistShapeShape;
		%feature("autodoc", "	* computation of the minimum distance (value and pair of points) using default deflection Default value is Precision::Confusion().

	:param Shape1:
	:type Shape1: TopoDS_Shape &
	:param Shape2:
	:type Shape2: TopoDS_Shape &
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape (const TopoDS_Shape & Shape1,const TopoDS_Shape & Shape2,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") BRepExtrema_DistShapeShape;
		%feature("autodoc", "	* create tool and load both shapes into it

	:param Shape1:
	:type Shape1: TopoDS_Shape &
	:param Shape2:
	:type Shape2: TopoDS_Shape &
	:param theDeflection:
	:type theDeflection: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape (const TopoDS_Shape & Shape1,const TopoDS_Shape & Shape2,const Standard_Real theDeflection,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "	:param theDeflection:
	:type theDeflection: float
	:rtype: None
") SetDeflection;
		void SetDeflection (const Standard_Real theDeflection);
		%feature("compactdefaultargs") LoadS1;
		%feature("autodoc", "	* load first shape into extrema

	:param Shape1:
	:type Shape1: TopoDS_Shape &
	:rtype: None
") LoadS1;
		void LoadS1 (const TopoDS_Shape & Shape1);
		%feature("compactdefaultargs") LoadS2;
		%feature("autodoc", "	* load second shape into extrema

	:param Shape1:
	:type Shape1: TopoDS_Shape &
	:rtype: None
") LoadS2;
		void LoadS2 (const TopoDS_Shape & Shape1);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* computation of the minimum distance (value and couple of points). Parameter theDeflection is used to specify a maximum deviation of extreme distances from the minimum one. Returns IsDone status.

	:rtype: bool
") Perform;
		Standard_Boolean Perform ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the minimum distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbSolution;
		%feature("autodoc", "	* Returns the number of solutions satisfying the minimum distance.

	:rtype: int
") NbSolution;
		Standard_Integer NbSolution ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of the minimum distance.

	:rtype: float
") Value;
		Standard_Real Value ();
		%feature("compactdefaultargs") InnerSolution;
		%feature("autodoc", "	* True if one of the shapes is a solid and the other shape is completely or partially inside the solid.

	:rtype: bool
") InnerSolution;
		Standard_Boolean InnerSolution ();
		%feature("compactdefaultargs") PointOnShape1;
		%feature("autodoc", "	* Returns the Point corresponding to the <N>th solution on the first Shape

	:param N:
	:type N: int
	:rtype: gp_Pnt
") PointOnShape1;
		const gp_Pnt  PointOnShape1 (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnShape2;
		%feature("autodoc", "	* Returns the Point corresponding to the <N>th solution on the second Shape

	:param N:
	:type N: int
	:rtype: gp_Pnt
") PointOnShape2;
		const gp_Pnt  PointOnShape2 (const Standard_Integer N);
		%feature("compactdefaultargs") SupportTypeShape1;
		%feature("autodoc", "	* gives the type of the support where the Nth solution on the first shape is situated: IsVertex => the Nth solution on the first shape is a Vertex IsOnEdge => the Nth soluion on the first shape is on a Edge IsInFace => the Nth solution on the first shape is inside a face the corresponding support is obtained by the method SupportOnShape1

	:param N:
	:type N: int
	:rtype: BRepExtrema_SupportType
") SupportTypeShape1;
		BRepExtrema_SupportType SupportTypeShape1 (const Standard_Integer N);
		%feature("compactdefaultargs") SupportTypeShape2;
		%feature("autodoc", "	* gives the type of the support where the Nth solution on the second shape is situated: IsVertex => the Nth solution on the second shape is a Vertex IsOnEdge => the Nth soluion on the secondt shape is on a Edge IsInFace => the Nth solution on the second shape is inside a face the corresponding support is obtained by the method SupportOnShape2

	:param N:
	:type N: int
	:rtype: BRepExtrema_SupportType
") SupportTypeShape2;
		BRepExtrema_SupportType SupportTypeShape2 (const Standard_Integer N);
		%feature("compactdefaultargs") SupportOnShape1;
		%feature("autodoc", "	* gives the support where the Nth solution on the first shape is situated. This support can be a Vertex, an Edge or a Face.

	:param N:
	:type N: int
	:rtype: TopoDS_Shape
") SupportOnShape1;
		TopoDS_Shape SupportOnShape1 (const Standard_Integer N);
		%feature("compactdefaultargs") SupportOnShape2;
		%feature("autodoc", "	* gives the support where the Nth solution on the second shape is situated. This support can be a Vertex, an Edge or a Face.

	:param N:
	:type N: int
	:rtype: TopoDS_Shape
") SupportOnShape2;
		TopoDS_Shape SupportOnShape2 (const Standard_Integer N);
		%feature("compactdefaultargs") ParOnEdgeS1;
		%feature("autodoc", "	* gives the corresponding parameter t if the Nth solution is situated on an Egde of the first shape

	:param N:
	:type N: int
	:param t:
	:type t: float &
	:rtype: None
") ParOnEdgeS1;
		void ParOnEdgeS1 (const Standard_Integer N,Standard_Real &OutValue);
		%feature("compactdefaultargs") ParOnEdgeS2;
		%feature("autodoc", "	* gives the corresponding parameter t if the Nth solution is situated on an Egde of the first shape

	:param N:
	:type N: int
	:param t:
	:type t: float &
	:rtype: None
") ParOnEdgeS2;
		void ParOnEdgeS2 (const Standard_Integer N,Standard_Real &OutValue);
		%feature("compactdefaultargs") ParOnFaceS1;
		%feature("autodoc", "	* gives the corresponding parameters (U,V) if the Nth solution is situated on an face of the first shape

	:param N:
	:type N: int
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:rtype: None
") ParOnFaceS1;
		void ParOnFaceS1 (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ParOnFaceS2;
		%feature("autodoc", "	* gives the corresponding parameters (U,V) if the Nth solution is situated on an Face of the second shape

	:param N:
	:type N: int
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:rtype: None
") ParOnFaceS2;
		void ParOnFaceS2 (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "	:param F:
	:type F: Extrema_ExtFlag
	:rtype: None
") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "	:param A:
	:type A: Extrema_ExtAlgo
	:rtype: None
") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
};


%nodefaultctor BRepExtrema_DistanceSS;
class BRepExtrema_DistanceSS {
	public:
		%feature("compactdefaultargs") BRepExtrema_DistanceSS;
		%feature("autodoc", "	* computes the distance between two Shapes ( face edge vertex).

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param B1:
	:type B1: Bnd_Box &
	:param B2:
	:type B2: Bnd_Box &
	:param DstRef:
	:type DstRef: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") BRepExtrema_DistanceSS;
		 BRepExtrema_DistanceSS (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Bnd_Box & B1,const Bnd_Box & B2,const Standard_Real DstRef,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") BRepExtrema_DistanceSS;
		%feature("autodoc", "	* computes the distance between two Shapes ( face edge vertex). Parameter theDeflection is used to specify a maximum deviation of extreme distances from the minimum one. Default value is Precision::Confusion().

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param B1:
	:type B1: Bnd_Box &
	:param B2:
	:type B2: Bnd_Box &
	:param DstRef:
	:type DstRef: float
	:param aDeflection:
	:type aDeflection: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") BRepExtrema_DistanceSS;
		 BRepExtrema_DistanceSS (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Bnd_Box & B1,const Bnd_Box & B2,const Standard_Real DstRef,const Standard_Real aDeflection,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distance has been computed

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") DistValue;
		%feature("autodoc", "	* returns the distance value

	:rtype: float
") DistValue;
		Standard_Real DistValue ();
		%feature("compactdefaultargs") Seq1Value;
		%feature("autodoc", "	* returns the list of solutions on the first shape

	:rtype: BRepExtrema_SeqOfSolution
") Seq1Value;
		const BRepExtrema_SeqOfSolution & Seq1Value ();
		%feature("compactdefaultargs") Seq2Value;
		%feature("autodoc", "	* returns the list of solutions on the second shape

	:rtype: BRepExtrema_SeqOfSolution
") Seq2Value;
		const BRepExtrema_SeqOfSolution & Seq2Value ();
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "	* sets the flag controlling minimum and maximum search

	:param F:
	:type F: Extrema_ExtFlag
	:rtype: None
") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "	* sets the flag controlling ...

	:param A:
	:type A: Extrema_ExtAlgo
	:rtype: None
") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
};


%nodefaultctor BRepExtrema_ExtCC;
class BRepExtrema_ExtCC {
	public:
		%feature("compactdefaultargs") BRepExtrema_ExtCC;
		%feature("autodoc", "	:rtype: None
") BRepExtrema_ExtCC;
		 BRepExtrema_ExtCC ();
		%feature("compactdefaultargs") BRepExtrema_ExtCC;
		%feature("autodoc", "	* It calculates all the distances.

	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:rtype: None
") BRepExtrema_ExtCC;
		 BRepExtrema_ExtCC (const TopoDS_Edge & E1,const TopoDS_Edge & E2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param E2:
	:type E2: TopoDS_Edge &
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Edge & E2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* An exception is raised if the fields have not been initialized.

	:param E1:
	:type E1: TopoDS_Edge &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Edge & E1);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if E1 and E2 are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the <N>th extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") ParameterOnE1;
		%feature("autodoc", "	* Returns the parameter on the first edge of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: float
") ParameterOnE1;
		Standard_Real ParameterOnE1 (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnE1;
		%feature("autodoc", "	* Returns the Point of the <N>th extremum distance on the edge E1.

	:param N:
	:type N: int
	:rtype: gp_Pnt
") PointOnE1;
		gp_Pnt PointOnE1 (const Standard_Integer N);
		%feature("compactdefaultargs") ParameterOnE2;
		%feature("autodoc", "	* Returns the parameter on the second edge of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: float
") ParameterOnE2;
		Standard_Real ParameterOnE2 (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnE2;
		%feature("autodoc", "	* Returns the Point of the <N>th extremum distance on the edge E2.

	:param N:
	:type N: int
	:rtype: gp_Pnt
") PointOnE2;
		gp_Pnt PointOnE2 (const Standard_Integer N);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	* if the edges is a trimmed curve, dist11 is a square distance between the point on E1 of parameter FirstParameter and the point of parameter FirstParameter on E2.

	:param dist11:
	:type dist11: float &
	:param distP12:
	:type distP12: float &
	:param distP21:
	:type distP21: float &
	:param distP22:
	:type distP22: float &
	:param P11:
	:type P11: gp_Pnt
	:param P12:
	:type P12: gp_Pnt
	:param P21:
	:type P21: gp_Pnt
	:param P22:
	:type P22: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P11,gp_Pnt & P12,gp_Pnt & P21,gp_Pnt & P22);
};


%nodefaultctor BRepExtrema_ExtCF;
class BRepExtrema_ExtCF {
	public:
		%feature("compactdefaultargs") BRepExtrema_ExtCF;
		%feature("autodoc", "	:rtype: None
") BRepExtrema_ExtCF;
		 BRepExtrema_ExtCF ();
		%feature("compactdefaultargs") BRepExtrema_ExtCF;
		%feature("autodoc", "	* It calculates all the distances.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") BRepExtrema_ExtCF;
		 BRepExtrema_ExtCF (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* An exception is raised if the fields have not been initialized. Be careful: this method uses the Face only for classify not for the fields.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the <N>th extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the curve is on a parallel surface.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") ParameterOnEdge;
		%feature("autodoc", "	* Returns the parameters on the Edge of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: float
") ParameterOnEdge;
		Standard_Real ParameterOnEdge (const Standard_Integer N);
		%feature("compactdefaultargs") ParameterOnFace;
		%feature("autodoc", "	* Returns the parameters on the Face of the <N>th extremum distance.

	:param N:
	:type N: int
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") ParameterOnFace;
		void ParameterOnFace (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") PointOnEdge;
		%feature("autodoc", "	* Returns the Point of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: gp_Pnt
") PointOnEdge;
		gp_Pnt PointOnEdge (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnFace;
		%feature("autodoc", "	* Returns the Point of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: gp_Pnt
") PointOnFace;
		gp_Pnt PointOnFace (const Standard_Integer N);
};


%nodefaultctor BRepExtrema_ExtFF;
class BRepExtrema_ExtFF {
	public:
		%feature("compactdefaultargs") BRepExtrema_ExtFF;
		%feature("autodoc", "	:rtype: None
") BRepExtrema_ExtFF;
		 BRepExtrema_ExtFF ();
		%feature("compactdefaultargs") BRepExtrema_ExtFF;
		%feature("autodoc", "	* It calculates all the distances.

	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:rtype: None
") BRepExtrema_ExtFF;
		 BRepExtrema_ExtFF (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param F2:
	:type F2: TopoDS_Face &
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Face & F2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* An exception is raised if the fields have not been initialized. Be careful: this method uses the Face F2 only for classify, not for the fields.

	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the surfaces are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the <N>th extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") ParameterOnFace1;
		%feature("autodoc", "	* Returns the parameters on the Face F1 of the <N>th extremum distance.

	:param N:
	:type N: int
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") ParameterOnFace1;
		void ParameterOnFace1 (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ParameterOnFace2;
		%feature("autodoc", "	* Returns the parameters on the Face F2 of the <N>th extremum distance.

	:param N:
	:type N: int
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") ParameterOnFace2;
		void ParameterOnFace2 (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") PointOnFace1;
		%feature("autodoc", "	* Returns the Point of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: gp_Pnt
") PointOnFace1;
		gp_Pnt PointOnFace1 (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnFace2;
		%feature("autodoc", "	* Returns the Point of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: gp_Pnt
") PointOnFace2;
		gp_Pnt PointOnFace2 (const Standard_Integer N);
};


%nodefaultctor BRepExtrema_ExtPC;
class BRepExtrema_ExtPC {
	public:
		%feature("compactdefaultargs") BRepExtrema_ExtPC;
		%feature("autodoc", "	:rtype: None
") BRepExtrema_ExtPC;
		 BRepExtrema_ExtPC ();
		%feature("compactdefaultargs") BRepExtrema_ExtPC;
		%feature("autodoc", "	* It calculates all the distances.

	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") BRepExtrema_ExtPC;
		 BRepExtrema_ExtPC (const TopoDS_Vertex & V,const TopoDS_Edge & E);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* An exception is raised if the fields have not been initialized.

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the <N>th extremum distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the <N>th extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter on the edge of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: float
") Parameter;
		Standard_Real Parameter (const Standard_Integer N);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Point of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: gp_Pnt
") Point;
		gp_Pnt Point (const Standard_Integer N);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	* if the curve is a trimmed curve, dist1 is a square distance between <P> and the point of parameter FirstParameter <pnt1> and dist2 is a square distance between <P> and the point of parameter LastParameter <pnt2>.

	:param dist1:
	:type dist1: float &
	:param dist2:
	:type dist2: float &
	:param pnt1:
	:type pnt1: gp_Pnt
	:param pnt2:
	:type pnt2: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & pnt1,gp_Pnt & pnt2);
};


%nodefaultctor BRepExtrema_ExtPF;
class BRepExtrema_ExtPF {
	public:
		%feature("compactdefaultargs") BRepExtrema_ExtPF;
		%feature("autodoc", "	:rtype: None
") BRepExtrema_ExtPF;
		 BRepExtrema_ExtPF ();
		%feature("compactdefaultargs") BRepExtrema_ExtPF;
		%feature("autodoc", "	* It calculates all the distances.

	:param TheVertex:
	:type TheVertex: TopoDS_Vertex &
	:param TheFace:
	:type TheFace: TopoDS_Face &
	:param TheFlag: default value is Extrema_ExtFlag_MINMAX
	:type TheFlag: Extrema_ExtFlag
	:param TheAlgo: default value is Extrema_ExtAlgo_Grad
	:type TheAlgo: Extrema_ExtAlgo
	:rtype: None
") BRepExtrema_ExtPF;
		 BRepExtrema_ExtPF (const TopoDS_Vertex & TheVertex,const TopoDS_Face & TheFace,const Extrema_ExtFlag TheFlag = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo TheAlgo = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param TheFace:
	:type TheFace: TopoDS_Face &
	:param TheFlag: default value is Extrema_ExtFlag_MINMAX
	:type TheFlag: Extrema_ExtFlag
	:param TheAlgo: default value is Extrema_ExtAlgo_Grad
	:type TheAlgo: Extrema_ExtAlgo
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Face & TheFace,const Extrema_ExtFlag TheFlag = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo TheAlgo = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* An exception is raised if the fields have not been initialized. Be careful: this method uses the Face only for classify not for the fields.

	:param TheVertex:
	:type TheVertex: TopoDS_Vertex &
	:param TheFace:
	:type TheFace: TopoDS_Face &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Vertex & TheVertex,const TopoDS_Face & TheFace);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the <N>th extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameters on the Face of the <N>th extremum distance.

	:param N:
	:type N: int
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Parameter;
		void Parameter (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Point of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: gp_Pnt
") Point;
		gp_Pnt Point (const Standard_Integer N);
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "	:param F:
	:type F: Extrema_ExtFlag
	:rtype: None
") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "	:param A:
	:type A: Extrema_ExtAlgo
	:rtype: None
") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
};


%nodefaultctor BRepExtrema_Poly;
class BRepExtrema_Poly {
	public:
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* returns Standard_True if OK.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param dist:
	:type dist: float &
	:rtype: bool
") Distance;
		static Standard_Boolean Distance (const TopoDS_Shape & S1,const TopoDS_Shape & S2,gp_Pnt & P1,gp_Pnt & P2,Standard_Real &OutValue);
};


%nodefaultctor BRepExtrema_SolutionElem;
class BRepExtrema_SolutionElem {
	public:
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "	:rtype: None
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem ();
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "	* initialisation of the fields This constructor is used when the solution of a distance is a Vertex. The different initialized fields are:  _ the distance d  _ the solution point  _ the type of solution  _ and the Vertex.

	:param d:
	:type d: float
	:param Pt:
	:type Pt: gp_Pnt
	:param SolType:
	:type SolType: BRepExtrema_SupportType
	:param vertex:
	:type vertex: TopoDS_Vertex &
	:rtype: None
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem (const Standard_Real d,const gp_Pnt & Pt,const BRepExtrema_SupportType SolType,const TopoDS_Vertex & vertex);
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "	* initialisation of the fiels. This constructor is used when the solution of distance is on an Edge. The different initialized fields are:  _ the distance d,  _ the solution point,  _ the type of solution,  _ the Edge,  _ and the parameter t to locate the solution.

	:param d:
	:type d: float
	:param Pt:
	:type Pt: gp_Pnt
	:param SolType:
	:type SolType: BRepExtrema_SupportType
	:param edge:
	:type edge: TopoDS_Edge &
	:param t:
	:type t: float
	:rtype: None
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem (const Standard_Real d,const gp_Pnt & Pt,const BRepExtrema_SupportType SolType,const TopoDS_Edge & edge,const Standard_Real t);
		%feature("compactdefaultargs") BRepExtrema_SolutionElem;
		%feature("autodoc", "	* initialisation of the fields This constructor is used when the solution of distance is in a Face. The different initialized fields are:  _ the distance d,  _ the solution point,  _ the type of solution,  _ the Face,  _ and the parameter u et v to locate the solution.

	:param d:
	:type d: float
	:param Pt:
	:type Pt: gp_Pnt
	:param SolType:
	:type SolType: BRepExtrema_SupportType
	:param face:
	:type face: TopoDS_Face &
	:param u:
	:type u: float
	:param v:
	:type v: float
	:rtype: None
") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem (const Standard_Real d,const gp_Pnt & Pt,const BRepExtrema_SupportType SolType,const TopoDS_Face & face,const Standard_Real u,const Standard_Real v);
		%feature("compactdefaultargs") Dist;
		%feature("autodoc", "	* returns the value of the minimum distance.

	:rtype: float
") Dist;
		Standard_Real Dist ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* returns the solution point.

	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("compactdefaultargs") SupportKind;
		%feature("autodoc", "	* returns the Support type : //!	 IsVertex => The solution is a vertex. 	 IsOnEdge => The solution belongs to an Edge. 	 IsInFace => The solution is inside a Face.

	:rtype: BRepExtrema_SupportType
") SupportKind;
		BRepExtrema_SupportType SupportKind ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* returns the vertex if the solution is a Vertex.

	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* returns the vertex if the solution is an Edge.

	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* returns the vertex if the solution is an Face.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "	* returns the parameter t if the solution is on Edge.

	:param par1:
	:type par1: float &
	:rtype: None
") EdgeParameter;
		void EdgeParameter (Standard_Real &OutValue);
		%feature("compactdefaultargs") FaceParameter;
		%feature("autodoc", "	* returns the parameters u et v if the solution is in a Face.

	:param par1:
	:type par1: float &
	:param par2:
	:type par2: float &
	:rtype: None
") FaceParameter;
		void FaceParameter (Standard_Real &OutValue,Standard_Real &OutValue);
};


