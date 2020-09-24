# IMB-CUDA-DCHECK

git clone git@github.com:bureddy/IMB-CUDA-DCHECK.git

cd src

CUDA_HOME=/usr/local/cuda make -f make_ompi

mpirun -npernode 8 -np 8 --oversubscribe --host host1,host2 -x UCX_RNDV_SCHEME=get_zcopy -x LD_LIBRARY_PATH --mca pml ucx --mca btl tcp --mca coll self,basic,libnbc,cuda $PWD/get_local_ompi_rank_hca ./IMB-MPI1 "PingPong PingPing Sendrecv Exchange Reduce Allreduce Reduce_scatter Allg
ather Allgatherv Gather Gatherv Scatter Scatterv Alltoall Alltoallv Bcast Barrier" -cuda 1
