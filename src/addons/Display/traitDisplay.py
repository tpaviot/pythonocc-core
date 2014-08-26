#!/usr/bin/env python

##Copyright 2008-2013 Thomas Paviot (tpaviot@gmail.com)
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

# Draft implementation of a custom editor for Enthought Traits GUI,
# simply assign the editor to a Traited list of Topo_DS shapes and off you go.


from itertools import izip
import os

import OCCViewer
from qtDisplay import qtViewer3d

try:
    if os.environ["ETS_TOOLKIT"] == "wx":
        print "ETS_TOOLKIT variable has been set to wx, though this module \
        explicitly uses the Qt backed setting the backend to Qt4..."
except KeyError:
    pass

os.environ["ETS_TOOLKIT"] = "qt4"
try:
    from pyface.qt import QtGui
except ImportError:
    raise ImportError('pyface package required but not found. Please visit https://pypi.python.org/pypi/pyface')
try:
    from traits.api import HasTraits, Any, Button, List, Instance, Str, Bool

except ImportError:
    raise ImportError('Enthought traits package required but not found.')

try:
    from traitsui.api import EditorFactory, Editor
except ImportError:
    raise ImportError('traitsui required but not found.')


class TraitOCCViewer3d(OCCViewer.Viewer3d):
    '''
    Custom OCCViewer that keeps a map of its Shapes -> AIS_Shapes
    '''
    def __init__(self, *args, **kwargs):
        OCCViewer.Viewer3d.__init__(self, *args, **kwargs)
        self.ShapeMap = {}

    def DisplayShape(self, shapes, **kwargs):
        if isinstance(shapes, (list, tuple)):
            ais_shapes = OCCViewer.Viewer3d.DisplayShape(self, shapes, **kwargs)
            for s, ais in izip(shapes, ais_shapes):
                self.ShapeMap[s] = ais
        else:
            ais = OCCViewer.Viewer3d.DisplayShape(self, shapes, **kwargs)
            self.ShapeMap[shapes] = ais

    def EraseShape(self, shape):
        if shape not in self.ShapeMap:
            raise Exception("shape not in shapemap")
        self.Context.Erase(self.ShapeMap[shape])
        del self.ShapeMap[shape]


class OCCTraitViewer(qtViewer3d):
    def __init__(self, editor=None, selection=None, **kwargs):
        super(OCCTraitViewer, self).__init__(**kwargs)
        self.editor = editor

        self._initialized = False
        self.setSizePolicy(QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Expanding));
        self.setMinimumHeight(100)
        self.setMinimumWidth(150)

    def paintEvent(self, event):
        # Display can only be initialized when window is shown.
        # Showing windows etc is all magically done by traits
        # Initializing on the first paint event.
        # (resizeEvent and showEvent are too early)
        if not self._initialized:
            self.InitDriver()
            self._initialized = True
            self.editor.initialized = True
        super(OCCTraitViewer, self).paintEvent(event)

    def InitDriver(self):
        #need to override this to set custom Viewer
        self._display = TraitOCCViewer3d(self.GetHandle())
        self._display.Create()
        self._display.DisplayTriedron()
        self._display.SetModeShaded()
        self._inited = True
        # dict mapping keys to functions
        self._SetupKeyMap()

    def mouseReleaseEvent(self, event):
        super(OCCTraitViewer, self).mouseReleaseEvent(event)
        if len(self.editor.selection) < 1:
            self.editor.selection.append(self._display.selected_shape)
        else:
            self.editor.selection[0] = self._display.selected_shape


class OCCEditor(Editor):
    shapes = List(Any)
    selection = List(Any)
    display = Instance(OCCViewer)
    initialized = Bool

    def init(self, parent):
        self.control = OCCTraitViewer(self, self.selection)
        self.sync_value(self.name, 'shapes', 'both', is_list=True)
        if self.factory.selection:
            self.sync_value(self.factory.selection, 'selection', 'both', is_list=True)
        if self.factory.display:
            self.sync_value(self.factory.display, 'display', 'both')

    def set_size_policy(self, *args, **kwargs):
        """
        no idea what it does, but is called...
        i guess should give some hints...

        :param args:
        :param kwargs:
        """
        pass

    def _shapes_changed(self, name, nothing, change):
        '''update shapes when list is replaced'''
        self.control._display.EraseAll()
        for s in change:
            self.control._display.DisplayShape(s)
        self.control._display.FitAll()

    def _shapes_items_changed(self, name, nothing, change):
        '''update display when the list is modified'''
        for s in change.added:
            self.control._display.DisplayShape(s)
        for s in change.removed:
            self.control._display.EraseShape(s)
        self.control._display.FitAll()


class ToolkitEditorFactory(EditorFactory):
    selection = Str
    display = Str

    def _get_simple_editor_class(self):
        return OCCEditor

OCCEditorFactory = ToolkitEditorFactory
