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

import warnings
warnings.simplefilter("always")


def read_step_file(*kargs, **kwargs):
    warning_message = """"read_step_file function marked as deprecated since pythonocc-core-7.5.0.
    This function is now available from the OCC.Extend.DataExchange.STEP package, use:
    from OCC.Extend.DataExchange.STEP import read_step_file
    """
    warnings.warn(warning_message, DeprecationWarning)
    from OCC.Extend.DataExchange.STEP import read_step_file
    return read_step_file(*kargs, **kwargs)


def write_step_file(*kargs, **kwargs):
    warning_message = """"write_step_file function marked as deprecated since pythonocc-core-7.5.0.
    This function is now available from the OCC.Extend.DataExchange.STEP package, use:
    from OCC.Extend.DataExchange.STEP import write_step_file
    """
    warnings.warn(warning_message, DeprecationWarning)
    from OCC.Extend.DataExchange.STEP import write_step_file
    return write_step_file(*kargs, **kwargs)


def read_step_file_with_names_colors(*kargs, **kwargs):
    warning_message = """"read_step_file_with_names_colors function marked as deprecated since pythonocc-core-7.5.0.
    This function is now available from the OCC.Extend.DataExchange.STEP package, use:
    from OCC.Extend.DataExchange.STEP import read_step_file_with_names_colors
    """
    warnings.warn(warning_message, DeprecationWarning)
    from OCC.Extend.DataExchange.STEP import read_step_file_with_names_colors
    return read_step_file_with_names_colors(*kargs, **kwargs)


def write_stl_file(*kargs, **kwargs):
    warning_message = """"write_stl_file function marked as deprecated since pythonocc-core-7.5.0.
    This function is now available from the OCC.Extend.DataExchange.STL package, use:
    from OCC.Extend.DataExchange.STL import write_stl_file
    """
    warnings.warn(warning_message, DeprecationWarning)
    from OCC.Extend.DataExchange.STL import write_stl_file
    return write_stl_file(*kargs, **kwargs)


def read_stl_file(*kargs, **kwargs):
    warning_message = """"read_stl_file function marked as deprecated since pythonocc-core-7.5.0.
    This function is now available from the OCC.Extend.DataExchange.STL package, use:
    from OCC.Extend.DataExchange.STL import read_stl_file
    """
    warnings.warn(warning_message, DeprecationWarning)
    from OCC.Extend.DataExchange.STL import read_stl_file
    return read_stl_file(*kargs, **kwargs)


def read_iges_file(*kargs, **kwargs):
    warning_message = """"read_iges_file function marked as deprecated since pythonocc-core-7.5.0.
    This function is now available from the OCC.Extend.DataExchange.IGES package, use:
    from OCC.Extend.DataExchange.IGES import read_iges_file
    """
    warnings.warn(warning_message, DeprecationWarning)
    from OCC.Extend.DataExchange.IGES import read_iges_file
    return read_iges_file(*kargs, **kwargs)


def write_iges_file(*kargs, **kwargs):
    warning_message = """"write_iges_file function marked as deprecated since pythonocc-core-7.5.0.
    This function is now available from the OCC.Extend.DataExchange.IGES package, use:
    from OCC.Extend.DataExchange.IGES import write_iges_file
    """
    warnings.warn(warning_message, DeprecationWarning)
    from OCC.Extend.DataExchange.IGES import write_iges_file
    return write_iges_file(*kargs, **kwargs)


def edge_to_svg_polyline(*kargs, **kwargs):
    warning_message = """"edge_to_svg_polyline function marked as deprecated since pythonocc-core-7.5.0.
    This function is now available from the OCC.Extend.DataExchange.SVG package, use:
    from OCC.Extend.DataExchange.SVG import edge_to_svg_polyline
    """
    warnings.warn(warning_message, DeprecationWarning)
    from OCC.Extend.DataExchange.SVG import edge_to_svg_polyline
    return edge_to_svg_polyline(*kargs, **kwargs)


def export_shape_to_svg(*kargs, **kwargs):
    warning_message = """"export_shape_to_svg function marked as deprecated since pythonocc-core-7.5.0.
    This function is now available from the OCC.Extend.DataExchange.SVG package, use:
    from OCC.Extend.DataExchange.SVG import export_shape_to_svg
    """
    warnings.warn(warning_message, DeprecationWarning)
    from OCC.Extend.DataExchange.SVG import export_shape_to_svg
    return export_shape_to_svg(*kargs, **kwargs)
