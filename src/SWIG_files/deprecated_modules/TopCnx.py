import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopCnx is deprecated since pythonocc-0.18.2. Use OCC.Core.TopCnx", DeprecationWarning)

from OCC.Core.TopCnx import *
