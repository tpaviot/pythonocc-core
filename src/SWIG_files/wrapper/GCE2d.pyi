from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.GC import *

GCE2d_MakeArcOfCircle = NewType("GCE2d_MakeArcOfCircle", GC_MakeArcOfCircle2d)
GCE2d_MakeArcOfEllipse = NewType("GCE2d_MakeArcOfEllipse", GC_MakeArcOfEllipse2d)
GCE2d_MakeArcOfHyperbola = NewType("GCE2d_MakeArcOfHyperbola", GC_MakeArcOfHyperbola2d)
GCE2d_MakeArcOfParabola = NewType("GCE2d_MakeArcOfParabola", GC_MakeArcOfParabola2d)
GCE2d_MakeCircle = NewType("GCE2d_MakeCircle", GC_MakeCircle2d)
GCE2d_MakeEllipse = NewType("GCE2d_MakeEllipse", GC_MakeEllipse2d)
GCE2d_MakeHyperbola = NewType("GCE2d_MakeHyperbola", GC_MakeHyperbola2d)
GCE2d_MakeLine = NewType("GCE2d_MakeLine", GC_MakeLine2d)
GCE2d_MakeMirror = NewType("GCE2d_MakeMirror", GC_MakeMirror2d)
GCE2d_MakeParabola = NewType("GCE2d_MakeParabola", GC_MakeParabola2d)
GCE2d_MakeRotation = NewType("GCE2d_MakeRotation", GC_MakeRotation2d)
GCE2d_MakeScale = NewType("GCE2d_MakeScale", GC_MakeScale2d)
GCE2d_MakeSegment = NewType("GCE2d_MakeSegment", GC_MakeSegment2d)
GCE2d_MakeTranslation = NewType("GCE2d_MakeTranslation", GC_MakeTranslation2d)
GCE2d_Root = NewType("GCE2d_Root", GC_Root)

# harray1 classes
# harray2 classes
# hsequence classes

