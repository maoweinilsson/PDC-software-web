Load the module ::

  $ module load globus-toolkit/6.0

Running example
_______________

The Globus Toolkit provides a GridFTP client called **globus-url-copy**, a command line interface, suitable for scripting ::

    Get TERENA cert and extract cert and key to PEM format
    $ cd ~/Private
    $ mkdir .globus
    $ cd .globus
    $ openssl pkcs12 -in file.pkcs12 -nocerts -out userkey.pem
    $ chmod 600 userkey.pem
    $ openssl pkcs12 -in file.pkcs12 -nokeys -out usercert.pem
    $ chmod 644 usercert.pem
    $ grid-proxy-init -cert ~/Private/.globus/usercert.pem -key ~/Private/.globus/userkey.pem
    $ globus-url-copy gsiftp://remote.host.edu/path/to/file file:///path/on/local/host
