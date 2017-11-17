# Start with cuDNN base image
FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu14.04
MAINTAINER Yohei Kikuta <yohei-kikuta@cookpad.com>

# Install git, wget, bc and dependencies
RUN apt-get update && apt-get install -y \
  git \
  iproute2 \
  wget \
  python-pip \
  libmysqlclient-dev \
  python-matplotlib \
  python-numpy \
  python-pil \
  python-scipy

RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN apt-get install -y gcc-4.8
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50

# Update pip
RUN pip install --upgrade pip
Run pip install setproctitle==1.1.10 \
  pandas \
  scikit-learn \
  matplotlib \
  scikit-image \
  pytest \
  tensorflow_gpu==1.1.0 \
  pyglib==0.1 \
  python_gflags==3.1.1 \
  python_magic==0.4.13

# Install miscs
RUN pip install awscli akagi

# Set working directory
WORKDIR /work

ENTRYPOINT ["/bin/bash"]
