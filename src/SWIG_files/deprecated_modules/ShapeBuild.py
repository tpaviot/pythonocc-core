import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ShapeBuild is deprecated since pythonocc-0.18.2. Use OCC.Core.ShapeBuild", DeprecationWarning)

from OCC.Core.ShapeBuild import *
