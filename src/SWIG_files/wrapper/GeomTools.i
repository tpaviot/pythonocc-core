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
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	OS(Standard_OStream)

Returns:
	static void

A set of Curves from Geom2d.  Dumps the surface on the stream.") Dump;
		static void Dump (const Handle_Geom_Surface & S,Standard_OStream & OS);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	OS(Standard_OStream)

Returns:
	static void

Writes the surface on the stream.") Write;
		static void Write (const Handle_Geom_Surface & S,Standard_OStream & OS);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	IS(Standard_IStream)

Returns:
	static void

Reads the surface from the stream.") Read;
		static void Read (Handle_Geom_Surface & S,Standard_IStream & IS);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	OS(Standard_OStream)

Returns:
	static void

Dumps the Curve on the stream.") Dump;
		static void Dump (const Handle_Geom_Curve & C,Standard_OStream & OS);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	OS(Standard_OStream)

Returns:
	static void

Writes the Curve on the stream.") Write;
		static void Write (const Handle_Geom_Curve & C,Standard_OStream & OS);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	IS(Standard_IStream)

Returns:
	static void

Reads the Curve from the stream.") Read;
		static void Read (Handle_Geom_Curve & C,Standard_IStream & IS);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	OS(Standard_OStream)

Returns:
	static void

Dumps the Curve on the stream.") Dump;
		static void Dump (const Handle_Geom2d_Curve & C,Standard_OStream & OS);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	OS(Standard_OStream)

Returns:
	static void

Writes the Curve on the stream.") Write;
		static void Write (const Handle_Geom2d_Curve & C,Standard_OStream & OS);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	IS(Standard_IStream)

Returns:
	static void

Reads the Curve from the stream.") Read;
		static void Read (Handle_Geom2d_Curve & C,Standard_IStream & IS);
		%feature("autodoc", "Args:
	aHandler(Handle_GeomTools_UndefinedTypeHandler)

Returns:
	static void

No detailed docstring for this function.") SetUndefinedTypeHandler;
		static void SetUndefinedTypeHandler (const Handle_GeomTools_UndefinedTypeHandler & aHandler);
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_GeomTools_UndefinedTypeHandler

No detailed docstring for this function.") GetUndefinedTypeHandler;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns an empty set of Curves.") GeomTools_Curve2dSet;
		 GeomTools_Curve2dSet ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the content of the set.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	Standard_Integer

Incorporate a new Curve in the  set and returns  
         its index.") Add;
		Standard_Integer Add (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

Returns the Curve of index <I>.") Curve2d;
		Handle_Geom2d_Curve Curve2d (const Standard_Integer I);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	Standard_Integer

Returns the index of <L>.") Index;
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
        		%feature("autodoc", "Args:
	IS(Standard_IStream)

Returns:
	None

Reads the content of me from the  stream  <IS>. me  
         is first cleared.") Read;
		void Read (Standard_IStream & IS);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	OS(Standard_OStream)
	compact(Standard_Boolean)=Standard_False

Returns:
	static void

Dumps the curve on the stream,  if compact is True  
         use the compact format that can be read back.") PrintCurve2d;
		static void PrintCurve2d (const Handle_Geom2d_Curve & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("autodoc", "Args:
	IS(Standard_IStream)
	C(Handle_Geom2d_Curve)

Returns:
	static Standard_IStream

Reads the curve  from  the stream.  The  curve  is  
         assumed   to have  been  writtent  with  the Print  
         method (compact = True).") ReadCurve2d;
		static Standard_IStream & ReadCurve2d (Standard_IStream & IS,Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	PR(Handle_Message_ProgressIndicator)

Returns:
	None

No detailed docstring for this function.") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Message_ProgressIndicator

No detailed docstring for this function.") GetProgress;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns an empty set of Curves.") GeomTools_CurveSet;
		 GeomTools_CurveSet ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the content of the set.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	Standard_Integer

Incorporate a new Curve in the  set and returns  
         its index.") Add;
		Standard_Integer Add (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Geom_Curve

Returns the Curve of index <I>.") Curve;
		Handle_Geom_Curve Curve (const Standard_Integer I);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	Standard_Integer

Returns the index of <L>.") Index;
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
        		%feature("autodoc", "Args:
	IS(Standard_IStream)

Returns:
	None

Reads the content of me from the  stream  <IS>. me  
         is first cleared.") Read;
		void Read (Standard_IStream & IS);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	OS(Standard_OStream)
	compact(Standard_Boolean)=Standard_False

Returns:
	static void

Dumps the curve on the stream,  if compact is True  
         use the compact format that can be read back.") PrintCurve;
		static void PrintCurve (const Handle_Geom_Curve & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("autodoc", "Args:
	IS(Standard_IStream)
	C(Handle_Geom_Curve)

Returns:
	static Standard_IStream

Reads the curve  from  the stream.  The  curve  is  
         assumed   to have  been  writtent  with  the Print  
         method (compact = True).") ReadCurve;
		static Standard_IStream & ReadCurve (Standard_IStream & IS,Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	PR(Handle_Message_ProgressIndicator)

Returns:
	None

No detailed docstring for this function.") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Message_ProgressIndicator

No detailed docstring for this function.") GetProgress;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns an empty set of Surfaces.") GeomTools_SurfaceSet;
		 GeomTools_SurfaceSet ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the content of the set.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	Standard_Integer

Incorporate a new Surface in the  set and returns  
         its index.") Add;
		Standard_Integer Add (const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Geom_Surface

Returns the Surface of index <I>.") Surface;
		Handle_Geom_Surface Surface (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	Standard_Integer

Returns the index of <L>.") Index;
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
        		%feature("autodoc", "Args:
	IS(Standard_IStream)

Returns:
	None

Reads the content of me from the  stream  <IS>. me  
         is first cleared.") Read;
		void Read (Standard_IStream & IS);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	OS(Standard_OStream)
	compact(Standard_Boolean)=Standard_False

Returns:
	static void

Dumps the surface on the stream,  if compact is True  
         use the compact format that can be read back.") PrintSurface;
		static void PrintSurface (const Handle_Geom_Surface & S,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("autodoc", "Args:
	IS(Standard_IStream)
	S(Handle_Geom_Surface)

Returns:
	static Standard_IStream

Reads the surface  from  the stream.  The  surface  is  
         assumed   to have  been  writtent  with  the Print  
         method (compact = True).") ReadSurface;
		static Standard_IStream & ReadSurface (Standard_IStream & IS,Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	PR(Handle_Message_ProgressIndicator)

Returns:
	None

No detailed docstring for this function.") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Message_ProgressIndicator

No detailed docstring for this function.") GetProgress;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GeomTools_UndefinedTypeHandler;
		 GeomTools_UndefinedTypeHandler ();
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	OS(Standard_OStream)
	compact(Standard_Boolean)=Standard_False

Returns:
	virtual void

No detailed docstring for this function.") PrintCurve;
		virtual void PrintCurve (const Handle_Geom_Curve & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("autodoc", "Args:
	ctype(Standard_Integer)
	IS(Standard_IStream)
	C(Handle_Geom_Curve)

Returns:
	virtual Standard_IStream

No detailed docstring for this function.") ReadCurve;
		virtual Standard_IStream & ReadCurve (const Standard_Integer ctype,Standard_IStream & IS,Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	OS(Standard_OStream)
	compact(Standard_Boolean)=Standard_False

Returns:
	virtual void

No detailed docstring for this function.") PrintCurve2d;
		virtual void PrintCurve2d (const Handle_Geom2d_Curve & C,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("autodoc", "Args:
	ctype(Standard_Integer)
	IS(Standard_IStream)
	C(Handle_Geom2d_Curve)

Returns:
	virtual Standard_IStream

No detailed docstring for this function.") ReadCurve2d;
		virtual Standard_IStream & ReadCurve2d (const Standard_Integer ctype,Standard_IStream & IS,Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	OS(Standard_OStream)
	compact(Standard_Boolean)=Standard_False

Returns:
	virtual void

No detailed docstring for this function.") PrintSurface;
		virtual void PrintSurface (const Handle_Geom_Surface & S,Standard_OStream & OS,const Standard_Boolean compact = Standard_False);
		%feature("autodoc", "Args:
	ctype(Standard_Integer)
	IS(Standard_IStream)
	S(Handle_Geom_Surface)

Returns:
	virtual Standard_IStream

No detailed docstring for this function.") ReadSurface;
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

