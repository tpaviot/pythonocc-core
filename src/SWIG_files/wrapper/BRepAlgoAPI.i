/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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

%nodefaultctor BRepAlgoAPI_Algo;
%ignore BRepAlgoAPI_Algo::~BRepAlgoAPI_Algo();
class BRepAlgoAPI_Algo : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "	* Returns error status of the algorithm ==0 - no errors occured !=0 - is in the event of various error conditions

	:rtype: int
") ErrorStatus;
		Standard_Integer ErrorStatus ();
		%feature("compactdefaultargs") WarningStatus;
		%feature("autodoc", "	* Returns warning status of the algorithm ==0 - no warning occured !=0 - is in the event of various warning conditions

	:rtype: int
") WarningStatus;
		Standard_Integer WarningStatus ();
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "	:rtype: BOPCol_BaseAllocator
") Allocator;
		const BOPCol_BaseAllocator & Allocator ();
		%feature("compactdefaultargs") SetRunParallel;
		%feature("autodoc", "	* Set the flag of parallel processing if <theFlag> is true the parallel processing is switched on if <theFlag> is false the parallel processing is switched off

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetRunParallel;
		void SetRunParallel (const Standard_Boolean theFlag);
		%feature("compactdefaultargs") RunParallel;
		%feature("autodoc", "	* Returns the flag of parallel processing

	:rtype: bool
") RunParallel;
		Standard_Boolean RunParallel ();
		%feature("compactdefaultargs") SetProgressIndicator;
		%feature("autodoc", "	* Set the Progress Indicator object.

	:param theObj:
	:type theObj: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgressIndicator;
		void SetProgressIndicator (const Handle_Message_ProgressIndicator & theObj);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		virtual const TopoDS_Shape  Shape ();
};


%extend BRepAlgoAPI_Algo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepAlgoAPI_BuilderAlgo;
class BRepAlgoAPI_BuilderAlgo : public BRepAlgoAPI_Algo {
	public:
		%feature("compactdefaultargs") BRepAlgoAPI_BuilderAlgo;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") BRepAlgoAPI_BuilderAlgo;
		 BRepAlgoAPI_BuilderAlgo ();
		%feature("compactdefaultargs") BRepAlgoAPI_BuilderAlgo;
		%feature("autodoc", "	* Empty constructor

	:param thePF:
	:type thePF: BOPAlgo_PaveFiller &
	:rtype: None
") BRepAlgoAPI_BuilderAlgo;
		 BRepAlgoAPI_BuilderAlgo (const BOPAlgo_PaveFiller & thePF);
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "	* Sets the additional tolerance

	:param theFuzz:
	:type theFuzz: float
	:rtype: None
") SetFuzzyValue;
		void SetFuzzyValue (const Standard_Real theFuzz);
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "	* Returns the additional tolerance

	:rtype: float
") FuzzyValue;
		Standard_Real FuzzyValue ();
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "	* Sets the arguments

	:param theLS:
	:type theLS: TopTools_ListOfShape &
	:rtype: None
") SetArguments;
		void SetArguments (const TopTools_ListOfShape & theLS);
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	* Gets the arguments

	:rtype: TopTools_ListOfShape
") Arguments;
		const TopTools_ListOfShape & Arguments ();
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Performs the algorithm //! H I S T O R Y

	:rtype: void
") Build;
		virtual void Build ();
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
		%feature("autodoc", "	* Returns the list of shapes generated from the shape <S>. For use in BRepNaming.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "	* Returns true if there is at least one modified shape. For use in BRepNaming.

	:rtype: bool
") HasModified;
		virtual Standard_Boolean HasModified ();
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "	* Returns true if there is at least one generated shape. For use in BRepNaming.

	:rtype: bool
") HasGenerated;
		virtual Standard_Boolean HasGenerated ();
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "	* Returns true if there is at least one deleted shape. For use in BRepNaming. //! protected methods

	:rtype: bool
") HasDeleted;
		virtual Standard_Boolean HasDeleted ();
};


%extend BRepAlgoAPI_BuilderAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepAlgoAPI_Check;
class BRepAlgoAPI_Check : public BRepAlgoAPI_Algo {
	public:
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") BRepAlgoAPI_Check;
		 BRepAlgoAPI_Check ();
		%feature("compactdefaultargs") BRepAlgoAPI_Check;
		%feature("autodoc", "	* Constructor for checking single shape. It calls methods Init(theS, TopoDS_Shape(), BOPAlgo_UNKNOWN, bTestSE, bTestSI) and Perform(). Params: theS - the shape that should be checked; bTestSE - flag that specifies whether check on small edges should be performed; by default it is set to True; bTestSI - flag that specifies whether check on self-interference should be performed; by default it is set to True;

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
		%feature("autodoc", "	* Constructor for couple of shapes. It calls methods Init(theS1, theS2, theOp, bTestSE, bTestSI) and Perform(). Params: theS1, theS2 - the initial shapes. theOp - the type of Boolean Operation; if it is not defined (set to UNKNOWN) for each shape performed check as for single shape. bTestSE - flag that specifies whether check on small edges should be performed; by default it is set to True; bTestSI - flag that specifies whether check on self-interference should be performed; by default it is set to True;

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
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "	* Sets the additional tolerance

	:param theFuzz:
	:type theFuzz: float
	:rtype: None
") SetFuzzyValue;
		void SetFuzzyValue (const Standard_Real theFuzz);
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "	* Returns the additional tolerance

	:rtype: float
") FuzzyValue;
		Standard_Real FuzzyValue ();
};


%extend BRepAlgoAPI_Check {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepAlgoAPI_BooleanOperation;
class BRepAlgoAPI_BooleanOperation : public BRepAlgoAPI_BuilderAlgo {
	public:
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", "	* Returns the first argument involved in this Boolean operation. Obsolete

	:rtype: TopoDS_Shape
") Shape1;
		const TopoDS_Shape  Shape1 ();
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", "	* Returns the second argument involved in this Boolean operation. Obsolete

	:rtype: TopoDS_Shape
") Shape2;
		const TopoDS_Shape  Shape2 ();
		%feature("compactdefaultargs") SetTools;
		%feature("autodoc", "	* Sets the tools

	:param theLS:
	:type theLS: TopTools_ListOfShape &
	:rtype: None
") SetTools;
		void SetTools (const TopTools_ListOfShape & theLS);
		%feature("compactdefaultargs") Tools;
		%feature("autodoc", "	* Gets the tools

	:rtype: TopTools_ListOfShape
") Tools;
		const TopTools_ListOfShape & Tools ();
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "	* Sets the type of Boolean operation

	:param anOp:
	:type anOp: BOPAlgo_Operation
	:rtype: None
") SetOperation;
		void SetOperation (const BOPAlgo_Operation anOp);
		%feature("compactdefaultargs") Operation;
		%feature("autodoc", "	* Returns the type of Boolean Operation

	:rtype: BOPAlgo_Operation
") Operation;
		BOPAlgo_Operation Operation ();
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Performs the algorithm Filling interference Data Structure (if it is necessary) Building the result of the operation.

	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") BuilderCanWork;
		%feature("autodoc", "	* Returns True if there was no errors occured obsolete

	:rtype: bool
") BuilderCanWork;
		Standard_Boolean BuilderCanWork ();
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
		%feature("compactdefaultargs") SectionEdges;
		%feature("autodoc", "	* Returns a list of section edges. The edges represent the result of intersection between arguments of Boolean Operation. They are computed during operation execution.

	:rtype: TopTools_ListOfShape
") SectionEdges;
		const TopTools_ListOfShape & SectionEdges ();
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
		%feature("autodoc", "	* Returns the list of shapes generated from the shape <S>. For use in BRepNaming.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "	* Returns true if there is at least one modified shape. For use in BRepNaming.

	:rtype: bool
") HasModified;
		virtual Standard_Boolean HasModified ();
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "	* Returns true if there is at least one generated shape. For use in BRepNaming.

	:rtype: bool
") HasGenerated;
		virtual Standard_Boolean HasGenerated ();
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "	* Returns true if there is at least one deleted shape. For use in BRepNaming.

	:rtype: bool
") HasDeleted;
		virtual Standard_Boolean HasDeleted ();
};


%extend BRepAlgoAPI_BooleanOperation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepAlgoAPI_Common;
class BRepAlgoAPI_Common : public BRepAlgoAPI_BooleanOperation {
	public:
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common ();
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "	* Empty constructor <PF> - PaveFiller object that is carried out

	:param PF:
	:type PF: BOPAlgo_PaveFiller &
	:rtype: None
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common (const BOPAlgo_PaveFiller & PF);
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "	* Constructor with two shapes <S1> -argument <S2> -tool <anOperation> - the type of the operation Obsolete

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("compactdefaultargs") BRepAlgoAPI_Common;
		%feature("autodoc", "	* Constructor with two shapes <S1> -argument <S2> -tool <anOperation> - the type of the operation <PF> - PaveFiller object that is carried out Obsolete

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param PF:
	:type PF: BOPAlgo_PaveFiller &
	:rtype: None
") BRepAlgoAPI_Common;
		 BRepAlgoAPI_Common (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const BOPAlgo_PaveFiller & PF);
};


%extend BRepAlgoAPI_Common {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepAlgoAPI_Cut;
class BRepAlgoAPI_Cut : public BRepAlgoAPI_BooleanOperation {
	public:
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut ();
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "	* Empty constructor <PF> - PaveFiller object that is carried out

	:param PF:
	:type PF: BOPAlgo_PaveFiller &
	:rtype: None
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut (const BOPAlgo_PaveFiller & PF);
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "	* Constructor with two shapes <S1> -argument <S2> -tool <anOperation> - the type of the operation Obsolete

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") BRepAlgoAPI_Cut;
		 BRepAlgoAPI_Cut (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("compactdefaultargs") BRepAlgoAPI_Cut;
		%feature("autodoc", "	* Constructor with two shapes <S1> -argument <S2> -tool <anOperation> - the type of the operation <PF> - PaveFiller object that is carried out Obsolete

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


%extend BRepAlgoAPI_Cut {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepAlgoAPI_Fuse;
class BRepAlgoAPI_Fuse : public BRepAlgoAPI_BooleanOperation {
	public:
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse ();
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "	* Empty constructor <PF> - PaveFiller object that is carried out

	:param PF:
	:type PF: BOPAlgo_PaveFiller &
	:rtype: None
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse (const BOPAlgo_PaveFiller & PF);
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "	* Constructor with two shapes <S1> -argument <S2> -tool <anOperation> - the type of the operation Obsolete

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") BRepAlgoAPI_Fuse;
		 BRepAlgoAPI_Fuse (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("compactdefaultargs") BRepAlgoAPI_Fuse;
		%feature("autodoc", "	* Constructor with two shapes <S1> -argument <S2> -tool <anOperation> - the type of the operation <PF> - PaveFiller object that is carried out Obsolete

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


%extend BRepAlgoAPI_Fuse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepAlgoAPI_Section;
class BRepAlgoAPI_Section : public BRepAlgoAPI_BooleanOperation {
	public:
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section ();
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "	* Empty constructor <PF> - PaveFiller object that is carried out

	:param PF:
	:type PF: BOPAlgo_PaveFiller &
	:rtype: None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const BOPAlgo_PaveFiller & PF);
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "	* Constructor with two shapes <S1> -argument <S2> -tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediatly Obsolete

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Standard_Boolean PerformNow = Standard_True);
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "	* Constructor with two shapes <S1> -argument <S2> -tool <PF> - PaveFiller object that is carried out <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediatly Obsolete

	:param S1:
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
		%feature("autodoc", "	* Constructor with two shapes <S1> - argument <Pl> - tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediatly Obsolete

	:param S1:
	:type S1: TopoDS_Shape &
	:param Pl:
	:type Pl: gp_Pln
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const TopoDS_Shape & S1,const gp_Pln & Pl,const Standard_Boolean PerformNow = Standard_True);
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "	* Constructor with two shapes <S1> - argument <Sf> - tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediatly Obsolete

	:param S1:
	:type S1: TopoDS_Shape &
	:param Sf:
	:type Sf: Handle_Geom_Surface &
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const TopoDS_Shape & S1,const Handle_Geom_Surface & Sf,const Standard_Boolean PerformNow = Standard_True);
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "	* Constructor with two shapes <Sf> - argument <S2> - tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediatly Obsolete

	:param Sf:
	:type Sf: Handle_Geom_Surface &
	:param S2:
	:type S2: TopoDS_Shape &
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None
") BRepAlgoAPI_Section;
		 BRepAlgoAPI_Section (const Handle_Geom_Surface & Sf,const TopoDS_Shape & S2,const Standard_Boolean PerformNow = Standard_True);
		%feature("compactdefaultargs") BRepAlgoAPI_Section;
		%feature("autodoc", "	* Constructor with two shapes <Sf1> - argument <Sf2> - tool <PerformNow> - the flag: if <PerformNow>=True - the algorithm is performed immediatly Obsolete

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
		%feature("autodoc", "	* initialize the argument <S1> - argument Obsolete

	:param S1:
	:type S1: TopoDS_Shape &
	:rtype: None
") Init1;
		void Init1 (const TopoDS_Shape & S1);
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "	* initialize the argument <Pl> - argument Obsolete

	:param Pl:
	:type Pl: gp_Pln
	:rtype: None
") Init1;
		void Init1 (const gp_Pln & Pl);
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "	* initialize the argument <Sf> - argument Obsolete

	:param Sf:
	:type Sf: Handle_Geom_Surface &
	:rtype: None
") Init1;
		void Init1 (const Handle_Geom_Surface & Sf);
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "	* initialize the tool <S2> - tool Obsolete

	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") Init2;
		void Init2 (const TopoDS_Shape & S2);
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "	* initialize the tool <Pl> - tool Obsolete

	:param Pl:
	:type Pl: gp_Pln
	:rtype: None
") Init2;
		void Init2 (const gp_Pln & Pl);
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "	* initialize the tool <Sf> - tool Obsolete

	:param Sf:
	:type Sf: Handle_Geom_Surface &
	:rtype: None
") Init2;
		void Init2 (const Handle_Geom_Surface & Sf);
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Approximation;
		void Approximation (const Standard_Boolean B);
		%feature("compactdefaultargs") ComputePCurveOn1;
		%feature("autodoc", "	* Indicates whether the P-Curve should be (or not) performed on the argument. By default, no parametric 2D curve (pcurve) is defined for the edges of the result. If ComputePCurve1 equals true, further computations performed to attach an P-Curve in the parametric space of the argument to the constructed edges. Obsolete

	:param B:
	:type B: bool
	:rtype: None
") ComputePCurveOn1;
		void ComputePCurveOn1 (const Standard_Boolean B);
		%feature("compactdefaultargs") ComputePCurveOn2;
		%feature("autodoc", "	* Indicates whether the P-Curve should be (or not) performed on the tool. By default, no parametric 2D curve (pcurve) is defined for the edges of the result. If ComputePCurve1 equals true, further computations performed to attach an P-Curve in the parametric space of the tool to the constructed edges. Obsolete

	:param B:
	:type B: bool
	:rtype: None
") ComputePCurveOn2;
		void ComputePCurveOn2 (const Standard_Boolean B);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Performs the algorithm Filling interference Data Structure (if it is necessary) Building the result of the operation.

	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") HasAncestorFaceOn1;
		%feature("autodoc", "	* get the face of the first part giving section edge <E>. Returns True on the 3 following conditions : 1/ <E> is an edge returned by the Shape() metwod. 2/ First part of section performed is a shape. 3/ <E> is built on a intersection curve (i.e <E> is not the result of common edges) When False, F remains untouched. Obsolete

	:param E:
	:type E: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Shape &
	:rtype: bool
") HasAncestorFaceOn1;
		Standard_Boolean HasAncestorFaceOn1 (const TopoDS_Shape & E,TopoDS_Shape & F);
		%feature("compactdefaultargs") HasAncestorFaceOn2;
		%feature("autodoc", "	* Identifies the ancestor faces of the intersection edge E resulting from the last computation performed in this framework, that is, the faces of the two original shapes on which the edge E lies: - HasAncestorFaceOn1 gives the ancestor face in the first shape, and - HasAncestorFaceOn2 gives the ancestor face in the second shape. These functions return true if an ancestor face F is found, or false if not. An ancestor face is identifiable for the edge E if the following conditions are satisfied: - the first part on which this algorithm performed its last computation is a shape, that is, it was not given as a surface or a plane at the time of construction of this algorithm or at a later time by the Init1 function, - E is one of the elementary edges built by the last computation of this section algorithm. To use these functions properly, you have to test the returned Boolean value before using the ancestor face: F is significant only if the returned Boolean value equals true. Obsolete

	:param E:
	:type E: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Shape &
	:rtype: bool
") HasAncestorFaceOn2;
		Standard_Boolean HasAncestorFaceOn2 (const TopoDS_Shape & E,TopoDS_Shape & F);
};


%extend BRepAlgoAPI_Section {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
