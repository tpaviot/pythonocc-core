# https://stackoverflow.com/questions/18860816/technique-for-using-stdifstream-stdofstream-in-python-via-swig

%fragment("iostream_header", "header") %{
#include <stdio.h>
#include <memory.h>
#include <boost/iostreams/stream.hpp>
#include <boost/iostreams/device/file_descriptor.hpp>
using boost_ofd_stream = boost::iostreams::stream<boost::iostreams::file_descriptor_sink>;
using boost_ifd_stream = boost::iostreams::stream<boost::iostreams::file_descriptor_source>;
%}  

%typemap(in, fragment="iostream_header") std::ostream& (std::unique_ptr<boost_ofd_stream> stream) {
    PyObject *flush_result = PyObject_CallMethod($input, const_cast<char*>("flush"), nullptr);
    if (flush_result) Py_DECREF(flush_result);
%#if PY_VERSION_HEX < 0x03000000
    int fd = fileno(PyFile_AsFile($input));
%#else
    int fd = PyObject_AsFileDescriptor($input);
%#endif
    if (fd < 0) { SWIG_Error(SWIG_TypeError, "File object expected."); SWIG_fail; }
    stream = std::make_unique<boost_ofd_stream>(fd, boost::iostreams::never_close_handle);
    $1 = stream.get();
}   

%typemap(in, fragment="iostream_header") std::istream& (std::unique_ptr<boost_ifd_stream> stream) {
%#if PY_VERSION_HEX < 0x03000000
    int fd = fileno(PyFile_AsFile($input));
%#else
    int fd = PyObject_AsFileDescriptor($input);
%#endif
    if (fd < 0) { SWIG_Error(SWIG_TypeError, "File object expected.");  SWIG_fail; }
    stream = std::make_unique<boost_ifd_stream>(fd, boost::iostreams::never_close_handle);
    $1 = stream.get();
}   
