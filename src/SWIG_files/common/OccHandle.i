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
 * This file defines the macro wrap_handle() and make_alias()
 *
 * It should be called on an OpenCASCADE Type that inherits from Standard_Transient
 * i.e. a class that also has a Handle_ class.
 *
 * make_alias is to allow backwards compatibility and defines a Handle_ alias to
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
    import warnings
    from OCC.Wrapper.wrapper_utils import Proxy, deprecated
}

namespace opencascade {
template <typename T> class handle{};
}
#define Handle(TYPE) opencascade::handle<TYPE>

#define DEFINE_STANDARD_HANDLE(C1,C2)

// global counter for dbug (enabled using DEBUG_MEMORY flag)
#ifdef DEBUG_MEMORY
%inline %{
    static int handle_creation_count = 0;
    static int handle_deletion_count = 0;

    void reset_handle_counters() {
        handle_creation_count = 0;
        handle_deletion_count = 0;
    }

    void print_handle_stats() {
        printf("Handles created: %d, deleted: %d, delta: %d\n",
               handle_creation_count, handle_deletion_count,
               handle_creation_count - handle_deletion_count);
    }
%}
#endif

%define WRAP_OCC_TRANSIENT(CONST, TYPE)

%typemap(out) opencascade::handle<TYPE> {
  TYPE * presult = nullptr;
  if (!$1.IsNull()) {
    presult = $1.get();
    if (presult) {
      presult->IncrementRefCounter();
#ifdef DEBUG_MEMORY
      handle_creation_count++;
#endif
    }
  }
  PyObject * obj = SWIG_NewPointerObj(%as_voidptr(presult), $descriptor(TYPE *), SWIG_POINTER_OWN);
  if (!obj && presult) {
    presult->DecrementRefCounter();
    SWIG_fail;
  }
  %set_output(obj);
}

%typemap(out) Handle_ ## TYPE {
  TYPE * presult = nullptr;
  if (!$1.IsNull()) {
    presult = $1.get();
    if (presult) {
      presult->IncrementRefCounter();
#ifdef DEBUG_MEMORY
      handle_creation_count++;
#endif
    }
  }
  PyObject * obj = SWIG_NewPointerObj(%as_voidptr(presult), $descriptor(TYPE *), SWIG_POINTER_OWN);
  if (!obj && presult) {
    presult->DecrementRefCounter();
    SWIG_fail;
  }
  %set_output(obj);
}

// avoid useless copy for const objects
%typemap(out) CONST TYPE {
  TYPE * presult = new TYPE(const_cast< CONST TYPE& >($1));
  if (presult) {
      presult->IncrementRefCounter();
#ifdef DEBUG_MEMORY
      handle_creation_count++;
#endif
    }
    PyObject * obj = SWIG_NewPointerObj(%as_voidptr(presult), $descriptor(TYPE *), SWIG_POINTER_OWN);
    if (!obj && presult) {
      presult->DecrementRefCounter();
      SWIG_fail;
    }
    %set_output(obj);
}


%typemap(out) CONST opencascade::handle<TYPE>& {
  TYPE * presult = nullptr;
  if ($1 && !$1->IsNull()) {
    presult = $1->get();
    if (presult) {
      presult->IncrementRefCounter();
#ifdef DEBUG_MEMORY
      handle_creation_count++;
#endif
    }
  }
  PyObject * obj = SWIG_NewPointerObj(%as_voidptr(presult), $descriptor(TYPE *), SWIG_POINTER_OWN);
  if (!obj && presult) {
    presult->DecrementRefCounter();
    SWIG_fail;
  }
  %set_output(obj);
}

%typemap(out) CONST Handle_ ## TYPE& {
  TYPE * presult = nullptr;
  if ($1 && !$1->IsNull()) {
    presult = $1->get();
    if (presult) {
      presult->IncrementRefCounter();
#ifdef DEBUG_MEMORY
      handle_creation_count++;
#endif
    }
  }
  PyObject * obj = SWIG_NewPointerObj(%as_voidptr(presult), $descriptor(TYPE *), SWIG_POINTER_OWN);
  if (!obj && presult) {
    presult->DecrementRefCounter();
    SWIG_fail;
  }
  %set_output(obj);
}

%typemap(out) CONST TYPE&, CONST TYPE* {
  if ($1) {
    // check that object is not on the stack
    $1->IncrementRefCounter();
#ifdef DEBUG_MEMORY
    handle_creation_count++;
#endif
  }
  PyObject * obj = SWIG_NewPointerObj(%as_voidptr($1), $descriptor(TYPE *), SWIG_POINTER_OWN);
  if (!obj && $1) {
    $1->DecrementRefCounter();
    SWIG_fail;
  }
  %set_output(obj);
}

%typemap(in) opencascade::handle<TYPE> (void *argp, int res = 0) {
  int newmem = 0;
  res = SWIG_ConvertPtrAndOwn($input, &argp, $descriptor(TYPE *), %convertptr_flags, &newmem);
  if (!SWIG_IsOK(res)) {
    %argument_fail(res, "$type", $symname, $argnum);
  }
  if (argp) {
    $1 = opencascade::handle< TYPE >(%reinterpret_cast(argp, TYPE*));
  } else {
    $1 = opencascade::handle< TYPE >();  // explicit null Handle
  }
}

// shared_ptr by reference
%typemap(in) opencascade::handle<TYPE> &(void *argp, int res = 0, $*1_ltype tempshared) {
  int newmem = 0;
  res = SWIG_ConvertPtrAndOwn($input, &argp, $descriptor(TYPE *), %convertptr_flags, &newmem);
  if (!SWIG_IsOK(res)) {
    %argument_fail(res, "$type", $symname, $argnum);
  }
  if (argp) {
    TYPE* typed_ptr = %reinterpret_cast(argp, TYPE*);
    if (typed_ptr) {
      tempshared = opencascade::handle< TYPE >(typed_ptr);
    }
  }
  $1 = &tempshared;
}

// shared_ptr by reference
%typemap(in) Handle_ ## TYPE &(void *argp, int res = 0, $*1_ltype tempshared) {
  int newmem = 0;
  res = SWIG_ConvertPtrAndOwn($input, &argp, $descriptor(TYPE *), %convertptr_flags, &newmem);
  if (!SWIG_IsOK(res)) {
    %argument_fail(res, "$type", $symname, $argnum);
  }

  if (argp) {
    TYPE* typed_ptr = %reinterpret_cast(argp, TYPE*);
    if (typed_ptr) {
      tempshared = opencascade::handle< TYPE >(typed_ptr);
    }
  }
  $1 = &tempshared;
}

// HANDLE REFERENCE PARAMETER HANDLING
// ====================================
// These typemaps handle the special case where OpenCASCADE functions take
// handle<T>& parameters that they modify in-place. In C++, these modifications
// affect the passed handle directly, but in Python we need to return the
// modified handle as a return value.
//
// Example C++ function:
//   void GeomLib::ExtendCurveToPoint(opencascade::handle<Geom_BoundedCurve>& Curve, ...)
//
// Desired Python interface:
//   modified_curve = GeomLib_ExtendCurveToPoint(original_curve, ...)

// CONST REFERENCE TYPEMAP - Do nothing for const references
// ----------------------------------------------------------
// Const references cannot be modified by the function, so we don't need
// to return them. This empty typemap ensures that const handle<T>& parameters
// are treated as input-only parameters.
// This typemap has higher priority than the non-const version below.
%typemap(argout) const opencascade::handle<TYPE> & {
  // Intentionally empty - const references are read-only parameters
  // Example: GeomAPI_Interpolate(const handle<TColgp_HArray1OfPnt>& Points, ...)
  //          The Points parameter is input-only and won't be returned
}

// NON-CONST REFERENCE TYPEMAP - Return the modified handle
// ---------------------------------------------------------
// Non-const references can be modified by the function. This typemap
// extracts the modified handle and returns it to Python, replacing
// the default void return value.
%typemap(argout) opencascade::handle<TYPE> & {
  TYPE * presult = nullptr;

  // Check if the handle is valid (not null)
  if ($1 && !$1->IsNull()) {
    // Extract the raw pointer from the handle using get()
    // CRITICAL: We must use get() to retrieve the managed object pointer,
    // not &$1 which would give us the address of the handle itself
    presult = $1->get();

    if (presult) {
      // Increment reference counter to prevent the object from being
      // deleted when the C++ handle goes out of scope
      // This ensures Python owns a valid reference to the object
      presult->IncrementRefCounter();

#ifdef DEBUG_MEMORY
      // Track handle creation for memory debugging
      handle_creation_count++;
#endif
    }
  }

  // Replace the default void return value with our handle
  // Py_XDECREF safely decrements the reference count of the old result (if any)
  Py_XDECREF($result);

  // Create a new Python object wrapping the modified handle
  // SWIGTYPE_p_##TYPE is the SWIG type descriptor for this specific type
  // SWIG_POINTER_OWN tells SWIG that Python owns this object and should
  // decrement its reference count when the Python object is garbage collected
  $result = SWIG_NewPointerObj(SWIG_as_voidptr(presult), SWIGTYPE_p_ ## TYPE, SWIG_POINTER_OWN);
}

// Note: Similar typemaps should be added for Handle_TYPE & syntax if needed
// for backward compatibility with older OpenCASCADE code

%typemap(typecheck,precedence=SWIG_TYPECHECK_POINTER,noblock=1)
                      TYPE CONST,
                      TYPE CONST &,
                      TYPE CONST *,
                      TYPE *CONST&,
                      CONST opencascade::handle<TYPE>,
                      CONST opencascade::handle<TYPE> &,
                      CONST opencascade::handle<TYPE> *,
                      CONST opencascade::handle<TYPE> *& {
  void *ptr = 0;
  int res = SWIG_ConvertPtr($input, &ptr, $descriptor(TYPE *), 0);
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
  inline Handle_## TYPE(const T2* theOther) : opencascade::handle< TYPE >(theOther) {}
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

%feature("unref") TYPE %{
  if($this) {
#ifdef DEBUG_MEMORY
    handle_deletion_count++;
#endif
    if($this->DecrementRefCounter() == 0) {
      $this->Delete();
    }
  }
%}

%inline %{
    opencascade::handle<TYPE> Handle_ ## TYPE ## _Create() {
        return opencascade::handle<TYPE>();
    }

    opencascade::handle<TYPE> Handle_ ## TYPE ## _DownCast(const opencascade::handle<Standard_Transient>& t) {
        if (t.IsNull()) {
            return opencascade::handle<TYPE>();
        }

        opencascade::handle<TYPE> downcasted_handle = opencascade::handle<TYPE>::DownCast(t);
        if (downcasted_handle.IsNull()) {
            // Plus d'information dans l'erreur
            PyErr_Format(PyExc_TypeError,
                        "Failed to downcast %s to %s",
                        t->DynamicType()->Name(),
                        #TYPE);
            return opencascade::handle<TYPE>();
        }
        return downcasted_handle;
    }

    bool Handle_ ## TYPE ## _IsNull(const opencascade::handle<TYPE> & t) {
        return t.IsNull();
    }

    void Handle_ ## TYPE ## _ForceRelease(opencascade::handle<TYPE> & t) {
        t.Nullify();
    }

    int Handle_ ## TYPE ## _GetRefCount(const opencascade::handle<TYPE> & t) {
        if (t.IsNull()) return 0;
        return t->GetRefCount();
    }
%}

// These two functions are just for backwards compatibility
%extend TYPE {
  %pythoncode {

    @staticmethod
    def DownCast(t):
      return Handle_ ## TYPE ## _DownCast(t)
   }
}

%enddef

%define %make_alias(TYPE)
using Handle_ ## TYPE = opencascade::handle<TYPE>;
%enddef
