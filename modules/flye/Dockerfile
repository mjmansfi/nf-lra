FROM nfcore/base:1.7
LABEL authors="michael.mansfield@oist.jp" \
      description="Docker image containing all requirements for the nf-lra flye module"

# Install conda packages
COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/nfcore-module-getcrosslinkscoverage/bin:$PATH
