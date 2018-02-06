import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.MDataXtd is deprecated since pythonocc-0.18.2. Use OCC.Core.MDataXtd", DeprecationWarning)

from OCC.Core.MDataXtd import *
