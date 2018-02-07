import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.PDataXtd is deprecated since pythonocc-0.18.2. Use OCC.Core.PDataXtd", DeprecationWarning)

from OCC.Core.PDataXtd import *
