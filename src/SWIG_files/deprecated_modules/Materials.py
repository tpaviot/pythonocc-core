import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Materials is deprecated since pythonocc-0.18.2. Use OCC.Core.Materials", DeprecationWarning)

from OCC.Core.Materials import *
