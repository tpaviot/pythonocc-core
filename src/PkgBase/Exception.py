##Copyright 2020 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU Lesser General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

__doc__ = """
handler for excluded classes and methods

Example of use
@methodnotwrapped
def foo(*kargs):
    pass

@classnotwrapped
class A:
    pass

This module is part of the OCC.Core package:
from OCC.Core.Exception import *
"""

import warnings
import functools


class MethodNotWrappedError(BaseException):
    pass


class ClassNotWrappedError(BaseException):
    pass


def methodnotwrapped(func):
    def function_wrapper(*x):
        raise MethodNotWrappedError(f"{func.__name__} not wrapped")

    return function_wrapper


def classnotwrapped(klass):
    class NewCls:
        def __init__(self, *args, **kwargs):
            raise ClassNotWrappedError(f"{klass.__name__} not wrapped")

    return NewCls


def deprecated(func):
    """This is a decorator which can be used to mark functions
    as deprecated. It will result in a warning being emitted
    when the function is used."""

    @functools.wraps(func)
    def new_func(*args, **kwargs):
        warnings.simplefilter("always", DeprecationWarning)  # turn off filter
        function_name = func.__name__
        function_name_to_use = ".".join(function_name.rsplit("_", 1))
        warnings.warn(
            f"Call to deprecated function {function_name} since pythonocc-core 7.7.1. This function will be removed in a future release, please rather use the static method {function_name_to_use}",
            category=DeprecationWarning,
            stacklevel=2,
        )
        warnings.simplefilter("default", DeprecationWarning)  # reset filter
        return func(*args, **kwargs)

    return new_func
