
Intel compilers (version 16 and up)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Update FlexLM demon (if necessary)

   #. Download new license file from the intel website
   #. Open daemon file
   #. Find Intel license
   #. Replace with new license
   #. Restart license server (requires a sysadmin)
   #. Make sure older compilers still work with the new license

#. Install
   #. Download latest Intel suite
   #. Untar the file (use CFS due to multi-Gb size of installer)
   #. Prepare the target installation directory

      #. on Beskow::

           change own group to 'sinstall'
           cd /pdc/vol
           newgrp sinstall
           umask 0002
           mkdir /pdc/vol/intel/201X.S.V

      #. on Tegner. Create new AFS volume on /afs/.pdc.kth.se/pdc/vol/i-compilers (see instructions for how to create a new volume)   
        
   #. Run the installer. The installer can be extremely slow at some points
   #. Install in user mode

      #. Accept the EULA

   #. I want to activate by using a license file
   #. Use Intel(R) Software License Manager

      #. Introduce the address of the license server: 31411@license-1.pdc.kth.se

   #. No, I don't want to participate in the Intel® Software Improvement Program at this time.
   #. [configure cluster installation]
   #. Finish configuring installation target
   #. Customize installation
   #. Unselect IA-32 components
   #. Finish architecture selection
   #. Change install directory
   #. Type correct installation directory
   #. Component selection
   #. [Customize components]
   #. Start installation Now

#. You may have to fight with the script::

     The install directory path cannot be changed because at least one software product component was detected as having already been installed on the system.

   Is so, please check https://software.intel.com/en-us/forums/intel-fortran-compiler-for-linux-and-mac-os-x/topic/271299
   This can be caused by leftover files in your ~ directory from a previous install attempt (successful or not). You can avoid this by removing or renaming the ~/intel directory or setting $HOME to some different path during the install.


#. Make module file
   
   #. Copy and modify the module file from a previous install. Note the structure directory for the libraries has changed since version 16
   
      #. on Beskow
      
         #. copy/modify a module file from /opt/modulefiles (/pdc/vol/Modules/intel directory is accessible )
         #. test the module
         #. notify a sysadmin to move/place the module file with the rest of Intel compiler modules on /opt/modulefiles
         
      #. on Tegner:
      
#. Help/support
   To contact Intel support:
   Web:
   User:
   Pass:
