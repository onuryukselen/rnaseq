FROM nfcore/base:1.8 #Don't upgrade, it gives Kernel too old error for singularity
LABEL author="onur.yukselen@umassmed.edu" description="Docker image containing all requirements for the dolphinnext/rnaseq pipeline"

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
# Install dolphin-tools
RUN git clone https://github.com/dolphinnext/tools /usr/local/bin/dolphin-tools
RUN mkdir -p /project /nl /mnt /share
ENV PATH /opt/conda/envs/dolphinnext-rnaseq-2.0/bin:/usr/local/bin/dolphin-tools/:$PATH