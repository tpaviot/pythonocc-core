import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Standard is deprecated since pythonocc-0.18.2. Use OCC.Core.Standard", DeprecationWarning)

from OCC.Core.Standard import *
