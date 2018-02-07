import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XmlMFunction is deprecated since pythonocc-0.18.2. Use OCC.Core.XmlMFunction", DeprecationWarning)

from OCC.Core.XmlMFunction import *
