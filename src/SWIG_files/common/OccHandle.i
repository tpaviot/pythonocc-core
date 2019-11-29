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

%pythoncode {
    from six import with_metaclass
    import warnings
    from OCC.Wrapper.wrapper_utils import Proxy, deprecated
}

namespace opencascade {
template <typename T> class handle{};
}
#define Handle(TYPE) opencascade::handle<TYPE>

#define DEFINE_STANDARD_HANDLE(C1,C2)

%define WRAP_OCC_TRANSIENT(CONST, TYPE)


%typemap(out) opencascade::handle<TYPE> {
  TYPE * presult = !$1.IsNull() ? $1.get() : 0;
  if (presult) presult->IncrementRefCounter();
  %set_output(SWIG_NewPointerObj(%as_voidptr(presult), $descriptor(TYPE *), SWIG_POINTER_OWN));
}

%typemap(out) Handle_ ## TYPE {
  TYPE * presult = !$1.IsNull() ? $1.get() : 0;
  if (presult) presult->IncrementRefCounter();
  %set_output(SWIG_NewPointerObj(%as_voidptr(presult), $descriptor(TYPE *), SWIG_POINTER_OWN));
}
%typemap(out) CONST TYPE {
  TYPE * presult = new TYPE(static_cast< CONST TYPE& >($1));
  presult->IncrementRefCounter();
  %set_output(SWIG_NewPointerObj(%as_voidptr(presult), $descriptor(TYPE *), SWIG_POINTER_OWN));
}

%typemap(out) CONST opencascade::handle<TYPE>&{
  TYPE * presult = !$1->IsNull() ? $1->get() : 0;
  if (presult) presult->IncrementRefCounter();
  %set_output(SWIG_NewPointerObj(%as_voidptr(presult), $descriptor(TYPE *), SWIG_POINTER_OWN));
}


%typemap(out) CONST Handle_ ## TYPE&{
  TYPE * presult = !$1->IsNull() ? $1->get() : 0;
  if (presult) presult->IncrementRefCounter();
  %set_output(SWIG_NewPointerObj(%as_voidptr(presult), $descriptor(TYPE *), SWIG_POINTER_OWN));
}

%typemap(out) CONST TYPE&, CONST TYPE* {
  if ($1) $1->IncrementRefCounter();
  %set_output(SWIG_NewPointerObj(%as_voidptr($1), $descriptor(TYPE *), SWIG_POINTER_OWN));
}

%typemap(in) opencascade::handle< TYPE > (void *argp, int res = 0) {
  int newmem = 0;
  res = SWIG_ConvertPtrAndOwn($input, &argp, $descriptor(TYPE *), %convertptr_flags, &newmem);
  if (!SWIG_IsOK(res)) {
    %argument_fail(res, "$type", $symname, $argnum);
  }
  if (argp) $1 = opencascade::handle< TYPE >(%reinterpret_cast(argp, TYPE*));
}


// shared_ptr by reference
%typemap(in) opencascade::handle<TYPE> &(void *argp, int res = 0, $*1_ltype tempshared) {
  int newmem = 0;
  res = SWIG_ConvertPtrAndOwn($input, &argp, $descriptor(TYPE *), %convertptr_flags, &newmem);
  if (!SWIG_IsOK(res)) {
    %argument_fail(res, "$type", $symname, $argnum);
  }

  if (argp) tempshared = opencascade::handle< TYPE >(%reinterpret_cast(argp, TYPE*));
  $1 = &tempshared;
}

// shared_ptr by reference
%typemap(in) Handle_ ## TYPE &(void *argp, int res = 0, $*1_ltype tempshared) {
  int newmem = 0;
  res = SWIG_ConvertPtrAndOwn($input, &argp, $descriptor(TYPE *), %convertptr_flags, &newmem);
  if (!SWIG_IsOK(res)) {
    %argument_fail(res, "$type", $symname, $argnum);
  }

  if (argp) tempshared = opencascade::handle< TYPE >(%reinterpret_cast(argp, TYPE*));
  $1 = &tempshared;
}

%typemap(typecheck,precedence=SWIG_TYPECHECK_POINTER,noblock=1)
                      TYPE CONST,
                      TYPE CONST &,
                      TYPE CONST *,
                      TYPE *CONST&,
                      CONST opencascade::handle<TYPE>,
                      CONST opencascade::handle<TYPE> &,
                      CONST opencascade::handle<TYPE> *,
                      CONST opencascade::handle<TYPE> *& {
  int res = SWIG_ConvertPtr($input, 0, $descriptor(TYPE *), 0);
  $1 = SWIG_CheckState(res);
}

%enddef

%define %wrap_handle(TYPE)

class TYPE;

// Avoid creating ValueWrappers
%template() opencascade::handle<TYPE>;

#if (defined(_MSC_VER) && _MSC_VER >= 1800)
class Handle_ ## TYPE : public opencascade::handle< TYPE >{
public:
  template <typename T2>
  inline Handle_## TYPE(const T2* theOther) : Handle(TYPE)(theOther) {} \
};
#else
typedef opencascade::handle< TYPE > Handle_ ## TYPE;
#endif

// deactivate warnings
%ignore TYPE::operator=;
%ignore opencascade::handle< TYPE >;
%ignore Handle_ ## TYPE;

#define SWIGEMPTYHACK
WRAP_OCC_TRANSIENT(SWIGEMPTYHACK, TYPE)
WRAP_OCC_TRANSIENT(const, TYPE)

%feature("unref") TYPE "if($this && $this->DecrementRefCounter()==0) delete $this;"

%inline %{
    opencascade::handle<TYPE> Handle_ ## TYPE ## _Create() {
        return opencascade::handle<TYPE>();
    }

    opencascade::handle<TYPE>  Handle_ ## TYPE ## _DownCast(const opencascade::handle<Standard_Transient>& t) {
        return opencascade::handle<TYPE>::DownCast(t);
    }

    bool Handle_ ## TYPE ## _IsNull(const opencascade::handle<TYPE> & t) {
        return t.IsNull();
    }
%}

// This two functions are just for backwards compatibilty
%extend TYPE {
  %pythoncode {

    @staticmethod
    def DownCast(t):
      return Handle_ ## TYPE ## _DownCast(t)
   }
}

%enddef


%define %make_alias(TYPE)

%enddef

