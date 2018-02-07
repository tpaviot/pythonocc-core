import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.SMDS is deprecated since pythonocc-0.18.2. Use OCC.Core.SMDS", DeprecationWarning)

from OCC.Core.SMDS import *
