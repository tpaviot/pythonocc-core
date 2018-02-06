import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ChFi3d is deprecated since pythonocc-0.18.2. Use OCC.Core.ChFi3d", DeprecationWarning)

from OCC.Core.ChFi3d import *
