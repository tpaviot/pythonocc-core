import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Blend is deprecated since pythonocc-0.18.2. Use OCC.Core.Blend", DeprecationWarning)

from OCC.Core.Blend import *
