FROM ubuntu:trusty
MAINTAINER Anubhav Sidhu <anubhav231989@gmail.com>

# PREVENT UBUNTU PACKAGE MANAGER DPKG ERRORS.
ENV TERM=xterm-256color

# UPDATE THE IMAGE AND INSTALL PYTHON RUNTIME.
RUN apt-get update && \
    apt-get install -y \
    -o APT::Install-Recommended=false \
    -o APT::Install-Suggests=false \
    python3.7

# CREATE VIRTUALENV AND UPGRADE PIP IN VIRTUALENV.
RUN python3 -m venv app_env && \
    . /app_env/bin/activate && \
    pip3 install pip3 --upgrade

# ADDS ENTRYPOINT SCRIPT TO THE CONTAINER.
COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh

# ADDS EXECUTING PERMISSION TO THE SCRIPT.
RUN chmod +x /usr/local/bin/entrypoint.sh

# ADDING THE SCRIPT TO CONTAINER'S ENTRYPOINT.
ENTRYPOINT [ "entrypoint.sh" ]