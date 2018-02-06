import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntAna2d is deprecated since pythonocc-0.18.2. Use OCC.Core.IntAna2d", DeprecationWarning)

from OCC.Core.IntAna2d import *
