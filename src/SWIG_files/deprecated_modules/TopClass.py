import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopClass is deprecated since pythonocc-0.18.2. Use OCC.Core.TopClass", DeprecationWarning)

from OCC.Core.TopClass import *
