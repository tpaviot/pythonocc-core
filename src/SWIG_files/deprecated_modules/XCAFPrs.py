import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XCAFPrs is deprecated since pythonocc-0.18.2. Use OCC.Core.XCAFPrs", DeprecationWarning)

from OCC.Core.XCAFPrs import *
