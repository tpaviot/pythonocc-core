import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntCurveSurface is deprecated since pythonocc-0.18.2. Use OCC.Core.IntCurveSurface", DeprecationWarning)

from OCC.Core.IntCurveSurface import *
