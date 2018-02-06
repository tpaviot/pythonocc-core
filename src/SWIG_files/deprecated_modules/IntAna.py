import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntAna is deprecated since pythonocc-0.18.2. Use OCC.Core.IntAna", DeprecationWarning)

from OCC.Core.IntAna import *
