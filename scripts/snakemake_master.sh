#!/bin/bash
#PBS -P pb97
#PBS -l walltime=48:00:00
#PBS -l wd
#PBS -q biodev
#PBS -e /home/150/sxk150/qsub_error
#PBS -o /home/150/sxk150/qsub_out
#PBS -l ncpus=1
#PBS -l mem=4GB
#PBS -M skurscheid@gmail.com
#PBS -m abe

source ~/.bashrc

/short/rl2/miniconda3/envs/snakemake/bin/snakemake -s /home/150/sxk150/breast_cancer_nucleome/Snakefile.smk all_hicQC_per_sample\
    --configfile /home/150/sxk150/breast_cancer_nucleome/config.yaml\
	--use-conda\
	--cluster "qsub -P {cluster.P}\
                    -l ncpus={threads} \
                    -q {cluster.queue} \
                    -l mem={cluster.mem} \
                    -l wd\
                    -l walltime={cluster.walltime}\
                    -M {cluster.M}\
                    -m {cluster.m}\
                    -e {cluster.error_out_dir} \
                    -o {cluster.std1_out_dir}" \
	--jobs 100\
	-d /short/kv78/mcf10a-hic\
	--rerun-incomplete \
    --local-cores 1\
	--cluster-config /home/150/sxk150/breast_cancer_nucleome/cluster.json\
    --keep-going\
	-pr 

