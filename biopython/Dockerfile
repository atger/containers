FROM ubuntu:20.04

RUN apt-get update && \
    TZ=Asia/Kolkata && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y curl jq python3 python3-biopython python3-pandas python3-bs4

CMD ["/bin/bash"]

