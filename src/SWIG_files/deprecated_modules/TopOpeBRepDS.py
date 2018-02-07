import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopOpeBRepDS is deprecated since pythonocc-0.18.2. Use OCC.Core.TopOpeBRepDS", DeprecationWarning)

from OCC.Core.TopOpeBRepDS import *
