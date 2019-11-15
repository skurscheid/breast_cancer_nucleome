__author__ = "Sebastian Kurscheid (sebastian.kurscheid@anu.edu.au)"
__license__ = "MIT"
__date__ = "2019-04-08"

# vim: syntax=python tabstop=4 expandtab
# coding: utf-8


"""
Rules for creating read pairs file from SE aligned BAM files

For usage, include this in your workflow.
"""

def get_index(machine, config):
    """ returns path to index"""
    return config["params"]["bwa"]["index"][machine]

singularity: "docker://skurscheid/snakemake_baseimage:0.2"


rule samtools_merge:
    """ merge BAM files into BAMPE"""
    conda:
        "../envs/fastqProcessing.yaml"
    threads:
        16
    params:
    input:
        bam1 = "bowtie2/align/se/{batch}/{sample}_{lane}_{replicate}.end1.bam",
        bam2 = "bowtie2/align/se/{batch}/{sample}_{lane}_{replicate}.end2.bam",
    output:
        bam = "samtools/merge/{batch}/{sample}_{lane}_{replicate}.merged_nodup.bam"
    shell:
        """
            samtools view -Sb - > {output.bam}
        """
