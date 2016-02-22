Running sage on an interactive node on Tegner
-----------------------------------------------

You can book a compute node for interactive running sage. The command to do this is *salloc* e.g. ::

 tegner$ salloc --nodes=1 -t 1:00:00 -A <project>
  salloc: Granted job allocation 2364
  salloc: Waiting for resource configuration
  salloc: Nodes t02n01 are ready for job

which will book one computer node (*t02n01.pdc.kth.se* for this case) one hour and *project* should be your projec name. And then from your local compute to login on the computer node and run sage using commands likes ::

 (open a new xterm on your local computer)
 local$ ssh -Y username@t02n01.pdc.kth.se #username/node should be changed to yours
 t02n01$ module add sage/7.0
 t02n01$ sage

Formation on how to run program interactively on Tegner, see https://www.pdc.kth.se/resources/computers/tegner/how-to/run .

