FROM continuumio/miniconda3:4.8.2
LABEL authors="michael.mansfield@oist.jp" \
	description="Docker image for conda-installed tools"

# Install conda packages
COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/nf-lra/bin:$PATH
