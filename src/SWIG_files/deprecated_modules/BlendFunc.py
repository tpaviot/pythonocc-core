import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BlendFunc is deprecated since pythonocc-0.18.2. Use OCC.Core.BlendFunc", DeprecationWarning)

from OCC.Core.BlendFunc import *
