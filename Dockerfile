# for a docker image with:
# CUDA 9.0 + cuDNN 7.x
# Anaconda 5.2 (python 3.6.5)
# Facebook prophet
# based on tftwdockerhub/cuda_cudnn_ana_base:latest
# this image tag:
# prophet_devel:latest

FROM tftwdockerhub/cuda_cudnn_ana_base:latest

# the maintainer information
LABEL maintainer "Teng Fu <teng.fu@teleware.com>"

# apt-get install
RUN apt-get -y update  && apt-get install -y --no-install-recommends\
    python3-dev \
    apt-utils \
    python-dev \
    build-essential \
    && \
    rm -rf /var/lib/apt/lists/*

# pip install
RUN pip --no-cache-dir install --upgrade  setuptools
RUN pip --no-cache-dir install pystan
RUN pip --no-cache-dir install fbprophet
