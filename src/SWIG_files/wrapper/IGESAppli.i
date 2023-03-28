/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
%define IGESAPPLIDOCSTRING
"IGESAppli module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_igesappli.html"
%enddef
%module (package="OCC.Core", docstring=IGESAPPLIDOCSTRING) IGESAppli


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


%{
#include<IGESAppli_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IGESData_module.hxx>
#include<IGESDimen_module.hxx>
#include<TColStd_module.hxx>
#include<IGESBasic_module.hxx>
#include<TCollection_module.hxx>
#include<IGESDraw_module.hxx>
#include<Interface_module.hxx>
#include<IGESGraph_module.hxx>
#include<IGESDefs_module.hxx>
#include<gp_module.hxx>
#include<IGESGeom_module.hxx>
#include<MoniTool_module.hxx>
#include<Message_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IGESData.i
%import IGESDimen.i
%import TColStd.i
%import IGESBasic.i
%import TCollection.i
%import IGESDraw.i
%import Interface.i
%import IGESGraph.i
%import IGESDefs.i
%import gp.i
%import IGESGeom.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IGESAppli_DrilledHole)
%wrap_handle(IGESAppli_ElementResults)
%wrap_handle(IGESAppli_FiniteElement)
%wrap_handle(IGESAppli_Flow)
%wrap_handle(IGESAppli_FlowLineSpec)
%wrap_handle(IGESAppli_GeneralModule)
%wrap_handle(IGESAppli_LevelFunction)
%wrap_handle(IGESAppli_LevelToPWBLayerMap)
%wrap_handle(IGESAppli_LineWidening)
%wrap_handle(IGESAppli_NodalConstraint)
%wrap_handle(IGESAppli_NodalDisplAndRot)
%wrap_handle(IGESAppli_NodalResults)
%wrap_handle(IGESAppli_Node)
%wrap_handle(IGESAppli_PWBArtworkStackup)
%wrap_handle(IGESAppli_PWBDrilledHole)
%wrap_handle(IGESAppli_PartNumber)
%wrap_handle(IGESAppli_PinNumber)
%wrap_handle(IGESAppli_PipingFlow)
%wrap_handle(IGESAppli_Protocol)
%wrap_handle(IGESAppli_ReadWriteModule)
%wrap_handle(IGESAppli_ReferenceDesignator)
%wrap_handle(IGESAppli_RegionRestriction)
%wrap_handle(IGESAppli_SpecificModule)
%wrap_handle(IGESAppli_HArray1OfFiniteElement)
%wrap_handle(IGESAppli_HArray1OfFlow)
%wrap_handle(IGESAppli_HArray1OfNode)
/* end handles declaration */

/* templates */
%template(IGESAppli_Array1OfFiniteElement) NCollection_Array1<opencascade::handle<IGESAppli_FiniteElement>>;

%extend NCollection_Array1<opencascade::handle<IGESAppli_FiniteElement>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(IGESAppli_Array1OfFlow) NCollection_Array1<opencascade::handle<IGESAppli_Flow>>;

%extend NCollection_Array1<opencascade::handle<IGESAppli_Flow>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(IGESAppli_Array1OfNode) NCollection_Array1<opencascade::handle<IGESAppli_Node>>;

%extend NCollection_Array1<opencascade::handle<IGESAppli_Node>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1 <opencascade::handle <IGESAppli_FiniteElement>> IGESAppli_Array1OfFiniteElement;
typedef NCollection_Array1 <opencascade::handle <IGESAppli_Flow>> IGESAppli_Array1OfFlow;
typedef NCollection_Array1 <opencascade::handle <IGESAppli_Node>> IGESAppli_Array1OfNode;
/* end typedefs declaration */

/******************
* class IGESAppli *
******************/
%rename(igesappli) IGESAppli;
class IGESAppli {
	public:
		/****************** Init ******************/
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Prepares dynamic data (protocol, modules) for this package.

Returns
-------
void
") Init;
		static void Init();

		/****************** Protocol ******************/
		/**** md5 signature: d208d4121eec132217683640cb9b470f ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol for this package.

Returns
-------
opencascade::handle<IGESAppli_Protocol>
") Protocol;
		static opencascade::handle<IGESAppli_Protocol> Protocol();

};


%extend IGESAppli {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESAppli_DrilledHole *
******************************/
class IGESAppli_DrilledHole : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_DrilledHole ******************/
		/**** md5 signature: 7d983bbca0fd548c20eec935eac50eb4 ****/
		%feature("compactdefaultargs") IGESAppli_DrilledHole;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_DrilledHole;
		 IGESAppli_DrilledHole();

		/****************** DrillDiaSize ******************/
		/**** md5 signature: b0e5c0b983b7ad207242f8b4a1195f6f ****/
		%feature("compactdefaultargs") DrillDiaSize;
		%feature("autodoc", "Returns the drill diameter size.

Returns
-------
float
") DrillDiaSize;
		Standard_Real DrillDiaSize();

		/****************** FinishDiaSize ******************/
		/**** md5 signature: 07615703d05d6ed27a24127515db0fb8 ****/
		%feature("compactdefaultargs") FinishDiaSize;
		%feature("autodoc", "Returns the finish diameter size.

Returns
-------
float
") FinishDiaSize;
		Standard_Real FinishDiaSize();

		/****************** Init ******************/
		/**** md5 signature: 4823ba996629c170ee380aa00aba05c0 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class drilledhole - nbpropval : number of property values = 5 - asize : drill diameter size - anothersize : finish diameter size - aplating : plating indication flag false = not plating true = is plating - alayer : lower numbered layer - anotherlayer : higher numbered layer.

Parameters
----------
nbPropVal: int
aSize: float
anotherSize: float
aPlating: int
aLayer: int
anotherLayer: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const Standard_Real aSize, const Standard_Real anotherSize, const Standard_Integer aPlating, const Standard_Integer aLayer, const Standard_Integer anotherLayer);

		/****************** IsPlating ******************/
		/**** md5 signature: db6165e82b7ef8c299715dd67794f570 ****/
		%feature("compactdefaultargs") IsPlating;
		%feature("autodoc", "Returns plating status : false = not plating / true = is plating.

Returns
-------
bool
") IsPlating;
		Standard_Boolean IsPlating();

		/****************** NbHigherLayer ******************/
		/**** md5 signature: f7e103a8f8593db606f5f43542a75f76 ****/
		%feature("compactdefaultargs") NbHigherLayer;
		%feature("autodoc", "Returns the higher numbered layer.

Returns
-------
int
") NbHigherLayer;
		Standard_Integer NbHigherLayer();

		/****************** NbLowerLayer ******************/
		/**** md5 signature: 65ac55556caafea3697cf6840bdbaea4 ****/
		%feature("compactdefaultargs") NbLowerLayer;
		%feature("autodoc", "Returns the lower numbered layer.

Returns
-------
int
") NbLowerLayer;
		Standard_Integer NbLowerLayer();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Is always 5.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

};


%make_alias(IGESAppli_DrilledHole)

%extend IGESAppli_DrilledHole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESAppli_ElementResults *
*********************************/
class IGESAppli_ElementResults : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_ElementResults ******************/
		/**** md5 signature: cd252c66c0fed53b3fb4cbc1ddb70039 ****/
		%feature("compactdefaultargs") IGESAppli_ElementResults;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_ElementResults;
		 IGESAppli_ElementResults();

		/****************** DataLayerFlag ******************/
		/**** md5 signature: d4cb5c9eb4c1dab10f6e40d3aff70c91 ****/
		%feature("compactdefaultargs") DataLayerFlag;
		%feature("autodoc", "Returns data layer flags.

Parameters
----------
Index: int

Returns
-------
int
") DataLayerFlag;
		Standard_Integer DataLayerFlag(const Standard_Integer Index);

		/****************** Element ******************/
		/**** md5 signature: ed4bd4ddcf85574ba68598389f5fce72 ****/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "Returns fem element.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESAppli_FiniteElement>
") Element;
		opencascade::handle<IGESAppli_FiniteElement> Element(const Standard_Integer Index);

		/****************** ElementIdentifier ******************/
		/**** md5 signature: fa86b93169de96ebeb03f68a8d9960f7 ****/
		%feature("compactdefaultargs") ElementIdentifier;
		%feature("autodoc", "Returns fem element number for elements.

Parameters
----------
Index: int

Returns
-------
int
") ElementIdentifier;
		Standard_Integer ElementIdentifier(const Standard_Integer Index);

		/****************** ElementTopologyType ******************/
		/**** md5 signature: 4516047bdf0e6fcc9d62c3f84e126cf8 ****/
		%feature("compactdefaultargs") ElementTopologyType;
		%feature("autodoc", "Returns element topology types.

Parameters
----------
Index: int

Returns
-------
int
") ElementTopologyType;
		Standard_Integer ElementTopologyType(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: 1051f3e59a97591742750c4d73353ca6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class elementresults - anote : generalnote entity describing analysis - asubcase : analysis subcase number - atime : analysis time value - nbresults : number of result values per fem - aresrepflag : results reporting flag - allelementidents : fem element number for elements - allfiniteelems : fem element - alltoptypes : element topology types - nblayers : number of layers per result data location - alldatalayerflags : data layer flags - allnbresdatalocs : number of result data report locations - allresdatalocs : result data report locations - allresults : list of result data values of fem analysis.

Parameters
----------
aNote: IGESDimen_GeneralNote
aSubCase: int
aTime: float
nbResults: int
aResRepFlag: int
allElementIdents: TColStd_HArray1OfInteger
allFiniteElems: IGESAppli_HArray1OfFiniteElement
allTopTypes: TColStd_HArray1OfInteger
nbLayers: TColStd_HArray1OfInteger
allDataLayerFlags: TColStd_HArray1OfInteger
allnbResDataLocs: TColStd_HArray1OfInteger
allResDataLocs: IGESBasic_HArray1OfHArray1OfInteger
allResults: IGESBasic_HArray1OfHArray1OfReal

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDimen_GeneralNote> & aNote, const Standard_Integer aSubCase, const Standard_Real aTime, const Standard_Integer nbResults, const Standard_Integer aResRepFlag, const opencascade::handle<TColStd_HArray1OfInteger> & allElementIdents, const opencascade::handle<IGESAppli_HArray1OfFiniteElement> & allFiniteElems, const opencascade::handle<TColStd_HArray1OfInteger> & allTopTypes, const opencascade::handle<TColStd_HArray1OfInteger> & nbLayers, const opencascade::handle<TColStd_HArray1OfInteger> & allDataLayerFlags, const opencascade::handle<TColStd_HArray1OfInteger> & allnbResDataLocs, const opencascade::handle<IGESBasic_HArray1OfHArray1OfInteger> & allResDataLocs, const opencascade::handle<IGESBasic_HArray1OfHArray1OfReal> & allResults);

		/****************** NbElements ******************/
		/**** md5 signature: bda4abdd1e5bc28bcadae491494177fe ****/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "Returns number of fem elements.

Returns
-------
int
") NbElements;
		Standard_Integer NbElements();

		/****************** NbLayers ******************/
		/**** md5 signature: 39747378180e04f37235408a930e5b3e ****/
		%feature("compactdefaultargs") NbLayers;
		%feature("autodoc", "Returns number of layers per result data location.

Parameters
----------
Index: int

Returns
-------
int
") NbLayers;
		Standard_Integer NbLayers(const Standard_Integer Index);

		/****************** NbResultDataLocs ******************/
		/**** md5 signature: 1fdc6b5cc16f19f447ef2130bab8e9ca ****/
		%feature("compactdefaultargs") NbResultDataLocs;
		%feature("autodoc", "Returns number of result data report locations.

Parameters
----------
Index: int

Returns
-------
int
") NbResultDataLocs;
		Standard_Integer NbResultDataLocs(const Standard_Integer Index);

		/****************** NbResultValues ******************/
		/**** md5 signature: e2625475d6f6cfbb437c6cd66b379ba9 ****/
		%feature("compactdefaultargs") NbResultValues;
		%feature("autodoc", "Returns number of result values per fem.

Returns
-------
int
") NbResultValues;
		Standard_Integer NbResultValues();

		/****************** NbResults ******************/
		/**** md5 signature: 778178739bb8673605cab166ab9f5537 ****/
		%feature("compactdefaultargs") NbResults;
		%feature("autodoc", "Returns total number of results.

Parameters
----------
Index: int

Returns
-------
int
") NbResults;
		Standard_Integer NbResults(const Standard_Integer Index);

		/****************** Note ******************/
		/**** md5 signature: ed81f018a23a20d96ab113db3e6a212a ****/
		%feature("compactdefaultargs") Note;
		%feature("autodoc", "Returns general note entity describing analysis case.

Returns
-------
opencascade::handle<IGESDimen_GeneralNote>
") Note;
		opencascade::handle<IGESDimen_GeneralNote> Note();

		/****************** ResultData ******************/
		/**** md5 signature: a2797312ee63322f7be403153f829648 ****/
		%feature("compactdefaultargs") ResultData;
		%feature("autodoc", "Returns result data value for an element, given its order between 1 and <nbresults(nelem)> (direct access) for a more comprehensive access, see below.

Parameters
----------
NElem: int
num: int

Returns
-------
float
") ResultData;
		Standard_Real ResultData(const Standard_Integer NElem, const Standard_Integer num);

		/****************** ResultData ******************/
		/**** md5 signature: 5c13a09826d0ed94f7048630b703b47b ****/
		%feature("compactdefaultargs") ResultData;
		%feature("autodoc", "Returns result data values of fem analysis, according this definition : - <nelem> : n0 of the element to be considered - <nval> : n0 of the value between 1 and nbresultvalues - <nlay> : n0 of the layer for this element - <nloc> : n0 of the data location for this element this gives for each element, the corresponding rank computed by resultrank, in which the leftmost subscript changes most rapidly.

Parameters
----------
NElem: int
NVal: int
NLay: int
NLoc: int

Returns
-------
float
") ResultData;
		Standard_Real ResultData(const Standard_Integer NElem, const Standard_Integer NVal, const Standard_Integer NLay, const Standard_Integer NLoc);

		/****************** ResultDataLoc ******************/
		/**** md5 signature: 195ef179d893a82be4b05389c084acba ****/
		%feature("compactdefaultargs") ResultDataLoc;
		%feature("autodoc", "Returns result data report locations unfinished.

Parameters
----------
NElem: int
NLoc: int

Returns
-------
int
") ResultDataLoc;
		Standard_Integer ResultDataLoc(const Standard_Integer NElem, const Standard_Integer NLoc);

		/****************** ResultList ******************/
		/**** md5 signature: 80649f06e8b80a01ecd52549829839eb ****/
		%feature("compactdefaultargs") ResultList;
		%feature("autodoc", "Returns in once the entire list of data for an element, addressed as by resultrank (see above).

Parameters
----------
NElem: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") ResultList;
		opencascade::handle<TColStd_HArray1OfReal> ResultList(const Standard_Integer NElem);

		/****************** ResultRank ******************/
		/**** md5 signature: 2ba17966ff52e4feb75fb0776d92391f ****/
		%feature("compactdefaultargs") ResultRank;
		%feature("autodoc", "Computes, for a given element <nelem>, the rank of a individual result data, given <nval>,<nlay>,<nloc>.

Parameters
----------
NElem: int
NVal: int
NLay: int
NLoc: int

Returns
-------
int
") ResultRank;
		Standard_Integer ResultRank(const Standard_Integer NElem, const Standard_Integer NVal, const Standard_Integer NLay, const Standard_Integer NLoc);

		/****************** ResultReportFlag ******************/
		/**** md5 signature: 41f922a32b6152a96f49fef125241b69 ****/
		%feature("compactdefaultargs") ResultReportFlag;
		%feature("autodoc", "Returns results reporting flag.

Returns
-------
int
") ResultReportFlag;
		Standard_Integer ResultReportFlag();

		/****************** SetFormNumber ******************/
		/**** md5 signature: 3324cf0241d76f0464eb1226a9a0994f ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "Changes the formnumber (which indicates type of result) error if not in range [0-34].

Parameters
----------
form: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer form);

		/****************** SubCaseNumber ******************/
		/**** md5 signature: b3dc523ec80371d096969009cec144ef ****/
		%feature("compactdefaultargs") SubCaseNumber;
		%feature("autodoc", "Returns analysis subcase number.

Returns
-------
int
") SubCaseNumber;
		Standard_Integer SubCaseNumber();

		/****************** Time ******************/
		/**** md5 signature: a359c7d15562aef65105797b80b4fd2d ****/
		%feature("compactdefaultargs") Time;
		%feature("autodoc", "Returns analysis time value.

Returns
-------
float
") Time;
		Standard_Real Time();

};


%make_alias(IGESAppli_ElementResults)

%extend IGESAppli_ElementResults {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESAppli_FiniteElement *
********************************/
class IGESAppli_FiniteElement : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_FiniteElement ******************/
		/**** md5 signature: b8c6cfc5ececee95d4cf27e871d51bb7 ****/
		%feature("compactdefaultargs") IGESAppli_FiniteElement;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_FiniteElement;
		 IGESAppli_FiniteElement();

		/****************** Init ******************/
		/**** md5 signature: c62e4b54d11d207a9fd14eef746a45d9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class finiteelement - atype : indicates the topology type - allnodes : list of nodes defining the element - aname : element type name.

Parameters
----------
aType: int
allNodes: IGESAppli_HArray1OfNode
aName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Integer aType, const opencascade::handle<IGESAppli_HArray1OfNode> & allNodes, const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns element type name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbNodes ******************/
		/**** md5 signature: b2716f774ff961df1fa7782a7d1f28be ****/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Returns the number of nodes defining the element.

Returns
-------
int
") NbNodes;
		Standard_Integer NbNodes();

		/****************** Node ******************/
		/**** md5 signature: 89498604af5b1d7f9d69023ca1d99f47 ****/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "Returns node defining element entity raises exception if index <= 0 or index > nbnodes().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESAppli_Node>
") Node;
		opencascade::handle<IGESAppli_Node> Node(const Standard_Integer Index);

		/****************** Topology ******************/
		/**** md5 signature: 0a8f6698aac2f67472dc0a1cb5de287a ****/
		%feature("compactdefaultargs") Topology;
		%feature("autodoc", "Returns topology type.

Returns
-------
int
") Topology;
		Standard_Integer Topology();

};


%make_alias(IGESAppli_FiniteElement)

%extend IGESAppli_FiniteElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IGESAppli_Flow *
***********************/
class IGESAppli_Flow : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_Flow ******************/
		/**** md5 signature: 5a50bbc6c0c20bf5cd7f73d5a307d433 ****/
		%feature("compactdefaultargs") IGESAppli_Flow;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_Flow;
		 IGESAppli_Flow();

		/****************** ConnectPoint ******************/
		/**** md5 signature: 77698e4f71fe8dd545fbcd2864f4c5f3 ****/
		%feature("compactdefaultargs") ConnectPoint;
		%feature("autodoc", "Returns connect point entity raises exception if index <= 0 or index > nbconnectpoints().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESDraw_ConnectPoint>
") ConnectPoint;
		opencascade::handle<IGESDraw_ConnectPoint> ConnectPoint(const Standard_Integer Index);

		/****************** ContFlowAssociativity ******************/
		/**** md5 signature: 97803660272377ac3a6d5cadd33b3503 ****/
		%feature("compactdefaultargs") ContFlowAssociativity;
		%feature("autodoc", "Returns continuation flow associativity entity raises exception if index <= 0 or index > nbcontflowassociativities().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") ContFlowAssociativity;
		opencascade::handle<IGESData_IGESEntity> ContFlowAssociativity(const Standard_Integer Index);

		/****************** FlowAssociativity ******************/
		/**** md5 signature: 263142158f4e06bd73751558efb2dadf ****/
		%feature("compactdefaultargs") FlowAssociativity;
		%feature("autodoc", "Returns flow associativity entity raises exception if index <= 0 or index > nbflowassociativities().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") FlowAssociativity;
		opencascade::handle<IGESData_IGESEntity> FlowAssociativity(const Standard_Integer Index);

		/****************** FlowName ******************/
		/**** md5 signature: dc3923f3ef2aba28f089a88e1faa2f1a ****/
		%feature("compactdefaultargs") FlowName;
		%feature("autodoc", "Returns flow name raises exception if index <= 0 or index > nbflownames().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FlowName;
		opencascade::handle<TCollection_HAsciiString> FlowName(const Standard_Integer Index);

		/****************** FunctionFlag ******************/
		/**** md5 signature: c5394b8db0de2d02a427b8ab6b75ea87 ****/
		%feature("compactdefaultargs") FunctionFlag;
		%feature("autodoc", "Returns function flag = 0 : not specified (default) 1 : electrical signal 2 : fluid flow path.

Returns
-------
int
") FunctionFlag;
		Standard_Integer FunctionFlag();

		/****************** Init ******************/
		/**** md5 signature: 8338687e8f076cbffda5eabc0f239d68 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class flow - nbcontextflags : count of context flags, always = 2 - aflowtype : type of flow, default = 0 - afuncflag : function flag, default = 0 - allflowassocs : flow associativity entities - allconnectpoints : connect point entities - alljoins : join entities - allflownames : flow names - alltextdisps : text display template entities - allcontflowassocs : continuation flow associativity entities.

Parameters
----------
nbContextFlags: int
aFlowType: int
aFuncFlag: int
allFlowAssocs: IGESData_HArray1OfIGESEntity
allConnectPoints: IGESDraw_HArray1OfConnectPoint
allJoins: IGESData_HArray1OfIGESEntity
allFlowNames: Interface_HArray1OfHAsciiString
allTextDisps: IGESGraph_HArray1OfTextDisplayTemplate
allContFlowAssocs: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbContextFlags, const Standard_Integer aFlowType, const Standard_Integer aFuncFlag, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allFlowAssocs, const opencascade::handle<IGESDraw_HArray1OfConnectPoint> & allConnectPoints, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allJoins, const opencascade::handle<Interface_HArray1OfHAsciiString> & allFlowNames, const opencascade::handle<IGESGraph_HArray1OfTextDisplayTemplate> & allTextDisps, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allContFlowAssocs);

		/****************** Join ******************/
		/**** md5 signature: 58b47a8ffcece20c34a630f163e08692 ****/
		%feature("compactdefaultargs") Join;
		%feature("autodoc", "Returns join entity raises exception if index <= 0 or index > nbjoins().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Join;
		opencascade::handle<IGESData_IGESEntity> Join(const Standard_Integer Index);

		/****************** NbConnectPoints ******************/
		/**** md5 signature: 8386e3f1abf2cc4e36d6c94607a7862f ****/
		%feature("compactdefaultargs") NbConnectPoints;
		%feature("autodoc", "Returns number of connect point entities.

Returns
-------
int
") NbConnectPoints;
		Standard_Integer NbConnectPoints();

		/****************** NbContFlowAssociativities ******************/
		/**** md5 signature: 5e90394ac4c910e6810c509ed7575f16 ****/
		%feature("compactdefaultargs") NbContFlowAssociativities;
		%feature("autodoc", "Returns number of continuation flow associativity entities.

Returns
-------
int
") NbContFlowAssociativities;
		Standard_Integer NbContFlowAssociativities();

		/****************** NbContextFlags ******************/
		/**** md5 signature: d3d90b2f005b5ae2a04644e136b2405f ****/
		%feature("compactdefaultargs") NbContextFlags;
		%feature("autodoc", "Returns number of count of context flags, always = 2.

Returns
-------
int
") NbContextFlags;
		Standard_Integer NbContextFlags();

		/****************** NbFlowAssociativities ******************/
		/**** md5 signature: 778491110a152bf95b3dd0d7d36269c1 ****/
		%feature("compactdefaultargs") NbFlowAssociativities;
		%feature("autodoc", "Returns number of flow associativity entities.

Returns
-------
int
") NbFlowAssociativities;
		Standard_Integer NbFlowAssociativities();

		/****************** NbFlowNames ******************/
		/**** md5 signature: e88476c0232fb7d4b6a34bd52742e189 ****/
		%feature("compactdefaultargs") NbFlowNames;
		%feature("autodoc", "Returns number of flow names.

Returns
-------
int
") NbFlowNames;
		Standard_Integer NbFlowNames();

		/****************** NbJoins ******************/
		/**** md5 signature: a79a366363892959c77d6b118ad67b45 ****/
		%feature("compactdefaultargs") NbJoins;
		%feature("autodoc", "Returns number of join entities.

Returns
-------
int
") NbJoins;
		Standard_Integer NbJoins();

		/****************** NbTextDisplayTemplates ******************/
		/**** md5 signature: d9cda970e502e43cd96289b3bb60e1ab ****/
		%feature("compactdefaultargs") NbTextDisplayTemplates;
		%feature("autodoc", "Returns number of text display template entities.

Returns
-------
int
") NbTextDisplayTemplates;
		Standard_Integer NbTextDisplayTemplates();

		/****************** OwnCorrect ******************/
		/**** md5 signature: a9e45b136fcf07e4905e0211d63ffaf6 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Forces nbcontextfalgs to 2, returns true if changed.

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect();

		/****************** TextDisplayTemplate ******************/
		/**** md5 signature: db7542d80c61fa26282996f334d0f464 ****/
		%feature("compactdefaultargs") TextDisplayTemplate;
		%feature("autodoc", "Returns text display template entity raises exception if index <= 0 or index > nbtextdisplaytemplates().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESGraph_TextDisplayTemplate>
") TextDisplayTemplate;
		opencascade::handle<IGESGraph_TextDisplayTemplate> TextDisplayTemplate(const Standard_Integer Index);

		/****************** TypeOfFlow ******************/
		/**** md5 signature: f5be40346ba5ac70d17c4f80e8ac704c ****/
		%feature("compactdefaultargs") TypeOfFlow;
		%feature("autodoc", "Returns type of flow = 0 : not specified (default) 1 : logical 2 : physical.

Returns
-------
int
") TypeOfFlow;
		Standard_Integer TypeOfFlow();

};


%make_alias(IGESAppli_Flow)

%extend IGESAppli_Flow {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESAppli_FlowLineSpec *
*******************************/
class IGESAppli_FlowLineSpec : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_FlowLineSpec ******************/
		/**** md5 signature: 1a3b288d868bcff24fee2dea25ae07d1 ****/
		%feature("compactdefaultargs") IGESAppli_FlowLineSpec;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_FlowLineSpec;
		 IGESAppli_FlowLineSpec();

		/****************** FlowLineName ******************/
		/**** md5 signature: 1c7753149ae3e7ef30080ee59701bc06 ****/
		%feature("compactdefaultargs") FlowLineName;
		%feature("autodoc", "Returns primary flow line specification name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FlowLineName;
		opencascade::handle<TCollection_HAsciiString> FlowLineName();

		/****************** Init ******************/
		/**** md5 signature: f3ed0b2a6c20a66df4c10212518dd89c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class flowlinespec - allproperties : primary flow line specification and modifiers.

Parameters
----------
allProperties: Interface_HArray1OfHAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Interface_HArray1OfHAsciiString> & allProperties);

		/****************** Modifier ******************/
		/**** md5 signature: ac0451a4aa84263c6587895fa08f66a1 ****/
		%feature("compactdefaultargs") Modifier;
		%feature("autodoc", "Returns specified modifier element raises exception if index <= 1 or index > nbpropertyvalues.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Modifier;
		opencascade::handle<TCollection_HAsciiString> Modifier(const Standard_Integer Index);

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

};


%make_alias(IGESAppli_FlowLineSpec)

%extend IGESAppli_FlowLineSpec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESAppli_GeneralModule *
********************************/
class IGESAppli_GeneralModule : public IGESData_GeneralModule {
	public:
		/****************** IGESAppli_GeneralModule ******************/
		/**** md5 signature: e6dc0afdeec170d16aa1a8b615a205e7 ****/
		%feature("compactdefaultargs") IGESAppli_GeneralModule;
		%feature("autodoc", "Creates a generalmodule from igesappli and puts it into generallib.

Returns
-------
None
") IGESAppli_GeneralModule;
		 IGESAppli_GeneralModule();

		/****************** CategoryNumber ******************/
		/**** md5 signature: d812efe400e2084fa824301d3c147806 ****/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "Returns a category number which characterizes an entity fea for : elementresults,finiteelement,node&co piping for : flow & co professional for : others (in fact schematics).

Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool

Returns
-------
int
") CategoryNumber;
		virtual Standard_Integer CategoryNumber(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

		/****************** DirChecker ******************/
		/**** md5 signature: 06ffbfa1e4d88543cc06fdf7c67993ee ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns a dirchecker, specific for each type of entity (identified by its case number) : this dirchecker defines constraints which must be respected by the directorypart.

Parameters
----------
CN: int
ent: IGESData_IGESEntity

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** NewVoid ******************/
		/**** md5 signature: 8e184c5622d3823d145bc2105790b57a ****/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "Specific creation of a new void entity.

Parameters
----------
CN: int
entto: Standard_Transient

Returns
-------
bool
") NewVoid;
		Standard_Boolean NewVoid(const Standard_Integer CN, opencascade::handle<Standard_Transient> & entto);

		/****************** OwnCheckCase ******************/
		/**** md5 signature: a04fd9a5e3c5ef0e136832f7ce57363b ****/
		%feature("compactdefaultargs") OwnCheckCase;
		%feature("autodoc", "Performs specific semantic check for each type of entity.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheckCase;
		void OwnCheckCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopyCase ******************/
		/**** md5 signature: 5c0289b7b5a5ec08bef5e9dac3d445b7 ****/
		%feature("compactdefaultargs") OwnCopyCase;
		%feature("autodoc", "Copies parameters which are specific of each type of entity.

Parameters
----------
CN: int
entfrom: IGESData_IGESEntity
entto: IGESData_IGESEntity
TC: Interface_CopyTool

Returns
-------
None
") OwnCopyCase;
		void OwnCopyCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, Interface_CopyTool & TC);

		/****************** OwnSharedCase ******************/
		/**** md5 signature: 1d978dfb0f38035ed4292cc342ee187f ****/
		%feature("compactdefaultargs") OwnSharedCase;
		%feature("autodoc", "Lists the entities shared by a given igesentity <ent>, from its specific parameters : specific for each type.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
iter: Interface_EntityIterator

Returns
-------
None
") OwnSharedCase;
		void OwnSharedCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, Interface_EntityIterator & iter);

};


%make_alias(IGESAppli_GeneralModule)

%extend IGESAppli_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESAppli_LevelFunction *
********************************/
class IGESAppli_LevelFunction : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_LevelFunction ******************/
		/**** md5 signature: f690aac70e1661540b7793bc8923bf56 ****/
		%feature("compactdefaultargs") IGESAppli_LevelFunction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_LevelFunction;
		 IGESAppli_LevelFunction();

		/****************** FuncDescription ******************/
		/**** md5 signature: 248b59be0729cefafd8c219227d90f27 ****/
		%feature("compactdefaultargs") FuncDescription;
		%feature("autodoc", "Returns the function description default = null string.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FuncDescription;
		opencascade::handle<TCollection_HAsciiString> FuncDescription();

		/****************** FuncDescriptionCode ******************/
		/**** md5 signature: e9a7ecc83768fa9e92d3a9135a64a267 ****/
		%feature("compactdefaultargs") FuncDescriptionCode;
		%feature("autodoc", "Returns the function description code . default = 0.

Returns
-------
int
") FuncDescriptionCode;
		Standard_Integer FuncDescriptionCode();

		/****************** Init ******************/
		/**** md5 signature: ffc916349a01c49e11f879281035ea3d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class levelfunction - nbpropval : number of properties, always = 2 - acode : function description code default = 0 - afuncdescrip : function description default = null string.

Parameters
----------
nbPropVal: int
aCode: int
aFuncDescrip: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const Standard_Integer aCode, const opencascade::handle<TCollection_HAsciiString> & aFuncDescrip);

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Is always 2.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

};


%make_alias(IGESAppli_LevelFunction)

%extend IGESAppli_LevelFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESAppli_LevelToPWBLayerMap *
*************************************/
class IGESAppli_LevelToPWBLayerMap : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_LevelToPWBLayerMap ******************/
		/**** md5 signature: acba81407543029a41a96457dd676940 ****/
		%feature("compactdefaultargs") IGESAppli_LevelToPWBLayerMap;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_LevelToPWBLayerMap;
		 IGESAppli_LevelToPWBLayerMap();

		/****************** ExchangeFileLevelIdent ******************/
		/**** md5 signature: b712fd6e1045a994d06d5f6e82779093 ****/
		%feature("compactdefaultargs") ExchangeFileLevelIdent;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ExchangeFileLevelIdent;
		opencascade::handle<TCollection_HAsciiString> ExchangeFileLevelIdent(const Standard_Integer Index);

		/****************** ExchangeFileLevelNumber ******************/
		/**** md5 signature: bcfec57d67b5461eed1123b081eca324 ****/
		%feature("compactdefaultargs") ExchangeFileLevelNumber;
		%feature("autodoc", "Returns exchange file level number raises exception if index <= 0 or index > nbleveltolayerdefs.

Parameters
----------
Index: int

Returns
-------
int
") ExchangeFileLevelNumber;
		Standard_Integer ExchangeFileLevelNumber(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: f84f808d8425018e5e54e365708938d4 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class leveltopwblayermap - nbpropval : number of property values - allexchlevels : exchange file level numbers - allnativelevels : native level identifications - allphyslevels : physical layer numbers - allexchidents : exchange file level identifications raises exception if allexchlevels, allnativelevels, allphyslevels and all exchidents are not of same dimensions.

Parameters
----------
nbPropVal: int
allExchLevels: TColStd_HArray1OfInteger
allNativeLevels: Interface_HArray1OfHAsciiString
allPhysLevels: TColStd_HArray1OfInteger
allExchIdents: Interface_HArray1OfHAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const opencascade::handle<TColStd_HArray1OfInteger> & allExchLevels, const opencascade::handle<Interface_HArray1OfHAsciiString> & allNativeLevels, const opencascade::handle<TColStd_HArray1OfInteger> & allPhysLevels, const opencascade::handle<Interface_HArray1OfHAsciiString> & allExchIdents);

		/****************** NativeLevel ******************/
		/**** md5 signature: 9af87d5064cd6ea7a517f67e127110b3 ****/
		%feature("compactdefaultargs") NativeLevel;
		%feature("autodoc", "Returns native level identification raises exception if index <= 0 or index > nbleveltolayerdefs.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") NativeLevel;
		opencascade::handle<TCollection_HAsciiString> NativeLevel(const Standard_Integer Index);

		/****************** NbLevelToLayerDefs ******************/
		/**** md5 signature: efb5da6d7fb5cf093954efeb4463f5da ****/
		%feature("compactdefaultargs") NbLevelToLayerDefs;
		%feature("autodoc", "Returns number of level to layer definitions.

Returns
-------
int
") NbLevelToLayerDefs;
		Standard_Integer NbLevelToLayerDefs();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns number of property values.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** PhysicalLayerNumber ******************/
		/**** md5 signature: a1b48c7fb9a929517e4869d6709960c1 ****/
		%feature("compactdefaultargs") PhysicalLayerNumber;
		%feature("autodoc", "Returns physical layer number raises exception if index <= 0 or index > nbleveltolayerdefs.

Parameters
----------
Index: int

Returns
-------
int
") PhysicalLayerNumber;
		Standard_Integer PhysicalLayerNumber(const Standard_Integer Index);

};


%make_alias(IGESAppli_LevelToPWBLayerMap)

%extend IGESAppli_LevelToPWBLayerMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESAppli_LineWidening *
*******************************/
class IGESAppli_LineWidening : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_LineWidening ******************/
		/**** md5 signature: 8c1df91de3ad7b85ab1d631a6869468d ****/
		%feature("compactdefaultargs") IGESAppli_LineWidening;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_LineWidening;
		 IGESAppli_LineWidening();

		/****************** CorneringCode ******************/
		/**** md5 signature: 0c5b1ac8b6aa4c0fd2d1175cc0e85dfc ****/
		%feature("compactdefaultargs") CorneringCode;
		%feature("autodoc", "Returns the cornering code 0 = rounded / 1 = squared.

Returns
-------
int
") CorneringCode;
		Standard_Integer CorneringCode();

		/****************** ExtensionFlag ******************/
		/**** md5 signature: 485ab5f4063409f331090bf4be345284 ****/
		%feature("compactdefaultargs") ExtensionFlag;
		%feature("autodoc", "Returns the extension flag 0 = no extension 1 = one-half width extension 2 = extension set by theextnval.

Returns
-------
int
") ExtensionFlag;
		Standard_Integer ExtensionFlag();

		/****************** ExtensionValue ******************/
		/**** md5 signature: 11955b1d150c6421848e0133cdfc1764 ****/
		%feature("compactdefaultargs") ExtensionValue;
		%feature("autodoc", "Returns the extension value present only if theextnflag = 2.

Returns
-------
float
") ExtensionValue;
		Standard_Real ExtensionValue();

		/****************** Init ******************/
		/**** md5 signature: b9abfbc083be6d8cb53edca898c1d0cb ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class linewidening - nbpropval : number of property values = 5 - awidth : width of metalization - acornering : cornering codes 0 = rounded 1 = squared - aextnflag : extension flag 0 = no extension 1 = one-half width extension 2 = extn set by extnval - ajustifflag : justification flag 0 = center justified 1 = left justified 2 = right justified - aextnval : extension value if aextnflag = 2.

Parameters
----------
nbPropVal: int
aWidth: float
aCornering: int
aExtnFlag: int
aJustifFlag: int
aExtnVal: float

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const Standard_Real aWidth, const Standard_Integer aCornering, const Standard_Integer aExtnFlag, const Standard_Integer aJustifFlag, const Standard_Real aExtnVal);

		/****************** JustificationFlag ******************/
		/**** md5 signature: dd25943e6854d364c983638de144173a ****/
		%feature("compactdefaultargs") JustificationFlag;
		%feature("autodoc", "Returns the justification flag 0 = centre justified 1 = left justified 2 = right justified.

Returns
-------
int
") JustificationFlag;
		Standard_Integer JustificationFlag();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values is always 5.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** WidthOfMetalization ******************/
		/**** md5 signature: a2a7c02f150096dd6f12c4bdf2c7cdeb ****/
		%feature("compactdefaultargs") WidthOfMetalization;
		%feature("autodoc", "Returns the width of metallization.

Returns
-------
float
") WidthOfMetalization;
		Standard_Real WidthOfMetalization();

};


%make_alias(IGESAppli_LineWidening)

%extend IGESAppli_LineWidening {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESAppli_NodalConstraint *
**********************************/
class IGESAppli_NodalConstraint : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_NodalConstraint ******************/
		/**** md5 signature: 76d643cb946aba6fd6d2b763c1e92879 ****/
		%feature("compactdefaultargs") IGESAppli_NodalConstraint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_NodalConstraint;
		 IGESAppli_NodalConstraint();

		/****************** Init ******************/
		/**** md5 signature: cd16e04b15fc9d05e1e9c547bfc4fcb5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class nodalconstraint - atype : loads / constraints - anode : the node - alltabdata : tabular data property carrying the load or constraint vector.

Parameters
----------
aType: int
aNode: IGESAppli_Node
allTabData: IGESDefs_HArray1OfTabularData

Returns
-------
None
") Init;
		void Init(const Standard_Integer aType, const opencascade::handle<IGESAppli_Node> & aNode, const opencascade::handle<IGESDefs_HArray1OfTabularData> & allTabData);

		/****************** NbCases ******************/
		/**** md5 signature: dadf008e17192a9c13d80c5487f28b41 ****/
		%feature("compactdefaultargs") NbCases;
		%feature("autodoc", "Returns total number of cases.

Returns
-------
int
") NbCases;
		Standard_Integer NbCases();

		/****************** NodeEntity ******************/
		/**** md5 signature: 24e8479209fccbb1591228bb193fe3e8 ****/
		%feature("compactdefaultargs") NodeEntity;
		%feature("autodoc", "Returns the node.

Returns
-------
opencascade::handle<IGESAppli_Node>
") NodeEntity;
		opencascade::handle<IGESAppli_Node> NodeEntity();

		/****************** TabularData ******************/
		/**** md5 signature: 39e76bf6beb5590366502f9f00eda3f4 ****/
		%feature("compactdefaultargs") TabularData;
		%feature("autodoc", "Returns tabular data property carrying load or constraint vector raises exception if index <= 0 or index > nbcases.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESDefs_TabularData>
") TabularData;
		opencascade::handle<IGESDefs_TabularData> TabularData(const Standard_Integer Index);

		/****************** Type ******************/
		/**** md5 signature: fadaf18b7481222141380b2bb22870ff ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns whether loads (1) or constraints (2).

Returns
-------
int
") Type;
		Standard_Integer Type();

};


%make_alias(IGESAppli_NodalConstraint)

%extend IGESAppli_NodalConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESAppli_NodalDisplAndRot *
***********************************/
class IGESAppli_NodalDisplAndRot : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_NodalDisplAndRot ******************/
		/**** md5 signature: 0f6b1744192fbf4b0d6aef1841236651 ****/
		%feature("compactdefaultargs") IGESAppli_NodalDisplAndRot;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_NodalDisplAndRot;
		 IGESAppli_NodalDisplAndRot();

		/****************** Init ******************/
		/**** md5 signature: 01733053dfcebdef4898df17c4360303 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class nodaldisplandrot - allnotes : used to store the general note describing the analysis cases - allidentifiers : used to store the node number identifier for the nodes - allnodes : used to store the nodes - allrotparams : used to store the rotation for the nodes - alltransparams : used to store the incremental displacements for the nodes raises exception if lengths of allidentifiers, allnodes, allrotparams, and alltransparams are not same or if length of allnotes and size of each element of allrotparams and alltransparam are not same.

Parameters
----------
allNotes: IGESDimen_HArray1OfGeneralNote
allIdentifiers: TColStd_HArray1OfInteger
allNodes: IGESAppli_HArray1OfNode
allRotParams: IGESBasic_HArray1OfHArray1OfXYZ
allTransParams: IGESBasic_HArray1OfHArray1OfXYZ

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDimen_HArray1OfGeneralNote> & allNotes, const opencascade::handle<TColStd_HArray1OfInteger> & allIdentifiers, const opencascade::handle<IGESAppli_HArray1OfNode> & allNodes, const opencascade::handle<IGESBasic_HArray1OfHArray1OfXYZ> & allRotParams, const opencascade::handle<IGESBasic_HArray1OfHArray1OfXYZ> & allTransParams);

		/****************** NbCases ******************/
		/**** md5 signature: dadf008e17192a9c13d80c5487f28b41 ****/
		%feature("compactdefaultargs") NbCases;
		%feature("autodoc", "Returns the number of analysis cases.

Returns
-------
int
") NbCases;
		Standard_Integer NbCases();

		/****************** NbNodes ******************/
		/**** md5 signature: b2716f774ff961df1fa7782a7d1f28be ****/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Returns the number of nodes.

Returns
-------
int
") NbNodes;
		Standard_Integer NbNodes();

		/****************** Node ******************/
		/**** md5 signature: 89498604af5b1d7f9d69023ca1d99f47 ****/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "Returns the node as specified by the index raises exception if index <= 0 or index > nbnodes.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESAppli_Node>
") Node;
		opencascade::handle<IGESAppli_Node> Node(const Standard_Integer Index);

		/****************** NodeIdentifier ******************/
		/**** md5 signature: 0be1d93d8e5fd9e7e695dc4c09f10d62 ****/
		%feature("compactdefaultargs") NodeIdentifier;
		%feature("autodoc", "Returns the node identifier as specified by the index raises exception if index <= 0 or index > nbnodes.

Parameters
----------
Index: int

Returns
-------
int
") NodeIdentifier;
		Standard_Integer NodeIdentifier(const Standard_Integer Index);

		/****************** Note ******************/
		/**** md5 signature: 86d2ef0500407e5ccb78e8ba7824c6fc ****/
		%feature("compactdefaultargs") Note;
		%feature("autodoc", "Returns the general note that describes the index analysis case raises exception if index <= 0 or index > nbcases.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESDimen_GeneralNote>
") Note;
		opencascade::handle<IGESDimen_GeneralNote> Note(const Standard_Integer Index);

		/****************** RotationalParameter ******************/
		/**** md5 signature: ced9921f3f84f56e70dae8e2cf089b14 ****/
		%feature("compactdefaultargs") RotationalParameter;
		%feature("autodoc", "Returns the rotational parameters for index exception raised if nodenum <= 0 or nodenum > nbnodes() or casenum <= 0 or casenum > nbcases().

Parameters
----------
NodeNum: int
CaseNum: int

Returns
-------
gp_XYZ
") RotationalParameter;
		gp_XYZ RotationalParameter(const Standard_Integer NodeNum, const Standard_Integer CaseNum);

		/****************** TranslationParameter ******************/
		/**** md5 signature: f291e82be88268462492026005e1c6c9 ****/
		%feature("compactdefaultargs") TranslationParameter;
		%feature("autodoc", "Returns the translational parameters for the particular index exception raised if nodenum <= 0 or nodenum > nbnodes() or casenum <= 0 or casenum > nbcases().

Parameters
----------
NodeNum: int
CaseNum: int

Returns
-------
gp_XYZ
") TranslationParameter;
		gp_XYZ TranslationParameter(const Standard_Integer NodeNum, const Standard_Integer CaseNum);

};


%make_alias(IGESAppli_NodalDisplAndRot)

%extend IGESAppli_NodalDisplAndRot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESAppli_NodalResults *
*******************************/
class IGESAppli_NodalResults : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_NodalResults ******************/
		/**** md5 signature: ee6e399645f585143adc9561992173bf ****/
		%feature("compactdefaultargs") IGESAppli_NodalResults;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_NodalResults;
		 IGESAppli_NodalResults();

		/****************** Data ******************/
		/**** md5 signature: 72d91912b1f55838b8bd7a29dbbe9063 ****/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Returns the finite element analysis result value raises exception if (nodenum <= 0 or nodenum > nbnodes()) or if (datanum <=0 or datanum > nbdata()).

Parameters
----------
NodeNum: int
DataNum: int

Returns
-------
float
") Data;
		Standard_Real Data(const Standard_Integer NodeNum, const Standard_Integer DataNum);

		/****************** Init ******************/
		/**** md5 signature: 42b3f2440afacb5cf108da03abce7d1b ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class nodalresults - anote  : general note that describes the analysis case - anumber : analysis subcase number - atime  : analysis time - allnodeidentifiers : node identifiers for the nodes - allnodes  : list of fem node entities - alldata : values of the finite element analysis result data raises exception if lengths of allnodeidentifiers, allnodes and alldata (cols) are not same.

Parameters
----------
aNote: IGESDimen_GeneralNote
aNumber: int
aTime: float
allNodeIdentifiers: TColStd_HArray1OfInteger
allNodes: IGESAppli_HArray1OfNode
allData: TColStd_HArray2OfReal

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDimen_GeneralNote> & aNote, const Standard_Integer aNumber, const Standard_Real aTime, const opencascade::handle<TColStd_HArray1OfInteger> & allNodeIdentifiers, const opencascade::handle<IGESAppli_HArray1OfNode> & allNodes, const opencascade::handle<TColStd_HArray2OfReal> & allData);

		/****************** NbData ******************/
		/**** md5 signature: 65dffaaee72ce13df8f72ba4f254de29 ****/
		%feature("compactdefaultargs") NbData;
		%feature("autodoc", "Returns number of real values in array v for a fem node.

Returns
-------
int
") NbData;
		Standard_Integer NbData();

		/****************** NbNodes ******************/
		/**** md5 signature: b2716f774ff961df1fa7782a7d1f28be ****/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Returns number of fem nodes for which data is to be read.

Returns
-------
int
") NbNodes;
		Standard_Integer NbNodes();

		/****************** Node ******************/
		/**** md5 signature: 89498604af5b1d7f9d69023ca1d99f47 ****/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "Returns the node as specified by the index raises exception if index <= 0 or index > nbnodes.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESAppli_Node>
") Node;
		opencascade::handle<IGESAppli_Node> Node(const Standard_Integer Index);

		/****************** NodeIdentifier ******************/
		/**** md5 signature: 0be1d93d8e5fd9e7e695dc4c09f10d62 ****/
		%feature("compactdefaultargs") NodeIdentifier;
		%feature("autodoc", "Returns fem node number identifier for the (index)th node raises exception if index <= 0 or index > nbnodes.

Parameters
----------
Index: int

Returns
-------
int
") NodeIdentifier;
		Standard_Integer NodeIdentifier(const Standard_Integer Index);

		/****************** Note ******************/
		/**** md5 signature: ed81f018a23a20d96ab113db3e6a212a ****/
		%feature("compactdefaultargs") Note;
		%feature("autodoc", "Returns the general note entity that describes the analysis case.

Returns
-------
opencascade::handle<IGESDimen_GeneralNote>
") Note;
		opencascade::handle<IGESDimen_GeneralNote> Note();

		/****************** SetFormNumber ******************/
		/**** md5 signature: 3324cf0241d76f0464eb1226a9a0994f ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "Changes the formnumber (which indicates type of result) error if not in range [0-34].

Parameters
----------
form: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer form);

		/****************** SubCaseNumber ******************/
		/**** md5 signature: b3dc523ec80371d096969009cec144ef ****/
		%feature("compactdefaultargs") SubCaseNumber;
		%feature("autodoc", "Returns zero if there is no subcase.

Returns
-------
int
") SubCaseNumber;
		Standard_Integer SubCaseNumber();

		/****************** Time ******************/
		/**** md5 signature: a359c7d15562aef65105797b80b4fd2d ****/
		%feature("compactdefaultargs") Time;
		%feature("autodoc", "Returns the analysis time value for this subcase. it is the time at which transient analysis results occur in the mathematical fem model.

Returns
-------
float
") Time;
		Standard_Real Time();

};


%make_alias(IGESAppli_NodalResults)

%extend IGESAppli_NodalResults {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IGESAppli_Node *
***********************/
class IGESAppli_Node : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_Node ******************/
		/**** md5 signature: 0d603c5baefadad976025dfa25e444ae ****/
		%feature("compactdefaultargs") IGESAppli_Node;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_Node;
		 IGESAppli_Node();

		/****************** Coord ******************/
		/**** md5 signature: 715b31f2c6ad127403081d601ba756d7 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the nodal coordinates.

Returns
-------
gp_Pnt
") Coord;
		gp_Pnt Coord();

		/****************** Init ******************/
		/**** md5 signature: 2f7f664f745de77aa1790663da063feb ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class node - acoord : nodal coordinates - acoordsystem : the nodal displacement coordinate system entity (default 0 is global cartesian coordinate system).

Parameters
----------
aCoord: gp_XYZ
aCoordSystem: IGESGeom_TransformationMatrix

Returns
-------
None
") Init;
		void Init(const gp_XYZ & aCoord, const opencascade::handle<IGESGeom_TransformationMatrix> & aCoordSystem);

		/****************** System ******************/
		/**** md5 signature: 673eda3112beffdc38a5bea63a2e998a ****/
		%feature("compactdefaultargs") System;
		%feature("autodoc", "Returns transfentity if a nodal displacement coordinate system entity is defined else (for global cartesien) returns null handle.

Returns
-------
opencascade::handle<IGESData_TransfEntity>
") System;
		opencascade::handle<IGESData_TransfEntity> System();

		/****************** SystemType ******************/
		/**** md5 signature: 7de803f90ab5b925f49416583a7194e5 ****/
		%feature("compactdefaultargs") SystemType;
		%feature("autodoc", "Computes & returns the type of coordinate system : 0 globalcartesian, 1 cartesian, 2 cylindrical, 3 spherical.

Returns
-------
int
") SystemType;
		Standard_Integer SystemType();

		/****************** TransformedNodalCoord ******************/
		/**** md5 signature: 1b4ff8ab69dacb3ea6822eb94b86ad0c ****/
		%feature("compactdefaultargs") TransformedNodalCoord;
		%feature("autodoc", "Returns the nodal coordinates after transformation.

Returns
-------
gp_Pnt
") TransformedNodalCoord;
		gp_Pnt TransformedNodalCoord();

};


%make_alias(IGESAppli_Node)

%extend IGESAppli_Node {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESAppli_PWBArtworkStackup *
************************************/
class IGESAppli_PWBArtworkStackup : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_PWBArtworkStackup ******************/
		/**** md5 signature: e4781fbac687de80a3a375b033344651 ****/
		%feature("compactdefaultargs") IGESAppli_PWBArtworkStackup;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_PWBArtworkStackup;
		 IGESAppli_PWBArtworkStackup();

		/****************** Identification ******************/
		/**** md5 signature: a05e926014d355b48d8e07605a4a41a8 ****/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "Returns artwork stackup identification.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Identification;
		opencascade::handle<TCollection_HAsciiString> Identification();

		/****************** Init ******************/
		/**** md5 signature: 5767f03ec3407ea930b3d1e84bf45f04 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class pwbartworkstackup - nbpropval : number of property values - anartident : artwork stackup identification - alllevelnums : level numbers.

Parameters
----------
nbPropVal: int
anArtIdent: TCollection_HAsciiString
allLevelNums: TColStd_HArray1OfInteger

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const opencascade::handle<TCollection_HAsciiString> & anArtIdent, const opencascade::handle<TColStd_HArray1OfInteger> & allLevelNums);

		/****************** LevelNumber ******************/
		/**** md5 signature: 40886b048517f0540cf48e51ca50eba4 ****/
		%feature("compactdefaultargs") LevelNumber;
		%feature("autodoc", "Returns level number raises exception if index <= 0 or index > nblevelnumbers.

Parameters
----------
Index: int

Returns
-------
int
") LevelNumber;
		Standard_Integer LevelNumber(const Standard_Integer Index);

		/****************** NbLevelNumbers ******************/
		/**** md5 signature: f5988a8ef0ae7cf464970d784cffcc13 ****/
		%feature("compactdefaultargs") NbLevelNumbers;
		%feature("autodoc", "Returns total number of level numbers.

Returns
-------
int
") NbLevelNumbers;
		Standard_Integer NbLevelNumbers();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns number of property values.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

};


%make_alias(IGESAppli_PWBArtworkStackup)

%extend IGESAppli_PWBArtworkStackup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESAppli_PWBDrilledHole *
*********************************/
class IGESAppli_PWBDrilledHole : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_PWBDrilledHole ******************/
		/**** md5 signature: bacf09afe896c80c54e88d23a684bceb ****/
		%feature("compactdefaultargs") IGESAppli_PWBDrilledHole;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_PWBDrilledHole;
		 IGESAppli_PWBDrilledHole();

		/****************** DrillDiameterSize ******************/
		/**** md5 signature: d759ff291400d7bda9d2508df990bd28 ****/
		%feature("compactdefaultargs") DrillDiameterSize;
		%feature("autodoc", "Returns drill diameter size.

Returns
-------
float
") DrillDiameterSize;
		Standard_Real DrillDiameterSize();

		/****************** FinishDiameterSize ******************/
		/**** md5 signature: fde9e1098ab764b21f1e561115368314 ****/
		%feature("compactdefaultargs") FinishDiameterSize;
		%feature("autodoc", "Returns finish diameter size.

Returns
-------
float
") FinishDiameterSize;
		Standard_Real FinishDiameterSize();

		/****************** FunctionCode ******************/
		/**** md5 signature: a54bc703a393ee1dd3c2ceaccb1f0779 ****/
		%feature("compactdefaultargs") FunctionCode;
		%feature("autodoc", "Returns function code for drilled hole is 0, 1, 2, 3, 4, 5 or 5001-9999.

Returns
-------
int
") FunctionCode;
		Standard_Integer FunctionCode();

		/****************** Init ******************/
		/**** md5 signature: 3165b99a79bcb854913b7f0757f5d9cd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class pwbdrilledhole - nbpropval : number of property values, always = 3 - adrilldia : drill diameter size - afinishdia : finish diameter size - acode : function code for drilled hole.

Parameters
----------
nbPropVal: int
aDrillDia: float
aFinishDia: float
aCode: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const Standard_Real aDrillDia, const Standard_Real aFinishDia, const Standard_Integer aCode);

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns number of property values, always = 3.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

};


%make_alias(IGESAppli_PWBDrilledHole)

%extend IGESAppli_PWBDrilledHole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESAppli_PartNumber *
*****************************/
class IGESAppli_PartNumber : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_PartNumber ******************/
		/**** md5 signature: 0a3cda63f48f983cce6d0bdbf3eacb66 ****/
		%feature("compactdefaultargs") IGESAppli_PartNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_PartNumber;
		 IGESAppli_PartNumber();

		/****************** GenericNumber ******************/
		/**** md5 signature: c7c35bd227f876e4f10df18d2498ace9 ****/
		%feature("compactdefaultargs") GenericNumber;
		%feature("autodoc", "Returns generic part number or name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GenericNumber;
		opencascade::handle<TCollection_HAsciiString> GenericNumber();

		/****************** Init ******************/
		/**** md5 signature: 55482a4e5d8be95369e7c0a731f63392 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class partnumber - nbpropval : number of property values, always = 4 - agenname : generic part number or name - amilname : military standard (mil-std) part number - avendname : vendor part number or name - anintname : internal part number.

Parameters
----------
nbPropVal: int
aGenName: TCollection_HAsciiString
aMilName: TCollection_HAsciiString
aVendName: TCollection_HAsciiString
anIntName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const opencascade::handle<TCollection_HAsciiString> & aGenName, const opencascade::handle<TCollection_HAsciiString> & aMilName, const opencascade::handle<TCollection_HAsciiString> & aVendName, const opencascade::handle<TCollection_HAsciiString> & anIntName);

		/****************** InternalNumber ******************/
		/**** md5 signature: f4abc51980a899676c4ef305c58bb99e ****/
		%feature("compactdefaultargs") InternalNumber;
		%feature("autodoc", "Returns internal part number.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") InternalNumber;
		opencascade::handle<TCollection_HAsciiString> InternalNumber();

		/****************** MilitaryNumber ******************/
		/**** md5 signature: 38f10880e71b2759fe2cdc2b5d728fd5 ****/
		%feature("compactdefaultargs") MilitaryNumber;
		%feature("autodoc", "Returns military standard (mil-std) part number.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") MilitaryNumber;
		opencascade::handle<TCollection_HAsciiString> MilitaryNumber();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns number of property values, always = 4.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** VendorNumber ******************/
		/**** md5 signature: 0859dc60ad5e00d5a1f264f71c457643 ****/
		%feature("compactdefaultargs") VendorNumber;
		%feature("autodoc", "Returns vendor part number or name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") VendorNumber;
		opencascade::handle<TCollection_HAsciiString> VendorNumber();

};


%make_alias(IGESAppli_PartNumber)

%extend IGESAppli_PartNumber {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESAppli_PinNumber *
****************************/
class IGESAppli_PinNumber : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_PinNumber ******************/
		/**** md5 signature: c9706c26bb99c64753abb19a1d8fea1d ****/
		%feature("compactdefaultargs") IGESAppli_PinNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_PinNumber;
		 IGESAppli_PinNumber();

		/****************** Init ******************/
		/**** md5 signature: 3dc6d623d576ab504413388f30f19497 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class pinnumber - nbpropval : number of property values (always = 1) - avalue : pin number value.

Parameters
----------
nbPropVal: int
aValue: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const opencascade::handle<TCollection_HAsciiString> & aValue);

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values is always 1.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** PinNumberVal ******************/
		/**** md5 signature: 9d3a908e824918a05673e0cd3558d104 ****/
		%feature("compactdefaultargs") PinNumberVal;
		%feature("autodoc", "Returns the pin number value.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") PinNumberVal;
		opencascade::handle<TCollection_HAsciiString> PinNumberVal();

};


%make_alias(IGESAppli_PinNumber)

%extend IGESAppli_PinNumber {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESAppli_PipingFlow *
*****************************/
class IGESAppli_PipingFlow : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_PipingFlow ******************/
		/**** md5 signature: 56739bab174659829434dd6df0be4a49 ****/
		%feature("compactdefaultargs") IGESAppli_PipingFlow;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_PipingFlow;
		 IGESAppli_PipingFlow();

		/****************** ConnectPoint ******************/
		/**** md5 signature: 77698e4f71fe8dd545fbcd2864f4c5f3 ****/
		%feature("compactdefaultargs") ConnectPoint;
		%feature("autodoc", "Returns connect point entity raises exception if index <= 0 or index > nbconnectpoints().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESDraw_ConnectPoint>
") ConnectPoint;
		opencascade::handle<IGESDraw_ConnectPoint> ConnectPoint(const Standard_Integer Index);

		/****************** ContFlowAssociativity ******************/
		/**** md5 signature: 97803660272377ac3a6d5cadd33b3503 ****/
		%feature("compactdefaultargs") ContFlowAssociativity;
		%feature("autodoc", "Returns continuation piping flow associativity entity raises exception if index <= 0 or index > nbcontflowassociativities().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") ContFlowAssociativity;
		opencascade::handle<IGESData_IGESEntity> ContFlowAssociativity(const Standard_Integer Index);

		/****************** FlowAssociativity ******************/
		/**** md5 signature: 263142158f4e06bd73751558efb2dadf ****/
		%feature("compactdefaultargs") FlowAssociativity;
		%feature("autodoc", "Returns piping flow associativity entity raises exception if index <= 0 or index > nbflowassociativities().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") FlowAssociativity;
		opencascade::handle<IGESData_IGESEntity> FlowAssociativity(const Standard_Integer Index);

		/****************** FlowName ******************/
		/**** md5 signature: dc3923f3ef2aba28f089a88e1faa2f1a ****/
		%feature("compactdefaultargs") FlowName;
		%feature("autodoc", "Returns flow name raises exception if index <= 0 or index > nbflownames().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FlowName;
		opencascade::handle<TCollection_HAsciiString> FlowName(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: 01fce0c6e8cc1ca93b84dd4108338104 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class pipingflow - nbcontextflags : count of context flags, always = 1 - aflowtype : type of flow, default = 0 - allflowassocs : pipingflow associativity entities - allconnectpoints : connect point entities - alljoins : join entities - allflownames : pipingflow names - alltextdispts : text display template entities - allcontflowassocs : continuation flow associativity entities.

Parameters
----------
nbContextFlags: int
aFlowType: int
allFlowAssocs: IGESData_HArray1OfIGESEntity
allConnectPoints: IGESDraw_HArray1OfConnectPoint
allJoins: IGESData_HArray1OfIGESEntity
allFlowNames: Interface_HArray1OfHAsciiString
allTextDisps: IGESGraph_HArray1OfTextDisplayTemplate
allContFlowAssocs: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbContextFlags, const Standard_Integer aFlowType, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allFlowAssocs, const opencascade::handle<IGESDraw_HArray1OfConnectPoint> & allConnectPoints, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allJoins, const opencascade::handle<Interface_HArray1OfHAsciiString> & allFlowNames, const opencascade::handle<IGESGraph_HArray1OfTextDisplayTemplate> & allTextDisps, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allContFlowAssocs);

		/****************** Join ******************/
		/**** md5 signature: 58b47a8ffcece20c34a630f163e08692 ****/
		%feature("compactdefaultargs") Join;
		%feature("autodoc", "Returns join entity raises exception if index <= 0 or index > nbjoins().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Join;
		opencascade::handle<IGESData_IGESEntity> Join(const Standard_Integer Index);

		/****************** NbConnectPoints ******************/
		/**** md5 signature: 8386e3f1abf2cc4e36d6c94607a7862f ****/
		%feature("compactdefaultargs") NbConnectPoints;
		%feature("autodoc", "Returns number of connect point entities.

Returns
-------
int
") NbConnectPoints;
		Standard_Integer NbConnectPoints();

		/****************** NbContFlowAssociativities ******************/
		/**** md5 signature: 5e90394ac4c910e6810c509ed7575f16 ****/
		%feature("compactdefaultargs") NbContFlowAssociativities;
		%feature("autodoc", "Returns number of continuation piping flow associativities.

Returns
-------
int
") NbContFlowAssociativities;
		Standard_Integer NbContFlowAssociativities();

		/****************** NbContextFlags ******************/
		/**** md5 signature: d3d90b2f005b5ae2a04644e136b2405f ****/
		%feature("compactdefaultargs") NbContextFlags;
		%feature("autodoc", "Returns number of count of context flags, always = 1.

Returns
-------
int
") NbContextFlags;
		Standard_Integer NbContextFlags();

		/****************** NbFlowAssociativities ******************/
		/**** md5 signature: 778491110a152bf95b3dd0d7d36269c1 ****/
		%feature("compactdefaultargs") NbFlowAssociativities;
		%feature("autodoc", "Returns number of piping flow associativity entities.

Returns
-------
int
") NbFlowAssociativities;
		Standard_Integer NbFlowAssociativities();

		/****************** NbFlowNames ******************/
		/**** md5 signature: e88476c0232fb7d4b6a34bd52742e189 ****/
		%feature("compactdefaultargs") NbFlowNames;
		%feature("autodoc", "Returns number of flow names.

Returns
-------
int
") NbFlowNames;
		Standard_Integer NbFlowNames();

		/****************** NbJoins ******************/
		/**** md5 signature: a79a366363892959c77d6b118ad67b45 ****/
		%feature("compactdefaultargs") NbJoins;
		%feature("autodoc", "Returns number of join entities.

Returns
-------
int
") NbJoins;
		Standard_Integer NbJoins();

		/****************** NbTextDisplayTemplates ******************/
		/**** md5 signature: d9cda970e502e43cd96289b3bb60e1ab ****/
		%feature("compactdefaultargs") NbTextDisplayTemplates;
		%feature("autodoc", "Returns number of text display template entities.

Returns
-------
int
") NbTextDisplayTemplates;
		Standard_Integer NbTextDisplayTemplates();

		/****************** OwnCorrect ******************/
		/**** md5 signature: a9e45b136fcf07e4905e0211d63ffaf6 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Forces nbcontextfalgs to 1, returns true if changed.

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect();

		/****************** TextDisplayTemplate ******************/
		/**** md5 signature: db7542d80c61fa26282996f334d0f464 ****/
		%feature("compactdefaultargs") TextDisplayTemplate;
		%feature("autodoc", "Returns text display template entity raises exception if index <= 0 or index > nbtextdisplaytemplates().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESGraph_TextDisplayTemplate>
") TextDisplayTemplate;
		opencascade::handle<IGESGraph_TextDisplayTemplate> TextDisplayTemplate(const Standard_Integer Index);

		/****************** TypeOfFlow ******************/
		/**** md5 signature: f5be40346ba5ac70d17c4f80e8ac704c ****/
		%feature("compactdefaultargs") TypeOfFlow;
		%feature("autodoc", "Returns type of flow = 0 : not specified, 1 : logical, 2 : physical.

Returns
-------
int
") TypeOfFlow;
		Standard_Integer TypeOfFlow();

};


%make_alias(IGESAppli_PipingFlow)

%extend IGESAppli_PipingFlow {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESAppli_Protocol *
***************************/
class IGESAppli_Protocol : public IGESData_Protocol {
	public:
		/****************** IGESAppli_Protocol ******************/
		/**** md5 signature: 078b56eb351c55cf89d33ebf61a935c4 ****/
		%feature("compactdefaultargs") IGESAppli_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_Protocol;
		 IGESAppli_Protocol();

		/****************** NbResources ******************/
		/**** md5 signature: cd524335b33aeb6eb83cc80f6b7e5681 ****/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of direct resource protocol. here, two (protocols from igesdefs and igesdraw).

Returns
-------
int
") NbResources;
		virtual Standard_Integer NbResources();

		/****************** Resource ******************/
		/**** md5 signature: 26597e9d8db9fc70530508f766cf0d70 ****/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "Returns a resource, given a rank.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_Protocol>
") Resource;
		virtual opencascade::handle<Interface_Protocol> Resource(const Standard_Integer num);

		/****************** TypeNumber ******************/
		/**** md5 signature: f4ed4f2e12d80f3bd752f6dd34ed84b4 ****/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Returns a case number, specific of each recognized type this case number is then used in libraries : the various modules attached to this class of protocol must use them in accordance (for a given value of typenumber, they must consider the same type as the protocol defines).

Parameters
----------
atype: Standard_Type

Returns
-------
int
") TypeNumber;
		virtual Standard_Integer TypeNumber(const opencascade::handle<Standard_Type> & atype);

};


%make_alias(IGESAppli_Protocol)

%extend IGESAppli_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESAppli_ReadWriteModule *
**********************************/
class IGESAppli_ReadWriteModule : public IGESData_ReadWriteModule {
	public:
		/****************** IGESAppli_ReadWriteModule ******************/
		/**** md5 signature: a24b875993a2373ac6dcf2df1d9b932d ****/
		%feature("compactdefaultargs") IGESAppli_ReadWriteModule;
		%feature("autodoc", "Creates a readwritemodule & puts it into readerlib & writerlib.

Returns
-------
None
") IGESAppli_ReadWriteModule;
		 IGESAppli_ReadWriteModule();

		/****************** CaseIGES ******************/
		/**** md5 signature: de66f0948cefad4e0218511df612ee48 ****/
		%feature("compactdefaultargs") CaseIGES;
		%feature("autodoc", "Defines case numbers for entities of igesappli.

Parameters
----------
typenum: int
formnum: int

Returns
-------
int
") CaseIGES;
		Standard_Integer CaseIGES(const Standard_Integer typenum, const Standard_Integer formnum);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 0815b93d39da58d4605233b1d8695dc9 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file for an entity of igesappli.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 2eb05a73fea84c5ff17867b597f1ca7d ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, IGESData_IGESWriter & IW);

};


%make_alias(IGESAppli_ReadWriteModule)

%extend IGESAppli_ReadWriteModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESAppli_ReferenceDesignator *
**************************************/
class IGESAppli_ReferenceDesignator : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_ReferenceDesignator ******************/
		/**** md5 signature: 5ea79a6d715f02241bb27a9b24b9339b ****/
		%feature("compactdefaultargs") IGESAppli_ReferenceDesignator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_ReferenceDesignator;
		 IGESAppli_ReferenceDesignator();

		/****************** Init ******************/
		/**** md5 signature: 8b634c2192b2924ac74469d999348439 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class referencedesignator - nbpropval : number of property values = 1 - atext : reference designator text.

Parameters
----------
nbPropVal: int
aText: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const opencascade::handle<TCollection_HAsciiString> & aText);

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values is always 1.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** RefDesignatorText ******************/
		/**** md5 signature: 111c07b6e85bc5212203667816ea5c8f ****/
		%feature("compactdefaultargs") RefDesignatorText;
		%feature("autodoc", "Returns the reference designator text.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") RefDesignatorText;
		opencascade::handle<TCollection_HAsciiString> RefDesignatorText();

};


%make_alias(IGESAppli_ReferenceDesignator)

%extend IGESAppli_ReferenceDesignator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESAppli_RegionRestriction *
************************************/
class IGESAppli_RegionRestriction : public IGESData_IGESEntity {
	public:
		/****************** IGESAppli_RegionRestriction ******************/
		/**** md5 signature: 1ac0f450bde5de10e97bb39f687f00a7 ****/
		%feature("compactdefaultargs") IGESAppli_RegionRestriction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESAppli_RegionRestriction;
		 IGESAppli_RegionRestriction();

		/****************** ElectricalCktRestriction ******************/
		/**** md5 signature: 2f08aa129e2a8912137f7f134ecb048e ****/
		%feature("compactdefaultargs") ElectricalCktRestriction;
		%feature("autodoc", "Returns the electrical circuitry restriction is 0, 1 or 2.

Returns
-------
int
") ElectricalCktRestriction;
		Standard_Integer ElectricalCktRestriction();

		/****************** ElectricalComponentRestriction ******************/
		/**** md5 signature: 9308bde4cfa5dba0641bb43a0af21593 ****/
		%feature("compactdefaultargs") ElectricalComponentRestriction;
		%feature("autodoc", "Returns the electrical components restriction is 0, 1 or 2.

Returns
-------
int
") ElectricalComponentRestriction;
		Standard_Integer ElectricalComponentRestriction();

		/****************** ElectricalViasRestriction ******************/
		/**** md5 signature: a38c170bfe9f061ef69d6b1e62cb95e3 ****/
		%feature("compactdefaultargs") ElectricalViasRestriction;
		%feature("autodoc", "Returns the electrical vias restriction is 0, 1 or 2.

Returns
-------
int
") ElectricalViasRestriction;
		Standard_Integer ElectricalViasRestriction();

		/****************** Init ******************/
		/**** md5 signature: 1cbc4f8991577394e2ac69eab90f7041 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class regionrestriction - nbpropval : number of property values, always = 3 - aviasrest : electrical vias restriction - acomporest : electrical components restriction - acktrest : electrical circuitry restriction.

Parameters
----------
nbPropVal: int
aViasRest: int
aCompoRest: int
aCktRest: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const Standard_Integer aViasRest, const Standard_Integer aCompoRest, const Standard_Integer aCktRest);

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Is always 3.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

};


%make_alias(IGESAppli_RegionRestriction)

%extend IGESAppli_RegionRestriction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESAppli_SpecificModule *
*********************************/
class IGESAppli_SpecificModule : public IGESData_SpecificModule {
	public:
		/****************** IGESAppli_SpecificModule ******************/
		/**** md5 signature: a0f8e32b8f68842633773e5f1da35cad ****/
		%feature("compactdefaultargs") IGESAppli_SpecificModule;
		%feature("autodoc", "Creates a specificmodule from igesappli & puts it into specificlib.

Returns
-------
None
") IGESAppli_SpecificModule;
		 IGESAppli_SpecificModule();

		/****************** OwnCorrect ******************/
		/**** md5 signature: bbaa7e58769f5cc28e757e0612cf4245 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "---purpose.

Parameters
----------
CN: int
ent: IGESData_IGESEntity

Returns
-------
bool
") OwnCorrect;
		virtual Standard_Boolean OwnCorrect(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

};


%make_alias(IGESAppli_SpecificModule)

%extend IGESAppli_SpecificModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESAppli_ToolDrilledHole *
**********************************/
class IGESAppli_ToolDrilledHole {
	public:
		/****************** IGESAppli_ToolDrilledHole ******************/
		/**** md5 signature: 1502e654b59e651c92322e5e8ed92e74 ****/
		%feature("compactdefaultargs") IGESAppli_ToolDrilledHole;
		%feature("autodoc", "Returns a tooldrilledhole, ready to work.

Returns
-------
None
") IGESAppli_ToolDrilledHole;
		 IGESAppli_ToolDrilledHole();

		/****************** DirChecker ******************/
		/**** md5 signature: df9532c109f0bc6164bf52e7ac8e89ea ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_DrilledHole

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_DrilledHole> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 8051467a807bca8c6c3e2174c95cd719 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_DrilledHole
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_DrilledHole> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: ea438094a005e87348e5535a46d0179c ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_DrilledHole
entto: IGESAppli_DrilledHole
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_DrilledHole> & entfrom, const opencascade::handle<IGESAppli_DrilledHole> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 9ab773557fdb4595bed67e9e92e1a9a5 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a drilledhole (nbpropertyvalues forced to 5, level cleared if subordinate != 0).

Parameters
----------
ent: IGESAppli_DrilledHole

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESAppli_DrilledHole> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 47f4984a00670aedd60bce1ecb12f577 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a drilledhole <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_DrilledHole
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_DrilledHole> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: ab56b363a5ebedf722f8df3e2bd7845d ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_DrilledHole
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_DrilledHole> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: b1f159060ce993fb36660e70f9a714e8 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_DrilledHole
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_DrilledHole> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolDrilledHole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESAppli_ToolElementResults *
*************************************/
class IGESAppli_ToolElementResults {
	public:
		/****************** IGESAppli_ToolElementResults ******************/
		/**** md5 signature: 2d83fc40387ac8426e3a4ffc172fb8c2 ****/
		%feature("compactdefaultargs") IGESAppli_ToolElementResults;
		%feature("autodoc", "Returns a toolelementresults, ready to work.

Returns
-------
None
") IGESAppli_ToolElementResults;
		 IGESAppli_ToolElementResults();

		/****************** DirChecker ******************/
		/**** md5 signature: 2c37fe67dfa5a8f04cf337256f4d6251 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_ElementResults

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_ElementResults> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: bac9450f604892dab1cc8d0f3e3674c1 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_ElementResults
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_ElementResults> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 4c0b5b9a86569763654d72cf0d582fb3 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_ElementResults
entto: IGESAppli_ElementResults
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_ElementResults> & entfrom, const opencascade::handle<IGESAppli_ElementResults> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 64c9906f1ab15526a2e2374e889a6c3e ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a elementresults <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_ElementResults
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_ElementResults> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: dca54994e593aefcc36bf1e8d5c8b1c8 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_ElementResults
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_ElementResults> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: e4bcf974b9c922756fa40e4e90c06f62 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_ElementResults
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_ElementResults> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolElementResults {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESAppli_ToolFiniteElement *
************************************/
class IGESAppli_ToolFiniteElement {
	public:
		/****************** IGESAppli_ToolFiniteElement ******************/
		/**** md5 signature: 1b61a47e53533dcff0199f62a2c1ba02 ****/
		%feature("compactdefaultargs") IGESAppli_ToolFiniteElement;
		%feature("autodoc", "Returns a toolfiniteelement, ready to work.

Returns
-------
None
") IGESAppli_ToolFiniteElement;
		 IGESAppli_ToolFiniteElement();

		/****************** DirChecker ******************/
		/**** md5 signature: 41807af5c6c412510540c8c24712eba3 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_FiniteElement

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_FiniteElement> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: f21597d25c49509232c63b281827c210 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_FiniteElement
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_FiniteElement> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 0b75b59b1f08d1718209408e3cf279fa ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_FiniteElement
entto: IGESAppli_FiniteElement
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_FiniteElement> & entfrom, const opencascade::handle<IGESAppli_FiniteElement> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: ba2c1c9534eaa50d30df2cb396d39176 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a finiteelement <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_FiniteElement
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_FiniteElement> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 5e2856639ff1e8c9c924d13703f40c90 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_FiniteElement
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_FiniteElement> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 4559aad62d937cf43f4e40a34dc9f2d0 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_FiniteElement
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_FiniteElement> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolFiniteElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESAppli_ToolFlow *
***************************/
class IGESAppli_ToolFlow {
	public:
		/****************** IGESAppli_ToolFlow ******************/
		/**** md5 signature: f71bb04833f004dd062ee09c98dfaeab ****/
		%feature("compactdefaultargs") IGESAppli_ToolFlow;
		%feature("autodoc", "Returns a toolflow, ready to work.

Returns
-------
None
") IGESAppli_ToolFlow;
		 IGESAppli_ToolFlow();

		/****************** DirChecker ******************/
		/**** md5 signature: c4de3bc029cc291e0401f0135c7b9e04 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_Flow

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_Flow> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 5b869c3249a4e30fdcb5195adcf3e57f ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_Flow
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_Flow> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 93fd06061e0fb2499824dd0fcb6a2fcb ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_Flow
entto: IGESAppli_Flow
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_Flow> & entfrom, const opencascade::handle<IGESAppli_Flow> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: afbd82408fd341deae96b1e2b2a1ebe6 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a flow (nbcontextflags forced to 2).

Parameters
----------
ent: IGESAppli_Flow

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESAppli_Flow> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 5d673eb9c22d23a37b82f626529677ea ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a flow <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_Flow
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_Flow> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 6f592f9404c0957760f2b75182c10e6a ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_Flow
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_Flow> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: ee8b4639f5e2b7795f85e6ffac48c041 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_Flow
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_Flow> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolFlow {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESAppli_ToolFlowLineSpec *
***********************************/
class IGESAppli_ToolFlowLineSpec {
	public:
		/****************** IGESAppli_ToolFlowLineSpec ******************/
		/**** md5 signature: 268a9441f447a6e55ff0362165d2e027 ****/
		%feature("compactdefaultargs") IGESAppli_ToolFlowLineSpec;
		%feature("autodoc", "Returns a toolflowlinespec, ready to work.

Returns
-------
None
") IGESAppli_ToolFlowLineSpec;
		 IGESAppli_ToolFlowLineSpec();

		/****************** DirChecker ******************/
		/**** md5 signature: 5be0093ad859e532f1e5215f93142edd ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_FlowLineSpec

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_FlowLineSpec> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 0b2a861ba6efacd427d4391c466204ab ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_FlowLineSpec
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_FlowLineSpec> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: b8cbdf7c18c1233dd8d47106f803b817 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_FlowLineSpec
entto: IGESAppli_FlowLineSpec
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_FlowLineSpec> & entfrom, const opencascade::handle<IGESAppli_FlowLineSpec> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 7c328bcdac99fcf982b998268c905f63 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a flowlinespec <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_FlowLineSpec
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_FlowLineSpec> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 1968cfca7b25460e0a85f58345b92230 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_FlowLineSpec
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_FlowLineSpec> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 0de3f28ad2e8bd3abaf181c4d28f06a6 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_FlowLineSpec
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_FlowLineSpec> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolFlowLineSpec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESAppli_ToolLevelFunction *
************************************/
class IGESAppli_ToolLevelFunction {
	public:
		/****************** IGESAppli_ToolLevelFunction ******************/
		/**** md5 signature: 603776b2f1649d873a17168466789731 ****/
		%feature("compactdefaultargs") IGESAppli_ToolLevelFunction;
		%feature("autodoc", "Returns a toollevelfunction, ready to work.

Returns
-------
None
") IGESAppli_ToolLevelFunction;
		 IGESAppli_ToolLevelFunction();

		/****************** DirChecker ******************/
		/**** md5 signature: 37c09bbcec31ebafd70615b4a7891320 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_LevelFunction

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_LevelFunction> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: bb7e0c7174b355af250b9822106a0fc2 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_LevelFunction
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_LevelFunction> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: f4a97fd48692cf620653b2ff4d2a889b ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_LevelFunction
entto: IGESAppli_LevelFunction
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_LevelFunction> & entfrom, const opencascade::handle<IGESAppli_LevelFunction> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 36e3d1ff9b4f657cf4be670c9ec8a30a ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a levelfunction (nbpropertyvalues forced to 2).

Parameters
----------
ent: IGESAppli_LevelFunction

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESAppli_LevelFunction> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 8e46ae535536ed3b7cd54a12c5737535 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a levelfunction <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_LevelFunction
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_LevelFunction> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: dbeaef68c7adcebd3232efe0b8f39413 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_LevelFunction
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_LevelFunction> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: b1894a733cf5044d5f7a2d5b19586166 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_LevelFunction
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_LevelFunction> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolLevelFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESAppli_ToolLevelToPWBLayerMap *
*****************************************/
class IGESAppli_ToolLevelToPWBLayerMap {
	public:
		/****************** IGESAppli_ToolLevelToPWBLayerMap ******************/
		/**** md5 signature: 7df90dcb9312d229537162843a86a84a ****/
		%feature("compactdefaultargs") IGESAppli_ToolLevelToPWBLayerMap;
		%feature("autodoc", "Returns a toolleveltopwblayermap, ready to work.

Returns
-------
None
") IGESAppli_ToolLevelToPWBLayerMap;
		 IGESAppli_ToolLevelToPWBLayerMap();

		/****************** DirChecker ******************/
		/**** md5 signature: bc70f0666f3124320dae6a29ea9f5b07 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_LevelToPWBLayerMap

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_LevelToPWBLayerMap> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 034a113d4184bf1c3e2553ffaf604b73 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_LevelToPWBLayerMap
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_LevelToPWBLayerMap> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 6ebe318803e8de4f6dc737a1cbfaf6fd ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_LevelToPWBLayerMap
entto: IGESAppli_LevelToPWBLayerMap
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_LevelToPWBLayerMap> & entfrom, const opencascade::handle<IGESAppli_LevelToPWBLayerMap> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 6fbb0d58cd8e4681616ab0fc5b2dbee4 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a leveltopwblayermap <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_LevelToPWBLayerMap
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_LevelToPWBLayerMap> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 58df939ae9dc59b8b5b43d5e5272e256 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_LevelToPWBLayerMap
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_LevelToPWBLayerMap> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 536cca0848ba6300a8ad4fbd9eaeed77 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_LevelToPWBLayerMap
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_LevelToPWBLayerMap> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolLevelToPWBLayerMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESAppli_ToolLineWidening *
***********************************/
class IGESAppli_ToolLineWidening {
	public:
		/****************** IGESAppli_ToolLineWidening ******************/
		/**** md5 signature: ea70735330edc034456c4bb61f7e2543 ****/
		%feature("compactdefaultargs") IGESAppli_ToolLineWidening;
		%feature("autodoc", "Returns a toollinewidening, ready to work.

Returns
-------
None
") IGESAppli_ToolLineWidening;
		 IGESAppli_ToolLineWidening();

		/****************** DirChecker ******************/
		/**** md5 signature: 753c476eeb80900c6b124fe06b8261af ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_LineWidening

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_LineWidening> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 8b27296222b8795e654a7331d860d45e ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_LineWidening
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_LineWidening> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: f8f6db7adb7f355456c1118b207f7194 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_LineWidening
entto: IGESAppli_LineWidening
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_LineWidening> & entfrom, const opencascade::handle<IGESAppli_LineWidening> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 3b4b22668deff5376688b166cc25968b ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a linewidening (nbpropertyvalues forced to 5, level cleared if subordinate != 0).

Parameters
----------
ent: IGESAppli_LineWidening

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESAppli_LineWidening> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 72add00b0c88a48530f93e73bdb1f534 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a linewidening <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_LineWidening
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_LineWidening> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: faf822edc428f430fd8e3c4c2d3f393f ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_LineWidening
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_LineWidening> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 57f5158ee7b43d9bb3e68fe597466318 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_LineWidening
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_LineWidening> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolLineWidening {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESAppli_ToolNodalConstraint *
**************************************/
class IGESAppli_ToolNodalConstraint {
	public:
		/****************** IGESAppli_ToolNodalConstraint ******************/
		/**** md5 signature: a252cf77a1353fadb0703ff61d08a265 ****/
		%feature("compactdefaultargs") IGESAppli_ToolNodalConstraint;
		%feature("autodoc", "Returns a toolnodalconstraint, ready to work.

Returns
-------
None
") IGESAppli_ToolNodalConstraint;
		 IGESAppli_ToolNodalConstraint();

		/****************** DirChecker ******************/
		/**** md5 signature: 13d5dfe17866ed782b1df80453b9138c ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_NodalConstraint

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_NodalConstraint> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 93208c89ce86ec050b2bbf8c635bf00a ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_NodalConstraint
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_NodalConstraint> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 1980036420c90d764ad812a1ebcc7211 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_NodalConstraint
entto: IGESAppli_NodalConstraint
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_NodalConstraint> & entfrom, const opencascade::handle<IGESAppli_NodalConstraint> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 2ac29f2d33b200fc358b681beeff44fa ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a nodalconstraint <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_NodalConstraint
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_NodalConstraint> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: fe7646174e4d149f02b7b9b06744e93b ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_NodalConstraint
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_NodalConstraint> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: f035d34d7f96c7f47aaa628df791033e ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_NodalConstraint
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_NodalConstraint> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolNodalConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IGESAppli_ToolNodalDisplAndRot *
***************************************/
class IGESAppli_ToolNodalDisplAndRot {
	public:
		/****************** IGESAppli_ToolNodalDisplAndRot ******************/
		/**** md5 signature: 77e68945060dec6e3faafc4f2e2ff706 ****/
		%feature("compactdefaultargs") IGESAppli_ToolNodalDisplAndRot;
		%feature("autodoc", "Returns a toolnodaldisplandrot, ready to work.

Returns
-------
None
") IGESAppli_ToolNodalDisplAndRot;
		 IGESAppli_ToolNodalDisplAndRot();

		/****************** DirChecker ******************/
		/**** md5 signature: e688b34dc9cc4cd1ede3d6f82733cf3e ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_NodalDisplAndRot

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_NodalDisplAndRot> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 27ac190d01909da6a4e0fb2f9a8b98cc ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_NodalDisplAndRot
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_NodalDisplAndRot> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: f55144605bafe03060f60ea8fc455ccf ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_NodalDisplAndRot
entto: IGESAppli_NodalDisplAndRot
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_NodalDisplAndRot> & entfrom, const opencascade::handle<IGESAppli_NodalDisplAndRot> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: a847cb20452a255fbc5d39e062c701f6 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a nodaldisplandrot <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_NodalDisplAndRot
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_NodalDisplAndRot> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 17f66502583460679988aed19e01b262 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_NodalDisplAndRot
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_NodalDisplAndRot> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: df729999d2f9f290c3dd89338a376965 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_NodalDisplAndRot
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_NodalDisplAndRot> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolNodalDisplAndRot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESAppli_ToolNodalResults *
***********************************/
class IGESAppli_ToolNodalResults {
	public:
		/****************** IGESAppli_ToolNodalResults ******************/
		/**** md5 signature: 7bb00f44eeafc7b5927744195eec6081 ****/
		%feature("compactdefaultargs") IGESAppli_ToolNodalResults;
		%feature("autodoc", "Returns a toolnodalresults, ready to work.

Returns
-------
None
") IGESAppli_ToolNodalResults;
		 IGESAppli_ToolNodalResults();

		/****************** DirChecker ******************/
		/**** md5 signature: d1b2aaa1144a248a45279b69e54e2f8a ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_NodalResults

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_NodalResults> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 6fe97c80fda7564c27264349c809f215 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_NodalResults
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_NodalResults> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: e5273510a1c34521da68594a20dbb702 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_NodalResults
entto: IGESAppli_NodalResults
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_NodalResults> & entfrom, const opencascade::handle<IGESAppli_NodalResults> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 4e3026dffaa96c0765d457294d897114 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a nodalresults <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_NodalResults
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_NodalResults> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: f6c5a838e207489904bb8d1b883aed4b ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_NodalResults
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_NodalResults> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: cd3dda830cdd9063d0c7298b2694d571 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_NodalResults
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_NodalResults> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolNodalResults {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESAppli_ToolNode *
***************************/
class IGESAppli_ToolNode {
	public:
		/****************** IGESAppli_ToolNode ******************/
		/**** md5 signature: d05aaecb297a5b0789fadf2a8171eb49 ****/
		%feature("compactdefaultargs") IGESAppli_ToolNode;
		%feature("autodoc", "Returns a toolnode, ready to work.

Returns
-------
None
") IGESAppli_ToolNode;
		 IGESAppli_ToolNode();

		/****************** DirChecker ******************/
		/**** md5 signature: 4b8927f6d09f3e85a0eaa3c0ca3d8862 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_Node

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_Node> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 2e8fcc16ffc168520540c2e63209c837 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_Node
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_Node> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 723e9661c93efb702234bffdba6687ab ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_Node
entto: IGESAppli_Node
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_Node> & entfrom, const opencascade::handle<IGESAppli_Node> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: fd17d0548496de9c902c68500ba1f598 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a node <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_Node
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_Node> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 9b9dd21c3d5f4a8abf644764fa0c4f99 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_Node
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_Node> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 2db96c5cfd36e444fe671b765c4938ce ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_Node
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_Node> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESAppli_ToolPWBArtworkStackup *
****************************************/
class IGESAppli_ToolPWBArtworkStackup {
	public:
		/****************** IGESAppli_ToolPWBArtworkStackup ******************/
		/**** md5 signature: a4ef798612df389a880944b78fce9f34 ****/
		%feature("compactdefaultargs") IGESAppli_ToolPWBArtworkStackup;
		%feature("autodoc", "Returns a toolpwbartworkstackup, ready to work.

Returns
-------
None
") IGESAppli_ToolPWBArtworkStackup;
		 IGESAppli_ToolPWBArtworkStackup();

		/****************** DirChecker ******************/
		/**** md5 signature: 8e59ccefac7d7a6bbd4e88b444ee5ae4 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_PWBArtworkStackup

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_PWBArtworkStackup> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: e0541a72afbbc4c8ec93e6da00416141 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_PWBArtworkStackup
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_PWBArtworkStackup> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 67acc750e451f8759a5cece7fb906e7d ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_PWBArtworkStackup
entto: IGESAppli_PWBArtworkStackup
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_PWBArtworkStackup> & entfrom, const opencascade::handle<IGESAppli_PWBArtworkStackup> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 589b9d8d6e8163eb54fdf53a2b233e51 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a pwbartworkstackup <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_PWBArtworkStackup
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_PWBArtworkStackup> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 2bacb68d006e05c615c985bdcd0748df ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_PWBArtworkStackup
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_PWBArtworkStackup> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 48872f6083d65399bbd1e35299967648 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_PWBArtworkStackup
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_PWBArtworkStackup> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolPWBArtworkStackup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESAppli_ToolPWBDrilledHole *
*************************************/
class IGESAppli_ToolPWBDrilledHole {
	public:
		/****************** IGESAppli_ToolPWBDrilledHole ******************/
		/**** md5 signature: 7b2f03e960099b591365cb020ad0dc5d ****/
		%feature("compactdefaultargs") IGESAppli_ToolPWBDrilledHole;
		%feature("autodoc", "Returns a toolpwbdrilledhole, ready to work.

Returns
-------
None
") IGESAppli_ToolPWBDrilledHole;
		 IGESAppli_ToolPWBDrilledHole();

		/****************** DirChecker ******************/
		/**** md5 signature: 1984be4b8188a62a94778ed357d5f36b ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_PWBDrilledHole

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_PWBDrilledHole> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: b0556e709eac4337d7e775cb8ba6b082 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_PWBDrilledHole
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_PWBDrilledHole> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 3936e7e93c5026e5b5384fc7bd4fa27b ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_PWBDrilledHole
entto: IGESAppli_PWBDrilledHole
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_PWBDrilledHole> & entfrom, const opencascade::handle<IGESAppli_PWBDrilledHole> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 8e4d5afabe83f227a01aac0e505ade8e ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a pwbdrilledhole (nbpropertyvalues forced to 3).

Parameters
----------
ent: IGESAppli_PWBDrilledHole

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESAppli_PWBDrilledHole> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: dd630212b60e7f4032f3700351ecb5a8 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a pwbdrilledhole <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_PWBDrilledHole
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_PWBDrilledHole> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 7e4a99960c846548b5bb3d5efc9e710f ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_PWBDrilledHole
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_PWBDrilledHole> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: b117fd9fea62bfcfdafe0b6ed4c5af2e ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_PWBDrilledHole
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_PWBDrilledHole> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolPWBDrilledHole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESAppli_ToolPartNumber *
*********************************/
class IGESAppli_ToolPartNumber {
	public:
		/****************** IGESAppli_ToolPartNumber ******************/
		/**** md5 signature: 9a0cdcd442e211286290bcdd71e76c44 ****/
		%feature("compactdefaultargs") IGESAppli_ToolPartNumber;
		%feature("autodoc", "Returns a toolpartnumber, ready to work.

Returns
-------
None
") IGESAppli_ToolPartNumber;
		 IGESAppli_ToolPartNumber();

		/****************** DirChecker ******************/
		/**** md5 signature: 65b7a0e256549249226dbf94b1035d61 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_PartNumber

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_PartNumber> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 0d36058443b1ebf3fce704f418d8233b ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_PartNumber
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_PartNumber> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 2349ea46136a6cc007c4cf2d4693fa2e ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_PartNumber
entto: IGESAppli_PartNumber
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_PartNumber> & entfrom, const opencascade::handle<IGESAppli_PartNumber> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 4f22c23f195cc5c66bab3f308ed0cef3 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a partnumber (nbpropertyvalues forced to 4).

Parameters
----------
ent: IGESAppli_PartNumber

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESAppli_PartNumber> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: a186be27d91d72a0f2d9ff4329604872 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a partnumber <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_PartNumber
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_PartNumber> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: aa13e12b58b59615b62bb16dc8227137 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_PartNumber
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_PartNumber> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: c2b5829c82b68c5de876f2dfeb41b741 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_PartNumber
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_PartNumber> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolPartNumber {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESAppli_ToolPinNumber *
********************************/
class IGESAppli_ToolPinNumber {
	public:
		/****************** IGESAppli_ToolPinNumber ******************/
		/**** md5 signature: 2f9590355aa0950532f8455e669dce2a ****/
		%feature("compactdefaultargs") IGESAppli_ToolPinNumber;
		%feature("autodoc", "Returns a toolpinnumber, ready to work.

Returns
-------
None
") IGESAppli_ToolPinNumber;
		 IGESAppli_ToolPinNumber();

		/****************** DirChecker ******************/
		/**** md5 signature: 39c285d371995355fd047a5d63c55ef9 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_PinNumber

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_PinNumber> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 26ded1ca253b60fb72f2684f816e12a4 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_PinNumber
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_PinNumber> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 9eaff469d0aa51428f874e87f28903dd ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_PinNumber
entto: IGESAppli_PinNumber
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_PinNumber> & entfrom, const opencascade::handle<IGESAppli_PinNumber> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 9a8bb4010a344211549f97052ac65e2a ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a pinnumber (level cleared in d.e. if subordinate != 0).

Parameters
----------
ent: IGESAppli_PinNumber

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESAppli_PinNumber> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: f33da5fd415c6a26e651b43e071a7eb7 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a pinnumber <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_PinNumber
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_PinNumber> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 5cc5e51b7789072d7886e86fad6ef954 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_PinNumber
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_PinNumber> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: f0da32f204a31f0c9343b708e486e96e ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_PinNumber
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_PinNumber> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolPinNumber {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESAppli_ToolPipingFlow *
*********************************/
class IGESAppli_ToolPipingFlow {
	public:
		/****************** IGESAppli_ToolPipingFlow ******************/
		/**** md5 signature: 657dbf2d0dcfefedadf2ae23f24c0d09 ****/
		%feature("compactdefaultargs") IGESAppli_ToolPipingFlow;
		%feature("autodoc", "Returns a toolpipingflow, ready to work.

Returns
-------
None
") IGESAppli_ToolPipingFlow;
		 IGESAppli_ToolPipingFlow();

		/****************** DirChecker ******************/
		/**** md5 signature: a4f9b9798e68c7913bc68334b4995df4 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_PipingFlow

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_PipingFlow> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 25109bb3ff44e0d85e2558336bf4bb86 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_PipingFlow
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_PipingFlow> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: b7a94275589bb8abd0ded2c420bafa33 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_PipingFlow
entto: IGESAppli_PipingFlow
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_PipingFlow> & entfrom, const opencascade::handle<IGESAppli_PipingFlow> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: de0e6a65b49a77e7f44641beea7a8b95 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a pipingflow (nbcontextflags forced to 1).

Parameters
----------
ent: IGESAppli_PipingFlow

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESAppli_PipingFlow> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: c98833418c3b56d57d0a3f30ce3d1bf2 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a pipingflow <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_PipingFlow
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_PipingFlow> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 3283c32d9f493abd0a8b744944e213c5 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_PipingFlow
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_PipingFlow> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 09bc93f778eb59490ea036406fa25339 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_PipingFlow
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_PipingFlow> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolPipingFlow {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class IGESAppli_ToolReferenceDesignator *
******************************************/
class IGESAppli_ToolReferenceDesignator {
	public:
		/****************** IGESAppli_ToolReferenceDesignator ******************/
		/**** md5 signature: 740c7cebffa53792fc9280e92e25a970 ****/
		%feature("compactdefaultargs") IGESAppli_ToolReferenceDesignator;
		%feature("autodoc", "Returns a toolreferencedesignator, ready to work.

Returns
-------
None
") IGESAppli_ToolReferenceDesignator;
		 IGESAppli_ToolReferenceDesignator();

		/****************** DirChecker ******************/
		/**** md5 signature: d59f64f3cb51ad7e6129f4a97c1176d1 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_ReferenceDesignator

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_ReferenceDesignator> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 6496143ce990140f90ad3f7c44b17efc ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_ReferenceDesignator
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_ReferenceDesignator> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 2ad35eb1e94f1cfa568fe5d301d942ba ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_ReferenceDesignator
entto: IGESAppli_ReferenceDesignator
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_ReferenceDesignator> & entfrom, const opencascade::handle<IGESAppli_ReferenceDesignator> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: bc45e7faff47ce9a328803de9e6e49ae ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a referencedesignator (nbpropertyvalues forced to 1, level cleared if subordinate != 0).

Parameters
----------
ent: IGESAppli_ReferenceDesignator

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESAppli_ReferenceDesignator> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 219a9f107e651b8f9ecc037e990715dc ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a referencedesignator <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_ReferenceDesignator
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_ReferenceDesignator> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 4d71fe4314d130505d8c3852eab29201 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_ReferenceDesignator
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_ReferenceDesignator> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: d4218246aeb6e31d538ff7dfe09375fd ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_ReferenceDesignator
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_ReferenceDesignator> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolReferenceDesignator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESAppli_ToolRegionRestriction *
****************************************/
class IGESAppli_ToolRegionRestriction {
	public:
		/****************** IGESAppli_ToolRegionRestriction ******************/
		/**** md5 signature: 687fd9db724e799c8932db564109012c ****/
		%feature("compactdefaultargs") IGESAppli_ToolRegionRestriction;
		%feature("autodoc", "Returns a toolregionrestriction, ready to work.

Returns
-------
None
") IGESAppli_ToolRegionRestriction;
		 IGESAppli_ToolRegionRestriction();

		/****************** DirChecker ******************/
		/**** md5 signature: 3ab7aa0b2f9362167dbd310601b8970f ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESAppli_RegionRestriction

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESAppli_RegionRestriction> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 18aab16d3e7392a3f2c5b34f6f60994d ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESAppli_RegionRestriction
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESAppli_RegionRestriction> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: e4cf2c5962f69d0c6341ae683daf31e3 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESAppli_RegionRestriction
entto: IGESAppli_RegionRestriction
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESAppli_RegionRestriction> & entfrom, const opencascade::handle<IGESAppli_RegionRestriction> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 8f71115ddf08d594adb3b99f06ce5092 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a regionrestriction (nbpropertyvalues forced to 3, level cleared if subordinate != 0).

Parameters
----------
ent: IGESAppli_RegionRestriction

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESAppli_RegionRestriction> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 86c964ae7233e0c829e75c0a9623571b ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a regionrestriction <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESAppli_RegionRestriction
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESAppli_RegionRestriction> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: f04e415d3648ccd92de4a93e82ccc069 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESAppli_RegionRestriction
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESAppli_RegionRestriction> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 08382ef8c125575786b020eafe43b3f5 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESAppli_RegionRestriction
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESAppli_RegionRestriction> & ent, IGESData_IGESWriter & IW);

};


%extend IGESAppli_ToolRegionRestriction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class IGESAppli_HArray1OfFiniteElement : public IGESAppli_Array1OfFiniteElement, public Standard_Transient {
  public:
    IGESAppli_HArray1OfFiniteElement(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESAppli_HArray1OfFiniteElement(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESAppli_Array1OfFiniteElement::value_type& theValue);
    IGESAppli_HArray1OfFiniteElement(const IGESAppli_Array1OfFiniteElement& theOther);
    const IGESAppli_Array1OfFiniteElement& Array1();
    IGESAppli_Array1OfFiniteElement& ChangeArray1();
};
%make_alias(IGESAppli_HArray1OfFiniteElement)


class IGESAppli_HArray1OfFlow : public IGESAppli_Array1OfFlow, public Standard_Transient {
  public:
    IGESAppli_HArray1OfFlow(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESAppli_HArray1OfFlow(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESAppli_Array1OfFlow::value_type& theValue);
    IGESAppli_HArray1OfFlow(const IGESAppli_Array1OfFlow& theOther);
    const IGESAppli_Array1OfFlow& Array1();
    IGESAppli_Array1OfFlow& ChangeArray1();
};
%make_alias(IGESAppli_HArray1OfFlow)


class IGESAppli_HArray1OfNode : public IGESAppli_Array1OfNode, public Standard_Transient {
  public:
    IGESAppli_HArray1OfNode(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESAppli_HArray1OfNode(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESAppli_Array1OfNode::value_type& theValue);
    IGESAppli_HArray1OfNode(const IGESAppli_Array1OfNode& theOther);
    const IGESAppli_Array1OfNode& Array1();
    IGESAppli_Array1OfNode& ChangeArray1();
};
%make_alias(IGESAppli_HArray1OfNode)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
