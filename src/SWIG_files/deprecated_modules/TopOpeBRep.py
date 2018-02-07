import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopOpeBRep is deprecated since pythonocc-0.18.2. Use OCC.Core.TopOpeBRep", DeprecationWarning)

from OCC.Core.TopOpeBRep import *
