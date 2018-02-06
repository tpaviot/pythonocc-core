import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ChFiDS is deprecated since pythonocc-0.18.2. Use OCC.Core.ChFiDS", DeprecationWarning)

from OCC.Core.ChFiDS import *
