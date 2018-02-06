import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GeomToStep is deprecated since pythonocc-0.18.2. Use OCC.Core.GeomToStep", DeprecationWarning)

from OCC.Core.GeomToStep import *
