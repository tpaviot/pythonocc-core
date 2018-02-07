import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XCAFApp is deprecated since pythonocc-0.18.2. Use OCC.Core.XCAFApp", DeprecationWarning)

from OCC.Core.XCAFApp import *
