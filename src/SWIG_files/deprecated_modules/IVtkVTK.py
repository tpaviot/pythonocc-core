import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IVtkVTK is deprecated since pythonocc-0.18.2. Use OCC.Core.IVtkVTK", DeprecationWarning)

from OCC.Core.IVtkVTK import *
