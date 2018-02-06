import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Image is deprecated since pythonocc-0.18.2. Use OCC.Core.Image", DeprecationWarning)

from OCC.Core.Image import *
