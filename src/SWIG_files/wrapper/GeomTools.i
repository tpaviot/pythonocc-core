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
%module (package="OCC") GeomTools

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

%include GeomTools_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(geomtools) GeomTools;
%nodefaultctor GeomTools;
class GeomTools {
	public:
		%feature("autodoc", "	* A set of Curves from Geom2d. Dumps the surface on the stream.

	:param S:
	:type S: Handle_Geom_Surface &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Dump;
		static void Dump (const Handle_Geom_Surface & S,Standard_OStream & OS);
		%feature("autodoc", "	* Writes the surface on the stream.

	:param S:
	:type S: Handle_Geom_Surface &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Write;
		static void Write (const Handle_Geom_Surface & S,Standard_OStream & OS);
		%feature("autodoc", "	* Reads the surface from the stream.

	:param S:
	:type S: Handle_Geom_Surface &
	:param IS:
	:type IS: Standard_IStream &
	:rtype: void
") Read;
		static void Read (Handle_Geom_Surface & S,Standard_IStream & IS);
		%feature("autodoc", "	* Dumps the Curve on the stream.

	:param C:
	:type C: Handle_Geom_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Dump;
		static void Dump (const Handle_Geom_Curve & C,Standard_OStream & OS);
		%feature("autodoc", "	* Writes the Curve on the stream.

	:param C:
	:type C: Handle_Geom_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Write;
		static void Write (const Handle_Geom_Curve & C,Standard_OStream & OS);
		%feature("autodoc", "	* Reads the Curve from the stream.

	:param C:
	:type C: Handle_Geom_Curve &
	:param IS:
	:type IS: Standard_IStream &
	:rtype: void
") Read;
		static void Read (Handle_Geom_Curve & C,Standard_IStream & IS);
		%feature("autodoc", "	* Dumps the Curve on the stream.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Dump;
		static void Dump (const Handle_Geom2d_Curve & C,Standard_OStream & OS);
		%feature("autodoc", "	* Writes the Curve on the stream.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Write;
		static void Write (const Handle_Geom2d_Curve & C,Standard_OStream & OS);
		%feature("autodoc", "	* Reads the Curve from the stream.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param IS:
	:type IS: Standard_IStream &
	:rtype: void
") Read;
		static void Read (Handle_Geom2d_Curve & C,Standard_IStream & IS);
		%feature("autodoc", "	:param aHandler:
	:type aHandler: Handle_GeomTools_UndefinedTypeHandler &
	:rtype: void
") SetUndefinedTypeHandler;
		static void SetUndefinedTypeHandler (const Handle_GeomTools_UndefinedTypeHandler & aHandler);
		%feature("autodoc", "	:rtype: Handle_GeomTools_UndefinedTypeHandler
") GetUndefinedTypeHandler;
		static Handle_GeomTools_UndefinedTypeHandler GetUndefinedTypeHandler ();
};


%feature("shadow") GeomTools::~GeomTools %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomTools {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomTools_Curve2dSet;
class GeomTools_Curve2dSet {
	public:
		%feature("autodoc", "	* Returns an empty set of Curves.

	:rtype: None
") GeomTools_Curve2dSet;
		 GeomTools_Curve2dSet ();
		%feature("autodoc", "	* Clears the content of the set.

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Incorporate a new Curve in the set and returns its index.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "	* Returns the Curve of index <I>.

	:param I:
	:type I: Standard_Integer
	:rtype: Handle_Geom2d_Curve
") Curve2d;
		Handle_Geom2d_Curve Curve2d (const Standard_Integer I);
		%feature("autodoc", "	* Returns the index of <L>.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: int
") Index;
		Standard_Integer Index (const Handle_Geom2d_Curve & C);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string WriteToString() {
            std::stringstream s;
            self->Write(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadFromString(std::string src) {
            std::stringstream s(src);
            self->Read(s);}
        };
        		%feature("autodoc", "	* Dumps the curve on the stream, if compact is True use the compact format that can be read back.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void
") PrintCurve2d;
		static void PrintCurve2d (const Handle_Geom2d_Curve & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("autodoc", "	* Reads the curve from the stream. The curve is assumed to have been writtent with the Print method (compact = True).

	:param IS:
	:type IS: Standard_IStream &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: Standard_IStream
") ReadCurve2d;
		static Standard_IStream & ReadCurve2d (Standard_IStream & IS,Handle_Geom2d_Curve & C);
		%feature("autodoc", "	:param PR:
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("autodoc", "	:rtype: Handle_Message_ProgressIndicator
") GetProgress;
		Handle_Message_ProgressIndicator GetProgress ();
};


%feature("shadow") GeomTools_Curve2dSet::~GeomTools_Curve2dSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomTools_Curve2dSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomTools_CurveSet;
class GeomTools_CurveSet {
	public:
		%feature("autodoc", "	* Returns an empty set of Curves.

	:rtype: None
") GeomTools_CurveSet;
		 GeomTools_CurveSet ();
		%feature("autodoc", "	* Clears the content of the set.

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Incorporate a new Curve in the set and returns its index.

	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_Geom_Curve & C);
		%feature("autodoc", "	* Returns the Curve of index <I>.

	:param I:
	:type I: Standard_Integer
	:rtype: Handle_Geom_Curve
") Curve;
		Handle_Geom_Curve Curve (const Standard_Integer I);
		%feature("autodoc", "	* Returns the index of <L>.

	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: int
") Index;
		Standard_Integer Index (const Handle_Geom_Curve & C);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string WriteToString() {
            std::stringstream s;
            self->Write(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadFromString(std::string src) {
            std::stringstream s(src);
            self->Read(s);}
        };
        		%feature("autodoc", "	* Dumps the curve on the stream, if compact is True use the compact format that can be read back.

	:param C:
	:type C: Handle_Geom_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void
") PrintCurve;
		static void PrintCurve (const Handle_Geom_Curve & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("autodoc", "	* Reads the curve from the stream. The curve is assumed to have been writtent with the Print method (compact = True).

	:param IS:
	:type IS: Standard_IStream &
	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: Standard_IStream
") ReadCurve;
		static Standard_IStream & ReadCurve (Standard_IStream & IS,Handle_Geom_Curve & C);
		%feature("autodoc", "	:param PR:
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("autodoc", "	:rtype: Handle_Message_ProgressIndicator
") GetProgress;
		Handle_Message_ProgressIndicator GetProgress ();
};


%feature("shadow") GeomTools_CurveSet::~GeomTools_CurveSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomTools_CurveSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomTools_SurfaceSet;
class GeomTools_SurfaceSet {
	public:
		%feature("autodoc", "	* Returns an empty set of Surfaces.

	:rtype: None
") GeomTools_SurfaceSet;
		 GeomTools_SurfaceSet ();
		%feature("autodoc", "	* Clears the content of the set.

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Incorporate a new Surface in the set and returns its index.

	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_Geom_Surface & S);
		%feature("autodoc", "	* Returns the Surface of index <I>.

	:param I:
	:type I: Standard_Integer
	:rtype: Handle_Geom_Surface
") Surface;
		Handle_Geom_Surface Surface (const Standard_Integer I);
		%feature("autodoc", "	* Returns the index of <L>.

	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: int
") Index;
		Standard_Integer Index (const Handle_Geom_Surface & S);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string WriteToString() {
            std::stringstream s;
            self->Write(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadFromString(std::string src) {
            std::stringstream s(src);
            self->Read(s);}
        };
        		%feature("autodoc", "	* Dumps the surface on the stream, if compact is True use the compact format that can be read back.

	:param S:
	:type S: Handle_Geom_Surface &
	:param OS:
	:type OS: Standard_OStream &
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void
") PrintSurface;
		static void PrintSurface (const Handle_Geom_Surface & S,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("autodoc", "	* Reads the surface from the stream. The surface is assumed to have been writtent with the Print method (compact = True).

	:param IS:
	:type IS: Standard_IStream &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: Standard_IStream
") ReadSurface;
		static Standard_IStream & ReadSurface (Standard_IStream & IS,Handle_Geom_Surface & S);
		%feature("autodoc", "	:param PR:
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("autodoc", "	:rtype: Handle_Message_ProgressIndicator
") GetProgress;
		Handle_Message_ProgressIndicator GetProgress ();
};


%feature("shadow") GeomTools_SurfaceSet::~GeomTools_SurfaceSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomTools_SurfaceSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomTools_UndefinedTypeHandler;
class GeomTools_UndefinedTypeHandler : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") GeomTools_UndefinedTypeHandler;
		 GeomTools_UndefinedTypeHandler ();
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void
") PrintCurve;
		virtual void PrintCurve (const Handle_Geom_Curve & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("autodoc", "	:param ctype:
	:type ctype: Standard_Integer
	:param IS:
	:type IS: Standard_IStream &
	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: Standard_IStream
") ReadCurve;
		virtual Standard_IStream & ReadCurve (const Standard_Integer ctype,Standard_IStream & IS,Handle_Geom_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void
") PrintCurve2d;
		virtual void PrintCurve2d (const Handle_Geom2d_Curve & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("autodoc", "	:param ctype:
	:type ctype: Standard_Integer
	:param IS:
	:type IS: Standard_IStream &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: Standard_IStream
") ReadCurve2d;
		virtual Standard_IStream & ReadCurve2d (const Standard_Integer ctype,Standard_IStream & IS,Handle_Geom2d_Curve & C);
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:param OS:
	:type OS: Standard_OStream &
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void
") PrintSurface;
		virtual void PrintSurface (const Handle_Geom_Surface & S,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("autodoc", "	:param ctype:
	:type ctype: Standard_Integer
	:param IS:
	:type IS: Standard_IStream &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: Standard_IStream
") ReadSurface;
		virtual Standard_IStream & ReadSurface (const Standard_Integer ctype,Standard_IStream & IS,Handle_Geom_Surface & S);
};


%feature("shadow") GeomTools_UndefinedTypeHandler::~GeomTools_UndefinedTypeHandler %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomTools_UndefinedTypeHandler {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomTools_UndefinedTypeHandler {
	Handle_GeomTools_UndefinedTypeHandler GetHandle() {
	return *(Handle_GeomTools_UndefinedTypeHandler*) &$self;
	}
};

%nodefaultctor Handle_GeomTools_UndefinedTypeHandler;
class Handle_GeomTools_UndefinedTypeHandler : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GeomTools_UndefinedTypeHandler();
        Handle_GeomTools_UndefinedTypeHandler(const Handle_GeomTools_UndefinedTypeHandler &aHandle);
        Handle_GeomTools_UndefinedTypeHandler(const GeomTools_UndefinedTypeHandler *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomTools_UndefinedTypeHandler DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomTools_UndefinedTypeHandler {
    GeomTools_UndefinedTypeHandler* GetObject() {
    return (GeomTools_UndefinedTypeHandler*)$self->Access();
    }
};
%feature("shadow") Handle_GeomTools_UndefinedTypeHandler::~Handle_GeomTools_UndefinedTypeHandler %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomTools_UndefinedTypeHandler {
    void _kill_pointed() {
        delete $self;
    }
};

