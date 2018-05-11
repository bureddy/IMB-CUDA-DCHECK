#!/bin/bash

export MPI_HOME=/usr/local/openmpi
export CUDA_HOME=/usr/local/cuda

TESTLIST="PingPong PingPing Sendrecv Exchange Reduce Allreduce Reduce_scatter Allgather Allgatherv Gather Gatherv Scatter Scatterv Alltoall Alltoallv Bcast Barrier"

echo "testing single node with 8 processes per node"

${MPI_HOME}/bin/mpirun -n 8 -hostfile hfile -npernode 8 ./IMB-MPI1 $TESTLIST -cuda 1

read  -n 1 -p "Press any key to continue to next test...."

echo "testing two nodes with 8 processes per node"

${MPI_HOME}/bin/mpirun -n 16 -hostfile hfile -npernode 8 --mca btl_openib_want_cuda_gdr 1 ./IMB-MPI1 $TESTLIST -cuda 1
