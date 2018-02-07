import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IncludeLibrary is deprecated since pythonocc-0.18.2. Use OCC.Core.IncludeLibrary", DeprecationWarning)

from OCC.Core.IncludeLibrary import *
