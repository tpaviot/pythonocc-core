import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.PFunction is deprecated since pythonocc-0.18.2. Use OCC.Core.PFunction", DeprecationWarning)

from OCC.Core.PFunction import *
