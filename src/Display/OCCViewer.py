#!/usr/bin/env python

##Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)
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

"""The 3D viewer, on screen (Viewer3d) or offscreen (OffscreenRenderer)."""

import itertools
import logging
import math
import os
import sys
import time
from collections.abc import Sequence
from typing import Any, Callable, Optional, Union

import OCC
from OCC.Core import Quantity
from OCC.Core.AIS import (
    AIS_Shaded,
    AIS_Shape,
    AIS_TexturedShape,
    AIS_WireFrame,
)
from OCC.Core.Aspect import (
    Aspect_FillMethod,
    Aspect_FM_NONE,
    Aspect_FM_STRETCH,
    Aspect_GFM_VER,
    Aspect_TOTP_RIGHT_LOWER,
)
from OCC.Core.BRepBuilderAPI import (
    BRepBuilderAPI_MakeEdge,
    BRepBuilderAPI_MakeEdge2d,
    BRepBuilderAPI_MakeFace,
    BRepBuilderAPI_MakeVertex,
)
from OCC.Core.Geom import Geom_Curve, Geom_Surface
from OCC.Core.Geom2d import Geom2d_Curve
from OCC.Core.GeomAbs import GeomAbs_G2
from OCC.Core.gp import gp_Dir, gp_Pnt, gp_Pnt2d, gp_Vec
from OCC.Core.Graphic3d import (
    Graphic3d_Camera,
    Graphic3d_GraduatedTrihedron,
    Graphic3d_MaterialAspect,
    Graphic3d_NameOfMaterial,
    Graphic3d_NOM_NEON_GNC,
    Graphic3d_NOT_ENV_CLOUDS,
    Graphic3d_RenderingParams,
    Graphic3d_RM_RASTERIZATION,
    Graphic3d_RM_RAYTRACING,
    Graphic3d_StereoMode_QuadBuffer,
    Graphic3d_Structure,
    Graphic3d_TextureEnv,
    Graphic3d_TOSM_FRAGMENT,
)
from OCC.Core.Prs3d import Prs3d_Arrow, Prs3d_Text, Prs3d_TextAspect
from OCC.Core.Quantity import (
    Quantity_Color,
    Quantity_NOC_BLACK,
    Quantity_NOC_WHITE,
    Quantity_TOC_RGB,
)
from OCC.Core.TopAbs import (
    TopAbs_EDGE,
    TopAbs_FACE,
    TopAbs_SHELL,
    TopAbs_SOLID,
    TopAbs_VERTEX,
    TopAbs_WIRE,
)
from OCC.Core.V3d import (
    V3d_Xneg,
    V3d_Xpos,
    V3d_XposYnegZpos,
    V3d_Yneg,
    V3d_Ypos,
    V3d_ZBUFFER,
    V3d_Zneg,
    V3d_Zpos,
)
from OCC.Core.Visualization import Display3d

if sys.platform == "win32":
    if "CASROOT" in os.environ:
        casroot_path = os.environ["CASROOT"]
        # raise an error, force the user to correctly set the variable
        err_msg = f"Please set the CASROOT env variable ({casroot_path} is not ok)"
        if not os.path.isdir(casroot_path):
            raise AssertionError(err_msg)
    else:
        occ_package_path = os.path.dirname(OCC.__file__)
        casroot_path = os.path.join(
            occ_package_path, "..", "..", "..", "Library", "share", "oce"
        )
        # we check that all required files are at the right place
        shaders_dict_found = os.path.isdir(os.path.join(casroot_path, "src", "Shaders"))
        unitlexicon_found = os.path.isfile(
            os.path.join(casroot_path, "src", "UnitsAPI", "Lexi_Expr.dat")
        )
        unitsdefinition_found = os.path.isfile(
            os.path.join(casroot_path, "src", "UnitsAPI", "Units.dat")
        )
        if shaders_dict_found and unitlexicon_found and unitsdefinition_found:
            os.environ["CASROOT"] = casroot_path


log = logging.getLogger(__name__)

# selection modes cycled by SetSelectionMode() when no mode is given
SELECTION_TOPOLOGY_MODES = (
    TopAbs_SOLID,
    TopAbs_SHELL,
    TopAbs_FACE,
    TopAbs_WIRE,
    TopAbs_EDGE,
    TopAbs_VERTEX,
)


def rgb_color(r: float, g: float, b: float) -> Quantity_Color:
    """Returns the Quantity_Color of the (r, g, b) components, each in [0, 1]."""
    return Quantity_Color(r, g, b, Quantity_TOC_RGB)


def get_color_from_name(color_name: str) -> Quantity_Color:
    """Returns the Quantity_Color named color_name, e.g. "WHITE" or "blue".

    The name is one of the Quantity_NameOfColor enumeration, without the
    Quantity_NOC_ prefix, case insensitive. When a name is declined in
    several shades (BLUE1, BLUE2, ...), the first one is used. Unknown names
    fall back to white, with a warning.
    """
    enum_name = f"Quantity_NOC_{color_name.upper()}"
    color_num = getattr(Quantity, enum_name, None)
    if color_num is None:
        color_num = getattr(Quantity, f"{enum_name}1", None)
        if color_num is not None:
            log.warning("Several shades of color %s, using %s1", color_name, enum_name)
    if color_num is None:
        log.warning("Color name %s not defined, using white", color_name)
        color_num = Quantity_NOC_WHITE
    return Quantity_Color(color_num)


class Viewer3d(Display3d):
    """
    A 3D viewer for pythonOCC.

    This class provides a 3D viewer for displaying OpenCASCADE shapes.
    It is based on the `OCC.Core.Visualization.Display3d` class and provides
    a higher-level API for interacting with the viewer.
    """

    def __init__(self) -> None:
        """
        Initializes the Viewer3d.
        """
        super().__init__()
        self._parent = None  # the parent opengl GUI container
        self._topology_modes = itertools.cycle(SELECTION_TOPOLOGY_MODES)

        self._inited = False
        self._local_context_opened = False

        self.Context = self.GetContext()
        self.Viewer = self.GetViewer()
        self.View = self.GetView()
        self.camera = self.GetCamera()
        self.struc_mgr = self.GetStructureManager()

        self.default_drawer = None
        self._is_offscreen = None

        self.selected_shapes: list[AIS_Shape] = []
        self._select_callbacks: list[Callable] = []
        self._overlay_items: list[Any] = []

        self._window_handle: Optional[Any] = None

    def get_parent(self) -> Any:
        """
        Returns the parent of the viewer.

        Returns:
            The parent of the viewer.
        """
        return self._parent

    def register_overlay_item(self, overlay_item: Any) -> None:
        """
        Registers an overlay item to be drawn on top of the 3D view.

        Args:
            overlay_item: The overlay item to register.
        """
        self._overlay_items.append(overlay_item)
        self.View.MustBeResized()
        self.View.Redraw()

    def register_select_callback(self, callback: Callable) -> None:
        """
        Adds a callback that will be called each time a shape is selected.

        Args:
            callback: The callback function to register. The callback will be
                called with the selected shapes as argument.
        """
        if not callable(callback):
            raise TypeError("You must provide a callable to register the callback")
        self._select_callbacks.append(callback)

    def unregister_callback(self, callback: Callable) -> None:
        """
        Remove a callback from the callback list.

        Args:
            callback: The callback function to unregister.
        """
        if callback not in self._select_callbacks:
            raise ValueError("This callback is not registered")
        self._select_callbacks.remove(callback)

    def MoveTo(self, X: int, Y: int) -> None:
        """
        Moves the mouse to the given coordinates.

        Args:
            X (int): The x-coordinate.
            Y (int): The y-coordinate.
        """
        self.Context.MoveTo(X, Y, self.View, True)

    def FitAll(self) -> None:
        """
        Fits all objects in the view.
        """
        self.View.ZFitAll()
        self.View.FitAll()

    def Create(
        self,
        window_handle: Optional[Any] = None,
        parent: Optional[Any] = None,
        create_default_lights: bool = True,
        draw_face_boundaries: bool = True,
        phong_shading: bool = True,
        display_glinfo: bool = True,
    ) -> None:
        """
        Creates the viewer.

        Args:
            window_handle: The handle of the window to create the viewer in.
                If None, an offscreen renderer will be created.
            parent: The parent of the viewer.
            create_default_lights (bool): Whether to create default lights.
            draw_face_boundaries (bool): Whether to draw face boundaries.
            phong_shading (bool): Whether to use Phong shading.
            display_glinfo (bool): Whether to display OpenGL information.
        """
        self._window_handle = window_handle
        self._parent = parent

        if self._window_handle is None:
            self.InitOffscreen(640, 480)
            self._is_offscreen = True
        else:
            self.Init(self._window_handle)
            self._is_offscreen = False

        # display OpenGl Information
        if display_glinfo:
            self.GlInfo()

        if create_default_lights:
            self.Viewer.SetDefaultLights()
            self.Viewer.SetLightOn()

        self.default_drawer = self.Context.DefaultDrawer()

        # draw black contour edges, like other famous CAD packages
        if draw_face_boundaries:
            self.default_drawer.SetFaceBoundaryDraw(True)
            # Don't draw seam edges
            self.default_drawer.SetFaceBoundaryUpperContinuity(GeomAbs_G2)

        # turn up tessellation defaults, which are too conversative...
        chord_dev = self.default_drawer.MaximalChordialDeviation() / 10.0
        self.default_drawer.SetMaximalChordialDeviation(chord_dev)

        if phong_shading:
            # gouraud shading by default, prefer phong instead
            self.View.SetShadingModel(Graphic3d_TOSM_FRAGMENT)

        # turn self._inited flag to True
        self._inited = True

    def OnResize(self) -> None:
        """
        Called when the view is resized.
        """
        self.View.MustBeResized()

    def ResetView(self) -> None:
        """
        Resets the view.
        """
        self.View.Reset()

    def Repaint(self) -> None:
        """
        Repaints the view.
        """
        self.Viewer.Redraw()

    def SetModeWireFrame(self) -> None:
        """
        Sets the display mode to wireframe.
        """
        self.View.SetComputedMode(False)
        self.Context.SetDisplayMode(AIS_WireFrame, True)

    def SetModeShaded(self) -> None:
        """
        Sets the display mode to shaded.
        """
        self.View.SetComputedMode(False)
        self.Context.SetDisplayMode(AIS_Shaded, True)

    def SetModeHLR(self) -> None:
        """
        Sets the display mode to hidden line removal.
        """
        self.View.SetComputedMode(True)

    def SetOrthographicProjection(self) -> None:
        """
        Sets the projection to orthographic.
        """
        self.camera.SetProjectionType(Graphic3d_Camera.Projection_Orthographic)

    def SetPerspectiveProjection(self) -> None:
        """
        Sets the projection to perspective.
        """
        self.camera.SetProjectionType(Graphic3d_Camera.Projection_Perspective)

    def View_Top(self) -> None:
        """
        Sets the view to top.
        """
        self.View.SetProj(V3d_Zpos)

    def View_Bottom(self) -> None:
        """
        Sets the view to bottom.
        """
        self.View.SetProj(V3d_Zneg)

    def View_Left(self) -> None:
        """
        Sets the view to left.
        """
        self.View.SetProj(V3d_Xneg)

    def View_Right(self) -> None:
        """
        Sets the view to right.
        """
        self.View.SetProj(V3d_Xpos)

    def View_Front(self) -> None:
        """
        Sets the view to front.
        """
        self.View.SetProj(V3d_Yneg)

    def View_Rear(self) -> None:
        """
        Sets the view to rear.
        """
        self.View.SetProj(V3d_Ypos)

    def View_Iso(self) -> None:
        """
        Sets the view to isometric.
        """
        self.View.SetProj(V3d_XposYnegZpos)

    def EnableTextureEnv(self, name_of_texture: int = Graphic3d_NOT_ENV_CLOUDS) -> None:
        """
        Enables environment mapping.

        Args:
            name_of_texture: The name of the texture to use. Possible values
                are:
                - Graphic3d_NOT_ENV_CLOUDS
                - Graphic3d_NOT_ENV_CV
                - Graphic3d_NOT_ENV_MEDIT
                - Graphic3d_NOT_ENV_PEARL
                - Graphic3d_NOT_ENV_SKY1
                - Graphic3d_NOT_ENV_SKY2
                - Graphic3d_NOT_ENV_LINES
                - Graphic3d_NOT_ENV_ROAD
                - Graphic3d_NOT_ENV_UNKNOWN
        """
        texture_env = Graphic3d_TextureEnv(name_of_texture)
        self.View.SetTextureEnv(texture_env)
        self.View.Redraw()

    def DisableTextureEnv(self) -> None:
        """
        Disables environment mapping.
        """
        self.View.SetTextureEnv(None)  # a null handle clears the texture data
        self.View.Redraw()

    def SetRenderingParams(
        self,
        Method: int = Graphic3d_RM_RASTERIZATION,
        RaytracingDepth: int = 3,
        IsShadowEnabled: bool = True,
        IsReflectionEnabled: bool = False,
        IsAntialiasingEnabled: bool = False,
        IsTransparentShadowEnabled: bool = False,
        StereoMode: int = Graphic3d_StereoMode_QuadBuffer,
        AnaglyphFilter: "Graphic3d_RenderingParams.Anaglyph" = Graphic3d_RenderingParams.Anaglyph_RedCyan_Optimized,
        ToReverseStereo: bool = False,
    ) -> None:
        """
        Sets the rendering parameters.

        Args:
            Method: The rendering method to use.
            RaytracingDepth (int): The ray tracing depth.
            IsShadowEnabled (bool): Whether to enable shadows.
            IsReflectionEnabled (bool): Whether to enable reflections.
            IsAntialiasingEnabled (bool): Whether to enable anti-aliasing.
            IsTransparentShadowEnabled (bool): Whether to enable transparent shadows.
            StereoMode: The stereo mode to use.
            AnaglyphFilter: The anaglyph filter to use.
            ToReverseStereo (bool): Whether to reverse stereo.
        """
        self.ChangeRenderingParams(
            Method,
            RaytracingDepth,
            IsShadowEnabled,
            IsReflectionEnabled,
            IsAntialiasingEnabled,
            IsTransparentShadowEnabled,
            StereoMode,
            AnaglyphFilter,
            ToReverseStereo,
        )

    def SetRasterizationMode(self) -> None:
        """
        Sets the rendering mode to rasterization.
        """
        self.SetRenderingParams()

    def SetRaytracingMode(self, depth: int = 3) -> None:
        """
        Enables the raytracing mode.

        Args:
            depth (int): The ray tracing depth.
        """
        self.SetRenderingParams(
            Method=Graphic3d_RM_RAYTRACING,
            RaytracingDepth=depth,
            IsAntialiasingEnabled=True,
            IsShadowEnabled=True,
            IsReflectionEnabled=True,
            IsTransparentShadowEnabled=True,
        )

    def ExportToImage(self, image_filename: str) -> None:
        """
        Exports the view to an image file.

        Args:
            image_filename (str): The name of the image file.
        """
        self.View.Dump(image_filename)

    def display_graduated_trihedron(self) -> None:
        """
        Displays a graduated trihedron.
        """
        a_trihedron_data = Graphic3d_GraduatedTrihedron()
        self.View.GraduatedTrihedronDisplay(a_trihedron_data)

    def display_triedron(self) -> None:
        """
        Shows a black triedron in lower right corner.
        """
        self.View.TriedronDisplay(
            Aspect_TOTP_RIGHT_LOWER,
            Quantity_Color(Quantity_NOC_BLACK),
            0.1,
            V3d_ZBUFFER,
        )

    def hide_triedron(self) -> None:
        """
        Hides the triedron.
        """
        self.View.TriedronErase()

    def set_bg_gradient_color(
        self,
        color1: Union[Sequence[float], Quantity_Color],
        color2: Union[Sequence[float], Quantity_Color],
        fill_method: Aspect_FillMethod = Aspect_GFM_VER,
    ) -> None:
        """
        Sets a background vertical gradient color.

        Args:
            color1: The first color. Can be a sequence of 3 values (R, G, B) in
                [0, 255] or a Quantity_Color.
            color2: The second color. Can be a sequence of 3 values (R, G, B) in
                [0, 255] or a Quantity_Color.
            fill_method: The fill method to use. Can be one of:
                - Aspect_GFM_NONE
                - Aspect_GFM_HOR
                - Aspect_GFM_VER
                - Aspect_GFM_DIAG1
                - Aspect_GFM_DIAG2
                - Aspect_GFM_CORNER1
                - Aspect_GFM_CORNER2
                - Aspect_GFM_CORNER3
                - Aspect_GFM_CORNER4
        """
        colors = []
        for color in (color1, color2):
            if isinstance(color, Quantity_Color):
                colors.append(color)
            elif isinstance(color, Sequence) and len(color) == 3:
                colors.append(rgb_color(*(float(c) / 255.0 for c in color)))
            else:
                raise TypeError(
                    "color1 and color2 must be [R, G, B] sequences or Quantity_Color"
                )
        self.View.SetBgGradientColors(colors[0], colors[1], fill_method, True)

    def SetBackgroundImage(self, image_filename: str, stretch: bool = True) -> None:
        """
        Displays a background image (jpg, png etc.).

        Args:
            image_filename (str): The name of the image file.
            stretch (bool): Whether to stretch the image to fit the view.
        """
        if not os.path.isfile(image_filename):
            raise FileNotFoundError(f"image file {image_filename} not found.")
        if stretch:
            self.View.SetBackgroundImage(image_filename, Aspect_FM_STRETCH, True)
        else:
            self.View.SetBackgroundImage(image_filename, Aspect_FM_NONE, True)

    def DisplayVector(
        self, vec: gp_Vec, pnt: gp_Pnt, update: bool = False
    ) -> Optional[Graphic3d_Structure]:
        """
        Displays a vector as an arrow.

        Args:
            vec (gp_Vec): The vector to display.
            pnt (gp_Pnt): The starting point of the vector.
            update (bool): Whether to update the view.

        Returns:
            The created structure.
        """
        if self._inited:
            aStructure = Graphic3d_Structure(self.struc_mgr)

            pnt_as_vec = gp_Vec(pnt.X(), pnt.Y(), pnt.Z())
            start = pnt_as_vec + vec
            pnt_start = gp_Pnt(start.X(), start.Y(), start.Z())

            Prs3d_Arrow.Draw(
                aStructure.CurrentGroup(),
                pnt_start,
                gp_Dir(vec),
                math.radians(20),
                vec.Magnitude(),
            )
            aStructure.Display()
            # it would be more coherent if a AIS_InteractiveObject
            # would be returned
            if update:
                self.Repaint()
            return aStructure
        return None

    def DisplayMessage(
        self,
        point: Union[gp_Pnt, gp_Pnt2d],
        text_to_write: str,
        height: float = 14.0,
        message_color: tuple[float, float, float] = (0.0, 0.0, 0.0),
        update: bool = False,
    ) -> Graphic3d_Structure:
        """
        Displays a message at the given point.

        Args:
            point: The point where to display the message. Can be a gp_Pnt or
                a gp_Pnt2d.
            text_to_write (str): The text to display.
            height (float): The font height.
            message_color (tuple): The color of the message, as a tuple of 3
                floats (R, G, B).
            update (bool): Whether to update the view.

        Returns:
            The created structure.
        """
        aStructure = Graphic3d_Structure(self.struc_mgr)

        text_aspect = Prs3d_TextAspect()
        text_aspect.SetColor(rgb_color(*message_color))
        text_aspect.SetHeight(height)
        if isinstance(point, gp_Pnt2d):
            point = gp_Pnt(point.X(), point.Y(), 0)

        Prs3d_Text.Draw(aStructure.CurrentGroup(), text_aspect, text_to_write, point)
        aStructure.Display()
        # @TODO: it would be more coherent if a AIS_InteractiveObject
        # is be returned
        if update:
            self.Repaint()
        return aStructure

    def DisplayShape(
        self,
        shapes: Any,
        material: Optional[Any] = None,
        texture: Optional[Any] = None,
        color: Optional[Union[str, int, Quantity_Color]] = None,
        transparency: Optional[float] = None,
        update: bool = False,
    ) -> list[AIS_Shape]:
        """
        Displays one or a set of displayable objects.

        Args:
            shapes: The shape(s) to display. Can be a single shape or a list of
                shapes.
            material: The material to use for the shape.
            texture: The texture to use for the shape.
            color: The color to use for the shape.
            transparency (float): The transparency to use for the shape (0.0 to 1.0).
            update (bool): Whether to update the view.

        Returns:
            A list of the displayed AIS_Shape objects.
        """
        ais_shapes: list[AIS_Shape] = []  # the list of all displayed shapes

        if isinstance(shapes, gp_Pnt):
            # if a gp_Pnt is passed, first convert to vertex
            vertex = BRepBuilderAPI_MakeVertex(shapes)
            shapes = [vertex.Shape()]
        elif isinstance(shapes, gp_Pnt2d):
            vertex = BRepBuilderAPI_MakeVertex(gp_Pnt(shapes.X(), shapes.Y(), 0))
            shapes = [vertex.Shape()]
        elif isinstance(shapes, Geom_Surface):
            bounds = True
            toldegen = 1e-6
            face = BRepBuilderAPI_MakeFace()
            face.Init(shapes, bounds, toldegen)
            face.Build()
            shapes = [face.Shape()]
        elif isinstance(shapes, Geom_Curve):
            edge = BRepBuilderAPI_MakeEdge(shapes)
            shapes = [edge.Shape()]
        elif isinstance(shapes, Geom2d_Curve):
            edge2d = BRepBuilderAPI_MakeEdge2d(shapes)
            shapes = [edge2d.Shape()]
        # if only one shapes, create a list with a single shape
        if not isinstance(shapes, list):
            shapes = [shapes]
        # build AIS_Shapes list
        for shape in shapes:
            if texture:
                shape_to_display = AIS_TexturedShape(shape)
                (
                    filename,
                    toScaleU,
                    toScaleV,
                    toRepeatU,
                    toRepeatV,
                    originU,
                    originV,
                ) = texture.GetProperties()
                shape_to_display.SetTextureFileName(filename)
                shape_to_display.SetTextureMapOn()
                shape_to_display.SetTextureScale(True, toScaleU, toScaleV)
                shape_to_display.SetTextureRepeat(True, toRepeatU, toRepeatV)
                shape_to_display.SetTextureOrigin(True, originU, originV)
                shape_to_display.SetDisplayMode(3)
            elif material:
                shape_to_display = AIS_Shape(shape)
                if isinstance(material, Graphic3d_NameOfMaterial):
                    shape_to_display.SetMaterial(Graphic3d_MaterialAspect(material))
                else:
                    shape_to_display.SetMaterial(material)
            else:
                # TODO: can we use .Set to attach all TopoDS_Shapes
                # to this AIS_Shape instance?
                shape_to_display = AIS_Shape(shape)

            ais_shapes.append(shape_to_display)

        # set the graphic properties
        if material is None:
            # The default material is too shiny to show the object
            # color well, so I set it to something less reflective
            for shape_to_display in ais_shapes:
                shape_to_display.SetMaterial(
                    Graphic3d_MaterialAspect(Graphic3d_NOM_NEON_GNC)
                )
        # a color of 0 or "" is not applied (Layer relies on it), use
        # Quantity_Color(Quantity_NOC_BLACK) or "BLACK" for black
        if color:
            if isinstance(color, str):
                color = get_color_from_name(color)
            elif isinstance(color, int):
                color = Quantity_Color(color)
            for shp in ais_shapes:
                self.Context.SetColor(shp, color, False)
        if transparency:
            for shape_to_display in ais_shapes:
                shape_to_display.SetTransparency(transparency)
        # display the shapes
        for shape_to_display in ais_shapes:
            self.Context.Display(shape_to_display, False)
        if update:
            # especially this call takes up a lot of time...
            self.FitAll()
            self.Repaint()

        return ais_shapes

    def DisplayColoredShape(
        self,
        shapes: Any,
        color: Union[str, Quantity_Color] = "YELLOW",
        update: bool = False,
    ) -> list[AIS_Shape]:
        """
        Displays a shape with the given color.

        Args:
            shapes: The shape(s) to display.
            color (str or Quantity_Color): The color to use, see
                get_color_from_name for the accepted names.
            update (bool): Whether to update the view.

        Returns:
            A list of the displayed AIS_Shape objects.
        """
        if isinstance(color, str):
            clr = get_color_from_name(color)
        elif isinstance(color, Quantity_Color):
            clr = color
        else:
            raise TypeError(
                "color should either be a string (e.g. 'BLUE') or a "
                f"Quantity_Color(0.1, 0.8, 0.1), got {color!r}"
            )

        return self.DisplayShape(shapes, color=clr, update=update)

    def EnableAntiAliasing(self) -> None:
        """
        Enables anti-aliasing.
        """
        self.SetNbMsaaSample(4)

    def DisableAntiAliasing(self) -> None:
        """
        Disables anti-aliasing.
        """
        self.SetNbMsaaSample(0)

    def EraseAll(self) -> None:
        """
        Erases all objects from the view.
        """
        self.Context.EraseAll(True)

    def Tumble(self, num_images: int, animation: bool = True) -> None:
        """
        Tumbles the view.

        Args:
            num_images (int): The number of images to generate.
            animation (bool): Whether to animate the tumble.
        """
        self.View.Tumble(num_images, animation)

    def Pan(self, dx: int, dy: int) -> None:
        """
        Pans the view.

        Args:
            dx (int): The horizontal panning distance.
            dy (int): The vertical panning distance.
        """
        self.View.Pan(dx, dy)

    def SetSelectionMode(self, mode: Optional[int] = None) -> None:
        """
        Sets the selection mode.

        Args:
            mode: The selection mode to use. If None, cycles through the
                available modes.
        """
        self.Context.Deactivate()
        if mode is None:
            topo_level = next(self._topology_modes)
            self.Context.Activate(AIS_Shape.SelectionMode(topo_level), True)
        else:
            self.Context.Activate(AIS_Shape.SelectionMode(mode), True)
        self.Context.UpdateSelected(True)

    def SetSelectionModeVertex(self) -> None:
        """
        Sets the selection mode to vertex.
        """
        self.SetSelectionMode(TopAbs_VERTEX)

    def SetSelectionModeEdge(self) -> None:
        """
        Sets the selection mode to edge.
        """
        self.SetSelectionMode(TopAbs_EDGE)

    def SetSelectionModeWire(self) -> None:
        """
        Sets the selection mode to wire.
        """
        self.SetSelectionMode(TopAbs_WIRE)

    def SetSelectionModeFace(self) -> None:
        """
        Sets the selection mode to face.
        """
        self.SetSelectionMode(TopAbs_FACE)

    def SetSelectionModeShell(self) -> None:
        """
        Sets the selection mode to shell.
        """
        self.SetSelectionMode(TopAbs_SHELL)

    def SetSelectionModeSolid(self) -> None:
        """
        Sets the selection mode to solid.
        """
        self.SetSelectionMode(TopAbs_SOLID)

    def SetSelectionModeShape(self) -> None:
        """
        Sets the selection mode to shape.
        """
        self.Context.Deactivate()

    def SetSelectionModeNeutral(self) -> None:
        """
        Sets the selection mode to neutral.
        """
        self.Context.Deactivate()

    def GetSelectedShapes(self) -> list[AIS_Shape]:
        """
        Returns the selected shapes.

        Returns:
            A list of the selected shapes.
        """
        return self.selected_shapes

    def GetSelectedShape(self) -> AIS_Shape:
        """
        Returns the selected shape.

        Returns:
            The selected shape.
        """
        return self.Context.SelectedShape()

    def _update_selected_shapes(self) -> None:
        """Rebuilds selected_shapes from the current selection of the context."""
        self.Context.InitSelected()
        self.selected_shapes = []
        while self.Context.MoreSelected():
            if self.Context.HasSelectedShape():
                self.selected_shapes.append(self.Context.SelectedShape())
            self.Context.NextSelected()
        # leave the context iterator on the first selected entity, so that
        # GetSelectedShape() (Context.SelectedShape()) can be called afterwards
        self.Context.InitSelected()

    def SelectArea(self, Xmin: int, Ymin: int, Xmax: int, Ymax: int) -> None:
        """
        Selects objects within the given area.

        Args:
            Xmin (int): The minimum x-coordinate of the selection area.
            Ymin (int): The minimum y-coordinate of the selection area.
            Xmax (int): The maximum x-coordinate of the selection area.
            Ymax (int): The maximum y-coordinate of the selection area.
        """
        self.Context.Select(Xmin, Ymin, Xmax, Ymax, self.View, True)
        self._update_selected_shapes()
        # callbacks
        for callback in self._select_callbacks:
            callback(self.selected_shapes, Xmin, Ymin, Xmax, Ymax)

    def Select(self, X: int, Y: int) -> None:
        """
        Selects the object at the given coordinates.

        Args:
            X (int): The x-coordinate.
            Y (int): The y-coordinate.
        """
        self.Context.Select(True)
        self._update_selected_shapes()
        # callbacks
        for callback in self._select_callbacks:
            callback(self.selected_shapes, X, Y)

    def ShiftSelect(self, X: int, Y: int) -> None:
        """
        Adds the object at the given coordinates to the selection.

        Args:
            X (int): The x-coordinate.
            Y (int): The y-coordinate.
        """
        self.Context.ShiftSelect(True)
        self._update_selected_shapes()
        # highlight newly selected unhighlight those no longer selected
        self.Context.UpdateSelected(True)
        # callbacks
        for callback in self._select_callbacks:
            callback(self.selected_shapes, X, Y)

    def Rotation(self, X: int, Y: int) -> None:
        """
        Rotates the view.

        Args:
            X (int): The x-coordinate.
            Y (int): The y-coordinate.
        """
        self.View.Rotation(X, Y)

    def DynamicZoom(self, X1: int, Y1: int, X2: int, Y2: int) -> None:
        """
        Zooms the view dynamically.

        Args:
            X1 (int): The first x-coordinate.
            Y1 (int): The first y-coordinate.
            X2 (int): The second x-coordinate.
            Y2 (int): The second y-coordinate.
        """
        self.View.Zoom(X1, Y1, X2, Y2)

    def ZoomFactor(self, zoom_factor: float) -> None:
        """
        Sets the zoom factor.

        Args:
            zoom_factor (float): The zoom factor.
        """
        self.View.SetZoom(zoom_factor)

    def ZoomArea(self, X1: int, Y1: int, X2: int, Y2: int) -> None:
        """
        Zooms to the given area.

        Args:
            X1 (int): The first x-coordinate.
            Y1 (int): The first y-coordinate.
            X2 (int): The second x-coordinate.
            Y2 (int): The second y-coordinate.
        """
        self.View.WindowFit(X1, Y1, X2, Y2)

    def Zoom(self, X: int, Y: int) -> None:
        """
        Zooms the view.

        Args:
            X (int): The x-coordinate.
            Y (int): The y-coordinate.
        """
        self.View.Zoom(X, Y)

    def StartRotation(self, X: int, Y: int) -> None:
        """
        Starts the rotation.

        Args:
            X (int): The x-coordinate.
            Y (int): The y-coordinate.
        """
        self.View.StartRotation(X, Y)


class OffscreenRenderer(Viewer3d):
    """
    An offscreen renderer for pythonOCC.

    The offscreen renderer is inherited from Viewer3d.
    The DisplayShape method is overridden to export to image
    each time it is called.
    """

    def __init__(self, screen_size: tuple[int, int] = (640, 480)) -> None:
        """
        Initializes the OffscreenRenderer.

        Args:
            screen_size (tuple): The size of the screen (width, height).
        """
        super().__init__()
        # create the renderer
        self.Create()
        self.SetSize(screen_size[0], screen_size[1])
        self.SetModeShaded()
        self.set_bg_gradient_color([206, 215, 222], [128, 128, 128])
        self.display_triedron()
        self.capture_number = 0

    def DisplayShape(
        self,
        shapes: Any,
        material: Optional[Any] = None,
        texture: Optional[Any] = None,
        color: Optional[Union[str, int, Quantity_Color]] = None,
        transparency: Optional[float] = None,
        update: bool = True,
        dump_image: bool = True,
        dump_image_path: Optional[str] = None,
        dump_image_filename: Optional[str] = None,
    ) -> list[AIS_Shape]:
        """
        Displays a shape and dumps the view to an image file.

        Args:
            shapes: The shape(s) to display.
            material: The material to use for the shape.
            texture: The texture to use for the shape.
            color: The color to use for the shape.
            transparency (float): The transparency to use for the shape (0.0 to 1.0).
            update (bool): Whether to update the view.
            dump_image (bool): Whether to dump the view to an image file.
            dump_image_path (str): The path where to save the image file.
            dump_image_filename (str): The name of the image file.

        Returns:
            A list of the displayed AIS_Shape objects.
        """
        r = super().DisplayShape(shapes, material, texture, color, transparency, update)
        if dump_image or os.getenv("PYTHONOCC_OFFSCREEN_RENDERER_DUMP_IMAGE") == "1":
            # the environment variable takes precedence over the argument
            path = os.getenv("PYTHONOCC_OFFSCREEN_RENDERER_DUMP_IMAGE_PATH")
            if not path:
                path = dump_image_path if dump_image_path is not None else os.getcwd()
            if not os.path.isdir(path):
                raise NotADirectoryError(f"{path} is not a valid path")
            if dump_image_filename is None:
                self.capture_number += 1
                dump_image_filename = (
                    f"capture-{self.capture_number}-{int(time.time())}.jpeg"
                )
            image_full_name = os.path.join(path, dump_image_filename)
            self.View.Dump(image_full_name)
            if not os.path.isfile(image_full_name):
                raise OSError("OffscreenRenderer failed to render image to file")
            print(f"OffscreenRenderer content dumped to {image_full_name}")
        return r
