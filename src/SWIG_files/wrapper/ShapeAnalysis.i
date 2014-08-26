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
%module ShapeAnalysis

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

%include ShapeAnalysis_required_python_modules.i
%include ShapeAnalysis_headers.i

/* typedefs */
typedef NCollection_UBTree <Standard_Integer , Bnd_Box> ShapeAnalysis_BoxBndTree;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(shapeanalysis) ShapeAnalysis;
%nodefaultctor ShapeAnalysis;
class ShapeAnalysis {
	public:
		%feature("autodoc", "Args:
	face(TopoDS_Face)

Returns:
	static TopoDS_Wire

Returns the outer wire on the face <Face>.  
         This is replacement of the method BRepTools::OuterWire  
         until it works badly.  
         Returns the first wire oriented as outer according to  
         FClass2d_Classifier. If none, last wire is returned.") OuterWire;
		static TopoDS_Wire OuterWire (const TopoDS_Face & face);
		%feature("autodoc", "Args:
	sewd(Handle_ShapeExtend_WireData)
	aFace(TopoDS_Face)

Returns:
	static Standard_Real

Returns a total area of 2d wire") TotCross2D;
		static Standard_Real TotCross2D (const Handle_ShapeExtend_WireData & sewd,const TopoDS_Face & aFace);
		%feature("autodoc", "Args:
	theWire(TopoDS_Wire)

Returns:
	static Standard_Real

Returns a total area of 3d wire") ContourArea;
		static Standard_Real ContourArea (const TopoDS_Wire & theWire);
		%feature("autodoc", "Args:
	face(TopoDS_Face)

Returns:
	static Standard_Boolean

Returns True if <F> has outer bound.") IsOuterBound;
		static Standard_Boolean IsOuterBound (const TopoDS_Face & face);
		%feature("autodoc", "Args:
	Val(Standard_Real)
	ToVal(Standard_Real)
	Period(Standard_Real)

Returns:
	static Standard_Real

Returns a shift required to move point  
         <Val> to the range [ToVal-Period/2,ToVal+Period/2].  
         This shift will be the divisible by Period.  
         Intended for adjusting parameters on periodic surfaces.") AdjustByPeriod;
		static Standard_Real AdjustByPeriod (const Standard_Real Val,const Standard_Real ToVal,const Standard_Real Period);
		%feature("autodoc", "Args:
	Val(Standard_Real)
	ValMin(Standard_Real)
	ValMax(Standard_Real)

Returns:
	static Standard_Real

Returns a shift required to move point  
         <Val> to the range [ValMin,ValMax].  
         This shift will be the divisible by Period  
         with Period = ValMax - ValMin.  
         Intended for adjusting parameters on periodic surfaces.") AdjustToPeriod;
		static Standard_Real AdjustToPeriod (const Standard_Real Val,const Standard_Real ValMin,const Standard_Real ValMax);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	static void

Finds the start and end vertices of the shape  
         Shape can be of the following type:  
         vertex: V1 and V2 are the same and equal to <shape>,  
         edge  : V1 is start and V2 is end vertex (see ShapeAnalysis_Edge  
                 methods FirstVertex and LastVertex),  
         wire  : V1 is start vertex of the first edge, V2 is end vertex  
                 of the last edge (also see ShapeAnalysis_Edge).  
                 If wire contains no edges V1 and V2 are nullified  
         If none of the above V1 and V2 are nullified") FindBounds;
		static void FindBounds (const TopoDS_Shape & shape,TopoDS_Vertex & V1,TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Umin(Standard_Real)
	Umax(Standard_Real)
	Vmin(Standard_Real)
	Vmax(Standard_Real)

Returns:
	static void

Computes exact UV bounds of all wires on the face") GetFaceUVBounds;
		static void GetFaceUVBounds (const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") ShapeAnalysis::~ShapeAnalysis %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_CheckSmallFace;
class ShapeAnalysis_CheckSmallFace {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

//!Creates an empty tool  Checks a Shape i.e. each of its faces, records checks as  
          diagnostics in the <infos>  
 
          If <infos> has not been set before, no check is done  
 
          For faces which are in a Shell, topological data are recorded  
          to allow recovering connectivities after fixing or removing  
          the small faces or parts of faces  Enchains various checks on a face  
          inshell : to compute more informations, relevant to topology") ShapeAnalysis_CheckSmallFace;
		 ShapeAnalysis_CheckSmallFace ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	spot(gp_Pnt)
	spotol(Standard_Real)
	tol(Standard_Real)=-1.0

Returns:
	Standard_Integer

Checks if a Face is as a Spot  
          Returns 0 if not, 1 if yes, 2 if yes and all vertices are the  
          same  
          By default, considers the tolerance zone of its vertices  
          A given value <tol> may be given to check a spot of this size  
          If a Face is a Spot, its location is returned in <spot>, and  
          <spotol> returns an equivalent tolerance, which is computed as  
          half of max dimension of min-max box of the face") IsSpotFace;
		Standard_Integer IsSpotFace (const TopoDS_Face & F,gp_Pnt & spot,Standard_Real &OutValue,const Standard_Real tol = -1.0);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	tol(Standard_Real)=-1.0

Returns:
	Standard_Boolean

Acts as IsSpotFace, but records in <infos> a diagnostic  
          'SpotFace' with the Pnt as value (data 'Location')") CheckSpotFace;
		Standard_Boolean CheckSpotFace (const TopoDS_Face & F,const Standard_Real tol = -1.0);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	tol(Standard_Real)=-1.0

Returns:
	Standard_Boolean

Checks if a Face lies on a Surface which is a strip  
          So the Face is a strip. But a Face may be a strip elsewhere ..  
 
          A given value <tol> may be given to check max width  
          By default, considers the tolerance zone of its edges  
          Returns 0 if not a strip support, 1 strip in U, 2 strip in V") IsStripSupport;
		Standard_Boolean IsStripSupport (const TopoDS_Face & F,const Standard_Real tol = -1.0);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	tol(Standard_Real)
	dmax(Standard_Real)

Returns:
	Standard_Boolean

Checks if two edges define a strip, i.e. distance maxi below  
          tolerance, given or some of those of E1 and E2") CheckStripEdges;
		Standard_Boolean CheckStripEdges (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const Standard_Real tol,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	tol(Standard_Real)
	dmax(Standard_Real)

Returns:
	Standard_Boolean

Searchs for two and only two edges up tolerance  
          Returns True if OK, false if not 2 edges  
          If True, returns the two edges and their maximum distance") FindStripEdges;
		Standard_Boolean FindStripEdges (const TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2,const Standard_Real tol,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	tol(Standard_Real)=-1.0

Returns:
	Standard_Boolean

Checks if a Face is a single strip, i.e. brings two great  
          edges which are confused on their whole length, possible other  
          edges are small or null length  
 
          Returns 0 if not a strip support, 1 strip in U, 2 strip in V  
          Records diagnostic in info if it is a single strip") CheckSingleStrip;
		Standard_Boolean CheckSingleStrip (const TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2,const Standard_Real tol = -1.0);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	tol(Standard_Real)=-1.0

Returns:
	Standard_Boolean

Checks if a Face is as a Strip  
          Returns 0 if not or non determined, 1 if in U, 2 if in V  
          By default, considers the tolerance zone of its edges  
          A given value <tol> may be given to check a strip of max this width  
 
          If a Face is determined as a Strip, it is delinited by two  
          lists of edges. These lists are recorded in diagnostic  
          Diagnostic 'StripFace' brings data 'Direction' (U or V),  
          'List1' , 'List2' (if they could be computed)") CheckStripFace;
		Standard_Boolean CheckStripFace (const TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2,const Standard_Real tol = -1.0);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	MapEdges(TopTools_DataMapOfShapeListOfShape)
	MapParam(ShapeAnalysis_DataMapOfShapeListOfReal)
	theAllVert(TopoDS_Compound)

Returns:
	Standard_Integer

Checks if a Face brings vertices which split it, either  
          confused with non adjacent vertices, or confused with their  
          projection on non adjacent edges  
          Returns the count of found splitting vertices  
          Each vertex then brings a diagnostic 'SplittingVertex',  
          with data : 'Face' for the face, 'Edge' for the split edge") CheckSplittingVertices;
		Standard_Integer CheckSplittingVertices (const TopoDS_Face & F,TopTools_DataMapOfShapeListOfShape & MapEdges,ShapeAnalysis_DataMapOfShapeListOfReal & MapParam,TopoDS_Compound & theAllVert);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	whatrow(Standard_Integer)
	sence(Standard_Integer)

Returns:
	Standard_Boolean

Checks if a Face has a pin, which can be edited  
          No singularity : no pin, returns 0  
          If there is a pin, checked topics, with returned value :  
          - 0 : nothing to do more  
          - 1 : 'smooth', i.e. not a really sharp pin  
            -> diagnostic 'SmoothPin'  
          - 2 : stretched pin, i.e. is possible to relimit the face by  
            another vertex, so that this vertex still gives a pin  
            -> diagnostic 'StretchedPin' with location of vertex (Pnt)") CheckPin;
		Standard_Boolean CheckPin (const TopoDS_Face & F,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	paramu(Standard_Real)
	paramv(Standard_Real)

Returns:
	Standard_Boolean

Checks if a Face is twisted (apart from checking Pin, i.e. it  
          does not give information on pin, only 'it is twisted')") CheckTwisted;
		Standard_Boolean CheckTwisted (const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	mapEdges(TopTools_DataMapOfShapeShape)
	toler(Standard_Real)=-1.0

Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckPinFace;
		Standard_Boolean CheckPinFace (const TopoDS_Face & F,TopTools_DataMapOfShapeShape & mapEdges,const Standard_Real toler = -1.0);
		%feature("autodoc", "Args:
	theFirstEdge(TopoDS_Edge)
	theSecondEdge(TopoDS_Edge)
	coef1(Standard_Real)
	coef2(Standard_Real)
	toler(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckPinEdges;
		Standard_Boolean CheckPinEdges (const TopoDS_Edge & theFirstEdge,const TopoDS_Edge & theSecondEdge,const Standard_Real coef1,const Standard_Real coef2,const Standard_Real toler);
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
         ShapeExtend_FAIL1: some fails during fixing wires  
         ShapeExtend_FAIL2: cannot fix orientation of wires  
         ShapeExtend_FAIL3: cannot add missing seam  
         ShapeExtend_FAIL4: cannot remove small area wire") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	tol(Standard_Real)

Returns:
	None

Sets a fixed Tolerance to check small face  
          By default, local tolerance zone is considered  Sets a fixed MaxTolerance to check small face  Sets a fixed Tolerance to check small face  
          By default, local tolerance zone is considered  Unset fixed tolerance, comes back to local tolerance zones  Unset fixed tolerance, comes back to local tolerance zones") SetTolerance;
		void SetTolerance (const Standard_Real tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the tolerance to check small faces, negative value if  
          local tolerances zones are to be considered") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusSpot;
		Standard_Boolean StatusSpot (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusStrip;
		Standard_Boolean StatusStrip (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusPin;
		Standard_Boolean StatusPin (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusTwisted;
		Standard_Boolean StatusTwisted (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusSplitVert;
		Standard_Boolean StatusSplitVert (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusPinFace;
		Standard_Boolean StatusPinFace (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusPinEdges;
		Standard_Boolean StatusPinEdges (const ShapeExtend_Status status);
};


%feature("shadow") ShapeAnalysis_CheckSmallFace::~ShapeAnalysis_CheckSmallFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_CheckSmallFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_Curve;
class ShapeAnalysis_Curve {
	public:
		%feature("autodoc", "Args:
	C3D(Handle_Geom_Curve)
	P3D(gp_Pnt)
	preci(Standard_Real)
	proj(gp_Pnt)
	param(Standard_Real)
	AdjustToEnds(Standard_Boolean)=Standard_True

Returns:
	Standard_Real

Projects a Point on a Curve.  
          Computes the projected point and its parameter on the curve.  
          <preci> is used as 3d precision (hence, 0 will produce  
          reject unless exact confusion).  
          The number of iterations is limited.  
          If AdjustToEnds is True, point will be adjusted to the end  
          of the curve if distance is less than <preci>  
 
          Returned value is the distance between the given point and  
          computed one.") Project;
		Standard_Real Project (const Handle_Geom_Curve & C3D,const gp_Pnt & P3D,const Standard_Real preci,gp_Pnt & proj,Standard_Real &OutValue,const Standard_Boolean AdjustToEnds = Standard_True);
		%feature("autodoc", "Args:
	C3D(Adaptor3d_Curve)
	P3D(gp_Pnt)
	preci(Standard_Real)
	proj(gp_Pnt)
	param(Standard_Real)
	AdjustToEnds(Standard_Boolean)=Standard_True

Returns:
	Standard_Real

Projects a Point on a Curve.  
          Computes the projected point and its parameter on the curve.  
          <preci> is used as 3d precision (hence, 0 will produce  
          reject unless exact confusion).  
          The number of iterations is limited.  
 
          Returned value is the distance between the given point and  
          computed one.") Project;
		Standard_Real Project (const Adaptor3d_Curve & C3D,const gp_Pnt & P3D,const Standard_Real preci,gp_Pnt & proj,Standard_Real &OutValue,const Standard_Boolean AdjustToEnds = Standard_True);
		%feature("autodoc", "Args:
	C3D(Handle_Geom_Curve)
	P3D(gp_Pnt)
	preci(Standard_Real)
	proj(gp_Pnt)
	param(Standard_Real)
	cf(Standard_Real)
	cl(Standard_Real)
	AdjustToEnds(Standard_Boolean)=Standard_True

Returns:
	Standard_Real

Projects a Point on a Curve, but parameters are limited  
          between <cf> and <cl>.  
          The range [cf, cl] is extended with help of Adaptor3d on the  
          basis of 3d precision <preci>.  
          If AdjustToEnds is True, point will be adjusted to the end  
          of the curve if distance is less than <preci>") Project;
		Standard_Real Project (const Handle_Geom_Curve & C3D,const gp_Pnt & P3D,const Standard_Real preci,gp_Pnt & proj,Standard_Real &OutValue,const Standard_Real cf,const Standard_Real cl,const Standard_Boolean AdjustToEnds = Standard_True);
		%feature("autodoc", "Args:
	C3D(Adaptor3d_Curve)
	P3D(gp_Pnt)
	preci(Standard_Real)
	proj(gp_Pnt)
	param(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") ProjectAct;
		Standard_Real ProjectAct (const Adaptor3d_Curve & C3D,const gp_Pnt & P3D,const Standard_Real preci,gp_Pnt & proj,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	paramPrev(Standard_Real)
	C3D(Handle_Geom_Curve)
	P3D(gp_Pnt)
	preci(Standard_Real)
	proj(gp_Pnt)
	param(Standard_Real)
	cf(Standard_Real)
	cl(Standard_Real)
	AdjustToEnds(Standard_Boolean)=Standard_True

Returns:
	Standard_Real

Projects a Point on a Curve using Newton method.  
         <paramPrev> is taken as the first approximation of solution.  
         If Newton algorithm fails the method Project() is used.  
         If AdjustToEnds is True, point will be adjusted to the end  
         of the curve if distance is less than <preci>") NextProject;
		Standard_Real NextProject (const Standard_Real paramPrev,const Handle_Geom_Curve & C3D,const gp_Pnt & P3D,const Standard_Real preci,gp_Pnt & proj,Standard_Real &OutValue,const Standard_Real cf,const Standard_Real cl,const Standard_Boolean AdjustToEnds = Standard_True);
		%feature("autodoc", "Args:
	paramPrev(Standard_Real)
	C3D(Adaptor3d_Curve)
	P3D(gp_Pnt)
	preci(Standard_Real)
	proj(gp_Pnt)
	param(Standard_Real)

Returns:
	Standard_Real

Projects a Point on a Curve using Newton method.  
         <paramPrev> is taken as the first approximation of solution.  
         If Newton algorithm fails the method Project() is used.") NextProject;
		Standard_Real NextProject (const Standard_Real paramPrev,const Adaptor3d_Curve & C3D,const gp_Pnt & P3D,const Standard_Real preci,gp_Pnt & proj,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Crv(Handle_Geom_Curve)
	First(Standard_Real)
	Last(Standard_Real)
	prec(Standard_Real)

Returns:
	Standard_Boolean

Validate parameters First and Last for the given curve  
         in order to make them valid for creation of edge.  
         This includes:  
         - limiting range [First,Last] by range of curve  
         - adjusting range [First,Last] for periodic (or closed)  
           curve if Last < First  
         Returns True if parameters are OK or are successfully  
         corrected, or False if parameters cannot be corrected.  
         In the latter case, parameters are reset to range of curve.") ValidateRange;
		Standard_Boolean ValidateRange (const Handle_Geom_Curve & Crv,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Real prec);
		%feature("autodoc", "Args:
	C2d(Handle_Geom2d_Curve)
	First(Standard_Real)
	Last(Standard_Real)
	NPoints(Standard_Integer)
	Exact(Standard_Boolean)
	Box(Bnd_Box2d)

Returns:
	None

Computes a boundary box on segment of curve C2d from First  
         to Last. This is done by taking NPoints points from the  
         curve and, if Exact is True, by searching for exact  
         extrema. All these points are added to Box.") FillBndBox;
		void FillBndBox (const Handle_Geom2d_Curve & C2d,const Standard_Real First,const Standard_Real Last,const Standard_Integer NPoints,const Standard_Boolean Exact,Bnd_Box2d & Box);
		%feature("autodoc", "Args:
	C1(Handle_Geom2d_Curve)
	C2(Handle_Geom2d_Curve)

Returns:
	Standard_Integer

Defines which pcurve (C1 or C2) should be chosen for FORWARD  
         seam edge.") SelectForwardSeam;
		Standard_Integer SelectForwardSeam (const Handle_Geom2d_Curve & C1,const Handle_Geom2d_Curve & C2);
		%feature("autodoc", "Args:
	pnts(TColgp_Array1OfPnt)
	Normal(gp_XYZ)
	preci(Standard_Real)=0

Returns:
	static Standard_Boolean

Checks if points are planar with given preci. If Normal has not zero  
         modulus, checks with given normal") IsPlanar;
		static Standard_Boolean IsPlanar (const TColgp_Array1OfPnt & pnts,gp_XYZ & Normal,const Standard_Real preci = 0);
		%feature("autodoc", "Args:
	curve(Handle_Geom_Curve)
	Normal(gp_XYZ)
	preci(Standard_Real)=0

Returns:
	static Standard_Boolean

Checks if curve is planar with given preci. If Normal has not zero  
         modulus, checks with given normal") IsPlanar;
		static Standard_Boolean IsPlanar (const Handle_Geom_Curve & curve,gp_XYZ & Normal,const Standard_Real preci = 0);
		%feature("autodoc", "Args:
	curve(Handle_Geom2d_Curve)
	first(Standard_Real)
	last(Standard_Real)
	seq(TColgp_SequenceOfPnt2d)

Returns:
	static Standard_Boolean

Returns sample points which will serve as linearisation  
         of the2d curve in range (first, last)  
         The distribution of sample points is consystent with  
         what is used by BRepTopAdaptor_FClass2d") GetSamplePoints;
		static Standard_Boolean GetSamplePoints (const Handle_Geom2d_Curve & curve,const Standard_Real first,const Standard_Real last,TColgp_SequenceOfPnt2d & seq);
		%feature("autodoc", "Args:
	curve(Handle_Geom_Curve)
	first(Standard_Real)
	last(Standard_Real)
	seq(TColgp_SequenceOfPnt)

Returns:
	static Standard_Boolean

Returns sample points which will serve as linearisation  
         of the curve in range (first, last)") GetSamplePoints;
		static Standard_Boolean GetSamplePoints (const Handle_Geom_Curve & curve,const Standard_Real first,const Standard_Real last,TColgp_SequenceOfPnt & seq);
		%feature("autodoc", "Args:
	curve(Handle_Geom_Curve)
	preci(Standard_Real)=- 1

Returns:
	static Standard_Boolean

Tells if the Curve is closed with given precision.  
         If <preci> < 0 then Precision::Confusion is used.") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Geom_Curve & curve,const Standard_Real preci = - 1);
		%feature("autodoc", "Args:
	curve(Handle_Geom_Curve)

Returns:
	static Standard_Boolean

This method was implemented as fix for changes in trimmed curve  
         behaviour. For the moment trimmed curve returns false anyway.  
         So it is necessary to adapt all Data exchange tools for this behaviour.  
         Current implementation takes into account that curve may be offset.") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Handle_Geom_Curve & curve);
		%feature("autodoc", "Args:
	curve(Handle_Geom2d_Curve)

Returns:
	static Standard_Boolean

The same as for Curve3d.") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Handle_Geom2d_Curve & curve);
};


%feature("shadow") ShapeAnalysis_Curve::~ShapeAnalysis_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_DataMapIteratorOfDataMapOfShapeListOfReal;
class ShapeAnalysis_DataMapIteratorOfDataMapOfShapeListOfReal : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeAnalysis_DataMapIteratorOfDataMapOfShapeListOfReal;
		 ShapeAnalysis_DataMapIteratorOfDataMapOfShapeListOfReal ();
		%feature("autodoc", "Args:
	aMap(ShapeAnalysis_DataMapOfShapeListOfReal)

Returns:
	None

No detailed docstring for this function.") ShapeAnalysis_DataMapIteratorOfDataMapOfShapeListOfReal;
		 ShapeAnalysis_DataMapIteratorOfDataMapOfShapeListOfReal (const ShapeAnalysis_DataMapOfShapeListOfReal & aMap);
		%feature("autodoc", "Args:
	aMap(ShapeAnalysis_DataMapOfShapeListOfReal)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const ShapeAnalysis_DataMapOfShapeListOfReal & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfReal

No detailed docstring for this function.") Value;
		const TColStd_ListOfReal & Value ();
};


%feature("shadow") ShapeAnalysis_DataMapIteratorOfDataMapOfShapeListOfReal::~ShapeAnalysis_DataMapIteratorOfDataMapOfShapeListOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_DataMapIteratorOfDataMapOfShapeListOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal;
class ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TColStd_ListOfReal)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal;
		 ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal (const TopoDS_Shape & K,const TColStd_ListOfReal & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfReal

No detailed docstring for this function.") Value;
		TColStd_ListOfReal & Value ();
};


%feature("shadow") ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal::~ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal {
	Handle_ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal GetHandle() {
	return *(Handle_ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal*) &$self;
	}
};

%nodefaultctor Handle_ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal;
class Handle_ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal();
        Handle_ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal(const Handle_ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal &aHandle);
        Handle_ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal(const ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal {
    ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal* GetObject() {
    return (ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal::~Handle_ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeAnalysis_DataMapNodeOfDataMapOfShapeListOfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeAnalysis_DataMapOfShapeListOfReal;
class ShapeAnalysis_DataMapOfShapeListOfReal : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") ShapeAnalysis_DataMapOfShapeListOfReal;
		 ShapeAnalysis_DataMapOfShapeListOfReal (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(ShapeAnalysis_DataMapOfShapeListOfReal)

Returns:
	ShapeAnalysis_DataMapOfShapeListOfReal

No detailed docstring for this function.") Assign;
		ShapeAnalysis_DataMapOfShapeListOfReal & Assign (const ShapeAnalysis_DataMapOfShapeListOfReal & Other);
		%feature("autodoc", "Args:
	Other(ShapeAnalysis_DataMapOfShapeListOfReal)

Returns:
	ShapeAnalysis_DataMapOfShapeListOfReal

No detailed docstring for this function.") operator=;
		ShapeAnalysis_DataMapOfShapeListOfReal & operator = (const ShapeAnalysis_DataMapOfShapeListOfReal & Other);
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
	I(TColStd_ListOfReal)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TColStd_ListOfReal & I);
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
	TColStd_ListOfReal

No detailed docstring for this function.") Find;
		const TColStd_ListOfReal & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TColStd_ListOfReal

No detailed docstring for this function.") ChangeFind;
		TColStd_ListOfReal & ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") ShapeAnalysis_DataMapOfShapeListOfReal::~ShapeAnalysis_DataMapOfShapeListOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_DataMapOfShapeListOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_Edge;
class ShapeAnalysis_Edge {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor; initialises Status to OK") ShapeAnalysis_Edge;
		 ShapeAnalysis_Edge ();
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)

Returns:
	Standard_Boolean

Tells if the edge has a 3d curve") HasCurve3d;
		Standard_Boolean HasCurve3d (const TopoDS_Edge & edge);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	C3d(Handle_Geom_Curve)
	cf(Standard_Real)
	cl(Standard_Real)
	orient(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Returns the 3d curve and bounding parameteres for the edge  
         Returns False if no 3d curve.  
         If <orient> is True (default), takes orientation into account:  
         if the edge is reversed, cf and cl are toggled") Curve3d;
		Standard_Boolean Curve3d (const TopoDS_Edge & edge,Handle_Geom_Curve & C3d,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean orient = Standard_True);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)

Returns:
	Standard_Boolean

Gives True if the edge has a 3d curve, this curve is closed,  
         and the edge has the same vertex at start and end") IsClosed3d;
		Standard_Boolean IsClosed3d (const TopoDS_Edge & edge);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)

Returns:
	Standard_Boolean

Tells if the Edge has a pcurve on the face.") HasPCurve;
		Standard_Boolean HasPCurve (const TopoDS_Edge & edge,const TopoDS_Face & face);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	surface(Handle_Geom_Surface)
	location(TopLoc_Location)

Returns:
	Standard_Boolean

Tells if the edge has a pcurve on the surface (with location).") HasPCurve;
		Standard_Boolean HasPCurve (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)
	C2d(Handle_Geom2d_Curve)
	cf(Standard_Real)
	cl(Standard_Real)
	orient(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

No detailed docstring for this function.") PCurve;
		Standard_Boolean PCurve (const TopoDS_Edge & edge,const TopoDS_Face & face,Handle_Geom2d_Curve & C2d,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean orient = Standard_True);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	surface(Handle_Geom_Surface)
	location(TopLoc_Location)
	C2d(Handle_Geom2d_Curve)
	cf(Standard_Real)
	cl(Standard_Real)
	orient(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Returns the pcurve and bounding parameteres for the edge  
         lying on the surface.  
         Returns False if the edge has no pcurve on this surface.  
         If <orient> is True (default), takes orientation into account:  
         if the edge is reversed, cf and cl are toggled") PCurve;
		Standard_Boolean PCurve (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location,Handle_Geom2d_Curve & C2d,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean orient = Standard_True);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)
	first(gp_Pnt2d)
	last(gp_Pnt2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") BoundUV;
		Standard_Boolean BoundUV (const TopoDS_Edge & edge,const TopoDS_Face & face,gp_Pnt2d & first,gp_Pnt2d & last);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	surface(Handle_Geom_Surface)
	location(TopLoc_Location)
	first(gp_Pnt2d)
	last(gp_Pnt2d)

Returns:
	Standard_Boolean

Returns the ends of pcurve  
         Calls method PCurve with <orient> equal to True") BoundUV;
		Standard_Boolean BoundUV (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location,gp_Pnt2d & first,gp_Pnt2d & last);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSeam;
		Standard_Boolean IsSeam (const TopoDS_Edge & edge,const TopoDS_Face & face);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	surface(Handle_Geom_Surface)
	location(TopLoc_Location)

Returns:
	Standard_Boolean

Returns True if the edge has two pcurves on one surface") IsSeam;
		Standard_Boolean IsSeam (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)

Returns:
	TopoDS_Vertex

Returns start vertex of the edge (taking edge orientation  
         into account).") FirstVertex;
		TopoDS_Vertex FirstVertex (const TopoDS_Edge & edge);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)

Returns:
	TopoDS_Vertex

Returns end vertex of the edge (taking edge orientation  
         into account).") LastVertex;
		TopoDS_Vertex LastVertex (const TopoDS_Edge & edge);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)
	atEnd(Standard_Boolean)
	pos(gp_Pnt2d)
	tang(gp_Vec2d)
	dparam(Standard_Real)=0.0

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetEndTangent2d;
		Standard_Boolean GetEndTangent2d (const TopoDS_Edge & edge,const TopoDS_Face & face,const Standard_Boolean atEnd,gp_Pnt2d & pos,gp_Vec2d & tang,const Standard_Real dparam = 0.0);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	surface(Handle_Geom_Surface)
	location(TopLoc_Location)
	atEnd(Standard_Boolean)
	pos(gp_Pnt2d)
	tang(gp_Vec2d)
	dparam(Standard_Real)=0.0

Returns:
	Standard_Boolean

Returns tangent of the edge pcurve at its start (if atEnd is  
         False) or end (if True), regarding the orientation of edge.  
         If edge is REVERSED, tangent is reversed before return.  
         Returns True if pcurve is available and tangent is computed  
         and is not null, else False.") GetEndTangent2d;
		Standard_Boolean GetEndTangent2d (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location,const Standard_Boolean atEnd,gp_Pnt2d & pos,gp_Vec2d & tang,const Standard_Real dparam = 0.0);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	preci(Standard_Real)=- 1
	vtx(Standard_Integer)=0

Returns:
	Standard_Boolean

Checks the start and/or end vertex of the edge for matching  
         with 3d curve with the given precision.  
         <vtx> = 1 : start vertex only  
         <vtx> = 2 : end vertex only  
         <vtx> = 0 : both (default)  
         If preci < 0 the vertices are considered with their own  
         tolerances, else with the given <preci>.") CheckVerticesWithCurve3d;
		Standard_Boolean CheckVerticesWithCurve3d (const TopoDS_Edge & edge,const Standard_Real preci = - 1,const Standard_Integer vtx = 0);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)
	preci(Standard_Real)=- 1
	vtx(Standard_Integer)=0

Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckVerticesWithPCurve;
		Standard_Boolean CheckVerticesWithPCurve (const TopoDS_Edge & edge,const TopoDS_Face & face,const Standard_Real preci = - 1,const Standard_Integer vtx = 0);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	surface(Handle_Geom_Surface)
	location(TopLoc_Location)
	preci(Standard_Real)=- 1
	vtx(Standard_Integer)=0

Returns:
	Standard_Boolean

Checks the start and/or end vertex of the edge for matching  
         with pcurve with the given precision.  
         <vtx> = 1 : start vertex  
         <vtx> = 2 : end vertex  
         <vtx> = 0 : both  
         If preci < 0 the vertices are considered with their own  
         tolerances, else with the given <preci>.") CheckVerticesWithPCurve;
		Standard_Boolean CheckVerticesWithPCurve (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location,const Standard_Real preci = - 1,const Standard_Integer vtx = 0);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)
	toler1(Standard_Real)
	toler2(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckVertexTolerance;
		Standard_Boolean CheckVertexTolerance (const TopoDS_Edge & edge,const TopoDS_Face & face,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	toler1(Standard_Real)
	toler2(Standard_Real)

Returns:
	Standard_Boolean

Checks if it is necessary to increase tolerances of the edge  
         vertices to comprise the ends of 3d curve and pcurve on  
         the given face (first method) or all pcurves stored in an edge  
         (second one)  
         toler1 returns necessary tolerance for first vertex,  
         toler2 returns necessary tolerance for last vertex.") CheckVertexTolerance;
		Standard_Boolean CheckVertexTolerance (const TopoDS_Edge & edge,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	face(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckCurve3dWithPCurve;
		Standard_Boolean CheckCurve3dWithPCurve (const TopoDS_Edge & edge,const TopoDS_Face & face);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	surface(Handle_Geom_Surface)
	location(TopLoc_Location)

Returns:
	Standard_Boolean

Checks mutual orientation of 3d curve and pcurve on the  
         analysis of curves bounding points") CheckCurve3dWithPCurve;
		Standard_Boolean CheckCurve3dWithPCurve (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Returns the status (in the form of True/False) of last Check") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	edge(TopoDS_Edge)
	maxdev(Standard_Real)
	NbControl(Standard_Integer)=23

Returns:
	Standard_Boolean

Checks the edge to be SameParameter.  
         Calculates the maximal deviation between 3d curve and each  
         pcurve of the edge on <NbControl> equidistant points (the same  
         algorithm as in BRepCheck; default value is 23 as in BRepCheck).  
         This deviation is returned in <maxdev> parameter.  
         If deviation is greater than tolerance of the edge (i.e.  
         incorrect flag) returns False, else returns True.") CheckSameParameter;
		Standard_Boolean CheckSameParameter (const TopoDS_Edge & edge,Standard_Real &OutValue,const Standard_Integer NbControl = 23);
		%feature("autodoc", "Args:
	theEdge1(TopoDS_Edge)
	theEdge2(TopoDS_Edge)
	theTolOverlap(Standard_Real)
	theDomainDist(Standard_Real)=0.0

Returns:
	Standard_Boolean

Checks the first edge is overlapped with second edge.  
         If distance between two edges is less then theTolOverlap  
         edges is overlapped.  
         theDomainDis - length of part of edges on wich edges is overlapped.") CheckOverlapping;
		Standard_Boolean CheckOverlapping (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2,Standard_Real &OutValue,const Standard_Real theDomainDist = 0.0);
};


%feature("shadow") ShapeAnalysis_Edge::~ShapeAnalysis_Edge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_Edge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_FreeBoundData;
class ShapeAnalysis_FreeBoundData : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeAnalysis_FreeBoundData;
		 ShapeAnalysis_FreeBoundData ();
		%feature("autodoc", "Args:
	freebound(TopoDS_Wire)

Returns:
	None

Creates object with contour given in the form of TopoDS_Wire") ShapeAnalysis_FreeBoundData;
		 ShapeAnalysis_FreeBoundData (const TopoDS_Wire & freebound);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears all properties of the contour.  
         Contour bound itself is not cleared.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	freebound(TopoDS_Wire)

Returns:
	None

Sets contour") SetFreeBound;
		void SetFreeBound (const TopoDS_Wire & freebound);
		%feature("autodoc", "Args:
	area(Standard_Real)

Returns:
	None

Sets area of the contour") SetArea;
		void SetArea (const Standard_Real area);
		%feature("autodoc", "Args:
	perimeter(Standard_Real)

Returns:
	None

Sets perimeter of the contour") SetPerimeter;
		void SetPerimeter (const Standard_Real perimeter);
		%feature("autodoc", "Args:
	ratio(Standard_Real)

Returns:
	None

Sets ratio of average length to average width of the contour") SetRatio;
		void SetRatio (const Standard_Real ratio);
		%feature("autodoc", "Args:
	width(Standard_Real)

Returns:
	None

Sets average width of the contour") SetWidth;
		void SetWidth (const Standard_Real width);
		%feature("autodoc", "Args:
	notch(TopoDS_Wire)
	width(Standard_Real)

Returns:
	None

Adds notch on the contour with its maximum width") AddNotch;
		void AddNotch (const TopoDS_Wire & notch,const Standard_Real width);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

Returns contour") FreeBound;
		TopoDS_Wire FreeBound ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns area of the contour") Area;
		Standard_Real Area ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns perimeter of the contour") Perimeter;
		Standard_Real Perimeter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns ratio of average length to average width of the contour") Ratio;
		Standard_Real Ratio ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns average width of the contour") Width;
		Standard_Real Width ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of notches on the contour") NbNotches;
		Standard_Integer NbNotches ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HSequenceOfShape

Returns sequence of notches on the contour") Notches;
		Handle_TopTools_HSequenceOfShape Notches ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	TopoDS_Wire

Returns notch on the contour") Notch;
		TopoDS_Wire Notch (const Standard_Integer index);
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Standard_Real

Returns maximum width of notch specified by its rank number  
         on the contour") NotchWidth;
		Standard_Real NotchWidth (const Standard_Integer index);
		%feature("autodoc", "Args:
	notch(TopoDS_Wire)

Returns:
	Standard_Real

Returns maximum width of notch specified as TopoDS_Wire  
         on the contour") NotchWidth;
		Standard_Real NotchWidth (const TopoDS_Wire & notch);
};


%feature("shadow") ShapeAnalysis_FreeBoundData::~ShapeAnalysis_FreeBoundData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_FreeBoundData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeAnalysis_FreeBoundData {
	Handle_ShapeAnalysis_FreeBoundData GetHandle() {
	return *(Handle_ShapeAnalysis_FreeBoundData*) &$self;
	}
};

%nodefaultctor Handle_ShapeAnalysis_FreeBoundData;
class Handle_ShapeAnalysis_FreeBoundData : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeAnalysis_FreeBoundData();
        Handle_ShapeAnalysis_FreeBoundData(const Handle_ShapeAnalysis_FreeBoundData &aHandle);
        Handle_ShapeAnalysis_FreeBoundData(const ShapeAnalysis_FreeBoundData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeAnalysis_FreeBoundData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeAnalysis_FreeBoundData {
    ShapeAnalysis_FreeBoundData* GetObject() {
    return (ShapeAnalysis_FreeBoundData*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeAnalysis_FreeBoundData::~Handle_ShapeAnalysis_FreeBoundData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeAnalysis_FreeBoundData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeAnalysis_FreeBounds;
class ShapeAnalysis_FreeBounds {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	toler(Standard_Real)
	splitclosed(Standard_Boolean)=Standard_False
	splitopen(Standard_Boolean)=Standard_True

Returns:
	None

Builds forecasting free bounds of the <shape>.  
         <shape> should be a compound of faces.  
         This constructor is to be used for forecasting free edges  
         with help of sewing analyzer BRepAlgo_Sewing which is called  
         with tolerance <toler>.  
         Free edges are connected into wires only when their ends are  
         at distance less than <toler>.  
         If <splitclosed> is True extracts closed sub-wires out of  
         built closed wires.  
         If <splitopen> is True extracts closed sub-wires out of  
         built open wires.") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds (const TopoDS_Shape & shape,const Standard_Real toler,const Standard_Boolean splitclosed = Standard_False,const Standard_Boolean splitopen = Standard_True);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	splitclosed(Standard_Boolean)=Standard_False
	splitopen(Standard_Boolean)=Standard_True
	checkinternaledges(Standard_Boolean)=Standard_False

Returns:
	None

Builds actual free bounds of the <shape>.  
         <shape> should be a compound of shells.  
         This constructor is to be used for getting free edges (ones  
         referenced by the only face) with help of analyzer  
         ShapeAnalysis_Shell.  
         Free edges are connected into wires only when they share the  
         same vertex.  
         If <splitclosed> is True extracts closed sub-wires out of  
         built closed wires.  
         If <splitopen> is True extracts closed sub-wires out of  
         built open wires.") ShapeAnalysis_FreeBounds;
		 ShapeAnalysis_FreeBounds (const TopoDS_Shape & shape,const Standard_Boolean splitclosed = Standard_False,const Standard_Boolean splitopen = Standard_True,const Standard_Boolean checkinternaledges = Standard_False);
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
	edges(Handle_TopTools_HSequenceOfShape)
	toler(Standard_Real)
	shared(Standard_Boolean)
	wires(Handle_TopTools_HSequenceOfShape)

Returns:
	static void

Builds sequnce of <wires> out of sequence of not sorted  
         <edges>.  
         Tries to build wires of maximum length. Building a wire is  
         stopped when no edges can be connected to it at its head or  
         at its tail.  
 
         Orientation of the edge can change when connecting.  
         If <shared> is True connection is performed only when  
         adjacent edges share the same vertex.  
         If <shared> is False connection is performed only when  
         ends of adjacent edges are at distance less than <toler>.") ConnectEdgesToWires;
		static void ConnectEdgesToWires (Handle_TopTools_HSequenceOfShape & edges,const Standard_Real toler,const Standard_Boolean shared,Handle_TopTools_HSequenceOfShape & wires);
		%feature("autodoc", "Args:
	iwires(Handle_TopTools_HSequenceOfShape)
	toler(Standard_Real)
	shared(Standard_Boolean)
	owires(Handle_TopTools_HSequenceOfShape)

Returns:
	static void

No detailed docstring for this function.") ConnectWiresToWires;
		static void ConnectWiresToWires (Handle_TopTools_HSequenceOfShape & iwires,const Standard_Real toler,const Standard_Boolean shared,Handle_TopTools_HSequenceOfShape & owires);
		%feature("autodoc", "Args:
	iwires(Handle_TopTools_HSequenceOfShape)
	toler(Standard_Real)
	shared(Standard_Boolean)
	owires(Handle_TopTools_HSequenceOfShape)
	vertices(TopTools_DataMapOfShapeShape)

Returns:
	static void

Builds sequnce of <owires> out of sequence of not sorted  
         <iwires>.  
         Tries to build wires of maximum length. Building a wire is  
         stopped when no wires can be connected to it at its head or  
         at its tail.  
 
         Orientation of the wire can change when connecting.  
         If <shared> is True connection is performed only when  
         adjacent wires share the same vertex.  
         If <shared> is False connection is performed only when  
         ends of adjacent wires are at distance less than <toler>.  
         Map <vertices> stores the correspondence between original  
         end vertices of the wires and new connecting vertices.") ConnectWiresToWires;
		static void ConnectWiresToWires (Handle_TopTools_HSequenceOfShape & iwires,const Standard_Real toler,const Standard_Boolean shared,Handle_TopTools_HSequenceOfShape & owires,TopTools_DataMapOfShapeShape & vertices);
		%feature("autodoc", "Args:
	wires(Handle_TopTools_HSequenceOfShape)
	toler(Standard_Real)
	shared(Standard_Boolean)
	closed(Handle_TopTools_HSequenceOfShape)
	open(Handle_TopTools_HSequenceOfShape)

Returns:
	static void

Extracts closed sub-wires out of <wires> and adds them  
         to <closed>, open wires remained after extraction are put  
         into <open>.  
         If <shared> is True extraction is performed only when  
         edges share the same vertex.  
         If <shared> is False connection is performed only when  
         ends of the edges are at distance less than <toler>.") SplitWires;
		static void SplitWires (const Handle_TopTools_HSequenceOfShape & wires,const Standard_Real toler,const Standard_Boolean shared,Handle_TopTools_HSequenceOfShape & closed,Handle_TopTools_HSequenceOfShape & open);
		%feature("autodoc", "Args:
	wires(Handle_TopTools_HSequenceOfShape)
	closed(TopoDS_Compound)
	open(TopoDS_Compound)

Returns:
	static void

Dispatches sequence of <wires> into two compounds  
         <closed> for closed wires and <open> for open wires.  
         If a compound is not empty wires are added into it.") DispatchWires;
		static void DispatchWires (const Handle_TopTools_HSequenceOfShape & wires,TopoDS_Compound & closed,TopoDS_Compound & open);
};


%feature("shadow") ShapeAnalysis_FreeBounds::~ShapeAnalysis_FreeBounds %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_FreeBounds {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_FreeBoundsProperties;
class ShapeAnalysis_FreeBoundsProperties {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	tolerance(Standard_Real)
	splitclosed(Standard_Boolean)=Standard_False
	splitopen(Standard_Boolean)=Standard_False

Returns:
	None

Creates the object and calls corresponding Init.  
         <shape> should be a compound of faces.") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties (const TopoDS_Shape & shape,const Standard_Real tolerance,const Standard_Boolean splitclosed = Standard_False,const Standard_Boolean splitopen = Standard_False);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	splitclosed(Standard_Boolean)=Standard_False
	splitopen(Standard_Boolean)=Standard_False

Returns:
	None

Creates the object and calls corresponding Init.  
         <shape> should be a compound of shells.") ShapeAnalysis_FreeBoundsProperties;
		 ShapeAnalysis_FreeBoundsProperties (const TopoDS_Shape & shape,const Standard_Boolean splitclosed = Standard_False,const Standard_Boolean splitopen = Standard_False);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	tolerance(Standard_Real)
	splitclosed(Standard_Boolean)=Standard_False
	splitopen(Standard_Boolean)=Standard_False

Returns:
	None

Initializes the object with given parameters.  
         <shape> should be a compound of faces.") Init;
		void Init (const TopoDS_Shape & shape,const Standard_Real tolerance,const Standard_Boolean splitclosed = Standard_False,const Standard_Boolean splitopen = Standard_False);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	splitclosed(Standard_Boolean)=Standard_False
	splitopen(Standard_Boolean)=Standard_False

Returns:
	None

Initializes the object with given parameters.  
         <shape> should be a compound of shells.") Init;
		void Init (const TopoDS_Shape & shape,const Standard_Boolean splitclosed = Standard_False,const Standard_Boolean splitopen = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Builds and analyzes free bounds of the shape.  
         First calls ShapeAnalysis_FreeBounds for building free  
         bounds.  
         Then on each free bound computes its properties:  
         - area of the contour,  
         - perimeter of the contour,  
         - ratio of average length to average width of the contour,  
         - average width of contour,  
         - notches on the contour and for each notch  
           - maximum width of the notch.") Perform;
		Standard_Boolean Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if shape is loaded") IsLoaded;
		Standard_Boolean IsLoaded ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns shape") Shape;
		TopoDS_Shape Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns tolerance") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of free bounds") NbFreeBounds;
		Standard_Integer NbFreeBounds ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of closed free bounds") NbClosedFreeBounds;
		Standard_Integer NbClosedFreeBounds ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of open free bounds") NbOpenFreeBounds;
		Standard_Integer NbOpenFreeBounds ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeAnalysis_HSequenceOfFreeBounds

Returns all closed free bounds") ClosedFreeBounds;
		Handle_ShapeAnalysis_HSequenceOfFreeBounds ClosedFreeBounds ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeAnalysis_HSequenceOfFreeBounds

Returns all open free bounds") OpenFreeBounds;
		Handle_ShapeAnalysis_HSequenceOfFreeBounds OpenFreeBounds ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Handle_ShapeAnalysis_FreeBoundData

Returns properties of closed free bound specified by its rank  
         number") ClosedFreeBound;
		Handle_ShapeAnalysis_FreeBoundData ClosedFreeBound (const Standard_Integer index);
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Handle_ShapeAnalysis_FreeBoundData

Returns properties of open free bound specified by its rank  
         number") OpenFreeBound;
		Handle_ShapeAnalysis_FreeBoundData OpenFreeBound (const Standard_Integer index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") DispatchBounds;
		Standard_Boolean DispatchBounds ();
		%feature("autodoc", "Args:
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckContours;
		Standard_Boolean CheckContours (const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckNotches;
		Standard_Boolean CheckNotches (const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	fbData(Handle_ShapeAnalysis_FreeBoundData)
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckNotches;
		Standard_Boolean CheckNotches (Handle_ShapeAnalysis_FreeBoundData & fbData,const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	freebound(TopoDS_Wire)
	num(Standard_Integer)
	notch(TopoDS_Wire)
	distMax(Standard_Real)
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckNotches;
		Standard_Boolean CheckNotches (const TopoDS_Wire & freebound,const Standard_Integer num,TopoDS_Wire & notch,Standard_Real &OutValue,const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	fbData(Handle_ShapeAnalysis_FreeBoundData)
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

No detailed docstring for this function.") FillProperties;
		Standard_Boolean FillProperties (Handle_ShapeAnalysis_FreeBoundData & fbData,const Standard_Real prec = 0.0);
};


%feature("shadow") ShapeAnalysis_FreeBoundsProperties::~ShapeAnalysis_FreeBoundsProperties %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_FreeBoundsProperties {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_Geom;
class ShapeAnalysis_Geom {
	public:
		%feature("autodoc", "Args:
	Pnts(TColgp_Array1OfPnt)
	aPln(gp_Pln)
	Dmax(Standard_Real)

Returns:
	static Standard_Boolean

Builds a plane out of a set of points in array  
          Returns in <dmax> the maximal distance between the produced  
          plane and given points") NearestPlane;
		static Standard_Boolean NearestPlane (const TColgp_Array1OfPnt & Pnts,gp_Pln & aPln,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	coefs(Handle_TColStd_HArray2OfReal)
	trsf(gp_Trsf)
	unit(Standard_Real)
	prec(Standard_Real)

Returns:
	static Standard_Boolean

Builds transfromation object out of matrix.  
         Matrix must be 3 x 4.  
         Unit is used as multiplier.") PositionTrsf;
		static Standard_Boolean PositionTrsf (const Handle_TColStd_HArray2OfReal & coefs,gp_Trsf & trsf,const Standard_Real unit,const Standard_Real prec);
};


%feature("shadow") ShapeAnalysis_Geom::~ShapeAnalysis_Geom %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_Geom {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_HSequenceOfFreeBounds;
class ShapeAnalysis_HSequenceOfFreeBounds : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeAnalysis_HSequenceOfFreeBounds;
		 ShapeAnalysis_HSequenceOfFreeBounds ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_ShapeAnalysis_FreeBoundData)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_ShapeAnalysis_FreeBoundData & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_ShapeAnalysis_HSequenceOfFreeBounds)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_ShapeAnalysis_HSequenceOfFreeBounds & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_ShapeAnalysis_FreeBoundData)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_ShapeAnalysis_FreeBoundData & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_ShapeAnalysis_HSequenceOfFreeBounds)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_ShapeAnalysis_HSequenceOfFreeBounds & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_ShapeAnalysis_FreeBoundData)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_ShapeAnalysis_FreeBoundData & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_ShapeAnalysis_HSequenceOfFreeBounds)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_ShapeAnalysis_HSequenceOfFreeBounds & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_ShapeAnalysis_FreeBoundData)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_ShapeAnalysis_FreeBoundData & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_ShapeAnalysis_HSequenceOfFreeBounds)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_ShapeAnalysis_HSequenceOfFreeBounds & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_ShapeAnalysis_HSequenceOfFreeBounds

No detailed docstring for this function.") Split;
		Handle_ShapeAnalysis_HSequenceOfFreeBounds Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_ShapeAnalysis_FreeBoundData)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_ShapeAnalysis_FreeBoundData & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_ShapeAnalysis_FreeBoundData

No detailed docstring for this function.") Value;
		const Handle_ShapeAnalysis_FreeBoundData & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_ShapeAnalysis_FreeBoundData

No detailed docstring for this function.") ChangeValue;
		Handle_ShapeAnalysis_FreeBoundData & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	ShapeAnalysis_SequenceOfFreeBounds

No detailed docstring for this function.") Sequence;
		const ShapeAnalysis_SequenceOfFreeBounds & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	ShapeAnalysis_SequenceOfFreeBounds

No detailed docstring for this function.") ChangeSequence;
		ShapeAnalysis_SequenceOfFreeBounds & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeAnalysis_HSequenceOfFreeBounds

No detailed docstring for this function.") ShallowCopy;
		Handle_ShapeAnalysis_HSequenceOfFreeBounds ShallowCopy ();
};


%feature("shadow") ShapeAnalysis_HSequenceOfFreeBounds::~ShapeAnalysis_HSequenceOfFreeBounds %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_HSequenceOfFreeBounds {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeAnalysis_HSequenceOfFreeBounds {
	Handle_ShapeAnalysis_HSequenceOfFreeBounds GetHandle() {
	return *(Handle_ShapeAnalysis_HSequenceOfFreeBounds*) &$self;
	}
};

%nodefaultctor Handle_ShapeAnalysis_HSequenceOfFreeBounds;
class Handle_ShapeAnalysis_HSequenceOfFreeBounds : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeAnalysis_HSequenceOfFreeBounds();
        Handle_ShapeAnalysis_HSequenceOfFreeBounds(const Handle_ShapeAnalysis_HSequenceOfFreeBounds &aHandle);
        Handle_ShapeAnalysis_HSequenceOfFreeBounds(const ShapeAnalysis_HSequenceOfFreeBounds *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeAnalysis_HSequenceOfFreeBounds DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeAnalysis_HSequenceOfFreeBounds {
    ShapeAnalysis_HSequenceOfFreeBounds* GetObject() {
    return (ShapeAnalysis_HSequenceOfFreeBounds*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeAnalysis_HSequenceOfFreeBounds::~Handle_ShapeAnalysis_HSequenceOfFreeBounds %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeAnalysis_HSequenceOfFreeBounds {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds;
class ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_ShapeAnalysis_FreeBoundData)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds;
		 ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds (const Handle_ShapeAnalysis_FreeBoundData & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeAnalysis_FreeBoundData

No detailed docstring for this function.") Value;
		Handle_ShapeAnalysis_FreeBoundData & Value ();
};


%feature("shadow") ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds::~ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds {
	Handle_ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds GetHandle() {
	return *(Handle_ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds*) &$self;
	}
};

%nodefaultctor Handle_ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds;
class Handle_ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds();
        Handle_ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds(const Handle_ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds &aHandle);
        Handle_ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds(const ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds {
    ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds* GetObject() {
    return (ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds::~Handle_ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeAnalysis_SequenceNodeOfSequenceOfFreeBounds {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeAnalysis_SequenceOfFreeBounds;
class ShapeAnalysis_SequenceOfFreeBounds : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeAnalysis_SequenceOfFreeBounds;
		 ShapeAnalysis_SequenceOfFreeBounds ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(ShapeAnalysis_SequenceOfFreeBounds)

Returns:
	ShapeAnalysis_SequenceOfFreeBounds

No detailed docstring for this function.") Assign;
		const ShapeAnalysis_SequenceOfFreeBounds & Assign (const ShapeAnalysis_SequenceOfFreeBounds & Other);
		%feature("autodoc", "Args:
	Other(ShapeAnalysis_SequenceOfFreeBounds)

Returns:
	ShapeAnalysis_SequenceOfFreeBounds

No detailed docstring for this function.") operator=;
		const ShapeAnalysis_SequenceOfFreeBounds & operator = (const ShapeAnalysis_SequenceOfFreeBounds & Other);
		%feature("autodoc", "Args:
	T(Handle_ShapeAnalysis_FreeBoundData)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_ShapeAnalysis_FreeBoundData & T);
		%feature("autodoc", "Args:
	S(ShapeAnalysis_SequenceOfFreeBounds)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (ShapeAnalysis_SequenceOfFreeBounds & S);
		%feature("autodoc", "Args:
	T(Handle_ShapeAnalysis_FreeBoundData)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_ShapeAnalysis_FreeBoundData & T);
		%feature("autodoc", "Args:
	S(ShapeAnalysis_SequenceOfFreeBounds)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (ShapeAnalysis_SequenceOfFreeBounds & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_ShapeAnalysis_FreeBoundData)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_ShapeAnalysis_FreeBoundData & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(ShapeAnalysis_SequenceOfFreeBounds)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ShapeAnalysis_SequenceOfFreeBounds & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_ShapeAnalysis_FreeBoundData)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_ShapeAnalysis_FreeBoundData & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(ShapeAnalysis_SequenceOfFreeBounds)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ShapeAnalysis_SequenceOfFreeBounds & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeAnalysis_FreeBoundData

No detailed docstring for this function.") First;
		const Handle_ShapeAnalysis_FreeBoundData & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeAnalysis_FreeBoundData

No detailed docstring for this function.") Last;
		const Handle_ShapeAnalysis_FreeBoundData & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(ShapeAnalysis_SequenceOfFreeBounds)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,ShapeAnalysis_SequenceOfFreeBounds & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_ShapeAnalysis_FreeBoundData

No detailed docstring for this function.") Value;
		const Handle_ShapeAnalysis_FreeBoundData & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_ShapeAnalysis_FreeBoundData)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_ShapeAnalysis_FreeBoundData & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_ShapeAnalysis_FreeBoundData

No detailed docstring for this function.") ChangeValue;
		Handle_ShapeAnalysis_FreeBoundData & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") ShapeAnalysis_SequenceOfFreeBounds::~ShapeAnalysis_SequenceOfFreeBounds %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_SequenceOfFreeBounds {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_ShapeContents;
class ShapeAnalysis_ShapeContents {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Initialize fields and call ClearFlags()") ShapeAnalysis_ShapeContents;
		 ShapeAnalysis_ShapeContents ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears all accumulated statictics") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears all flags") ClearFlags;
		void ClearFlags ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	None

Counts quantities of sun-shapes in shape and  
         stores sub-shapes according to flags") Perform;
		void Perform (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns (modifiable) the flag which defines whether to store faces  
         with edges if its 3D curves has more than 8192 poles.") ModifyBigSplineMode;
		Standard_Boolean & ModifyBigSplineMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns (modifiable) the flag which defines whether to store faces  
         on indirect surfaces") ModifyIndirectMode;
		Standard_Boolean & ModifyIndirectMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns (modifiable) the flag which defines whether to store faces  
         on offset surfaces.") ModifyOffestSurfaceMode;
		Standard_Boolean & ModifyOffestSurfaceMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns (modifiable) the flag which defines whether to store faces  
         with edges if ist 3D curves are trimmed curves") ModifyTrimmed3dMode;
		Standard_Boolean & ModifyTrimmed3dMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns (modifiable) the flag which defines whether to store faces  
         with edges if its 3D curves and pcurves are offest curves") ModifyOffsetCurveMode;
		Standard_Boolean & ModifyOffsetCurveMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns (modifiable) the flag which defines whether to store faces  
         with edges if its  pcurves are trimmed curves") ModifyTrimmed2dMode;
		Standard_Boolean & ModifyTrimmed2dMode ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSolids;
		Standard_Integer NbSolids ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbShells;
		Standard_Integer NbShells ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbFaces;
		Standard_Integer NbFaces ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbWires;
		Standard_Integer NbWires ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVertices;
		Standard_Integer NbVertices ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSolidsWithVoids;
		Standard_Integer NbSolidsWithVoids ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbBigSplines;
		Standard_Integer NbBigSplines ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbC0Surfaces;
		Standard_Integer NbC0Surfaces ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbC0Curves;
		Standard_Integer NbC0Curves ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbOffsetSurf;
		Standard_Integer NbOffsetSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbIndirectSurf;
		Standard_Integer NbIndirectSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbOffsetCurves;
		Standard_Integer NbOffsetCurves ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbTrimmedCurve2d;
		Standard_Integer NbTrimmedCurve2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbTrimmedCurve3d;
		Standard_Integer NbTrimmedCurve3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbBSplibeSurf;
		Standard_Integer NbBSplibeSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbBezierSurf;
		Standard_Integer NbBezierSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbTrimSurf;
		Standard_Integer NbTrimSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbWireWitnSeam;
		Standard_Integer NbWireWitnSeam ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbWireWithSevSeams;
		Standard_Integer NbWireWithSevSeams ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbFaceWithSevWires;
		Standard_Integer NbFaceWithSevWires ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbNoPCurve;
		Standard_Integer NbNoPCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbFreeFaces;
		Standard_Integer NbFreeFaces ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbFreeWires;
		Standard_Integer NbFreeWires ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbFreeEdges;
		Standard_Integer NbFreeEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSharedSolids;
		Standard_Integer NbSharedSolids ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSharedShells;
		Standard_Integer NbSharedShells ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSharedFaces;
		Standard_Integer NbSharedFaces ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSharedWires;
		Standard_Integer NbSharedWires ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSharedFreeWires;
		Standard_Integer NbSharedFreeWires ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSharedFreeEdges;
		Standard_Integer NbSharedFreeEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSharedEdges;
		Standard_Integer NbSharedEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSharedVertices;
		Standard_Integer NbSharedVertices ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HSequenceOfShape

No detailed docstring for this function.") BigSplineSec;
		Handle_TopTools_HSequenceOfShape BigSplineSec ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HSequenceOfShape

No detailed docstring for this function.") IndirectSec;
		Handle_TopTools_HSequenceOfShape IndirectSec ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HSequenceOfShape

No detailed docstring for this function.") OffsetSurfaceSec;
		Handle_TopTools_HSequenceOfShape OffsetSurfaceSec ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HSequenceOfShape

No detailed docstring for this function.") Trimmed3dSec;
		Handle_TopTools_HSequenceOfShape Trimmed3dSec ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HSequenceOfShape

No detailed docstring for this function.") OffsetCurveSec;
		Handle_TopTools_HSequenceOfShape OffsetCurveSec ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HSequenceOfShape

No detailed docstring for this function.") Trimmed2dSec;
		Handle_TopTools_HSequenceOfShape Trimmed2dSec ();
};


%feature("shadow") ShapeAnalysis_ShapeContents::~ShapeAnalysis_ShapeContents %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_ShapeContents {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_ShapeTolerance;
class ShapeAnalysis_ShapeTolerance {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeAnalysis_ShapeTolerance;
		 ShapeAnalysis_ShapeTolerance ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	mode(Standard_Integer)
	type(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	Standard_Real

Determines a tolerance from the ones stored in a shape  
         Remark : calls InitTolerance and AddTolerance,  
         hence, can be used to start a series for cumulating tolerance  
         <mode> = 0 : returns the average value between sub-shapes,  
         <mode> > 0 : returns the maximal found,  
         <mode> < 0 : returns the minimal found.  
         <type> defines what kinds of sub-shapes to consider:  
         SHAPE (default) : all : VERTEX, EDGE, FACE,  
         VERTEX : only vertices,  
         EDGE   : only edges,  
         FACE   : only faces,  
         SHELL  : combined SHELL + FACE, for each face (and containing  
         shell), also checks EDGE and VERTEX") Tolerance;
		Standard_Real Tolerance (const TopoDS_Shape & shape,const Standard_Integer mode,const TopAbs_ShapeEnum type = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	value(Standard_Real)
	type(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	Handle_TopTools_HSequenceOfShape

Determines which shapes have a tolerance over the given value  
         <type> is interpreted as in the method Tolerance") OverTolerance;
		Handle_TopTools_HSequenceOfShape OverTolerance (const TopoDS_Shape & shape,const Standard_Real value,const TopAbs_ShapeEnum type = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	valmin(Standard_Real)
	valmax(Standard_Real)
	type(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	Handle_TopTools_HSequenceOfShape

Determines which shapes have a tolerance within a given interval  
         <type> is interpreted as in the method Tolerance") InTolerance;
		Handle_TopTools_HSequenceOfShape InTolerance (const TopoDS_Shape & shape,const Standard_Real valmin,const Standard_Real valmax,const TopAbs_ShapeEnum type = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes computation of cumulated tolerance") InitTolerance;
		void InitTolerance ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	type(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	None

Adds data on new Shape to compute Cumulated Tolerance  
         (prepares three computations : maximal, average, minimal)") AddTolerance;
		void AddTolerance (const TopoDS_Shape & shape,const TopAbs_ShapeEnum type = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	mode(Standard_Integer)

Returns:
	Standard_Real

Returns the computed tolerance according to the <mode>  
         <mode> = 0 : average  
         <mode> > 0 : maximal  
         <mode> < 0 : minimal") GlobalTolerance;
		Standard_Real GlobalTolerance (const Standard_Integer mode);
};


%feature("shadow") ShapeAnalysis_ShapeTolerance::~ShapeAnalysis_ShapeTolerance %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_ShapeTolerance {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_Shell;
class ShapeAnalysis_Shell {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears data about loaded shells and performed checks") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	None

Adds shells contained in the <shape> to the list of loaded shells") LoadShells;
		void LoadShells (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	alsofree(Standard_Boolean)=Standard_False
	checkinternaledges(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Checks if shells fulfill orientation condition, i.e. if each  
         edge is, either present once (free edge) or twice (connected  
         edge) but with different orientations (FORWARD/REVERSED)  
         Edges which do not fulfill these conditions are bad  
 
         If <alsofree> is True free edges are considered.  
         Free edges can be queried but are not bad") CheckOrientedShells;
		Standard_Boolean CheckOrientedShells (const TopoDS_Shape & shape,const Standard_Boolean alsofree = Standard_False,const Standard_Boolean checkinternaledges = Standard_False);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	Standard_Boolean

Tells if a shape is loaded (only shells are checked)") IsLoaded;
		Standard_Boolean IsLoaded (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the actual number of loaded shapes (i.e. shells)") NbLoaded;
		Standard_Integer NbLoaded ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	TopoDS_Shape

Returns a loaded shape specified by its rank number.  
         Returns null shape if <num> is out of range") Loaded;
		TopoDS_Shape Loaded (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tells if at least one edge is recorded as bad") HasBadEdges;
		Standard_Boolean HasBadEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Compound

Returns the list of bad edges as a Compound  
         It is empty (not null) if no edge are recorded as bad") BadEdges;
		TopoDS_Compound BadEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tells if at least one edge is recorded as free (not connected)") HasFreeEdges;
		Standard_Boolean HasFreeEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Compound

Returns the list of free (not connected) edges as a Compound  
         It is empty (not null) if no edge are recorded as free") FreeEdges;
		TopoDS_Compound FreeEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tells if at least one edge is connected (shared twice or more)") HasConnectedEdges;
		Standard_Boolean HasConnectedEdges ();
};


%feature("shadow") ShapeAnalysis_Shell::~ShapeAnalysis_Shell %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_Shell {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_Surface;
class ShapeAnalysis_Surface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	None

Creates an analyzer object on the basis of existing surface") ShapeAnalysis_Surface;
		 ShapeAnalysis_Surface (const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	None

Loads existing surface") Init;
		void Init (const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	other(Handle_ShapeAnalysis_Surface)

Returns:
	None

Reads all the data from another Surface, without recomputing") Init;
		void Init (const Handle_ShapeAnalysis_Surface & other);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetDomain;
		void SetDomain (const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

Returns a surface being analyzed") Surface;
		const Handle_Geom_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GeomAdaptor_HSurface

Returns the Adaptor.  
         Creates it if not yet done.") Adaptor3d;
		const Handle_GeomAdaptor_HSurface & Adaptor3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GeomAdaptor_HSurface

Returns the Adaptor (may be Null if method Adaptor() was not called)") TrueAdaptor3d;
		const Handle_GeomAdaptor_HSurface & TrueAdaptor3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns 3D distance found by one of the following methods.  
         IsDegenerated, DegeneratedValues, ProjectDegenerated  
         (distance between 3D point and found or last (if not found)  
         singularity),  
         IsUClosed, IsVClosed (minimum value of precision to consider  
         the surface to be closed),  
         ValueOfUV (distance between 3D point and found solution).") Gap;
		Standard_Real Gap ();
		%feature("autodoc", "Args:
	u(Standard_Real)
	v(Standard_Real)

Returns:
	gp_Pnt

Returns a 3D point specified by parameters in surface  
         parametrical space") Value;
		gp_Pnt Value (const Standard_Real u,const Standard_Real v);
		%feature("autodoc", "Args:
	p2d(gp_Pnt2d)

Returns:
	gp_Pnt

Returns a 3d point specified by a point in surface  
         parametrical space") Value;
		gp_Pnt Value (const gp_Pnt2d & p2d);
		%feature("autodoc", "Args:
	preci(Standard_Real)

Returns:
	Standard_Boolean

Returns True if the surface has singularities for the given  
         precision (i.e. if there are surface singularities with sizes  
         not greater than precision).") HasSingularities;
		Standard_Boolean HasSingularities (const Standard_Real preci);
		%feature("autodoc", "Args:
	preci(Standard_Real)

Returns:
	Standard_Integer

Returns the number of singularities for the given precision  
         (i.e. number of surface singularities with sizes not greater  
         than precision).") NbSingularities;
		Standard_Integer NbSingularities (const Standard_Real preci);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	preci(Standard_Real)
	P3d(gp_Pnt)
	firstP2d(gp_Pnt2d)
	lastP2d(gp_Pnt2d)
	firstpar(Standard_Real)
	lastpar(Standard_Real)
	uisodeg(Standard_Boolean)

Returns:
	Standard_Boolean

Returns the characteristics of the singularity specified by  
         its rank number <num>.  
         That means, that it is not neccessary for <num> to be in the  
         range [1, NbSingularities] but must be not greater than  
         possible (see ComputeSingularities).  
         The returned characteristics are:  
         preci: the smallest precision with which the iso-line is  
                considered as degenerated,  
         P3d: 3D point of singularity (middle point of the surface  
              iso-line),  
         firstP2d and lastP2d: first and last 2D points of the  
                               iso-line in parametrical surface,  
         firstpar and lastpar: first and last parameters of the  
                               iso-line in parametrical surface,  
         uisodeg: if the degenerated iso-line is U-iso (True) or  
         V-iso (False).  
         Returns False if <num> is out of range, else returns True.") Singularity;
		Standard_Boolean Singularity (const Standard_Integer num,Standard_Real &OutValue,gp_Pnt & P3d,gp_Pnt2d & firstP2d,gp_Pnt2d & lastP2d,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean & uisodeg);
		%feature("autodoc", "Args:
	P3d(gp_Pnt)
	preci(Standard_Real)

Returns:
	Standard_Boolean

Returns True if there is at least one surface boundary which  
         is considered as degenerated with <preci> and distance  
         between P3d and corresponding singular point is less than  
         <preci>") IsDegenerated;
		Standard_Boolean IsDegenerated (const gp_Pnt & P3d,const Standard_Real preci);
		%feature("autodoc", "Args:
	P3d(gp_Pnt)
	preci(Standard_Real)
	firstP2d(gp_Pnt2d)
	lastP2d(gp_Pnt2d)
	firstpar(Standard_Real)
	lastpar(Standard_Real)
	forward(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Returns True if there is at least one surface iso-line which  
         is considered as degenerated with <preci> and distance  
         between P3d and corresponding singular point is less than  
         <preci> (like IsDegenerated).  
         Returns characteristics of the first found boundary matching  
         those criteria.") DegeneratedValues;
		Standard_Boolean DegeneratedValues (const gp_Pnt & P3d,const Standard_Real preci,gp_Pnt2d & firstP2d,gp_Pnt2d & lastP2d,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean forward = Standard_True);
		%feature("autodoc", "Args:
	P3d(gp_Pnt)
	preci(Standard_Real)
	neighbour(gp_Pnt2d)
	result(gp_Pnt2d)

Returns:
	Standard_Boolean

Projects a point <P3d> on a singularity by computing  
         one of the coordinates of preliminary computed <result>.  
 
         Finds the iso-line which is considered as degenerated with  
         <preci> and  
         a. distance between P3d and corresponding singular point is  
            less than <preci> (like IsDegenerated) or  
         b. difference between already computed <result>'s coordinate  
            and iso-coordinate of the boundary is less than 2D  
            resolution (computed from <preci> by Geom_Adaptor).  
         Then sets not yet computed <result>'s coordinate taking it  
         from <neighbour> and returns True.") ProjectDegenerated;
		Standard_Boolean ProjectDegenerated (const gp_Pnt & P3d,const Standard_Real preci,const gp_Pnt2d & neighbour,gp_Pnt2d & result);
		%feature("autodoc", "Args:
	nbrPnt(Standard_Integer)
	points(TColgp_Array1OfPnt)
	pnt2d(TColgp_Array1OfPnt2d)
	preci(Standard_Real)
	direct(Standard_Boolean)

Returns:
	Standard_Boolean

Checks points at the beginning (direct is True) or end  
         (direct is False) of array <points> to lie in singularity of  
         surface, and if yes, adjusts the indeterminate 2d coordinate  
         of these points by nearest point which is not in singularity.  
         Returns True if some points were adjusted.") ProjectDegenerated;
		Standard_Boolean ProjectDegenerated (const Standard_Integer nbrPnt,const TColgp_Array1OfPnt & points,TColgp_Array1OfPnt2d & pnt2d,const Standard_Real preci,const Standard_Boolean direct);
		%feature("autodoc", "Args:
	p2d1(gp_Pnt2d)
	p2d2(gp_Pnt2d)
	tol(Standard_Real)
	ratio(Standard_Real)

Returns:
	Standard_Boolean

Returns True if straight pcurve going from point p2d1 to p2d2  
         is degenerate, i.e. lies in the singularity of the surface.  
         NOTE: it uses another method of detecting singularity than  
               used by ComputeSingularities() et al.!  
         For that, maximums of distances between points p2d1, p2d2  
         and 0.5*(p2d1+p2d2) and between corresponding 3d points are  
         computed.  
         The pcurve (p2d1, p2d2) is considered as degenerate if:  
         - max distance in 3d is less than <tol>  
         - max distance in 2d is at least <ratio> times greather than  
           the Resolution computed from max distance in 3d  
           (max3d < tol && max2d > ratio * Resolution(max3d))  
         NOTE: <ratio> should be >1 (e.g. 10)") IsDegenerated;
		Standard_Boolean IsDegenerated (const gp_Pnt2d & p2d1,const gp_Pnt2d & p2d2,const Standard_Real tol,const Standard_Real ratio);
		%feature("autodoc", "Args:
	ufirst(Standard_Real)
	ulast(Standard_Real)
	vfirst(Standard_Real)
	vlast(Standard_Real)

Returns:
	None

Returns the bounds of the surface  
         (from Bounds from Surface, but buffered)") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

Computes bound isos (protected against exceptions)") ComputeBoundIsos;
		void ComputeBoundIsos ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Handle_Geom_Curve

Returns a U-Iso. Null if not possible or failed  
         Remark : bound isos are buffered") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Handle_Geom_Curve

Returns a V-Iso. Null if not possible or failed  
         Remark : bound isos are buffered") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	preci(Standard_Real)=- 1

Returns:
	Standard_Boolean

Tells if the Surface is spatially closed in U with given  
         precision. If <preci> < 0 then Precision::Confusion is used.  
         If Geom_Surface says that the surface is U-closed, this method  
         also says this. Otherwise additional analysis is performed,  
         comparing given precision with the following distances:  
         - periodic B-Splines are closed,  
         - polinomial B-Spline with boundary multiplicities degree+1  
           and Bezier - maximum distance between poles,  
         - rational B-Spline or one with boundary multiplicities not  
           degree+1 - maximum distance computed at knots and their  
           middles,  
         - surface of extrusion - distance between ends of basis  
           curve,  
         - other (RectangularTrimmed and Offset) - maximum distance  
           computed at 100 equi-distanted points.") IsUClosed;
		Standard_Boolean IsUClosed (const Standard_Real preci = - 1);
		%feature("autodoc", "Args:
	preci(Standard_Real)=- 1

Returns:
	Standard_Boolean

Tells if the Surface is spatially closed in V with given  
         precision. If <preci> < 0 then Precision::Confusion is used.  
         If Geom_Surface says that the surface is V-closed, this method  
         also says this. Otherwise additional analysis is performed,  
         comparing given precision with the following distances:  
         - periodic B-Splines are closed,  
         - polinomial B-Spline with boundary multiplicities degree+1  
           and Bezier - maximum distance between poles,  
         - rational B-Spline or one with boundary multiplicities not  
           degree+1 - maximum distance computed at knots and their  
           middles,  
         - surface of revolution - distance between ends of basis  
           curve,  
         - other (RectangularTrimmed and Offset) - maximum distance  
           computed at 100 equi-distanted points.") IsVClosed;
		Standard_Boolean IsVClosed (const Standard_Real preci = - 1);
		%feature("autodoc", "Args:
	P3D(gp_Pnt)
	preci(Standard_Real)

Returns:
	gp_Pnt2d

Computes the parameters in the surface parametrical space of  
         3D point.  
         The result is parameters of the point projected onto the  
         surface.  
         This method enhances functionality provided by the standard  
         tool GeomAPI_ProjectPointOnSurface by treatment of cases when  
         the projected point is near to the surface boundaries and  
         when this standard tool fails.") ValueOfUV;
		gp_Pnt2d ValueOfUV (const gp_Pnt & P3D,const Standard_Real preci);
		%feature("autodoc", "Args:
	p2dPrev(gp_Pnt2d)
	P3D(gp_Pnt)
	preci(Standard_Real)
	maxpreci(Standard_Real)=-1.0

Returns:
	gp_Pnt2d

Projects a point P3D on the surface.  
         Does the same thing as ValueOfUV but tries to optimize  
         computations by taking into account previous point <p2dPrev>:  
         makes a step by UV and tries Newton algorithm.  
         If <maxpreci> >0. and distance between solution and  
         P3D is greater than <maxpreci>, that solution is considered  
         as bad, and ValueOfUV() is used.  
         If not succeded, calls ValueOfUV()") NextValueOfUV;
		gp_Pnt2d NextValueOfUV (const gp_Pnt2d & p2dPrev,const gp_Pnt & P3D,const Standard_Real preci,const Standard_Real maxpreci = -1.0);
		%feature("autodoc", "Args:
	P3D(gp_Pnt)
	preci(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	Standard_Real

Tries a refinement of an already computed couple (U,V) by  
         using projecting 3D point on iso-lines:  
         1. boundaries of the surface,  
         2. iso-lines passing through (U,V)  
         3. iteratively received iso-lines passing through new U and  
            new V (number of iterations is limited by 5 in each  
            direction)  
         Returns the best resulting distance between P3D and Value(U,V)  
         in the case of success. Else, returns a very great value") UVFromIso;
		Standard_Real UVFromIso (const gp_Pnt & P3D,const Standard_Real preci,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns minimum value to consider the surface as U-closed") UCloseVal;
		Standard_Real UCloseVal ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns minimum value to consider the surface as V-closed") VCloseVal;
		Standard_Real VCloseVal ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") GetBoxUF;
		const Bnd_Box & GetBoxUF ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") GetBoxUL;
		const Bnd_Box & GetBoxUL ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") GetBoxVF;
		const Bnd_Box & GetBoxVF ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") GetBoxVL;
		const Bnd_Box & GetBoxVL ();
};


%feature("shadow") ShapeAnalysis_Surface::~ShapeAnalysis_Surface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_Surface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeAnalysis_Surface {
	Handle_ShapeAnalysis_Surface GetHandle() {
	return *(Handle_ShapeAnalysis_Surface*) &$self;
	}
};

%nodefaultctor Handle_ShapeAnalysis_Surface;
class Handle_ShapeAnalysis_Surface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeAnalysis_Surface();
        Handle_ShapeAnalysis_Surface(const Handle_ShapeAnalysis_Surface &aHandle);
        Handle_ShapeAnalysis_Surface(const ShapeAnalysis_Surface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeAnalysis_Surface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeAnalysis_Surface {
    ShapeAnalysis_Surface* GetObject() {
    return (ShapeAnalysis_Surface*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeAnalysis_Surface::~Handle_ShapeAnalysis_Surface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeAnalysis_Surface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeAnalysis_TransferParameters;
class ShapeAnalysis_TransferParameters : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates empty tool with myShift = 0 and myScale = 1") ShapeAnalysis_TransferParameters;
		 ShapeAnalysis_TransferParameters ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

Creates a tool and initializes it with edge and face") ShapeAnalysis_TransferParameters;
		 ShapeAnalysis_TransferParameters (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	virtual void

Initialize a tool with edge and face") Init;
		virtual void Init (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	maxtol(Standard_Real)

Returns:
	None

Sets maximal tolerance to use linear recomputation of  
         parameters.") SetMaxTolerance;
		void SetMaxTolerance (const Standard_Real maxtol);
		%feature("autodoc", "Args:
	Params(Handle_TColStd_HSequenceOfReal)
	To2d(Standard_Boolean)

Returns:
	virtual Handle_TColStd_HSequenceOfReal

Transfers parameters given by sequence Params from 3d curve  
         to pcurve (if To2d is True) or back (if To2d is False)") Perform;
		virtual Handle_TColStd_HSequenceOfReal Perform (const Handle_TColStd_HSequenceOfReal & Params,const Standard_Boolean To2d);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	To2d(Standard_Boolean)

Returns:
	virtual Standard_Real

Transfers parameter given by sequence Params from 3d curve  
         to pcurve (if To2d is True) or back (if To2d is False)") Perform;
		virtual Standard_Real Perform (const Standard_Real Param,const Standard_Boolean To2d);
		%feature("autodoc", "Args:
	newEdge(TopoDS_Edge)
	prevPar(Standard_Real)
	currPar(Standard_Real)
	To2d(Standard_Boolean)

Returns:
	virtual void

//!Recomputes range of curves from NewEdge.  
//!	        If Is2d equals True parameters are recomputed by curve2d else by curve3d.") TransferRange;
		virtual void TransferRange (TopoDS_Edge & newEdge,const Standard_Real prevPar,const Standard_Real currPar,const Standard_Boolean To2d);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True if 3d curve of edge and pcurve are SameRange  
         (in default implementation, if myScale == 1 and myShift == 0)") IsSameRange;
		virtual Standard_Boolean IsSameRange ();
};


%feature("shadow") ShapeAnalysis_TransferParameters::~ShapeAnalysis_TransferParameters %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_TransferParameters {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeAnalysis_TransferParameters {
	Handle_ShapeAnalysis_TransferParameters GetHandle() {
	return *(Handle_ShapeAnalysis_TransferParameters*) &$self;
	}
};

%nodefaultctor Handle_ShapeAnalysis_TransferParameters;
class Handle_ShapeAnalysis_TransferParameters : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeAnalysis_TransferParameters();
        Handle_ShapeAnalysis_TransferParameters(const Handle_ShapeAnalysis_TransferParameters &aHandle);
        Handle_ShapeAnalysis_TransferParameters(const ShapeAnalysis_TransferParameters *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeAnalysis_TransferParameters DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeAnalysis_TransferParameters {
    ShapeAnalysis_TransferParameters* GetObject() {
    return (ShapeAnalysis_TransferParameters*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeAnalysis_TransferParameters::~Handle_ShapeAnalysis_TransferParameters %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeAnalysis_TransferParameters {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeAnalysis_Wire;
class ShapeAnalysis_Wire : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire ();
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)
	face(TopoDS_Face)
	precision(Standard_Real)

Returns:
	None

Creates object with standard TopoDS_Wire, face  
         and precision") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire (const TopoDS_Wire & wire,const TopoDS_Face & face,const Standard_Real precision);
		%feature("autodoc", "Args:
	sbwd(Handle_ShapeExtend_WireData)
	face(TopoDS_Face)
	precision(Standard_Real)

Returns:
	None

Creates the object with WireData object, face  
         and precision") ShapeAnalysis_Wire;
		 ShapeAnalysis_Wire (const Handle_ShapeExtend_WireData & sbwd,const TopoDS_Face & face,const Standard_Real precision);
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)
	face(TopoDS_Face)
	precision(Standard_Real)

Returns:
	None

Initializes the object with standard TopoDS_Wire, face  
         and precision") Init;
		void Init (const TopoDS_Wire & wire,const TopoDS_Face & face,const Standard_Real precision);
		%feature("autodoc", "Args:
	sbwd(Handle_ShapeExtend_WireData)
	face(TopoDS_Face)
	precision(Standard_Real)

Returns:
	None

Initializes the object with WireData object, face  
         and precision") Init;
		void Init (const Handle_ShapeExtend_WireData & sbwd,const TopoDS_Face & face,const Standard_Real precision);
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)

Returns:
	None

Loads the object with standard TopoDS_Wire") Load;
		void Load (const TopoDS_Wire & wire);
		%feature("autodoc", "Args:
	sbwd(Handle_ShapeExtend_WireData)

Returns:
	None

Loads the object with WireData object") Load;
		void Load (const Handle_ShapeExtend_WireData & sbwd);
		%feature("autodoc", "Args:
	face(TopoDS_Face)

Returns:
	None

Loads the face the wire lies on") SetFace;
		void SetFace (const TopoDS_Face & face);
		%feature("autodoc", "Args:
	surface(Handle_Geom_Surface)

Returns:
	None

Loads the surface the wire lies on") SetSurface;
		void SetSurface (const Handle_Geom_Surface & surface);
		%feature("autodoc", "Args:
	surface(Handle_Geom_Surface)
	location(TopLoc_Location)

Returns:
	None

Loads the surface the wire lies on") SetSurface;
		void SetSurface (const Handle_Geom_Surface & surface,const TopLoc_Location & location);
		%feature("autodoc", "Args:
	precision(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetPrecision;
		void SetPrecision (const Standard_Real precision);
		%feature("autodoc", "Args:
	None
Returns:
	None

Unsets all the status and distance fields  
         wire, face and precision are not cleared") ClearStatuses;
		void ClearStatuses ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if wire is loaded and has number of edges >0") IsLoaded;
		Standard_Boolean IsLoaded ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if IsLoaded and underlying face is not null") IsReady;
		Standard_Boolean IsReady ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of precision") Precision;
		Standard_Real Precision ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeExtend_WireData

Returns wire object being analyzed") WireData;
		const Handle_ShapeExtend_WireData & WireData ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of edges in the wire, or 0 if it is not loaded") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns the working face") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeAnalysis_Surface

Returns the working surface") Surface;
		const Handle_ShapeAnalysis_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Performs all the checks in the following order :  
//!	    CheckOrder, CheckSmall, CheckConected, CheckEdgeCurves,  
         CheckDegenerated, CheckSelfIntersection, CheckLacking,  
         CheckClosed  
 Returns: True if at least one method returned True;  
         For deeper analysis use Status...(status) methods") Perform;
		Standard_Boolean Perform ();
		%feature("autodoc", "Args:
	isClosed(Standard_Boolean)=Standard_True
	mode3d(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Calls CheckOrder and returns False if wire is already  
         ordered (tail-to-head), True otherwise  
         Flag <isClosed> defines if the wire is closed or not  
         Flag <mode3d> defines which mode is used (3d or 2d)") CheckOrder;
		Standard_Boolean CheckOrder (const Standard_Boolean isClosed = Standard_True,const Standard_Boolean mode3d = Standard_True);
		%feature("autodoc", "Args:
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

Calls to CheckConnected for each edge  
 Returns: True if at least one pair of disconnected edges (not sharing the  
	    same vertex) was detected") CheckConnected;
		Standard_Boolean CheckConnected (const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	precsmall(Standard_Real)=0.0

Returns:
	Standard_Boolean

Calls to CheckSmall for each edge  
 Returns: True if at least one small edge was detected") CheckSmall;
		Standard_Boolean CheckSmall (const Standard_Real precsmall = 0.0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Checks edges geometry (consitency of 2d and 3d senses, adjasment  
//!	    of curves to the vertices, etc.).  
//!	    The order of the checks :  
         Call ShapeAnalysis_Wire to check:  
//!	    ShapeAnalysis_Edge::CheckCurve3dWithPCurve  (1),  
         ShapeAnalysis_Edge::CheckVertcesWithPCurve  (2),  
//!	    ShapeAnalysis_Edge::CheckVertcesWithCurve3d (3),  
         CheckSeam                                   (4)  
         Additional:  
         CheckGap3d                                  (5),  
         CheckGap2d                                  (6),  
         ShapeAnalysis_Edge::CheckSameParameter      (7)  
Returns: True if at least one check returned True  
 Remark:  The numbers in brackets show with what DONEi or FAILi  
         the status can be queried") CheckEdgeCurves;
		Standard_Boolean CheckEdgeCurves ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Calls to CheckDegenerated for each edge  
 Returns: True if at least one incorrect degenerated edge was detected") CheckDegenerated;
		Standard_Boolean CheckDegenerated ();
		%feature("autodoc", "Args:
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

Checks if wire is closed, performs CheckConnected,  
         CheckDegenerated and CheckLacking for the first and the last edges  
 Returns: True if at least one check returned True  
 Status:  
         FAIL1 or DONE1: see CheckConnected  
         FAIL2 or DONE2: see CheckDegenerated") CheckClosed;
		Standard_Boolean CheckClosed (const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Checks self-intersection of the wire (considering pcurves)  
         Looks for self-intersecting edges and each pair of intersecting  
         edges.  
 Warning: It does not check each edge with any other one (only each two  
         adjacent edges)  
         The order of the checks :  
         CheckSelfIntersectingEdge, CheckIntersectingEdges  
 Returns: True if at least one check returned True  
 Status:  FAIL1 or DONE1 - see CheckSelfIntersectingEdge  
         FAIL2 or DONE2 - see CheckIntersectingEdges") CheckSelfIntersection;
		Standard_Boolean CheckSelfIntersection ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Calls to CheckLacking for each edge  
 Returns: True if at least one lacking edge was detected") CheckLacking;
		Standard_Boolean CheckLacking ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckGaps3d;
		Standard_Boolean CheckGaps3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckGaps2d;
		Standard_Boolean CheckGaps2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckCurveGaps;
		Standard_Boolean CheckCurveGaps ();
		%feature("autodoc", "Args:
	sawo(ShapeAnalysis_WireOrder)
	isClosed(Standard_Boolean)=Standard_True
	mode3d(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Analyzes the order of the edges in the wire,  
         uses class WireOrder for that purpose.  
         Flag <isClosed> defines if the wire is closed or not  
         Flag <mode3d> defines which mode is used (3d or 2d)  
         Returns False if wire is already ordered (tail-to-head),  
         True otherwise.  
         Use returned WireOrder object for deeper analysis.  
 Status:  
         OK   : the same edges orientation, the same edges sequence  
         DONE1: the same edges orientation, not the same edges sequence  
         DONE2: as DONE1 and gaps more than myPrecision  
         DONE3: not the same edges orientation (some need to be reversed)  
         DONE4: as DONE3 and gaps more than myPrecision  
         FAIL : algorithm failed (could not detect order)") CheckOrder;
		Standard_Boolean CheckOrder (ShapeAnalysis_WireOrder & sawo,const Standard_Boolean isClosed = Standard_True,const Standard_Boolean mode3d = Standard_True);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

Checks connected edges (num-th and preceeding).  
          Tests with starting preci from <SBWD> or  with <prec> if  
//!	         it is greater.  
          Considers Vertices.  
 Returns: False if edges are connected by the common vertex, else True  
 Status  :  
	     OK    : Vertices (end of num-1 th edge and start on num-th one)  
                  are already the same  
          DONE1 : Absolutely confused (gp::Resolution)  
          DONE2 : Confused at starting <preci> from <SBWD>  
          DONE3 : Confused at <prec> but not <preci>  
          FAIL1 : Not confused  
          FAIL2 : Not confused but confused with <preci> if reverse num-th edge") CheckConnected;
		Standard_Boolean CheckConnected (const Standard_Integer num,const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	precsmall(Standard_Real)=0.0

Returns:
	Standard_Boolean

Checks if an edge has a length not greater than myPreci or  
//!	    precsmall (if it is smaller)  
 Returns: False if its length is greater than precision  
 Status:  
         OK   : edge is not small or degenerated  
         DONE1: edge is small, vertices are the same  
         DONE2: edge is small, vertices are not the same  
         FAIL : no 3d curve and pcurve") CheckSmall;
		Standard_Boolean CheckSmall (const Standard_Integer num,const Standard_Real precsmall = 0.0);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	C1(Handle_Geom2d_Curve)
	C2(Handle_Geom2d_Curve)
	cf(Standard_Real)
	cl(Standard_Real)

Returns:
	Standard_Boolean

Checks if a seam pcurves are correct oriented  
 Returns: False (status OK) if given edge is not a seam or if it is OK  
         C1 - current pcurve for FORWARD edge,  
         C2 - current pcurve for REVERSED edge (if returns True they  
         should be swapped for the seam),  
         cf, cl - first and last parameters on curves  
 Status:  
         OK   : Pcurves are correct or edge is not seam  
         DONE : Seam pcurves should be swapped") CheckSeam;
		Standard_Boolean CheckSeam (const Standard_Integer num,Handle_Geom2d_Curve & C1,Handle_Geom2d_Curve & C2,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Checks if a seam pcurves are correct oriented  
         See previous functions for details") CheckSeam;
		Standard_Boolean CheckSeam (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	dgnr1(gp_Pnt2d)
	dgnr2(gp_Pnt2d)

Returns:
	Standard_Boolean

Checks for degenerated edge between two adjacent ones.  
//!	    Fills parameters dgnr1 and dgnr2 with points in paramterical  
         space that correspond to the singularity (either gap that  
         needs to be filled by degenerated edge or that already filled)  
 Returns: False if no singularity or edge is already degenerated,  
         otherwise True  
 Status:  
         OK   : No surface singularity, or edge is already degenerated  
//!	    DONE1: Degenerated edge should be inserted (gap in 2D)  
         DONE2: Edge <num> should be made degenerated (recompute pcurve  
                and set the flag)  
         FAIL1: One of edges neighbouring to degenerated one has  
                no pcurve  
         FAIL2: Edge marked as degenerated and has no pcurve  
                but singularity is not detected") CheckDegenerated;
		Standard_Boolean CheckDegenerated (const Standard_Integer num,gp_Pnt2d & dgnr1,gp_Pnt2d & dgnr2);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Checks for degenerated edge between two adjacent ones.  
 Remark : Calls previous function  
 Status : See the function above for details") CheckDegenerated;
		Standard_Boolean CheckDegenerated (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)=0

Returns:
	Standard_Boolean

Checks gap between edges in 3D (3d curves).  
         Checks the distance between ends of 3d curves of the num-th  
         and preceeding edge.  
//!	    The distance can be queried by MinDistance3d.  
 
 Returns: True if status is DONE  
 Status:  
//!	    OK   : Gap is less than myPrecision  
         DONE : Gap is greater than myPrecision  
         FAIL : No 3d curve(s) on the edge(s)") CheckGap3d;
		Standard_Boolean CheckGap3d (const Standard_Integer num = 0);
		%feature("autodoc", "Args:
	num(Standard_Integer)=0

Returns:
	Standard_Boolean

Checks gap between edges in 2D (pcurves).  
         Checks the distance between ends of pcurves of the num-th  
         and preceeding edge.  
//!	    The distance can be queried by MinDistance2d.  
 
 Returns: True if status is DONE  
 Status:  
         OK   : Gap is less than parametric precision out of myPrecision  
         DONE : Gap is greater than parametric precision out of myPrecision  
         FAIL : No pcurve(s) on the edge(s)") CheckGap2d;
		Standard_Boolean CheckGap2d (const Standard_Integer num = 0);
		%feature("autodoc", "Args:
	num(Standard_Integer)=0

Returns:
	Standard_Boolean

Checks gap between points on 3D curve and points on surface  
         generated by pcurve of the num-th edge.  
//!	    The distance can be queried by MinDistance3d.  
 
 Returns: True if status is DONE  
 Status:  
//!	    OK   : Gap is less than myPrecision  
         DONE : Gap is greater than myPrecision  
         FAIL : No 3d curve(s) on the edge(s)") CheckCurveGap;
		Standard_Boolean CheckCurveGap (const Standard_Integer num = 0);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	points2d(IntRes2d_SequenceOfIntersectionPoint)
	points3d(TColgp_SequenceOfPnt)

Returns:
	Standard_Boolean

Checks if num-th edge is self-intersecting.  
         Self-intersection is reported only if intersection point lies outside  
         of both end vertices of the edge.  
 Returns: True if edge is self-intersecting.  
//!	    If returns True it also fills the sequences of intersection points  
         and corresponding 3d points (only that are not enclosed by a vertices)  
 Status:  
         FAIL1 : No pcurve  
         FAIL2 : No vertices  
         DONE1 : Self-intersection found") CheckSelfIntersectingEdge;
		Standard_Boolean CheckSelfIntersectingEdge (const Standard_Integer num,IntRes2d_SequenceOfIntersectionPoint & points2d,TColgp_SequenceOfPnt & points3d);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckSelfIntersectingEdge;
		Standard_Boolean CheckSelfIntersectingEdge (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	points2d(IntRes2d_SequenceOfIntersectionPoint)
	points3d(TColgp_SequenceOfPnt)
	errors(TColStd_SequenceOfReal)

Returns:
	Standard_Boolean

Checks two adjacent edges for intersecting.  
         Intersection is reported only if intersection point is not enclosed  
         by the common end vertex of the edges.  
 Returns: True if intersection is found.  
//!	    If returns True it also fills the sequences of intersection points,  
         corresponding 3d points, and errors for them (half-distances between  
         intersection points in 3d calculated from one and from another edge)  
 Status:  
         FAIL1 : No pcurve  
         FAIL2 : No vertices  
         DONE1 : Self-intersection found") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges (const Standard_Integer num,IntRes2d_SequenceOfIntersectionPoint & points2d,TColgp_SequenceOfPnt & points3d,TColStd_SequenceOfReal & errors);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Checks two adjacent edges for intersecting.  
 Remark : Calls the previous method  
 Status : See the function above for details") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges (const Standard_Integer num);
		%feature("autodoc", "Args:
	num1(Standard_Integer)
	num2(Standard_Integer)
	points2d(IntRes2d_SequenceOfIntersectionPoint)
	points3d(TColgp_SequenceOfPnt)
	errors(TColStd_SequenceOfReal)

Returns:
	Standard_Boolean

Checks i-th and j-th edges for intersecting.  
 Remark : See the previous method for details") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges (const Standard_Integer num1,const Standard_Integer num2,IntRes2d_SequenceOfIntersectionPoint & points2d,TColgp_SequenceOfPnt & points3d,TColStd_SequenceOfReal & errors);
		%feature("autodoc", "Args:
	num1(Standard_Integer)
	num2(Standard_Integer)

Returns:
	Standard_Boolean

Checks i-th and j-th edges for intersecting.  
 Remark : Calls  previous method.  
 Status : See the function above for details") CheckIntersectingEdges;
		Standard_Boolean CheckIntersectingEdges (const Standard_Integer num1,const Standard_Integer num2);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	Tolerance(Standard_Real)
	p2d1(gp_Pnt2d)
	p2d2(gp_Pnt2d)

Returns:
	Standard_Boolean

Checks if there is a gap in 2d between edges, not comprised by  
         the tolerance of their common vertex.  
         If <Tolerance> is greater than 0. and less than tolerance of  
         the vertex, then this value is used for check.  
 Returns: True if not closed gap was detected  
         p2d1 and p2d2 are the endpoint of <num-1>th edge and start of  
         the <num>th edge in 2d.  
 Status:  
//!	    OK: No edge is lacking (3d and 2d connection)  
         FAIL1: edges have no vertices (at least one of them)  
         FAIL2: edges are neither connected by common vertex, nor have  
                coincided vertices  
         FAIL1: edges have no pcurves  
         DONE1: the gap is detected which cannot be closed by the tolerance  
                of the common vertex (or with value of <Tolerance>)  
         DONE2: is set (together with DONE1) if gap is detected and the  
                vector (p2d2 - p2d1) goes in direction opposite to the pcurves  
                of the edges (if angle is more than 0.9*PI).") CheckLacking;
		Standard_Boolean CheckLacking (const Standard_Integer num,const Standard_Real Tolerance,gp_Pnt2d & p2d1,gp_Pnt2d & p2d2);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	Tolerance(Standard_Real)=0.0

Returns:
	Standard_Boolean

Checks if there is a gap in 2D between edges and not comprised by vertex tolerance  
        The value of SBWD.thepreci is used.  
 Returns: False if no edge should be inserted  
 Status:  
//!	     OK    : No edge is lacking (3d and 2d connection)  
         DONE1 : The vertex tolerance should be increased only (2d gap is  
                 small)  
         DONE2 : Edge can be inserted (3d and 2d gaps are large enough)") CheckLacking;
		Standard_Boolean CheckLacking (const Standard_Integer num,const Standard_Real Tolerance = 0.0);
		%feature("autodoc", "Args:
	APIMake(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Checks if wire defines an outer bound on the face  
         Uses ShapeAnalysis::IsOuterBound for analysis  
         If <APIMake> is True uses BRepAPI_MakeWire to build the  
         wire, if False (to be used only when edges share common  
         vertices) uses BRep_Builder to build the wire") CheckOuterBound;
		Standard_Boolean CheckOuterBound (const Standard_Boolean APIMake = Standard_True);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	shortNum(Standard_Integer)
	param(Standard_Real)
	Tolerance(Standard_Real)=0.0

Returns:
	Standard_Boolean

Detects a notch") CheckNotchedEdges;
		Standard_Boolean CheckNotchedEdges (const Standard_Integer num,Standard_Integer &OutValue,Standard_Real &OutValue,const Standard_Real Tolerance = 0.0);
		%feature("autodoc", "Args:
	prec2d(Standard_Real)=0

Returns:
	Standard_Boolean

Checks if wire has parametric area less than prec2d.") CheckSmallArea;
		Standard_Boolean CheckSmallArea (const Standard_Real prec2d = 0);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

Checks with what orientation <shape> (wire or edge) can be  
          connected to the wire.  
          Tests distances with starting <preci> from <SBWD> (close confusion),  
//!	     but if given <prec> is greater, tests with <prec> (coarse confusion).  
          The smallest found distance can be returned by MinDistance3d  
 
 Returns: False if status is FAIL (see below)  
 Status:  
//!	     DONE1 : If <shape> follows <SBWD>, direct sense (normal)  
          DONE2 : If <shape> follows <SBWD>, but if reversed  
          DONE3 : If <shape> preceeds <SBWD>, direct sense  
          DONE4 : If <shape> preceeds <SBWD>, but if reversed  
          FAIL1 : If <shape> is neither an edge nor a wire  
          FAIL2 : If <shape> cannot be connected to <SBWD>  
 
          DONE5 : To the tail of <SBWD> the <shape> is closer with  
                  direct sense  
          DONE6 : To the head of <SBWD> the <shape> is closer with  
                  direct sense  
 
 Remark:   Statuses DONE1 - DONE4, FAIL1 - FAIL2 are basic and  
          describe the nearest connection of the <shape> to <SBWD>.  
          Statuses DONE5 and DONE6 are advanced and are to be used when  
          analyzing with what sense (direct or reversed) the <shape>  
          should be connected to <SBWD>:  
          For tail of <SBWD> if DONE4 is True <shape> should be direct,  
          otherwise reversed.  
          For head of <SBWD> if DONE5 is True <shape> should be direct,  
          otherwise reversed.") CheckShapeConnect;
		Standard_Boolean CheckShapeConnect (const TopoDS_Shape & shape,const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	tailhead(Standard_Real)
	tailtail(Standard_Real)
	headtail(Standard_Real)
	headhead(Standard_Real)
	shape(TopoDS_Shape)
	prec(Standard_Real)=0.0

Returns:
	Standard_Boolean

The same as previous CheckShapeConnect but is more advanced.  
         It returns the distances between each end of <sbwd> and each  
         end of <shape>. For example, <tailhead> stores distance  
         between tail of <sbwd> and head of <shape>  
 Remark:  First method CheckShapeConnect calls this one") CheckShapeConnect;
		Standard_Boolean CheckShapeConnect (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,const TopoDS_Shape & shape,const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	aMapLoopVertices(TopTools_IndexedMapOfShape)
	aMapVertexEdges(TopTools_DataMapOfShapeListOfShape)
	aMapSmallEdges(TopTools_MapOfShape)
	aMapSeemEdges(TopTools_MapOfShape)

Returns:
	Standard_Boolean

Checks existance of loop on wire and return vertices wich are loop vertices  
(vertices belonging to a few pairs of edges)") CheckLoop;
		Standard_Boolean CheckLoop (TopTools_IndexedMapOfShape & aMapLoopVertices,TopTools_DataMapOfShapeListOfShape & aMapVertexEdges,TopTools_MapOfShape & aMapSmallEdges,TopTools_MapOfShape & aMapSeemEdges);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusOrder;
		Standard_Boolean StatusOrder (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusConnected;
		Standard_Boolean StatusConnected (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusEdgeCurves;
		Standard_Boolean StatusEdgeCurves (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusDegenerated;
		Standard_Boolean StatusDegenerated (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusClosed;
		Standard_Boolean StatusClosed (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusSmall;
		Standard_Boolean StatusSmall (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusSelfIntersection;
		Standard_Boolean StatusSelfIntersection (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusLacking;
		Standard_Boolean StatusLacking (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusGaps3d;
		Standard_Boolean StatusGaps3d (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusGaps2d;
		Standard_Boolean StatusGaps2d (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusCurveGaps;
		Standard_Boolean StatusCurveGaps (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

No detailed docstring for this function.") StatusLoop;
		Standard_Boolean StatusLoop (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Querying the status of the LAST perfomed 'Advanced' checking procedure") LastCheckStatus;
		Standard_Boolean LastCheckStatus (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the last lowest distance in 3D computed by  
          CheckOrientation, CheckConnected, CheckContinuity3d,  
//!	         CheckVertex, CheckNewVertex") MinDistance3d;
		Standard_Real MinDistance3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the last lowest distance in 2D-UV computed by  
          CheckContinuity2d") MinDistance2d;
		Standard_Real MinDistance2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the last maximal distance in 3D computed by  
          CheckOrientation, CheckConnected, CheckContinuity3d,  
//!	         CheckVertex, CheckNewVertex, CheckSameParameter") MaxDistance3d;
		Standard_Real MaxDistance3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the last maximal distance in 2D-UV computed by  
          CheckContinuity2d") MaxDistance2d;
		Standard_Real MaxDistance2d ();
};


%feature("shadow") ShapeAnalysis_Wire::~ShapeAnalysis_Wire %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_Wire {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeAnalysis_Wire {
	Handle_ShapeAnalysis_Wire GetHandle() {
	return *(Handle_ShapeAnalysis_Wire*) &$self;
	}
};

%nodefaultctor Handle_ShapeAnalysis_Wire;
class Handle_ShapeAnalysis_Wire : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeAnalysis_Wire();
        Handle_ShapeAnalysis_Wire(const Handle_ShapeAnalysis_Wire &aHandle);
        Handle_ShapeAnalysis_Wire(const ShapeAnalysis_Wire *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeAnalysis_Wire DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeAnalysis_Wire {
    ShapeAnalysis_Wire* GetObject() {
    return (ShapeAnalysis_Wire*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeAnalysis_Wire::~Handle_ShapeAnalysis_Wire %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeAnalysis_Wire {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeAnalysis_WireOrder;
class ShapeAnalysis_WireOrder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeAnalysis_WireOrder;
		 ShapeAnalysis_WireOrder ();
		%feature("autodoc", "Args:
	mode3d(Standard_Boolean)
	tol(Standard_Real)

Returns:
	None

Creates a WireOrder in 3D (if mode3d is True) or 2D (if False)  
          with a tolerance") ShapeAnalysis_WireOrder;
		 ShapeAnalysis_WireOrder (const Standard_Boolean mode3d,const Standard_Real tol);
		%feature("autodoc", "Args:
	mode3d(Standard_Boolean)
	tol(Standard_Real)

Returns:
	None

Sets new values. Clears the connexion list  
          If <mode3d> changes, also clears the edge list (else, doesnt)") SetMode;
		void SetMode (const Standard_Boolean mode3d,const Standard_Real tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the working tolerance") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the list of edges, but not mode and tol") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	start3d(gp_XYZ)
	end3d(gp_XYZ)

Returns:
	None

Adds a couple of points 3D (start,end)") Add;
		void Add (const gp_XYZ & start3d,const gp_XYZ & end3d);
		%feature("autodoc", "Args:
	start2d(gp_XY)
	end2d(gp_XY)

Returns:
	None

Adds a couple of points 2D (start,end)") Add;
		void Add (const gp_XY & start2d,const gp_XY & end2d);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of added couples of points (one per edges)") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

If this mode is True method perform does not sort edges of  
          different loops. The resulting order is first loop, second  
          one etc...") KeepLoopsMode;
		Standard_Boolean & KeepLoopsMode ();
		%feature("autodoc", "Args:
	closed(Standard_Boolean)=Standard_True

Returns:
	None

Computes the better order  
          If <closed> is True (D) considers also closure  
          Optimised if the couples were already in order  
          The criterium is : two couples in order if distance between  
          end-prec and start-cur is less then starting tolerance <tol>  
          Else, the smallest distance is reached  
          Gap corresponds to a smallest distance greater than <tol>") Perform;
		void Perform (const Standard_Boolean closed = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tells if Perform has been done  
          Else, the following methods returns original values") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the status of the order (0 if not done) :  
           0 : all edges are direct and in sequence  
           1 : all edges are direct but some are not in sequence  
           2 : in addition, unresolved gaps remain  
          -1 : some edges are reversed, but no gap remain  
          -2 : some edges are reversed and some gaps remain  
          -10 : COULD NOT BE RESOLVED, Failure on Reorder  
          gap : regarding starting <tol>") Status;
		Standard_Integer Status ();
		%feature("autodoc", "Args:
	n(Standard_Integer)

Returns:
	Standard_Integer

Returns the number of original edge which correspond to the  
          newly ordered number <n>  
 Warning : the returned value is NEGATIVE if edge should be reversed") Ordered;
		Standard_Integer Ordered (const Standard_Integer n);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	start3d(gp_XYZ)
	end3d(gp_XYZ)

Returns:
	None

Returns the values of the couple <num>, as 3D values") XYZ;
		void XYZ (const Standard_Integer num,gp_XYZ & start3d,gp_XYZ & end3d);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	start2d(gp_XY)
	end2d(gp_XY)

Returns:
	None

Returns the values of the couple <num>, as 2D values") XY;
		void XY (const Standard_Integer num,gp_XY & start2d,gp_XY & end2d);
		%feature("autodoc", "Args:
	num(Standard_Integer)=0

Returns:
	Standard_Real

Returns the gap between a couple and its preceeding  
          <num> is considered ordered  
          If <num> = 0 (D), returns the greatest gap found") Gap;
		Standard_Real Gap (const Standard_Integer num = 0);
		%feature("autodoc", "Args:
	gap(Standard_Real)

Returns:
	None

Determines the chains inside which successive edges have a gap  
          less than a given value. Queried by NbChains and Chain") SetChains;
		void SetChains (const Standard_Real gap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of computed chains") NbChains;
		Standard_Integer NbChains ();
		%feature("autodoc", "Args:
	num(Standard_Integer)
	n1(Standard_Integer)
	n2(Standard_Integer)

Returns:
	None

Returns, for the chain n0 num, starting and ending numbers of  
          edges. In the list of ordered edges (see Ordered for originals)") Chain;
		void Chain (const Standard_Integer num,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	gap(Standard_Real)

Returns:
	None

Determines the couples of edges for which end and start fit  
          inside a given gap. Queried by NbCouples and Couple") SetCouples;
		void SetCouples (const Standard_Real gap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of computed couples") NbCouples;
		Standard_Integer NbCouples ();
		%feature("autodoc", "Args:
	num(Standard_Integer)
	n1(Standard_Integer)
	n2(Standard_Integer)

Returns:
	None

Returns, for the couple n0 num, the two implied edges  
          In the list of ordered edges") Couple;
		void Couple (const Standard_Integer num,Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%feature("shadow") ShapeAnalysis_WireOrder::~ShapeAnalysis_WireOrder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_WireOrder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_WireVertex;
class ShapeAnalysis_WireVertex {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeAnalysis_WireVertex;
		 ShapeAnalysis_WireVertex ();
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)
	preci(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Wire & wire,const Standard_Real preci);
		%feature("autodoc", "Args:
	swbd(Handle_ShapeExtend_WireData)
	preci(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_ShapeExtend_WireData & swbd,const Standard_Real preci);
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const TopoDS_Wire & wire);
		%feature("autodoc", "Args:
	sbwd(Handle_ShapeExtend_WireData)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Handle_ShapeExtend_WireData & sbwd);
		%feature("autodoc", "Args:
	preci(Standard_Real)

Returns:
	None

Sets the precision for work  
         Analysing: for each Vertex, comparison between the end of the  
         preceeding edge and the start of the following edge  
         Each Vertex rank corresponds to the End Vertex of the Edge of  
         same rank, in the ShapeExtend_WireData. I.E. for Vertex <num>,  
         Edge <num> is the preceeding one, <num+1> is the following one") SetPrecision;
		void SetPrecision (const Standard_Real preci);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Analyze;
		void Analyze ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	None

Records status 'Same Vertex' (logically) on Vertex <num>") SetSameVertex;
		void SetSameVertex (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	None

Records status 'Same Coords' (at the Vertices Tolerances)") SetSameCoords;
		void SetSameCoords (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	None

Records status 'Close Coords' (at the Precision of <self>)") SetClose;
		void SetClose (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	pos(gp_XYZ)
	ufol(Standard_Real)

Returns:
	None

<num> is the End of preceeding Edge, and its projection on the  
         following one lies on it at the Precision of <self>  
         <ufol> gives the parameter on the following edge") SetEnd;
		void SetEnd (const Standard_Integer num,const gp_XYZ & pos,const Standard_Real ufol);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	pos(gp_XYZ)
	upre(Standard_Real)

Returns:
	None

<num> is the Start of following Edge, its projection on the  
         preceeding one lies on it at the Precision of <self>  
         <upre> gives the parameter on the preceeding edge") SetStart;
		void SetStart (const Standard_Integer num,const gp_XYZ & pos,const Standard_Real upre);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	pos(gp_XYZ)
	upre(Standard_Real)
	ufol(Standard_Real)

Returns:
	None

<num> is the Intersection of both Edges  
         <upre> is the parameter on preceeding edge, <ufol> on  
         following edge") SetInters;
		void SetInters (const Standard_Integer num,const gp_XYZ & pos,const Standard_Real upre,const Standard_Real ufol);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	None

<num> cannot be said as same vertex") SetDisjoined;
		void SetDisjoined (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if analysis was performed, else returns False") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns precision value used in analysis") Precision;
		Standard_Real Precision ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of edges in analyzed wire (i.e. the  
         length of all arrays)") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeExtend_WireData

Returns analyzed wire") WireData;
		const Handle_ShapeExtend_WireData & WireData ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Integer

Returns the recorded status for a vertex  
         More detail by method Data") Status;
		Standard_Integer Status (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	gp_XYZ

No detailed docstring for this function.") Position;
		gp_XYZ Position (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") UPrevious;
		Standard_Real UPrevious (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") UFollowing;
		Standard_Real UFollowing (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	pos(gp_XYZ)
	upre(Standard_Real)
	ufol(Standard_Real)

Returns:
	Standard_Integer

Returns the recorded status for a vertex  
         With its recorded position and parameters on both edges  
         These values are relevant regarding the status:  
         Status  Meaning   Position  Preceeding  Following  
         0       Same       no        no          no  
         1       SameCoord  no        no          no  
         2       Close      no        no          no  
         3       End        yes       no          yes  
         4       Start      yes       yes         no  
         5       Inters     yes       yes         yes  
        -1       Disjoined  no        no          no") Data;
		Standard_Integer Data (const Standard_Integer num,gp_XYZ & pos,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	stat(Standard_Integer)
	num(Standard_Integer)=0

Returns:
	Standard_Integer

For a given status, returns the rank of the vertex which  
         follows <num> and has the same status. 0 if no more  
         Acts as an iterator, starts on the first one") NextStatus;
		Standard_Integer NextStatus (const Standard_Integer stat,const Standard_Integer num = 0);
		%feature("autodoc", "Args:
	crit(Standard_Integer)
	num(Standard_Integer)=0

Returns:
	Standard_Integer

For a given criter, returns the rank of the vertex which  
          follows <num> and has the same status. 0 if no more  
          Acts as an iterator, starts on the first one  
          Criters are:  
          0: same vertex (status 0)  
          1: a solution exists (status >= 0)  
          2: same coords (i.e. same params) (status 0 1 2)  
          3: same coods but not same vertex (status 1 2)  
          4: redefined coords (status 3 4 5)  
         -1: no solution (status -1)") NextCriter;
		Standard_Integer NextCriter (const Standard_Integer crit,const Standard_Integer num = 0);
};


%feature("shadow") ShapeAnalysis_WireVertex::~ShapeAnalysis_WireVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_WireVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_BoxBndTreeSelector;
class ShapeAnalysis_BoxBndTreeSelector : public ShapeAnalysis_BoxBndTree::Selector {
	public:
		%feature("autodoc", "Args:
	theSeq(Handle_TopTools_HArray1OfShape)
	theShared(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ShapeAnalysis_BoxBndTreeSelector;
		 ShapeAnalysis_BoxBndTreeSelector (Handle_TopTools_HArray1OfShape theSeq,Standard_Boolean theShared);
		%feature("autodoc", "Args:
	theFBox(Bnd_Box)
	theLBox(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") DefineBoxes;
		void DefineBoxes (const Bnd_Box & theFBox,const Bnd_Box & theLBox);
		%feature("autodoc", "Args:
	theVf(TopoDS_Vertex)
	theVl(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") DefineVertexes;
		void DefineVertexes (TopoDS_Vertex theVf,TopoDS_Vertex theVl);
		%feature("autodoc", "Args:
	theFPnt(gp_Pnt)
	theLPnt(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") DefinePnt;
		void DefinePnt (gp_Pnt theFPnt,gp_Pnt theLPnt);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetNb;
		Standard_Integer GetNb ();
		%feature("autodoc", "Args:
	theNb(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetNb;
		void SetNb (Standard_Integer theNb);
		%feature("autodoc", "Args:
	elem(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") LoadList;
		void LoadList (Standard_Integer elem);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetStop;
		void SetStop ();
		%feature("autodoc", "Args:
	theTol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (Standard_Real theTol);
		%feature("autodoc", "Args:
	nbWire(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") ContWire;
		Standard_Boolean ContWire (Standard_Integer nbWire);
		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	inline Standard_Boolean

No detailed docstring for this function.") LastCheckStatus;
		inline Standard_Boolean LastCheckStatus (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	theBnd(Bnd_Box)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Reject;
		Standard_Boolean Reject (const Bnd_Box & theBnd);
		%feature("autodoc", "Args:
	&(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Accept;
		Standard_Boolean Accept (Standard_Integer &OutValue);
};


%feature("shadow") ShapeAnalysis_BoxBndTreeSelector::~ShapeAnalysis_BoxBndTreeSelector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_BoxBndTreeSelector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeAnalysis_TransferParametersProj;
class ShapeAnalysis_TransferParametersProj : public ShapeAnalysis_TransferParameters {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creats empty constructor.") ShapeAnalysis_TransferParametersProj;
		 ShapeAnalysis_TransferParametersProj ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") ShapeAnalysis_TransferParametersProj;
		 ShapeAnalysis_TransferParametersProj (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	virtual void

No detailed docstring for this function.") Init;
		virtual void Init (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	Papams(Handle_TColStd_HSequenceOfReal)
	To2d(Standard_Boolean)

Returns:
	virtual Handle_TColStd_HSequenceOfReal

Transfers parameters given by sequence Params from 3d curve  
         to pcurve (if To2d is True) or back (if To2d is False)") Perform;
		virtual Handle_TColStd_HSequenceOfReal Perform (const Handle_TColStd_HSequenceOfReal & Papams,const Standard_Boolean To2d);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	To2d(Standard_Boolean)

Returns:
	virtual Standard_Real

//!Transfers parameter given by  Param from 3d curve  
         to pcurve (if To2d is True) or back (if To2d is False)") Perform;
		virtual Standard_Real Perform (const Standard_Real Param,const Standard_Boolean To2d);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns modifiable flag forcing projection  
         If it is False (default), projection is done only  
         if edge is not SameParameter or if tolerance of edge  
         is greater than MaxTolerance()") ForceProjection;
		Standard_Boolean & ForceProjection ();
		%feature("autodoc", "Args:
	newEdge(TopoDS_Edge)
	prevPar(Standard_Real)
	currPar(Standard_Real)
	Is2d(Standard_Boolean)

Returns:
	virtual void

Recomputes range of curves from NewEdge.  
//!	    If Is2d equals True parameters are recomputed by curve2d else by curve3d.") TransferRange;
		virtual void TransferRange (TopoDS_Edge & newEdge,const Standard_Real prevPar,const Standard_Real currPar,const Standard_Boolean Is2d);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns False;") IsSameRange;
		virtual Standard_Boolean IsSameRange ();
		%feature("autodoc", "Args:
	theVert(TopoDS_Vertex)
	toedge(TopoDS_Edge)
	fromedge(TopoDS_Edge)

Returns:
	static TopoDS_Vertex

Make a copy of non-manifold vertex theVert  
         (i.e. create new  TVertex and replace PointRepresentations for this vertex  
         from fromedge to toedge. Other representations were copied)") CopyNMVertex;
		static TopoDS_Vertex CopyNMVertex (const TopoDS_Vertex & theVert,const TopoDS_Edge & toedge,const TopoDS_Edge & fromedge);
		%feature("autodoc", "Args:
	theVert(TopoDS_Vertex)
	toFace(TopoDS_Face)
	fromFace(TopoDS_Face)

Returns:
	static TopoDS_Vertex

Make a copy of non-manifold vertex theVert  
         (i.e. create new  TVertex and replace PointRepresentations for this vertex  
         from fromFace to toFace. Other representations were copied)") CopyNMVertex;
		static TopoDS_Vertex CopyNMVertex (const TopoDS_Vertex & theVert,const TopoDS_Face & toFace,const TopoDS_Face & fromFace);
};


%feature("shadow") ShapeAnalysis_TransferParametersProj::~ShapeAnalysis_TransferParametersProj %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeAnalysis_TransferParametersProj {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeAnalysis_TransferParametersProj {
	Handle_ShapeAnalysis_TransferParametersProj GetHandle() {
	return *(Handle_ShapeAnalysis_TransferParametersProj*) &$self;
	}
};

%nodefaultctor Handle_ShapeAnalysis_TransferParametersProj;
class Handle_ShapeAnalysis_TransferParametersProj : public Handle_ShapeAnalysis_TransferParameters {

    public:
        // constructors
        Handle_ShapeAnalysis_TransferParametersProj();
        Handle_ShapeAnalysis_TransferParametersProj(const Handle_ShapeAnalysis_TransferParametersProj &aHandle);
        Handle_ShapeAnalysis_TransferParametersProj(const ShapeAnalysis_TransferParametersProj *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeAnalysis_TransferParametersProj DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeAnalysis_TransferParametersProj {
    ShapeAnalysis_TransferParametersProj* GetObject() {
    return (ShapeAnalysis_TransferParametersProj*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeAnalysis_TransferParametersProj::~Handle_ShapeAnalysis_TransferParametersProj %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeAnalysis_TransferParametersProj {
    void _kill_pointed() {
        delete $self;
    }
};

