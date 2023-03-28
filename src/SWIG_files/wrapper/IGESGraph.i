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
%define IGESGRAPHDOCSTRING
"IGESGraph module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_igesgraph.html"
%enddef
%module (package="OCC.Core", docstring=IGESGRAPHDOCSTRING) IGESGraph


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
#include<IGESGraph_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IGESData_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Interface_module.hxx>
#include<IGESBasic_module.hxx>
#include<gp_module.hxx>
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
%import TCollection.i
%import TColStd.i
%import Interface.i
%import IGESBasic.i
%import gp.i

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
%wrap_handle(IGESGraph_Color)
%wrap_handle(IGESGraph_DefinitionLevel)
%wrap_handle(IGESGraph_DrawingSize)
%wrap_handle(IGESGraph_DrawingUnits)
%wrap_handle(IGESGraph_GeneralModule)
%wrap_handle(IGESGraph_HighLight)
%wrap_handle(IGESGraph_IntercharacterSpacing)
%wrap_handle(IGESGraph_LineFontDefPattern)
%wrap_handle(IGESGraph_LineFontDefTemplate)
%wrap_handle(IGESGraph_LineFontPredefined)
%wrap_handle(IGESGraph_NominalSize)
%wrap_handle(IGESGraph_Pick)
%wrap_handle(IGESGraph_Protocol)
%wrap_handle(IGESGraph_ReadWriteModule)
%wrap_handle(IGESGraph_SpecificModule)
%wrap_handle(IGESGraph_TextDisplayTemplate)
%wrap_handle(IGESGraph_TextFontDef)
%wrap_handle(IGESGraph_UniformRectGrid)
%wrap_handle(IGESGraph_HArray1OfColor)
%wrap_handle(IGESGraph_HArray1OfTextDisplayTemplate)
%wrap_handle(IGESGraph_HArray1OfTextFontDef)
/* end handles declaration */

/* templates */
%template(IGESGraph_Array1OfColor) NCollection_Array1<opencascade::handle<IGESGraph_Color>>;

%extend NCollection_Array1<opencascade::handle<IGESGraph_Color>> {
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
%template(IGESGraph_Array1OfTextDisplayTemplate) NCollection_Array1<opencascade::handle<IGESGraph_TextDisplayTemplate>>;

%extend NCollection_Array1<opencascade::handle<IGESGraph_TextDisplayTemplate>> {
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
%template(IGESGraph_Array1OfTextFontDef) NCollection_Array1<opencascade::handle<IGESGraph_TextFontDef>>;

%extend NCollection_Array1<opencascade::handle<IGESGraph_TextFontDef>> {
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
typedef NCollection_Array1 <opencascade::handle <IGESGraph_Color>> IGESGraph_Array1OfColor;
typedef NCollection_Array1 <opencascade::handle <IGESGraph_TextDisplayTemplate>> IGESGraph_Array1OfTextDisplayTemplate;
typedef NCollection_Array1 <opencascade::handle <IGESGraph_TextFontDef>> IGESGraph_Array1OfTextFontDef;
/* end typedefs declaration */

/******************
* class IGESGraph *
******************/
%rename(igesgraph) IGESGraph;
class IGESGraph {
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
		/**** md5 signature: ca0dd417564666e4c495aa344f527d21 ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol for this package.

Returns
-------
opencascade::handle<IGESGraph_Protocol>
") Protocol;
		static opencascade::handle<IGESGraph_Protocol> Protocol();

};


%extend IGESGraph {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IGESGraph_Color *
************************/
class IGESGraph_Color : public IGESData_ColorEntity {
	public:
		/****************** IGESGraph_Color ******************/
		/**** md5 signature: 75c904772c04d569d0cd2dbda00cdf04 ****/
		%feature("compactdefaultargs") IGESGraph_Color;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_Color;
		 IGESGraph_Color();

		/****************** CMYIntensity ******************/
		/**** md5 signature: ae0592ea93ece40e589c6181eb4252f7 ****/
		%feature("compactdefaultargs") CMYIntensity;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Cyan: float
Magenta: float
Yellow: float
") CMYIntensity;
		void CMYIntensity(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ColorName ******************/
		/**** md5 signature: 3c72c360b4da899dbb5b0cbd6f31fa3c ****/
		%feature("compactdefaultargs") ColorName;
		%feature("autodoc", "If hascolorname() is true returns the verbal description of the color.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ColorName;
		opencascade::handle<TCollection_HAsciiString> ColorName();

		/****************** HLSPercentage ******************/
		/**** md5 signature: 1a795ae4244ee8855723a0faadf19ac3 ****/
		%feature("compactdefaultargs") HLSPercentage;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Hue: float
Lightness: float
Saturation: float
") HLSPercentage;
		void HLSPercentage(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** HasColorName ******************/
		/**** md5 signature: 19aed754b725b557286aa9558d267054 ****/
		%feature("compactdefaultargs") HasColorName;
		%feature("autodoc", "Returns true if optional character string is assigned, false otherwise.

Returns
-------
bool
") HasColorName;
		Standard_Boolean HasColorName();

		/****************** Init ******************/
		/**** md5 signature: 0b5505336074ee242b50ca4592d7484b ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class color - red : red color intensity (range 0.0 to 100.0) - green : green color intensity (range 0.0 to 100.0) - blue : blue color intensity (range 0.0 to 100.0) - acolorname : name of the color (optional).

Parameters
----------
red: float
green: float
blue: float
aColorName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Real red, const Standard_Real green, const Standard_Real blue, const opencascade::handle<TCollection_HAsciiString> & aColorName);

		/****************** RGBIntensity ******************/
		/**** md5 signature: 88878c5ffd20c8598fc14743d38e1154 ****/
		%feature("compactdefaultargs") RGBIntensity;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Red: float
Green: float
Blue: float
") RGBIntensity;
		void RGBIntensity(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

};


%make_alias(IGESGraph_Color)

%extend IGESGraph_Color {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESGraph_DefinitionLevel *
**********************************/
class IGESGraph_DefinitionLevel : public IGESData_LevelListEntity {
	public:
		/****************** IGESGraph_DefinitionLevel ******************/
		/**** md5 signature: 20577bd3111678f9889517988f28f099 ****/
		%feature("compactdefaultargs") IGESGraph_DefinitionLevel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_DefinitionLevel;
		 IGESGraph_DefinitionLevel();

		/****************** Init ******************/
		/**** md5 signature: 3e65054de793396c92b087b9a67d7971 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class definitionlevel - alllevelnumbers : values of level numbers.

Parameters
----------
allLevelNumbers: TColStd_HArray1OfInteger

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TColStd_HArray1OfInteger> & allLevelNumbers);

		/****************** LevelNumber ******************/
		/**** md5 signature: 67d1a29921fac7ac442fac0ea0ca8ca8 ****/
		%feature("compactdefaultargs") LevelNumber;
		%feature("autodoc", "Returns the level number of <self> indicated by <levelindex> raises an exception if levelindex is <= 0 or levelindex > nbpropertyvalues.

Parameters
----------
LevelIndex: int

Returns
-------
int
") LevelNumber;
		Standard_Integer LevelNumber(const Standard_Integer LevelIndex);

		/****************** NbLevelNumbers ******************/
		/**** md5 signature: f411badc574ed4c0c9208208839e7367 ****/
		%feature("compactdefaultargs") NbLevelNumbers;
		%feature("autodoc", "Must return the count of levels (== nbpropertyvalues).

Returns
-------
int
") NbLevelNumbers;
		Standard_Integer NbLevelNumbers();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values in <self>.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

};


%make_alias(IGESGraph_DefinitionLevel)

%extend IGESGraph_DefinitionLevel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESGraph_DrawingSize *
******************************/
class IGESGraph_DrawingSize : public IGESData_IGESEntity {
	public:
		/****************** IGESGraph_DrawingSize ******************/
		/**** md5 signature: c17e6a4b097bbc9396a2dced3139ebbb ****/
		%feature("compactdefaultargs") IGESGraph_DrawingSize;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_DrawingSize;
		 IGESGraph_DrawingSize();

		/****************** Init ******************/
		/**** md5 signature: 19fd8fd9c09633b6720e6f682585e1b1 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class drawingsize - nbprops : number of property values (np = 2) - axsize : extent of drawing along positive xd axis - aysize : extent of drawing along positive yd axis.

Parameters
----------
nbProps: int
aXSize: float
aYSize: float

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbProps, const Standard_Real aXSize, const Standard_Real aYSize);

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values in <self> (np = 2).

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** XSize ******************/
		/**** md5 signature: 565df346441f9a17ad96bc376854396d ****/
		%feature("compactdefaultargs") XSize;
		%feature("autodoc", "Returns the extent of drawing along positive xd axis.

Returns
-------
float
") XSize;
		Standard_Real XSize();

		/****************** YSize ******************/
		/**** md5 signature: f0db0df76de8e283e5c51d255df288ff ****/
		%feature("compactdefaultargs") YSize;
		%feature("autodoc", "Returns the extent of drawing along positive yd axis.

Returns
-------
float
") YSize;
		Standard_Real YSize();

};


%make_alias(IGESGraph_DrawingSize)

%extend IGESGraph_DrawingSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESGraph_DrawingUnits *
*******************************/
class IGESGraph_DrawingUnits : public IGESData_IGESEntity {
	public:
		/****************** IGESGraph_DrawingUnits ******************/
		/**** md5 signature: 9630554112005c137dfa77f0b7e5bd35 ****/
		%feature("compactdefaultargs") IGESGraph_DrawingUnits;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_DrawingUnits;
		 IGESGraph_DrawingUnits();

		/****************** Flag ******************/
		/**** md5 signature: a1e7ee9e0f6e3b4294449387a5faac0a ****/
		%feature("compactdefaultargs") Flag;
		%feature("autodoc", "Returns the drawing space units of <self>.

Returns
-------
int
") Flag;
		Standard_Integer Flag();

		/****************** Init ******************/
		/**** md5 signature: 29fddf51ab37034d850c095d0d63b4f9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class drawingunits - nbprops : number of property values (np = 2) - aflag : drawingunits flag - aunit : drawingunits name.

Parameters
----------
nbProps: int
aFlag: int
aUnit: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbProps, const Standard_Integer aFlag, const opencascade::handle<TCollection_HAsciiString> & aUnit);

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values in <self>.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** Unit ******************/
		/**** md5 signature: 2d8645f5317853f478c34377ea952c98 ****/
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "Returns the name of the drawing space units of <self>.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Unit;
		opencascade::handle<TCollection_HAsciiString> Unit();

		/****************** UnitValue ******************/
		/**** md5 signature: 44bdd78781973523a9e69dd88c24c355 ****/
		%feature("compactdefaultargs") UnitValue;
		%feature("autodoc", "Computes the value of the unit, in meters, according flag (same values as for globalsection from igesdata).

Returns
-------
float
") UnitValue;
		Standard_Real UnitValue();

};


%make_alias(IGESGraph_DrawingUnits)

%extend IGESGraph_DrawingUnits {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESGraph_GeneralModule *
********************************/
class IGESGraph_GeneralModule : public IGESData_GeneralModule {
	public:
		/****************** IGESGraph_GeneralModule ******************/
		/**** md5 signature: 8574c5d900f79f42bd37ac0d7a142945 ****/
		%feature("compactdefaultargs") IGESGraph_GeneralModule;
		%feature("autodoc", "Creates a generalmodule from igesgraph and puts it into generallib.

Returns
-------
None
") IGESGraph_GeneralModule;
		 IGESGraph_GeneralModule();

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


%make_alias(IGESGraph_GeneralModule)

%extend IGESGraph_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESGraph_HighLight *
****************************/
class IGESGraph_HighLight : public IGESData_IGESEntity {
	public:
		/****************** IGESGraph_HighLight ******************/
		/**** md5 signature: cb3a666d7cce3bf787219338127faaa7 ****/
		%feature("compactdefaultargs") IGESGraph_HighLight;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_HighLight;
		 IGESGraph_HighLight();

		/****************** HighLightStatus ******************/
		/**** md5 signature: 74bc251bea34253951c573ae9d419a54 ****/
		%feature("compactdefaultargs") HighLightStatus;
		%feature("autodoc", "Returns 0 if <self> is not highlighted(default), 1 if <self> is highlighted.

Returns
-------
int
") HighLightStatus;
		Standard_Integer HighLightStatus();

		/****************** Init ******************/
		/**** md5 signature: 5bf25605f1b4905ac89530c8c6974f3a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class highlight - nbprops : number of property values (np = 1) - ahighlightstatus : highlight flag.

Parameters
----------
nbProps: int
aHighLightStatus: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbProps, const Standard_Integer aHighLightStatus);

		/****************** IsHighLighted ******************/
		/**** md5 signature: ddada3b4943ea7a0bd13e4fbc099ba22 ****/
		%feature("compactdefaultargs") IsHighLighted;
		%feature("autodoc", "Returns true if entity is highlighted.

Returns
-------
bool
") IsHighLighted;
		Standard_Boolean IsHighLighted();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values in <self>.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

};


%make_alias(IGESGraph_HighLight)

%extend IGESGraph_HighLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESGraph_IntercharacterSpacing *
****************************************/
class IGESGraph_IntercharacterSpacing : public IGESData_IGESEntity {
	public:
		/****************** IGESGraph_IntercharacterSpacing ******************/
		/**** md5 signature: a070b6e69dd44cfe9efa7525041ee152 ****/
		%feature("compactdefaultargs") IGESGraph_IntercharacterSpacing;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_IntercharacterSpacing;
		 IGESGraph_IntercharacterSpacing();

		/****************** ISpace ******************/
		/**** md5 signature: 578283e20f2345ab4b8296022edf07ab ****/
		%feature("compactdefaultargs") ISpace;
		%feature("autodoc", "Returns the intercharacter space of <self> in percentage of the text height (range = 0..100).

Returns
-------
float
") ISpace;
		Standard_Real ISpace();

		/****************** Init ******************/
		/**** md5 signature: d96dcf1ba7f9233adf85d5f171708c6f ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class intercharacterspacing - nbprops : number of property values (np = 1) - anispace : intercharacter spacing percentage.

Parameters
----------
nbProps: int
anISpace: float

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbProps, const Standard_Real anISpace);

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values in <self>.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

};


%make_alias(IGESGraph_IntercharacterSpacing)

%extend IGESGraph_IntercharacterSpacing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESGraph_LineFontDefPattern *
*************************************/
class IGESGraph_LineFontDefPattern : public IGESData_LineFontEntity {
	public:
		/****************** IGESGraph_LineFontDefPattern ******************/
		/**** md5 signature: b658961fb9649956cc1f1c8f8aceb739 ****/
		%feature("compactdefaultargs") IGESGraph_LineFontDefPattern;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_LineFontDefPattern;
		 IGESGraph_LineFontDefPattern();

		/****************** DisplayPattern ******************/
		/**** md5 signature: c531ade44976c53e4b6482a446185574 ****/
		%feature("compactdefaultargs") DisplayPattern;
		%feature("autodoc", "Returns the string indicating which segments of the basic pattern are visible and which are blanked. e.g: thenbsegments = 5 and if bit pattern = 10110, which means that segments 2, 3 and 5 are visible, whereas segments 1 and 4 are blank. the method returns '2h16' as the hasciistring. note: the bits are right justified. (16h = 10110).

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DisplayPattern;
		opencascade::handle<TCollection_HAsciiString> DisplayPattern();

		/****************** Init ******************/
		/**** md5 signature: 7508d024b51529a3c6bd5c0768b563a7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class linefontdefpattern - allseglength : containing lengths of respective segments - apattern : hasciistring indicating visible-blank segments.

Parameters
----------
allSegLength: TColStd_HArray1OfReal
aPattern: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TColStd_HArray1OfReal> & allSegLength, const opencascade::handle<TCollection_HAsciiString> & aPattern);

		/****************** IsVisible ******************/
		/**** md5 signature: 547b909f2ab2e99f8a79beb63153b145 ****/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "The display pattern is decrypted to return true if the index'th basic pattern is visible, false otherwise. if index > nbsegments or index <= 0 then return value is false.

Parameters
----------
Index: int

Returns
-------
bool
") IsVisible;
		Standard_Boolean IsVisible(const Standard_Integer Index);

		/****************** Length ******************/
		/**** md5 signature: b943ab690e0cbf90d1756e598fac6c38 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of index'th segment of the basic pattern raises exception if index <= 0 or index > nbsegments.

Parameters
----------
Index: int

Returns
-------
float
") Length;
		Standard_Real Length(const Standard_Integer Index);

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of segments in the visible-blank pattern.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

};


%make_alias(IGESGraph_LineFontDefPattern)

%extend IGESGraph_LineFontDefPattern {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESGraph_LineFontDefTemplate *
**************************************/
class IGESGraph_LineFontDefTemplate : public IGESData_LineFontEntity {
	public:
		/****************** IGESGraph_LineFontDefTemplate ******************/
		/**** md5 signature: 974172ccbe5b2c49f3be21fd5ec2a492 ****/
		%feature("compactdefaultargs") IGESGraph_LineFontDefTemplate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_LineFontDefTemplate;
		 IGESGraph_LineFontDefTemplate();

		/****************** Distance ******************/
		/**** md5 signature: c054352e1b604c83d759bc4ccf6c526d ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distance between any two template figures on the anchoring curve.

Returns
-------
float
") Distance;
		Standard_Real Distance();

		/****************** Init ******************/
		/**** md5 signature: 3192c26bf6b9a268716905f8f260966e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class linefontdeftemplate - anorientation : orientation of template figure on anchoring curve - atemplate : subfiguredef entity used as template figure - adistance : distance between the neighbouring template figures - ascale : scale factor applied to the template figure.

Parameters
----------
anOrientation: int
aTemplate: IGESBasic_SubfigureDef
aDistance: float
aScale: float

Returns
-------
None
") Init;
		void Init(const Standard_Integer anOrientation, const opencascade::handle<IGESBasic_SubfigureDef> & aTemplate, const Standard_Real aDistance, const Standard_Real aScale);

		/****************** Orientation ******************/
		/**** md5 signature: eeb93ab7fde9b4766d57910887882e1e ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "If return value = 0, each template display is oriented by aligning the axis of the subfiguredef with the axis of the definition space of the anchoring curve. = 1, each template display is oriented by aligning x-axis of the subfiguredef with the tangent vector of the anchoring curve at the point of incidence of the curve and the origin of subfigure. similarly z-axis is aligned.

Returns
-------
int
") Orientation;
		Standard_Integer Orientation();

		/****************** Scale ******************/
		/**** md5 signature: 4c0fd48707c01e5a42b2a639ca08da30 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Returns the scaling factor applied to subfiguredef to form template figure.

Returns
-------
float
") Scale;
		Standard_Real Scale();

		/****************** TemplateEntity ******************/
		/**** md5 signature: 8f15cb2615dfc97f4815fdd316c9f603 ****/
		%feature("compactdefaultargs") TemplateEntity;
		%feature("autodoc", "Returns subfiguredef as the entity used as template figure.

Returns
-------
opencascade::handle<IGESBasic_SubfigureDef>
") TemplateEntity;
		opencascade::handle<IGESBasic_SubfigureDef> TemplateEntity();

};


%make_alias(IGESGraph_LineFontDefTemplate)

%extend IGESGraph_LineFontDefTemplate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESGraph_LineFontPredefined *
*************************************/
class IGESGraph_LineFontPredefined : public IGESData_IGESEntity {
	public:
		/****************** IGESGraph_LineFontPredefined ******************/
		/**** md5 signature: e066b4268231a85ae659d9bed41da027 ****/
		%feature("compactdefaultargs") IGESGraph_LineFontPredefined;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_LineFontPredefined;
		 IGESGraph_LineFontPredefined();

		/****************** Init ******************/
		/**** md5 signature: 13c2a9cb1fc4568054b6bd00fc4c06b5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class linefontpredefined - nbprops  : number of property values (np = 1) - alinefontpatterncode : line font pattern code.

Parameters
----------
nbProps: int
aLineFontPatternCode: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbProps, const Standard_Integer aLineFontPatternCode);

		/****************** LineFontPatternCode ******************/
		/**** md5 signature: aa7b870dfa30b2a7519a39e47cb207c7 ****/
		%feature("compactdefaultargs") LineFontPatternCode;
		%feature("autodoc", "Returns the line font pattern code of <self>.

Returns
-------
int
") LineFontPatternCode;
		Standard_Integer LineFontPatternCode();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values in <self>.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

};


%make_alias(IGESGraph_LineFontPredefined)

%extend IGESGraph_LineFontPredefined {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESGraph_NominalSize *
******************************/
class IGESGraph_NominalSize : public IGESData_IGESEntity {
	public:
		/****************** IGESGraph_NominalSize ******************/
		/**** md5 signature: 2992d3f0e83350ffbc79ff1c91968e07 ****/
		%feature("compactdefaultargs") IGESGraph_NominalSize;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_NominalSize;
		 IGESGraph_NominalSize();

		/****************** HasStandardName ******************/
		/**** md5 signature: fd1da918d941903c6c6d87b1e1c46615 ****/
		%feature("compactdefaultargs") HasStandardName;
		%feature("autodoc", "Returns true if an engineering standard is defined for <self> else, returns false.

Returns
-------
bool
") HasStandardName;
		Standard_Boolean HasStandardName();

		/****************** Init ******************/
		/**** md5 signature: a511eb2503a2a076527af5b53bd36b87 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class nominalsize - nbprops  : number of property values (2 or 3) - anominalsizevalue : nominalsize value - anominalsizename : nominalsize name - astandardname : name of relevant engineering standard.

Parameters
----------
nbProps: int
aNominalSizeValue: float
aNominalSizeName: TCollection_HAsciiString
aStandardName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbProps, const Standard_Real aNominalSizeValue, const opencascade::handle<TCollection_HAsciiString> & aNominalSizeName, const opencascade::handle<TCollection_HAsciiString> & aStandardName);

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values in <self>.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** NominalSizeName ******************/
		/**** md5 signature: 7c56a62d351edc38d8671a876ceedc14 ****/
		%feature("compactdefaultargs") NominalSizeName;
		%feature("autodoc", "Returns the name of <self>.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") NominalSizeName;
		opencascade::handle<TCollection_HAsciiString> NominalSizeName();

		/****************** NominalSizeValue ******************/
		/**** md5 signature: ce19c623a3c1f76cace88e14ff6772ea ****/
		%feature("compactdefaultargs") NominalSizeValue;
		%feature("autodoc", "Returns the value of <self>.

Returns
-------
float
") NominalSizeValue;
		Standard_Real NominalSizeValue();

		/****************** StandardName ******************/
		/**** md5 signature: 0e1bfd5d3f81e6736b8dc24af115f2c3 ****/
		%feature("compactdefaultargs") StandardName;
		%feature("autodoc", "Returns the name of the relevant engineering standard of <self>.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") StandardName;
		opencascade::handle<TCollection_HAsciiString> StandardName();

};


%make_alias(IGESGraph_NominalSize)

%extend IGESGraph_NominalSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IGESGraph_Pick *
***********************/
class IGESGraph_Pick : public IGESData_IGESEntity {
	public:
		/****************** IGESGraph_Pick ******************/
		/**** md5 signature: ec8d0e228f281c3dfc9967308767a19d ****/
		%feature("compactdefaultargs") IGESGraph_Pick;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_Pick;
		 IGESGraph_Pick();

		/****************** Init ******************/
		/**** md5 signature: 954cbf317a5da778181d3c8fe33493f6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class pick - nbprops : number of property values (np = 1) - apickstatus : pick flag.

Parameters
----------
nbProps: int
aPickStatus: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbProps, const Standard_Integer aPickStatus);

		/****************** IsPickable ******************/
		/**** md5 signature: a2e834706d754ed3936b78ccfefa9fac ****/
		%feature("compactdefaultargs") IsPickable;
		%feature("autodoc", "Returns true if thepick is 0.

Returns
-------
bool
") IsPickable;
		Standard_Boolean IsPickable();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values in <self>.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** PickFlag ******************/
		/**** md5 signature: 50f28a0613e98301d6eb9a3300c831b2 ****/
		%feature("compactdefaultargs") PickFlag;
		%feature("autodoc", "Returns 0 if <self> is pickable(default), 1 if <self> is not pickable.

Returns
-------
int
") PickFlag;
		Standard_Integer PickFlag();

};


%make_alias(IGESGraph_Pick)

%extend IGESGraph_Pick {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESGraph_Protocol *
***************************/
class IGESGraph_Protocol : public IGESData_Protocol {
	public:
		/****************** IGESGraph_Protocol ******************/
		/**** md5 signature: f7f4abe69db1b6d9d752fe046e66ac71 ****/
		%feature("compactdefaultargs") IGESGraph_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_Protocol;
		 IGESGraph_Protocol();

		/****************** NbResources ******************/
		/**** md5 signature: cd524335b33aeb6eb83cc80f6b7e5681 ****/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of resource protocol. here, one (protocol from igesbasic).

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


%make_alias(IGESGraph_Protocol)

%extend IGESGraph_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESGraph_ReadWriteModule *
**********************************/
class IGESGraph_ReadWriteModule : public IGESData_ReadWriteModule {
	public:
		/****************** IGESGraph_ReadWriteModule ******************/
		/**** md5 signature: 6e5ce2d59e48abeb923720d05b4988cb ****/
		%feature("compactdefaultargs") IGESGraph_ReadWriteModule;
		%feature("autodoc", "Creates a readwritemodule & puts it into readerlib & writerlib.

Returns
-------
None
") IGESGraph_ReadWriteModule;
		 IGESGraph_ReadWriteModule();

		/****************** CaseIGES ******************/
		/**** md5 signature: de66f0948cefad4e0218511df612ee48 ****/
		%feature("compactdefaultargs") CaseIGES;
		%feature("autodoc", "Defines case numbers for entities of igesgraph.

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
		%feature("autodoc", "Reads own parameters from file for an entity of igesgraph.

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


%make_alias(IGESGraph_ReadWriteModule)

%extend IGESGraph_ReadWriteModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESGraph_SpecificModule *
*********************************/
class IGESGraph_SpecificModule : public IGESData_SpecificModule {
	public:
		/****************** IGESGraph_SpecificModule ******************/
		/**** md5 signature: cde1568ce12a7f4e01d8d40989f521ec ****/
		%feature("compactdefaultargs") IGESGraph_SpecificModule;
		%feature("autodoc", "Creates a specificmodule from igesgraph & puts it into specificlib.

Returns
-------
None
") IGESGraph_SpecificModule;
		 IGESGraph_SpecificModule();

		/****************** OwnCorrect ******************/
		/**** md5 signature: bbaa7e58769f5cc28e757e0612cf4245 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Performs non-ambiguous corrections on entities which support them (drawingsize,drawingunits,highlight,intercharacterspacing, linefontpredefined,nominalsize,pick,uniformrectgrid).

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


%make_alias(IGESGraph_SpecificModule)

%extend IGESGraph_SpecificModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESGraph_TextDisplayTemplate *
**************************************/
class IGESGraph_TextDisplayTemplate : public IGESData_IGESEntity {
	public:
		/****************** IGESGraph_TextDisplayTemplate ******************/
		/**** md5 signature: f8132bda887a4e146c55252fd8a68c11 ****/
		%feature("compactdefaultargs") IGESGraph_TextDisplayTemplate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_TextDisplayTemplate;
		 IGESGraph_TextDisplayTemplate();

		/****************** BoxHeight ******************/
		/**** md5 signature: edc3b7ab6bb32522b4dd4c99c516087e ****/
		%feature("compactdefaultargs") BoxHeight;
		%feature("autodoc", "Returns character box height.

Returns
-------
float
") BoxHeight;
		Standard_Real BoxHeight();

		/****************** BoxWidth ******************/
		/**** md5 signature: a634a589409a9b722777274bc8cedc73 ****/
		%feature("compactdefaultargs") BoxWidth;
		%feature("autodoc", "Returns character box width.

Returns
-------
float
") BoxWidth;
		Standard_Real BoxWidth();

		/****************** FontCode ******************/
		/**** md5 signature: 70f2ff421b49f5e3e55ff190ce598e26 ****/
		%feature("compactdefaultargs") FontCode;
		%feature("autodoc", "Returns the font code.

Returns
-------
int
") FontCode;
		Standard_Integer FontCode();

		/****************** FontEntity ******************/
		/**** md5 signature: c92a852a26950d82eae5ef895e176816 ****/
		%feature("compactdefaultargs") FontEntity;
		%feature("autodoc", "Returns text font definition entity used to define the font.

Returns
-------
opencascade::handle<IGESGraph_TextFontDef>
") FontEntity;
		opencascade::handle<IGESGraph_TextFontDef> FontEntity();

		/****************** Init ******************/
		/**** md5 signature: 748c37e50f077558bf2e1f8fa86302ff ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class textdisplaytemplate - awidth : character box width - aheight : character box height - afontcode : font code - afontentity : text font definition entity - aslantangle : slant angle - arotationangle : rotation angle - amirrorflag : mirror flag - arotationflag : rotate internal text flag - acorner : lower left corner coordinates(form no. 0), increments from coordinates (form no. 1).

Parameters
----------
aWidth: float
aHeight: float
aFontCode: int
aFontEntity: IGESGraph_TextFontDef
aSlantAngle: float
aRotationAngle: float
aMirrorFlag: int
aRotationFlag: int
aCorner: gp_XYZ

Returns
-------
None
") Init;
		void Init(const Standard_Real aWidth, const Standard_Real aHeight, const Standard_Integer aFontCode, const opencascade::handle<IGESGraph_TextFontDef> & aFontEntity, const Standard_Real aSlantAngle, const Standard_Real aRotationAngle, const Standard_Integer aMirrorFlag, const Standard_Integer aRotationFlag, const gp_XYZ & aCorner);

		/****************** IsFontEntity ******************/
		/**** md5 signature: a6a0fa711431a1573d9b273ae2ae11d9 ****/
		%feature("compactdefaultargs") IsFontEntity;
		%feature("autodoc", "Returns false if thefontentity is null, true otherwise.

Returns
-------
bool
") IsFontEntity;
		Standard_Boolean IsFontEntity();

		/****************** IsIncremental ******************/
		/**** md5 signature: 932a7ceba3378c9462bca5aea3b3fb06 ****/
		%feature("compactdefaultargs") IsIncremental;
		%feature("autodoc", "Returns true if entity is incremental (form 1). false if entity is absolute (form 0).

Returns
-------
bool
") IsIncremental;
		Standard_Boolean IsIncremental();

		/****************** MirrorFlag ******************/
		/**** md5 signature: 304d0080f83c12f831745c46532a5362 ****/
		%feature("compactdefaultargs") MirrorFlag;
		%feature("autodoc", "Returns mirror flag mirror flag : 0 = no mirroring. 1 = mirror axis perpendicular to text base line. 2 = mirror axis is text base line.

Returns
-------
int
") MirrorFlag;
		Standard_Integer MirrorFlag();

		/****************** RotateFlag ******************/
		/**** md5 signature: 1175c9247978ba3b425097075bba27b7 ****/
		%feature("compactdefaultargs") RotateFlag;
		%feature("autodoc", "Returns rotate internal text flag. rotate internal text flag : 0 = text horizontal. 1 = text vertical.

Returns
-------
int
") RotateFlag;
		Standard_Integer RotateFlag();

		/****************** RotationAngle ******************/
		/**** md5 signature: a0e05e147c18550a43c1eaae52b815fd ****/
		%feature("compactdefaultargs") RotationAngle;
		%feature("autodoc", "Returns rotation angle of text block in radians.

Returns
-------
float
") RotationAngle;
		Standard_Real RotationAngle();

		/****************** SetIncremental ******************/
		/**** md5 signature: eed10f2926e1b10bacda6e7850b8d54f ****/
		%feature("compactdefaultargs") SetIncremental;
		%feature("autodoc", "Sets <self> to be incremental (form 1) if <mode> is true, or basolute (form 0) else.

Parameters
----------
mode: bool

Returns
-------
None
") SetIncremental;
		void SetIncremental(const Standard_Boolean mode);

		/****************** SlantAngle ******************/
		/**** md5 signature: d62f2aed61706d7b18f206b484abef49 ****/
		%feature("compactdefaultargs") SlantAngle;
		%feature("autodoc", "Returns slant angle of character in radians.

Returns
-------
float
") SlantAngle;
		Standard_Real SlantAngle();

		/****************** StartingCorner ******************/
		/**** md5 signature: 20295c7916b7d2db79660044f77f6457 ****/
		%feature("compactdefaultargs") StartingCorner;
		%feature("autodoc", "If isincremental() returns false, gets coordinates of lower left corner of first character box. if isincremental() returns true, gets increments from x, y, z coordinates found in parent entity.

Returns
-------
gp_Pnt
") StartingCorner;
		gp_Pnt StartingCorner();

		/****************** TransformedStartingCorner ******************/
		/**** md5 signature: 3d2c51f509c9250a9946f6c06d1a3c1c ****/
		%feature("compactdefaultargs") TransformedStartingCorner;
		%feature("autodoc", "If isincremental() returns false, gets coordinates of lower left corner of first character box. if isincremental() returns true, gets increments from x, y, z coordinates found in parent entity.

Returns
-------
gp_Pnt
") TransformedStartingCorner;
		gp_Pnt TransformedStartingCorner();

};


%make_alias(IGESGraph_TextDisplayTemplate)

%extend IGESGraph_TextDisplayTemplate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESGraph_TextFontDef *
******************************/
class IGESGraph_TextFontDef : public IGESData_IGESEntity {
	public:
		/****************** IGESGraph_TextFontDef ******************/
		/**** md5 signature: 7c52a346a20a6d7d75a3f318bb7baa12 ****/
		%feature("compactdefaultargs") IGESGraph_TextFontDef;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_TextFontDef;
		 IGESGraph_TextFontDef();

		/****************** ASCIICode ******************/
		/**** md5 signature: 95d9b299556f868f52542ec067c28109 ****/
		%feature("compactdefaultargs") ASCIICode;
		%feature("autodoc", "Returns the ascii code of chnum'th character. exception outofrange is raised if chnum <= 0 or chnum > nbcharacters.

Parameters
----------
Chnum: int

Returns
-------
int
") ASCIICode;
		Standard_Integer ASCIICode(const Standard_Integer Chnum);

		/****************** FontCode ******************/
		/**** md5 signature: 70f2ff421b49f5e3e55ff190ce598e26 ****/
		%feature("compactdefaultargs") FontCode;
		%feature("autodoc", "Returns the font code.

Returns
-------
int
") FontCode;
		Standard_Integer FontCode();

		/****************** FontName ******************/
		/**** md5 signature: 6e6320c42a040a1535e47785855f5435 ****/
		%feature("compactdefaultargs") FontName;
		%feature("autodoc", "Returns the font name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FontName;
		opencascade::handle<TCollection_HAsciiString> FontName();

		/****************** Init ******************/
		/**** md5 signature: 0460f61a5b9d2418f850ebfa3f9c2781 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class textfontdef - afontcode : font code - afontname : font name - asupersededfont : number of superseded font - asupersededentity : text definition entity - ascale : no. of grid units = 1 text height unit - allasciicodes : ascii codes for characters - allnextcharx & y : grid locations of the next character's origin (integer vals) - allpenmotions : no. of pen motions for the characters - allpenflags : pen up/down flags, 0 = down (default), 1 = up - allmovepentox & y : grid locations the pen will move to this method initializes the fields of the class textfontdef. an exception is raised if the lengths of allasciicodes, allnextchars, allpenmotions, allpenflags and allmovepento are not same.

Parameters
----------
aFontCode: int
aFontName: TCollection_HAsciiString
aSupersededFont: int
aSupersededEntity: IGESGraph_TextFontDef
aScale: int
allASCIICodes: TColStd_HArray1OfInteger
allNextCharX: TColStd_HArray1OfInteger
allNextCharY: TColStd_HArray1OfInteger
allPenMotions: TColStd_HArray1OfInteger
allPenFlags: IGESBasic_HArray1OfHArray1OfInteger
allMovePenToX: IGESBasic_HArray1OfHArray1OfInteger
allMovePenToY: IGESBasic_HArray1OfHArray1OfInteger

Returns
-------
None
") Init;
		void Init(const Standard_Integer aFontCode, const opencascade::handle<TCollection_HAsciiString> & aFontName, const Standard_Integer aSupersededFont, const opencascade::handle<IGESGraph_TextFontDef> & aSupersededEntity, const Standard_Integer aScale, const opencascade::handle<TColStd_HArray1OfInteger> & allASCIICodes, const opencascade::handle<TColStd_HArray1OfInteger> & allNextCharX, const opencascade::handle<TColStd_HArray1OfInteger> & allNextCharY, const opencascade::handle<TColStd_HArray1OfInteger> & allPenMotions, const opencascade::handle<IGESBasic_HArray1OfHArray1OfInteger> & allPenFlags, const opencascade::handle<IGESBasic_HArray1OfHArray1OfInteger> & allMovePenToX, const opencascade::handle<IGESBasic_HArray1OfHArray1OfInteger> & allMovePenToY);

		/****************** IsPenUp ******************/
		/**** md5 signature: c226c1815ff3de92145677fe0adb7a3d ****/
		%feature("compactdefaultargs") IsPenUp;
		%feature("autodoc", "Returns pen status(true if 1, false if 0) of motionnum'th motion of chnum'th character. exception raised if chnum <= 0 or chnum > nbcharacters or motionnum <= 0 or motionnum > nbpenmotions.

Parameters
----------
Chnum: int
Motionnum: int

Returns
-------
bool
") IsPenUp;
		Standard_Boolean IsPenUp(const Standard_Integer Chnum, const Standard_Integer Motionnum);

		/****************** IsSupersededFontEntity ******************/
		/**** md5 signature: 8e5122670b0f9ba8bd8c7a13ff226bb8 ****/
		%feature("compactdefaultargs") IsSupersededFontEntity;
		%feature("autodoc", "True if this definition supersedes another textfontdefinition entity, false if it supersedes value.

Returns
-------
bool
") IsSupersededFontEntity;
		Standard_Boolean IsSupersededFontEntity();

		/****************** NbCharacters ******************/
		/**** md5 signature: d6661e1240d79e2a93ace4bc30f18abd ****/
		%feature("compactdefaultargs") NbCharacters;
		%feature("autodoc", "Returns the number of characters in this definition.

Returns
-------
int
") NbCharacters;
		Standard_Integer NbCharacters();

		/****************** NbPenMotions ******************/
		/**** md5 signature: cfa3ea2104be1b8c91c174c3594946af ****/
		%feature("compactdefaultargs") NbPenMotions;
		%feature("autodoc", "Returns number of pen motions for chnum'th character. exception outofrange is raised if chnum <= 0 or chnum > nbcharacters.

Parameters
----------
Chnum: int

Returns
-------
int
") NbPenMotions;
		Standard_Integer NbPenMotions(const Standard_Integer Chnum);

		/****************** NextCharOrigin ******************/
		/**** md5 signature: 74c6f2a642dd29141e455f242cc982cf ****/
		%feature("compactdefaultargs") NextCharOrigin;
		%feature("autodoc", "Returns grid location of origin of character next to chnum'th char. exception outofrange is raised if chnum <= 0 or chnum > nbcharacters.

Parameters
----------
Chnum: int

Returns
-------
NX: int
NY: int
") NextCharOrigin;
		void NextCharOrigin(const Standard_Integer Chnum, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** NextPenPosition ******************/
		/**** md5 signature: 5150af49a89b506be5b315548a273fce ****/
		%feature("compactdefaultargs") NextPenPosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
Chnum: int
Motionnum: int

Returns
-------
IX: int
IY: int
") NextPenPosition;
		void NextPenPosition(const Standard_Integer Chnum, const Standard_Integer Motionnum, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Scale ******************/
		/**** md5 signature: 460c048aa1ce4f3cd49fef1c45f218d3 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Returns the number of grid units which equal one text height unit.

Returns
-------
int
") Scale;
		Standard_Integer Scale();

		/****************** SupersededFontCode ******************/
		/**** md5 signature: 18b19e45d4168cee7d46c4dc248cfe26 ****/
		%feature("compactdefaultargs") SupersededFontCode;
		%feature("autodoc", "Returns the font number which this entity modifies.

Returns
-------
int
") SupersededFontCode;
		Standard_Integer SupersededFontCode();

		/****************** SupersededFontEntity ******************/
		/**** md5 signature: 860687da70708a3a375d571793c3a234 ****/
		%feature("compactdefaultargs") SupersededFontEntity;
		%feature("autodoc", "Returns the font entity which this entity modifies.

Returns
-------
opencascade::handle<IGESGraph_TextFontDef>
") SupersededFontEntity;
		opencascade::handle<IGESGraph_TextFontDef> SupersededFontEntity();

};


%make_alias(IGESGraph_TextFontDef)

%extend IGESGraph_TextFontDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESGraph_ToolColor *
****************************/
class IGESGraph_ToolColor {
	public:
		/****************** IGESGraph_ToolColor ******************/
		/**** md5 signature: 188b735be99e4f9e7737b4f91e7f7fee ****/
		%feature("compactdefaultargs") IGESGraph_ToolColor;
		%feature("autodoc", "Returns a toolcolor, ready to work.

Returns
-------
None
") IGESGraph_ToolColor;
		 IGESGraph_ToolColor();

		/****************** DirChecker ******************/
		/**** md5 signature: ce18fea0801c3dc377a22fa12ffc4c42 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_Color

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_Color> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 3c1a76676828f5c8760125a5d202e2f2 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_Color
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_Color> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: ed3fc36d7dbd15a70d6316511e9c777e ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_Color
entto: IGESGraph_Color
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_Color> & entfrom, const opencascade::handle<IGESGraph_Color> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 5032050ed0710f30c7acb7bb8c8f7de0 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a color <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_Color
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_Color> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 133d60af52d518a09fede882a2f09804 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_Color
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_Color> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: bfaab0449d6ba43ab6895804bb7883a7 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_Color
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_Color> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolColor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESGraph_ToolDefinitionLevel *
**************************************/
class IGESGraph_ToolDefinitionLevel {
	public:
		/****************** IGESGraph_ToolDefinitionLevel ******************/
		/**** md5 signature: ebdfbb077478c519c514413eabc6f75d ****/
		%feature("compactdefaultargs") IGESGraph_ToolDefinitionLevel;
		%feature("autodoc", "Returns a tooldefinitionlevel, ready to work.

Returns
-------
None
") IGESGraph_ToolDefinitionLevel;
		 IGESGraph_ToolDefinitionLevel();

		/****************** DirChecker ******************/
		/**** md5 signature: 8c43e423598fca691e53d4849ee936dd ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_DefinitionLevel

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_DefinitionLevel> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: f7c0cde11f41f12372de7243aabc5330 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_DefinitionLevel
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_DefinitionLevel> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 2d56a4730be940c5d576d71d74148ef2 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_DefinitionLevel
entto: IGESGraph_DefinitionLevel
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_DefinitionLevel> & entfrom, const opencascade::handle<IGESGraph_DefinitionLevel> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: dc5852fa33b9bc74eed004734ecac23b ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a definitionlevel <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_DefinitionLevel
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_DefinitionLevel> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: eec734fe6765f1c0474824f662b27f1c ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_DefinitionLevel
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_DefinitionLevel> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: a05b93597c437342db9893ace16cf575 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_DefinitionLevel
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_DefinitionLevel> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolDefinitionLevel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESGraph_ToolDrawingSize *
**********************************/
class IGESGraph_ToolDrawingSize {
	public:
		/****************** IGESGraph_ToolDrawingSize ******************/
		/**** md5 signature: 034a7c4dc06cabc39faae1f088cbe595 ****/
		%feature("compactdefaultargs") IGESGraph_ToolDrawingSize;
		%feature("autodoc", "Returns a tooldrawingsize, ready to work.

Returns
-------
None
") IGESGraph_ToolDrawingSize;
		 IGESGraph_ToolDrawingSize();

		/****************** DirChecker ******************/
		/**** md5 signature: 7ae1cb69b87837b40a0fed3debf6399f ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_DrawingSize

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_DrawingSize> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 53147cedff987af360279eaed4bf79ac ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_DrawingSize
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_DrawingSize> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 820a8a3673085e022e5b1b62d24aec4f ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_DrawingSize
entto: IGESGraph_DrawingSize
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_DrawingSize> & entfrom, const opencascade::handle<IGESGraph_DrawingSize> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: f5fb3924239bf202079dbfe44a654d11 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a drawingsize (nbpropertyvalues forced to 2).

Parameters
----------
ent: IGESGraph_DrawingSize

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGraph_DrawingSize> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 663f7b9d54fae2aaa3ff9ffd600bd776 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a drawingsize <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_DrawingSize
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_DrawingSize> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: f670a40d4c274f717e897a5b4081e994 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_DrawingSize
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_DrawingSize> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: e7aacce18070a9e76c4b19f66e9648cb ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_DrawingSize
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_DrawingSize> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolDrawingSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESGraph_ToolDrawingUnits *
***********************************/
class IGESGraph_ToolDrawingUnits {
	public:
		/****************** IGESGraph_ToolDrawingUnits ******************/
		/**** md5 signature: e5752e9edcaa012fe4db0bb376035221 ****/
		%feature("compactdefaultargs") IGESGraph_ToolDrawingUnits;
		%feature("autodoc", "Returns a tooldrawingunits, ready to work.

Returns
-------
None
") IGESGraph_ToolDrawingUnits;
		 IGESGraph_ToolDrawingUnits();

		/****************** DirChecker ******************/
		/**** md5 signature: 0149bb1a84c610b92321bb3cf7873e11 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_DrawingUnits

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_DrawingUnits> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 19876df3d030387ef70b02afba49ac1a ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_DrawingUnits
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_DrawingUnits> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 4c77c6ef77f8207575b32bc902ec9be7 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_DrawingUnits
entto: IGESGraph_DrawingUnits
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_DrawingUnits> & entfrom, const opencascade::handle<IGESGraph_DrawingUnits> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 2b72e2fd3e22cd56bf12d805ecbf7dbe ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a drawingunits (nbpropertyvalues forced to 2).

Parameters
----------
ent: IGESGraph_DrawingUnits

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGraph_DrawingUnits> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 6c3ae22c48fb2ae9e316ec562903ae90 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a drawingunits <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_DrawingUnits
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_DrawingUnits> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 3f2a5c0aea0422d1417cce7eeab5afad ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_DrawingUnits
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_DrawingUnits> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 72d8af1941d0537d69621eb618c6e9b1 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_DrawingUnits
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_DrawingUnits> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolDrawingUnits {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESGraph_ToolHighLight *
********************************/
class IGESGraph_ToolHighLight {
	public:
		/****************** IGESGraph_ToolHighLight ******************/
		/**** md5 signature: 23289b20cbed9be78b40214fd818d918 ****/
		%feature("compactdefaultargs") IGESGraph_ToolHighLight;
		%feature("autodoc", "Returns a toolhighlight, ready to work.

Returns
-------
None
") IGESGraph_ToolHighLight;
		 IGESGraph_ToolHighLight();

		/****************** DirChecker ******************/
		/**** md5 signature: 24b58d1b283278ba9fc3dc8f2570206f ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_HighLight

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_HighLight> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 8e411ccb8ce15b84e1b7e2812b3d6182 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_HighLight
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_HighLight> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 3af57810207280c5c73aedbe77842e77 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_HighLight
entto: IGESGraph_HighLight
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_HighLight> & entfrom, const opencascade::handle<IGESGraph_HighLight> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: aa376c9e01a77ae379f2a113a4ae43e7 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a highlight (nbpropertyvalues forced to 1).

Parameters
----------
ent: IGESGraph_HighLight

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGraph_HighLight> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: bf6c480c2e19f37b56e988a44cff2343 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a highlight <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_HighLight
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_HighLight> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 21810558e5269d7deb00506dfa6377dc ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_HighLight
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_HighLight> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: e68820567577c138b3b920467f94c0a0 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_HighLight
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_HighLight> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolHighLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class IGESGraph_ToolIntercharacterSpacing *
********************************************/
class IGESGraph_ToolIntercharacterSpacing {
	public:
		/****************** IGESGraph_ToolIntercharacterSpacing ******************/
		/**** md5 signature: 3845d0919d7dc049e767ce26f6683f25 ****/
		%feature("compactdefaultargs") IGESGraph_ToolIntercharacterSpacing;
		%feature("autodoc", "Returns a toolintercharacterspacing, ready to work.

Returns
-------
None
") IGESGraph_ToolIntercharacterSpacing;
		 IGESGraph_ToolIntercharacterSpacing();

		/****************** DirChecker ******************/
		/**** md5 signature: cc071cc454c57c07faedca8756f06f3e ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_IntercharacterSpacing

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_IntercharacterSpacing> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: b72fad6b872c139cd26a8a8d0af142bd ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_IntercharacterSpacing
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_IntercharacterSpacing> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 7284921202061af248fd79e14ed4600b ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_IntercharacterSpacing
entto: IGESGraph_IntercharacterSpacing
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_IntercharacterSpacing> & entfrom, const opencascade::handle<IGESGraph_IntercharacterSpacing> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: abb282ee4b0dd622ae38412ab518c159 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a intercharacterspacing (nbpropertyvalues forced to 1).

Parameters
----------
ent: IGESGraph_IntercharacterSpacing

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGraph_IntercharacterSpacing> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 402934f279419bfc88733ee2e3f324ca ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a intercharacterspacing <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_IntercharacterSpacing
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_IntercharacterSpacing> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 1bece0ad1396ec7e8f4be9840ca072d8 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_IntercharacterSpacing
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_IntercharacterSpacing> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 3dca6620954116a8e92db13511f719d7 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_IntercharacterSpacing
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_IntercharacterSpacing> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolIntercharacterSpacing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESGraph_ToolLineFontDefPattern *
*****************************************/
class IGESGraph_ToolLineFontDefPattern {
	public:
		/****************** IGESGraph_ToolLineFontDefPattern ******************/
		/**** md5 signature: 876aa7afcf7c4f74fbe19bcdf7a3b722 ****/
		%feature("compactdefaultargs") IGESGraph_ToolLineFontDefPattern;
		%feature("autodoc", "Returns a toollinefontdefpattern, ready to work.

Returns
-------
None
") IGESGraph_ToolLineFontDefPattern;
		 IGESGraph_ToolLineFontDefPattern();

		/****************** DirChecker ******************/
		/**** md5 signature: b99a5cb96bed7b0e1a3d51d7811102e0 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_LineFontDefPattern

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_LineFontDefPattern> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 80fb78eab10631bc509f86d6b48df69c ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_LineFontDefPattern
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_LineFontDefPattern> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 1c44ea6d85f7b61ed2d4691df84336cb ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_LineFontDefPattern
entto: IGESGraph_LineFontDefPattern
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_LineFontDefPattern> & entfrom, const opencascade::handle<IGESGraph_LineFontDefPattern> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: bc7e31c3dfbde3285ef8901172d06dd4 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a linefontdefpattern <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_LineFontDefPattern
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_LineFontDefPattern> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: d7c25d7a972ae314324328438db974be ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_LineFontDefPattern
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_LineFontDefPattern> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: b234b379d2dd7127ff041e19b5723fd3 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_LineFontDefPattern
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_LineFontDefPattern> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolLineFontDefPattern {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class IGESGraph_ToolLineFontDefTemplate *
******************************************/
class IGESGraph_ToolLineFontDefTemplate {
	public:
		/****************** IGESGraph_ToolLineFontDefTemplate ******************/
		/**** md5 signature: 18d34c21ed71b6e91ebefc484965c934 ****/
		%feature("compactdefaultargs") IGESGraph_ToolLineFontDefTemplate;
		%feature("autodoc", "Returns a toollinefontdeftemplate, ready to work.

Returns
-------
None
") IGESGraph_ToolLineFontDefTemplate;
		 IGESGraph_ToolLineFontDefTemplate();

		/****************** DirChecker ******************/
		/**** md5 signature: 2060c1ea6d84cec3f8818af0af30506b ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_LineFontDefTemplate

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_LineFontDefTemplate> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 2a705dd70d86e71d48f8c7e8a0754205 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_LineFontDefTemplate
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_LineFontDefTemplate> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: a91b1795b1b4a3ab310fcedc2a764701 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_LineFontDefTemplate
entto: IGESGraph_LineFontDefTemplate
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_LineFontDefTemplate> & entfrom, const opencascade::handle<IGESGraph_LineFontDefTemplate> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 9c93a8bb9d61e4aa7fcc10adeb5993d8 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a linefontdeftemplate <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_LineFontDefTemplate
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_LineFontDefTemplate> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 9125c68e546de243698f78b69ba9d40f ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_LineFontDefTemplate
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_LineFontDefTemplate> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 2ccd587b6186dc5aa1fc8a7b8d3b68de ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_LineFontDefTemplate
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_LineFontDefTemplate> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolLineFontDefTemplate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESGraph_ToolLineFontPredefined *
*****************************************/
class IGESGraph_ToolLineFontPredefined {
	public:
		/****************** IGESGraph_ToolLineFontPredefined ******************/
		/**** md5 signature: d619d27bfb5ad5c213e896be57384cd8 ****/
		%feature("compactdefaultargs") IGESGraph_ToolLineFontPredefined;
		%feature("autodoc", "Returns a toollinefontpredefined, ready to work.

Returns
-------
None
") IGESGraph_ToolLineFontPredefined;
		 IGESGraph_ToolLineFontPredefined();

		/****************** DirChecker ******************/
		/**** md5 signature: 2edd47799c6507e9b8432dd2e663bbd8 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_LineFontPredefined

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_LineFontPredefined> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 5c01ea291c006d35248394196bfe54bf ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_LineFontPredefined
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_LineFontPredefined> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: d7d12aae3a0cf10ac6056168ab7f36aa ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_LineFontPredefined
entto: IGESGraph_LineFontPredefined
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_LineFontPredefined> & entfrom, const opencascade::handle<IGESGraph_LineFontPredefined> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: caf33b2d8e71d0a1ee64c8b933d9671f ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a linefontpredefined (nbpropertyvalues forced to 1).

Parameters
----------
ent: IGESGraph_LineFontPredefined

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGraph_LineFontPredefined> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 43a15c19e074583e70ae303cb959559d ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a linefontpredefined <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_LineFontPredefined
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_LineFontPredefined> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: d1f1fac66519bcbc61f495047ddb02d6 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_LineFontPredefined
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_LineFontPredefined> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 73782bae90487b2a395aece71e49aa7c ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_LineFontPredefined
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_LineFontPredefined> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolLineFontPredefined {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESGraph_ToolNominalSize *
**********************************/
class IGESGraph_ToolNominalSize {
	public:
		/****************** IGESGraph_ToolNominalSize ******************/
		/**** md5 signature: 7ce04ea4909e2bca88fa65b754770f95 ****/
		%feature("compactdefaultargs") IGESGraph_ToolNominalSize;
		%feature("autodoc", "Returns a toolnominalsize, ready to work.

Returns
-------
None
") IGESGraph_ToolNominalSize;
		 IGESGraph_ToolNominalSize();

		/****************** DirChecker ******************/
		/**** md5 signature: d3691b304eb0d0908639026e0ee4c692 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_NominalSize

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_NominalSize> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 8ac84e24a2c769a0492bb29e411b0b68 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_NominalSize
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_NominalSize> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 23c0a9d2da0693850d3d1efc58fc0453 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_NominalSize
entto: IGESGraph_NominalSize
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_NominalSize> & entfrom, const opencascade::handle<IGESGraph_NominalSize> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 1a82797b2777249b820fead630757a42 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a nominalsize (nbpropertyvalues forced to 2 or 3 according hasstandardname).

Parameters
----------
ent: IGESGraph_NominalSize

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGraph_NominalSize> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 9e44fa58eec39195a819aadeab6cc8ab ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a nominalsize <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_NominalSize
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_NominalSize> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 08e60a05a35a250af2ed88e841b552e3 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_NominalSize
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_NominalSize> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: bcc930fbe600f3823f67c728cecbd8af ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_NominalSize
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_NominalSize> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolNominalSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESGraph_ToolPick *
***************************/
class IGESGraph_ToolPick {
	public:
		/****************** IGESGraph_ToolPick ******************/
		/**** md5 signature: fa1dddcbe274b534ac0cf3980f5f3d3d ****/
		%feature("compactdefaultargs") IGESGraph_ToolPick;
		%feature("autodoc", "Returns a toolpick, ready to work.

Returns
-------
None
") IGESGraph_ToolPick;
		 IGESGraph_ToolPick();

		/****************** DirChecker ******************/
		/**** md5 signature: 403c6227fad070ba9c45bf989b40f61c ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_Pick

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_Pick> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 72119d304fdee0a4b00bae009d9e148b ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_Pick
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_Pick> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: de713542a5ebbcc947fa2836e69e1fc5 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_Pick
entto: IGESGraph_Pick
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_Pick> & entfrom, const opencascade::handle<IGESGraph_Pick> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: c92328bb793edd2fcd77c0f0c7ff3b2e ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a pick (nbpropertyvalues forced to 1).

Parameters
----------
ent: IGESGraph_Pick

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGraph_Pick> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 7191839f6b02fcfb8e246cc2b10f8644 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a pick <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_Pick
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_Pick> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 630d3d6b10319a1df5ad6ea25ffbd32c ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_Pick
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_Pick> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: f65a92f2c39c1ff06ccdb57485ccc2a7 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_Pick
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_Pick> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolPick {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class IGESGraph_ToolTextDisplayTemplate *
******************************************/
class IGESGraph_ToolTextDisplayTemplate {
	public:
		/****************** IGESGraph_ToolTextDisplayTemplate ******************/
		/**** md5 signature: 461d19298fe8d472cdcb8cb3951bf72a ****/
		%feature("compactdefaultargs") IGESGraph_ToolTextDisplayTemplate;
		%feature("autodoc", "Returns a tooltextdisplaytemplate, ready to work.

Returns
-------
None
") IGESGraph_ToolTextDisplayTemplate;
		 IGESGraph_ToolTextDisplayTemplate();

		/****************** DirChecker ******************/
		/**** md5 signature: e324668a1209bd3f8c60c18548e0a2e0 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_TextDisplayTemplate

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_TextDisplayTemplate> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 7b012427240864a23115c08a412559b1 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_TextDisplayTemplate
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_TextDisplayTemplate> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 7dac9537eefc4225a171afee4382c618 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_TextDisplayTemplate
entto: IGESGraph_TextDisplayTemplate
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_TextDisplayTemplate> & entfrom, const opencascade::handle<IGESGraph_TextDisplayTemplate> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 591358eacfc5613a755555b4c93591f6 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a textdisplaytemplate <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_TextDisplayTemplate
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_TextDisplayTemplate> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 9b246b133891ddd24e3d2018e74af001 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_TextDisplayTemplate
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_TextDisplayTemplate> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: f4135a649d34d342fc0035f26b8c645e ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_TextDisplayTemplate
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_TextDisplayTemplate> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolTextDisplayTemplate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESGraph_ToolTextFontDef *
**********************************/
class IGESGraph_ToolTextFontDef {
	public:
		/****************** IGESGraph_ToolTextFontDef ******************/
		/**** md5 signature: 36e702827e4c8403413e60e5eb597172 ****/
		%feature("compactdefaultargs") IGESGraph_ToolTextFontDef;
		%feature("autodoc", "Returns a tooltextfontdef, ready to work.

Returns
-------
None
") IGESGraph_ToolTextFontDef;
		 IGESGraph_ToolTextFontDef();

		/****************** DirChecker ******************/
		/**** md5 signature: 5b4c6789333b81cebeadcb9e61d45e0f ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_TextFontDef

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_TextFontDef> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 5a5756a283b1b8bce46d84cd91541e6c ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_TextFontDef
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_TextFontDef> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: d5c76add5c813ab212cdc8da399bc4e2 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_TextFontDef
entto: IGESGraph_TextFontDef
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_TextFontDef> & entfrom, const opencascade::handle<IGESGraph_TextFontDef> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 4a54da0df97ce7ae37bdefa4139fa0c1 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a textfontdef <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_TextFontDef
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_TextFontDef> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 2f5bc7c6e6e6ebec4d170575ea4b63a7 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_TextFontDef
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_TextFontDef> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 94e71afc6e70cd204fc7bb03b1bade7e ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_TextFontDef
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_TextFontDef> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolTextFontDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESGraph_ToolUniformRectGrid *
**************************************/
class IGESGraph_ToolUniformRectGrid {
	public:
		/****************** IGESGraph_ToolUniformRectGrid ******************/
		/**** md5 signature: 2b221a4f576f76c832dcce3df0c0a6c5 ****/
		%feature("compactdefaultargs") IGESGraph_ToolUniformRectGrid;
		%feature("autodoc", "Returns a tooluniformrectgrid, ready to work.

Returns
-------
None
") IGESGraph_ToolUniformRectGrid;
		 IGESGraph_ToolUniformRectGrid();

		/****************** DirChecker ******************/
		/**** md5 signature: 038f78ed6b1b07181023c4ab99f68c27 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGraph_UniformRectGrid

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGraph_UniformRectGrid> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 18c8c90e19c53e9650d513fdaa336c6c ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGraph_UniformRectGrid
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGraph_UniformRectGrid> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 9992fd681ea5964171034877c08aa782 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGraph_UniformRectGrid
entto: IGESGraph_UniformRectGrid
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGraph_UniformRectGrid> & entfrom, const opencascade::handle<IGESGraph_UniformRectGrid> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: e573e84b9db77b1f9760094b428a7975 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a uniformrectgrid (nbpropertyvalues forced to 9).

Parameters
----------
ent: IGESGraph_UniformRectGrid

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGraph_UniformRectGrid> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 5d7100718dd66815c38e9fe7a4badaea ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a uniformrectgrid <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGraph_UniformRectGrid
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGraph_UniformRectGrid> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 1e3d7ad2f0e6aab5d4fbd613c77f0dd6 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGraph_UniformRectGrid
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGraph_UniformRectGrid> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 3061e4f689b6327e82ceaed660711b8d ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGraph_UniformRectGrid
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGraph_UniformRectGrid> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGraph_ToolUniformRectGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESGraph_UniformRectGrid *
**********************************/
class IGESGraph_UniformRectGrid : public IGESData_IGESEntity {
	public:
		/****************** IGESGraph_UniformRectGrid ******************/
		/**** md5 signature: e659e457a88bb4376204c59c5f63e209 ****/
		%feature("compactdefaultargs") IGESGraph_UniformRectGrid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGraph_UniformRectGrid;
		 IGESGraph_UniformRectGrid();

		/****************** GridPoint ******************/
		/**** md5 signature: f7fe3250f851b0610a176cdd16f8d2f7 ****/
		%feature("compactdefaultargs") GridPoint;
		%feature("autodoc", "Returns coordinates of lower left corner, if <self> is a finite grid, coordinates of an arbitrary point, if <self> is an infinite grid.

Returns
-------
gp_Pnt2d
") GridPoint;
		gp_Pnt2d GridPoint();

		/****************** GridSpacing ******************/
		/**** md5 signature: 7633759b1af27ddb907225a5832204cc ****/
		%feature("compactdefaultargs") GridSpacing;
		%feature("autodoc", "Returns the grid-spacing in drawing coordinates.

Returns
-------
gp_Vec2d
") GridSpacing;
		gp_Vec2d GridSpacing();

		/****************** Init ******************/
		/**** md5 signature: 081404be3ccc18c081ba54d2eeeebde2 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class uniformrectgrid - nbprops : number of property values (np = 9) - finite : finite/infinite grid flag - line : line/point grid flag - weighted : weighted/unweighted grid flag - agridpoint : point on the grid - agridspacing : grid spacing - pointsx : no. of points/lines in x direction - pointsy : no. of points/lines in y direction.

Parameters
----------
nbProps: int
finite: int
line: int
weighted: int
aGridPoint: gp_XY
aGridSpacing: gp_XY
pointsX: int
pointsY: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbProps, const Standard_Integer finite, const Standard_Integer line, const Standard_Integer weighted, const gp_XY & aGridPoint, const gp_XY & aGridSpacing, const Standard_Integer pointsX, const Standard_Integer pointsY);

		/****************** IsFinite ******************/
		/**** md5 signature: d983a95901b0ce0558b53b160edd3ca5 ****/
		%feature("compactdefaultargs") IsFinite;
		%feature("autodoc", "Returns false if <self> is an infinite grid, true if <self> is a finite grid.

Returns
-------
bool
") IsFinite;
		Standard_Boolean IsFinite();

		/****************** IsLine ******************/
		/**** md5 signature: 51ad3b0e1f56ed6f328a7a7940918c54 ****/
		%feature("compactdefaultargs") IsLine;
		%feature("autodoc", "Returns false if <self> is a point grid, true if <self> is a line grid.

Returns
-------
bool
") IsLine;
		Standard_Boolean IsLine();

		/****************** IsWeighted ******************/
		/**** md5 signature: b60478917a1e01e1b509c843e5aed3d5 ****/
		%feature("compactdefaultargs") IsWeighted;
		%feature("autodoc", "Returns false if <self> is a weighted grid, true if <self> is not a weighted grid.

Returns
-------
bool
") IsWeighted;
		Standard_Boolean IsWeighted();

		/****************** NbPointsX ******************/
		/**** md5 signature: a5b66fbca6590819cd2a8aad52cfe6f9 ****/
		%feature("compactdefaultargs") NbPointsX;
		%feature("autodoc", "Returns the no. of points/lines in x direction (only applicable if isfinite() = 1, i.e: a finite grid).

Returns
-------
int
") NbPointsX;
		Standard_Integer NbPointsX();

		/****************** NbPointsY ******************/
		/**** md5 signature: af288d2d3956cc0a146e6c0eeeabb59b ****/
		%feature("compactdefaultargs") NbPointsY;
		%feature("autodoc", "Returns the no. of points/lines in y direction (only applicable if isfinite() = 1, i.e: a finite grid).

Returns
-------
int
") NbPointsY;
		Standard_Integer NbPointsY();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values in <self>.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

};


%make_alias(IGESGraph_UniformRectGrid)

%extend IGESGraph_UniformRectGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class IGESGraph_HArray1OfColor : public IGESGraph_Array1OfColor, public Standard_Transient {
  public:
    IGESGraph_HArray1OfColor(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESGraph_HArray1OfColor(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESGraph_Array1OfColor::value_type& theValue);
    IGESGraph_HArray1OfColor(const IGESGraph_Array1OfColor& theOther);
    const IGESGraph_Array1OfColor& Array1();
    IGESGraph_Array1OfColor& ChangeArray1();
};
%make_alias(IGESGraph_HArray1OfColor)


class IGESGraph_HArray1OfTextDisplayTemplate : public IGESGraph_Array1OfTextDisplayTemplate, public Standard_Transient {
  public:
    IGESGraph_HArray1OfTextDisplayTemplate(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESGraph_HArray1OfTextDisplayTemplate(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESGraph_Array1OfTextDisplayTemplate::value_type& theValue);
    IGESGraph_HArray1OfTextDisplayTemplate(const IGESGraph_Array1OfTextDisplayTemplate& theOther);
    const IGESGraph_Array1OfTextDisplayTemplate& Array1();
    IGESGraph_Array1OfTextDisplayTemplate& ChangeArray1();
};
%make_alias(IGESGraph_HArray1OfTextDisplayTemplate)


class IGESGraph_HArray1OfTextFontDef : public IGESGraph_Array1OfTextFontDef, public Standard_Transient {
  public:
    IGESGraph_HArray1OfTextFontDef(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESGraph_HArray1OfTextFontDef(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESGraph_Array1OfTextFontDef::value_type& theValue);
    IGESGraph_HArray1OfTextFontDef(const IGESGraph_Array1OfTextFontDef& theOther);
    const IGESGraph_Array1OfTextFontDef& Array1();
    IGESGraph_Array1OfTextFontDef& ChangeArray1();
};
%make_alias(IGESGraph_HArray1OfTextFontDef)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
