import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.STEPConstruct is deprecated since pythonocc-0.18.2. Use OCC.Core.STEPConstruct", DeprecationWarning)

from OCC.Core.STEPConstruct import *
