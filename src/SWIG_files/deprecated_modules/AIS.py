import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.AIS is deprecated since pythonocc-0.18.2. Use OCC.Core.AIS", DeprecationWarning)

from OCC.Core.AIS import *
