#!/bin/bash -l
#SBATCH --time=00:10:00
#SBATCH -C gpu
#SBATCH -q regular_ss11
#SBATCH --account=m4134_g
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=4
#SBATCH --gpus-per-node=4
#SBATCH --cpus-per-task=32
#SBATCH -J afno
#SBATCH --image=nersc/pytorch:ngc-22.02-v0
#SBATCH -o time_8node_buff.out

config_file=./config/AFNO.yaml
config='time_8node'
run_num='0'

export HDF5_USE_FILE_LOCKING=FALSE
export NCCL_NET_GDR_LEVEL=PHB

export MASTER_ADDR=$(hostname)

module load pytorch/1.11.0

set -x
#srun -u --mpi=pmi2 shifter --env PYTHONUSERBASE=$HOME/.local/perlmutter/nersc-pytorch-22.02-v0 \
srun -u \
    bash -c "
    source export_DDP_vars.sh
    python time.py --enable_amp --yaml_config=$config_file --config=$config --run_num=$run_num
    "
