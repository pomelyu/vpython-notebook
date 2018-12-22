# Modified from https://github.com/jupyter/docker-stacks/blob/master/tensorflow-notebook/Dockerfile

ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer=""

USER root

# add vpython channel
RUN conda config --add channels vpython

# Install vpython
RUN conda install --quiet --yes \
    "vpython=7.4*" && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
