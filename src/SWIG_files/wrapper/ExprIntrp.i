/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define EXPRINTRPDOCSTRING
"ExprIntrp module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_ExprIntrp.html"
%enddef
%module (package="OCC.Core", docstring=EXPRINTRPDOCSTRING) ExprIntrp

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include ExprIntrp_headers.i

/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(ExprIntrp_Generator)
%wrap_handle(ExprIntrp_GenExp)
%wrap_handle(ExprIntrp_GenFct)
%wrap_handle(ExprIntrp_GenRel)
/* end handles declaration */

/* templates */
%template(ExprIntrp_StackOfGeneralRelation) NCollection_List <opencascade::handle <Expr_GeneralRelation>>;
%template(ExprIntrp_ListIteratorOfStackOfGeneralRelation) NCollection_TListIterator<opencascade::handle<Expr_GeneralRelation>>;
%template(ExprIntrp_SequenceOfNamedFunction) NCollection_Sequence <opencascade::handle <Expr_NamedFunction>>;
%template(ExprIntrp_StackOfGeneralFunction) NCollection_List <opencascade::handle <Expr_GeneralFunction>>;
%template(ExprIntrp_ListIteratorOfStackOfGeneralFunction) NCollection_TListIterator<opencascade::handle<Expr_GeneralFunction>>;
%template(ExprIntrp_SequenceOfNamedExpression) NCollection_Sequence <opencascade::handle <Expr_NamedExpression>>;
%template(ExprIntrp_StackOfGeneralExpression) NCollection_List <opencascade::handle <Expr_GeneralExpression>>;
%template(ExprIntrp_ListIteratorOfStackOfGeneralExpression) NCollection_TListIterator<opencascade::handle<Expr_GeneralExpression>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List <opencascade::handle <Expr_GeneralRelation>> ExprIntrp_StackOfGeneralRelation;
typedef NCollection_List <opencascade::handle <Expr_GeneralRelation>>::Iterator ExprIntrp_ListIteratorOfStackOfGeneralRelation;
typedef NCollection_Sequence <opencascade::handle <Expr_NamedFunction>> ExprIntrp_SequenceOfNamedFunction;
typedef NCollection_List <opencascade::handle <Expr_GeneralFunction>> ExprIntrp_StackOfGeneralFunction;
typedef NCollection_List <opencascade::handle <Expr_GeneralFunction>>::Iterator ExprIntrp_ListIteratorOfStackOfGeneralFunction;
typedef NCollection_Sequence <opencascade::handle <Expr_NamedExpression>> ExprIntrp_SequenceOfNamedExpression;
typedef NCollection_List <opencascade::handle <Expr_GeneralExpression>> ExprIntrp_StackOfGeneralExpression;
typedef NCollection_List <opencascade::handle <Expr_GeneralExpression>>::Iterator ExprIntrp_ListIteratorOfStackOfGeneralExpression;
/* end typedefs declaration */

%rename(exprintrp) ExprIntrp;
%nodefaultctor ExprIntrp;
class ExprIntrp {
	public:
};


%extend ExprIntrp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_Analysis;
class ExprIntrp_Analysis {
	public:
		%feature("compactdefaultargs") ExprIntrp_Analysis;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_Analysis;
		 ExprIntrp_Analysis ();
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: opencascade::handle<Expr_NamedFunction>
") GetFunction;
		opencascade::handle<Expr_NamedFunction> GetFunction (const TCollection_AsciiString & name);
		%feature("compactdefaultargs") GetNamed;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: opencascade::handle<Expr_NamedExpression>
") GetNamed;
		opencascade::handle<Expr_NamedExpression> GetNamed (const TCollection_AsciiString & name);
		%feature("compactdefaultargs") IsExpStackEmpty;
		%feature("autodoc", "	:rtype: bool
") IsExpStackEmpty;
		Standard_Boolean IsExpStackEmpty ();
		%feature("compactdefaultargs") IsRelStackEmpty;
		%feature("autodoc", "	:rtype: bool
") IsRelStackEmpty;
		Standard_Boolean IsRelStackEmpty ();
		%feature("compactdefaultargs") Pop;
		%feature("autodoc", "	:rtype: opencascade::handle<Expr_GeneralExpression>
") Pop;
		opencascade::handle<Expr_GeneralExpression> Pop ();
		%feature("compactdefaultargs") PopFunction;
		%feature("autodoc", "	:rtype: opencascade::handle<Expr_GeneralFunction>
") PopFunction;
		opencascade::handle<Expr_GeneralFunction> PopFunction ();
		%feature("compactdefaultargs") PopName;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") PopName;
		TCollection_AsciiString PopName ();
		%feature("compactdefaultargs") PopRelation;
		%feature("autodoc", "	:rtype: opencascade::handle<Expr_GeneralRelation>
") PopRelation;
		opencascade::handle<Expr_GeneralRelation> PopRelation ();
		%feature("compactdefaultargs") PopValue;
		%feature("autodoc", "	:rtype: int
") PopValue;
		Standard_Integer PopValue ();
		%feature("compactdefaultargs") Push;
		%feature("autodoc", "	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Push;
		void Push (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") PushFunction;
		%feature("autodoc", "	:param func:
	:type func: opencascade::handle<Expr_GeneralFunction> &
	:rtype: None
") PushFunction;
		void PushFunction (const opencascade::handle<Expr_GeneralFunction> & func);
		%feature("compactdefaultargs") PushName;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: None
") PushName;
		void PushName (const TCollection_AsciiString & name);
		%feature("compactdefaultargs") PushRelation;
		%feature("autodoc", "	:param rel:
	:type rel: opencascade::handle<Expr_GeneralRelation> &
	:rtype: None
") PushRelation;
		void PushRelation (const opencascade::handle<Expr_GeneralRelation> & rel);
		%feature("compactdefaultargs") PushValue;
		%feature("autodoc", "	:param degree:
	:type degree: int
	:rtype: None
") PushValue;
		void PushValue (const Standard_Integer degree);
		%feature("compactdefaultargs") ResetAll;
		%feature("autodoc", "	:rtype: None
") ResetAll;
		void ResetAll ();
		%feature("compactdefaultargs") SetMaster;
		%feature("autodoc", "	:param agen:
	:type agen: opencascade::handle<ExprIntrp_Generator> &
	:rtype: None
") SetMaster;
		void SetMaster (const opencascade::handle<ExprIntrp_Generator> & agen);
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "	:param func:
	:type func: opencascade::handle<Expr_NamedFunction> &
	:rtype: None
") Use;
		void Use (const opencascade::handle<Expr_NamedFunction> & func);
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "	:param named:
	:type named: opencascade::handle<Expr_NamedExpression> &
	:rtype: None
") Use;
		void Use (const opencascade::handle<Expr_NamedExpression> & named);
};


%extend ExprIntrp_Analysis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_Generator;
class ExprIntrp_Generator : public Standard_Transient {
	public:
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "	* Returns NamedFunction with name <name> already interpreted if it exists. Returns a null handle if not.

	:param name:
	:type name: TCollection_AsciiString &
	:rtype: opencascade::handle<Expr_NamedFunction>
") GetFunction;
		opencascade::handle<Expr_NamedFunction> GetFunction (const TCollection_AsciiString & name);
		%feature("compactdefaultargs") GetFunctions;
		%feature("autodoc", "	:rtype: ExprIntrp_SequenceOfNamedFunction
") GetFunctions;
		const ExprIntrp_SequenceOfNamedFunction & GetFunctions ();
		%feature("compactdefaultargs") GetNamed;
		%feature("autodoc", "	:rtype: ExprIntrp_SequenceOfNamedExpression
") GetNamed;
		const ExprIntrp_SequenceOfNamedExpression & GetNamed ();
		%feature("compactdefaultargs") GetNamed;
		%feature("autodoc", "	* Returns NamedExpression with name <name> already interpreted if it exists. Returns a null handle if not.

	:param name:
	:type name: TCollection_AsciiString &
	:rtype: opencascade::handle<Expr_NamedExpression>
") GetNamed;
		opencascade::handle<Expr_NamedExpression> GetNamed (const TCollection_AsciiString & name);
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "	:param func:
	:type func: opencascade::handle<Expr_NamedFunction> &
	:rtype: None
") Use;
		void Use (const opencascade::handle<Expr_NamedFunction> & func);
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "	:param named:
	:type named: opencascade::handle<Expr_NamedExpression> &
	:rtype: None
") Use;
		void Use (const opencascade::handle<Expr_NamedExpression> & named);
};


%make_alias(ExprIntrp_Generator)

%extend ExprIntrp_Generator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_GenExp;
class ExprIntrp_GenExp : public ExprIntrp_Generator {
	public:
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "	:rtype: opencascade::handle<ExprIntrp_GenExp>
") Create;
		static opencascade::handle<ExprIntrp_GenExp> Create ();
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "	* Returns expression generated. Raises an exception if IsDone answers false.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Expression;
		opencascade::handle<Expr_GeneralExpression> Expression ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns false if any syntax error has occurred during process.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "	* Processes given string.

	:param str:
	:type str: TCollection_AsciiString &
	:rtype: None
") Process;
		void Process (const TCollection_AsciiString & str);
};


%make_alias(ExprIntrp_GenExp)

%extend ExprIntrp_GenExp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_GenFct;
class ExprIntrp_GenFct : public ExprIntrp_Generator {
	public:
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "	:rtype: opencascade::handle<ExprIntrp_GenFct>
") Create;
		static opencascade::handle<ExprIntrp_GenFct> Create ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "	:param str:
	:type str: TCollection_AsciiString &
	:rtype: None
") Process;
		void Process (const TCollection_AsciiString & str);
};


%make_alias(ExprIntrp_GenFct)

%extend ExprIntrp_GenFct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_GenRel;
class ExprIntrp_GenRel : public ExprIntrp_Generator {
	public:
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "	:rtype: opencascade::handle<ExprIntrp_GenRel>
") Create;
		static opencascade::handle<ExprIntrp_GenRel> Create ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns false if any syntax error has occurred during process.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "	* Processes given string.

	:param str:
	:type str: TCollection_AsciiString &
	:rtype: None
") Process;
		void Process (const TCollection_AsciiString & str);
		%feature("compactdefaultargs") Relation;
		%feature("autodoc", "	* Returns relation generated. Raises an exception if IsDone answers false.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Relation;
		opencascade::handle<Expr_GeneralRelation> Relation ();
};


%make_alias(ExprIntrp_GenRel)

%extend ExprIntrp_GenRel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
