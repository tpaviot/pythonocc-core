##Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)
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

import warnings
warnings.warn("Deprecation Warning: do not use the GarbageCollector anymore, it is unneeded.")


class GarbageCollector(object):
    """ DEPRECATED. Garbage collector for OCC objects
    """
    def __init__(self):
        pass

    def prevent_object(self, obj):
        ''' DEPRECATED. Prevent an object from being deleted. This object is temporary
        stored in a list to increase its refecount.
        '''
        pass

    def push_context(self):
        ''' DEPRECATED. Create a new context. When the push context method is called,
        objects are collected in this new context. When the context is popped,
        erase the content of the context.
        '''
        pass

    def pop_context(self):
        pass

    def collect_object(self, obj_deleted):
        ''' DEPRECATED. This method is called whenever a pythonOCC instance is deleted.'''
        pass

    def smart_purge(self):
        # DEPRECATED.
        pass

garbage = GarbageCollector()
