import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.InterfaceGraphic is deprecated since pythonocc-0.18.2. Use OCC.Core.InterfaceGraphic", DeprecationWarning)

from OCC.Core.InterfaceGraphic import *
