from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *


class Image_CompressedFormat(IntEnum):
    Image_CompressedFormat_UNKNOWN = ...
    Image_CompressedFormat_RGB_S3TC_DXT1 = ...
    Image_CompressedFormat_RGBA_S3TC_DXT1 = 2
    Image_CompressedFormat_RGBA_S3TC_DXT3 = 3
    Image_CompressedFormat_RGBA_S3TC_DXT5 = 4

Image_CompressedFormat_UNKNOWN = Image_CompressedFormat.Image_CompressedFormat_UNKNOWN
Image_CompressedFormat_RGB_S3TC_DXT1 = Image_CompressedFormat.Image_CompressedFormat_RGB_S3TC_DXT1
Image_CompressedFormat_RGBA_S3TC_DXT1 = Image_CompressedFormat.Image_CompressedFormat_RGBA_S3TC_DXT1
Image_CompressedFormat_RGBA_S3TC_DXT3 = Image_CompressedFormat.Image_CompressedFormat_RGBA_S3TC_DXT3
Image_CompressedFormat_RGBA_S3TC_DXT5 = Image_CompressedFormat.Image_CompressedFormat_RGBA_S3TC_DXT5
Image_CompressedFormat_NB: int


class Image_Format(IntEnum):
    Image_Format_UNKNOWN = 0
    Image_Format_Gray = 1
    Image_Format_Alpha = 2
    Image_Format_RGB = 3
    Image_Format_BGR = 4
    Image_Format_RGB32 = 5
    Image_Format_BGR32 = 6
    Image_Format_RGBA = 7
    Image_Format_BGRA = 8
    Image_Format_GrayF = 9
    Image_Format_AlphaF = 10
    Image_Format_RGF = 11
    Image_Format_RGBF = 12
    Image_Format_BGRF = 13
    Image_Format_RGBAF = 14
    Image_Format_BGRAF = 15
    Image_Format_GrayF_half = 16
    Image_Format_RGF_half = 17
    Image_Format_RGBAF_half = 18
    Image_Format_Gray16 = 19

Image_Format_UNKNOWN = Image_Format.Image_Format_UNKNOWN
Image_Format_Gray = Image_Format.Image_Format_Gray
Image_Format_Alpha = Image_Format.Image_Format_Alpha
Image_Format_RGB = Image_Format.Image_Format_RGB
Image_Format_BGR = Image_Format.Image_Format_BGR
Image_Format_RGB32 = Image_Format.Image_Format_RGB32
Image_Format_BGR32 = Image_Format.Image_Format_BGR32
Image_Format_RGBA = Image_Format.Image_Format_RGBA
Image_Format_BGRA = Image_Format.Image_Format_BGRA
Image_Format_GrayF = Image_Format.Image_Format_GrayF
Image_Format_AlphaF = Image_Format.Image_Format_AlphaF
Image_Format_RGF = Image_Format.Image_Format_RGF
Image_Format_RGBF = Image_Format.Image_Format_RGBF
Image_Format_BGRF = Image_Format.Image_Format_BGRF
Image_Format_RGBAF = Image_Format.Image_Format_RGBAF
Image_Format_BGRAF = Image_Format.Image_Format_BGRAF
Image_Format_GrayF_half = Image_Format.Image_Format_GrayF_half
Image_Format_RGF_half = Image_Format.Image_Format_RGF_half
Image_Format_RGBAF_half = Image_Format.Image_Format_RGBAF_half
Image_Format_Gray16 = Image_Format.Image_Format_Gray16
Image_Format_NB: int


#classnotwrapped
class Image_AlienPixMap: ...

#classnotwrapped
class Image_ColorRGB: ...

#classnotwrapped
class Image_ColorRGB32: ...

#classnotwrapped
class Image_ColorRGBA: ...

#classnotwrapped
class Image_ColorBGR: ...

#classnotwrapped
class Image_ColorBGR32: ...

#classnotwrapped
class Image_ColorBGRA: ...

#classnotwrapped
class Image_ColorRGF: ...

#classnotwrapped
class Image_ColorRGBF: ...

#classnotwrapped
class Image_ColorBGRF: ...

#classnotwrapped
class Image_ColorRGBAF: ...

#classnotwrapped
class Image_ColorBGRAF: ...

#classnotwrapped
class Image_CompressedPixMap: ...

#classnotwrapped
class Image_DDSParser: ...

#classnotwrapped
class Image_Diff: ...

#classnotwrapped
class Image_PixMap: ...

#classnotwrapped
class Image_PixMapData: ...

#classnotwrapped
class Image_PixMapTypedData: ...

#classnotwrapped
class Image_SupportedFormats: ...

#classnotwrapped
class Image_Texture: ...

#classnotwrapped
class equal_to: ...

#classnotwrapped
class hash: ...

#classnotwrapped
class Image_VideoParams: ...

#classnotwrapped
class Image_VideoRecorder: ...

# harray1 classes
# harray2 classes
# hsequence classes

