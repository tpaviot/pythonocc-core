Introduction
============

pythonocc-core is a wrapper for the OpenCascade Community Edition (OCE)
library.

Once imported, you can easily create Boundary Representation (B-Rep)
topology and geometry describing a mechanical object that can be
manufactured on machine tools.

First of all, before starting this tutorial, be sure that pythonocc
is properly installed on your machine.

From a python prompt, type the following::

  In [1]: import OCC
  In [2]: OCC.VERSION
  Out[2]: '0.17'

About this Document
-------------------

This document provides a short overview of what's possible to achieve using
pythonocc. pythonocc scope is quite huge, this document only covers a small
part of it. Instead of being an exhaustive documentation, consider this
as a tutorial, that is to say a way for you to smoothly enter the API,
and quickly become as autonomous as possible to dive into further details.

Each subtopic is related to a python example that can be found in the /examples
subfolder.
