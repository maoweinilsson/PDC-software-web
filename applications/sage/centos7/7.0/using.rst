Running sage on an interactive node on Tegner
-----------------------------------------------

You can book a compute node for interactive running sage. The command to do this is *salloc* e.g. ::

 salloc --nodes=1 -t 1:00:00 -A <project>

which will book one computer node for one hour and *project* should be your projec name. And then run sage on the compute node using commands ::

 module add sage/7.0
 sage


Formation on how to run program interactively on Tegner, see https://www.pdc.kth.se/resources/computers/tegner/how-to/run .

