import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.OSD is deprecated since pythonocc-0.18.2. Use OCC.Core.OSD", DeprecationWarning)

from OCC.Core.OSD import *
