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
%define IGESDRAWDOCSTRING
"IGESDraw module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_igesdraw.html"
%enddef
%module (package="OCC.Core", docstring=IGESDRAWDOCSTRING) IGESDraw


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
#include<IGESDraw_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IGESData_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<IGESGraph_module.hxx>
#include<TColgp_module.hxx>
#include<Interface_module.hxx>
#include<IGESDimen_module.hxx>
#include<IGESGeom_module.hxx>
#include<IGESBasic_module.hxx>
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
%import gp.i
%import TColStd.i
%import TCollection.i
%import IGESGraph.i
%import TColgp.i
%import Interface.i
%import IGESDimen.i
%import IGESGeom.i
%import IGESBasic.i

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
%wrap_handle(IGESDraw_CircArraySubfigure)
%wrap_handle(IGESDraw_ConnectPoint)
%wrap_handle(IGESDraw_Drawing)
%wrap_handle(IGESDraw_DrawingWithRotation)
%wrap_handle(IGESDraw_GeneralModule)
%wrap_handle(IGESDraw_LabelDisplay)
%wrap_handle(IGESDraw_NetworkSubfigure)
%wrap_handle(IGESDraw_NetworkSubfigureDef)
%wrap_handle(IGESDraw_PerspectiveView)
%wrap_handle(IGESDraw_Planar)
%wrap_handle(IGESDraw_Protocol)
%wrap_handle(IGESDraw_ReadWriteModule)
%wrap_handle(IGESDraw_RectArraySubfigure)
%wrap_handle(IGESDraw_SegmentedViewsVisible)
%wrap_handle(IGESDraw_SpecificModule)
%wrap_handle(IGESDraw_View)
%wrap_handle(IGESDraw_ViewsVisible)
%wrap_handle(IGESDraw_ViewsVisibleWithAttr)
%wrap_handle(IGESDraw_HArray1OfConnectPoint)
%wrap_handle(IGESDraw_HArray1OfViewKindEntity)
/* end handles declaration */

/* templates */
%template(IGESDraw_Array1OfConnectPoint) NCollection_Array1<opencascade::handle<IGESDraw_ConnectPoint>>;

%extend NCollection_Array1<opencascade::handle<IGESDraw_ConnectPoint>> {
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
%template(IGESDraw_Array1OfViewKindEntity) NCollection_Array1<opencascade::handle<IGESData_ViewKindEntity>>;

%extend NCollection_Array1<opencascade::handle<IGESData_ViewKindEntity>> {
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
typedef NCollection_Array1 <opencascade::handle <IGESDraw_ConnectPoint>> IGESDraw_Array1OfConnectPoint;
typedef NCollection_Array1 <opencascade::handle <IGESData_ViewKindEntity>> IGESDraw_Array1OfViewKindEntity;
/* end typedefs declaration */

/*****************
* class IGESDraw *
*****************/
%rename(igesdraw) IGESDraw;
class IGESDraw {
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
		/**** md5 signature: da6fcbdc724e84b8a084fe1706a2db2f ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol for this package.

Returns
-------
opencascade::handle<IGESDraw_Protocol>
") Protocol;
		static opencascade::handle<IGESDraw_Protocol> Protocol();

};


%extend IGESDraw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESDraw_CircArraySubfigure *
************************************/
class IGESDraw_CircArraySubfigure : public IGESData_IGESEntity {
	public:
		/****************** IGESDraw_CircArraySubfigure ******************/
		/**** md5 signature: 222856a6daaa2d41d59afca274522eb1 ****/
		%feature("compactdefaultargs") IGESDraw_CircArraySubfigure;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_CircArraySubfigure;
		 IGESDraw_CircArraySubfigure();

		/****************** BaseEntity ******************/
		/**** md5 signature: e17a3a96b7699ab4f5e3160e55d72191 ****/
		%feature("compactdefaultargs") BaseEntity;
		%feature("autodoc", "Returns the base entity, copies of which are produced.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") BaseEntity;
		opencascade::handle<IGESData_IGESEntity> BaseEntity();

		/****************** CenterPoint ******************/
		/**** md5 signature: be55af2f7dfea1acbdfa7eca78e80b87 ****/
		%feature("compactdefaultargs") CenterPoint;
		%feature("autodoc", "Returns the center of the imaginary circle.

Returns
-------
gp_Pnt
") CenterPoint;
		gp_Pnt CenterPoint();

		/****************** CircleRadius ******************/
		/**** md5 signature: 23053e8cc47b23cfc7c8d6fbbeac4bd4 ****/
		%feature("compactdefaultargs") CircleRadius;
		%feature("autodoc", "Returns the radius of the imaginary circle.

Returns
-------
float
") CircleRadius;
		Standard_Real CircleRadius();

		/****************** DeltaAngle ******************/
		/**** md5 signature: bcfeb8615b221b64aafea36c49dd40bb ****/
		%feature("compactdefaultargs") DeltaAngle;
		%feature("autodoc", "Returns the delta angle in radians.

Returns
-------
float
") DeltaAngle;
		Standard_Real DeltaAngle();

		/****************** DisplayFlag ******************/
		/**** md5 signature: 8f021f9d33b0aa3382d2e8de002539bd ****/
		%feature("compactdefaultargs") DisplayFlag;
		%feature("autodoc", "Returns true if (listcount = 0) all elements are to be displayed.

Returns
-------
bool
") DisplayFlag;
		Standard_Boolean DisplayFlag();

		/****************** DoDontFlag ******************/
		/**** md5 signature: 3fc233bae3390912ef1d1c12b10fd944 ****/
		%feature("compactdefaultargs") DoDontFlag;
		%feature("autodoc", "Returns 0 if half or fewer of the elements of the array are defined 1 if half or more of the elements are defined.

Returns
-------
bool
") DoDontFlag;
		Standard_Boolean DoDontFlag();

		/****************** Init ******************/
		/**** md5 signature: 5943a38de3bc7c8b780a6a168a8f118d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class circarraysubfigure - abase : base entity - anumlocs : total number of possible instance locations - acenter : coordinates of center of imaginary circle - aradius : radius of imaginary circle - astangle : start angle in radians - adelangle : delta angle in radians - aflag : do-don't flag to control which portion to display - allnumpos : all position to be or not to be processed.

Parameters
----------
aBase: IGESData_IGESEntity
aNumLocs: int
aCenter: gp_XYZ
aRadius: float
aStAngle: float
aDelAngle: float
aFlag: int
allNumPos: TColStd_HArray1OfInteger

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_IGESEntity> & aBase, const Standard_Integer aNumLocs, const gp_XYZ & aCenter, const Standard_Real aRadius, const Standard_Real aStAngle, const Standard_Real aDelAngle, const Standard_Integer aFlag, const opencascade::handle<TColStd_HArray1OfInteger> & allNumPos);

		/****************** ListCount ******************/
		/**** md5 signature: ec895bde9265636050706b0978b71462 ****/
		%feature("compactdefaultargs") ListCount;
		%feature("autodoc", "Returns 0 if all elements to be displayed.

Returns
-------
int
") ListCount;
		Standard_Integer ListCount();

		/****************** ListPosition ******************/
		/**** md5 signature: a52b26a7a40a329c13198c11cf77c771 ****/
		%feature("compactdefaultargs") ListPosition;
		%feature("autodoc", "Returns the index'th value position raises exception if index <= 0 or index > listcount().

Parameters
----------
Index: int

Returns
-------
int
") ListPosition;
		Standard_Integer ListPosition(const Standard_Integer Index);

		/****************** NbLocations ******************/
		/**** md5 signature: e6c134b8d9aa92e37488cc54961e88e4 ****/
		%feature("compactdefaultargs") NbLocations;
		%feature("autodoc", "Returns total number of possible instance locations.

Returns
-------
int
") NbLocations;
		Standard_Integer NbLocations();

		/****************** PositionNum ******************/
		/**** md5 signature: 00bd252b3a72df89ebc6777aeb2c3d60 ****/
		%feature("compactdefaultargs") PositionNum;
		%feature("autodoc", "Returns whether index is to be processed (do) or not to be processed(don't) if (listcount = 0) return thedodontflag raises exception if index <= 0 or index > listcount().

Parameters
----------
Index: int

Returns
-------
bool
") PositionNum;
		Standard_Boolean PositionNum(const Standard_Integer Index);

		/****************** StartAngle ******************/
		/**** md5 signature: beed97f7ae4354ab8403de8b4c4314bc ****/
		%feature("compactdefaultargs") StartAngle;
		%feature("autodoc", "Returns the start angle in radians.

Returns
-------
float
") StartAngle;
		Standard_Real StartAngle();

		/****************** TransformedCenterPoint ******************/
		/**** md5 signature: b78a143ab17a1e8f6a3544670771a248 ****/
		%feature("compactdefaultargs") TransformedCenterPoint;
		%feature("autodoc", "Returns the transformed center of the imaginary circle.

Returns
-------
gp_Pnt
") TransformedCenterPoint;
		gp_Pnt TransformedCenterPoint();

};


%make_alias(IGESDraw_CircArraySubfigure)

%extend IGESDraw_CircArraySubfigure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESDraw_ConnectPoint *
******************************/
class IGESDraw_ConnectPoint : public IGESData_IGESEntity {
	public:
		/****************** IGESDraw_ConnectPoint ******************/
		/**** md5 signature: 6e4eb7d216e851443064a1b6472f5d7e ****/
		%feature("compactdefaultargs") IGESDraw_ConnectPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_ConnectPoint;
		 IGESDraw_ConnectPoint();

		/****************** DisplaySymbol ******************/
		/**** md5 signature: 6ea2cbf7e5eed3302fa999b895e2a396 ****/
		%feature("compactdefaultargs") DisplaySymbol;
		%feature("autodoc", "If display symbol specified returns display symbol geometric entity else returns null handle.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") DisplaySymbol;
		opencascade::handle<IGESData_IGESEntity> DisplaySymbol();

		/****************** FunctionCode ******************/
		/**** md5 signature: a54bc703a393ee1dd3c2ceaccb1f0779 ****/
		%feature("compactdefaultargs") FunctionCode;
		%feature("autodoc", "Returns the connect point function code.

Returns
-------
int
") FunctionCode;
		Standard_Integer FunctionCode();

		/****************** FunctionFlag ******************/
		/**** md5 signature: c5394b8db0de2d02a427b8ab6b75ea87 ****/
		%feature("compactdefaultargs") FunctionFlag;
		%feature("autodoc", "Returns function code that specifies a particular function for the eco576 connection : e.g., function flag = 0 : unspecified(default) = 1 : electrical signal = 2 : fluid flow signal.

Returns
-------
int
") FunctionFlag;
		Standard_Integer FunctionFlag();

		/****************** FunctionIdentifier ******************/
		/**** md5 signature: f1149d2027482527d1bc7073d06bdbea ****/
		%feature("compactdefaultargs") FunctionIdentifier;
		%feature("autodoc", "Return hasciistring identifying pin number or nozzle label etc.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FunctionIdentifier;
		opencascade::handle<TCollection_HAsciiString> FunctionIdentifier();

		/****************** FunctionName ******************/
		/**** md5 signature: 3855e2ee0bd6ee79fc39f6e28991ec8f ****/
		%feature("compactdefaultargs") FunctionName;
		%feature("autodoc", "Returns connection point function name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FunctionName;
		opencascade::handle<TCollection_HAsciiString> FunctionName();

		/****************** FunctionTemplate ******************/
		/**** md5 signature: 2555d075056934905ba157722faedcbd ****/
		%feature("compactdefaultargs") FunctionTemplate;
		%feature("autodoc", "If text display template for the function name is defined, returns testdisplaytemplate else returns null handle.

Returns
-------
opencascade::handle<IGESGraph_TextDisplayTemplate>
") FunctionTemplate;
		opencascade::handle<IGESGraph_TextDisplayTemplate> FunctionTemplate();

		/****************** HasDisplaySymbol ******************/
		/**** md5 signature: f40724959005e7013808e4094af71351 ****/
		%feature("compactdefaultargs") HasDisplaySymbol;
		%feature("autodoc", "Returns true if display symbol is specified else returns false.

Returns
-------
bool
") HasDisplaySymbol;
		Standard_Boolean HasDisplaySymbol();

		/****************** HasFunctionTemplate ******************/
		/**** md5 signature: 065c7078820674816ef4c27c1638f470 ****/
		%feature("compactdefaultargs") HasFunctionTemplate;
		%feature("autodoc", "Returns true if text display template is specified for function name else returns false.

Returns
-------
bool
") HasFunctionTemplate;
		Standard_Boolean HasFunctionTemplate();

		/****************** HasIdentifierTemplate ******************/
		/**** md5 signature: 9e974a49f554ab2adbd37f88f27e2bcf ****/
		%feature("compactdefaultargs") HasIdentifierTemplate;
		%feature("autodoc", "Returns true if text display template is specified for identifier else returns false.

Returns
-------
bool
") HasIdentifierTemplate;
		Standard_Boolean HasIdentifierTemplate();

		/****************** HasOwnerSubfigure ******************/
		/**** md5 signature: 28938c96ef34efa073d563c6b8775f3c ****/
		%feature("compactdefaultargs") HasOwnerSubfigure;
		%feature("autodoc", "Returns true if network subfigure instance/definition entity is specified else returns false.

Returns
-------
bool
") HasOwnerSubfigure;
		Standard_Boolean HasOwnerSubfigure();

		/****************** IdentifierTemplate ******************/
		/**** md5 signature: 0000dbd57c63bf343300b510de844aac ****/
		%feature("compactdefaultargs") IdentifierTemplate;
		%feature("autodoc", "If text display template for the function identifier is defined, returns testdisplaytemplate else returns null handle.

Returns
-------
opencascade::handle<IGESGraph_TextDisplayTemplate>
") IdentifierTemplate;
		opencascade::handle<IGESGraph_TextDisplayTemplate> IdentifierTemplate();

		/****************** Init ******************/
		/**** md5 signature: f78a9bce1481c073a78903ddc1bc410e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class connectpoint - apoint : a coordinate point - adisplaysymbol : display symbol geometry - atypeflag : type of the connection - afunctionflag : function flag for the connection - afunctionidentifier : connection point function identifier - anidentifiertemplate : connection point function template - afunctionname : connection point function name - afunctiontemplate : connection point function template - apointidentifier : unique connect point identifier - afunctioncode : connect point function code - aswapflag : connect point swap flag - anownersubfigure : pointer to the 'owner' entity.

Parameters
----------
aPoint: gp_XYZ
aDisplaySymbol: IGESData_IGESEntity
aTypeFlag: int
aFunctionFlag: int
aFunctionIdentifier: TCollection_HAsciiString
anIdentifierTemplate: IGESGraph_TextDisplayTemplate
aFunctionName: TCollection_HAsciiString
aFunctionTemplate: IGESGraph_TextDisplayTemplate
aPointIdentifier: int
aFunctionCode: int
aSwapFlag: int
anOwnerSubfigure: IGESData_IGESEntity

Returns
-------
None
") Init;
		void Init(const gp_XYZ & aPoint, const opencascade::handle<IGESData_IGESEntity> & aDisplaySymbol, const Standard_Integer aTypeFlag, const Standard_Integer aFunctionFlag, const opencascade::handle<TCollection_HAsciiString> & aFunctionIdentifier, const opencascade::handle<IGESGraph_TextDisplayTemplate> & anIdentifierTemplate, const opencascade::handle<TCollection_HAsciiString> & aFunctionName, const opencascade::handle<IGESGraph_TextDisplayTemplate> & aFunctionTemplate, const Standard_Integer aPointIdentifier, const Standard_Integer aFunctionCode, const Standard_Integer aSwapFlag, const opencascade::handle<IGESData_IGESEntity> & anOwnerSubfigure);

		/****************** OwnerSubfigure ******************/
		/**** md5 signature: 0ea299edd72d2b9f3a69758a580769cd ****/
		%feature("compactdefaultargs") OwnerSubfigure;
		%feature("autodoc", "Returns 'owner' network subfigure instance entity, or network subfigure definition entity, or null handle.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") OwnerSubfigure;
		opencascade::handle<IGESData_IGESEntity> OwnerSubfigure();

		/****************** Point ******************/
		/**** md5 signature: aacd847206090cc43a493e5072f97000 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the coordinate of the connection point.

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point();

		/****************** PointIdentifier ******************/
		/**** md5 signature: bafab91a208727472832ee79c13d7372 ****/
		%feature("compactdefaultargs") PointIdentifier;
		%feature("autodoc", "Returns the unique connect point identifier.

Returns
-------
int
") PointIdentifier;
		Standard_Integer PointIdentifier();

		/****************** SwapFlag ******************/
		/**** md5 signature: 85bcc3c84baed7d8fb3ae37fd692e39a ****/
		%feature("compactdefaultargs") SwapFlag;
		%feature("autodoc", "Return value = 0 : connect point may be swapped(default) = 1 : connect point may not be swapped.

Returns
-------
bool
") SwapFlag;
		Standard_Boolean SwapFlag();

		/****************** TransformedPoint ******************/
		/**** md5 signature: 1c2eabf8fd0d5a95a0d8033b76a796f0 ****/
		%feature("compactdefaultargs") TransformedPoint;
		%feature("autodoc", "Returns the transformed coordinate of the connection point.

Returns
-------
gp_Pnt
") TransformedPoint;
		gp_Pnt TransformedPoint();

		/****************** TypeFlag ******************/
		/**** md5 signature: 013185e1681b532ed26d3ac8964b28ed ****/
		%feature("compactdefaultargs") TypeFlag;
		%feature("autodoc", "Return value specifies a particular type of connection : type flag = 0 : not specified(default) 1 : nonspecific logical point of connection 2 : nonspecific physical point of connection 101 : logical component pin 102 : logical part connector 103 : logical offpage connector 104 : logical global signal connector 201 : physical pwa surface mount pin 202 : physical pwa blind pin 203 : physical pwa thru-pin 5001-9999 : implementor defined.

Returns
-------
int
") TypeFlag;
		Standard_Integer TypeFlag();

};


%make_alias(IGESDraw_ConnectPoint)

%extend IGESDraw_ConnectPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class IGESDraw_Drawing *
*************************/
class IGESDraw_Drawing : public IGESData_IGESEntity {
	public:
		/****************** IGESDraw_Drawing ******************/
		/**** md5 signature: ce4eac16286f9fe5f9705cd5c4f0a7bf ****/
		%feature("compactdefaultargs") IGESDraw_Drawing;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_Drawing;
		 IGESDraw_Drawing();

		/****************** Annotation ******************/
		/**** md5 signature: e92b0305c5d092e6aa79f3c4503255b0 ****/
		%feature("compactdefaultargs") Annotation;
		%feature("autodoc", "Returns the annotation entity in this drawing, indicated by the annotationindex raises an exception if annotationindex <= 0 or annotationindex > nbannotations().

Parameters
----------
AnnotationIndex: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Annotation;
		opencascade::handle<IGESData_IGESEntity> Annotation(const Standard_Integer AnnotationIndex);

		/****************** DrawingSize ******************/
		/**** md5 signature: 6b6821fe9c7f65bc2dad0ac1e1d9265f ****/
		%feature("compactdefaultargs") DrawingSize;
		%feature("autodoc", "Returns the drawing size if it is specified (by a specific property entity) if not specified, returns false, and x,y as zero : unit to consider is then the model unit in globalsection.

Parameters
----------

Returns
-------
X: float
Y: float
") DrawingSize;
		Standard_Boolean DrawingSize(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** DrawingUnit ******************/
		/**** md5 signature: d9b46a957cd8b426928f272052e3297b ****/
		%feature("compactdefaultargs") DrawingUnit;
		%feature("autodoc", "Returns the drawing unit value if it is specified (by a specific property entity) if not specified, returns false, and val as zero : unit to consider is then the model unit in globalsection.

Parameters
----------

Returns
-------
value: float
") DrawingUnit;
		Standard_Boolean DrawingUnit(Standard_Real &OutValue);

		/****************** Init ******************/
		/**** md5 signature: 4fdf96a7fd7a89513415c56f8502bcaa ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class drawing - allviews : pointers to des of view entities - allvieworigins : origin coordinates of transformed views - allannotations : pointers to des of annotation entities raises exception if lengths of allviews and allvieworigins are not same.

Parameters
----------
allViews: IGESDraw_HArray1OfViewKindEntity
allViewOrigins: TColgp_HArray1OfXY
allAnnotations: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDraw_HArray1OfViewKindEntity> & allViews, const opencascade::handle<TColgp_HArray1OfXY> & allViewOrigins, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allAnnotations);

		/****************** NbAnnotations ******************/
		/**** md5 signature: a22274a9f12bc7ef4a5a64d8ecb53c09 ****/
		%feature("compactdefaultargs") NbAnnotations;
		%feature("autodoc", "Returns the number of annotation entities in <self>.

Returns
-------
int
") NbAnnotations;
		Standard_Integer NbAnnotations();

		/****************** NbViews ******************/
		/**** md5 signature: fd0c8c726ae934938397eed9f258895a ****/
		%feature("compactdefaultargs") NbViews;
		%feature("autodoc", "Returns the number of view pointers in <self>.

Returns
-------
int
") NbViews;
		Standard_Integer NbViews();

		/****************** ViewItem ******************/
		/**** md5 signature: f69f43da508d9eb49fef14d3bcf52e0c ****/
		%feature("compactdefaultargs") ViewItem;
		%feature("autodoc", "Returns the viewkindentity indicated by viewindex raises an exception if viewindex <= 0 or viewindex > nbviews().

Parameters
----------
ViewIndex: int

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") ViewItem;
		opencascade::handle<IGESData_ViewKindEntity> ViewItem(const Standard_Integer ViewIndex);

		/****************** ViewOrigin ******************/
		/**** md5 signature: 7ec6a045aba1650af80c14a15c906db0 ****/
		%feature("compactdefaultargs") ViewOrigin;
		%feature("autodoc", "Returns the drawing space coordinates of the origin of the transformed view indicated by tviewindex raises an exception if tviewindex <= 0 or tviewindex > nbviews().

Parameters
----------
TViewIndex: int

Returns
-------
gp_Pnt2d
") ViewOrigin;
		gp_Pnt2d ViewOrigin(const Standard_Integer TViewIndex);

		/****************** ViewToDrawing ******************/
		/**** md5 signature: 4b63bcfa700b00f6ca85ce25b8acde96 ****/
		%feature("compactdefaultargs") ViewToDrawing;
		%feature("autodoc", "No available documentation.

Parameters
----------
NumView: int
ViewCoords: gp_XYZ

Returns
-------
gp_XY
") ViewToDrawing;
		gp_XY ViewToDrawing(const Standard_Integer NumView, const gp_XYZ & ViewCoords);

};


%make_alias(IGESDraw_Drawing)

%extend IGESDraw_Drawing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESDraw_DrawingWithRotation *
*************************************/
class IGESDraw_DrawingWithRotation : public IGESData_IGESEntity {
	public:
		/****************** IGESDraw_DrawingWithRotation ******************/
		/**** md5 signature: 823cec7dbb7c4a4a9763e7090eb8486e ****/
		%feature("compactdefaultargs") IGESDraw_DrawingWithRotation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_DrawingWithRotation;
		 IGESDraw_DrawingWithRotation();

		/****************** Annotation ******************/
		/**** md5 signature: a8b63fbf33e30d1509b4be2aec6b3b8a ****/
		%feature("compactdefaultargs") Annotation;
		%feature("autodoc", "Returns the annotation entity in this drawing, indicated by index raises an exception if index <= 0 or index > nbannotations().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Annotation;
		opencascade::handle<IGESData_IGESEntity> Annotation(const Standard_Integer Index);

		/****************** DrawingSize ******************/
		/**** md5 signature: 6b6821fe9c7f65bc2dad0ac1e1d9265f ****/
		%feature("compactdefaultargs") DrawingSize;
		%feature("autodoc", "Returns the drawing size if it is specified (by a specific property entity) if not specified, returns false, and x,y as zero : unit to consider is then the model unit in globalsection.

Parameters
----------

Returns
-------
X: float
Y: float
") DrawingSize;
		Standard_Boolean DrawingSize(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** DrawingUnit ******************/
		/**** md5 signature: d9b46a957cd8b426928f272052e3297b ****/
		%feature("compactdefaultargs") DrawingUnit;
		%feature("autodoc", "Returns the drawing unit value if it is specified (by a specific property entity) if not specified, returns false, and val as zero : unit to consider is then the model unit in globalsection.

Parameters
----------

Returns
-------
value: float
") DrawingUnit;
		Standard_Boolean DrawingUnit(Standard_Real &OutValue);

		/****************** Init ******************/
		/**** md5 signature: 4ac186a443abf65fd1fcaee3449a2d67 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class drawingwithrotation - allviews : pointers to view entities - allvieworigins : origin coords of transformed views - allorientationangles : orientation angles of transformed views - allannotations : pointers to annotation entities raises exception if lengths of allviews, allvieworigins and allorientationangles are not same.

Parameters
----------
allViews: IGESDraw_HArray1OfViewKindEntity
allViewOrigins: TColgp_HArray1OfXY
allOrientationAngles: TColStd_HArray1OfReal
allAnnotations: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDraw_HArray1OfViewKindEntity> & allViews, const opencascade::handle<TColgp_HArray1OfXY> & allViewOrigins, const opencascade::handle<TColStd_HArray1OfReal> & allOrientationAngles, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allAnnotations);

		/****************** NbAnnotations ******************/
		/**** md5 signature: a22274a9f12bc7ef4a5a64d8ecb53c09 ****/
		%feature("compactdefaultargs") NbAnnotations;
		%feature("autodoc", "Returns the number of annotation entities in <self>.

Returns
-------
int
") NbAnnotations;
		Standard_Integer NbAnnotations();

		/****************** NbViews ******************/
		/**** md5 signature: fd0c8c726ae934938397eed9f258895a ****/
		%feature("compactdefaultargs") NbViews;
		%feature("autodoc", "Returns the number of view pointers in <self>.

Returns
-------
int
") NbViews;
		Standard_Integer NbViews();

		/****************** OrientationAngle ******************/
		/**** md5 signature: 5c397767b0ef44e31a40626003f66df3 ****/
		%feature("compactdefaultargs") OrientationAngle;
		%feature("autodoc", "Returns the orientation angle for the transformed view indicated by index raises an exception if index <= 0 or index > nbviews().

Parameters
----------
Index: int

Returns
-------
float
") OrientationAngle;
		Standard_Real OrientationAngle(const Standard_Integer Index);

		/****************** ViewItem ******************/
		/**** md5 signature: d71060edac774c239512e05e0a85daec ****/
		%feature("compactdefaultargs") ViewItem;
		%feature("autodoc", "Returns the view entity indicated by index raises an exception if index <= 0 or index > nbviews().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") ViewItem;
		opencascade::handle<IGESData_ViewKindEntity> ViewItem(const Standard_Integer Index);

		/****************** ViewOrigin ******************/
		/**** md5 signature: d34af85d8771666040d779d26bca9edc ****/
		%feature("compactdefaultargs") ViewOrigin;
		%feature("autodoc", "Returns the drawing space coordinates of the origin of the transformed view indicated by index raises an exception if index <= 0 or index > nbviews().

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") ViewOrigin;
		gp_Pnt2d ViewOrigin(const Standard_Integer Index);

		/****************** ViewToDrawing ******************/
		/**** md5 signature: 4b63bcfa700b00f6ca85ce25b8acde96 ****/
		%feature("compactdefaultargs") ViewToDrawing;
		%feature("autodoc", "No available documentation.

Parameters
----------
NumView: int
ViewCoords: gp_XYZ

Returns
-------
gp_XY
") ViewToDrawing;
		gp_XY ViewToDrawing(const Standard_Integer NumView, const gp_XYZ & ViewCoords);

};


%make_alias(IGESDraw_DrawingWithRotation)

%extend IGESDraw_DrawingWithRotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESDraw_GeneralModule *
*******************************/
class IGESDraw_GeneralModule : public IGESData_GeneralModule {
	public:
		/****************** IGESDraw_GeneralModule ******************/
		/**** md5 signature: 4916a2514e70d67c817e9af0796efc17 ****/
		%feature("compactdefaultargs") IGESDraw_GeneralModule;
		%feature("autodoc", "Creates a generalmodule from igesdraw and puts it into generallib.

Returns
-------
None
") IGESDraw_GeneralModule;
		 IGESDraw_GeneralModule();

		/****************** CategoryNumber ******************/
		/**** md5 signature: d812efe400e2084fa824301d3c147806 ****/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "Returns a category number which characterizes an entity planar : auxiliary subfigures and connectpoint : structure others : drawing.

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

		/****************** OwnDeleteCase ******************/
		/**** md5 signature: 2ee4ffdae8c40f7b54d431fa33d82dcc ****/
		%feature("compactdefaultargs") OwnDeleteCase;
		%feature("autodoc", "Clears parameters with can cause looping structures : redefined for viewsvisible ... (clears the implied ref.s).

Parameters
----------
CN: int
ent: IGESData_IGESEntity

Returns
-------
None
") OwnDeleteCase;
		virtual void OwnDeleteCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** OwnImpliedCase ******************/
		/**** md5 signature: 387eb74972e6033b90702ae7f883cacd ****/
		%feature("compactdefaultargs") OwnImpliedCase;
		%feature("autodoc", "Specific list of entities implied by an igesentity <ent> (in addition to associativities). redefined for viewsvisible ...

Parameters
----------
CN: int
ent: IGESData_IGESEntity
iter: Interface_EntityIterator

Returns
-------
None
") OwnImpliedCase;
		virtual void OwnImpliedCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, Interface_EntityIterator & iter);

		/****************** OwnRenewCase ******************/
		/**** md5 signature: 982a5780ab3c125db66625e73d5aa5f6 ****/
		%feature("compactdefaultargs") OwnRenewCase;
		%feature("autodoc", "Renews parameters which are specific of each type of entity : redefined for viewsvisible ... (takes only the implied ref.s which have also been copied).

Parameters
----------
CN: int
entfrom: IGESData_IGESEntity
entto: IGESData_IGESEntity
TC: Interface_CopyTool

Returns
-------
None
") OwnRenewCase;
		virtual void OwnRenewCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, const Interface_CopyTool & TC);

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


%make_alias(IGESDraw_GeneralModule)

%extend IGESDraw_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESDraw_LabelDisplay *
******************************/
class IGESDraw_LabelDisplay : public IGESData_LabelDisplayEntity {
	public:
		/****************** IGESDraw_LabelDisplay ******************/
		/**** md5 signature: d367486ffb23e4877ce268e18809e63a ****/
		%feature("compactdefaultargs") IGESDraw_LabelDisplay;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_LabelDisplay;
		 IGESDraw_LabelDisplay();

		/****************** DisplayedEntity ******************/
		/**** md5 signature: 7f5c7aee3ea84185da0c0ee4805bf5a6 ****/
		%feature("compactdefaultargs") DisplayedEntity;
		%feature("autodoc", "Returns the entity indicated by entityindex raises an exception if entityindex <= 0 or entityindex > nblabels().

Parameters
----------
EntityIndex: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") DisplayedEntity;
		opencascade::handle<IGESData_IGESEntity> DisplayedEntity(const Standard_Integer EntityIndex);

		/****************** Init ******************/
		/**** md5 signature: 3a5005de86e6e6dba78593caf198ac4c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class labeldisplay - allviews : pointers to view entities - alltextlocations : coordinates of text locations in the views - allleaderentities : pointers to leader entities in the views - alllabellevels : entity label level numbers in the views - alldisplayedentities : pointers to the entities being displayed raises exception if lengths of allviews, alltextlocations, allleaderentities, alllabellevels and alldisplayedentities are not same.

Parameters
----------
allViews: IGESDraw_HArray1OfViewKindEntity
allTextLocations: TColgp_HArray1OfXYZ
allLeaderEntities: IGESDimen_HArray1OfLeaderArrow
allLabelLevels: TColStd_HArray1OfInteger
allDisplayedEntities: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDraw_HArray1OfViewKindEntity> & allViews, const opencascade::handle<TColgp_HArray1OfXYZ> & allTextLocations, const opencascade::handle<IGESDimen_HArray1OfLeaderArrow> & allLeaderEntities, const opencascade::handle<TColStd_HArray1OfInteger> & allLabelLevels, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allDisplayedEntities);

		/****************** LabelLevel ******************/
		/**** md5 signature: deedf0d8102ff75dfb35b4946521763b ****/
		%feature("compactdefaultargs") LabelLevel;
		%feature("autodoc", "Returns the entity label level number in the view indicated by viewindex raises an exception if viewindex <= 0 or viewindex > nblabels().

Parameters
----------
ViewIndex: int

Returns
-------
int
") LabelLevel;
		Standard_Integer LabelLevel(const Standard_Integer ViewIndex);

		/****************** LeaderEntity ******************/
		/**** md5 signature: d7c8c911872fe7d2468c47f68a1d376e ****/
		%feature("compactdefaultargs") LeaderEntity;
		%feature("autodoc", "Returns the leader entity in the view indicated by viewindex raises an exception if viewindex <= 0 or viewindex > nblabels().

Parameters
----------
ViewIndex: int

Returns
-------
opencascade::handle<IGESDimen_LeaderArrow>
") LeaderEntity;
		opencascade::handle<IGESDimen_LeaderArrow> LeaderEntity(const Standard_Integer ViewIndex);

		/****************** NbLabels ******************/
		/**** md5 signature: cb88c1a97d34df51f5dfc9bedf9e29ba ****/
		%feature("compactdefaultargs") NbLabels;
		%feature("autodoc", "Returns the number of label placements in <self>.

Returns
-------
int
") NbLabels;
		Standard_Integer NbLabels();

		/****************** TextLocation ******************/
		/**** md5 signature: 2a424cd65d18c4ba5e4a8acf48854784 ****/
		%feature("compactdefaultargs") TextLocation;
		%feature("autodoc", "Returns the 3d-point coordinates of the text location, in the view indicated by viewindex raises an exception if viewindex <= 0 or viewindex > nblabels().

Parameters
----------
ViewIndex: int

Returns
-------
gp_Pnt
") TextLocation;
		gp_Pnt TextLocation(const Standard_Integer ViewIndex);

		/****************** TransformedTextLocation ******************/
		/**** md5 signature: 64e9ade19d91c88d37e8c9f3c45ffd85 ****/
		%feature("compactdefaultargs") TransformedTextLocation;
		%feature("autodoc", "Returns the transformed 3d-point coordinates of the text location, in the view indicated by viewindex raises an exception if viewindex <= 0 or viewindex > nblabels().

Parameters
----------
ViewIndex: int

Returns
-------
gp_Pnt
") TransformedTextLocation;
		gp_Pnt TransformedTextLocation(const Standard_Integer ViewIndex);

		/****************** ViewItem ******************/
		/**** md5 signature: f69f43da508d9eb49fef14d3bcf52e0c ****/
		%feature("compactdefaultargs") ViewItem;
		%feature("autodoc", "Returns the view entity indicated by viewindex raises an exception if viewindex <= 0 or viewindex > nblabels().

Parameters
----------
ViewIndex: int

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") ViewItem;
		opencascade::handle<IGESData_ViewKindEntity> ViewItem(const Standard_Integer ViewIndex);

};


%make_alias(IGESDraw_LabelDisplay)

%extend IGESDraw_LabelDisplay {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESDraw_NetworkSubfigure *
**********************************/
class IGESDraw_NetworkSubfigure : public IGESData_IGESEntity {
	public:
		/****************** IGESDraw_NetworkSubfigure ******************/
		/**** md5 signature: 63ec867176c42a49e4c799da0c48fdad ****/
		%feature("compactdefaultargs") IGESDraw_NetworkSubfigure;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_NetworkSubfigure;
		 IGESDraw_NetworkSubfigure();

		/****************** ConnectPoint ******************/
		/**** md5 signature: 77698e4f71fe8dd545fbcd2864f4c5f3 ****/
		%feature("compactdefaultargs") ConnectPoint;
		%feature("autodoc", "Returns the index'th associated connect point entity raises exception if index <= 0 or index > nbconnectpoints().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESDraw_ConnectPoint>
") ConnectPoint;
		opencascade::handle<IGESDraw_ConnectPoint> ConnectPoint(const Standard_Integer Index);

		/****************** DesignatorTemplate ******************/
		/**** md5 signature: 8275cd26d7eeb43868a87ab37ddbfd62 ****/
		%feature("compactdefaultargs") DesignatorTemplate;
		%feature("autodoc", "Returns primary reference designator text display template entity, or null. if null, no text display template entity specified.

Returns
-------
opencascade::handle<IGESGraph_TextDisplayTemplate>
") DesignatorTemplate;
		opencascade::handle<IGESGraph_TextDisplayTemplate> DesignatorTemplate();

		/****************** HasDesignatorTemplate ******************/
		/**** md5 signature: 4b8ab295c691de918af7d3e5c0db88c9 ****/
		%feature("compactdefaultargs") HasDesignatorTemplate;
		%feature("autodoc", "Returns true if text display template entity is specified, else false.

Returns
-------
bool
") HasDesignatorTemplate;
		Standard_Boolean HasDesignatorTemplate();

		/****************** Init ******************/
		/**** md5 signature: c5b6653e82bf8d79fdb4a6719c6fd07b ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class networksubfigure - adefinition : network subfigure definition entity - atranslation : translation data relative to the model space or the definition space - ascalefactor : scale factors in the definition space - atypeflag : type flag - adesignator : primary reference designator - atemplate : primary reference designator text display template entity - allconnectpoints : associated connect point entities.

Parameters
----------
aDefinition: IGESDraw_NetworkSubfigureDef
aTranslation: gp_XYZ
aScaleFactor: gp_XYZ
aTypeFlag: int
aDesignator: TCollection_HAsciiString
aTemplate: IGESGraph_TextDisplayTemplate
allConnectPoints: IGESDraw_HArray1OfConnectPoint

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDraw_NetworkSubfigureDef> & aDefinition, const gp_XYZ & aTranslation, const gp_XYZ & aScaleFactor, const Standard_Integer aTypeFlag, const opencascade::handle<TCollection_HAsciiString> & aDesignator, const opencascade::handle<IGESGraph_TextDisplayTemplate> & aTemplate, const opencascade::handle<IGESDraw_HArray1OfConnectPoint> & allConnectPoints);

		/****************** NbConnectPoints ******************/
		/**** md5 signature: 8386e3f1abf2cc4e36d6c94607a7862f ****/
		%feature("compactdefaultargs") NbConnectPoints;
		%feature("autodoc", "Returns the number of associated connect point entities.

Returns
-------
int
") NbConnectPoints;
		Standard_Integer NbConnectPoints();

		/****************** ReferenceDesignator ******************/
		/**** md5 signature: 3f33fa46643916f54660af9ace9ee783 ****/
		%feature("compactdefaultargs") ReferenceDesignator;
		%feature("autodoc", "Returns the primary reference designator.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ReferenceDesignator;
		opencascade::handle<TCollection_HAsciiString> ReferenceDesignator();

		/****************** ScaleFactors ******************/
		/**** md5 signature: 5ee14c00d17a715172b4f1067b819d72 ****/
		%feature("compactdefaultargs") ScaleFactors;
		%feature("autodoc", "Returns scale factor in definition space(x, y, z axes).

Returns
-------
gp_XYZ
") ScaleFactors;
		gp_XYZ ScaleFactors();

		/****************** SubfigureDefinition ******************/
		/**** md5 signature: d01950c5b289f3244aaa5b3e1b8bacc3 ****/
		%feature("compactdefaultargs") SubfigureDefinition;
		%feature("autodoc", "Returns network subfigure definition entity specified by this entity.

Returns
-------
opencascade::handle<IGESDraw_NetworkSubfigureDef>
") SubfigureDefinition;
		opencascade::handle<IGESDraw_NetworkSubfigureDef> SubfigureDefinition();

		/****************** TransformedTranslation ******************/
		/**** md5 signature: 36321ec2ff0e108ac64cf92aef7267bf ****/
		%feature("compactdefaultargs") TransformedTranslation;
		%feature("autodoc", "Returns the transformed translation data relative to either model space or to the definition space of a referring entity.

Returns
-------
gp_XYZ
") TransformedTranslation;
		gp_XYZ TransformedTranslation();

		/****************** Translation ******************/
		/**** md5 signature: af346406f5517579c9b394146d19b665 ****/
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "Returns translation data relative to either model space or to the definition space of a referring entity.

Returns
-------
gp_XYZ
") Translation;
		gp_XYZ Translation();

		/****************** TypeFlag ******************/
		/**** md5 signature: 013185e1681b532ed26d3ac8964b28ed ****/
		%feature("compactdefaultargs") TypeFlag;
		%feature("autodoc", "Returns type flag which implements the distinction between logical design and physical design data,and is required if both are present. type flag = 0 : not specified (default) = 1 : logical = 2 : physical.

Returns
-------
int
") TypeFlag;
		Standard_Integer TypeFlag();

};


%make_alias(IGESDraw_NetworkSubfigure)

%extend IGESDraw_NetworkSubfigure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESDraw_NetworkSubfigureDef *
*************************************/
class IGESDraw_NetworkSubfigureDef : public IGESData_IGESEntity {
	public:
		/****************** IGESDraw_NetworkSubfigureDef ******************/
		/**** md5 signature: e8a1313ba5f3ceecfd0a7e51a7e21775 ****/
		%feature("compactdefaultargs") IGESDraw_NetworkSubfigureDef;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_NetworkSubfigureDef;
		 IGESDraw_NetworkSubfigureDef();

		/****************** Depth ******************/
		/**** md5 signature: b6eaa771d2fe709741b9c1e8ce5ec68f ****/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Returns depth of subfigure(indication the amount of nesting) note : the depth is inclusive of both network subfigure definition entity and the ordinary subfigure definition entity. thus, the two may be nested.

Returns
-------
int
") Depth;
		Standard_Integer Depth();

		/****************** Designator ******************/
		/**** md5 signature: 8bdd4d2878cc0cf5588a5e2ad983bcf2 ****/
		%feature("compactdefaultargs") Designator;
		%feature("autodoc", "Returns primary reference designator.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Designator;
		opencascade::handle<TCollection_HAsciiString> Designator();

		/****************** DesignatorTemplate ******************/
		/**** md5 signature: 8275cd26d7eeb43868a87ab37ddbfd62 ****/
		%feature("compactdefaultargs") DesignatorTemplate;
		%feature("autodoc", "If text display template specified then return textdisplaytemplate else return null handle.

Returns
-------
opencascade::handle<IGESGraph_TextDisplayTemplate>
") DesignatorTemplate;
		opencascade::handle<IGESGraph_TextDisplayTemplate> DesignatorTemplate();

		/****************** Entity ******************/
		/**** md5 signature: 6bfd10ecd7c39267f9dd2b98e834cad8 ****/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "Returns the index'th igesentity in subfigure exclusive of primary reference designator and control points raises exception if index <=0 or index > nbentities().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Entity;
		opencascade::handle<IGESData_IGESEntity> Entity(const Standard_Integer Index);

		/****************** HasDesignatorTemplate ******************/
		/**** md5 signature: 4b8ab295c691de918af7d3e5c0db88c9 ****/
		%feature("compactdefaultargs") HasDesignatorTemplate;
		%feature("autodoc", "Returns true if text display template is specified for primary designator else returns false.

Returns
-------
bool
") HasDesignatorTemplate;
		Standard_Boolean HasDesignatorTemplate();

		/****************** HasPointEntity ******************/
		/**** md5 signature: c79c51ae3b0845ca3c73eaa648986686 ****/
		%feature("compactdefaultargs") HasPointEntity;
		%feature("autodoc", "Returns true is index'th associated connect point entity is present else returns false raises exception if index is out of bound.

Parameters
----------
Index: int

Returns
-------
bool
") HasPointEntity;
		Standard_Boolean HasPointEntity(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: 3ed82e977b73573fb0201f490e3ca9e5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set fields of the class networksubfiguredef - adepth  : depth of subfigure (indicating the amount of nesting) - aname : subfigure name - allentities : associated subfigures entities exclusive of primary reference designator and control points. - atypeflag : type flag determines which entity belongs in which design (logical design or physical design) - adesignator : designator hasciistring and its template - allpointentities : associated connect point entities.

Parameters
----------
aDepth: int
aName: TCollection_HAsciiString
allEntities: IGESData_HArray1OfIGESEntity
aTypeFlag: int
aDesignator: TCollection_HAsciiString
aTemplate: IGESGraph_TextDisplayTemplate
allPointEntities: IGESDraw_HArray1OfConnectPoint

Returns
-------
None
") Init;
		void Init(const Standard_Integer aDepth, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allEntities, const Standard_Integer aTypeFlag, const opencascade::handle<TCollection_HAsciiString> & aDesignator, const opencascade::handle<IGESGraph_TextDisplayTemplate> & aTemplate, const opencascade::handle<IGESDraw_HArray1OfConnectPoint> & allPointEntities);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the subfigure name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbEntities ******************/
		/**** md5 signature: 533943455099343f106415a0a22e8ac9 ****/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns number of associated(child) entries in subfigure exclusive of primary reference designator and control points.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** NbPointEntities ******************/
		/**** md5 signature: a27ce6fa547089751057df7e72f27b9a ****/
		%feature("compactdefaultargs") NbPointEntities;
		%feature("autodoc", "Returns the number of associated(child) connect point entities.

Returns
-------
int
") NbPointEntities;
		Standard_Integer NbPointEntities();

		/****************** PointEntity ******************/
		/**** md5 signature: 51312ae52a06b4bf4e9bb7f5f99bc5c6 ****/
		%feature("compactdefaultargs") PointEntity;
		%feature("autodoc", "Returns the index'th associated connect point entity raises exception if index <= 0 or index > nbpointentities().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESDraw_ConnectPoint>
") PointEntity;
		opencascade::handle<IGESDraw_ConnectPoint> PointEntity(const Standard_Integer Index);

		/****************** TypeFlag ******************/
		/**** md5 signature: 013185e1681b532ed26d3ac8964b28ed ****/
		%feature("compactdefaultargs") TypeFlag;
		%feature("autodoc", "Return value = 0 : not specified = 1 : logical design = 2 : physical design.

Returns
-------
int
") TypeFlag;
		Standard_Integer TypeFlag();

};


%make_alias(IGESDraw_NetworkSubfigureDef)

%extend IGESDraw_NetworkSubfigureDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESDraw_PerspectiveView *
*********************************/
class IGESDraw_PerspectiveView : public IGESData_ViewKindEntity {
	public:
		/****************** IGESDraw_PerspectiveView ******************/
		/**** md5 signature: 04392f1acb29e7a95d8ce172898b555a ****/
		%feature("compactdefaultargs") IGESDraw_PerspectiveView;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_PerspectiveView;
		 IGESDraw_PerspectiveView();

		/****************** BackPlaneDistance ******************/
		/**** md5 signature: 461642553ea3f9afa8cccbf4dbb17426 ****/
		%feature("compactdefaultargs") BackPlaneDistance;
		%feature("autodoc", "Returns the view coordinate denoting the location of the back clipping plane.

Returns
-------
float
") BackPlaneDistance;
		Standard_Real BackPlaneDistance();

		/****************** BottomRight ******************/
		/**** md5 signature: b5be32ae8a9f28a5bcbe1f6e80272b2b ****/
		%feature("compactdefaultargs") BottomRight;
		%feature("autodoc", "Returns the bottom right point of the clipping window.

Returns
-------
gp_Pnt2d
") BottomRight;
		gp_Pnt2d BottomRight();

		/****************** CenterOfProjection ******************/
		/**** md5 signature: f859225a7a0adaee375ec118b4d403ad ****/
		%feature("compactdefaultargs") CenterOfProjection;
		%feature("autodoc", "Returns the center of projection (model space).

Returns
-------
gp_Pnt
") CenterOfProjection;
		gp_Pnt CenterOfProjection();

		/****************** DepthClip ******************/
		/**** md5 signature: ce13aa563782d340023cdec9333146ee ****/
		%feature("compactdefaultargs") DepthClip;
		%feature("autodoc", "Returns the depth clipping indicator 0 = no depth clipping 1 = back clipping plane on 2 = front clipping plane on 3 = back and front clipping planes on.

Returns
-------
int
") DepthClip;
		Standard_Integer DepthClip();

		/****************** FrontPlaneDistance ******************/
		/**** md5 signature: 9b0f3629420a101cad94471e4b2f5dc8 ****/
		%feature("compactdefaultargs") FrontPlaneDistance;
		%feature("autodoc", "Returns the view coordinate denoting the location of the front clipping plane.

Returns
-------
float
") FrontPlaneDistance;
		Standard_Real FrontPlaneDistance();

		/****************** Init ******************/
		/**** md5 signature: d8f901184571f47df0f54bdbbf098f4a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class perspectiveview - aviewnumber : the desired view - ascalefactor : scale factor - aviewnormalvector : view plane normal vector (model space) - aviewreferencepoint : view reference point (model space) - acenterofprojection : center of projection (model space) - aviewupvector : view up vector  (model space) - aviewplanedistance : view plane distance (model space) - atopleft : top-left point of clipping window - abottomright : bottom-right point of clipping window - adepthclip : depth clipping indicator - abackplanedistance : distance of back clipping plane - afrontplanedistance : distance of front clipping plane.

Parameters
----------
aViewNumber: int
aScaleFactor: float
aViewNormalVector: gp_XYZ
aViewReferencePoint: gp_XYZ
aCenterOfProjection: gp_XYZ
aViewUpVector: gp_XYZ
aViewPlaneDistance: float
aTopLeft: gp_XY
aBottomRight: gp_XY
aDepthClip: int
aBackPlaneDistance: float
aFrontPlaneDistance: float

Returns
-------
None
") Init;
		void Init(const Standard_Integer aViewNumber, const Standard_Real aScaleFactor, const gp_XYZ & aViewNormalVector, const gp_XYZ & aViewReferencePoint, const gp_XYZ & aCenterOfProjection, const gp_XYZ & aViewUpVector, const Standard_Real aViewPlaneDistance, const gp_XY & aTopLeft, const gp_XY & aBottomRight, const Standard_Integer aDepthClip, const Standard_Real aBackPlaneDistance, const Standard_Real aFrontPlaneDistance);

		/****************** IsSingle ******************/
		/**** md5 signature: b2735ca34cbdb48e3f13d2210fcf2236 ****/
		%feature("compactdefaultargs") IsSingle;
		%feature("autodoc", "Returns true (for a single view).

Returns
-------
bool
") IsSingle;
		Standard_Boolean IsSingle();

		/****************** ModelToView ******************/
		/**** md5 signature: 3844ef49e23e329bd62f336a6c41b9fe ****/
		%feature("compactdefaultargs") ModelToView;
		%feature("autodoc", "Returns xyx from the model space to the view space by applying the view matrix.

Parameters
----------
coords: gp_XYZ

Returns
-------
gp_XYZ
") ModelToView;
		gp_XYZ ModelToView(const gp_XYZ & coords);

		/****************** NbViews ******************/
		/**** md5 signature: d203d38adf71eeaf19d2a209dc34d2e5 ****/
		%feature("compactdefaultargs") NbViews;
		%feature("autodoc", "Returns 1 (single view).

Returns
-------
int
") NbViews;
		Standard_Integer NbViews();

		/****************** ScaleFactor ******************/
		/**** md5 signature: 67d4a7cfb2dd29c2b400060f1b45b408 ****/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Returns the scale factor associated with <self>.

Returns
-------
float
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****************** TopLeft ******************/
		/**** md5 signature: 502d4efce339ac03abcd17a5e002f96d ****/
		%feature("compactdefaultargs") TopLeft;
		%feature("autodoc", "Returns the top left point of the clipping window.

Returns
-------
gp_Pnt2d
") TopLeft;
		gp_Pnt2d TopLeft();

		/****************** ViewItem ******************/
		/**** md5 signature: 9a0fd81be9ceabe7e4042d7ae93c11f2 ****/
		%feature("compactdefaultargs") ViewItem;
		%feature("autodoc", "For a single view, returns <self> whatever <num>.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") ViewItem;
		opencascade::handle<IGESData_ViewKindEntity> ViewItem(const Standard_Integer num);

		/****************** ViewMatrix ******************/
		/**** md5 signature: 73afc7b78c4c520daaf6ff644146510e ****/
		%feature("compactdefaultargs") ViewMatrix;
		%feature("autodoc", "Returns the transformation matrix.

Returns
-------
opencascade::handle<IGESData_TransfEntity>
") ViewMatrix;
		opencascade::handle<IGESData_TransfEntity> ViewMatrix();

		/****************** ViewNormalVector ******************/
		/**** md5 signature: 3d67c52ceeeab2480f1cc91ec68ddcff ****/
		%feature("compactdefaultargs") ViewNormalVector;
		%feature("autodoc", "Returns the view plane normal vector (model space).

Returns
-------
gp_Vec
") ViewNormalVector;
		gp_Vec ViewNormalVector();

		/****************** ViewNumber ******************/
		/**** md5 signature: b382f803b363227be5fb9a94ee125fc4 ****/
		%feature("compactdefaultargs") ViewNumber;
		%feature("autodoc", "Returns the view number associated with <self>.

Returns
-------
int
") ViewNumber;
		Standard_Integer ViewNumber();

		/****************** ViewPlaneDistance ******************/
		/**** md5 signature: 7ab9aeb9cdc69dbf281d1fbcecc18b25 ****/
		%feature("compactdefaultargs") ViewPlaneDistance;
		%feature("autodoc", "Returns the view plane distance (model space).

Returns
-------
float
") ViewPlaneDistance;
		Standard_Real ViewPlaneDistance();

		/****************** ViewReferencePoint ******************/
		/**** md5 signature: 20c1ad977ac6dd071031911b1b411b00 ****/
		%feature("compactdefaultargs") ViewReferencePoint;
		%feature("autodoc", "Returns the view reference point (model space).

Returns
-------
gp_Pnt
") ViewReferencePoint;
		gp_Pnt ViewReferencePoint();

		/****************** ViewUpVector ******************/
		/**** md5 signature: c4770f2563e773196d1a6535342e27d9 ****/
		%feature("compactdefaultargs") ViewUpVector;
		%feature("autodoc", "Returns the view up vector (model space).

Returns
-------
gp_Vec
") ViewUpVector;
		gp_Vec ViewUpVector();

};


%make_alias(IGESDraw_PerspectiveView)

%extend IGESDraw_PerspectiveView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IGESDraw_Planar *
************************/
class IGESDraw_Planar : public IGESData_IGESEntity {
	public:
		/****************** IGESDraw_Planar ******************/
		/**** md5 signature: bed895ef39ccf5a9c8973c65662d273e ****/
		%feature("compactdefaultargs") IGESDraw_Planar;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_Planar;
		 IGESDraw_Planar();

		/****************** Entity ******************/
		/**** md5 signature: cda1e3cc931ac40d5c28e8dcc480d7dc ****/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "Returns the entity on the specified plane, indicated by entityindex raises an exception if entityindex <= 0 or entityindex > nbentities().

Parameters
----------
EntityIndex: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Entity;
		opencascade::handle<IGESData_IGESEntity> Entity(const Standard_Integer EntityIndex);

		/****************** Init ******************/
		/**** md5 signature: 63ec47243bd7d6f7a8bfdc2c031ec00f ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class planar - nbmats : number of transformation matrices - atransformationmatrix : pointer to the transformation matrix - allentities  : pointers to the entities specified.

Parameters
----------
nbMats: int
aTransformationMatrix: IGESGeom_TransformationMatrix
allEntities: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbMats, const opencascade::handle<IGESGeom_TransformationMatrix> & aTransformationMatrix, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allEntities);

		/****************** IsIdentityMatrix ******************/
		/**** md5 signature: 779fb4125ea8585edb1e070d84734389 ****/
		%feature("compactdefaultargs") IsIdentityMatrix;
		%feature("autodoc", "Returns true if transformationmatrix is identity matrix, i.e:- no matrix defined.

Returns
-------
bool
") IsIdentityMatrix;
		Standard_Boolean IsIdentityMatrix();

		/****************** NbEntities ******************/
		/**** md5 signature: 533943455099343f106415a0a22e8ac9 ****/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns the number of entities in the plane pointed to by this associativity.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** NbMatrices ******************/
		/**** md5 signature: 111fe970de6a24db665533158efc6635 ****/
		%feature("compactdefaultargs") NbMatrices;
		%feature("autodoc", "Returns the number of transformation matrices in <self>.

Returns
-------
int
") NbMatrices;
		Standard_Integer NbMatrices();

		/****************** TransformMatrix ******************/
		/**** md5 signature: e3c0beaae5cf73e08b62b2c07cd5114d ****/
		%feature("compactdefaultargs") TransformMatrix;
		%feature("autodoc", "Returns the transformation matrix moving data from the xy plane into space or zero.

Returns
-------
opencascade::handle<IGESGeom_TransformationMatrix>
") TransformMatrix;
		opencascade::handle<IGESGeom_TransformationMatrix> TransformMatrix();

};


%make_alias(IGESDraw_Planar)

%extend IGESDraw_Planar {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IGESDraw_Protocol *
**************************/
class IGESDraw_Protocol : public IGESData_Protocol {
	public:
		/****************** IGESDraw_Protocol ******************/
		/**** md5 signature: 96121e1b411fb531b95b750051dfd06b ****/
		%feature("compactdefaultargs") IGESDraw_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_Protocol;
		 IGESDraw_Protocol();

		/****************** NbResources ******************/
		/**** md5 signature: cd524335b33aeb6eb83cc80f6b7e5681 ****/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of resource protocol. here, one (protocol from igesdimen).

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


%make_alias(IGESDraw_Protocol)

%extend IGESDraw_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESDraw_ReadWriteModule *
*********************************/
class IGESDraw_ReadWriteModule : public IGESData_ReadWriteModule {
	public:
		/****************** IGESDraw_ReadWriteModule ******************/
		/**** md5 signature: 4e44855a736439484d521ae043adf3e1 ****/
		%feature("compactdefaultargs") IGESDraw_ReadWriteModule;
		%feature("autodoc", "Creates a readwritemodule & puts it into readerlib & writerlib.

Returns
-------
None
") IGESDraw_ReadWriteModule;
		 IGESDraw_ReadWriteModule();

		/****************** CaseIGES ******************/
		/**** md5 signature: de66f0948cefad4e0218511df612ee48 ****/
		%feature("compactdefaultargs") CaseIGES;
		%feature("autodoc", "Defines case numbers for entities of igesdraw.

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
		%feature("autodoc", "Reads own parameters from file for an entity of igesdraw.

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


%make_alias(IGESDraw_ReadWriteModule)

%extend IGESDraw_ReadWriteModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESDraw_RectArraySubfigure *
************************************/
class IGESDraw_RectArraySubfigure : public IGESData_IGESEntity {
	public:
		/****************** IGESDraw_RectArraySubfigure ******************/
		/**** md5 signature: 6c4e8e7de2534c7d6bc2dab2a3c4a50b ****/
		%feature("compactdefaultargs") IGESDraw_RectArraySubfigure;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_RectArraySubfigure;
		 IGESDraw_RectArraySubfigure();

		/****************** BaseEntity ******************/
		/**** md5 signature: e17a3a96b7699ab4f5e3160e55d72191 ****/
		%feature("compactdefaultargs") BaseEntity;
		%feature("autodoc", "Returns the base entity, copies of which are produced.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") BaseEntity;
		opencascade::handle<IGESData_IGESEntity> BaseEntity();

		/****************** ColumnSeparation ******************/
		/**** md5 signature: 2abb3f3128dc84dbc7da06067409bffa ****/
		%feature("compactdefaultargs") ColumnSeparation;
		%feature("autodoc", "Returns horizontal distance between columns.

Returns
-------
float
") ColumnSeparation;
		Standard_Real ColumnSeparation();

		/****************** DisplayFlag ******************/
		/**** md5 signature: 8f021f9d33b0aa3382d2e8de002539bd ****/
		%feature("compactdefaultargs") DisplayFlag;
		%feature("autodoc", "Returns true if (listcount = 0) i.e., all elements to be displayed.

Returns
-------
bool
") DisplayFlag;
		Standard_Boolean DisplayFlag();

		/****************** DoDontFlag ******************/
		/**** md5 signature: 3fc233bae3390912ef1d1c12b10fd944 ****/
		%feature("compactdefaultargs") DoDontFlag;
		%feature("autodoc", "Returns 0 if half or fewer of the elements of the array are defined 1 if half or more of the elements are defined.

Returns
-------
bool
") DoDontFlag;
		Standard_Boolean DoDontFlag();

		/****************** Init ******************/
		/**** md5 signature: d5e119d04b95c1cc04f69174be57300a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class rectarraysubfigure - abase : a base entity which is replicated - ascale : scale factor - acorner : lower left hand corner for the entire array - nbcols : number of columns of the array - nbrows : number of rows of the array - hdisp : column separations - vtdisp : row separation - rotationangle : rotation angle specified in radians - alldont : do-don't flag to control which portion to display - allnumpos : list of positions to be or not to be displayed.

Parameters
----------
aBase: IGESData_IGESEntity
aScale: float
aCorner: gp_XYZ
nbCols: int
nbRows: int
hDisp: float
vtDisp: float
rotationAngle: float
doDont: int
allNumPos: TColStd_HArray1OfInteger

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_IGESEntity> & aBase, const Standard_Real aScale, const gp_XYZ & aCorner, const Standard_Integer nbCols, const Standard_Integer nbRows, const Standard_Real hDisp, const Standard_Real vtDisp, const Standard_Real rotationAngle, const Standard_Integer doDont, const opencascade::handle<TColStd_HArray1OfInteger> & allNumPos);

		/****************** ListCount ******************/
		/**** md5 signature: ec895bde9265636050706b0978b71462 ****/
		%feature("compactdefaultargs") ListCount;
		%feature("autodoc", "Returns 0 if all replicated entities to be displayed.

Returns
-------
int
") ListCount;
		Standard_Integer ListCount();

		/****************** ListPosition ******************/
		/**** md5 signature: a52b26a7a40a329c13198c11cf77c771 ****/
		%feature("compactdefaultargs") ListPosition;
		%feature("autodoc", "Returns the index'th value position raises exception if index <= 0 or index > listcount().

Parameters
----------
Index: int

Returns
-------
int
") ListPosition;
		Standard_Integer ListPosition(const Standard_Integer Index);

		/****************** LowerLeftCorner ******************/
		/**** md5 signature: 5bb1aedfa992f4fc0147b15c1edf5ec9 ****/
		%feature("compactdefaultargs") LowerLeftCorner;
		%feature("autodoc", "Returns coordinates of lower left hand corner for the entire array.

Returns
-------
gp_Pnt
") LowerLeftCorner;
		gp_Pnt LowerLeftCorner();

		/****************** NbColumns ******************/
		/**** md5 signature: 7fb9d03e9690d1db6f5c8ba6da0b2a42 ****/
		%feature("compactdefaultargs") NbColumns;
		%feature("autodoc", "Returns number of columns in the array.

Returns
-------
int
") NbColumns;
		Standard_Integer NbColumns();

		/****************** NbRows ******************/
		/**** md5 signature: c4dc7779feadcb0368234f64487bf577 ****/
		%feature("compactdefaultargs") NbRows;
		%feature("autodoc", "Returns number of rows in the array.

Returns
-------
int
") NbRows;
		Standard_Integer NbRows();

		/****************** PositionNum ******************/
		/**** md5 signature: 00bd252b3a72df89ebc6777aeb2c3d60 ****/
		%feature("compactdefaultargs") PositionNum;
		%feature("autodoc", "Returns whether index is to be processed (do) or not to be processed(don't) if (listcount = 0) return thedodontflag.

Parameters
----------
Index: int

Returns
-------
bool
") PositionNum;
		Standard_Boolean PositionNum(const Standard_Integer Index);

		/****************** RotationAngle ******************/
		/**** md5 signature: a0e05e147c18550a43c1eaae52b815fd ****/
		%feature("compactdefaultargs") RotationAngle;
		%feature("autodoc", "Returns rotation angle in radians.

Returns
-------
float
") RotationAngle;
		Standard_Real RotationAngle();

		/****************** RowSeparation ******************/
		/**** md5 signature: a7e2dd0a56011cdbb47880000f387471 ****/
		%feature("compactdefaultargs") RowSeparation;
		%feature("autodoc", "Returns vertical distance between rows.

Returns
-------
float
") RowSeparation;
		Standard_Real RowSeparation();

		/****************** ScaleFactor ******************/
		/**** md5 signature: 67d4a7cfb2dd29c2b400060f1b45b408 ****/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Returns the scale factor.

Returns
-------
float
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****************** TransformedLowerLeftCorner ******************/
		/**** md5 signature: 825ebe61c8761c831b740cd26f62b719 ****/
		%feature("compactdefaultargs") TransformedLowerLeftCorner;
		%feature("autodoc", "Returns transformed coordinates of lower left corner for the array.

Returns
-------
gp_Pnt
") TransformedLowerLeftCorner;
		gp_Pnt TransformedLowerLeftCorner();

};


%make_alias(IGESDraw_RectArraySubfigure)

%extend IGESDraw_RectArraySubfigure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IGESDraw_SegmentedViewsVisible *
***************************************/
class IGESDraw_SegmentedViewsVisible : public IGESData_ViewKindEntity {
	public:
		/****************** IGESDraw_SegmentedViewsVisible ******************/
		/**** md5 signature: 73cf202eb1798ed526106b54c5614bb5 ****/
		%feature("compactdefaultargs") IGESDraw_SegmentedViewsVisible;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_SegmentedViewsVisible;
		 IGESDraw_SegmentedViewsVisible();

		/****************** BreakpointParameter ******************/
		/**** md5 signature: b911e4432db8276cc8c755d170d0e186 ****/
		%feature("compactdefaultargs") BreakpointParameter;
		%feature("autodoc", "Returns the parameter of the breakpoint indicated by breakpointindex raises an exception if breakpointindex <= 0 or breakpointindex > nbsegmentblocks().

Parameters
----------
BreakpointIndex: int

Returns
-------
float
") BreakpointParameter;
		Standard_Real BreakpointParameter(const Standard_Integer BreakpointIndex);

		/****************** ColorDefinition ******************/
		/**** md5 signature: ab25ce4a8fc2d4a078c791231d81c58b ****/
		%feature("compactdefaultargs") ColorDefinition;
		%feature("autodoc", "Returns the color definition entity indicated by colorindex raises an exception if colorindex <= 0 or colorindex > nbsegmentblocks().

Parameters
----------
ColorIndex: int

Returns
-------
opencascade::handle<IGESGraph_Color>
") ColorDefinition;
		opencascade::handle<IGESGraph_Color> ColorDefinition(const Standard_Integer ColorIndex);

		/****************** ColorValue ******************/
		/**** md5 signature: 7783c194b44f93d08a4170b8562ac041 ****/
		%feature("compactdefaultargs") ColorValue;
		%feature("autodoc", "Returns the color value indicated by colorindex raises an exception if colorindex <= 0 or colorindex > nbsegmentblocks().

Parameters
----------
ColorIndex: int

Returns
-------
int
") ColorValue;
		Standard_Integer ColorValue(const Standard_Integer ColorIndex);

		/****************** DisplayFlag ******************/
		/**** md5 signature: fb1e296d8e2b0cd56ed33c8744f2a504 ****/
		%feature("compactdefaultargs") DisplayFlag;
		%feature("autodoc", "Returns the display flag indicated by flagindex raises an exception if flagindex <= 0 or flagindex > nbsegmentblocks().

Parameters
----------
FlagIndex: int

Returns
-------
int
") DisplayFlag;
		Standard_Integer DisplayFlag(const Standard_Integer FlagIndex);

		/****************** Init ******************/
		/**** md5 signature: 9b9014e8d75d0250f91813fa7cba0ab6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class segmentedviewsvisible - allviews : pointers to view entities - allbreakpointparameters : parameters of breakpoints - alldisplayflags : display flags - allcolorvalues : color values - allcolordefinitions : color definitions - alllinefontvalues : linefont values - alllinefontdefinitions : linefont definitions - alllineweights : line weights raises exception if lengths of allviews, allbreakpointparameters, alldisplayflags, allcolorvalues, allcolordefinitions, alllinefontvalues, alllinefontdefinitions and alllineweights are not same.

Parameters
----------
allViews: IGESDraw_HArray1OfViewKindEntity
allBreakpointParameters: TColStd_HArray1OfReal
allDisplayFlags: TColStd_HArray1OfInteger
allColorValues: TColStd_HArray1OfInteger
allColorDefinitions: IGESGraph_HArray1OfColor
allLineFontValues: TColStd_HArray1OfInteger
allLineFontDefinitions: IGESBasic_HArray1OfLineFontEntity
allLineWeights: TColStd_HArray1OfInteger

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDraw_HArray1OfViewKindEntity> & allViews, const opencascade::handle<TColStd_HArray1OfReal> & allBreakpointParameters, const opencascade::handle<TColStd_HArray1OfInteger> & allDisplayFlags, const opencascade::handle<TColStd_HArray1OfInteger> & allColorValues, const opencascade::handle<IGESGraph_HArray1OfColor> & allColorDefinitions, const opencascade::handle<TColStd_HArray1OfInteger> & allLineFontValues, const opencascade::handle<IGESBasic_HArray1OfLineFontEntity> & allLineFontDefinitions, const opencascade::handle<TColStd_HArray1OfInteger> & allLineWeights);

		/****************** IsColorDefinition ******************/
		/**** md5 signature: 1903773b7ba40e489ee52123fb8ee59d ****/
		%feature("compactdefaultargs") IsColorDefinition;
		%feature("autodoc", "Returns true if the colorindex'th value of the 'thecolordefinitions' field of <self> is a pointer raises an exception if colorindex <= 0 or colorindex > nbsegmentblocks().

Parameters
----------
ColorIndex: int

Returns
-------
bool
") IsColorDefinition;
		Standard_Boolean IsColorDefinition(const Standard_Integer ColorIndex);

		/****************** IsFontDefinition ******************/
		/**** md5 signature: 320d3dee967b816661bfabb3b1bc6c45 ****/
		%feature("compactdefaultargs") IsFontDefinition;
		%feature("autodoc", "Returns true if the fontindex'th value of the 'thelinefontdefinitions' field of <self> is a pointer raises an exception if fontindex <= 0 or fontindex > nbsegmentblocks().

Parameters
----------
FontIndex: int

Returns
-------
bool
") IsFontDefinition;
		Standard_Boolean IsFontDefinition(const Standard_Integer FontIndex);

		/****************** IsSingle ******************/
		/**** md5 signature: b2735ca34cbdb48e3f13d2210fcf2236 ****/
		%feature("compactdefaultargs") IsSingle;
		%feature("autodoc", "Returns false (for a complex view).

Returns
-------
bool
") IsSingle;
		Standard_Boolean IsSingle();

		/****************** LineFontDefinition ******************/
		/**** md5 signature: 8bc7054474d8fd099c0dfc7bb5c84d52 ****/
		%feature("compactdefaultargs") LineFontDefinition;
		%feature("autodoc", "Returns the linefont definition entity indicated by fontindex raises an exception if fontindex <= 0 or fontindex > nbsegmentblocks().

Parameters
----------
FontIndex: int

Returns
-------
opencascade::handle<IGESData_LineFontEntity>
") LineFontDefinition;
		opencascade::handle<IGESData_LineFontEntity> LineFontDefinition(const Standard_Integer FontIndex);

		/****************** LineFontValue ******************/
		/**** md5 signature: f2b3de4a7f1239b3714b3f8814872b32 ****/
		%feature("compactdefaultargs") LineFontValue;
		%feature("autodoc", "Returns the linefont value indicated by fontindex raises an exception if fontindex <= 0 or fontindex > nbsegmentblocks().

Parameters
----------
FontIndex: int

Returns
-------
int
") LineFontValue;
		Standard_Integer LineFontValue(const Standard_Integer FontIndex);

		/****************** LineWeightItem ******************/
		/**** md5 signature: 422e94de859c96cb84612c45e81f4d7d ****/
		%feature("compactdefaultargs") LineWeightItem;
		%feature("autodoc", "Returns the lineweight value indicated by weightindex raises an exception if weightindex <= 0 or weightindex > nbsegmentblocks().

Parameters
----------
WeightIndex: int

Returns
-------
int
") LineWeightItem;
		Standard_Integer LineWeightItem(const Standard_Integer WeightIndex);

		/****************** NbSegmentBlocks ******************/
		/**** md5 signature: 7a5069e8e9aaf331bbf9e509a8575f65 ****/
		%feature("compactdefaultargs") NbSegmentBlocks;
		%feature("autodoc", "Returns the number of view/segment blocks in <self> similar to nbviews but has a more general significance.

Returns
-------
int
") NbSegmentBlocks;
		Standard_Integer NbSegmentBlocks();

		/****************** NbViews ******************/
		/**** md5 signature: d203d38adf71eeaf19d2a209dc34d2e5 ****/
		%feature("compactdefaultargs") NbViews;
		%feature("autodoc", "Returns the count of views referenced by <self> (inherited).

Returns
-------
int
") NbViews;
		Standard_Integer NbViews();

		/****************** ViewItem ******************/
		/**** md5 signature: b83288bdf9063612a26f8982ffefaeee ****/
		%feature("compactdefaultargs") ViewItem;
		%feature("autodoc", "Returns the view entity indicated by viewindex raises an exception if viewindex <= 0 or viewindex > nbsegmentblocks().

Parameters
----------
ViewIndex: int

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") ViewItem;
		opencascade::handle<IGESData_ViewKindEntity> ViewItem(const Standard_Integer ViewIndex);

};


%make_alias(IGESDraw_SegmentedViewsVisible)

%extend IGESDraw_SegmentedViewsVisible {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESDraw_SpecificModule *
********************************/
class IGESDraw_SpecificModule : public IGESData_SpecificModule {
	public:
		/****************** IGESDraw_SpecificModule ******************/
		/**** md5 signature: 5ec8d6450aeaebbd4f58774d9148c97f ****/
		%feature("compactdefaultargs") IGESDraw_SpecificModule;
		%feature("autodoc", "Creates a specificmodule from igesdraw & puts it into specificlib.

Returns
-------
None
") IGESDraw_SpecificModule;
		 IGESDraw_SpecificModule();

		/****************** OwnCorrect ******************/
		/**** md5 signature: bbaa7e58769f5cc28e757e0612cf4245 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Performs non-ambiguous corrections on entities which support them (planar).

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


%make_alias(IGESDraw_SpecificModule)

%extend IGESDraw_SpecificModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESDraw_ToolCircArraySubfigure *
****************************************/
class IGESDraw_ToolCircArraySubfigure {
	public:
		/****************** IGESDraw_ToolCircArraySubfigure ******************/
		/**** md5 signature: a7952f87f0e4d67bf8e7eead9ad7753c ****/
		%feature("compactdefaultargs") IGESDraw_ToolCircArraySubfigure;
		%feature("autodoc", "Returns a toolcircarraysubfigure, ready to work.

Returns
-------
None
") IGESDraw_ToolCircArraySubfigure;
		 IGESDraw_ToolCircArraySubfigure();

		/****************** DirChecker ******************/
		/**** md5 signature: 4f67abe0898d506efac9b44f258d1704 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_CircArraySubfigure

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_CircArraySubfigure> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 22d5d87104376dd9d0ff2ca7f1e600aa ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_CircArraySubfigure
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_CircArraySubfigure> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: addaf68ecfc0b3e26e0e2ee1154c9f05 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDraw_CircArraySubfigure
entto: IGESDraw_CircArraySubfigure
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_CircArraySubfigure> & entfrom, const opencascade::handle<IGESDraw_CircArraySubfigure> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 4bafd3851031af8f352bd1a2d9b40fc4 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a circarraysubfigure <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDraw_CircArraySubfigure
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_CircArraySubfigure> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: c047213e4aec094f21aed554c7a01495 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_CircArraySubfigure
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_CircArraySubfigure> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 2e660c07e765aece16e3213444178161 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_CircArraySubfigure
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_CircArraySubfigure> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolCircArraySubfigure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESDraw_ToolConnectPoint *
**********************************/
class IGESDraw_ToolConnectPoint {
	public:
		/****************** IGESDraw_ToolConnectPoint ******************/
		/**** md5 signature: 7091c849752f60728c7358753d5c2608 ****/
		%feature("compactdefaultargs") IGESDraw_ToolConnectPoint;
		%feature("autodoc", "Returns a toolconnectpoint, ready to work.

Returns
-------
None
") IGESDraw_ToolConnectPoint;
		 IGESDraw_ToolConnectPoint();

		/****************** DirChecker ******************/
		/**** md5 signature: 24e0dc77342d82b2761a8b07a5dd82c6 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_ConnectPoint

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_ConnectPoint> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: fe5567aa37cb0cd30df9e8828927a082 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_ConnectPoint
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_ConnectPoint> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 4942442109cc9ec785e52a56418f6eb9 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDraw_ConnectPoint
entto: IGESDraw_ConnectPoint
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_ConnectPoint> & entfrom, const opencascade::handle<IGESDraw_ConnectPoint> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: af9198662814c999164748e9de3c3402 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a connectpoint <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDraw_ConnectPoint
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_ConnectPoint> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 2f853669fd13df310671fcba8a555a13 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_ConnectPoint
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_ConnectPoint> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 89214eee146ccce841a7e1bfea5ebe2c ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_ConnectPoint
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_ConnectPoint> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolConnectPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESDraw_ToolDrawing *
*****************************/
class IGESDraw_ToolDrawing {
	public:
		/****************** IGESDraw_ToolDrawing ******************/
		/**** md5 signature: eb2cced0deab7fb0c0f1eed81d2e7342 ****/
		%feature("compactdefaultargs") IGESDraw_ToolDrawing;
		%feature("autodoc", "Returns a tooldrawing, ready to work.

Returns
-------
None
") IGESDraw_ToolDrawing;
		 IGESDraw_ToolDrawing();

		/****************** DirChecker ******************/
		/**** md5 signature: 502a5baa12f13deee224513aa242c5c1 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_Drawing

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_Drawing> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: da52e4381b520353e608252e2d3f8c01 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_Drawing
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_Drawing> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 4fb2feafb3d5e8dca78566df00f090d5 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDraw_Drawing
entto: IGESDraw_Drawing
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_Drawing> & entfrom, const opencascade::handle<IGESDraw_Drawing> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: f311744d8dd51302db12de0e5950589e ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a drawing (null views are removed from list).

Parameters
----------
ent: IGESDraw_Drawing

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDraw_Drawing> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: b2b570c7a267e2ce09e545b0b3a56a79 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a drawing <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDraw_Drawing
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_Drawing> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: aaab6760ca1e06918a5e2be6e5a00e2c ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_Drawing
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_Drawing> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 730f72e0b4b7a3396befdc3d8eea31ff ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_Drawing
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_Drawing> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolDrawing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESDraw_ToolDrawingWithRotation *
*****************************************/
class IGESDraw_ToolDrawingWithRotation {
	public:
		/****************** IGESDraw_ToolDrawingWithRotation ******************/
		/**** md5 signature: ac2857bfe2991ea115703374d56e4224 ****/
		%feature("compactdefaultargs") IGESDraw_ToolDrawingWithRotation;
		%feature("autodoc", "Returns a tooldrawingwithrotation, ready to work.

Returns
-------
None
") IGESDraw_ToolDrawingWithRotation;
		 IGESDraw_ToolDrawingWithRotation();

		/****************** DirChecker ******************/
		/**** md5 signature: ccd9e3bb117f444ba7743223c05c3599 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_DrawingWithRotation

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_DrawingWithRotation> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: cdf9c1d4a82950b82f0364f969255ffc ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_DrawingWithRotation
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_DrawingWithRotation> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 753a1577968e93d2900358b34c555c7d ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDraw_DrawingWithRotation
entto: IGESDraw_DrawingWithRotation
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_DrawingWithRotation> & entfrom, const opencascade::handle<IGESDraw_DrawingWithRotation> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 005c99b92db07f5bf77e9c9660e0bc14 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a drawingwithrotation (null views are removed from list).

Parameters
----------
ent: IGESDraw_DrawingWithRotation

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDraw_DrawingWithRotation> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 006ef3fa37fdcaf020a69fa400016222 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a drawingwithrotation <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDraw_DrawingWithRotation
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_DrawingWithRotation> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 3bdaa676516a75092d669eb1f48b3b8b ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_DrawingWithRotation
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_DrawingWithRotation> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: ea74ab0b62c8ee5b3927b0573fd29ffa ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_DrawingWithRotation
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_DrawingWithRotation> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolDrawingWithRotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESDraw_ToolLabelDisplay *
**********************************/
class IGESDraw_ToolLabelDisplay {
	public:
		/****************** IGESDraw_ToolLabelDisplay ******************/
		/**** md5 signature: b59a11e44bbd339b3f4d6dc64f746267 ****/
		%feature("compactdefaultargs") IGESDraw_ToolLabelDisplay;
		%feature("autodoc", "Returns a toollabeldisplay, ready to work.

Returns
-------
None
") IGESDraw_ToolLabelDisplay;
		 IGESDraw_ToolLabelDisplay();

		/****************** DirChecker ******************/
		/**** md5 signature: f6253df5ddb025ad1c7c20a84fb57b3c ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_LabelDisplay

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_LabelDisplay> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 0106192f7e15537d033c6a8cb3f21dd8 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_LabelDisplay
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_LabelDisplay> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 2dd4f41b61e3313bea33038fff457dbf ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDraw_LabelDisplay
entto: IGESDraw_LabelDisplay
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_LabelDisplay> & entfrom, const opencascade::handle<IGESDraw_LabelDisplay> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 3cab542138fef20fdd243bd9491bed6e ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a labeldisplay <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDraw_LabelDisplay
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_LabelDisplay> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 6b3f2d1a8d902a04ab4324b396058bbc ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_LabelDisplay
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_LabelDisplay> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 27465cc8bfbab1b5883384c68902b565 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_LabelDisplay
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_LabelDisplay> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolLabelDisplay {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESDraw_ToolNetworkSubfigure *
**************************************/
class IGESDraw_ToolNetworkSubfigure {
	public:
		/****************** IGESDraw_ToolNetworkSubfigure ******************/
		/**** md5 signature: 3af351895117a01e3ff1ea84c22d36ab ****/
		%feature("compactdefaultargs") IGESDraw_ToolNetworkSubfigure;
		%feature("autodoc", "Returns a toolnetworksubfigure, ready to work.

Returns
-------
None
") IGESDraw_ToolNetworkSubfigure;
		 IGESDraw_ToolNetworkSubfigure();

		/****************** DirChecker ******************/
		/**** md5 signature: 2a3bfaf3416ce4fd9f764000cedf7c58 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_NetworkSubfigure

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_NetworkSubfigure> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 25ab3f7d6c321586cbaeada7577cf565 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_NetworkSubfigure
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_NetworkSubfigure> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 66dc8a915bd0661a4e03ab537a5c3eeb ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDraw_NetworkSubfigure
entto: IGESDraw_NetworkSubfigure
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_NetworkSubfigure> & entfrom, const opencascade::handle<IGESDraw_NetworkSubfigure> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 92aa1b3b0eec82f9449871e3d5ee6d18 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a networksubfigure <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDraw_NetworkSubfigure
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_NetworkSubfigure> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 838f24ec9b1934597d0ec603409904f3 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_NetworkSubfigure
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_NetworkSubfigure> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 1b81737dde5b490385c553b5af351b34 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_NetworkSubfigure
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_NetworkSubfigure> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolNetworkSubfigure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESDraw_ToolNetworkSubfigureDef *
*****************************************/
class IGESDraw_ToolNetworkSubfigureDef {
	public:
		/****************** IGESDraw_ToolNetworkSubfigureDef ******************/
		/**** md5 signature: b9f77b472c4ef66086535bd594f75fa7 ****/
		%feature("compactdefaultargs") IGESDraw_ToolNetworkSubfigureDef;
		%feature("autodoc", "Returns a toolnetworksubfiguredef, ready to work.

Returns
-------
None
") IGESDraw_ToolNetworkSubfigureDef;
		 IGESDraw_ToolNetworkSubfigureDef();

		/****************** DirChecker ******************/
		/**** md5 signature: 1c6ec1a928ca1d1559a061a037c484a5 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_NetworkSubfigureDef

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_NetworkSubfigureDef> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 64cd643098b76b5296fb3205e0ee3526 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_NetworkSubfigureDef
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_NetworkSubfigureDef> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 9fe91e15527e136c7f49ef30b89e2ba3 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDraw_NetworkSubfigureDef
entto: IGESDraw_NetworkSubfigureDef
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_NetworkSubfigureDef> & entfrom, const opencascade::handle<IGESDraw_NetworkSubfigureDef> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 04625c3b2c3a1de69d24277af2c92b13 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a networksubfiguredef <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDraw_NetworkSubfigureDef
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_NetworkSubfigureDef> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: b37a34ec3379cee1d540312c6623318a ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_NetworkSubfigureDef
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_NetworkSubfigureDef> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 6a961ba8e422744799ed895fa5f13dfd ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_NetworkSubfigureDef
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_NetworkSubfigureDef> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolNetworkSubfigureDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESDraw_ToolPerspectiveView *
*************************************/
class IGESDraw_ToolPerspectiveView {
	public:
		/****************** IGESDraw_ToolPerspectiveView ******************/
		/**** md5 signature: ad40b63786274523fa6dc1269712edd9 ****/
		%feature("compactdefaultargs") IGESDraw_ToolPerspectiveView;
		%feature("autodoc", "Returns a toolperspectiveview, ready to work.

Returns
-------
None
") IGESDraw_ToolPerspectiveView;
		 IGESDraw_ToolPerspectiveView();

		/****************** DirChecker ******************/
		/**** md5 signature: 4f370cda50ef587f7e54a30872184678 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_PerspectiveView

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_PerspectiveView> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 67c05ce69a029709eb9afd95c6d94826 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_PerspectiveView
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_PerspectiveView> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 8550379465de85c36c1070b09c8198de ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDraw_PerspectiveView
entto: IGESDraw_PerspectiveView
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_PerspectiveView> & entfrom, const opencascade::handle<IGESDraw_PerspectiveView> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 037112e5806d49c02bdaf4478e855f9e ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a perspectiveview <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDraw_PerspectiveView
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_PerspectiveView> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: edd622db0802d6be1071a3af90063f3b ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_PerspectiveView
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_PerspectiveView> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 1fad1718122c4768cb515ec1f2b21bcc ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_PerspectiveView
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_PerspectiveView> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolPerspectiveView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESDraw_ToolPlanar *
****************************/
class IGESDraw_ToolPlanar {
	public:
		/****************** IGESDraw_ToolPlanar ******************/
		/**** md5 signature: 3438aa3c71c085947181361c8cef5ee3 ****/
		%feature("compactdefaultargs") IGESDraw_ToolPlanar;
		%feature("autodoc", "Returns a toolplanar, ready to work.

Returns
-------
None
") IGESDraw_ToolPlanar;
		 IGESDraw_ToolPlanar();

		/****************** DirChecker ******************/
		/**** md5 signature: 9edffaf2fa32b6195be16360ef9efc4a ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_Planar

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_Planar> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 08ea14aa699ba14eda9230d5879b4e19 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_Planar
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_Planar> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: b65cf5122d34c518473583f028884087 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDraw_Planar
entto: IGESDraw_Planar
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_Planar> & entfrom, const opencascade::handle<IGESDraw_Planar> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: d08643b253e6f8fb213ff56fe2856ece ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a planar (nbmatrices forced to 1).

Parameters
----------
ent: IGESDraw_Planar

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDraw_Planar> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 0355364056f1ff3e0b8d35be01003b35 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a planar <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDraw_Planar
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_Planar> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 905b1b9a2e15cac8d8d2bf1b5eb3c611 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_Planar
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_Planar> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 41e150024fabde6e98714586df67bf4c ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_Planar
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_Planar> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolPlanar {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESDraw_ToolRectArraySubfigure *
****************************************/
class IGESDraw_ToolRectArraySubfigure {
	public:
		/****************** IGESDraw_ToolRectArraySubfigure ******************/
		/**** md5 signature: c80ff39e60a64f89c4afadd9ae43253f ****/
		%feature("compactdefaultargs") IGESDraw_ToolRectArraySubfigure;
		%feature("autodoc", "Returns a toolrectarraysubfigure, ready to work.

Returns
-------
None
") IGESDraw_ToolRectArraySubfigure;
		 IGESDraw_ToolRectArraySubfigure();

		/****************** DirChecker ******************/
		/**** md5 signature: f5011f0e99ad1d3c583ed5e75b5b950d ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_RectArraySubfigure

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_RectArraySubfigure> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 0e78b638a8f628a47c1583f5047320f3 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_RectArraySubfigure
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_RectArraySubfigure> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 18790710a7a8608fd8e437b614e94838 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDraw_RectArraySubfigure
entto: IGESDraw_RectArraySubfigure
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_RectArraySubfigure> & entfrom, const opencascade::handle<IGESDraw_RectArraySubfigure> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 251fa1049fd302caf3381a7c2801c1fa ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a rectarraysubfigure <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDraw_RectArraySubfigure
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_RectArraySubfigure> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 41dc7c429ce6d6a00dd898ba866ef864 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_RectArraySubfigure
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_RectArraySubfigure> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 766a65616121930ad7793c9cef84cc8d ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_RectArraySubfigure
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_RectArraySubfigure> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolRectArraySubfigure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class IGESDraw_ToolSegmentedViewsVisible *
*******************************************/
class IGESDraw_ToolSegmentedViewsVisible {
	public:
		/****************** IGESDraw_ToolSegmentedViewsVisible ******************/
		/**** md5 signature: 88b0f985606ff441ce2713c5c39e6358 ****/
		%feature("compactdefaultargs") IGESDraw_ToolSegmentedViewsVisible;
		%feature("autodoc", "Returns a toolsegmentedviewsvisible, ready to work.

Returns
-------
None
") IGESDraw_ToolSegmentedViewsVisible;
		 IGESDraw_ToolSegmentedViewsVisible();

		/****************** DirChecker ******************/
		/**** md5 signature: a209a6c71782ec48a7ad822869ca21b2 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_SegmentedViewsVisible

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_SegmentedViewsVisible> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 1b045091de762bfd159d90c49a8cfcdc ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_SegmentedViewsVisible
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_SegmentedViewsVisible> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: f0c8e757d239e50e32acf9b5fd8ba63f ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDraw_SegmentedViewsVisible
entto: IGESDraw_SegmentedViewsVisible
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_SegmentedViewsVisible> & entfrom, const opencascade::handle<IGESDraw_SegmentedViewsVisible> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 2018ddf0db3057e07b2d9341edd30512 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a segmentedviewsvisible <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDraw_SegmentedViewsVisible
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_SegmentedViewsVisible> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: d4c7f6a052f59e1c7d0bdfd7226d6a9c ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_SegmentedViewsVisible
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_SegmentedViewsVisible> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 31f1d3e399f2ed223608ef4738e6ccb4 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_SegmentedViewsVisible
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_SegmentedViewsVisible> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolSegmentedViewsVisible {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IGESDraw_ToolView *
**************************/
class IGESDraw_ToolView {
	public:
		/****************** IGESDraw_ToolView ******************/
		/**** md5 signature: c16b35d1e142c2aa26f25b419d98a34b ****/
		%feature("compactdefaultargs") IGESDraw_ToolView;
		%feature("autodoc", "Returns a toolview, ready to work.

Returns
-------
None
") IGESDraw_ToolView;
		 IGESDraw_ToolView();

		/****************** DirChecker ******************/
		/**** md5 signature: abb98e83dd05496277e39a52c171d17c ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_View

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_View> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 1dd39d34460cfb28880af0c39cb2661e ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_View
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_View> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: aa834600c5853f07bb6555e180fad714 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDraw_View
entto: IGESDraw_View
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_View> & entfrom, const opencascade::handle<IGESDraw_View> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 6af0ab6279f004edc2d08fc3811e1d14 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a view <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDraw_View
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_View> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: c691b45ade3654b673929fc819898686 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_View
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_View> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 9eb9f11335e1746404846b9199b498b1 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_View
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_View> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESDraw_ToolViewsVisible *
**********************************/
class IGESDraw_ToolViewsVisible {
	public:
		/****************** IGESDraw_ToolViewsVisible ******************/
		/**** md5 signature: 67bc0725cc22e181b98a7f3f80a1dcd6 ****/
		%feature("compactdefaultargs") IGESDraw_ToolViewsVisible;
		%feature("autodoc", "Returns a toolviewsvisible, ready to work.

Returns
-------
None
") IGESDraw_ToolViewsVisible;
		 IGESDraw_ToolViewsVisible();

		/****************** DirChecker ******************/
		/**** md5 signature: 9b53b8e5163e92dd7a9420fc84a472d4 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_ViewsVisible

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_ViewsVisible> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 8f58e1a9a5cbb93b07614735bcf9f0a6 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_ViewsVisible
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_ViewsVisible> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 3ae550c19b005601aa1b96c095d2b9fe ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters shared not implied, i.e. all but the displayed entities.

Parameters
----------
entfrom: IGESDraw_ViewsVisible
entto: IGESDraw_ViewsVisible
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_ViewsVisible> & entfrom, const opencascade::handle<IGESDraw_ViewsVisible> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: fe8ba0810fd8d2ef16e42480cf8c3ca4 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a viewsvisible (all displayed entities must refer to <ent> in directory part, else the list is cleared).

Parameters
----------
ent: IGESDraw_ViewsVisible

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDraw_ViewsVisible> & ent);

		/****************** OwnImplied ******************/
		/**** md5 signature: c71741094993fc5f6bb8934bc55eedc3 ****/
		%feature("compactdefaultargs") OwnImplied;
		%feature("autodoc", "Lists the entities shared by a viewsvisible <ent>, from its specific (own) implied parameters : the displayed entities.

Parameters
----------
ent: IGESDraw_ViewsVisible
iter: Interface_EntityIterator

Returns
-------
None
") OwnImplied;
		void OwnImplied(const opencascade::handle<IGESDraw_ViewsVisible> & ent, Interface_EntityIterator & iter);

		/****************** OwnRenew ******************/
		/**** md5 signature: 115f314a244e0d4714852a5c85800b5d ****/
		%feature("compactdefaultargs") OwnRenew;
		%feature("autodoc", "Copies specific implied parameters : the displayed entities which have already been copied.

Parameters
----------
entfrom: IGESDraw_ViewsVisible
entto: IGESDraw_ViewsVisible
TC: Interface_CopyTool

Returns
-------
None
") OwnRenew;
		void OwnRenew(const opencascade::handle<IGESDraw_ViewsVisible> & entfrom, const opencascade::handle<IGESDraw_ViewsVisible> & entto, const Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 56a3f0ed13fc7c71bf856d7ab41542c7 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a viewsvisible <ent>, from its specific (own) parameters shared not implied (the views).

Parameters
----------
ent: IGESDraw_ViewsVisible
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_ViewsVisible> & ent, Interface_EntityIterator & iter);

		/****************** OwnWhenDelete ******************/
		/**** md5 signature: 986819efcc3cd18f4fce8f3baa2cbea7 ****/
		%feature("compactdefaultargs") OwnWhenDelete;
		%feature("autodoc", "Clears specific implied parameters, which cause looping structures; required for deletion.

Parameters
----------
ent: IGESDraw_ViewsVisible

Returns
-------
None
") OwnWhenDelete;
		void OwnWhenDelete(const opencascade::handle<IGESDraw_ViewsVisible> & ent);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 2807e5f060a6227055af8e7d3a3e644e ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_ViewsVisible
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_ViewsVisible> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 5cdd05eff1271bccdcd08e9bad505408 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_ViewsVisible
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_ViewsVisible> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolViewsVisible {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class IGESDraw_ToolViewsVisibleWithAttr *
******************************************/
class IGESDraw_ToolViewsVisibleWithAttr {
	public:
		/****************** IGESDraw_ToolViewsVisibleWithAttr ******************/
		/**** md5 signature: c8d4cca844cb4e6f448613df50bc2149 ****/
		%feature("compactdefaultargs") IGESDraw_ToolViewsVisibleWithAttr;
		%feature("autodoc", "Returns a toolviewsvisiblewithattr, ready to work.

Returns
-------
None
") IGESDraw_ToolViewsVisibleWithAttr;
		 IGESDraw_ToolViewsVisibleWithAttr();

		/****************** DirChecker ******************/
		/**** md5 signature: 2f0656b9bc536523856987a7af5f2fcd ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDraw_ViewsVisibleWithAttr

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDraw_ViewsVisibleWithAttr> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: c3e61f0c8d269385d556b7416b7d7fef ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDraw_ViewsVisibleWithAttr
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDraw_ViewsVisibleWithAttr> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 1995eaa61a7a0953deafed4941a9f2f4 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters shared not implied, i.e. all but the displayed entities.

Parameters
----------
entfrom: IGESDraw_ViewsVisibleWithAttr
entto: IGESDraw_ViewsVisibleWithAttr
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDraw_ViewsVisibleWithAttr> & entfrom, const opencascade::handle<IGESDraw_ViewsVisibleWithAttr> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 99bd465c23cb704d393d4424aca91152 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a viewsvisiblewithattr (all displayed entities must refer to <ent> in directory part, else the list is cleared).

Parameters
----------
ent: IGESDraw_ViewsVisibleWithAttr

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESDraw_ViewsVisibleWithAttr> & ent);

		/****************** OwnImplied ******************/
		/**** md5 signature: 913651045d773a3c52c94ddc6f9f7f71 ****/
		%feature("compactdefaultargs") OwnImplied;
		%feature("autodoc", "Lists the entities shared by a viewsvisible <ent>, from its specific (own) implied parameters : the displayed entities.

Parameters
----------
ent: IGESDraw_ViewsVisibleWithAttr
iter: Interface_EntityIterator

Returns
-------
None
") OwnImplied;
		void OwnImplied(const opencascade::handle<IGESDraw_ViewsVisibleWithAttr> & ent, Interface_EntityIterator & iter);

		/****************** OwnRenew ******************/
		/**** md5 signature: cbe985d317876eae265f8494d8db4d55 ****/
		%feature("compactdefaultargs") OwnRenew;
		%feature("autodoc", "Copies specific implied parameters : the displayed entities which have already been copied.

Parameters
----------
entfrom: IGESDraw_ViewsVisibleWithAttr
entto: IGESDraw_ViewsVisibleWithAttr
TC: Interface_CopyTool

Returns
-------
None
") OwnRenew;
		void OwnRenew(const opencascade::handle<IGESDraw_ViewsVisibleWithAttr> & entfrom, const opencascade::handle<IGESDraw_ViewsVisibleWithAttr> & entto, const Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 886b5ae05e86be66d81e7babf54ac80b ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a viewsvisiblewithattr <ent>, from its specific (own) parameters shared not implied, i.e. all but the displayed entities.

Parameters
----------
ent: IGESDraw_ViewsVisibleWithAttr
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDraw_ViewsVisibleWithAttr> & ent, Interface_EntityIterator & iter);

		/****************** OwnWhenDelete ******************/
		/**** md5 signature: 4e1318054abba098b7bf0b7879d58110 ****/
		%feature("compactdefaultargs") OwnWhenDelete;
		%feature("autodoc", "Clears specific implied parameters, which cause looping structures; required for deletion.

Parameters
----------
ent: IGESDraw_ViewsVisibleWithAttr

Returns
-------
None
") OwnWhenDelete;
		void OwnWhenDelete(const opencascade::handle<IGESDraw_ViewsVisibleWithAttr> & ent);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: fd1429dd0aad902043d6d18a0c832a79 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDraw_ViewsVisibleWithAttr
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDraw_ViewsVisibleWithAttr> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 90b392f200ed15a4a55160b1043caef2 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDraw_ViewsVisibleWithAttr
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDraw_ViewsVisibleWithAttr> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDraw_ToolViewsVisibleWithAttr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class IGESDraw_View *
**********************/
class IGESDraw_View : public IGESData_ViewKindEntity {
	public:
		/****************** IGESDraw_View ******************/
		/**** md5 signature: 4120635aa8c81c29a1d1233553ae4596 ****/
		%feature("compactdefaultargs") IGESDraw_View;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_View;
		 IGESDraw_View();

		/****************** BackPlane ******************/
		/**** md5 signature: 93f5f268baa6066e93fe932f7b8477e1 ****/
		%feature("compactdefaultargs") BackPlane;
		%feature("autodoc", "Returns the back of view volume, or null handle.

Returns
-------
opencascade::handle<IGESGeom_Plane>
") BackPlane;
		opencascade::handle<IGESGeom_Plane> BackPlane();

		/****************** BottomPlane ******************/
		/**** md5 signature: 7e3d485f61a06868dbf68900eea7db59 ****/
		%feature("compactdefaultargs") BottomPlane;
		%feature("autodoc", "Returns the bottom of view volume, or null handle.

Returns
-------
opencascade::handle<IGESGeom_Plane>
") BottomPlane;
		opencascade::handle<IGESGeom_Plane> BottomPlane();

		/****************** FrontPlane ******************/
		/**** md5 signature: 992a1b2bf7c0cd83471081d13f19893d ****/
		%feature("compactdefaultargs") FrontPlane;
		%feature("autodoc", "Returns the front of view volume, or null handle.

Returns
-------
opencascade::handle<IGESGeom_Plane>
") FrontPlane;
		opencascade::handle<IGESGeom_Plane> FrontPlane();

		/****************** HasBackPlane ******************/
		/**** md5 signature: 729feb7edd3a64e523a7a7e187432d78 ****/
		%feature("compactdefaultargs") HasBackPlane;
		%feature("autodoc", "Returns false if back of view volume is not present.

Returns
-------
bool
") HasBackPlane;
		Standard_Boolean HasBackPlane();

		/****************** HasBottomPlane ******************/
		/**** md5 signature: 9653fd7d5258aaea12203e92ec7377ac ****/
		%feature("compactdefaultargs") HasBottomPlane;
		%feature("autodoc", "Returns false if bottom of view volume is not present.

Returns
-------
bool
") HasBottomPlane;
		Standard_Boolean HasBottomPlane();

		/****************** HasFrontPlane ******************/
		/**** md5 signature: 08b9244dd4a231613ba4335f0413746f ****/
		%feature("compactdefaultargs") HasFrontPlane;
		%feature("autodoc", "Returns false if front of view volume is not present.

Returns
-------
bool
") HasFrontPlane;
		Standard_Boolean HasFrontPlane();

		/****************** HasLeftPlane ******************/
		/**** md5 signature: d20b4e066515ea85fc991f2dd596c072 ****/
		%feature("compactdefaultargs") HasLeftPlane;
		%feature("autodoc", "Returns false if left side of view volume is not present.

Returns
-------
bool
") HasLeftPlane;
		Standard_Boolean HasLeftPlane();

		/****************** HasRightPlane ******************/
		/**** md5 signature: c9b55e00bf50d2db353256c546550f66 ****/
		%feature("compactdefaultargs") HasRightPlane;
		%feature("autodoc", "Returns false if right side of view volume is not present.

Returns
-------
bool
") HasRightPlane;
		Standard_Boolean HasRightPlane();

		/****************** HasTopPlane ******************/
		/**** md5 signature: 05ed33459160c2823733ea68c31593dc ****/
		%feature("compactdefaultargs") HasTopPlane;
		%feature("autodoc", "Returns false if top of view volume is not present.

Returns
-------
bool
") HasTopPlane;
		Standard_Boolean HasTopPlane();

		/****************** Init ******************/
		/**** md5 signature: 87ddb0f4bea13caaec11da0e1cfa84d5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set fields of the class view - aviewnum : view number - ascale : scale factor - aleftplane : left plane of view volume - atopplane : top plane of view volume - arightplane : right plane of view volume - abottomplane : bottom plane of view volume - abackplane : back plane of view volume - afrontplane : front plane of view volume.

Parameters
----------
aViewNum: int
aScale: float
aLeftPlane: IGESGeom_Plane
aTopPlane: IGESGeom_Plane
aRightPlane: IGESGeom_Plane
aBottomPlane: IGESGeom_Plane
aBackPlane: IGESGeom_Plane
aFrontPlane: IGESGeom_Plane

Returns
-------
None
") Init;
		void Init(const Standard_Integer aViewNum, const Standard_Real aScale, const opencascade::handle<IGESGeom_Plane> & aLeftPlane, const opencascade::handle<IGESGeom_Plane> & aTopPlane, const opencascade::handle<IGESGeom_Plane> & aRightPlane, const opencascade::handle<IGESGeom_Plane> & aBottomPlane, const opencascade::handle<IGESGeom_Plane> & aBackPlane, const opencascade::handle<IGESGeom_Plane> & aFrontPlane);

		/****************** IsSingle ******************/
		/**** md5 signature: b2735ca34cbdb48e3f13d2210fcf2236 ****/
		%feature("compactdefaultargs") IsSingle;
		%feature("autodoc", "Returns true (for a single view).

Returns
-------
bool
") IsSingle;
		Standard_Boolean IsSingle();

		/****************** LeftPlane ******************/
		/**** md5 signature: cff62a140152dd41f0525d7b4c3a19b0 ****/
		%feature("compactdefaultargs") LeftPlane;
		%feature("autodoc", "Returns the left side of view volume, or null handle.

Returns
-------
opencascade::handle<IGESGeom_Plane>
") LeftPlane;
		opencascade::handle<IGESGeom_Plane> LeftPlane();

		/****************** ModelToView ******************/
		/**** md5 signature: 3844ef49e23e329bd62f336a6c41b9fe ****/
		%feature("compactdefaultargs") ModelToView;
		%feature("autodoc", "Returns xyz from the model space to the view space by applying the view matrix.

Parameters
----------
coords: gp_XYZ

Returns
-------
gp_XYZ
") ModelToView;
		gp_XYZ ModelToView(const gp_XYZ & coords);

		/****************** NbViews ******************/
		/**** md5 signature: d203d38adf71eeaf19d2a209dc34d2e5 ****/
		%feature("compactdefaultargs") NbViews;
		%feature("autodoc", "Returns 1 (single view).

Returns
-------
int
") NbViews;
		Standard_Integer NbViews();

		/****************** RightPlane ******************/
		/**** md5 signature: 9fd0dd6087d76039320cdefa5db22c3c ****/
		%feature("compactdefaultargs") RightPlane;
		%feature("autodoc", "Returns the right side of view volume, or null handle.

Returns
-------
opencascade::handle<IGESGeom_Plane>
") RightPlane;
		opencascade::handle<IGESGeom_Plane> RightPlane();

		/****************** ScaleFactor ******************/
		/**** md5 signature: 67d4a7cfb2dd29c2b400060f1b45b408 ****/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Returns the scale factor(default = 1.0).

Returns
-------
float
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****************** TopPlane ******************/
		/**** md5 signature: 694c851c90c05342c0df0d2bd02b2067 ****/
		%feature("compactdefaultargs") TopPlane;
		%feature("autodoc", "Returns the top of view volume, or null handle.

Returns
-------
opencascade::handle<IGESGeom_Plane>
") TopPlane;
		opencascade::handle<IGESGeom_Plane> TopPlane();

		/****************** ViewItem ******************/
		/**** md5 signature: 9a0fd81be9ceabe7e4042d7ae93c11f2 ****/
		%feature("compactdefaultargs") ViewItem;
		%feature("autodoc", "For a single view, returns <self> whatever <num>.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") ViewItem;
		opencascade::handle<IGESData_ViewKindEntity> ViewItem(const Standard_Integer num);

		/****************** ViewMatrix ******************/
		/**** md5 signature: 73afc7b78c4c520daaf6ff644146510e ****/
		%feature("compactdefaultargs") ViewMatrix;
		%feature("autodoc", "Returns the transformation matrix.

Returns
-------
opencascade::handle<IGESData_TransfEntity>
") ViewMatrix;
		opencascade::handle<IGESData_TransfEntity> ViewMatrix();

		/****************** ViewNumber ******************/
		/**** md5 signature: b382f803b363227be5fb9a94ee125fc4 ****/
		%feature("compactdefaultargs") ViewNumber;
		%feature("autodoc", "Returns integer number identifying view orientation.

Returns
-------
int
") ViewNumber;
		Standard_Integer ViewNumber();

};


%make_alias(IGESDraw_View)

%extend IGESDraw_View {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESDraw_ViewsVisible *
******************************/
class IGESDraw_ViewsVisible : public IGESData_ViewKindEntity {
	public:
		/****************** IGESDraw_ViewsVisible ******************/
		/**** md5 signature: 21acd10fd6f224b4df78a1c5a0963a41 ****/
		%feature("compactdefaultargs") IGESDraw_ViewsVisible;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_ViewsVisible;
		 IGESDraw_ViewsVisible();

		/****************** DisplayedEntity ******************/
		/**** md5 signature: 4ea2ffa5e2a5d9336665f6d88f000161 ****/
		%feature("compactdefaultargs") DisplayedEntity;
		%feature("autodoc", "Returns the index'th entity whose display is being specified by this associativity instance raises exception if index <= 0 or index > nbentitydisplayed().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") DisplayedEntity;
		opencascade::handle<IGESData_IGESEntity> DisplayedEntity(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: 7722b278d401ce49849ed8be3049eba7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class viewsvisible - allviewentities : all view kind entities - alldisplayentity : all entities whose display is specified.

Parameters
----------
allViewEntities: IGESDraw_HArray1OfViewKindEntity
allDisplayEntity: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDraw_HArray1OfViewKindEntity> & allViewEntities, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allDisplayEntity);

		/****************** InitImplied ******************/
		/**** md5 signature: 02bb3869dcb677c8dc1ead257336fb18 ****/
		%feature("compactdefaultargs") InitImplied;
		%feature("autodoc", "Changes only the list of displayed entities (null allowed).

Parameters
----------
allDisplayEntity: IGESData_HArray1OfIGESEntity

Returns
-------
None
") InitImplied;
		void InitImplied(const opencascade::handle<IGESData_HArray1OfIGESEntity> & allDisplayEntity);

		/****************** IsSingle ******************/
		/**** md5 signature: b2735ca34cbdb48e3f13d2210fcf2236 ****/
		%feature("compactdefaultargs") IsSingle;
		%feature("autodoc", "Returns false (for a complex view).

Returns
-------
bool
") IsSingle;
		Standard_Boolean IsSingle();

		/****************** NbDisplayedEntities ******************/
		/**** md5 signature: 35d5d57d8b3ef2aa115f014076250514 ****/
		%feature("compactdefaultargs") NbDisplayedEntities;
		%feature("autodoc", "Returns the number of entities displayed in the views or zero if no entities specified in these views.

Returns
-------
int
") NbDisplayedEntities;
		Standard_Integer NbDisplayedEntities();

		/****************** NbViews ******************/
		/**** md5 signature: d203d38adf71eeaf19d2a209dc34d2e5 ****/
		%feature("compactdefaultargs") NbViews;
		%feature("autodoc", "Returns the number of views visible.

Returns
-------
int
") NbViews;
		Standard_Integer NbViews();

		/****************** ViewItem ******************/
		/**** md5 signature: 01312eb9c75d2f0fcede5b7f9455d2c2 ****/
		%feature("compactdefaultargs") ViewItem;
		%feature("autodoc", "Returns the index'th viewkindentity entity raises exception if index <= 0 or index > nbviewsvisible().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") ViewItem;
		opencascade::handle<IGESData_ViewKindEntity> ViewItem(const Standard_Integer Index);

};


%make_alias(IGESDraw_ViewsVisible)

%extend IGESDraw_ViewsVisible {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESDraw_ViewsVisibleWithAttr *
**************************************/
class IGESDraw_ViewsVisibleWithAttr : public IGESData_ViewKindEntity {
	public:
		/****************** IGESDraw_ViewsVisibleWithAttr ******************/
		/**** md5 signature: 5fcbab807a1c9e37c675344519c62cff ****/
		%feature("compactdefaultargs") IGESDraw_ViewsVisibleWithAttr;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDraw_ViewsVisibleWithAttr;
		 IGESDraw_ViewsVisibleWithAttr();

		/****************** ColorDefinition ******************/
		/**** md5 signature: a62c0fa3fffdf6cfdea57465a16b5601 ****/
		%feature("compactdefaultargs") ColorDefinition;
		%feature("autodoc", "Returns the index'th color definition entity raises exception if index <= 0 or index > nbviews().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESGraph_Color>
") ColorDefinition;
		opencascade::handle<IGESGraph_Color> ColorDefinition(const Standard_Integer Index);

		/****************** ColorValue ******************/
		/**** md5 signature: ec712f71454fc97a9178b7b7185602bd ****/
		%feature("compactdefaultargs") ColorValue;
		%feature("autodoc", "Returns the index'th color number value raises exception if index <= 0 or index > nbviews().

Parameters
----------
Index: int

Returns
-------
int
") ColorValue;
		Standard_Integer ColorValue(const Standard_Integer Index);

		/****************** DisplayedEntity ******************/
		/**** md5 signature: 4ea2ffa5e2a5d9336665f6d88f000161 ****/
		%feature("compactdefaultargs") DisplayedEntity;
		%feature("autodoc", "Returns index'th display entity with this particular characteristics raises exception if index <= 0 or index > nbentities().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") DisplayedEntity;
		opencascade::handle<IGESData_IGESEntity> DisplayedEntity(const Standard_Integer Index);

		/****************** FontDefinition ******************/
		/**** md5 signature: 50b8e780990de20ff639906281d6284f ****/
		%feature("compactdefaultargs") FontDefinition;
		%feature("autodoc", "Returns the index'th line font definition entity or null(0) raises exception if index <= 0 or index > nbviews().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_LineFontEntity>
") FontDefinition;
		opencascade::handle<IGESData_LineFontEntity> FontDefinition(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: 12d098bee7a240685eecc3923c07d9ee ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set fields of the class viewsvisiblewithattr - allviewentities : all view kind entities - alllinefonts : all line font values or zero(0) - alllinedefinitions : line font definition (if line font value = 0) - allcolorvalues : all color values - allcolordefinitions : all color definition entities - alllineweights : all line weight values - alldisplayentities : entities which are member of this associativity raises exception if lengths of allviewentities, alllinefonts, allcolorvalues,allcolordefinitions, alllineweights are not same.

Parameters
----------
allViewEntities: IGESDraw_HArray1OfViewKindEntity
allLineFonts: TColStd_HArray1OfInteger
allLineDefinitions: IGESBasic_HArray1OfLineFontEntity
allColorValues: TColStd_HArray1OfInteger
allColorDefinitions: IGESGraph_HArray1OfColor
allLineWeights: TColStd_HArray1OfInteger
allDisplayEntities: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESDraw_HArray1OfViewKindEntity> & allViewEntities, const opencascade::handle<TColStd_HArray1OfInteger> & allLineFonts, const opencascade::handle<IGESBasic_HArray1OfLineFontEntity> & allLineDefinitions, const opencascade::handle<TColStd_HArray1OfInteger> & allColorValues, const opencascade::handle<IGESGraph_HArray1OfColor> & allColorDefinitions, const opencascade::handle<TColStd_HArray1OfInteger> & allLineWeights, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allDisplayEntities);

		/****************** InitImplied ******************/
		/**** md5 signature: 02bb3869dcb677c8dc1ead257336fb18 ****/
		%feature("compactdefaultargs") InitImplied;
		%feature("autodoc", "Changes only the list of displayed entities (null allowed).

Parameters
----------
allDisplayEntity: IGESData_HArray1OfIGESEntity

Returns
-------
None
") InitImplied;
		void InitImplied(const opencascade::handle<IGESData_HArray1OfIGESEntity> & allDisplayEntity);

		/****************** IsColorDefinition ******************/
		/**** md5 signature: d9d881a95d78e456343eeb43587fa621 ****/
		%feature("compactdefaultargs") IsColorDefinition;
		%feature("autodoc", "Returns true if index'th color definition is specified else returns false raises exception if index <= 0 or index > nbviews().

Parameters
----------
Index: int

Returns
-------
bool
") IsColorDefinition;
		Standard_Boolean IsColorDefinition(const Standard_Integer Index);

		/****************** IsFontDefinition ******************/
		/**** md5 signature: 00bc5a62c3b21ff1f553df48c9c28bca ****/
		%feature("compactdefaultargs") IsFontDefinition;
		%feature("autodoc", "Returns true if the index'th line font definition is specified else returns false raises exception if index <= 0 or index > nbviews().

Parameters
----------
Index: int

Returns
-------
bool
") IsFontDefinition;
		Standard_Boolean IsFontDefinition(const Standard_Integer Index);

		/****************** IsSingle ******************/
		/**** md5 signature: b2735ca34cbdb48e3f13d2210fcf2236 ****/
		%feature("compactdefaultargs") IsSingle;
		%feature("autodoc", "Returns false (for a complex view).

Returns
-------
bool
") IsSingle;
		Standard_Boolean IsSingle();

		/****************** LineFontValue ******************/
		/**** md5 signature: 5d277b7a6b8c9590f46ab61dfe6445e3 ****/
		%feature("compactdefaultargs") LineFontValue;
		%feature("autodoc", "Returns the index'th line font value or zero raises exception if index <= 0 or index > nbviews().

Parameters
----------
Index: int

Returns
-------
int
") LineFontValue;
		Standard_Integer LineFontValue(const Standard_Integer Index);

		/****************** LineWeightItem ******************/
		/**** md5 signature: dbafd46738d5812ec025057d6f9e05ff ****/
		%feature("compactdefaultargs") LineWeightItem;
		%feature("autodoc", "Returns the index'th color line weight raises exception if index <= 0 or index > nbviews().

Parameters
----------
Index: int

Returns
-------
int
") LineWeightItem;
		Standard_Integer LineWeightItem(const Standard_Integer Index);

		/****************** NbDisplayedEntities ******************/
		/**** md5 signature: 35d5d57d8b3ef2aa115f014076250514 ****/
		%feature("compactdefaultargs") NbDisplayedEntities;
		%feature("autodoc", "Returns the number of entities which have this particular set of display characteristic, or zero if no entities specified.

Returns
-------
int
") NbDisplayedEntities;
		Standard_Integer NbDisplayedEntities();

		/****************** NbViews ******************/
		/**** md5 signature: d203d38adf71eeaf19d2a209dc34d2e5 ****/
		%feature("compactdefaultargs") NbViews;
		%feature("autodoc", "Returns the number of views containing the view visible, line font, color number, and line weight information.

Returns
-------
int
") NbViews;
		Standard_Integer NbViews();

		/****************** ViewItem ******************/
		/**** md5 signature: 01312eb9c75d2f0fcede5b7f9455d2c2 ****/
		%feature("compactdefaultargs") ViewItem;
		%feature("autodoc", "Returns the index'th viewkindentity entity raises exception if index <= 0 or index > nbviews().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") ViewItem;
		opencascade::handle<IGESData_ViewKindEntity> ViewItem(const Standard_Integer Index);

};


%make_alias(IGESDraw_ViewsVisibleWithAttr)

%extend IGESDraw_ViewsVisibleWithAttr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class IGESDraw_HArray1OfConnectPoint : public IGESDraw_Array1OfConnectPoint, public Standard_Transient {
  public:
    IGESDraw_HArray1OfConnectPoint(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESDraw_HArray1OfConnectPoint(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESDraw_Array1OfConnectPoint::value_type& theValue);
    IGESDraw_HArray1OfConnectPoint(const IGESDraw_Array1OfConnectPoint& theOther);
    const IGESDraw_Array1OfConnectPoint& Array1();
    IGESDraw_Array1OfConnectPoint& ChangeArray1();
};
%make_alias(IGESDraw_HArray1OfConnectPoint)


class IGESDraw_HArray1OfViewKindEntity : public IGESDraw_Array1OfViewKindEntity, public Standard_Transient {
  public:
    IGESDraw_HArray1OfViewKindEntity(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESDraw_HArray1OfViewKindEntity(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESDraw_Array1OfViewKindEntity::value_type& theValue);
    IGESDraw_HArray1OfViewKindEntity(const IGESDraw_Array1OfViewKindEntity& theOther);
    const IGESDraw_Array1OfViewKindEntity& Array1();
    IGESDraw_Array1OfViewKindEntity& ChangeArray1();
};
%make_alias(IGESDraw_HArray1OfViewKindEntity)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
