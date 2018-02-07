import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Geom is deprecated since pythonocc-0.18.2. Use OCC.Core.Geom", DeprecationWarning)

from OCC.Core.Geom import *
