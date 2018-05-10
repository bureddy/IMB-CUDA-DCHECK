#!/bin/bash

export MPI_HOME=/usr/local/openmpi
export CUDA_HOME=/usr/local/cuda-9.0

TESTLIST="PingPong PingPing Sendrecv Exchange Reduce Allreduce Reduce_scatter Allgather Allgatherv Gather Gatherv Scatter Scatterv Alltoall Alltoallv Bcast Barrier"

make clean
make -f make_ompi
sleep 2

${MPI_HOME}/bin/mpirun -hostfile hfile -npernode 8 ./IMB-MPI1 $TESTLIST -cuda 1 
