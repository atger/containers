FROM ubuntu:jammy


RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		software-properties-common \
                dirmngr \
                ed \
                gpg-agent \
		less \
		locales \
		vim-tiny \
		wget \
		ca-certificates \
        && wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc \
        && add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

## This was not needed before but we need it now
ENV DEBIAN_FRONTEND noninteractive

## Otherwise timedatectl will get called which leads to 'no systemd' inside Docker
ENV TZ UTC

# Now install R and littler, and create a link for littler in /usr/local/bin
# Default CRAN repo is now set by R itself, and littler knows about it too
RUN apt-get update \
    && apt-get install -y --no-install-recommends littler r-base r-base-dev r-recommended r-cran-docopt\
    && ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
    && ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
    && ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
    && ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
    && ln -s /usr/lib/R/site-library/littler/examples/update.r /usr/local/bin/update.r

RUN apt-get update \
    && apt-get install -y --no-install-recommends libxml2-dev libcurl4-openssl-dev lmodern texlive-latex-extra r-cran-rmarkdown r-cran-tidyverse pandoc-citeproc \
    && ln -s /usr/lib/R/site-library/littler/examples/render.r /usr/local/bin/render.r \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libgdk-pixbuf2.0-0 libgtk-3-0 libgbm1 libasound2 \
    && wget https://s3.amazonaws.com/rstudio-ide-build/electron/jammy/amd64/rstudio-2022.07.3-583-amd64.deb \
    && apt-get install -y -f ./rstudio-2022.07.3-583-amd64.deb

RUN install.r binb linl pinp tint DiagrammeR plotly prettydoc DT knitcitations RefManageR bibtex revealjs networkD3 BiocManager \
    && sed -i 's/R_LIBS_USER/#R_LIBS_USER/' /usr/lib/R/etc/Renviron

RUN R -e 'BiocManager::install(c("", "DESeq2", "tximport", "GenomicFeatures", "pheatmap"))'

CMD ["bash"]
