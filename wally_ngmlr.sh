#!/bin/bash
#SBATCH --partition=htc-el8
#SBATCH --job-name=extract_GQ
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=8G
#SBATCH --time=24:00:00
#SBATCH --output=extract_GQ_%j.out
#SBATCH --error=extract_GQ_%j.err

# Navigate to the directory containing your script and input files
cd /g/korbel2/shared/inversion/

# Activate your environment if needed
# source activate your_environment_name

# Run your script
bash wally_newÂ.sh
