/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define EXPRINTRPDOCSTRING
"ExprIntrp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_exprintrp.html"
%enddef
%module (package="OCC.Core", docstring=EXPRINTRPDOCSTRING) ExprIntrp


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
#include<ExprIntrp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Expr_module.hxx>
#include<TCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Expr.i
%import TCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(ExprIntrp_Generator)
%wrap_handle(ExprIntrp_GenExp)
%wrap_handle(ExprIntrp_GenFct)
%wrap_handle(ExprIntrp_GenRel)
/* end handles declaration */

/* templates */
%template(ExprIntrp_ListIteratorOfStackOfGeneralExpression) NCollection_TListIterator<opencascade::handle<Expr_GeneralExpression>>;
%template(ExprIntrp_ListIteratorOfStackOfGeneralFunction) NCollection_TListIterator<opencascade::handle<Expr_GeneralFunction>>;
%template(ExprIntrp_ListIteratorOfStackOfGeneralRelation) NCollection_TListIterator<opencascade::handle<Expr_GeneralRelation>>;
%template(ExprIntrp_SequenceOfNamedExpression) NCollection_Sequence<opencascade::handle<Expr_NamedExpression>>;

%extend NCollection_Sequence<opencascade::handle<Expr_NamedExpression>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(ExprIntrp_SequenceOfNamedFunction) NCollection_Sequence<opencascade::handle<Expr_NamedFunction>>;

%extend NCollection_Sequence<opencascade::handle<Expr_NamedFunction>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(ExprIntrp_StackOfGeneralExpression) NCollection_List<opencascade::handle<Expr_GeneralExpression>>;

%extend NCollection_List<opencascade::handle<Expr_GeneralExpression>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(ExprIntrp_StackOfGeneralFunction) NCollection_List<opencascade::handle<Expr_GeneralFunction>>;

%extend NCollection_List<opencascade::handle<Expr_GeneralFunction>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(ExprIntrp_StackOfGeneralRelation) NCollection_List<opencascade::handle<Expr_GeneralRelation>>;

%extend NCollection_List<opencascade::handle<Expr_GeneralRelation>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_List<opencascade::handle<Expr_GeneralExpression>>::Iterator ExprIntrp_ListIteratorOfStackOfGeneralExpression;
typedef NCollection_List<opencascade::handle<Expr_GeneralFunction>>::Iterator ExprIntrp_ListIteratorOfStackOfGeneralFunction;
typedef NCollection_List<opencascade::handle<Expr_GeneralRelation>>::Iterator ExprIntrp_ListIteratorOfStackOfGeneralRelation;
typedef NCollection_Sequence<opencascade::handle<Expr_NamedExpression>> ExprIntrp_SequenceOfNamedExpression;
typedef NCollection_Sequence<opencascade::handle<Expr_NamedFunction>> ExprIntrp_SequenceOfNamedFunction;
typedef NCollection_List<opencascade::handle<Expr_GeneralExpression>> ExprIntrp_StackOfGeneralExpression;
typedef NCollection_List<opencascade::handle<Expr_GeneralFunction>> ExprIntrp_StackOfGeneralFunction;
typedef NCollection_List<opencascade::handle<Expr_GeneralRelation>> ExprIntrp_StackOfGeneralRelation;
/* end typedefs declaration */

/******************
* class ExprIntrp *
******************/
%rename(exprintrp) ExprIntrp;
class ExprIntrp {
	public:
};


%extend ExprIntrp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class ExprIntrp_Analysis *
***************************/
class ExprIntrp_Analysis {
	public:
		/****** ExprIntrp_Analysis::ExprIntrp_Analysis ******/
		/****** md5 signature: 63bd222fa4cea1588438569c07374eb0 ******/
		%feature("compactdefaultargs") ExprIntrp_Analysis;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ExprIntrp_Analysis;
		 ExprIntrp_Analysis();

		/****** ExprIntrp_Analysis::GetFunction ******/
		/****** md5 signature: 81e49aa24337271a2b3b9b892a2cb480 ******/
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Expr_NamedFunction>

Description
-----------
No available documentation.
") GetFunction;
		opencascade::handle<Expr_NamedFunction> GetFunction(TCollection_AsciiString name);

		/****** ExprIntrp_Analysis::GetNamed ******/
		/****** md5 signature: 00571fc8f55255c5f9636b8e9080c78f ******/
		%feature("compactdefaultargs") GetNamed;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Expr_NamedExpression>

Description
-----------
No available documentation.
") GetNamed;
		opencascade::handle<Expr_NamedExpression> GetNamed(TCollection_AsciiString name);

		/****** ExprIntrp_Analysis::IsExpStackEmpty ******/
		/****** md5 signature: 441f3f4e29c508b02f95a8a90083cf7b ******/
		%feature("compactdefaultargs") IsExpStackEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsExpStackEmpty;
		Standard_Boolean IsExpStackEmpty();

		/****** ExprIntrp_Analysis::IsRelStackEmpty ******/
		/****** md5 signature: dc9af98784fdc93ad746f753442ce942 ******/
		%feature("compactdefaultargs") IsRelStackEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRelStackEmpty;
		Standard_Boolean IsRelStackEmpty();

		/****** ExprIntrp_Analysis::Pop ******/
		/****** md5 signature: 2ea9701aa4fe74c67960fa47364e6480 ******/
		%feature("compactdefaultargs") Pop;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
No available documentation.
") Pop;
		opencascade::handle<Expr_GeneralExpression> Pop();

		/****** ExprIntrp_Analysis::PopFunction ******/
		/****** md5 signature: 6233fe1e807f5fe431ca96ebc2bce5e8 ******/
		%feature("compactdefaultargs") PopFunction;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
No available documentation.
") PopFunction;
		opencascade::handle<Expr_GeneralFunction> PopFunction();

		/****** ExprIntrp_Analysis::PopName ******/
		/****** md5 signature: 0582f7478d9d5b890373932fe4e6ee3d ******/
		%feature("compactdefaultargs") PopName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") PopName;
		TCollection_AsciiString PopName();

		/****** ExprIntrp_Analysis::PopRelation ******/
		/****** md5 signature: 8cebb58e41621afe2f8efba2a5837f2d ******/
		%feature("compactdefaultargs") PopRelation;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
No available documentation.
") PopRelation;
		opencascade::handle<Expr_GeneralRelation> PopRelation();

		/****** ExprIntrp_Analysis::PopValue ******/
		/****** md5 signature: cd2300a5330c28bfb6074204a08ac12d ******/
		%feature("compactdefaultargs") PopValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") PopValue;
		Standard_Integer PopValue();

		/****** ExprIntrp_Analysis::Push ******/
		/****** md5 signature: 34423e005c9b5345a9135a7d1e529ada ******/
		%feature("compactdefaultargs") Push;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
No available documentation.
") Push;
		void Push(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** ExprIntrp_Analysis::PushFunction ******/
		/****** md5 signature: 0bd316d823d99f15ef432bbe7a68d3ce ******/
		%feature("compactdefaultargs") PushFunction;
		%feature("autodoc", "
Parameters
----------
func: Expr_GeneralFunction

Return
-------
None

Description
-----------
No available documentation.
") PushFunction;
		void PushFunction(const opencascade::handle<Expr_GeneralFunction> & func);

		/****** ExprIntrp_Analysis::PushName ******/
		/****** md5 signature: af1688ea01f971c713042a477627cd92 ******/
		%feature("compactdefaultargs") PushName;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
None

Description
-----------
No available documentation.
") PushName;
		void PushName(TCollection_AsciiString name);

		/****** ExprIntrp_Analysis::PushRelation ******/
		/****** md5 signature: 47853072625b744e73e4deeaa2a7c796 ******/
		%feature("compactdefaultargs") PushRelation;
		%feature("autodoc", "
Parameters
----------
rel: Expr_GeneralRelation

Return
-------
None

Description
-----------
No available documentation.
") PushRelation;
		void PushRelation(const opencascade::handle<Expr_GeneralRelation> & rel);

		/****** ExprIntrp_Analysis::PushValue ******/
		/****** md5 signature: a0fc16b3fc2c0d895bd7d5cf1f7af890 ******/
		%feature("compactdefaultargs") PushValue;
		%feature("autodoc", "
Parameters
----------
degree: int

Return
-------
None

Description
-----------
No available documentation.
") PushValue;
		void PushValue(const Standard_Integer degree);

		/****** ExprIntrp_Analysis::ResetAll ******/
		/****** md5 signature: 76dcab9f08e5bea32f0ad3fdba331a81 ******/
		%feature("compactdefaultargs") ResetAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ResetAll;
		void ResetAll();

		/****** ExprIntrp_Analysis::SetMaster ******/
		/****** md5 signature: 02d66cfefb1ced08408efa2579cf867d ******/
		%feature("compactdefaultargs") SetMaster;
		%feature("autodoc", "
Parameters
----------
agen: ExprIntrp_Generator

Return
-------
None

Description
-----------
No available documentation.
") SetMaster;
		void SetMaster(const opencascade::handle<ExprIntrp_Generator> & agen);

		/****** ExprIntrp_Analysis::Use ******/
		/****** md5 signature: bad91b0967a130b4629c7d0c7a8e578e ******/
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "
Parameters
----------
func: Expr_NamedFunction

Return
-------
None

Description
-----------
No available documentation.
") Use;
		void Use(const opencascade::handle<Expr_NamedFunction> & func);

		/****** ExprIntrp_Analysis::Use ******/
		/****** md5 signature: 828b264ad92f447ca21b884ec71153dc ******/
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "
Parameters
----------
named: Expr_NamedExpression

Return
-------
None

Description
-----------
No available documentation.
") Use;
		void Use(const opencascade::handle<Expr_NamedExpression> & named);

};


%extend ExprIntrp_Analysis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class ExprIntrp_Generator *
****************************/
%nodefaultctor ExprIntrp_Generator;
class ExprIntrp_Generator : public Standard_Transient {
	public:
		/****** ExprIntrp_Generator::GetFunction ******/
		/****** md5 signature: 11698abf447e25022cce69121967dd1b ******/
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Expr_NamedFunction>

Description
-----------
Returns namedfunction with name <name> already interpreted if it exists. returns a null handle if not.
") GetFunction;
		opencascade::handle<Expr_NamedFunction> GetFunction(TCollection_AsciiString name);

		/****** ExprIntrp_Generator::GetFunctions ******/
		/****** md5 signature: ea7b11f8c2ec952b91fcef512794779f ******/
		%feature("compactdefaultargs") GetFunctions;
		%feature("autodoc", "Return
-------
ExprIntrp_SequenceOfNamedFunction

Description
-----------
No available documentation.
") GetFunctions;
		const ExprIntrp_SequenceOfNamedFunction & GetFunctions();

		/****** ExprIntrp_Generator::GetNamed ******/
		/****** md5 signature: d4af2a91b9f29c78bc170c193b08b541 ******/
		%feature("compactdefaultargs") GetNamed;
		%feature("autodoc", "Return
-------
ExprIntrp_SequenceOfNamedExpression

Description
-----------
No available documentation.
") GetNamed;
		const ExprIntrp_SequenceOfNamedExpression & GetNamed();

		/****** ExprIntrp_Generator::GetNamed ******/
		/****** md5 signature: f135368bc026ec37dda3220c9c49de62 ******/
		%feature("compactdefaultargs") GetNamed;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Expr_NamedExpression>

Description
-----------
Returns namedexpression with name <name> already interpreted if it exists. returns a null handle if not.
") GetNamed;
		opencascade::handle<Expr_NamedExpression> GetNamed(TCollection_AsciiString name);

		/****** ExprIntrp_Generator::Use ******/
		/****** md5 signature: bad91b0967a130b4629c7d0c7a8e578e ******/
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "
Parameters
----------
func: Expr_NamedFunction

Return
-------
None

Description
-----------
No available documentation.
") Use;
		void Use(const opencascade::handle<Expr_NamedFunction> & func);

		/****** ExprIntrp_Generator::Use ******/
		/****** md5 signature: 828b264ad92f447ca21b884ec71153dc ******/
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "
Parameters
----------
named: Expr_NamedExpression

Return
-------
None

Description
-----------
No available documentation.
") Use;
		void Use(const opencascade::handle<Expr_NamedExpression> & named);

};


%make_alias(ExprIntrp_Generator)

%extend ExprIntrp_Generator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class ExprIntrp_GenExp *
*************************/
%nodefaultctor ExprIntrp_GenExp;
class ExprIntrp_GenExp : public ExprIntrp_Generator {
	public:
		/****** ExprIntrp_GenExp::Create ******/
		/****** md5 signature: 4e4134de3b1b6f47befbbbc717889d24 ******/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Return
-------
opencascade::handle<ExprIntrp_GenExp>

Description
-----------
No available documentation.
") Create;
		static opencascade::handle<ExprIntrp_GenExp> Create();

		/****** ExprIntrp_GenExp::Expression ******/
		/****** md5 signature: 5ca63dd06176a0c3c49989c229b9fbf6 ******/
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns expression generated. raises an exception if isdone answers false.
") Expression;
		opencascade::handle<Expr_GeneralExpression> Expression();

		/****** ExprIntrp_GenExp::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false if any syntax error has occurred during process.
") IsDone;
		Standard_Boolean IsDone();

		/****** ExprIntrp_GenExp::Process ******/
		/****** md5 signature: 2b36655805fcdcb65bd9dff1fce15e9f ******/
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "
Parameters
----------
str: str

Return
-------
None

Description
-----------
Processes given string.
") Process;
		void Process(TCollection_AsciiString str);

};


%make_alias(ExprIntrp_GenExp)

%extend ExprIntrp_GenExp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class ExprIntrp_GenFct *
*************************/
%nodefaultctor ExprIntrp_GenFct;
class ExprIntrp_GenFct : public ExprIntrp_Generator {
	public:
		/****** ExprIntrp_GenFct::Create ******/
		/****** md5 signature: cf205d2f50784e4cf485a2da9c614be9 ******/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Return
-------
opencascade::handle<ExprIntrp_GenFct>

Description
-----------
No available documentation.
") Create;
		static opencascade::handle<ExprIntrp_GenFct> Create();

		/****** ExprIntrp_GenFct::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** ExprIntrp_GenFct::Process ******/
		/****** md5 signature: 2b36655805fcdcb65bd9dff1fce15e9f ******/
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "
Parameters
----------
str: str

Return
-------
None

Description
-----------
No available documentation.
") Process;
		void Process(TCollection_AsciiString str);

};


%make_alias(ExprIntrp_GenFct)

%extend ExprIntrp_GenFct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class ExprIntrp_GenRel *
*************************/
%nodefaultctor ExprIntrp_GenRel;
class ExprIntrp_GenRel : public ExprIntrp_Generator {
	public:
		/****** ExprIntrp_GenRel::Create ******/
		/****** md5 signature: 327818c4a46de7831a3006ad0fa5284e ******/
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "Return
-------
opencascade::handle<ExprIntrp_GenRel>

Description
-----------
No available documentation.
") Create;
		static opencascade::handle<ExprIntrp_GenRel> Create();

		/****** ExprIntrp_GenRel::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false if any syntax error has occurred during process.
") IsDone;
		Standard_Boolean IsDone();

		/****** ExprIntrp_GenRel::Process ******/
		/****** md5 signature: 2b36655805fcdcb65bd9dff1fce15e9f ******/
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "
Parameters
----------
str: str

Return
-------
None

Description
-----------
Processes given string.
") Process;
		void Process(TCollection_AsciiString str);

		/****** ExprIntrp_GenRel::Relation ******/
		/****** md5 signature: 27e77b80110b2821273b98db328e0f1b ******/
		%feature("compactdefaultargs") Relation;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns relation generated. raises an exception if isdone answers false.
") Relation;
		opencascade::handle<Expr_GeneralRelation> Relation();

};


%make_alias(ExprIntrp_GenRel)

%extend ExprIntrp_GenRel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def ExprIntrp_GenExp_Create(*args):
	return ExprIntrp_GenExp.Create(*args)

@deprecated
def ExprIntrp_GenFct_Create(*args):
	return ExprIntrp_GenFct.Create(*args)

@deprecated
def ExprIntrp_GenRel_Create(*args):
	return ExprIntrp_GenRel.Create(*args)

}
