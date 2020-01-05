/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

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
		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* A set of Curves from Geom2d. Dumps the surface on the stream.
	:param S:
	:type S: Geom_Surface
	:param OS:
	:type OS: Standard_OStream
	:rtype: void") Dump;
		static void Dump (const opencascade::handle<Geom_Surface> & S,Standard_OStream & OS);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dumps the Curve on the stream.
	:param C:
	:type C: Geom_Curve
	:param OS:
	:type OS: Standard_OStream
	:rtype: void") Dump;
		static void Dump (const opencascade::handle<Geom_Curve> & C,Standard_OStream & OS);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dumps the Curve on the stream.
	:param C:
	:type C: Geom2d_Curve
	:param OS:
	:type OS: Standard_OStream
	:rtype: void") Dump;
		static void Dump (const opencascade::handle<Geom2d_Curve> & C,Standard_OStream & OS);

		/****************** GetReal ******************/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "* Reads the Standard_Real value from the stream. Zero is read in case of error
	:param IS:
	:type IS: Standard_IStream
	:param theValue:
	:type theValue: float
	:rtype: void") GetReal;
		static void GetReal (Standard_IStream & IS,Standard_Real &OutValue);

		/****************** GetUndefinedTypeHandler ******************/
		%feature("compactdefaultargs") GetUndefinedTypeHandler;
		%feature("autodoc", ":rtype: opencascade::handle<GeomTools_UndefinedTypeHandler>") GetUndefinedTypeHandler;
		static opencascade::handle<GeomTools_UndefinedTypeHandler> GetUndefinedTypeHandler ();

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "* Reads the surface from the stream.
	:param S:
	:type S: Geom_Surface
	:param IS:
	:type IS: Standard_IStream
	:rtype: void") Read;
		static void Read (opencascade::handle<Geom_Surface> & S,Standard_IStream & IS);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "* Reads the Curve from the stream.
	:param C:
	:type C: Geom_Curve
	:param IS:
	:type IS: Standard_IStream
	:rtype: void") Read;
		static void Read (opencascade::handle<Geom_Curve> & C,Standard_IStream & IS);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "* Reads the Curve from the stream.
	:param C:
	:type C: Geom2d_Curve
	:param IS:
	:type IS: Standard_IStream
	:rtype: void") Read;
		static void Read (opencascade::handle<Geom2d_Curve> & C,Standard_IStream & IS);

		/****************** SetUndefinedTypeHandler ******************/
		%feature("compactdefaultargs") SetUndefinedTypeHandler;
		%feature("autodoc", ":param aHandler:
	:type aHandler: GeomTools_UndefinedTypeHandler
	:rtype: void") SetUndefinedTypeHandler;
		static void SetUndefinedTypeHandler (const opencascade::handle<GeomTools_UndefinedTypeHandler> & aHandler);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Writes the surface on the stream.
	:param S:
	:type S: Geom_Surface
	:param OS:
	:type OS: Standard_OStream
	:rtype: void") Write;
		static void Write (const opencascade::handle<Geom_Surface> & S,Standard_OStream & OS);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Writes the Curve on the stream.
	:param C:
	:type C: Geom_Curve
	:param OS:
	:type OS: Standard_OStream
	:rtype: void") Write;
		static void Write (const opencascade::handle<Geom_Curve> & C,Standard_OStream & OS);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Writes the Curve on the stream.
	:param C:
	:type C: Geom2d_Curve
	:param OS:
	:type OS: Standard_OStream
	:rtype: void") Write;
		static void Write (const opencascade::handle<Geom2d_Curve> & C,Standard_OStream & OS);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Incorporate a new Curve in the set and returns its index.
	:param C:
	:type C: Geom2d_Curve
	:rtype: int") Add;
		Standard_Integer Add (const opencascade::handle<Geom2d_Curve> & C);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the content of the set.
	:rtype: None") Clear;
		void Clear ();

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "* Returns the Curve of index <I>.
	:param I:
	:type I: int
	:rtype: opencascade::handle<Geom2d_Curve>") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d (const Standard_Integer I);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GeomTools_Curve2dSet ******************/
		%feature("compactdefaultargs") GeomTools_Curve2dSet;
		%feature("autodoc", "* Returns an empty set of Curves.
	:rtype: None") GeomTools_Curve2dSet;
		 GeomTools_Curve2dSet ();

		/****************** GetProgress ******************/
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", ":rtype: opencascade::handle<Message_ProgressIndicator>") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* Returns the index of <L>.
	:param C:
	:type C: Geom2d_Curve
	:rtype: int") Index;
		Standard_Integer Index (const opencascade::handle<Geom2d_Curve> & C);

		/****************** PrintCurve2d ******************/
		%feature("compactdefaultargs") PrintCurve2d;
		%feature("autodoc", "* Dumps the curve on the stream, if compact is True use the compact format that can be read back.
	:param C:
	:type C: Geom2d_Curve
	:param OS:
	:type OS: Standard_OStream
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void") PrintCurve2d;
		static void PrintCurve2d (const opencascade::handle<Geom2d_Curve> & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);


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
		%feature("autodoc", ":param PR:
	:type PR: Message_ProgressIndicator
	:rtype: None") SetProgress;
		void SetProgress (const opencascade::handle<Message_ProgressIndicator> & PR);


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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Incorporate a new Curve in the set and returns its index.
	:param C:
	:type C: Geom_Curve
	:rtype: int") Add;
		Standard_Integer Add (const opencascade::handle<Geom_Curve> & C);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the content of the set.
	:rtype: None") Clear;
		void Clear ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the Curve of index <I>.
	:param I:
	:type I: int
	:rtype: opencascade::handle<Geom_Curve>") Curve;
		opencascade::handle<Geom_Curve> Curve (const Standard_Integer I);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GeomTools_CurveSet ******************/
		%feature("compactdefaultargs") GeomTools_CurveSet;
		%feature("autodoc", "* Returns an empty set of Curves.
	:rtype: None") GeomTools_CurveSet;
		 GeomTools_CurveSet ();

		/****************** GetProgress ******************/
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", ":rtype: opencascade::handle<Message_ProgressIndicator>") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* Returns the index of <L>.
	:param C:
	:type C: Geom_Curve
	:rtype: int") Index;
		Standard_Integer Index (const opencascade::handle<Geom_Curve> & C);

		/****************** PrintCurve ******************/
		%feature("compactdefaultargs") PrintCurve;
		%feature("autodoc", "* Dumps the curve on the stream, if compact is True use the compact format that can be read back.
	:param C:
	:type C: Geom_Curve
	:param OS:
	:type OS: Standard_OStream
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void") PrintCurve;
		static void PrintCurve (const opencascade::handle<Geom_Curve> & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);


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
		%feature("autodoc", ":param PR:
	:type PR: Message_ProgressIndicator
	:rtype: None") SetProgress;
		void SetProgress (const opencascade::handle<Message_ProgressIndicator> & PR);


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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Incorporate a new Surface in the set and returns its index.
	:param S:
	:type S: Geom_Surface
	:rtype: int") Add;
		Standard_Integer Add (const opencascade::handle<Geom_Surface> & S);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the content of the set.
	:rtype: None") Clear;
		void Clear ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GeomTools_SurfaceSet ******************/
		%feature("compactdefaultargs") GeomTools_SurfaceSet;
		%feature("autodoc", "* Returns an empty set of Surfaces.
	:rtype: None") GeomTools_SurfaceSet;
		 GeomTools_SurfaceSet ();

		/****************** GetProgress ******************/
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", ":rtype: opencascade::handle<Message_ProgressIndicator>") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* Returns the index of <L>.
	:param S:
	:type S: Geom_Surface
	:rtype: int") Index;
		Standard_Integer Index (const opencascade::handle<Geom_Surface> & S);

		/****************** PrintSurface ******************/
		%feature("compactdefaultargs") PrintSurface;
		%feature("autodoc", "* Dumps the surface on the stream, if compact is True use the compact format that can be read back.
	:param S:
	:type S: Geom_Surface
	:param OS:
	:type OS: Standard_OStream
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void") PrintSurface;
		static void PrintSurface (const opencascade::handle<Geom_Surface> & S,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);


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
		%feature("autodoc", ":param PR:
	:type PR: Message_ProgressIndicator
	:rtype: None") SetProgress;
		void SetProgress (const opencascade::handle<Message_ProgressIndicator> & PR);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns the Surface of index <I>.
	:param I:
	:type I: int
	:rtype: opencascade::handle<Geom_Surface>") Surface;
		opencascade::handle<Geom_Surface> Surface (const Standard_Integer I);


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
		%feature("autodoc", ":rtype: None") GeomTools_UndefinedTypeHandler;
		 GeomTools_UndefinedTypeHandler ();

		/****************** PrintCurve ******************/
		%feature("compactdefaultargs") PrintCurve;
		%feature("autodoc", ":param C:
	:type C: Geom_Curve
	:param OS:
	:type OS: Standard_OStream
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void") PrintCurve;
		virtual void PrintCurve (const opencascade::handle<Geom_Curve> & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);

		/****************** PrintCurve2d ******************/
		%feature("compactdefaultargs") PrintCurve2d;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:param OS:
	:type OS: Standard_OStream
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void") PrintCurve2d;
		virtual void PrintCurve2d (const opencascade::handle<Geom2d_Curve> & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);

		/****************** PrintSurface ******************/
		%feature("compactdefaultargs") PrintSurface;
		%feature("autodoc", ":param S:
	:type S: Geom_Surface
	:param OS:
	:type OS: Standard_OStream
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void") PrintSurface;
		virtual void PrintSurface (const opencascade::handle<Geom_Surface> & S,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);

		/****************** ReadCurve ******************/
		%feature("compactdefaultargs") ReadCurve;
		%feature("autodoc", ":param ctype:
	:type ctype: int
	:param IS:
	:type IS: Standard_IStream
	:param C:
	:type C: Geom_Curve
	:rtype: Standard_IStream") ReadCurve;
		virtual Standard_IStream & ReadCurve (const Standard_Integer ctype,Standard_IStream & IS,opencascade::handle<Geom_Curve> & C);

		/****************** ReadCurve2d ******************/
		%feature("compactdefaultargs") ReadCurve2d;
		%feature("autodoc", ":param ctype:
	:type ctype: int
	:param IS:
	:type IS: Standard_IStream
	:param C:
	:type C: Geom2d_Curve
	:rtype: Standard_IStream") ReadCurve2d;
		virtual Standard_IStream & ReadCurve2d (const Standard_Integer ctype,Standard_IStream & IS,opencascade::handle<Geom2d_Curve> & C);

		/****************** ReadSurface ******************/
		%feature("compactdefaultargs") ReadSurface;
		%feature("autodoc", ":param ctype:
	:type ctype: int
	:param IS:
	:type IS: Standard_IStream
	:param S:
	:type S: Geom_Surface
	:rtype: Standard_IStream") ReadSurface;
		virtual Standard_IStream & ReadSurface (const Standard_Integer ctype,Standard_IStream & IS,opencascade::handle<Geom_Surface> & S);

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
