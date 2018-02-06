import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GeomInt is deprecated since pythonocc-0.18.2. Use OCC.Core.GeomInt", DeprecationWarning)

from OCC.Core.GeomInt import *
