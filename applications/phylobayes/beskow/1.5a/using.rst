:orphan:

.. include:: building.inc

Phylobayes is a Bayesian Monte Carlo Markov Chain (MCMC) sample for phylogenetic reconstruction.
Compared to other phylogenetic MCMC samplers, the main distinguishing feature of PhyloBayes is
the underlying probabilistic model, CAT. CAT is an infinite mixture model accounting for site-specific
amino-acid or nucleotide preferences. It is well suited to phylogenomic studies using large
multigene alignment.

After adding the module PhyloBayes can be run
with the following example script::

  #!/bin/bash
  #
  #PBS -l walltime=120:00:00
  #PBS -l nodes=1:ppn=8
  #PBS -o loo.out
  #pbs -e loo.err
  #PBS -j oe
  #PBS -W umask=022
  #PBS -r n
  aprun -n 8 pb_mpi -f -d convo9849.ali -cat -gtr -dgam 4 -dc catgtrconvo

Example data for this script can be found in::
 /pdc/vol/phylobayes/1.5a/data
