FROM ubuntu:22.04

ARG DEBIAN_FRONTEND="noninteractive" 
ENV TZ=Asia/Kolkata 
ENV PERL5LIB=/mireap/lib
ENV PATH=/mireap/bin:$PATH

RUN apt-get update \
    && apt-get -y install tzdata git wget g++ make pkg-config gfortran liblapack-dev liblapacke-dev

RUN wget https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_6_x/ViennaRNA-2.6.3.tar.gz \
    && tar xzvf ViennaRNA-2.6.3.tar.gz \
    && cd ViennaRNA-2.6.3 \
    && ./configure \
    && make \
    && make install \
    && rm -r /ViennaRNA-2.6.*

RUN git clone https://github.com/liqb/mireap.git

CMD ["/bin/bash"]

