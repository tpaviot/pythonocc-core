import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IVtkOCC is deprecated since pythonocc-0.18.2. Use OCC.Core.IVtkOCC", DeprecationWarning)

from OCC.Core.IVtkOCC import *
