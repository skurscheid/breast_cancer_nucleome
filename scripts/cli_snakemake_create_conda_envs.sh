/home/150/sxk150/miniconda3/envs/snakemake/bin/snakemake -s /home/150/sxk150/breast_cancer_nucleome/Snakefile.smk all_trim_pe \
    --configfile /home/150/sxk150/breast_cancer_nucleome/config.yaml\
	--use-conda\
	-d /scratch/kv78/mcf10a-hic\
	--rerun-incomplete \
        --local-cores 1\
	--cluster-config /home/150/sxk150/breast_cancer_nucleome/cluster.json\
        --keep-going\
	-prn --create-envs-only
