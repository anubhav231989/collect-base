FROM ubuntu:18.04

# LABEL maintainer="Zach Bloomquist <zach@bloomqu.ist>"
MAINTAINER Anubhav Sidhu <anubhav231989@gmail.com>

# PREVENT UBUNTU PACKAGE MANAGER DPKG ERRORS.
ENV TERM=xterm-256color

# RUN export LC_ALL="en_US.UTF-8"
# RUN export LC_CTYPE="en_US.UTF-8"
# RUN dpkg-reconfigure locales

# UPDATE THE IMAGE AND INSTALL PYTHON RUNTIME.
RUN apt-get update

RUN apt-get install -y \
    -o APT::Install-Recommended=false \
    -o APT::Install-Suggests=false \
    python3 python3-dev python3-pip python3-venv

# CREATE VIRTUALENV AND UPGRADE PIP IN VIRTUALENV.
RUN python3 -m venv app_env && \
    . /app_env/bin/activate

# ADDS ENTRYPOINT SCRIPT TO THE CONTAINER.
COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh

# ADDS EXECUTING PERMISSION TO THE SCRIPT.
RUN chmod +x /usr/local/bin/entrypoint.sh

# ADDING THE SCRIPT TO CONTAINER'S ENTRYPOINT.
ENTRYPOINT [ "entrypoint.sh" ]