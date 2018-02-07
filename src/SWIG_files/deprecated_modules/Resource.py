import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Resource is deprecated since pythonocc-0.18.2. Use OCC.Core.Resource", DeprecationWarning)

from OCC.Core.Resource import *
