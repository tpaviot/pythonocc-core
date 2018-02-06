import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XmlMPrsStd is deprecated since pythonocc-0.18.2. Use OCC.Core.XmlMPrsStd", DeprecationWarning)

from OCC.Core.XmlMPrsStd import *
