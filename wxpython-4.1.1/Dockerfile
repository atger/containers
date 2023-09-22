FROM ubuntu:18.04

LABEL maintainer="Genotypic Technology"
LABEL website="https://genotypic.co.in/"

RUN apt-get update && \
    apt-get install -y build-essential libgtk-3-dev python3-pip
RUN apt-get install -y libjpeg8-dev zlib1g-dev libtiff-dev libfreetype6 libfreetype6-dev \
                       libwebp-dev libopenjp2-7-dev libopenjp2-7-dev libnotify-dev libsdl2-2.0-0
RUN pip3 install -U -f https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-18.04 wxPython
RUN pip3 install pyyaml sqlalchemy netifaces pypubsub biopython python-docx xlsxwriter slate3k chardet pandas pyinstaller
