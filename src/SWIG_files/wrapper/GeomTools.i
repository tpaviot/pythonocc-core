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
%module (package="OCC") GeomTools

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


%include GeomTools_headers.i


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

%rename(geomtools) GeomTools;
class GeomTools {
	public:
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* A set of Curves from Geom2d. Dumps the surface on the stream.

	:param S:
	:type S: Handle_Geom_Surface &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Dump;
		static void Dump (const Handle_Geom_Surface & S,Standard_OStream & OS);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Writes the surface on the stream.

	:param S:
	:type S: Handle_Geom_Surface &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Write;
		static void Write (const Handle_Geom_Surface & S,Standard_OStream & OS);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* Reads the surface from the stream.

	:param S:
	:type S: Handle_Geom_Surface &
	:param IS:
	:type IS: Standard_IStream &
	:rtype: void
") Read;
		static void Read (Handle_Geom_Surface & S,Standard_IStream & IS);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dumps the Curve on the stream.

	:param C:
	:type C: Handle_Geom_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Dump;
		static void Dump (const Handle_Geom_Curve & C,Standard_OStream & OS);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Writes the Curve on the stream.

	:param C:
	:type C: Handle_Geom_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Write;
		static void Write (const Handle_Geom_Curve & C,Standard_OStream & OS);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* Reads the Curve from the stream.

	:param C:
	:type C: Handle_Geom_Curve &
	:param IS:
	:type IS: Standard_IStream &
	:rtype: void
") Read;
		static void Read (Handle_Geom_Curve & C,Standard_IStream & IS);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dumps the Curve on the stream.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Dump;
		static void Dump (const Handle_Geom2d_Curve & C,Standard_OStream & OS);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Writes the Curve on the stream.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Write;
		static void Write (const Handle_Geom2d_Curve & C,Standard_OStream & OS);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* Reads the Curve from the stream.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param IS:
	:type IS: Standard_IStream &
	:rtype: void
") Read;
		static void Read (Handle_Geom2d_Curve & C,Standard_IStream & IS);
		%feature("compactdefaultargs") SetUndefinedTypeHandler;
		%feature("autodoc", "	:param aHandler:
	:type aHandler: Handle_GeomTools_UndefinedTypeHandler &
	:rtype: void
") SetUndefinedTypeHandler;
		static void SetUndefinedTypeHandler (const Handle_GeomTools_UndefinedTypeHandler & aHandler);
		%feature("compactdefaultargs") GetUndefinedTypeHandler;
		%feature("autodoc", "	:rtype: Handle_GeomTools_UndefinedTypeHandler
") GetUndefinedTypeHandler;
		static Handle_GeomTools_UndefinedTypeHandler GetUndefinedTypeHandler ();
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "	* Reads the Standard_Real value from the stream. Zero is read in case of error

	:param IS:
	:type IS: Standard_IStream &
	:param theValue:
	:type theValue: float &
	:rtype: void
") GetReal;
		static void GetReal (Standard_IStream & IS,Standard_Real &OutValue);
};


%extend GeomTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomTools_Curve2dSet;
class GeomTools_Curve2dSet {
	public:
		%feature("compactdefaultargs") GeomTools_Curve2dSet;
		%feature("autodoc", "	* Returns an empty set of Curves.

	:rtype: None
") GeomTools_Curve2dSet;
		 GeomTools_Curve2dSet ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the content of the set.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Incorporate a new Curve in the set and returns its index.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_Geom2d_Curve & C);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	* Returns the Curve of index <I>.

	:param I:
	:type I: int
	:rtype: Handle_Geom2d_Curve
") Curve2d;
		Handle_Geom2d_Curve Curve2d (const Standard_Integer I);
		%feature("compactdefaultargs") Index;
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
        		%feature("compactdefaultargs") PrintCurve2d;
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
		%feature("compactdefaultargs") ReadCurve2d;
		%feature("autodoc", "	* Reads the curve from the stream. The curve is assumed to have been writtent with the Print method (compact = True).

	:param IS:
	:type IS: Standard_IStream &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: Standard_IStream
") ReadCurve2d;
		static Standard_IStream & ReadCurve2d (Standard_IStream & IS,Handle_Geom2d_Curve & C);
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "	:param PR:
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "	:rtype: Handle_Message_ProgressIndicator
") GetProgress;
		Handle_Message_ProgressIndicator GetProgress ();
};


%extend GeomTools_Curve2dSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomTools_CurveSet;
class GeomTools_CurveSet {
	public:
		%feature("compactdefaultargs") GeomTools_CurveSet;
		%feature("autodoc", "	* Returns an empty set of Curves.

	:rtype: None
") GeomTools_CurveSet;
		 GeomTools_CurveSet ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the content of the set.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Incorporate a new Curve in the set and returns its index.

	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_Geom_Curve & C);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* Returns the Curve of index <I>.

	:param I:
	:type I: int
	:rtype: Handle_Geom_Curve
") Curve;
		Handle_Geom_Curve Curve (const Standard_Integer I);
		%feature("compactdefaultargs") Index;
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
        		%feature("compactdefaultargs") PrintCurve;
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
		%feature("compactdefaultargs") ReadCurve;
		%feature("autodoc", "	* Reads the curve from the stream. The curve is assumed to have been writtent with the Print method (compact = True).

	:param IS:
	:type IS: Standard_IStream &
	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: Standard_IStream
") ReadCurve;
		static Standard_IStream & ReadCurve (Standard_IStream & IS,Handle_Geom_Curve & C);
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "	:param PR:
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "	:rtype: Handle_Message_ProgressIndicator
") GetProgress;
		Handle_Message_ProgressIndicator GetProgress ();
};


%extend GeomTools_CurveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomTools_SurfaceSet;
class GeomTools_SurfaceSet {
	public:
		%feature("compactdefaultargs") GeomTools_SurfaceSet;
		%feature("autodoc", "	* Returns an empty set of Surfaces.

	:rtype: None
") GeomTools_SurfaceSet;
		 GeomTools_SurfaceSet ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the content of the set.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Incorporate a new Surface in the set and returns its index.

	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* Returns the Surface of index <I>.

	:param I:
	:type I: int
	:rtype: Handle_Geom_Surface
") Surface;
		Handle_Geom_Surface Surface (const Standard_Integer I);
		%feature("compactdefaultargs") Index;
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
        		%feature("compactdefaultargs") PrintSurface;
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
		%feature("compactdefaultargs") ReadSurface;
		%feature("autodoc", "	* Reads the surface from the stream. The surface is assumed to have been writtent with the Print method (compact = True).

	:param IS:
	:type IS: Standard_IStream &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: Standard_IStream
") ReadSurface;
		static Standard_IStream & ReadSurface (Standard_IStream & IS,Handle_Geom_Surface & S);
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "	:param PR:
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "	:rtype: Handle_Message_ProgressIndicator
") GetProgress;
		Handle_Message_ProgressIndicator GetProgress ();
};


%extend GeomTools_SurfaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomTools_UndefinedTypeHandler;
class GeomTools_UndefinedTypeHandler : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") GeomTools_UndefinedTypeHandler;
		%feature("autodoc", "	:rtype: None
") GeomTools_UndefinedTypeHandler;
		 GeomTools_UndefinedTypeHandler ();
		%feature("compactdefaultargs") PrintCurve;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void
") PrintCurve;
		virtual void PrintCurve (const Handle_Geom_Curve & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("compactdefaultargs") ReadCurve;
		%feature("autodoc", "	:param ctype:
	:type ctype: int
	:param IS:
	:type IS: Standard_IStream &
	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: Standard_IStream
") ReadCurve;
		virtual Standard_IStream & ReadCurve (const Standard_Integer ctype,Standard_IStream & IS,Handle_Geom_Curve & C);
		%feature("compactdefaultargs") PrintCurve2d;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param OS:
	:type OS: Standard_OStream &
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void
") PrintCurve2d;
		virtual void PrintCurve2d (const Handle_Geom2d_Curve & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("compactdefaultargs") ReadCurve2d;
		%feature("autodoc", "	:param ctype:
	:type ctype: int
	:param IS:
	:type IS: Standard_IStream &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: Standard_IStream
") ReadCurve2d;
		virtual Standard_IStream & ReadCurve2d (const Standard_Integer ctype,Standard_IStream & IS,Handle_Geom2d_Curve & C);
		%feature("compactdefaultargs") PrintSurface;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:param OS:
	:type OS: Standard_OStream &
	:param compact: default value is Standard_False
	:type compact: bool
	:rtype: void
") PrintSurface;
		virtual void PrintSurface (const Handle_Geom_Surface & S,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("compactdefaultargs") ReadSurface;
		%feature("autodoc", "	:param ctype:
	:type ctype: int
	:param IS:
	:type IS: Standard_IStream &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: Standard_IStream
") ReadSurface;
		virtual Standard_IStream & ReadSurface (const Standard_Integer ctype,Standard_IStream & IS,Handle_Geom_Surface & S);
};


%extend GeomTools_UndefinedTypeHandler {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomTools_UndefinedTypeHandler(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomTools_UndefinedTypeHandler::Handle_GeomTools_UndefinedTypeHandler %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    GeomTools_UndefinedTypeHandler* _get_reference() {
    return (GeomTools_UndefinedTypeHandler*)$self->Access();
    }
};

%extend Handle_GeomTools_UndefinedTypeHandler {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomTools_UndefinedTypeHandler {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
