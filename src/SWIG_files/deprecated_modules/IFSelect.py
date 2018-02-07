import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IFSelect is deprecated since pythonocc-0.18.2. Use OCC.Core.IFSelect", DeprecationWarning)

from OCC.Core.IFSelect import *
