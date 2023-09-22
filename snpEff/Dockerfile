FROM ubuntu:20.04

RUN apt-get update && \
    TZ=Asia/Kolkata && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata zip wget default-jdk

RUN wget https://snpeff.blob.core.windows.net/versions/snpEff_latest_core.zip && \
    unzip snpEff_latest_core.zip -d /usr/local/ && \
    rm snpEff_latest_core.zip
ENV PATH=/usr/local/snpEff/exec:$PATH

RUN snpeff download -v GRCh38.99

CMD ["/bin/bash"]

