import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XmlMDF is deprecated since pythonocc-0.18.2. Use OCC.Core.XmlMDF", DeprecationWarning)

from OCC.Core.XmlMDF import *
