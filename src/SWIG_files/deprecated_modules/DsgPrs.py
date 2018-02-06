import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.DsgPrs is deprecated since pythonocc-0.18.2. Use OCC.Core.DsgPrs", DeprecationWarning)

from OCC.Core.DsgPrs import *
