import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.SMESH is deprecated since pythonocc-0.18.2. Use OCC.Core.SMESH", DeprecationWarning)

from OCC.Core.SMESH import *
