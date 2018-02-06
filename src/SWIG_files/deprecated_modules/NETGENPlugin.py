import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.NETGENPlugin is deprecated since pythonocc-0.18.2. Use OCC.Core.NETGENPlugin", DeprecationWarning)

from OCC.Core.NETGENPlugin import *
