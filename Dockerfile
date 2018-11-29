FROM ubuntu:latest

# modify source
# COPY aliyun.list /etc/apt/sources.list
# RUN cat /etc/apt/sources.list

# prepare and install dev tools
RUN apt-get update \
    && apt-get install -y --fix-missing apt-utils \
    build-essential \
    cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
    # build opencv
    python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev \
    && cd /root/ && git clone https://github.com/opencv/opencv.git \
    && cd /root/opencv/ && mkdir build && cd build \
    && cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local .. \
    && make -j7 \
    && make install \
    # clean
    && rm -rf /root/opencv \
    && apt-get autoremove -y \
    apt-utils build-essential \
    cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
