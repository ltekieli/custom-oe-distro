FROM ubuntu:20.04

ARG USER
ARG USERID
ARG GROUPID

# Generic deps
RUN apt update && apt install -y \
        ca-certificates \
        git \
        python3 \
        python3-pip

# KAS tool
RUN python3 -m pip install kas==3.1

# OpenEmbedded deps
RUN apt update && apt install -y \
    chrpath cpio diffstat gawk locales lz4 wget zstd \
    libncurses-dev tmux

Run apt update && apt install -y \
    vim

# Configure locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN groupadd -g "${GROUPID}" "${USER}"
RUN useradd -m -u "${USERID}" -g "${GROUPID}" -s /bin/bash "${USER}"
