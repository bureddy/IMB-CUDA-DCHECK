#!/bin/bash

export MPI_HOME=/usr/local/openmpi
export CUDA_HOME=/usr/local/cuda

make clean
make -f make_ompi
sleep 2

