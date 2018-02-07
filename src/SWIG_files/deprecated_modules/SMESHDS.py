import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.SMESHDS is deprecated since pythonocc-0.18.2. Use OCC.Core.SMESHDS", DeprecationWarning)

from OCC.Core.SMESHDS import *
