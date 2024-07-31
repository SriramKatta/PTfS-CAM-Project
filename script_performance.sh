#!/bin/bash -l
#SBATCH --nodes=1 
#SBATCH --partition singlenode
#SBATCH --time=00:10:00
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=bmomptask
#SBATCH --export=NONE

module load intel likwid

make clean

likwid=on CXX=icpx make > /dev/null

srun --cpu-freq=2000000-2000000 likwid-pin -q -c M0:0-17 ./perf 5000 5000

make clean