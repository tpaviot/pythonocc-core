/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module BRepExtrema

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include BRepExtrema_required_python_modules.i
%include BRepExtrema_headers.i

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
		%feature("autodoc", "Args:
	None
Returns:
	None

create empty tool") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape ();
		%feature("autodoc", "Args:
	Shape1(TopoDS_Shape)
	Shape2(TopoDS_Shape)
	F(Extrema_ExtFlag)=Extrema_ExtFlag_MINMAX
	A(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

computation of the minimum distance (value and pair of points) using default deflection  
Default value is Precision::Confusion().") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape (const TopoDS_Shape & Shape1,const TopoDS_Shape & Shape2,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	Shape1(TopoDS_Shape)
	Shape2(TopoDS_Shape)
	theDeflection(Standard_Real)
	F(Extrema_ExtFlag)=Extrema_ExtFlag_MINMAX
	A(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

create tool and load both shapes into it") BRepExtrema_DistShapeShape;
		 BRepExtrema_DistShapeShape (const TopoDS_Shape & Shape1,const TopoDS_Shape & Shape2,const Standard_Real theDeflection,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	theDeflection(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetDeflection;
		void SetDeflection (const Standard_Real theDeflection);
		%feature("autodoc", "Args:
	Shape1(TopoDS_Shape)

Returns:
	None

load first shape into extrema") LoadS1;
		void LoadS1 (const TopoDS_Shape & Shape1);
		%feature("autodoc", "Args:
	Shape1(TopoDS_Shape)

Returns:
	None

load second shape into extrema") LoadS2;
		void LoadS2 (const TopoDS_Shape & Shape1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

computation of  the minimum  distance  (value  and  
         couple  of points). Parameter theDeflection is used  
         to specify a maximum deviation of extreme distances  
         from the minimum one.  
         Returns IsDone status.") Perform;
		Standard_Boolean Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the minimum distance is found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of solutions satisfying the minimum distance.") NbSolution;
		Standard_Integer NbSolution ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the minimum distance.") Value;
		Standard_Real Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if one of the shapes is a solid and the other shape  
is completely or partially inside the solid.") InnerSolution;
		Standard_Boolean InnerSolution ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Pnt

Returns the Point corresponding to the <N>th solution on the first Shape") PointOnShape1;
		const gp_Pnt & PointOnShape1 (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Pnt

Returns the Point corresponding to the <N>th solution on the second Shape") PointOnShape2;
		const gp_Pnt & PointOnShape2 (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	BRepExtrema_SupportType

gives the type of the support where the Nth solution on the first shape is situated:  
  IsVertex => the Nth solution on the first shape is a Vertex  
  IsOnEdge => the Nth soluion on the first shape is on a Edge  
  IsInFace => the Nth solution on the first shape is inside a face  
the corresponding support is obtained by the method SupportOnShape1") SupportTypeShape1;
		BRepExtrema_SupportType SupportTypeShape1 (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	BRepExtrema_SupportType

gives the type of the support where the Nth solution on the second shape is situated:  
  IsVertex => the Nth solution on the second shape is a Vertex  
  IsOnEdge => the Nth soluion on the secondt shape is on a Edge  
  IsInFace => the Nth solution on the second shape is inside a face  
the corresponding support is obtained by the method SupportOnShape2") SupportTypeShape2;
		BRepExtrema_SupportType SupportTypeShape2 (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	TopoDS_Shape

gives the support where the Nth solution on the first shape is situated.  
This support can be a Vertex, an Edge or a Face.") SupportOnShape1;
		TopoDS_Shape SupportOnShape1 (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	TopoDS_Shape

gives the support where the Nth solution on the second shape is situated.  
This support can be a Vertex, an Edge or a Face.") SupportOnShape2;
		TopoDS_Shape SupportOnShape2 (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	t(Standard_Real)

Returns:
	None

gives the corresponding parameter t if the Nth solution  
is situated on an Egde of the first shape") ParOnEdgeS1;
		void ParOnEdgeS1 (const Standard_Integer N,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	t(Standard_Real)

Returns:
	None

gives the corresponding parameter t if the Nth solution  
is situated on an Egde of the first shape") ParOnEdgeS2;
		void ParOnEdgeS2 (const Standard_Integer N,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	u(Standard_Real)
	v(Standard_Real)

Returns:
	None

gives the corresponding parameters (U,V) if the Nth solution  
is situated on an face of the first shape") ParOnFaceS1;
		void ParOnFaceS1 (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	u(Standard_Real)
	v(Standard_Real)

Returns:
	None

gives the corresponding parameters (U,V) if the Nth solution  
is situated on an Face of the second shape") ParOnFaceS2;
		void ParOnFaceS2 (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	o(Standard_OStream)

Returns:
	None

Prints on the stream o information on the current state of the object.") Dump;
		void Dump (Standard_OStream & o);
		%feature("autodoc", "Args:
	F(Extrema_ExtFlag)

Returns:
	None

No detailed docstring for this function.") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("autodoc", "Args:
	A(Extrema_ExtAlgo)

Returns:
	None

No detailed docstring for this function.") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
};


%feature("shadow") BRepExtrema_DistShapeShape::~BRepExtrema_DistShapeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepExtrema_DistShapeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepExtrema_DistanceSS;
class BRepExtrema_DistanceSS {
	public:
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	B1(Bnd_Box)
	B2(Bnd_Box)
	DstRef(Standard_Real)
	F(Extrema_ExtFlag)=Extrema_ExtFlag_MINMAX
	A(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

computes the distance between two Shapes ( face edge vertex).") BRepExtrema_DistanceSS;
		 BRepExtrema_DistanceSS (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Bnd_Box & B1,const Bnd_Box & B2,const Standard_Real DstRef,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	B1(Bnd_Box)
	B2(Bnd_Box)
	DstRef(Standard_Real)
	aDeflection(Standard_Real)
	F(Extrema_ExtFlag)=Extrema_ExtFlag_MINMAX
	A(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

computes the distance between two Shapes ( face edge vertex).  
Parameter theDeflection is used to specify a maximum deviation  
of extreme distances from the minimum one.  
Default value is Precision::Confusion().") BRepExtrema_DistanceSS;
		 BRepExtrema_DistanceSS (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Bnd_Box & B1,const Bnd_Box & B2,const Standard_Real DstRef,const Standard_Real aDeflection,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the distance has been computed") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the distance value") DistValue;
		Standard_Real DistValue ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepExtrema_SeqOfSolution

returns the list of solutions on the first shape") Seq1Value;
		const BRepExtrema_SeqOfSolution & Seq1Value ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepExtrema_SeqOfSolution

returns the list of solutions on the second shape") Seq2Value;
		const BRepExtrema_SeqOfSolution & Seq2Value ();
		%feature("autodoc", "Args:
	F(Extrema_ExtFlag)

Returns:
	None

sets the flag controlling minimum and maximum search") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("autodoc", "Args:
	A(Extrema_ExtAlgo)

Returns:
	None

sets the flag controlling ...") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
};


%feature("shadow") BRepExtrema_DistanceSS::~BRepExtrema_DistanceSS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepExtrema_DistanceSS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepExtrema_ExtCC;
class BRepExtrema_ExtCC {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepExtrema_ExtCC;
		 BRepExtrema_ExtCC ();
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)

Returns:
	None

It calculates all the distances.") BRepExtrema_ExtCC;
		 BRepExtrema_ExtCC (const TopoDS_Edge & E1,const TopoDS_Edge & E2);
		%feature("autodoc", "Args:
	E2(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopoDS_Edge & E2);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)

Returns:
	None

An exception is raised if the fields have not been initialized.") Perform;
		void Perform (const TopoDS_Edge & E1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if E1 and E2 are parallel.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the <N>th extremum square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the parameter on the first edge of the <N>th extremum distance.") ParameterOnE1;
		Standard_Real ParameterOnE1 (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Pnt

Returns the Point of the <N>th extremum distance on the edge E1.") PointOnE1;
		gp_Pnt PointOnE1 (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the parameter on the second edge of the <N>th extremum distance.") ParameterOnE2;
		Standard_Real ParameterOnE2 (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Pnt

Returns the Point of the <N>th extremum distance on the edge E2.") PointOnE2;
		gp_Pnt PointOnE2 (const Standard_Integer N);
		%feature("autodoc", "Args:
	dist11(Standard_Real)
	distP12(Standard_Real)
	distP21(Standard_Real)
	distP22(Standard_Real)
	P11(gp_Pnt)
	P12(gp_Pnt)
	P21(gp_Pnt)
	P22(gp_Pnt)

Returns:
	None

if the edges is a trimmed curve,  
dist11 is a square distance between the point on E1  
of parameter FirstParameter and the point of  
parameter FirstParameter on E2.") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P11,gp_Pnt & P12,gp_Pnt & P21,gp_Pnt & P22);
};


%feature("shadow") BRepExtrema_ExtCC::~BRepExtrema_ExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepExtrema_ExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepExtrema_ExtCF;
class BRepExtrema_ExtCF {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepExtrema_ExtCF;
		 BRepExtrema_ExtCF ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

It calculates all the distances.") BRepExtrema_ExtCF;
		 BRepExtrema_ExtCF (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

An exception is raised if the fields have not been initialized.  
Be careful: this method uses the Face only for classify not for the fields.") Perform;
		void Perform (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the <N>th extremum square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the curve is on a parallel surface.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the parameters on the Edge of the <N>th extremum distance.") ParameterOnEdge;
		Standard_Real ParameterOnEdge (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

Returns the parameters on the Face of the <N>th extremum distance.") ParameterOnFace;
		void ParameterOnFace (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Pnt

Returns the Point of the <N>th extremum distance.") PointOnEdge;
		gp_Pnt PointOnEdge (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Pnt

Returns the Point of the <N>th extremum distance.") PointOnFace;
		gp_Pnt PointOnFace (const Standard_Integer N);
};


%feature("shadow") BRepExtrema_ExtCF::~BRepExtrema_ExtCF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepExtrema_ExtCF {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepExtrema_ExtFF;
class BRepExtrema_ExtFF {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepExtrema_ExtFF;
		 BRepExtrema_ExtFF ();
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)

Returns:
	None

It calculates all the distances.") BRepExtrema_ExtFF;
		 BRepExtrema_ExtFF (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	F2(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)

Returns:
	None

An exception is raised if the fields have not been initialized.  
Be careful: this method uses the Face F2 only for classify, not for the fields.") Perform;
		void Perform (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the surfaces are parallel.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the <N>th extremum square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

Returns the parameters on the Face F1 of the <N>th extremum distance.") ParameterOnFace1;
		void ParameterOnFace1 (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

Returns the parameters on the Face F2 of the <N>th extremum distance.") ParameterOnFace2;
		void ParameterOnFace2 (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Pnt

Returns the Point of the <N>th extremum distance.") PointOnFace1;
		gp_Pnt PointOnFace1 (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Pnt

Returns the Point of the <N>th extremum distance.") PointOnFace2;
		gp_Pnt PointOnFace2 (const Standard_Integer N);
};


%feature("shadow") BRepExtrema_ExtFF::~BRepExtrema_ExtFF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepExtrema_ExtFF {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepExtrema_ExtPC;
class BRepExtrema_ExtPC {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepExtrema_ExtPC;
		 BRepExtrema_ExtPC ();
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)

Returns:
	None

It calculates all the distances.") BRepExtrema_ExtPC;
		 BRepExtrema_ExtPC (const TopoDS_Vertex & V,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	None

An exception is raised if the fields have not been initialized.") Perform;
		void Perform (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the <N>th extremum distance is a minimum.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the <N>th extremum square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the parameter on the edge of the <N>th extremum distance.") Parameter;
		Standard_Real Parameter (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Pnt

Returns the Point of the <N>th extremum distance.") Point;
		gp_Pnt Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	dist1(Standard_Real)
	dist2(Standard_Real)
	pnt1(gp_Pnt)
	pnt2(gp_Pnt)

Returns:
	None

if the curve is a trimmed curve,  
dist1 is a square distance between <P> and the point  
of parameter FirstParameter <pnt1> and  
dist2 is a square distance between <P> and the point  
of parameter LastParameter <pnt2>.") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & pnt1,gp_Pnt & pnt2);
};


%feature("shadow") BRepExtrema_ExtPC::~BRepExtrema_ExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepExtrema_ExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepExtrema_ExtPF;
class BRepExtrema_ExtPF {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepExtrema_ExtPF;
		 BRepExtrema_ExtPF ();
		%feature("autodoc", "Args:
	TheVertex(TopoDS_Vertex)
	TheFace(TopoDS_Face)
	TheFlag(Extrema_ExtFlag)=Extrema_ExtFlag_MINMAX
	TheAlgo(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

It calculates all the distances.") BRepExtrema_ExtPF;
		 BRepExtrema_ExtPF (const TopoDS_Vertex & TheVertex,const TopoDS_Face & TheFace,const Extrema_ExtFlag TheFlag = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo TheAlgo = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	TheFace(TopoDS_Face)
	TheFlag(Extrema_ExtFlag)=Extrema_ExtFlag_MINMAX
	TheAlgo(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopoDS_Face & TheFace,const Extrema_ExtFlag TheFlag = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo TheAlgo = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	TheVertex(TopoDS_Vertex)
	TheFace(TopoDS_Face)

Returns:
	None

An exception is raised if the fields have not been initialized.  
Be careful: this method uses the Face only for classify not for the fields.") Perform;
		void Perform (const TopoDS_Vertex & TheVertex,const TopoDS_Face & TheFace);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the <N>th extremum square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

Returns the parameters on the Face of the <N>th extremum distance.") Parameter;
		void Parameter (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Pnt

Returns the Point of the <N>th extremum distance.") Point;
		gp_Pnt Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	F(Extrema_ExtFlag)

Returns:
	None

No detailed docstring for this function.") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("autodoc", "Args:
	A(Extrema_ExtAlgo)

Returns:
	None

No detailed docstring for this function.") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
};


%feature("shadow") BRepExtrema_ExtPF::~BRepExtrema_ExtPF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepExtrema_ExtPF {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepExtrema_Poly;
class BRepExtrema_Poly {
	public:
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	P1(gp_Pnt)
	P2(gp_Pnt)
	dist(Standard_Real)

Returns:
	static Standard_Boolean

returns Standard_True if OK.") Distance;
		static Standard_Boolean Distance (const TopoDS_Shape & S1,const TopoDS_Shape & S2,gp_Pnt & P1,gp_Pnt & P2,Standard_Real &OutValue);
};


%feature("shadow") BRepExtrema_Poly::~BRepExtrema_Poly %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepExtrema_Poly {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepExtrema_SolutionElem;
class BRepExtrema_SolutionElem {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem ();
		%feature("autodoc", "Args:
	d(Standard_Real)
	Pt(gp_Pnt)
	SolType(BRepExtrema_SupportType)
	vertex(TopoDS_Vertex)

Returns:
	None

initialisation of the fields  
This constructor is used when the solution of a distance is a Vertex.  
The different initialized fields are:  
           _ the distance d  
           _ the solution point  
           _ the type of solution  
           _ and the Vertex.") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem (const Standard_Real d,const gp_Pnt & Pt,const BRepExtrema_SupportType SolType,const TopoDS_Vertex & vertex);
		%feature("autodoc", "Args:
	d(Standard_Real)
	Pt(gp_Pnt)
	SolType(BRepExtrema_SupportType)
	edge(TopoDS_Edge)
	t(Standard_Real)

Returns:
	None

initialisation of  the fiels.  
This constructor is used when the  solution of distance is on an Edge.  
The different initialized fields are:  
           _ the distance d,  
           _ the solution point,  
           _ the type of solution,  
           _ the Edge,  
           _ and the parameter t to locate the solution.") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem (const Standard_Real d,const gp_Pnt & Pt,const BRepExtrema_SupportType SolType,const TopoDS_Edge & edge,const Standard_Real t);
		%feature("autodoc", "Args:
	d(Standard_Real)
	Pt(gp_Pnt)
	SolType(BRepExtrema_SupportType)
	face(TopoDS_Face)
	u(Standard_Real)
	v(Standard_Real)

Returns:
	None

initialisation of the fields  
This constructor is used when the  solution of distance is in  
a Face. The different initialized fields are:  
           _ the distance d,  
           _ the solution point,  
           _ the type of solution,  
           _ the Face,  
           _ and the parameter u et v to locate the solution.") BRepExtrema_SolutionElem;
		 BRepExtrema_SolutionElem (const Standard_Real d,const gp_Pnt & Pt,const BRepExtrema_SupportType SolType,const TopoDS_Face & face,const Standard_Real u,const Standard_Real v);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the value of the minimum distance.") Dist;
		Standard_Real Dist ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

returns the solution point.") Point;
		const gp_Pnt & Point ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepExtrema_SupportType

returns the Support type :  
//!	    IsVertex => The solution is a vertex.  
	    IsOnEdge => The solution belongs to an Edge.  
	    IsInFace => The solution is inside a Face.") SupportKind;
		BRepExtrema_SupportType SupportKind ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

returns the vertex if the solution is a Vertex.") Vertex;
		const TopoDS_Vertex & Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

returns the vertex if the solution is an Edge.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

returns the vertex if the solution is an Face.") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	par1(Standard_Real)

Returns:
	None

returns the parameter t if the solution is on Edge.") EdgeParameter;
		void EdgeParameter (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	par1(Standard_Real)
	par2(Standard_Real)

Returns:
	None

returns the parameters u et v if the solution is in a Face.") FaceParameter;
		void FaceParameter (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") BRepExtrema_SolutionElem::~BRepExtrema_SolutionElem %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepExtrema_SolutionElem {
	void _kill_pointed() {
		delete $self;
	}
};
