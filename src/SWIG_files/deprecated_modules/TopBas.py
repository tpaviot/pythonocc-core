import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopBas is deprecated since pythonocc-0.18.2. Use OCC.Core.TopBas", DeprecationWarning)

from OCC.Core.TopBas import *
