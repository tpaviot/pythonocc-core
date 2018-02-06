import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.NLPlate is deprecated since pythonocc-0.18.2. Use OCC.Core.NLPlate", DeprecationWarning)

from OCC.Core.NLPlate import *
