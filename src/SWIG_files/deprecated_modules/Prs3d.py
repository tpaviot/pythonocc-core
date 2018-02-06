import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Prs3d is deprecated since pythonocc-0.18.2. Use OCC.Core.Prs3d", DeprecationWarning)

from OCC.Core.Prs3d import *
