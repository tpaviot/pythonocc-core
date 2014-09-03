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
%module (package="OCC") BRepAlgoAPI

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

%include BRepAlgoAPI_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(brepalgoapi) BRepAlgoAPI;
%nodefaultctor BRepAlgoAPI;
class BRepAlgoAPI {
	public:
		%feature("autodoc", "Args:
	theFilePath(char *)
	theShape1(TopoDS_Shape)
	theShape2(TopoDS_Shape)
	theResult(TopoDS_Shape)
	theOperation(BOPAlgo_Operation)
	isNonValidArgs(Standard_Boolean)

Returns:
	static void

Check shapes on validity for boolean  
operation.  Dump arguments and result of boolean operation in the file specified by path.") DumpOper;
		static void DumpOper (const char * theFilePath,const TopoDS_Shape & theShape1,const TopoDS_Shape & theShape2,const TopoDS_Shape & theResult,const BOPAlgo_Operation theOperation,const Standard_Boolean isNonValidArgs);
};


%feature("shadow") BRepAlgoAPI::~BRepAlgoAPI %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgoAPI {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgoAPI_BooleanOperation;
class BRepAlgoAPI_BooleanOperation : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	anOp(BOPAlgo_Operation)

Returns:
	None

Sets the type of Boolean operation to perform  
         It can be BOPAlgo_SECTION  
                   BOPAlgo_COMMON  
                   BOPAlgo_FUSE  
                   BOPAlgo_CUT  
                   BOPAlgo_CUT21") SetOperation;
		void SetOperation (const BOPAlgo_Operation anOp);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Provides the algorithm of Boolean Operations  
-      Filling interference Data Structure (if it is necessary)  
-      Building the result of the operation.") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the first shape involved in this Boolean operation.") Shape1;
		const TopoDS_Shape & Shape1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the second shape involved in this Boolean operation.") Shape2;
		const TopoDS_Shape & Shape2 ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPAlgo_Operation

Returns the type of Boolean Operation that has been performed.") Operation;
		BOPAlgo_Operation Operation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the flag of edge refining") FuseEdges;
		Standard_Boolean FuseEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Fuse C1 edges") RefineEdges;
		void RefineEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") BuilderCanWork;
		Standard_Boolean BuilderCanWork ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the error status of operation.  
0 - Ok  
1 - The Object is created but Nothing is Done  
2 - Null source shapes is not allowed  
3 - Check types of the arguments  
4 - Can not allocate memory for the DSFiller  
5 - The Builder can not work with such types of arguments  
6 - Unknown operation is not allowed  
7 - Can not allocate memory for the Builder  
 > 100 - See the Builder's  ErrorStatus") ErrorStatus;
		Standard_Integer ErrorStatus ();
		%feature("autodoc", "Args:
	aS(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the list  of shapes modified from the shape <S>.") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & aS);
		%feature("autodoc", "Args:
	aS(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

Returns true if the shape S has been deleted. The  
result shape of the operation does not contain the shape S.") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & aS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns the list  of shapes generated from the shape <S>.  
        For use in BRepNaming.") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if there is at least one modified shape.  
        For use in BRepNaming.") HasModified;
		virtual Standard_Boolean HasModified ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if there is at least one generated shape.  
        For use in BRepNaming.") HasGenerated;
		virtual Standard_Boolean HasGenerated ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if there is at least one deleted shape.  
        For use in BRepNaming.") HasDeleted;
		virtual Standard_Boolean HasDeleted ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns a list of section edges.  
The edges represent the result of intersection between arguments of  
Boolean Operation. They are computed during operation execution.") SectionEdges;
		const TopTools_ListOfShape & SectionEdges ();
};


%feature("shadow") BRepAlgoAPI_BooleanOperation::~BRepAlgoAPI_BooleanOperation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgoAPI_BooleanOperation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgoAPI_Check;
class BRepAlgoAPI_Check {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check ();
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)
	bTestSE(Standard_Boolean)=Standard_True
	bTestSI(Standard_Boolean)=Standard_True

Returns:
	None

Constructor for checking single shape.  
It calls methods  
Init(theS, TopoDS_Shape(), BOPAlgo_UNKNOWN, bTestSE, bTestSI)  
and Perform().  
Params:  
 theS   - the shape that should be checked;  
 bTestSE - flag that specifies whether check on small edges  
           should be performed; by default it is set to TRUE;  
 bTestSI - flag that specifies whether check on self-interference  
           should be performed; by default it is set to TRUE;") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check (const TopoDS_Shape & theS,const Standard_Boolean bTestSE = Standard_True,const Standard_Boolean bTestSI = Standard_True);
		%feature("autodoc", "Args:
	theS1(TopoDS_Shape)
	theS2(TopoDS_Shape)
	theOp(BOPAlgo_Operation)=BOPAlgo_UNKNOWN
	bTestSE(Standard_Boolean)=Standard_True
	bTestSI(Standard_Boolean)=Standard_True

Returns:
	None

Constructor for couple of shapes.  
It calls methods  
Init(theS1, theS2, theOp, bTestSE, bTestSI) and Perform().  
Params:  
 theS1, theS2 - the initial shapes.  
 theOp - the type of Boolean Operation;  
         if it is not defined (set to UNKNOWN) for each shape  
         performed check as for single shape.  
 bTestSE - flag that specifies whether check on small edges  
           should be performed; by default it is set to TRUE;  
 bTestSI - flag that specifies whether check on self-interference  
           should be performed; by default it is set to TRUE;") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check (const TopoDS_Shape & theS1,const TopoDS_Shape & theS2,const BOPAlgo_Operation theOp = BOPAlgo_UNKNOWN,const Standard_Boolean bTestSE = Standard_True,const Standard_Boolean bTestSI = Standard_True);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)
	bTestSE(Standard_Boolean)=Standard_True
	bTestSI(Standard_Boolean)=Standard_True

Returns:
	None

Sets data for check by Init method.  
The method provides alternative way for checking single shape.") SetData;
		void SetData (const TopoDS_Shape & theS,const Standard_Boolean bTestSE = Standard_True,const Standard_Boolean bTestSI = Standard_True);
		%feature("autodoc", "Args:
	theS1(TopoDS_Shape)
	theS2(TopoDS_Shape)
	theOp(BOPAlgo_Operation)=BOPAlgo_UNKNOWN
	bTestSE(Standard_Boolean)=Standard_True
	bTestSI(Standard_Boolean)=Standard_True

Returns:
	None

Sets data for check by Init method.  
The method provides alternative way for checking couple of shapes.") SetData;
		void SetData (const TopoDS_Shape & theS1,const TopoDS_Shape & theS2,const BOPAlgo_Operation theOp = BOPAlgo_UNKNOWN,const Standard_Boolean bTestSE = Standard_True,const Standard_Boolean bTestSI = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

Performs the check.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Shows whether shape(s) valid or not.") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPAlgo_ListOfCheckResult

Returns faulty shapes.") Result;
		const BOPAlgo_ListOfCheckResult & Result ();
};


%feature("shadow") BRepAlgoAPI_Check::~BRepAlgoAPI_Check %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgoAPI_Check {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgoAPI_Common;
class BRepAlgoAPI_Common : public BRepAlgoAPI_BooleanOperation {
	public:
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

Constructs a common part for shapes aS1 and aS2 .") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	aDSF(BOPAlgo_PaveFiller)

Returns:
	None

No detailed docstring for this function.") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const BOPAlgo_PaveFiller & aDSF);
};


%feature("shadow") BRepAlgoAPI_Common::~BRepAlgoAPI_Common %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgoAPI_Common {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgoAPI_Cut;
class BRepAlgoAPI_Cut : public BRepAlgoAPI_BooleanOperation {
	public:
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

Shape aS2 cuts shape aS1. The  
resulting shape is a new shape produced by the cut operation.") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	aDSF(BOPAlgo_PaveFiller)
	bFWD(Standard_Boolean)=Standard_True

Returns:
	None

Constructs a new shape cut from  
shape aS1 by shape aS2 using aDSFiller (see  
BRepAlgoAPI_BooleanOperation Constructor).") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const BOPAlgo_PaveFiller & aDSF,const Standard_Boolean bFWD = Standard_True);
};


%feature("shadow") BRepAlgoAPI_Cut::~BRepAlgoAPI_Cut %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgoAPI_Cut {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgoAPI_Fuse;
class BRepAlgoAPI_Fuse : public BRepAlgoAPI_BooleanOperation {
	public:
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

Constructs a fuse of shapes aS1 and aS2.") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	aDSF(BOPAlgo_PaveFiller)

Returns:
	None

Constructs a new shape that is a fuse of shapes aS1 and aS2 using aDSFiller.") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const BOPAlgo_PaveFiller & aDSF);
};


%feature("shadow") BRepAlgoAPI_Fuse::~BRepAlgoAPI_Fuse %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgoAPI_Fuse {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAlgoAPI_Section;
class BRepAlgoAPI_Section : public BRepAlgoAPI_BooleanOperation {
	public:
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	aDSF(BOPAlgo_PaveFiller)
	PerformNow(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const BOPAlgo_PaveFiller & aDSF,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "Args:
	Sh1(TopoDS_Shape)
	Sh2(TopoDS_Shape)
	PerformNow(Standard_Boolean)=Standard_True

Returns:
	None

see upper") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const TopoDS_Shape & Sh1,const TopoDS_Shape & Sh2,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)
	Pl(gp_Pln)
	PerformNow(Standard_Boolean)=Standard_True

Returns:
	None

see upper") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const TopoDS_Shape & Sh,const gp_Pln & Pl,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)
	Sf(Handle_Geom_Surface)
	PerformNow(Standard_Boolean)=Standard_True

Returns:
	None

see upper") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const TopoDS_Shape & Sh,const Handle_Geom_Surface & Sf,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "Args:
	Sf(Handle_Geom_Surface)
	Sh(TopoDS_Shape)
	PerformNow(Standard_Boolean)=Standard_True

Returns:
	None

see upper") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const Handle_Geom_Surface & Sf,const TopoDS_Shape & Sh,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "Args:
	Sf1(Handle_Geom_Surface)
	Sf2(Handle_Geom_Surface)
	PerformNow(Standard_Boolean)=Standard_True

Returns:
	None

This and the above classes construct a framework for  
computing the section lines of:  
-       two shapes Sh1 and Sh2, or  
-       shape Sh and plane Pl,  or  
-       shape Sh and surface Sf, or  
-       surface Sf and shape Sh, or  
-       two surfaces Sf1 and Sf2,  
  and builds a result if PerformNow equals true, its  
default value. If PerformNow equals false, the intersection  
will be computed later by the function Build.  
 The constructed shape will be returned by the function Shape.  
This is a compound object composed of edges. These  
intersection edges may be built:  
-      on new intersection lines, or  
-      on coincident portions of edges in the two intersected    shapes.  
  These intersection edges are independent: they are not  
chained or grouped in wires. If no intersection edge exists, the  
result is an empty compound object.  
Note that other objects than TopoDS_Shape shapes involved in  
these syntaxes are converted into faces or shells before  
performing the computation of the intersection. A shape  
resulting from this conversion can be retrieved with the  
function Shape1 or Shape2.  
Parametric 2D curves on intersection edges  
No parametric 2D curve (pcurve) is defined for each elementary  
edge of the result. To attach such parametric curves to the  
constructed edges you may use a constructor with the PerformNow  
flag equal to false; then you use:  
-      the function ComputePCurveOn1 to ask for  
   the additional computation of a pcurve in the parametric  
   space of the first shape,  
-      the function ComputePCurveOn2 to ask for  
   the additional computation of a pcurve in the parametric  
   space of the second shape, in the end,  
-      the function Build to construct the result.  
  Approximation of intersection edges  
  The underlying 3D geometry attached to each elementary edge  
of the result is:  
-       analytic where possible, provided the corresponding  
   geometry corresponds to a type of analytic curve  
   defined in the Geom package; for example, the intersection  
   of a cylindrical shape with a plane gives an ellipse or a    circle;  
-       or elsewhere, given as a succession of points grouped  
   together in a BSpline curve of degree 1.  
If you prefer to have an attached 3D geometry which is a  
BSpline approximation of the computed set of points on  
computed elementary intersection edges whose underlying geometry  
is not analytic, you may use a constructor with the PerformNow  
flag equal to false. Then you use:  
-      the function Approximation to ask for this  
   computation option, and  
-      the function Build to construct the result.  
-      Note that as a result, approximations will only be  
   computed on edges built on new intersection lines.  
-      Example  
You may also combine these computation options. In the following example:  
- each elementary edge of the computed intersection,  
  built on a new intersection line, which does not  
 correspond to an analytic Geom curve, will be approximated by  
  a BSpline curve whose degree is not greater than 8.  
- each elementary edge built on a new intersection line, will have:  
- a pcurve in the parametric space of the intersected face of shape S1,  
- no pcurve in the parametric space of the intersected face of shape S2.  
      // TopoDS_Shape S1 = ... , S2 = ... ;  
Standard_Boolean PerformNow = Standard_False;  
BRepAlgoAPI_Section S ( S1, S2, PerformNow );  
S.ComputePCurveOn1 (Standard_True);  
S.Approximation (Standard_True);  
S.Build();  
TopoDS_Shape R = S.Shape();") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const Handle_Geom_Surface & Sf1,const Handle_Geom_Surface & Sf2,const Standard_Boolean PerformNow = Standard_True);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)

Returns:
	None

initialize first part") Init1;
		void Init1 (const TopoDS_Shape & S1);
		%feature("autodoc", "Args:
	Pl(gp_Pln)

Returns:
	None

initialize first part") Init1;
		void Init1 (const gp_Pln & Pl);
		%feature("autodoc", "Args:
	Sf(Handle_Geom_Surface)

Returns:
	None

initialize first part") Init1;
		void Init1 (const Handle_Geom_Surface & Sf);
		%feature("autodoc", "Args:
	S2(TopoDS_Shape)

Returns:
	None

initialize second part") Init2;
		void Init2 (const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	Pl(gp_Pln)

Returns:
	None

initialize second part") Init2;
		void Init2 (const gp_Pln & Pl);
		%feature("autodoc", "Args:
	Sf(Handle_Geom_Surface)

Returns:
	None

Reinitializes the first and the  
second parts on which this algorithm is going to perform  
the intersection computation. This is done with either: the  
surface Sf, the plane Pl or the shape Sh.  
You use the function Build to construct the result.") Init2;
		void Init2 (const Handle_Geom_Surface & Sf);
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

Defines an option for computation  
of further intersections. This computation will be performed by  
the function Build in this framework.  
By default, the underlying 3D geometry attached to each  
elementary edge of the result of a computed intersection is:  
- analytic where possible, provided the corresponding  
   geometry corresponds to a type of analytic curve defined in  
   the Geom package; for example the intersection of a  
   cylindrical shape with a plane gives an ellipse or a circle;  
-      or elsewhere, given as a succession of points grouped  
together in a BSpline curve of degree 1. If Approx equals  
true, when further computations are performed in this framework  
with the function Build, these edges will have an attached 3D  
   geometry which is a BSpline approximation of the computed  
   set of points.  
  Note that as a result, approximations will be computed  
on edges built only on new intersection lines.") Approximation;
		void Approximation (const Standard_Boolean B);
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

Indicates if the Pcurve must be (or not) performed on first part.") ComputePCurveOn1;
		void ComputePCurveOn1 (const Standard_Boolean B);
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

Define options for the computation of further  
intersections, which will be performed by the function Build  
in this framework.  
By default, no parametric 2D curve (pcurve) is defined for the  
elementary edges of the result. If ComputePCurve1 equals true,  
further computations performed in this framework with the function  
Build will attach an additional pcurve in the parametric space of  
the first shape to the constructed edges.  
If ComputePCurve2 equals true, the additional pcurve will be  
attached to the constructed edges in the parametric space of the  
second shape.  
These two functions may be used together.") ComputePCurveOn2;
		void ComputePCurveOn2 (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	None

Performs the computation of  
section lines between two parts defined at the time of  
construction of this framework or reinitialized with the Init1 and  
Init2 functions.  
The constructed shape will be returned by the function Shape.  
This is a compound object composed of edges. These  
intersection edges may be built:  
-      on new intersection lines, or  
-      on coincident portions of edges in the two intersected shapes.  
These intersection edges are independent: they are not chained  
or grouped into wires.  
If no intersection edge exists, the result is an empty compound object.  
The shapes involved in the construction of section lines can  
be retrieved with the function Shape1 or Shape2. Note that other  
objects than TopoDS_Shape shapes given as arguments at the  
construction time of this framework, or to the Init1 or  
Init2 function, are converted into faces or shells before  
performing the computation of the intersection.  
Parametric 2D curves on intersection edges  
No parametric 2D curve (pcurve) is defined for the elementary  
edges of the result. To attach parametric curves like this to  
the constructed edges you have to use:  
-      the function  
ComputePCurveOn1 to ask for the additional computation of a  
pcurve in the parametric space of the first shape,  
-      the function  
   ComputePCurveOn2 to ask for the additional computation of a  
   pcurve in the parametric space of the second shape.  
This must be done before calling this function.  
  Approximation of intersection edges  
The underlying 3D geometry attached to each elementary edge of the result is:  
-      analytic (where possible) provided the corresponding  
geometry corresponds to a type of analytic curve defined in  
   the Geom package; for example, the intersection of a  
   cylindrical shape with a plane gives an ellipse or a circle;    or  
-      elsewhere, given as a succession of points grouped  
   together in a BSpline curve of degree 1.  
  If, on computed elementary intersection edges whose  
underlying geometry is not analytic, you prefer to have an  
attached 3D geometry which is a Bspline approximation of the  
computed set of points, you have to use the function Approximation  
to ask for this computation option before calling this function.  
You may also have combined these computation options: look at the  
example given above to illustrate the use of the constructors.") Build;
		void Build ();
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	F(TopoDS_Shape)

Returns:
	Standard_Boolean

get the face of the first part giving section edge <E>.  
Returns True on the 3 following conditions :  
1/ <E> is an edge returned by the Shape() method.  
2/ First part of section performed is a shape.  
3/ <E> is built on a intersection curve (i.e <E>  
	 is not the result of common edges)  
When False, F remains untouched.") HasAncestorFaceOn1;
		Standard_Boolean HasAncestorFaceOn1 (const TopoDS_Shape & E,TopoDS_Shape & F);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	F(TopoDS_Shape)

Returns:
	Standard_Boolean

Identifies the ancestor faces of  
the intersection edge E resulting from the last  
computation performed in this framework, that is, the faces of  
the two original shapes on which the edge E lies:  
-      HasAncestorFaceOn1 gives the ancestor face in the first shape, and  
-      HasAncestorFaceOn2 gives the ancestor face in the second shape.  
  These functions return true if an ancestor face F is found, or false if not.  
  An ancestor face is identifiable for the edge E if the following  
conditions are satisfied:  
-  the first part on which this algorithm performed its  
   last computation is a shape, that is, it was not given as  
a surface or a plane at the time of construction of this  
algorithm or at a later time by the Init1 function,  
- E is one of the elementary edges built by the  
last computation of this section algorithm.  
To use these functions properly, you have to test the returned  
Boolean value before using the ancestor face: F is significant  
only if the returned Boolean value equals true.") HasAncestorFaceOn2;
		Standard_Boolean HasAncestorFaceOn2 (const TopoDS_Shape & E,TopoDS_Shape & F);
};


%feature("shadow") BRepAlgoAPI_Section::~BRepAlgoAPI_Section %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAlgoAPI_Section {
	void _kill_pointed() {
		delete $self;
	}
};
