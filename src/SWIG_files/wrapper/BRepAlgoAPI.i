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
%module (package="OCC") BRepAlgoAPI

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


%include BRepAlgoAPI_headers.i


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
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(brepalgoapi) BRepAlgoAPI;
class BRepAlgoAPI {
	public:
		%feature("compactdefaultargs") DumpOper;
		%feature("autodoc", "	* Check shapes on validity for boolean operation. Dump arguments and result of boolean operation in the file specified by path.

	:param theFilePath:
	:type theFilePath: char *
	:param theShape1:
	:type theShape1: TopoDS_Shape &
	:param theShape2:
	:type theShape2: TopoDS_Shape &
	:param theResult:
	:type theResult: TopoDS_Shape &
	:param theOperation:
	:type theOperation: BOPAlgo_Operation
	:param isNonValidArgs:
	:type isNonValidArgs: bool
	:rtype: void
") DumpOper;
		static void DumpOper (const char * theFilePath,const TopoDS_Shape & theShape1,const TopoDS_Shape & theShape2,const TopoDS_Shape & theResult,const BOPAlgo_Operation theOperation,const Standard_Boolean isNonValidArgs);
};


%nodefaultctor BRepAlgoAPI_BooleanOperation;
class BRepAlgoAPI_BooleanOperation : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "	* Sets the type of Boolean operation to perform It can be BOPAlgo_SECTION  BOPAlgo_COMMON  BOPAlgo_FUSE  BOPAlgo_CUT  BOPAlgo_CUT21

	:param anOp:
	:type anOp: BOPAlgo_Operation
	:rtype: None
") SetOperation;
		void SetOperation (const BOPAlgo_Operation anOp);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Provides the algorithm of Boolean Operations - Filling interference Data Structure (if it is necessary) - Building the result of the operation.

	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", "	* Returns the first shape involved in this Boolean operation.

	:rtype: TopoDS_Shape
") Shape1;
		const TopoDS_Shape  Shape1 ();
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", "	* Returns the second shape involved in this Boolean operation.

	:rtype: TopoDS_Shape
") Shape2;
		const TopoDS_Shape  Shape2 ();
		%feature("compactdefaultargs") Operation;
		%feature("autodoc", "	* Returns the type of Boolean Operation that has been performed.

	:rtype: BOPAlgo_Operation
") Operation;
		BOPAlgo_Operation Operation ();
		%feature("compactdefaultargs") FuseEdges;
		%feature("autodoc", "	* Returns the flag of edge refining

	:rtype: bool
") FuseEdges;
		Standard_Boolean FuseEdges ();
		%feature("compactdefaultargs") RefineEdges;
		%feature("autodoc", "	* Fuse C1 edges

	:rtype: None
") RefineEdges;
		void RefineEdges ();
		%feature("compactdefaultargs") BuilderCanWork;
		%feature("autodoc", "	:rtype: bool
") BuilderCanWork;
		Standard_Boolean BuilderCanWork ();
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "	* Returns the error status of operation. 0 - Ok 1 - The Object is created but Nothing is Done 2 - Null source shapes is not allowed 3 - Check types of the arguments 4 - Can not allocate memory for the DSFiller 5 - The Builder can not work with such types of arguments 6 - Unknown operation is not allowed 7 - Can not allocate memory for the Builder > 100 - See the Builder's ErrorStatus

	:rtype: int
") ErrorStatus;
		Standard_Integer ErrorStatus ();
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Returns the list of shapes modified from the shape <S>.

	:param aS:
	:type aS: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & aS);
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "	* Returns true if the shape S has been deleted. The result shape of the operation does not contain the shape S.

	:param aS:
	:type aS: TopoDS_Shape &
	:rtype: bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & aS);
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns the list of shapes generated from the shape <S>.  For use in BRepNaming.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "	* Returns true if there is at least one modified shape.  For use in BRepNaming.

	:rtype: bool
") HasModified;
		virtual Standard_Boolean HasModified ();
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "	* Returns true if there is at least one generated shape.  For use in BRepNaming.

	:rtype: bool
") HasGenerated;
		virtual Standard_Boolean HasGenerated ();
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "	* Returns true if there is at least one deleted shape.  For use in BRepNaming.

	:rtype: bool
") HasDeleted;
		virtual Standard_Boolean HasDeleted ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") SectionEdges;
		%feature("autodoc", "	* Returns a list of section edges. The edges represent the result of intersection between arguments of Boolean Operation. They are computed during operation execution.

	:rtype: TopTools_ListOfShape
") SectionEdges;
		const TopTools_ListOfShape & SectionEdges ();
};


%nodefaultctor BRepAlgoAPI_Check;
class BRepAlgoAPI_Check {
	public:
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check ();
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "	* Constructor for checking single shape. It calls methods Init(theS, TopoDS_Shape(), BOPAlgo_UNKNOWN, bTestSE, bTestSI) and Perform(). Params: theS - the shape that should be checked; bTestSE - flag that specifies whether check on small edges  should be performed; by default it is set to True; bTestSI - flag that specifies whether check on self-interference  should be performed; by default it is set to True;

	:param theS:
	:type theS: TopoDS_Shape &
	:param bTestSE: default value is Standard_True
	:type bTestSE: bool
	:param bTestSI: default value is Standard_True
	:type bTestSI: bool
	:rtype: None
") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check (const TopoDS_Shape & theS,const Standard_Boolean bTestSE = Standard_True,const Standard_Boolean bTestSI = Standard_True);
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "	* Constructor for couple of shapes. It calls methods Init(theS1, theS2, theOp, bTestSE, bTestSI) and Perform(). Params: theS1, theS2 - the initial shapes. theOp - the type of Boolean Operation; if it is not defined (set to UNKNOWN) for each shape performed check as for single shape. bTestSE - flag that specifies whether check on small edges  should be performed; by default it is set to True; bTestSI - flag that specifies whether check on self-interference  should be performed; by default it is set to True;

	:param theS1:
	:type theS1: TopoDS_Shape &
	:param theS2:
	:type theS2: TopoDS_Shape &
	:param theOp: default value is BOPAlgo_UNKNOWN
	:type theOp: BOPAlgo_Operation
	:param bTestSE: default value is Standard_True
	:type bTestSE: bool
	:param bTestSI: default value is Standard_True
	:type bTestSI: bool
	:rtype: None
") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check (const TopoDS_Shape & theS1,const TopoDS_Shape & theS2,const BOPAlgo_Operation theOp = BOPAlgo_UNKNOWN,const Standard_Boolean bTestSE = Standard_True,const Standard_Boolean bTestSI = Standard_True);
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "	* Sets data for check by Init method. The method provides alternative way for checking single shape.

	:param theS:
	:type theS: TopoDS_Shape &
	:param bTestSE: default value is Standard_True
	:type bTestSE: bool
	:param bTestSI: default value is Standard_True
	:type bTestSI: bool
	:rtype: None
") SetData;
		void SetData (const TopoDS_Shape & theS,const Standard_Boolean bTestSE = Standard_True,const Standard_Boolean bTestSI = Standard_True);
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "	* Sets data for check by Init method. The method provides alternative way for checking couple of shapes.

	:param theS1:
	:type theS1: TopoDS_Shape &
	:param theS2:
	:type theS2: TopoDS_Shape &
	:param theOp: default value is BOPAlgo_UNKNOWN
	:type theOp: BOPAlgo_Operation
	:param bTestSE: default value is Standard_True
	:type bTestSE: bool
	:param bTestSI: default value is Standard_True
	:type bTestSI: bool
	:rtype: None
") SetData;
		void SetData (const TopoDS_Shape & theS1,const TopoDS_Shape & theS2,const BOPAlgo_Operation theOp = BOPAlgo_UNKNOWN,const Standard_Boolean bTestSE = Standard_True,const Standard_Boolean bTestSI = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the check.

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Shows whether shape(s) valid or not.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Returns faulty shapes.

	:rtype: BOPAlgo_ListOfCheckResult
") Result;
		const BOPAlgo_ListOfCheckResult & Result ();
};


%nodefaultctor BRepAlgoAPI_Common;
class BRepAlgoAPI_Common : public BRepAlgoAPI_BooleanOperation {
	public:
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "	* Constructs a common part for shapes aS1 and aS2 .

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param aDSF:
	:type aDSF: BOPAlgo_PaveFiller &
	:rtype: None
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const BOPAlgo_PaveFiller & aDSF);
};


%nodefaultctor BRepAlgoAPI_Cut;
class BRepAlgoAPI_Cut : public BRepAlgoAPI_BooleanOperation {
	public:
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "	* Shape aS2 cuts shape aS1. The resulting shape is a new shape produced by the cut operation.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "	* Constructs a new shape cut from shape aS1 by shape aS2 using aDSFiller (see BRepAlgoAPI_BooleanOperation Constructor).

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param aDSF:
	:type aDSF: BOPAlgo_PaveFiller &
	:param bFWD: default value is Standard_True
	:type bFWD: bool
	:rtype: None
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const BOPAlgo_PaveFiller & aDSF,const Standard_Boolean bFWD = Standard_True);
};


%nodefaultctor BRepAlgoAPI_Fuse;
class BRepAlgoAPI_Fuse : public BRepAlgoAPI_BooleanOperation {
	public:
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "	* Constructs a fuse of shapes aS1 and aS2.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "	* Constructs a new shape that is a fuse of shapes aS1 and aS2 using aDSFiller.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param aDSF:
	:type aDSF: BOPAlgo_PaveFiller &
	:rtype: None
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const BOPAlgo_PaveFiller & aDSF);
};


%nodefaultctor BRepAlgoAPI_Section;
class BRepAlgoAPI_Section : public BRepAlgoAPI_BooleanOperation {
	public:
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param aDSF:
	:type aDSF: BOPAlgo_PaveFiller &
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const BOPAlgo_PaveFiller & aDSF,const Standard_Boolean PerformNow = Standard_True);
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "	* see upper

	:param Sh1:
	:type Sh1: TopoDS_Shape &
	:param Sh2:
	:type Sh2: TopoDS_Shape &
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const TopoDS_Shape & Sh1,const TopoDS_Shape & Sh2,const Standard_Boolean PerformNow = Standard_True);
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "	* see upper

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param Pl:
	:type Pl: gp_Pln
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const TopoDS_Shape & Sh,const gp_Pln & Pl,const Standard_Boolean PerformNow = Standard_True);
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "	* see upper

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param Sf:
	:type Sf: Handle_Geom_Surface &
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const TopoDS_Shape & Sh,const Handle_Geom_Surface & Sf,const Standard_Boolean PerformNow = Standard_True);
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "	* see upper

	:param Sf:
	:type Sf: Handle_Geom_Surface &
	:param Sh:
	:type Sh: TopoDS_Shape &
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const Handle_Geom_Surface & Sf,const TopoDS_Shape & Sh,const Standard_Boolean PerformNow = Standard_True);
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "	* This and the above classes construct a framework for computing the section lines of: - two shapes Sh1 and Sh2, or - shape Sh and plane Pl, or - shape Sh and surface Sf, or - surface Sf and shape Sh, or - two surfaces Sf1 and Sf2, and builds a result if PerformNow equals true, its default value. If PerformNow equals false, the intersection will be computed later by the function Build. The constructed shape will be returned by the function Shape. This is a compound object composed of edges. These intersection edges may be built: - on new intersection lines, or - on coincident portions of edges in the two intersected shapes. These intersection edges are independent: they are not chained or grouped in wires. If no intersection edge exists, the result is an empty compound object. Note that other objects than TopoDS_Shape shapes involved in these syntaxes are converted into faces or shells before performing the computation of the intersection. A shape resulting from this conversion can be retrieved with the function Shape1 or Shape2. Parametric 2D curves on intersection edges No parametric 2D curve (pcurve) is defined for each elementary edge of the result. To attach such parametric curves to the constructed edges you may use a constructor with the PerformNow flag equal to false; then you use: - the function ComputePCurveOn1 to ask for the additional computation of a pcurve in the parametric space of the first shape, - the function ComputePCurveOn2 to ask for the additional computation of a pcurve in the parametric space of the second shape, in the end, - the function Build to construct the result. Approximation of intersection edges The underlying 3D geometry attached to each elementary edge of the result is: - analytic where possible, provided the corresponding geometry corresponds to a type of analytic curve defined in the Geom package; for example, the intersection of a cylindrical shape with a plane gives an ellipse or a circle; - or elsewhere, given as a succession of points grouped together in a BSpline curve of degree 1. If you prefer to have an attached 3D geometry which is a BSpline approximation of the computed set of points on computed elementary intersection edges whose underlying geometry is not analytic, you may use a constructor with the PerformNow flag equal to false. Then you use: - the function Approximation to ask for this computation option, and - the function Build to construct the result. - Note that as a result, approximations will only be computed on edges built on new intersection lines. - Example You may also combine these computation options. In the following example: - each elementary edge of the computed intersection, built on a new intersection line, which does not correspond to an analytic Geom curve, will be approximated by a BSpline curve whose degree is not greater than 8. - each elementary edge built on a new intersection line, will have: - a pcurve in the parametric space of the intersected face of shape S1, - no pcurve in the parametric space of the intersected face of shape S2. // TopoDS_Shape S1 = ... , S2 = ... ; Standard_Boolean PerformNow = Standard_False; BRepAlgoAPI_Section S ( S1, S2, PerformNow ); S.ComputePCurveOn1 (Standard_True); S.Approximation (Standard_True); S.Build(); TopoDS_Shape R = S.Shape();

	:param Sf1:
	:type Sf1: Handle_Geom_Surface &
	:param Sf2:
	:type Sf2: Handle_Geom_Surface &
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const Handle_Geom_Surface & Sf1,const Handle_Geom_Surface & Sf2,const Standard_Boolean PerformNow = Standard_True);
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "	* initialize first part

	:param S1:
	:type S1: TopoDS_Shape &
	:rtype: None
") Init1;
		void Init1 (const TopoDS_Shape & S1);
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "	* initialize first part

	:param Pl:
	:type Pl: gp_Pln
	:rtype: None
") Init1;
		void Init1 (const gp_Pln & Pl);
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "	* initialize first part

	:param Sf:
	:type Sf: Handle_Geom_Surface &
	:rtype: None
") Init1;
		void Init1 (const Handle_Geom_Surface & Sf);
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "	* initialize second part

	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") Init2;
		void Init2 (const TopoDS_Shape & S2);
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "	* initialize second part

	:param Pl:
	:type Pl: gp_Pln
	:rtype: None
") Init2;
		void Init2 (const gp_Pln & Pl);
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "	* Reinitializes the first and the second parts on which this algorithm is going to perform the intersection computation. This is done with either: the surface Sf, the plane Pl or the shape Sh. You use the function Build to construct the result.

	:param Sf:
	:type Sf: Handle_Geom_Surface &
	:rtype: None
") Init2;
		void Init2 (const Handle_Geom_Surface & Sf);
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "	* Defines an option for computation of further intersections. This computation will be performed by the function Build in this framework. By default, the underlying 3D geometry attached to each elementary edge of the result of a computed intersection is: - analytic where possible, provided the corresponding geometry corresponds to a type of analytic curve defined in the Geom package; for example the intersection of a cylindrical shape with a plane gives an ellipse or a circle; - or elsewhere, given as a succession of points grouped together in a BSpline curve of degree 1. If Approx equals true, when further computations are performed in this framework with the function Build, these edges will have an attached 3D geometry which is a BSpline approximation of the computed set of points. Note that as a result, approximations will be computed on edges built only on new intersection lines.

	:param B:
	:type B: bool
	:rtype: None
") Approximation;
		void Approximation (const Standard_Boolean B);
		%feature("compactdefaultargs") ComputePCurveOn1;
		%feature("autodoc", "	* Indicates if the Pcurve must be (or not) performed on first part.

	:param B:
	:type B: bool
	:rtype: None
") ComputePCurveOn1;
		void ComputePCurveOn1 (const Standard_Boolean B);
		%feature("compactdefaultargs") ComputePCurveOn2;
		%feature("autodoc", "	* Define options for the computation of further intersections, which will be performed by the function Build in this framework. By default, no parametric 2D curve (pcurve) is defined for the elementary edges of the result. If ComputePCurve1 equals true, further computations performed in this framework with the function Build will attach an additional pcurve in the parametric space of the first shape to the constructed edges. If ComputePCurve2 equals true, the additional pcurve will be attached to the constructed edges in the parametric space of the second shape. These two functions may be used together.

	:param B:
	:type B: bool
	:rtype: None
") ComputePCurveOn2;
		void ComputePCurveOn2 (const Standard_Boolean B);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Performs the computation of section lines between two parts defined at the time of construction of this framework or reinitialized with the Init1 and Init2 functions. The constructed shape will be returned by the function Shape. This is a compound object composed of edges. These intersection edges may be built: - on new intersection lines, or - on coincident portions of edges in the two intersected shapes. These intersection edges are independent: they are not chained or grouped into wires. If no intersection edge exists, the result is an empty compound object. The shapes involved in the construction of section lines can be retrieved with the function Shape1 or Shape2. Note that other objects than TopoDS_Shape shapes given as arguments at the construction time of this framework, or to the Init1 or Init2 function, are converted into faces or shells before performing the computation of the intersection. Parametric 2D curves on intersection edges No parametric 2D curve (pcurve) is defined for the elementary edges of the result. To attach parametric curves like this to the constructed edges you have to use: - the function ComputePCurveOn1 to ask for the additional computation of a pcurve in the parametric space of the first shape, - the function ComputePCurveOn2 to ask for the additional computation of a pcurve in the parametric space of the second shape. This must be done before calling this function. Approximation of intersection edges The underlying 3D geometry attached to each elementary edge of the result is: - analytic (where possible) provided the corresponding geometry corresponds to a type of analytic curve defined in the Geom package; for example, the intersection of a cylindrical shape with a plane gives an ellipse or a circle; or - elsewhere, given as a succession of points grouped together in a BSpline curve of degree 1. If, on computed elementary intersection edges whose underlying geometry is not analytic, you prefer to have an attached 3D geometry which is a Bspline approximation of the computed set of points, you have to use the function Approximation to ask for this computation option before calling this function. You may also have combined these computation options: look at the example given above to illustrate the use of the constructors.

	:rtype: None
") Build;
		void Build ();
		%feature("compactdefaultargs") HasAncestorFaceOn1;
		%feature("autodoc", "	* get the face of the first part giving section edge <E>. Returns True on the 3 following conditions : 1/ <E> is an edge returned by the Shape() method. 2/ First part of section performed is a shape. 3/ <E> is built on a intersection curve (i.e <E> 	 is not the result of common edges) When False, F remains untouched.

	:param E:
	:type E: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Shape &
	:rtype: bool
") HasAncestorFaceOn1;
		Standard_Boolean HasAncestorFaceOn1 (const TopoDS_Shape & E,TopoDS_Shape & F);
		%feature("compactdefaultargs") HasAncestorFaceOn2;
		%feature("autodoc", "	* Identifies the ancestor faces of the intersection edge E resulting from the last computation performed in this framework, that is, the faces of the two original shapes on which the edge E lies: - HasAncestorFaceOn1 gives the ancestor face in the first shape, and - HasAncestorFaceOn2 gives the ancestor face in the second shape. These functions return true if an ancestor face F is found, or false if not. An ancestor face is identifiable for the edge E if the following conditions are satisfied: - the first part on which this algorithm performed its last computation is a shape, that is, it was not given as a surface or a plane at the time of construction of this algorithm or at a later time by the Init1 function, - E is one of the elementary edges built by the last computation of this section algorithm. To use these functions properly, you have to test the returned Boolean value before using the ancestor face: F is significant only if the returned Boolean value equals true.

	:param E:
	:type E: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Shape &
	:rtype: bool
") HasAncestorFaceOn2;
		Standard_Boolean HasAncestorFaceOn2 (const TopoDS_Shape & E,TopoDS_Shape & F);
};


