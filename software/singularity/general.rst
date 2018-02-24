
Singularity
===========

Temporary limitation of Singularity user namespaces (Feb 23)
------------------------------------------------------------

Due to secondary effects of 
[CVE-2017-16939](https://access.redhat.com/security/cve/cve-2017-16939) 
we need to make certain
changes to the functionality of Singularity on Tegner until fixes for
the the CVE are available and have been installed. Specifically we
will disable the use of so called "user namespaces" on which some of
Singularity's functionality depends. Singularity can be run without
this but in a - in some ways - limited mode.


What is singularity
-------------------

Singularity enables users to have full control of their environment.
Singularity containers can be used to package entire scientific workflows, software and libraries, and even data.
This means that you don’t have to ask your cluster admin to install anything for you -
you can put it in a Singularity container and run. Did you already invest in Docker?
The Singularity software can import your Docker images without having Docker installed or being a superuser.
Need to share your code? Put it in a Singularity container and your collaborator won’t have to go through the pain of installing missing dependencies.
Do you need to run a different operating system entirely? 
You can “swap out” the operating system on your host for a different one within a Singularity container. 
As the user, you are in control of the extent to which your container interacts with its host.
There can be seamless integration, or little to no communication at all. 

More information about singularity can be found at http://singularity.lbl.gov/

Containers
----------

Besides singularity images, singularity can also execute docker images.

Security
--------

Singularity is more secure on a HPC than other similar solutions like docker or shifter.
Read a comparison about them at http://geekyap.blogspot.se/2016/11/docker-vs-singularity-vs-shifter-in-hpc.html

important to remember is that if you download images they should be trusted
since any container you run will have full access tor your account and your data.

The same goes for images you build yourself that they are built upon
trusted images.

Performance
-----------

Executing software in containers is very efficient as well as you create
a sandbox of all applications that you do need. Very little performance
loss has been seen.
