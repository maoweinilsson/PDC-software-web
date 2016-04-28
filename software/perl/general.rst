

How to use Perl on PDC machines
===================================

To see which version of Perl that is available by default use the command::

  perl -V


Available Perl packages
=========================

Perl has a very large number of optional packages that can be
installed. These are accessed using the site-perl module. If the
specific package you need is not installed then `contact support <https://www.pdc.kth.se/about/contact/support-requests>`_.

You can see which versions of Perl the site-perl modules use ::

  module avail site-perl

Then load a specific site-perl module (corresponding to the version
of Perl you want to use), for example::

  module load site-per/5.16

