FROM ubuntu:22.10

ARG USER
ARG USERID
ARG GROUPID

# Generic deps
RUN apt-get update && apt-get install -y \
        ca-certificates \
        git \
        python3 \
        python3-pip \
        sudo \
        vim \
&& rm -rf /var/lib/apt/lists/*

# OpenEmbedded deps
RUN apt-get update && apt-get install -y \
    chrpath \
    cpio \
    diffstat \
    file \
    gawk \
    locales \
    lz4 \
    wget \
    zstd \
&& rm -rf /var/lib/apt/lists/*

# Menuconfig deps
RUN apt-get update && apt-get install -y \
    libncurses-dev \
    tmux \
&& rm -rf /var/lib/apt/lists/*

# KAS tool, fixed version
RUN python3 -m pip install kas==3.1

# Configure locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Add a proper user for non-root usage
RUN groupadd -g "${GROUPID}" "${USER}"
RUN useradd -m -u "${USERID}" -g "${GROUPID}" -G sudo -s /bin/bash "${USER}"
RUN echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
