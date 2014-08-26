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
%module ShapeFix

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

%include ShapeFix_required_python_modules.i
%include ShapeFix_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(shapefix) ShapeFix;
%nodefaultctor ShapeFix;
class ShapeFix {
	public:
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	enforce(Standard_Boolean)
	preci(Standard_Real)=0.0
	theProgress(Handle_Message_ProgressIndicator)=0

Returns:
	static Standard_Boolean

Runs SameParameter from BRepLib with these adaptations :  
          <enforce> forces computations, else they are made only on  
            Edges with flag SameParameter false  
          <preci>, if not precised, is taken for each EDge as its own  
          Tolerance  
          Returns True when done, False if an exception has been raised  
          In case of exception anyway, as many edges as possible have  
          been processed. The passed progress indicator allows user  
          to consult the current progress stage and abort algorithm  
          if needed.") SameParameter;
		static Standard_Boolean SameParameter (const TopoDS_Shape & shape,const Standard_Boolean enforce,const Standard_Real preci = 0.0,const Handle_Message_ProgressIndicator & theProgress = 0);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	tolang(Standard_Real)=1.0e-10

Returns:
	static void

Runs EncodeRegularity from BRepLib taking into account  
          shared components of assemblies, so that each component  
          is processed only once") EncodeRegularity;
		static void EncodeRegularity (const TopoDS_Shape & shape,const Standard_Real tolang = 1.0e-10);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	Tolerance(Standard_Real)
	context(Handle_ShapeBuild_ReShape)

Returns:
	static TopoDS_Shape

Removes edges which are less than given tolerance from shape  
         with help of ShapeFix_Wire::FixSmall()") RemoveSmallEdges;
		static TopoDS_Shape RemoveSmallEdges (TopoDS_Shape & shape,const Standard_Real Tolerance,Handle_ShapeBuild_ReShape & context);
		%feature("autodoc", "Args:
	theshape(TopoDS_Shape)
	theTolerance(Standard_Real)
	thecontext(Handle_ShapeBuild_ReShape)

Returns:
	static Standard_Boolean

Fix position of the vertices having tolerance more tnan specified one.;") FixVertexPosition;
		static Standard_Boolean FixVertexPosition (TopoDS_Shape & theshape,const Standard_Real theTolerance,const Handle_ShapeBuild_ReShape & thecontext);
		%feature("autodoc", "Args:
	theshape(TopoDS_Shape)

Returns:
	static Standard_Real

Calculate size of least edge;") LeastEdgeSize;
		static Standard_Real LeastEdgeSize (TopoDS_Shape & theshape);
};


%feature("shadow") ShapeFix::~ShapeFix %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d;
class ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d;
		 ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d ();
		%feature("autodoc", "Args:
	aMap(ShapeFix_DataMapOfShapeBox2d)

Returns:
	None

No detailed docstring for this function.") ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d;
		 ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d (const ShapeFix_DataMapOfShapeBox2d & aMap);
		%feature("autodoc", "Args:
	aMap(ShapeFix_DataMapOfShapeBox2d)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const ShapeFix_DataMapOfShapeBox2d & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box2d

No detailed docstring for this function.") Value;
		const Bnd_Box2d & Value ();
};


%feature("shadow") ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d::~ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeFix_DataMapNodeOfDataMapOfShapeBox2d;
class ShapeFix_DataMapNodeOfDataMapOfShapeBox2d : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Bnd_Box2d)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") ShapeFix_DataMapNodeOfDataMapOfShapeBox2d;
		 ShapeFix_DataMapNodeOfDataMapOfShapeBox2d (const TopoDS_Shape & K,const Bnd_Box2d & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box2d

No detailed docstring for this function.") Value;
		Bnd_Box2d & Value ();
};


%feature("shadow") ShapeFix_DataMapNodeOfDataMapOfShapeBox2d::~ShapeFix_DataMapNodeOfDataMapOfShapeBox2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_DataMapNodeOfDataMapOfShapeBox2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_DataMapNodeOfDataMapOfShapeBox2d {
	Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d GetHandle() {
	return *(Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d;
class Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d();
        Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d(const Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d &aHandle);
        Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d(const ShapeFix_DataMapNodeOfDataMapOfShapeBox2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d {
    ShapeFix_DataMapNodeOfDataMapOfShapeBox2d* GetObject() {
    return (ShapeFix_DataMapNodeOfDataMapOfShapeBox2d*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d::~Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeFix_DataMapOfShapeBox2d;
class ShapeFix_DataMapOfShapeBox2d : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") ShapeFix_DataMapOfShapeBox2d;
		 ShapeFix_DataMapOfShapeBox2d (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(ShapeFix_DataMapOfShapeBox2d)

Returns:
	ShapeFix_DataMapOfShapeBox2d

No detailed docstring for this function.") Assign;
		ShapeFix_DataMapOfShapeBox2d & Assign (const ShapeFix_DataMapOfShapeBox2d & Other);
		%feature("autodoc", "Args:
	Other(ShapeFix_DataMapOfShapeBox2d)

Returns:
	ShapeFix_DataMapOfShapeBox2d

No detailed docstring for this function.") operator=;
		ShapeFix_DataMapOfShapeBox2d & operator = (const ShapeFix_DataMapOfShapeBox2d & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Bnd_Box2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Bnd_Box2d & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Bnd_Box2d

No detailed docstring for this function.") Find;
		const Bnd_Box2d & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Bnd_Box2d

No detailed docstring for this function.") ChangeFind;
		Bnd_Box2d & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") ShapeFix_DataMapOfShapeBox2d::~ShapeFix_DataMapOfShapeBox2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_DataMapOfShapeBox2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeFix_Edge;
class ShapeFix_Edge : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeFix_Edge;
		 ShapeFix_Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeConstruct_ProjectCurveOnSurface

Returns the projector used for recomputing missing pcurves  
         Can be used for adjusting parameters of projector") Projector;
		Handle_ShapeConstruct_ProjectCurveOnSurface Projector ();
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") FixRemovePCurve;
		Standard_Boolean FixRemovePCurve (const TopoDS_Edge & edge,const TopoDS_Face & face);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	surface(Handle_Geom_Surface)
	location(TopLoc_Location)

Returns:
	Standard_Boolean

Removes the pcurve(s) of the edge if it does not match the  
         vertices  
         Check is done  
 Use    : It is to be called when pcurve of an edge can be wrong  
         (e.g., after import from IGES)  
 Returns: True, if does not match, removed (status DONE)  
         False, (status OK) if matches or (status FAIL) if no pcurve,  
         nothing done") FixRemovePCurve;
		Standard_Boolean FixRemovePCurve (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)

Returns:
	Standard_Boolean

Removes 3d curve of the edge if it does not match the vertices  
 Returns: True,  if does not match, removed (status DONE)  
         False, (status OK) if matches or (status FAIL) if no 3d curve,  
         nothing done") FixRemoveCurve3d;
		Standard_Boolean FixRemoveCurve3d (const TopoDS_Edge & edge);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)
	isSeam(Standard_Boolean)
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

See method below for information") FixAddPCurve;
		Standard_Boolean FixAddPCurve (const TopoDS_Edge & edge,const TopoDS_Face & face,const Standard_Boolean isSeam,const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	surface(Handle_Geom_Surface)
	location(TopLoc_Location)
	isSeam(Standard_Boolean)
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

See method below for information") FixAddPCurve;
		Standard_Boolean FixAddPCurve (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location,const Standard_Boolean isSeam,const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)
	isSeam(Standard_Boolean)
	surfana(Handle_ShapeAnalysis_Surface)
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

See method below for information") FixAddPCurve;
		Standard_Boolean FixAddPCurve (const TopoDS_Edge & edge,const TopoDS_Face & face,const Standard_Boolean isSeam,const Handle_ShapeAnalysis_Surface & surfana,const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	surface(Handle_Geom_Surface)
	location(TopLoc_Location)
	isSeam(Standard_Boolean)
	surfana(Handle_ShapeAnalysis_Surface)
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

Adds pcurve(s) of the edge if missing (by projecting 3d curve)  
         Parameter isSeam indicates if the edge is a seam.  
         The parameter <prec> defines the precision for calculations.  
         If it is 0 (default), the tolerance of the edge is taken.  
 Remark : This method is rather for internal use since it accepts parameter  
         <surfana> for optimization of computations  
 Use    : It is to be called after FixRemovePCurve (if removed) or in any  
         case when edge can have no pcurve  
 Returns: True if pcurve was added, else False  
 Status :  
         OK   : Pcurve exists  
         FAIL1: No 3d curve  
         FAIL2: fail during projecting  
         DONE1: Pcurve was added  
         DONE2: specific case of pcurve going through degenerated point on  
                sphere encountered during projection (see class  
                ShapeConstruct_ProjectCurveOnSurface for more info)") FixAddPCurve;
		Standard_Boolean FixAddPCurve (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location,const Standard_Boolean isSeam,const Handle_ShapeAnalysis_Surface & surfana,const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)

Returns:
	Standard_Boolean

Tries to build 3d curve of the edge if missing  
 Use    : It is to be called after FixRemoveCurve3d (if removed) or in any  
         case when edge can have no 3d curve  
 Returns: True if 3d curve was added, else False  
 Status :  
         OK   : 3d curve exists  
         FAIL1: BRepLib::BuildCurve3d() has failed  
         DONE1: 3d curve was added") FixAddCurve3d;
		Standard_Boolean FixAddCurve3d (const TopoDS_Edge & edge);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") FixVertexTolerance;
		Standard_Boolean FixVertexTolerance (const TopoDS_Edge & edge,const TopoDS_Face & face);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)

Returns:
	Standard_Boolean

Increases the tolerances of the edge vertices to comprise  
         the ends of 3d curve and pcurve on the given face  
         (first method) or all pcurves stored in an edge (second one)  
 Returns: True, if tolerances have been increased, otherwise False  
 Status:  
         OK   : the original tolerances have not been changed  
         DONE1: the tolerance of first vertex has been increased  
         DONE2: the tolerance of last  vertex has been increased") FixVertexTolerance;
		Standard_Boolean FixVertexTolerance (const TopoDS_Edge & edge);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") FixReversed2d;
		Standard_Boolean FixReversed2d (const TopoDS_Edge & edge,const TopoDS_Face & face);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	surface(Handle_Geom_Surface)
	location(TopLoc_Location)

Returns:
	Standard_Boolean

Fixes edge if pcurve is directed opposite to 3d curve  
         Check is done by call to the function  
         ShapeAnalysis_Edge::CheckCurve3dWithPCurve()  
 Warning: For seam edge this method will check and fix the pcurve in only  
         one direction. Hence, it should be called twice for seam edge:  
         once with edge orientation FORWARD and once with REVERSED.  
 Returns: False if nothing done, True if reversed (status DONE)  
 Status:  OK    - pcurve OK, nothing done  
         FAIL1 - no pcurve  
         FAIL2 - no 3d curve  
         DONE1 - pcurve was reversed") FixReversed2d;
		Standard_Boolean FixReversed2d (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	tolerance(Standard_Real)=0.0

Returns:
	Standard_Boolean

Tries to make edge SameParameter and sets corresponding  
         tolerance and SameParameter flag.  
         First, it makes edge same range if SameRange flag is not set.  
 
         If flag SameParameter is set, this method calls the  
         function ShapeAnalysis_Edge::CheckSameParameter() that  
         calculates the maximal deviation of pcurves of the edge from  
         its 3d curve. If deviation > tolerance, the tolerance of edge  
         is increased to a value of deviation. If deviation < tolerance  
         nothing happens.  
 
         If flag SameParameter is not set, this method chooses the best  
         variant (one that has minimal tolerance), either  
         a. only after computing deviation (as above) or  
         b. after calling standard procedure BRepLib::SameParameter  
         and computing deviation (as above). If <tolerance> > 0, it is  
         used as parameter for BRepLib::SameParameter, otherwise,  
         tolerance of the edge is used.  
 
 Use    : Is to be called after all pcurves and 3d curve of the edge are  
         correctly computed  
 Remark : SameParameter flag is always set to True after this method  
 Returns: True, if something done, else False  
 Status : OK    - edge was initially SameParameter, nothing is done  
         FAIL1 - computation of deviation of pcurves from 3d curve has failed  
         FAIL2 - BRepLib::SameParameter() has failed  
         DONE1 - tolerance of the edge was increased  
         DONE2 - flag SameParameter was set to True (only if  
                 BRepLib::SameParameter() did not set it)  
         DONE3 - edge was modified by BRepLib::SameParameter() to SameParameter  
         DONE4 - not used anymore  
         DONE5 - if the edge resulting from BRepLib has been chosen, i.e. variant b. above  
                 (only for edges with not set SameParameter)") FixSameParameter;
		Standard_Boolean FixSameParameter (const TopoDS_Edge & edge,const Standard_Real tolerance = 0.0);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Returns the status (in the form of True/False) of last Fix") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
};


%feature("shadow") ShapeFix_Edge::~ShapeFix_Edge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_Edge {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_Edge {
	Handle_ShapeFix_Edge GetHandle() {
	return *(Handle_ShapeFix_Edge*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_Edge;
class Handle_ShapeFix_Edge : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeFix_Edge();
        Handle_ShapeFix_Edge(const Handle_ShapeFix_Edge &aHandle);
        Handle_ShapeFix_Edge(const ShapeFix_Edge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Edge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Edge {
    ShapeFix_Edge* GetObject() {
    return (ShapeFix_Edge*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_Edge::~Handle_ShapeFix_Edge %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_Edge {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeFix_EdgeConnect;
class ShapeFix_EdgeConnect {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeFix_EdgeConnect;
		 ShapeFix_EdgeConnect ();
		%feature("autodoc", "Args:
	aFirst(TopoDS_Edge)
	aSecond(TopoDS_Edge)

Returns:
	None

Adds information on connectivity between start vertex  
          of second edge and end vertex of first edge,  
          taking edges orientation into account") Add;
		void Add (const TopoDS_Edge & aFirst,const TopoDS_Edge & aSecond);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	None

Adds connectivity information for the whole shape.  
          Note: edges in wires must be well ordered  
          Note: flag Closed should be set for closed wires") Add;
		void Add (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	None
Returns:
	None

Builds shared vertices, updates their positions and tolerances") Build;
		void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears internal data structure") Clear;
		void Clear ();
};


%feature("shadow") ShapeFix_EdgeConnect::~ShapeFix_EdgeConnect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_EdgeConnect {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeFix_EdgeProjAux;
class ShapeFix_EdgeProjAux : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeFix_EdgeProjAux;
		 ShapeFix_EdgeProjAux ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") ShapeFix_EdgeProjAux;
		 ShapeFix_EdgeProjAux (const TopoDS_Face & F,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Face & F,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	preci(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Compute;
		void Compute (const Standard_Real preci);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsFirstDone;
		Standard_Boolean IsFirstDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLastDone;
		Standard_Boolean IsLastDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstParam;
		Standard_Real FirstParam ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastParam;
		Standard_Real LastParam ();
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsIso;
		Standard_Boolean IsIso (const Handle_Geom2d_Curve & C);
};


%feature("shadow") ShapeFix_EdgeProjAux::~ShapeFix_EdgeProjAux %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_EdgeProjAux {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_EdgeProjAux {
	Handle_ShapeFix_EdgeProjAux GetHandle() {
	return *(Handle_ShapeFix_EdgeProjAux*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_EdgeProjAux;
class Handle_ShapeFix_EdgeProjAux : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeFix_EdgeProjAux();
        Handle_ShapeFix_EdgeProjAux(const Handle_ShapeFix_EdgeProjAux &aHandle);
        Handle_ShapeFix_EdgeProjAux(const ShapeFix_EdgeProjAux *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_EdgeProjAux DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_EdgeProjAux {
    ShapeFix_EdgeProjAux* GetObject() {
    return (ShapeFix_EdgeProjAux*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_EdgeProjAux::~Handle_ShapeFix_EdgeProjAux %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_EdgeProjAux {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeFix_FaceConnect;
class ShapeFix_FaceConnect {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeFix_FaceConnect;
		 ShapeFix_FaceConnect ();
		%feature("autodoc", "Args:
	aFirst(TopoDS_Face)
	aSecond(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const TopoDS_Face & aFirst,const TopoDS_Face & aSecond);
		%feature("autodoc", "Args:
	shell(TopoDS_Shell)
	sewtoler(Standard_Real)
	fixtoler(Standard_Real)

Returns:
	TopoDS_Shell

No detailed docstring for this function.") Build;
		TopoDS_Shell Build (const TopoDS_Shell & shell,const Standard_Real sewtoler,const Standard_Real fixtoler);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears internal data structure") Clear;
		void Clear ();
};


%feature("shadow") ShapeFix_FaceConnect::~ShapeFix_FaceConnect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_FaceConnect {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeFix_FreeBounds;
class ShapeFix_FreeBounds {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	sewtoler(Standard_Real)
	closetoler(Standard_Real)
	splitclosed(Standard_Boolean)
	splitopen(Standard_Boolean)

Returns:
	None

Builds forecasting free bounds of the <shape> and connects  
         open wires with tolerance <closetoler>.  
         <shape> should be a compound of faces.  
         Tolerance <closetoler> should be greater than tolerance  
         <sewtoler> used for initializing sewing analyzer, otherwise  
         connection of open wires is not performed.") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds (const TopoDS_Shape & shape,const Standard_Real sewtoler,const Standard_Real closetoler,const Standard_Boolean splitclosed,const Standard_Boolean splitopen);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	closetoler(Standard_Real)
	splitclosed(Standard_Boolean)
	splitopen(Standard_Boolean)

Returns:
	None

Builds actual free bounds of the <shape> and connects  
         open wires with tolerance <closetoler>.  
         <shape> should be a compound of shells.") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds (const TopoDS_Shape & shape,const Standard_Real closetoler,const Standard_Boolean splitclosed,const Standard_Boolean splitopen);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Compound

Returns compound of closed wires out of free edges.") GetClosedWires;
		const TopoDS_Compound & GetClosedWires ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Compound

Returns compound of open wires out of free edges.") GetOpenWires;
		const TopoDS_Compound & GetOpenWires ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns modified source shape.") GetShape;
		const TopoDS_Shape & GetShape ();
};


%feature("shadow") ShapeFix_FreeBounds::~ShapeFix_FreeBounds %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_FreeBounds {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeFix_IntersectionTool;
class ShapeFix_IntersectionTool {
	public:
		%feature("autodoc", "Args:
	context(Handle_ShapeBuild_ReShape)
	preci(Standard_Real)
	maxtol(Standard_Real)=1.0

Returns:
	None

Constructor") ShapeFix_IntersectionTool;
		 ShapeFix_IntersectionTool (const Handle_ShapeBuild_ReShape & context,const Standard_Real preci,const Standard_Real maxtol = 1.0);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeBuild_ReShape

Returns context") Context;
		Handle_ShapeBuild_ReShape Context ();
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	param(Standard_Real)
	vert(TopoDS_Vertex)
	face(TopoDS_Face)
	newE1(TopoDS_Edge)
	newE2(TopoDS_Edge)
	preci(Standard_Real)

Returns:
	Standard_Boolean

Split edge on two new edges using new vertex 'vert'  
         and 'param' - parameter for splitting  
         The 'face' is necessary for pcurves and using TransferParameterProj") SplitEdge;
		Standard_Boolean SplitEdge (const TopoDS_Edge & edge,const Standard_Real param,const TopoDS_Vertex & vert,const TopoDS_Face & face,TopoDS_Edge & newE1,TopoDS_Edge & newE2,const Standard_Real preci);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	pend(Standard_Real)
	cut(Standard_Real)
	face(TopoDS_Face)
	iscutline(Standard_Boolean)

Returns:
	Standard_Boolean

Cut edge by parameters pend and cut") CutEdge;
		Standard_Boolean CutEdge (const TopoDS_Edge & edge,const Standard_Real pend,const Standard_Real cut,const TopoDS_Face & face,Standard_Boolean & iscutline);
		%feature("autodoc", "Args:
	sewd(Handle_ShapeExtend_WireData)
	face(TopoDS_Face)
	NbSplit(Standard_Integer)
	NbCut(Standard_Integer)
	NbRemoved(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") FixSelfIntersectWire;
		Standard_Boolean FixSelfIntersectWire (Handle_ShapeExtend_WireData & sewd,const TopoDS_Face & face,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	face(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") FixIntersectingWires;
		Standard_Boolean FixIntersectingWires (TopoDS_Face & face);
};


%feature("shadow") ShapeFix_IntersectionTool::~ShapeFix_IntersectionTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_IntersectionTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeFix_Root;
class ShapeFix_Root : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty Constructor (no context is created)") ShapeFix_Root;
		 ShapeFix_Root ();
		%feature("autodoc", "Args:
	Root(Handle_ShapeFix_Root)

Returns:
	virtual void

Copy all fields from another Root object") Set;
		virtual void Set (const Handle_ShapeFix_Root & Root);
		%feature("autodoc", "Args:
	context(Handle_ShapeBuild_ReShape)

Returns:
	virtual void

Sets context") SetContext;
		virtual void SetContext (const Handle_ShapeBuild_ReShape & context);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeBuild_ReShape

Returns context") Context;
		Handle_ShapeBuild_ReShape Context ();
		%feature("autodoc", "Args:
	msgreg(Handle_ShapeExtend_BasicMsgRegistrator)

Returns:
	virtual void

Sets message registrator") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const Handle_ShapeExtend_BasicMsgRegistrator & msgreg);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeExtend_BasicMsgRegistrator

Returns message registrator") MsgRegistrator;
		Handle_ShapeExtend_BasicMsgRegistrator MsgRegistrator ();
		%feature("autodoc", "Args:
	preci(Standard_Real)

Returns:
	virtual void

Sets basic precision value") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns basic precision value") Precision;
		Standard_Real Precision ();
		%feature("autodoc", "Args:
	mintol(Standard_Real)

Returns:
	virtual void

Sets minimal allowed tolerance") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns minimal allowed tolerance") MinTolerance;
		Standard_Real MinTolerance ();
		%feature("autodoc", "Args:
	maxtol(Standard_Real)

Returns:
	virtual void

Sets maximal allowed tolerance") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns maximal allowed tolerance") MaxTolerance;
		Standard_Real MaxTolerance ();
		%feature("autodoc", "Args:
	toler(Standard_Real)

Returns:
	Standard_Real

Returns tolerance limited by [myMinTol,myMaxTol]") LimitTolerance;
		Standard_Real LimitTolerance (const Standard_Real toler);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	message(Message_Msg)
	gravity(Message_Gravity)=Message_Info

Returns:
	None

Sends a message to be attached to the shape.  
         Calls corresponding message of message registrator.") SendMsg;
		void SendMsg (const TopoDS_Shape & shape,const Message_Msg & message,const Message_Gravity gravity = Message_Info);
		%feature("autodoc", "Args:
	message(Message_Msg)
	gravity(Message_Gravity)=Message_Info

Returns:
	None

Sends a message to be attached to myShape.  
         Calls previous method.") SendMsg;
		void SendMsg (const Message_Msg & message,const Message_Gravity gravity = Message_Info);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	message(Message_Msg)

Returns:
	None

Sends a warning to be attached to the shape.  
         Calls SendMsg with gravity set to Message_Warning.") SendWarning;
		void SendWarning (const TopoDS_Shape & shape,const Message_Msg & message);
		%feature("autodoc", "Args:
	message(Message_Msg)

Returns:
	None

Calls previous method for myShape.") SendWarning;
		void SendWarning (const Message_Msg & message);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	message(Message_Msg)

Returns:
	None

Sends a fail to be attached to the shape.  
         Calls SendMsg with gravity set to Message_Fail.") SendFail;
		void SendFail (const TopoDS_Shape & shape,const Message_Msg & message);
		%feature("autodoc", "Args:
	message(Message_Msg)

Returns:
	None

Calls previous method for myShape.") SendFail;
		void SendFail (const Message_Msg & message);
};


%feature("shadow") ShapeFix_Root::~ShapeFix_Root %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_Root {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_Root {
	Handle_ShapeFix_Root GetHandle() {
	return *(Handle_ShapeFix_Root*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_Root;
class Handle_ShapeFix_Root : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeFix_Root();
        Handle_ShapeFix_Root(const Handle_ShapeFix_Root &aHandle);
        Handle_ShapeFix_Root(const ShapeFix_Root *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Root DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Root {
    ShapeFix_Root* GetObject() {
    return (ShapeFix_Root*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_Root::~Handle_ShapeFix_Root %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_Root {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeFix_SequenceNodeOfSequenceOfWireSegment;
class ShapeFix_SequenceNodeOfSequenceOfWireSegment : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(ShapeFix_WireSegment)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") ShapeFix_SequenceNodeOfSequenceOfWireSegment;
		 ShapeFix_SequenceNodeOfSequenceOfWireSegment (const ShapeFix_WireSegment & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	ShapeFix_WireSegment

No detailed docstring for this function.") Value;
		ShapeFix_WireSegment & Value ();
};


%feature("shadow") ShapeFix_SequenceNodeOfSequenceOfWireSegment::~ShapeFix_SequenceNodeOfSequenceOfWireSegment %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_SequenceNodeOfSequenceOfWireSegment {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_SequenceNodeOfSequenceOfWireSegment {
	Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment GetHandle() {
	return *(Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment;
class Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment();
        Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment(const Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment &aHandle);
        Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment(const ShapeFix_SequenceNodeOfSequenceOfWireSegment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment {
    ShapeFix_SequenceNodeOfSequenceOfWireSegment* GetObject() {
    return (ShapeFix_SequenceNodeOfSequenceOfWireSegment*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment::~Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeFix_SequenceOfWireSegment;
class ShapeFix_SequenceOfWireSegment : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeFix_SequenceOfWireSegment;
		 ShapeFix_SequenceOfWireSegment ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(ShapeFix_SequenceOfWireSegment)

Returns:
	ShapeFix_SequenceOfWireSegment

No detailed docstring for this function.") Assign;
		const ShapeFix_SequenceOfWireSegment & Assign (const ShapeFix_SequenceOfWireSegment & Other);
		%feature("autodoc", "Args:
	Other(ShapeFix_SequenceOfWireSegment)

Returns:
	ShapeFix_SequenceOfWireSegment

No detailed docstring for this function.") operator=;
		const ShapeFix_SequenceOfWireSegment & operator = (const ShapeFix_SequenceOfWireSegment & Other);
		%feature("autodoc", "Args:
	T(ShapeFix_WireSegment)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const ShapeFix_WireSegment & T);
		%feature("autodoc", "Args:
	S(ShapeFix_SequenceOfWireSegment)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (ShapeFix_SequenceOfWireSegment & S);
		%feature("autodoc", "Args:
	T(ShapeFix_WireSegment)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const ShapeFix_WireSegment & T);
		%feature("autodoc", "Args:
	S(ShapeFix_SequenceOfWireSegment)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (ShapeFix_SequenceOfWireSegment & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(ShapeFix_WireSegment)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const ShapeFix_WireSegment & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(ShapeFix_SequenceOfWireSegment)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ShapeFix_SequenceOfWireSegment & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(ShapeFix_WireSegment)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const ShapeFix_WireSegment & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(ShapeFix_SequenceOfWireSegment)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ShapeFix_SequenceOfWireSegment & S);
		%feature("autodoc", "Args:
	None
Returns:
	ShapeFix_WireSegment

No detailed docstring for this function.") First;
		const ShapeFix_WireSegment & First ();
		%feature("autodoc", "Args:
	None
Returns:
	ShapeFix_WireSegment

No detailed docstring for this function.") Last;
		const ShapeFix_WireSegment & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(ShapeFix_SequenceOfWireSegment)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,ShapeFix_SequenceOfWireSegment & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	ShapeFix_WireSegment

No detailed docstring for this function.") Value;
		const ShapeFix_WireSegment & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(ShapeFix_WireSegment)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const ShapeFix_WireSegment & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	ShapeFix_WireSegment

No detailed docstring for this function.") ChangeValue;
		ShapeFix_WireSegment & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") ShapeFix_SequenceOfWireSegment::~ShapeFix_SequenceOfWireSegment %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_SequenceOfWireSegment {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeFix_ShapeTolerance;
class ShapeFix_ShapeTolerance {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeFix_ShapeTolerance;
		 ShapeFix_ShapeTolerance ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	tmin(Standard_Real)
	tmax(Standard_Real)=0.0
	styp(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	Standard_Boolean

Limits tolerances in a shape as follows :  
         tmin = tmax -> as SetTolerance (forces)  
         tmin = 0   -> maximum tolerance will be <tmax>  
         tmax = 0 or not given (more generally, tmax < tmin) ->  
            <tmax> ignored, minimum will be <tmin>  
         else, maximum will be <max> and minimum will be <min>  
         styp = VERTEX : only vertices are set  
         styp = EDGE   : only edges are set  
         styp = FACE   : only faces are set  
         styp = WIRE   : to have edges and their vertices set  
         styp = other value : all (vertices,edges,faces) are set  
         Returns True if at least one tolerance of the sub-shape has  
         been modified") LimitTolerance;
		Standard_Boolean LimitTolerance (const TopoDS_Shape & shape,const Standard_Real tmin,const Standard_Real tmax = 0.0,const TopAbs_ShapeEnum styp = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	preci(Standard_Real)
	styp(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	None

Sets (enforces) tolerances in a shape to the given value  
         styp = VERTEX : only vertices are set  
         styp = EDGE   : only edges are set  
         styp = FACE   : only faces are set  
         styp = WIRE   : to have edges and their vertices set  
         styp = other value : all (vertices,edges,faces) are set") SetTolerance;
		void SetTolerance (const TopoDS_Shape & shape,const Standard_Real preci,const TopAbs_ShapeEnum styp = TopAbs_SHAPE);
};


%feature("shadow") ShapeFix_ShapeTolerance::~ShapeFix_ShapeTolerance %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_ShapeTolerance {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeFix_SplitTool;
class ShapeFix_SplitTool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeFix_SplitTool;
		 ShapeFix_SplitTool ();
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	param(Standard_Real)
	vert(TopoDS_Vertex)
	face(TopoDS_Face)
	newE1(TopoDS_Edge)
	newE2(TopoDS_Edge)
	tol3d(Standard_Real)
	tol2d(Standard_Real)

Returns:
	Standard_Boolean

Split edge on two new edges using new vertex 'vert'  
         and 'param' - parameter for splitting  
         The 'face' is necessary for pcurves and using TransferParameterProj") SplitEdge;
		Standard_Boolean SplitEdge (const TopoDS_Edge & edge,const Standard_Real param,const TopoDS_Vertex & vert,const TopoDS_Face & face,TopoDS_Edge & newE1,TopoDS_Edge & newE2,const Standard_Real tol3d,const Standard_Real tol2d);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	param1(Standard_Real)
	param2(Standard_Real)
	vert(TopoDS_Vertex)
	face(TopoDS_Face)
	newE1(TopoDS_Edge)
	newE2(TopoDS_Edge)
	tol3d(Standard_Real)
	tol2d(Standard_Real)

Returns:
	Standard_Boolean

Split edge on two new edges using new vertex 'vert'  
         and 'param1' and 'param2' - parameter for splitting and cutting  
         The 'face' is necessary for pcurves and using TransferParameterProj") SplitEdge;
		Standard_Boolean SplitEdge (const TopoDS_Edge & edge,const Standard_Real param1,const Standard_Real param2,const TopoDS_Vertex & vert,const TopoDS_Face & face,TopoDS_Edge & newE1,TopoDS_Edge & newE2,const Standard_Real tol3d,const Standard_Real tol2d);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	pend(Standard_Real)
	cut(Standard_Real)
	face(TopoDS_Face)
	iscutline(Standard_Boolean)

Returns:
	Standard_Boolean

Cut edge by parameters pend and cut") CutEdge;
		Standard_Boolean CutEdge (const TopoDS_Edge & edge,const Standard_Real pend,const Standard_Real cut,const TopoDS_Face & face,Standard_Boolean & iscutline);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	fp(Standard_Real)
	V1(TopoDS_Vertex)
	lp(Standard_Real)
	V2(TopoDS_Vertex)
	face(TopoDS_Face)
	SeqE(TopTools_SequenceOfShape)
	aNum(Standard_Integer)
	context(Handle_ShapeBuild_ReShape)
	tol3d(Standard_Real)
	tol2d(Standard_Real)

Returns:
	Standard_Boolean

Split edge on two new edges using two new vertex V1 and V2  
         and two parameters for splitting - fp and lp correspondingly  
         The 'face' is necessary for pcurves and using TransferParameterProj  
         aNum - number of edge in SeqE which corresponding to [fp,lp]") SplitEdge;
		Standard_Boolean SplitEdge (const TopoDS_Edge & edge,const Standard_Real fp,const TopoDS_Vertex & V1,const Standard_Real lp,const TopoDS_Vertex & V2,const TopoDS_Face & face,TopTools_SequenceOfShape & SeqE,Standard_Integer &OutValue,const Handle_ShapeBuild_ReShape & context,const Standard_Real tol3d,const Standard_Real tol2d);
};


%feature("shadow") ShapeFix_SplitTool::~ShapeFix_SplitTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_SplitTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeFix_WireVertex;
class ShapeFix_WireVertex {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeFix_WireVertex;
		 ShapeFix_WireVertex ();
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)
	preci(Standard_Real)

Returns:
	None

Loads the wire, ininializes internal analyzer  
         (ShapeAnalysis_WireVertex) with the given precision,  
         and performs analysis") Init;
		void Init (const TopoDS_Wire & wire,const Standard_Real preci);
		%feature("autodoc", "Args:
	sbwd(Handle_ShapeExtend_WireData)
	preci(Standard_Real)

Returns:
	None

Loads the wire, ininializes internal analyzer  
         (ShapeAnalysis_WireVertex) with the given precision,  
         and performs analysis") Init;
		void Init (const Handle_ShapeExtend_WireData & sbwd,const Standard_Real preci);
		%feature("autodoc", "Args:
	sawv(ShapeAnalysis_WireVertex)

Returns:
	None

Loads all the data on wire, already analysed by  
         ShapeAnalysis_WireVertex") Init;
		void Init (const ShapeAnalysis_WireVertex & sawv);
		%feature("autodoc", "Args:
	None
Returns:
	ShapeAnalysis_WireVertex

returns internal analyzer") Analyzer;
		const ShapeAnalysis_WireVertex & Analyzer ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeExtend_WireData

returns data on wire (fixed)") WireData;
		const Handle_ShapeExtend_WireData & WireData ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

returns resulting wire (fixed)") Wire;
		TopoDS_Wire Wire ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Fixes 'Same' or 'Close' status (same vertex may be set,  
         without changing parameters)  
         Returns the count of fixed vertices, 0 if none") FixSame;
		Standard_Integer FixSame ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Fixes all statuses except 'Disjoined', i.e. the cases in which a  
         common value has been set, with or without changing parameters  
         Returns the count of fixed vertices, 0 if none") Fix;
		Standard_Integer Fix ();
};


%feature("shadow") ShapeFix_WireVertex::~ShapeFix_WireVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_WireVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeFix_ComposeShell;
class ShapeFix_ComposeShell : public ShapeFix_Root {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates empty tool.") ShapeFix_ComposeShell;
		 ShapeFix_ComposeShell ();
		%feature("autodoc", "Args:
	Grid(Handle_ShapeExtend_CompositeSurface)
	L(TopLoc_Location)
	Face(TopoDS_Face)
	Prec(Standard_Real)

Returns:
	None

Initializes with composite surface, face and precision.  
         Here face defines both set of wires and way of getting  
         pcurves. Precision is used (together with tolerance of edges)  
         for handling subtle cases, such as tangential intersections.") Init;
		void Init (const Handle_ShapeExtend_CompositeSurface & Grid,const TopLoc_Location & L,const TopoDS_Face & Face,const Standard_Real Prec);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns (modifiable) flag for special 'closed'  
         mode which forces ComposeShell to consider  
         all pcurves on closed surface as modulo period.  
         This can reduce reliability, but allows to deal  
         with wires closed in 3d but open in 2d (missing seam)  
         Default is False") ClosedMode;
		Standard_Boolean & ClosedMode ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Performs the work on already loaded data.") Perform;
		virtual Standard_Boolean Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Splits edges in the original shape by grid.  
         This is a part of Perform() which does not produce any  
         resulting shape; the only result is filled context  
         where splittings are recorded.  
 
         NOTE: If edge is splitted, it is replaced by wire, and  
         order of edges in the wire corresponds to FORWARD orientation  
         of the edge.") SplitEdges;
		void SplitEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns resulting shell or face (or Null shape if not done)") Result;
		const TopoDS_Shape & Result ();
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Queries status of last call to Perform()  
OK   : nothing done (some kind of error)  
DONE1: splitting is done, at least one new face created  
DONE2: splitting is done, several new faces obtained  
FAIL1: misoriented wire encountered (handled)  
FAIL2: recoverable parity error  
FAIL3: edge with no pcurve on supporting face  
FAIL4: unrecoverable algorithm error (parity check)") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	faces(TopTools_SequenceOfShape)
	wires(ShapeFix_SequenceOfWireSegment)

Returns:
	None

Creates new faces from the set of (closed) wires. Each wire  
         is put on corresponding patch in the composite surface,  
         and all pcurves on the initial (pseudo)face are reassigned to  
         that surface. If several wires are one inside another, single  
         face is created.") DispatchWires;
		void DispatchWires (TopTools_SequenceOfShape & faces,ShapeFix_SequenceOfWireSegment & wires);
		%feature("autodoc", "Args:
	TransferParam(Handle_ShapeAnalysis_TransferParameters)

Returns:
	None

Sets tool for transfer parameters from 3d to 2d and vice versa.") SetTransferParamTool;
		void SetTransferParamTool (const Handle_ShapeAnalysis_TransferParameters & TransferParam);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeAnalysis_TransferParameters

Gets tool for transfer parameters from 3d to 2d and vice versa.") GetTransferParamTool;
		Handle_ShapeAnalysis_TransferParameters GetTransferParamTool ();
};


%feature("shadow") ShapeFix_ComposeShell::~ShapeFix_ComposeShell %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_ComposeShell {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_ComposeShell {
	Handle_ShapeFix_ComposeShell GetHandle() {
	return *(Handle_ShapeFix_ComposeShell*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_ComposeShell;
class Handle_ShapeFix_ComposeShell : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_ComposeShell();
        Handle_ShapeFix_ComposeShell(const Handle_ShapeFix_ComposeShell &aHandle);
        Handle_ShapeFix_ComposeShell(const ShapeFix_ComposeShell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_ComposeShell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_ComposeShell {
    ShapeFix_ComposeShell* GetObject() {
    return (ShapeFix_ComposeShell*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_ComposeShell::~Handle_ShapeFix_ComposeShell %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_ComposeShell {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeFix_Face;
class ShapeFix_Face : public ShapeFix_Root {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty tool") ShapeFix_Face;
		 ShapeFix_Face ();
		%feature("autodoc", "Args:
	face(TopoDS_Face)

Returns:
	None

Creates a tool and loads a face") ShapeFix_Face;
		 ShapeFix_Face (const TopoDS_Face & face);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Sets all modes to default") ClearModes;
		virtual void ClearModes ();
		%feature("autodoc", "Args:
	face(TopoDS_Face)

Returns:
	None

Loads a whole face already created, with its wires, sense and  
         location") Init;
		void Init (const TopoDS_Face & face);
		%feature("autodoc", "Args:
	surf(Handle_Geom_Surface)
	preci(Standard_Real)
	fwd(Standard_Boolean)=Standard_True

Returns:
	None

Starts the creation of the face  
         By default it will be FORWARD, or REVERSED if <fwd> is False") Init;
		void Init (const Handle_Geom_Surface & surf,const Standard_Real preci,const Standard_Boolean fwd = Standard_True);
		%feature("autodoc", "Args:
	surf(Handle_ShapeAnalysis_Surface)
	preci(Standard_Real)
	fwd(Standard_Boolean)=Standard_True

Returns:
	None

Starts the creation of the face  
         By default it will be FORWARD, or REVERSED if <fwd> is False") Init;
		void Init (const Handle_ShapeAnalysis_Surface & surf,const Standard_Real preci,const Standard_Boolean fwd = Standard_True);
		%feature("autodoc", "Args:
	msgreg(Handle_ShapeExtend_BasicMsgRegistrator)

Returns:
	virtual void

Sets message registrator") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const Handle_ShapeExtend_BasicMsgRegistrator & msgreg);
		%feature("autodoc", "Args:
	preci(Standard_Real)

Returns:
	virtual void

Sets basic precision value (also to FixWireTool)") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);
		%feature("autodoc", "Args:
	mintol(Standard_Real)

Returns:
	virtual void

Sets minimal allowed tolerance (also to FixWireTool)") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);
		%feature("autodoc", "Args:
	maxtol(Standard_Real)

Returns:
	virtual void

Sets maximal allowed tolerance (also to FixWireTool)") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the mode for applying fixes of  
         ShapeFix_Wire, by default True.") FixWireMode;
		Standard_Integer & FixWireMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the fix orientation mode, by default  
         True. If True, wires oriented to border limited square.") FixOrientationMode;
		Standard_Integer & FixOrientationMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the add natural bound mode.  
         If true, natural boundary is added on faces that miss them.  
         Default is False for faces with single wire (they are  
         handled by FixOrientation in that case) and True for others.") FixAddNaturalBoundMode;
		Standard_Integer & FixAddNaturalBoundMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the fix missing seam mode, by default  
         True. If True, tries to insert seam is missed.") FixMissingSeamMode;
		Standard_Integer & FixMissingSeamMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the fix small area wire mode, by default  
         False. If True, drops small wires.") FixSmallAreaWireMode;
		Standard_Integer & FixSmallAreaWireMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the fix intersecting wires mode  
         by default True.") FixIntersectingWiresMode;
		Standard_Integer & FixIntersectingWiresMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the fix loop wires mode  
         by default True.") FixLoopWiresMode;
		Standard_Integer & FixLoopWiresMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the fix split face mode  
         by default True.") FixSplitFaceMode;
		Standard_Integer & FixSplitFaceMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the auto-correct precision mode  
         by default False.") AutoCorrectPrecisionMode;
		Standard_Integer & AutoCorrectPrecisionMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the activation flag for periodic  
         degenerated fix. False by default.") FixPeriodicDegeneratedMode;
		Standard_Integer & FixPeriodicDegeneratedMode ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns a face which corresponds to the current state  
 Warning: The finally produced face may be another one ... but with the  
         same support") Face;
		TopoDS_Face Face ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns resulting shape (Face or Shell if splitted)  
         To be used instead of Face() if FixMissingSeam involved") Result;
		TopoDS_Shape Result ();
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)

Returns:
	None

Add a wire to current face using BRep_Builder.  
         Wire is added without taking into account orientation of face  
         (as if face were FORWARD).") Add;
		void Add (const TopoDS_Wire & wire);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Performs all the fixes, depending on modes  
Function Status returns the status of last call to Perform()  
         ShapeExtend_OK   : face was OK, nothing done  
         ShapeExtend_DONE1: some wires are fixed  
         ShapeExtend_DONE2: orientation of wires fixed  
         ShapeExtend_DONE3: missing seam added  
         ShapeExtend_DONE4: small area wire removed  
         ShapeExtend_DONE5: natural bounds added  
         ShapeExtend_FAIL1: some fails during fixing wires  
         ShapeExtend_FAIL2: cannot fix orientation of wires  
         ShapeExtend_FAIL3: cannot add missing seam  
         ShapeExtend_FAIL4: cannot remove small area wire") Perform;
		Standard_Boolean Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Fixes orientation of wires on the face  
         It tries to make all wires lie outside all others (according  
         to orientation) by reversing orientation of some of them.  
         If face lying on sphere or torus has single wire and  
         AddNaturalBoundMode is True, that wire is not reversed in  
         any case (supposing that natural bound will be added).  
         Returns True if wires were reversed") FixOrientation;
		Standard_Boolean FixOrientation ();
		%feature("autodoc", "Args:
	MapWires(TopTools_DataMapOfShapeListOfShape)

Returns:
	Standard_Boolean

Fixes orientation of wires on the face  
         It tries to make all wires lie outside all others (according  
         to orientation) by reversing orientation of some of them.  
         If face lying on sphere or torus has single wire and  
         AddNaturalBoundMode is True, that wire is not reversed in  
         any case (supposing that natural bound will be added).  
         Returns True if wires were reversed  
         OutWires return information about out wires + list of  
         internal wires for each (for performing split face).") FixOrientation;
		Standard_Boolean FixOrientation (TopTools_DataMapOfShapeListOfShape & MapWires);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Adds natural boundary on face if it is missing.  
         Two cases are supported:  
         - face has no wires  
         - face lies on geometrically double-closed surface  
           (sphere or torus) and none of wires is left-oriented  
         Returns True if natural boundary was added") FixAddNaturalBound;
		Standard_Boolean FixAddNaturalBound ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Detects and fixes the special case when face on a closed  
         surface is given by two wires closed in 3d but with gap in 2d.  
         In that case it creates a new wire from the two, and adds a  
         missing seam edge  
         Returns True if missing seam was added") FixMissingSeam;
		Standard_Boolean FixMissingSeam ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Detects wires with small area (that is less than  
         100*Precision::PConfusion(). Removes these wires if they are internal.  
 Returns : True if at least one small wire removed,  
   	    False if does nothing.") FixSmallAreaWire;
		Standard_Boolean FixSmallAreaWire ();
		%feature("autodoc", "Args:
	aResWires(TopTools_SequenceOfShape)

Returns:
	Standard_Boolean

Detects if wire has a loop and fixes this situation by splitting on the few parts.  
         if wire has a loops and it was splitted Status was set to value ShapeExtend_DONE6.") FixLoopWire;
		Standard_Boolean FixLoopWire (TopTools_SequenceOfShape & aResWires);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Detects and fixes the special case when face has more than one wire  
         and this wires have intersection point") FixIntersectingWires;
		Standard_Boolean FixIntersectingWires ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

If wire contains two coincidence edges it must be removed  
Queries on status after Perform()") FixWiresTwoCoincEdges;
		Standard_Boolean FixWiresTwoCoincEdges ();
		%feature("autodoc", "Args:
	MapWires(TopTools_DataMapOfShapeListOfShape)

Returns:
	Standard_Boolean

Split face if there are more than one out wire  
         using inrormation after FixOrientation()") FixSplitFace;
		Standard_Boolean FixSplitFace (const TopTools_DataMapOfShapeListOfShape & MapWires);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Fixes topology for a specific case when face is composed  
         by a single wire belting a periodic surface. In that case  
         a degenerated edge is reconstructed in the degenerated pole  
         of the surface. Initial wire gets consistent orientation.  
         Must be used in couple and before FixMissingSeam routine") FixPeriodicDegenerated;
		Standard_Boolean FixPeriodicDegenerated ();
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Returns the status of last call to Perform()  
         ShapeExtend_OK   : face was OK, nothing done  
         ShapeExtend_DONE1: some wires are fixed  
         ShapeExtend_DONE2: orientation of wires fixed  
         ShapeExtend_DONE3: missing seam added  
         ShapeExtend_DONE4: small area wire removed  
         ShapeExtend_DONE5: natural bounds added  
         ShapeExtend_DONE8: face may be splited  
         ShapeExtend_FAIL1: some fails during fixing wires  
         ShapeExtend_FAIL2: cannot fix orientation of wires  
         ShapeExtend_FAIL3: cannot add missing seam  
         ShapeExtend_FAIL4: cannot remove small area wire") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeFix_Wire

Returns tool for fixing wires.") FixWireTool;
		Handle_ShapeFix_Wire FixWireTool ();
};


%feature("shadow") ShapeFix_Face::~ShapeFix_Face %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_Face {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_Face {
	Handle_ShapeFix_Face GetHandle() {
	return *(Handle_ShapeFix_Face*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_Face;
class Handle_ShapeFix_Face : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_Face();
        Handle_ShapeFix_Face(const Handle_ShapeFix_Face &aHandle);
        Handle_ShapeFix_Face(const ShapeFix_Face *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Face DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Face {
    ShapeFix_Face* GetObject() {
    return (ShapeFix_Face*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_Face::~Handle_ShapeFix_Face %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_Face {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeFix_FixSmallFace;
class ShapeFix_FixSmallFace : public ShapeFix_Root {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeFix_FixSmallFace;
		 ShapeFix_FixSmallFace ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	None

Fixing case of spot face") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Fixing case of spot face, if tol = -1 used local tolerance.") FixSpotFace;
		TopoDS_Shape FixSpotFace ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	tol(Standard_Real)

Returns:
	Standard_Boolean

Compute average vertex and replacing vertices by new one.") ReplaceVerticesInCaseOfSpot;
		Standard_Boolean ReplaceVerticesInCaseOfSpot (TopoDS_Face & F,const Standard_Real tol);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	Standard_Boolean

Remove spot face from compound") RemoveFacesInCaseOfSpot;
		Standard_Boolean RemoveFacesInCaseOfSpot (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	wasdone(Standard_Boolean)=Standard_False

Returns:
	TopoDS_Shape

Fixing case of strip face, if tol = -1 used local tolerance") FixStripFace;
		TopoDS_Shape FixStripFace (const Standard_Boolean wasdone = Standard_False);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	tol(Standard_Real)

Returns:
	Standard_Boolean

Replace veretces and edges.") ReplaceInCaseOfStrip;
		Standard_Boolean ReplaceInCaseOfStrip (TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2,const Standard_Real tol);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	Standard_Boolean

Remove strip face from compound.") RemoveFacesInCaseOfStrip;
		Standard_Boolean RemoveFacesInCaseOfStrip (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	F1(TopoDS_Face)
	tol(Standard_Real)

Returns:
	TopoDS_Edge

Compute average edge for strip face") ComputeSharedEdgeForStripFace;
		TopoDS_Edge ComputeSharedEdgeForStripFace (const TopoDS_Face & F,const TopoDS_Edge & E1,const TopoDS_Edge & E2,const TopoDS_Face & F1,const Standard_Real tol);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

") FixSplitFace;
		TopoDS_Shape FixSplitFace (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Split faces by splitting vertices") SplitFaces;
		TopoDS_Shape SplitFaces ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	theSplittedFaces(TopoDS_Compound)

Returns:
	Standard_Boolean

Compute data for face splitting.") SplitOneFace;
		Standard_Boolean SplitOneFace (TopoDS_Face & F,TopoDS_Compound & theSplittedFaces);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Remove small faces from compound.") RemoveSmallFaces;
		TopoDS_Shape RemoveSmallFaces ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	TopoDS_Face

No detailed docstring for this function.") FixFace;
		TopoDS_Face FixFace (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") FixShape;
		TopoDS_Shape FixShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		TopoDS_Shape Shape ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") FixPinFace;
		Standard_Boolean FixPinFace (TopoDS_Face & F);
};


%feature("shadow") ShapeFix_FixSmallFace::~ShapeFix_FixSmallFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_FixSmallFace {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_FixSmallFace {
	Handle_ShapeFix_FixSmallFace GetHandle() {
	return *(Handle_ShapeFix_FixSmallFace*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_FixSmallFace;
class Handle_ShapeFix_FixSmallFace : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_FixSmallFace();
        Handle_ShapeFix_FixSmallFace(const Handle_ShapeFix_FixSmallFace &aHandle);
        Handle_ShapeFix_FixSmallFace(const ShapeFix_FixSmallFace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_FixSmallFace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_FixSmallFace {
    ShapeFix_FixSmallFace* GetObject() {
    return (ShapeFix_FixSmallFace*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_FixSmallFace::~Handle_ShapeFix_FixSmallFace %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_FixSmallFace {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeFix_Shape;
class ShapeFix_Shape : public ShapeFix_Root {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty Constructor") ShapeFix_Shape;
		 ShapeFix_Shape ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	None

Initislises by shape.") ShapeFix_Shape;
		 ShapeFix_Shape (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	None

Initislises by shape.") Init;
		void Init (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	theProgress(Handle_Message_ProgressIndicator)=0

Returns:
	Standard_Boolean

Iterates on sub- shape and performs fixes") Perform;
		Standard_Boolean Perform (const Handle_Message_ProgressIndicator & theProgress = 0);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns resulting shape") Shape;
		TopoDS_Shape Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeFix_Solid

Returns tool for fixing solids.") FixSolidTool;
		Handle_ShapeFix_Solid FixSolidTool ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeFix_Shell

Returns tool for fixing shells.") FixShellTool;
		Handle_ShapeFix_Shell FixShellTool ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeFix_Face

Returns tool for fixing faces.") FixFaceTool;
		Handle_ShapeFix_Face FixFaceTool ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeFix_Wire

Returns tool for fixing wires.") FixWireTool;
		Handle_ShapeFix_Wire FixWireTool ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeFix_Edge

Returns tool for fixing edges.") FixEdgeTool;
		Handle_ShapeFix_Edge FixEdgeTool ();
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Returns the status of the last Fix.  
         This can be a combination of the following flags:  
         ShapeExtend_DONE1: some free edges were fixed  
         ShapeExtend_DONE2: some free wires were fixed  
         ShapeExtend_DONE3: some free faces were fixed  
         ShapeExtend_DONE4: some free shells were fixed  
         ShapeExtend_DONE5: some free solids were fixed  
         ShapeExtend_DONE6: shapes in compound(s) were fixed") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	msgreg(Handle_ShapeExtend_BasicMsgRegistrator)

Returns:
	virtual void

Sets message registrator") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const Handle_ShapeExtend_BasicMsgRegistrator & msgreg);
		%feature("autodoc", "Args:
	preci(Standard_Real)

Returns:
	virtual void

Sets basic precision value (also to FixSolidTool)") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);
		%feature("autodoc", "Args:
	mintol(Standard_Real)

Returns:
	virtual void

Sets minimal allowed tolerance (also to FixSolidTool)") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);
		%feature("autodoc", "Args:
	maxtol(Standard_Real)

Returns:
	virtual void

Sets maximal allowed tolerance (also to FixSolidTool)") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the mode for applying fixes of  
         ShapeFix_Solid, by default True.") FixSolidMode;
		Standard_Integer & FixSolidMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the mode for applying fixes of  
         ShapeFix_Shell, by default True.") FixFreeShellMode;
		Standard_Integer & FixFreeShellMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the mode for applying fixes of  
         ShapeFix_Face, by default True.") FixFreeFaceMode;
		Standard_Integer & FixFreeFaceMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the mode for applying fixes of  
         ShapeFix_Wire, by default True.") FixFreeWireMode;
		Standard_Integer & FixFreeWireMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the mode for applying  
         ShapeFix::SameParameter after all fixes, by default True.") FixSameParameterMode;
		Standard_Integer & FixSameParameterMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the mode for applying  
         ShapeFix::FixVertexPosition before all fixes, by default False.") FixVertexPositionMode;
		Standard_Integer & FixVertexPositionMode ();
};


%feature("shadow") ShapeFix_Shape::~ShapeFix_Shape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_Shape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_Shape {
	Handle_ShapeFix_Shape GetHandle() {
	return *(Handle_ShapeFix_Shape*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_Shape;
class Handle_ShapeFix_Shape : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_Shape();
        Handle_ShapeFix_Shape(const Handle_ShapeFix_Shape &aHandle);
        Handle_ShapeFix_Shape(const ShapeFix_Shape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Shape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Shape {
    ShapeFix_Shape* GetObject() {
    return (ShapeFix_Shape*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_Shape::~Handle_ShapeFix_Shape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_Shape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeFix_Shell;
class ShapeFix_Shell : public ShapeFix_Root {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeFix_Shell;
		 ShapeFix_Shell ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shell)

Returns:
	None

Initializes by shell.") ShapeFix_Shell;
		 ShapeFix_Shell (const TopoDS_Shell & shape);
		%feature("autodoc", "Args:
	shell(TopoDS_Shell)

Returns:
	None

Initializes by shell.") Init;
		void Init (const TopoDS_Shell & shell);
		%feature("autodoc", "Args:
	theProgress(Handle_Message_ProgressIndicator)=0

Returns:
	Standard_Boolean

Iterates on subshapes and performs fixes  
         (for each face calls ShapeFix_Face::Perform and  
         then calls FixFaceOrientation). The passed progress  
         indicator allows user to consult the current progress  
         stage and abort algorithm if needed.") Perform;
		Standard_Boolean Perform (const Handle_Message_ProgressIndicator & theProgress = 0);
		%feature("autodoc", "Args:
	shell(TopoDS_Shell)
	isAccountMultiConex(Standard_Boolean)=Standard_True
	NonManifold(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Fixes orientation of faces in shell.  
         Changes orientation of face in the shell, if it is oriented opposite  
         to neigbouring faces. If it is not possible to orient all faces in the  
         shell (like in case of mebious band), this method orients only subset  
         of faces. Other faces are stored in Error compound.  
         Modes :  
   	    isAccountMultiConex - mode for account cases of multiconnexity.  
         If this mode is equal to Standard_True, separate shells will be created  
         in the cases of multiconnexity. If this mode is equal to Standard_False,  
         one shell will be created without account of multiconnexity.By defautt - Standard_True;  
         NonManifold - mode for creation of non-manifold shells.  
         If this mode is equal to Standard_True one non-manifold will be created from shell  
         contains multishared edges. Else if this mode is equal to Standard_False only  
         manifold shells will be created. By default - Standard_False.") FixFaceOrientation;
		Standard_Boolean FixFaceOrientation (const TopoDS_Shell & shell,const Standard_Boolean isAccountMultiConex = Standard_True,const Standard_Boolean NonManifold = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shell

Returns fixed shell (or subset of oriented faces).") Shell;
		TopoDS_Shell Shell ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

In case of multiconnexity returns compound of fixed shells  
         else returns one shell..") Shape;
		TopoDS_Shape Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns Number of obtainrd shells;") NbShells;
		Standard_Integer NbShells ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Compound

Returns not oriented subset of faces.") ErrorFaces;
		TopoDS_Compound ErrorFaces ();
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Returns the status of the last Fix.") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeFix_Face

Returns tool for fixing faces.") FixFaceTool;
		Handle_ShapeFix_Face FixFaceTool ();
		%feature("autodoc", "Args:
	msgreg(Handle_ShapeExtend_BasicMsgRegistrator)

Returns:
	virtual void

Sets message registrator") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const Handle_ShapeExtend_BasicMsgRegistrator & msgreg);
		%feature("autodoc", "Args:
	preci(Standard_Real)

Returns:
	virtual void

Sets basic precision value (also to FixWireTool)") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);
		%feature("autodoc", "Args:
	mintol(Standard_Real)

Returns:
	virtual void

Sets minimal allowed tolerance (also to FixWireTool)") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);
		%feature("autodoc", "Args:
	maxtol(Standard_Real)

Returns:
	virtual void

Sets maximal allowed tolerance (also to FixWireTool)") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the mode for applying fixes of  
         ShapeFix_Face, by default True.") FixFaceMode;
		Standard_Integer & FixFaceMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the mode for applying  
         FixFaceOrientation, by default True.") FixOrientationMode;
		Standard_Integer & FixOrientationMode ();
};


%feature("shadow") ShapeFix_Shell::~ShapeFix_Shell %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_Shell {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_Shell {
	Handle_ShapeFix_Shell GetHandle() {
	return *(Handle_ShapeFix_Shell*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_Shell;
class Handle_ShapeFix_Shell : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_Shell();
        Handle_ShapeFix_Shell(const Handle_ShapeFix_Shell &aHandle);
        Handle_ShapeFix_Shell(const ShapeFix_Shell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Shell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Shell {
    ShapeFix_Shell* GetObject() {
    return (ShapeFix_Shell*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_Shell::~Handle_ShapeFix_Shell %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_Shell {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeFix_Solid;
class ShapeFix_Solid : public ShapeFix_Root {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor;") ShapeFix_Solid;
		 ShapeFix_Solid ();
		%feature("autodoc", "Args:
	solid(TopoDS_Solid)

Returns:
	None

Initializes by solid.") ShapeFix_Solid;
		 ShapeFix_Solid (const TopoDS_Solid & solid);
		%feature("autodoc", "Args:
	solid(TopoDS_Solid)

Returns:
	virtual void

Initializes by solid .") Init;
		virtual void Init (const TopoDS_Solid & solid);
		%feature("autodoc", "Args:
	theProgress(Handle_Message_ProgressIndicator)=0

Returns:
	virtual Standard_Boolean

Iterates on shells and performs fixes  
         (calls ShapeFix_Shell for each subshell). The passed  
         progress indicator allows user to consult the current  
         progress stage and abort algorithm if needed.") Perform;
		virtual Standard_Boolean Perform (const Handle_Message_ProgressIndicator & theProgress = 0);
		%feature("autodoc", "Args:
	shell(TopoDS_Shell)

Returns:
	TopoDS_Solid

Calls MakeSolid and orients the solid to be 'not infinite'") SolidFromShell;
		TopoDS_Solid SolidFromShell (const TopoDS_Shell & shell);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Integer

Returns the status of the last Fix.") Status;
		Standard_Integer Status (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns resulting solid.") Solid;
		TopoDS_Shape Solid ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeFix_Shell

Returns tool for fixing shells.") FixShellTool;
		Handle_ShapeFix_Shell FixShellTool ();
		%feature("autodoc", "Args:
	msgreg(Handle_ShapeExtend_BasicMsgRegistrator)

Returns:
	virtual void

Sets message registrator") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const Handle_ShapeExtend_BasicMsgRegistrator & msgreg);
		%feature("autodoc", "Args:
	preci(Standard_Real)

Returns:
	virtual void

Sets basic precision value (also to FixShellTool)") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);
		%feature("autodoc", "Args:
	mintol(Standard_Real)

Returns:
	virtual void

Sets minimal allowed tolerance (also to FixShellTool)") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);
		%feature("autodoc", "Args:
	maxtol(Standard_Real)

Returns:
	virtual void

Sets maximal allowed tolerance (also to FixShellTool)") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the mode for applying fixes of  
         ShapeFix_Shell, by default True.") FixShellMode;
		Standard_Integer & FixShellMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns (modifiable) the mode for creation of solids.  
         If mode myCreateOpenSolidMode is equal to true  
         solids are created from open shells  
         else solids are created  from closed shells only.  
         ShapeFix_Shell, by default False.") CreateOpenSolidMode;
		Standard_Boolean & CreateOpenSolidMode ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

In case of multiconnexity returns compound of fixed solids  
         else returns one solid.") Shape;
		TopoDS_Shape Shape ();
};


%feature("shadow") ShapeFix_Solid::~ShapeFix_Solid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_Solid {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_Solid {
	Handle_ShapeFix_Solid GetHandle() {
	return *(Handle_ShapeFix_Solid*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_Solid;
class Handle_ShapeFix_Solid : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_Solid();
        Handle_ShapeFix_Solid(const Handle_ShapeFix_Solid &aHandle);
        Handle_ShapeFix_Solid(const ShapeFix_Solid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Solid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Solid {
    ShapeFix_Solid* GetObject() {
    return (ShapeFix_Solid*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_Solid::~Handle_ShapeFix_Solid %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_Solid {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeFix_SplitCommonVertex;
class ShapeFix_SplitCommonVertex : public ShapeFix_Root {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeFix_SplitCommonVertex;
		 ShapeFix_SplitCommonVertex ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		TopoDS_Shape Shape ();
};


%feature("shadow") ShapeFix_SplitCommonVertex::~ShapeFix_SplitCommonVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_SplitCommonVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_SplitCommonVertex {
	Handle_ShapeFix_SplitCommonVertex GetHandle() {
	return *(Handle_ShapeFix_SplitCommonVertex*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_SplitCommonVertex;
class Handle_ShapeFix_SplitCommonVertex : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_SplitCommonVertex();
        Handle_ShapeFix_SplitCommonVertex(const Handle_ShapeFix_SplitCommonVertex &aHandle);
        Handle_ShapeFix_SplitCommonVertex(const ShapeFix_SplitCommonVertex *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_SplitCommonVertex DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_SplitCommonVertex {
    ShapeFix_SplitCommonVertex* GetObject() {
    return (ShapeFix_SplitCommonVertex*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_SplitCommonVertex::~Handle_ShapeFix_SplitCommonVertex %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_SplitCommonVertex {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeFix_Wire;
class ShapeFix_Wire : public ShapeFix_Root {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty Constructor, creates clear object with default flags") ShapeFix_Wire;
		 ShapeFix_Wire ();
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)
	face(TopoDS_Face)
	prec(Standard_Real)

Returns:
	None

Create new object with default flags and prepare it for use  
         (Loads analyzer with all the data for the wire and face)") ShapeFix_Wire;
		 ShapeFix_Wire (const TopoDS_Wire & wire,const TopoDS_Face & face,const Standard_Real prec);
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets all modes to default") ClearModes;
		void ClearModes ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears all statuses") ClearStatuses;
		void ClearStatuses ();
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)
	face(TopoDS_Face)
	prec(Standard_Real)

Returns:
	None

Load analyzer with all the data for the wire and face  
         and drops all fixing statuses") Init;
		void Init (const TopoDS_Wire & wire,const TopoDS_Face & face,const Standard_Real prec);
		%feature("autodoc", "Args:
	saw(Handle_ShapeAnalysis_Wire)

Returns:
	None

Load analyzer with all the data already prepared  
         and drops all fixing statuses  
         If analyzer contains face, there is no need to set it  
         by SetFace or SetSurface") Init;
		void Init (const Handle_ShapeAnalysis_Wire & saw);
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)

Returns:
	None

Load data for the wire, and drops all fixing statuses") Load;
		void Load (const TopoDS_Wire & wire);
		%feature("autodoc", "Args:
	sbwd(Handle_ShapeExtend_WireData)

Returns:
	None

Load data for the wire, and drops all fixing statuses") Load;
		void Load (const Handle_ShapeExtend_WireData & sbwd);
		%feature("autodoc", "Args:
	face(TopoDS_Face)

Returns:
	None

Set working face for the wire") SetFace;
		void SetFace (const TopoDS_Face & face);
		%feature("autodoc", "Args:
	surf(Handle_Geom_Surface)

Returns:
	None

Set surface for the wire") SetSurface;
		void SetSurface (const Handle_Geom_Surface & surf);
		%feature("autodoc", "Args:
	surf(Handle_Geom_Surface)
	loc(TopLoc_Location)

Returns:
	None

Set surface for the wire") SetSurface;
		void SetSurface (const Handle_Geom_Surface & surf,const TopLoc_Location & loc);
		%feature("autodoc", "Args:
	prec(Standard_Real)

Returns:
	virtual void

Set working precision (to root and to analyzer)") SetPrecision;
		virtual void SetPrecision (const Standard_Real prec);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tells if the wire is loaded") IsLoaded;
		Standard_Boolean IsLoaded ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tells if the wire and face are loaded") IsReady;
		Standard_Boolean IsReady ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns number of edges in the working wire") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

Makes the resulting Wire (by basic Brep_Builder)") Wire;
		TopoDS_Wire Wire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

Makes the resulting Wire (by BRepAPI_MakeWire)") WireAPIMake;
		TopoDS_Wire WireAPIMake ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeAnalysis_Wire

returns field Analyzer (working tool)") Analyzer;
		Handle_ShapeAnalysis_Wire Analyzer ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeExtend_WireData

returns working wire") WireData;
		const Handle_ShapeExtend_WireData & WireData ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

returns working face (Analyzer.Face())") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns (modifiable) the flag which defines whether it is  
         allowed to modify topology of the wire during fixing  
         (adding/removing edges etc.)") ModifyTopologyMode;
		Standard_Boolean & ModifyTopologyMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns (modifiable) the flag which defines whether the Fix..()  
         methods are allowed to modify geometry of the edges and vertices") ModifyGeometryMode;
		Standard_Boolean & ModifyGeometryMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the flag which defines whether the Fix..()  
         methods are allowed to modify RemoveLoop of the edges") ModifyRemoveLoopMode;
		Standard_Integer & ModifyRemoveLoopMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns (modifiable) the flag which defines whether the wire  
         is to be closed (by calling methods like FixDegenerated()  
         and FixConnected() for last and first edges).") ClosedWireMode;
		Standard_Boolean & ClosedWireMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns (modifiable) the flag which defines whether the 2d (True)  
         representation of the wire is preferable over 3d one (in the  
         case of ambiguity in FixEdgeCurves).") PreferencePCurveMode;
		Standard_Boolean & PreferencePCurveMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns (modifiable) the flag which defines whether tool  
         tries to fix gaps first by changing curves ranges (i.e.  
         using intersection, extrema, projections) or not.") FixGapsByRangesMode;
		Standard_Boolean & FixGapsByRangesMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixReorderMode;
		Standard_Integer & FixReorderMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixSmallMode;
		Standard_Integer & FixSmallMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixConnectedMode;
		Standard_Integer & FixConnectedMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixEdgeCurvesMode;
		Standard_Integer & FixEdgeCurvesMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixDegeneratedMode;
		Standard_Integer & FixDegeneratedMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixSelfIntersectionMode;
		Standard_Integer & FixSelfIntersectionMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixLackingMode;
		Standard_Integer & FixLackingMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixGaps3dMode;
		Standard_Integer & FixGaps3dMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the flag for corresponding Fix..() method  
         which defines whether this method will be called from the  
         method APIFix():  
      -1 default  
       1 method will be called  
       0 method will not be called") FixGaps2dMode;
		Standard_Integer & FixGaps2dMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixReversed2dMode;
		Standard_Integer & FixReversed2dMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixRemovePCurveMode;
		Standard_Integer & FixRemovePCurveMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixAddPCurveMode;
		Standard_Integer & FixAddPCurveMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixRemoveCurve3dMode;
		Standard_Integer & FixRemoveCurve3dMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixAddCurve3dMode;
		Standard_Integer & FixAddCurve3dMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixSeamMode;
		Standard_Integer & FixSeamMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixShiftedMode;
		Standard_Integer & FixShiftedMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixSameParameterMode;
		Standard_Integer & FixSameParameterMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixVertexToleranceMode;
		Standard_Integer & FixVertexToleranceMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixNotchedEdgesMode;
		Standard_Integer & FixNotchedEdgesMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixSelfIntersectingEdgeMode;
		Standard_Integer & FixSelfIntersectingEdgeMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FixIntersectingEdgesMode;
		Standard_Integer & FixIntersectingEdgesMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns (modifiable) the flag for corresponding Fix..() method  
         which defines whether this method will be called from the  
         corresponding Fix..() method of the public level:  
      -1 default  
       1 method will be called  
       0 method will not be called") FixNonAdjacentIntersectingEdgesMode;
		Standard_Integer & FixNonAdjacentIntersectingEdgesMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

This method performs all the available fixes.  
         If some fix is turned on or off explicitly by the Fix..Mode() flag,  
         this fix is either called or not depending on that flag.  
         Else (i.e. if flag is default) fix is called depending on the  
         situation: some fixes are not called or are limited if order of  
         edges in the wire is not OK, or depending on modes  
 
         The order of the fixes and default behaviour of Perform() are:  
         FixReorder  
         FixSmall (with lockvtx true if ! TopoMode or if wire is not ordered)  
         FixConnected (if wire is ordered)  
         FixEdgeCurves (without FixShifted if wire is not ordered)  
         FixDegenerated (if wire is ordered)  
         FixSelfIntersection (if wire is ordered and ClosedMode is True)  
         FixLacking (if wire is ordered)") Perform;
		Standard_Boolean Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Performs an analysis and reorders edges in the wire using  
         class WireOrder") FixReorder;
		Standard_Boolean FixReorder ();
		%feature("autodoc", "Args:
	lockvtx(Standard_Boolean)
	precsmall(Standard_Real)=0.0

Returns:
	Standard_Integer

Applies FixSmall(num) to all edges in the wire") FixSmall;
		Standard_Integer FixSmall (const Standard_Boolean lockvtx,const Standard_Real precsmall = 0.0);
		%feature("autodoc", "Args:
	prec(Standard_Real)=-1.0

Returns:
	Standard_Boolean

Applies FixConnected(num) to all edges in the wire  
         Connection between first and last edges is treated only if  
         flag ClosedMode is True  
         If <prec> is -1 then MaxTolerance() is taken.") FixConnected;
		Standard_Boolean FixConnected (const Standard_Real prec = -1.0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Groups the fixes dealing with 3d and pcurves of the edges.  
         The order of the fixes and the default behaviour are:  
         ShapeFix_Edge::FixReversed2d  
         ShapeFix_Edge::FixRemovePCurve (only if forced)  
         ShapeFix_Edge::FixAddPCurve  
         ShapeFix_Edge::FixRemoveCurve3d (only if forced)  
         ShapeFix_Edge::FixAddCurve3d  
         FixSeam,  
         FixShifted,  
         ShapeFix_Edge::FixSameParameter") FixEdgeCurves;
		Standard_Boolean FixEdgeCurves ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Applies FixDegenerated(num) to all edges in the wire  
         Connection between first and last edges is treated only if  
         flag ClosedMode is True") FixDegenerated;
		Standard_Boolean FixDegenerated ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Applies FixSelfIntersectingEdge(num) and  
         FixIntersectingEdges(num) to all edges in the wire and  
         FixIntersectingEdges(num1, num2) for all pairs num1 and num2  
         such that num2 >= num1 + 2  
         and removes wrong edges if any") FixSelfIntersection;
		Standard_Boolean FixSelfIntersection ();
		%feature("autodoc", "Args:
	force(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Applies FixLacking(num) to all edges in the wire  
         Connection between first and last edges is treated only if  
         flag ClosedMode is True  
         If <force> is False (default), test for connectness is done with  
         precision of vertex between edges, else it is done with minimal  
         value of vertex tolerance and Analyzer.Precision().  
         Hence, <force> will lead to inserting lacking edges in replacement  
         of vertices which have big tolerances.") FixLacking;
		Standard_Boolean FixLacking (const Standard_Boolean force = Standard_False);
		%feature("autodoc", "Args:
	prec(Standard_Real)=-1.0

Returns:
	Standard_Boolean

Fixes a wire to be well closed  
         It performs FixConnected, FixDegenerated and FixLacking between  
         last and first edges (independingly on flag ClosedMode and modes  
         for these fixings)  
         If <prec> is -1 then MaxTolerance() is taken.") FixClosed;
		Standard_Boolean FixClosed (const Standard_Real prec = -1.0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Fixes gaps between ends of 3d curves on adjacent edges  
         myPrecision is used to detect the gaps.") FixGaps3d;
		Standard_Boolean FixGaps3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Fixes gaps between ends of pcurves on adjacent edges  
         myPrecision is used to detect the gaps.") FixGaps2d;
		Standard_Boolean FixGaps2d ();
		%feature("autodoc", "Args:
	wi(ShapeAnalysis_WireOrder)

Returns:
	Standard_Boolean

Reorder edges in the wire as determined by WireOrder  
         that should be filled and computed before") FixReorder;
		Standard_Boolean FixReorder (const ShapeAnalysis_WireOrder & wi);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	lockvtx(Standard_Boolean)
	precsmall(Standard_Real)

Returns:
	Standard_Boolean

Fixes Null Length Edge to be removed  
         If an Edge has Null Length (regarding preci, or <precsmall>  
         - what is smaller), it should be removed  
         It can be with no problem if its two vertices are the same  
         Else, if lockvtx is False, it is removed and its end vertex  
         is put on the preceeding edge  
         But if lockvtx is True, this edge must be kept ...") FixSmall;
		Standard_Boolean FixSmall (const Standard_Integer num,const Standard_Boolean lockvtx,const Standard_Real precsmall);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	prec(Standard_Real)

Returns:
	Standard_Boolean

Fixes connected edges (preceeding and current)  
         Forces Vertices (end of preceeding-begin of current) to be  
         the same one  
         Tests with starting preci or, if given greater, <prec>  
         If <prec> is -1 then MaxTolerance() is taken.") FixConnected;
		Standard_Boolean FixConnected (const Standard_Integer num,const Standard_Real prec);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Fixes a seam edge  
         A Seam edge has two pcurves, one for forward. one for reversed  
         The forward pcurve must be set as first  
 
         NOTE that correct order of pcurves in the seam edge depends on  
         its orientation (i.e., on orientation of the wire, method of  
         exploration of edges etc.).  
         Since wire represented by the ShapeExtend_WireData is always forward  
         (orientation is accounted by edges), it will work correct if:  
      1. Wire created from ShapeExtend_WireData with methods  
         ShapeExtend_WireData::Wire..() is added into the FORWARD face  
         (orientation can be applied later)  
      2. Wire is extracted from the face with orientation not composed  
         with orientation of the face") FixSeam;
		Standard_Boolean FixSeam (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Fixes edges which have pcurves shifted by whole parameter  
         range on the closed surface (the case may occur if pcurve  
         of edge was computed by projecting 3d curve, which goes  
         along the seam).  
         It compares each two consequent edges and tries to connect them  
         if distance between ends is near to range of the surface.  
         It also can detect and fix the case if all pcurves are connected,  
         but lie out of parametric bounds of the surface.  
         In addition to FixShifted from ShapeFix_Wire, more  
         sophisticated check of degenerate points is performed,  
         and special cases like sphere given by two meridians  
         are treated.") FixShifted;
		Standard_Boolean FixShifted ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Fixes Degenerated Edge  
         Checks an <num-th> edge or a point between <num>th-1 and <num>th  
         edges for a singularity on a supporting surface.  
         If singularity is detected, either adds new degenerated edge  
         (before <num>th), or makes <num>th edge to be degenerated.") FixDegenerated;
		Standard_Boolean FixDegenerated (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	force(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Fixes Lacking Edge  
         Test if two adjucent edges are disconnected in 2d (while  
         connected in 3d), and in that case either increase tolerance  
         of the vertex or add a new edge (straight in 2d space), in  
         order to close wire in 2d.  
         Returns True if edge was added or tolerance was increased.") FixLacking;
		Standard_Boolean FixLacking (const Standard_Integer num,const Standard_Boolean force = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") FixNotchedEdges;
		Standard_Boolean FixNotchedEdges ();
		%feature("autodoc", "Args:
	num(Standard_Integer)
	convert(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Fixes gap between ends of 3d curves on num-1 and num-th edges.  
         myPrecision is used to detect the gap.  
         If convert is True, converts curves to bsplines to bend.") FixGap3d;
		Standard_Boolean FixGap3d (const Standard_Integer num,const Standard_Boolean convert = Standard_False);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	convert(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Fixes gap between ends of pcurves on num-1 and num-th edges.  
         myPrecision is used to detect the gap.  
         If convert is True, converts pcurves to bsplines to bend.") FixGap2d;
		Standard_Boolean FixGap2d (const Standard_Integer num,const Standard_Boolean convert = Standard_False);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusReorder;
		Standard_Boolean StatusReorder (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusSmall;
		Standard_Boolean StatusSmall (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusConnected;
		Standard_Boolean StatusConnected (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusEdgeCurves;
		Standard_Boolean StatusEdgeCurves (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusDegenerated;
		Standard_Boolean StatusDegenerated (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusSelfIntersection;
		Standard_Boolean StatusSelfIntersection (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusLacking;
		Standard_Boolean StatusLacking (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusClosed;
		Standard_Boolean StatusClosed (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusGaps3d;
		Standard_Boolean StatusGaps3d (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusGaps2d;
		Standard_Boolean StatusGaps2d (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusNotches;
		Standard_Boolean StatusNotches (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Querying the status of perfomed API fixing procedures  
         Each Status..() methods gives information about the last call to  
         the corresponding Fix..() method of API level:  
         OK  : no problems detected; nothing done  
         DONE: some problem(s) was(were) detected and successfully fixed  
         FAIL: some problem(s) cannot be fixed") StatusRemovedSegment;
		Standard_Boolean StatusRemovedSegment ();
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Queries the status of last call to methods Fix... of  
         advanced level  
         For details see corresponding methods; universal statuses are:  
         OK  : problem not detected; nothing done  
         DONE: problem was detected and successfully fixed  
         FAIL: problem cannot be fixed") LastFixStatus;
		Standard_Boolean LastFixStatus (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeFix_Edge

Returns tool for fixing wires.") FixEdgeTool;
		Handle_ShapeFix_Edge FixEdgeTool ();
};


%feature("shadow") ShapeFix_Wire::~ShapeFix_Wire %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_Wire {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_Wire {
	Handle_ShapeFix_Wire GetHandle() {
	return *(Handle_ShapeFix_Wire*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_Wire;
class Handle_ShapeFix_Wire : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_Wire();
        Handle_ShapeFix_Wire(const Handle_ShapeFix_Wire &aHandle);
        Handle_ShapeFix_Wire(const ShapeFix_Wire *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Wire DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Wire {
    ShapeFix_Wire* GetObject() {
    return (ShapeFix_Wire*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_Wire::~Handle_ShapeFix_Wire %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_Wire {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeFix_Wireframe;
class ShapeFix_Wireframe : public ShapeFix_Root {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeFix_Wireframe;
		 ShapeFix_Wireframe ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") ShapeFix_Wireframe;
		 ShapeFix_Wireframe (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Clears all statuses") ClearStatuses;
		virtual void ClearStatuses ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	None

Loads a shape, resets statuses") Load;
		void Load (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Fixes gaps between ends of curves of adjacent edges  
          (both 3d and pcurves) in wires  
          If precision is 0.0, uses Precision::Confusion().") FixWireGaps;
		Standard_Boolean FixWireGaps ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Fixes small edges in shape by merging adjacent edges  
          If precision is 0.0, uses Precision::Confusion().") FixSmallEdges;
		Standard_Boolean FixSmallEdges ();
		%feature("autodoc", "Args:
	theSmallEdges(TopTools_MapOfShape)
	theEdgeToFaces(TopTools_DataMapOfShapeListOfShape)
	theFaceWithSmall(TopTools_DataMapOfShapeListOfShape)
	theMultyEdges(TopTools_MapOfShape)

Returns:
	Standard_Boolean

Auxiliary tool for FixSmallEdges which checks for small edges and fills the maps.  
         Returns True if at least one small edge has been found.") CheckSmallEdges;
		Standard_Boolean CheckSmallEdges (TopTools_MapOfShape & theSmallEdges,TopTools_DataMapOfShapeListOfShape & theEdgeToFaces,TopTools_DataMapOfShapeListOfShape & theFaceWithSmall,TopTools_MapOfShape & theMultyEdges);
		%feature("autodoc", "Args:
	theSmallEdges(TopTools_MapOfShape)
	theEdgeToFaces(TopTools_DataMapOfShapeListOfShape)
	theFaceWithSmall(TopTools_DataMapOfShapeListOfShape)
	theMultyEdges(TopTools_MapOfShape)
	theModeDrop(Standard_Boolean)=Standard_False
	theLimitAngle(Standard_Real)=- 1

Returns:
	Standard_Boolean

Auxiliary tool for FixSmallEdges which merges small edges.  
         If theModeDrop is equal to Standard_True then small edges,  
         which cannot be connected with adjacent edges are dropped.  
         Otherwise they are kept.  
         theLimitAngle specifies maximum allowed tangency  
         discontinuity between adjacent edges.  
         If theLimitAngle is equal to -1, this angle is not taken into account.") MergeSmallEdges;
		Standard_Boolean MergeSmallEdges (TopTools_MapOfShape & theSmallEdges,TopTools_DataMapOfShapeListOfShape & theEdgeToFaces,TopTools_DataMapOfShapeListOfShape & theFaceWithSmall,TopTools_MapOfShape & theMultyEdges,const Standard_Boolean theModeDrop = Standard_False,const Standard_Real theLimitAngle = - 1);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Decodes the status of the last FixWireGaps.  
          OK - No gaps were found  
          DONE1 - Some gaps in 3D were fixed  
          DONE2 - Some gaps in 2D were fixed  
          FAIL1 - Failed to fix some gaps in 3D  
          FAIL2 - Failed to fix some gaps in 2D") StatusWireGaps;
		Standard_Boolean StatusWireGaps (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Decodes the status of the last FixSmallEdges.  
          OK - No small edges were found  
          DONE1 - Some small edges were fixed  
          FAIL1 - Failed to fix some small edges") StatusSmallEdges;
		Standard_Boolean StatusSmallEdges (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		TopoDS_Shape Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns mode managing removing small edges.") ModeDropSmallEdges;
		Standard_Boolean & ModeDropSmallEdges ();
		%feature("autodoc", "Args:
	theLimitAngle(Standard_Real)

Returns:
	None

//!Set limit angle for merging edges.") SetLimitAngle;
		void SetLimitAngle (const Standard_Real theLimitAngle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

//!Get limit angle for merging edges.") LimitAngle;
		Standard_Real LimitAngle ();
};


%feature("shadow") ShapeFix_Wireframe::~ShapeFix_Wireframe %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeFix_Wireframe {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeFix_Wireframe {
	Handle_ShapeFix_Wireframe GetHandle() {
	return *(Handle_ShapeFix_Wireframe*) &$self;
	}
};

%nodefaultctor Handle_ShapeFix_Wireframe;
class Handle_ShapeFix_Wireframe : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_Wireframe();
        Handle_ShapeFix_Wireframe(const Handle_ShapeFix_Wireframe &aHandle);
        Handle_ShapeFix_Wireframe(const ShapeFix_Wireframe *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Wireframe DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Wireframe {
    ShapeFix_Wireframe* GetObject() {
    return (ShapeFix_Wireframe*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeFix_Wireframe::~Handle_ShapeFix_Wireframe %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeFix_Wireframe {
    void _kill_pointed() {
        delete $self;
    }
};

