
The program comes as an rpm, which wants to install itself in /opt/lumerical so need to manually extract the RPM and install it in AFS for general use

::
 rpm2cpio src/FDTD_Solutions-8.15.786/rpm_install_files/FDTD-8.15.786-1.el5.x86_64.rpm | cpio -idv

then moved the files to the correct location.

After creating a module to add the directories to the PATH and LD_LIBRARY_PATH found that the following libraries were missing::

 libpng12.so.0
 libxmlsec1.so.1
 libxmlsec1-openssl.so.1

manually extracted those files from the system RPMs, and put them in a
sub-directory and added them to the path in the module. Centos 7 comes
with libpng14.so.0, so installed libpng12 in a different location.
