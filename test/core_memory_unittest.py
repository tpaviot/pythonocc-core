#!/usr/bin/env python

##Copyright 2009-2013 Thomas Paviot (tpaviot@gmail.com)
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

import unittest
import sys

from OCC.Standard import Standard_Transient, Handle_Standard_Transient
from OCC.gp import gp_Pnt
from OCC import GarbageCollector

#GarbageCollector.set_debug()


class TestMemory(unittest.TestCase):
    ''' Testing OC memory management
    '''
    def testReferenceCounting(self):
        s1 = Standard_Transient()
        number_of_references_to_s1 = sys.getrefcount(s1)-1
        # Check that ref is incremented
        s2 = s1
        number_of_references_to_s1 = sys.getrefcount(s1)-1
        self.assertEqual(number_of_references_to_s1, 2)
        # Check that ref is decremented after s2 is deleted
        del s2
        number_of_references_to_s1 = sys.getrefcount(s1)-1
        self.assertEqual(number_of_references_to_s1, 1)

    def testNullifyHandle(self):
        s = Standard_Transient()
        self.assertEqual(s.GetRefCount(), 0)
        # create an hanle from this transient. RefCount is incremented
        h = s.GetHandle()
        self.assertEqual(h.IsNull(), False)
        self.assertEqual(s.GetRefCount(), 1)
        # if this handle is nullified, refcount is decremented
        h.Nullify()
        self.assertEqual(h.IsNull(), True)
        self.assertEqual(s.GetRefCount(), 0)

    def testPurgeMemory(self):
        # Check that after the smart_purge, list of collected objects ar empty
        GarbageCollector.garbage.smart_purge()
        self.assertEqual(len(GarbageCollector.garbage._handles), 0)
        # TODO : following line does work
        # self.assertEqual(len(GarbageCollector.garbage._transients), 0)
        self.assertEqual(len(GarbageCollector.garbage._misc), 0)

    def testCollector(self):
        GarbageCollector.garbage.smart_purge()
        # Check that pythonOCC objects are collected in the correct garbage
        s = Standard_Transient()
        h = Handle_Standard_Transient()
        P = gp_Pnt(1, 2, 3)
        del s
        del h
        del P
        self.assertEqual(len(GarbageCollector.garbage._handles), 1)
        self.assertEqual(len(GarbageCollector.garbage._transients), 1)
        self.assertEqual(len(GarbageCollector.garbage._misc), 1)

    def testGC(self):
        GarbageCollector.garbage.smart_purge()
        h = Handle_Standard_Transient()
        h2 = h  # adds a reference
        del h
        # this object is not collected since there is another reference to it
        self.assertEqual(len(GarbageCollector.garbage._handles), 0)
        del h2
        # now, the handle should be collected
        self.assertEqual(len(GarbageCollector.garbage._handles), 1)

    # TODO : this one does work
    # def testTransients(self):
    #     GarbageCollector.garbage.smart_purge()
    #     s = Standard_Transient()
    #     h = s.GetHandle()  # refcount of s is incremented
    #     del s
    #     # s has been collected
    #     self.assertEqual(len(GarbageCollector.garbage._transients), 1)
    #     # if the memory is purged, s should not be deleted since
    #     # an handle still refers to it
    #     GarbageCollector.garbage.smart_purge()
    #     self.assertEqual(len(GarbageCollector.garbage._transients), 1)
    #     # then we delete the handle
    #     del h
    #     self.assertEqual(len(GarbageCollector.garbage._handles), 1)
    #     self.assertEqual(len(GarbageCollector.garbage._transients), 1)
    #     # and repurge the garbage
    #     GarbageCollector.garbage.smart_purge()
    #     self.assertEqual(len(GarbageCollector.garbage._handles), 0)
    #     self.assertEqual(len(GarbageCollector.garbage._transients), 0)


def suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(TestMemory))
    return suite

if __name__ == "__main__":
    unittest.main()
