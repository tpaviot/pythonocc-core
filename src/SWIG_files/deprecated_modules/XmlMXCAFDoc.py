import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XmlMXCAFDoc is deprecated since pythonocc-0.18.2. Use OCC.Core.XmlMXCAFDoc", DeprecationWarning)

from OCC.Core.XmlMXCAFDoc import *
