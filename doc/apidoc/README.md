sphinx based api documentation

rst files were generated wih::

    $ sphinx-apidoc /Library/Python/2.7/site-packages/OCC --separate -o apidoc

(on osx)

To build the doc by yourself::

    $ make html
