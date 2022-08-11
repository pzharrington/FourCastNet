
echo "Installing deps for bare-metal PyT"
module load pytorch/1.11.0
pip install --user einops timm

echo "Installing deps for container PyT"
mkdir $HOME/.local/perlmutter/nersc-pytorch-22.02-v0
shifter  --image=nersc/pytorch:ngc-22.02-v0 --env PYTHONUSERBASE=$HOME/.local/perlmutter/nersc-pytorch-22.02-v0 bash -c "pip install --user einops timm"

