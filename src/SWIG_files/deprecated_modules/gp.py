import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.gp is deprecated since pythonocc-0.18.2. Use OCC.Core.gp", DeprecationWarning)

from OCC.Core.gp import *
