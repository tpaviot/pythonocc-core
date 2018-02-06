import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Dico is deprecated since pythonocc-0.18.2. Use OCC.Core.Dico", DeprecationWarning)

from OCC.Core.Dico import *
