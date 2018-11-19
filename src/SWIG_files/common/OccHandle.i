/*

Copyright 2018 Martin Siggel (martin.siggel@dlr.de)

This file is part of pythonOCC.

pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

*/

/**
 * This file defined the macro wrap_handle() and make_alias()
 *
 * It should be called on a OpenCASCADE Type that inherits from Standard_Transient
 * i.e. a class the also has a Handle_ class.
 *
 * make_alias is to allow backwards compatibilty and defines a Handle_ alias to
 * the non-handle version of the class.
 *
 * wrap_handle must be called before defining the class.
 * make_alias after the class definition.
 * 
 * Example:
 *
 *    %wrap_handle(MyClass)
 *
 *    class MyClass : public Standard_Transient
 *    {
 *       ....
 *    };
 *
 *    %make_alias(MyClass)
 */

#if !defined(SHARED_PTR_DISOWN)
#define SHARED_PTR_DISOWN 0
#endif

%pythoncode {
    from six import with_metaclass
    import warnings
    from OCC.Wrapper.wrapper_utils import Proxy, deprecated
}

%{
#include <Standard_Transient.hxx>

// The following is an evil hack to edit the reference counter of Standard_Transient
template<typename Tag, typename Tag::type M>
struct Rob { 
  friend typename Tag::type get(Tag) {
    return M;
  }
};

// tag used to access A::count
struct Standard_Transient_f { 
  typedef volatile Standard_Integer Standard_Transient::*type;
  friend type get(Standard_Transient_f);
};

template struct Rob<Standard_Transient_f, &Standard_Transient::count>;

void IncRef(Standard_Transient& a) {
    a.*get(Standard_Transient_f()) += 1;
}

%}

%define WRAP_OCC_TRANSIENT_TYPE(CONST, TYPE)

%naturalvar TYPE;
%naturalvar Handle_ ## TYPE;

%feature("unref") TYPE 
    "(void)arg1; delete smartarg1;"


%typemap(out) CONST TYPE {
  Handle_ ## TYPE *smartresult = new Handle_ ## TYPE(new $1_ltype(($1_ltype &)$1));
  %set_output(SWIG_NewPointerObj(%as_voidptr(smartresult), $descriptor(Handle_ ## TYPE *), SWIG_POINTER_OWN));
}

%typemap(out) CONST TYPE * {
  Handle_ ## TYPE *smartresult = $1 ? new Handle_ ## TYPE($1) : 0;
  %set_output(SWIG_NewPointerObj(%as_voidptr(smartresult), $descriptor(Handle_ ## TYPE *), $owner | SWIG_POINTER_OWN));
}


// plain pointer
// Note: $disown not implemented by default as it will lead to a memory leak of the shared_ptr instance
%typemap(in) CONST TYPE * (void  *argp = 0, int res = 0, Handle_ ## TYPE tempshared, Handle_ ## TYPE *smartarg = 0) {
  int newmem = 0;
  res = SWIG_ConvertPtrAndOwn($input, &argp, $descriptor(Handle_ ## TYPE *), SHARED_PTR_DISOWN | %convertptr_flags, &newmem);
  if (!SWIG_IsOK(res)) {
    %argument_fail(res, "$type", $symname, $argnum); 
  }
  if (newmem & SWIG_CAST_NEW_MEMORY) {
    tempshared = *%reinterpret_cast(argp, Handle_ ## TYPE *);
    delete %reinterpret_cast(argp, Handle_ ## TYPE *);
    $1 = %const_cast(tempshared.operator->(), $1_ltype);
  } else {
    smartarg = %reinterpret_cast(argp, Handle_ ## TYPE *);
    $1 = %const_cast((smartarg ? smartarg->operator->() : 0), $1_ltype);
  }
}

// plain reference
%typemap(in) CONST TYPE & (void  *argp = 0, int res = 0, Handle_ ## TYPE tempshared) {
  int newmem = 0;
  res = SWIG_ConvertPtrAndOwn($input, &argp, $descriptor(Handle_ ## TYPE *), %convertptr_flags, &newmem);
  if (!SWIG_IsOK(res)) {
    %argument_fail(res, "$type", $symname, $argnum); 
  }
  if (!argp) { %argument_nullref("$type", $symname, $argnum); }
  if (newmem & SWIG_CAST_NEW_MEMORY) {
    tempshared = *%reinterpret_cast(argp, Handle_ ## TYPE *);
    delete %reinterpret_cast(argp, Handle_ ## TYPE *);
    $1 = %const_cast(tempshared.operator->(), $1_ltype);
  } else {
    $1 = %const_cast(%reinterpret_cast(argp, Handle_ ## TYPE *)->operator->(), $1_ltype);
  }
}

%typemap(out) Handle_ ## TYPE {
  Handle_ ## TYPE *smartresult = !$1.IsNull() ? new Handle_ ## TYPE($1) : 0;
  %set_output(SWIG_NewPointerObj(%as_voidptr(smartresult), $descriptor(Handle_ ## TYPE *), SWIG_POINTER_OWN));
}

// We return reference to handles as copy to handles as the lifetime
// is different in python than in c++ 
%typemap(out) Handle_ ## TYPE & {
  Handle_ ## TYPE *smartresult = !$1->IsNull() ? new Handle_ ## TYPE(*$1) : 0;
  %set_output(SWIG_NewPointerObj(%as_voidptr(smartresult), $descriptor(Handle_ ## TYPE *), SWIG_POINTER_OWN));
}

%typemap(out) CONST TYPE & {
  Handle_ ## TYPE *smartresult = new Handle_ ## TYPE($1);
  if (!$owner) {
      // he handle may not delete the object since it is owned by another class
      IncRef(*$1);
  }
  %set_output(SWIG_NewPointerObj(%as_voidptr(smartresult), $descriptor(Handle_ ## TYPE *), SWIG_POINTER_OWN));
}

%typemap(in, numinputs = 0) Handle_ ## TYPE& OUTPUT(Handle_ ## TYPE temp){
    $1 = &temp;
}

%typemap(argout) Handle_ ## TYPE& OUTPUT{
    Handle_ ## TYPE *smartresult = !$1->IsNull() ? new Handle_ ## TYPE(*$1) : 0;
    $result = SWIG_Python_AppendOutput($result, SWIG_NewPointerObj(%as_voidptr(smartresult), $descriptor(Handle_ ## TYPE *), SWIG_POINTER_OWN));
}

// Typecheck typemaps
// Note: SWIG_ConvertPtr with void ** parameter set to 0 instead of using SWIG_ConvertPtrAndOwn, so that the casting 
// function is not called thereby avoiding a possible smart pointer copy constructor call when casting up the inheritance chain.
%typemap(typecheck,precedence=SWIG_TYPECHECK_POINTER,noblock=1) 
                      TYPE CONST,
                      TYPE CONST &,
                      TYPE CONST *,
                      TYPE *CONST&,
                      Handle_ ## TYPE,
                      Handle_ ## TYPE &,
                      Handle_ ## TYPE *,
                      Handle_ ## TYPE *& {
  int res = SWIG_ConvertPtr($input, 0, $descriptor(Handle_ ## TYPE *), 0);
  $1 = SWIG_CheckState(res);
}


%enddef

// This is the main macro used from usercode
// Do not call this on a handle class!
%define %wrap_handle(TYPE)
    %nodefaultctor Handle_ ## TYPE;
    // The handle class should be invisible/transparent in python 
    %ignore Handle_ ## TYPE;

    // deactivate warnings
    %ignore Handle_ ## TYPE::operator=; 
    %ignore TYPE::operator=;

    // Tell, that Handle_A is a smart pointer to A
    %feature("smartptr", noblock=1) TYPE { Handle_ ## TYPE }
    
%inline %{
    Handle_ ## TYPE Handle_ ## TYPE ## _Create() {
        return Handle_ ## TYPE();
    }
%}

    #define SWIGEMPTYHACK
    WRAP_OCC_TRANSIENT_TYPE(SWIGEMPTYHACK, TYPE)
    WRAP_OCC_TRANSIENT_TYPE(const, TYPE)

    // Allow to use e.g. Handle_Geom_Curve_DownCast(curve)
    %inline %{
        Handle_ ## TYPE Handle_ ## TYPE ## _DownCast(const Handle_Standard_Transient& t) {
            return Handle_ ## TYPE ## ::DownCast(t);
        }

        bool Handle_ ## TYPE ## _IsNull(const Handle_ ## TYPE & t) {
            return t.IsNull();
        }
    %}
    
    // This two functions are just for backwards compatibilty
    %extend TYPE {
      %pythoncode {
        @deprecated("It is not required anymore.")
        def GetHandle(self):
            return self
    
        @deprecated("It is not required anymore.")
        def GetObject(self):
            return self

        @deprecated("Use is None instead")
        def IsNull(self):
          return Handle_ ## TYPE ## _IsNull(self);

        @staticmethod
        def DownCast(t):
          return Handle_ ## TYPE ## _DownCast(t)
       }
    }


%enddef

%define %make_alias(TYPE)
      %pythoncode {
        class Meta_ ## TYPE(type):
            def __call__(cls, wrap=None):
                if wrap is None:
                    return Handle_ ## TYPE ## _Create()
                else:
                    warnings.warn("class Handle_%s is deprecated. Use %s instead." % ("TYPE", "TYPE"),
                        category=DeprecationWarning,
                        stacklevel=2)
                    warnings.simplefilter('default', DeprecationWarning)
                    return Proxy(wrap)

        class Handle_ ## TYPE(with_metaclass(Meta_ ## TYPE, TYPE)):
            @staticmethod
            def DownCast(o):
                warnings.warn("Handle_%s.DownCast is deprecated. Use %s.DownCast instead." % ("TYPE", "TYPE"),
                    category=DeprecationWarning,
                    stacklevel=2)
                warnings.simplefilter('default', DeprecationWarning)
                return Handle_## TYPE(Handle_ ## TYPE ## _DownCast(o))
      }
%enddef

