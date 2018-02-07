import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.SelectBasics is deprecated since pythonocc-0.18.2. Use OCC.Core.SelectBasics", DeprecationWarning)

from OCC.Core.SelectBasics import *
