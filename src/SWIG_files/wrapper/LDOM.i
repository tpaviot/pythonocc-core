/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") LDOM

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include LDOM_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef char LXMLCh;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor LDOM_BasicNode;
class LDOM_BasicNode {
	public:
		%feature("compactdefaultargs") isNull;
		%feature("autodoc", "	:rtype: : bool
") isNull;
		: Standard_Boolean isNull ();
		%feature("compactdefaultargs") getNodeType;
		%feature("autodoc", "	:rtype: LDOM_Node::NodeType
") getNodeType;
		LDOM_Node::NodeType getNodeType ();
		%feature("compactdefaultargs") GetSibling;
		%feature("autodoc", "	:rtype: LDOM_BasicNode *
") GetSibling;
		const LDOM_BasicNode * GetSibling ();
};


%extend LDOM_BasicNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_CharReference;
class LDOM_CharReference {
	public:
		%feature("compactdefaultargs") Decode;
		%feature("autodoc", "	:param theSrc:
	:type theSrc: char *
	:param theLen:
	:type theLen: int &
	:rtype: char *
") Decode;
		static char * Decode (char * theSrc,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Encode;
		%feature("autodoc", "	:param theSrc:
	:type theSrc: char *
	:param theLen:
	:type theLen: int &
	:param isAttribute:
	:type isAttribute: bool
	:rtype: char *
") Encode;
		static char * Encode (const char * theSrc,Standard_Integer &OutValue,const Standard_Boolean isAttribute);
};


%extend LDOM_CharReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_Document;
class LDOM_Document {
	public:
		%feature("compactdefaultargs") LDOM_Document;
		%feature("autodoc", "	:rtype: None
") LDOM_Document;
		 LDOM_Document ();
		%feature("compactdefaultargs") LDOM_Document;
		%feature("autodoc", "	:param aMemManager:
	:type aMemManager: LDOM_MemManager &
	:rtype: None
") LDOM_Document;
		 LDOM_Document (const LDOM_MemManager & aMemManager);
		%feature("compactdefaultargs") createDocument;
		%feature("autodoc", "	:param theQualifiedName:
	:type theQualifiedName: LDOMString &
	:rtype: LDOM_Document
") createDocument;
		static LDOM_Document createDocument (const LDOMString & theQualifiedName);
		%feature("compactdefaultargs") createElement;
		%feature("autodoc", "	:param theTagName:
	:type theTagName: LDOMString &
	:rtype: LDOM_Element
") createElement;
		LDOM_Element createElement (const LDOMString & theTagName);
		%feature("compactdefaultargs") createCDATASection;
		%feature("autodoc", "	:param theData:
	:type theData: LDOMString &
	:rtype: LDOM_CDATASection
") createCDATASection;
		LDOM_CDATASection createCDATASection (const LDOMString & theData);
		%feature("compactdefaultargs") createComment;
		%feature("autodoc", "	:param theData:
	:type theData: LDOMString &
	:rtype: LDOM_Comment
") createComment;
		LDOM_Comment createComment (const LDOMString & theData);
		%feature("compactdefaultargs") createTextNode;
		%feature("autodoc", "	:param theData:
	:type theData: LDOMString &
	:rtype: LDOM_Text
") createTextNode;
		LDOM_Text createTextNode (const LDOMString & theData);
		%feature("compactdefaultargs") getDocumentElement;
		%feature("autodoc", "	:rtype: LDOM_Element
") getDocumentElement;
		LDOM_Element getDocumentElement ();
		%feature("compactdefaultargs") getElementsByTagName;
		%feature("autodoc", "	:param theTagName:
	:type theTagName: LDOMString &
	:rtype: LDOM_NodeList
") getElementsByTagName;
		LDOM_NodeList getElementsByTagName (const LDOMString & theTagName);

        %extend{
            bool __eq_wrapper__(const LDOM_Document  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        
        %extend{
            bool __ne_wrapper__(const LDOM_Document  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        
        %extend{
            bool __eq_wrapper__(const LDOM_NullPtr * other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        
        %extend{
            bool __ne_wrapper__(const LDOM_NullPtr * other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("compactdefaultargs") isNull;
		%feature("autodoc", "	:rtype: bool
") isNull;
		Standard_Boolean isNull ();
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param :
	:type : LDOM_NullPtr *
	:rtype: LDOM_Document
") operator =;
		LDOM_Document & operator = (const LDOM_NullPtr * );
};


%extend LDOM_Document {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_DocumentType;
class LDOM_DocumentType {
	public:
		%feature("compactdefaultargs") LDOM_DocumentType;
		%feature("autodoc", "	:rtype: None
") LDOM_DocumentType;
		 LDOM_DocumentType ();
};


%extend LDOM_DocumentType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_LDOMImplementation;
class LDOM_LDOMImplementation {
	public:
		%feature("compactdefaultargs") createDocument;
		%feature("autodoc", "	:param aNamespaceURI:
	:type aNamespaceURI: LDOMString &
	:param aQualifiedName:
	:type aQualifiedName: LDOMString &
	:param aDocType:
	:type aDocType: LDOM_DocumentType &
	:rtype: LDOM_Document
") createDocument;
		static LDOM_Document createDocument (const LDOMString & aNamespaceURI,const LDOMString & aQualifiedName,const LDOM_DocumentType & aDocType);
};


%extend LDOM_LDOMImplementation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_MemManager;
class LDOM_MemManager : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") LDOM_MemManager;
		%feature("autodoc", "	:param aBlockSize:
	:type aBlockSize: int
	:rtype: None
") LDOM_MemManager;
		 LDOM_MemManager (const Standard_Integer aBlockSize);
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "	:param aSize:
	:type aSize: int
	:rtype: void *
") Allocate;
		void * Allocate (const Standard_Integer aSize);
		%feature("compactdefaultargs") HashedAllocate;
		%feature("autodoc", "	:param aString:
	:type aString: char *
	:param theLen:
	:type theLen: int
	:param theHash:
	:type theHash: int &
	:rtype: char *
") HashedAllocate;
		const char * HashedAllocate (const char * aString,const Standard_Integer theLen,Standard_Integer &OutValue);
		%feature("compactdefaultargs") HashedAllocate;
		%feature("autodoc", "	:param aString:
	:type aString: char *
	:param theLen:
	:type theLen: int
	:param theResult:
	:type theResult: LDOMBasicString &
	:rtype: None
") HashedAllocate;
		void HashedAllocate (const char * aString,const Standard_Integer theLen,LDOMBasicString & theResult);
		%feature("compactdefaultargs") Hash;
		%feature("autodoc", "	:param theString:
	:type theString: char *
	:param theLen:
	:type theLen: int
	:rtype: int
") Hash;
		static Standard_Integer Hash (const char * theString,const Standard_Integer theLen);
		%feature("compactdefaultargs") CompareStrings;
		%feature("autodoc", "	:param theString:
	:type theString: char *
	:param theHashValue:
	:type theHashValue: int
	:param theHashedStr:
	:type theHashedStr: char *
	:rtype: bool
") CompareStrings;
		static Standard_Boolean CompareStrings (const char * theString,const Standard_Integer theHashValue,const char * theHashedStr);
		%feature("compactdefaultargs") Doc;
		%feature("autodoc", "	:rtype: LDOM_Document
") Doc;
		LDOM_Document Doc ();
		%feature("compactdefaultargs") Self;
		%feature("autodoc", "	:rtype: LDOM_MemManager
") Self;
		const LDOM_MemManager & Self ();
		%feature("compactdefaultargs") RootElement;
		%feature("autodoc", "	:rtype: LDOM_BasicElement *
") RootElement;
		const LDOM_BasicElement * RootElement ();
};


%extend LDOM_MemManager {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_LDOM_MemManager(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_LDOM_MemManager::Handle_LDOM_MemManager %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_LDOM_MemManager;
class Handle_LDOM_MemManager : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_LDOM_MemManager();
        Handle_LDOM_MemManager(const Handle_LDOM_MemManager &aHandle);
        Handle_LDOM_MemManager(const LDOM_MemManager *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_LDOM_MemManager DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_LDOM_MemManager {
    LDOM_MemManager* _get_reference() {
    return (LDOM_MemManager*)$self->Access();
    }
};

%extend Handle_LDOM_MemManager {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend LDOM_MemManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_Node;
class LDOM_Node {
	public:
/* public enums */
enum NodeType {
	UNKNOWN = 0,
	ELEMENT_NODE = 1,
	ATTRIBUTE_NODE = 2,
	TEXT_NODE = 3,
	CDATA_SECTION_NODE = 4,
	COMMENT_NODE = 8,
};

/* end public enums declaration */

		%feature("compactdefaultargs") LDOM_Node;
		%feature("autodoc", "	:rtype: None
") LDOM_Node;
		 LDOM_Node ();
		%feature("compactdefaultargs") LDOM_Node;
		%feature("autodoc", "	:param anOther:
	:type anOther: LDOM_Node &
	:rtype: None
") LDOM_Node;
		 LDOM_Node (const LDOM_Node & anOther);
		%feature("compactdefaultargs") getOwnerDocument;
		%feature("autodoc", "	:rtype: LDOM_MemManager
") getOwnerDocument;
		const LDOM_MemManager & getOwnerDocument ();
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param anOther:
	:type anOther: LDOM_Node &
	:rtype: LDOM_Node
") operator =;
		LDOM_Node & operator = (const LDOM_Node & anOther);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param aNull:
	:type aNull: LDOM_NullPtr *
	:rtype: LDOM_Node
") operator =;
		LDOM_Node & operator = (const LDOM_NullPtr * aNull);

        %extend{
            bool __eq_wrapper__(const LDOM_NullPtr * other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        
        %extend{
            bool __ne_wrapper__(const LDOM_NullPtr * other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        
        %extend{
            bool __eq_wrapper__(const LDOM_Node  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        
        %extend{
            bool __ne_wrapper__(const LDOM_Node  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("compactdefaultargs") isNull;
		%feature("autodoc", "	:rtype: bool
") isNull;
		Standard_Boolean isNull ();
		%feature("compactdefaultargs") getNodeType;
		%feature("autodoc", "	:rtype: NodeType
") getNodeType;
		NodeType getNodeType ();
		%feature("compactdefaultargs") getNodeName;
		%feature("autodoc", "	:rtype: LDOMString
") getNodeName;
		LDOMString getNodeName ();
		%feature("compactdefaultargs") getNodeValue;
		%feature("autodoc", "	:rtype: LDOMString
") getNodeValue;
		LDOMString getNodeValue ();
		%feature("compactdefaultargs") getFirstChild;
		%feature("autodoc", "	:rtype: LDOM_Node
") getFirstChild;
		LDOM_Node getFirstChild ();
		%feature("compactdefaultargs") getLastChild;
		%feature("autodoc", "	:rtype: LDOM_Node
") getLastChild;
		LDOM_Node getLastChild ();
		%feature("compactdefaultargs") getNextSibling;
		%feature("autodoc", "	:rtype: LDOM_Node
") getNextSibling;
		LDOM_Node getNextSibling ();
		%feature("compactdefaultargs") removeChild;
		%feature("autodoc", "	:param aChild:
	:type aChild: LDOM_Node &
	:rtype: None
") removeChild;
		void removeChild (const LDOM_Node & aChild);
		%feature("compactdefaultargs") appendChild;
		%feature("autodoc", "	:param aChild:
	:type aChild: LDOM_Node &
	:rtype: None
") appendChild;
		void appendChild (const LDOM_Node & aChild);
		%feature("compactdefaultargs") hasChildNodes;
		%feature("autodoc", "	:rtype: bool
") hasChildNodes;
		Standard_Boolean hasChildNodes ();
		%feature("compactdefaultargs") SetValueClear;
		%feature("autodoc", "	:rtype: None
") SetValueClear;
		void SetValueClear ();
};


%extend LDOM_Node {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_NodeList;
class LDOM_NodeList {
	public:
		%feature("compactdefaultargs") LDOM_NodeList;
		%feature("autodoc", "	:rtype: None
") LDOM_NodeList;
		 LDOM_NodeList ();
		%feature("compactdefaultargs") LDOM_NodeList;
		%feature("autodoc", "	:param theOther:
	:type theOther: LDOM_NodeList &
	:rtype: None
") LDOM_NodeList;
		 LDOM_NodeList (const LDOM_NodeList & theOther);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param theOther:
	:type theOther: LDOM_NodeList &
	:rtype: LDOM_NodeList
") operator =;
		LDOM_NodeList & operator = (const LDOM_NodeList & theOther);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param :
	:type : LDOM_NullPtr *
	:rtype: LDOM_NodeList
") operator =;
		LDOM_NodeList & operator = (const LDOM_NullPtr * );

        %extend{
            bool __eq_wrapper__(const LDOM_NullPtr * other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        
        %extend{
            bool __ne_wrapper__(const LDOM_NullPtr * other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("compactdefaultargs") item;
		%feature("autodoc", "	:param Standard_Integer:
	:type Standard_Integer: 
	:rtype: LDOM_Node
") item;
		LDOM_Node item (const Standard_Integer);
		%feature("compactdefaultargs") getLength;
		%feature("autodoc", "	:rtype: int
") getLength;
		Standard_Integer getLength ();
};


%extend LDOM_NodeList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_OSStream;
class LDOM_OSStream : public Standard_OStream {
	public:
		%feature("compactdefaultargs") LDOM_OSStream;
		%feature("autodoc", "	:param theMaxBuf:
	:type theMaxBuf: int
	:rtype: None
") LDOM_OSStream;
		 LDOM_OSStream (const Standard_Integer theMaxBuf);
		%feature("compactdefaultargs") str;
		%feature("autodoc", "	:rtype: char *
") str;
		const char * str ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
};


%extend LDOM_OSStream {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_SBuffer;
class LDOM_SBuffer : public streambuf {
	public:
		%feature("compactdefaultargs") LDOM_SBuffer;
		%feature("autodoc", "	:param theMaxBuf:
	:type theMaxBuf: int
	:rtype: None
") LDOM_SBuffer;
		 LDOM_SBuffer (const Standard_Integer theMaxBuf);
		%feature("compactdefaultargs") str;
		%feature("autodoc", "	:rtype: char *
") str;
		const char * str ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") overflow;
		%feature("autodoc", "	:param c: default value is EOF
	:type c: int
	:rtype: int
") overflow;
		virtual int overflow (int c = EOF);
		%feature("compactdefaultargs") underflow;
		%feature("autodoc", "	:rtype: int
") underflow;
		virtual int underflow ();
		%feature("compactdefaultargs") xsputn;
		%feature("autodoc", "	:param s:
	:type s: char *
	:param n:
	:type n: std::streamsize
	:rtype: std::streamsize
") xsputn;
		virtual std::streamsize xsputn (const char * s,std::streamsize n);
};


%extend LDOM_SBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_XmlReader;
class LDOM_XmlReader {
	public:
/* public enums */
enum RecordType {
	XML_UNKNOWN = 0,
	XML_HEADER = 1,
	XML_DOCTYPE = 2,
	XML_COMMENT = 3,
	XML_START_ELEMENT = 4,
	XML_END_ELEMENT = 5,
	XML_FULL_ELEMENT = 6,
	XML_TEXT = 7,
	XML_CDATA = 8,
	XML_EOF = 9,
};

/* end public enums declaration */

		%feature("compactdefaultargs") LDOM_XmlReader;
		%feature("autodoc", "	:param aFileDes:
	:type aFileDes: int
	:param aDocument:
	:type aDocument: Handle_LDOM_MemManager &
	:param anErrorString:
	:type anErrorString: TCollection_AsciiString &
	:rtype: None
") LDOM_XmlReader;
		 LDOM_XmlReader (const int aFileDes,const Handle_LDOM_MemManager & aDocument,TCollection_AsciiString & anErrorString);
		%feature("compactdefaultargs") LDOM_XmlReader;
		%feature("autodoc", "	:param anInput:
	:type anInput: istream &
	:param aDocument:
	:type aDocument: Handle_LDOM_MemManager &
	:param anErrorString:
	:type anErrorString: TCollection_AsciiString &
	:rtype: None
") LDOM_XmlReader;
		 LDOM_XmlReader (istream & anInput,const Handle_LDOM_MemManager & aDocument,TCollection_AsciiString & anErrorString);
		%feature("compactdefaultargs") ReadRecord;
		%feature("autodoc", "	:param theData:
	:type theData: LDOM_OSStream &
	:rtype: RecordType
") ReadRecord;
		RecordType ReadRecord (LDOM_OSStream & theData);
		%feature("compactdefaultargs") GetElement;
		%feature("autodoc", "	:rtype: LDOM_BasicElement
") GetElement;
		LDOM_BasicElement & GetElement ();
		%feature("compactdefaultargs") getInteger;
		%feature("autodoc", "	:param theValue:
	:type theValue: LDOMBasicString &
	:param theStart:
	:type theStart: char *
	:param theEnd:
	:type theEnd: char *
	:rtype: bool
") getInteger;
		static Standard_Boolean getInteger (LDOMBasicString & theValue,const char * theStart,const char * theEnd);
};


%extend LDOM_XmlReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_XmlWriter;
class LDOM_XmlWriter {
	public:
		%feature("compactdefaultargs") LDOM_XmlWriter;
		%feature("autodoc", "	:param aFile:
	:type aFile: FILE *
	:param theEncoding: default value is NULL
	:type theEncoding: char *
	:rtype: None
") LDOM_XmlWriter;
		 LDOM_XmlWriter (FILE * aFile,const char * theEncoding = NULL);
		%feature("compactdefaultargs") SetIndentation;
		%feature("autodoc", "	:param theIndent:
	:type theIndent: int
	:rtype: None
") SetIndentation;
		void SetIndentation (const Standard_Integer theIndent);
};


%extend LDOM_XmlWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_Attr;
class LDOM_Attr : public LDOM_Node {
	public:
		%feature("compactdefaultargs") LDOM_Attr;
		%feature("autodoc", "	:rtype: None
") LDOM_Attr;
		 LDOM_Attr ();
		%feature("compactdefaultargs") LDOM_Attr;
		%feature("autodoc", "	:param anOther:
	:type anOther: LDOM_Attr &
	:rtype: None
") LDOM_Attr;
		 LDOM_Attr (const LDOM_Attr & anOther);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param aNull:
	:type aNull: LDOM_NullPtr *
	:rtype: LDOM_Attr
") operator =;
		LDOM_Attr & operator = (const LDOM_NullPtr * aNull);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param anOther:
	:type anOther: LDOM_Attr &
	:rtype: LDOM_Attr
") operator =;
		LDOM_Attr & operator = (const LDOM_Attr & anOther);
		%feature("compactdefaultargs") getName;
		%feature("autodoc", "	:rtype: LDOMString
") getName;
		LDOMString getName ();
		%feature("compactdefaultargs") getValue;
		%feature("autodoc", "	:rtype: LDOMString
") getValue;
		LDOMString getValue ();
		%feature("compactdefaultargs") setValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: LDOMString &
	:rtype: None
") setValue;
		void setValue (const LDOMString & aValue);
};


%extend LDOM_Attr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_BasicAttribute;
class LDOM_BasicAttribute : public LDOM_BasicNode {
	public:
		%feature("compactdefaultargs") LDOM_BasicAttribute;
		%feature("autodoc", "	:rtype: None
") LDOM_BasicAttribute;
		 LDOM_BasicAttribute ();
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param aNull:
	:type aNull: LDOM_NullPtr *
	:rtype: LDOM_BasicAttribute
") operator =;
		LDOM_BasicAttribute & operator = (const LDOM_NullPtr * aNull);
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: char *
") GetName;
		const char * GetName ();
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "	:rtype: LDOMBasicString
") GetValue;
		const LDOMBasicString & GetValue ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: LDOMBasicString &
	:param aDoc:
	:type aDoc: Handle_LDOM_MemManager &
	:rtype: None
") SetValue;
		void SetValue (const LDOMBasicString & aValue,const Handle_LDOM_MemManager & aDoc);
};


%extend LDOM_BasicAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_BasicElement;
class LDOM_BasicElement : public LDOM_BasicNode {
	public:
		%feature("compactdefaultargs") LDOM_BasicElement;
		%feature("autodoc", "	:rtype: None
") LDOM_BasicElement;
		 LDOM_BasicElement ();
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "	:param aName:
	:type aName: char *
	:param aLength:
	:type aLength: int
	:param aDoc:
	:type aDoc: Handle_LDOM_MemManager &
	:rtype: LDOM_BasicElement
") Create;
		static LDOM_BasicElement & Create (const char * aName,const Standard_Integer aLength,const Handle_LDOM_MemManager & aDoc);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param aNull:
	:type aNull: LDOM_NullPtr *
	:rtype: LDOM_BasicElement
") operator =;
		LDOM_BasicElement & operator = (const LDOM_NullPtr * aNull);
		%feature("compactdefaultargs") GetTagName;
		%feature("autodoc", "	:rtype: char *
") GetTagName;
		const char * GetTagName ();
		%feature("compactdefaultargs") GetFirstChild;
		%feature("autodoc", "	:rtype: LDOM_BasicNode *
") GetFirstChild;
		const LDOM_BasicNode * GetFirstChild ();
		%feature("compactdefaultargs") GetLastChild;
		%feature("autodoc", "	:rtype: LDOM_BasicNode *
") GetLastChild;
		const LDOM_BasicNode * GetLastChild ();
		%feature("compactdefaultargs") GetAttribute;
		%feature("autodoc", "	:param aName:
	:type aName: LDOMBasicString &
	:param aLastCh:
	:type aLastCh: LDOM_BasicNode *
	:rtype: LDOM_BasicAttribute
") GetAttribute;
		const LDOM_BasicAttribute & GetAttribute (const LDOMBasicString & aName,const LDOM_BasicNode * aLastCh);
};


%extend LDOM_BasicElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_BasicText;
class LDOM_BasicText : public LDOM_BasicNode {
	public:
		%feature("compactdefaultargs") LDOM_BasicText;
		%feature("autodoc", "	:rtype: None
") LDOM_BasicText;
		 LDOM_BasicText ();
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param aNull:
	:type aNull: LDOM_NullPtr *
	:rtype: LDOM_BasicText
") operator =;
		LDOM_BasicText & operator = (const LDOM_NullPtr * aNull);
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "	:rtype: LDOMBasicString
") GetData;
		const LDOMBasicString & GetData ();
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "	:param aValue:
	:type aValue: LDOMBasicString &
	:param aDoc:
	:type aDoc: Handle_LDOM_MemManager &
	:rtype: None
") SetData;
		void SetData (const LDOMBasicString & aValue,const Handle_LDOM_MemManager & aDoc);
};


%extend LDOM_BasicText {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_CharacterData;
class LDOM_CharacterData : public LDOM_Node {
	public:
		%feature("compactdefaultargs") LDOM_CharacterData;
		%feature("autodoc", "	:rtype: None
") LDOM_CharacterData;
		 LDOM_CharacterData ();
		%feature("compactdefaultargs") LDOM_CharacterData;
		%feature("autodoc", "	:param theOther:
	:type theOther: LDOM_CharacterData &
	:rtype: None
") LDOM_CharacterData;
		 LDOM_CharacterData (const LDOM_CharacterData & theOther);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param aNull:
	:type aNull: LDOM_NullPtr *
	:rtype: LDOM_CharacterData
") operator =;
		LDOM_CharacterData & operator = (const LDOM_NullPtr * aNull);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param anOther:
	:type anOther: LDOM_CharacterData &
	:rtype: LDOM_CharacterData
") operator =;
		LDOM_CharacterData & operator = (const LDOM_CharacterData & anOther);
		%feature("compactdefaultargs") getData;
		%feature("autodoc", "	:rtype: LDOMString
") getData;
		LDOMString getData ();
		%feature("compactdefaultargs") setData;
		%feature("autodoc", "	:param aValue:
	:type aValue: LDOMString &
	:rtype: None
") setData;
		void setData (const LDOMString & aValue);
		%feature("compactdefaultargs") getLength;
		%feature("autodoc", "	:rtype: int
") getLength;
		Standard_Integer getLength ();
};


%extend LDOM_CharacterData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_Element;
class LDOM_Element : public LDOM_Node {
	public:
		%feature("compactdefaultargs") LDOM_Element;
		%feature("autodoc", "	:rtype: None
") LDOM_Element;
		 LDOM_Element ();
		%feature("compactdefaultargs") LDOM_Element;
		%feature("autodoc", "	:param anOther:
	:type anOther: LDOM_Element &
	:rtype: None
") LDOM_Element;
		 LDOM_Element (const LDOM_Element & anOther);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param anOther:
	:type anOther: LDOM_Element &
	:rtype: LDOM_Element
") operator =;
		LDOM_Element & operator = (const LDOM_Element & anOther);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param aNull:
	:type aNull: LDOM_NullPtr *
	:rtype: LDOM_Element
") operator =;
		LDOM_Element & operator = (const LDOM_NullPtr * aNull);
		%feature("compactdefaultargs") getTagName;
		%feature("autodoc", "	:rtype: LDOMString
") getTagName;
		LDOMString getTagName ();
		%feature("compactdefaultargs") getAttribute;
		%feature("autodoc", "	:param aName:
	:type aName: LDOMString &
	:rtype: LDOMString
") getAttribute;
		LDOMString getAttribute (const LDOMString & aName);
		%feature("compactdefaultargs") getAttributeNode;
		%feature("autodoc", "	:param aName:
	:type aName: LDOMString &
	:rtype: LDOM_Attr
") getAttributeNode;
		LDOM_Attr getAttributeNode (const LDOMString & aName);
		%feature("compactdefaultargs") getElementsByTagName;
		%feature("autodoc", "	:param aName:
	:type aName: LDOMString &
	:rtype: LDOM_NodeList
") getElementsByTagName;
		LDOM_NodeList getElementsByTagName (const LDOMString & aName);
		%feature("compactdefaultargs") setAttribute;
		%feature("autodoc", "	:param aName:
	:type aName: LDOMString &
	:param aValue:
	:type aValue: LDOMString &
	:rtype: None
") setAttribute;
		void setAttribute (const LDOMString & aName,const LDOMString & aValue);
		%feature("compactdefaultargs") setAttributeNode;
		%feature("autodoc", "	:param aNewAttr:
	:type aNewAttr: LDOM_Attr &
	:rtype: None
") setAttributeNode;
		void setAttributeNode (const LDOM_Attr & aNewAttr);
		%feature("compactdefaultargs") removeAttribute;
		%feature("autodoc", "	:param aName:
	:type aName: LDOMString &
	:rtype: None
") removeAttribute;
		void removeAttribute (const LDOMString & aName);
		%feature("compactdefaultargs") GetChildByTagName;
		%feature("autodoc", "	:param aTagName:
	:type aTagName: LDOMString &
	:rtype: LDOM_Element
") GetChildByTagName;
		LDOM_Element GetChildByTagName (const LDOMString & aTagName);
		%feature("compactdefaultargs") GetSiblingByTagName;
		%feature("autodoc", "	:rtype: LDOM_Element
") GetSiblingByTagName;
		LDOM_Element GetSiblingByTagName ();
		%feature("compactdefaultargs") ReplaceElement;
		%feature("autodoc", "	:param anOther:
	:type anOther: LDOM_Element &
	:rtype: None
") ReplaceElement;
		void ReplaceElement (const LDOM_Element & anOther);
		%feature("compactdefaultargs") GetAttributesList;
		%feature("autodoc", "	:rtype: LDOM_NodeList
") GetAttributesList;
		LDOM_NodeList GetAttributesList ();
};


%extend LDOM_Element {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_Comment;
class LDOM_Comment : public LDOM_CharacterData {
	public:
		%feature("compactdefaultargs") LDOM_Comment;
		%feature("autodoc", "	:rtype: None
") LDOM_Comment;
		 LDOM_Comment ();
		%feature("compactdefaultargs") LDOM_Comment;
		%feature("autodoc", "	:param theOther:
	:type theOther: LDOM_Comment &
	:rtype: None
") LDOM_Comment;
		 LDOM_Comment (const LDOM_Comment & theOther);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param theNull:
	:type theNull: LDOM_NullPtr *
	:rtype: LDOM_Comment
") operator =;
		LDOM_Comment & operator = (const LDOM_NullPtr * theNull);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param theOther:
	:type theOther: LDOM_Comment &
	:rtype: LDOM_Comment
") operator =;
		LDOM_Comment & operator = (const LDOM_Comment & theOther);
};


%extend LDOM_Comment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_Text;
class LDOM_Text : public LDOM_CharacterData {
	public:
		%feature("compactdefaultargs") LDOM_Text;
		%feature("autodoc", "	:rtype: None
") LDOM_Text;
		 LDOM_Text ();
		%feature("compactdefaultargs") LDOM_Text;
		%feature("autodoc", "	:param anOther:
	:type anOther: LDOM_Text &
	:rtype: None
") LDOM_Text;
		 LDOM_Text (const LDOM_Text & anOther);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param theNull:
	:type theNull: LDOM_NullPtr *
	:rtype: LDOM_Text
") operator =;
		LDOM_Text & operator = (const LDOM_NullPtr * theNull);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param theOther:
	:type theOther: LDOM_Text &
	:rtype: LDOM_Text
") operator =;
		LDOM_Text & operator = (const LDOM_Text & theOther);
};


%extend LDOM_Text {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LDOM_CDATASection;
class LDOM_CDATASection : public LDOM_Text {
	public:
		%feature("compactdefaultargs") LDOM_CDATASection;
		%feature("autodoc", "	:rtype: None
") LDOM_CDATASection;
		 LDOM_CDATASection ();
		%feature("compactdefaultargs") LDOM_CDATASection;
		%feature("autodoc", "	:param theOther:
	:type theOther: LDOM_CDATASection &
	:rtype: None
") LDOM_CDATASection;
		 LDOM_CDATASection (const LDOM_CDATASection & theOther);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param theNull:
	:type theNull: LDOM_NullPtr *
	:rtype: LDOM_CDATASection
") operator =;
		LDOM_CDATASection & operator = (const LDOM_NullPtr * theNull);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param theOther:
	:type theOther: LDOM_CDATASection &
	:rtype: LDOM_CDATASection
") operator =;
		LDOM_CDATASection & operator = (const LDOM_CDATASection & theOther);
};


%extend LDOM_CDATASection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
