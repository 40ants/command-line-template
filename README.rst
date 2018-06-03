=======================================
 Common Lisp Command Line App template
=======================================

This is a template for a command line application written in Common
Lisp. It can be build into the binary with a single ``make`` command if
you already have `Roswell`_ and `Qlot`_ installed.

Also, this template uses `defmain`_ as a command line arguments parser.
And `cl-info`_ for collecting information about Lisp environment in case
if your user need to report information.

Here is how it looks like:

.. code:: bash

   [...s/lisp/makefile-template]% make
   qlot install
   Installing Quicklisp to /Users/art/projects/lisp/makefile-template/quicklisp/ ...
   ; Fetching #<URL "http://beta.quicklisp.org/quicklisp.lisp">
   ; 55.80KB
   Reading '/Users/art/projects/lisp/makefile-template/qlfile'...
   ; Fetching #<URL "http://beta.quicklisp.org/dist/quicklisp.txt">
   ; 0.40KB
   ==================================================
   408 bytes in 0.00 seconds (928.76KB/sec)
   Already have dist "quicklisp" version "2018-04-30".
   Installing dist "defmain".
   Installing dist "cl-info".
   Successfully installed.
   qlot exec ros -L sbcl-bin build app.ros
   *******************************************************************
   * WARNING: the CC environment variable is not set.                *
   * Clon will be loaded without support for terminal autodetection. *
   * See sections 2 and A.1 of the user manual for more information. *
   *******************************************************************compressed 0 bytes into 8 at level -1
   compressed 32768 bytes into 399 at level -1
   compressed 34275328 bytes into 7490420 at level -1
   compressed 2162688 bytes into 574214 at level -1
   compressed 13303808 bytes into 4028984 at level -1
   
   [...s/lisp/makefile-template]% ./app --version
   Version: 0.1.0
   
   [...s/lisp/makefile-template]% ./app --version --verbose
   Version: 0.1.0
   OS:   Darwin 15.6.0
   Lisp: SBCL 1.4.3
   ASDF: 3.3.1.1
   QL:  cl-info github-c2e0d055549e1649861163a4cdcb6dd67137f114
        defmain github-d335d24faf96e131d05991a6f401bd9b44e1c512
        quicklisp 2018-04-30

Makefile
========

Makefile was does following things:

* It creates a local ``quicklisp`` directory.
* Installs all dists mentioned in the ``qlfile``.
* Builds binaries for all ``*.ros`` scripts in the directory.

Qlot_ is pinning dists version, so after update to ``qlfile`` file you
need to execute ``make lock`` to pin dependencies in the
``qlfile.lock``.

Building with different Lisps
=============================

By default, Makefile uses SBCL to build a binary. But you may choose any
Lisp, supported by Roswell_. Just set the LISP environment variable:

.. code:: bash

   make clean
   make LISP=ccl-bin

To check which Lisp are supported, run:

.. code:: bash

   ros list versions

.. _roswell: https://github.com/roswell/roswell
.. _qlot: https://github.com/fukamachi/qlot
.. _defmain: https://github.com/40ants/defmain
.. _cl-info: https://github.com/40ants/cl-info

