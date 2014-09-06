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
%module (package="OCC") IntTools

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

%include IntTools_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(inttools) IntTools;
%nodefaultctor IntTools;
class IntTools {
	public:
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static Standard_Real

returns the length of the edge;") Length;
		static Standard_Real Length (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	aSeq(IntTools_SequenceOfRoots)
	anEpsT(Standard_Real)

Returns:
	static void

Remove from  the  sequence aSeq the Roots  that  have  
         values ti and tj such as  |ti-tj]  <  anEpsT.") RemoveIdenticalRoots;
		static void RemoveIdenticalRoots (IntTools_SequenceOfRoots & aSeq,const Standard_Real anEpsT);
		%feature("autodoc", "Args:
	aSeq(IntTools_SequenceOfRoots)
	anEpsT(Standard_Real)

Returns:
	static void

Sort the sequence aSeq of the Roots to arrange the  
         Roons  in  increasing  order") SortRoots;
		static void SortRoots (IntTools_SequenceOfRoots & aSeq,const Standard_Real anEpsT);
		%feature("autodoc", "Args:
	aSeq(IntTools_SequenceOfRoots)
	anEpsNull(Standard_Real)

Returns:
	static void

Find the states (before  and  after) for  each  Root  
         from  the sequence aSeq") FindRootStates;
		static void FindRootStates (IntTools_SequenceOfRoots & aSeq,const Standard_Real anEpsNull);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Curve(Handle_Geom_Curve)
	aParm(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") Parameter;
		static Standard_Integer Parameter (const gp_Pnt & P,const Handle_Geom_Curve & Curve,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	t1(Standard_Real)
	t3(Standard_Real)
	R(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") GetRadius;
		static Standard_Integer GetRadius (const BRepAdaptor_Curve & C,const Standard_Real t1,const Standard_Real t3,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	tMax(Standard_Real)
	tMin(Standard_Real)
	Discret(Standard_Integer)
	Deflect(Standard_Real)
	anArgs(IntTools_CArray1OfReal)

Returns:
	static Standard_Integer

No detailed docstring for this function.") PrepareArgs;
		static Standard_Integer PrepareArgs (BRepAdaptor_Curve & C,const Standard_Real tMax,const Standard_Real tMin,const Standard_Integer Discret,const Standard_Real Deflect,IntTools_CArray1OfReal & anArgs);
};


%feature("shadow") IntTools::~IntTools %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Array1OfRange;
class IntTools_Array1OfRange {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntTools_Array1OfRange;
		 IntTools_Array1OfRange (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(IntTools_Range)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntTools_Array1OfRange;
		 IntTools_Array1OfRange (const IntTools_Range & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(IntTools_Range)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const IntTools_Range & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(IntTools_Array1OfRange)

Returns:
	IntTools_Array1OfRange

No detailed docstring for this function.") Assign;
		const IntTools_Array1OfRange & Assign (const IntTools_Array1OfRange & Other);
		%feature("autodoc", "Args:
	Other(IntTools_Array1OfRange)

Returns:
	IntTools_Array1OfRange

No detailed docstring for this function.") operator=;
		const IntTools_Array1OfRange & operator = (const IntTools_Array1OfRange & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(IntTools_Range)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_Range & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_Range

No detailed docstring for this function.") Value;
		const IntTools_Range & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_Range

No detailed docstring for this function.") ChangeValue;
		IntTools_Range & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") IntTools_Array1OfRange::~IntTools_Array1OfRange %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Array1OfRange {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Array1OfRoots;
class IntTools_Array1OfRoots {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntTools_Array1OfRoots;
		 IntTools_Array1OfRoots (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(IntTools_Root)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntTools_Array1OfRoots;
		 IntTools_Array1OfRoots (const IntTools_Root & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(IntTools_Root)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const IntTools_Root & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(IntTools_Array1OfRoots)

Returns:
	IntTools_Array1OfRoots

No detailed docstring for this function.") Assign;
		const IntTools_Array1OfRoots & Assign (const IntTools_Array1OfRoots & Other);
		%feature("autodoc", "Args:
	Other(IntTools_Array1OfRoots)

Returns:
	IntTools_Array1OfRoots

No detailed docstring for this function.") operator=;
		const IntTools_Array1OfRoots & operator = (const IntTools_Array1OfRoots & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(IntTools_Root)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_Root & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_Root

No detailed docstring for this function.") Value;
		const IntTools_Root & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_Root

No detailed docstring for this function.") ChangeValue;
		IntTools_Root & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") IntTools_Array1OfRoots::~IntTools_Array1OfRoots %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Array1OfRoots {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_BaseRangeSample;
class IntTools_BaseRangeSample {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_BaseRangeSample;
		 IntTools_BaseRangeSample ();
		%feature("autodoc", "Args:
	theDepth(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntTools_BaseRangeSample;
		 IntTools_BaseRangeSample (const Standard_Integer theDepth);
		%feature("autodoc", "Args:
	theDepth(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetDepth;
		void SetDepth (const Standard_Integer theDepth);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetDepth;
		Standard_Integer GetDepth ();
};


%feature("shadow") IntTools_BaseRangeSample::~IntTools_BaseRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_BaseRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_BeanFaceIntersector;
class IntTools_BeanFaceIntersector {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector ();
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	theFace(TopoDS_Face)

Returns:
	None

Initializes the algorithm  
 
 Warning:  
The parts of the edge which are on  
the surface of the face and belong to  
the whole in the face (if there is)  
is considered as result") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace);
		%feature("autodoc", "Args:
	theCurve(BRepAdaptor_Curve)
	theSurface(BRepAdaptor_Surface)
	theBeanTolerance(Standard_Real)
	theFaceTolerance(Standard_Real)

Returns:
	None

Initializes the algorithm") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector (const BRepAdaptor_Curve & theCurve,const BRepAdaptor_Surface & theSurface,const Standard_Real theBeanTolerance,const Standard_Real theFaceTolerance);
		%feature("autodoc", "Args:
	theCurve(BRepAdaptor_Curve)
	theSurface(BRepAdaptor_Surface)
	theFirstParOnCurve(Standard_Real)
	theLastParOnCurve(Standard_Real)
	theUMinParameter(Standard_Real)
	theUMaxParameter(Standard_Real)
	theVMinParameter(Standard_Real)
	theVMaxParameter(Standard_Real)
	theBeanTolerance(Standard_Real)
	theFaceTolerance(Standard_Real)

Returns:
	None

Initializes the algorithm  
theUMinParameter, ... are used for  
optimization purposes") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector (const BRepAdaptor_Curve & theCurve,const BRepAdaptor_Surface & theSurface,const Standard_Real theFirstParOnCurve,const Standard_Real theLastParOnCurve,const Standard_Real theUMinParameter,const Standard_Real theUMaxParameter,const Standard_Real theVMinParameter,const Standard_Real theVMaxParameter,const Standard_Real theBeanTolerance,const Standard_Real theFaceTolerance);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	theFace(TopoDS_Face)

Returns:
	None

Initializes the algorithm  
 
 Warning:  
The parts of the edge which are on  
the surface of the face and belong to  
the whole in the face (if there is)  
is considered as result") Init;
		void Init (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace);
		%feature("autodoc", "Args:
	theCurve(BRepAdaptor_Curve)
	theSurface(BRepAdaptor_Surface)
	theBeanTolerance(Standard_Real)
	theFaceTolerance(Standard_Real)

Returns:
	None

Initializes the algorithm") Init;
		void Init (const BRepAdaptor_Curve & theCurve,const BRepAdaptor_Surface & theSurface,const Standard_Real theBeanTolerance,const Standard_Real theFaceTolerance);
		%feature("autodoc", "Args:
	theCurve(BRepAdaptor_Curve)
	theSurface(BRepAdaptor_Surface)
	theFirstParOnCurve(Standard_Real)
	theLastParOnCurve(Standard_Real)
	theUMinParameter(Standard_Real)
	theUMaxParameter(Standard_Real)
	theVMinParameter(Standard_Real)
	theVMaxParameter(Standard_Real)
	theBeanTolerance(Standard_Real)
	theFaceTolerance(Standard_Real)

Returns:
	None

Initializes the algorithm  
theUMinParameter, ... are used for  
optimization purposes") Init;
		void Init (const BRepAdaptor_Curve & theCurve,const BRepAdaptor_Surface & theSurface,const Standard_Real theFirstParOnCurve,const Standard_Real theLastParOnCurve,const Standard_Real theUMinParameter,const Standard_Real theUMaxParameter,const Standard_Real theVMinParameter,const Standard_Real theVMaxParameter,const Standard_Real theBeanTolerance,const Standard_Real theFaceTolerance);
		%feature("autodoc", "Args:
	theContext(Handle_BOPInt_Context)

Returns:
	None

Sets the intersecton context") SetContext;
		void SetContext (const Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BOPInt_Context

Gets the intersecton context") Context;
		const Handle_BOPInt_Context & Context ();
		%feature("autodoc", "Args:
	theFirstParOnCurve(Standard_Real)
	theLastParOnCurve(Standard_Real)

Returns:
	None

Set restrictions for curve") SetBeanParameters;
		void SetBeanParameters (const Standard_Real theFirstParOnCurve,const Standard_Real theLastParOnCurve);
		%feature("autodoc", "Args:
	theUMinParameter(Standard_Real)
	theUMaxParameter(Standard_Real)
	theVMinParameter(Standard_Real)
	theVMaxParameter(Standard_Real)

Returns:
	None

Set restrictions for surface") SetSurfaceParameters;
		void SetSurfaceParameters (const Standard_Real theUMinParameter,const Standard_Real theUMaxParameter,const Standard_Real theVMinParameter,const Standard_Real theVMaxParameter);
		%feature("autodoc", "Args:
	None
Returns:
	None

Launches the algorithm") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SequenceOfRanges

No detailed docstring for this function.") Result;
		const IntTools_SequenceOfRanges & Result ();
		%feature("autodoc", "Args:
	theResults(IntTools_SequenceOfRanges)

Returns:
	None

No detailed docstring for this function.") Result;
		void Result (IntTools_SequenceOfRanges & theResults);
};


%feature("shadow") IntTools_BeanFaceIntersector::~IntTools_BeanFaceIntersector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_BeanFaceIntersector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_CArray1OfInteger;
class IntTools_CArray1OfInteger {
	public:
		%feature("autodoc", "Args:
	Length(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") IntTools_CArray1OfInteger;
		 IntTools_CArray1OfInteger (const Standard_Integer Length = 0);
		%feature("autodoc", "Args:
	Item(Standard_Integer)
	Length(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntTools_CArray1OfInteger;
		 IntTools_CArray1OfInteger (Standard_Integer &OutValue,const Standard_Integer Length);
		%feature("autodoc", "Args:
	V(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	theNewLength(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Resize;
		void Resize (const Standard_Integer theNewLength);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	Value(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Other(IntTools_CArray1OfInteger)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const IntTools_CArray1OfInteger & Other);

        %extend{
            bool __eq_wrapper__(const IntTools_CArray1OfInteger  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%feature("shadow") IntTools_CArray1OfInteger::~IntTools_CArray1OfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_CArray1OfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_CArray1OfReal;
class IntTools_CArray1OfReal {
	public:
		%feature("autodoc", "Args:
	Length(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") IntTools_CArray1OfReal;
		 IntTools_CArray1OfReal (const Standard_Integer Length = 0);
		%feature("autodoc", "Args:
	Item(Standard_Real)
	Length(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntTools_CArray1OfReal;
		 IntTools_CArray1OfReal (Standard_Real &OutValue,const Standard_Integer Length);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	theNewLength(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Resize;
		void Resize (const Standard_Integer theNewLength);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	Value(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		const Standard_Real & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Other(IntTools_CArray1OfReal)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const IntTools_CArray1OfReal & Other);

        %extend{
            bool __eq_wrapper__(const IntTools_CArray1OfReal  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%feature("shadow") IntTools_CArray1OfReal::~IntTools_CArray1OfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_CArray1OfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_CommonPrt;
class IntTools_CommonPrt {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") IntTools_CommonPrt;
		 IntTools_CommonPrt ();
		%feature("autodoc", "Args:
	aCPrt(IntTools_CommonPrt)

Returns:
	None

Copy  constructor") IntTools_CommonPrt;
		 IntTools_CommonPrt (const IntTools_CommonPrt & aCPrt);
		%feature("autodoc", "Args:
	Other(IntTools_CommonPrt)

Returns:
	IntTools_CommonPrt

No detailed docstring for this function.") Assign;
		IntTools_CommonPrt & Assign (const IntTools_CommonPrt & Other);
		%feature("autodoc", "Args:
	Other(IntTools_CommonPrt)

Returns:
	IntTools_CommonPrt

No detailed docstring for this function.") operator=;
		IntTools_CommonPrt & operator = (const IntTools_CommonPrt & Other);
		%feature("autodoc", "Args:
	anE(TopoDS_Edge)

Returns:
	None

Sets the first edge.") SetEdge1;
		void SetEdge1 (const TopoDS_Edge & anE);
		%feature("autodoc", "Args:
	anE(TopoDS_Edge)

Returns:
	None

Sets the second edge.") SetEdge2;
		void SetEdge2 (const TopoDS_Edge & anE);
		%feature("autodoc", "Args:
	aType(TopAbs_ShapeEnum)

Returns:
	None

Sets the type of  the common  part  
Vertex  or  Edge") SetType;
		void SetType (const TopAbs_ShapeEnum aType);
		%feature("autodoc", "Args:
	aR(IntTools_Range)

Returns:
	None

Sets the range of first edge.") SetRange1;
		void SetRange1 (const IntTools_Range & aR);
		%feature("autodoc", "Args:
	tf(Standard_Real)
	tl(Standard_Real)

Returns:
	None

Sets the range of first edge.") SetRange1;
		void SetRange1 (const Standard_Real tf,const Standard_Real tl);
		%feature("autodoc", "Args:
	aR(IntTools_Range)

Returns:
	None

Appends the range of second edge.") AppendRange2;
		void AppendRange2 (const IntTools_Range & aR);
		%feature("autodoc", "Args:
	tf(Standard_Real)
	tl(Standard_Real)

Returns:
	None

Appends the range of second edge.") AppendRange2;
		void AppendRange2 (const Standard_Real tf,const Standard_Real tl);
		%feature("autodoc", "Args:
	tV(Standard_Real)

Returns:
	None

Sets a parameter of first vertex") SetVertexParameter1;
		void SetVertexParameter1 (const Standard_Real tV);
		%feature("autodoc", "Args:
	tV(Standard_Real)

Returns:
	None

Sets a parameter of second vertex") SetVertexParameter2;
		void SetVertexParameter2 (const Standard_Real tV);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

Returns the first edge.") Edge1;
		const TopoDS_Edge & Edge1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

Returns the second edge") Edge2;
		const TopoDS_Edge & Edge2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

Returns the type of  the common  part") Type;
		TopAbs_ShapeEnum Type ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_Range

Returns the range of first edge") Range1;
		const IntTools_Range & Range1 ();
		%feature("autodoc", "Args:
	tf(Standard_Real)
	tl(Standard_Real)

Returns:
	None

Returns the range of first edge.") Range1;
		void Range1 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SequenceOfRanges

Returns the  ranges of second edge.") Ranges2;
		const IntTools_SequenceOfRanges & Ranges2 ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SequenceOfRanges

Returns the  ranges of second edge.") ChangeRanges2;
		IntTools_SequenceOfRanges & ChangeRanges2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns parameter of first vertex") VertexParameter1;
		Standard_Real VertexParameter1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns parameter of second vertex") VertexParameter2;
		Standard_Real VertexParameter2 ();
		%feature("autodoc", "Args:
	anOther(IntTools_CommonPrt)

Returns:
	None

Copies me to anOther") Copy;
		void Copy (IntTools_CommonPrt & anOther);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Modifier") AllNullFlag;
		Standard_Boolean AllNullFlag ();
		%feature("autodoc", "Args:
	aFlag(Standard_Boolean)

Returns:
	None

Selector") SetAllNullFlag;
		void SetAllNullFlag (const Standard_Boolean aFlag);
		%feature("autodoc", "Args:
	aP1(gp_Pnt)
	aP2(gp_Pnt)

Returns:
	None

Modifier") SetBoundingPoints;
		void SetBoundingPoints (const gp_Pnt & aP1,const gp_Pnt & aP2);
		%feature("autodoc", "Args:
	aP1(gp_Pnt)
	aP2(gp_Pnt)

Returns:
	None

Selector") BoundingPoints;
		void BoundingPoints (gp_Pnt & aP1,gp_Pnt & aP2);
};


%feature("shadow") IntTools_CommonPrt::~IntTools_CommonPrt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_CommonPrt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Compare;
class IntTools_Compare {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") IntTools_Compare;
		 IntTools_Compare ();
		%feature("autodoc", "Args:
	aTol(Standard_Real)

Returns:
	None

Initializes me by tolerance") IntTools_Compare;
		 IntTools_Compare (const Standard_Real aTol);
		%feature("autodoc", "Args:
	Left(IntTools_Root)
	Right(IntTools_Root)

Returns:
	Standard_Boolean

Returns True if <Left> is lower than <Right>.") IsLower;
		Standard_Boolean IsLower (const IntTools_Root & Left,const IntTools_Root & Right);
		%feature("autodoc", "Args:
	Left(IntTools_Root)
	Right(IntTools_Root)

Returns:
	Standard_Boolean

Returns True if <Left> is greater than <Right>.") IsGreater;
		Standard_Boolean IsGreater (const IntTools_Root & Left,const IntTools_Root & Right);
		%feature("autodoc", "Args:
	Left(IntTools_Root)
	Right(IntTools_Root)

Returns:
	Standard_Boolean

Returns True when <Right> and <Left> are equal.") IsEqual;
		Standard_Boolean IsEqual (const IntTools_Root & Left,const IntTools_Root & Right);
};


%feature("shadow") IntTools_Compare::~IntTools_Compare %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Compare {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_CompareRange;
class IntTools_CompareRange {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") IntTools_CompareRange;
		 IntTools_CompareRange ();
		%feature("autodoc", "Args:
	aTol(Standard_Real)

Returns:
	None

Initializes me by tolerance") IntTools_CompareRange;
		 IntTools_CompareRange (const Standard_Real aTol);
		%feature("autodoc", "Args:
	Left(IntTools_Range)
	Right(IntTools_Range)

Returns:
	Standard_Boolean

Returns True if <Left> is lower than <Right>.") IsLower;
		Standard_Boolean IsLower (const IntTools_Range & Left,const IntTools_Range & Right);
		%feature("autodoc", "Args:
	Left(IntTools_Range)
	Right(IntTools_Range)

Returns:
	Standard_Boolean

Returns True if <Left> is greater than <Right>.") IsGreater;
		Standard_Boolean IsGreater (const IntTools_Range & Left,const IntTools_Range & Right);
		%feature("autodoc", "Args:
	Left(IntTools_Range)
	Right(IntTools_Range)

Returns:
	Standard_Boolean

Returns True when <Right> and <Left> are equal.") IsEqual;
		Standard_Boolean IsEqual (const IntTools_Range & Left,const IntTools_Range & Right);
};


%feature("shadow") IntTools_CompareRange::~IntTools_CompareRange %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_CompareRange {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Curve;
class IntTools_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") IntTools_Curve;
		 IntTools_Curve ();
		%feature("autodoc", "Args:
	Curve3d(Handle_Geom_Curve)
	FirstCurve2d(Handle_Geom2d_Curve)
	SecondCurve2d(Handle_Geom2d_Curve)

Returns:
	None

Initializes me by a 3d curve  
and two 2d curves") IntTools_Curve;
		 IntTools_Curve (const Handle_Geom_Curve & Curve3d,const Handle_Geom2d_Curve & FirstCurve2d,const Handle_Geom2d_Curve & SecondCurve2d);
		%feature("autodoc", "Args:
	Curve3d(Handle_Geom_Curve)
	FirstCurve2d(Handle_Geom2d_Curve)
	SecondCurve2d(Handle_Geom2d_Curve)

Returns:
	None

Modifier") SetCurves;
		void SetCurves (const Handle_Geom_Curve & Curve3d,const Handle_Geom2d_Curve & FirstCurve2d,const Handle_Geom2d_Curve & SecondCurve2d);
		%feature("autodoc", "Args:
	Curve3d(Handle_Geom_Curve)

Returns:
	None

Modifier") SetCurve;
		void SetCurve (const Handle_Geom_Curve & Curve3d);
		%feature("autodoc", "Args:
	FirstCurve2d(Handle_Geom2d_Curve)

Returns:
	None

Modifier") SetFirstCurve2d;
		void SetFirstCurve2d (const Handle_Geom2d_Curve & FirstCurve2d);
		%feature("autodoc", "Args:
	SecondCurve2d(Handle_Geom2d_Curve)

Returns:
	None

Modifier") SetSecondCurve2d;
		void SetSecondCurve2d (const Handle_Geom2d_Curve & SecondCurve2d);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

Selector") Curve;
		const Handle_Geom_Curve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

Selector") FirstCurve2d;
		const Handle_Geom2d_Curve & FirstCurve2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

Selector") SecondCurve2d;
		const Handle_Geom2d_Curve & SecondCurve2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if 3d curve is BoundedCurve from Geom") HasBounds;
		Standard_Boolean HasBounds ();
		%feature("autodoc", "Args:
	aT1(Standard_Real)
	aT2(Standard_Real)
	aP1(gp_Pnt)
	aP2(gp_Pnt)

Returns:
	None

Returns boundary parameters  
and corresponded 3d point.  
 
 Warning:  
If HasBounds returns false  
the returned parameters are equal  
to zero.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & aP1,gp_Pnt & aP2);
		%feature("autodoc", "Args:
	aT1(Standard_Real)
	aP1(gp_Pnt)

Returns:
	Standard_Boolean

Computes 3d point corresponded to parameter aT1  
Returns true if given parameter aT1  
is inside the boundaries of the curve") D0;
		Standard_Boolean D0 (Standard_Real &OutValue,gp_Pnt & aP1);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_CurveType

Returns the type of 3d curve") Type;
		GeomAbs_CurveType Type ();
};


%feature("shadow") IntTools_Curve::~IntTools_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_CurveRangeLocalizeData;
class IntTools_CurveRangeLocalizeData {
	public:
		%feature("autodoc", "Args:
	theNbSample(Standard_Integer)
	theMinRange(Standard_Real)

Returns:
	None

No detailed docstring for this function.") IntTools_CurveRangeLocalizeData;
		 IntTools_CurveRangeLocalizeData (const Standard_Integer theNbSample,const Standard_Real theMinRange);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetNbSample;
		Standard_Integer GetNbSample ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetMinRange;
		Standard_Real GetMinRange ();
		%feature("autodoc", "Args:
	theRange(IntTools_CurveRangeSample)

Returns:
	None

No detailed docstring for this function.") AddOutRange;
		void AddOutRange (const IntTools_CurveRangeSample & theRange);
		%feature("autodoc", "Args:
	theRange(IntTools_CurveRangeSample)
	theBox(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") AddBox;
		void AddBox (const IntTools_CurveRangeSample & theRange,const Bnd_Box & theBox);
		%feature("autodoc", "Args:
	theRange(IntTools_CurveRangeSample)
	theBox(Bnd_Box)

Returns:
	Standard_Boolean

No detailed docstring for this function.") FindBox;
		Standard_Boolean FindBox (const IntTools_CurveRangeSample & theRange,Bnd_Box & theBox);
		%feature("autodoc", "Args:
	theRange(IntTools_CurveRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsRangeOut;
		Standard_Boolean IsRangeOut (const IntTools_CurveRangeSample & theRange);
		%feature("autodoc", "Args:
	theList(IntTools_ListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") ListRangeOut;
		void ListRangeOut (IntTools_ListOfCurveRangeSample & theList);
};


%feature("shadow") IntTools_CurveRangeLocalizeData::~IntTools_CurveRangeLocalizeData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_CurveRangeLocalizeData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_CurveRangeSampleMapHasher;
class IntTools_CurveRangeSampleMapHasher {
	public:
		%feature("autodoc", "Args:
	K(IntTools_CurveRangeSample)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

Returns a HasCode value  for  the  Key <K>  in the  
         range 0..Upper.") HashCode;
		static Standard_Integer HashCode (const IntTools_CurveRangeSample & K,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	S1(IntTools_CurveRangeSample)
	S2(IntTools_CurveRangeSample)

Returns:
	static Standard_Boolean

Returns True  when the two  keys are the same. Two  
         same  keys  must   have  the  same  hashcode,  the  
         contrary is not necessary.") IsEqual;
		static Standard_Boolean IsEqual (const IntTools_CurveRangeSample & S1,const IntTools_CurveRangeSample & S2);
};


%feature("shadow") IntTools_CurveRangeSampleMapHasher::~IntTools_CurveRangeSampleMapHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_CurveRangeSampleMapHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_DataMapIteratorOfDataMapOfCurveSampleBox;
class IntTools_DataMapIteratorOfDataMapOfCurveSampleBox : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_DataMapIteratorOfDataMapOfCurveSampleBox;
		 IntTools_DataMapIteratorOfDataMapOfCurveSampleBox ();
		%feature("autodoc", "Args:
	aMap(IntTools_DataMapOfCurveSampleBox)

Returns:
	None

No detailed docstring for this function.") IntTools_DataMapIteratorOfDataMapOfCurveSampleBox;
		 IntTools_DataMapIteratorOfDataMapOfCurveSampleBox (const IntTools_DataMapOfCurveSampleBox & aMap);
		%feature("autodoc", "Args:
	aMap(IntTools_DataMapOfCurveSampleBox)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const IntTools_DataMapOfCurveSampleBox & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CurveRangeSample

No detailed docstring for this function.") Key;
		const IntTools_CurveRangeSample & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Value;
		const Bnd_Box & Value ();
};


%feature("shadow") IntTools_DataMapIteratorOfDataMapOfCurveSampleBox::~IntTools_DataMapIteratorOfDataMapOfCurveSampleBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_DataMapIteratorOfDataMapOfCurveSampleBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox;
class IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox;
		 IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox ();
		%feature("autodoc", "Args:
	aMap(IntTools_DataMapOfSurfaceSampleBox)

Returns:
	None

No detailed docstring for this function.") IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox;
		 IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox (const IntTools_DataMapOfSurfaceSampleBox & aMap);
		%feature("autodoc", "Args:
	aMap(IntTools_DataMapOfSurfaceSampleBox)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const IntTools_DataMapOfSurfaceSampleBox & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SurfaceRangeSample

No detailed docstring for this function.") Key;
		const IntTools_SurfaceRangeSample & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Value;
		const Bnd_Box & Value ();
};


%feature("shadow") IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox::~IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_DataMapNodeOfDataMapOfCurveSampleBox;
class IntTools_DataMapNodeOfDataMapOfCurveSampleBox : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(IntTools_CurveRangeSample)
	I(Bnd_Box)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") IntTools_DataMapNodeOfDataMapOfCurveSampleBox;
		 IntTools_DataMapNodeOfDataMapOfCurveSampleBox (const IntTools_CurveRangeSample & K,const Bnd_Box & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CurveRangeSample

No detailed docstring for this function.") Key;
		IntTools_CurveRangeSample & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Value;
		Bnd_Box & Value ();
};


%feature("shadow") IntTools_DataMapNodeOfDataMapOfCurveSampleBox::~IntTools_DataMapNodeOfDataMapOfCurveSampleBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_DataMapNodeOfDataMapOfCurveSampleBox {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_DataMapNodeOfDataMapOfCurveSampleBox {
	Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox GetHandle() {
	return *(Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox*) &$self;
	}
};

%nodefaultctor Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox;
class Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox();
        Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox(const Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox &aHandle);
        Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox(const IntTools_DataMapNodeOfDataMapOfCurveSampleBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox {
    IntTools_DataMapNodeOfDataMapOfCurveSampleBox* GetObject() {
    return (IntTools_DataMapNodeOfDataMapOfCurveSampleBox*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox::~Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox;
class IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(IntTools_SurfaceRangeSample)
	I(Bnd_Box)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox;
		 IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox (const IntTools_SurfaceRangeSample & K,const Bnd_Box & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SurfaceRangeSample

No detailed docstring for this function.") Key;
		IntTools_SurfaceRangeSample & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Value;
		Bnd_Box & Value ();
};


%feature("shadow") IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox::~IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox {
	Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox GetHandle() {
	return *(Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox*) &$self;
	}
};

%nodefaultctor Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox;
class Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox();
        Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox(const Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox &aHandle);
        Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox(const IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox {
    IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox* GetObject() {
    return (IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox::~Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_DataMapOfCurveSampleBox;
class IntTools_DataMapOfCurveSampleBox : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") IntTools_DataMapOfCurveSampleBox;
		 IntTools_DataMapOfCurveSampleBox (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(IntTools_DataMapOfCurveSampleBox)

Returns:
	IntTools_DataMapOfCurveSampleBox

No detailed docstring for this function.") Assign;
		IntTools_DataMapOfCurveSampleBox & Assign (const IntTools_DataMapOfCurveSampleBox & Other);
		%feature("autodoc", "Args:
	Other(IntTools_DataMapOfCurveSampleBox)

Returns:
	IntTools_DataMapOfCurveSampleBox

No detailed docstring for this function.") operator=;
		IntTools_DataMapOfCurveSampleBox & operator = (const IntTools_DataMapOfCurveSampleBox & Other);
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
	K(IntTools_CurveRangeSample)
	I(Bnd_Box)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const IntTools_CurveRangeSample & K,const Bnd_Box & I);
		%feature("autodoc", "Args:
	K(IntTools_CurveRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const IntTools_CurveRangeSample & K);
		%feature("autodoc", "Args:
	K(IntTools_CurveRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const IntTools_CurveRangeSample & K);
		%feature("autodoc", "Args:
	K(IntTools_CurveRangeSample)

Returns:
	Bnd_Box

No detailed docstring for this function.") Find;
		const Bnd_Box & Find (const IntTools_CurveRangeSample & K);
		%feature("autodoc", "Args:
	K(IntTools_CurveRangeSample)

Returns:
	Bnd_Box

No detailed docstring for this function.") ChangeFind;
		Bnd_Box & ChangeFind (const IntTools_CurveRangeSample & K);
		%feature("autodoc", "Args:
	K(IntTools_CurveRangeSample)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const IntTools_CurveRangeSample & K);
		%feature("autodoc", "Args:
	K(IntTools_CurveRangeSample)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const IntTools_CurveRangeSample & K);
};


%feature("shadow") IntTools_DataMapOfCurveSampleBox::~IntTools_DataMapOfCurveSampleBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_DataMapOfCurveSampleBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_DataMapOfSurfaceSampleBox;
class IntTools_DataMapOfSurfaceSampleBox : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") IntTools_DataMapOfSurfaceSampleBox;
		 IntTools_DataMapOfSurfaceSampleBox (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(IntTools_DataMapOfSurfaceSampleBox)

Returns:
	IntTools_DataMapOfSurfaceSampleBox

No detailed docstring for this function.") Assign;
		IntTools_DataMapOfSurfaceSampleBox & Assign (const IntTools_DataMapOfSurfaceSampleBox & Other);
		%feature("autodoc", "Args:
	Other(IntTools_DataMapOfSurfaceSampleBox)

Returns:
	IntTools_DataMapOfSurfaceSampleBox

No detailed docstring for this function.") operator=;
		IntTools_DataMapOfSurfaceSampleBox & operator = (const IntTools_DataMapOfSurfaceSampleBox & Other);
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
	K(IntTools_SurfaceRangeSample)
	I(Bnd_Box)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const IntTools_SurfaceRangeSample & K,const Bnd_Box & I);
		%feature("autodoc", "Args:
	K(IntTools_SurfaceRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const IntTools_SurfaceRangeSample & K);
		%feature("autodoc", "Args:
	K(IntTools_SurfaceRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const IntTools_SurfaceRangeSample & K);
		%feature("autodoc", "Args:
	K(IntTools_SurfaceRangeSample)

Returns:
	Bnd_Box

No detailed docstring for this function.") Find;
		const Bnd_Box & Find (const IntTools_SurfaceRangeSample & K);
		%feature("autodoc", "Args:
	K(IntTools_SurfaceRangeSample)

Returns:
	Bnd_Box

No detailed docstring for this function.") ChangeFind;
		Bnd_Box & ChangeFind (const IntTools_SurfaceRangeSample & K);
		%feature("autodoc", "Args:
	K(IntTools_SurfaceRangeSample)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const IntTools_SurfaceRangeSample & K);
		%feature("autodoc", "Args:
	K(IntTools_SurfaceRangeSample)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const IntTools_SurfaceRangeSample & K);
};


%feature("shadow") IntTools_DataMapOfSurfaceSampleBox::~IntTools_DataMapOfSurfaceSampleBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_DataMapOfSurfaceSampleBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_EdgeEdge;
class IntTools_EdgeEdge {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") IntTools_EdgeEdge;
		 IntTools_EdgeEdge ();
		%feature("autodoc", "Args:
	theEdge1(TopoDS_Edge)
	theEdge2(TopoDS_Edge)

Returns:
	None

Contructor") IntTools_EdgeEdge;
		 IntTools_EdgeEdge (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2);
		%feature("autodoc", "Args:
	theEdge1(TopoDS_Edge)
	aT11(Standard_Real)
	aT12(Standard_Real)
	theEdge2(TopoDS_Edge)
	aT21(Standard_Real)
	aT22(Standard_Real)

Returns:
	None

Contructor") IntTools_EdgeEdge;
		 IntTools_EdgeEdge (const TopoDS_Edge & theEdge1,const Standard_Real aT11,const Standard_Real aT12,const TopoDS_Edge & theEdge2,const Standard_Real aT21,const Standard_Real aT22);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)

Returns:
	None

Sets the first edge") SetEdge1;
		void SetEdge1 (const TopoDS_Edge & theEdge);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	aT1(Standard_Real)
	aT2(Standard_Real)

Returns:
	None

Sets the first edge and its range") SetEdge1;
		void SetEdge1 (const TopoDS_Edge & theEdge,const Standard_Real aT1,const Standard_Real aT2);
		%feature("autodoc", "Args:
	theRange1(IntTools_Range)

Returns:
	None

Sets the range for the first edge") SetRange1;
		void SetRange1 (const IntTools_Range & theRange1);
		%feature("autodoc", "Args:
	aT1(Standard_Real)
	aT2(Standard_Real)

Returns:
	None

Sets the range for the first edge") SetRange1;
		void SetRange1 (const Standard_Real aT1,const Standard_Real aT2);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)

Returns:
	None

Sets the second edge") SetEdge2;
		void SetEdge2 (const TopoDS_Edge & theEdge);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	aT1(Standard_Real)
	aT2(Standard_Real)

Returns:
	None

Sets the first edge and its range") SetEdge2;
		void SetEdge2 (const TopoDS_Edge & theEdge,const Standard_Real aT1,const Standard_Real aT2);
		%feature("autodoc", "Args:
	theRange(IntTools_Range)

Returns:
	None

Sets the range for the second edge") SetRange2;
		void SetRange2 (const IntTools_Range & theRange);
		%feature("autodoc", "Args:
	aT1(Standard_Real)
	aT2(Standard_Real)

Returns:
	None

Sets the range for the second edge") SetRange2;
		void SetRange2 (const Standard_Real aT1,const Standard_Real aT2);
		%feature("autodoc", "Args:
	None
Returns:
	None

Performs the intersection between edges") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if common part(s) is(are) found") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SequenceOfCommonPrts

Returns common parts") CommonParts;
		const IntTools_SequenceOfCommonPrts & CommonParts ();
};


%feature("shadow") IntTools_EdgeEdge::~IntTools_EdgeEdge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_EdgeEdge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_EdgeFace;
class IntTools_EdgeFace {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty Constructor") IntTools_EdgeFace;
		 IntTools_EdgeFace ();
		%feature("autodoc", "Args:
	anEdge(TopoDS_Edge)

Returns:
	None

Initializes algorithm by the edge anEdge") SetEdge;
		void SetEdge (const TopoDS_Edge & anEdge);
		%feature("autodoc", "Args:
	aTolEdge1(Standard_Real)

Returns:
	None

Initializes algorithm by edge tolerance") SetTolE;
		void SetTolE (const Standard_Real aTolEdge1);
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)

Returns:
	None

Initializes algorithm by the face aFace") SetFace;
		void SetFace (const TopoDS_Face & aFace);
		%feature("autodoc", "Args:
	aTolFace(Standard_Real)

Returns:
	None

Initializes algorithm by face tolerance") SetTolF;
		void SetTolF (const Standard_Real aTolFace);
		%feature("autodoc", "Args:
	aDiscret(Standard_Integer)

Returns:
	None

Initializes algorithm by discretization value") SetDiscretize;
		void SetDiscretize (const Standard_Integer aDiscret);
		%feature("autodoc", "Args:
	aDeflection(Standard_Real)

Returns:
	None

Initializes algorithm by deflection value") SetDeflection;
		void SetDeflection (const Standard_Real aDeflection);
		%feature("autodoc", "Args:
	anEpsT(Standard_Real)

Returns:
	None

Initializes algorithm by parameter tolerance") SetEpsilonT;
		void SetEpsilonT (const Standard_Real anEpsT);
		%feature("autodoc", "Args:
	anEpsNull(Standard_Real)

Returns:
	None

Initializes algorithm by distance tolerance") SetEpsilonNull;
		void SetEpsilonNull (const Standard_Real anEpsNull);
		%feature("autodoc", "Args:
	aRange(IntTools_Range)

Returns:
	None

Sets boundaries for edge.  
The algorithm processes edge inside these boundaries.") SetRange;
		void SetRange (const IntTools_Range & aRange);
		%feature("autodoc", "Args:
	aFirst(Standard_Real)
	aLast(Standard_Real)

Returns:
	None

Sets boundaries for edge.  
The algorithm processes edge inside these boundaries.") SetRange;
		void SetRange (const Standard_Real aFirst,const Standard_Real aLast);
		%feature("autodoc", "Args:
	theContext(Handle_BOPInt_Context)

Returns:
	None

Sets the intersecton context") SetContext;
		void SetContext (const Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BOPInt_Context

Gets the intersecton context") Context;
		const Handle_BOPInt_Context & Context ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Launches the process") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if computation was done  
successfully, otherwise returns false") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns code of completion  
0 - means successful completion  
1 - the process was not started  
2,3,4,5 - invalid source data for the algorithm  
6 - discretization failed  
7 - no projectable ranges found  
11 - distance computing error") ErrorStatus;
		Standard_Integer ErrorStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SequenceOfCommonPrts

Returns results") CommonParts;
		const IntTools_SequenceOfCommonPrts & CommonParts ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_Range

Returns boundaries for edge") Range;
		const IntTools_Range & Range ();
		%feature("autodoc", "Args:
	aP(gp_Pnt)
	aS(BRepAdaptor_Surface)
	aT(Standard_Real)
	aD(Standard_Real)

Returns:
	static Standard_Boolean

") IsEqDistance;
		static Standard_Boolean IsEqDistance (const gp_Pnt & aP,const BRepAdaptor_Surface & aS,const Standard_Real aT,Standard_Real &OutValue);
};


%feature("shadow") IntTools_EdgeFace::~IntTools_EdgeFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_EdgeFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_FClass2d;
class IntTools_FClass2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") IntTools_FClass2d;
		 IntTools_FClass2d ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Tol(Standard_Real)

Returns:
	None

Initializes algorithm by the face F  
and tolerance Tol") IntTools_FClass2d;
		 IntTools_FClass2d (const TopoDS_Face & F,const Standard_Real Tol);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Tol(Standard_Real)

Returns:
	None

Initializes algorithm by the face F  
and tolerance Tol") Init;
		void Init (const TopoDS_Face & F,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

Returns state of infinite 2d point relatively to (0, 0)") PerformInfinitePoint;
		TopAbs_State PerformInfinitePoint ();
		%feature("autodoc", "Args:
	Puv(gp_Pnt2d)
	RecadreOnPeriodic(Standard_Boolean)=Standard_True

Returns:
	TopAbs_State

Returns state of the 2d point Puv.  
If RecadreOnPeriodic is true (defalut value),  
for the periodic surface 2d point, adjusted to period, is  
classified.") Perform;
		TopAbs_State Perform (const gp_Pnt2d & Puv,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

Destructor") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Puv(gp_Pnt2d)
	Tol(Standard_Real)
	RecadreOnPeriodic(Standard_Boolean)=Standard_True

Returns:
	TopAbs_State

Test a point with +- an offset (Tol) and returns  
On if some points are OUT an some are IN  
 (Caution: Internal use . see the code for more details)") TestOnRestriction;
		TopAbs_State TestOnRestriction (const gp_Pnt2d & Puv,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsHole;
		Standard_Boolean IsHole ();
};


%feature("shadow") IntTools_FClass2d::~IntTools_FClass2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_FClass2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_FaceFace;
class IntTools_FaceFace {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") IntTools_FaceFace;
		 IntTools_FaceFace ();
		%feature("autodoc", "Args:
	ApproxCurves(Standard_Boolean)
	ComputeCurveOnS1(Standard_Boolean)
	ComputeCurveOnS2(Standard_Boolean)
	ApproximationTolerance(Standard_Real)

Returns:
	None

Modifier") SetParameters;
		void SetParameters (const Standard_Boolean ApproxCurves,const Standard_Boolean ComputeCurveOnS1,const Standard_Boolean ComputeCurveOnS2,const Standard_Real ApproximationTolerance);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)

Returns:
	None

Intersects underliing surfaces of F1 and F2  
Use sum of tolerance of F1 and F2 as intersection  
criteria") Perform;
		void Perform (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the intersection was successful") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SequenceOfCurves

Returns sequence of 3d curves as result of intersection") Lines;
		const IntTools_SequenceOfCurves & Lines ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SequenceOfPntOn2Faces

Returns sequence of 3d curves as result of intersection") Points;
		const IntTools_SequenceOfPntOn2Faces & Points ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns tolerance reached during approximation.  
If approximation was not done, returns zero.") TolReached3d;
		Standard_Real TolReached3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns tolerance reached during approximation.  
If approximation was not done, returns zero.") TolReached2d;
		Standard_Real TolReached2d ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns first of processed faces") Face1;
		const TopoDS_Face & Face1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns second of processed faces") Face2;
		const TopoDS_Face & Face2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if faces are tangent") TangentFaces;
		Standard_Boolean TangentFaces ();
		%feature("autodoc", "Args:
	bToSplit(Standard_Boolean)=Standard_True

Returns:
	None

Provides post-processing the result lines.  
<bToSplit> - the flag.  
 In case of <bToSplit> is true the closed 3D-curves will be splitted  
 on parts.  
 In case of <bToSplit> is false the closed 3D-curves remain untouched.") PrepareLines3D;
		void PrepareLines3D (const Standard_Boolean bToSplit = Standard_True);
		%feature("autodoc", "Args:
	ListOfPnts(IntSurf_ListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") SetList;
		void SetList (IntSurf_ListOfPntOn2S & ListOfPnts);
		%feature("autodoc", "Args:
	aContext(Handle_BOPInt_Context)

Returns:
	None

Sets the intersecton context") SetContext;
		void SetContext (const Handle_BOPInt_Context & aContext);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BOPInt_Context

Gets the intersecton context") Context;
		const Handle_BOPInt_Context & Context ();
};


%feature("shadow") IntTools_FaceFace::~IntTools_FaceFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_FaceFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress;
class IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(Handle_Standard_Transient)
	K2(Standard_Integer)
	I(Standard_Address)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress;
		 IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress (const Handle_Standard_Transient & K1,const Standard_Integer K2,const Standard_Address & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Key1;
		Handle_Standard_Transient & Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Value;
		Standard_Address & Value ();
};


%feature("shadow") IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress::~IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress {
	Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress GetHandle() {
	return *(Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress*) &$self;
	}
};

%nodefaultctor Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress;
class Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress();
        Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress(const Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress &aHandle);
        Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress(const IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress {
    IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress* GetObject() {
    return (IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress::~Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_IndexedDataMapOfTransientAddress;
class IntTools_IndexedDataMapOfTransientAddress : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") IntTools_IndexedDataMapOfTransientAddress;
		 IntTools_IndexedDataMapOfTransientAddress (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(IntTools_IndexedDataMapOfTransientAddress)

Returns:
	IntTools_IndexedDataMapOfTransientAddress

No detailed docstring for this function.") Assign;
		IntTools_IndexedDataMapOfTransientAddress & Assign (const IntTools_IndexedDataMapOfTransientAddress & Other);
		%feature("autodoc", "Args:
	Other(IntTools_IndexedDataMapOfTransientAddress)

Returns:
	IntTools_IndexedDataMapOfTransientAddress

No detailed docstring for this function.") operator=;
		IntTools_IndexedDataMapOfTransientAddress & operator = (const IntTools_IndexedDataMapOfTransientAddress & Other);
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
	K(Handle_Standard_Transient)
	I(Standard_Address)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const Handle_Standard_Transient & K,const Standard_Address & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(Handle_Standard_Transient)
	T(Standard_Address)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const Handle_Standard_Transient & K,const Standard_Address & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") FindKey;
		const Handle_Standard_Transient & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromIndex;
		const Standard_Address & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromIndex;
		Standard_Address & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey;
		const Standard_Address & FindFromKey (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey;
		Standard_Address & ChangeFromKey (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const Handle_Standard_Transient & K);
		%feature("autodoc", "Args:
	K(Handle_Standard_Transient)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const Handle_Standard_Transient & K);
};


%feature("shadow") IntTools_IndexedDataMapOfTransientAddress::~IntTools_IndexedDataMapOfTransientAddress %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_IndexedDataMapOfTransientAddress {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_ListIteratorOfListOfBox;
class IntTools_ListIteratorOfListOfBox {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_ListIteratorOfListOfBox;
		 IntTools_ListIteratorOfListOfBox ();
		%feature("autodoc", "Args:
	L(IntTools_ListOfBox)

Returns:
	None

No detailed docstring for this function.") IntTools_ListIteratorOfListOfBox;
		 IntTools_ListIteratorOfListOfBox (const IntTools_ListOfBox & L);
		%feature("autodoc", "Args:
	L(IntTools_ListOfBox)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const IntTools_ListOfBox & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Value;
		Bnd_Box & Value ();
};


%feature("shadow") IntTools_ListIteratorOfListOfBox::~IntTools_ListIteratorOfListOfBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListIteratorOfListOfBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_ListIteratorOfListOfCurveRangeSample;
class IntTools_ListIteratorOfListOfCurveRangeSample {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_ListIteratorOfListOfCurveRangeSample;
		 IntTools_ListIteratorOfListOfCurveRangeSample ();
		%feature("autodoc", "Args:
	L(IntTools_ListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") IntTools_ListIteratorOfListOfCurveRangeSample;
		 IntTools_ListIteratorOfListOfCurveRangeSample (const IntTools_ListOfCurveRangeSample & L);
		%feature("autodoc", "Args:
	L(IntTools_ListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const IntTools_ListOfCurveRangeSample & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CurveRangeSample

No detailed docstring for this function.") Value;
		IntTools_CurveRangeSample & Value ();
};


%feature("shadow") IntTools_ListIteratorOfListOfCurveRangeSample::~IntTools_ListIteratorOfListOfCurveRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListIteratorOfListOfCurveRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_ListIteratorOfListOfSurfaceRangeSample;
class IntTools_ListIteratorOfListOfSurfaceRangeSample {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_ListIteratorOfListOfSurfaceRangeSample;
		 IntTools_ListIteratorOfListOfSurfaceRangeSample ();
		%feature("autodoc", "Args:
	L(IntTools_ListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") IntTools_ListIteratorOfListOfSurfaceRangeSample;
		 IntTools_ListIteratorOfListOfSurfaceRangeSample (const IntTools_ListOfSurfaceRangeSample & L);
		%feature("autodoc", "Args:
	L(IntTools_ListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const IntTools_ListOfSurfaceRangeSample & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SurfaceRangeSample

No detailed docstring for this function.") Value;
		IntTools_SurfaceRangeSample & Value ();
};


%feature("shadow") IntTools_ListIteratorOfListOfSurfaceRangeSample::~IntTools_ListIteratorOfListOfSurfaceRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListIteratorOfListOfSurfaceRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_ListNodeOfListOfBox;
class IntTools_ListNodeOfListOfBox : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Bnd_Box)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") IntTools_ListNodeOfListOfBox;
		 IntTools_ListNodeOfListOfBox (const Bnd_Box & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Value;
		Bnd_Box & Value ();
};


%feature("shadow") IntTools_ListNodeOfListOfBox::~IntTools_ListNodeOfListOfBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListNodeOfListOfBox {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_ListNodeOfListOfBox {
	Handle_IntTools_ListNodeOfListOfBox GetHandle() {
	return *(Handle_IntTools_ListNodeOfListOfBox*) &$self;
	}
};

%nodefaultctor Handle_IntTools_ListNodeOfListOfBox;
class Handle_IntTools_ListNodeOfListOfBox : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_ListNodeOfListOfBox();
        Handle_IntTools_ListNodeOfListOfBox(const Handle_IntTools_ListNodeOfListOfBox &aHandle);
        Handle_IntTools_ListNodeOfListOfBox(const IntTools_ListNodeOfListOfBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_ListNodeOfListOfBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_ListNodeOfListOfBox {
    IntTools_ListNodeOfListOfBox* GetObject() {
    return (IntTools_ListNodeOfListOfBox*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_ListNodeOfListOfBox::~Handle_IntTools_ListNodeOfListOfBox %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_ListNodeOfListOfBox {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_ListNodeOfListOfCurveRangeSample;
class IntTools_ListNodeOfListOfCurveRangeSample : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(IntTools_CurveRangeSample)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") IntTools_ListNodeOfListOfCurveRangeSample;
		 IntTools_ListNodeOfListOfCurveRangeSample (const IntTools_CurveRangeSample & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CurveRangeSample

No detailed docstring for this function.") Value;
		IntTools_CurveRangeSample & Value ();
};


%feature("shadow") IntTools_ListNodeOfListOfCurveRangeSample::~IntTools_ListNodeOfListOfCurveRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListNodeOfListOfCurveRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_ListNodeOfListOfCurveRangeSample {
	Handle_IntTools_ListNodeOfListOfCurveRangeSample GetHandle() {
	return *(Handle_IntTools_ListNodeOfListOfCurveRangeSample*) &$self;
	}
};

%nodefaultctor Handle_IntTools_ListNodeOfListOfCurveRangeSample;
class Handle_IntTools_ListNodeOfListOfCurveRangeSample : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_ListNodeOfListOfCurveRangeSample();
        Handle_IntTools_ListNodeOfListOfCurveRangeSample(const Handle_IntTools_ListNodeOfListOfCurveRangeSample &aHandle);
        Handle_IntTools_ListNodeOfListOfCurveRangeSample(const IntTools_ListNodeOfListOfCurveRangeSample *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_ListNodeOfListOfCurveRangeSample DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_ListNodeOfListOfCurveRangeSample {
    IntTools_ListNodeOfListOfCurveRangeSample* GetObject() {
    return (IntTools_ListNodeOfListOfCurveRangeSample*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_ListNodeOfListOfCurveRangeSample::~Handle_IntTools_ListNodeOfListOfCurveRangeSample %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_ListNodeOfListOfCurveRangeSample {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_ListNodeOfListOfSurfaceRangeSample;
class IntTools_ListNodeOfListOfSurfaceRangeSample : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(IntTools_SurfaceRangeSample)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") IntTools_ListNodeOfListOfSurfaceRangeSample;
		 IntTools_ListNodeOfListOfSurfaceRangeSample (const IntTools_SurfaceRangeSample & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SurfaceRangeSample

No detailed docstring for this function.") Value;
		IntTools_SurfaceRangeSample & Value ();
};


%feature("shadow") IntTools_ListNodeOfListOfSurfaceRangeSample::~IntTools_ListNodeOfListOfSurfaceRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListNodeOfListOfSurfaceRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_ListNodeOfListOfSurfaceRangeSample {
	Handle_IntTools_ListNodeOfListOfSurfaceRangeSample GetHandle() {
	return *(Handle_IntTools_ListNodeOfListOfSurfaceRangeSample*) &$self;
	}
};

%nodefaultctor Handle_IntTools_ListNodeOfListOfSurfaceRangeSample;
class Handle_IntTools_ListNodeOfListOfSurfaceRangeSample : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_ListNodeOfListOfSurfaceRangeSample();
        Handle_IntTools_ListNodeOfListOfSurfaceRangeSample(const Handle_IntTools_ListNodeOfListOfSurfaceRangeSample &aHandle);
        Handle_IntTools_ListNodeOfListOfSurfaceRangeSample(const IntTools_ListNodeOfListOfSurfaceRangeSample *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_ListNodeOfListOfSurfaceRangeSample DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_ListNodeOfListOfSurfaceRangeSample {
    IntTools_ListNodeOfListOfSurfaceRangeSample* GetObject() {
    return (IntTools_ListNodeOfListOfSurfaceRangeSample*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_ListNodeOfListOfSurfaceRangeSample::~Handle_IntTools_ListNodeOfListOfSurfaceRangeSample %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_ListNodeOfListOfSurfaceRangeSample {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_ListOfBox;
class IntTools_ListOfBox {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_ListOfBox;
		 IntTools_ListOfBox ();
		%feature("autodoc", "Args:
	Other(IntTools_ListOfBox)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const IntTools_ListOfBox & Other);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfBox)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const IntTools_ListOfBox & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Bnd_Box & I);
		%feature("autodoc", "Args:
	I(Bnd_Box)
	theIt(IntTools_ListIteratorOfListOfBox)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Bnd_Box & I,IntTools_ListIteratorOfListOfBox & theIt);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfBox)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntTools_ListOfBox & Other);
		%feature("autodoc", "Args:
	I(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Bnd_Box & I);
		%feature("autodoc", "Args:
	I(Bnd_Box)
	theIt(IntTools_ListIteratorOfListOfBox)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Bnd_Box & I,IntTools_ListIteratorOfListOfBox & theIt);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfBox)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntTools_ListOfBox & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") First;
		Bnd_Box & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Last;
		Bnd_Box & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(IntTools_ListIteratorOfListOfBox)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (IntTools_ListIteratorOfListOfBox & It);
		%feature("autodoc", "Args:
	I(Bnd_Box)
	It(IntTools_ListIteratorOfListOfBox)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Bnd_Box & I,IntTools_ListIteratorOfListOfBox & It);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfBox)
	It(IntTools_ListIteratorOfListOfBox)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (IntTools_ListOfBox & Other,IntTools_ListIteratorOfListOfBox & It);
		%feature("autodoc", "Args:
	I(Bnd_Box)
	It(IntTools_ListIteratorOfListOfBox)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Bnd_Box & I,IntTools_ListIteratorOfListOfBox & It);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfBox)
	It(IntTools_ListIteratorOfListOfBox)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (IntTools_ListOfBox & Other,IntTools_ListIteratorOfListOfBox & It);
};


%feature("shadow") IntTools_ListOfBox::~IntTools_ListOfBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListOfBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_ListOfCurveRangeSample;
class IntTools_ListOfCurveRangeSample {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_ListOfCurveRangeSample;
		 IntTools_ListOfCurveRangeSample ();
		%feature("autodoc", "Args:
	Other(IntTools_ListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const IntTools_ListOfCurveRangeSample & Other);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const IntTools_ListOfCurveRangeSample & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(IntTools_CurveRangeSample)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntTools_CurveRangeSample & I);
		%feature("autodoc", "Args:
	I(IntTools_CurveRangeSample)
	theIt(IntTools_ListIteratorOfListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntTools_CurveRangeSample & I,IntTools_ListIteratorOfListOfCurveRangeSample & theIt);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntTools_ListOfCurveRangeSample & Other);
		%feature("autodoc", "Args:
	I(IntTools_CurveRangeSample)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntTools_CurveRangeSample & I);
		%feature("autodoc", "Args:
	I(IntTools_CurveRangeSample)
	theIt(IntTools_ListIteratorOfListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntTools_CurveRangeSample & I,IntTools_ListIteratorOfListOfCurveRangeSample & theIt);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntTools_ListOfCurveRangeSample & Other);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CurveRangeSample

No detailed docstring for this function.") First;
		IntTools_CurveRangeSample & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CurveRangeSample

No detailed docstring for this function.") Last;
		IntTools_CurveRangeSample & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(IntTools_ListIteratorOfListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (IntTools_ListIteratorOfListOfCurveRangeSample & It);
		%feature("autodoc", "Args:
	I(IntTools_CurveRangeSample)
	It(IntTools_ListIteratorOfListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const IntTools_CurveRangeSample & I,IntTools_ListIteratorOfListOfCurveRangeSample & It);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfCurveRangeSample)
	It(IntTools_ListIteratorOfListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (IntTools_ListOfCurveRangeSample & Other,IntTools_ListIteratorOfListOfCurveRangeSample & It);
		%feature("autodoc", "Args:
	I(IntTools_CurveRangeSample)
	It(IntTools_ListIteratorOfListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const IntTools_CurveRangeSample & I,IntTools_ListIteratorOfListOfCurveRangeSample & It);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfCurveRangeSample)
	It(IntTools_ListIteratorOfListOfCurveRangeSample)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (IntTools_ListOfCurveRangeSample & Other,IntTools_ListIteratorOfListOfCurveRangeSample & It);
};


%feature("shadow") IntTools_ListOfCurveRangeSample::~IntTools_ListOfCurveRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListOfCurveRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_ListOfSurfaceRangeSample;
class IntTools_ListOfSurfaceRangeSample {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_ListOfSurfaceRangeSample;
		 IntTools_ListOfSurfaceRangeSample ();
		%feature("autodoc", "Args:
	Other(IntTools_ListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const IntTools_ListOfSurfaceRangeSample & Other);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const IntTools_ListOfSurfaceRangeSample & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(IntTools_SurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntTools_SurfaceRangeSample & I);
		%feature("autodoc", "Args:
	I(IntTools_SurfaceRangeSample)
	theIt(IntTools_ListIteratorOfListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntTools_SurfaceRangeSample & I,IntTools_ListIteratorOfListOfSurfaceRangeSample & theIt);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntTools_ListOfSurfaceRangeSample & Other);
		%feature("autodoc", "Args:
	I(IntTools_SurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntTools_SurfaceRangeSample & I);
		%feature("autodoc", "Args:
	I(IntTools_SurfaceRangeSample)
	theIt(IntTools_ListIteratorOfListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntTools_SurfaceRangeSample & I,IntTools_ListIteratorOfListOfSurfaceRangeSample & theIt);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntTools_ListOfSurfaceRangeSample & Other);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SurfaceRangeSample

No detailed docstring for this function.") First;
		IntTools_SurfaceRangeSample & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SurfaceRangeSample

No detailed docstring for this function.") Last;
		IntTools_SurfaceRangeSample & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(IntTools_ListIteratorOfListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (IntTools_ListIteratorOfListOfSurfaceRangeSample & It);
		%feature("autodoc", "Args:
	I(IntTools_SurfaceRangeSample)
	It(IntTools_ListIteratorOfListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const IntTools_SurfaceRangeSample & I,IntTools_ListIteratorOfListOfSurfaceRangeSample & It);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfSurfaceRangeSample)
	It(IntTools_ListIteratorOfListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (IntTools_ListOfSurfaceRangeSample & Other,IntTools_ListIteratorOfListOfSurfaceRangeSample & It);
		%feature("autodoc", "Args:
	I(IntTools_SurfaceRangeSample)
	It(IntTools_ListIteratorOfListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const IntTools_SurfaceRangeSample & I,IntTools_ListIteratorOfListOfSurfaceRangeSample & It);
		%feature("autodoc", "Args:
	Other(IntTools_ListOfSurfaceRangeSample)
	It(IntTools_ListIteratorOfListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (IntTools_ListOfSurfaceRangeSample & Other,IntTools_ListIteratorOfListOfSurfaceRangeSample & It);
};


%feature("shadow") IntTools_ListOfSurfaceRangeSample::~IntTools_ListOfSurfaceRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListOfSurfaceRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_MapIteratorOfMapOfCurveSample;
class IntTools_MapIteratorOfMapOfCurveSample : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_MapIteratorOfMapOfCurveSample;
		 IntTools_MapIteratorOfMapOfCurveSample ();
		%feature("autodoc", "Args:
	aMap(IntTools_MapOfCurveSample)

Returns:
	None

No detailed docstring for this function.") IntTools_MapIteratorOfMapOfCurveSample;
		 IntTools_MapIteratorOfMapOfCurveSample (const IntTools_MapOfCurveSample & aMap);
		%feature("autodoc", "Args:
	aMap(IntTools_MapOfCurveSample)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const IntTools_MapOfCurveSample & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CurveRangeSample

No detailed docstring for this function.") Key;
		const IntTools_CurveRangeSample & Key ();
};


%feature("shadow") IntTools_MapIteratorOfMapOfCurveSample::~IntTools_MapIteratorOfMapOfCurveSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_MapIteratorOfMapOfCurveSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_MapIteratorOfMapOfSurfaceSample;
class IntTools_MapIteratorOfMapOfSurfaceSample : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_MapIteratorOfMapOfSurfaceSample;
		 IntTools_MapIteratorOfMapOfSurfaceSample ();
		%feature("autodoc", "Args:
	aMap(IntTools_MapOfSurfaceSample)

Returns:
	None

No detailed docstring for this function.") IntTools_MapIteratorOfMapOfSurfaceSample;
		 IntTools_MapIteratorOfMapOfSurfaceSample (const IntTools_MapOfSurfaceSample & aMap);
		%feature("autodoc", "Args:
	aMap(IntTools_MapOfSurfaceSample)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const IntTools_MapOfSurfaceSample & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SurfaceRangeSample

No detailed docstring for this function.") Key;
		const IntTools_SurfaceRangeSample & Key ();
};


%feature("shadow") IntTools_MapIteratorOfMapOfSurfaceSample::~IntTools_MapIteratorOfMapOfSurfaceSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_MapIteratorOfMapOfSurfaceSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_MapOfCurveSample;
class IntTools_MapOfCurveSample : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") IntTools_MapOfCurveSample;
		 IntTools_MapOfCurveSample (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(IntTools_MapOfCurveSample)

Returns:
	IntTools_MapOfCurveSample

No detailed docstring for this function.") Assign;
		IntTools_MapOfCurveSample & Assign (const IntTools_MapOfCurveSample & Other);
		%feature("autodoc", "Args:
	Other(IntTools_MapOfCurveSample)

Returns:
	IntTools_MapOfCurveSample

No detailed docstring for this function.") operator=;
		IntTools_MapOfCurveSample & operator = (const IntTools_MapOfCurveSample & Other);
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
	aKey(IntTools_CurveRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const IntTools_CurveRangeSample & aKey);
		%feature("autodoc", "Args:
	aKey(IntTools_CurveRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const IntTools_CurveRangeSample & aKey);
		%feature("autodoc", "Args:
	aKey(IntTools_CurveRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const IntTools_CurveRangeSample & aKey);
};


%feature("shadow") IntTools_MapOfCurveSample::~IntTools_MapOfCurveSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_MapOfCurveSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_MapOfSurfaceSample;
class IntTools_MapOfSurfaceSample : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") IntTools_MapOfSurfaceSample;
		 IntTools_MapOfSurfaceSample (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(IntTools_MapOfSurfaceSample)

Returns:
	IntTools_MapOfSurfaceSample

No detailed docstring for this function.") Assign;
		IntTools_MapOfSurfaceSample & Assign (const IntTools_MapOfSurfaceSample & Other);
		%feature("autodoc", "Args:
	Other(IntTools_MapOfSurfaceSample)

Returns:
	IntTools_MapOfSurfaceSample

No detailed docstring for this function.") operator=;
		IntTools_MapOfSurfaceSample & operator = (const IntTools_MapOfSurfaceSample & Other);
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
	aKey(IntTools_SurfaceRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const IntTools_SurfaceRangeSample & aKey);
		%feature("autodoc", "Args:
	aKey(IntTools_SurfaceRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const IntTools_SurfaceRangeSample & aKey);
		%feature("autodoc", "Args:
	aKey(IntTools_SurfaceRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const IntTools_SurfaceRangeSample & aKey);
};


%feature("shadow") IntTools_MapOfSurfaceSample::~IntTools_MapOfSurfaceSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_MapOfSurfaceSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_MarkedRangeSet;
class IntTools_MarkedRangeSet {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet ();
		%feature("autodoc", "Args:
	theFirstBoundary(Standard_Real)
	theLastBoundary(Standard_Real)
	theInitFlag(Standard_Integer)

Returns:
	None

build set of ranges which consists of one range with  
boundary values theFirstBoundary and theLastBoundary") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet (const Standard_Real theFirstBoundary,const Standard_Real theLastBoundary,const Standard_Integer theInitFlag);
		%feature("autodoc", "Args:
	theSortedArray(IntTools_CArray1OfReal)
	theInitFlag(Standard_Integer)

Returns:
	None

Build set of ranges based on the array of progressive sorted values  
 
 Warning:  
The constructor do not check if the values of array are not sorted  
It should be checked before function invocation") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet (const IntTools_CArray1OfReal & theSortedArray,const Standard_Integer theInitFlag);
		%feature("autodoc", "Args:
	theFirstBoundary(Standard_Real)
	theLastBoundary(Standard_Real)
	theInitFlag(Standard_Integer)

Returns:
	None

build set of ranges which consists of one range with  
boundary values theFirstBoundary and theLastBoundary") SetBoundaries;
		void SetBoundaries (const Standard_Real theFirstBoundary,const Standard_Real theLastBoundary,const Standard_Integer theInitFlag);
		%feature("autodoc", "Args:
	theSortedArray(IntTools_CArray1OfReal)
	theInitFlag(Standard_Integer)

Returns:
	None

Build set of ranges based on the array of progressive sorted values  
 
 Warning:  
The function do not check if the values of array are not sorted  
It should be checked before function invocation") SetRanges;
		void SetRanges (const IntTools_CArray1OfReal & theSortedArray,const Standard_Integer theInitFlag);
		%feature("autodoc", "Args:
	theFirstBoundary(Standard_Real)
	theLastBoundary(Standard_Real)
	theFlag(Standard_Integer)

Returns:
	Standard_Boolean

Inserts a new range marked with flag theFlag  
It replace the existing ranges or parts of ranges  
and their flags.  
Returns True if the range is inside the initial boundaries,  
otherwise or in case of some error returns False") InsertRange;
		Standard_Boolean InsertRange (const Standard_Real theFirstBoundary,const Standard_Real theLastBoundary,const Standard_Integer theFlag);
		%feature("autodoc", "Args:
	theRange(IntTools_Range)
	theFlag(Standard_Integer)

Returns:
	Standard_Boolean

Inserts a new range marked with flag theFlag  
It replace the existing ranges or parts of ranges  
and their flags.  
Returns True if the range is inside the initial boundaries,  
otherwise or in case of some error returns False") InsertRange;
		Standard_Boolean InsertRange (const IntTools_Range & theRange,const Standard_Integer theFlag);
		%feature("autodoc", "Args:
	theFirstBoundary(Standard_Real)
	theLastBoundary(Standard_Real)
	theFlag(Standard_Integer)
	theIndex(Standard_Integer)

Returns:
	Standard_Boolean

Inserts a new range marked with flag theFlag  
It replace the existing ranges or parts of ranges  
and their flags.  
The index theIndex is a position where the range will be inserted.  
Returns True if the range is inside the initial boundaries,  
otherwise or in case of some error returns False") InsertRange;
		Standard_Boolean InsertRange (const Standard_Real theFirstBoundary,const Standard_Real theLastBoundary,const Standard_Integer theFlag,const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theRange(IntTools_Range)
	theFlag(Standard_Integer)
	theIndex(Standard_Integer)

Returns:
	Standard_Boolean

Inserts a new range marked with flag theFlag  
It replace the existing ranges or parts of ranges  
and their flags.  
The index theIndex is a position where the range will be inserted.  
Returns True if the range is inside the initial boundaries,  
otherwise or in case of some error returns False") InsertRange;
		Standard_Boolean InsertRange (const IntTools_Range & theRange,const Standard_Integer theFlag,const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theFlag(Standard_Integer)

Returns:
	None

Set flag theFlag for range with index theIndex") SetFlag;
		void SetFlag (const Standard_Integer theIndex,const Standard_Integer theFlag);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns flag of the range with index theIndex") Flag;
		Standard_Integer Flag (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theValue(Standard_Real)

Returns:
	Standard_Integer

Returns index of range which contains theValue.  
If theValue do not belong any range returns 0.") GetIndex;
		Standard_Integer GetIndex (const Standard_Real theValue);
		%feature("autodoc", "Args:
	theValue(Standard_Real)

Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") GetIndices;
		const TColStd_SequenceOfInteger & GetIndices (const Standard_Real theValue);
		%feature("autodoc", "Args:
	theValue(Standard_Real)
	UseLower(Standard_Boolean)

Returns:
	Standard_Integer

Returns index of range which contains theValue  
If theValue do not belong any range returns 0.  
If UseLower is Standard_True then lower boundary of the range  
can be equal to theValue, otherwise upper boundary of the range  
can be equal to theValue.") GetIndex;
		Standard_Integer GetIndex (const Standard_Real theValue,const Standard_Boolean UseLower);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of ranges") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	IntTools_Range

Returns the range with index theIndex.  
the Index can be from 1 to Length()") Range;
		IntTools_Range Range (const Standard_Integer theIndex);
};


%feature("shadow") IntTools_MarkedRangeSet::~IntTools_MarkedRangeSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_MarkedRangeSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_PntOn2Faces;
class IntTools_PntOn2Faces {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") IntTools_PntOn2Faces;
		 IntTools_PntOn2Faces ();
		%feature("autodoc", "Args:
	aP1(IntTools_PntOnFace)
	aP2(IntTools_PntOnFace)

Returns:
	None

Initializes me by two points aP1 and aP2") IntTools_PntOn2Faces;
		 IntTools_PntOn2Faces (const IntTools_PntOnFace & aP1,const IntTools_PntOnFace & aP2);
		%feature("autodoc", "Args:
	aP1(IntTools_PntOnFace)

Returns:
	None

Modifier") SetP1;
		void SetP1 (const IntTools_PntOnFace & aP1);
		%feature("autodoc", "Args:
	aP2(IntTools_PntOnFace)

Returns:
	None

Modifier") SetP2;
		void SetP2 (const IntTools_PntOnFace & aP2);
		%feature("autodoc", "Args:
	bF(Standard_Boolean)

Returns:
	None

Modifier") SetValid;
		void SetValid (const Standard_Boolean bF);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_PntOnFace

Selector") P1;
		const IntTools_PntOnFace & P1 ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_PntOnFace

Selector") P2;
		const IntTools_PntOnFace & P2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Selector") IsValid;
		Standard_Boolean IsValid ();
};


%feature("shadow") IntTools_PntOn2Faces::~IntTools_PntOn2Faces %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_PntOn2Faces {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_PntOnFace;
class IntTools_PntOnFace {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") IntTools_PntOnFace;
		 IntTools_PntOnFace ();
		%feature("autodoc", "Args:
	aF(TopoDS_Face)
	aP(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

Initializes me by aFace, a 3d point  
and it's UV parameters on face") Init;
		void Init (const TopoDS_Face & aF,const gp_Pnt & aP,const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	aF(TopoDS_Face)

Returns:
	None

Modifier") SetFace;
		void SetFace (const TopoDS_Face & aF);
		%feature("autodoc", "Args:
	aP(gp_Pnt)

Returns:
	None

Modifier") SetPnt;
		void SetPnt (const gp_Pnt & aP);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

Modifier") SetParameters;
		void SetParameters (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	bF(Standard_Boolean)

Returns:
	None

Modifier") SetValid;
		void SetValid (const Standard_Boolean bF);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Selector") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Selector") Pnt;
		const gp_Pnt & Pnt ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

Selector") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntTools_PntOnFace::~IntTools_PntOnFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_PntOnFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_QuickSort;
class IntTools_QuickSort {
	public:
		%feature("autodoc", "Args:
	TheArray(IntTools_Array1OfRoots)
	Comp(IntTools_Compare)

Returns:
	static void

No detailed docstring for this function.") Sort;
		static void Sort (IntTools_Array1OfRoots & TheArray,const IntTools_Compare & Comp);
};


%feature("shadow") IntTools_QuickSort::~IntTools_QuickSort %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_QuickSort {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_QuickSortRange;
class IntTools_QuickSortRange {
	public:
		%feature("autodoc", "Args:
	TheArray(IntTools_Array1OfRange)
	Comp(IntTools_CompareRange)

Returns:
	static void

No detailed docstring for this function.") Sort;
		static void Sort (IntTools_Array1OfRange & TheArray,const IntTools_CompareRange & Comp);
};


%feature("shadow") IntTools_QuickSortRange::~IntTools_QuickSortRange %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_QuickSortRange {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Range;
class IntTools_Range {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") IntTools_Range;
		 IntTools_Range ();
		%feature("autodoc", "Args:
	aFirst(Standard_Real)
	aLast(Standard_Real)

Returns:
	None

Initialize me by range boundaries") IntTools_Range;
		 IntTools_Range (const Standard_Real aFirst,const Standard_Real aLast);
		%feature("autodoc", "Args:
	aFirst(Standard_Real)

Returns:
	None

Modifier") SetFirst;
		void SetFirst (const Standard_Real aFirst);
		%feature("autodoc", "Args:
	aLast(Standard_Real)

Returns:
	None

Modifier") SetLast;
		void SetLast (const Standard_Real aLast);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Selector") First;
		Standard_Real First ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Selector") Last;
		Standard_Real Last ();
		%feature("autodoc", "Args:
	aFirst(Standard_Real)
	aLast(Standard_Real)

Returns:
	None

Selector") Range;
		void Range (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntTools_Range::~IntTools_Range %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Range {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Root;
class IntTools_Root {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") IntTools_Root;
		 IntTools_Root ();
		%feature("autodoc", "Args:
	aRoot(Standard_Real)
	aType(Standard_Integer)

Returns:
	None

Initializes my by range of parameters  
and type of root") IntTools_Root;
		 IntTools_Root (const Standard_Real aRoot,const Standard_Integer aType);
		%feature("autodoc", "Args:
	aRoot(Standard_Real)

Returns:
	None

Sets the Root's value") SetRoot;
		void SetRoot (const Standard_Real aRoot);
		%feature("autodoc", "Args:
	aType(Standard_Integer)

Returns:
	None

Sets the Root's Type") SetType;
		void SetType (const Standard_Integer aType);
		%feature("autodoc", "Args:
	aState(TopAbs_State)

Returns:
	None

Set  the  value of the state before the root  
(at  t=Root-dt)") SetStateBefore;
		void SetStateBefore (const TopAbs_State aState);
		%feature("autodoc", "Args:
	aState(TopAbs_State)

Returns:
	None

Set  the  value of the state after the root  
(at  t=Root-dt)") SetStateAfter;
		void SetStateAfter (const TopAbs_State aState);
		%feature("autodoc", "Args:
	aHeight(Standard_Real)

Returns:
	None

Not  used  in  Edge/Edge  algorithm") SetLayerHeight;
		void SetLayerHeight (const Standard_Real aHeight);
		%feature("autodoc", "Args:
	t1(Standard_Real)
	t2(Standard_Real)
	f1(Standard_Real)
	f2(Standard_Real)

Returns:
	None

Sets the  interval  from which the Root was  
found [t1,t2] and the  corresponding  values  
of  the  function  on  the  bounds f(t1), f(t2).") SetInterval;
		void SetInterval (const Standard_Real t1,const Standard_Real t2,const Standard_Real f1,const Standard_Real f2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the Root  value") Root;
		Standard_Real Root ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the  type  of  the  root  
=0  -  Simple (was  found  by  bisection  method);  
=2  -  Smart when f1=0, f2!=0 or  vice  versa  
       (was  found  by  Fibbonacci method);  
=1  -  Pure   (pure  zero  for all t [t1,t2] );") Type;
		Standard_Integer Type ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

Returns the state before the root") StateBefore;
		TopAbs_State StateBefore ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

Returns the state after the root") StateAfter;
		TopAbs_State StateAfter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Not  used  in  Edge/Edge  algorithm") LayerHeight;
		Standard_Real LayerHeight ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the validity flag for the root,  
True if  
myStateBefore==TopAbs_OUT && myStateAfter==TopAbs_IN or  
myStateBefore==TopAbs_OUT && myStateAfter==TopAbs_ON or  
myStateBefore==TopAbs_ON  && myStateAfter==TopAbs_OUT or  
myStateBefore==TopAbs_IN  && myStateAfter==TopAbs_OUT  .  
For  other  cases it  returns  False.") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "Args:
	t1(Standard_Real)
	t2(Standard_Real)
	f1(Standard_Real)
	f2(Standard_Real)

Returns:
	None

Returns the values of interval  from which the Root was  
found [t1,t2] and the  corresponding  values  
of  the  function  on  the  bounds f(t1), f(t2).") Interval;
		void Interval (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntTools_Root::~IntTools_Root %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Root {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SequenceNodeOfSequenceOfCommonPrts;
class IntTools_SequenceNodeOfSequenceOfCommonPrts : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(IntTools_CommonPrt)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IntTools_SequenceNodeOfSequenceOfCommonPrts;
		 IntTools_SequenceNodeOfSequenceOfCommonPrts (const IntTools_CommonPrt & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CommonPrt

No detailed docstring for this function.") Value;
		IntTools_CommonPrt & Value ();
};


%feature("shadow") IntTools_SequenceNodeOfSequenceOfCommonPrts::~IntTools_SequenceNodeOfSequenceOfCommonPrts %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceNodeOfSequenceOfCommonPrts {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_SequenceNodeOfSequenceOfCommonPrts {
	Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts GetHandle() {
	return *(Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts*) &$self;
	}
};

%nodefaultctor Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts;
class Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts();
        Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts(const Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts &aHandle);
        Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts(const IntTools_SequenceNodeOfSequenceOfCommonPrts *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts {
    IntTools_SequenceNodeOfSequenceOfCommonPrts* GetObject() {
    return (IntTools_SequenceNodeOfSequenceOfCommonPrts*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts::~Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_SequenceNodeOfSequenceOfCurves;
class IntTools_SequenceNodeOfSequenceOfCurves : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(IntTools_Curve)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IntTools_SequenceNodeOfSequenceOfCurves;
		 IntTools_SequenceNodeOfSequenceOfCurves (const IntTools_Curve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_Curve

No detailed docstring for this function.") Value;
		IntTools_Curve & Value ();
};


%feature("shadow") IntTools_SequenceNodeOfSequenceOfCurves::~IntTools_SequenceNodeOfSequenceOfCurves %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceNodeOfSequenceOfCurves {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_SequenceNodeOfSequenceOfCurves {
	Handle_IntTools_SequenceNodeOfSequenceOfCurves GetHandle() {
	return *(Handle_IntTools_SequenceNodeOfSequenceOfCurves*) &$self;
	}
};

%nodefaultctor Handle_IntTools_SequenceNodeOfSequenceOfCurves;
class Handle_IntTools_SequenceNodeOfSequenceOfCurves : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntTools_SequenceNodeOfSequenceOfCurves();
        Handle_IntTools_SequenceNodeOfSequenceOfCurves(const Handle_IntTools_SequenceNodeOfSequenceOfCurves &aHandle);
        Handle_IntTools_SequenceNodeOfSequenceOfCurves(const IntTools_SequenceNodeOfSequenceOfCurves *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_SequenceNodeOfSequenceOfCurves DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_SequenceNodeOfSequenceOfCurves {
    IntTools_SequenceNodeOfSequenceOfCurves* GetObject() {
    return (IntTools_SequenceNodeOfSequenceOfCurves*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_SequenceNodeOfSequenceOfCurves::~Handle_IntTools_SequenceNodeOfSequenceOfCurves %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_SequenceNodeOfSequenceOfCurves {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_SequenceNodeOfSequenceOfPntOn2Faces;
class IntTools_SequenceNodeOfSequenceOfPntOn2Faces : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(IntTools_PntOn2Faces)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IntTools_SequenceNodeOfSequenceOfPntOn2Faces;
		 IntTools_SequenceNodeOfSequenceOfPntOn2Faces (const IntTools_PntOn2Faces & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_PntOn2Faces

No detailed docstring for this function.") Value;
		IntTools_PntOn2Faces & Value ();
};


%feature("shadow") IntTools_SequenceNodeOfSequenceOfPntOn2Faces::~IntTools_SequenceNodeOfSequenceOfPntOn2Faces %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceNodeOfSequenceOfPntOn2Faces {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_SequenceNodeOfSequenceOfPntOn2Faces {
	Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces GetHandle() {
	return *(Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces*) &$self;
	}
};

%nodefaultctor Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces;
class Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces();
        Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces(const Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces &aHandle);
        Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces(const IntTools_SequenceNodeOfSequenceOfPntOn2Faces *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces {
    IntTools_SequenceNodeOfSequenceOfPntOn2Faces* GetObject() {
    return (IntTools_SequenceNodeOfSequenceOfPntOn2Faces*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces::~Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_SequenceNodeOfSequenceOfRanges;
class IntTools_SequenceNodeOfSequenceOfRanges : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(IntTools_Range)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IntTools_SequenceNodeOfSequenceOfRanges;
		 IntTools_SequenceNodeOfSequenceOfRanges (const IntTools_Range & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_Range

No detailed docstring for this function.") Value;
		IntTools_Range & Value ();
};


%feature("shadow") IntTools_SequenceNodeOfSequenceOfRanges::~IntTools_SequenceNodeOfSequenceOfRanges %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceNodeOfSequenceOfRanges {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_SequenceNodeOfSequenceOfRanges {
	Handle_IntTools_SequenceNodeOfSequenceOfRanges GetHandle() {
	return *(Handle_IntTools_SequenceNodeOfSequenceOfRanges*) &$self;
	}
};

%nodefaultctor Handle_IntTools_SequenceNodeOfSequenceOfRanges;
class Handle_IntTools_SequenceNodeOfSequenceOfRanges : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntTools_SequenceNodeOfSequenceOfRanges();
        Handle_IntTools_SequenceNodeOfSequenceOfRanges(const Handle_IntTools_SequenceNodeOfSequenceOfRanges &aHandle);
        Handle_IntTools_SequenceNodeOfSequenceOfRanges(const IntTools_SequenceNodeOfSequenceOfRanges *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_SequenceNodeOfSequenceOfRanges DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_SequenceNodeOfSequenceOfRanges {
    IntTools_SequenceNodeOfSequenceOfRanges* GetObject() {
    return (IntTools_SequenceNodeOfSequenceOfRanges*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_SequenceNodeOfSequenceOfRanges::~Handle_IntTools_SequenceNodeOfSequenceOfRanges %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_SequenceNodeOfSequenceOfRanges {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_SequenceNodeOfSequenceOfRoots;
class IntTools_SequenceNodeOfSequenceOfRoots : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(IntTools_Root)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IntTools_SequenceNodeOfSequenceOfRoots;
		 IntTools_SequenceNodeOfSequenceOfRoots (const IntTools_Root & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_Root

No detailed docstring for this function.") Value;
		IntTools_Root & Value ();
};


%feature("shadow") IntTools_SequenceNodeOfSequenceOfRoots::~IntTools_SequenceNodeOfSequenceOfRoots %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceNodeOfSequenceOfRoots {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_SequenceNodeOfSequenceOfRoots {
	Handle_IntTools_SequenceNodeOfSequenceOfRoots GetHandle() {
	return *(Handle_IntTools_SequenceNodeOfSequenceOfRoots*) &$self;
	}
};

%nodefaultctor Handle_IntTools_SequenceNodeOfSequenceOfRoots;
class Handle_IntTools_SequenceNodeOfSequenceOfRoots : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntTools_SequenceNodeOfSequenceOfRoots();
        Handle_IntTools_SequenceNodeOfSequenceOfRoots(const Handle_IntTools_SequenceNodeOfSequenceOfRoots &aHandle);
        Handle_IntTools_SequenceNodeOfSequenceOfRoots(const IntTools_SequenceNodeOfSequenceOfRoots *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_SequenceNodeOfSequenceOfRoots DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_SequenceNodeOfSequenceOfRoots {
    IntTools_SequenceNodeOfSequenceOfRoots* GetObject() {
    return (IntTools_SequenceNodeOfSequenceOfRoots*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_SequenceNodeOfSequenceOfRoots::~Handle_IntTools_SequenceNodeOfSequenceOfRoots %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_SequenceNodeOfSequenceOfRoots {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_SequenceOfCommonPrts;
class IntTools_SequenceOfCommonPrts : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_SequenceOfCommonPrts;
		 IntTools_SequenceOfCommonPrts ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IntTools_SequenceOfCommonPrts)

Returns:
	IntTools_SequenceOfCommonPrts

No detailed docstring for this function.") Assign;
		const IntTools_SequenceOfCommonPrts & Assign (const IntTools_SequenceOfCommonPrts & Other);
		%feature("autodoc", "Args:
	Other(IntTools_SequenceOfCommonPrts)

Returns:
	IntTools_SequenceOfCommonPrts

No detailed docstring for this function.") operator=;
		const IntTools_SequenceOfCommonPrts & operator = (const IntTools_SequenceOfCommonPrts & Other);
		%feature("autodoc", "Args:
	T(IntTools_CommonPrt)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntTools_CommonPrt & T);
		%feature("autodoc", "Args:
	S(IntTools_SequenceOfCommonPrts)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntTools_SequenceOfCommonPrts & S);
		%feature("autodoc", "Args:
	T(IntTools_CommonPrt)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntTools_CommonPrt & T);
		%feature("autodoc", "Args:
	S(IntTools_SequenceOfCommonPrts)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntTools_SequenceOfCommonPrts & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntTools_CommonPrt)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntTools_CommonPrt & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntTools_SequenceOfCommonPrts)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntTools_SequenceOfCommonPrts & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntTools_CommonPrt)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntTools_CommonPrt & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntTools_SequenceOfCommonPrts)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntTools_SequenceOfCommonPrts & S);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CommonPrt

No detailed docstring for this function.") First;
		const IntTools_CommonPrt & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CommonPrt

No detailed docstring for this function.") Last;
		const IntTools_CommonPrt & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IntTools_SequenceOfCommonPrts)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IntTools_SequenceOfCommonPrts & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_CommonPrt

No detailed docstring for this function.") Value;
		const IntTools_CommonPrt & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(IntTools_CommonPrt)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_CommonPrt & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_CommonPrt

No detailed docstring for this function.") ChangeValue;
		IntTools_CommonPrt & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IntTools_SequenceOfCommonPrts::~IntTools_SequenceOfCommonPrts %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceOfCommonPrts {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SequenceOfCurves;
class IntTools_SequenceOfCurves : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_SequenceOfCurves;
		 IntTools_SequenceOfCurves ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IntTools_SequenceOfCurves)

Returns:
	IntTools_SequenceOfCurves

No detailed docstring for this function.") Assign;
		const IntTools_SequenceOfCurves & Assign (const IntTools_SequenceOfCurves & Other);
		%feature("autodoc", "Args:
	Other(IntTools_SequenceOfCurves)

Returns:
	IntTools_SequenceOfCurves

No detailed docstring for this function.") operator=;
		const IntTools_SequenceOfCurves & operator = (const IntTools_SequenceOfCurves & Other);
		%feature("autodoc", "Args:
	T(IntTools_Curve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntTools_Curve & T);
		%feature("autodoc", "Args:
	S(IntTools_SequenceOfCurves)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntTools_SequenceOfCurves & S);
		%feature("autodoc", "Args:
	T(IntTools_Curve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntTools_Curve & T);
		%feature("autodoc", "Args:
	S(IntTools_SequenceOfCurves)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntTools_SequenceOfCurves & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntTools_Curve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntTools_Curve & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntTools_SequenceOfCurves)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntTools_SequenceOfCurves & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntTools_Curve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntTools_Curve & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntTools_SequenceOfCurves)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntTools_SequenceOfCurves & S);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_Curve

No detailed docstring for this function.") First;
		const IntTools_Curve & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_Curve

No detailed docstring for this function.") Last;
		const IntTools_Curve & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IntTools_SequenceOfCurves)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IntTools_SequenceOfCurves & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_Curve

No detailed docstring for this function.") Value;
		const IntTools_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(IntTools_Curve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_Curve & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_Curve

No detailed docstring for this function.") ChangeValue;
		IntTools_Curve & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IntTools_SequenceOfCurves::~IntTools_SequenceOfCurves %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceOfCurves {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SequenceOfPntOn2Faces;
class IntTools_SequenceOfPntOn2Faces : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_SequenceOfPntOn2Faces;
		 IntTools_SequenceOfPntOn2Faces ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IntTools_SequenceOfPntOn2Faces)

Returns:
	IntTools_SequenceOfPntOn2Faces

No detailed docstring for this function.") Assign;
		const IntTools_SequenceOfPntOn2Faces & Assign (const IntTools_SequenceOfPntOn2Faces & Other);
		%feature("autodoc", "Args:
	Other(IntTools_SequenceOfPntOn2Faces)

Returns:
	IntTools_SequenceOfPntOn2Faces

No detailed docstring for this function.") operator=;
		const IntTools_SequenceOfPntOn2Faces & operator = (const IntTools_SequenceOfPntOn2Faces & Other);
		%feature("autodoc", "Args:
	T(IntTools_PntOn2Faces)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntTools_PntOn2Faces & T);
		%feature("autodoc", "Args:
	S(IntTools_SequenceOfPntOn2Faces)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntTools_SequenceOfPntOn2Faces & S);
		%feature("autodoc", "Args:
	T(IntTools_PntOn2Faces)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntTools_PntOn2Faces & T);
		%feature("autodoc", "Args:
	S(IntTools_SequenceOfPntOn2Faces)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntTools_SequenceOfPntOn2Faces & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntTools_PntOn2Faces)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntTools_PntOn2Faces & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntTools_SequenceOfPntOn2Faces)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntTools_SequenceOfPntOn2Faces & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntTools_PntOn2Faces)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntTools_PntOn2Faces & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntTools_SequenceOfPntOn2Faces)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntTools_SequenceOfPntOn2Faces & S);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_PntOn2Faces

No detailed docstring for this function.") First;
		const IntTools_PntOn2Faces & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_PntOn2Faces

No detailed docstring for this function.") Last;
		const IntTools_PntOn2Faces & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IntTools_SequenceOfPntOn2Faces)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IntTools_SequenceOfPntOn2Faces & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_PntOn2Faces

No detailed docstring for this function.") Value;
		const IntTools_PntOn2Faces & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(IntTools_PntOn2Faces)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_PntOn2Faces & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_PntOn2Faces

No detailed docstring for this function.") ChangeValue;
		IntTools_PntOn2Faces & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IntTools_SequenceOfPntOn2Faces::~IntTools_SequenceOfPntOn2Faces %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceOfPntOn2Faces {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SequenceOfRanges;
class IntTools_SequenceOfRanges : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_SequenceOfRanges;
		 IntTools_SequenceOfRanges ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IntTools_SequenceOfRanges)

Returns:
	IntTools_SequenceOfRanges

No detailed docstring for this function.") Assign;
		const IntTools_SequenceOfRanges & Assign (const IntTools_SequenceOfRanges & Other);
		%feature("autodoc", "Args:
	Other(IntTools_SequenceOfRanges)

Returns:
	IntTools_SequenceOfRanges

No detailed docstring for this function.") operator=;
		const IntTools_SequenceOfRanges & operator = (const IntTools_SequenceOfRanges & Other);
		%feature("autodoc", "Args:
	T(IntTools_Range)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntTools_Range & T);
		%feature("autodoc", "Args:
	S(IntTools_SequenceOfRanges)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntTools_SequenceOfRanges & S);
		%feature("autodoc", "Args:
	T(IntTools_Range)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntTools_Range & T);
		%feature("autodoc", "Args:
	S(IntTools_SequenceOfRanges)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntTools_SequenceOfRanges & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntTools_Range)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntTools_Range & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntTools_SequenceOfRanges)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntTools_SequenceOfRanges & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntTools_Range)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntTools_Range & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntTools_SequenceOfRanges)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntTools_SequenceOfRanges & S);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_Range

No detailed docstring for this function.") First;
		const IntTools_Range & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_Range

No detailed docstring for this function.") Last;
		const IntTools_Range & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IntTools_SequenceOfRanges)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IntTools_SequenceOfRanges & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_Range

No detailed docstring for this function.") Value;
		const IntTools_Range & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(IntTools_Range)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_Range & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_Range

No detailed docstring for this function.") ChangeValue;
		IntTools_Range & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IntTools_SequenceOfRanges::~IntTools_SequenceOfRanges %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceOfRanges {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SequenceOfRoots;
class IntTools_SequenceOfRoots : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_SequenceOfRoots;
		 IntTools_SequenceOfRoots ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IntTools_SequenceOfRoots)

Returns:
	IntTools_SequenceOfRoots

No detailed docstring for this function.") Assign;
		const IntTools_SequenceOfRoots & Assign (const IntTools_SequenceOfRoots & Other);
		%feature("autodoc", "Args:
	Other(IntTools_SequenceOfRoots)

Returns:
	IntTools_SequenceOfRoots

No detailed docstring for this function.") operator=;
		const IntTools_SequenceOfRoots & operator = (const IntTools_SequenceOfRoots & Other);
		%feature("autodoc", "Args:
	T(IntTools_Root)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntTools_Root & T);
		%feature("autodoc", "Args:
	S(IntTools_SequenceOfRoots)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntTools_SequenceOfRoots & S);
		%feature("autodoc", "Args:
	T(IntTools_Root)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntTools_Root & T);
		%feature("autodoc", "Args:
	S(IntTools_SequenceOfRoots)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntTools_SequenceOfRoots & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntTools_Root)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntTools_Root & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntTools_SequenceOfRoots)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntTools_SequenceOfRoots & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntTools_Root)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntTools_Root & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntTools_SequenceOfRoots)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntTools_SequenceOfRoots & S);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_Root

No detailed docstring for this function.") First;
		const IntTools_Root & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_Root

No detailed docstring for this function.") Last;
		const IntTools_Root & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IntTools_SequenceOfRoots)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IntTools_SequenceOfRoots & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_Root

No detailed docstring for this function.") Value;
		const IntTools_Root & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(IntTools_Root)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_Root & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntTools_Root

No detailed docstring for this function.") ChangeValue;
		IntTools_Root & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IntTools_SequenceOfRoots::~IntTools_SequenceOfRoots %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceOfRoots {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_StdMapNodeOfMapOfCurveSample;
class IntTools_StdMapNodeOfMapOfCurveSample : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(IntTools_CurveRangeSample)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") IntTools_StdMapNodeOfMapOfCurveSample;
		 IntTools_StdMapNodeOfMapOfCurveSample (const IntTools_CurveRangeSample & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CurveRangeSample

No detailed docstring for this function.") Key;
		IntTools_CurveRangeSample & Key ();
};


%feature("shadow") IntTools_StdMapNodeOfMapOfCurveSample::~IntTools_StdMapNodeOfMapOfCurveSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_StdMapNodeOfMapOfCurveSample {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_StdMapNodeOfMapOfCurveSample {
	Handle_IntTools_StdMapNodeOfMapOfCurveSample GetHandle() {
	return *(Handle_IntTools_StdMapNodeOfMapOfCurveSample*) &$self;
	}
};

%nodefaultctor Handle_IntTools_StdMapNodeOfMapOfCurveSample;
class Handle_IntTools_StdMapNodeOfMapOfCurveSample : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_StdMapNodeOfMapOfCurveSample();
        Handle_IntTools_StdMapNodeOfMapOfCurveSample(const Handle_IntTools_StdMapNodeOfMapOfCurveSample &aHandle);
        Handle_IntTools_StdMapNodeOfMapOfCurveSample(const IntTools_StdMapNodeOfMapOfCurveSample *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_StdMapNodeOfMapOfCurveSample DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_StdMapNodeOfMapOfCurveSample {
    IntTools_StdMapNodeOfMapOfCurveSample* GetObject() {
    return (IntTools_StdMapNodeOfMapOfCurveSample*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_StdMapNodeOfMapOfCurveSample::~Handle_IntTools_StdMapNodeOfMapOfCurveSample %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_StdMapNodeOfMapOfCurveSample {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_StdMapNodeOfMapOfSurfaceSample;
class IntTools_StdMapNodeOfMapOfSurfaceSample : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(IntTools_SurfaceRangeSample)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") IntTools_StdMapNodeOfMapOfSurfaceSample;
		 IntTools_StdMapNodeOfMapOfSurfaceSample (const IntTools_SurfaceRangeSample & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_SurfaceRangeSample

No detailed docstring for this function.") Key;
		IntTools_SurfaceRangeSample & Key ();
};


%feature("shadow") IntTools_StdMapNodeOfMapOfSurfaceSample::~IntTools_StdMapNodeOfMapOfSurfaceSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_StdMapNodeOfMapOfSurfaceSample {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_StdMapNodeOfMapOfSurfaceSample {
	Handle_IntTools_StdMapNodeOfMapOfSurfaceSample GetHandle() {
	return *(Handle_IntTools_StdMapNodeOfMapOfSurfaceSample*) &$self;
	}
};

%nodefaultctor Handle_IntTools_StdMapNodeOfMapOfSurfaceSample;
class Handle_IntTools_StdMapNodeOfMapOfSurfaceSample : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_StdMapNodeOfMapOfSurfaceSample();
        Handle_IntTools_StdMapNodeOfMapOfSurfaceSample(const Handle_IntTools_StdMapNodeOfMapOfSurfaceSample &aHandle);
        Handle_IntTools_StdMapNodeOfMapOfSurfaceSample(const IntTools_StdMapNodeOfMapOfSurfaceSample *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_StdMapNodeOfMapOfSurfaceSample DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_StdMapNodeOfMapOfSurfaceSample {
    IntTools_StdMapNodeOfMapOfSurfaceSample* GetObject() {
    return (IntTools_StdMapNodeOfMapOfSurfaceSample*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_StdMapNodeOfMapOfSurfaceSample::~Handle_IntTools_StdMapNodeOfMapOfSurfaceSample %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_StdMapNodeOfMapOfSurfaceSample {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_SurfaceRangeLocalizeData;
class IntTools_SurfaceRangeLocalizeData {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData ();
		%feature("autodoc", "Args:
	theNbSampleU(Standard_Integer)
	theNbSampleV(Standard_Integer)
	theMinRangeU(Standard_Real)
	theMinRangeV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData (const Standard_Integer theNbSampleU,const Standard_Integer theNbSampleV,const Standard_Real theMinRangeU,const Standard_Real theMinRangeV);
		%feature("autodoc", "Args:
	Other(IntTools_SurfaceRangeLocalizeData)

Returns:
	None

No detailed docstring for this function.") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData (const IntTools_SurfaceRangeLocalizeData & Other);
		%feature("autodoc", "Args:
	Other(IntTools_SurfaceRangeLocalizeData)

Returns:
	IntTools_SurfaceRangeLocalizeData

No detailed docstring for this function.") Assign;
		IntTools_SurfaceRangeLocalizeData & Assign (const IntTools_SurfaceRangeLocalizeData & Other);
		%feature("autodoc", "Args:
	Other(IntTools_SurfaceRangeLocalizeData)

Returns:
	IntTools_SurfaceRangeLocalizeData

No detailed docstring for this function.") operator=;
		IntTools_SurfaceRangeLocalizeData & operator = (const IntTools_SurfaceRangeLocalizeData & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetNbSampleU;
		Standard_Integer GetNbSampleU ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetNbSampleV;
		Standard_Integer GetNbSampleV ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetMinRangeU;
		Standard_Real GetMinRangeU ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetMinRangeV;
		Standard_Real GetMinRangeV ();
		%feature("autodoc", "Args:
	theRange(IntTools_SurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") AddOutRange;
		void AddOutRange (const IntTools_SurfaceRangeSample & theRange);
		%feature("autodoc", "Args:
	theRange(IntTools_SurfaceRangeSample)
	theBox(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") AddBox;
		void AddBox (const IntTools_SurfaceRangeSample & theRange,const Bnd_Box & theBox);
		%feature("autodoc", "Args:
	theRange(IntTools_SurfaceRangeSample)
	theBox(Bnd_Box)

Returns:
	Standard_Boolean

No detailed docstring for this function.") FindBox;
		Standard_Boolean FindBox (const IntTools_SurfaceRangeSample & theRange,Bnd_Box & theBox);
		%feature("autodoc", "Args:
	theRange(IntTools_SurfaceRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsRangeOut;
		Standard_Boolean IsRangeOut (const IntTools_SurfaceRangeSample & theRange);
		%feature("autodoc", "Args:
	theList(IntTools_ListOfSurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") ListRangeOut;
		void ListRangeOut (IntTools_ListOfSurfaceRangeSample & theList);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveRangeOutAll;
		void RemoveRangeOutAll ();
		%feature("autodoc", "Args:
	theDeflection(Standard_Real)

Returns:
	None

Set the grid deflection.") SetGridDeflection;
		void SetGridDeflection (const Standard_Real theDeflection);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Query the grid deflection.") GetGridDeflection;
		Standard_Real GetGridDeflection ();
		%feature("autodoc", "Args:
	theNbUGrid(Standard_Integer)

Returns:
	None

Set the range U of the grid of points.") SetRangeUGrid;
		void SetRangeUGrid (const Standard_Integer theNbUGrid);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Query the range U of the grid of points.") GetRangeUGrid;
		Standard_Integer GetRangeUGrid ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theUParam(Standard_Real)

Returns:
	None

Set the U parameter of the grid points at that index.") SetUParam;
		void SetUParam (const Standard_Integer theIndex,const Standard_Real theUParam);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Real

Query the U parameter of the grid points at that index.") GetUParam;
		Standard_Real GetUParam (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theNbVGrid(Standard_Integer)

Returns:
	None

Set the range V of the grid of points.") SetRangeVGrid;
		void SetRangeVGrid (const Standard_Integer theNbVGrid);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Query the range V of the grid of points.") GetRangeVGrid;
		Standard_Integer GetRangeVGrid ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theVParam(Standard_Real)

Returns:
	None

Set the V parameter of the grid points at that index.") SetVParam;
		void SetVParam (const Standard_Integer theIndex,const Standard_Real theVParam);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Real

Query the V parameter of the grid points at that index.") GetVParam;
		Standard_Real GetVParam (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theUIndex(Standard_Integer)
	theVIndex(Standard_Integer)
	thePoint(gp_Pnt)

Returns:
	None

Set the grid point.") SetGridPoint;
		void SetGridPoint (const Standard_Integer theUIndex,const Standard_Integer theVIndex,const gp_Pnt & thePoint);
		%feature("autodoc", "Args:
	theUIndex(Standard_Integer)
	theVIndex(Standard_Integer)

Returns:
	gp_Pnt

Set the grid point.") GetGridPoint;
		const gp_Pnt & GetGridPoint (const Standard_Integer theUIndex,const Standard_Integer theVIndex);
		%feature("autodoc", "Args:
	theUMin(Standard_Real)
	theUMax(Standard_Real)
	theVMin(Standard_Real)
	theVMax(Standard_Real)

Returns:
	None

Sets the frame area. Used to work with grid points.") SetFrame;
		void SetFrame (const Standard_Real theUMin,const Standard_Real theUMax,const Standard_Real theVMin,const Standard_Real theVMax);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of grid points on U direction in frame.") GetNBUPointsInFrame;
		Standard_Integer GetNBUPointsInFrame ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of grid points on V direction in frame.") GetNBVPointsInFrame;
		Standard_Integer GetNBVPointsInFrame ();
		%feature("autodoc", "Args:
	theUIndex(Standard_Integer)
	theVIndex(Standard_Integer)

Returns:
	gp_Pnt

Returns the grid point in frame.") GetPointInFrame;
		const gp_Pnt & GetPointInFrame (const Standard_Integer theUIndex,const Standard_Integer theVIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Real

Query the U parameter of the grid points  
         at that index in frame.") GetUParamInFrame;
		Standard_Real GetUParamInFrame (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Real

Query the V parameter of the grid points  
         at that index in frame.") GetVParamInFrame;
		Standard_Real GetVParamInFrame (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the grid of points.") ClearGrid;
		void ClearGrid ();
};


%feature("shadow") IntTools_SurfaceRangeLocalizeData::~IntTools_SurfaceRangeLocalizeData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SurfaceRangeLocalizeData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SurfaceRangeSample;
class IntTools_SurfaceRangeSample {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample ();
		%feature("autodoc", "Args:
	theIndexU(Standard_Integer)
	theDepthU(Standard_Integer)
	theIndexV(Standard_Integer)
	theDepthV(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample (const Standard_Integer theIndexU,const Standard_Integer theDepthU,const Standard_Integer theIndexV,const Standard_Integer theDepthV);
		%feature("autodoc", "Args:
	theRangeU(IntTools_CurveRangeSample)
	theRangeV(IntTools_CurveRangeSample)

Returns:
	None

No detailed docstring for this function.") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample (const IntTools_CurveRangeSample & theRangeU,const IntTools_CurveRangeSample & theRangeV);
		%feature("autodoc", "Args:
	Other(IntTools_SurfaceRangeSample)

Returns:
	None

No detailed docstring for this function.") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample (const IntTools_SurfaceRangeSample & Other);
		%feature("autodoc", "Args:
	Other(IntTools_SurfaceRangeSample)

Returns:
	IntTools_SurfaceRangeSample

No detailed docstring for this function.") Assign;
		IntTools_SurfaceRangeSample & Assign (const IntTools_SurfaceRangeSample & Other);
		%feature("autodoc", "Args:
	Other(IntTools_SurfaceRangeSample)

Returns:
	IntTools_SurfaceRangeSample

No detailed docstring for this function.") operator=;
		IntTools_SurfaceRangeSample & operator = (const IntTools_SurfaceRangeSample & Other);
		%feature("autodoc", "Args:
	theRangeU(IntTools_CurveRangeSample)
	theRangeV(IntTools_CurveRangeSample)

Returns:
	None

No detailed docstring for this function.") SetRanges;
		void SetRanges (const IntTools_CurveRangeSample & theRangeU,const IntTools_CurveRangeSample & theRangeV);
		%feature("autodoc", "Args:
	theRangeU(IntTools_CurveRangeSample)
	theRangeV(IntTools_CurveRangeSample)

Returns:
	None

No detailed docstring for this function.") GetRanges;
		void GetRanges (IntTools_CurveRangeSample & theRangeU,IntTools_CurveRangeSample & theRangeV);
		%feature("autodoc", "Args:
	theIndexU(Standard_Integer)
	theIndexV(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetIndexes;
		void SetIndexes (const Standard_Integer theIndexU,const Standard_Integer theIndexV);
		%feature("autodoc", "Args:
	theIndexU(Standard_Integer)
	theIndexV(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GetIndexes;
		void GetIndexes (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	theDepthU(Standard_Integer)
	theDepthV(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GetDepths;
		void GetDepths (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	theRangeSampleU(IntTools_CurveRangeSample)

Returns:
	None

No detailed docstring for this function.") SetSampleRangeU;
		void SetSampleRangeU (const IntTools_CurveRangeSample & theRangeSampleU);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CurveRangeSample

No detailed docstring for this function.") GetSampleRangeU;
		const IntTools_CurveRangeSample & GetSampleRangeU ();
		%feature("autodoc", "Args:
	theRangeSampleV(IntTools_CurveRangeSample)

Returns:
	None

No detailed docstring for this function.") SetSampleRangeV;
		void SetSampleRangeV (const IntTools_CurveRangeSample & theRangeSampleV);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CurveRangeSample

No detailed docstring for this function.") GetSampleRangeV;
		const IntTools_CurveRangeSample & GetSampleRangeV ();
		%feature("autodoc", "Args:
	theIndexU(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetIndexU;
		void SetIndexU (const Standard_Integer theIndexU);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetIndexU;
		Standard_Integer GetIndexU ();
		%feature("autodoc", "Args:
	theIndexV(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetIndexV;
		void SetIndexV (const Standard_Integer theIndexV);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetIndexV;
		Standard_Integer GetIndexV ();
		%feature("autodoc", "Args:
	theDepthU(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetDepthU;
		void SetDepthU (const Standard_Integer theDepthU);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetDepthU;
		Standard_Integer GetDepthU ();
		%feature("autodoc", "Args:
	theDepthV(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetDepthV;
		void SetDepthV (const Standard_Integer theDepthV);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetDepthV;
		Standard_Integer GetDepthV ();
		%feature("autodoc", "Args:
	theFirstU(Standard_Real)
	theLastU(Standard_Real)
	theNbSampleU(Standard_Integer)

Returns:
	IntTools_Range

No detailed docstring for this function.") GetRangeU;
		IntTools_Range GetRangeU (const Standard_Real theFirstU,const Standard_Real theLastU,const Standard_Integer theNbSampleU);
		%feature("autodoc", "Args:
	theFirstV(Standard_Real)
	theLastV(Standard_Real)
	theNbSampleV(Standard_Integer)

Returns:
	IntTools_Range

No detailed docstring for this function.") GetRangeV;
		IntTools_Range GetRangeV (const Standard_Real theFirstV,const Standard_Real theLastV,const Standard_Integer theNbSampleV);
		%feature("autodoc", "Args:
	Other(IntTools_SurfaceRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const IntTools_SurfaceRangeSample & Other);
		%feature("autodoc", "Args:
	theNbSampleU(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetRangeIndexUDeeper;
		Standard_Integer GetRangeIndexUDeeper (const Standard_Integer theNbSampleU);
		%feature("autodoc", "Args:
	theNbSampleV(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetRangeIndexVDeeper;
		Standard_Integer GetRangeIndexVDeeper (const Standard_Integer theNbSampleV);
};


%feature("shadow") IntTools_SurfaceRangeSample::~IntTools_SurfaceRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SurfaceRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SurfaceRangeSampleMapHasher;
class IntTools_SurfaceRangeSampleMapHasher {
	public:
		%feature("autodoc", "Args:
	K(IntTools_SurfaceRangeSample)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

Returns a HasCode value  for  the  Key <K>  in the  
         range 0..Upper.") HashCode;
		static Standard_Integer HashCode (const IntTools_SurfaceRangeSample & K,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	S1(IntTools_SurfaceRangeSample)
	S2(IntTools_SurfaceRangeSample)

Returns:
	static Standard_Boolean

Returns True  when the two  keys are the same. Two  
         same  keys  must   have  the  same  hashcode,  the  
         contrary is not necessary.") IsEqual;
		static Standard_Boolean IsEqual (const IntTools_SurfaceRangeSample & S1,const IntTools_SurfaceRangeSample & S2);
};


%feature("shadow") IntTools_SurfaceRangeSampleMapHasher::~IntTools_SurfaceRangeSampleMapHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SurfaceRangeSampleMapHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Tools;
class IntTools_Tools {
	public:
		%feature("autodoc", "Args:
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	static Standard_Integer

Computes distance between vertex V1 and vertex V2,  
if the distance is less than sum of vertex tolerances  
returns zero,  
otherwise returns negative value") ComputeVV;
		static Standard_Integer ComputeVV (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	aW(TopoDS_Wire)

Returns:
	static Standard_Boolean

Returns True if wire aW contains edges  
with INTERNAL orientation") HasInternalEdge;
		static Standard_Boolean HasInternalEdge (const TopoDS_Wire & aW);
		%feature("autodoc", "Args:
	aW(TopoDS_Wire)
	aF(TopoDS_Face)
	aFNew(TopoDS_Face)

Returns:
	static void

Build a face based on surface of given face aF  
and bounded by wire aW") MakeFaceFromWireAndFace;
		static void MakeFaceFromWireAndFace (const TopoDS_Wire & aW,const TopoDS_Face & aF,TopoDS_Face & aFNew);
		%feature("autodoc", "Args:
	aF(TopoDS_Face)
	P(gp_Pnt2d)

Returns:
	static TopAbs_State

") ClassifyPointByFace;
		static TopAbs_State ClassifyPointByFace (const TopoDS_Face & aF,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	t(Standard_Real)

Returns:
	static Standard_Boolean

Computes square distance between a point on the edge E  
corresponded to parameter t and vertices of edge E.  
Returns True if this distance is less than square  
tolerance of vertex, otherwise returns false.") IsVertex;
		static Standard_Boolean IsVertex (const TopoDS_Edge & E,const Standard_Real t);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	V(TopoDS_Vertex)
	t(Standard_Real)

Returns:
	static Standard_Boolean

Returns True if square distance between vertex V  
and a point on the edge E corresponded to parameter t  
is less than square tolerance of V") IsVertex;
		static Standard_Boolean IsVertex (const TopoDS_Edge & E,const TopoDS_Vertex & V,const Standard_Real t);
		%feature("autodoc", "Args:
	aCmnPrt(IntTools_CommonPrt)

Returns:
	static Standard_Boolean

Returns True if IsVertx for middle parameter of fist range  
and first edge returns True  
and if IsVertex for middle parameter of second range and  
second range returns True,  
otherwise returns False") IsVertex;
		static Standard_Boolean IsVertex (const IntTools_CommonPrt & aCmnPrt);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)

Returns:
	static Standard_Boolean

Gets boundary of parameters of E1 and E2.  
Computes 3d points on each corresponded to average parameters.  
Returns True if distance between computed points is less than  
sum of edge tolerance, otherwise returns False.") IsMiddlePointsEqual;
		static Standard_Boolean IsMiddlePointsEqual (const TopoDS_Edge & E1,const TopoDS_Edge & E2);
		%feature("autodoc", "Args:
	aP(gp_Pnt)
	aTolPV(Standard_Real)
	aV(TopoDS_Vertex)

Returns:
	static Standard_Boolean

Returns True if the distance between point aP and  
vertex aV is less or equal to sum of aTolPV and  
vertex tolerance, otherwise returns False") IsVertex;
		static Standard_Boolean IsVertex (const gp_Pnt & aP,const Standard_Real aTolPV,const TopoDS_Vertex & aV);
		%feature("autodoc", "Args:
	aFirst(Standard_Real)
	aLast(Standard_Real)

Returns:
	static Standard_Real

Returns some value between aFirst and aLast") IntermediatePoint;
		static Standard_Real IntermediatePoint (const Standard_Real aFirst,const Standard_Real aLast);
		%feature("autodoc", "Args:
	aC(IntTools_Curve)
	aS(IntTools_SequenceOfCurves)

Returns:
	static Standard_Integer

Split aC by average parameter if aC is closed in 3D.  
Returns positive value if splitting has been done,  
otherwise returns zero.") SplitCurve;
		static Standard_Integer SplitCurve (const IntTools_Curve & aC,IntTools_SequenceOfCurves & aS);
		%feature("autodoc", "Args:
	aSIn(IntTools_SequenceOfCurves)
	aSOut(IntTools_SequenceOfCurves)

Returns:
	static void

Puts curves from aSIn to aSOut except those curves that  
are coincide with first curve from aSIn.") RejectLines;
		static void RejectLines (const IntTools_SequenceOfCurves & aSIn,IntTools_SequenceOfCurves & aSOut);
		%feature("autodoc", "Args:
	D1(gp_Dir)
	D2(gp_Dir)

Returns:
	static Standard_Boolean

Returns True if D1 and D2 coinside") IsDirsCoinside;
		static Standard_Boolean IsDirsCoinside (const gp_Dir & D1,const gp_Dir & D2);
		%feature("autodoc", "Args:
	D1(gp_Dir)
	D2(gp_Dir)
	aTol(Standard_Real)

Returns:
	static Standard_Boolean

Returns True if D1 and D2 coinside with given tolerance") IsDirsCoinside;
		static Standard_Boolean IsDirsCoinside (const gp_Dir & D1,const gp_Dir & D2,const Standard_Real aTol);
		%feature("autodoc", "Args:
	aC(Handle_Geom_Curve)

Returns:
	static Standard_Boolean

Returns True if aC is BoundedCurve from Geom and  
the distance between first point  
of the curve aC and last point  
is less than 1.e-12") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Geom_Curve & aC);
		%feature("autodoc", "Args:
	aC(Handle_Geom_Curve)
	aTolBase(Standard_Real)

Returns:
	static Standard_Real

Returns adaptive tolerance for given aTolBase  
if aC is trimmed curve and basis curve is parabola,  
otherwise returns value of aTolBase") CurveTolerance;
		static Standard_Real CurveTolerance (const Handle_Geom_Curve & aC,const Standard_Real aTolBase);
};


%feature("shadow") IntTools_Tools::~IntTools_Tools %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Tools {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_TopolTool;
class IntTools_TopolTool : public Adaptor3d_TopolTool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") IntTools_TopolTool;
		 IntTools_TopolTool ();
		%feature("autodoc", "Args:
	theSurface(Handle_Adaptor3d_HSurface)

Returns:
	None

Initializes me by surface") IntTools_TopolTool;
		 IntTools_TopolTool (const Handle_Adaptor3d_HSurface & theSurface);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Redefined empty initializer  
 
 Warning:  
Raises the exception NotImplemented") Initialize;
		virtual void Initialize ();
		%feature("autodoc", "Args:
	theSurface(Handle_Adaptor3d_HSurface)

Returns:
	virtual void

Initializes me by surface") Initialize;
		virtual void Initialize (const Handle_Adaptor3d_HSurface & theSurface);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

") ComputeSamplePoints;
		virtual void ComputeSamplePoints ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Computes the sample-points for the intersections algorithms") NbSamplesU;
		virtual Standard_Integer NbSamplesU ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Computes the sample-points for the intersections algorithms") NbSamplesV;
		virtual Standard_Integer NbSamplesV ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Computes the sample-points for the intersections algorithms") NbSamples;
		virtual Standard_Integer NbSamples ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P2d(gp_Pnt2d)
	P3d(gp_Pnt)

Returns:
	virtual void

Returns a 2d point from surface myS  
and a corresponded 3d point  
for given index.  
The index should be from 1 to NbSamples()") SamplePoint;
		virtual void SamplePoint (const Standard_Integer Index,gp_Pnt2d & P2d,gp_Pnt & P3d);
		%feature("autodoc", "Args:
	theDefl(Standard_Real)
	theNUmin(Standard_Integer)
	theNVmin(Standard_Integer)

Returns:
	virtual void

compute the sample-points for the intersections algorithms  
by adaptive algorithm for BSpline surfaces. For other surfaces algorithm  
is the same as in method ComputeSamplePoints(), but only fill arrays of U  
and V sample parameters;  
theDefl is a requred deflection  
theNUmin, theNVmin are minimal nb points for U and V.") SamplePnts;
		virtual void SamplePnts (const Standard_Real theDefl,const Standard_Integer theNUmin,const Standard_Integer theNVmin);
};


%feature("shadow") IntTools_TopolTool::~IntTools_TopolTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_TopolTool {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_TopolTool {
	Handle_IntTools_TopolTool GetHandle() {
	return *(Handle_IntTools_TopolTool*) &$self;
	}
};

%nodefaultctor Handle_IntTools_TopolTool;
class Handle_IntTools_TopolTool : public Handle_Adaptor3d_TopolTool {

    public:
        // constructors
        Handle_IntTools_TopolTool();
        Handle_IntTools_TopolTool(const Handle_IntTools_TopolTool &aHandle);
        Handle_IntTools_TopolTool(const IntTools_TopolTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_TopolTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_TopolTool {
    IntTools_TopolTool* GetObject() {
    return (IntTools_TopolTool*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_TopolTool::~Handle_IntTools_TopolTool %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_TopolTool {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_CurveRangeSample;
class IntTools_CurveRangeSample : public IntTools_BaseRangeSample {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntTools_CurveRangeSample;
		 IntTools_CurveRangeSample ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntTools_CurveRangeSample;
		 IntTools_CurveRangeSample (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetRangeIndex;
		void SetRangeIndex (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetRangeIndex;
		Standard_Integer GetRangeIndex ();
		%feature("autodoc", "Args:
	Other(IntTools_CurveRangeSample)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const IntTools_CurveRangeSample & Other);
		%feature("autodoc", "Args:
	theFirst(Standard_Real)
	theLast(Standard_Real)
	theNbSample(Standard_Integer)

Returns:
	IntTools_Range

No detailed docstring for this function.") GetRange;
		IntTools_Range GetRange (const Standard_Real theFirst,const Standard_Real theLast,const Standard_Integer theNbSample);
		%feature("autodoc", "Args:
	theNbSample(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetRangeIndexDeeper;
		Standard_Integer GetRangeIndexDeeper (const Standard_Integer theNbSample);
};


%feature("shadow") IntTools_CurveRangeSample::~IntTools_CurveRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_CurveRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
