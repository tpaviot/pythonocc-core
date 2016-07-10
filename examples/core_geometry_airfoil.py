# -*- coding:utf-8 -*-

##Copyright 2013-2014 Guillaume Florent (florentsailing@gmail.com)
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

#
# Explanations for this script can be found at
# http://pythonocc.wordpress.com/2013/04/01/using-external-airfoil-data-to-create-a-solid-wing/
#
try:
    import urllib.request as urllib2  # Python3
except ImportError:
    import urllib2  # Python2

from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeFace
from OCC.BRepPrimAPI import BRepPrimAPI_MakePrism
from OCC.Geom2dAPI import Geom2dAPI_PointsToBSpline
from OCC.GeomAPI import geomapi
from OCC.gp import gp_Pnt, gp_Vec, gp_Pnt2d, gp_Pln, gp_Dir
from OCC.TColgp import TColgp_Array1OfPnt2d

from core_geometry_utils import make_wire, make_edge


class UiucAirfoil(object):
    """
    Airfoil with a section from the UIUC database
    """
    def __init__(self, chord, span, profile):
        self.chord = chord
        self.span = span
        self.profile = profile
        self.shape = self.make_shape()

    def make_shape(self):
        # 1 - retrieve the data from the UIUC airfoil data page
        foil_dat_url = 'http://m-selig.ae.illinois.edu/ads/coord_seligFmt/%s.dat' % self.profile
        print("Connecting to m-selig, retrieving foil data")
        f = urllib2.urlopen(foil_dat_url)
        print("Building foil geometry")
        plan = gp_Pln(gp_Pnt(0., 0., 0.), gp_Dir(0., 0., 1.))  # Z=0 plan / XY plan
        section_pts_2d = []

        for line in f.readlines()[1:]:  # The first line contains info only
            # 2 - do some cleanup on the data (mostly dealing with spaces)
            data = line.split()
            # 3 - create an array of points
            if len(data) == 2:  # two coordinates for each point
                section_pts_2d.append(gp_Pnt2d(float(data[0])*self.chord,
                                               float(data[1])*self.chord))

        # 4 - use the array to create a spline describing the airfoil section
        spline_2d = Geom2dAPI_PointsToBSpline(point2d_list_to_TColgp_Array1OfPnt2d(section_pts_2d),
                                              len(section_pts_2d)-1,  # order min
                                              len(section_pts_2d))   # order max
        spline = geomapi.To3d(spline_2d.Curve(), plan)

        # 5 - figure out if the trailing edge has a thickness or not,
        # and create a Face
        try:
            #first and last point of spline -> trailing edge
            trailing_edge = make_edge(gp_Pnt(section_pts_2d[0].X(), section_pts_2d[0].Y(), 0.0),
                                      gp_Pnt(section_pts_2d[-1].X(), section_pts_2d[-1].Y(), 0.0))
            face = BRepBuilderAPI_MakeFace(make_wire([make_edge(spline), trailing_edge]))
        except AssertionError:
            # the trailing edge segment could not be created, probably because
            # the points are too close
            # No need to build a trailing edge
            face = BRepBuilderAPI_MakeFace(make_wire(make_edge(spline)))

        # 6 - extrude the Face to create a Solid
        return BRepPrimAPI_MakePrism(face.Face(),
                                     gp_Vec(gp_Pnt(0., 0., 0.),
                                     gp_Pnt(0., 0., self.span))).Shape()


def point2d_list_to_TColgp_Array1OfPnt2d(li):
    """
    List of gp_Pnt2d to TColgp_Array1OfPnt2d
    """
    return _Tcol_dim_1(li, TColgp_Array1OfPnt2d)


def _Tcol_dim_1(li, _type):
    """
    Function factory for 1-dimensional TCol* types
    """
    pts = _type(0, len(li)-1)
    for n, i in enumerate(li):
        pts.SetValue(n, i)
    return pts

if __name__ == '__main__':
    airfoil = UiucAirfoil(50., 200., 'b737a')
    from OCC.Display.SimpleGui import init_display
    display, start_display, add_menu, add_function_to_menu = init_display()
    display.DisplayShape(airfoil.shape, update=True)
    start_display()
