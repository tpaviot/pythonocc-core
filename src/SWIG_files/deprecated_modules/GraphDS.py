import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GraphDS is deprecated since pythonocc-0.18.2. Use OCC.Core.GraphDS", DeprecationWarning)

from OCC.Core.GraphDS import *
