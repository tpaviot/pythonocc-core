from OCC.AIS import AIS_Shape
from OCC.Aspect import Aspect_TOL_SOLID
from OCC.Display.SimpleGui import init_display
from OCC.Graphic3d import Graphic3d_ArrayOfPoints, Graphic3d_AspectMarker3d, Graphic3d_ArrayOfPolylines, \
    Graphic3d_AspectLine3d
from OCCUtils.Common import random_color
from OCCUtils.Construct import make_vertex, gp_Pnt
from OCC.Prs3d import Prs3d_Root_CurrentGroup, Prs3d_Presentation
from OCC.Quantity import Quantity_NOC_BLACK, Quantity_Color

import numpy as np
import random

display, start_display, add_menu, add_function_to_menu = init_display("qt-pyqt4")

def create_ogl_group(display):
    """
    hackish hook to OpenGL context

    @param display:
    @return:
    """

    aPresentation = Prs3d_Presentation(display._struc_mgr)
    # arrow = Prs3d_Arrow()
    # arrow.Draw(
    #     aPresentation.GetHandle(),
    #     (pnt.as_vec() + vec).as_pnt(),
    #     gp_Dir(vec),
    #     math.radians(20),
    #     vec.Magnitude()
    # )
    # aPresentation.Display()


    group = Prs3d_Root_CurrentGroup(aPresentation.GetHandle()).GetObject()
    return aPresentation, group

    # # should be the "official" way to create a Graphic3d_Group
    # # somehow this wont render visible results ;(
    # view_manager_handle = display.Context.CurrentViewer().GetObject().Viewer()
    # pres = Prs3d_Presentation(view_manager_handle, True)
    # pres.SetVisible(True)
    # grp = Prs3d_Root_CurrentGroup(pres.GetHandle()).GetObject()
    # return grp


def draw_pointcloud(pnt_list, nr_of_points, display, color=None):
    """

    rendering a large number of points through the usual way of:

        display.DisplayShape( make_vertex( gp_Pnt() ) )

    is fine for TopoDS_Shapes but certainly not for large number of points.
    in comparison, drawing all the voxel samples takes 18sec using the approach above, but negigable when using this function
    its about 2 orders of Magnitude faster, so worth the extra hassle

    here we use a more close-to-the-metal approach of drawing directly in OpenGL

    see [1] for a more detailed / elegant way to perform this task

    [1] http://www.opencascade.org/org/forum/thread_21732/?forum=3

    @param pnt_list:
    @param display:
    """
    a_presentation, group = create_ogl_group(display)

    pnts_arr = Graphic3d_ArrayOfPoints(nr_of_points+1, # maxVertexs
                                       True # hasVColors
                                       )
    asp = Graphic3d_AspectMarker3d()

    if not color is None:
        asp.SetColor(color)

    group.SetPrimitivesAspect(asp.GetHandle())
    for p in pnt_list:
        quantity_color = random_color()
        pnts_arr.AddVertex(gp_Pnt(*p), quantity_color)
    group.AddPrimitiveArray(pnts_arr.GetHandle())

    a_presentation.Display()

def generate_points(spread, n):
    arr = np.random.uniform(-spread/2.0,spread/2.0, (n, 3))
    for i in arr:
        yield i


def draw_lines(pnt_list, nr_of_points, display):
    a_presentation, group = create_ogl_group(display)
    black = Quantity_Color(Quantity_NOC_BLACK)
    asp = Graphic3d_AspectLine3d(black, Aspect_TOL_SOLID, 1)

    gg = Graphic3d_ArrayOfPolylines(nr_of_points*2,
                                    nr_of_points*2,
                                    0,      # maxEdges
                                    False,  # hasVColors
                                    True,   # hasBColors
                                    False,  # hasEdgeInfos
                                    )


    try:
        while 1:
            pnt = gp_Pnt(*pnt_list.next())
            gg.AddVertex(pnt)
            # gg.AddVertex(pnt, random_color())
            pnt = gp_Pnt(*pnt_list.next())
            gg.AddVertex(pnt)
            # gg.AddVertex(pnt, random_color())
            # try to add color to the bounds
            # bnd_indx = gg.AddBound(2)

            #-------------------------------------------------------------------------------
            # not sure why line colors arent rendered...
            #-------------------------------------------------------------------------------

            bnd_indx = gg.AddBound(2, random.random(), random.random(), random.random())
            # bnd_indx = gg.AddBound(2, random.random(), random.random(), random.random())
            # gg.SetBoundColor(bnd_indx, random_color())
    except StopIteration:
        pass

    group.SetPrimitivesAspect(asp.GetHandle())
    group.AddPrimitiveArray(gg.GetHandle())
    a_presentation.Display()

def main():
    nr_of_points = 100000
    spread = 100
    draw_pointcloud(generate_points(spread, nr_of_points), nr_of_points, display)
    # draw_lines(generate_points(spread, nr_of_points), nr_of_points, display)
    start_display()

if __name__ == "__main__":
    main()
