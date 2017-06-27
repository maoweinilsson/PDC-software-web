# PDC-software-web
This repository contains documentation regarding software at PDC.
All files should be created in sphinx and are rendered to the readthedocs site.
  
Update installed software
=========================

Follow the default procedure using :ref:`git_tool` with repository
https://github.com/PDC-support/PDC-software-web

Page is rendered to http://pdc-software-web.readthedocs.io/en/latest/

Directory structure of the Sphinx source for installed software
---------------------------------------------------------------

Each program documentation should have the following structure::

  software/general.rst
  software/system/version/using.rst
  software/system/version/building.rst
  
Optionally each program can also have anyone of these files, 
if a software has additional material::

  software/system/version/library.rst
  software/system/version/module.rst
  software/system/version/package.rst  
  software/system/version/plugin.rst

Categorization of the software
------------------------------

To categorize various software you should edit the file *categorization.xml*
and add it under *<category>* tag of interest in the format *<name>* **[software folder name]** *<name>*.
A software that has not been added to this file will show up as *uncategorized*
on the software web page.

**IMPORTANT**: Software folders within the XML structure can be added several times, making
it possible to categorize the same software under different categories

Removing old systems or adding system or operating systems
----------------------------------------------------------

Software for multiple systems are installed under the OS in question. If only your system is using this
particular OS, follow the instructions at :ref:`removingos` for removing a whole operating system.

* Open *generate_index.py*
* If you want to add an operating system or a unique system add the system OS in...::

    systems = ['beskow', 'centos6', 'milner', 'centos5', '[SYSTEM_OS]']

* Remove [SYSTEM_NAMEX]/add [SYSTEM_OS] and [SYSTEM_NAME]::

    systems_dict['[SYSTEM_OS]'] = '[SYSTEM_NAME1, SYSTEM_NAME2]'

.. index:: Removing old Operating Systems (OS)
.. _removingos:

Removing old Operating Systems (OS)
-----------------------------------

When removing an old operating system we still want to retain the information if we are going
to install them on other systems, therefore we just remove the links in the python
files.

* Open *conf.py* and add exclude OS pattern as (see example in file)...::

    exclude_patterns = ['_build', '*/*/*/*/building.rst', '*/*/*/*/using.rst', '*/*/general.rst''*/*/lindgren/*','*/*/zorn/*',]

* Open *generate_index.py* and remove the SYSTEM_NAMEX, and SYSTEM_OS from...::

    systems = ['beskow', 'centos6', 'milner', 'centos5', '[SYSTEM_OS]']
    ...
    systems_dict['[SYSTEM_OS]'] = '[SYSTEM_NAME1, SYSTEM_NAME2]'
  
How to test your changes locally on your computer
-------------------------------------------------

You can test your changes locally on your computer before pushing them to the central repository.
For this you need to install python-sphinx for this (we recommend to do this via virtualenv). 
Then you can build the html with::

  python generate_index.py
  make html

Then point your browser to _build/html/index.html

External support documentation
------------------------------

The software documentation for users reside in github and can be cloned
from https://github.com/PDC-support/PDC-software-web
Follow the default procedure using :ref:`git_tool` for the repository

All documentations is rendered to http://pdc-software-web.readthedocs.io/en/latest/
To build new documentation...

* Push the changed repository to the github master
* Goto https://readthedocs.org/
* Login using username: *PDC-support* and password
* select **PDC-software-web**
* Press **Build**

  * Upon pressing build, besides building the software pages readthedocs
    also executes the python script *setup.py* which is enabled using the
    *Install project* option in **Advanced settings**

The new documentation will be rendered to the above link.
