#!/usr/bin/env python

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

from __future__ import print_function

import os
import os.path
import sys
import math
import itertools

import OCC
from OCC.AIS import AIS_MultipleConnectedInteractive, AIS_Shape
from OCC.TopoDS import TopoDS_Shape
from OCC.gp import gp_Dir, gp_Pnt, gp_Pnt2d, gp_Vec
from OCC.BRepBuilderAPI import (BRepBuilderAPI_MakeVertex,
                                BRepBuilderAPI_MakeEdge,
                                BRepBuilderAPI_MakeEdge2d,
                                BRepBuilderAPI_MakeFace)
from OCC.TopAbs import (TopAbs_FACE, TopAbs_EDGE, TopAbs_VERTEX,
                        TopAbs_SHELL, TopAbs_SOLID)
from OCC.Geom import Handle_Geom_Curve, Handle_Geom_Surface
from OCC.Geom2d import Handle_Geom2d_Curve
import OCC.Visualization
import OCC.V3d
import OCC.AIS
from OCC.TCollection import TCollection_ExtendedString, TCollection_AsciiString
from OCC.Quantity import (Quantity_Color, Quantity_TOC_RGB, Quantity_NOC_WHITE,
                          Quantity_NOC_BLACK, Quantity_NOC_BLUE1,
                          Quantity_NOC_CYAN1, Quantity_NOC_RED,
                          Quantity_NOC_GREEN,
                          Quantity_NOC_ORANGE, Quantity_NOC_YELLOW)
from OCC.Prs3d import (Prs3d_Arrow, Prs3d_Presentation, Prs3d_Text,
                       Prs3d_TextAspect)
from OCC.Graphic3d import Graphic3d_NOM_NEON_GNC
from OCC.V3d import V3d_ZBUFFER
from OCC.Aspect import Aspect_TOTP_RIGHT_LOWER

# Shaders and Units definition must be found by occ
# the fastest way to get done is to set the CASROOT env variable
# it must point to the /share folder.
if sys.platform == "win32":
    # do the same for Units
    if "CASROOT" in os.environ:
        casroot_path = os.environ["CASROOT"]
        # raise an error, force the user to correctly set the variable
        err_msg = "Please set the CASROOT env variable (%s is not ok)" % casroot_path
        assert os.path.isdir(casroot_path), err_msg
    else:  # on miniconda or anaconda or whatever conda
        occ_package_path = os.path.dirname(OCC.__file__)
        casroot_path = os.path.join(occ_package_path, '..', '..', '..',
                               'Library', 'share', 'oce')
        # we check that all required files are at the right place
        shaders_dict_found = os.path.isdir(os.path.join(casroot_path,
                                                        'src', 'Shaders'))
        unitlexicon_found = os.path.isfile(os.path.join(casroot_path,
                                                        'src', 'UnitsAPI',
                                                        'Lexi_Expr.dat'))
        unitsdefinition_found = os.path.isfile(os.path.join(casroot_path,
                                                        'src', 'UnitsAPI',
                                                        'Units.dat'))
        if shaders_dict_found and unitlexicon_found and unitsdefinition_found:
            os.environ["CASROOT"] = casroot_path


def rgb_color(r, g, b):
    return Quantity_Color(r, g, b, Quantity_TOC_RGB)


def get_color_from_name(color_name):
    ''' from the string 'WHITE', returns Quantity_Color
    WHITE.
    color_name is the color name, case insensitive.
    '''
    enum_name = 'Quantity_NOC_%s' % color_name.upper()
    if enum_name in globals():
        color_num = globals()[enum_name]
        return Quantity_Color(color_num)
    elif enum_name+'1' in globals():
        color_num = globals()[enum_name+'1']
        print('Many colors for color name %s, using first.' % color_name)
    else:
        color_num = Quantity_NOC_WHITE
        print('Color name not defined. Use White by default')
    return Quantity_Color(color_num)


def to_string(_string):
    return TCollection_ExtendedString(_string)

# some thing we'll need later
modes = itertools.cycle([TopAbs_FACE, TopAbs_EDGE,
                         TopAbs_VERTEX,
                         TopAbs_SHELL, TopAbs_SOLID])


class Viewer3d(OCC.Visualization.Display3d):
    def __init__(self, window_handle):
        OCC.Visualization.Display3d.__init__(self)
        self._window_handle = window_handle
        self._inited = False
        self._local_context_opened = False
        self.Context_handle = None
        self.Viewer_handle = None
        self.View_handle = None
        self.Context = None
        self.Viewer = None
        self.View = None
        self.selected_shape = None
        self.default_drawer = None
        self._struc_mgr = None
        self.selected_shapes = []
        self._select_callbacks = []

    def register_select_callback(self, callback):
        """ Adds a callback that will be called each time a shape s selected
        """
        if not callable(callback):
            raise AssertionError("You must provide a callable to register the callback")
        else:
            self._select_callbacks.append(callback)

    def unregister_callback(self, callback):
        """ Remove a callback from the callback list
        """
        if not callback in self._select_callbacks:
            raise AssertionError("This callback is not registered")
        else:
            self._select_callbacks.remove(callback)

    def MoveTo(self, X, Y):
        self.Context.MoveTo(X, Y, self.View_handle)

    def FitAll(self):
        self.View.ZFitAll()
        self.View.FitAll()

    def Create(self, create_default_lights=True, draw_face_boundaries=True, phong_shading=True):
        self.Init(self._window_handle)
        self.Context_handle = self.GetContext()
        self.Viewer_handle = self.GetViewer()
        self.View_handle = self.GetView()
        self.Context = self.Context_handle.GetObject()
        self.Viewer = self.Viewer_handle.GetObject()
        if create_default_lights:
            self.Viewer.SetDefaultLights()
            self.Viewer.SetLightOn()
        self.View = self.View_handle.GetObject()

        self.default_drawer = self.Context.DefaultDrawer().GetObject()

        # draw black contour edges, like Catia
        if draw_face_boundaries:
            self.default_drawer.SetFaceBoundaryDraw(True)

        # turn up tesselation defaults, which are too conversative...
        chord_dev = self.default_drawer.MaximalChordialDeviation() / 10.
        self.default_drawer.SetMaximalChordialDeviation(chord_dev)

        if phong_shading:
            # gouraud shading by defauly, prefer phong instead
            self.View.SetShadingModel(OCC.V3d.V3d_PHONG)

        # the selected elements gray by default, better to use orange...
        # self.Context.SelectionColor(Quantity_NOC_ORANGE)

        # nessecary for text rendering
        self._struc_mgr = self.Context.MainPrsMgr().GetObject().StructureManager()
        self._inited = True

    def SetDoubleBuffer(self, on_or_off):
        """enables double buffering when shapes are moved in the viewer
        a very shaky picture is drawn, since double buffering
        is disabled by default. fixed here..."""
        self.View.Window().GetObject().SetDoubleBuffer(bool(on_or_off))

    def OnResize(self):
        self.View.MustBeResized()

    def ResetView(self):
        self.View.Reset()

    def Repaint(self):
        self.Viewer.Redraw()

    def SetModeWireFrame(self):
        self.View.SetComputedMode(False)
        self.Context.SetDisplayMode(OCC.AIS.AIS_WireFrame)

    def SetModeShaded(self):
        self.View.SetComputedMode(False)
        self.Context.SetDisplayMode(OCC.AIS.AIS_Shaded)

    def SetModeHLR(self):
        self.View.SetComputedMode(True)

    def SetOrthographic(self, _bool):
        '''
        sets whether this view is a orthographic or perspective view
        @param _bool:
        '''
        raise AssertionError("SetOrthographic method not yet implemented.")

    def View_Top(self):
        self.View.SetProj(OCC.V3d.V3d_Zpos)

    def View_Bottom(self):
        self.View.SetProj(OCC.V3d.V3d_Zneg)

    def View_Left(self):
        self.View.SetProj(OCC.V3d.V3d_Xneg)

    def View_Right(self):
        self.View.SetProj(OCC.V3d.V3d_Xpos)

    def View_Front(self):
        self.View.SetProj(OCC.V3d.V3d_Yneg)

    def View_Rear(self):
        self.View.SetProj(OCC.V3d.V3d_Ypos)

    def View_Iso(self):
        self.View.SetProj(OCC.V3d.V3d_XposYnegZpos)

    def ExportToImage(self, image_filename):
        self.View.Dump(image_filename)

    def set_raytracing_mode(self, shadows=True, reflections=True, antialiasing=True):
        self.View.SetRaytracingMode()
        if shadows:
            self.View.EnableRaytracedShadows()
        if reflections:
            self.View.EnableRaytracedReflections()
        if antialiasing:
            self.View.EnableRaytracedAntialiasing()

    def display_graduated_trihedron(self):
        self.View.GraduatedTrihedronDisplay()

    def display_trihedron(self):
        """ Show a black trihedron in lower right corner
        """
        self.View.TriedronDisplay(Aspect_TOTP_RIGHT_LOWER, Quantity_NOC_BLACK, 0.1, V3d_ZBUFFER)

    def set_bg_gradient_color(self, R1, G1, B1, R2, G2, B2):
        """ set a bg vertical gradient color.
        R, G and B are floats.
        """
        aColor1 = rgb_color(float(R1)/255., float(G1)/255., float(B1)/255.)
        aColor2 = rgb_color(float(R2)/255., float(G2)/255., float(B2)/255.)
        self.View.SetBgGradientColors(aColor1, aColor2, 2, True)

    def SetBackgroundImage(self, image_filename, stretch=True):
        if not os.path.isfile(image_filename):
            raise IOError("image file %s not found." % image_filename)
        if stretch:
            self.View.SetBackgroundImage(image_filename, OCC.Aspect.Aspect_FM_STRETCH, True)
        else:
            self.View.SetBackgroundImage(image_filename, OCC.Aspect.Aspect_FM_NONE, True)

    def DisplayVector(self, vec, pnt, update=False):
        if self._inited:
            aPresentation = Prs3d_Presentation(self._struc_mgr)

            pnt_as_vec = gp_Vec(pnt.X(), pnt.Y(), pnt.Z())
            start = pnt_as_vec + vec
            pnt_start = gp_Pnt(start.X(), start.Y(), start.Z())

            Prs3d_Arrow.Draw(
                aPresentation.GetHandle(),
                pnt_start,
                gp_Dir(vec),
                math.radians(20),
                vec.Magnitude()
            )
            aPresentation.Display()
            # it would be more coherent if a AIS_InteractiveObject
            # would be returned
            if update:
                self.Repaint()
            return aPresentation

    def DisplayMessage(self, point, text_to_write, height=None, message_color=None, update=False):
        """
        :point: a gp_Pnt or gp_Pnt2d instance
        :text_to_write: a string
        :message_color: triple with the range 0-1
        """
        aPresentation = Prs3d_Presentation(self._struc_mgr)
        text_aspect = Prs3d_TextAspect()

        if message_color is not None:
            text_aspect.SetColor(rgb_color(*message_color))
        if height is not None:
            text_aspect.SetHeight(height)
        if isinstance(point, gp_Pnt2d):
            point = gp_Pnt(point.X(), point.Y(), 0)
        Prs3d_Text.Draw(aPresentation.GetHandle(),
                        text_aspect.GetHandle(),
                        to_string(text_to_write),
                        point)
        aPresentation.Display()
        # @TODO: it would be more coherent if a AIS_InteractiveObject
        # is be returned
        if update:
            self.Repaint()
        return aPresentation

    def DisplayShape(self, shapes, material=None, texture=None, color=None, transparency=None, update=False):
        '''
        '''
        # if a gp_Pnt is passed, first convert to vertex
        if issubclass(shapes.__class__, gp_Pnt):
            vertex = BRepBuilderAPI_MakeVertex(shapes)
            shapes = [vertex.Shape()]
            SOLO = True
        elif isinstance(shapes, gp_Pnt2d):
            vertex = BRepBuilderAPI_MakeVertex(gp_Pnt(shapes.X(), shapes.Y(), 0))
            shapes = [vertex.Shape()]
            SOLO = True
        # if a Geom_Curve is passed
        elif callable(getattr(shapes, "GetHandle", None)):
            handle = shapes.GetHandle()
            if issubclass(handle.__class__, Handle_Geom_Curve):
                edge = BRepBuilderAPI_MakeEdge(handle)
                shapes = [edge.Shape()]
                SOLO = True
            elif issubclass(handle.__class__, Handle_Geom2d_Curve):
                edge2d = BRepBuilderAPI_MakeEdge2d(handle)
                shapes = [edge2d.Shape()]
                SOLO = True
            elif issubclass(handle.__class__, Handle_Geom_Surface):
                bounds = True
                toldegen = 1e-6
                face = BRepBuilderAPI_MakeFace()
                face.Init(handle, bounds, toldegen)
                face.Build()
                shapes = [face.Shape()]
                SOLO = True
        elif isinstance(shapes, Handle_Geom_Surface):
            bounds = True
            toldegen = 1e-6
            face = BRepBuilderAPI_MakeFace()
            face.Init(shapes, bounds, toldegen)
            face.Build()
            shapes = [face.Shape()]
            SOLO = True
        elif isinstance(shapes, Handle_Geom_Curve):
            edge = BRepBuilderAPI_MakeEdge(shapes)
            shapes = [edge.Shape()]
            SOLO = True
        elif isinstance(shapes, Handle_Geom2d_Curve):
            edge2d = BRepBuilderAPI_MakeEdge2d(shapes)
            shapes = [edge2d.Shape()]
            SOLO = True
        elif issubclass(shapes.__class__, TopoDS_Shape):
            shapes = [shapes]
            SOLO = True
        else:
            SOLO = False

        ais_shapes = []

        for shape in shapes:
            if material or texture:
                if texture:
                    self.View.SetSurfaceDetail(OCC.V3d.V3d_TEX_ALL)
                    shape_to_display = OCC.AIS.AIS_TexturedShape(shape)
                    filename, toScaleU, toScaleV, toRepeatU, toRepeatV, originU, originV = texture.GetProperties()
                    shape_to_display.SetTextureFileName(TCollection_AsciiString(filename))
                    shape_to_display.SetTextureMapOn()
                    shape_to_display.SetTextureScale(True, toScaleU, toScaleV)
                    shape_to_display.SetTextureRepeat(True, toRepeatU, toRepeatV)
                    shape_to_display.SetTextureOrigin(True, originU, originV)
                    shape_to_display.SetDisplayMode(3)
                elif material:
                    shape_to_display = AIS_Shape(shape)
                    shape_to_display.SetMaterial(material)
            else:
                # TODO: can we use .Set to attach all TopoDS_Shapes
                # to this AIS_Shape instance?
                shape_to_display = AIS_Shape(shape)

            ais_shapes.append(shape_to_display.GetHandle())

        if not SOLO:
            # computing graphic properties is expensive
            # if an iterable is found, so cluster all TopoDS_Shape under
            # an AIS_MultipleConnectedInteractive
            #shape_to_display = AIS_MultipleConnectedInteractive()
            for ais_shp in ais_shapes:
                # TODO : following line crashes with oce-0.18
                # why ? fix ?
                #shape_to_display.Connect(i)
                self.Context.Display(ais_shp, False)
            shape_to_display = ais_shapes
            return shape_to_display
        # set the graphic properties
        if material is None:
            #The default material is too shiny to show the object
            #color well, so I set it to something less reflective
            shape_to_display.SetMaterial(Graphic3d_NOM_NEON_GNC)
        if color:
            if isinstance(color, str):
                color = get_color_from_name(color)
            for shp in ais_shapes:
                self.Context.SetColor(shp, color, False)
        if transparency:
            shape_to_display.SetTransparency(transparency)
        if update:
            # only update when explicitely told to do so
            self.Context.Display(shape_to_display.GetHandle(), False)
            # especially this call takes up a lot of time...
            self.FitAll()
            self.Repaint()
        else:
            self.Context.Display(shape_to_display.GetHandle(), False)

        if SOLO:
            return ais_shapes[0]
        else:
            return shape_to_display

    def DisplayColoredShape(self, shapes, color='YELLOW', update=False, ):
        if isinstance(color, str):
            dict_color = {'WHITE': Quantity_NOC_WHITE,
                          'BLUE': Quantity_NOC_BLUE1,
                          'RED': Quantity_NOC_RED,
                          'GREEN': Quantity_NOC_GREEN,
                          'YELLOW': Quantity_NOC_YELLOW,
                          'CYAN': Quantity_NOC_CYAN1,
                          'BLACK': Quantity_NOC_BLACK,
                          'ORANGE': Quantity_NOC_ORANGE}
            clr = Quantity_Color(dict_color[color])
        elif isinstance(color, Quantity_Color):
            clr = color
        else:
            raise ValueError('color should either be a string ( "BLUE" ) or a Quantity_Color(0.1, 0.8, 0.1) got %s' % color)

        return self.DisplayShape(shapes, color=clr, update=update)

    def EnableAntiAliasing(self):
        self.View.SetAntialiasingOn()
        self.Repaint()

    def DisableAntiAliasing(self):
        self.View.SetAntialiasingOff()
        self.Repaint()

    def EraseAll(self):
        # nessecary to remove text added by DisplayMessage
        self.Context.PurgeDisplay()
        self.Context.EraseAll()

    def Tumble(self, num_images, animation=True):
        self.View.Tumble(num_images, animation)

    def Pan(self, dx, dy):
        self.View.Pan(dx, dy)

    def SetSelectionMode(self, mode=None):
        self.Context.CloseAllContexts()
        self.Context.OpenLocalContext()
        topo_level = next(modes)
        if mode is None:
            self.Context.ActivateStandardMode(topo_level)
        else:
            self.Context.ActivateStandardMode(mode)
        self.Context.UpdateSelected()

    def SetSelectionModeVertex(self):
        self.SetSelectionMode(OCC.TopAbs.TopAbs_VERTEX)

    def SetSelectionModeEdge(self):
        self.SetSelectionMode(OCC.TopAbs.TopAbs_EDGE)

    def SetSelectionModeFace(self):
        self.SetSelectionMode(OCC.TopAbs.TopAbs_FACE)

    def SetSelectionModeShape(self):
        self.Context.CloseAllContexts()

    def SetSelectionModeNeutral(self):
        self.Context.CloseAllContexts()

    def GetSelectedShapes(self):
        return self.selected_shapes

    def GetSelectedShape(self):
        """
        Returns the current selected shape
        """
        return self.selected_shape

    def SelectArea(self, Xmin, Ymin, Xmax, Ymax):
        self.Context.Select(Xmin, Ymin, Xmax, Ymax, self.View_handle)
        self.Context.InitSelected()
        # reinit the selected_shapes list
        self.selected_shapes = []
        while self.Context.MoreSelected():
            if self.Context.HasSelectedShape():
                self.selected_shapes.append(self.Context.SelectedShape())
            self.Context.NextSelected()
        # callbacks
        for callback in self._select_callbacks:
            callback(self.selected_shapes, Xmin, Ymin, Xmax, Ymax)

    def Select(self, X, Y):
        self.Context.Select()
        self.Context.InitSelected()

        self.selected_shapes = []
        if self.Context.MoreSelected():
            if self.Context.HasSelectedShape():
                self.selected_shapes.append(self.Context.SelectedShape())
        # callbacks
        for callback in self._select_callbacks:
            callback(self.selected_shapes, X, Y)

    def ShiftSelect(self, X, Y):
        self.Context.ShiftSelect()
        self.Context.InitSelected()

        self.selected_shapes = []
        while self.Context.MoreSelected():
            if self.Context.HasSelectedShape():
                self.selected_shapes.append(self.Context.SelectedShape())
            self.Context.NextSelected()
        # hilight newly selected unhighlight those no longer selected
        self.Context.UpdateSelected()
        # callbacks
        for callback in self._select_callbacks:
            callback(self.selected_shapes, X, Y)

    def Rotation(self, X, Y):
        self.View.Rotation(X, Y)

    def DynamicZoom(self, X1, Y1, X2, Y2):
        self.View.Zoom(X1, Y1, X2, Y2)

    def ZoomFactor(self, zoom_factor):
        self.View.SetZoom(zoom_factor)

    def ZoomArea(self, X1, Y1, X2, Y2):
        self.View.WindowFit(X1, Y1, X2, Y2)

    def Zoom(self, X, Y):
        self.View.Zoom(X, Y)

    def StartRotation(self, X, Y):
        self.View.StartRotation(X, Y)
