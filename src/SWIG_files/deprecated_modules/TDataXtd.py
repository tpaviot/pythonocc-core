import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TDataXtd is deprecated since pythonocc-0.18.2. Use OCC.Core.TDataXtd", DeprecationWarning)

from OCC.Core.TDataXtd import *
