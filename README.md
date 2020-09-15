# IMB-CUDA-DCHECK

git clone git@github.com:bureddy/IMB-CUDA-DCHECK.git
cd src
make -f make_ompi

mpirun -npernode 8 -np 8 --oversubscribe --host prm-dgx-17,prm-dgx-18 -x UCX_MEMTYPE_CACHE=n -x LD_LIBRARY_PATH --mca pml ucx --mca btl ^openib --mca coll self,basic,libnbc,cuda $PWD/get_local_ompi_rank_hca ./IMB-MPI1 "PingPong PingPing Sendrecv Exchange Reduce Allreduce Reduce_scatter Allg
ather Allgatherv Gather Gatherv Scatter Scatterv Alltoall Alltoallv Bcast Barrier" -cuda 1
