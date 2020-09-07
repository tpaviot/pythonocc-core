/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_quantity.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
	Quantity_NOC_BLUE1 = 22,
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
	Quantity_NOC_CHARTREUSE1 = 43,
	Quantity_NOC_CHARTREUSE2 = 44,
	Quantity_NOC_CHARTREUSE3 = 45,
	Quantity_NOC_CHARTREUSE4 = 46,
	Quantity_NOC_CHOCOLATE = 47,
	Quantity_NOC_CHOCOLATE1 = 48,
	Quantity_NOC_CHOCOLATE2 = 49,
	Quantity_NOC_CHOCOLATE3 = 50,
	Quantity_NOC_CHOCOLATE4 = 51,
	Quantity_NOC_CORAL = 52,
	Quantity_NOC_CORAL1 = 53,
	Quantity_NOC_CORAL2 = 54,
	Quantity_NOC_CORAL3 = 55,
	Quantity_NOC_CORAL4 = 56,
	Quantity_NOC_CORNFLOWERBLUE = 57,
	Quantity_NOC_CORNSILK1 = 58,
	Quantity_NOC_CORNSILK2 = 59,
	Quantity_NOC_CORNSILK3 = 60,
	Quantity_NOC_CORNSILK4 = 61,
	Quantity_NOC_CYAN1 = 62,
	Quantity_NOC_CYAN2 = 63,
	Quantity_NOC_CYAN3 = 64,
	Quantity_NOC_CYAN4 = 65,
	Quantity_NOC_DARKGOLDENROD = 66,
	Quantity_NOC_DARKGOLDENROD1 = 67,
	Quantity_NOC_DARKGOLDENROD2 = 68,
	Quantity_NOC_DARKGOLDENROD3 = 69,
	Quantity_NOC_DARKGOLDENROD4 = 70,
	Quantity_NOC_DARKGREEN = 71,
	Quantity_NOC_DARKKHAKI = 72,
	Quantity_NOC_DARKOLIVEGREEN = 73,
	Quantity_NOC_DARKOLIVEGREEN1 = 74,
	Quantity_NOC_DARKOLIVEGREEN2 = 75,
	Quantity_NOC_DARKOLIVEGREEN3 = 76,
	Quantity_NOC_DARKOLIVEGREEN4 = 77,
	Quantity_NOC_DARKORANGE = 78,
	Quantity_NOC_DARKORANGE1 = 79,
	Quantity_NOC_DARKORANGE2 = 80,
	Quantity_NOC_DARKORANGE3 = 81,
	Quantity_NOC_DARKORANGE4 = 82,
	Quantity_NOC_DARKORCHID = 83,
	Quantity_NOC_DARKORCHID1 = 84,
	Quantity_NOC_DARKORCHID2 = 85,
	Quantity_NOC_DARKORCHID3 = 86,
	Quantity_NOC_DARKORCHID4 = 87,
	Quantity_NOC_DARKSALMON = 88,
	Quantity_NOC_DARKSEAGREEN = 89,
	Quantity_NOC_DARKSEAGREEN1 = 90,
	Quantity_NOC_DARKSEAGREEN2 = 91,
	Quantity_NOC_DARKSEAGREEN3 = 92,
	Quantity_NOC_DARKSEAGREEN4 = 93,
	Quantity_NOC_DARKSLATEBLUE = 94,
	Quantity_NOC_DARKSLATEGRAY1 = 95,
	Quantity_NOC_DARKSLATEGRAY2 = 96,
	Quantity_NOC_DARKSLATEGRAY3 = 97,
	Quantity_NOC_DARKSLATEGRAY4 = 98,
	Quantity_NOC_DARKSLATEGRAY = 99,
	Quantity_NOC_DARKTURQUOISE = 100,
	Quantity_NOC_DARKVIOLET = 101,
	Quantity_NOC_DEEPPINK = 102,
	Quantity_NOC_DEEPPINK2 = 103,
	Quantity_NOC_DEEPPINK3 = 104,
	Quantity_NOC_DEEPPINK4 = 105,
	Quantity_NOC_DEEPSKYBLUE1 = 106,
	Quantity_NOC_DEEPSKYBLUE2 = 107,
	Quantity_NOC_DEEPSKYBLUE3 = 108,
	Quantity_NOC_DEEPSKYBLUE4 = 109,
	Quantity_NOC_DODGERBLUE1 = 110,
	Quantity_NOC_DODGERBLUE2 = 111,
	Quantity_NOC_DODGERBLUE3 = 112,
	Quantity_NOC_DODGERBLUE4 = 113,
	Quantity_NOC_FIREBRICK = 114,
	Quantity_NOC_FIREBRICK1 = 115,
	Quantity_NOC_FIREBRICK2 = 116,
	Quantity_NOC_FIREBRICK3 = 117,
	Quantity_NOC_FIREBRICK4 = 118,
	Quantity_NOC_FLORALWHITE = 119,
	Quantity_NOC_FORESTGREEN = 120,
	Quantity_NOC_GAINSBORO = 121,
	Quantity_NOC_GHOSTWHITE = 122,
	Quantity_NOC_GOLD = 123,
	Quantity_NOC_GOLD1 = 124,
	Quantity_NOC_GOLD2 = 125,
	Quantity_NOC_GOLD3 = 126,
	Quantity_NOC_GOLD4 = 127,
	Quantity_NOC_GOLDENROD = 128,
	Quantity_NOC_GOLDENROD1 = 129,
	Quantity_NOC_GOLDENROD2 = 130,
	Quantity_NOC_GOLDENROD3 = 131,
	Quantity_NOC_GOLDENROD4 = 132,
	Quantity_NOC_GRAY = 133,
	Quantity_NOC_GRAY0 = 134,
	Quantity_NOC_GRAY1 = 135,
	Quantity_NOC_GRAY10 = 136,
	Quantity_NOC_GRAY11 = 137,
	Quantity_NOC_GRAY12 = 138,
	Quantity_NOC_GRAY13 = 139,
	Quantity_NOC_GRAY14 = 140,
	Quantity_NOC_GRAY15 = 141,
	Quantity_NOC_GRAY16 = 142,
	Quantity_NOC_GRAY17 = 143,
	Quantity_NOC_GRAY18 = 144,
	Quantity_NOC_GRAY19 = 145,
	Quantity_NOC_GRAY2 = 146,
	Quantity_NOC_GRAY20 = 147,
	Quantity_NOC_GRAY21 = 148,
	Quantity_NOC_GRAY22 = 149,
	Quantity_NOC_GRAY23 = 150,
	Quantity_NOC_GRAY24 = 151,
	Quantity_NOC_GRAY25 = 152,
	Quantity_NOC_GRAY26 = 153,
	Quantity_NOC_GRAY27 = 154,
	Quantity_NOC_GRAY28 = 155,
	Quantity_NOC_GRAY29 = 156,
	Quantity_NOC_GRAY3 = 157,
	Quantity_NOC_GRAY30 = 158,
	Quantity_NOC_GRAY31 = 159,
	Quantity_NOC_GRAY32 = 160,
	Quantity_NOC_GRAY33 = 161,
	Quantity_NOC_GRAY34 = 162,
	Quantity_NOC_GRAY35 = 163,
	Quantity_NOC_GRAY36 = 164,
	Quantity_NOC_GRAY37 = 165,
	Quantity_NOC_GRAY38 = 166,
	Quantity_NOC_GRAY39 = 167,
	Quantity_NOC_GRAY4 = 168,
	Quantity_NOC_GRAY40 = 169,
	Quantity_NOC_GRAY41 = 170,
	Quantity_NOC_GRAY42 = 171,
	Quantity_NOC_GRAY43 = 172,
	Quantity_NOC_GRAY44 = 173,
	Quantity_NOC_GRAY45 = 174,
	Quantity_NOC_GRAY46 = 175,
	Quantity_NOC_GRAY47 = 176,
	Quantity_NOC_GRAY48 = 177,
	Quantity_NOC_GRAY49 = 178,
	Quantity_NOC_GRAY5 = 179,
	Quantity_NOC_GRAY50 = 180,
	Quantity_NOC_GRAY51 = 181,
	Quantity_NOC_GRAY52 = 182,
	Quantity_NOC_GRAY53 = 183,
	Quantity_NOC_GRAY54 = 184,
	Quantity_NOC_GRAY55 = 185,
	Quantity_NOC_GRAY56 = 186,
	Quantity_NOC_GRAY57 = 187,
	Quantity_NOC_GRAY58 = 188,
	Quantity_NOC_GRAY59 = 189,
	Quantity_NOC_GRAY6 = 190,
	Quantity_NOC_GRAY60 = 191,
	Quantity_NOC_GRAY61 = 192,
	Quantity_NOC_GRAY62 = 193,
	Quantity_NOC_GRAY63 = 194,
	Quantity_NOC_GRAY64 = 195,
	Quantity_NOC_GRAY65 = 196,
	Quantity_NOC_GRAY66 = 197,
	Quantity_NOC_GRAY67 = 198,
	Quantity_NOC_GRAY68 = 199,
	Quantity_NOC_GRAY69 = 200,
	Quantity_NOC_GRAY7 = 201,
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
	Quantity_NOC_GRAY8 = 212,
	Quantity_NOC_GRAY80 = 213,
	Quantity_NOC_GRAY81 = 214,
	Quantity_NOC_GRAY82 = 215,
	Quantity_NOC_GRAY83 = 216,
	Quantity_NOC_GRAY85 = 217,
	Quantity_NOC_GRAY86 = 218,
	Quantity_NOC_GRAY87 = 219,
	Quantity_NOC_GRAY88 = 220,
	Quantity_NOC_GRAY89 = 221,
	Quantity_NOC_GRAY9 = 222,
	Quantity_NOC_GRAY90 = 223,
	Quantity_NOC_GRAY91 = 224,
	Quantity_NOC_GRAY92 = 225,
	Quantity_NOC_GRAY93 = 226,
	Quantity_NOC_GRAY94 = 227,
	Quantity_NOC_GRAY95 = 228,
	Quantity_NOC_GREEN = 229,
	Quantity_NOC_GREEN1 = 230,
	Quantity_NOC_GREEN2 = 231,
	Quantity_NOC_GREEN3 = 232,
	Quantity_NOC_GREEN4 = 233,
	Quantity_NOC_GREENYELLOW = 234,
	Quantity_NOC_GRAY97 = 235,
	Quantity_NOC_GRAY98 = 236,
	Quantity_NOC_GRAY99 = 237,
	Quantity_NOC_HONEYDEW = 238,
	Quantity_NOC_HONEYDEW2 = 239,
	Quantity_NOC_HONEYDEW3 = 240,
	Quantity_NOC_HONEYDEW4 = 241,
	Quantity_NOC_HOTPINK = 242,
	Quantity_NOC_HOTPINK1 = 243,
	Quantity_NOC_HOTPINK2 = 244,
	Quantity_NOC_HOTPINK3 = 245,
	Quantity_NOC_HOTPINK4 = 246,
	Quantity_NOC_INDIANRED = 247,
	Quantity_NOC_INDIANRED1 = 248,
	Quantity_NOC_INDIANRED2 = 249,
	Quantity_NOC_INDIANRED3 = 250,
	Quantity_NOC_INDIANRED4 = 251,
	Quantity_NOC_IVORY = 252,
	Quantity_NOC_IVORY2 = 253,
	Quantity_NOC_IVORY3 = 254,
	Quantity_NOC_IVORY4 = 255,
	Quantity_NOC_KHAKI = 256,
	Quantity_NOC_KHAKI1 = 257,
	Quantity_NOC_KHAKI2 = 258,
	Quantity_NOC_KHAKI3 = 259,
	Quantity_NOC_KHAKI4 = 260,
	Quantity_NOC_LAVENDER = 261,
	Quantity_NOC_LAVENDERBLUSH1 = 262,
	Quantity_NOC_LAVENDERBLUSH2 = 263,
	Quantity_NOC_LAVENDERBLUSH3 = 264,
	Quantity_NOC_LAVENDERBLUSH4 = 265,
	Quantity_NOC_LAWNGREEN = 266,
	Quantity_NOC_LEMONCHIFFON1 = 267,
	Quantity_NOC_LEMONCHIFFON2 = 268,
	Quantity_NOC_LEMONCHIFFON3 = 269,
	Quantity_NOC_LEMONCHIFFON4 = 270,
	Quantity_NOC_LIGHTBLUE = 271,
	Quantity_NOC_LIGHTBLUE1 = 272,
	Quantity_NOC_LIGHTBLUE2 = 273,
	Quantity_NOC_LIGHTBLUE3 = 274,
	Quantity_NOC_LIGHTBLUE4 = 275,
	Quantity_NOC_LIGHTCORAL = 276,
	Quantity_NOC_LIGHTCYAN1 = 277,
	Quantity_NOC_LIGHTCYAN2 = 278,
	Quantity_NOC_LIGHTCYAN3 = 279,
	Quantity_NOC_LIGHTCYAN4 = 280,
	Quantity_NOC_LIGHTGOLDENROD = 281,
	Quantity_NOC_LIGHTGOLDENROD1 = 282,
	Quantity_NOC_LIGHTGOLDENROD2 = 283,
	Quantity_NOC_LIGHTGOLDENROD3 = 284,
	Quantity_NOC_LIGHTGOLDENROD4 = 285,
	Quantity_NOC_LIGHTGOLDENRODYELLOW = 286,
	Quantity_NOC_LIGHTGRAY = 287,
	Quantity_NOC_LIGHTPINK = 288,
	Quantity_NOC_LIGHTPINK1 = 289,
	Quantity_NOC_LIGHTPINK2 = 290,
	Quantity_NOC_LIGHTPINK3 = 291,
	Quantity_NOC_LIGHTPINK4 = 292,
	Quantity_NOC_LIGHTSALMON1 = 293,
	Quantity_NOC_LIGHTSALMON2 = 294,
	Quantity_NOC_LIGHTSALMON3 = 295,
	Quantity_NOC_LIGHTSALMON4 = 296,
	Quantity_NOC_LIGHTSEAGREEN = 297,
	Quantity_NOC_LIGHTSKYBLUE = 298,
	Quantity_NOC_LIGHTSKYBLUE1 = 299,
	Quantity_NOC_LIGHTSKYBLUE2 = 300,
	Quantity_NOC_LIGHTSKYBLUE3 = 301,
	Quantity_NOC_LIGHTSKYBLUE4 = 302,
	Quantity_NOC_LIGHTSLATEBLUE = 303,
	Quantity_NOC_LIGHTSLATEGRAY = 304,
	Quantity_NOC_LIGHTSTEELBLUE = 305,
	Quantity_NOC_LIGHTSTEELBLUE1 = 306,
	Quantity_NOC_LIGHTSTEELBLUE2 = 307,
	Quantity_NOC_LIGHTSTEELBLUE3 = 308,
	Quantity_NOC_LIGHTSTEELBLUE4 = 309,
	Quantity_NOC_LIGHTYELLOW = 310,
	Quantity_NOC_LIGHTYELLOW2 = 311,
	Quantity_NOC_LIGHTYELLOW3 = 312,
	Quantity_NOC_LIGHTYELLOW4 = 313,
	Quantity_NOC_LIMEGREEN = 314,
	Quantity_NOC_LINEN = 315,
	Quantity_NOC_MAGENTA1 = 316,
	Quantity_NOC_MAGENTA2 = 317,
	Quantity_NOC_MAGENTA3 = 318,
	Quantity_NOC_MAGENTA4 = 319,
	Quantity_NOC_MAROON = 320,
	Quantity_NOC_MAROON1 = 321,
	Quantity_NOC_MAROON2 = 322,
	Quantity_NOC_MAROON3 = 323,
	Quantity_NOC_MAROON4 = 324,
	Quantity_NOC_MEDIUMAQUAMARINE = 325,
	Quantity_NOC_MEDIUMORCHID = 326,
	Quantity_NOC_MEDIUMORCHID1 = 327,
	Quantity_NOC_MEDIUMORCHID2 = 328,
	Quantity_NOC_MEDIUMORCHID3 = 329,
	Quantity_NOC_MEDIUMORCHID4 = 330,
	Quantity_NOC_MEDIUMPURPLE = 331,
	Quantity_NOC_MEDIUMPURPLE1 = 332,
	Quantity_NOC_MEDIUMPURPLE2 = 333,
	Quantity_NOC_MEDIUMPURPLE3 = 334,
	Quantity_NOC_MEDIUMPURPLE4 = 335,
	Quantity_NOC_MEDIUMSEAGREEN = 336,
	Quantity_NOC_MEDIUMSLATEBLUE = 337,
	Quantity_NOC_MEDIUMSPRINGGREEN = 338,
	Quantity_NOC_MEDIUMTURQUOISE = 339,
	Quantity_NOC_MEDIUMVIOLETRED = 340,
	Quantity_NOC_MIDNIGHTBLUE = 341,
	Quantity_NOC_MINTCREAM = 342,
	Quantity_NOC_MISTYROSE = 343,
	Quantity_NOC_MISTYROSE2 = 344,
	Quantity_NOC_MISTYROSE3 = 345,
	Quantity_NOC_MISTYROSE4 = 346,
	Quantity_NOC_MOCCASIN = 347,
	Quantity_NOC_NAVAJOWHITE1 = 348,
	Quantity_NOC_NAVAJOWHITE2 = 349,
	Quantity_NOC_NAVAJOWHITE3 = 350,
	Quantity_NOC_NAVAJOWHITE4 = 351,
	Quantity_NOC_NAVYBLUE = 352,
	Quantity_NOC_OLDLACE = 353,
	Quantity_NOC_OLIVEDRAB = 354,
	Quantity_NOC_OLIVEDRAB1 = 355,
	Quantity_NOC_OLIVEDRAB2 = 356,
	Quantity_NOC_OLIVEDRAB3 = 357,
	Quantity_NOC_OLIVEDRAB4 = 358,
	Quantity_NOC_ORANGE = 359,
	Quantity_NOC_ORANGE1 = 360,
	Quantity_NOC_ORANGE2 = 361,
	Quantity_NOC_ORANGE3 = 362,
	Quantity_NOC_ORANGE4 = 363,
	Quantity_NOC_ORANGERED = 364,
	Quantity_NOC_ORANGERED1 = 365,
	Quantity_NOC_ORANGERED2 = 366,
	Quantity_NOC_ORANGERED3 = 367,
	Quantity_NOC_ORANGERED4 = 368,
	Quantity_NOC_ORCHID = 369,
	Quantity_NOC_ORCHID1 = 370,
	Quantity_NOC_ORCHID2 = 371,
	Quantity_NOC_ORCHID3 = 372,
	Quantity_NOC_ORCHID4 = 373,
	Quantity_NOC_PALEGOLDENROD = 374,
	Quantity_NOC_PALEGREEN = 375,
	Quantity_NOC_PALEGREEN1 = 376,
	Quantity_NOC_PALEGREEN2 = 377,
	Quantity_NOC_PALEGREEN3 = 378,
	Quantity_NOC_PALEGREEN4 = 379,
	Quantity_NOC_PALETURQUOISE = 380,
	Quantity_NOC_PALETURQUOISE1 = 381,
	Quantity_NOC_PALETURQUOISE2 = 382,
	Quantity_NOC_PALETURQUOISE3 = 383,
	Quantity_NOC_PALETURQUOISE4 = 384,
	Quantity_NOC_PALEVIOLETRED = 385,
	Quantity_NOC_PALEVIOLETRED1 = 386,
	Quantity_NOC_PALEVIOLETRED2 = 387,
	Quantity_NOC_PALEVIOLETRED3 = 388,
	Quantity_NOC_PALEVIOLETRED4 = 389,
	Quantity_NOC_PAPAYAWHIP = 390,
	Quantity_NOC_PEACHPUFF = 391,
	Quantity_NOC_PEACHPUFF2 = 392,
	Quantity_NOC_PEACHPUFF3 = 393,
	Quantity_NOC_PEACHPUFF4 = 394,
	Quantity_NOC_PERU = 395,
	Quantity_NOC_PINK = 396,
	Quantity_NOC_PINK1 = 397,
	Quantity_NOC_PINK2 = 398,
	Quantity_NOC_PINK3 = 399,
	Quantity_NOC_PINK4 = 400,
	Quantity_NOC_PLUM = 401,
	Quantity_NOC_PLUM1 = 402,
	Quantity_NOC_PLUM2 = 403,
	Quantity_NOC_PLUM3 = 404,
	Quantity_NOC_PLUM4 = 405,
	Quantity_NOC_POWDERBLUE = 406,
	Quantity_NOC_PURPLE = 407,
	Quantity_NOC_PURPLE1 = 408,
	Quantity_NOC_PURPLE2 = 409,
	Quantity_NOC_PURPLE3 = 410,
	Quantity_NOC_PURPLE4 = 411,
	Quantity_NOC_RED = 412,
	Quantity_NOC_RED1 = 413,
	Quantity_NOC_RED2 = 414,
	Quantity_NOC_RED3 = 415,
	Quantity_NOC_RED4 = 416,
	Quantity_NOC_ROSYBROWN = 417,
	Quantity_NOC_ROSYBROWN1 = 418,
	Quantity_NOC_ROSYBROWN2 = 419,
	Quantity_NOC_ROSYBROWN3 = 420,
	Quantity_NOC_ROSYBROWN4 = 421,
	Quantity_NOC_ROYALBLUE = 422,
	Quantity_NOC_ROYALBLUE1 = 423,
	Quantity_NOC_ROYALBLUE2 = 424,
	Quantity_NOC_ROYALBLUE3 = 425,
	Quantity_NOC_ROYALBLUE4 = 426,
	Quantity_NOC_SADDLEBROWN = 427,
	Quantity_NOC_SALMON = 428,
	Quantity_NOC_SALMON1 = 429,
	Quantity_NOC_SALMON2 = 430,
	Quantity_NOC_SALMON3 = 431,
	Quantity_NOC_SALMON4 = 432,
	Quantity_NOC_SANDYBROWN = 433,
	Quantity_NOC_SEAGREEN = 434,
	Quantity_NOC_SEAGREEN1 = 435,
	Quantity_NOC_SEAGREEN2 = 436,
	Quantity_NOC_SEAGREEN3 = 437,
	Quantity_NOC_SEAGREEN4 = 438,
	Quantity_NOC_SEASHELL = 439,
	Quantity_NOC_SEASHELL2 = 440,
	Quantity_NOC_SEASHELL3 = 441,
	Quantity_NOC_SEASHELL4 = 442,
	Quantity_NOC_BEET = 443,
	Quantity_NOC_TEAL = 444,
	Quantity_NOC_SIENNA = 445,
	Quantity_NOC_SIENNA1 = 446,
	Quantity_NOC_SIENNA2 = 447,
	Quantity_NOC_SIENNA3 = 448,
	Quantity_NOC_SIENNA4 = 449,
	Quantity_NOC_SKYBLUE = 450,
	Quantity_NOC_SKYBLUE1 = 451,
	Quantity_NOC_SKYBLUE2 = 452,
	Quantity_NOC_SKYBLUE3 = 453,
	Quantity_NOC_SKYBLUE4 = 454,
	Quantity_NOC_SLATEBLUE = 455,
	Quantity_NOC_SLATEBLUE1 = 456,
	Quantity_NOC_SLATEBLUE2 = 457,
	Quantity_NOC_SLATEBLUE3 = 458,
	Quantity_NOC_SLATEBLUE4 = 459,
	Quantity_NOC_SLATEGRAY1 = 460,
	Quantity_NOC_SLATEGRAY2 = 461,
	Quantity_NOC_SLATEGRAY3 = 462,
	Quantity_NOC_SLATEGRAY4 = 463,
	Quantity_NOC_SLATEGRAY = 464,
	Quantity_NOC_SNOW = 465,
	Quantity_NOC_SNOW2 = 466,
	Quantity_NOC_SNOW3 = 467,
	Quantity_NOC_SNOW4 = 468,
	Quantity_NOC_SPRINGGREEN = 469,
	Quantity_NOC_SPRINGGREEN2 = 470,
	Quantity_NOC_SPRINGGREEN3 = 471,
	Quantity_NOC_SPRINGGREEN4 = 472,
	Quantity_NOC_STEELBLUE = 473,
	Quantity_NOC_STEELBLUE1 = 474,
	Quantity_NOC_STEELBLUE2 = 475,
	Quantity_NOC_STEELBLUE3 = 476,
	Quantity_NOC_STEELBLUE4 = 477,
	Quantity_NOC_TAN = 478,
	Quantity_NOC_TAN1 = 479,
	Quantity_NOC_TAN2 = 480,
	Quantity_NOC_TAN3 = 481,
	Quantity_NOC_TAN4 = 482,
	Quantity_NOC_THISTLE = 483,
	Quantity_NOC_THISTLE1 = 484,
	Quantity_NOC_THISTLE2 = 485,
	Quantity_NOC_THISTLE3 = 486,
	Quantity_NOC_THISTLE4 = 487,
	Quantity_NOC_TOMATO = 488,
	Quantity_NOC_TOMATO1 = 489,
	Quantity_NOC_TOMATO2 = 490,
	Quantity_NOC_TOMATO3 = 491,
	Quantity_NOC_TOMATO4 = 492,
	Quantity_NOC_TURQUOISE = 493,
	Quantity_NOC_TURQUOISE1 = 494,
	Quantity_NOC_TURQUOISE2 = 495,
	Quantity_NOC_TURQUOISE3 = 496,
	Quantity_NOC_TURQUOISE4 = 497,
	Quantity_NOC_VIOLET = 498,
	Quantity_NOC_VIOLETRED = 499,
	Quantity_NOC_VIOLETRED1 = 500,
	Quantity_NOC_VIOLETRED2 = 501,
	Quantity_NOC_VIOLETRED3 = 502,
	Quantity_NOC_VIOLETRED4 = 503,
	Quantity_NOC_WHEAT = 504,
	Quantity_NOC_WHEAT1 = 505,
	Quantity_NOC_WHEAT2 = 506,
	Quantity_NOC_WHEAT3 = 507,
	Quantity_NOC_WHEAT4 = 508,
	Quantity_NOC_WHITESMOKE = 509,
	Quantity_NOC_YELLOW = 510,
	Quantity_NOC_YELLOW1 = 511,
	Quantity_NOC_YELLOW2 = 512,
	Quantity_NOC_YELLOW3 = 513,
	Quantity_NOC_YELLOW4 = 514,
	Quantity_NOC_YELLOWGREEN = 515,
	Quantity_NOC_WHITE = 516,
};

enum Quantity_TypeOfColor {
	Quantity_TOC_RGB = 0,
	Quantity_TOC_HLS = 1,
};

enum Quantity_PhysicalQuantity {
	Quantity_MASS = 0,
	Quantity_PLANEANGLE = 1,
	Quantity_SOLIDANGLE = 2,
	Quantity_LENGTH = 3,
	Quantity_AREA = 4,
	Quantity_VOLUME = 5,
	Quantity_SPEED = 6,
	Quantity_VELOCITY = 7,
	Quantity_ACCELERATION = 8,
	Quantity_ANGULARVELOCITY = 9,
	Quantity_FREQUENCY = 10,
	Quantity_TEMPERATURE = 11,
	Quantity_AMOUNTOFSUBSTANCE = 12,
	Quantity_DENSITY = 13,
	Quantity_MASSFLOW = 14,
	Quantity_VOLUMEFLOW = 15,
	Quantity_CONSUMPTION = 16,
	Quantity_MOMENTUM = 17,
	Quantity_KINETICMOMENT = 18,
	Quantity_MOMENTOFINERTIA = 19,
	Quantity_FORCE = 20,
	Quantity_MOMENTOFAFORCE = 21,
	Quantity_TORQUE = 22,
	Quantity_WEIGHT = 23,
	Quantity_PRESSURE = 24,
	Quantity_VISCOSITY = 25,
	Quantity_KINEMATICVISCOSITY = 26,
	Quantity_ENERGY = 27,
	Quantity_WORK = 28,
	Quantity_POWER = 29,
	Quantity_SURFACETENSION = 30,
	Quantity_COEFFICIENTOFEXPANSION = 31,
	Quantity_THERMALCONDUCTIVITY = 32,
	Quantity_SPECIFICHEATCAPACITY = 33,
	Quantity_ENTROPY = 34,
	Quantity_ENTHALPY = 35,
	Quantity_LUMINOUSINTENSITY = 36,
	Quantity_LUMINOUSFLUX = 37,
	Quantity_LUMINANCE = 38,
	Quantity_ILLUMINANCE = 39,
	Quantity_LUMINOUSEXPOSITION = 40,
	Quantity_LUMINOUSEFFICACITY = 41,
	Quantity_ELECTRICCHARGE = 42,
	Quantity_ELECTRICCURRENT = 43,
	Quantity_ELECTRICFIELDSTRENGTH = 44,
	Quantity_ELECTRICPOTENTIAL = 45,
	Quantity_ELECTRICCAPACITANCE = 46,
	Quantity_MAGNETICFLUX = 47,
	Quantity_MAGNETICFLUXDENSITY = 48,
	Quantity_MAGNETICFIELDSTRENGTH = 49,
	Quantity_RELUCTANCE = 50,
	Quantity_RESISTANCE = 51,
	Quantity_INDUCTANCE = 52,
	Quantity_CAPACITANCE = 53,
	Quantity_IMPEDANCE = 54,
	Quantity_ADMITTANCE = 55,
	Quantity_RESISTIVITY = 56,
	Quantity_CONDUCTIVITY = 57,
	Quantity_MOLARMASS = 58,
	Quantity_MOLARVOLUME = 59,
	Quantity_CONCENTRATION = 60,
	Quantity_MOLARCONCENTRATION = 61,
	Quantity_MOLARITY = 62,
	Quantity_SOUNDINTENSITY = 63,
	Quantity_ACOUSTICINTENSITY = 64,
	Quantity_ACTIVITY = 65,
	Quantity_ABSORBEDDOSE = 66,
	Quantity_DOSEEQUIVALENT = 67,
};

/* end public enums declaration */

/* python proy classes for enums */
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
	Quantity_NOC_BLUE1 = 22
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
	Quantity_NOC_CHARTREUSE1 = 43
	Quantity_NOC_CHARTREUSE2 = 44
	Quantity_NOC_CHARTREUSE3 = 45
	Quantity_NOC_CHARTREUSE4 = 46
	Quantity_NOC_CHOCOLATE = 47
	Quantity_NOC_CHOCOLATE1 = 48
	Quantity_NOC_CHOCOLATE2 = 49
	Quantity_NOC_CHOCOLATE3 = 50
	Quantity_NOC_CHOCOLATE4 = 51
	Quantity_NOC_CORAL = 52
	Quantity_NOC_CORAL1 = 53
	Quantity_NOC_CORAL2 = 54
	Quantity_NOC_CORAL3 = 55
	Quantity_NOC_CORAL4 = 56
	Quantity_NOC_CORNFLOWERBLUE = 57
	Quantity_NOC_CORNSILK1 = 58
	Quantity_NOC_CORNSILK2 = 59
	Quantity_NOC_CORNSILK3 = 60
	Quantity_NOC_CORNSILK4 = 61
	Quantity_NOC_CYAN1 = 62
	Quantity_NOC_CYAN2 = 63
	Quantity_NOC_CYAN3 = 64
	Quantity_NOC_CYAN4 = 65
	Quantity_NOC_DARKGOLDENROD = 66
	Quantity_NOC_DARKGOLDENROD1 = 67
	Quantity_NOC_DARKGOLDENROD2 = 68
	Quantity_NOC_DARKGOLDENROD3 = 69
	Quantity_NOC_DARKGOLDENROD4 = 70
	Quantity_NOC_DARKGREEN = 71
	Quantity_NOC_DARKKHAKI = 72
	Quantity_NOC_DARKOLIVEGREEN = 73
	Quantity_NOC_DARKOLIVEGREEN1 = 74
	Quantity_NOC_DARKOLIVEGREEN2 = 75
	Quantity_NOC_DARKOLIVEGREEN3 = 76
	Quantity_NOC_DARKOLIVEGREEN4 = 77
	Quantity_NOC_DARKORANGE = 78
	Quantity_NOC_DARKORANGE1 = 79
	Quantity_NOC_DARKORANGE2 = 80
	Quantity_NOC_DARKORANGE3 = 81
	Quantity_NOC_DARKORANGE4 = 82
	Quantity_NOC_DARKORCHID = 83
	Quantity_NOC_DARKORCHID1 = 84
	Quantity_NOC_DARKORCHID2 = 85
	Quantity_NOC_DARKORCHID3 = 86
	Quantity_NOC_DARKORCHID4 = 87
	Quantity_NOC_DARKSALMON = 88
	Quantity_NOC_DARKSEAGREEN = 89
	Quantity_NOC_DARKSEAGREEN1 = 90
	Quantity_NOC_DARKSEAGREEN2 = 91
	Quantity_NOC_DARKSEAGREEN3 = 92
	Quantity_NOC_DARKSEAGREEN4 = 93
	Quantity_NOC_DARKSLATEBLUE = 94
	Quantity_NOC_DARKSLATEGRAY1 = 95
	Quantity_NOC_DARKSLATEGRAY2 = 96
	Quantity_NOC_DARKSLATEGRAY3 = 97
	Quantity_NOC_DARKSLATEGRAY4 = 98
	Quantity_NOC_DARKSLATEGRAY = 99
	Quantity_NOC_DARKTURQUOISE = 100
	Quantity_NOC_DARKVIOLET = 101
	Quantity_NOC_DEEPPINK = 102
	Quantity_NOC_DEEPPINK2 = 103
	Quantity_NOC_DEEPPINK3 = 104
	Quantity_NOC_DEEPPINK4 = 105
	Quantity_NOC_DEEPSKYBLUE1 = 106
	Quantity_NOC_DEEPSKYBLUE2 = 107
	Quantity_NOC_DEEPSKYBLUE3 = 108
	Quantity_NOC_DEEPSKYBLUE4 = 109
	Quantity_NOC_DODGERBLUE1 = 110
	Quantity_NOC_DODGERBLUE2 = 111
	Quantity_NOC_DODGERBLUE3 = 112
	Quantity_NOC_DODGERBLUE4 = 113
	Quantity_NOC_FIREBRICK = 114
	Quantity_NOC_FIREBRICK1 = 115
	Quantity_NOC_FIREBRICK2 = 116
	Quantity_NOC_FIREBRICK3 = 117
	Quantity_NOC_FIREBRICK4 = 118
	Quantity_NOC_FLORALWHITE = 119
	Quantity_NOC_FORESTGREEN = 120
	Quantity_NOC_GAINSBORO = 121
	Quantity_NOC_GHOSTWHITE = 122
	Quantity_NOC_GOLD = 123
	Quantity_NOC_GOLD1 = 124
	Quantity_NOC_GOLD2 = 125
	Quantity_NOC_GOLD3 = 126
	Quantity_NOC_GOLD4 = 127
	Quantity_NOC_GOLDENROD = 128
	Quantity_NOC_GOLDENROD1 = 129
	Quantity_NOC_GOLDENROD2 = 130
	Quantity_NOC_GOLDENROD3 = 131
	Quantity_NOC_GOLDENROD4 = 132
	Quantity_NOC_GRAY = 133
	Quantity_NOC_GRAY0 = 134
	Quantity_NOC_GRAY1 = 135
	Quantity_NOC_GRAY10 = 136
	Quantity_NOC_GRAY11 = 137
	Quantity_NOC_GRAY12 = 138
	Quantity_NOC_GRAY13 = 139
	Quantity_NOC_GRAY14 = 140
	Quantity_NOC_GRAY15 = 141
	Quantity_NOC_GRAY16 = 142
	Quantity_NOC_GRAY17 = 143
	Quantity_NOC_GRAY18 = 144
	Quantity_NOC_GRAY19 = 145
	Quantity_NOC_GRAY2 = 146
	Quantity_NOC_GRAY20 = 147
	Quantity_NOC_GRAY21 = 148
	Quantity_NOC_GRAY22 = 149
	Quantity_NOC_GRAY23 = 150
	Quantity_NOC_GRAY24 = 151
	Quantity_NOC_GRAY25 = 152
	Quantity_NOC_GRAY26 = 153
	Quantity_NOC_GRAY27 = 154
	Quantity_NOC_GRAY28 = 155
	Quantity_NOC_GRAY29 = 156
	Quantity_NOC_GRAY3 = 157
	Quantity_NOC_GRAY30 = 158
	Quantity_NOC_GRAY31 = 159
	Quantity_NOC_GRAY32 = 160
	Quantity_NOC_GRAY33 = 161
	Quantity_NOC_GRAY34 = 162
	Quantity_NOC_GRAY35 = 163
	Quantity_NOC_GRAY36 = 164
	Quantity_NOC_GRAY37 = 165
	Quantity_NOC_GRAY38 = 166
	Quantity_NOC_GRAY39 = 167
	Quantity_NOC_GRAY4 = 168
	Quantity_NOC_GRAY40 = 169
	Quantity_NOC_GRAY41 = 170
	Quantity_NOC_GRAY42 = 171
	Quantity_NOC_GRAY43 = 172
	Quantity_NOC_GRAY44 = 173
	Quantity_NOC_GRAY45 = 174
	Quantity_NOC_GRAY46 = 175
	Quantity_NOC_GRAY47 = 176
	Quantity_NOC_GRAY48 = 177
	Quantity_NOC_GRAY49 = 178
	Quantity_NOC_GRAY5 = 179
	Quantity_NOC_GRAY50 = 180
	Quantity_NOC_GRAY51 = 181
	Quantity_NOC_GRAY52 = 182
	Quantity_NOC_GRAY53 = 183
	Quantity_NOC_GRAY54 = 184
	Quantity_NOC_GRAY55 = 185
	Quantity_NOC_GRAY56 = 186
	Quantity_NOC_GRAY57 = 187
	Quantity_NOC_GRAY58 = 188
	Quantity_NOC_GRAY59 = 189
	Quantity_NOC_GRAY6 = 190
	Quantity_NOC_GRAY60 = 191
	Quantity_NOC_GRAY61 = 192
	Quantity_NOC_GRAY62 = 193
	Quantity_NOC_GRAY63 = 194
	Quantity_NOC_GRAY64 = 195
	Quantity_NOC_GRAY65 = 196
	Quantity_NOC_GRAY66 = 197
	Quantity_NOC_GRAY67 = 198
	Quantity_NOC_GRAY68 = 199
	Quantity_NOC_GRAY69 = 200
	Quantity_NOC_GRAY7 = 201
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
	Quantity_NOC_GRAY8 = 212
	Quantity_NOC_GRAY80 = 213
	Quantity_NOC_GRAY81 = 214
	Quantity_NOC_GRAY82 = 215
	Quantity_NOC_GRAY83 = 216
	Quantity_NOC_GRAY85 = 217
	Quantity_NOC_GRAY86 = 218
	Quantity_NOC_GRAY87 = 219
	Quantity_NOC_GRAY88 = 220
	Quantity_NOC_GRAY89 = 221
	Quantity_NOC_GRAY9 = 222
	Quantity_NOC_GRAY90 = 223
	Quantity_NOC_GRAY91 = 224
	Quantity_NOC_GRAY92 = 225
	Quantity_NOC_GRAY93 = 226
	Quantity_NOC_GRAY94 = 227
	Quantity_NOC_GRAY95 = 228
	Quantity_NOC_GREEN = 229
	Quantity_NOC_GREEN1 = 230
	Quantity_NOC_GREEN2 = 231
	Quantity_NOC_GREEN3 = 232
	Quantity_NOC_GREEN4 = 233
	Quantity_NOC_GREENYELLOW = 234
	Quantity_NOC_GRAY97 = 235
	Quantity_NOC_GRAY98 = 236
	Quantity_NOC_GRAY99 = 237
	Quantity_NOC_HONEYDEW = 238
	Quantity_NOC_HONEYDEW2 = 239
	Quantity_NOC_HONEYDEW3 = 240
	Quantity_NOC_HONEYDEW4 = 241
	Quantity_NOC_HOTPINK = 242
	Quantity_NOC_HOTPINK1 = 243
	Quantity_NOC_HOTPINK2 = 244
	Quantity_NOC_HOTPINK3 = 245
	Quantity_NOC_HOTPINK4 = 246
	Quantity_NOC_INDIANRED = 247
	Quantity_NOC_INDIANRED1 = 248
	Quantity_NOC_INDIANRED2 = 249
	Quantity_NOC_INDIANRED3 = 250
	Quantity_NOC_INDIANRED4 = 251
	Quantity_NOC_IVORY = 252
	Quantity_NOC_IVORY2 = 253
	Quantity_NOC_IVORY3 = 254
	Quantity_NOC_IVORY4 = 255
	Quantity_NOC_KHAKI = 256
	Quantity_NOC_KHAKI1 = 257
	Quantity_NOC_KHAKI2 = 258
	Quantity_NOC_KHAKI3 = 259
	Quantity_NOC_KHAKI4 = 260
	Quantity_NOC_LAVENDER = 261
	Quantity_NOC_LAVENDERBLUSH1 = 262
	Quantity_NOC_LAVENDERBLUSH2 = 263
	Quantity_NOC_LAVENDERBLUSH3 = 264
	Quantity_NOC_LAVENDERBLUSH4 = 265
	Quantity_NOC_LAWNGREEN = 266
	Quantity_NOC_LEMONCHIFFON1 = 267
	Quantity_NOC_LEMONCHIFFON2 = 268
	Quantity_NOC_LEMONCHIFFON3 = 269
	Quantity_NOC_LEMONCHIFFON4 = 270
	Quantity_NOC_LIGHTBLUE = 271
	Quantity_NOC_LIGHTBLUE1 = 272
	Quantity_NOC_LIGHTBLUE2 = 273
	Quantity_NOC_LIGHTBLUE3 = 274
	Quantity_NOC_LIGHTBLUE4 = 275
	Quantity_NOC_LIGHTCORAL = 276
	Quantity_NOC_LIGHTCYAN1 = 277
	Quantity_NOC_LIGHTCYAN2 = 278
	Quantity_NOC_LIGHTCYAN3 = 279
	Quantity_NOC_LIGHTCYAN4 = 280
	Quantity_NOC_LIGHTGOLDENROD = 281
	Quantity_NOC_LIGHTGOLDENROD1 = 282
	Quantity_NOC_LIGHTGOLDENROD2 = 283
	Quantity_NOC_LIGHTGOLDENROD3 = 284
	Quantity_NOC_LIGHTGOLDENROD4 = 285
	Quantity_NOC_LIGHTGOLDENRODYELLOW = 286
	Quantity_NOC_LIGHTGRAY = 287
	Quantity_NOC_LIGHTPINK = 288
	Quantity_NOC_LIGHTPINK1 = 289
	Quantity_NOC_LIGHTPINK2 = 290
	Quantity_NOC_LIGHTPINK3 = 291
	Quantity_NOC_LIGHTPINK4 = 292
	Quantity_NOC_LIGHTSALMON1 = 293
	Quantity_NOC_LIGHTSALMON2 = 294
	Quantity_NOC_LIGHTSALMON3 = 295
	Quantity_NOC_LIGHTSALMON4 = 296
	Quantity_NOC_LIGHTSEAGREEN = 297
	Quantity_NOC_LIGHTSKYBLUE = 298
	Quantity_NOC_LIGHTSKYBLUE1 = 299
	Quantity_NOC_LIGHTSKYBLUE2 = 300
	Quantity_NOC_LIGHTSKYBLUE3 = 301
	Quantity_NOC_LIGHTSKYBLUE4 = 302
	Quantity_NOC_LIGHTSLATEBLUE = 303
	Quantity_NOC_LIGHTSLATEGRAY = 304
	Quantity_NOC_LIGHTSTEELBLUE = 305
	Quantity_NOC_LIGHTSTEELBLUE1 = 306
	Quantity_NOC_LIGHTSTEELBLUE2 = 307
	Quantity_NOC_LIGHTSTEELBLUE3 = 308
	Quantity_NOC_LIGHTSTEELBLUE4 = 309
	Quantity_NOC_LIGHTYELLOW = 310
	Quantity_NOC_LIGHTYELLOW2 = 311
	Quantity_NOC_LIGHTYELLOW3 = 312
	Quantity_NOC_LIGHTYELLOW4 = 313
	Quantity_NOC_LIMEGREEN = 314
	Quantity_NOC_LINEN = 315
	Quantity_NOC_MAGENTA1 = 316
	Quantity_NOC_MAGENTA2 = 317
	Quantity_NOC_MAGENTA3 = 318
	Quantity_NOC_MAGENTA4 = 319
	Quantity_NOC_MAROON = 320
	Quantity_NOC_MAROON1 = 321
	Quantity_NOC_MAROON2 = 322
	Quantity_NOC_MAROON3 = 323
	Quantity_NOC_MAROON4 = 324
	Quantity_NOC_MEDIUMAQUAMARINE = 325
	Quantity_NOC_MEDIUMORCHID = 326
	Quantity_NOC_MEDIUMORCHID1 = 327
	Quantity_NOC_MEDIUMORCHID2 = 328
	Quantity_NOC_MEDIUMORCHID3 = 329
	Quantity_NOC_MEDIUMORCHID4 = 330
	Quantity_NOC_MEDIUMPURPLE = 331
	Quantity_NOC_MEDIUMPURPLE1 = 332
	Quantity_NOC_MEDIUMPURPLE2 = 333
	Quantity_NOC_MEDIUMPURPLE3 = 334
	Quantity_NOC_MEDIUMPURPLE4 = 335
	Quantity_NOC_MEDIUMSEAGREEN = 336
	Quantity_NOC_MEDIUMSLATEBLUE = 337
	Quantity_NOC_MEDIUMSPRINGGREEN = 338
	Quantity_NOC_MEDIUMTURQUOISE = 339
	Quantity_NOC_MEDIUMVIOLETRED = 340
	Quantity_NOC_MIDNIGHTBLUE = 341
	Quantity_NOC_MINTCREAM = 342
	Quantity_NOC_MISTYROSE = 343
	Quantity_NOC_MISTYROSE2 = 344
	Quantity_NOC_MISTYROSE3 = 345
	Quantity_NOC_MISTYROSE4 = 346
	Quantity_NOC_MOCCASIN = 347
	Quantity_NOC_NAVAJOWHITE1 = 348
	Quantity_NOC_NAVAJOWHITE2 = 349
	Quantity_NOC_NAVAJOWHITE3 = 350
	Quantity_NOC_NAVAJOWHITE4 = 351
	Quantity_NOC_NAVYBLUE = 352
	Quantity_NOC_OLDLACE = 353
	Quantity_NOC_OLIVEDRAB = 354
	Quantity_NOC_OLIVEDRAB1 = 355
	Quantity_NOC_OLIVEDRAB2 = 356
	Quantity_NOC_OLIVEDRAB3 = 357
	Quantity_NOC_OLIVEDRAB4 = 358
	Quantity_NOC_ORANGE = 359
	Quantity_NOC_ORANGE1 = 360
	Quantity_NOC_ORANGE2 = 361
	Quantity_NOC_ORANGE3 = 362
	Quantity_NOC_ORANGE4 = 363
	Quantity_NOC_ORANGERED = 364
	Quantity_NOC_ORANGERED1 = 365
	Quantity_NOC_ORANGERED2 = 366
	Quantity_NOC_ORANGERED3 = 367
	Quantity_NOC_ORANGERED4 = 368
	Quantity_NOC_ORCHID = 369
	Quantity_NOC_ORCHID1 = 370
	Quantity_NOC_ORCHID2 = 371
	Quantity_NOC_ORCHID3 = 372
	Quantity_NOC_ORCHID4 = 373
	Quantity_NOC_PALEGOLDENROD = 374
	Quantity_NOC_PALEGREEN = 375
	Quantity_NOC_PALEGREEN1 = 376
	Quantity_NOC_PALEGREEN2 = 377
	Quantity_NOC_PALEGREEN3 = 378
	Quantity_NOC_PALEGREEN4 = 379
	Quantity_NOC_PALETURQUOISE = 380
	Quantity_NOC_PALETURQUOISE1 = 381
	Quantity_NOC_PALETURQUOISE2 = 382
	Quantity_NOC_PALETURQUOISE3 = 383
	Quantity_NOC_PALETURQUOISE4 = 384
	Quantity_NOC_PALEVIOLETRED = 385
	Quantity_NOC_PALEVIOLETRED1 = 386
	Quantity_NOC_PALEVIOLETRED2 = 387
	Quantity_NOC_PALEVIOLETRED3 = 388
	Quantity_NOC_PALEVIOLETRED4 = 389
	Quantity_NOC_PAPAYAWHIP = 390
	Quantity_NOC_PEACHPUFF = 391
	Quantity_NOC_PEACHPUFF2 = 392
	Quantity_NOC_PEACHPUFF3 = 393
	Quantity_NOC_PEACHPUFF4 = 394
	Quantity_NOC_PERU = 395
	Quantity_NOC_PINK = 396
	Quantity_NOC_PINK1 = 397
	Quantity_NOC_PINK2 = 398
	Quantity_NOC_PINK3 = 399
	Quantity_NOC_PINK4 = 400
	Quantity_NOC_PLUM = 401
	Quantity_NOC_PLUM1 = 402
	Quantity_NOC_PLUM2 = 403
	Quantity_NOC_PLUM3 = 404
	Quantity_NOC_PLUM4 = 405
	Quantity_NOC_POWDERBLUE = 406
	Quantity_NOC_PURPLE = 407
	Quantity_NOC_PURPLE1 = 408
	Quantity_NOC_PURPLE2 = 409
	Quantity_NOC_PURPLE3 = 410
	Quantity_NOC_PURPLE4 = 411
	Quantity_NOC_RED = 412
	Quantity_NOC_RED1 = 413
	Quantity_NOC_RED2 = 414
	Quantity_NOC_RED3 = 415
	Quantity_NOC_RED4 = 416
	Quantity_NOC_ROSYBROWN = 417
	Quantity_NOC_ROSYBROWN1 = 418
	Quantity_NOC_ROSYBROWN2 = 419
	Quantity_NOC_ROSYBROWN3 = 420
	Quantity_NOC_ROSYBROWN4 = 421
	Quantity_NOC_ROYALBLUE = 422
	Quantity_NOC_ROYALBLUE1 = 423
	Quantity_NOC_ROYALBLUE2 = 424
	Quantity_NOC_ROYALBLUE3 = 425
	Quantity_NOC_ROYALBLUE4 = 426
	Quantity_NOC_SADDLEBROWN = 427
	Quantity_NOC_SALMON = 428
	Quantity_NOC_SALMON1 = 429
	Quantity_NOC_SALMON2 = 430
	Quantity_NOC_SALMON3 = 431
	Quantity_NOC_SALMON4 = 432
	Quantity_NOC_SANDYBROWN = 433
	Quantity_NOC_SEAGREEN = 434
	Quantity_NOC_SEAGREEN1 = 435
	Quantity_NOC_SEAGREEN2 = 436
	Quantity_NOC_SEAGREEN3 = 437
	Quantity_NOC_SEAGREEN4 = 438
	Quantity_NOC_SEASHELL = 439
	Quantity_NOC_SEASHELL2 = 440
	Quantity_NOC_SEASHELL3 = 441
	Quantity_NOC_SEASHELL4 = 442
	Quantity_NOC_BEET = 443
	Quantity_NOC_TEAL = 444
	Quantity_NOC_SIENNA = 445
	Quantity_NOC_SIENNA1 = 446
	Quantity_NOC_SIENNA2 = 447
	Quantity_NOC_SIENNA3 = 448
	Quantity_NOC_SIENNA4 = 449
	Quantity_NOC_SKYBLUE = 450
	Quantity_NOC_SKYBLUE1 = 451
	Quantity_NOC_SKYBLUE2 = 452
	Quantity_NOC_SKYBLUE3 = 453
	Quantity_NOC_SKYBLUE4 = 454
	Quantity_NOC_SLATEBLUE = 455
	Quantity_NOC_SLATEBLUE1 = 456
	Quantity_NOC_SLATEBLUE2 = 457
	Quantity_NOC_SLATEBLUE3 = 458
	Quantity_NOC_SLATEBLUE4 = 459
	Quantity_NOC_SLATEGRAY1 = 460
	Quantity_NOC_SLATEGRAY2 = 461
	Quantity_NOC_SLATEGRAY3 = 462
	Quantity_NOC_SLATEGRAY4 = 463
	Quantity_NOC_SLATEGRAY = 464
	Quantity_NOC_SNOW = 465
	Quantity_NOC_SNOW2 = 466
	Quantity_NOC_SNOW3 = 467
	Quantity_NOC_SNOW4 = 468
	Quantity_NOC_SPRINGGREEN = 469
	Quantity_NOC_SPRINGGREEN2 = 470
	Quantity_NOC_SPRINGGREEN3 = 471
	Quantity_NOC_SPRINGGREEN4 = 472
	Quantity_NOC_STEELBLUE = 473
	Quantity_NOC_STEELBLUE1 = 474
	Quantity_NOC_STEELBLUE2 = 475
	Quantity_NOC_STEELBLUE3 = 476
	Quantity_NOC_STEELBLUE4 = 477
	Quantity_NOC_TAN = 478
	Quantity_NOC_TAN1 = 479
	Quantity_NOC_TAN2 = 480
	Quantity_NOC_TAN3 = 481
	Quantity_NOC_TAN4 = 482
	Quantity_NOC_THISTLE = 483
	Quantity_NOC_THISTLE1 = 484
	Quantity_NOC_THISTLE2 = 485
	Quantity_NOC_THISTLE3 = 486
	Quantity_NOC_THISTLE4 = 487
	Quantity_NOC_TOMATO = 488
	Quantity_NOC_TOMATO1 = 489
	Quantity_NOC_TOMATO2 = 490
	Quantity_NOC_TOMATO3 = 491
	Quantity_NOC_TOMATO4 = 492
	Quantity_NOC_TURQUOISE = 493
	Quantity_NOC_TURQUOISE1 = 494
	Quantity_NOC_TURQUOISE2 = 495
	Quantity_NOC_TURQUOISE3 = 496
	Quantity_NOC_TURQUOISE4 = 497
	Quantity_NOC_VIOLET = 498
	Quantity_NOC_VIOLETRED = 499
	Quantity_NOC_VIOLETRED1 = 500
	Quantity_NOC_VIOLETRED2 = 501
	Quantity_NOC_VIOLETRED3 = 502
	Quantity_NOC_VIOLETRED4 = 503
	Quantity_NOC_WHEAT = 504
	Quantity_NOC_WHEAT1 = 505
	Quantity_NOC_WHEAT2 = 506
	Quantity_NOC_WHEAT3 = 507
	Quantity_NOC_WHEAT4 = 508
	Quantity_NOC_WHITESMOKE = 509
	Quantity_NOC_YELLOW = 510
	Quantity_NOC_YELLOW1 = 511
	Quantity_NOC_YELLOW2 = 512
	Quantity_NOC_YELLOW3 = 513
	Quantity_NOC_YELLOW4 = 514
	Quantity_NOC_YELLOWGREEN = 515
	Quantity_NOC_WHITE = 516
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
Quantity_NOC_GRAY2 = Quantity_NameOfColor.Quantity_NOC_GRAY2
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
Quantity_NOC_GRAY3 = Quantity_NameOfColor.Quantity_NOC_GRAY3
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
Quantity_NOC_GRAY4 = Quantity_NameOfColor.Quantity_NOC_GRAY4
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
Quantity_NOC_GRAY5 = Quantity_NameOfColor.Quantity_NOC_GRAY5
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
Quantity_NOC_GRAY6 = Quantity_NameOfColor.Quantity_NOC_GRAY6
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
Quantity_NOC_GRAY7 = Quantity_NameOfColor.Quantity_NOC_GRAY7
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
Quantity_NOC_GRAY8 = Quantity_NameOfColor.Quantity_NOC_GRAY8
Quantity_NOC_GRAY80 = Quantity_NameOfColor.Quantity_NOC_GRAY80
Quantity_NOC_GRAY81 = Quantity_NameOfColor.Quantity_NOC_GRAY81
Quantity_NOC_GRAY82 = Quantity_NameOfColor.Quantity_NOC_GRAY82
Quantity_NOC_GRAY83 = Quantity_NameOfColor.Quantity_NOC_GRAY83
Quantity_NOC_GRAY85 = Quantity_NameOfColor.Quantity_NOC_GRAY85
Quantity_NOC_GRAY86 = Quantity_NameOfColor.Quantity_NOC_GRAY86
Quantity_NOC_GRAY87 = Quantity_NameOfColor.Quantity_NOC_GRAY87
Quantity_NOC_GRAY88 = Quantity_NameOfColor.Quantity_NOC_GRAY88
Quantity_NOC_GRAY89 = Quantity_NameOfColor.Quantity_NOC_GRAY89
Quantity_NOC_GRAY9 = Quantity_NameOfColor.Quantity_NOC_GRAY9
Quantity_NOC_GRAY90 = Quantity_NameOfColor.Quantity_NOC_GRAY90
Quantity_NOC_GRAY91 = Quantity_NameOfColor.Quantity_NOC_GRAY91
Quantity_NOC_GRAY92 = Quantity_NameOfColor.Quantity_NOC_GRAY92
Quantity_NOC_GRAY93 = Quantity_NameOfColor.Quantity_NOC_GRAY93
Quantity_NOC_GRAY94 = Quantity_NameOfColor.Quantity_NOC_GRAY94
Quantity_NOC_GRAY95 = Quantity_NameOfColor.Quantity_NOC_GRAY95
Quantity_NOC_GREEN = Quantity_NameOfColor.Quantity_NOC_GREEN
Quantity_NOC_GREEN1 = Quantity_NameOfColor.Quantity_NOC_GREEN1
Quantity_NOC_GREEN2 = Quantity_NameOfColor.Quantity_NOC_GREEN2
Quantity_NOC_GREEN3 = Quantity_NameOfColor.Quantity_NOC_GREEN3
Quantity_NOC_GREEN4 = Quantity_NameOfColor.Quantity_NOC_GREEN4
Quantity_NOC_GREENYELLOW = Quantity_NameOfColor.Quantity_NOC_GREENYELLOW
Quantity_NOC_GRAY97 = Quantity_NameOfColor.Quantity_NOC_GRAY97
Quantity_NOC_GRAY98 = Quantity_NameOfColor.Quantity_NOC_GRAY98
Quantity_NOC_GRAY99 = Quantity_NameOfColor.Quantity_NOC_GRAY99
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
	Quantity_TOC_HLS = 1
Quantity_TOC_RGB = Quantity_TypeOfColor.Quantity_TOC_RGB
Quantity_TOC_HLS = Quantity_TypeOfColor.Quantity_TOC_HLS

class Quantity_PhysicalQuantity(IntEnum):
	Quantity_MASS = 0
	Quantity_PLANEANGLE = 1
	Quantity_SOLIDANGLE = 2
	Quantity_LENGTH = 3
	Quantity_AREA = 4
	Quantity_VOLUME = 5
	Quantity_SPEED = 6
	Quantity_VELOCITY = 7
	Quantity_ACCELERATION = 8
	Quantity_ANGULARVELOCITY = 9
	Quantity_FREQUENCY = 10
	Quantity_TEMPERATURE = 11
	Quantity_AMOUNTOFSUBSTANCE = 12
	Quantity_DENSITY = 13
	Quantity_MASSFLOW = 14
	Quantity_VOLUMEFLOW = 15
	Quantity_CONSUMPTION = 16
	Quantity_MOMENTUM = 17
	Quantity_KINETICMOMENT = 18
	Quantity_MOMENTOFINERTIA = 19
	Quantity_FORCE = 20
	Quantity_MOMENTOFAFORCE = 21
	Quantity_TORQUE = 22
	Quantity_WEIGHT = 23
	Quantity_PRESSURE = 24
	Quantity_VISCOSITY = 25
	Quantity_KINEMATICVISCOSITY = 26
	Quantity_ENERGY = 27
	Quantity_WORK = 28
	Quantity_POWER = 29
	Quantity_SURFACETENSION = 30
	Quantity_COEFFICIENTOFEXPANSION = 31
	Quantity_THERMALCONDUCTIVITY = 32
	Quantity_SPECIFICHEATCAPACITY = 33
	Quantity_ENTROPY = 34
	Quantity_ENTHALPY = 35
	Quantity_LUMINOUSINTENSITY = 36
	Quantity_LUMINOUSFLUX = 37
	Quantity_LUMINANCE = 38
	Quantity_ILLUMINANCE = 39
	Quantity_LUMINOUSEXPOSITION = 40
	Quantity_LUMINOUSEFFICACITY = 41
	Quantity_ELECTRICCHARGE = 42
	Quantity_ELECTRICCURRENT = 43
	Quantity_ELECTRICFIELDSTRENGTH = 44
	Quantity_ELECTRICPOTENTIAL = 45
	Quantity_ELECTRICCAPACITANCE = 46
	Quantity_MAGNETICFLUX = 47
	Quantity_MAGNETICFLUXDENSITY = 48
	Quantity_MAGNETICFIELDSTRENGTH = 49
	Quantity_RELUCTANCE = 50
	Quantity_RESISTANCE = 51
	Quantity_INDUCTANCE = 52
	Quantity_CAPACITANCE = 53
	Quantity_IMPEDANCE = 54
	Quantity_ADMITTANCE = 55
	Quantity_RESISTIVITY = 56
	Quantity_CONDUCTIVITY = 57
	Quantity_MOLARMASS = 58
	Quantity_MOLARVOLUME = 59
	Quantity_CONCENTRATION = 60
	Quantity_MOLARCONCENTRATION = 61
	Quantity_MOLARITY = 62
	Quantity_SOUNDINTENSITY = 63
	Quantity_ACOUSTICINTENSITY = 64
	Quantity_ACTIVITY = 65
	Quantity_ABSORBEDDOSE = 66
	Quantity_DOSEEQUIVALENT = 67
Quantity_MASS = Quantity_PhysicalQuantity.Quantity_MASS
Quantity_PLANEANGLE = Quantity_PhysicalQuantity.Quantity_PLANEANGLE
Quantity_SOLIDANGLE = Quantity_PhysicalQuantity.Quantity_SOLIDANGLE
Quantity_LENGTH = Quantity_PhysicalQuantity.Quantity_LENGTH
Quantity_AREA = Quantity_PhysicalQuantity.Quantity_AREA
Quantity_VOLUME = Quantity_PhysicalQuantity.Quantity_VOLUME
Quantity_SPEED = Quantity_PhysicalQuantity.Quantity_SPEED
Quantity_VELOCITY = Quantity_PhysicalQuantity.Quantity_VELOCITY
Quantity_ACCELERATION = Quantity_PhysicalQuantity.Quantity_ACCELERATION
Quantity_ANGULARVELOCITY = Quantity_PhysicalQuantity.Quantity_ANGULARVELOCITY
Quantity_FREQUENCY = Quantity_PhysicalQuantity.Quantity_FREQUENCY
Quantity_TEMPERATURE = Quantity_PhysicalQuantity.Quantity_TEMPERATURE
Quantity_AMOUNTOFSUBSTANCE = Quantity_PhysicalQuantity.Quantity_AMOUNTOFSUBSTANCE
Quantity_DENSITY = Quantity_PhysicalQuantity.Quantity_DENSITY
Quantity_MASSFLOW = Quantity_PhysicalQuantity.Quantity_MASSFLOW
Quantity_VOLUMEFLOW = Quantity_PhysicalQuantity.Quantity_VOLUMEFLOW
Quantity_CONSUMPTION = Quantity_PhysicalQuantity.Quantity_CONSUMPTION
Quantity_MOMENTUM = Quantity_PhysicalQuantity.Quantity_MOMENTUM
Quantity_KINETICMOMENT = Quantity_PhysicalQuantity.Quantity_KINETICMOMENT
Quantity_MOMENTOFINERTIA = Quantity_PhysicalQuantity.Quantity_MOMENTOFINERTIA
Quantity_FORCE = Quantity_PhysicalQuantity.Quantity_FORCE
Quantity_MOMENTOFAFORCE = Quantity_PhysicalQuantity.Quantity_MOMENTOFAFORCE
Quantity_TORQUE = Quantity_PhysicalQuantity.Quantity_TORQUE
Quantity_WEIGHT = Quantity_PhysicalQuantity.Quantity_WEIGHT
Quantity_PRESSURE = Quantity_PhysicalQuantity.Quantity_PRESSURE
Quantity_VISCOSITY = Quantity_PhysicalQuantity.Quantity_VISCOSITY
Quantity_KINEMATICVISCOSITY = Quantity_PhysicalQuantity.Quantity_KINEMATICVISCOSITY
Quantity_ENERGY = Quantity_PhysicalQuantity.Quantity_ENERGY
Quantity_WORK = Quantity_PhysicalQuantity.Quantity_WORK
Quantity_POWER = Quantity_PhysicalQuantity.Quantity_POWER
Quantity_SURFACETENSION = Quantity_PhysicalQuantity.Quantity_SURFACETENSION
Quantity_COEFFICIENTOFEXPANSION = Quantity_PhysicalQuantity.Quantity_COEFFICIENTOFEXPANSION
Quantity_THERMALCONDUCTIVITY = Quantity_PhysicalQuantity.Quantity_THERMALCONDUCTIVITY
Quantity_SPECIFICHEATCAPACITY = Quantity_PhysicalQuantity.Quantity_SPECIFICHEATCAPACITY
Quantity_ENTROPY = Quantity_PhysicalQuantity.Quantity_ENTROPY
Quantity_ENTHALPY = Quantity_PhysicalQuantity.Quantity_ENTHALPY
Quantity_LUMINOUSINTENSITY = Quantity_PhysicalQuantity.Quantity_LUMINOUSINTENSITY
Quantity_LUMINOUSFLUX = Quantity_PhysicalQuantity.Quantity_LUMINOUSFLUX
Quantity_LUMINANCE = Quantity_PhysicalQuantity.Quantity_LUMINANCE
Quantity_ILLUMINANCE = Quantity_PhysicalQuantity.Quantity_ILLUMINANCE
Quantity_LUMINOUSEXPOSITION = Quantity_PhysicalQuantity.Quantity_LUMINOUSEXPOSITION
Quantity_LUMINOUSEFFICACITY = Quantity_PhysicalQuantity.Quantity_LUMINOUSEFFICACITY
Quantity_ELECTRICCHARGE = Quantity_PhysicalQuantity.Quantity_ELECTRICCHARGE
Quantity_ELECTRICCURRENT = Quantity_PhysicalQuantity.Quantity_ELECTRICCURRENT
Quantity_ELECTRICFIELDSTRENGTH = Quantity_PhysicalQuantity.Quantity_ELECTRICFIELDSTRENGTH
Quantity_ELECTRICPOTENTIAL = Quantity_PhysicalQuantity.Quantity_ELECTRICPOTENTIAL
Quantity_ELECTRICCAPACITANCE = Quantity_PhysicalQuantity.Quantity_ELECTRICCAPACITANCE
Quantity_MAGNETICFLUX = Quantity_PhysicalQuantity.Quantity_MAGNETICFLUX
Quantity_MAGNETICFLUXDENSITY = Quantity_PhysicalQuantity.Quantity_MAGNETICFLUXDENSITY
Quantity_MAGNETICFIELDSTRENGTH = Quantity_PhysicalQuantity.Quantity_MAGNETICFIELDSTRENGTH
Quantity_RELUCTANCE = Quantity_PhysicalQuantity.Quantity_RELUCTANCE
Quantity_RESISTANCE = Quantity_PhysicalQuantity.Quantity_RESISTANCE
Quantity_INDUCTANCE = Quantity_PhysicalQuantity.Quantity_INDUCTANCE
Quantity_CAPACITANCE = Quantity_PhysicalQuantity.Quantity_CAPACITANCE
Quantity_IMPEDANCE = Quantity_PhysicalQuantity.Quantity_IMPEDANCE
Quantity_ADMITTANCE = Quantity_PhysicalQuantity.Quantity_ADMITTANCE
Quantity_RESISTIVITY = Quantity_PhysicalQuantity.Quantity_RESISTIVITY
Quantity_CONDUCTIVITY = Quantity_PhysicalQuantity.Quantity_CONDUCTIVITY
Quantity_MOLARMASS = Quantity_PhysicalQuantity.Quantity_MOLARMASS
Quantity_MOLARVOLUME = Quantity_PhysicalQuantity.Quantity_MOLARVOLUME
Quantity_CONCENTRATION = Quantity_PhysicalQuantity.Quantity_CONCENTRATION
Quantity_MOLARCONCENTRATION = Quantity_PhysicalQuantity.Quantity_MOLARCONCENTRATION
Quantity_MOLARITY = Quantity_PhysicalQuantity.Quantity_MOLARITY
Quantity_SOUNDINTENSITY = Quantity_PhysicalQuantity.Quantity_SOUNDINTENSITY
Quantity_ACOUSTICINTENSITY = Quantity_PhysicalQuantity.Quantity_ACOUSTICINTENSITY
Quantity_ACTIVITY = Quantity_PhysicalQuantity.Quantity_ACTIVITY
Quantity_ABSORBEDDOSE = Quantity_PhysicalQuantity.Quantity_ABSORBEDDOSE
Quantity_DOSEEQUIVALENT = Quantity_PhysicalQuantity.Quantity_DOSEEQUIVALENT
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Quantity_HArray1OfColor)
/* end handles declaration */

/* templates */
%template(Quantity_Array1OfColor) NCollection_Array1<Quantity_Color>;

%extend NCollection_Array1<Quantity_Color> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Quantity_Array2OfColor) NCollection_Array2<Quantity_Color>;
/* end templates declaration */

/* typedefs */
typedef Standard_Real Quantity_AbsorbedDose;
typedef Standard_Real Quantity_Acceleration;
typedef Standard_Real Quantity_AcousticIntensity;
typedef Standard_Real Quantity_Activity;
typedef Standard_Real Quantity_Admittance;
typedef Standard_Real Quantity_AmountOfSubstance;
typedef Standard_Real Quantity_AngularVelocity;
typedef Standard_Real Quantity_Area;
typedef NCollection_Array1<Quantity_Color> Quantity_Array1OfColor;
typedef NCollection_Array2<Quantity_Color> Quantity_Array2OfColor;
typedef Standard_Real Quantity_Capacitance;
typedef Standard_Real Quantity_Coefficient;
typedef Standard_Real Quantity_CoefficientOfExpansion;
typedef Standard_Real Quantity_Concentration;
typedef Standard_Real Quantity_Conductivity;
typedef Standard_Real Quantity_Constant;
typedef Standard_Real Quantity_Consumption;
typedef Standard_Real Quantity_Content;
typedef Standard_Real Quantity_Density;
typedef Standard_Real Quantity_DoseEquivalent;
typedef Standard_Real Quantity_ElectricCapacitance;
typedef Standard_Real Quantity_ElectricCharge;
typedef Standard_Real Quantity_ElectricCurrent;
typedef Standard_Real Quantity_ElectricFieldStrength;
typedef Standard_Real Quantity_ElectricPotential;
typedef Standard_Real Quantity_Energy;
typedef Standard_Real Quantity_Enthalpy;
typedef Standard_Real Quantity_Entropy;
typedef Standard_Real Quantity_Factor;
typedef Standard_Real Quantity_Force;
typedef Standard_Real Quantity_Frequency;
typedef Standard_Real Quantity_Illuminance;
typedef Standard_Real Quantity_Impedance;
typedef Standard_Real Quantity_Index;
typedef Standard_Real Quantity_Inductance;
typedef Standard_Real Quantity_KinematicViscosity;
typedef Standard_Real Quantity_KineticMoment;
typedef Standard_Real Quantity_Length;
typedef Standard_Real Quantity_Luminance;
typedef Standard_Real Quantity_LuminousEfficacity;
typedef Standard_Real Quantity_LuminousExposition;
typedef Standard_Real Quantity_LuminousFlux;
typedef Standard_Real Quantity_LuminousIntensity;
typedef Standard_Real Quantity_MagneticFieldStrength;
typedef Standard_Real Quantity_MagneticFlux;
typedef Standard_Real Quantity_MagneticFluxDensity;
typedef Standard_Real Quantity_Mass;
typedef Standard_Real Quantity_MassFlow;
typedef Standard_Real Quantity_MolarConcentration;
typedef Standard_Real Quantity_MolarMass;
typedef Standard_Real Quantity_MolarVolume;
typedef Standard_Real Quantity_Molarity;
typedef Standard_Real Quantity_MomentOfAForce;
typedef Standard_Real Quantity_MomentOfInertia;
typedef Standard_Real Quantity_Momentum;
typedef Standard_Real Quantity_Normality;
typedef Standard_Real Quantity_Parameter;
typedef Standard_Real Quantity_PlaneAngle;
typedef Standard_Real Quantity_Power;
typedef Standard_Real Quantity_Pressure;
typedef Standard_Real Quantity_Quotient;
typedef Standard_Real Quantity_Rate;
typedef Standard_Real Quantity_Ratio;
typedef Standard_Real Quantity_Reluctance;
typedef Standard_Real Quantity_Resistance;
typedef Standard_Real Quantity_Resistivity;
typedef Standard_Real Quantity_Scalaire;
typedef Standard_Real Quantity_SolidAngle;
typedef Standard_Real Quantity_SoundIntensity;
typedef Standard_Real Quantity_SpecificHeatCapacity;
typedef Standard_Real Quantity_Speed;
typedef Standard_Real Quantity_SurfaceTension;
typedef Standard_Real Quantity_Temperature;
typedef Standard_Real Quantity_ThermalConductivity;
typedef Standard_Real Quantity_Torque;
typedef Standard_Real Quantity_Velocity;
typedef Standard_Real Quantity_Viscosity;
typedef Standard_Real Quantity_Volume;
typedef Standard_Real Quantity_VolumeFlow;
typedef Standard_Real Quantity_Weight;
typedef Standard_Real Quantity_Work;
/* end typedefs declaration */

/***********************
* class Quantity_Color *
***********************/
class Quantity_Color {
	public:
		/****************** Quantity_Color ******************/
		/**** md5 signature: f5c209f4d44b927ac7bf1775a9844c4f ****/
		%feature("compactdefaultargs") Quantity_Color;
		%feature("autodoc", "Creates quantity_noc_yellow color.

Returns
-------
None
") Quantity_Color;
		 Quantity_Color();

		/****************** Quantity_Color ******************/
		/**** md5 signature: 4d0575f62c5a31e3c97c1999086879b2 ****/
		%feature("compactdefaultargs") Quantity_Color;
		%feature("autodoc", "Creates the color from enumeration value.

Parameters
----------
AName: Quantity_NameOfColor

Returns
-------
None
") Quantity_Color;
		 Quantity_Color(const Quantity_NameOfColor AName);

		/****************** Quantity_Color ******************/
		/**** md5 signature: 401f2b53fbd4b1b72f42fdb5e22554a6 ****/
		%feature("compactdefaultargs") Quantity_Color;
		%feature("autodoc", "Creates a color according to the definition system thetype. quantity_toc_rgb: - ther1 the value of red within range [0.0; 1.0] - ther2 the value of green within range [0.0; 1.0] - ther3 the value of blue within range [0.0; 1.0] //! quantity_toc_hls: - ther1 is the hue (h) angle in degrees within range [0.0; 360.0], 0.0 being red. value -1.0 is a special value reserved for grayscale color (s should be 0.0). - ther2 is the lightness (l) within range [0.0; 1.0] - ther3 is the saturation (s) within range [0.0; 1.0].

Parameters
----------
theR1: float
theR2: float
theR3: float
theType: Quantity_TypeOfColor

Returns
-------
None
") Quantity_Color;
		 Quantity_Color(const Standard_Real theR1, const Standard_Real theR2, const Standard_Real theR3, const Quantity_TypeOfColor theType);

		/****************** Quantity_Color ******************/
		/**** md5 signature: 835816f393d027a4564b61805ac875a4 ****/
		%feature("compactdefaultargs") Quantity_Color;
		%feature("autodoc", "Define color from rgb values.

Parameters
----------
theRgb: NCollection_Vec3<float>

Returns
-------
None
") Quantity_Color;
		 Quantity_Color(const NCollection_Vec3<float> & theRgb);

		/****************** Argb2color ******************/
		/**** md5 signature: d611989bc196b9eace2cf55dd7e3b12b ****/
		%feature("compactdefaultargs") Argb2color;
		%feature("autodoc", "Convert integer argb value to color. alpha bits are ignored.

Parameters
----------
theARGB: int
theColor: Quantity_Color

Returns
-------
None
") Argb2color;
		static void Argb2color(const Standard_Integer theARGB, Quantity_Color & theColor);

		/****************** Blue ******************/
		/**** md5 signature: 4771e446272835844a2885353fcdb8a9 ****/
		%feature("compactdefaultargs") Blue;
		%feature("autodoc", "Returns the blue component (quantity of blue) of the color within range [0.0; 1.0].

Returns
-------
float
") Blue;
		Standard_Real Blue();

		/****************** ChangeContrast ******************/
		/**** md5 signature: 5e22a8be68499bb6494ff16698899d8e ****/
		%feature("compactdefaultargs") ChangeContrast;
		%feature("autodoc", "Increases or decreases the contrast by <adelta>. <adelta> is a percentage. any value greater than zero will increase the contrast. the variation is expressed as a percentage of the current value. it is a variation of the saturation.

Parameters
----------
ADelta: float

Returns
-------
None
") ChangeContrast;
		void ChangeContrast(const Standard_Real ADelta);

		/****************** ChangeIntensity ******************/
		/**** md5 signature: 55083a7cc56cf85f230d7f99a0573614 ****/
		%feature("compactdefaultargs") ChangeIntensity;
		%feature("autodoc", "Increases or decreases the intensity by <adelta>. <adelta> is a percentage. any value greater than zero will increase the intensity. the variation is expressed as a percentage of the current value. it is a variation of the lightness.

Parameters
----------
ADelta: float

Returns
-------
None
") ChangeIntensity;
		void ChangeIntensity(const Standard_Real ADelta);

		/****************** Color2argb ******************/
		/**** md5 signature: b5590b8f95cab902628e196486ec17c3 ****/
		%feature("compactdefaultargs") Color2argb;
		%feature("autodoc", "Convert the color value to argb integer value. theargb has alpha equal to zero, so the output is formatted as 0x00rrggbb.

Parameters
----------
theColor: Quantity_Color

Returns
-------
theARGB: int
") Color2argb;
		static void Color2argb(const Quantity_Color & theColor, Standard_Integer &OutValue);

		/****************** ColorFromHex ******************/
		/**** md5 signature: cf1c58e7652e94fdb05ddd8062f56f58 ****/
		%feature("compactdefaultargs") ColorFromHex;
		%feature("autodoc", "Parses the string as a hex color (like '#ff0' for short rgb color, or '#ffff00' for rgb color) @param thehexcolorstring the string to be parsed @param thecolor a color that is a result of parsing returns true if parsing was successful, or false otherwise.

Parameters
----------
theHexColorString: char *
theColor: Quantity_Color

Returns
-------
bool
") ColorFromHex;
		static bool ColorFromHex(const char * theHexColorString, Quantity_Color & theColor);

		/****************** ColorFromName ******************/
		/**** md5 signature: 52336467154f50ffb70349ec504d092e ****/
		%feature("compactdefaultargs") ColorFromName;
		%feature("autodoc", "Finds color from predefined names. for example, the name of the color which corresponds to 'black' is quantity_noc_black. returns false if name is unknown.

Parameters
----------
theName: char *
theColor: Quantity_NameOfColor

Returns
-------
bool
") ColorFromName;
		static Standard_Boolean ColorFromName(const char * theName, Quantity_NameOfColor & theColor);

		/****************** ColorFromName ******************/
		/**** md5 signature: 22de797bd27b14fa445f1fc6383d0e84 ****/
		%feature("compactdefaultargs") ColorFromName;
		%feature("autodoc", "Finds color from predefined names. for example, the name of the color which corresponds to 'black' is quantity_noc_black. returns false if name is unknown. @param thecolornamestring the color name @param thecolor a found color returns false if the color name is unknown, or true if the search by color name was successful.

Parameters
----------
theColorNameString: char *
theColor: Quantity_Color

Returns
-------
bool
") ColorFromName;
		static Standard_Boolean ColorFromName(const char * theColorNameString, Quantity_Color & theColor);

		/****************** ColorToHex ******************/
		/**** md5 signature: bca5c2e992e444dd039bba70d7834eaf ****/
		%feature("compactdefaultargs") ColorToHex;
		%feature("autodoc", "Returns hex srgb string in format '#ffaaff'.

Parameters
----------
theColor: Quantity_Color
theToPrefixHash: bool,optional
	default value is true

Returns
-------
TCollection_AsciiString
") ColorToHex;
		static TCollection_AsciiString ColorToHex(const Quantity_Color & theColor, const bool theToPrefixHash = true);

		/****************** Delta ******************/
		/**** md5 signature: dc33dc66508989719716ce6762bd0925 ****/
		%feature("compactdefaultargs") Delta;
		%feature("autodoc", "Returns the percentage change of contrast and intensity between <self> and <acolor>. <dc> and <di> are percentages, either positive or negative. the calculation is with respect to the current value of <self> if <dc> is positive then <self> is more contrasty. if <di> is positive then <self> is more intense.

Parameters
----------
AColor: Quantity_Color

Returns
-------
DC: float
DI: float
") Delta;
		void Delta(const Quantity_Color & AColor, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Distance ******************/
		/**** md5 signature: 68385c1ebe94c26d97b2af2a1c48854b ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distance between two colours. it's a value between 0 and the square root of 3 (the black/white distance).

Parameters
----------
AColor: Quantity_Color

Returns
-------
float
") Distance;
		Standard_Real Distance(const Quantity_Color & AColor);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** Epsilon ******************/
		/**** md5 signature: 67863b45c70903f3df8806ec9bb0512a ****/
		%feature("compactdefaultargs") Epsilon;
		%feature("autodoc", "Returns the specified value used to compare <self> and an other color in isdifferent and in isequal methods.

Returns
-------
float
") Epsilon;
		static Standard_Real Epsilon();

		/****************** Green ******************/
		/**** md5 signature: 3857670a16bf31e5b3300ec575b3b216 ****/
		%feature("compactdefaultargs") Green;
		%feature("autodoc", "Returns the green component (quantity of green) of the color within range [0.0; 1.0].

Returns
-------
float
") Green;
		Standard_Real Green();

		/****************** HlsRgb ******************/
		/**** md5 signature: 92189fe5c2c27b89f1a448ea8893e8be ****/
		%feature("compactdefaultargs") HlsRgb;
		%feature("autodoc", "Converts hls components into rgb ones.

Parameters
----------
H: float
L: float
S: float

Returns
-------
R: float
G: float
B: float
") HlsRgb;
		static void HlsRgb(const Standard_Real H, const Standard_Real L, const Standard_Real S, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Hue ******************/
		/**** md5 signature: a02b54936ad6d62636d67739ec91e04f ****/
		%feature("compactdefaultargs") Hue;
		%feature("autodoc", "Returns the hue component (hue angle) of the color in degrees within range [0.0; 360.0], 0.0 being red. -1.0 is a special value reserved for grayscale color (s should be 0.0).

Returns
-------
float
") Hue;
		Standard_Real Hue();

		/****************** IsDifferent ******************/
		/**** md5 signature: b99f5c524426499e6ab1d3876aaa32a8 ****/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "Returns standard_true if the distance between <self> and <other> is greater than epsilon ().

Parameters
----------
Other: Quantity_Color

Returns
-------
bool
") IsDifferent;
		Standard_Boolean IsDifferent(const Quantity_Color & Other);

		/****************** IsEqual ******************/
		/**** md5 signature: bd3a4ca19f4acdf78c62adc39d7350e2 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the other color is - different from, or - equal to this color. two colors are considered to be equal if their distance is no greater than epsilon(). these methods are aliases of operator != and operator ==.

Parameters
----------
Other: Quantity_Color

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const Quantity_Color & Other);

		/****************** Light ******************/
		/**** md5 signature: 245b383c2d9d02d69d1375d652800d97 ****/
		%feature("compactdefaultargs") Light;
		%feature("autodoc", "Returns the light component (value of the lightness) of the color within range [0.0; 1.0].

Returns
-------
float
") Light;
		Standard_Real Light();

		/****************** Name ******************/
		/**** md5 signature: d49ea227fff1359b6ccda02d482f1a1c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of the color defined by its quantities of red r, green g and blue b; more precisely this is the nearest color from the quantity_nameofcolor enumeration. exceptions standard_outofrange if r, g or b is less than 0. or greater than 1.

Returns
-------
Quantity_NameOfColor
") Name;
		Quantity_NameOfColor Name();

		/****************** Name ******************/
		/**** md5 signature: bb33171b41501dac337433bfd7a55395 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of the colour for which the rgb components are nearest to <r>, <g> and <b>.

Parameters
----------
R: float
G: float
B: float

Returns
-------
Quantity_NameOfColor
") Name;
		static Quantity_NameOfColor Name(const Standard_Real R, const Standard_Real G, const Standard_Real B);

		/****************** Red ******************/
		/**** md5 signature: 0afa693a7d24010fd8ce065be2035322 ****/
		%feature("compactdefaultargs") Red;
		%feature("autodoc", "Returns the red component (quantity of red) of the color within range [0.0; 1.0].

Returns
-------
float
") Red;
		Standard_Real Red();

		/****************** RgbHls ******************/
		/**** md5 signature: 15add06275baea2eca31ebbe5b267721 ****/
		%feature("compactdefaultargs") RgbHls;
		%feature("autodoc", "Converts rgb components into hls ones.

Parameters
----------
R: float
G: float
B: float

Returns
-------
H: float
L: float
S: float
") RgbHls;
		static void RgbHls(const Standard_Real R, const Standard_Real G, const Standard_Real B, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Saturation ******************/
		/**** md5 signature: 747824b2fc2142cfe3c7ee7950129f3d ****/
		%feature("compactdefaultargs") Saturation;
		%feature("autodoc", "Returns the saturation component (value of the saturation) of the color within range [0.0; 1.0].

Returns
-------
float
") Saturation;
		Standard_Real Saturation();

		/****************** SetEpsilon ******************/
		/**** md5 signature: 22c8a4122adae5e07b77464a5cf22523 ****/
		%feature("compactdefaultargs") SetEpsilon;
		%feature("autodoc", "Sets the specified value used to compare <self> and an other color in isdifferent and in isequal methods. warning: the default value is 0.0001.

Parameters
----------
AnEpsilon: float

Returns
-------
None
") SetEpsilon;
		static void SetEpsilon(const Standard_Real AnEpsilon);

		/****************** SetValues ******************/
		/**** md5 signature: 476e1fb37d7bef1bf4f57b9156d165e7 ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Updates the colour <self> from the definition of the colour <aname>.

Parameters
----------
AName: Quantity_NameOfColor

Returns
-------
None
") SetValues;
		void SetValues(const Quantity_NameOfColor AName);

		/****************** SetValues ******************/
		/**** md5 signature: 40a5146f92fc1b9e2c94d344d3adcdd4 ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Updates a color according to the mode specified by thetype. quantity_toc_rgb: - ther1 the value of red within range [0.0; 1.0] - ther2 the value of green within range [0.0; 1.0] - ther3 the value of blue within range [0.0; 1.0] //! quantity_toc_hls: - ther1 is the hue (h) angle in degrees within range [0.0; 360.0], 0.0 being red. -1.0 is a special value reserved for grayscale color (s should be 0.0). - ther2 is the lightness (l) within range [0.0; 1.0] - ther3 is the saturation (s) within range [0.0; 1.0].

Parameters
----------
theR1: float
theR2: float
theR3: float
theType: Quantity_TypeOfColor

Returns
-------
None
") SetValues;
		void SetValues(const Standard_Real theR1, const Standard_Real theR2, const Standard_Real theR3, const Quantity_TypeOfColor theType);

		/****************** SquareDistance ******************/
		/**** md5 signature: 98b5f279d4d304157693644e9a73823a ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the square of distance between two colours.

Parameters
----------
AColor: Quantity_Color

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Quantity_Color & AColor);

		/****************** StringName ******************/
		/**** md5 signature: 2a518c52a5a4cb1c4f1cc420b4f6d199 ****/
		%feature("compactdefaultargs") StringName;
		%feature("autodoc", "Returns the name of the color identified by aname in the quantity_nameofcolor enumeration. for example, the name of the color which corresponds to quantity_noc_black is 'black'. exceptions standard_outofrange if aname in not known in the quantity_nameofcolor enumeration.

Parameters
----------
AColor: Quantity_NameOfColor

Returns
-------
char *
") StringName;
		static const char * StringName(const Quantity_NameOfColor AColor);

		/****************** Test ******************/
		/**** md5 signature: ae4e459a4b4af36590706ec67f676d7b ****/
		%feature("compactdefaultargs") Test;
		%feature("autodoc", "Internal test.

Returns
-------
None
") Test;
		static void Test();

		/****************** Values ******************/
		/**** md5 signature: edaefe1997c63fed76a7fec2d901c8e5 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns in ther1, ther2 and ther3 the components of this color according to the color system definition thetype. if thetype is quantity_toc_rgb: - ther1 the value of red between 0.0 and 1.0 - ther2 the value of green between 0.0 and 1.0 - ther3 the value of blue between 0.0 and 1.0 if thetype is quantity_toc_hls: - ther1 is the hue (h) angle in degrees within range [0.0; 360.0], 0.0 being red. -1.0 is a special value reserved for grayscale color (s should be 0.0). - ther2 is the lightness (l) within range [0.0; 1.0] - ther3 is the saturation (s) within range [0.0; 1.0].

Parameters
----------
theType: Quantity_TypeOfColor

Returns
-------
theR1: float
theR2: float
theR3: float
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
	__repr__ = _dumps_object
	}
};

/*****************************
* class Quantity_ColorHasher *
*****************************/
class Quantity_ColorHasher {
	public:
		/****************** HashCode ******************/
		/**** md5 signature: 8fd37c076f802d432dcef25930612415 ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Returns hash code for the given rgb color, in the range [1, theupperbound] @param thecolor the rgb color object which hash code is to be computed @param theupperbound the upper bound of the range a computing range must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theColor: Quantity_Color
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const Quantity_Color & theColor, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: a0becaf8231438906c4ce4901fd8290b ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if two colors are equal.

Parameters
----------
theColor1: Quantity_Color
theColor2: Quantity_Color

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const Quantity_Color & theColor1, const Quantity_Color & theColor2);

};


%extend Quantity_ColorHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Quantity_ColorRGBA *
***************************/
class Quantity_ColorRGBA {
	public:
		/****************** Quantity_ColorRGBA ******************/
		/**** md5 signature: 59cdeedded54e4a79897a6a11ec68037 ****/
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "Creates a color with the default value.

Returns
-------
None
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA();

		/****************** Quantity_ColorRGBA ******************/
		/**** md5 signature: c2578e3af784ca8c36479364834b45cf ****/
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "Creates the color with specified rgb value.

Parameters
----------
theRgb: Quantity_Color

Returns
-------
None
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA(const Quantity_Color & theRgb);

		/****************** Quantity_ColorRGBA ******************/
		/**** md5 signature: 12805420d06dcf56a46265f53218218a ****/
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "Creates the color with specified rgba values.

Parameters
----------
theRgb: Quantity_Color
theAlpha: float

Returns
-------
None
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA(const Quantity_Color & theRgb, float theAlpha);

		/****************** Quantity_ColorRGBA ******************/
		/**** md5 signature: 169a4fc643fdae14510d92bffe1581fe ****/
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "Creates the color from rgba vector.

Parameters
----------
theRgba: NCollection_Vec4<float>

Returns
-------
None
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA(const NCollection_Vec4<float> & theRgba);

		/****************** Quantity_ColorRGBA ******************/
		/**** md5 signature: 8bf5ac0c566506e4521f2e554e6547b7 ****/
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "Creates the color from rgba values.

Parameters
----------
theRed: float
theGreen: float
theBlue: float
theAlpha: float

Returns
-------
None
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA(float theRed, float theGreen, float theBlue, float theAlpha);

		/****************** Alpha ******************/
		/**** md5 signature: 7ca16a70b060b6cea195b679eee9d6a0 ****/
		%feature("compactdefaultargs") Alpha;
		%feature("autodoc", "Return alpha value (1.0 means opaque, 0.0 means fully transparent).

Returns
-------
Standard_ShortReal
") Alpha;
		Standard_ShortReal Alpha();

		/****************** ChangeRGB ******************/
		/**** md5 signature: 3b675b0933baf08208bc6568524de17c ****/
		%feature("compactdefaultargs") ChangeRGB;
		%feature("autodoc", "Modify rgb color components without affecting alpha value.

Returns
-------
Quantity_Color
") ChangeRGB;
		Quantity_Color & ChangeRGB();

		/****************** ColorFromHex ******************/
		/**** md5 signature: b3634b5c703eedf63647f9e571d57b71 ****/
		%feature("compactdefaultargs") ColorFromHex;
		%feature("autodoc", "Parses the string as a hex color (like '#ff0' for short rgb color, '#ff0f' for short rgba color, '#ffff00' for rgb color, or '#ffff00ff' for rgba color) @param thehexcolorstring the string to be parsed @param thecolor a color that is a result of parsing @param thealphacomponentisoff the flag that indicates if a color alpha component is presented in the input string (false) or not (true) returns true if parsing was successful, or false otherwise.

Parameters
----------
theHexColorString: char *
theColor: Quantity_ColorRGBA
theAlphaComponentIsOff: bool,optional
	default value is false

Returns
-------
bool
") ColorFromHex;
		static bool ColorFromHex(const char * const theHexColorString, Quantity_ColorRGBA & theColor, const bool theAlphaComponentIsOff = false);

		/****************** ColorFromName ******************/
		/**** md5 signature: b7369db5af7825fb8b564a5624fec500 ****/
		%feature("compactdefaultargs") ColorFromName;
		%feature("autodoc", "Finds color from predefined names. for example, the name of the color which corresponds to 'black' is quantity_noc_black. returns false if name is unknown. an alpha component is set to 1.0. @param thecolornamestring the color name @param thecolor a found color returns false if the color name is unknown, or true if the search by color name was successful.

Parameters
----------
theColorNameString: char *
theColor: Quantity_ColorRGBA

Returns
-------
bool
") ColorFromName;
		static Standard_Boolean ColorFromName(const char * theColorNameString, Quantity_ColorRGBA & theColor);

		/****************** ColorToHex ******************/
		/**** md5 signature: 2ddaf7ca0d632cd7bd0bafa4a9a275e3 ****/
		%feature("compactdefaultargs") ColorToHex;
		%feature("autodoc", "Returns hex srgba string in format '#rrggbbaa'.

Parameters
----------
theColor: Quantity_ColorRGBA
theToPrefixHash: bool,optional
	default value is true

Returns
-------
TCollection_AsciiString
") ColorToHex;
		static TCollection_AsciiString ColorToHex(const Quantity_ColorRGBA & theColor, const bool theToPrefixHash = true);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** GetRGB ******************/
		/**** md5 signature: a34b3caa70b44fb7fb19647f1c2d613b ****/
		%feature("compactdefaultargs") GetRGB;
		%feature("autodoc", "Return rgb color value.

Returns
-------
Quantity_Color
") GetRGB;
		const Quantity_Color & GetRGB();

		/****************** IsDifferent ******************/
		/**** md5 signature: c920c33d4688df25d56cabe0d9340122 ****/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "Returns true if the distance between colors is greater than epsilon().

Parameters
----------
theOther: Quantity_ColorRGBA

Returns
-------
bool
") IsDifferent;
		bool IsDifferent(const Quantity_ColorRGBA & theOther);

		/****************** IsEqual ******************/
		/**** md5 signature: 211551909666d7a2f8e83995e83f95d8 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Two colors are considered to be equal if their distance is no greater than epsilon().

Parameters
----------
theOther: Quantity_ColorRGBA

Returns
-------
bool
") IsEqual;
		bool IsEqual(const Quantity_ColorRGBA & theOther);

		/****************** SetAlpha ******************/
		/**** md5 signature: 69b23018f0550922a3fe1a354f493661 ****/
		%feature("compactdefaultargs") SetAlpha;
		%feature("autodoc", "Assign the alpha value.

Parameters
----------
theAlpha: Standard_ShortReal

Returns
-------
None
") SetAlpha;
		void SetAlpha(const Standard_ShortReal theAlpha);

		/****************** SetRGB ******************/
		/**** md5 signature: 2cc6a699c1ae321fa89378049e348ca7 ****/
		%feature("compactdefaultargs") SetRGB;
		%feature("autodoc", "Assign rgb color components without affecting alpha value.

Parameters
----------
theRgb: Quantity_Color

Returns
-------
None
") SetRGB;
		void SetRGB(const Quantity_Color & theRgb);

		/****************** SetValues ******************/
		/**** md5 signature: 5a6708d73c546b77771916e443ba23ca ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Assign new values to the color.

Parameters
----------
theRed: float
theGreen: float
theBlue: float
theAlpha: float

Returns
-------
None
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
	__repr__ = _dumps_object
	}
};

/*********************************
* class Quantity_ColorRGBAHasher *
*********************************/
class Quantity_ColorRGBAHasher {
	public:
		/****************** HashCode ******************/
		/**** md5 signature: 8fc030a9b42b32361b4374d824d85f29 ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Returns hash code for the given rgba color, in the range [1, theupperbound] @param thecolor the rgba color object which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theColor: Quantity_ColorRGBA
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const Quantity_ColorRGBA & theColor, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: 19e2fc14fd433f961e867bf190723e87 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if two colors are equal.

Parameters
----------
theColor1: Quantity_ColorRGBA
theColor2: Quantity_ColorRGBA

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const Quantity_ColorRGBA & theColor1, const Quantity_ColorRGBA & theColor2);

};


%extend Quantity_ColorRGBAHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Quantity_Date *
**********************/
class Quantity_Date {
	public:
		/****************** Quantity_Date ******************/
		/**** md5 signature: 8d43f6af738c96e1986f49ba2f274591 ****/
		%feature("compactdefaultargs") Quantity_Date;
		%feature("autodoc", "Constructs a default date (00:00 gmt, january 1, 1979 (zero hour)); use the function setvalues to define the required date; or.

Returns
-------
None
") Quantity_Date;
		 Quantity_Date();

		/****************** Quantity_Date ******************/
		/**** md5 signature: 4805f2bee53d65862d22e4b69f715ca6 ****/
		%feature("compactdefaultargs") Quantity_Date;
		%feature("autodoc", "Constructs a date from the year yyyy, the month mm, the day dd, the hour hh, the minute mn, the second ss, the millisecond mis (defaulted to 0) and the microsecond mics (defaulted to 0).. with: 1 <= mm <= 12 1 <= dd <= max number of days of <mm> 1979 <= yyyy 0 <= hh <= 23 0 <= mn <= 59 0 <= ss <= 59 0 <= mis <= 999 0 <= mics <= 999 exceptions quantity_datedefinitionerror if mm, dd, hh, mn, ss, mis and mics are not the components of the valid date.

Parameters
----------
mm: int
dd: int
yyyy: int
hh: int
mn: int
ss: int
mis: int,optional
	default value is 0
mics: int,optional
	default value is 0

Returns
-------
None
") Quantity_Date;
		 Quantity_Date(const Standard_Integer mm, const Standard_Integer dd, const Standard_Integer yyyy, const Standard_Integer hh, const Standard_Integer mn, const Standard_Integer ss, const Standard_Integer mis = 0, const Standard_Integer mics = 0);

		/****************** Add ******************/
		/**** md5 signature: 6b980cdb180067930c314362f5a81835 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a period to a date and returns the new date.

Parameters
----------
aPeriod: Quantity_Period

Returns
-------
Quantity_Date
") Add;
		Quantity_Date Add(const Quantity_Period & aPeriod);

		/****************** Day ******************/
		/**** md5 signature: 64a5159d4ccaad3f9f4f452566b1d949 ****/
		%feature("compactdefaultargs") Day;
		%feature("autodoc", "Returns day of a date.

Returns
-------
int
") Day;
		Standard_Integer Day();

		/****************** Difference ******************/
		/**** md5 signature: 9371c141eda9ebda87b5eddf4e0b4d6f ****/
		%feature("compactdefaultargs") Difference;
		%feature("autodoc", "Subtracts one date from another one to find the period between and returns the value. the result is the absolute value between the difference of two dates.

Parameters
----------
anOther: Quantity_Date

Returns
-------
Quantity_Period
") Difference;
		Quantity_Period Difference(const Quantity_Date & anOther);

		/****************** Hour ******************/
		/**** md5 signature: 462fc02c8419c4ebffa0db630a83c728 ****/
		%feature("compactdefaultargs") Hour;
		%feature("autodoc", "Returns hour of a date.

Returns
-------
int
") Hour;
		Standard_Integer Hour();

		/****************** IsEarlier ******************/
		/**** md5 signature: 632372f2398aab43fcac77b5881999ac ****/
		%feature("compactdefaultargs") IsEarlier;
		%feature("autodoc", "Returns true if <self> is earlier than <other>.

Parameters
----------
anOther: Quantity_Date

Returns
-------
bool
") IsEarlier;
		Standard_Boolean IsEarlier(const Quantity_Date & anOther);

		/****************** IsEqual ******************/
		/**** md5 signature: e7666362280964dc6fe1156f418d6f0c ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if both <self> and <other> are equal. this method is an alias of operator ==.

Parameters
----------
anOther: Quantity_Date

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const Quantity_Date & anOther);

		/****************** IsLater ******************/
		/**** md5 signature: 3838a9fcdc42fe7d9378844e560f9c70 ****/
		%feature("compactdefaultargs") IsLater;
		%feature("autodoc", "Returns true if <self> is later then <other>.

Parameters
----------
anOther: Quantity_Date

Returns
-------
bool
") IsLater;
		Standard_Boolean IsLater(const Quantity_Date & anOther);

		/****************** IsLeap ******************/
		/**** md5 signature: 637a928f83e67c8159746f72af70ea4b ****/
		%feature("compactdefaultargs") IsLeap;
		%feature("autodoc", "Returns true if a year is a leap year. the leap years are divisable by 4 and not by 100 except the years divisable by 400.

Parameters
----------
yy: int

Returns
-------
bool
") IsLeap;
		static Standard_Boolean IsLeap(const Standard_Integer yy);

		/****************** IsValid ******************/
		/**** md5 signature: e2890948f667611b751db246614e7815 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Checks the validity of a date - returns true if a date defined from the year yyyy, the month mm, the day dd, the hour hh, the minute mn, the second ss, the millisecond mis (defaulted to 0) and the microsecond mics (defaulted to 0) is valid. a date must satisfy the conditions above: - yyyy is greater than or equal to 1979, - mm lies within the range [1, 12] (with 1 corresponding to january and 12 to december), - dd lies within a valid range for the month mm (from 1 to 28, 29, 30 or 31 depending on mm and whether yyyy is a leap year or not), - hh lies within the range [0, 23], - mn lies within the range [0, 59], - ss lies within the range [0, 59], - mis lies within the range [0, 999], - mics lies within the range [0, 999].c.

Parameters
----------
mm: int
dd: int
yy: int
hh: int
mn: int
ss: int
mis: int,optional
	default value is 0
mics: int,optional
	default value is 0

Returns
-------
bool
") IsValid;
		static Standard_Boolean IsValid(const Standard_Integer mm, const Standard_Integer dd, const Standard_Integer yy, const Standard_Integer hh, const Standard_Integer mn, const Standard_Integer ss, const Standard_Integer mis = 0, const Standard_Integer mics = 0);

		/****************** MicroSecond ******************/
		/**** md5 signature: 812377edfa7441362339d6a475931c30 ****/
		%feature("compactdefaultargs") MicroSecond;
		%feature("autodoc", "Returns microsecond of a date.

Returns
-------
int
") MicroSecond;
		Standard_Integer MicroSecond();

		/****************** MilliSecond ******************/
		/**** md5 signature: aa8d2db286c7effa611527b9956ef85d ****/
		%feature("compactdefaultargs") MilliSecond;
		%feature("autodoc", "Returns millisecond of a date.

Returns
-------
int
") MilliSecond;
		Standard_Integer MilliSecond();

		/****************** Minute ******************/
		/**** md5 signature: e00440345125e331bdde27963fd5f640 ****/
		%feature("compactdefaultargs") Minute;
		%feature("autodoc", "Returns minute of a date.

Returns
-------
int
") Minute;
		Standard_Integer Minute();

		/****************** Month ******************/
		/**** md5 signature: fe37dee5337f8b8d353e963726f0d5bf ****/
		%feature("compactdefaultargs") Month;
		%feature("autodoc", "Returns month of a date.

Returns
-------
int
") Month;
		Standard_Integer Month();

		/****************** Second ******************/
		/**** md5 signature: cef0dbe51764679506c173ac71d2b104 ****/
		%feature("compactdefaultargs") Second;
		%feature("autodoc", "Returns seconde of a date.

Returns
-------
int
") Second;
		Standard_Integer Second();

		/****************** SetValues ******************/
		/**** md5 signature: 51473998ba54cd19064ae3575d5af6f1 ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Assigns to this date the year yyyy, the month mm, the day dd, the hour hh, the minute mn, the second ss, the millisecond mis (defaulted to 0) and the microsecond mics (defaulted to 0). exceptions quantity_datedefinitionerror if mm, dd, hh, mn, ss, mis and mics are not components of a valid date.

Parameters
----------
mm: int
dd: int
yy: int
hh: int
mn: int
ss: int
mis: int,optional
	default value is 0
mics: int,optional
	default value is 0

Returns
-------
None
") SetValues;
		void SetValues(const Standard_Integer mm, const Standard_Integer dd, const Standard_Integer yy, const Standard_Integer hh, const Standard_Integer mn, const Standard_Integer ss, const Standard_Integer mis = 0, const Standard_Integer mics = 0);

		/****************** Subtract ******************/
		/**** md5 signature: 7efe0d480376249606f0794680582ba9 ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Subtracts a period from a date and returns the new date. raises an exception if the result date is anterior to jan 1, 1979.

Parameters
----------
aPeriod: Quantity_Period

Returns
-------
Quantity_Date
") Subtract;
		Quantity_Date Subtract(const Quantity_Period & aPeriod);

		/****************** Values ******************/
		/**** md5 signature: 4777448c9c4089d555da4c905325fc97 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Gets a complete date. - in mm - the month, - in dd - the day, - in yyyy - the year, - in hh - the hour, - in mn - the minute, - in ss - the second, - in mis - the millisecond, and - in mics - the microsecond.

Parameters
----------

Returns
-------
mm: int
dd: int
yy: int
hh: int
mn: int
ss: int
mis: int
mics: int
") Values;
		void Values(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Year ******************/
		/**** md5 signature: 1e53d2ba9089d382117a297db3ab656e ****/
		%feature("compactdefaultargs") Year;
		%feature("autodoc", "Returns year of a date.

Returns
-------
int
") Year;
		Standard_Integer Year();

		/****************** operator + ******************/
		/**** md5 signature: 065c8848e25f4dc08493ff98a099e834 ****/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPeriod: Quantity_Period

Returns
-------
Quantity_Date
") operator +;
		Quantity_Date operator +(const Quantity_Period & aPeriod);

		/****************** operator - ******************/
		/**** md5 signature: 5cea87d1632e6f9fcc5dbab51dccbf79 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPeriod: Quantity_Period

Returns
-------
Quantity_Date
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
	__repr__ = _dumps_object
	}
};

/************************
* class Quantity_Period *
************************/
class Quantity_Period {
	public:
		/****************** Quantity_Period ******************/
		/**** md5 signature: 1744ee752006ad16eb0534d09d10100e ****/
		%feature("compactdefaultargs") Quantity_Period;
		%feature("autodoc", "Creates a period with: 0 <= dd 0 <= hh 0 <= mn 0 <= ss 0 <= mis 0 <= mics.

Parameters
----------
dd: int
hh: int
mn: int
ss: int
mis: int,optional
	default value is 0
mics: int,optional
	default value is 0

Returns
-------
None
") Quantity_Period;
		 Quantity_Period(const Standard_Integer dd, const Standard_Integer hh, const Standard_Integer mn, const Standard_Integer ss, const Standard_Integer mis = 0, const Standard_Integer mics = 0);

		/****************** Quantity_Period ******************/
		/**** md5 signature: ff517b7cb0b1514e9260a0424e55f874 ****/
		%feature("compactdefaultargs") Quantity_Period;
		%feature("autodoc", "Creates a period with a number of seconds and microseconds. exceptions quantity_perioddefinitionerror: - if the number of seconds expressed either by: - dd days, hh hours, mn minutes and ss seconds, or - ss is less than 0. - if the number of microseconds expressed either by: - mis milliseconds and mics microseconds, or - mics is less than 0.

Parameters
----------
ss: int
mics: int,optional
	default value is 0

Returns
-------
None
") Quantity_Period;
		 Quantity_Period(const Standard_Integer ss, const Standard_Integer mics = 0);

		/****************** Add ******************/
		/**** md5 signature: 0e9a39b4d418d4361aca2e1f77209cdf ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds one period to another one.

Parameters
----------
anOther: Quantity_Period

Returns
-------
Quantity_Period
") Add;
		Quantity_Period Add(const Quantity_Period & anOther);

		/****************** IsEqual ******************/
		/**** md5 signature: 9ac45f7130e60832d0e58a3749d58cc0 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if both <self> and <other> are equal.

Parameters
----------
anOther: Quantity_Period

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const Quantity_Period & anOther);

		/****************** IsLonger ******************/
		/**** md5 signature: f5ef59e521630d0f19766352ff861256 ****/
		%feature("compactdefaultargs") IsLonger;
		%feature("autodoc", "Returns true if <self> is longer then <other>.

Parameters
----------
anOther: Quantity_Period

Returns
-------
bool
") IsLonger;
		Standard_Boolean IsLonger(const Quantity_Period & anOther);

		/****************** IsShorter ******************/
		/**** md5 signature: 4cfeb8469244bbd23f3362cf5812a804 ****/
		%feature("compactdefaultargs") IsShorter;
		%feature("autodoc", "Returns true if <self> is shorter than <other>.

Parameters
----------
anOther: Quantity_Period

Returns
-------
bool
") IsShorter;
		Standard_Boolean IsShorter(const Quantity_Period & anOther);

		/****************** IsValid ******************/
		/**** md5 signature: daa38478ca0b1ca8f401a8402a56a3b8 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Checks the validity of a period in form (dd,hh,mn,ss,mil,mic) with: 0 <= dd 0 <= hh 0 <= mn 0 <= ss 0 <= mis 0 <= mics.

Parameters
----------
dd: int
hh: int
mn: int
ss: int
mis: int,optional
	default value is 0
mics: int,optional
	default value is 0

Returns
-------
bool
") IsValid;
		static Standard_Boolean IsValid(const Standard_Integer dd, const Standard_Integer hh, const Standard_Integer mn, const Standard_Integer ss, const Standard_Integer mis = 0, const Standard_Integer mics = 0);

		/****************** IsValid ******************/
		/**** md5 signature: b63c92eb4edbf27b56fbd58df4e78bfd ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Checks the validity of a period in form (ss,mic) with: 0 <= ss 0 <= mics.

Parameters
----------
ss: int
mics: int,optional
	default value is 0

Returns
-------
bool
") IsValid;
		static Standard_Boolean IsValid(const Standard_Integer ss, const Standard_Integer mics = 0);

		/****************** SetValues ******************/
		/**** md5 signature: 929d6e94cdbae4e6dfe7090c56837378 ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Assigns to this period the time interval defined - with dd days, hh hours, mn minutes, ss seconds, mis (defaulted to 0) milliseconds and mics (defaulted to 0) microseconds; or.

Parameters
----------
dd: int
hh: int
mn: int
ss: int
mis: int,optional
	default value is 0
mics: int,optional
	default value is 0

Returns
-------
None
") SetValues;
		void SetValues(const Standard_Integer dd, const Standard_Integer hh, const Standard_Integer mn, const Standard_Integer ss, const Standard_Integer mis = 0, const Standard_Integer mics = 0);

		/****************** SetValues ******************/
		/**** md5 signature: 4a43be4e5034c3b5d62f7e92501cc260 ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Assigns to this period the time interval defined - with ss seconds and mics (defaulted to 0) microseconds. exceptions quantity_perioddefinitionerror: - if the number of seconds expressed either by: - dd days, hh hours, mn minutes and ss seconds, or - ss is less than 0. - if the number of microseconds expressed either by: - mis milliseconds and mics microseconds, or - mics is less than 0.

Parameters
----------
ss: int
mics: int,optional
	default value is 0

Returns
-------
None
") SetValues;
		void SetValues(const Standard_Integer ss, const Standard_Integer mics = 0);

		/****************** Subtract ******************/
		/**** md5 signature: 2e82f0457853be8b33b2f39e8671979b ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Subtracts one period from another and returns the difference.

Parameters
----------
anOther: Quantity_Period

Returns
-------
Quantity_Period
") Subtract;
		Quantity_Period Subtract(const Quantity_Period & anOther);

		/****************** Values ******************/
		/**** md5 signature: de41225dda45151d407832b30cb61435 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Decomposes this period into a number of days,hours, minutes,seconds,milliseconds and microseconds example of return values: 2 days, 15 hours, 0 minute , 0 second 0 millisecond and 0 microsecond.

Parameters
----------

Returns
-------
dd: int
hh: int
mn: int
ss: int
mis: int
mics: int
") Values;
		void Values(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Values ******************/
		/**** md5 signature: 0bd43b78efbe121977f35bb694c18737 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the number of seconds in ss and the number of remainding microseconds in mics of this period. example of return values: 3600 seconds and 0 microseconds.

Parameters
----------

Returns
-------
ss: int
mics: int
") Values;
		void Values(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** operator + ******************/
		/**** md5 signature: b469a74a9bde44265acc9f3c4cbf2364 ****/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
anOther: Quantity_Period

Returns
-------
Quantity_Period
") operator +;
		Quantity_Period operator +(const Quantity_Period & anOther);

		/****************** operator - ******************/
		/**** md5 signature: 0986ca7dc4739dd0190ddec4db2fa4cf ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Parameters
----------
anOther: Quantity_Period

Returns
-------
Quantity_Period
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
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class Quantity_HArray1OfColor : public Quantity_Array1OfColor, public Standard_Transient {
  public:
    Quantity_HArray1OfColor(const Standard_Integer theLower, const Standard_Integer theUpper);
    Quantity_HArray1OfColor(const Standard_Integer theLower, const Standard_Integer theUpper, const Quantity_Array1OfColor::value_type& theValue);
    Quantity_HArray1OfColor(const Quantity_Array1OfColor& theOther);
    const Quantity_Array1OfColor& Array1();
    Quantity_Array1OfColor& ChangeArray1();
};
%make_alias(Quantity_HArray1OfColor)

/* harray2 classes */
/* hsequence classes */
