/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define QUANTITYDOCSTRING
"Quantity module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_quantity.html"
%enddef
%module (package="OCC.Core", docstring=QUANTITYDOCSTRING) Quantity


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<Quantity_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Quantity_NameOfColor {
	Quantity_NOC_BLACK = 0,
	Quantity_NOC_MATRABLUE = 1,
	Quantity_NOC_MATRAGRAY = 2,
	Quantity_NOC_ALICEBLUE = 3,
	Quantity_NOC_ANTIQUEWHITE = 4,
	Quantity_NOC_ANTIQUEWHITE1 = 5,
	Quantity_NOC_ANTIQUEWHITE2 = 6,
	Quantity_NOC_ANTIQUEWHITE3 = 7,
	Quantity_NOC_ANTIQUEWHITE4 = 8,
	Quantity_NOC_AQUAMARINE1 = 9,
	Quantity_NOC_AQUAMARINE2 = 10,
	Quantity_NOC_AQUAMARINE4 = 11,
	Quantity_NOC_AZURE = 12,
	Quantity_NOC_AZURE2 = 13,
	Quantity_NOC_AZURE3 = 14,
	Quantity_NOC_AZURE4 = 15,
	Quantity_NOC_BEIGE = 16,
	Quantity_NOC_BISQUE = 17,
	Quantity_NOC_BISQUE2 = 18,
	Quantity_NOC_BISQUE3 = 19,
	Quantity_NOC_BISQUE4 = 20,
	Quantity_NOC_BLANCHEDALMOND = 21,
	Quantity_NOC_BLUE = 22,
	Quantity_NOC_BLUE1 = Quantity_NOC_BLUE,
	Quantity_NOC_BLUE2 = 23,
	Quantity_NOC_BLUE3 = 24,
	Quantity_NOC_BLUE4 = 25,
	Quantity_NOC_BLUEVIOLET = 26,
	Quantity_NOC_BROWN = 27,
	Quantity_NOC_BROWN1 = 28,
	Quantity_NOC_BROWN2 = 29,
	Quantity_NOC_BROWN3 = 30,
	Quantity_NOC_BROWN4 = 31,
	Quantity_NOC_BURLYWOOD = 32,
	Quantity_NOC_BURLYWOOD1 = 33,
	Quantity_NOC_BURLYWOOD2 = 34,
	Quantity_NOC_BURLYWOOD3 = 35,
	Quantity_NOC_BURLYWOOD4 = 36,
	Quantity_NOC_CADETBLUE = 37,
	Quantity_NOC_CADETBLUE1 = 38,
	Quantity_NOC_CADETBLUE2 = 39,
	Quantity_NOC_CADETBLUE3 = 40,
	Quantity_NOC_CADETBLUE4 = 41,
	Quantity_NOC_CHARTREUSE = 42,
	Quantity_NOC_CHARTREUSE1 = Quantity_NOC_CHARTREUSE,
	Quantity_NOC_CHARTREUSE2 = 43,
	Quantity_NOC_CHARTREUSE3 = 44,
	Quantity_NOC_CHARTREUSE4 = 45,
	Quantity_NOC_CHOCOLATE = 46,
	Quantity_NOC_CHOCOLATE1 = 47,
	Quantity_NOC_CHOCOLATE2 = 48,
	Quantity_NOC_CHOCOLATE3 = 49,
	Quantity_NOC_CHOCOLATE4 = 50,
	Quantity_NOC_CORAL = 51,
	Quantity_NOC_CORAL1 = 52,
	Quantity_NOC_CORAL2 = 53,
	Quantity_NOC_CORAL3 = 54,
	Quantity_NOC_CORAL4 = 55,
	Quantity_NOC_CORNFLOWERBLUE = 56,
	Quantity_NOC_CORNSILK1 = 57,
	Quantity_NOC_CORNSILK2 = 58,
	Quantity_NOC_CORNSILK3 = 59,
	Quantity_NOC_CORNSILK4 = 60,
	Quantity_NOC_CYAN = 61,
	Quantity_NOC_CYAN1 = Quantity_NOC_CYAN,
	Quantity_NOC_CYAN2 = 62,
	Quantity_NOC_CYAN3 = 63,
	Quantity_NOC_CYAN4 = 64,
	Quantity_NOC_DARKGOLDENROD = 65,
	Quantity_NOC_DARKGOLDENROD1 = 66,
	Quantity_NOC_DARKGOLDENROD2 = 67,
	Quantity_NOC_DARKGOLDENROD3 = 68,
	Quantity_NOC_DARKGOLDENROD4 = 69,
	Quantity_NOC_DARKGREEN = 70,
	Quantity_NOC_DARKKHAKI = 71,
	Quantity_NOC_DARKOLIVEGREEN = 72,
	Quantity_NOC_DARKOLIVEGREEN1 = 73,
	Quantity_NOC_DARKOLIVEGREEN2 = 74,
	Quantity_NOC_DARKOLIVEGREEN3 = 75,
	Quantity_NOC_DARKOLIVEGREEN4 = 76,
	Quantity_NOC_DARKORANGE = 77,
	Quantity_NOC_DARKORANGE1 = 78,
	Quantity_NOC_DARKORANGE2 = 79,
	Quantity_NOC_DARKORANGE3 = 80,
	Quantity_NOC_DARKORANGE4 = 81,
	Quantity_NOC_DARKORCHID = 82,
	Quantity_NOC_DARKORCHID1 = 83,
	Quantity_NOC_DARKORCHID2 = 84,
	Quantity_NOC_DARKORCHID3 = 85,
	Quantity_NOC_DARKORCHID4 = 86,
	Quantity_NOC_DARKSALMON = 87,
	Quantity_NOC_DARKSEAGREEN = 88,
	Quantity_NOC_DARKSEAGREEN1 = 89,
	Quantity_NOC_DARKSEAGREEN2 = 90,
	Quantity_NOC_DARKSEAGREEN3 = 91,
	Quantity_NOC_DARKSEAGREEN4 = 92,
	Quantity_NOC_DARKSLATEBLUE = 93,
	Quantity_NOC_DARKSLATEGRAY1 = 94,
	Quantity_NOC_DARKSLATEGRAY2 = 95,
	Quantity_NOC_DARKSLATEGRAY3 = 96,
	Quantity_NOC_DARKSLATEGRAY4 = 97,
	Quantity_NOC_DARKSLATEGRAY = 98,
	Quantity_NOC_DARKTURQUOISE = 99,
	Quantity_NOC_DARKVIOLET = 100,
	Quantity_NOC_DEEPPINK = 101,
	Quantity_NOC_DEEPPINK2 = 102,
	Quantity_NOC_DEEPPINK3 = 103,
	Quantity_NOC_DEEPPINK4 = 104,
	Quantity_NOC_DEEPSKYBLUE1 = 105,
	Quantity_NOC_DEEPSKYBLUE2 = 106,
	Quantity_NOC_DEEPSKYBLUE3 = 107,
	Quantity_NOC_DEEPSKYBLUE4 = 108,
	Quantity_NOC_DODGERBLUE1 = 109,
	Quantity_NOC_DODGERBLUE2 = 110,
	Quantity_NOC_DODGERBLUE3 = 111,
	Quantity_NOC_DODGERBLUE4 = 112,
	Quantity_NOC_FIREBRICK = 113,
	Quantity_NOC_FIREBRICK1 = 114,
	Quantity_NOC_FIREBRICK2 = 115,
	Quantity_NOC_FIREBRICK3 = 116,
	Quantity_NOC_FIREBRICK4 = 117,
	Quantity_NOC_FLORALWHITE = 118,
	Quantity_NOC_FORESTGREEN = 119,
	Quantity_NOC_GAINSBORO = 120,
	Quantity_NOC_GHOSTWHITE = 121,
	Quantity_NOC_GOLD = 122,
	Quantity_NOC_GOLD1 = Quantity_NOC_GOLD,
	Quantity_NOC_GOLD2 = 123,
	Quantity_NOC_GOLD3 = 124,
	Quantity_NOC_GOLD4 = 125,
	Quantity_NOC_GOLDENROD = 126,
	Quantity_NOC_GOLDENROD1 = 127,
	Quantity_NOC_GOLDENROD2 = 128,
	Quantity_NOC_GOLDENROD3 = 129,
	Quantity_NOC_GOLDENROD4 = 130,
	Quantity_NOC_GRAY = 131,
	Quantity_NOC_GRAY0 = 132,
	Quantity_NOC_GRAY1 = 133,
	Quantity_NOC_GRAY2 = 134,
	Quantity_NOC_GRAY3 = 135,
	Quantity_NOC_GRAY4 = 136,
	Quantity_NOC_GRAY5 = 137,
	Quantity_NOC_GRAY6 = 138,
	Quantity_NOC_GRAY7 = 139,
	Quantity_NOC_GRAY8 = 140,
	Quantity_NOC_GRAY9 = 141,
	Quantity_NOC_GRAY10 = 142,
	Quantity_NOC_GRAY11 = 143,
	Quantity_NOC_GRAY12 = 144,
	Quantity_NOC_GRAY13 = 145,
	Quantity_NOC_GRAY14 = 146,
	Quantity_NOC_GRAY15 = 147,
	Quantity_NOC_GRAY16 = 148,
	Quantity_NOC_GRAY17 = 149,
	Quantity_NOC_GRAY18 = 150,
	Quantity_NOC_GRAY19 = 151,
	Quantity_NOC_GRAY20 = 152,
	Quantity_NOC_GRAY21 = 153,
	Quantity_NOC_GRAY22 = 154,
	Quantity_NOC_GRAY23 = 155,
	Quantity_NOC_GRAY24 = 156,
	Quantity_NOC_GRAY25 = 157,
	Quantity_NOC_GRAY26 = 158,
	Quantity_NOC_GRAY27 = 159,
	Quantity_NOC_GRAY28 = 160,
	Quantity_NOC_GRAY29 = 161,
	Quantity_NOC_GRAY30 = 162,
	Quantity_NOC_GRAY31 = 163,
	Quantity_NOC_GRAY32 = 164,
	Quantity_NOC_GRAY33 = 165,
	Quantity_NOC_GRAY34 = 166,
	Quantity_NOC_GRAY35 = 167,
	Quantity_NOC_GRAY36 = 168,
	Quantity_NOC_GRAY37 = 169,
	Quantity_NOC_GRAY38 = 170,
	Quantity_NOC_GRAY39 = 171,
	Quantity_NOC_GRAY40 = 172,
	Quantity_NOC_GRAY41 = 173,
	Quantity_NOC_GRAY42 = 174,
	Quantity_NOC_GRAY43 = 175,
	Quantity_NOC_GRAY44 = 176,
	Quantity_NOC_GRAY45 = 177,
	Quantity_NOC_GRAY46 = 178,
	Quantity_NOC_GRAY47 = 179,
	Quantity_NOC_GRAY48 = 180,
	Quantity_NOC_GRAY49 = 181,
	Quantity_NOC_GRAY50 = 182,
	Quantity_NOC_GRAY51 = 183,
	Quantity_NOC_GRAY52 = 184,
	Quantity_NOC_GRAY53 = 185,
	Quantity_NOC_GRAY54 = 186,
	Quantity_NOC_GRAY55 = 187,
	Quantity_NOC_GRAY56 = 188,
	Quantity_NOC_GRAY57 = 189,
	Quantity_NOC_GRAY58 = 190,
	Quantity_NOC_GRAY59 = 191,
	Quantity_NOC_GRAY60 = 192,
	Quantity_NOC_GRAY61 = 193,
	Quantity_NOC_GRAY62 = 194,
	Quantity_NOC_GRAY63 = 195,
	Quantity_NOC_GRAY64 = 196,
	Quantity_NOC_GRAY65 = 197,
	Quantity_NOC_GRAY66 = 198,
	Quantity_NOC_GRAY67 = 199,
	Quantity_NOC_GRAY68 = 200,
	Quantity_NOC_GRAY69 = 201,
	Quantity_NOC_GRAY70 = 202,
	Quantity_NOC_GRAY71 = 203,
	Quantity_NOC_GRAY72 = 204,
	Quantity_NOC_GRAY73 = 205,
	Quantity_NOC_GRAY74 = 206,
	Quantity_NOC_GRAY75 = 207,
	Quantity_NOC_GRAY76 = 208,
	Quantity_NOC_GRAY77 = 209,
	Quantity_NOC_GRAY78 = 210,
	Quantity_NOC_GRAY79 = 211,
	Quantity_NOC_GRAY80 = 212,
	Quantity_NOC_GRAY81 = 213,
	Quantity_NOC_GRAY82 = 214,
	Quantity_NOC_GRAY83 = 215,
	Quantity_NOC_GRAY85 = 216,
	Quantity_NOC_GRAY86 = 217,
	Quantity_NOC_GRAY87 = 218,
	Quantity_NOC_GRAY88 = 219,
	Quantity_NOC_GRAY89 = 220,
	Quantity_NOC_GRAY90 = 221,
	Quantity_NOC_GRAY91 = 222,
	Quantity_NOC_GRAY92 = 223,
	Quantity_NOC_GRAY93 = 224,
	Quantity_NOC_GRAY94 = 225,
	Quantity_NOC_GRAY95 = 226,
	Quantity_NOC_GRAY97 = 227,
	Quantity_NOC_GRAY98 = 228,
	Quantity_NOC_GRAY99 = 229,
	Quantity_NOC_GREEN = 230,
	Quantity_NOC_GREEN1 = Quantity_NOC_GREEN,
	Quantity_NOC_GREEN2 = 231,
	Quantity_NOC_GREEN3 = 232,
	Quantity_NOC_GREEN4 = 233,
	Quantity_NOC_GREENYELLOW = 234,
	Quantity_NOC_HONEYDEW = 235,
	Quantity_NOC_HONEYDEW2 = 236,
	Quantity_NOC_HONEYDEW3 = 237,
	Quantity_NOC_HONEYDEW4 = 238,
	Quantity_NOC_HOTPINK = 239,
	Quantity_NOC_HOTPINK1 = 240,
	Quantity_NOC_HOTPINK2 = 241,
	Quantity_NOC_HOTPINK3 = 242,
	Quantity_NOC_HOTPINK4 = 243,
	Quantity_NOC_INDIANRED = 244,
	Quantity_NOC_INDIANRED1 = 245,
	Quantity_NOC_INDIANRED2 = 246,
	Quantity_NOC_INDIANRED3 = 247,
	Quantity_NOC_INDIANRED4 = 248,
	Quantity_NOC_IVORY = 249,
	Quantity_NOC_IVORY2 = 250,
	Quantity_NOC_IVORY3 = 251,
	Quantity_NOC_IVORY4 = 252,
	Quantity_NOC_KHAKI = 253,
	Quantity_NOC_KHAKI1 = 254,
	Quantity_NOC_KHAKI2 = 255,
	Quantity_NOC_KHAKI3 = 256,
	Quantity_NOC_KHAKI4 = 257,
	Quantity_NOC_LAVENDER = 258,
	Quantity_NOC_LAVENDERBLUSH1 = 259,
	Quantity_NOC_LAVENDERBLUSH2 = 260,
	Quantity_NOC_LAVENDERBLUSH3 = 261,
	Quantity_NOC_LAVENDERBLUSH4 = 262,
	Quantity_NOC_LAWNGREEN = 263,
	Quantity_NOC_LEMONCHIFFON1 = 264,
	Quantity_NOC_LEMONCHIFFON2 = 265,
	Quantity_NOC_LEMONCHIFFON3 = 266,
	Quantity_NOC_LEMONCHIFFON4 = 267,
	Quantity_NOC_LIGHTBLUE = 268,
	Quantity_NOC_LIGHTBLUE1 = 269,
	Quantity_NOC_LIGHTBLUE2 = 270,
	Quantity_NOC_LIGHTBLUE3 = 271,
	Quantity_NOC_LIGHTBLUE4 = 272,
	Quantity_NOC_LIGHTCORAL = 273,
	Quantity_NOC_LIGHTCYAN = 274,
	Quantity_NOC_LIGHTCYAN1 = Quantity_NOC_LIGHTCYAN,
	Quantity_NOC_LIGHTCYAN2 = 275,
	Quantity_NOC_LIGHTCYAN3 = 276,
	Quantity_NOC_LIGHTCYAN4 = 277,
	Quantity_NOC_LIGHTGOLDENROD = 278,
	Quantity_NOC_LIGHTGOLDENROD1 = 279,
	Quantity_NOC_LIGHTGOLDENROD2 = 280,
	Quantity_NOC_LIGHTGOLDENROD3 = 281,
	Quantity_NOC_LIGHTGOLDENROD4 = 282,
	Quantity_NOC_LIGHTGOLDENRODYELLOW = 283,
	Quantity_NOC_LIGHTGRAY = 284,
	Quantity_NOC_LIGHTPINK = 285,
	Quantity_NOC_LIGHTPINK1 = 286,
	Quantity_NOC_LIGHTPINK2 = 287,
	Quantity_NOC_LIGHTPINK3 = 288,
	Quantity_NOC_LIGHTPINK4 = 289,
	Quantity_NOC_LIGHTSALMON1 = 290,
	Quantity_NOC_LIGHTSALMON2 = 291,
	Quantity_NOC_LIGHTSALMON3 = 292,
	Quantity_NOC_LIGHTSALMON4 = 293,
	Quantity_NOC_LIGHTSEAGREEN = 294,
	Quantity_NOC_LIGHTSKYBLUE = 295,
	Quantity_NOC_LIGHTSKYBLUE1 = 296,
	Quantity_NOC_LIGHTSKYBLUE2 = 297,
	Quantity_NOC_LIGHTSKYBLUE3 = 298,
	Quantity_NOC_LIGHTSKYBLUE4 = 299,
	Quantity_NOC_LIGHTSLATEBLUE = 300,
	Quantity_NOC_LIGHTSLATEGRAY = 301,
	Quantity_NOC_LIGHTSTEELBLUE = 302,
	Quantity_NOC_LIGHTSTEELBLUE1 = 303,
	Quantity_NOC_LIGHTSTEELBLUE2 = 304,
	Quantity_NOC_LIGHTSTEELBLUE3 = 305,
	Quantity_NOC_LIGHTSTEELBLUE4 = 306,
	Quantity_NOC_LIGHTYELLOW = 307,
	Quantity_NOC_LIGHTYELLOW2 = 308,
	Quantity_NOC_LIGHTYELLOW3 = 309,
	Quantity_NOC_LIGHTYELLOW4 = 310,
	Quantity_NOC_LIMEGREEN = 311,
	Quantity_NOC_LINEN = 312,
	Quantity_NOC_MAGENTA = 313,
	Quantity_NOC_MAGENTA1 = Quantity_NOC_MAGENTA,
	Quantity_NOC_MAGENTA2 = 314,
	Quantity_NOC_MAGENTA3 = 315,
	Quantity_NOC_MAGENTA4 = 316,
	Quantity_NOC_MAROON = 317,
	Quantity_NOC_MAROON1 = 318,
	Quantity_NOC_MAROON2 = 319,
	Quantity_NOC_MAROON3 = 320,
	Quantity_NOC_MAROON4 = 321,
	Quantity_NOC_MEDIUMAQUAMARINE = 322,
	Quantity_NOC_MEDIUMORCHID = 323,
	Quantity_NOC_MEDIUMORCHID1 = 324,
	Quantity_NOC_MEDIUMORCHID2 = 325,
	Quantity_NOC_MEDIUMORCHID3 = 326,
	Quantity_NOC_MEDIUMORCHID4 = 327,
	Quantity_NOC_MEDIUMPURPLE = 328,
	Quantity_NOC_MEDIUMPURPLE1 = 329,
	Quantity_NOC_MEDIUMPURPLE2 = 330,
	Quantity_NOC_MEDIUMPURPLE3 = 331,
	Quantity_NOC_MEDIUMPURPLE4 = 332,
	Quantity_NOC_MEDIUMSEAGREEN = 333,
	Quantity_NOC_MEDIUMSLATEBLUE = 334,
	Quantity_NOC_MEDIUMSPRINGGREEN = 335,
	Quantity_NOC_MEDIUMTURQUOISE = 336,
	Quantity_NOC_MEDIUMVIOLETRED = 337,
	Quantity_NOC_MIDNIGHTBLUE = 338,
	Quantity_NOC_MINTCREAM = 339,
	Quantity_NOC_MISTYROSE = 340,
	Quantity_NOC_MISTYROSE2 = 341,
	Quantity_NOC_MISTYROSE3 = 342,
	Quantity_NOC_MISTYROSE4 = 343,
	Quantity_NOC_MOCCASIN = 344,
	Quantity_NOC_NAVAJOWHITE1 = 345,
	Quantity_NOC_NAVAJOWHITE2 = 346,
	Quantity_NOC_NAVAJOWHITE3 = 347,
	Quantity_NOC_NAVAJOWHITE4 = 348,
	Quantity_NOC_NAVYBLUE = 349,
	Quantity_NOC_OLDLACE = 350,
	Quantity_NOC_OLIVEDRAB = 351,
	Quantity_NOC_OLIVEDRAB1 = 352,
	Quantity_NOC_OLIVEDRAB2 = 353,
	Quantity_NOC_OLIVEDRAB3 = 354,
	Quantity_NOC_OLIVEDRAB4 = 355,
	Quantity_NOC_ORANGE = 356,
	Quantity_NOC_ORANGE1 = Quantity_NOC_ORANGE,
	Quantity_NOC_ORANGE2 = 357,
	Quantity_NOC_ORANGE3 = 358,
	Quantity_NOC_ORANGE4 = 359,
	Quantity_NOC_ORANGERED = 360,
	Quantity_NOC_ORANGERED1 = Quantity_NOC_ORANGERED,
	Quantity_NOC_ORANGERED2 = 361,
	Quantity_NOC_ORANGERED3 = 362,
	Quantity_NOC_ORANGERED4 = 363,
	Quantity_NOC_ORCHID = 364,
	Quantity_NOC_ORCHID1 = 365,
	Quantity_NOC_ORCHID2 = 366,
	Quantity_NOC_ORCHID3 = 367,
	Quantity_NOC_ORCHID4 = 368,
	Quantity_NOC_PALEGOLDENROD = 369,
	Quantity_NOC_PALEGREEN = 370,
	Quantity_NOC_PALEGREEN1 = 371,
	Quantity_NOC_PALEGREEN2 = 372,
	Quantity_NOC_PALEGREEN3 = 373,
	Quantity_NOC_PALEGREEN4 = 374,
	Quantity_NOC_PALETURQUOISE = 375,
	Quantity_NOC_PALETURQUOISE1 = 376,
	Quantity_NOC_PALETURQUOISE2 = 377,
	Quantity_NOC_PALETURQUOISE3 = 378,
	Quantity_NOC_PALETURQUOISE4 = 379,
	Quantity_NOC_PALEVIOLETRED = 380,
	Quantity_NOC_PALEVIOLETRED1 = 381,
	Quantity_NOC_PALEVIOLETRED2 = 382,
	Quantity_NOC_PALEVIOLETRED3 = 383,
	Quantity_NOC_PALEVIOLETRED4 = 384,
	Quantity_NOC_PAPAYAWHIP = 385,
	Quantity_NOC_PEACHPUFF = 386,
	Quantity_NOC_PEACHPUFF2 = 387,
	Quantity_NOC_PEACHPUFF3 = 388,
	Quantity_NOC_PEACHPUFF4 = 389,
	Quantity_NOC_PERU = 390,
	Quantity_NOC_PINK = 391,
	Quantity_NOC_PINK1 = 392,
	Quantity_NOC_PINK2 = 393,
	Quantity_NOC_PINK3 = 394,
	Quantity_NOC_PINK4 = 395,
	Quantity_NOC_PLUM = 396,
	Quantity_NOC_PLUM1 = 397,
	Quantity_NOC_PLUM2 = 398,
	Quantity_NOC_PLUM3 = 399,
	Quantity_NOC_PLUM4 = 400,
	Quantity_NOC_POWDERBLUE = 401,
	Quantity_NOC_PURPLE = 402,
	Quantity_NOC_PURPLE1 = 403,
	Quantity_NOC_PURPLE2 = 404,
	Quantity_NOC_PURPLE3 = 405,
	Quantity_NOC_PURPLE4 = 406,
	Quantity_NOC_RED = 407,
	Quantity_NOC_RED1 = Quantity_NOC_RED,
	Quantity_NOC_RED2 = 408,
	Quantity_NOC_RED3 = 409,
	Quantity_NOC_RED4 = 410,
	Quantity_NOC_ROSYBROWN = 411,
	Quantity_NOC_ROSYBROWN1 = 412,
	Quantity_NOC_ROSYBROWN2 = 413,
	Quantity_NOC_ROSYBROWN3 = 414,
	Quantity_NOC_ROSYBROWN4 = 415,
	Quantity_NOC_ROYALBLUE = 416,
	Quantity_NOC_ROYALBLUE1 = 417,
	Quantity_NOC_ROYALBLUE2 = 418,
	Quantity_NOC_ROYALBLUE3 = 419,
	Quantity_NOC_ROYALBLUE4 = 420,
	Quantity_NOC_SADDLEBROWN = 421,
	Quantity_NOC_SALMON = 422,
	Quantity_NOC_SALMON1 = 423,
	Quantity_NOC_SALMON2 = 424,
	Quantity_NOC_SALMON3 = 425,
	Quantity_NOC_SALMON4 = 426,
	Quantity_NOC_SANDYBROWN = 427,
	Quantity_NOC_SEAGREEN = 428,
	Quantity_NOC_SEAGREEN1 = 429,
	Quantity_NOC_SEAGREEN2 = 430,
	Quantity_NOC_SEAGREEN3 = 431,
	Quantity_NOC_SEAGREEN4 = 432,
	Quantity_NOC_SEASHELL = 433,
	Quantity_NOC_SEASHELL2 = 434,
	Quantity_NOC_SEASHELL3 = 435,
	Quantity_NOC_SEASHELL4 = 436,
	Quantity_NOC_BEET = 437,
	Quantity_NOC_TEAL = 438,
	Quantity_NOC_SIENNA = 439,
	Quantity_NOC_SIENNA1 = 440,
	Quantity_NOC_SIENNA2 = 441,
	Quantity_NOC_SIENNA3 = 442,
	Quantity_NOC_SIENNA4 = 443,
	Quantity_NOC_SKYBLUE = 444,
	Quantity_NOC_SKYBLUE1 = 445,
	Quantity_NOC_SKYBLUE2 = 446,
	Quantity_NOC_SKYBLUE3 = 447,
	Quantity_NOC_SKYBLUE4 = 448,
	Quantity_NOC_SLATEBLUE = 449,
	Quantity_NOC_SLATEBLUE1 = 450,
	Quantity_NOC_SLATEBLUE2 = 451,
	Quantity_NOC_SLATEBLUE3 = 452,
	Quantity_NOC_SLATEBLUE4 = 453,
	Quantity_NOC_SLATEGRAY1 = 454,
	Quantity_NOC_SLATEGRAY2 = 455,
	Quantity_NOC_SLATEGRAY3 = 456,
	Quantity_NOC_SLATEGRAY4 = 457,
	Quantity_NOC_SLATEGRAY = 458,
	Quantity_NOC_SNOW = 459,
	Quantity_NOC_SNOW2 = 460,
	Quantity_NOC_SNOW3 = 461,
	Quantity_NOC_SNOW4 = 462,
	Quantity_NOC_SPRINGGREEN = 463,
	Quantity_NOC_SPRINGGREEN2 = 464,
	Quantity_NOC_SPRINGGREEN3 = 465,
	Quantity_NOC_SPRINGGREEN4 = 466,
	Quantity_NOC_STEELBLUE = 467,
	Quantity_NOC_STEELBLUE1 = 468,
	Quantity_NOC_STEELBLUE2 = 469,
	Quantity_NOC_STEELBLUE3 = 470,
	Quantity_NOC_STEELBLUE4 = 471,
	Quantity_NOC_TAN = 472,
	Quantity_NOC_TAN1 = 473,
	Quantity_NOC_TAN2 = 474,
	Quantity_NOC_TAN3 = 475,
	Quantity_NOC_TAN4 = 476,
	Quantity_NOC_THISTLE = 477,
	Quantity_NOC_THISTLE1 = 478,
	Quantity_NOC_THISTLE2 = 479,
	Quantity_NOC_THISTLE3 = 480,
	Quantity_NOC_THISTLE4 = 481,
	Quantity_NOC_TOMATO = 482,
	Quantity_NOC_TOMATO1 = Quantity_NOC_TOMATO,
	Quantity_NOC_TOMATO2 = 483,
	Quantity_NOC_TOMATO3 = 484,
	Quantity_NOC_TOMATO4 = 485,
	Quantity_NOC_TURQUOISE = 486,
	Quantity_NOC_TURQUOISE1 = 487,
	Quantity_NOC_TURQUOISE2 = 488,
	Quantity_NOC_TURQUOISE3 = 489,
	Quantity_NOC_TURQUOISE4 = 490,
	Quantity_NOC_VIOLET = 491,
	Quantity_NOC_VIOLETRED = 492,
	Quantity_NOC_VIOLETRED1 = 493,
	Quantity_NOC_VIOLETRED2 = 494,
	Quantity_NOC_VIOLETRED3 = 495,
	Quantity_NOC_VIOLETRED4 = 496,
	Quantity_NOC_WHEAT = 497,
	Quantity_NOC_WHEAT1 = 498,
	Quantity_NOC_WHEAT2 = 499,
	Quantity_NOC_WHEAT3 = 500,
	Quantity_NOC_WHEAT4 = 501,
	Quantity_NOC_WHITESMOKE = 502,
	Quantity_NOC_YELLOW = 503,
	Quantity_NOC_YELLOW1 = Quantity_NOC_YELLOW,
	Quantity_NOC_YELLOW2 = 504,
	Quantity_NOC_YELLOW3 = 505,
	Quantity_NOC_YELLOW4 = 506,
	Quantity_NOC_YELLOWGREEN = 507,
	Quantity_NOC_WHITE = 508,
};

enum Quantity_TypeOfColor {
	Quantity_TOC_RGB = 0,
	Quantity_TOC_sRGB = 1,
	Quantity_TOC_HLS = 2,
	Quantity_TOC_CIELab = 3,
	Quantity_TOC_CIELch = 4,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Quantity_NameOfColor(IntEnum):
	Quantity_NOC_BLACK = 0
	Quantity_NOC_MATRABLUE = 1
	Quantity_NOC_MATRAGRAY = 2
	Quantity_NOC_ALICEBLUE = 3
	Quantity_NOC_ANTIQUEWHITE = 4
	Quantity_NOC_ANTIQUEWHITE1 = 5
	Quantity_NOC_ANTIQUEWHITE2 = 6
	Quantity_NOC_ANTIQUEWHITE3 = 7
	Quantity_NOC_ANTIQUEWHITE4 = 8
	Quantity_NOC_AQUAMARINE1 = 9
	Quantity_NOC_AQUAMARINE2 = 10
	Quantity_NOC_AQUAMARINE4 = 11
	Quantity_NOC_AZURE = 12
	Quantity_NOC_AZURE2 = 13
	Quantity_NOC_AZURE3 = 14
	Quantity_NOC_AZURE4 = 15
	Quantity_NOC_BEIGE = 16
	Quantity_NOC_BISQUE = 17
	Quantity_NOC_BISQUE2 = 18
	Quantity_NOC_BISQUE3 = 19
	Quantity_NOC_BISQUE4 = 20
	Quantity_NOC_BLANCHEDALMOND = 21
	Quantity_NOC_BLUE = 22
	Quantity_NOC_BLUE1 = Quantity_NOC_BLUE
	Quantity_NOC_BLUE2 = 23
	Quantity_NOC_BLUE3 = 24
	Quantity_NOC_BLUE4 = 25
	Quantity_NOC_BLUEVIOLET = 26
	Quantity_NOC_BROWN = 27
	Quantity_NOC_BROWN1 = 28
	Quantity_NOC_BROWN2 = 29
	Quantity_NOC_BROWN3 = 30
	Quantity_NOC_BROWN4 = 31
	Quantity_NOC_BURLYWOOD = 32
	Quantity_NOC_BURLYWOOD1 = 33
	Quantity_NOC_BURLYWOOD2 = 34
	Quantity_NOC_BURLYWOOD3 = 35
	Quantity_NOC_BURLYWOOD4 = 36
	Quantity_NOC_CADETBLUE = 37
	Quantity_NOC_CADETBLUE1 = 38
	Quantity_NOC_CADETBLUE2 = 39
	Quantity_NOC_CADETBLUE3 = 40
	Quantity_NOC_CADETBLUE4 = 41
	Quantity_NOC_CHARTREUSE = 42
	Quantity_NOC_CHARTREUSE1 = Quantity_NOC_CHARTREUSE
	Quantity_NOC_CHARTREUSE2 = 43
	Quantity_NOC_CHARTREUSE3 = 44
	Quantity_NOC_CHARTREUSE4 = 45
	Quantity_NOC_CHOCOLATE = 46
	Quantity_NOC_CHOCOLATE1 = 47
	Quantity_NOC_CHOCOLATE2 = 48
	Quantity_NOC_CHOCOLATE3 = 49
	Quantity_NOC_CHOCOLATE4 = 50
	Quantity_NOC_CORAL = 51
	Quantity_NOC_CORAL1 = 52
	Quantity_NOC_CORAL2 = 53
	Quantity_NOC_CORAL3 = 54
	Quantity_NOC_CORAL4 = 55
	Quantity_NOC_CORNFLOWERBLUE = 56
	Quantity_NOC_CORNSILK1 = 57
	Quantity_NOC_CORNSILK2 = 58
	Quantity_NOC_CORNSILK3 = 59
	Quantity_NOC_CORNSILK4 = 60
	Quantity_NOC_CYAN = 61
	Quantity_NOC_CYAN1 = Quantity_NOC_CYAN
	Quantity_NOC_CYAN2 = 62
	Quantity_NOC_CYAN3 = 63
	Quantity_NOC_CYAN4 = 64
	Quantity_NOC_DARKGOLDENROD = 65
	Quantity_NOC_DARKGOLDENROD1 = 66
	Quantity_NOC_DARKGOLDENROD2 = 67
	Quantity_NOC_DARKGOLDENROD3 = 68
	Quantity_NOC_DARKGOLDENROD4 = 69
	Quantity_NOC_DARKGREEN = 70
	Quantity_NOC_DARKKHAKI = 71
	Quantity_NOC_DARKOLIVEGREEN = 72
	Quantity_NOC_DARKOLIVEGREEN1 = 73
	Quantity_NOC_DARKOLIVEGREEN2 = 74
	Quantity_NOC_DARKOLIVEGREEN3 = 75
	Quantity_NOC_DARKOLIVEGREEN4 = 76
	Quantity_NOC_DARKORANGE = 77
	Quantity_NOC_DARKORANGE1 = 78
	Quantity_NOC_DARKORANGE2 = 79
	Quantity_NOC_DARKORANGE3 = 80
	Quantity_NOC_DARKORANGE4 = 81
	Quantity_NOC_DARKORCHID = 82
	Quantity_NOC_DARKORCHID1 = 83
	Quantity_NOC_DARKORCHID2 = 84
	Quantity_NOC_DARKORCHID3 = 85
	Quantity_NOC_DARKORCHID4 = 86
	Quantity_NOC_DARKSALMON = 87
	Quantity_NOC_DARKSEAGREEN = 88
	Quantity_NOC_DARKSEAGREEN1 = 89
	Quantity_NOC_DARKSEAGREEN2 = 90
	Quantity_NOC_DARKSEAGREEN3 = 91
	Quantity_NOC_DARKSEAGREEN4 = 92
	Quantity_NOC_DARKSLATEBLUE = 93
	Quantity_NOC_DARKSLATEGRAY1 = 94
	Quantity_NOC_DARKSLATEGRAY2 = 95
	Quantity_NOC_DARKSLATEGRAY3 = 96
	Quantity_NOC_DARKSLATEGRAY4 = 97
	Quantity_NOC_DARKSLATEGRAY = 98
	Quantity_NOC_DARKTURQUOISE = 99
	Quantity_NOC_DARKVIOLET = 100
	Quantity_NOC_DEEPPINK = 101
	Quantity_NOC_DEEPPINK2 = 102
	Quantity_NOC_DEEPPINK3 = 103
	Quantity_NOC_DEEPPINK4 = 104
	Quantity_NOC_DEEPSKYBLUE1 = 105
	Quantity_NOC_DEEPSKYBLUE2 = 106
	Quantity_NOC_DEEPSKYBLUE3 = 107
	Quantity_NOC_DEEPSKYBLUE4 = 108
	Quantity_NOC_DODGERBLUE1 = 109
	Quantity_NOC_DODGERBLUE2 = 110
	Quantity_NOC_DODGERBLUE3 = 111
	Quantity_NOC_DODGERBLUE4 = 112
	Quantity_NOC_FIREBRICK = 113
	Quantity_NOC_FIREBRICK1 = 114
	Quantity_NOC_FIREBRICK2 = 115
	Quantity_NOC_FIREBRICK3 = 116
	Quantity_NOC_FIREBRICK4 = 117
	Quantity_NOC_FLORALWHITE = 118
	Quantity_NOC_FORESTGREEN = 119
	Quantity_NOC_GAINSBORO = 120
	Quantity_NOC_GHOSTWHITE = 121
	Quantity_NOC_GOLD = 122
	Quantity_NOC_GOLD1 = Quantity_NOC_GOLD
	Quantity_NOC_GOLD2 = 123
	Quantity_NOC_GOLD3 = 124
	Quantity_NOC_GOLD4 = 125
	Quantity_NOC_GOLDENROD = 126
	Quantity_NOC_GOLDENROD1 = 127
	Quantity_NOC_GOLDENROD2 = 128
	Quantity_NOC_GOLDENROD3 = 129
	Quantity_NOC_GOLDENROD4 = 130
	Quantity_NOC_GRAY = 131
	Quantity_NOC_GRAY0 = 132
	Quantity_NOC_GRAY1 = 133
	Quantity_NOC_GRAY2 = 134
	Quantity_NOC_GRAY3 = 135
	Quantity_NOC_GRAY4 = 136
	Quantity_NOC_GRAY5 = 137
	Quantity_NOC_GRAY6 = 138
	Quantity_NOC_GRAY7 = 139
	Quantity_NOC_GRAY8 = 140
	Quantity_NOC_GRAY9 = 141
	Quantity_NOC_GRAY10 = 142
	Quantity_NOC_GRAY11 = 143
	Quantity_NOC_GRAY12 = 144
	Quantity_NOC_GRAY13 = 145
	Quantity_NOC_GRAY14 = 146
	Quantity_NOC_GRAY15 = 147
	Quantity_NOC_GRAY16 = 148
	Quantity_NOC_GRAY17 = 149
	Quantity_NOC_GRAY18 = 150
	Quantity_NOC_GRAY19 = 151
	Quantity_NOC_GRAY20 = 152
	Quantity_NOC_GRAY21 = 153
	Quantity_NOC_GRAY22 = 154
	Quantity_NOC_GRAY23 = 155
	Quantity_NOC_GRAY24 = 156
	Quantity_NOC_GRAY25 = 157
	Quantity_NOC_GRAY26 = 158
	Quantity_NOC_GRAY27 = 159
	Quantity_NOC_GRAY28 = 160
	Quantity_NOC_GRAY29 = 161
	Quantity_NOC_GRAY30 = 162
	Quantity_NOC_GRAY31 = 163
	Quantity_NOC_GRAY32 = 164
	Quantity_NOC_GRAY33 = 165
	Quantity_NOC_GRAY34 = 166
	Quantity_NOC_GRAY35 = 167
	Quantity_NOC_GRAY36 = 168
	Quantity_NOC_GRAY37 = 169
	Quantity_NOC_GRAY38 = 170
	Quantity_NOC_GRAY39 = 171
	Quantity_NOC_GRAY40 = 172
	Quantity_NOC_GRAY41 = 173
	Quantity_NOC_GRAY42 = 174
	Quantity_NOC_GRAY43 = 175
	Quantity_NOC_GRAY44 = 176
	Quantity_NOC_GRAY45 = 177
	Quantity_NOC_GRAY46 = 178
	Quantity_NOC_GRAY47 = 179
	Quantity_NOC_GRAY48 = 180
	Quantity_NOC_GRAY49 = 181
	Quantity_NOC_GRAY50 = 182
	Quantity_NOC_GRAY51 = 183
	Quantity_NOC_GRAY52 = 184
	Quantity_NOC_GRAY53 = 185
	Quantity_NOC_GRAY54 = 186
	Quantity_NOC_GRAY55 = 187
	Quantity_NOC_GRAY56 = 188
	Quantity_NOC_GRAY57 = 189
	Quantity_NOC_GRAY58 = 190
	Quantity_NOC_GRAY59 = 191
	Quantity_NOC_GRAY60 = 192
	Quantity_NOC_GRAY61 = 193
	Quantity_NOC_GRAY62 = 194
	Quantity_NOC_GRAY63 = 195
	Quantity_NOC_GRAY64 = 196
	Quantity_NOC_GRAY65 = 197
	Quantity_NOC_GRAY66 = 198
	Quantity_NOC_GRAY67 = 199
	Quantity_NOC_GRAY68 = 200
	Quantity_NOC_GRAY69 = 201
	Quantity_NOC_GRAY70 = 202
	Quantity_NOC_GRAY71 = 203
	Quantity_NOC_GRAY72 = 204
	Quantity_NOC_GRAY73 = 205
	Quantity_NOC_GRAY74 = 206
	Quantity_NOC_GRAY75 = 207
	Quantity_NOC_GRAY76 = 208
	Quantity_NOC_GRAY77 = 209
	Quantity_NOC_GRAY78 = 210
	Quantity_NOC_GRAY79 = 211
	Quantity_NOC_GRAY80 = 212
	Quantity_NOC_GRAY81 = 213
	Quantity_NOC_GRAY82 = 214
	Quantity_NOC_GRAY83 = 215
	Quantity_NOC_GRAY85 = 216
	Quantity_NOC_GRAY86 = 217
	Quantity_NOC_GRAY87 = 218
	Quantity_NOC_GRAY88 = 219
	Quantity_NOC_GRAY89 = 220
	Quantity_NOC_GRAY90 = 221
	Quantity_NOC_GRAY91 = 222
	Quantity_NOC_GRAY92 = 223
	Quantity_NOC_GRAY93 = 224
	Quantity_NOC_GRAY94 = 225
	Quantity_NOC_GRAY95 = 226
	Quantity_NOC_GRAY97 = 227
	Quantity_NOC_GRAY98 = 228
	Quantity_NOC_GRAY99 = 229
	Quantity_NOC_GREEN = 230
	Quantity_NOC_GREEN1 = Quantity_NOC_GREEN
	Quantity_NOC_GREEN2 = 231
	Quantity_NOC_GREEN3 = 232
	Quantity_NOC_GREEN4 = 233
	Quantity_NOC_GREENYELLOW = 234
	Quantity_NOC_HONEYDEW = 235
	Quantity_NOC_HONEYDEW2 = 236
	Quantity_NOC_HONEYDEW3 = 237
	Quantity_NOC_HONEYDEW4 = 238
	Quantity_NOC_HOTPINK = 239
	Quantity_NOC_HOTPINK1 = 240
	Quantity_NOC_HOTPINK2 = 241
	Quantity_NOC_HOTPINK3 = 242
	Quantity_NOC_HOTPINK4 = 243
	Quantity_NOC_INDIANRED = 244
	Quantity_NOC_INDIANRED1 = 245
	Quantity_NOC_INDIANRED2 = 246
	Quantity_NOC_INDIANRED3 = 247
	Quantity_NOC_INDIANRED4 = 248
	Quantity_NOC_IVORY = 249
	Quantity_NOC_IVORY2 = 250
	Quantity_NOC_IVORY3 = 251
	Quantity_NOC_IVORY4 = 252
	Quantity_NOC_KHAKI = 253
	Quantity_NOC_KHAKI1 = 254
	Quantity_NOC_KHAKI2 = 255
	Quantity_NOC_KHAKI3 = 256
	Quantity_NOC_KHAKI4 = 257
	Quantity_NOC_LAVENDER = 258
	Quantity_NOC_LAVENDERBLUSH1 = 259
	Quantity_NOC_LAVENDERBLUSH2 = 260
	Quantity_NOC_LAVENDERBLUSH3 = 261
	Quantity_NOC_LAVENDERBLUSH4 = 262
	Quantity_NOC_LAWNGREEN = 263
	Quantity_NOC_LEMONCHIFFON1 = 264
	Quantity_NOC_LEMONCHIFFON2 = 265
	Quantity_NOC_LEMONCHIFFON3 = 266
	Quantity_NOC_LEMONCHIFFON4 = 267
	Quantity_NOC_LIGHTBLUE = 268
	Quantity_NOC_LIGHTBLUE1 = 269
	Quantity_NOC_LIGHTBLUE2 = 270
	Quantity_NOC_LIGHTBLUE3 = 271
	Quantity_NOC_LIGHTBLUE4 = 272
	Quantity_NOC_LIGHTCORAL = 273
	Quantity_NOC_LIGHTCYAN = 274
	Quantity_NOC_LIGHTCYAN1 = Quantity_NOC_LIGHTCYAN
	Quantity_NOC_LIGHTCYAN2 = 275
	Quantity_NOC_LIGHTCYAN3 = 276
	Quantity_NOC_LIGHTCYAN4 = 277
	Quantity_NOC_LIGHTGOLDENROD = 278
	Quantity_NOC_LIGHTGOLDENROD1 = 279
	Quantity_NOC_LIGHTGOLDENROD2 = 280
	Quantity_NOC_LIGHTGOLDENROD3 = 281
	Quantity_NOC_LIGHTGOLDENROD4 = 282
	Quantity_NOC_LIGHTGOLDENRODYELLOW = 283
	Quantity_NOC_LIGHTGRAY = 284
	Quantity_NOC_LIGHTPINK = 285
	Quantity_NOC_LIGHTPINK1 = 286
	Quantity_NOC_LIGHTPINK2 = 287
	Quantity_NOC_LIGHTPINK3 = 288
	Quantity_NOC_LIGHTPINK4 = 289
	Quantity_NOC_LIGHTSALMON1 = 290
	Quantity_NOC_LIGHTSALMON2 = 291
	Quantity_NOC_LIGHTSALMON3 = 292
	Quantity_NOC_LIGHTSALMON4 = 293
	Quantity_NOC_LIGHTSEAGREEN = 294
	Quantity_NOC_LIGHTSKYBLUE = 295
	Quantity_NOC_LIGHTSKYBLUE1 = 296
	Quantity_NOC_LIGHTSKYBLUE2 = 297
	Quantity_NOC_LIGHTSKYBLUE3 = 298
	Quantity_NOC_LIGHTSKYBLUE4 = 299
	Quantity_NOC_LIGHTSLATEBLUE = 300
	Quantity_NOC_LIGHTSLATEGRAY = 301
	Quantity_NOC_LIGHTSTEELBLUE = 302
	Quantity_NOC_LIGHTSTEELBLUE1 = 303
	Quantity_NOC_LIGHTSTEELBLUE2 = 304
	Quantity_NOC_LIGHTSTEELBLUE3 = 305
	Quantity_NOC_LIGHTSTEELBLUE4 = 306
	Quantity_NOC_LIGHTYELLOW = 307
	Quantity_NOC_LIGHTYELLOW2 = 308
	Quantity_NOC_LIGHTYELLOW3 = 309
	Quantity_NOC_LIGHTYELLOW4 = 310
	Quantity_NOC_LIMEGREEN = 311
	Quantity_NOC_LINEN = 312
	Quantity_NOC_MAGENTA = 313
	Quantity_NOC_MAGENTA1 = Quantity_NOC_MAGENTA
	Quantity_NOC_MAGENTA2 = 314
	Quantity_NOC_MAGENTA3 = 315
	Quantity_NOC_MAGENTA4 = 316
	Quantity_NOC_MAROON = 317
	Quantity_NOC_MAROON1 = 318
	Quantity_NOC_MAROON2 = 319
	Quantity_NOC_MAROON3 = 320
	Quantity_NOC_MAROON4 = 321
	Quantity_NOC_MEDIUMAQUAMARINE = 322
	Quantity_NOC_MEDIUMORCHID = 323
	Quantity_NOC_MEDIUMORCHID1 = 324
	Quantity_NOC_MEDIUMORCHID2 = 325
	Quantity_NOC_MEDIUMORCHID3 = 326
	Quantity_NOC_MEDIUMORCHID4 = 327
	Quantity_NOC_MEDIUMPURPLE = 328
	Quantity_NOC_MEDIUMPURPLE1 = 329
	Quantity_NOC_MEDIUMPURPLE2 = 330
	Quantity_NOC_MEDIUMPURPLE3 = 331
	Quantity_NOC_MEDIUMPURPLE4 = 332
	Quantity_NOC_MEDIUMSEAGREEN = 333
	Quantity_NOC_MEDIUMSLATEBLUE = 334
	Quantity_NOC_MEDIUMSPRINGGREEN = 335
	Quantity_NOC_MEDIUMTURQUOISE = 336
	Quantity_NOC_MEDIUMVIOLETRED = 337
	Quantity_NOC_MIDNIGHTBLUE = 338
	Quantity_NOC_MINTCREAM = 339
	Quantity_NOC_MISTYROSE = 340
	Quantity_NOC_MISTYROSE2 = 341
	Quantity_NOC_MISTYROSE3 = 342
	Quantity_NOC_MISTYROSE4 = 343
	Quantity_NOC_MOCCASIN = 344
	Quantity_NOC_NAVAJOWHITE1 = 345
	Quantity_NOC_NAVAJOWHITE2 = 346
	Quantity_NOC_NAVAJOWHITE3 = 347
	Quantity_NOC_NAVAJOWHITE4 = 348
	Quantity_NOC_NAVYBLUE = 349
	Quantity_NOC_OLDLACE = 350
	Quantity_NOC_OLIVEDRAB = 351
	Quantity_NOC_OLIVEDRAB1 = 352
	Quantity_NOC_OLIVEDRAB2 = 353
	Quantity_NOC_OLIVEDRAB3 = 354
	Quantity_NOC_OLIVEDRAB4 = 355
	Quantity_NOC_ORANGE = 356
	Quantity_NOC_ORANGE1 = Quantity_NOC_ORANGE
	Quantity_NOC_ORANGE2 = 357
	Quantity_NOC_ORANGE3 = 358
	Quantity_NOC_ORANGE4 = 359
	Quantity_NOC_ORANGERED = 360
	Quantity_NOC_ORANGERED1 = Quantity_NOC_ORANGERED
	Quantity_NOC_ORANGERED2 = 361
	Quantity_NOC_ORANGERED3 = 362
	Quantity_NOC_ORANGERED4 = 363
	Quantity_NOC_ORCHID = 364
	Quantity_NOC_ORCHID1 = 365
	Quantity_NOC_ORCHID2 = 366
	Quantity_NOC_ORCHID3 = 367
	Quantity_NOC_ORCHID4 = 368
	Quantity_NOC_PALEGOLDENROD = 369
	Quantity_NOC_PALEGREEN = 370
	Quantity_NOC_PALEGREEN1 = 371
	Quantity_NOC_PALEGREEN2 = 372
	Quantity_NOC_PALEGREEN3 = 373
	Quantity_NOC_PALEGREEN4 = 374
	Quantity_NOC_PALETURQUOISE = 375
	Quantity_NOC_PALETURQUOISE1 = 376
	Quantity_NOC_PALETURQUOISE2 = 377
	Quantity_NOC_PALETURQUOISE3 = 378
	Quantity_NOC_PALETURQUOISE4 = 379
	Quantity_NOC_PALEVIOLETRED = 380
	Quantity_NOC_PALEVIOLETRED1 = 381
	Quantity_NOC_PALEVIOLETRED2 = 382
	Quantity_NOC_PALEVIOLETRED3 = 383
	Quantity_NOC_PALEVIOLETRED4 = 384
	Quantity_NOC_PAPAYAWHIP = 385
	Quantity_NOC_PEACHPUFF = 386
	Quantity_NOC_PEACHPUFF2 = 387
	Quantity_NOC_PEACHPUFF3 = 388
	Quantity_NOC_PEACHPUFF4 = 389
	Quantity_NOC_PERU = 390
	Quantity_NOC_PINK = 391
	Quantity_NOC_PINK1 = 392
	Quantity_NOC_PINK2 = 393
	Quantity_NOC_PINK3 = 394
	Quantity_NOC_PINK4 = 395
	Quantity_NOC_PLUM = 396
	Quantity_NOC_PLUM1 = 397
	Quantity_NOC_PLUM2 = 398
	Quantity_NOC_PLUM3 = 399
	Quantity_NOC_PLUM4 = 400
	Quantity_NOC_POWDERBLUE = 401
	Quantity_NOC_PURPLE = 402
	Quantity_NOC_PURPLE1 = 403
	Quantity_NOC_PURPLE2 = 404
	Quantity_NOC_PURPLE3 = 405
	Quantity_NOC_PURPLE4 = 406
	Quantity_NOC_RED = 407
	Quantity_NOC_RED1 = Quantity_NOC_RED
	Quantity_NOC_RED2 = 408
	Quantity_NOC_RED3 = 409
	Quantity_NOC_RED4 = 410
	Quantity_NOC_ROSYBROWN = 411
	Quantity_NOC_ROSYBROWN1 = 412
	Quantity_NOC_ROSYBROWN2 = 413
	Quantity_NOC_ROSYBROWN3 = 414
	Quantity_NOC_ROSYBROWN4 = 415
	Quantity_NOC_ROYALBLUE = 416
	Quantity_NOC_ROYALBLUE1 = 417
	Quantity_NOC_ROYALBLUE2 = 418
	Quantity_NOC_ROYALBLUE3 = 419
	Quantity_NOC_ROYALBLUE4 = 420
	Quantity_NOC_SADDLEBROWN = 421
	Quantity_NOC_SALMON = 422
	Quantity_NOC_SALMON1 = 423
	Quantity_NOC_SALMON2 = 424
	Quantity_NOC_SALMON3 = 425
	Quantity_NOC_SALMON4 = 426
	Quantity_NOC_SANDYBROWN = 427
	Quantity_NOC_SEAGREEN = 428
	Quantity_NOC_SEAGREEN1 = 429
	Quantity_NOC_SEAGREEN2 = 430
	Quantity_NOC_SEAGREEN3 = 431
	Quantity_NOC_SEAGREEN4 = 432
	Quantity_NOC_SEASHELL = 433
	Quantity_NOC_SEASHELL2 = 434
	Quantity_NOC_SEASHELL3 = 435
	Quantity_NOC_SEASHELL4 = 436
	Quantity_NOC_BEET = 437
	Quantity_NOC_TEAL = 438
	Quantity_NOC_SIENNA = 439
	Quantity_NOC_SIENNA1 = 440
	Quantity_NOC_SIENNA2 = 441
	Quantity_NOC_SIENNA3 = 442
	Quantity_NOC_SIENNA4 = 443
	Quantity_NOC_SKYBLUE = 444
	Quantity_NOC_SKYBLUE1 = 445
	Quantity_NOC_SKYBLUE2 = 446
	Quantity_NOC_SKYBLUE3 = 447
	Quantity_NOC_SKYBLUE4 = 448
	Quantity_NOC_SLATEBLUE = 449
	Quantity_NOC_SLATEBLUE1 = 450
	Quantity_NOC_SLATEBLUE2 = 451
	Quantity_NOC_SLATEBLUE3 = 452
	Quantity_NOC_SLATEBLUE4 = 453
	Quantity_NOC_SLATEGRAY1 = 454
	Quantity_NOC_SLATEGRAY2 = 455
	Quantity_NOC_SLATEGRAY3 = 456
	Quantity_NOC_SLATEGRAY4 = 457
	Quantity_NOC_SLATEGRAY = 458
	Quantity_NOC_SNOW = 459
	Quantity_NOC_SNOW2 = 460
	Quantity_NOC_SNOW3 = 461
	Quantity_NOC_SNOW4 = 462
	Quantity_NOC_SPRINGGREEN = 463
	Quantity_NOC_SPRINGGREEN2 = 464
	Quantity_NOC_SPRINGGREEN3 = 465
	Quantity_NOC_SPRINGGREEN4 = 466
	Quantity_NOC_STEELBLUE = 467
	Quantity_NOC_STEELBLUE1 = 468
	Quantity_NOC_STEELBLUE2 = 469
	Quantity_NOC_STEELBLUE3 = 470
	Quantity_NOC_STEELBLUE4 = 471
	Quantity_NOC_TAN = 472
	Quantity_NOC_TAN1 = 473
	Quantity_NOC_TAN2 = 474
	Quantity_NOC_TAN3 = 475
	Quantity_NOC_TAN4 = 476
	Quantity_NOC_THISTLE = 477
	Quantity_NOC_THISTLE1 = 478
	Quantity_NOC_THISTLE2 = 479
	Quantity_NOC_THISTLE3 = 480
	Quantity_NOC_THISTLE4 = 481
	Quantity_NOC_TOMATO = 482
	Quantity_NOC_TOMATO1 = Quantity_NOC_TOMATO
	Quantity_NOC_TOMATO2 = 483
	Quantity_NOC_TOMATO3 = 484
	Quantity_NOC_TOMATO4 = 485
	Quantity_NOC_TURQUOISE = 486
	Quantity_NOC_TURQUOISE1 = 487
	Quantity_NOC_TURQUOISE2 = 488
	Quantity_NOC_TURQUOISE3 = 489
	Quantity_NOC_TURQUOISE4 = 490
	Quantity_NOC_VIOLET = 491
	Quantity_NOC_VIOLETRED = 492
	Quantity_NOC_VIOLETRED1 = 493
	Quantity_NOC_VIOLETRED2 = 494
	Quantity_NOC_VIOLETRED3 = 495
	Quantity_NOC_VIOLETRED4 = 496
	Quantity_NOC_WHEAT = 497
	Quantity_NOC_WHEAT1 = 498
	Quantity_NOC_WHEAT2 = 499
	Quantity_NOC_WHEAT3 = 500
	Quantity_NOC_WHEAT4 = 501
	Quantity_NOC_WHITESMOKE = 502
	Quantity_NOC_YELLOW = 503
	Quantity_NOC_YELLOW1 = Quantity_NOC_YELLOW
	Quantity_NOC_YELLOW2 = 504
	Quantity_NOC_YELLOW3 = 505
	Quantity_NOC_YELLOW4 = 506
	Quantity_NOC_YELLOWGREEN = 507
	Quantity_NOC_WHITE = 508
Quantity_NOC_BLACK = Quantity_NameOfColor.Quantity_NOC_BLACK
Quantity_NOC_MATRABLUE = Quantity_NameOfColor.Quantity_NOC_MATRABLUE
Quantity_NOC_MATRAGRAY = Quantity_NameOfColor.Quantity_NOC_MATRAGRAY
Quantity_NOC_ALICEBLUE = Quantity_NameOfColor.Quantity_NOC_ALICEBLUE
Quantity_NOC_ANTIQUEWHITE = Quantity_NameOfColor.Quantity_NOC_ANTIQUEWHITE
Quantity_NOC_ANTIQUEWHITE1 = Quantity_NameOfColor.Quantity_NOC_ANTIQUEWHITE1
Quantity_NOC_ANTIQUEWHITE2 = Quantity_NameOfColor.Quantity_NOC_ANTIQUEWHITE2
Quantity_NOC_ANTIQUEWHITE3 = Quantity_NameOfColor.Quantity_NOC_ANTIQUEWHITE3
Quantity_NOC_ANTIQUEWHITE4 = Quantity_NameOfColor.Quantity_NOC_ANTIQUEWHITE4
Quantity_NOC_AQUAMARINE1 = Quantity_NameOfColor.Quantity_NOC_AQUAMARINE1
Quantity_NOC_AQUAMARINE2 = Quantity_NameOfColor.Quantity_NOC_AQUAMARINE2
Quantity_NOC_AQUAMARINE4 = Quantity_NameOfColor.Quantity_NOC_AQUAMARINE4
Quantity_NOC_AZURE = Quantity_NameOfColor.Quantity_NOC_AZURE
Quantity_NOC_AZURE2 = Quantity_NameOfColor.Quantity_NOC_AZURE2
Quantity_NOC_AZURE3 = Quantity_NameOfColor.Quantity_NOC_AZURE3
Quantity_NOC_AZURE4 = Quantity_NameOfColor.Quantity_NOC_AZURE4
Quantity_NOC_BEIGE = Quantity_NameOfColor.Quantity_NOC_BEIGE
Quantity_NOC_BISQUE = Quantity_NameOfColor.Quantity_NOC_BISQUE
Quantity_NOC_BISQUE2 = Quantity_NameOfColor.Quantity_NOC_BISQUE2
Quantity_NOC_BISQUE3 = Quantity_NameOfColor.Quantity_NOC_BISQUE3
Quantity_NOC_BISQUE4 = Quantity_NameOfColor.Quantity_NOC_BISQUE4
Quantity_NOC_BLANCHEDALMOND = Quantity_NameOfColor.Quantity_NOC_BLANCHEDALMOND
Quantity_NOC_BLUE = Quantity_NameOfColor.Quantity_NOC_BLUE
Quantity_NOC_BLUE1 = Quantity_NameOfColor.Quantity_NOC_BLUE1
Quantity_NOC_BLUE2 = Quantity_NameOfColor.Quantity_NOC_BLUE2
Quantity_NOC_BLUE3 = Quantity_NameOfColor.Quantity_NOC_BLUE3
Quantity_NOC_BLUE4 = Quantity_NameOfColor.Quantity_NOC_BLUE4
Quantity_NOC_BLUEVIOLET = Quantity_NameOfColor.Quantity_NOC_BLUEVIOLET
Quantity_NOC_BROWN = Quantity_NameOfColor.Quantity_NOC_BROWN
Quantity_NOC_BROWN1 = Quantity_NameOfColor.Quantity_NOC_BROWN1
Quantity_NOC_BROWN2 = Quantity_NameOfColor.Quantity_NOC_BROWN2
Quantity_NOC_BROWN3 = Quantity_NameOfColor.Quantity_NOC_BROWN3
Quantity_NOC_BROWN4 = Quantity_NameOfColor.Quantity_NOC_BROWN4
Quantity_NOC_BURLYWOOD = Quantity_NameOfColor.Quantity_NOC_BURLYWOOD
Quantity_NOC_BURLYWOOD1 = Quantity_NameOfColor.Quantity_NOC_BURLYWOOD1
Quantity_NOC_BURLYWOOD2 = Quantity_NameOfColor.Quantity_NOC_BURLYWOOD2
Quantity_NOC_BURLYWOOD3 = Quantity_NameOfColor.Quantity_NOC_BURLYWOOD3
Quantity_NOC_BURLYWOOD4 = Quantity_NameOfColor.Quantity_NOC_BURLYWOOD4
Quantity_NOC_CADETBLUE = Quantity_NameOfColor.Quantity_NOC_CADETBLUE
Quantity_NOC_CADETBLUE1 = Quantity_NameOfColor.Quantity_NOC_CADETBLUE1
Quantity_NOC_CADETBLUE2 = Quantity_NameOfColor.Quantity_NOC_CADETBLUE2
Quantity_NOC_CADETBLUE3 = Quantity_NameOfColor.Quantity_NOC_CADETBLUE3
Quantity_NOC_CADETBLUE4 = Quantity_NameOfColor.Quantity_NOC_CADETBLUE4
Quantity_NOC_CHARTREUSE = Quantity_NameOfColor.Quantity_NOC_CHARTREUSE
Quantity_NOC_CHARTREUSE1 = Quantity_NameOfColor.Quantity_NOC_CHARTREUSE1
Quantity_NOC_CHARTREUSE2 = Quantity_NameOfColor.Quantity_NOC_CHARTREUSE2
Quantity_NOC_CHARTREUSE3 = Quantity_NameOfColor.Quantity_NOC_CHARTREUSE3
Quantity_NOC_CHARTREUSE4 = Quantity_NameOfColor.Quantity_NOC_CHARTREUSE4
Quantity_NOC_CHOCOLATE = Quantity_NameOfColor.Quantity_NOC_CHOCOLATE
Quantity_NOC_CHOCOLATE1 = Quantity_NameOfColor.Quantity_NOC_CHOCOLATE1
Quantity_NOC_CHOCOLATE2 = Quantity_NameOfColor.Quantity_NOC_CHOCOLATE2
Quantity_NOC_CHOCOLATE3 = Quantity_NameOfColor.Quantity_NOC_CHOCOLATE3
Quantity_NOC_CHOCOLATE4 = Quantity_NameOfColor.Quantity_NOC_CHOCOLATE4
Quantity_NOC_CORAL = Quantity_NameOfColor.Quantity_NOC_CORAL
Quantity_NOC_CORAL1 = Quantity_NameOfColor.Quantity_NOC_CORAL1
Quantity_NOC_CORAL2 = Quantity_NameOfColor.Quantity_NOC_CORAL2
Quantity_NOC_CORAL3 = Quantity_NameOfColor.Quantity_NOC_CORAL3
Quantity_NOC_CORAL4 = Quantity_NameOfColor.Quantity_NOC_CORAL4
Quantity_NOC_CORNFLOWERBLUE = Quantity_NameOfColor.Quantity_NOC_CORNFLOWERBLUE
Quantity_NOC_CORNSILK1 = Quantity_NameOfColor.Quantity_NOC_CORNSILK1
Quantity_NOC_CORNSILK2 = Quantity_NameOfColor.Quantity_NOC_CORNSILK2
Quantity_NOC_CORNSILK3 = Quantity_NameOfColor.Quantity_NOC_CORNSILK3
Quantity_NOC_CORNSILK4 = Quantity_NameOfColor.Quantity_NOC_CORNSILK4
Quantity_NOC_CYAN = Quantity_NameOfColor.Quantity_NOC_CYAN
Quantity_NOC_CYAN1 = Quantity_NameOfColor.Quantity_NOC_CYAN1
Quantity_NOC_CYAN2 = Quantity_NameOfColor.Quantity_NOC_CYAN2
Quantity_NOC_CYAN3 = Quantity_NameOfColor.Quantity_NOC_CYAN3
Quantity_NOC_CYAN4 = Quantity_NameOfColor.Quantity_NOC_CYAN4
Quantity_NOC_DARKGOLDENROD = Quantity_NameOfColor.Quantity_NOC_DARKGOLDENROD
Quantity_NOC_DARKGOLDENROD1 = Quantity_NameOfColor.Quantity_NOC_DARKGOLDENROD1
Quantity_NOC_DARKGOLDENROD2 = Quantity_NameOfColor.Quantity_NOC_DARKGOLDENROD2
Quantity_NOC_DARKGOLDENROD3 = Quantity_NameOfColor.Quantity_NOC_DARKGOLDENROD3
Quantity_NOC_DARKGOLDENROD4 = Quantity_NameOfColor.Quantity_NOC_DARKGOLDENROD4
Quantity_NOC_DARKGREEN = Quantity_NameOfColor.Quantity_NOC_DARKGREEN
Quantity_NOC_DARKKHAKI = Quantity_NameOfColor.Quantity_NOC_DARKKHAKI
Quantity_NOC_DARKOLIVEGREEN = Quantity_NameOfColor.Quantity_NOC_DARKOLIVEGREEN
Quantity_NOC_DARKOLIVEGREEN1 = Quantity_NameOfColor.Quantity_NOC_DARKOLIVEGREEN1
Quantity_NOC_DARKOLIVEGREEN2 = Quantity_NameOfColor.Quantity_NOC_DARKOLIVEGREEN2
Quantity_NOC_DARKOLIVEGREEN3 = Quantity_NameOfColor.Quantity_NOC_DARKOLIVEGREEN3
Quantity_NOC_DARKOLIVEGREEN4 = Quantity_NameOfColor.Quantity_NOC_DARKOLIVEGREEN4
Quantity_NOC_DARKORANGE = Quantity_NameOfColor.Quantity_NOC_DARKORANGE
Quantity_NOC_DARKORANGE1 = Quantity_NameOfColor.Quantity_NOC_DARKORANGE1
Quantity_NOC_DARKORANGE2 = Quantity_NameOfColor.Quantity_NOC_DARKORANGE2
Quantity_NOC_DARKORANGE3 = Quantity_NameOfColor.Quantity_NOC_DARKORANGE3
Quantity_NOC_DARKORANGE4 = Quantity_NameOfColor.Quantity_NOC_DARKORANGE4
Quantity_NOC_DARKORCHID = Quantity_NameOfColor.Quantity_NOC_DARKORCHID
Quantity_NOC_DARKORCHID1 = Quantity_NameOfColor.Quantity_NOC_DARKORCHID1
Quantity_NOC_DARKORCHID2 = Quantity_NameOfColor.Quantity_NOC_DARKORCHID2
Quantity_NOC_DARKORCHID3 = Quantity_NameOfColor.Quantity_NOC_DARKORCHID3
Quantity_NOC_DARKORCHID4 = Quantity_NameOfColor.Quantity_NOC_DARKORCHID4
Quantity_NOC_DARKSALMON = Quantity_NameOfColor.Quantity_NOC_DARKSALMON
Quantity_NOC_DARKSEAGREEN = Quantity_NameOfColor.Quantity_NOC_DARKSEAGREEN
Quantity_NOC_DARKSEAGREEN1 = Quantity_NameOfColor.Quantity_NOC_DARKSEAGREEN1
Quantity_NOC_DARKSEAGREEN2 = Quantity_NameOfColor.Quantity_NOC_DARKSEAGREEN2
Quantity_NOC_DARKSEAGREEN3 = Quantity_NameOfColor.Quantity_NOC_DARKSEAGREEN3
Quantity_NOC_DARKSEAGREEN4 = Quantity_NameOfColor.Quantity_NOC_DARKSEAGREEN4
Quantity_NOC_DARKSLATEBLUE = Quantity_NameOfColor.Quantity_NOC_DARKSLATEBLUE
Quantity_NOC_DARKSLATEGRAY1 = Quantity_NameOfColor.Quantity_NOC_DARKSLATEGRAY1
Quantity_NOC_DARKSLATEGRAY2 = Quantity_NameOfColor.Quantity_NOC_DARKSLATEGRAY2
Quantity_NOC_DARKSLATEGRAY3 = Quantity_NameOfColor.Quantity_NOC_DARKSLATEGRAY3
Quantity_NOC_DARKSLATEGRAY4 = Quantity_NameOfColor.Quantity_NOC_DARKSLATEGRAY4
Quantity_NOC_DARKSLATEGRAY = Quantity_NameOfColor.Quantity_NOC_DARKSLATEGRAY
Quantity_NOC_DARKTURQUOISE = Quantity_NameOfColor.Quantity_NOC_DARKTURQUOISE
Quantity_NOC_DARKVIOLET = Quantity_NameOfColor.Quantity_NOC_DARKVIOLET
Quantity_NOC_DEEPPINK = Quantity_NameOfColor.Quantity_NOC_DEEPPINK
Quantity_NOC_DEEPPINK2 = Quantity_NameOfColor.Quantity_NOC_DEEPPINK2
Quantity_NOC_DEEPPINK3 = Quantity_NameOfColor.Quantity_NOC_DEEPPINK3
Quantity_NOC_DEEPPINK4 = Quantity_NameOfColor.Quantity_NOC_DEEPPINK4
Quantity_NOC_DEEPSKYBLUE1 = Quantity_NameOfColor.Quantity_NOC_DEEPSKYBLUE1
Quantity_NOC_DEEPSKYBLUE2 = Quantity_NameOfColor.Quantity_NOC_DEEPSKYBLUE2
Quantity_NOC_DEEPSKYBLUE3 = Quantity_NameOfColor.Quantity_NOC_DEEPSKYBLUE3
Quantity_NOC_DEEPSKYBLUE4 = Quantity_NameOfColor.Quantity_NOC_DEEPSKYBLUE4
Quantity_NOC_DODGERBLUE1 = Quantity_NameOfColor.Quantity_NOC_DODGERBLUE1
Quantity_NOC_DODGERBLUE2 = Quantity_NameOfColor.Quantity_NOC_DODGERBLUE2
Quantity_NOC_DODGERBLUE3 = Quantity_NameOfColor.Quantity_NOC_DODGERBLUE3
Quantity_NOC_DODGERBLUE4 = Quantity_NameOfColor.Quantity_NOC_DODGERBLUE4
Quantity_NOC_FIREBRICK = Quantity_NameOfColor.Quantity_NOC_FIREBRICK
Quantity_NOC_FIREBRICK1 = Quantity_NameOfColor.Quantity_NOC_FIREBRICK1
Quantity_NOC_FIREBRICK2 = Quantity_NameOfColor.Quantity_NOC_FIREBRICK2
Quantity_NOC_FIREBRICK3 = Quantity_NameOfColor.Quantity_NOC_FIREBRICK3
Quantity_NOC_FIREBRICK4 = Quantity_NameOfColor.Quantity_NOC_FIREBRICK4
Quantity_NOC_FLORALWHITE = Quantity_NameOfColor.Quantity_NOC_FLORALWHITE
Quantity_NOC_FORESTGREEN = Quantity_NameOfColor.Quantity_NOC_FORESTGREEN
Quantity_NOC_GAINSBORO = Quantity_NameOfColor.Quantity_NOC_GAINSBORO
Quantity_NOC_GHOSTWHITE = Quantity_NameOfColor.Quantity_NOC_GHOSTWHITE
Quantity_NOC_GOLD = Quantity_NameOfColor.Quantity_NOC_GOLD
Quantity_NOC_GOLD1 = Quantity_NameOfColor.Quantity_NOC_GOLD1
Quantity_NOC_GOLD2 = Quantity_NameOfColor.Quantity_NOC_GOLD2
Quantity_NOC_GOLD3 = Quantity_NameOfColor.Quantity_NOC_GOLD3
Quantity_NOC_GOLD4 = Quantity_NameOfColor.Quantity_NOC_GOLD4
Quantity_NOC_GOLDENROD = Quantity_NameOfColor.Quantity_NOC_GOLDENROD
Quantity_NOC_GOLDENROD1 = Quantity_NameOfColor.Quantity_NOC_GOLDENROD1
Quantity_NOC_GOLDENROD2 = Quantity_NameOfColor.Quantity_NOC_GOLDENROD2
Quantity_NOC_GOLDENROD3 = Quantity_NameOfColor.Quantity_NOC_GOLDENROD3
Quantity_NOC_GOLDENROD4 = Quantity_NameOfColor.Quantity_NOC_GOLDENROD4
Quantity_NOC_GRAY = Quantity_NameOfColor.Quantity_NOC_GRAY
Quantity_NOC_GRAY0 = Quantity_NameOfColor.Quantity_NOC_GRAY0
Quantity_NOC_GRAY1 = Quantity_NameOfColor.Quantity_NOC_GRAY1
Quantity_NOC_GRAY2 = Quantity_NameOfColor.Quantity_NOC_GRAY2
Quantity_NOC_GRAY3 = Quantity_NameOfColor.Quantity_NOC_GRAY3
Quantity_NOC_GRAY4 = Quantity_NameOfColor.Quantity_NOC_GRAY4
Quantity_NOC_GRAY5 = Quantity_NameOfColor.Quantity_NOC_GRAY5
Quantity_NOC_GRAY6 = Quantity_NameOfColor.Quantity_NOC_GRAY6
Quantity_NOC_GRAY7 = Quantity_NameOfColor.Quantity_NOC_GRAY7
Quantity_NOC_GRAY8 = Quantity_NameOfColor.Quantity_NOC_GRAY8
Quantity_NOC_GRAY9 = Quantity_NameOfColor.Quantity_NOC_GRAY9
Quantity_NOC_GRAY10 = Quantity_NameOfColor.Quantity_NOC_GRAY10
Quantity_NOC_GRAY11 = Quantity_NameOfColor.Quantity_NOC_GRAY11
Quantity_NOC_GRAY12 = Quantity_NameOfColor.Quantity_NOC_GRAY12
Quantity_NOC_GRAY13 = Quantity_NameOfColor.Quantity_NOC_GRAY13
Quantity_NOC_GRAY14 = Quantity_NameOfColor.Quantity_NOC_GRAY14
Quantity_NOC_GRAY15 = Quantity_NameOfColor.Quantity_NOC_GRAY15
Quantity_NOC_GRAY16 = Quantity_NameOfColor.Quantity_NOC_GRAY16
Quantity_NOC_GRAY17 = Quantity_NameOfColor.Quantity_NOC_GRAY17
Quantity_NOC_GRAY18 = Quantity_NameOfColor.Quantity_NOC_GRAY18
Quantity_NOC_GRAY19 = Quantity_NameOfColor.Quantity_NOC_GRAY19
Quantity_NOC_GRAY20 = Quantity_NameOfColor.Quantity_NOC_GRAY20
Quantity_NOC_GRAY21 = Quantity_NameOfColor.Quantity_NOC_GRAY21
Quantity_NOC_GRAY22 = Quantity_NameOfColor.Quantity_NOC_GRAY22
Quantity_NOC_GRAY23 = Quantity_NameOfColor.Quantity_NOC_GRAY23
Quantity_NOC_GRAY24 = Quantity_NameOfColor.Quantity_NOC_GRAY24
Quantity_NOC_GRAY25 = Quantity_NameOfColor.Quantity_NOC_GRAY25
Quantity_NOC_GRAY26 = Quantity_NameOfColor.Quantity_NOC_GRAY26
Quantity_NOC_GRAY27 = Quantity_NameOfColor.Quantity_NOC_GRAY27
Quantity_NOC_GRAY28 = Quantity_NameOfColor.Quantity_NOC_GRAY28
Quantity_NOC_GRAY29 = Quantity_NameOfColor.Quantity_NOC_GRAY29
Quantity_NOC_GRAY30 = Quantity_NameOfColor.Quantity_NOC_GRAY30
Quantity_NOC_GRAY31 = Quantity_NameOfColor.Quantity_NOC_GRAY31
Quantity_NOC_GRAY32 = Quantity_NameOfColor.Quantity_NOC_GRAY32
Quantity_NOC_GRAY33 = Quantity_NameOfColor.Quantity_NOC_GRAY33
Quantity_NOC_GRAY34 = Quantity_NameOfColor.Quantity_NOC_GRAY34
Quantity_NOC_GRAY35 = Quantity_NameOfColor.Quantity_NOC_GRAY35
Quantity_NOC_GRAY36 = Quantity_NameOfColor.Quantity_NOC_GRAY36
Quantity_NOC_GRAY37 = Quantity_NameOfColor.Quantity_NOC_GRAY37
Quantity_NOC_GRAY38 = Quantity_NameOfColor.Quantity_NOC_GRAY38
Quantity_NOC_GRAY39 = Quantity_NameOfColor.Quantity_NOC_GRAY39
Quantity_NOC_GRAY40 = Quantity_NameOfColor.Quantity_NOC_GRAY40
Quantity_NOC_GRAY41 = Quantity_NameOfColor.Quantity_NOC_GRAY41
Quantity_NOC_GRAY42 = Quantity_NameOfColor.Quantity_NOC_GRAY42
Quantity_NOC_GRAY43 = Quantity_NameOfColor.Quantity_NOC_GRAY43
Quantity_NOC_GRAY44 = Quantity_NameOfColor.Quantity_NOC_GRAY44
Quantity_NOC_GRAY45 = Quantity_NameOfColor.Quantity_NOC_GRAY45
Quantity_NOC_GRAY46 = Quantity_NameOfColor.Quantity_NOC_GRAY46
Quantity_NOC_GRAY47 = Quantity_NameOfColor.Quantity_NOC_GRAY47
Quantity_NOC_GRAY48 = Quantity_NameOfColor.Quantity_NOC_GRAY48
Quantity_NOC_GRAY49 = Quantity_NameOfColor.Quantity_NOC_GRAY49
Quantity_NOC_GRAY50 = Quantity_NameOfColor.Quantity_NOC_GRAY50
Quantity_NOC_GRAY51 = Quantity_NameOfColor.Quantity_NOC_GRAY51
Quantity_NOC_GRAY52 = Quantity_NameOfColor.Quantity_NOC_GRAY52
Quantity_NOC_GRAY53 = Quantity_NameOfColor.Quantity_NOC_GRAY53
Quantity_NOC_GRAY54 = Quantity_NameOfColor.Quantity_NOC_GRAY54
Quantity_NOC_GRAY55 = Quantity_NameOfColor.Quantity_NOC_GRAY55
Quantity_NOC_GRAY56 = Quantity_NameOfColor.Quantity_NOC_GRAY56
Quantity_NOC_GRAY57 = Quantity_NameOfColor.Quantity_NOC_GRAY57
Quantity_NOC_GRAY58 = Quantity_NameOfColor.Quantity_NOC_GRAY58
Quantity_NOC_GRAY59 = Quantity_NameOfColor.Quantity_NOC_GRAY59
Quantity_NOC_GRAY60 = Quantity_NameOfColor.Quantity_NOC_GRAY60
Quantity_NOC_GRAY61 = Quantity_NameOfColor.Quantity_NOC_GRAY61
Quantity_NOC_GRAY62 = Quantity_NameOfColor.Quantity_NOC_GRAY62
Quantity_NOC_GRAY63 = Quantity_NameOfColor.Quantity_NOC_GRAY63
Quantity_NOC_GRAY64 = Quantity_NameOfColor.Quantity_NOC_GRAY64
Quantity_NOC_GRAY65 = Quantity_NameOfColor.Quantity_NOC_GRAY65
Quantity_NOC_GRAY66 = Quantity_NameOfColor.Quantity_NOC_GRAY66
Quantity_NOC_GRAY67 = Quantity_NameOfColor.Quantity_NOC_GRAY67
Quantity_NOC_GRAY68 = Quantity_NameOfColor.Quantity_NOC_GRAY68
Quantity_NOC_GRAY69 = Quantity_NameOfColor.Quantity_NOC_GRAY69
Quantity_NOC_GRAY70 = Quantity_NameOfColor.Quantity_NOC_GRAY70
Quantity_NOC_GRAY71 = Quantity_NameOfColor.Quantity_NOC_GRAY71
Quantity_NOC_GRAY72 = Quantity_NameOfColor.Quantity_NOC_GRAY72
Quantity_NOC_GRAY73 = Quantity_NameOfColor.Quantity_NOC_GRAY73
Quantity_NOC_GRAY74 = Quantity_NameOfColor.Quantity_NOC_GRAY74
Quantity_NOC_GRAY75 = Quantity_NameOfColor.Quantity_NOC_GRAY75
Quantity_NOC_GRAY76 = Quantity_NameOfColor.Quantity_NOC_GRAY76
Quantity_NOC_GRAY77 = Quantity_NameOfColor.Quantity_NOC_GRAY77
Quantity_NOC_GRAY78 = Quantity_NameOfColor.Quantity_NOC_GRAY78
Quantity_NOC_GRAY79 = Quantity_NameOfColor.Quantity_NOC_GRAY79
Quantity_NOC_GRAY80 = Quantity_NameOfColor.Quantity_NOC_GRAY80
Quantity_NOC_GRAY81 = Quantity_NameOfColor.Quantity_NOC_GRAY81
Quantity_NOC_GRAY82 = Quantity_NameOfColor.Quantity_NOC_GRAY82
Quantity_NOC_GRAY83 = Quantity_NameOfColor.Quantity_NOC_GRAY83
Quantity_NOC_GRAY85 = Quantity_NameOfColor.Quantity_NOC_GRAY85
Quantity_NOC_GRAY86 = Quantity_NameOfColor.Quantity_NOC_GRAY86
Quantity_NOC_GRAY87 = Quantity_NameOfColor.Quantity_NOC_GRAY87
Quantity_NOC_GRAY88 = Quantity_NameOfColor.Quantity_NOC_GRAY88
Quantity_NOC_GRAY89 = Quantity_NameOfColor.Quantity_NOC_GRAY89
Quantity_NOC_GRAY90 = Quantity_NameOfColor.Quantity_NOC_GRAY90
Quantity_NOC_GRAY91 = Quantity_NameOfColor.Quantity_NOC_GRAY91
Quantity_NOC_GRAY92 = Quantity_NameOfColor.Quantity_NOC_GRAY92
Quantity_NOC_GRAY93 = Quantity_NameOfColor.Quantity_NOC_GRAY93
Quantity_NOC_GRAY94 = Quantity_NameOfColor.Quantity_NOC_GRAY94
Quantity_NOC_GRAY95 = Quantity_NameOfColor.Quantity_NOC_GRAY95
Quantity_NOC_GRAY97 = Quantity_NameOfColor.Quantity_NOC_GRAY97
Quantity_NOC_GRAY98 = Quantity_NameOfColor.Quantity_NOC_GRAY98
Quantity_NOC_GRAY99 = Quantity_NameOfColor.Quantity_NOC_GRAY99
Quantity_NOC_GREEN = Quantity_NameOfColor.Quantity_NOC_GREEN
Quantity_NOC_GREEN1 = Quantity_NameOfColor.Quantity_NOC_GREEN1
Quantity_NOC_GREEN2 = Quantity_NameOfColor.Quantity_NOC_GREEN2
Quantity_NOC_GREEN3 = Quantity_NameOfColor.Quantity_NOC_GREEN3
Quantity_NOC_GREEN4 = Quantity_NameOfColor.Quantity_NOC_GREEN4
Quantity_NOC_GREENYELLOW = Quantity_NameOfColor.Quantity_NOC_GREENYELLOW
Quantity_NOC_HONEYDEW = Quantity_NameOfColor.Quantity_NOC_HONEYDEW
Quantity_NOC_HONEYDEW2 = Quantity_NameOfColor.Quantity_NOC_HONEYDEW2
Quantity_NOC_HONEYDEW3 = Quantity_NameOfColor.Quantity_NOC_HONEYDEW3
Quantity_NOC_HONEYDEW4 = Quantity_NameOfColor.Quantity_NOC_HONEYDEW4
Quantity_NOC_HOTPINK = Quantity_NameOfColor.Quantity_NOC_HOTPINK
Quantity_NOC_HOTPINK1 = Quantity_NameOfColor.Quantity_NOC_HOTPINK1
Quantity_NOC_HOTPINK2 = Quantity_NameOfColor.Quantity_NOC_HOTPINK2
Quantity_NOC_HOTPINK3 = Quantity_NameOfColor.Quantity_NOC_HOTPINK3
Quantity_NOC_HOTPINK4 = Quantity_NameOfColor.Quantity_NOC_HOTPINK4
Quantity_NOC_INDIANRED = Quantity_NameOfColor.Quantity_NOC_INDIANRED
Quantity_NOC_INDIANRED1 = Quantity_NameOfColor.Quantity_NOC_INDIANRED1
Quantity_NOC_INDIANRED2 = Quantity_NameOfColor.Quantity_NOC_INDIANRED2
Quantity_NOC_INDIANRED3 = Quantity_NameOfColor.Quantity_NOC_INDIANRED3
Quantity_NOC_INDIANRED4 = Quantity_NameOfColor.Quantity_NOC_INDIANRED4
Quantity_NOC_IVORY = Quantity_NameOfColor.Quantity_NOC_IVORY
Quantity_NOC_IVORY2 = Quantity_NameOfColor.Quantity_NOC_IVORY2
Quantity_NOC_IVORY3 = Quantity_NameOfColor.Quantity_NOC_IVORY3
Quantity_NOC_IVORY4 = Quantity_NameOfColor.Quantity_NOC_IVORY4
Quantity_NOC_KHAKI = Quantity_NameOfColor.Quantity_NOC_KHAKI
Quantity_NOC_KHAKI1 = Quantity_NameOfColor.Quantity_NOC_KHAKI1
Quantity_NOC_KHAKI2 = Quantity_NameOfColor.Quantity_NOC_KHAKI2
Quantity_NOC_KHAKI3 = Quantity_NameOfColor.Quantity_NOC_KHAKI3
Quantity_NOC_KHAKI4 = Quantity_NameOfColor.Quantity_NOC_KHAKI4
Quantity_NOC_LAVENDER = Quantity_NameOfColor.Quantity_NOC_LAVENDER
Quantity_NOC_LAVENDERBLUSH1 = Quantity_NameOfColor.Quantity_NOC_LAVENDERBLUSH1
Quantity_NOC_LAVENDERBLUSH2 = Quantity_NameOfColor.Quantity_NOC_LAVENDERBLUSH2
Quantity_NOC_LAVENDERBLUSH3 = Quantity_NameOfColor.Quantity_NOC_LAVENDERBLUSH3
Quantity_NOC_LAVENDERBLUSH4 = Quantity_NameOfColor.Quantity_NOC_LAVENDERBLUSH4
Quantity_NOC_LAWNGREEN = Quantity_NameOfColor.Quantity_NOC_LAWNGREEN
Quantity_NOC_LEMONCHIFFON1 = Quantity_NameOfColor.Quantity_NOC_LEMONCHIFFON1
Quantity_NOC_LEMONCHIFFON2 = Quantity_NameOfColor.Quantity_NOC_LEMONCHIFFON2
Quantity_NOC_LEMONCHIFFON3 = Quantity_NameOfColor.Quantity_NOC_LEMONCHIFFON3
Quantity_NOC_LEMONCHIFFON4 = Quantity_NameOfColor.Quantity_NOC_LEMONCHIFFON4
Quantity_NOC_LIGHTBLUE = Quantity_NameOfColor.Quantity_NOC_LIGHTBLUE
Quantity_NOC_LIGHTBLUE1 = Quantity_NameOfColor.Quantity_NOC_LIGHTBLUE1
Quantity_NOC_LIGHTBLUE2 = Quantity_NameOfColor.Quantity_NOC_LIGHTBLUE2
Quantity_NOC_LIGHTBLUE3 = Quantity_NameOfColor.Quantity_NOC_LIGHTBLUE3
Quantity_NOC_LIGHTBLUE4 = Quantity_NameOfColor.Quantity_NOC_LIGHTBLUE4
Quantity_NOC_LIGHTCORAL = Quantity_NameOfColor.Quantity_NOC_LIGHTCORAL
Quantity_NOC_LIGHTCYAN = Quantity_NameOfColor.Quantity_NOC_LIGHTCYAN
Quantity_NOC_LIGHTCYAN1 = Quantity_NameOfColor.Quantity_NOC_LIGHTCYAN1
Quantity_NOC_LIGHTCYAN2 = Quantity_NameOfColor.Quantity_NOC_LIGHTCYAN2
Quantity_NOC_LIGHTCYAN3 = Quantity_NameOfColor.Quantity_NOC_LIGHTCYAN3
Quantity_NOC_LIGHTCYAN4 = Quantity_NameOfColor.Quantity_NOC_LIGHTCYAN4
Quantity_NOC_LIGHTGOLDENROD = Quantity_NameOfColor.Quantity_NOC_LIGHTGOLDENROD
Quantity_NOC_LIGHTGOLDENROD1 = Quantity_NameOfColor.Quantity_NOC_LIGHTGOLDENROD1
Quantity_NOC_LIGHTGOLDENROD2 = Quantity_NameOfColor.Quantity_NOC_LIGHTGOLDENROD2
Quantity_NOC_LIGHTGOLDENROD3 = Quantity_NameOfColor.Quantity_NOC_LIGHTGOLDENROD3
Quantity_NOC_LIGHTGOLDENROD4 = Quantity_NameOfColor.Quantity_NOC_LIGHTGOLDENROD4
Quantity_NOC_LIGHTGOLDENRODYELLOW = Quantity_NameOfColor.Quantity_NOC_LIGHTGOLDENRODYELLOW
Quantity_NOC_LIGHTGRAY = Quantity_NameOfColor.Quantity_NOC_LIGHTGRAY
Quantity_NOC_LIGHTPINK = Quantity_NameOfColor.Quantity_NOC_LIGHTPINK
Quantity_NOC_LIGHTPINK1 = Quantity_NameOfColor.Quantity_NOC_LIGHTPINK1
Quantity_NOC_LIGHTPINK2 = Quantity_NameOfColor.Quantity_NOC_LIGHTPINK2
Quantity_NOC_LIGHTPINK3 = Quantity_NameOfColor.Quantity_NOC_LIGHTPINK3
Quantity_NOC_LIGHTPINK4 = Quantity_NameOfColor.Quantity_NOC_LIGHTPINK4
Quantity_NOC_LIGHTSALMON1 = Quantity_NameOfColor.Quantity_NOC_LIGHTSALMON1
Quantity_NOC_LIGHTSALMON2 = Quantity_NameOfColor.Quantity_NOC_LIGHTSALMON2
Quantity_NOC_LIGHTSALMON3 = Quantity_NameOfColor.Quantity_NOC_LIGHTSALMON3
Quantity_NOC_LIGHTSALMON4 = Quantity_NameOfColor.Quantity_NOC_LIGHTSALMON4
Quantity_NOC_LIGHTSEAGREEN = Quantity_NameOfColor.Quantity_NOC_LIGHTSEAGREEN
Quantity_NOC_LIGHTSKYBLUE = Quantity_NameOfColor.Quantity_NOC_LIGHTSKYBLUE
Quantity_NOC_LIGHTSKYBLUE1 = Quantity_NameOfColor.Quantity_NOC_LIGHTSKYBLUE1
Quantity_NOC_LIGHTSKYBLUE2 = Quantity_NameOfColor.Quantity_NOC_LIGHTSKYBLUE2
Quantity_NOC_LIGHTSKYBLUE3 = Quantity_NameOfColor.Quantity_NOC_LIGHTSKYBLUE3
Quantity_NOC_LIGHTSKYBLUE4 = Quantity_NameOfColor.Quantity_NOC_LIGHTSKYBLUE4
Quantity_NOC_LIGHTSLATEBLUE = Quantity_NameOfColor.Quantity_NOC_LIGHTSLATEBLUE
Quantity_NOC_LIGHTSLATEGRAY = Quantity_NameOfColor.Quantity_NOC_LIGHTSLATEGRAY
Quantity_NOC_LIGHTSTEELBLUE = Quantity_NameOfColor.Quantity_NOC_LIGHTSTEELBLUE
Quantity_NOC_LIGHTSTEELBLUE1 = Quantity_NameOfColor.Quantity_NOC_LIGHTSTEELBLUE1
Quantity_NOC_LIGHTSTEELBLUE2 = Quantity_NameOfColor.Quantity_NOC_LIGHTSTEELBLUE2
Quantity_NOC_LIGHTSTEELBLUE3 = Quantity_NameOfColor.Quantity_NOC_LIGHTSTEELBLUE3
Quantity_NOC_LIGHTSTEELBLUE4 = Quantity_NameOfColor.Quantity_NOC_LIGHTSTEELBLUE4
Quantity_NOC_LIGHTYELLOW = Quantity_NameOfColor.Quantity_NOC_LIGHTYELLOW
Quantity_NOC_LIGHTYELLOW2 = Quantity_NameOfColor.Quantity_NOC_LIGHTYELLOW2
Quantity_NOC_LIGHTYELLOW3 = Quantity_NameOfColor.Quantity_NOC_LIGHTYELLOW3
Quantity_NOC_LIGHTYELLOW4 = Quantity_NameOfColor.Quantity_NOC_LIGHTYELLOW4
Quantity_NOC_LIMEGREEN = Quantity_NameOfColor.Quantity_NOC_LIMEGREEN
Quantity_NOC_LINEN = Quantity_NameOfColor.Quantity_NOC_LINEN
Quantity_NOC_MAGENTA = Quantity_NameOfColor.Quantity_NOC_MAGENTA
Quantity_NOC_MAGENTA1 = Quantity_NameOfColor.Quantity_NOC_MAGENTA1
Quantity_NOC_MAGENTA2 = Quantity_NameOfColor.Quantity_NOC_MAGENTA2
Quantity_NOC_MAGENTA3 = Quantity_NameOfColor.Quantity_NOC_MAGENTA3
Quantity_NOC_MAGENTA4 = Quantity_NameOfColor.Quantity_NOC_MAGENTA4
Quantity_NOC_MAROON = Quantity_NameOfColor.Quantity_NOC_MAROON
Quantity_NOC_MAROON1 = Quantity_NameOfColor.Quantity_NOC_MAROON1
Quantity_NOC_MAROON2 = Quantity_NameOfColor.Quantity_NOC_MAROON2
Quantity_NOC_MAROON3 = Quantity_NameOfColor.Quantity_NOC_MAROON3
Quantity_NOC_MAROON4 = Quantity_NameOfColor.Quantity_NOC_MAROON4
Quantity_NOC_MEDIUMAQUAMARINE = Quantity_NameOfColor.Quantity_NOC_MEDIUMAQUAMARINE
Quantity_NOC_MEDIUMORCHID = Quantity_NameOfColor.Quantity_NOC_MEDIUMORCHID
Quantity_NOC_MEDIUMORCHID1 = Quantity_NameOfColor.Quantity_NOC_MEDIUMORCHID1
Quantity_NOC_MEDIUMORCHID2 = Quantity_NameOfColor.Quantity_NOC_MEDIUMORCHID2
Quantity_NOC_MEDIUMORCHID3 = Quantity_NameOfColor.Quantity_NOC_MEDIUMORCHID3
Quantity_NOC_MEDIUMORCHID4 = Quantity_NameOfColor.Quantity_NOC_MEDIUMORCHID4
Quantity_NOC_MEDIUMPURPLE = Quantity_NameOfColor.Quantity_NOC_MEDIUMPURPLE
Quantity_NOC_MEDIUMPURPLE1 = Quantity_NameOfColor.Quantity_NOC_MEDIUMPURPLE1
Quantity_NOC_MEDIUMPURPLE2 = Quantity_NameOfColor.Quantity_NOC_MEDIUMPURPLE2
Quantity_NOC_MEDIUMPURPLE3 = Quantity_NameOfColor.Quantity_NOC_MEDIUMPURPLE3
Quantity_NOC_MEDIUMPURPLE4 = Quantity_NameOfColor.Quantity_NOC_MEDIUMPURPLE4
Quantity_NOC_MEDIUMSEAGREEN = Quantity_NameOfColor.Quantity_NOC_MEDIUMSEAGREEN
Quantity_NOC_MEDIUMSLATEBLUE = Quantity_NameOfColor.Quantity_NOC_MEDIUMSLATEBLUE
Quantity_NOC_MEDIUMSPRINGGREEN = Quantity_NameOfColor.Quantity_NOC_MEDIUMSPRINGGREEN
Quantity_NOC_MEDIUMTURQUOISE = Quantity_NameOfColor.Quantity_NOC_MEDIUMTURQUOISE
Quantity_NOC_MEDIUMVIOLETRED = Quantity_NameOfColor.Quantity_NOC_MEDIUMVIOLETRED
Quantity_NOC_MIDNIGHTBLUE = Quantity_NameOfColor.Quantity_NOC_MIDNIGHTBLUE
Quantity_NOC_MINTCREAM = Quantity_NameOfColor.Quantity_NOC_MINTCREAM
Quantity_NOC_MISTYROSE = Quantity_NameOfColor.Quantity_NOC_MISTYROSE
Quantity_NOC_MISTYROSE2 = Quantity_NameOfColor.Quantity_NOC_MISTYROSE2
Quantity_NOC_MISTYROSE3 = Quantity_NameOfColor.Quantity_NOC_MISTYROSE3
Quantity_NOC_MISTYROSE4 = Quantity_NameOfColor.Quantity_NOC_MISTYROSE4
Quantity_NOC_MOCCASIN = Quantity_NameOfColor.Quantity_NOC_MOCCASIN
Quantity_NOC_NAVAJOWHITE1 = Quantity_NameOfColor.Quantity_NOC_NAVAJOWHITE1
Quantity_NOC_NAVAJOWHITE2 = Quantity_NameOfColor.Quantity_NOC_NAVAJOWHITE2
Quantity_NOC_NAVAJOWHITE3 = Quantity_NameOfColor.Quantity_NOC_NAVAJOWHITE3
Quantity_NOC_NAVAJOWHITE4 = Quantity_NameOfColor.Quantity_NOC_NAVAJOWHITE4
Quantity_NOC_NAVYBLUE = Quantity_NameOfColor.Quantity_NOC_NAVYBLUE
Quantity_NOC_OLDLACE = Quantity_NameOfColor.Quantity_NOC_OLDLACE
Quantity_NOC_OLIVEDRAB = Quantity_NameOfColor.Quantity_NOC_OLIVEDRAB
Quantity_NOC_OLIVEDRAB1 = Quantity_NameOfColor.Quantity_NOC_OLIVEDRAB1
Quantity_NOC_OLIVEDRAB2 = Quantity_NameOfColor.Quantity_NOC_OLIVEDRAB2
Quantity_NOC_OLIVEDRAB3 = Quantity_NameOfColor.Quantity_NOC_OLIVEDRAB3
Quantity_NOC_OLIVEDRAB4 = Quantity_NameOfColor.Quantity_NOC_OLIVEDRAB4
Quantity_NOC_ORANGE = Quantity_NameOfColor.Quantity_NOC_ORANGE
Quantity_NOC_ORANGE1 = Quantity_NameOfColor.Quantity_NOC_ORANGE1
Quantity_NOC_ORANGE2 = Quantity_NameOfColor.Quantity_NOC_ORANGE2
Quantity_NOC_ORANGE3 = Quantity_NameOfColor.Quantity_NOC_ORANGE3
Quantity_NOC_ORANGE4 = Quantity_NameOfColor.Quantity_NOC_ORANGE4
Quantity_NOC_ORANGERED = Quantity_NameOfColor.Quantity_NOC_ORANGERED
Quantity_NOC_ORANGERED1 = Quantity_NameOfColor.Quantity_NOC_ORANGERED1
Quantity_NOC_ORANGERED2 = Quantity_NameOfColor.Quantity_NOC_ORANGERED2
Quantity_NOC_ORANGERED3 = Quantity_NameOfColor.Quantity_NOC_ORANGERED3
Quantity_NOC_ORANGERED4 = Quantity_NameOfColor.Quantity_NOC_ORANGERED4
Quantity_NOC_ORCHID = Quantity_NameOfColor.Quantity_NOC_ORCHID
Quantity_NOC_ORCHID1 = Quantity_NameOfColor.Quantity_NOC_ORCHID1
Quantity_NOC_ORCHID2 = Quantity_NameOfColor.Quantity_NOC_ORCHID2
Quantity_NOC_ORCHID3 = Quantity_NameOfColor.Quantity_NOC_ORCHID3
Quantity_NOC_ORCHID4 = Quantity_NameOfColor.Quantity_NOC_ORCHID4
Quantity_NOC_PALEGOLDENROD = Quantity_NameOfColor.Quantity_NOC_PALEGOLDENROD
Quantity_NOC_PALEGREEN = Quantity_NameOfColor.Quantity_NOC_PALEGREEN
Quantity_NOC_PALEGREEN1 = Quantity_NameOfColor.Quantity_NOC_PALEGREEN1
Quantity_NOC_PALEGREEN2 = Quantity_NameOfColor.Quantity_NOC_PALEGREEN2
Quantity_NOC_PALEGREEN3 = Quantity_NameOfColor.Quantity_NOC_PALEGREEN3
Quantity_NOC_PALEGREEN4 = Quantity_NameOfColor.Quantity_NOC_PALEGREEN4
Quantity_NOC_PALETURQUOISE = Quantity_NameOfColor.Quantity_NOC_PALETURQUOISE
Quantity_NOC_PALETURQUOISE1 = Quantity_NameOfColor.Quantity_NOC_PALETURQUOISE1
Quantity_NOC_PALETURQUOISE2 = Quantity_NameOfColor.Quantity_NOC_PALETURQUOISE2
Quantity_NOC_PALETURQUOISE3 = Quantity_NameOfColor.Quantity_NOC_PALETURQUOISE3
Quantity_NOC_PALETURQUOISE4 = Quantity_NameOfColor.Quantity_NOC_PALETURQUOISE4
Quantity_NOC_PALEVIOLETRED = Quantity_NameOfColor.Quantity_NOC_PALEVIOLETRED
Quantity_NOC_PALEVIOLETRED1 = Quantity_NameOfColor.Quantity_NOC_PALEVIOLETRED1
Quantity_NOC_PALEVIOLETRED2 = Quantity_NameOfColor.Quantity_NOC_PALEVIOLETRED2
Quantity_NOC_PALEVIOLETRED3 = Quantity_NameOfColor.Quantity_NOC_PALEVIOLETRED3
Quantity_NOC_PALEVIOLETRED4 = Quantity_NameOfColor.Quantity_NOC_PALEVIOLETRED4
Quantity_NOC_PAPAYAWHIP = Quantity_NameOfColor.Quantity_NOC_PAPAYAWHIP
Quantity_NOC_PEACHPUFF = Quantity_NameOfColor.Quantity_NOC_PEACHPUFF
Quantity_NOC_PEACHPUFF2 = Quantity_NameOfColor.Quantity_NOC_PEACHPUFF2
Quantity_NOC_PEACHPUFF3 = Quantity_NameOfColor.Quantity_NOC_PEACHPUFF3
Quantity_NOC_PEACHPUFF4 = Quantity_NameOfColor.Quantity_NOC_PEACHPUFF4
Quantity_NOC_PERU = Quantity_NameOfColor.Quantity_NOC_PERU
Quantity_NOC_PINK = Quantity_NameOfColor.Quantity_NOC_PINK
Quantity_NOC_PINK1 = Quantity_NameOfColor.Quantity_NOC_PINK1
Quantity_NOC_PINK2 = Quantity_NameOfColor.Quantity_NOC_PINK2
Quantity_NOC_PINK3 = Quantity_NameOfColor.Quantity_NOC_PINK3
Quantity_NOC_PINK4 = Quantity_NameOfColor.Quantity_NOC_PINK4
Quantity_NOC_PLUM = Quantity_NameOfColor.Quantity_NOC_PLUM
Quantity_NOC_PLUM1 = Quantity_NameOfColor.Quantity_NOC_PLUM1
Quantity_NOC_PLUM2 = Quantity_NameOfColor.Quantity_NOC_PLUM2
Quantity_NOC_PLUM3 = Quantity_NameOfColor.Quantity_NOC_PLUM3
Quantity_NOC_PLUM4 = Quantity_NameOfColor.Quantity_NOC_PLUM4
Quantity_NOC_POWDERBLUE = Quantity_NameOfColor.Quantity_NOC_POWDERBLUE
Quantity_NOC_PURPLE = Quantity_NameOfColor.Quantity_NOC_PURPLE
Quantity_NOC_PURPLE1 = Quantity_NameOfColor.Quantity_NOC_PURPLE1
Quantity_NOC_PURPLE2 = Quantity_NameOfColor.Quantity_NOC_PURPLE2
Quantity_NOC_PURPLE3 = Quantity_NameOfColor.Quantity_NOC_PURPLE3
Quantity_NOC_PURPLE4 = Quantity_NameOfColor.Quantity_NOC_PURPLE4
Quantity_NOC_RED = Quantity_NameOfColor.Quantity_NOC_RED
Quantity_NOC_RED1 = Quantity_NameOfColor.Quantity_NOC_RED1
Quantity_NOC_RED2 = Quantity_NameOfColor.Quantity_NOC_RED2
Quantity_NOC_RED3 = Quantity_NameOfColor.Quantity_NOC_RED3
Quantity_NOC_RED4 = Quantity_NameOfColor.Quantity_NOC_RED4
Quantity_NOC_ROSYBROWN = Quantity_NameOfColor.Quantity_NOC_ROSYBROWN
Quantity_NOC_ROSYBROWN1 = Quantity_NameOfColor.Quantity_NOC_ROSYBROWN1
Quantity_NOC_ROSYBROWN2 = Quantity_NameOfColor.Quantity_NOC_ROSYBROWN2
Quantity_NOC_ROSYBROWN3 = Quantity_NameOfColor.Quantity_NOC_ROSYBROWN3
Quantity_NOC_ROSYBROWN4 = Quantity_NameOfColor.Quantity_NOC_ROSYBROWN4
Quantity_NOC_ROYALBLUE = Quantity_NameOfColor.Quantity_NOC_ROYALBLUE
Quantity_NOC_ROYALBLUE1 = Quantity_NameOfColor.Quantity_NOC_ROYALBLUE1
Quantity_NOC_ROYALBLUE2 = Quantity_NameOfColor.Quantity_NOC_ROYALBLUE2
Quantity_NOC_ROYALBLUE3 = Quantity_NameOfColor.Quantity_NOC_ROYALBLUE3
Quantity_NOC_ROYALBLUE4 = Quantity_NameOfColor.Quantity_NOC_ROYALBLUE4
Quantity_NOC_SADDLEBROWN = Quantity_NameOfColor.Quantity_NOC_SADDLEBROWN
Quantity_NOC_SALMON = Quantity_NameOfColor.Quantity_NOC_SALMON
Quantity_NOC_SALMON1 = Quantity_NameOfColor.Quantity_NOC_SALMON1
Quantity_NOC_SALMON2 = Quantity_NameOfColor.Quantity_NOC_SALMON2
Quantity_NOC_SALMON3 = Quantity_NameOfColor.Quantity_NOC_SALMON3
Quantity_NOC_SALMON4 = Quantity_NameOfColor.Quantity_NOC_SALMON4
Quantity_NOC_SANDYBROWN = Quantity_NameOfColor.Quantity_NOC_SANDYBROWN
Quantity_NOC_SEAGREEN = Quantity_NameOfColor.Quantity_NOC_SEAGREEN
Quantity_NOC_SEAGREEN1 = Quantity_NameOfColor.Quantity_NOC_SEAGREEN1
Quantity_NOC_SEAGREEN2 = Quantity_NameOfColor.Quantity_NOC_SEAGREEN2
Quantity_NOC_SEAGREEN3 = Quantity_NameOfColor.Quantity_NOC_SEAGREEN3
Quantity_NOC_SEAGREEN4 = Quantity_NameOfColor.Quantity_NOC_SEAGREEN4
Quantity_NOC_SEASHELL = Quantity_NameOfColor.Quantity_NOC_SEASHELL
Quantity_NOC_SEASHELL2 = Quantity_NameOfColor.Quantity_NOC_SEASHELL2
Quantity_NOC_SEASHELL3 = Quantity_NameOfColor.Quantity_NOC_SEASHELL3
Quantity_NOC_SEASHELL4 = Quantity_NameOfColor.Quantity_NOC_SEASHELL4
Quantity_NOC_BEET = Quantity_NameOfColor.Quantity_NOC_BEET
Quantity_NOC_TEAL = Quantity_NameOfColor.Quantity_NOC_TEAL
Quantity_NOC_SIENNA = Quantity_NameOfColor.Quantity_NOC_SIENNA
Quantity_NOC_SIENNA1 = Quantity_NameOfColor.Quantity_NOC_SIENNA1
Quantity_NOC_SIENNA2 = Quantity_NameOfColor.Quantity_NOC_SIENNA2
Quantity_NOC_SIENNA3 = Quantity_NameOfColor.Quantity_NOC_SIENNA3
Quantity_NOC_SIENNA4 = Quantity_NameOfColor.Quantity_NOC_SIENNA4
Quantity_NOC_SKYBLUE = Quantity_NameOfColor.Quantity_NOC_SKYBLUE
Quantity_NOC_SKYBLUE1 = Quantity_NameOfColor.Quantity_NOC_SKYBLUE1
Quantity_NOC_SKYBLUE2 = Quantity_NameOfColor.Quantity_NOC_SKYBLUE2
Quantity_NOC_SKYBLUE3 = Quantity_NameOfColor.Quantity_NOC_SKYBLUE3
Quantity_NOC_SKYBLUE4 = Quantity_NameOfColor.Quantity_NOC_SKYBLUE4
Quantity_NOC_SLATEBLUE = Quantity_NameOfColor.Quantity_NOC_SLATEBLUE
Quantity_NOC_SLATEBLUE1 = Quantity_NameOfColor.Quantity_NOC_SLATEBLUE1
Quantity_NOC_SLATEBLUE2 = Quantity_NameOfColor.Quantity_NOC_SLATEBLUE2
Quantity_NOC_SLATEBLUE3 = Quantity_NameOfColor.Quantity_NOC_SLATEBLUE3
Quantity_NOC_SLATEBLUE4 = Quantity_NameOfColor.Quantity_NOC_SLATEBLUE4
Quantity_NOC_SLATEGRAY1 = Quantity_NameOfColor.Quantity_NOC_SLATEGRAY1
Quantity_NOC_SLATEGRAY2 = Quantity_NameOfColor.Quantity_NOC_SLATEGRAY2
Quantity_NOC_SLATEGRAY3 = Quantity_NameOfColor.Quantity_NOC_SLATEGRAY3
Quantity_NOC_SLATEGRAY4 = Quantity_NameOfColor.Quantity_NOC_SLATEGRAY4
Quantity_NOC_SLATEGRAY = Quantity_NameOfColor.Quantity_NOC_SLATEGRAY
Quantity_NOC_SNOW = Quantity_NameOfColor.Quantity_NOC_SNOW
Quantity_NOC_SNOW2 = Quantity_NameOfColor.Quantity_NOC_SNOW2
Quantity_NOC_SNOW3 = Quantity_NameOfColor.Quantity_NOC_SNOW3
Quantity_NOC_SNOW4 = Quantity_NameOfColor.Quantity_NOC_SNOW4
Quantity_NOC_SPRINGGREEN = Quantity_NameOfColor.Quantity_NOC_SPRINGGREEN
Quantity_NOC_SPRINGGREEN2 = Quantity_NameOfColor.Quantity_NOC_SPRINGGREEN2
Quantity_NOC_SPRINGGREEN3 = Quantity_NameOfColor.Quantity_NOC_SPRINGGREEN3
Quantity_NOC_SPRINGGREEN4 = Quantity_NameOfColor.Quantity_NOC_SPRINGGREEN4
Quantity_NOC_STEELBLUE = Quantity_NameOfColor.Quantity_NOC_STEELBLUE
Quantity_NOC_STEELBLUE1 = Quantity_NameOfColor.Quantity_NOC_STEELBLUE1
Quantity_NOC_STEELBLUE2 = Quantity_NameOfColor.Quantity_NOC_STEELBLUE2
Quantity_NOC_STEELBLUE3 = Quantity_NameOfColor.Quantity_NOC_STEELBLUE3
Quantity_NOC_STEELBLUE4 = Quantity_NameOfColor.Quantity_NOC_STEELBLUE4
Quantity_NOC_TAN = Quantity_NameOfColor.Quantity_NOC_TAN
Quantity_NOC_TAN1 = Quantity_NameOfColor.Quantity_NOC_TAN1
Quantity_NOC_TAN2 = Quantity_NameOfColor.Quantity_NOC_TAN2
Quantity_NOC_TAN3 = Quantity_NameOfColor.Quantity_NOC_TAN3
Quantity_NOC_TAN4 = Quantity_NameOfColor.Quantity_NOC_TAN4
Quantity_NOC_THISTLE = Quantity_NameOfColor.Quantity_NOC_THISTLE
Quantity_NOC_THISTLE1 = Quantity_NameOfColor.Quantity_NOC_THISTLE1
Quantity_NOC_THISTLE2 = Quantity_NameOfColor.Quantity_NOC_THISTLE2
Quantity_NOC_THISTLE3 = Quantity_NameOfColor.Quantity_NOC_THISTLE3
Quantity_NOC_THISTLE4 = Quantity_NameOfColor.Quantity_NOC_THISTLE4
Quantity_NOC_TOMATO = Quantity_NameOfColor.Quantity_NOC_TOMATO
Quantity_NOC_TOMATO1 = Quantity_NameOfColor.Quantity_NOC_TOMATO1
Quantity_NOC_TOMATO2 = Quantity_NameOfColor.Quantity_NOC_TOMATO2
Quantity_NOC_TOMATO3 = Quantity_NameOfColor.Quantity_NOC_TOMATO3
Quantity_NOC_TOMATO4 = Quantity_NameOfColor.Quantity_NOC_TOMATO4
Quantity_NOC_TURQUOISE = Quantity_NameOfColor.Quantity_NOC_TURQUOISE
Quantity_NOC_TURQUOISE1 = Quantity_NameOfColor.Quantity_NOC_TURQUOISE1
Quantity_NOC_TURQUOISE2 = Quantity_NameOfColor.Quantity_NOC_TURQUOISE2
Quantity_NOC_TURQUOISE3 = Quantity_NameOfColor.Quantity_NOC_TURQUOISE3
Quantity_NOC_TURQUOISE4 = Quantity_NameOfColor.Quantity_NOC_TURQUOISE4
Quantity_NOC_VIOLET = Quantity_NameOfColor.Quantity_NOC_VIOLET
Quantity_NOC_VIOLETRED = Quantity_NameOfColor.Quantity_NOC_VIOLETRED
Quantity_NOC_VIOLETRED1 = Quantity_NameOfColor.Quantity_NOC_VIOLETRED1
Quantity_NOC_VIOLETRED2 = Quantity_NameOfColor.Quantity_NOC_VIOLETRED2
Quantity_NOC_VIOLETRED3 = Quantity_NameOfColor.Quantity_NOC_VIOLETRED3
Quantity_NOC_VIOLETRED4 = Quantity_NameOfColor.Quantity_NOC_VIOLETRED4
Quantity_NOC_WHEAT = Quantity_NameOfColor.Quantity_NOC_WHEAT
Quantity_NOC_WHEAT1 = Quantity_NameOfColor.Quantity_NOC_WHEAT1
Quantity_NOC_WHEAT2 = Quantity_NameOfColor.Quantity_NOC_WHEAT2
Quantity_NOC_WHEAT3 = Quantity_NameOfColor.Quantity_NOC_WHEAT3
Quantity_NOC_WHEAT4 = Quantity_NameOfColor.Quantity_NOC_WHEAT4
Quantity_NOC_WHITESMOKE = Quantity_NameOfColor.Quantity_NOC_WHITESMOKE
Quantity_NOC_YELLOW = Quantity_NameOfColor.Quantity_NOC_YELLOW
Quantity_NOC_YELLOW1 = Quantity_NameOfColor.Quantity_NOC_YELLOW1
Quantity_NOC_YELLOW2 = Quantity_NameOfColor.Quantity_NOC_YELLOW2
Quantity_NOC_YELLOW3 = Quantity_NameOfColor.Quantity_NOC_YELLOW3
Quantity_NOC_YELLOW4 = Quantity_NameOfColor.Quantity_NOC_YELLOW4
Quantity_NOC_YELLOWGREEN = Quantity_NameOfColor.Quantity_NOC_YELLOWGREEN
Quantity_NOC_WHITE = Quantity_NameOfColor.Quantity_NOC_WHITE

class Quantity_TypeOfColor(IntEnum):
	Quantity_TOC_RGB = 0
	Quantity_TOC_sRGB = 1
	Quantity_TOC_HLS = 2
	Quantity_TOC_CIELab = 3
	Quantity_TOC_CIELch = 4
Quantity_TOC_RGB = Quantity_TypeOfColor.Quantity_TOC_RGB
Quantity_TOC_sRGB = Quantity_TypeOfColor.Quantity_TOC_sRGB
Quantity_TOC_HLS = Quantity_TypeOfColor.Quantity_TOC_HLS
Quantity_TOC_CIELab = Quantity_TypeOfColor.Quantity_TOC_CIELab
Quantity_TOC_CIELch = Quantity_TypeOfColor.Quantity_TOC_CIELch
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Quantity_HArray1OfColor)
/* end handles declaration */

/* templates */
%template(Quantity_Array1OfColor) NCollection_Array1<Quantity_Color>;
Array1ExtendIter(Quantity_Color)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<Quantity_Color> Quantity_Array1OfColor;
typedef NCollection_HArray1<Quantity_Color> Quantity_HArray1OfColor;
/* end typedefs declaration */

/***********************
* class Quantity_Color *
***********************/
class Quantity_Color {
	public:
		/****** Quantity_Color::Quantity_Color ******/
		/****** md5 signature: be3aca6a0556dca0b09770f68f4af1d3 ******/
		%feature("compactdefaultargs") Quantity_Color;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates Quantity_NOC_YELLOW color (for historical reasons).
") Quantity_Color;
		 Quantity_Color();

		/****** Quantity_Color::Quantity_Color ******/
		/****** md5 signature: f0161d09513393232661f2e54de12943 ******/
		%feature("compactdefaultargs") Quantity_Color;
		%feature("autodoc", "
Parameters
----------
theName: Quantity_NameOfColor

Return
-------
None

Description
-----------
Creates the color from enumeration value.
") Quantity_Color;
		 Quantity_Color(const Quantity_NameOfColor theName);

		/****** Quantity_Color::Quantity_Color ******/
		/****** md5 signature: 281c6d80c4290ad2640aafddc8f856cb ******/
		%feature("compactdefaultargs") Quantity_Color;
		%feature("autodoc", "
Parameters
----------
theC1: double
theC2: double
theC3: double
theType: Quantity_TypeOfColor

Return
-------
None

Description
-----------
Creates a color according to the definition system theType. Throws exception if values are out of range.
") Quantity_Color;
		 Quantity_Color(const double theC1, const double theC2, const double theC3, const Quantity_TypeOfColor theType);

		/****** Quantity_Color::Quantity_Color ******/
		/****** md5 signature: 835816f393d027a4564b61805ac875a4 ******/
		%feature("compactdefaultargs") Quantity_Color;
		%feature("autodoc", "
Parameters
----------
theRgb: NCollection_Vec3<float>

Return
-------
None

Description
-----------
Define color from linear RGB values.
") Quantity_Color;
		 Quantity_Color(const NCollection_Vec3<float> & theRgb);

		/****** Quantity_Color::Argb2color ******/
		/****** md5 signature: 26170aa387565cae374a95609667dd67 ******/
		%feature("compactdefaultargs") Argb2color;
		%feature("autodoc", "
Parameters
----------
theARGB: int
theColor: Quantity_Color

Return
-------
None

Description
-----------
Convert integer ARGB value to Color. Alpha bits are ignored. Note that this packing does NOT involve linear -> non-linear sRGB conversion, as would be usually expected to preserve higher (for human eye) color precision in 4 bytes.
") Argb2color;
		static void Argb2color(const int theARGB, Quantity_Color & theColor);

		/****** Quantity_Color::Blue ******/
		/****** md5 signature: d57e787cfa714bbd8c504a13cf51dc0b ******/
		%feature("compactdefaultargs") Blue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Blue component (quantity of blue) of the color within range [0.0; 1.0].
") Blue;
		double Blue();

		/****** Quantity_Color::ChangeContrast ******/
		/****** md5 signature: 84b9d4995a8ecbf280b3da634df841fa ******/
		%feature("compactdefaultargs") ChangeContrast;
		%feature("autodoc", "
Parameters
----------
theDelta: double

Return
-------
None

Description
-----------
Increases or decreases the contrast (variation of the saturation). The delta is a percentage. Any value greater than zero will increase the contrast. The variation is expressed as a percentage of the current value.
") ChangeContrast;
		void ChangeContrast(const double theDelta);

		/****** Quantity_Color::ChangeIntensity ******/
		/****** md5 signature: 0315ccd00f6e3ba8fa2e53e05c208235 ******/
		%feature("compactdefaultargs") ChangeIntensity;
		%feature("autodoc", "
Parameters
----------
theDelta: double

Return
-------
None

Description
-----------
Increases or decreases the intensity (variation of the lightness). The delta is a percentage. Any value greater than zero will increase the intensity. The variation is expressed as a percentage of the current value.
") ChangeIntensity;
		void ChangeIntensity(const double theDelta);

		/****** Quantity_Color::Color2argb ******/
		/****** md5 signature: 46f65d86ac131b8207b4a76002e17ee7 ******/
		%feature("compactdefaultargs") Color2argb;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
theARGB: int

Description
-----------
Convert the color value to ARGB integer value, with alpha equals to 0. So the output is formatted as 0x00RRGGBB. Note that this unpacking does NOT involve non-linear sRGB -> linear RGB conversion, as would be usually expected for RGB color packed into 4 bytes. 
Input parameter: theColor color to convert @param[out] theARGB result color encoded as integer.
") Color2argb;
		static void Color2argb(const Quantity_Color & theColor, Standard_Integer &OutValue);

		/****** Quantity_Color::ColorFromHex ******/
		/****** md5 signature: 41962a10aaca72bff409f00352ccde7e ******/
		%feature("compactdefaultargs") ColorFromHex;
		%feature("autodoc", "
Parameters
----------
theHexColorString: char *
theColor: Quantity_Color

Return
-------
bool

Description
-----------
Parses the string as a hex color (like '#FF0' for short sRGB color, or '#FFFF00' for sRGB color) 
Parameter theHexColorString the string to be parsed 
Parameter theColor a color that is a result of parsing 
Return: true if parsing was successful, or false otherwise.
") ColorFromHex;
		static bool ColorFromHex(const char * const theHexColorString, Quantity_Color & theColor);

		/****** Quantity_Color::ColorFromName ******/
		/****** md5 signature: 2d16c18f3b5012dd6db346057c5dd500 ******/
		%feature("compactdefaultargs") ColorFromName;
		%feature("autodoc", "
Parameters
----------
theName: char *

Return
-------
theColor: Quantity_NameOfColor

Description
-----------
Finds color from predefined names. For example, the name of the color which corresponds to 'BLACK' is Quantity_NOC_BLACK. Returns False if name is unknown.
") ColorFromName;
		static bool ColorFromName(const char * const theName, Quantity_NameOfColor &OutValue);

		/****** Quantity_Color::ColorFromName ******/
		/****** md5 signature: 35dea5d500ca902883da5c9fd2a308f1 ******/
		%feature("compactdefaultargs") ColorFromName;
		%feature("autodoc", "
Parameters
----------
theColorNameString: char *
theColor: Quantity_Color

Return
-------
bool

Description
-----------
Finds color from predefined names. 
Parameter theColorNameString the color name 
Parameter theColor a found color 
Return: false if the color name is unknown, or true if the search by color name was successful.
") ColorFromName;
		static bool ColorFromName(const char * const theColorNameString, Quantity_Color & theColor);

		/****** Quantity_Color::ColorToHex ******/
		/****** md5 signature: 827e9399019af13439644c3161ac2acc ******/
		%feature("compactdefaultargs") ColorToHex;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color
theToPrefixHash: bool (optional, default to true)

Return
-------
TCollection_AsciiString

Description
-----------
Returns hex sRGB string in format '#FFAAFF'.
") ColorToHex;
		static TCollection_AsciiString ColorToHex(const Quantity_Color & theColor, const bool theToPrefixHash = true);

		/****** Quantity_Color::Convert_HLS_To_LinearRGB ******/
		/****** md5 signature: 5d94977ea1f38a6a5ddf37e7866a8d41 ******/
		%feature("compactdefaultargs") Convert_HLS_To_LinearRGB;
		%feature("autodoc", "
Parameters
----------
theHls: NCollection_Vec3<float>

Return
-------
NCollection_Vec3<float >

Description
-----------
Converts HLS components into linear RGB ones.
") Convert_HLS_To_LinearRGB;
		static NCollection_Vec3<float > Convert_HLS_To_LinearRGB(const NCollection_Vec3<float> & theHls);

		/****** Quantity_Color::Convert_HLS_To_sRGB ******/
		/****** md5 signature: 095c9406fed75ba28043396b6c9b6758 ******/
		%feature("compactdefaultargs") Convert_HLS_To_sRGB;
		%feature("autodoc", "
Parameters
----------
theHls: NCollection_Vec3<float>

Return
-------
NCollection_Vec3<float >

Description
-----------
Converts HLS components into RGB ones.
") Convert_HLS_To_sRGB;
		static NCollection_Vec3<float > Convert_HLS_To_sRGB(const NCollection_Vec3<float> & theHls);

		/****** Quantity_Color::Convert_Lab_To_Lch ******/
		/****** md5 signature: 28ff3a00cd3d07258111ed5f144f9afe ******/
		%feature("compactdefaultargs") Convert_Lab_To_Lch;
		%feature("autodoc", "
Parameters
----------
theLab: NCollection_Vec3<float>

Return
-------
NCollection_Vec3<float >

Description
-----------
Converts CIE Lab components into CIE Lch ones.
") Convert_Lab_To_Lch;
		static NCollection_Vec3<float > Convert_Lab_To_Lch(const NCollection_Vec3<float> & theLab);

		/****** Quantity_Color::Convert_Lab_To_LinearRGB ******/
		/****** md5 signature: c51343a6e7d526dbbb0f0221f55c932d ******/
		%feature("compactdefaultargs") Convert_Lab_To_LinearRGB;
		%feature("autodoc", "
Parameters
----------
theLab: NCollection_Vec3<float>

Return
-------
NCollection_Vec3<float >

Description
-----------
Converts CIE Lab components into linear RGB ones. Note that the resulting values may be out of the valid range for RGB.
") Convert_Lab_To_LinearRGB;
		static NCollection_Vec3<float > Convert_Lab_To_LinearRGB(const NCollection_Vec3<float> & theLab);

		/****** Quantity_Color::Convert_Lch_To_Lab ******/
		/****** md5 signature: 6de6103fbf082736b384ef04bf522330 ******/
		%feature("compactdefaultargs") Convert_Lch_To_Lab;
		%feature("autodoc", "
Parameters
----------
theLch: NCollection_Vec3<float>

Return
-------
NCollection_Vec3<float >

Description
-----------
Converts CIE Lch components into CIE Lab ones.
") Convert_Lch_To_Lab;
		static NCollection_Vec3<float > Convert_Lch_To_Lab(const NCollection_Vec3<float> & theLch);

		/****** Quantity_Color::Convert_LinearRGB_To_HLS ******/
		/****** md5 signature: e80e4fa71fc575cb8e6672671349184f ******/
		%feature("compactdefaultargs") Convert_LinearRGB_To_HLS;
		%feature("autodoc", "
Parameters
----------
theRgb: NCollection_Vec3<float>

Return
-------
NCollection_Vec3<float >

Description
-----------
Converts Linear RGB components into HLS ones.
") Convert_LinearRGB_To_HLS;
		static NCollection_Vec3<float > Convert_LinearRGB_To_HLS(const NCollection_Vec3<float> & theRgb);

		/****** Quantity_Color::Convert_LinearRGB_To_Lab ******/
		/****** md5 signature: 24fa3ccf970b631177b8b7b336beac66 ******/
		%feature("compactdefaultargs") Convert_LinearRGB_To_Lab;
		%feature("autodoc", "
Parameters
----------
theRgb: NCollection_Vec3<float>

Return
-------
NCollection_Vec3<float >

Description
-----------
Converts linear RGB components into CIE Lab ones.
") Convert_LinearRGB_To_Lab;
		static NCollection_Vec3<float > Convert_LinearRGB_To_Lab(const NCollection_Vec3<float> & theRgb);

		/****** Quantity_Color::Convert_LinearRGB_To_sRGB ******/
		/****** md5 signature: 011d0b047b2578970ce2cec6f13fb8be ******/
		%feature("compactdefaultargs") Convert_LinearRGB_To_sRGB;
		%feature("autodoc", "
Parameters
----------
theLinearValue: double

Return
-------
double

Description
-----------
Convert linear RGB component into sRGB using OpenGL specs formula (double precision), also known as gamma correction.
") Convert_LinearRGB_To_sRGB;
		static double Convert_LinearRGB_To_sRGB(double theLinearValue);

		/****** Quantity_Color::Convert_LinearRGB_To_sRGB ******/
		/****** md5 signature: 8d34310833b692470c04e2ae93b34f9f ******/
		%feature("compactdefaultargs") Convert_LinearRGB_To_sRGB;
		%feature("autodoc", "
Parameters
----------
theLinearValue: float

Return
-------
float

Description
-----------
Convert linear RGB component into sRGB using OpenGL specs formula (single precision), also known as gamma correction.
") Convert_LinearRGB_To_sRGB;
		static float Convert_LinearRGB_To_sRGB(float theLinearValue);

		/****** Quantity_Color::Convert_LinearRGB_To_sRGB_approx22 ******/
		/****** md5 signature: 7edb1d662db9f5fde6d219be1d8045b4 ******/
		%feature("compactdefaultargs") Convert_LinearRGB_To_sRGB_approx22;
		%feature("autodoc", "
Parameters
----------
theLinearValue: float

Return
-------
float

Description
-----------
Convert linear RGB component into sRGB using approximated uniform gamma coefficient 2.2.
") Convert_LinearRGB_To_sRGB_approx22;
		static float Convert_LinearRGB_To_sRGB_approx22(float theLinearValue);

		/****** Quantity_Color::Convert_LinearRGB_To_sRGB_approx22 ******/
		/****** md5 signature: 47c98e9fae26497dc4e1fcbe0a6eb4ef ******/
		%feature("compactdefaultargs") Convert_LinearRGB_To_sRGB_approx22;
		%feature("autodoc", "
Parameters
----------
theRGB: NCollection_Vec3<float>

Return
-------
NCollection_Vec3<float >

Description
-----------
Convert linear RGB components into sRGB using approximated uniform gamma coefficient 2.2.
") Convert_LinearRGB_To_sRGB_approx22;
		static NCollection_Vec3<float > Convert_LinearRGB_To_sRGB_approx22(const NCollection_Vec3<float> & theRGB);

		/****** Quantity_Color::Convert_sRGB_To_HLS ******/
		/****** md5 signature: 66f9840f5cabfb1bc66e2932848263f9 ******/
		%feature("compactdefaultargs") Convert_sRGB_To_HLS;
		%feature("autodoc", "
Parameters
----------
theRgb: NCollection_Vec3<float>

Return
-------
NCollection_Vec3<float >

Description
-----------
Converts sRGB components into HLS ones.
") Convert_sRGB_To_HLS;
		static NCollection_Vec3<float > Convert_sRGB_To_HLS(const NCollection_Vec3<float> & theRgb);

		/****** Quantity_Color::Convert_sRGB_To_LinearRGB ******/
		/****** md5 signature: 6816a4f222175e06ce3308eaec9eae9f ******/
		%feature("compactdefaultargs") Convert_sRGB_To_LinearRGB;
		%feature("autodoc", "
Parameters
----------
thesRGBValue: double

Return
-------
double

Description
-----------
Convert sRGB component into linear RGB using OpenGL specs formula (double precision), also known as gamma correction.
") Convert_sRGB_To_LinearRGB;
		static double Convert_sRGB_To_LinearRGB(double thesRGBValue);

		/****** Quantity_Color::Convert_sRGB_To_LinearRGB ******/
		/****** md5 signature: de73522cb17a69a8018bf50af4f94860 ******/
		%feature("compactdefaultargs") Convert_sRGB_To_LinearRGB;
		%feature("autodoc", "
Parameters
----------
thesRGBValue: float

Return
-------
float

Description
-----------
Convert sRGB component into linear RGB using OpenGL specs formula (single precision), also known as gamma correction.
") Convert_sRGB_To_LinearRGB;
		static float Convert_sRGB_To_LinearRGB(float thesRGBValue);

		/****** Quantity_Color::Convert_sRGB_To_LinearRGB_approx22 ******/
		/****** md5 signature: 8f170f5a8e5fdcadabf8ba82bab912db ******/
		%feature("compactdefaultargs") Convert_sRGB_To_LinearRGB_approx22;
		%feature("autodoc", "
Parameters
----------
thesRGBValue: float

Return
-------
float

Description
-----------
Convert sRGB component into linear RGB using approximated uniform gamma coefficient 2.2.
") Convert_sRGB_To_LinearRGB_approx22;
		static float Convert_sRGB_To_LinearRGB_approx22(float thesRGBValue);

		/****** Quantity_Color::Convert_sRGB_To_LinearRGB_approx22 ******/
		/****** md5 signature: 8ad8a8a62e2a6419237d237e62d58b82 ******/
		%feature("compactdefaultargs") Convert_sRGB_To_LinearRGB_approx22;
		%feature("autodoc", "
Parameters
----------
theRGB: NCollection_Vec3<float>

Return
-------
NCollection_Vec3<float >

Description
-----------
Convert sRGB components into linear RGB using approximated uniform gamma coefficient 2.2.
") Convert_sRGB_To_LinearRGB_approx22;
		static NCollection_Vec3<float > Convert_sRGB_To_LinearRGB_approx22(const NCollection_Vec3<float> & theRGB);

		/****** Quantity_Color::Delta ******/
		/****** md5 signature: 2d603c2cfa139b8758273b59f7f157a3 ******/
		%feature("compactdefaultargs") Delta;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
DC: double
DI: double

Description
-----------
Returns the percentage change of contrast and intensity between this and another color. <DC> and <DI> are percentages, either positive or negative. The calculation is with respect to this color. If <DC> is positive then <self> is more contrasty. If <DI> is positive then <self> is more intense.
") Delta;
		void Delta(const Quantity_Color & theColor, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Quantity_Color::DeltaE2000 ******/
		/****** md5 signature: 5e2f700a61b5c2337e4fb9c501a567e4 ******/
		%feature("compactdefaultargs") DeltaE2000;
		%feature("autodoc", "
Parameters
----------
theOther: Quantity_Color

Return
-------
double

Description
-----------
Returns the value of the perceptual difference between this color and @p theOther, computed using the CIEDE2000 formula. The difference is in range [0, 100.], with 1 approximately corresponding to the minimal perceivable difference (usually difference 5 or greater is needed for the difference to be recognizable in practice).
") DeltaE2000;
		double DeltaE2000(const Quantity_Color & theOther);

		/****** Quantity_Color::Distance ******/
		/****** md5 signature: 883cdf926dd4f8d693df7f7425b37f8f ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
double

Description
-----------
Returns the distance between two colors. It's a value between 0 and the square root of 3 (the black/white distance).
") Distance;
		double Distance(const Quantity_Color & theColor);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Quantity_Color::Epsilon ******/
		/****** md5 signature: 180c3884b44ed33d7386f709232f14bb ******/
		%feature("compactdefaultargs") Epsilon;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value used to compare two colors for equality; 0.0001 by default.
") Epsilon;
		static double Epsilon();

		/****** Quantity_Color::Green ******/
		/****** md5 signature: bd4981336965491ccf0eea1ff05cbc7f ******/
		%feature("compactdefaultargs") Green;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Green component (quantity of green) of the color within range [0.0; 1.0].
") Green;
		double Green();

		/****** Quantity_Color::HlsRgb ******/
		/****** md5 signature: 0b2f243423813a41da3caf03251be6fe ******/
		%feature("compactdefaultargs") HlsRgb;
		%feature("autodoc", "
Parameters
----------
theH: double
theL: double
theS: double

Return
-------
theR: double
theG: double
theB: double

Description
-----------
Converts HLS components into sRGB ones.
") HlsRgb;
		static void HlsRgb(const double theH, const double theL, const double theS, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Quantity_Color::Hue ******/
		/****** md5 signature: aab1cedc6cdb56aa092fdf5d5ae1db29 ******/
		%feature("compactdefaultargs") Hue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Hue component (hue angle) of the color in degrees within range [0.0; 360.0], 0.0 being Red. -1.0 is a special value reserved for grayscale color (S should be 0.0).
") Hue;
		double Hue();


        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****** Quantity_Color::IsDifferent ******/
		/****** md5 signature: b82e67be8b61a073f8f78f471377ab1e ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
theOther: Quantity_Color

Return
-------
bool

Description
-----------
Returns True if the distance between two colors is greater than Epsilon().
") IsDifferent;
		bool IsDifferent(const Quantity_Color & theOther);

		/****** Quantity_Color::IsEqual ******/
		/****** md5 signature: 475de627a7761d1355dbeef9f3c094a7 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: Quantity_Color

Return
-------
bool

Description
-----------
Returns True if the distance between two colors is no greater than Epsilon().
") IsEqual;
		bool IsEqual(const Quantity_Color & theOther);

		/****** Quantity_Color::Light ******/
		/****** md5 signature: 5c537e6a7f23a93fb4eff5341be4f96f ******/
		%feature("compactdefaultargs") Light;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Light component (value of the lightness) of the color within range [0.0; 1.0].
") Light;
		double Light();

		/****** Quantity_Color::Name ******/
		/****** md5 signature: d49ea227fff1359b6ccda02d482f1a1c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
Quantity_NameOfColor

Description
-----------
Returns the name of the nearest color from the Quantity_NameOfColor enumeration.
") Name;
		Quantity_NameOfColor Name();

		/****** Quantity_Color::Name ******/
		/****** md5 signature: 4f9c11e20e4fdb56d94abe06f5da12e8 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
theR: double
theG: double
theB: double

Return
-------
Quantity_NameOfColor

Description
-----------
Returns the color from Quantity_NameOfColor enumeration nearest to specified RGB values.
") Name;
		static Quantity_NameOfColor Name(const double theR, const double theG, const double theB);

		/****** Quantity_Color::Red ******/
		/****** md5 signature: 989b6be9f750263ba9467d782e33ac25 ******/
		%feature("compactdefaultargs") Red;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Red component (quantity of red) of the color within range [0.0; 1.0].
") Red;
		double Red();

		/****** Quantity_Color::Rgb ******/
		/****** md5 signature: ee575dd4e83971ddd2d2db2204b4fa95 ******/
		%feature("compactdefaultargs") Rgb;
		%feature("autodoc", "Return
-------
NCollection_Vec3<float>

Description
-----------
Return the color as vector of 3 float elements.
") Rgb;
		const NCollection_Vec3<float> & Rgb();

		/****** Quantity_Color::RgbHls ******/
		/****** md5 signature: 68e7ef335adf467ddf5a71d3481a8906 ******/
		%feature("compactdefaultargs") RgbHls;
		%feature("autodoc", "
Parameters
----------
theR: double
theG: double
theB: double

Return
-------
theH: double
theL: double
theS: double

Description
-----------
Converts sRGB components into HLS ones.
") RgbHls;
		static void RgbHls(const double theR, const double theG, const double theB, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Quantity_Color::Saturation ******/
		/****** md5 signature: 1dabc30d588a5b65b62730096542a82b ******/
		%feature("compactdefaultargs") Saturation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Saturation component (value of the saturation) of the color within range [0.0; 1.0].
") Saturation;
		double Saturation();

		/****** Quantity_Color::SetEpsilon ******/
		/****** md5 signature: 2e8b3c530e6b47a57794403f4bd6b51d ******/
		%feature("compactdefaultargs") SetEpsilon;
		%feature("autodoc", "
Parameters
----------
theEpsilon: double

Return
-------
None

Description
-----------
Set the value used to compare two colors for equality.
") SetEpsilon;
		static void SetEpsilon(const double theEpsilon);

		/****** Quantity_Color::SetValues ******/
		/****** md5 signature: 2394f85d8cf103ff4083fd7a5ff95e4f ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
theName: Quantity_NameOfColor

Return
-------
None

Description
-----------
Updates the color from specified named color.
") SetValues;
		void SetValues(const Quantity_NameOfColor theName);

		/****** Quantity_Color::SetValues ******/
		/****** md5 signature: 540498e7b124922e9f8f2df35d1f7ca4 ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
theC1: double
theC2: double
theC3: double
theType: Quantity_TypeOfColor

Return
-------
None

Description
-----------
Updates a color according to the mode specified by theType. Throws exception if values are out of range.
") SetValues;
		void SetValues(const double theC1, const double theC2, const double theC3, const Quantity_TypeOfColor theType);

		/****** Quantity_Color::SquareDistance ******/
		/****** md5 signature: 85034a625d3115c44e86c886976eb92f ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
double

Description
-----------
Returns the square of distance between two colors.
") SquareDistance;
		double SquareDistance(const Quantity_Color & theColor);

		/****** Quantity_Color::StringName ******/
		/****** md5 signature: 41630b9d47866dd1a0011b7eca248df3 ******/
		%feature("compactdefaultargs") StringName;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_NameOfColor

Return
-------
char *

Description
-----------
Returns the name of the color identified by the given Quantity_NameOfColor enumeration value.
") StringName;
		static const char * StringName(const Quantity_NameOfColor theColor);

		/****** Quantity_Color::Values ******/
		/****** md5 signature: 35a33332a4d1c7bdf28a88a8c6f0aee1 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
theType: Quantity_TypeOfColor

Return
-------
theC1: double
theC2: double
theC3: double

Description
-----------
Returns in theC1, theC2 and theC3 the components of this color according to the color system definition theType.
") Values;
		void Values(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const Quantity_TypeOfColor theType);


%extend{
    bool __ne_wrapper__(const Quantity_Color other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __eq_wrapper__(const Quantity_Color other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};



%extend Quantity_Color {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Quantity_Color {
%pythoncode {
    def __setstate__(self, state):
        inst = Quantity_Color()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Quantity_Color')
    }
};
%extend Quantity_Color {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Quantity_ColorRGBA *
***************************/
class Quantity_ColorRGBA {
	public:
		/****** Quantity_ColorRGBA::Quantity_ColorRGBA ******/
		/****** md5 signature: 59cdeedded54e4a79897a6a11ec68037 ******/
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a color with the default value.
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA();

		/****** Quantity_ColorRGBA::Quantity_ColorRGBA ******/
		/****** md5 signature: b7af7c39eb4d733410e7a03e791b5937 ******/
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "
Parameters
----------
theRgb: Quantity_Color

Return
-------
None

Description
-----------
Creates the color with specified RGB value.
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA(const Quantity_Color & theRgb);

		/****** Quantity_ColorRGBA::Quantity_ColorRGBA ******/
		/****** md5 signature: 835fea2de50037d498d34de5732522fa ******/
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "
Parameters
----------
theRgb: Quantity_Color
theAlpha: float

Return
-------
None

Description
-----------
Creates the color with specified RGBA values.
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA(const Quantity_Color & theRgb, float theAlpha);

		/****** Quantity_ColorRGBA::Quantity_ColorRGBA ******/
		/****** md5 signature: 169a4fc643fdae14510d92bffe1581fe ******/
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "
Parameters
----------
theRgba: NCollection_Vec4<float>

Return
-------
None

Description
-----------
Creates the color from RGBA vector.
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA(const NCollection_Vec4<float> & theRgba);

		/****** Quantity_ColorRGBA::Quantity_ColorRGBA ******/
		/****** md5 signature: 8bf5ac0c566506e4521f2e554e6547b7 ******/
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "
Parameters
----------
theRed: float
theGreen: float
theBlue: float
theAlpha: float

Return
-------
None

Description
-----------
Creates the color from RGBA values.
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA(float theRed, float theGreen, float theBlue, float theAlpha);

		/****** Quantity_ColorRGBA::Alpha ******/
		/****** md5 signature: 3509a918d38c042ed9f91712d0070fa4 ******/
		%feature("compactdefaultargs") Alpha;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return alpha value (1.0 means opaque, 0.0 means fully transparent).
") Alpha;
		float Alpha();

		/****** Quantity_ColorRGBA::ChangeRGB ******/
		/****** md5 signature: d0a8336ba1f1e7424a5fca39c1dd472b ******/
		%feature("compactdefaultargs") ChangeRGB;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Modify RGB color components without affecting alpha value.
") ChangeRGB;
		Quantity_Color & ChangeRGB();

		/****** Quantity_ColorRGBA::ColorFromHex ******/
		/****** md5 signature: b3634b5c703eedf63647f9e571d57b71 ******/
		%feature("compactdefaultargs") ColorFromHex;
		%feature("autodoc", "
Parameters
----------
theHexColorString: char *
theColor: Quantity_ColorRGBA
theAlphaComponentIsOff: bool (optional, default to false)

Return
-------
bool

Description
-----------
Parses the string as a hex color (like '#FF0' for short sRGB color, '#FF0F' for short sRGBA color, '#FFFF00' for RGB color, or '#FFFF00FF' for RGBA color) 
Parameter theHexColorString the string to be parsed 
Parameter theColor a color that is a result of parsing 
Parameter theAlphaComponentIsOff the flag that indicates if a color alpha component is presented in the input string (false) or not (true) 
Return: true if parsing was successful, or false otherwise.
") ColorFromHex;
		static bool ColorFromHex(const char * const theHexColorString, Quantity_ColorRGBA & theColor, const bool theAlphaComponentIsOff = false);

		/****** Quantity_ColorRGBA::ColorFromName ******/
		/****** md5 signature: cef05e1c90748143393474a9536f8d49 ******/
		%feature("compactdefaultargs") ColorFromName;
		%feature("autodoc", "
Parameters
----------
theColorNameString: char *
theColor: Quantity_ColorRGBA

Return
-------
bool

Description
-----------
Finds color from predefined names. For example, the name of the color which corresponds to 'BLACK' is Quantity_NOC_BLACK. An alpha component is set to 1.0. 
Parameter theColorNameString the color name 
Parameter theColor a found color 
Return: false if the color name is unknown, or true if the search by color name was successful.
") ColorFromName;
		static bool ColorFromName(const char * const theColorNameString, Quantity_ColorRGBA & theColor);

		/****** Quantity_ColorRGBA::ColorToHex ******/
		/****** md5 signature: b89b0173f7888f68d582303b80ca4dcc ******/
		%feature("compactdefaultargs") ColorToHex;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_ColorRGBA
theToPrefixHash: bool (optional, default to true)

Return
-------
TCollection_AsciiString

Description
-----------
Returns hex sRGBA string in format '#RRGGBBAA'.
") ColorToHex;
		static TCollection_AsciiString ColorToHex(const Quantity_ColorRGBA & theColor, const bool theToPrefixHash = true);

		/****** Quantity_ColorRGBA::Convert_LinearRGB_To_sRGB ******/
		/****** md5 signature: f249f1b059a129f64f7f08b762189f6a ******/
		%feature("compactdefaultargs") Convert_LinearRGB_To_sRGB;
		%feature("autodoc", "
Parameters
----------
theRGB: NCollection_Vec4<float>

Return
-------
NCollection_Vec4<float >

Description
-----------
Convert linear RGB components into sRGB using OpenGL specs formula.
") Convert_LinearRGB_To_sRGB;
		static NCollection_Vec4<float > Convert_LinearRGB_To_sRGB(const NCollection_Vec4<float> & theRGB);

		/****** Quantity_ColorRGBA::Convert_sRGB_To_LinearRGB ******/
		/****** md5 signature: 6e02d8c7cbcec3fc5519ac30fb7fcf5d ******/
		%feature("compactdefaultargs") Convert_sRGB_To_LinearRGB;
		%feature("autodoc", "
Parameters
----------
theRGB: NCollection_Vec4<float>

Return
-------
NCollection_Vec4<float >

Description
-----------
Convert sRGB components into linear RGB using OpenGL specs formula.
") Convert_sRGB_To_LinearRGB;
		static NCollection_Vec4<float > Convert_sRGB_To_LinearRGB(const NCollection_Vec4<float> & theRGB);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Quantity_ColorRGBA::GetRGB ******/
		/****** md5 signature: fc8b9546bc48b02d440b799dc79ad00c ******/
		%feature("compactdefaultargs") GetRGB;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return RGB color value.
") GetRGB;
		const Quantity_Color & GetRGB();


        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****** Quantity_ColorRGBA::IsDifferent ******/
		/****** md5 signature: 07bfe88b2e94b40d8c2125f0c9712e8d ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
theOther: Quantity_ColorRGBA

Return
-------
bool

Description
-----------
Returns true if the distance between colors is greater than Epsilon().
") IsDifferent;
		bool IsDifferent(const Quantity_ColorRGBA & theOther);

		/****** Quantity_ColorRGBA::IsEqual ******/
		/****** md5 signature: 2f885481d4780299902dd0e9a747aa66 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: Quantity_ColorRGBA

Return
-------
bool

Description
-----------
Two colors are considered to be equal if their distance is no greater than Epsilon().
") IsEqual;
		bool IsEqual(const Quantity_ColorRGBA & theOther);

		/****** Quantity_ColorRGBA::SetAlpha ******/
		/****** md5 signature: a55b23b8d6f0cf2c52f90598f9b6eaa9 ******/
		%feature("compactdefaultargs") SetAlpha;
		%feature("autodoc", "
Parameters
----------
theAlpha: float

Return
-------
None

Description
-----------
Assign the alpha value.
") SetAlpha;
		void SetAlpha(const float theAlpha);

		/****** Quantity_ColorRGBA::SetRGB ******/
		/****** md5 signature: b5bc07998b7117c7e3b766cfc4727878 ******/
		%feature("compactdefaultargs") SetRGB;
		%feature("autodoc", "
Parameters
----------
theRgb: Quantity_Color

Return
-------
None

Description
-----------
Assign RGB color components without affecting alpha value.
") SetRGB;
		void SetRGB(const Quantity_Color & theRgb);

		/****** Quantity_ColorRGBA::SetValues ******/
		/****** md5 signature: dc9ac0a4d4c92d125956f303e769115e ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
theRed: float
theGreen: float
theBlue: float
theAlpha: float

Return
-------
None

Description
-----------
Assign new values to the color.
") SetValues;
		void SetValues(float theRed, float theGreen, float theBlue, float theAlpha);


%extend{
    bool __ne_wrapper__(const Quantity_ColorRGBA other) {
        if (*self!=other) return true;
        else return false;
    }
}
%pythoncode {
def __ne__(self, right):
    try:
        return self.__ne_wrapper__(right)
    except:
        return True
}

%extend{
    bool __eq_wrapper__(const Quantity_ColorRGBA other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};



%extend Quantity_ColorRGBA {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Quantity_ColorRGBA {
%pythoncode {
    def __setstate__(self, state):
        inst = Quantity_ColorRGBA()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Quantity_ColorRGBA')
    }
};
%extend Quantity_ColorRGBA {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Quantity_Date *
**********************/
class Quantity_Date {
	public:
		/****** Quantity_Date::Quantity_Date ******/
		/****** md5 signature: 8d43f6af738c96e1986f49ba2f274591 ******/
		%feature("compactdefaultargs") Quantity_Date;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs a default date (00:00 GMT, January 1, 1979 (zero hour)); use the function SetValues to define the required date; or.
") Quantity_Date;
		 Quantity_Date();

		/****** Quantity_Date::Quantity_Date ******/
		/****** md5 signature: 16398c3be95580cb532577dba34214d4 ******/
		%feature("compactdefaultargs") Quantity_Date;
		%feature("autodoc", "
Parameters
----------
mm: int
dd: int
yyyy: int
hh: int
mn: int
ss: int
mis: int (optional, default to 0)
mics: int (optional, default to 0)

Return
-------
None

Description
-----------
Constructs a date from the year yyyy, the month mm, the day dd, the hour hh, the minute mn, the second ss, the millisecond mis (defaulted to 0) and the microsecond mics (defaulted to 0). With: 1 <= mm <= 12 1 <= dd <= max number of days of <mm> 1979 <= yyyy 0 <= hh <= 23 0 <= mn <= 59 0 <= ss <= 59 0 <= mis <= 999 0 <= mics <= 999 Exceptions Quantity_DateDefinitionError if mm, dd, hh, mn, ss, mis and mics are not the components of the valid date.
") Quantity_Date;
		 Quantity_Date(const int mm, const int dd, const int yyyy, const int hh, const int mn, const int ss, const int mis = 0, const int mics = 0);

		/****** Quantity_Date::Add ******/
		/****** md5 signature: 6b980cdb180067930c314362f5a81835 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aPeriod: Quantity_Period

Return
-------
Quantity_Date

Description
-----------
Adds a Period to a Date and returns the new Date.
") Add;
		Quantity_Date Add(const Quantity_Period & aPeriod);

		/****** Quantity_Date::Day ******/
		/****** md5 signature: 90c889fe047659c542a889f4c5322e97 ******/
		%feature("compactdefaultargs") Day;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Day of a Date.
") Day;
		int Day();

		/****** Quantity_Date::Difference ******/
		/****** md5 signature: 9371c141eda9ebda87b5eddf4e0b4d6f ******/
		%feature("compactdefaultargs") Difference;
		%feature("autodoc", "
Parameters
----------
anOther: Quantity_Date

Return
-------
Quantity_Period

Description
-----------
Subtracts one Date from another one to find the period between and returns the value. The result is the absolute value between the difference of two dates.
") Difference;
		Quantity_Period Difference(const Quantity_Date & anOther);

		/****** Quantity_Date::Hour ******/
		/****** md5 signature: f3353cce575899c7c364b7011ed87dfc ******/
		%feature("compactdefaultargs") Hour;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Hour of a Date.
") Hour;
		int Hour();

		/****** Quantity_Date::IsEarlier ******/
		/****** md5 signature: 0c7ebe672f5ed7c252bed19741e2a3b7 ******/
		%feature("compactdefaultargs") IsEarlier;
		%feature("autodoc", "
Parameters
----------
anOther: Quantity_Date

Return
-------
bool

Description
-----------
Returns True if <self> is earlier than <other>.
") IsEarlier;
		bool IsEarlier(const Quantity_Date & anOther);

		/****** Quantity_Date::IsEqual ******/
		/****** md5 signature: 4763592caa5e43bdb21df8dc48a8ca9b ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
anOther: Quantity_Date

Return
-------
bool

Description
-----------
Returns True if both <self> and <other> are equal. This method is an alias of operator ==.
") IsEqual;
		bool IsEqual(const Quantity_Date & anOther);

		/****** Quantity_Date::IsLater ******/
		/****** md5 signature: 06e3532ccc961fd9a17ec79135312af8 ******/
		%feature("compactdefaultargs") IsLater;
		%feature("autodoc", "
Parameters
----------
anOther: Quantity_Date

Return
-------
bool

Description
-----------
Returns True if <self> is later then <other>.
") IsLater;
		bool IsLater(const Quantity_Date & anOther);

		/****** Quantity_Date::IsLeap ******/
		/****** md5 signature: 2121d39187214b6f84ef08c3104f3693 ******/
		%feature("compactdefaultargs") IsLeap;
		%feature("autodoc", "
Parameters
----------
yy: int

Return
-------
bool

Description
-----------
Returns true if a year is a leap year. The leap years are divisible by 4 and not by 100 except the years divisible by 400.
") IsLeap;
		static bool IsLeap(const int yy);

		/****** Quantity_Date::IsValid ******/
		/****** md5 signature: 6ac12b178c4a8a21aec9c345364d0222 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
mm: int
dd: int
yy: int
hh: int
mn: int
ss: int
mis: int (optional, default to 0)
mics: int (optional, default to 0)

Return
-------
bool

Description
-----------
Checks the validity of a date - returns true if a date defined from the year yyyy, the month mm, the day dd, the hour hh, the minute mn, the second ss, the millisecond mis (defaulted to 0) and the microsecond mics (defaulted to 0) is valid. A date must satisfy the conditions above: - yyyy is greater than or equal to 1979, - mm lies within the range [1, 12] (with 1 corresponding to January and 12 to December), - dd lies within a valid range for the month mm (from 1 to 28, 29, 30 or 31 depending on mm and whether yyyy is a leap year or not), - hh lies within the range [0, 23], - mn lies within the range [0, 59], - ss lies within the range [0, 59], - mis lies within the range [0, 999], - mics lies within the range [0, 999].C.
") IsValid;
		static bool IsValid(const int mm, const int dd, const int yy, const int hh, const int mn, const int ss, const int mis = 0, const int mics = 0);

		/****** Quantity_Date::MicroSecond ******/
		/****** md5 signature: c86ea5beeae44285361c287b4b1f206d ******/
		%feature("compactdefaultargs") MicroSecond;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns microsecond of a Date.
") MicroSecond;
		int MicroSecond();

		/****** Quantity_Date::MilliSecond ******/
		/****** md5 signature: b0061470a64c799a19d6a1dce41a5c24 ******/
		%feature("compactdefaultargs") MilliSecond;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns millisecond of a Date.
") MilliSecond;
		int MilliSecond();

		/****** Quantity_Date::Minute ******/
		/****** md5 signature: b245f0e87070cb8cdd0d47089ea1295c ******/
		%feature("compactdefaultargs") Minute;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns minute of a Date.
") Minute;
		int Minute();

		/****** Quantity_Date::Month ******/
		/****** md5 signature: 577163ddabc4051c85b92e05d7c7d407 ******/
		%feature("compactdefaultargs") Month;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns month of a Date.
") Month;
		int Month();

		/****** Quantity_Date::Second ******/
		/****** md5 signature: 9753fb650fe6cbfe3db5bcfa73af889f ******/
		%feature("compactdefaultargs") Second;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns second of a Date.
") Second;
		int Second();

		/****** Quantity_Date::SetValues ******/
		/****** md5 signature: 4bbebbac5e84f75ad57258ea4d6f40a4 ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
mm: int
dd: int
yy: int
hh: int
mn: int
ss: int
mis: int (optional, default to 0)
mics: int (optional, default to 0)

Return
-------
None

Description
-----------
Assigns to this date the year yyyy, the month mm, the day dd, the hour hh, the minute mn, the second ss, the millisecond mis (defaulted to 0) and the microsecond mics (defaulted to 0). Exceptions Quantity_DateDefinitionError if mm, dd, hh, mn, ss, mis and mics are not components of a valid date.
") SetValues;
		void SetValues(const int mm, const int dd, const int yy, const int hh, const int mn, const int ss, const int mis = 0, const int mics = 0);

		/****** Quantity_Date::Subtract ******/
		/****** md5 signature: 7efe0d480376249606f0794680582ba9 ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
aPeriod: Quantity_Period

Return
-------
Quantity_Date

Description
-----------
Subtracts a period from a Date and returns the new Date. Raises an exception if the result date is anterior to Jan 1, 1979.
") Subtract;
		Quantity_Date Subtract(const Quantity_Period & aPeriod);

		/****** Quantity_Date::Values ******/
		/****** md5 signature: f92d9d263de8067e4378a857c572ab3c ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------

Return
-------
mm: int
dd: int
yy: int
hh: int
mn: int
ss: int
mis: int
mics: int

Description
-----------
Gets a complete Date. - in mm - the month, - in dd - the day, - in yyyy - the year, - in hh - the hour, - in mn - the minute, - in ss - the second, - in mis - the millisecond, and - in mics - the microsecond.
") Values;
		void Values(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Quantity_Date::Year ******/
		/****** md5 signature: 90e8c9d044fbf1a3b1b602bdc9d5857f ******/
		%feature("compactdefaultargs") Year;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns year of a Date.
") Year;
		int Year();

		/****** Quantity_Date::operator + ******/
		/****** md5 signature: 065c8848e25f4dc08493ff98a099e834 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
aPeriod: Quantity_Period

Return
-------
Quantity_Date

Description
-----------
No available documentation.
") operator +;
		Quantity_Date operator +(const Quantity_Period & aPeriod);

		/****** Quantity_Date::operator - ******/
		/****** md5 signature: 5cea87d1632e6f9fcc5dbab51dccbf79 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
aPeriod: Quantity_Period

Return
-------
Quantity_Date

Description
-----------
No available documentation.
") operator -;
		Quantity_Date operator -(const Quantity_Period & aPeriod);


%extend{
    bool __eq_wrapper__(const Quantity_Date other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};



%extend Quantity_Date {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Quantity_Date {
%pythoncode {
    def __setstate__(self, state):
        inst = Quantity_Date()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Quantity_Date')
    }
};
%extend Quantity_Date {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Quantity_Period *
************************/
class Quantity_Period {
	public:
		/****** Quantity_Period::Quantity_Period ******/
		/****** md5 signature: e16e4f5791b98f6af7c825e7f8ad86b6 ******/
		%feature("compactdefaultargs") Quantity_Period;
		%feature("autodoc", "
Parameters
----------
dd: int
hh: int
mn: int
ss: int
mis: int (optional, default to 0)
mics: int (optional, default to 0)

Return
-------
None

Description
-----------
Creates a Period With: 0 <= dd 0 <= hh 0 <= mn 0 <= ss 0 <= mis 0 <= mics.
") Quantity_Period;
		 Quantity_Period(const int dd, const int hh, const int mn, const int ss, const int mis = 0, const int mics = 0);

		/****** Quantity_Period::Quantity_Period ******/
		/****** md5 signature: 6a0a1ddffa076fea5d3b92d533535378 ******/
		%feature("compactdefaultargs") Quantity_Period;
		%feature("autodoc", "
Parameters
----------
ss: int
mics: int (optional, default to 0)

Return
-------
None

Description
-----------
Creates a Period with a number of seconds and microseconds. Exceptions Quantity_PeriodDefinitionError: - if the number of seconds expressed either by: - dd days, hh hours, mn minutes and ss seconds, or - Ss is less than 0. - if the number of microseconds expressed either by: - mis milliseconds and mics microseconds, or - Mics is less than 0.
") Quantity_Period;
		 Quantity_Period(const int ss, const int mics = 0);

		/****** Quantity_Period::Add ******/
		/****** md5 signature: 0e9a39b4d418d4361aca2e1f77209cdf ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
anOther: Quantity_Period

Return
-------
Quantity_Period

Description
-----------
Adds one Period to another one.
") Add;
		Quantity_Period Add(const Quantity_Period & anOther);

		/****** Quantity_Period::IsEqual ******/
		/****** md5 signature: bc17c90c938926cc7f6e6814cb51d5a9 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
anOther: Quantity_Period

Return
-------
bool

Description
-----------
Returns True if both <self> and <other> are equal.
") IsEqual;
		bool IsEqual(const Quantity_Period & anOther);

		/****** Quantity_Period::IsLonger ******/
		/****** md5 signature: 15996ecbf6009dcd6172d6e0646421ae ******/
		%feature("compactdefaultargs") IsLonger;
		%feature("autodoc", "
Parameters
----------
anOther: Quantity_Period

Return
-------
bool

Description
-----------
Returns True if <self> is longer then <other>.
") IsLonger;
		bool IsLonger(const Quantity_Period & anOther);

		/****** Quantity_Period::IsShorter ******/
		/****** md5 signature: fc4e55f86e6cb331dd35aae55cbe285f ******/
		%feature("compactdefaultargs") IsShorter;
		%feature("autodoc", "
Parameters
----------
anOther: Quantity_Period

Return
-------
bool

Description
-----------
Returns True if <self> is shorter than <other>.
") IsShorter;
		bool IsShorter(const Quantity_Period & anOther);

		/****** Quantity_Period::IsValid ******/
		/****** md5 signature: 711ef9f562d3d7bd38a5e3d59bdc2103 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
dd: int
hh: int
mn: int
ss: int
mis: int (optional, default to 0)
mics: int (optional, default to 0)

Return
-------
bool

Description
-----------
Checks the validity of a Period in form (dd,hh,mn,ss,mil,mic) With: 0 <= dd 0 <= hh 0 <= mn 0 <= ss 0 <= mis 0 <= mics.
") IsValid;
		static bool IsValid(const int dd, const int hh, const int mn, const int ss, const int mis = 0, const int mics = 0);

		/****** Quantity_Period::IsValid ******/
		/****** md5 signature: f2172be3a3c6cd7dfbe98e3ebea17a37 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
ss: int
mics: int (optional, default to 0)

Return
-------
bool

Description
-----------
Checks the validity of a Period in form (ss,mic) With: 0 <= ss 0 <= mics.
") IsValid;
		static bool IsValid(const int ss, const int mics = 0);

		/****** Quantity_Period::SetValues ******/
		/****** md5 signature: 933f589d29a71ad48e148533cd2ce99b ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
dd: int
hh: int
mn: int
ss: int
mis: int (optional, default to 0)
mics: int (optional, default to 0)

Return
-------
None

Description
-----------
Assigns to this period the time interval defined - with dd days, hh hours, mn minutes, ss seconds, mis (defaulted to 0) milliseconds and mics (defaulted to 0) microseconds; or.
") SetValues;
		void SetValues(const int dd, const int hh, const int mn, const int ss, const int mis = 0, const int mics = 0);

		/****** Quantity_Period::SetValues ******/
		/****** md5 signature: dd58b001756de29ff1f4fe5b161abcf4 ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
ss: int
mics: int (optional, default to 0)

Return
-------
None

Description
-----------
Assigns to this period the time interval defined - with Ss seconds and Mics (defaulted to 0) microseconds. Exceptions Quantity_PeriodDefinitionError: - if the number of seconds expressed either by: - dd days, hh hours, mn minutes and ss seconds, or - Ss is less than 0. - if the number of microseconds expressed either by: - mis milliseconds and mics microseconds, or - Mics is less than 0.
") SetValues;
		void SetValues(const int ss, const int mics = 0);

		/****** Quantity_Period::Subtract ******/
		/****** md5 signature: 2e82f0457853be8b33b2f39e8671979b ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
anOther: Quantity_Period

Return
-------
Quantity_Period

Description
-----------
Subtracts one Period from another and returns the difference.
") Subtract;
		Quantity_Period Subtract(const Quantity_Period & anOther);

		/****** Quantity_Period::Values ******/
		/****** md5 signature: b03c1249c5603106b23e9d6dde74ed51 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------

Return
-------
dd: int
hh: int
mn: int
ss: int
mis: int
mics: int

Description
-----------
Decomposes this period into a number of days,hours, minutes,seconds,milliseconds and microseconds Example of return values: 2 days, 15 hours, 0 minute , 0 second 0 millisecond and 0 microsecond.
") Values;
		void Values(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Quantity_Period::Values ******/
		/****** md5 signature: 987d2b5e81a35cb80dfa1c8e31737912 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------

Return
-------
ss: int
mics: int

Description
-----------
Returns the number of seconds in Ss and the number of remainding microseconds in Mics of this period. Example of return values: 3600 seconds and 0 microseconds.
") Values;
		void Values(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Quantity_Period::operator + ******/
		/****** md5 signature: b469a74a9bde44265acc9f3c4cbf2364 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
anOther: Quantity_Period

Return
-------
Quantity_Period

Description
-----------
No available documentation.
") operator +;
		Quantity_Period operator +(const Quantity_Period & anOther);

		/****** Quantity_Period::operator - ******/
		/****** md5 signature: 0986ca7dc4739dd0190ddec4db2fa4cf ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
anOther: Quantity_Period

Return
-------
Quantity_Period

Description
-----------
No available documentation.
") operator -;
		Quantity_Period operator -(const Quantity_Period & anOther);


%extend{
    bool __eq_wrapper__(const Quantity_Period other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};



%extend Quantity_Period {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Quantity_Period {
%pythoncode {
    def __setstate__(self, state):
        inst = Quantity_Period()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Quantity_Period')
    }
};
%extend Quantity_Period {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class hash<Quantity_Color> *
*****************************/
/*********************************
* class hash<Quantity_ColorRGBA> *
*********************************/
/* harray1 classes */

class Quantity_HArray1OfColor : public NCollection_Array1<Quantity_Color>, public Standard_Transient {
  public:
    Quantity_HArray1OfColor(const Standard_Integer theLower, const Standard_Integer theUpper);
    Quantity_HArray1OfColor(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<Quantity_Color>::value_type& theValue);
    Quantity_HArray1OfColor(const NCollection_Array1<Quantity_Color>& theOther);
    const NCollection_Array1<Quantity_Color>& Array1();
    NCollection_Array1<Quantity_Color>& ChangeArray1();
};
%make_alias(Quantity_HArray1OfColor)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def Quantity_Color_Argb2color(*args):
	return Quantity_Color.Argb2color(*args)

@deprecated
def Quantity_Color_Color2argb(*args):
	return Quantity_Color.Color2argb(*args)

@deprecated
def Quantity_Color_ColorFromHex(*args):
	return Quantity_Color.ColorFromHex(*args)

@deprecated
def Quantity_Color_ColorFromName(*args):
	return Quantity_Color.ColorFromName(*args)

@deprecated
def Quantity_Color_ColorFromName(*args):
	return Quantity_Color.ColorFromName(*args)

@deprecated
def Quantity_Color_ColorToHex(*args):
	return Quantity_Color.ColorToHex(*args)

@deprecated
def Quantity_Color_Epsilon(*args):
	return Quantity_Color.Epsilon(*args)

@deprecated
def Quantity_Color_HlsRgb(*args):
	return Quantity_Color.HlsRgb(*args)

@deprecated
def Quantity_Color_Name(*args):
	return Quantity_Color.Name(*args)

@deprecated
def Quantity_Color_RgbHls(*args):
	return Quantity_Color.RgbHls(*args)

@deprecated
def Quantity_Color_SetEpsilon(*args):
	return Quantity_Color.SetEpsilon(*args)

@deprecated
def Quantity_Color_StringName(*args):
	return Quantity_Color.StringName(*args)

@deprecated
def Quantity_ColorRGBA_ColorFromHex(*args):
	return Quantity_ColorRGBA.ColorFromHex(*args)

@deprecated
def Quantity_ColorRGBA_ColorFromName(*args):
	return Quantity_ColorRGBA.ColorFromName(*args)

@deprecated
def Quantity_ColorRGBA_ColorToHex(*args):
	return Quantity_ColorRGBA.ColorToHex(*args)

@deprecated
def Quantity_Date_IsLeap(*args):
	return Quantity_Date.IsLeap(*args)

@deprecated
def Quantity_Date_IsValid(*args):
	return Quantity_Date.IsValid(*args)

@deprecated
def Quantity_Period_IsValid(*args):
	return Quantity_Period.IsValid(*args)

@deprecated
def Quantity_Period_IsValid(*args):
	return Quantity_Period.IsValid(*args)

}
