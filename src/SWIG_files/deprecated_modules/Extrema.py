import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Extrema is deprecated since pythonocc-0.18.2. Use OCC.Core.Extrema", DeprecationWarning)

from OCC.Core.Extrema import *
