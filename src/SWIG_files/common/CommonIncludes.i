/*

Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)

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

%include typemaps.i
%include cmalloc.i
%include cpointer.i
%include carrays.i
%include exception.i
#if defined(SWIGPYTHON)
%include <python/std_string.i>
#endif
#if defined(SWIGJAVA)
%include <java/std_string.i>
#endif
#if defined(SWIGCSHARP)
%include <csharp/std_string.i>
#endif

