#!/bin/bash

export MASTER_ADDR=$(hostname)
image=nersc/pytorch:ngc-22.02-v0
ngpu=4
config_file=./config/AFNO.yaml
config="time_4node"
run_num="check"
cmd="python time.py --enable_amp --yaml_config=$config_file --config=$config --run_num=$run_num"

# Run with shifter
srun -u --nodes 4 --ntasks-per-node 4 --cpus-per-task=32 --gpus-per-node $ngpu shifter --image=${image}  --env PYTHONUSERBASE=$HOME/.local/perlmutter/nersc-pytorch-22.02-v0 bash -c "source export_DDP_vars.sh && $cmd"

# Or with pytorch bare-metal
#module load pytorch/1.11.0
#srun -u --nodes 2 --ntasks-per-node 4 --cpus-per-task=32 --gpus-per-node $ngpu bash -c "source export_DDP_vars.sh && $cmd"


