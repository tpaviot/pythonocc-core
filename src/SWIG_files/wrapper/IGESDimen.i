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
%define IGESDIMENDOCSTRING
"IGESDimen module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_igesdimen.html"
%enddef
%module (package="OCC.Core", docstring=IGESDIMENDOCSTRING) IGESDimen


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
#include<IGESDimen_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IGESData_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Interface_module.hxx>
#include<IGESGraph_module.hxx>
#include<IGESGeom_module.hxx>
#include<MoniTool_module.hxx>
#include<Message_module.hxx>
#include<IGESBasic_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IGESData.i
%import gp.i
%import TColgp.i
%import TCollection.i
%import TColStd.i
%import Interface.i
%import IGESGraph.i
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
%wrap_handle(IGESDimen_AngularDimension)
%wrap_handle(IGESDimen_BasicDimension)
%wrap_handle(IGESDimen_CenterLine)
%wrap_handle(IGESDimen_CurveDimension)
%wrap_handle(IGESDimen_DiameterDimension)
%wrap_handle(IGESDimen_DimensionDisplayData)
%wrap_handle(IGESDimen_DimensionTolerance)
%wrap_handle(IGESDimen_DimensionUnits)
%wrap_handle(IGESDimen_DimensionedGeometry)
%wrap_handle(IGESDimen_FlagNote)
%wrap_handle(IGESDimen_GeneralLabel)
%wrap_handle(IGESDimen_GeneralModule)
%wrap_handle(IGESDimen_GeneralNote)
%wrap_handle(IGESDimen_GeneralSymbol)
%wrap_handle(IGESDimen_LeaderArrow)
%wrap_handle(IGESDimen_LinearDimension)
%wrap_handle(IGESDimen_NewDimensionedGeometry)
%wrap_handle(IGESDimen_NewGeneralNote)
%wrap_handle(IGESDimen_OrdinateDimension)
%wrap_handle(IGESDimen_PointDimension)
%wrap_handle(IGESDimen_Protocol)
%wrap_handle(IGESDimen_RadiusDimension)
%wrap_handle(IGESDimen_ReadWriteModule)
%wrap_handle(IGESDimen_Section)
%wrap_handle(IGESDimen_SectionedArea)
%wrap_handle(IGESDimen_SpecificModule)
%wrap_handle(IGESDimen_WitnessLine)
%wrap_handle(IGESDimen_HArray1OfGeneralNote)
%wrap_handle(IGESDimen_HArray1OfLeaderArrow)
/* end handles declaration */

/* templates */
%template(IGESDimen_Array1OfGeneralNote) NCollection_Array1<opencascade::handle<IGESDimen_GeneralNote>>;

%extend NCollection_Array1<opencascade::handle<IGESDimen_GeneralNote>> {
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
%template(IGESDimen_Array1OfLeaderArrow) NCollection_Array1<opencascade::handle<IGESDimen_LeaderArrow>>;

%extend NCollection_Array1<opencascade::handle<IGESDimen_LeaderArrow>> {
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
typedef NCollection_Array1 <opencascade::handle <IGESDimen_GeneralNote>> IGESDimen_Array1OfGeneralNote;
typedef NCollection_Array1 <opencascade::handle <IGESDimen_LeaderArrow>> IGESDimen_Array1OfLeaderArrow;
/* end typedefs declaration */

/******************
* class IGESDimen *
******************/
%rename(igesdimen) IGESDimen;
class IGESDimen {
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
		/**** md5 signature: 1ef91ebde1fd956fc225e496478fe91e ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol for this package.

Returns
-------
opencascade::handle<IGESDimen_Protocol>
") Protocol;
		static opencascade::handle<IGESDimen_Protocol> Protocol();

};


%extend IGESDimen {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESDimen_AngularDimension *
***********************************/
class IGESDimen_AngularDimension : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_AngularDimension ******************/
		/**** md5 signature: d6167a3c257de7c2136b72234284b849 ****/
		%feature("compactdefaultargs") IGESDimen_AngularDimension;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_AngularDimension;
		 IGESDimen_AngularDimension();

		/****************** FirstLeader ******************/
		/**** md5 signature: 40bbe80db9a9f9e240c121f71adaf9e4 ****/
		%feature("compactdefaultargs") FirstLeader;
		%feature("autodoc", "Returns the first leader entity.

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") FirstLeader;
		opencascade::handle<IGESDimen_LeaderArrow> FirstLeader();

		/****************** FirstWitnessLine ******************/
		/**** md5 signature: 9995f31941b0115043e5224f0decac7d ****/
		%feature("compactdefaultargs") FirstWitnessLine;
		%feature("autodoc", "Returns the first witness line entity or null handle.

Returns
-------
opencascade::handle<IGESDimen_WitnessLine>
") FirstWitnessLine;
		opencascade::handle<IGESDimen_WitnessLine> FirstWitnessLine();

		/****************** HasFirstWitnessLine ******************/
		/**** md5 signature: 325a2035f3024ab6e7c8d79548055fb6 ****/
		%feature("compactdefaultargs") HasFirstWitnessLine;
		%feature("autodoc", "Returns false if thefirstwitnessline is null handle.

Returns
-------
bool
") HasFirstWitnessLine;
		Standard_Boolean HasFirstWitnessLine();

		/****************** HasSecondWitnessLine ******************/
		/**** md5 signature: c1b3fff94ec6538217169c6c5ea20a74 ****/
		%feature("compactdefaultargs") HasSecondWitnessLine;
		%feature("autodoc", "Returns false if thesecondwitnessline is null handle.

Returns
-------
bool
") HasSecondWitnessLine;
		Standard_Boolean HasSecondWitnessLine();

		/****************** Init ******************/
		/**** md5 signature: 7b111e20b1b6cdc24b9c7c5ef02be4f6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class angulardimension - anote : general note entity - aline : first witness line entity or null handle - anotherline : second witness line entity or null handle - avertex : coordinates of vertex point - aradius : radius of leader arcs - aleader : first leader entity - anotherleader : second leader entity.

Parameters
----------
aNote: IGESDimen_GeneralNote
aLine: IGESDimen_WitnessLine
anotherLine: IGESDimen_WitnessLine
aVertex: gp_XY
aRadius: float
aLeader: IGESDimen_LeaderArrow
anotherLeader: IGESDimen_LeaderArrow

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDimen_GeneralNote> & aNote, const opencascade::handle<IGESDimen_WitnessLine> & aLine, const opencascade::handle<IGESDimen_WitnessLine> & anotherLine, const gp_XY & aVertex, const Standard_Real aRadius, const opencascade::handle<IGESDimen_LeaderArrow> & aLeader, const opencascade::handle<IGESDimen_LeaderArrow> & anotherLeader);

		/****************** Note ******************/
		/**** md5 signature: ed81f018a23a20d96ab113db3e6a212a ****/
		%feature("compactdefaultargs") Note;
		%feature("autodoc", "Returns the general note entity of the dimension.

Returns
-------
opencascade::handle<IGESDimen_GeneralNote>
") Note;
		opencascade::handle<IGESDimen_GeneralNote> Note();

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of the leader arcs.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SecondLeader ******************/
		/**** md5 signature: 0bc702f0862d8a40b0cf76a142ea4d3d ****/
		%feature("compactdefaultargs") SecondLeader;
		%feature("autodoc", "Returns the second leader entity.

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") SecondLeader;
		opencascade::handle<IGESDimen_LeaderArrow> SecondLeader();

		/****************** SecondWitnessLine ******************/
		/**** md5 signature: a5a135a7319ba50f5d1788de76599b31 ****/
		%feature("compactdefaultargs") SecondWitnessLine;
		%feature("autodoc", "Returns the second witness line entity or null handle.

Returns
-------
opencascade::handle<IGESDimen_WitnessLine>
") SecondWitnessLine;
		opencascade::handle<IGESDimen_WitnessLine> SecondWitnessLine();

		/****************** TransformedVertex ******************/
		/**** md5 signature: c83036b8c9f92594d32688baa782fce4 ****/
		%feature("compactdefaultargs") TransformedVertex;
		%feature("autodoc", "Returns the coordinates of the vertex point as pnt2d from gp after transformation. (z = 0.0 for transformation).

Returns
-------
gp_Pnt2d
") TransformedVertex;
		gp_Pnt2d TransformedVertex();

		/****************** Vertex ******************/
		/**** md5 signature: 6560dce8e27af19b635fa502abb19d57 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the coordinates of the vertex point as pnt2d from gp.

Returns
-------
gp_Pnt2d
") Vertex;
		gp_Pnt2d Vertex();

};


%make_alias(IGESDimen_AngularDimension)

%extend IGESDimen_AngularDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESDimen_BasicDimension *
*********************************/
class IGESDimen_BasicDimension : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_BasicDimension ******************/
		/**** md5 signature: e3ad27a81152909441b0b596f4804faa ****/
		%feature("compactdefaultargs") IGESDimen_BasicDimension;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_BasicDimension;
		 IGESDimen_BasicDimension();

		/****************** Init ******************/
		/**** md5 signature: bdd2ebb3151ca1c25b9d90e882e3b20e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbPropVal: int
lowerLeft: gp_XY
lowerRight: gp_XY
upperRight: gp_XY
upperLeft: gp_XY

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const gp_XY & lowerLeft, const gp_XY & lowerRight, const gp_XY & upperRight, const gp_XY & upperLeft);

		/****************** LowerLeft ******************/
		/**** md5 signature: 2c54e4d569e6e8d9187c5c3b9be1323d ****/
		%feature("compactdefaultargs") LowerLeft;
		%feature("autodoc", "Returns coordinates of lower left corner.

Returns
-------
gp_Pnt2d
") LowerLeft;
		gp_Pnt2d LowerLeft();

		/****************** LowerRight ******************/
		/**** md5 signature: fd1780ee7150c2e45c7017233c085d40 ****/
		%feature("compactdefaultargs") LowerRight;
		%feature("autodoc", "Returns coordinates of lower right corner.

Returns
-------
gp_Pnt2d
") LowerRight;
		gp_Pnt2d LowerRight();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of properties = 8.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** UpperLeft ******************/
		/**** md5 signature: 3ba5cd65308c5de0494761a90497686d ****/
		%feature("compactdefaultargs") UpperLeft;
		%feature("autodoc", "Returns coordinates of upper left corner.

Returns
-------
gp_Pnt2d
") UpperLeft;
		gp_Pnt2d UpperLeft();

		/****************** UpperRight ******************/
		/**** md5 signature: a8cd7450a6b624fdcd75bc7f8a267a64 ****/
		%feature("compactdefaultargs") UpperRight;
		%feature("autodoc", "Returns coordinates of upper right corner.

Returns
-------
gp_Pnt2d
") UpperRight;
		gp_Pnt2d UpperRight();

};


%make_alias(IGESDimen_BasicDimension)

%extend IGESDimen_BasicDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESDimen_CenterLine *
*****************************/
class IGESDimen_CenterLine : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_CenterLine ******************/
		/**** md5 signature: 8a093e67f10892fb63c829ba28862cd0 ****/
		%feature("compactdefaultargs") IGESDimen_CenterLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_CenterLine;
		 IGESDimen_CenterLine();

		/****************** Datatype ******************/
		/**** md5 signature: 6635b41a6e7c415ffe018ddf92784b58 ****/
		%feature("compactdefaultargs") Datatype;
		%feature("autodoc", "Returns interpretation flag : ip = 1.

Returns
-------
int
") Datatype;
		Standard_Integer Datatype();

		/****************** Init ******************/
		/**** md5 signature: 9c645b9d5be4670d341375b8290febc8 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class centerline - adatatype : interpretation flag, always = 1 - azdisplacement : common z displacement - datapnts : data points (x and y).

Parameters
----------
aDataType: int
aZdisp: float
dataPnts: TColgp_HArray1OfXY

Returns
-------
None
") Init;
		void Init(const Standard_Integer aDataType, const Standard_Real aZdisp, const opencascade::handle<TColgp_HArray1OfXY> & dataPnts);

		/****************** IsCrossHair ******************/
		/**** md5 signature: eacc42f7903c57103e79765342d95a00 ****/
		%feature("compactdefaultargs") IsCrossHair;
		%feature("autodoc", "Returns true if form is 20.

Returns
-------
bool
") IsCrossHair;
		Standard_Boolean IsCrossHair();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns number of data points.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		/**** md5 signature: 0851cb2dfd0f7363e8a8a289d2384c32 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the data point as pnt from gp. raises exception if index <= 0 or index > nbpoints().

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point(const Standard_Integer Index);

		/****************** SetCrossHair ******************/
		/**** md5 signature: b6ec7473703346911633bd62733412bd ****/
		%feature("compactdefaultargs") SetCrossHair;
		%feature("autodoc", "Sets formnumber to 20 if <mode> is true, 21 else.

Parameters
----------
mode: bool

Returns
-------
None
") SetCrossHair;
		void SetCrossHair(const Standard_Boolean mode);

		/****************** TransformedPoint ******************/
		/**** md5 signature: 54ce98555ac96e71a007511bdcdcc723 ****/
		%feature("compactdefaultargs") TransformedPoint;
		%feature("autodoc", "Returns the data point as pnt from gp after transformation. raises exception if index <= 0 or index > nbpoints().

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") TransformedPoint;
		gp_Pnt TransformedPoint(const Standard_Integer Index);

		/****************** ZDisplacement ******************/
		/**** md5 signature: 573a948c1f26eb677627269616f0b739 ****/
		%feature("compactdefaultargs") ZDisplacement;
		%feature("autodoc", "Returns common z displacement.

Returns
-------
float
") ZDisplacement;
		Standard_Real ZDisplacement();

};


%make_alias(IGESDimen_CenterLine)

%extend IGESDimen_CenterLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESDimen_CurveDimension *
*********************************/
class IGESDimen_CurveDimension : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_CurveDimension ******************/
		/**** md5 signature: 2a4dd0e0fa9f7044bb7afc42265ce204 ****/
		%feature("compactdefaultargs") IGESDimen_CurveDimension;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_CurveDimension;
		 IGESDimen_CurveDimension();

		/****************** FirstCurve ******************/
		/**** md5 signature: d8d16c4d8569f177ff8472d4e9f812e2 ****/
		%feature("compactdefaultargs") FirstCurve;
		%feature("autodoc", "Returns the first curve entity.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") FirstCurve;
		opencascade::handle<IGESData_IGESEntity> FirstCurve();

		/****************** FirstLeader ******************/
		/**** md5 signature: 40bbe80db9a9f9e240c121f71adaf9e4 ****/
		%feature("compactdefaultargs") FirstLeader;
		%feature("autodoc", "Returns the first leader entity.

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") FirstLeader;
		opencascade::handle<IGESDimen_LeaderArrow> FirstLeader();

		/****************** FirstWitnessLine ******************/
		/**** md5 signature: 9995f31941b0115043e5224f0decac7d ****/
		%feature("compactdefaultargs") FirstWitnessLine;
		%feature("autodoc", "Returns the first witness line entity or a null handle.

Returns
-------
opencascade::handle<IGESDimen_WitnessLine>
") FirstWitnessLine;
		opencascade::handle<IGESDimen_WitnessLine> FirstWitnessLine();

		/****************** HasFirstWitnessLine ******************/
		/**** md5 signature: 325a2035f3024ab6e7c8d79548055fb6 ****/
		%feature("compactdefaultargs") HasFirstWitnessLine;
		%feature("autodoc", "Returns false if thefirstwitnessline is a null handle.

Returns
-------
bool
") HasFirstWitnessLine;
		Standard_Boolean HasFirstWitnessLine();

		/****************** HasSecondCurve ******************/
		/**** md5 signature: 5a1c7a9a8ba9786761ffb36bb8846bed ****/
		%feature("compactdefaultargs") HasSecondCurve;
		%feature("autodoc", "Returns false if thesecondcurve is a null handle.

Returns
-------
bool
") HasSecondCurve;
		Standard_Boolean HasSecondCurve();

		/****************** HasSecondWitnessLine ******************/
		/**** md5 signature: c1b3fff94ec6538217169c6c5ea20a74 ****/
		%feature("compactdefaultargs") HasSecondWitnessLine;
		%feature("autodoc", "Returns false if thesecondwitnessline is a null handle.

Returns
-------
bool
") HasSecondWitnessLine;
		Standard_Boolean HasSecondWitnessLine();

		/****************** Init ******************/
		/**** md5 signature: af96b863ddda0a649d7f39ae29a78427 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class curvedimension - anote : general note entity - acurve : first curve entity - anothercurve : second curve entity or a null handle - aleader : first leader entity - anotherleader : second leader entity - aline : first witness line entity or a null handle - anotherline : second witness line entity or a null handle.

Parameters
----------
aNote: IGESDimen_GeneralNote
aCurve: IGESData_IGESEntity
anotherCurve: IGESData_IGESEntity
aLeader: IGESDimen_LeaderArrow
anotherLeader: IGESDimen_LeaderArrow
aLine: IGESDimen_WitnessLine
anotherLine: IGESDimen_WitnessLine

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDimen_GeneralNote> & aNote, const opencascade::handle<IGESData_IGESEntity> & aCurve, const opencascade::handle<IGESData_IGESEntity> & anotherCurve, const opencascade::handle<IGESDimen_LeaderArrow> & aLeader, const opencascade::handle<IGESDimen_LeaderArrow> & anotherLeader, const opencascade::handle<IGESDimen_WitnessLine> & aLine, const opencascade::handle<IGESDimen_WitnessLine> & anotherLine);

		/****************** Note ******************/
		/**** md5 signature: ed81f018a23a20d96ab113db3e6a212a ****/
		%feature("compactdefaultargs") Note;
		%feature("autodoc", "Returns the general note entity.

Returns
-------
opencascade::handle<IGESDimen_GeneralNote>
") Note;
		opencascade::handle<IGESDimen_GeneralNote> Note();

		/****************** SecondCurve ******************/
		/**** md5 signature: e311635ef09481fc793c3160750e93b1 ****/
		%feature("compactdefaultargs") SecondCurve;
		%feature("autodoc", "Returns the second curve entity or a null handle.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") SecondCurve;
		opencascade::handle<IGESData_IGESEntity> SecondCurve();

		/****************** SecondLeader ******************/
		/**** md5 signature: 0bc702f0862d8a40b0cf76a142ea4d3d ****/
		%feature("compactdefaultargs") SecondLeader;
		%feature("autodoc", "Returns the second leader entity.

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") SecondLeader;
		opencascade::handle<IGESDimen_LeaderArrow> SecondLeader();

		/****************** SecondWitnessLine ******************/
		/**** md5 signature: a5a135a7319ba50f5d1788de76599b31 ****/
		%feature("compactdefaultargs") SecondWitnessLine;
		%feature("autodoc", "Returns the second witness line entity or a null handle.

Returns
-------
opencascade::handle<IGESDimen_WitnessLine>
") SecondWitnessLine;
		opencascade::handle<IGESDimen_WitnessLine> SecondWitnessLine();

};


%make_alias(IGESDimen_CurveDimension)

%extend IGESDimen_CurveDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESDimen_DiameterDimension *
************************************/
class IGESDimen_DiameterDimension : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_DiameterDimension ******************/
		/**** md5 signature: ba026251c127f93cec48809d58dbf718 ****/
		%feature("compactdefaultargs") IGESDimen_DiameterDimension;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_DiameterDimension;
		 IGESDimen_DiameterDimension();

		/****************** Center ******************/
		/**** md5 signature: d391c25a397769ea5062a9d76f265423 ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns the arc center coordinates as pnt2d from package gp.

Returns
-------
gp_Pnt2d
") Center;
		gp_Pnt2d Center();

		/****************** FirstLeader ******************/
		/**** md5 signature: 40bbe80db9a9f9e240c121f71adaf9e4 ****/
		%feature("compactdefaultargs") FirstLeader;
		%feature("autodoc", "Returns the first leader entity.

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") FirstLeader;
		opencascade::handle<IGESDimen_LeaderArrow> FirstLeader();

		/****************** HasSecondLeader ******************/
		/**** md5 signature: e4937298c27fce4d6691664ad6433b2f ****/
		%feature("compactdefaultargs") HasSecondLeader;
		%feature("autodoc", "Returns false if thesecondleader is a null handle.

Returns
-------
bool
") HasSecondLeader;
		Standard_Boolean HasSecondLeader();

		/****************** Init ******************/
		/**** md5 signature: effe733fed7a564492bb00c0dc19a7f9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class diameterdimension - anote : general note entity - aleader : first leader entity - anotherleader : second leader entity or a null handle. - acenter : arc center coordinates.

Parameters
----------
aNote: IGESDimen_GeneralNote
aLeader: IGESDimen_LeaderArrow
anotherLeader: IGESDimen_LeaderArrow
aCenter: gp_XY

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDimen_GeneralNote> & aNote, const opencascade::handle<IGESDimen_LeaderArrow> & aLeader, const opencascade::handle<IGESDimen_LeaderArrow> & anotherLeader, const gp_XY & aCenter);

		/****************** Note ******************/
		/**** md5 signature: ed81f018a23a20d96ab113db3e6a212a ****/
		%feature("compactdefaultargs") Note;
		%feature("autodoc", "Returns the general note entity.

Returns
-------
opencascade::handle<IGESDimen_GeneralNote>
") Note;
		opencascade::handle<IGESDimen_GeneralNote> Note();

		/****************** SecondLeader ******************/
		/**** md5 signature: 0bc702f0862d8a40b0cf76a142ea4d3d ****/
		%feature("compactdefaultargs") SecondLeader;
		%feature("autodoc", "Returns the second leader entity.

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") SecondLeader;
		opencascade::handle<IGESDimen_LeaderArrow> SecondLeader();

		/****************** TransformedCenter ******************/
		/**** md5 signature: 468fd2ec0d6ba224ebb6cb8d176ef8f0 ****/
		%feature("compactdefaultargs") TransformedCenter;
		%feature("autodoc", "Returns the arc center coordinates as pnt2d from package gp after transformation. (z = 0.0 for transformation).

Returns
-------
gp_Pnt2d
") TransformedCenter;
		gp_Pnt2d TransformedCenter();

};


%make_alias(IGESDimen_DiameterDimension)

%extend IGESDimen_DiameterDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IGESDimen_DimensionDisplayData *
***************************************/
class IGESDimen_DimensionDisplayData : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_DimensionDisplayData ******************/
		/**** md5 signature: b7dc3c094b0d2ed53597883568e27900 ****/
		%feature("compactdefaultargs") IGESDimen_DimensionDisplayData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_DimensionDisplayData;
		 IGESDimen_DimensionDisplayData();

		/****************** ArrowHeadOrientation ******************/
		/**** md5 signature: 0a56c35ac30f63844e6d4394590db7f2 ****/
		%feature("compactdefaultargs") ArrowHeadOrientation;
		%feature("autodoc", "Returns the arrowhead orientation.

Returns
-------
int
") ArrowHeadOrientation;
		Standard_Integer ArrowHeadOrientation();

		/****************** CharacterSet ******************/
		/**** md5 signature: 38c9383bbee4ceb4527eac4eccbe0f19 ****/
		%feature("compactdefaultargs") CharacterSet;
		%feature("autodoc", "Returns the character set interpretation.

Returns
-------
int
") CharacterSet;
		Standard_Integer CharacterSet();

		/****************** DecimalSymbol ******************/
		/**** md5 signature: 189a5eda325d7117ba5442a6df238dc0 ****/
		%feature("compactdefaultargs") DecimalSymbol;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DecimalSymbol;
		Standard_Integer DecimalSymbol();

		/****************** DimensionType ******************/
		/**** md5 signature: 0897f7571748b115b69c4afe16d2a03e ****/
		%feature("compactdefaultargs") DimensionType;
		%feature("autodoc", "Returns the dimension type.

Returns
-------
int
") DimensionType;
		Standard_Integer DimensionType();

		/****************** EndIndex ******************/
		/**** md5 signature: 1ce695ac0151d00120e0899d5e4ab42f ****/
		%feature("compactdefaultargs") EndIndex;
		%feature("autodoc", "Returns the index'th note end index raises exception if index <= 0 or index > nbsupplemetarynotes().

Parameters
----------
Index: int

Returns
-------
int
") EndIndex;
		Standard_Integer EndIndex(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: d8faa329bff53f5d0e3d5d1fdaf98c8c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
numProps: int
aDimType: int
aLabelPos: int
aCharSet: int
aString: TCollection_HAsciiString
aSymbol: int
anAng: float
anAlign: int
aLevel: int
aPlace: int
anOrient: int
initVal: float
notes: TColStd_HArray1OfInteger
startInd: TColStd_HArray1OfInteger
endInd: TColStd_HArray1OfInteger

Returns
-------
None
") Init;
		void Init(const Standard_Integer numProps, const Standard_Integer aDimType, const Standard_Integer aLabelPos, const Standard_Integer aCharSet, const opencascade::handle<TCollection_HAsciiString> & aString, const Standard_Integer aSymbol, const Standard_Real anAng, const Standard_Integer anAlign, const Standard_Integer aLevel, const Standard_Integer aPlace, const Standard_Integer anOrient, const Standard_Real initVal, const opencascade::handle<TColStd_HArray1OfInteger> & notes, const opencascade::handle<TColStd_HArray1OfInteger> & startInd, const opencascade::handle<TColStd_HArray1OfInteger> & endInd);

		/****************** InitialValue ******************/
		/**** md5 signature: 30e09b26d3eb294815fde7dcca429ee9 ****/
		%feature("compactdefaultargs") InitialValue;
		%feature("autodoc", "Returns the primary dimension initial value.

Returns
-------
float
") InitialValue;
		Standard_Real InitialValue();

		/****************** LString ******************/
		/**** md5 signature: 7d9e5e70e87b9fef372689438c53b29a ****/
		%feature("compactdefaultargs") LString;
		%feature("autodoc", "Returns e.g., 8hdiameter.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") LString;
		opencascade::handle<TCollection_HAsciiString> LString();

		/****************** LabelPosition ******************/
		/**** md5 signature: 468dbc0e1903468dd328d7bee5a93b39 ****/
		%feature("compactdefaultargs") LabelPosition;
		%feature("autodoc", "Returns the preferred label position.

Returns
-------
int
") LabelPosition;
		Standard_Integer LabelPosition();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values (14).

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** NbSupplementaryNotes ******************/
		/**** md5 signature: 1612eff7d96690d2c12264c0b3c0e019 ****/
		%feature("compactdefaultargs") NbSupplementaryNotes;
		%feature("autodoc", "Returns the number of supplementary notes or zero.

Returns
-------
int
") NbSupplementaryNotes;
		Standard_Integer NbSupplementaryNotes();

		/****************** StartIndex ******************/
		/**** md5 signature: 49ea4ae9169585db4c172c159315cde1 ****/
		%feature("compactdefaultargs") StartIndex;
		%feature("autodoc", "Returns the index'th note start index raises exception if index <= 0 or index > nbsupplementarynotes().

Parameters
----------
Index: int

Returns
-------
int
") StartIndex;
		Standard_Integer StartIndex(const Standard_Integer Index);

		/****************** SupplementaryNote ******************/
		/**** md5 signature: cbb400fa8c78bfb9780349e42d9e4091 ****/
		%feature("compactdefaultargs") SupplementaryNote;
		%feature("autodoc", "Returns the index'th supplementary note raises exception if index <= 0 or index > nbsupplementarynotes().

Parameters
----------
Index: int

Returns
-------
int
") SupplementaryNote;
		Standard_Integer SupplementaryNote(const Standard_Integer Index);

		/****************** TextAlignment ******************/
		/**** md5 signature: dd13b5b3c58ef70a2cd43c076597fd31 ****/
		%feature("compactdefaultargs") TextAlignment;
		%feature("autodoc", "Returns the text alignment.

Returns
-------
int
") TextAlignment;
		Standard_Integer TextAlignment();

		/****************** TextLevel ******************/
		/**** md5 signature: 12edf3ea9e6cb3e11e0e8db64b5cae34 ****/
		%feature("compactdefaultargs") TextLevel;
		%feature("autodoc", "Returns the text level.

Returns
-------
int
") TextLevel;
		Standard_Integer TextLevel();

		/****************** TextPlacement ******************/
		/**** md5 signature: 0244a8cb2f145c96b201e97a4a4ac0f6 ****/
		%feature("compactdefaultargs") TextPlacement;
		%feature("autodoc", "Returns the preferred text placement.

Returns
-------
int
") TextPlacement;
		Standard_Integer TextPlacement();

		/****************** WitnessLineAngle ******************/
		/**** md5 signature: 39f0e7e50f2081d09a962fbf6a94e2c7 ****/
		%feature("compactdefaultargs") WitnessLineAngle;
		%feature("autodoc", "Returns the witness line angle in radians.

Returns
-------
float
") WitnessLineAngle;
		Standard_Real WitnessLineAngle();

};


%make_alias(IGESDimen_DimensionDisplayData)

%extend IGESDimen_DimensionDisplayData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESDimen_DimensionTolerance *
*************************************/
class IGESDimen_DimensionTolerance : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_DimensionTolerance ******************/
		/**** md5 signature: 22e4874431139fbae331ebdb029ceb51 ****/
		%feature("compactdefaultargs") IGESDimen_DimensionTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_DimensionTolerance;
		 IGESDimen_DimensionTolerance();

		/****************** FractionFlag ******************/
		/**** md5 signature: 0d2ddc3db7e20a9715416bbba43e08a1 ****/
		%feature("compactdefaultargs") FractionFlag;
		%feature("autodoc", "Returns the fraction flag.

Returns
-------
int
") FractionFlag;
		Standard_Integer FractionFlag();

		/****************** Init ******************/
		/**** md5 signature: 38bc5635f34ded6229b842bbd5560328 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class dimensiontolerance - nbpropval : number of property values, default = 8 - asectolflag : secondary tolerance flag 0 = applies to primary dimension 1 = applies to secondary dimension 2 = display values as fractions - atoltype : tolerance type 1 = bilateral 2 = upper/lower 3 = unilateral upper 4 = unilateral lower 5 = range - min before max 6 = range - min after max 7 = range - min above max 8 = range - min below max 9 = nominal + range - min above max 10 = nominal + range - min below max - atolplaceflag : tolerance placement flag 1 = before nominal value 2 = after nominal value 3 = above nominal value 4 = below nominal value - anuppertol : upper tolerance - alowertol : lower tolerance - asignflag : sign suppression flag - afracflag : fraction flag 0 = display values as decimal numbers 1 = display values as mixed fractions 2 = display values as fractions - aprecision : precision value.

Parameters
----------
nbPropVal: int
aSecTolFlag: int
aTolType: int
aTolPlaceFlag: int
anUpperTol: float
aLowerTol: float
aSignFlag: bool
aFracFlag: int
aPrecision: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const Standard_Integer aSecTolFlag, const Standard_Integer aTolType, const Standard_Integer aTolPlaceFlag, const Standard_Real anUpperTol, const Standard_Real aLowerTol, const Standard_Boolean aSignFlag, const Standard_Integer aFracFlag, const Standard_Integer aPrecision);

		/****************** LowerTolerance ******************/
		/**** md5 signature: 91f2aa2542c14c4c2c6f85baf6fd9d9c ****/
		%feature("compactdefaultargs") LowerTolerance;
		%feature("autodoc", "Returns the lower tolerance value.

Returns
-------
float
") LowerTolerance;
		Standard_Real LowerTolerance();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values, always = 8.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** Precision ******************/
		/**** md5 signature: ea66f3a8c1a7b66c36b9bf06ebd786f1 ****/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Returns the precision for value display.

Returns
-------
int
") Precision;
		Standard_Integer Precision();

		/****************** SecondaryToleranceFlag ******************/
		/**** md5 signature: 591671bc36cdf68ca1fe6218298d29e1 ****/
		%feature("compactdefaultargs") SecondaryToleranceFlag;
		%feature("autodoc", "Returns the secondary tolerance flag.

Returns
-------
int
") SecondaryToleranceFlag;
		Standard_Integer SecondaryToleranceFlag();

		/****************** SignSuppressionFlag ******************/
		/**** md5 signature: 77b4440eb4dc39ac3fb0e4559cdc58fd ****/
		%feature("compactdefaultargs") SignSuppressionFlag;
		%feature("autodoc", "Returns the sign suppression flag.

Returns
-------
bool
") SignSuppressionFlag;
		Standard_Boolean SignSuppressionFlag();

		/****************** TolerancePlacementFlag ******************/
		/**** md5 signature: 77e61fcac384711173f3692afaa479e4 ****/
		%feature("compactdefaultargs") TolerancePlacementFlag;
		%feature("autodoc", "Returns the tolerance placement flag, default = 2.

Returns
-------
int
") TolerancePlacementFlag;
		Standard_Integer TolerancePlacementFlag();

		/****************** ToleranceType ******************/
		/**** md5 signature: 855bd1e72976b6a508d66cc107a342b8 ****/
		%feature("compactdefaultargs") ToleranceType;
		%feature("autodoc", "Returns the tolerance type.

Returns
-------
int
") ToleranceType;
		Standard_Integer ToleranceType();

		/****************** UpperTolerance ******************/
		/**** md5 signature: b90eba12743c641f93dee1be486fdd7a ****/
		%feature("compactdefaultargs") UpperTolerance;
		%feature("autodoc", "Returns the upper or bilateral tolerance value.

Returns
-------
float
") UpperTolerance;
		Standard_Real UpperTolerance();

};


%make_alias(IGESDimen_DimensionTolerance)

%extend IGESDimen_DimensionTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESDimen_DimensionUnits *
*********************************/
class IGESDimen_DimensionUnits : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_DimensionUnits ******************/
		/**** md5 signature: 39f3bf7162c710cb4f1fa0480fb0b150 ****/
		%feature("compactdefaultargs") IGESDimen_DimensionUnits;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_DimensionUnits;
		 IGESDimen_DimensionUnits();

		/****************** CharacterSet ******************/
		/**** md5 signature: 38c9383bbee4ceb4527eac4eccbe0f19 ****/
		%feature("compactdefaultargs") CharacterSet;
		%feature("autodoc", "Returns the character set interpretation.

Returns
-------
int
") CharacterSet;
		Standard_Integer CharacterSet();

		/****************** FormatString ******************/
		/**** md5 signature: ebce813a10619e1105c63132bc1970c0 ****/
		%feature("compactdefaultargs") FormatString;
		%feature("autodoc", "Returns the string used in formatting value.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FormatString;
		opencascade::handle<TCollection_HAsciiString> FormatString();

		/****************** FractionFlag ******************/
		/**** md5 signature: 0d2ddc3db7e20a9715416bbba43e08a1 ****/
		%feature("compactdefaultargs") FractionFlag;
		%feature("autodoc", "Returns the fraction flag.

Returns
-------
int
") FractionFlag;
		Standard_Integer FractionFlag();

		/****************** Init ******************/
		/**** md5 signature: 4eeb28e410a9d073349922cda2241306 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class dimensionunits - nbpropval : number of property values, always = 6 - asecondpos : secondary dimension position 0 = this is the main text 1 = before primary dimension 2 = after primary dimension 3 = above primary dimension 4 = below primary dimension - aunitsind : units indicator - acharset : character set used - aformat : format hasciistring 1 = standard ascii 1001 = symbol font 1 1002 = symbol font 2 1003 = drafting font - afracflag : fraction flag 0 = display values as decimal numbers 1 = display values as fractions - aprecision : precision value.

Parameters
----------
nbPropVal: int
aSecondPos: int
aUnitsInd: int
aCharSet: int
aFormat: TCollection_HAsciiString
aFracFlag: int
aPrecision: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const Standard_Integer aSecondPos, const Standard_Integer aUnitsInd, const Standard_Integer aCharSet, const opencascade::handle<TCollection_HAsciiString> & aFormat, const Standard_Integer aFracFlag, const Standard_Integer aPrecision);

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** PrecisionOrDenominator ******************/
		/**** md5 signature: 3dcd6332056c345e9aca2f4d7703977e ****/
		%feature("compactdefaultargs") PrecisionOrDenominator;
		%feature("autodoc", "Returns the precision/denominator number of decimal places when fractionflag() = 0 denominator of fraction when fractionflag() = 1.

Returns
-------
int
") PrecisionOrDenominator;
		Standard_Integer PrecisionOrDenominator();

		/****************** SecondaryDimenPosition ******************/
		/**** md5 signature: eee53aef4cd86f78fa96466999c7e804 ****/
		%feature("compactdefaultargs") SecondaryDimenPosition;
		%feature("autodoc", "Returns position of secondary dimension w.r.t. primary dimension.

Returns
-------
int
") SecondaryDimenPosition;
		Standard_Integer SecondaryDimenPosition();

		/****************** UnitsIndicator ******************/
		/**** md5 signature: a034a35556b5f2a0dba85b6135ff1c0d ****/
		%feature("compactdefaultargs") UnitsIndicator;
		%feature("autodoc", "Returns the units indicator.

Returns
-------
int
") UnitsIndicator;
		Standard_Integer UnitsIndicator();

};


%make_alias(IGESDimen_DimensionUnits)

%extend IGESDimen_DimensionUnits {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESDimen_DimensionedGeometry *
**************************************/
class IGESDimen_DimensionedGeometry : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_DimensionedGeometry ******************/
		/**** md5 signature: 8b03d1f78225de434b8ce14322cd5b3a ****/
		%feature("compactdefaultargs") IGESDimen_DimensionedGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_DimensionedGeometry;
		 IGESDimen_DimensionedGeometry();

		/****************** DimensionEntity ******************/
		/**** md5 signature: faa05b69223efc3faf4e4bc909f53d69 ****/
		%feature("compactdefaultargs") DimensionEntity;
		%feature("autodoc", "Returns the dimension entity.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") DimensionEntity;
		opencascade::handle<IGESData_IGESEntity> DimensionEntity();

		/****************** GeometryEntity ******************/
		/**** md5 signature: dbbd1854375e383cc92b0f0dccaf0769 ****/
		%feature("compactdefaultargs") GeometryEntity;
		%feature("autodoc", "Returns the num'th geometry entity raises exception if index <= 0 or index > nbgeometryentities().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") GeometryEntity;
		opencascade::handle<IGESData_IGESEntity> GeometryEntity(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: df71959f43d09847c5edbb9004a29b38 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbDims: int
aDimension: IGESData_IGESEntity
entities: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbDims, const opencascade::handle<IGESData_IGESEntity> & aDimension, const opencascade::handle<IGESData_HArray1OfIGESEntity> & entities);

		/****************** NbDimensions ******************/
		/**** md5 signature: efd2367bff643c79aae9144f3f9c2e33 ****/
		%feature("compactdefaultargs") NbDimensions;
		%feature("autodoc", "Returns the number of dimensions.

Returns
-------
int
") NbDimensions;
		Standard_Integer NbDimensions();

		/****************** NbGeometryEntities ******************/
		/**** md5 signature: 17b1ce90eed1427a9755a1ad41ec4254 ****/
		%feature("compactdefaultargs") NbGeometryEntities;
		%feature("autodoc", "Returns the number of associated geometry entities.

Returns
-------
int
") NbGeometryEntities;
		Standard_Integer NbGeometryEntities();

};


%make_alias(IGESDimen_DimensionedGeometry)

%extend IGESDimen_DimensionedGeometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESDimen_FlagNote *
***************************/
class IGESDimen_FlagNote : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_FlagNote ******************/
		/**** md5 signature: 9bb8a5e65bd79f85c1ecf1926e2b68da ****/
		%feature("compactdefaultargs") IGESDimen_FlagNote;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_FlagNote;
		 IGESDimen_FlagNote();

		/****************** Angle ******************/
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns rotation angle in radians.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** CharacterHeight ******************/
		/**** md5 signature: db4bbf9931afb89cba8220ee7ca936c1 ****/
		%feature("compactdefaultargs") CharacterHeight;
		%feature("autodoc", "Returns the character height (from general note).

Returns
-------
float
") CharacterHeight;
		Standard_Real CharacterHeight();

		/****************** Height ******************/
		/**** md5 signature: b7486e9db42a6b5d4ef64408e52d8a4b ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Returns height computed by the formula : height = 2 * ch where ch is from thenote.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Init ******************/
		/**** md5 signature: 9911f2f6f687128d9ef35787fd76c1cd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class flagnote - leftcorner : lower left corner of the flag - anangle : rotation angle in radians - anote : general note entity - someleaders : leader entities.

Parameters
----------
leftCorner: gp_XYZ
anAngle: float
aNote: IGESDimen_GeneralNote
someLeaders: IGESDimen_HArray1OfLeaderArrow

Returns
-------
None
") Init;
		void Init(const gp_XYZ & leftCorner, const Standard_Real anAngle, const opencascade::handle<IGESDimen_GeneralNote> & aNote, const opencascade::handle<IGESDimen_HArray1OfLeaderArrow> & someLeaders);

		/****************** Leader ******************/
		/**** md5 signature: 9d0fe718372125c58bfc98ed6e02c07f ****/
		%feature("compactdefaultargs") Leader;
		%feature("autodoc", "Returns leader entity raises exception if index <= 0 or index > nbleaders().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") Leader;
		opencascade::handle<IGESDimen_LeaderArrow> Leader(const Standard_Integer Index);

		/****************** Length ******************/
		/**** md5 signature: 7a11021be5ff74a321b964da373ca8bd ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns length computed by the formula : length = tw + 0.4*ch where ch is from thenote and tw is from thenote.

Returns
-------
float
") Length;
		Standard_Real Length();

		/****************** LowerLeftCorner ******************/
		/**** md5 signature: 5bb1aedfa992f4fc0147b15c1edf5ec9 ****/
		%feature("compactdefaultargs") LowerLeftCorner;
		%feature("autodoc", "Returns lower left coordinate of flag as pnt from package gp.

Returns
-------
gp_Pnt
") LowerLeftCorner;
		gp_Pnt LowerLeftCorner();

		/****************** NbLeaders ******************/
		/**** md5 signature: a8c397a1f0463f407fe90e3df9af4857 ****/
		%feature("compactdefaultargs") NbLeaders;
		%feature("autodoc", "Returns number of arrows (leaders) or zero.

Returns
-------
int
") NbLeaders;
		Standard_Integer NbLeaders();

		/****************** Note ******************/
		/**** md5 signature: ed81f018a23a20d96ab113db3e6a212a ****/
		%feature("compactdefaultargs") Note;
		%feature("autodoc", "Returns general note entity.

Returns
-------
opencascade::handle<IGESDimen_GeneralNote>
") Note;
		opencascade::handle<IGESDimen_GeneralNote> Note();

		/****************** TextWidth ******************/
		/**** md5 signature: b8c82e8d8472086850e514a891d3a1d8 ****/
		%feature("compactdefaultargs") TextWidth;
		%feature("autodoc", "Returns the text width (from general note).

Returns
-------
float
") TextWidth;
		Standard_Real TextWidth();

		/****************** TipLength ******************/
		/**** md5 signature: 8a7b20690e915e179168af05ba2ae92a ****/
		%feature("compactdefaultargs") TipLength;
		%feature("autodoc", "Returns tiplength computed by the formula : tiplength = 0.5 * h / tan 35(deg) where h is height().

Returns
-------
float
") TipLength;
		Standard_Real TipLength();

		/****************** TransformedLowerLeftCorner ******************/
		/**** md5 signature: 825ebe61c8761c831b740cd26f62b719 ****/
		%feature("compactdefaultargs") TransformedLowerLeftCorner;
		%feature("autodoc", "Returns lower left coordinate of flag as pnt from package gp after transformation.

Returns
-------
gp_Pnt
") TransformedLowerLeftCorner;
		gp_Pnt TransformedLowerLeftCorner();

};


%make_alias(IGESDimen_FlagNote)

%extend IGESDimen_FlagNote {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESDimen_GeneralLabel *
*******************************/
class IGESDimen_GeneralLabel : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_GeneralLabel ******************/
		/**** md5 signature: 5da3e00e61fb3e11f21fa6991db3d2db ****/
		%feature("compactdefaultargs") IGESDimen_GeneralLabel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_GeneralLabel;
		 IGESDimen_GeneralLabel();

		/****************** Init ******************/
		/**** md5 signature: 55741de8912a8bebd09ca13ea06f03cd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class generallabel - anote : general note entity - someleaders : associated leader entities.

Parameters
----------
aNote: IGESDimen_GeneralNote
someLeaders: IGESDimen_HArray1OfLeaderArrow

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDimen_GeneralNote> & aNote, const opencascade::handle<IGESDimen_HArray1OfLeaderArrow> & someLeaders);

		/****************** Leader ******************/
		/**** md5 signature: 9d0fe718372125c58bfc98ed6e02c07f ****/
		%feature("compactdefaultargs") Leader;
		%feature("autodoc", "Returns leader entity raises exception if index <= 0 or index > nbleaders().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") Leader;
		opencascade::handle<IGESDimen_LeaderArrow> Leader(const Standard_Integer Index);

		/****************** NbLeaders ******************/
		/**** md5 signature: a8c397a1f0463f407fe90e3df9af4857 ****/
		%feature("compactdefaultargs") NbLeaders;
		%feature("autodoc", "Returns number of leaders.

Returns
-------
int
") NbLeaders;
		Standard_Integer NbLeaders();

		/****************** Note ******************/
		/**** md5 signature: ed81f018a23a20d96ab113db3e6a212a ****/
		%feature("compactdefaultargs") Note;
		%feature("autodoc", "Returns general note entity.

Returns
-------
opencascade::handle<IGESDimen_GeneralNote>
") Note;
		opencascade::handle<IGESDimen_GeneralNote> Note();

};


%make_alias(IGESDimen_GeneralLabel)

%extend IGESDimen_GeneralLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESDimen_GeneralModule *
********************************/
class IGESDimen_GeneralModule : public IGESData_GeneralModule {
	public:
		/****************** IGESDimen_GeneralModule ******************/
		/**** md5 signature: f426e4eb72747a9ce536e41a59241bee ****/
		%feature("compactdefaultargs") IGESDimen_GeneralModule;
		%feature("autodoc", "Creates a generalmodule from igesdimen and puts it into generallib.

Returns
-------
None
") IGESDimen_GeneralModule;
		 IGESDimen_GeneralModule();

		/****************** CategoryNumber ******************/
		/**** md5 signature: d812efe400e2084fa824301d3c147806 ****/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "Returns a category number which characterizes an entity drawing for all.

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


%make_alias(IGESDimen_GeneralModule)

%extend IGESDimen_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESDimen_GeneralNote *
******************************/
class IGESDimen_GeneralNote : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_GeneralNote ******************/
		/**** md5 signature: 21cf6e16a9ef6c4d1a63e721a3646429 ****/
		%feature("compactdefaultargs") IGESDimen_GeneralNote;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_GeneralNote;
		 IGESDimen_GeneralNote();

		/****************** BoxHeight ******************/
		/**** md5 signature: f7a3fde1dba33046f615c389dc253deb ****/
		%feature("compactdefaultargs") BoxHeight;
		%feature("autodoc", "Returns box height of string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") BoxHeight;
		Standard_Real BoxHeight(const Standard_Integer Index);

		/****************** BoxWidth ******************/
		/**** md5 signature: a0972d63f9fcb88ea0fc18e297e504c7 ****/
		%feature("compactdefaultargs") BoxWidth;
		%feature("autodoc", "Returns box width of string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") BoxWidth;
		Standard_Real BoxWidth(const Standard_Integer Index);

		/****************** FontCode ******************/
		/**** md5 signature: f5830ba228a01ea4ef9f101e76970242 ****/
		%feature("compactdefaultargs") FontCode;
		%feature("autodoc", "Returns font code (default = 1) of string returns 0 if isfontentity () is true raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
int
") FontCode;
		Standard_Integer FontCode(const Standard_Integer Index);

		/****************** FontEntity ******************/
		/**** md5 signature: de2e458c1dec51b17c83995c3f44cbe4 ****/
		%feature("compactdefaultargs") FontEntity;
		%feature("autodoc", "Returns text font definition entity of string returns a null handle if isfontentity () returns false raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESGraph_TextFontDef>
") FontEntity;
		opencascade::handle<IGESGraph_TextFontDef> FontEntity(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: f0971c960cf6fdb81118c78834a6a895 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class generalnote - nnbchars : number of chars strings - widths : box widths - heights : box heights - fontcodes : font codes, default = 1 - fonts : text font definition entities - slants : slant angles in radians - rotations : rotation angles in radians - mirrorflags : mirror flags - rotflags : rotation internal text flags - start : text start points - texts : text strings raises exception if there is mismatch between the various array lengths.

Parameters
----------
nbChars: TColStd_HArray1OfInteger
widths: TColStd_HArray1OfReal
heights: TColStd_HArray1OfReal
fontCodes: TColStd_HArray1OfInteger
fonts: IGESGraph_HArray1OfTextFontDef
slants: TColStd_HArray1OfReal
rotations: TColStd_HArray1OfReal
mirrorFlags: TColStd_HArray1OfInteger
rotFlags: TColStd_HArray1OfInteger
start: TColgp_HArray1OfXYZ
texts: Interface_HArray1OfHAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TColStd_HArray1OfInteger> & nbChars, const opencascade::handle<TColStd_HArray1OfReal> & widths, const opencascade::handle<TColStd_HArray1OfReal> & heights, const opencascade::handle<TColStd_HArray1OfInteger> & fontCodes, const opencascade::handle<IGESGraph_HArray1OfTextFontDef> & fonts, const opencascade::handle<TColStd_HArray1OfReal> & slants, const opencascade::handle<TColStd_HArray1OfReal> & rotations, const opencascade::handle<TColStd_HArray1OfInteger> & mirrorFlags, const opencascade::handle<TColStd_HArray1OfInteger> & rotFlags, const opencascade::handle<TColgp_HArray1OfXYZ> & start, const opencascade::handle<Interface_HArray1OfHAsciiString> & texts);

		/****************** IsFontEntity ******************/
		/**** md5 signature: deef4aca8ade5d354843c6c1863ab3d1 ****/
		%feature("compactdefaultargs") IsFontEntity;
		%feature("autodoc", "Returns false if value, true if entity raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
bool
") IsFontEntity;
		Standard_Boolean IsFontEntity(const Standard_Integer Index);

		/****************** MirrorFlag ******************/
		/**** md5 signature: 32236669f08773a23258bf5b72b415eb ****/
		%feature("compactdefaultargs") MirrorFlag;
		%feature("autodoc", "Returns mirror flag of string 0 = no mirroring 1 = mirror axis is perpendicular to the text base line 2 = mirror axis is text base line raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
int
") MirrorFlag;
		Standard_Integer MirrorFlag(const Standard_Integer Index);

		/****************** NbCharacters ******************/
		/**** md5 signature: d74d3b0b473d271994ef1ec485252353 ****/
		%feature("compactdefaultargs") NbCharacters;
		%feature("autodoc", "Returns number of characters of string or zero raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
int
") NbCharacters;
		Standard_Integer NbCharacters(const Standard_Integer Index);

		/****************** NbStrings ******************/
		/**** md5 signature: 483a2e234acda20ac1f199e3a553e1dd ****/
		%feature("compactdefaultargs") NbStrings;
		%feature("autodoc", "Returns number of text strings in general note.

Returns
-------
int
") NbStrings;
		Standard_Integer NbStrings();

		/****************** RotateFlag ******************/
		/**** md5 signature: d6f39da26e22d6ef2154e218e743a62e ****/
		%feature("compactdefaultargs") RotateFlag;
		%feature("autodoc", "Returns rotate internal text flag of string 0 = text horizontal 1 = text vertical raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
int
") RotateFlag;
		Standard_Integer RotateFlag(const Standard_Integer Index);

		/****************** RotationAngle ******************/
		/**** md5 signature: 3daadd14d0cb704d1db1795f62299bf9 ****/
		%feature("compactdefaultargs") RotationAngle;
		%feature("autodoc", "Returns rotation angle of string in radians raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") RotationAngle;
		Standard_Real RotationAngle(const Standard_Integer Index);

		/****************** SetFormNumber ******************/
		/**** md5 signature: 3324cf0241d76f0464eb1226a9a0994f ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "Changes formnumber (indicates graphical representation) error if not in ranges [0-8] or [100-102] or 105.

Parameters
----------
form: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer form);

		/****************** SlantAngle ******************/
		/**** md5 signature: 615c298be0ba2972e94a97d0afc372ed ****/
		%feature("compactdefaultargs") SlantAngle;
		%feature("autodoc", "Returns slant angle of string in radians default value = pi/2 raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") SlantAngle;
		Standard_Real SlantAngle(const Standard_Integer Index);

		/****************** StartPoint ******************/
		/**** md5 signature: 1af3b8079ad7000b1b96dcf18e3bdb5e ****/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns text start point of index'th string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") StartPoint;
		gp_Pnt StartPoint(const Standard_Integer Index);

		/****************** Text ******************/
		/**** md5 signature: ed8c55e9231db9823230acebdbedc92e ****/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Returns text string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Text;
		opencascade::handle<TCollection_HAsciiString> Text(const Standard_Integer Index);

		/****************** TransformedStartPoint ******************/
		/**** md5 signature: 49b080fe50572e67b5ea2ea7cb81ed79 ****/
		%feature("compactdefaultargs") TransformedStartPoint;
		%feature("autodoc", "Returns text start point of index'th string after transformation raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") TransformedStartPoint;
		gp_Pnt TransformedStartPoint(const Standard_Integer Index);

		/****************** ZDepthStartPoint ******************/
		/**** md5 signature: 9c12a7ec0bf1687855611fc431dd0b37 ****/
		%feature("compactdefaultargs") ZDepthStartPoint;
		%feature("autodoc", "Returns distance from start point plane of string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") ZDepthStartPoint;
		Standard_Real ZDepthStartPoint(const Standard_Integer Index);

};


%make_alias(IGESDimen_GeneralNote)

%extend IGESDimen_GeneralNote {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESDimen_GeneralSymbol *
********************************/
class IGESDimen_GeneralSymbol : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_GeneralSymbol ******************/
		/**** md5 signature: 3b9256c3e44174a2165ea9d645876ad6 ****/
		%feature("compactdefaultargs") IGESDimen_GeneralSymbol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_GeneralSymbol;
		 IGESDimen_GeneralSymbol();

		/****************** GeomEntity ******************/
		/**** md5 signature: 495863fd2ab9dc7f4917ab92e37ee6ae ****/
		%feature("compactdefaultargs") GeomEntity;
		%feature("autodoc", "Returns the index'th geometry entity raises exception if index <= 0 or index > nbgeomentities().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") GeomEntity;
		opencascade::handle<IGESData_IGESEntity> GeomEntity(const Standard_Integer Index);

		/****************** HasNote ******************/
		/**** md5 signature: 989a022070e96bf65a9776921d7d4999 ****/
		%feature("compactdefaultargs") HasNote;
		%feature("autodoc", "Returns true if there is associated general note entity.

Returns
-------
bool
") HasNote;
		Standard_Boolean HasNote();

		/****************** Init ******************/
		/**** md5 signature: c83ec5bcc28f29c925e4a0579d2c3532 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class generalsymbol - anote : general note, null for form 0 - allgeoms : geometric entities - allleaders : leader arrows.

Parameters
----------
aNote: IGESDimen_GeneralNote
allGeoms: IGESData_HArray1OfIGESEntity
allLeaders: IGESDimen_HArray1OfLeaderArrow

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDimen_GeneralNote> & aNote, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allGeoms, const opencascade::handle<IGESDimen_HArray1OfLeaderArrow> & allLeaders);

		/****************** LeaderArrow ******************/
		/**** md5 signature: 4f135441a45bc311e8280be0ce2abdc7 ****/
		%feature("compactdefaultargs") LeaderArrow;
		%feature("autodoc", "Returns the index'th leader arrow raises exception if index <= 0 or index > nbleaders().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") LeaderArrow;
		opencascade::handle<IGESDimen_LeaderArrow> LeaderArrow(const Standard_Integer Index);

		/****************** NbGeomEntities ******************/
		/**** md5 signature: 70874608ae74cf8f59591ceeff97876c ****/
		%feature("compactdefaultargs") NbGeomEntities;
		%feature("autodoc", "Returns number of geometry entities.

Returns
-------
int
") NbGeomEntities;
		Standard_Integer NbGeomEntities();

		/****************** NbLeaders ******************/
		/**** md5 signature: a8c397a1f0463f407fe90e3df9af4857 ****/
		%feature("compactdefaultargs") NbLeaders;
		%feature("autodoc", "Returns number of leaders or zero if not specified.

Returns
-------
int
") NbLeaders;
		Standard_Integer NbLeaders();

		/****************** Note ******************/
		/**** md5 signature: ed81f018a23a20d96ab113db3e6a212a ****/
		%feature("compactdefaultargs") Note;
		%feature("autodoc", "Returns null handle for form 0 only.

Returns
-------
opencascade::handle<IGESDimen_GeneralNote>
") Note;
		opencascade::handle<IGESDimen_GeneralNote> Note();

		/****************** SetFormNumber ******************/
		/**** md5 signature: 3324cf0241d76f0464eb1226a9a0994f ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "Changes formnumber (indicates the nature of the symbole) error if not in ranges [0-3] or [> 5000].

Parameters
----------
form: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer form);

};


%make_alias(IGESDimen_GeneralSymbol)

%extend IGESDimen_GeneralSymbol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESDimen_LeaderArrow *
******************************/
class IGESDimen_LeaderArrow : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_LeaderArrow ******************/
		/**** md5 signature: 324398709b4d8aee5e30eb947cc4a86f ****/
		%feature("compactdefaultargs") IGESDimen_LeaderArrow;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_LeaderArrow;
		 IGESDimen_LeaderArrow();

		/****************** ArrowHead ******************/
		/**** md5 signature: f3f4c3fe4802d49f2ccc8c31e11b0860 ****/
		%feature("compactdefaultargs") ArrowHead;
		%feature("autodoc", "Returns arrowhead coordinates.

Returns
-------
gp_Pnt2d
") ArrowHead;
		gp_Pnt2d ArrowHead();

		/****************** ArrowHeadHeight ******************/
		/**** md5 signature: f3565d3bf06c94f3f6242ba2b70692cb ****/
		%feature("compactdefaultargs") ArrowHeadHeight;
		%feature("autodoc", "Returns arrowhead height.

Returns
-------
float
") ArrowHeadHeight;
		Standard_Real ArrowHeadHeight();

		/****************** ArrowHeadWidth ******************/
		/**** md5 signature: 27fd1a9470965cb02de86476f784bf49 ****/
		%feature("compactdefaultargs") ArrowHeadWidth;
		%feature("autodoc", "Returns arrowhead width.

Returns
-------
float
") ArrowHeadWidth;
		Standard_Real ArrowHeadWidth();

		/****************** Init ******************/
		/**** md5 signature: 7cbc9d1ca90ff43ca0cec6c06254cecc ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class leaderarrow - height : arrowhead height - width : arrowhead width - depth : z depth - position : arrowhead coordinates - segments : segment tail coordinate pairs.

Parameters
----------
height: float
width: float
depth: float
position: gp_XY
segments: TColgp_HArray1OfXY

Returns
-------
None
") Init;
		void Init(const Standard_Real height, const Standard_Real width, const Standard_Real depth, const gp_XY & position, const opencascade::handle<TColgp_HArray1OfXY> & segments);

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns number of segments.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** SegmentTail ******************/
		/**** md5 signature: 42847d7cd635d629b4792e778ea7d898 ****/
		%feature("compactdefaultargs") SegmentTail;
		%feature("autodoc", "Returns segment tail coordinates. raises exception if index <= 0 or index > nbsegments.

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") SegmentTail;
		gp_Pnt2d SegmentTail(const Standard_Integer Index);

		/****************** SetFormNumber ******************/
		/**** md5 signature: 3324cf0241d76f0464eb1226a9a0994f ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "Changes formnumber (indicates the shape of the arrow) error if not in range [0-12].

Parameters
----------
form: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer form);

		/****************** TransformedArrowHead ******************/
		/**** md5 signature: 9fd3055ea1c334d58060121916b1eb36 ****/
		%feature("compactdefaultargs") TransformedArrowHead;
		%feature("autodoc", "Returns arrowhead coordinates after transformation.

Returns
-------
gp_Pnt
") TransformedArrowHead;
		gp_Pnt TransformedArrowHead();

		/****************** TransformedSegmentTail ******************/
		/**** md5 signature: 3f21f35cc599b52a3895c4ec89806b9e ****/
		%feature("compactdefaultargs") TransformedSegmentTail;
		%feature("autodoc", "Returns segment tail coordinates after transformation. raises exception if index <= 0 or index > nbsegments.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") TransformedSegmentTail;
		gp_Pnt TransformedSegmentTail(const Standard_Integer Index);

		/****************** ZDepth ******************/
		/**** md5 signature: 34b512612dbc0d99d902559666fcb7cb ****/
		%feature("compactdefaultargs") ZDepth;
		%feature("autodoc", "Returns z depth.

Returns
-------
float
") ZDepth;
		Standard_Real ZDepth();

};


%make_alias(IGESDimen_LeaderArrow)

%extend IGESDimen_LeaderArrow {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESDimen_LinearDimension *
**********************************/
class IGESDimen_LinearDimension : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_LinearDimension ******************/
		/**** md5 signature: a65a68006f5794b0fdf00d3984eb8aed ****/
		%feature("compactdefaultargs") IGESDimen_LinearDimension;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_LinearDimension;
		 IGESDimen_LinearDimension();

		/****************** FirstLeader ******************/
		/**** md5 signature: 40bbe80db9a9f9e240c121f71adaf9e4 ****/
		%feature("compactdefaultargs") FirstLeader;
		%feature("autodoc", "Returns first leader entity.

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") FirstLeader;
		opencascade::handle<IGESDimen_LeaderArrow> FirstLeader();

		/****************** FirstWitness ******************/
		/**** md5 signature: b3615af55b594cf2b902b3379e48c5fd ****/
		%feature("compactdefaultargs") FirstWitness;
		%feature("autodoc", "Returns first witness line entity or a null handle.

Returns
-------
opencascade::handle<IGESDimen_WitnessLine>
") FirstWitness;
		opencascade::handle<IGESDimen_WitnessLine> FirstWitness();

		/****************** HasFirstWitness ******************/
		/**** md5 signature: 672781f9cf04cec38adf4781b03cc650 ****/
		%feature("compactdefaultargs") HasFirstWitness;
		%feature("autodoc", "Returns false if no first witness line.

Returns
-------
bool
") HasFirstWitness;
		Standard_Boolean HasFirstWitness();

		/****************** HasSecondWitness ******************/
		/**** md5 signature: ffec60bfd96fc2578244110f62e62a87 ****/
		%feature("compactdefaultargs") HasSecondWitness;
		%feature("autodoc", "Returns false if no second witness line.

Returns
-------
bool
") HasSecondWitness;
		Standard_Boolean HasSecondWitness();

		/****************** Init ******************/
		/**** md5 signature: 50cd21856fd68b662dcc5ea327220551 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class lineardimension - anote : general note entity - aleader : first leader entity - anotherleader : second leader entity - awitness : first witness line entity or a null handle - anotherwitness : second witness line entity or a null handle.

Parameters
----------
aNote: IGESDimen_GeneralNote
aLeader: IGESDimen_LeaderArrow
anotherLeader: IGESDimen_LeaderArrow
aWitness: IGESDimen_WitnessLine
anotherWitness: IGESDimen_WitnessLine

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDimen_GeneralNote> & aNote, const opencascade::handle<IGESDimen_LeaderArrow> & aLeader, const opencascade::handle<IGESDimen_LeaderArrow> & anotherLeader, const opencascade::handle<IGESDimen_WitnessLine> & aWitness, const opencascade::handle<IGESDimen_WitnessLine> & anotherWitness);

		/****************** Note ******************/
		/**** md5 signature: ed81f018a23a20d96ab113db3e6a212a ****/
		%feature("compactdefaultargs") Note;
		%feature("autodoc", "Returns general note entity.

Returns
-------
opencascade::handle<IGESDimen_GeneralNote>
") Note;
		opencascade::handle<IGESDimen_GeneralNote> Note();

		/****************** SecondLeader ******************/
		/**** md5 signature: 0bc702f0862d8a40b0cf76a142ea4d3d ****/
		%feature("compactdefaultargs") SecondLeader;
		%feature("autodoc", "Returns second leader entity.

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") SecondLeader;
		opencascade::handle<IGESDimen_LeaderArrow> SecondLeader();

		/****************** SecondWitness ******************/
		/**** md5 signature: 561bbd8254978e0917a5ded13fb09476 ****/
		%feature("compactdefaultargs") SecondWitness;
		%feature("autodoc", "Returns second witness line entity or a null handle.

Returns
-------
opencascade::handle<IGESDimen_WitnessLine>
") SecondWitness;
		opencascade::handle<IGESDimen_WitnessLine> SecondWitness();

		/****************** SetFormNumber ******************/
		/**** md5 signature: 3324cf0241d76f0464eb1226a9a0994f ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "Changes formnumber (indicates the nature of the dimension unspecified, diameter or radius) error if not in range [0-2].

Parameters
----------
form: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer form);

};


%make_alias(IGESDimen_LinearDimension)

%extend IGESDimen_LinearDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESDimen_NewDimensionedGeometry *
*****************************************/
class IGESDimen_NewDimensionedGeometry : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_NewDimensionedGeometry ******************/
		/**** md5 signature: df712508f58e05b104e1fedc7438863b ****/
		%feature("compactdefaultargs") IGESDimen_NewDimensionedGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_NewDimensionedGeometry;
		 IGESDimen_NewDimensionedGeometry();

		/****************** AngleValue ******************/
		/**** md5 signature: 6ddab098bba216fed40d180ba0e9e545 ****/
		%feature("compactdefaultargs") AngleValue;
		%feature("autodoc", "Returns the angle value.

Returns
-------
float
") AngleValue;
		Standard_Real AngleValue();

		/****************** DimensionEntity ******************/
		/**** md5 signature: faa05b69223efc3faf4e4bc909f53d69 ****/
		%feature("compactdefaultargs") DimensionEntity;
		%feature("autodoc", "Returns the dimension entity.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") DimensionEntity;
		opencascade::handle<IGESData_IGESEntity> DimensionEntity();

		/****************** DimensionLocationFlag ******************/
		/**** md5 signature: b0d3c3b4d9c3e1221cf03d64a8531329 ****/
		%feature("compactdefaultargs") DimensionLocationFlag;
		%feature("autodoc", "Returns the index'th geometry entity's dimension location flag raises exception if index <= 0 or index > nbgeometries().

Parameters
----------
Index: int

Returns
-------
int
") DimensionLocationFlag;
		Standard_Integer DimensionLocationFlag(const Standard_Integer Index);

		/****************** DimensionOrientationFlag ******************/
		/**** md5 signature: c9c1a1bdc4526ace7c5b8772326bd3c8 ****/
		%feature("compactdefaultargs") DimensionOrientationFlag;
		%feature("autodoc", "Returns the dimension orientation flag.

Returns
-------
int
") DimensionOrientationFlag;
		Standard_Integer DimensionOrientationFlag();

		/****************** GeometryEntity ******************/
		/**** md5 signature: dbbd1854375e383cc92b0f0dccaf0769 ****/
		%feature("compactdefaultargs") GeometryEntity;
		%feature("autodoc", "Returns the index'th geometry entity raises exception if index <= 0 or index > nbgeometries().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") GeometryEntity;
		opencascade::handle<IGESData_IGESEntity> GeometryEntity(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: 5a9ab5f38e30e8adcafcfb8341480491 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class newdimensionedgeometry - nbdimen : number of dimensions, default = 1 - adimen : dimension entity - anorientation : dimension orientation flag - anangle : angle value - allentities : geometric entities - alllocations : dimension location flags - allpoints : points on the geometry entities exception raised if lengths of entities, locations, points are not the same.

Parameters
----------
nbDimens: int
aDimen: IGESData_IGESEntity
anOrientation: int
anAngle: float
allEntities: IGESData_HArray1OfIGESEntity
allLocations: TColStd_HArray1OfInteger
allPoints: TColgp_HArray1OfXYZ

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbDimens, const opencascade::handle<IGESData_IGESEntity> & aDimen, const Standard_Integer anOrientation, const Standard_Real anAngle, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allEntities, const opencascade::handle<TColStd_HArray1OfInteger> & allLocations, const opencascade::handle<TColgp_HArray1OfXYZ> & allPoints);

		/****************** NbDimensions ******************/
		/**** md5 signature: efd2367bff643c79aae9144f3f9c2e33 ****/
		%feature("compactdefaultargs") NbDimensions;
		%feature("autodoc", "Returns the number of dimensions.

Returns
-------
int
") NbDimensions;
		Standard_Integer NbDimensions();

		/****************** NbGeometries ******************/
		/**** md5 signature: a13234cb29e36dbe43a1363db56d5ecf ****/
		%feature("compactdefaultargs") NbGeometries;
		%feature("autodoc", "Returns the number of associated geometry entities.

Returns
-------
int
") NbGeometries;
		Standard_Integer NbGeometries();

		/****************** Point ******************/
		/**** md5 signature: 0851cb2dfd0f7363e8a8a289d2384c32 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Coordinate of point on index'th geometry entity raises exception if index <= 0 or index > nbgeometries().

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point(const Standard_Integer Index);

		/****************** TransformedPoint ******************/
		/**** md5 signature: 54ce98555ac96e71a007511bdcdcc723 ****/
		%feature("compactdefaultargs") TransformedPoint;
		%feature("autodoc", "Coordinate of point on index'th geometry entity after transformation raises exception if index <= 0 or index > nbgeometries().

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") TransformedPoint;
		gp_Pnt TransformedPoint(const Standard_Integer Index);

};


%make_alias(IGESDimen_NewDimensionedGeometry)

%extend IGESDimen_NewDimensionedGeometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESDimen_NewGeneralNote *
*********************************/
class IGESDimen_NewGeneralNote : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_NewGeneralNote ******************/
		/**** md5 signature: fa910986763df73215e0a1d1c8dd018c ****/
		%feature("compactdefaultargs") IGESDimen_NewGeneralNote;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_NewGeneralNote;
		 IGESDimen_NewGeneralNote();

		/****************** AreaLocation ******************/
		/**** md5 signature: 119f963eabc652049a65078ae86e55bc ****/
		%feature("compactdefaultargs") AreaLocation;
		%feature("autodoc", "Returns text containment area location point.

Returns
-------
gp_Pnt
") AreaLocation;
		gp_Pnt AreaLocation();

		/****************** AreaRotationAngle ******************/
		/**** md5 signature: b72669283256523e2ff40aa5da4a7cf6 ****/
		%feature("compactdefaultargs") AreaRotationAngle;
		%feature("autodoc", "Returns rotation angle of text containment area in radians.

Returns
-------
float
") AreaRotationAngle;
		Standard_Real AreaRotationAngle();

		/****************** BaseLinePosition ******************/
		/**** md5 signature: 1c10974a35c24de8715734eb4311c22a ****/
		%feature("compactdefaultargs") BaseLinePosition;
		%feature("autodoc", "Returns position of first base line.

Returns
-------
gp_Pnt
") BaseLinePosition;
		gp_Pnt BaseLinePosition();

		/****************** BoxHeight ******************/
		/**** md5 signature: f7a3fde1dba33046f615c389dc253deb ****/
		%feature("compactdefaultargs") BoxHeight;
		%feature("autodoc", "Returns box height of string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") BoxHeight;
		Standard_Real BoxHeight(const Standard_Integer Index);

		/****************** BoxWidth ******************/
		/**** md5 signature: a0972d63f9fcb88ea0fc18e297e504c7 ****/
		%feature("compactdefaultargs") BoxWidth;
		%feature("autodoc", "Returns box width of string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") BoxWidth;
		Standard_Real BoxWidth(const Standard_Integer Index);

		/****************** CharSetCode ******************/
		/**** md5 signature: 8d04e9c66aaadeec0819207e5a933573 ****/
		%feature("compactdefaultargs") CharSetCode;
		%feature("autodoc", "Returns character set interpretation (default = 1) of string returns 0 if ischarsetentity () is true 1 = standard ascii 1001 = symbol font1 1002 = symbol font2 1003 = symbol font3 raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
int
") CharSetCode;
		Standard_Integer CharSetCode(const Standard_Integer Index);

		/****************** CharSetEntity ******************/
		/**** md5 signature: 28d9fb57d9db49a117edd0fc0d67c277 ****/
		%feature("compactdefaultargs") CharSetEntity;
		%feature("autodoc", "Returns character set interpretation of string returns a null handle if ischarsetentity () is false raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") CharSetEntity;
		opencascade::handle<IGESData_IGESEntity> CharSetEntity(const Standard_Integer Index);

		/****************** CharacterAngle ******************/
		/**** md5 signature: 6bfc2e0e0e3b061dfdef1abfb2112210 ****/
		%feature("compactdefaultargs") CharacterAngle;
		%feature("autodoc", "Returns characterangle of string angle returned will be between 0 and 2pi raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") CharacterAngle;
		Standard_Real CharacterAngle(const Standard_Integer Index);

		/****************** CharacterDisplay ******************/
		/**** md5 signature: 3e0e345edf5ee9e88579838af853b421 ****/
		%feature("compactdefaultargs") CharacterDisplay;
		%feature("autodoc", "Returns fixed/variable width character display of string 0 = fixed 1 = variable raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
int
") CharacterDisplay;
		Standard_Integer CharacterDisplay(const Standard_Integer Index);

		/****************** CharacterHeight ******************/
		/**** md5 signature: 80ab2ca4637694d26628fe004e582b5f ****/
		%feature("compactdefaultargs") CharacterHeight;
		%feature("autodoc", "Returns character height of string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") CharacterHeight;
		Standard_Real CharacterHeight(const Standard_Integer Index);

		/****************** CharacterWidth ******************/
		/**** md5 signature: 6bfb5ddbec02e2f584ff9325816a2e61 ****/
		%feature("compactdefaultargs") CharacterWidth;
		%feature("autodoc", "Returns character width of string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") CharacterWidth;
		Standard_Real CharacterWidth(const Standard_Integer Index);

		/****************** ControlCodeString ******************/
		/**** md5 signature: 2707ed2eebecd74c5e7c4555f17cfb7f ****/
		%feature("compactdefaultargs") ControlCodeString;
		%feature("autodoc", "Returns controlcodestring of string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ControlCodeString;
		opencascade::handle<TCollection_HAsciiString> ControlCodeString(const Standard_Integer Index);

		/****************** FontStyle ******************/
		/**** md5 signature: 5b41c804ce8c954e7f70bccab5356433 ****/
		%feature("compactdefaultargs") FontStyle;
		%feature("autodoc", "Returns fontstyle of string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
int
") FontStyle;
		Standard_Integer FontStyle(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: a80638b1897f8f56a1636cf5391b948f ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class newgeneralnote - width : width of text containment area - height : height of text containment area - justifycode : justification code - arealoc  : text containment area location - arearotationangle : text containment area rotation - baselinepos : base line position - normalinterlinespace : normal interline spacing - chardisplays : character display type - charwidths  : character width - charheights : character height - intercharspc : intercharacter spacing - interlinespc : interline spacing - fontstyles  : font style - charangles  : character angle - controlcodestrings : control code string - nbchars  : number of characters in string - boxwidths : box width - boxheights  : box height - charsetcodes : character set interpretation - charsetentities : character set font - slangles : slant angle of text in radians - rotangles : rotation angle of text in radians - mirrorflags : type of mirroring - rotateflags : rotate internal text flag - startpoints : text start point - texts : text strings raises exception if there is mismatch between the various array lengths.

Parameters
----------
width: float
height: float
justifyCode: int
areaLoc: gp_XYZ
areaRotationAngle: float
baseLinePos: gp_XYZ
normalInterlineSpace: float
charDisplays: TColStd_HArray1OfInteger
charWidths: TColStd_HArray1OfReal
charHeights: TColStd_HArray1OfReal
interCharSpc: TColStd_HArray1OfReal
interLineSpc: TColStd_HArray1OfReal
fontStyles: TColStd_HArray1OfInteger
charAngles: TColStd_HArray1OfReal
controlCodeStrings: Interface_HArray1OfHAsciiString
nbChars: TColStd_HArray1OfInteger
boxWidths: TColStd_HArray1OfReal
boxHeights: TColStd_HArray1OfReal
charSetCodes: TColStd_HArray1OfInteger
charSetEntities: IGESData_HArray1OfIGESEntity
slAngles: TColStd_HArray1OfReal
rotAngles: TColStd_HArray1OfReal
mirrorFlags: TColStd_HArray1OfInteger
rotateFlags: TColStd_HArray1OfInteger
startPoints: TColgp_HArray1OfXYZ
texts: Interface_HArray1OfHAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Real width, const Standard_Real height, const Standard_Integer justifyCode, const gp_XYZ & areaLoc, const Standard_Real areaRotationAngle, const gp_XYZ & baseLinePos, const Standard_Real normalInterlineSpace, const opencascade::handle<TColStd_HArray1OfInteger> & charDisplays, const opencascade::handle<TColStd_HArray1OfReal> & charWidths, const opencascade::handle<TColStd_HArray1OfReal> & charHeights, const opencascade::handle<TColStd_HArray1OfReal> & interCharSpc, const opencascade::handle<TColStd_HArray1OfReal> & interLineSpc, const opencascade::handle<TColStd_HArray1OfInteger> & fontStyles, const opencascade::handle<TColStd_HArray1OfReal> & charAngles, const opencascade::handle<Interface_HArray1OfHAsciiString> & controlCodeStrings, const opencascade::handle<TColStd_HArray1OfInteger> & nbChars, const opencascade::handle<TColStd_HArray1OfReal> & boxWidths, const opencascade::handle<TColStd_HArray1OfReal> & boxHeights, const opencascade::handle<TColStd_HArray1OfInteger> & charSetCodes, const opencascade::handle<IGESData_HArray1OfIGESEntity> & charSetEntities, const opencascade::handle<TColStd_HArray1OfReal> & slAngles, const opencascade::handle<TColStd_HArray1OfReal> & rotAngles, const opencascade::handle<TColStd_HArray1OfInteger> & mirrorFlags, const opencascade::handle<TColStd_HArray1OfInteger> & rotateFlags, const opencascade::handle<TColgp_HArray1OfXYZ> & startPoints, const opencascade::handle<Interface_HArray1OfHAsciiString> & texts);

		/****************** InterCharacterSpace ******************/
		/**** md5 signature: 94050943afdcec813fd0ba8796f0a79f ****/
		%feature("compactdefaultargs") InterCharacterSpace;
		%feature("autodoc", "Returns inter-character spacing of string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") InterCharacterSpace;
		Standard_Real InterCharacterSpace(const Standard_Integer Index);

		/****************** InterlineSpace ******************/
		/**** md5 signature: 68ab986397d2e9487a8876302be69497 ****/
		%feature("compactdefaultargs") InterlineSpace;
		%feature("autodoc", "Returns interline spacing of string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") InterlineSpace;
		Standard_Real InterlineSpace(const Standard_Integer Index);

		/****************** IsCharSetEntity ******************/
		/**** md5 signature: e467319cbe4ab31f9e3180d574918b40 ****/
		%feature("compactdefaultargs") IsCharSetEntity;
		%feature("autodoc", "Returns false if value, true if pointer (entity) raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
bool
") IsCharSetEntity;
		Standard_Boolean IsCharSetEntity(const Standard_Integer Index);

		/****************** IsMirrored ******************/
		/**** md5 signature: a00b2778da63682ed1d3cf0ba1cc4bfb ****/
		%feature("compactdefaultargs") IsMirrored;
		%feature("autodoc", "Returns false if mirrorflag = 0. ie. no mirroring else returns true raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
bool
") IsMirrored;
		Standard_Boolean IsMirrored(const Standard_Integer Index);

		/****************** IsVariable ******************/
		/**** md5 signature: 03e88986612f8261d5e2972a5a9175cc ****/
		%feature("compactdefaultargs") IsVariable;
		%feature("autodoc", "Returns false if character display width is fixed optional method, if required raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
bool
") IsVariable;
		Standard_Boolean IsVariable(const Standard_Integer Index);

		/****************** JustifyCode ******************/
		/**** md5 signature: d09ce05cc437943834904ea78569b522 ****/
		%feature("compactdefaultargs") JustifyCode;
		%feature("autodoc", "Returns justification code of all strings within the note 0 = no justification 1 = right justified 2 = center justified 3 = left justified.

Returns
-------
int
") JustifyCode;
		Standard_Integer JustifyCode();

		/****************** MirrorFlag ******************/
		/**** md5 signature: 32236669f08773a23258bf5b72b415eb ****/
		%feature("compactdefaultargs") MirrorFlag;
		%feature("autodoc", "Returns mirror flag of string 0 = no mirroring 1 = mirror axis is perpendicular to the text base line 2 = mirror axis is text base line raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
int
") MirrorFlag;
		Standard_Integer MirrorFlag(const Standard_Integer Index);

		/****************** NbCharacters ******************/
		/**** md5 signature: d74d3b0b473d271994ef1ec485252353 ****/
		%feature("compactdefaultargs") NbCharacters;
		%feature("autodoc", "Returns number of characters in string or zero raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
int
") NbCharacters;
		Standard_Integer NbCharacters(const Standard_Integer Index);

		/****************** NbStrings ******************/
		/**** md5 signature: 483a2e234acda20ac1f199e3a553e1dd ****/
		%feature("compactdefaultargs") NbStrings;
		%feature("autodoc", "Returns number of text hasciistrings.

Returns
-------
int
") NbStrings;
		Standard_Integer NbStrings();

		/****************** NormalInterlineSpace ******************/
		/**** md5 signature: 33b4f7fd272d5621ea8515299b6fa69b ****/
		%feature("compactdefaultargs") NormalInterlineSpace;
		%feature("autodoc", "Returns normal interline spacing.

Returns
-------
float
") NormalInterlineSpace;
		Standard_Real NormalInterlineSpace();

		/****************** RotateFlag ******************/
		/**** md5 signature: d6f39da26e22d6ef2154e218e743a62e ****/
		%feature("compactdefaultargs") RotateFlag;
		%feature("autodoc", "Returns rotate internal text flag of string 0 = text horizontal 1 = text vertical raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
int
") RotateFlag;
		Standard_Integer RotateFlag(const Standard_Integer Index);

		/****************** RotationAngle ******************/
		/**** md5 signature: 3daadd14d0cb704d1db1795f62299bf9 ****/
		%feature("compactdefaultargs") RotationAngle;
		%feature("autodoc", "Returns rotation angle of string in radians raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") RotationAngle;
		Standard_Real RotationAngle(const Standard_Integer Index);

		/****************** SlantAngle ******************/
		/**** md5 signature: 615c298be0ba2972e94a97d0afc372ed ****/
		%feature("compactdefaultargs") SlantAngle;
		%feature("autodoc", "Returns slant angle of string in radians default value = pi/2 raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") SlantAngle;
		Standard_Real SlantAngle(const Standard_Integer Index);

		/****************** StartPoint ******************/
		/**** md5 signature: 1af3b8079ad7000b1b96dcf18e3bdb5e ****/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns text start point of string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") StartPoint;
		gp_Pnt StartPoint(const Standard_Integer Index);

		/****************** Text ******************/
		/**** md5 signature: ed8c55e9231db9823230acebdbedc92e ****/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Returns text string raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Text;
		opencascade::handle<TCollection_HAsciiString> Text(const Standard_Integer Index);

		/****************** TextHeight ******************/
		/**** md5 signature: 2acc4bd9a758874d57cada8afafd6c3a ****/
		%feature("compactdefaultargs") TextHeight;
		%feature("autodoc", "Returns height of text containment area of all strings in the note.

Returns
-------
float
") TextHeight;
		Standard_Real TextHeight();

		/****************** TextWidth ******************/
		/**** md5 signature: b8c82e8d8472086850e514a891d3a1d8 ****/
		%feature("compactdefaultargs") TextWidth;
		%feature("autodoc", "Returns width of text containment area of all strings in the note.

Returns
-------
float
") TextWidth;
		Standard_Real TextWidth();

		/****************** TransformedAreaLocation ******************/
		/**** md5 signature: 1fec2283d02768be8cde6711b14c6874 ****/
		%feature("compactdefaultargs") TransformedAreaLocation;
		%feature("autodoc", "Returns text containment area location point after transformation.

Returns
-------
gp_Pnt
") TransformedAreaLocation;
		gp_Pnt TransformedAreaLocation();

		/****************** TransformedBaseLinePosition ******************/
		/**** md5 signature: 253aa190ce82933e950b4b2df111a2b1 ****/
		%feature("compactdefaultargs") TransformedBaseLinePosition;
		%feature("autodoc", "Returns position of first base line after transformation.

Returns
-------
gp_Pnt
") TransformedBaseLinePosition;
		gp_Pnt TransformedBaseLinePosition();

		/****************** TransformedStartPoint ******************/
		/**** md5 signature: 49b080fe50572e67b5ea2ea7cb81ed79 ****/
		%feature("compactdefaultargs") TransformedStartPoint;
		%feature("autodoc", "Returns text start point of string after transformation raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") TransformedStartPoint;
		gp_Pnt TransformedStartPoint(const Standard_Integer Index);

		/****************** ZDepthAreaLocation ******************/
		/**** md5 signature: 847293ce0a0611c08749c0421b996412 ****/
		%feature("compactdefaultargs") ZDepthAreaLocation;
		%feature("autodoc", "Returns distance from the containment area plane.

Returns
-------
float
") ZDepthAreaLocation;
		Standard_Real ZDepthAreaLocation();

		/****************** ZDepthBaseLinePosition ******************/
		/**** md5 signature: cba54d51d9459ab6916a78979fd8abe6 ****/
		%feature("compactdefaultargs") ZDepthBaseLinePosition;
		%feature("autodoc", "Returns distance from the base line position plane.

Returns
-------
float
") ZDepthBaseLinePosition;
		Standard_Real ZDepthBaseLinePosition();

		/****************** ZDepthStartPoint ******************/
		/**** md5 signature: 9c12a7ec0bf1687855611fc431dd0b37 ****/
		%feature("compactdefaultargs") ZDepthStartPoint;
		%feature("autodoc", "Returns distance from the start point plane raises exception if index <= 0 or index > nbstrings().

Parameters
----------
Index: int

Returns
-------
float
") ZDepthStartPoint;
		Standard_Real ZDepthStartPoint(const Standard_Integer Index);

};


%make_alias(IGESDimen_NewGeneralNote)

%extend IGESDimen_NewGeneralNote {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESDimen_OrdinateDimension *
************************************/
class IGESDimen_OrdinateDimension : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_OrdinateDimension ******************/
		/**** md5 signature: bb5ae1a738e8ee127f043d33211b9b1a ****/
		%feature("compactdefaultargs") IGESDimen_OrdinateDimension;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_OrdinateDimension;
		 IGESDimen_OrdinateDimension();

		/****************** Init ******************/
		/**** md5 signature: a59bf5816a948c6bca377ef30621ca1a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aNote: IGESDimen_GeneralNote
aType: bool
aLine: IGESDimen_WitnessLine
anArrow: IGESDimen_LeaderArrow

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDimen_GeneralNote> & aNote, const Standard_Boolean aType, const opencascade::handle<IGESDimen_WitnessLine> & aLine, const opencascade::handle<IGESDimen_LeaderArrow> & anArrow);

		/****************** IsLeader ******************/
		/**** md5 signature: 2ebc9fd976b8ec50e36657e34e8f36ad ****/
		%feature("compactdefaultargs") IsLeader;
		%feature("autodoc", "Returns true if leader and false if witness line (only for form 0).

Returns
-------
bool
") IsLeader;
		Standard_Boolean IsLeader();

		/****************** IsLine ******************/
		/**** md5 signature: 51ad3b0e1f56ed6f328a7a7940918c54 ****/
		%feature("compactdefaultargs") IsLine;
		%feature("autodoc", "Returns true if witness line and false if leader (only for form 0).

Returns
-------
bool
") IsLine;
		Standard_Boolean IsLine();

		/****************** Leader ******************/
		/**** md5 signature: e9ba0d76966c3c07d4eb7f86aea08669 ****/
		%feature("compactdefaultargs") Leader;
		%feature("autodoc", "Returns the leader associated or null handle.

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") Leader;
		opencascade::handle<IGESDimen_LeaderArrow> Leader();

		/****************** Note ******************/
		/**** md5 signature: ed81f018a23a20d96ab113db3e6a212a ****/
		%feature("compactdefaultargs") Note;
		%feature("autodoc", "Returns the general note entity associated.

Returns
-------
opencascade::handle<IGESDimen_GeneralNote>
") Note;
		opencascade::handle<IGESDimen_GeneralNote> Note();

		/****************** WitnessLine ******************/
		/**** md5 signature: cc10a94e2ba3d4f8fde8bca8969fe375 ****/
		%feature("compactdefaultargs") WitnessLine;
		%feature("autodoc", "Returns the witness line associated or null handle.

Returns
-------
opencascade::handle<IGESDimen_WitnessLine>
") WitnessLine;
		opencascade::handle<IGESDimen_WitnessLine> WitnessLine();

};


%make_alias(IGESDimen_OrdinateDimension)

%extend IGESDimen_OrdinateDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESDimen_PointDimension *
*********************************/
class IGESDimen_PointDimension : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_PointDimension ******************/
		/**** md5 signature: 824e15f12a416f5ae0da98020de05a77 ****/
		%feature("compactdefaultargs") IGESDimen_PointDimension;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_PointDimension;
		 IGESDimen_PointDimension();

		/****************** CircularArc ******************/
		/**** md5 signature: 4a067d6a6baf6b47ed0c4f3ffca9b853 ****/
		%feature("compactdefaultargs") CircularArc;
		%feature("autodoc", "Returns null handle if geomcase(me) .ne. 1.

Returns
-------
opencascade::handle<IGESGeom_CircularArc>
") CircularArc;
		opencascade::handle<IGESGeom_CircularArc> CircularArc();

		/****************** CompositeCurve ******************/
		/**** md5 signature: 22ea8c3523c27ba72329f5734ebd1b6a ****/
		%feature("compactdefaultargs") CompositeCurve;
		%feature("autodoc", "Returns null handle if geomcase(me) .ne. 2.

Returns
-------
opencascade::handle<IGESGeom_CompositeCurve>
") CompositeCurve;
		opencascade::handle<IGESGeom_CompositeCurve> CompositeCurve();

		/****************** Geom ******************/
		/**** md5 signature: 1ce4944e8819f8e879d24e429157dcc9 ****/
		%feature("compactdefaultargs") Geom;
		%feature("autodoc", "Returns the geometry entity, null handle if geomcase(me) .eq. 0.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Geom;
		opencascade::handle<IGESData_IGESEntity> Geom();

		/****************** GeomCase ******************/
		/**** md5 signature: 9fca3f6433b80a14d244cc5eebd83bf2 ****/
		%feature("compactdefaultargs") GeomCase;
		%feature("autodoc", "Returns the type of geometric entity. 0 if no hexagon or circle encloses the text 1 if circulararc 2 if compositecurve 3 otherwise.

Returns
-------
int
") GeomCase;
		Standard_Integer GeomCase();

		/****************** Init ******************/
		/**** md5 signature: 82c8986ff223c6599d8f70a570bc4bf7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aNote: IGESDimen_GeneralNote
anArrow: IGESDimen_LeaderArrow
aGeom: IGESData_IGESEntity

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDimen_GeneralNote> & aNote, const opencascade::handle<IGESDimen_LeaderArrow> & anArrow, const opencascade::handle<IGESData_IGESEntity> & aGeom);

		/****************** LeaderArrow ******************/
		/**** md5 signature: 733ebfe019095a8b0b4798e9a940a3c9 ****/
		%feature("compactdefaultargs") LeaderArrow;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") LeaderArrow;
		opencascade::handle<IGESDimen_LeaderArrow> LeaderArrow();

		/****************** Note ******************/
		/**** md5 signature: ed81f018a23a20d96ab113db3e6a212a ****/
		%feature("compactdefaultargs") Note;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IGESDimen_GeneralNote>
") Note;
		opencascade::handle<IGESDimen_GeneralNote> Note();

};


%make_alias(IGESDimen_PointDimension)

%extend IGESDimen_PointDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESDimen_Protocol *
***************************/
class IGESDimen_Protocol : public IGESData_Protocol {
	public:
		/****************** IGESDimen_Protocol ******************/
		/**** md5 signature: 24fd846f8753bef913d7ab09827d57cf ****/
		%feature("compactdefaultargs") IGESDimen_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_Protocol;
		 IGESDimen_Protocol();

		/****************** NbResources ******************/
		/**** md5 signature: cd524335b33aeb6eb83cc80f6b7e5681 ****/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of resource protocol. here, two (protocols from igesgraph and igesgeom).

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


%make_alias(IGESDimen_Protocol)

%extend IGESDimen_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESDimen_RadiusDimension *
**********************************/
class IGESDimen_RadiusDimension : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_RadiusDimension ******************/
		/**** md5 signature: 687c171b91186bd2bd23dea1365477d9 ****/
		%feature("compactdefaultargs") IGESDimen_RadiusDimension;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_RadiusDimension;
		 IGESDimen_RadiusDimension();

		/****************** Center ******************/
		/**** md5 signature: d391c25a397769ea5062a9d76f265423 ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns the coordinates of the arc center.

Returns
-------
gp_Pnt2d
") Center;
		gp_Pnt2d Center();

		/****************** HasLeader2 ******************/
		/**** md5 signature: f4bc65aaf0146168ced21da99fdd95a2 ****/
		%feature("compactdefaultargs") HasLeader2;
		%feature("autodoc", "Returns true if form is 1, false if 0.

Returns
-------
bool
") HasLeader2;
		Standard_Boolean HasLeader2();

		/****************** Init ******************/
		/**** md5 signature: bcf67b16dd64c6dc28579e69a1960b87 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aNote: IGESDimen_GeneralNote
anArrow: IGESDimen_LeaderArrow
arcCenter: gp_XY
anotherArrow: IGESDimen_LeaderArrow

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDimen_GeneralNote> & aNote, const opencascade::handle<IGESDimen_LeaderArrow> & anArrow, const gp_XY & arcCenter, const opencascade::handle<IGESDimen_LeaderArrow> & anotherArrow);

		/****************** InitForm ******************/
		/**** md5 signature: b6843a597a9a5bb14751f0b72d5c1d43 ****/
		%feature("compactdefaultargs") InitForm;
		%feature("autodoc", "Allows to change form number (1 admits null arrow).

Parameters
----------
form: int

Returns
-------
None
") InitForm;
		void InitForm(const Standard_Integer form);

		/****************** Leader ******************/
		/**** md5 signature: e9ba0d76966c3c07d4eb7f86aea08669 ****/
		%feature("compactdefaultargs") Leader;
		%feature("autodoc", "Returns the leader arrow entity.

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") Leader;
		opencascade::handle<IGESDimen_LeaderArrow> Leader();

		/****************** Leader2 ******************/
		/**** md5 signature: 4c384a936f10ac87d53b9a78a8702a90 ****/
		%feature("compactdefaultargs") Leader2;
		%feature("autodoc", "Returns null handle if form is 0.

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") Leader2;
		opencascade::handle<IGESDimen_LeaderArrow> Leader2();

		/****************** Note ******************/
		/**** md5 signature: ed81f018a23a20d96ab113db3e6a212a ****/
		%feature("compactdefaultargs") Note;
		%feature("autodoc", "Returns the general note entity.

Returns
-------
opencascade::handle<IGESDimen_GeneralNote>
") Note;
		opencascade::handle<IGESDimen_GeneralNote> Note();

		/****************** TransformedCenter ******************/
		/**** md5 signature: 5d09d843a8d98dff53df916007422526 ****/
		%feature("compactdefaultargs") TransformedCenter;
		%feature("autodoc", "Returns the coordinates of the arc center after transformation (z coord taken from zdepth of leader entity).

Returns
-------
gp_Pnt
") TransformedCenter;
		gp_Pnt TransformedCenter();

};


%make_alias(IGESDimen_RadiusDimension)

%extend IGESDimen_RadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESDimen_ReadWriteModule *
**********************************/
class IGESDimen_ReadWriteModule : public IGESData_ReadWriteModule {
	public:
		/****************** IGESDimen_ReadWriteModule ******************/
		/**** md5 signature: b5b16211a5b0a3cf8502582c3b546adc ****/
		%feature("compactdefaultargs") IGESDimen_ReadWriteModule;
		%feature("autodoc", "Creates a readwritemodule & puts it into readerlib & writerlib.

Returns
-------
None
") IGESDimen_ReadWriteModule;
		 IGESDimen_ReadWriteModule();

		/****************** CaseIGES ******************/
		/**** md5 signature: de66f0948cefad4e0218511df612ee48 ****/
		%feature("compactdefaultargs") CaseIGES;
		%feature("autodoc", "Defines case numbers for entities of igesdimen.

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
		%feature("autodoc", "Reads own parameters from file for an entity of igesdimen.

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


%make_alias(IGESDimen_ReadWriteModule)

%extend IGESDimen_ReadWriteModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IGESDimen_Section *
**************************/
class IGESDimen_Section : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_Section ******************/
		/**** md5 signature: c3ea82c718664b16cb09a96aeb8ee876 ****/
		%feature("compactdefaultargs") IGESDimen_Section;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_Section;
		 IGESDimen_Section();

		/****************** Datatype ******************/
		/**** md5 signature: 6635b41a6e7c415ffe018ddf92784b58 ****/
		%feature("compactdefaultargs") Datatype;
		%feature("autodoc", "Returns interpretation flag, always = 1.

Returns
-------
int
") Datatype;
		Standard_Integer Datatype();

		/****************** Init ******************/
		/**** md5 signature: 429144dfbc8fcf4de32bd0473ba49adf ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class section - datatype : interpretation flag, always = 1 - adisp : common z displacement - datapoints : data points.

Parameters
----------
dataType: int
aDisp: float
dataPoints: TColgp_HArray1OfXY

Returns
-------
None
") Init;
		void Init(const Standard_Integer dataType, const Standard_Real aDisp, const opencascade::handle<TColgp_HArray1OfXY> & dataPoints);

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns number of data points.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		/**** md5 signature: 0851cb2dfd0f7363e8a8a289d2384c32 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns index'th data point raises exception if index <= 0 or index > nbpoints().

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point(const Standard_Integer Index);

		/****************** SetFormNumber ******************/
		/**** md5 signature: 3324cf0241d76f0464eb1226a9a0994f ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "Changes formnumber (indicates the type of the hatches) error if not in range [31-38].

Parameters
----------
form: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer form);

		/****************** TransformedPoint ******************/
		/**** md5 signature: 54ce98555ac96e71a007511bdcdcc723 ****/
		%feature("compactdefaultargs") TransformedPoint;
		%feature("autodoc", "Returns index'th data point after transformation raises exception if index <= 0 or index > nbpoints().

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") TransformedPoint;
		gp_Pnt TransformedPoint(const Standard_Integer Index);

		/****************** ZDisplacement ******************/
		/**** md5 signature: 573a948c1f26eb677627269616f0b739 ****/
		%feature("compactdefaultargs") ZDisplacement;
		%feature("autodoc", "Returns common z displacement.

Returns
-------
float
") ZDisplacement;
		Standard_Real ZDisplacement();

};


%make_alias(IGESDimen_Section)

%extend IGESDimen_Section {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESDimen_SectionedArea *
********************************/
class IGESDimen_SectionedArea : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_SectionedArea ******************/
		/**** md5 signature: 5939fccac116548070b16d6f4ff70a79 ****/
		%feature("compactdefaultargs") IGESDimen_SectionedArea;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_SectionedArea;
		 IGESDimen_SectionedArea();

		/****************** Angle ******************/
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the angle of lines with xt axis.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Distance ******************/
		/**** md5 signature: c054352e1b604c83d759bc4ccf6c526d ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the normal distance between lines.

Returns
-------
float
") Distance;
		Standard_Real Distance();

		/****************** ExteriorCurve ******************/
		/**** md5 signature: 4c647bcbc8fe509d634ba4517c635e59 ****/
		%feature("compactdefaultargs") ExteriorCurve;
		%feature("autodoc", "Returns the exterior definition curve.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") ExteriorCurve;
		opencascade::handle<IGESData_IGESEntity> ExteriorCurve();

		/****************** Init ******************/
		/**** md5 signature: b96677ce850b1367b582e5d4585af7e9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCurve: IGESData_IGESEntity
aPattern: int
aPoint: gp_XYZ
aDistance: float
anAngle: float
someIslands: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_IGESEntity> & aCurve, const Standard_Integer aPattern, const gp_XYZ & aPoint, const Standard_Real aDistance, const Standard_Real anAngle, const opencascade::handle<IGESData_HArray1OfIGESEntity> & someIslands);

		/****************** IsInverted ******************/
		/**** md5 signature: 0043898d41c9da3e4d6d779db330625a ****/
		%feature("compactdefaultargs") IsInverted;
		%feature("autodoc", "Returns true if cross hatches as inverted, else they are standard (inverted : form=1, standard : form=0).

Returns
-------
bool
") IsInverted;
		Standard_Boolean IsInverted();

		/****************** IslandCurve ******************/
		/**** md5 signature: 77d7cbbfd2611a483d9a1d9c05a69bfa ****/
		%feature("compactdefaultargs") IslandCurve;
		%feature("autodoc", "Returns the interior definition curves, returns null handle exception raised if index <= 0 or index > nbislands().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") IslandCurve;
		opencascade::handle<IGESData_IGESEntity> IslandCurve(const Standard_Integer Index);

		/****************** NbIslands ******************/
		/**** md5 signature: 818fa0e1520d002aab11b86620f66610 ****/
		%feature("compactdefaultargs") NbIslands;
		%feature("autodoc", "Returns the number of island curves.

Returns
-------
int
") NbIslands;
		Standard_Integer NbIslands();

		/****************** PassingPoint ******************/
		/**** md5 signature: eb85f574aecafb0ea9b1d28fff978183 ****/
		%feature("compactdefaultargs") PassingPoint;
		%feature("autodoc", "Returns point thru which line should pass.

Returns
-------
gp_Pnt
") PassingPoint;
		gp_Pnt PassingPoint();

		/****************** Pattern ******************/
		/**** md5 signature: 154bfbd4f4e3390fb4a0957068d70db9 ****/
		%feature("compactdefaultargs") Pattern;
		%feature("autodoc", "Returns fill pattern code.

Returns
-------
int
") Pattern;
		Standard_Integer Pattern();

		/****************** SetInverted ******************/
		/**** md5 signature: c085032988fa6c7f84cefca52cf65e71 ****/
		%feature("compactdefaultargs") SetInverted;
		%feature("autodoc", "Sets the cross hatches to be inverted or not, according value of <mode> (corresponds to formnumber).

Parameters
----------
mode: bool

Returns
-------
None
") SetInverted;
		void SetInverted(const Standard_Boolean mode);

		/****************** TransformedPassingPoint ******************/
		/**** md5 signature: 47c2b22c3576360891cf4561a8c77249 ****/
		%feature("compactdefaultargs") TransformedPassingPoint;
		%feature("autodoc", "Returns point thru which line should pass after transformation.

Returns
-------
gp_Pnt
") TransformedPassingPoint;
		gp_Pnt TransformedPassingPoint();

		/****************** ZDepth ******************/
		/**** md5 signature: 34b512612dbc0d99d902559666fcb7cb ****/
		%feature("compactdefaultargs") ZDepth;
		%feature("autodoc", "Returns the z depth.

Returns
-------
float
") ZDepth;
		Standard_Real ZDepth();

};


%make_alias(IGESDimen_SectionedArea)

%extend IGESDimen_SectionedArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESDimen_SpecificModule *
*********************************/
class IGESDimen_SpecificModule : public IGESData_SpecificModule {
	public:
		/****************** IGESDimen_SpecificModule ******************/
		/**** md5 signature: 667453baaab4277d46a0f694f6da26aa ****/
		%feature("compactdefaultargs") IGESDimen_SpecificModule;
		%feature("autodoc", "Creates a specificmodule from igesdimen & puts it into specificlib.

Returns
-------
None
") IGESDimen_SpecificModule;
		 IGESDimen_SpecificModule();

		/****************** OwnCorrect ******************/
		/**** md5 signature: bbaa7e58769f5cc28e757e0612cf4245 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Performs non-ambiguous corrections on entities which support them (basicdimension,centerline,dimensiondisplaydata, dimensiontolerance,dimensionunits,dimensionedgeometry, newdimensionedgeometry,section,witnessline).

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


%make_alias(IGESDimen_SpecificModule)

%extend IGESDimen_SpecificModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IGESDimen_ToolAngularDimension *
***************************************/
class IGESDimen_ToolAngularDimension {
	public:
		/****************** IGESDimen_ToolAngularDimension ******************/
		/**** md5 signature: 27ac8f4a05510bd514feade911c74f4b ****/
		%feature("compactdefaultargs") IGESDimen_ToolAngularDimension;
		%feature("autodoc", "Returns a toolangulardimension, ready to work.

Returns
-------
None
") IGESDimen_ToolAngularDimension;
		 IGESDimen_ToolAngularDimension();

		/****************** DirChecker ******************/
		/**** md5 signature: cd89204aa686c6f916f57c969265bdb7 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_AngularDimension

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_AngularDimension> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 6a3516c3706cf74b9b80238ac68fa883 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_AngularDimension
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_AngularDimension> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 2936638c88f69f3cd027b163cdbbd2bc ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_AngularDimension
entto: IGESDimen_AngularDimension
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_AngularDimension> & entfrom, const opencascade::handle<IGESDimen_AngularDimension> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 1eec8e73c70f82b0ab7362832ad7e5b9 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a angulardimension <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_AngularDimension
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_AngularDimension> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 59184cb602327375d20ee8fd57f888db ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_AngularDimension
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_AngularDimension> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 7b2c25140770522ba85a1c1a1882b930 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_AngularDimension
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_AngularDimension> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolAngularDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESDimen_ToolBasicDimension *
*************************************/
class IGESDimen_ToolBasicDimension {
	public:
		/****************** IGESDimen_ToolBasicDimension ******************/
		/**** md5 signature: e2e12199a93084dcc83d4d8b2351f53d ****/
		%feature("compactdefaultargs") IGESDimen_ToolBasicDimension;
		%feature("autodoc", "Returns a toolbasicdimension, ready to work.

Returns
-------
None
") IGESDimen_ToolBasicDimension;
		 IGESDimen_ToolBasicDimension();

		/****************** DirChecker ******************/
		/**** md5 signature: 558f4f8627c4de23140ff5ad47c6efad ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_BasicDimension

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_BasicDimension> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 598a0fc9c8537f3dce12a7554036d7f4 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_BasicDimension
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_BasicDimension> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: fa862ae6edb5829e5887af0380719fc9 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_BasicDimension
entto: IGESDimen_BasicDimension
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_BasicDimension> & entfrom, const opencascade::handle<IGESDimen_BasicDimension> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 9ede2d1947576d6a7c2e7b3cf658aa6d ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a basicdimension (nbpropertyvalues forced to 8).

Parameters
----------
ent: IGESDimen_BasicDimension

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDimen_BasicDimension> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 0ae0b1f9b2f1b745c5659792933208b4 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a basicdimension <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_BasicDimension
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_BasicDimension> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 452f67c9aed2b246bb021e825cf87ff0 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_BasicDimension
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_BasicDimension> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: fcca3a9d9270976f0773207f70c515d4 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_BasicDimension
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_BasicDimension> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolBasicDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESDimen_ToolCenterLine *
*********************************/
class IGESDimen_ToolCenterLine {
	public:
		/****************** IGESDimen_ToolCenterLine ******************/
		/**** md5 signature: 7824311ca269d7f51892188d8dd05781 ****/
		%feature("compactdefaultargs") IGESDimen_ToolCenterLine;
		%feature("autodoc", "Returns a toolcenterline, ready to work.

Returns
-------
None
") IGESDimen_ToolCenterLine;
		 IGESDimen_ToolCenterLine();

		/****************** DirChecker ******************/
		/**** md5 signature: 35dd79921102862decf2239b9be65f24 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_CenterLine

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_CenterLine> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 99c58bff5324b6609c83ffec0b8f630b ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_CenterLine
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_CenterLine> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 766fd84dce3349b6f2cf054c5e5bc6e2 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_CenterLine
entto: IGESDimen_CenterLine
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_CenterLine> & entfrom, const opencascade::handle<IGESDimen_CenterLine> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: a462c2d7006ee485a1b69347a927df87 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a centerline (linefont forced to rank = 1, datatype forced to 1).

Parameters
----------
ent: IGESDimen_CenterLine

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDimen_CenterLine> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 1944a351471b24f882e75c4701ea1ad3 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a centerline <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_CenterLine
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_CenterLine> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: d55741b8dfeb822ccafe2e2a569a4981 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_CenterLine
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_CenterLine> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: c509fbda2d4dff2817cbdc4e6390c531 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_CenterLine
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_CenterLine> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolCenterLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESDimen_ToolCurveDimension *
*************************************/
class IGESDimen_ToolCurveDimension {
	public:
		/****************** IGESDimen_ToolCurveDimension ******************/
		/**** md5 signature: a5b90872057f629771e508bfc4f6cc87 ****/
		%feature("compactdefaultargs") IGESDimen_ToolCurveDimension;
		%feature("autodoc", "Returns a toolcurvedimension, ready to work.

Returns
-------
None
") IGESDimen_ToolCurveDimension;
		 IGESDimen_ToolCurveDimension();

		/****************** DirChecker ******************/
		/**** md5 signature: 0b898e5c7f38f5141dd13fac989af073 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_CurveDimension

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_CurveDimension> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 7f67374de8e8fa0d1fe2ab9ac1a729d8 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_CurveDimension
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_CurveDimension> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: ff75dc7b8eee0dca11ff52c5ca3a1520 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_CurveDimension
entto: IGESDimen_CurveDimension
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_CurveDimension> & entfrom, const opencascade::handle<IGESDimen_CurveDimension> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: b7f8d1a17e8e504447f8c1b523f76810 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a curvedimension <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_CurveDimension
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_CurveDimension> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 259bd6a601628a941f9bc854c2f91dfe ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_CurveDimension
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_CurveDimension> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: a6df6cd460b7b0eda6d3d34e085d9cf9 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_CurveDimension
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_CurveDimension> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolCurveDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESDimen_ToolDiameterDimension *
****************************************/
class IGESDimen_ToolDiameterDimension {
	public:
		/****************** IGESDimen_ToolDiameterDimension ******************/
		/**** md5 signature: ccb785232403a4c2b70943ec298302d2 ****/
		%feature("compactdefaultargs") IGESDimen_ToolDiameterDimension;
		%feature("autodoc", "Returns a tooldiameterdimension, ready to work.

Returns
-------
None
") IGESDimen_ToolDiameterDimension;
		 IGESDimen_ToolDiameterDimension();

		/****************** DirChecker ******************/
		/**** md5 signature: 929a3b6dfbd491ef9c8dd3821e770240 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_DiameterDimension

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_DiameterDimension> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 8b80a4a0b45289e4213c53cff76c293a ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_DiameterDimension
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_DiameterDimension> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 21e1730471b2a4b41c05579b0edd1c05 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_DiameterDimension
entto: IGESDimen_DiameterDimension
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_DiameterDimension> & entfrom, const opencascade::handle<IGESDimen_DiameterDimension> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 90edde2c13f55eed2f6a3d41f0bd55e3 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a diameterdimension <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_DiameterDimension
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_DiameterDimension> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 173c951ba0e56b81894e72c6b8c4d9d4 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_DiameterDimension
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_DiameterDimension> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: e53ea13546960a4357530a19107e0baf ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_DiameterDimension
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_DiameterDimension> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolDiameterDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class IGESDimen_ToolDimensionDisplayData *
*******************************************/
class IGESDimen_ToolDimensionDisplayData {
	public:
		/****************** IGESDimen_ToolDimensionDisplayData ******************/
		/**** md5 signature: 24ee9729a1988646aee2b90688139018 ****/
		%feature("compactdefaultargs") IGESDimen_ToolDimensionDisplayData;
		%feature("autodoc", "Returns a tooldimensiondisplaydata, ready to work.

Returns
-------
None
") IGESDimen_ToolDimensionDisplayData;
		 IGESDimen_ToolDimensionDisplayData();

		/****************** DirChecker ******************/
		/**** md5 signature: 67de20a87dd2cb3590a4c89bc8f8a98f ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_DimensionDisplayData

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_DimensionDisplayData> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 026c036083946b7e822a964086d1068d ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_DimensionDisplayData
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_DimensionDisplayData> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 37b83dc46e58ef8d9298dd18d87f3ebc ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_DimensionDisplayData
entto: IGESDimen_DimensionDisplayData
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_DimensionDisplayData> & entfrom, const opencascade::handle<IGESDimen_DimensionDisplayData> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 63f98f254a36b4550e03c222e79b30d8 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a dimensiondisplaydata (nbpropertyvalues forced to 14).

Parameters
----------
ent: IGESDimen_DimensionDisplayData

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDimen_DimensionDisplayData> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 6a445cb5ddc78b798caf1189392b1ed4 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a dimensiondisplaydata <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_DimensionDisplayData
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_DimensionDisplayData> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 9baa6b174206ae60ad989395abb7b49d ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_DimensionDisplayData
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_DimensionDisplayData> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: bff6763b52f78a9e786f2a5ecfd5a7c8 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_DimensionDisplayData
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_DimensionDisplayData> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolDimensionDisplayData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESDimen_ToolDimensionTolerance *
*****************************************/
class IGESDimen_ToolDimensionTolerance {
	public:
		/****************** IGESDimen_ToolDimensionTolerance ******************/
		/**** md5 signature: 3d72802737f3ca2058b6f9fe29ae3ee7 ****/
		%feature("compactdefaultargs") IGESDimen_ToolDimensionTolerance;
		%feature("autodoc", "Returns a tooldimensiontolerance, ready to work.

Returns
-------
None
") IGESDimen_ToolDimensionTolerance;
		 IGESDimen_ToolDimensionTolerance();

		/****************** DirChecker ******************/
		/**** md5 signature: 93fe876113945e0ace6f31740b3685aa ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_DimensionTolerance

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_DimensionTolerance> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 5998b28860686a9f9fa7454f52308732 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_DimensionTolerance
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_DimensionTolerance> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: baa139b40fd3c72fa83aed4b9a39844c ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_DimensionTolerance
entto: IGESDimen_DimensionTolerance
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_DimensionTolerance> & entfrom, const opencascade::handle<IGESDimen_DimensionTolerance> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 11da7d3707c9e91acab4134a258523dd ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a dimensiontolerance (nbpropertyvalues forced to 8).

Parameters
----------
ent: IGESDimen_DimensionTolerance

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDimen_DimensionTolerance> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 4b10ad41bcf7f2c61292a9df99f1fae8 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a dimensiontolerance <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_DimensionTolerance
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_DimensionTolerance> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: b6dc5f83d8b5789ca4e7c93daa27dd44 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_DimensionTolerance
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_DimensionTolerance> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: b6296e7a3c632e2477b55699c02d98d8 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_DimensionTolerance
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_DimensionTolerance> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolDimensionTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESDimen_ToolDimensionUnits *
*************************************/
class IGESDimen_ToolDimensionUnits {
	public:
		/****************** IGESDimen_ToolDimensionUnits ******************/
		/**** md5 signature: c58b9bf8c80b65e6ecd76db24579b8c8 ****/
		%feature("compactdefaultargs") IGESDimen_ToolDimensionUnits;
		%feature("autodoc", "Returns a tooldimensionunits, ready to work.

Returns
-------
None
") IGESDimen_ToolDimensionUnits;
		 IGESDimen_ToolDimensionUnits();

		/****************** DirChecker ******************/
		/**** md5 signature: 967a3d79444ddec19c9b5ca85ddb3068 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_DimensionUnits

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_DimensionUnits> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 521f72fa29919faea6ef4a6c3ea53aee ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_DimensionUnits
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_DimensionUnits> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: f0d55a94330cd082c113223ec134cac1 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_DimensionUnits
entto: IGESDimen_DimensionUnits
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_DimensionUnits> & entfrom, const opencascade::handle<IGESDimen_DimensionUnits> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: e47d30c32c1b5766f65b5288d2009cad ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a dimensionunits (nbpropertyvalues forced to 6).

Parameters
----------
ent: IGESDimen_DimensionUnits

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDimen_DimensionUnits> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 0da90367c32954c2a61f2cfa61856908 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a dimensionunits <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_DimensionUnits
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_DimensionUnits> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 8d27769ec421604be7dd9376f5d683be ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_DimensionUnits
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_DimensionUnits> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: b739f7d99b2d44e4f240d4232a621e5d ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_DimensionUnits
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_DimensionUnits> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolDimensionUnits {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class IGESDimen_ToolDimensionedGeometry *
******************************************/
class IGESDimen_ToolDimensionedGeometry {
	public:
		/****************** IGESDimen_ToolDimensionedGeometry ******************/
		/**** md5 signature: f20a70a08bba09f4579503b66b31ae37 ****/
		%feature("compactdefaultargs") IGESDimen_ToolDimensionedGeometry;
		%feature("autodoc", "Returns a tooldimensionedgeometry, ready to work.

Returns
-------
None
") IGESDimen_ToolDimensionedGeometry;
		 IGESDimen_ToolDimensionedGeometry();

		/****************** DirChecker ******************/
		/**** md5 signature: 05ec45c9542a92c4fb7ff4f9101b7915 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_DimensionedGeometry

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_DimensionedGeometry> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 9ddcd708bb0b2baba9c233f6b3aab6ad ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_DimensionedGeometry
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_DimensionedGeometry> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 914df1691f5d630062bd40e9422ec2c3 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_DimensionedGeometry
entto: IGESDimen_DimensionedGeometry
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_DimensionedGeometry> & entfrom, const opencascade::handle<IGESDimen_DimensionedGeometry> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 7e4d6792ff815176a39b6c6c4d943729 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a dimensionedgeometry (nbdimensions forced to 1).

Parameters
----------
ent: IGESDimen_DimensionedGeometry

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDimen_DimensionedGeometry> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: d6bcdc40b553faa48c98496eb2d765b1 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a dimensionedgeometry <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_DimensionedGeometry
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_DimensionedGeometry> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 694bfd09f0f0fa4b41481e006af04e97 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_DimensionedGeometry
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_DimensionedGeometry> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 6c998b0601cc06366fe29d1ce110b39b ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_DimensionedGeometry
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_DimensionedGeometry> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolDimensionedGeometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESDimen_ToolFlagNote *
*******************************/
class IGESDimen_ToolFlagNote {
	public:
		/****************** IGESDimen_ToolFlagNote ******************/
		/**** md5 signature: 393d6b0218054d4d821de1ba203a32af ****/
		%feature("compactdefaultargs") IGESDimen_ToolFlagNote;
		%feature("autodoc", "Returns a toolflagnote, ready to work.

Returns
-------
None
") IGESDimen_ToolFlagNote;
		 IGESDimen_ToolFlagNote();

		/****************** DirChecker ******************/
		/**** md5 signature: 9a674858a8d560ec2d4b760301c16f78 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_FlagNote

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_FlagNote> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 8b4cc304242abbd3581ea48413658c6d ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_FlagNote
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_FlagNote> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 9f3bda973bf3547b0751bfa9e0473979 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_FlagNote
entto: IGESDimen_FlagNote
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_FlagNote> & entfrom, const opencascade::handle<IGESDimen_FlagNote> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 99f9c873406dbf0b01e04a3b4fc77db0 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a flagnote <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_FlagNote
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_FlagNote> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: dd2fb569cc6ad393dcfefe1eeaa6a619 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_FlagNote
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_FlagNote> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 95697c81f7cca93e9c476dd0c608f0a1 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_FlagNote
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_FlagNote> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolFlagNote {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESDimen_ToolGeneralLabel *
***********************************/
class IGESDimen_ToolGeneralLabel {
	public:
		/****************** IGESDimen_ToolGeneralLabel ******************/
		/**** md5 signature: 4835d2c12549c1dc8687623a6376d1e6 ****/
		%feature("compactdefaultargs") IGESDimen_ToolGeneralLabel;
		%feature("autodoc", "Returns a toolgenerallabel, ready to work.

Returns
-------
None
") IGESDimen_ToolGeneralLabel;
		 IGESDimen_ToolGeneralLabel();

		/****************** DirChecker ******************/
		/**** md5 signature: 9cecd6ffdcdf5f6afc8712a77697b64e ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_GeneralLabel

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_GeneralLabel> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 830b4255c990f4b35b9c53a3d9090c8d ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_GeneralLabel
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_GeneralLabel> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 20f8d896d83f03c8928224069695fbfa ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_GeneralLabel
entto: IGESDimen_GeneralLabel
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_GeneralLabel> & entfrom, const opencascade::handle<IGESDimen_GeneralLabel> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 31f6263f6a31821e819c91dde586bfc0 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a generallabel <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_GeneralLabel
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_GeneralLabel> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: a4c59a207f03497308c97e38469d96fd ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_GeneralLabel
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_GeneralLabel> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: cd075036aa335b02c25cd83df6d9ae67 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_GeneralLabel
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_GeneralLabel> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolGeneralLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESDimen_ToolGeneralNote *
**********************************/
class IGESDimen_ToolGeneralNote {
	public:
		/****************** IGESDimen_ToolGeneralNote ******************/
		/**** md5 signature: 5b0017ab6bb4e67cd6675713f6be75fc ****/
		%feature("compactdefaultargs") IGESDimen_ToolGeneralNote;
		%feature("autodoc", "Returns a toolgeneralnote, ready to work.

Returns
-------
None
") IGESDimen_ToolGeneralNote;
		 IGESDimen_ToolGeneralNote();

		/****************** DirChecker ******************/
		/**** md5 signature: dc39817f1db68a6cb64c7b5ff3e7c9d7 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_GeneralNote

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_GeneralNote> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: beb3c79cd399643f5b6487c48e26b7ca ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_GeneralNote
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_GeneralNote> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 5203afea7caad3124ea10d6a3582df1c ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_GeneralNote
entto: IGESDimen_GeneralNote
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_GeneralNote> & entfrom, const opencascade::handle<IGESDimen_GeneralNote> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 084c1d3b6991c8c5ecad255efc0550c8 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a generalnote <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_GeneralNote
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_GeneralNote> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: bbd345d839408ec3524b50babb95d43a ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_GeneralNote
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_GeneralNote> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 41a07b252e9e341b7b27a79b7ee78537 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_GeneralNote
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_GeneralNote> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolGeneralNote {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESDimen_ToolGeneralSymbol *
************************************/
class IGESDimen_ToolGeneralSymbol {
	public:
		/****************** IGESDimen_ToolGeneralSymbol ******************/
		/**** md5 signature: 7660217b8e76a57f01b3cef8c886b712 ****/
		%feature("compactdefaultargs") IGESDimen_ToolGeneralSymbol;
		%feature("autodoc", "Returns a toolgeneralsymbol, ready to work.

Returns
-------
None
") IGESDimen_ToolGeneralSymbol;
		 IGESDimen_ToolGeneralSymbol();

		/****************** DirChecker ******************/
		/**** md5 signature: 53b18e0e385683e4e173cf6af0e70291 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_GeneralSymbol

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_GeneralSymbol> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: f6a48964a8191105277b545619c7640b ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_GeneralSymbol
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_GeneralSymbol> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 5435024637fe8b137b62025a357aa677 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_GeneralSymbol
entto: IGESDimen_GeneralSymbol
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_GeneralSymbol> & entfrom, const opencascade::handle<IGESDimen_GeneralSymbol> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 51b4473dba138bb0cca3f079abbc9734 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a generalsymbol <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_GeneralSymbol
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_GeneralSymbol> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 36a50f4b78efad2e609878c6f8fd3c96 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_GeneralSymbol
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_GeneralSymbol> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: a7ead70aeb68f9e9f959d002645a78c6 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_GeneralSymbol
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_GeneralSymbol> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolGeneralSymbol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESDimen_ToolLeaderArrow *
**********************************/
class IGESDimen_ToolLeaderArrow {
	public:
		/****************** IGESDimen_ToolLeaderArrow ******************/
		/**** md5 signature: 784b5961e7591ceb1cfd6bc65bdb5a9f ****/
		%feature("compactdefaultargs") IGESDimen_ToolLeaderArrow;
		%feature("autodoc", "Returns a toolleaderarrow, ready to work.

Returns
-------
None
") IGESDimen_ToolLeaderArrow;
		 IGESDimen_ToolLeaderArrow();

		/****************** DirChecker ******************/
		/**** md5 signature: 3d780fd694eb9fb9d7da6c4a39dc9b70 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_LeaderArrow

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_LeaderArrow> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 8d3fdfbf4e8388bca435814df6af1ef0 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_LeaderArrow
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_LeaderArrow> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 2f60cdb7681ea3bd4449d80ec8134780 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_LeaderArrow
entto: IGESDimen_LeaderArrow
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_LeaderArrow> & entfrom, const opencascade::handle<IGESDimen_LeaderArrow> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 8cce7bdbaa54f8d4ce8b38161c503131 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a leaderarrow <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_LeaderArrow
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_LeaderArrow> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 4e150060c23d86d8d62733b48dc5db52 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_LeaderArrow
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_LeaderArrow> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 51010e1dfd0b0f2393eec674dd774248 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_LeaderArrow
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_LeaderArrow> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolLeaderArrow {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESDimen_ToolLinearDimension *
**************************************/
class IGESDimen_ToolLinearDimension {
	public:
		/****************** IGESDimen_ToolLinearDimension ******************/
		/**** md5 signature: 01ac3f99e1eb4715c41f519bd4a8168a ****/
		%feature("compactdefaultargs") IGESDimen_ToolLinearDimension;
		%feature("autodoc", "Returns a toollineardimension, ready to work.

Returns
-------
None
") IGESDimen_ToolLinearDimension;
		 IGESDimen_ToolLinearDimension();

		/****************** DirChecker ******************/
		/**** md5 signature: ca090496109c79b3dd45e34374185e90 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_LinearDimension

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_LinearDimension> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: f968c4317d31e0c898c33307803add42 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_LinearDimension
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_LinearDimension> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 934dbef890de093df85c7c9fd4b42d4b ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_LinearDimension
entto: IGESDimen_LinearDimension
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_LinearDimension> & entfrom, const opencascade::handle<IGESDimen_LinearDimension> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 2e166fc59ce84e54784e21f40408cdd9 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a lineardimension <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_LinearDimension
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_LinearDimension> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 622d28ab16830a2b98a36228bb04f2ac ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_LinearDimension
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_LinearDimension> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 185c6af58192c4474727fa41134dfbd1 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_LinearDimension
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_LinearDimension> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolLinearDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class IGESDimen_ToolNewDimensionedGeometry *
*********************************************/
class IGESDimen_ToolNewDimensionedGeometry {
	public:
		/****************** IGESDimen_ToolNewDimensionedGeometry ******************/
		/**** md5 signature: ee3e8330e7636fed53fc23df53c17f61 ****/
		%feature("compactdefaultargs") IGESDimen_ToolNewDimensionedGeometry;
		%feature("autodoc", "Returns a toolnewdimensionedgeometry, ready to work.

Returns
-------
None
") IGESDimen_ToolNewDimensionedGeometry;
		 IGESDimen_ToolNewDimensionedGeometry();

		/****************** DirChecker ******************/
		/**** md5 signature: 6b7e7f0081486babbd2178b94b73918d ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_NewDimensionedGeometry

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_NewDimensionedGeometry> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 8b64aad6f4cbbfedecbe6ab901029e5c ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_NewDimensionedGeometry
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_NewDimensionedGeometry> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 69e0a9044540ab06d35bf911a485f622 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_NewDimensionedGeometry
entto: IGESDimen_NewDimensionedGeometry
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_NewDimensionedGeometry> & entfrom, const opencascade::handle<IGESDimen_NewDimensionedGeometry> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 21d85c8b180801f2fac3f3cfb8fe5348 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a newdimensionedgeometry (nbdimensions forced to 1, transf nullified in d.e.).

Parameters
----------
ent: IGESDimen_NewDimensionedGeometry

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDimen_NewDimensionedGeometry> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 180023a756d4c76979021a47bc3e0ab6 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a newdimensionedgeometry <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_NewDimensionedGeometry
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_NewDimensionedGeometry> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 4c904a990f6b4830ca45a97788b9bcc6 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_NewDimensionedGeometry
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_NewDimensionedGeometry> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 5c4649b0bee55c9af079793f272f9109 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_NewDimensionedGeometry
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_NewDimensionedGeometry> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolNewDimensionedGeometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESDimen_ToolNewGeneralNote *
*************************************/
class IGESDimen_ToolNewGeneralNote {
	public:
		/****************** IGESDimen_ToolNewGeneralNote ******************/
		/**** md5 signature: 77dc7df2fb9116b28cb72039ef44afe9 ****/
		%feature("compactdefaultargs") IGESDimen_ToolNewGeneralNote;
		%feature("autodoc", "Returns a toolnewgeneralnote, ready to work.

Returns
-------
None
") IGESDimen_ToolNewGeneralNote;
		 IGESDimen_ToolNewGeneralNote();

		/****************** DirChecker ******************/
		/**** md5 signature: a2d922b1df6a2410f6b207cc3e227e7a ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_NewGeneralNote

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_NewGeneralNote> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 907264d6dfd93fca565d41c36989f98a ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_NewGeneralNote
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_NewGeneralNote> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: fbfe414b12fd64351a0ab30111eeba5b ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_NewGeneralNote
entto: IGESDimen_NewGeneralNote
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_NewGeneralNote> & entfrom, const opencascade::handle<IGESDimen_NewGeneralNote> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: d060321f1802d05506565c25b12c5781 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a newgeneralnote <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_NewGeneralNote
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_NewGeneralNote> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 74d3a8046f636e4fc844f5479b3428e5 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_NewGeneralNote
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_NewGeneralNote> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 2f02454e86c973d60888e7851465a49b ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_NewGeneralNote
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_NewGeneralNote> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolNewGeneralNote {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESDimen_ToolOrdinateDimension *
****************************************/
class IGESDimen_ToolOrdinateDimension {
	public:
		/****************** IGESDimen_ToolOrdinateDimension ******************/
		/**** md5 signature: d19bba80f594b8bd74ca6879751107c7 ****/
		%feature("compactdefaultargs") IGESDimen_ToolOrdinateDimension;
		%feature("autodoc", "Returns a toolordinatedimension, ready to work.

Returns
-------
None
") IGESDimen_ToolOrdinateDimension;
		 IGESDimen_ToolOrdinateDimension();

		/****************** DirChecker ******************/
		/**** md5 signature: 83dfa595e6661b8dbbc0d1d79220dadf ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_OrdinateDimension

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_OrdinateDimension> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: d68f58c1861cca1739cedb89bd55b4b9 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_OrdinateDimension
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_OrdinateDimension> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 4d35df1b073326742679993806db0ca2 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_OrdinateDimension
entto: IGESDimen_OrdinateDimension
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_OrdinateDimension> & entfrom, const opencascade::handle<IGESDimen_OrdinateDimension> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 501d4a79ef53dfb115d9c6fb29842438 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a ordinatedimension <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_OrdinateDimension
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_OrdinateDimension> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 55b8e83aea872bc0d4e98282cceaf7ae ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_OrdinateDimension
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_OrdinateDimension> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: c5adb316ec10a984c49a9ef658aec3f4 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_OrdinateDimension
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_OrdinateDimension> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolOrdinateDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESDimen_ToolPointDimension *
*************************************/
class IGESDimen_ToolPointDimension {
	public:
		/****************** IGESDimen_ToolPointDimension ******************/
		/**** md5 signature: c50996c783d8a92404ae36f5cb1b5d44 ****/
		%feature("compactdefaultargs") IGESDimen_ToolPointDimension;
		%feature("autodoc", "Returns a toolpointdimension, ready to work.

Returns
-------
None
") IGESDimen_ToolPointDimension;
		 IGESDimen_ToolPointDimension();

		/****************** DirChecker ******************/
		/**** md5 signature: ba0e53c3443beaee1f169160bb84d312 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_PointDimension

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_PointDimension> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 33642ce70335d1564d613861356328c4 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_PointDimension
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_PointDimension> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 2cc82138613cb74c1e70358b1fc413df ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_PointDimension
entto: IGESDimen_PointDimension
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_PointDimension> & entfrom, const opencascade::handle<IGESDimen_PointDimension> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 87743a27e7c103eb607a779426ec3922 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a pointdimension <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_PointDimension
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_PointDimension> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 650ff62d0fc346a88c10df19ff11cd59 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_PointDimension
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_PointDimension> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: d699fcca9e002ade09d9a4e31b950fbc ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_PointDimension
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_PointDimension> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolPointDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESDimen_ToolRadiusDimension *
**************************************/
class IGESDimen_ToolRadiusDimension {
	public:
		/****************** IGESDimen_ToolRadiusDimension ******************/
		/**** md5 signature: 705db3a2d8f485721f7b233b666de6ce ****/
		%feature("compactdefaultargs") IGESDimen_ToolRadiusDimension;
		%feature("autodoc", "Returns a toolradiusdimension, ready to work.

Returns
-------
None
") IGESDimen_ToolRadiusDimension;
		 IGESDimen_ToolRadiusDimension();

		/****************** DirChecker ******************/
		/**** md5 signature: 45ff9d208622e6c83e297d43f83f4aed ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_RadiusDimension

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_RadiusDimension> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 038773f8c6041095eae19a8c613ddc9f ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_RadiusDimension
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_RadiusDimension> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 99530aac4b4a1a6e5fd066e7055fe3a0 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_RadiusDimension
entto: IGESDimen_RadiusDimension
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_RadiusDimension> & entfrom, const opencascade::handle<IGESDimen_RadiusDimension> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 005eaeab446e778facd3d1243d451267 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a radiusdimension <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_RadiusDimension
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_RadiusDimension> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: d4fb0419751111f595b12abb358cde67 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_RadiusDimension
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_RadiusDimension> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 14719a797e31b867a34ac538db5de237 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_RadiusDimension
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_RadiusDimension> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolRadiusDimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESDimen_ToolSection *
******************************/
class IGESDimen_ToolSection {
	public:
		/****************** IGESDimen_ToolSection ******************/
		/**** md5 signature: 44fbe9a171b80752e86fa410f90193cf ****/
		%feature("compactdefaultargs") IGESDimen_ToolSection;
		%feature("autodoc", "Returns a toolsection, ready to work.

Returns
-------
None
") IGESDimen_ToolSection;
		 IGESDimen_ToolSection();

		/****************** DirChecker ******************/
		/**** md5 signature: 0389372f64bd5a6febb43a9b8c814080 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_Section

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_Section> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: fe80d233b2caaba4f96db19ab18fc1a5 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_Section
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_Section> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: b49bb27b5827ef9e4261e4cc2ae314fa ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_Section
entto: IGESDimen_Section
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_Section> & entfrom, const opencascade::handle<IGESDimen_Section> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 40dd81ef796c0a6d8a3876d2a116b8d8 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a section (linefont forced to rank = 1, datatype forced to 1).

Parameters
----------
ent: IGESDimen_Section

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDimen_Section> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 2b5f7ddfb06b19ca41e47dd2b2c1acbc ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a section <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_Section
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_Section> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: b94b1c728824cb8d913b64801e189810 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_Section
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_Section> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: f33a95f78bdddbbcb68dbdef1e11664d ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_Section
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_Section> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESDimen_ToolSectionedArea *
************************************/
class IGESDimen_ToolSectionedArea {
	public:
		/****************** IGESDimen_ToolSectionedArea ******************/
		/**** md5 signature: bf5b9810adff0353fbf4f1683f9ae568 ****/
		%feature("compactdefaultargs") IGESDimen_ToolSectionedArea;
		%feature("autodoc", "Returns a toolsectionedarea, ready to work.

Returns
-------
None
") IGESDimen_ToolSectionedArea;
		 IGESDimen_ToolSectionedArea();

		/****************** DirChecker ******************/
		/**** md5 signature: 33e2f9c74faf53c86c31d9b62c5b892a ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_SectionedArea

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_SectionedArea> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 08531dffbf7b81bb4a110edd87b54ac8 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_SectionedArea
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_SectionedArea> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: b62068c364ea150f5fb1a240045fe8c6 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_SectionedArea
entto: IGESDimen_SectionedArea
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_SectionedArea> & entfrom, const opencascade::handle<IGESDimen_SectionedArea> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: b725d6ee9622d7a5c76c39991fb90898 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a sectionedarea <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_SectionedArea
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_SectionedArea> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 1eaeb8237b9d7a9cc2f0ce01d5039094 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_SectionedArea
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_SectionedArea> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 0ebbe4df4dc475f482fe43599e4a3a54 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_SectionedArea
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_SectionedArea> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolSectionedArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESDimen_ToolWitnessLine *
**********************************/
class IGESDimen_ToolWitnessLine {
	public:
		/****************** IGESDimen_ToolWitnessLine ******************/
		/**** md5 signature: dcfc9cc992987f5759c445491e21447d ****/
		%feature("compactdefaultargs") IGESDimen_ToolWitnessLine;
		%feature("autodoc", "Returns a toolwitnessline, ready to work.

Returns
-------
None
") IGESDimen_ToolWitnessLine;
		 IGESDimen_ToolWitnessLine();

		/****************** DirChecker ******************/
		/**** md5 signature: ddc2483cdd8f383fd8dae39e8d34fd34 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDimen_WitnessLine

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDimen_WitnessLine> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: b1b84a60dbd2c03783cb3e4fdc1e4e9c ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDimen_WitnessLine
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDimen_WitnessLine> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: cb80bc1c59b9e3a232ce5003002825ac ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDimen_WitnessLine
entto: IGESDimen_WitnessLine
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDimen_WitnessLine> & entfrom, const opencascade::handle<IGESDimen_WitnessLine> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 8b57ea6bf646b5af239d9884c9781084 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a witnessline (linefont forced to rank = 1, datatype forced to 1).

Parameters
----------
ent: IGESDimen_WitnessLine

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDimen_WitnessLine> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 95cb8d147e24a20e0b2bb7663058066d ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a witnessline <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDimen_WitnessLine
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDimen_WitnessLine> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: e8a0e8aa0ecb8bf895b9b76c57d0cdc2 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDimen_WitnessLine
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDimen_WitnessLine> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 78857106deef33bb5a2588a3642f4687 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDimen_WitnessLine
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDimen_WitnessLine> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDimen_ToolWitnessLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESDimen_WitnessLine *
******************************/
class IGESDimen_WitnessLine : public IGESData_IGESEntity {
	public:
		/****************** IGESDimen_WitnessLine ******************/
		/**** md5 signature: d363e62df9ff3d487748fcce82546286 ****/
		%feature("compactdefaultargs") IGESDimen_WitnessLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDimen_WitnessLine;
		 IGESDimen_WitnessLine();

		/****************** Datatype ******************/
		/**** md5 signature: 6635b41a6e7c415ffe018ddf92784b58 ****/
		%feature("compactdefaultargs") Datatype;
		%feature("autodoc", "Returns interpretation flag, always = 1.

Returns
-------
int
") Datatype;
		Standard_Integer Datatype();

		/****************** Init ******************/
		/**** md5 signature: 429144dfbc8fcf4de32bd0473ba49adf ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class witnessline - datatype : interpretation flag, always = 1 - adispl : common z displacement - datapoints : data points.

Parameters
----------
dataType: int
aDisp: float
dataPoints: TColgp_HArray1OfXY

Returns
-------
None
") Init;
		void Init(const Standard_Integer dataType, const Standard_Real aDisp, const opencascade::handle<TColgp_HArray1OfXY> & dataPoints);

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns number of data points.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		/**** md5 signature: 0851cb2dfd0f7363e8a8a289d2384c32 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns index'th. data point raises exception if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point(const Standard_Integer Index);

		/****************** TransformedPoint ******************/
		/**** md5 signature: 54ce98555ac96e71a007511bdcdcc723 ****/
		%feature("compactdefaultargs") TransformedPoint;
		%feature("autodoc", "Returns data point after transformation. raises exception if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") TransformedPoint;
		gp_Pnt TransformedPoint(const Standard_Integer Index);

		/****************** ZDisplacement ******************/
		/**** md5 signature: 573a948c1f26eb677627269616f0b739 ****/
		%feature("compactdefaultargs") ZDisplacement;
		%feature("autodoc", "Returns common z displacement.

Returns
-------
float
") ZDisplacement;
		Standard_Real ZDisplacement();

};


%make_alias(IGESDimen_WitnessLine)

%extend IGESDimen_WitnessLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class IGESDimen_HArray1OfGeneralNote : public IGESDimen_Array1OfGeneralNote, public Standard_Transient {
  public:
    IGESDimen_HArray1OfGeneralNote(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESDimen_HArray1OfGeneralNote(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESDimen_Array1OfGeneralNote::value_type& theValue);
    IGESDimen_HArray1OfGeneralNote(const IGESDimen_Array1OfGeneralNote& theOther);
    const IGESDimen_Array1OfGeneralNote& Array1();
    IGESDimen_Array1OfGeneralNote& ChangeArray1();
};
%make_alias(IGESDimen_HArray1OfGeneralNote)


class IGESDimen_HArray1OfLeaderArrow : public IGESDimen_Array1OfLeaderArrow, public Standard_Transient {
  public:
    IGESDimen_HArray1OfLeaderArrow(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESDimen_HArray1OfLeaderArrow(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESDimen_Array1OfLeaderArrow::value_type& theValue);
    IGESDimen_HArray1OfLeaderArrow(const IGESDimen_Array1OfLeaderArrow& theOther);
    const IGESDimen_Array1OfLeaderArrow& Array1();
    IGESDimen_Array1OfLeaderArrow& ChangeArray1();
};
%make_alias(IGESDimen_HArray1OfLeaderArrow)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
