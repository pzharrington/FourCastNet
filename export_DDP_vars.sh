export RANK=$SLURM_PROCID
export WORLD_RANK=$SLURM_PROCID
export LOCAL_RANK=$SLURM_LOCALID
export WORLD_SIZE=$SLURM_NTASKS
export MASTER_PORT=29500 # default from torch launcher
export WANDB_START_METHOD="thread"

export NCCL_DEBUG=INFO

# TEST nccl plugin
NCCL_PLUGIN_DIR=/pscratch/sd/p/pharring/nccl-ofi-plugin/install
export LD_LIBRARY_PATH=$NCCL_PLUGIN_DIR/lib:$NCCL_PLUGIN_DIR/deps/lib:$LD_LIBRARY_PATH
export NCCL_CROSS_NIC=1
export NCCL_NET="AWS Libfabric"
export FI_CXI_RDZV_EAGER_SIZE=0

#export FI_CXI_RDZV_THRESHOLD=0
#export FI_CXI_RDZV_GET_MIN=0
#export FI_CXI_OFLOW_BUF_SIZE=1073741824
#export FI_CXI_OFLOW_BUF_COUNT=1

