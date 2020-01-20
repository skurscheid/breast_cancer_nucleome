/home/150/sxk150/miniconda3/envs/snakemake/bin/snakemake -s /home/150/sxk150/breast_cancer_nucleome/Snakefile.smk $1 \
    --configfile /home/150/sxk150/breast_cancer_nucleome/config.yaml\
	--use-conda\
	--cluster "qsub -P {cluster.P}\
                    -l ncpus={threads} \
                    -q {cluster.queue} \
                    -l mem={cluster.mem} \
                    -l wd\
                    -l walltime={cluster.walltime}\
                    -l storage=scratch/kv78\
                    -M {cluster.M}\
                    -m {cluster.m}\
                    -e {cluster.error_out_dir} \
                    -o {cluster.std1_out_dir}" \
	--jobs 100\
	-d /scratch/kv78/mcf10a-hic\
	--rerun-incomplete \
    --local-cores 1\
	--cluster-config /home/150/sxk150/breast_cancer_nucleome/cluster.json\
    --keep-going\
	-pr${2}
