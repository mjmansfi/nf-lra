FROM nfcore/base:1.7
LABEL authors="michael.mansfield@oist.jp" \
	description="Docker image for nanoplot module"

# Install conda packages
COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/nf-lra-nanoplot/bin:$PATH
