FROM ubuntu:20.04

RUN apt-get update && \
    TZ=Asia/Kolkata && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y libbz2-dev liblzma-dev python3 python3-pip

RUN pip3 install nanostat

CMD ["/bin/bash"]

