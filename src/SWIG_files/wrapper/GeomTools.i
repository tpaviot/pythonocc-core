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
		%feature("compactdefaultargs") GetUndefinedTypeHandler;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomTools_UndefinedTypeHandler>
") GetUndefinedTypeHandler;
		static opencascade::handle<GeomTools_UndefinedTypeHandler> GetUndefinedTypeHandler();

		/****************** SetUndefinedTypeHandler ******************/
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
		%feature("compactdefaultargs") GeomTools_Curve2dSet;
		%feature("autodoc", "Returns an empty set of curves.

Returns
-------
None
") GeomTools_Curve2dSet;
		 GeomTools_Curve2dSet();

		/****************** Add ******************/
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
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the set.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Curve2d ******************/
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
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Message_ProgressIndicator>
") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress();

		/****************** Index ******************/
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
		%feature("compactdefaultargs") GeomTools_CurveSet;
		%feature("autodoc", "Returns an empty set of curves.

Returns
-------
None
") GeomTools_CurveSet;
		 GeomTools_CurveSet();

		/****************** Add ******************/
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
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the set.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Curve ******************/
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
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Message_ProgressIndicator>
") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress();

		/****************** Index ******************/
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
		%feature("compactdefaultargs") GeomTools_SurfaceSet;
		%feature("autodoc", "Returns an empty set of surfaces.

Returns
-------
None
") GeomTools_SurfaceSet;
		 GeomTools_SurfaceSet();

		/****************** Add ******************/
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
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Message_ProgressIndicator>
") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress();

		/****************** Index ******************/
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
