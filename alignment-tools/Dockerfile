FROM ubuntu:22.04

RUN apt-get update && \
    TZ=Asia/Kolkata && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata bwa bowtie2 hisat2 minimap2 samtools bcftools seqtk ncbi-blast+

CMD ["/bin/bash"]

