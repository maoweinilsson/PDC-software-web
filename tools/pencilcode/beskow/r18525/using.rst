:orphan:

.. include:: using.inc

Since 21 September 2008 the Pencil Code is available under
<http://code.google.com/p/pencil-code/>

To check out the code, follow the notes on:
<http://www.nordita.org/software/pencil-code/svn-transition-google.html>

To get started, run one of the samples::

  unix\>  cd pencil-code
  unix\>  source sourceme.csh  \[or . sourceme.sh\]
  unix\>  cd samples/conv-slab
  unix\>  mkdir data

To set up the symbolic links and compile the code::

  unix\>  pc_setupsrc
  unix\>  pc_build  \[ -f /path/to/config/file.conf \]

To create the initial condition and run the code::

  unix\>  pc_start  \[ -f /path/to/config/file.conf \]
  unix\>  pc_run    \[ -f /path/to/config/file.conf \]

See pencil-code/config/hosts/*/*.conf for sample config files. For more details,
see the manual in the doc/ directory (also available from the URL above).

=============================================================================

To get started, run the following command::
  unix\>  source  \$PENCIL_HOME/sourceme.csh  \[or . sourceme.sh\]
 
If you are using bash and you do not want to \source sourceme.sh\ on each
session, you can insert the following into your .bashrc and/or .bash_profile::

  export PENCIL_HOME=\$HOME/pencil-code  \[or wherever you have the code\]
  _sourceme_quiet=1; . \$PENCIL_HOME/sourceme.sh; unset _sourceme_quiet

If you are using csh insert the following into your .cshrc::

  setenv PENCIL_HOME \$HOME/pencil-code \[or wherever you have the code\]
  source \$PENCIL_HOME/sourceme.csh
