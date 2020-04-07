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

class MethodNotWrappedError(BaseException):
    pass

class ClassNotWrappedError(BaseException):
    pass

def methodnotwrapped(func):
    def function_wrapper(*x):
        raise MethodNotWrappedError('%s not wrapped' % func.__name__)
    return function_wrapper

def classnotwrapped(klass):
    class NewCls(object):
        def __init__(self,*args,**kwargs):
            raise ClassNotWrappedError('%s not wrapped' % klass.__name__)
    return NewCls
