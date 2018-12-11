FROM jupyter/scipy-notebook

USER root

# We don't have msprime 0.6.2 in conda-forge yet, so need to
# compile locally. This requires gsl-dev

RUN rm -rf /var/lib/apt/lists/* && apt-get clean
RUN  apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential cmake libgsl-dev

# Install SLiM
RUN wget http://benhaller.com/slim/SLiM.zip 
RUN unzip SLiM.zip
RUN mkdir SLiM/build 
RUN cd SLiM/build && cmake .. && make all -j 4
# make install is not currently supported:
# https://github.com/MesserLab/SLiM/issues/29
RUN cp SLiM/build/slim /bin
RUN rm -fR SLiM*

# RUN conda install --quiet --yes \
#     msprime \
#     && conda clean -tipsy 

RUN pip install msprime pyslim

RUN fix-permissions /home/jovyan
USER $NB_UID
