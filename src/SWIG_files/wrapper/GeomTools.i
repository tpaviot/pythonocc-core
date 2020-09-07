/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define GEOMTOOLSDOCSTRING
"GeomTools module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomtools.html"
%enddef
%module (package="OCC.Core", docstring=GEOMTOOLSDOCSTRING) GeomTools


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<GeomTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import Geom2d.i
%import Message.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(GeomTools_UndefinedTypeHandler)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************
* class GeomTools *
******************/
%rename(geomtools) GeomTools;
class GeomTools {
	public:
		/****************** GetUndefinedTypeHandler ******************/
		/**** md5 signature: 4feeff4a1f6ab5a12fb2effedf9bc1c3 ****/
		%feature("compactdefaultargs") GetUndefinedTypeHandler;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomTools_UndefinedTypeHandler>
") GetUndefinedTypeHandler;
		static opencascade::handle<GeomTools_UndefinedTypeHandler> GetUndefinedTypeHandler();

		/****************** SetUndefinedTypeHandler ******************/
		/**** md5 signature: 924bb9ac20d7bc97a8eee36d4f9f3c0b ****/
		%feature("compactdefaultargs") SetUndefinedTypeHandler;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHandler: GeomTools_UndefinedTypeHandler

Returns
-------
None
") SetUndefinedTypeHandler;
		static void SetUndefinedTypeHandler(const opencascade::handle<GeomTools_UndefinedTypeHandler> & aHandler);

};


%extend GeomTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomTools_Curve2dSet *
*****************************/
class GeomTools_Curve2dSet {
	public:
		/****************** GeomTools_Curve2dSet ******************/
		/**** md5 signature: fd1845b0ee77ab29f7ca4ee6ff8d9279 ****/
		%feature("compactdefaultargs") GeomTools_Curve2dSet;
		%feature("autodoc", "Returns an empty set of curves.

Returns
-------
None
") GeomTools_Curve2dSet;
		 GeomTools_Curve2dSet();

		/****************** Add ******************/
		/**** md5 signature: 947264273ed6b5c72eac1f308b1f2487 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Incorporate a new curve in the set and returns its index.

Parameters
----------
C: Geom2d_Curve

Returns
-------
int
") Add;
		Standard_Integer Add(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the set.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Curve2d ******************/
		/**** md5 signature: aca04b75893a006fca996d6d157d858d ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns the curve of index <i>.

Parameters
----------
I: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d(const Standard_Integer I);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetProgress ******************/
		/**** md5 signature: 5ccd431fdaac188bfde6910f9c87adba ****/
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Message_ProgressIndicator>
") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress();

		/****************** Index ******************/
		/**** md5 signature: e1559320ddf80ce0263d324c781a3407 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the index of <l>.

Parameters
----------
C: Geom2d_Curve

Returns
-------
int
") Index;
		Standard_Integer Index(const opencascade::handle<Geom2d_Curve> & C);


            %feature("autodoc", "1");
            %extend{
                void ReadFromString(std::string src) {
                std::stringstream s(src);
                self->Read(s);}
            };

            %feature("autodoc", "1");
            %extend{
                void ReadCurve2dFromString(std::string src) {
                std::stringstream s(src);
                self->ReadCurve2d(s);}
            };
		/****************** SetProgress ******************/
		/**** md5 signature: b010efa5a4169e377c5a67920d2de5f9 ****/
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "No available documentation.

Parameters
----------
PR: Message_ProgressIndicator

Returns
-------
None
") SetProgress;
		void SetProgress(const opencascade::handle<Message_ProgressIndicator> & PR);


        %feature("autodoc", "1");
        %extend{
            std::string WriteToString() {
            std::stringstream s;
            self->Write(s);
            return s.str();}
        };
};


%extend GeomTools_Curve2dSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomTools_CurveSet *
***************************/
class GeomTools_CurveSet {
	public:
		/****************** GeomTools_CurveSet ******************/
		/**** md5 signature: db7c2b276941a40dfd1eecce0ab38615 ****/
		%feature("compactdefaultargs") GeomTools_CurveSet;
		%feature("autodoc", "Returns an empty set of curves.

Returns
-------
None
") GeomTools_CurveSet;
		 GeomTools_CurveSet();

		/****************** Add ******************/
		/**** md5 signature: 4548eacacd2a36c829559b37d6b57411 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Incorporate a new curve in the set and returns its index.

Parameters
----------
C: Geom_Curve

Returns
-------
int
") Add;
		Standard_Integer Add(const opencascade::handle<Geom_Curve> & C);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the set.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Curve ******************/
		/**** md5 signature: 3509a433898cb7510761da8b37eedb3b ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the curve of index <i>.

Parameters
----------
I: int

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		opencascade::handle<Geom_Curve> Curve(const Standard_Integer I);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetProgress ******************/
		/**** md5 signature: 5ccd431fdaac188bfde6910f9c87adba ****/
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Message_ProgressIndicator>
") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress();

		/****************** Index ******************/
		/**** md5 signature: c53cbf4d0efdfb90843e67e9b32c5252 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the index of <l>.

Parameters
----------
C: Geom_Curve

Returns
-------
int
") Index;
		Standard_Integer Index(const opencascade::handle<Geom_Curve> & C);


            %feature("autodoc", "1");
            %extend{
                void ReadFromString(std::string src) {
                std::stringstream s(src);
                self->Read(s);}
            };

            %feature("autodoc", "1");
            %extend{
                void ReadCurveFromString(std::string src) {
                std::stringstream s(src);
                self->ReadCurve(s);}
            };
		/****************** SetProgress ******************/
		/**** md5 signature: b010efa5a4169e377c5a67920d2de5f9 ****/
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "No available documentation.

Parameters
----------
PR: Message_ProgressIndicator

Returns
-------
None
") SetProgress;
		void SetProgress(const opencascade::handle<Message_ProgressIndicator> & PR);


        %feature("autodoc", "1");
        %extend{
            std::string WriteToString() {
            std::stringstream s;
            self->Write(s);
            return s.str();}
        };
};


%extend GeomTools_CurveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomTools_SurfaceSet *
*****************************/
class GeomTools_SurfaceSet {
	public:
		/****************** GeomTools_SurfaceSet ******************/
		/**** md5 signature: 13978194ee9f9c91ee7a81cdf7063dc2 ****/
		%feature("compactdefaultargs") GeomTools_SurfaceSet;
		%feature("autodoc", "Returns an empty set of surfaces.

Returns
-------
None
") GeomTools_SurfaceSet;
		 GeomTools_SurfaceSet();

		/****************** Add ******************/
		/**** md5 signature: 6108c9acf8995214a7cb8b8e5a0b937c ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Incorporate a new surface in the set and returns its index.

Parameters
----------
S: Geom_Surface

Returns
-------
int
") Add;
		Standard_Integer Add(const opencascade::handle<Geom_Surface> & S);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the set.

Returns
-------
None
") Clear;
		void Clear();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetProgress ******************/
		/**** md5 signature: 5ccd431fdaac188bfde6910f9c87adba ****/
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Message_ProgressIndicator>
") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress();

		/****************** Index ******************/
		/**** md5 signature: 7fc50802d17ebd7c660284e6560fb7f6 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the index of <l>.

Parameters
----------
S: Geom_Surface

Returns
-------
int
") Index;
		Standard_Integer Index(const opencascade::handle<Geom_Surface> & S);


            %feature("autodoc", "1");
            %extend{
                void ReadFromString(std::string src) {
                std::stringstream s(src);
                self->Read(s);}
            };

            %feature("autodoc", "1");
            %extend{
                void ReadSurfaceFromString(std::string src) {
                std::stringstream s(src);
                self->ReadSurface(s);}
            };
		/****************** SetProgress ******************/
		/**** md5 signature: b010efa5a4169e377c5a67920d2de5f9 ****/
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "No available documentation.

Parameters
----------
PR: Message_ProgressIndicator

Returns
-------
None
") SetProgress;
		void SetProgress(const opencascade::handle<Message_ProgressIndicator> & PR);

		/****************** Surface ******************/
		/**** md5 signature: f08a9f2a886e0a3933ae15a38f9b8dda ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the surface of index <i>.

Parameters
----------
I: int

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		opencascade::handle<Geom_Surface> Surface(const Standard_Integer I);


        %feature("autodoc", "1");
        %extend{
            std::string WriteToString() {
            std::stringstream s;
            self->Write(s);
            return s.str();}
        };
};


%extend GeomTools_SurfaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomTools_UndefinedTypeHandler *
***************************************/
class GeomTools_UndefinedTypeHandler : public Standard_Transient {
	public:
		/****************** GeomTools_UndefinedTypeHandler ******************/
		/**** md5 signature: cc90fa1e9e672821392fcca7d830ff55 ****/
		%feature("compactdefaultargs") GeomTools_UndefinedTypeHandler;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomTools_UndefinedTypeHandler;
		 GeomTools_UndefinedTypeHandler();

};


%make_alias(GeomTools_UndefinedTypeHandler)

%extend GeomTools_UndefinedTypeHandler {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
