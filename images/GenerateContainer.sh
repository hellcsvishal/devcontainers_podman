#!/usr/bin/env bash

BASE_NAME="base$1" # base name of the container ex: basefedora

echo "Building $BASE_NAME ...."

if [[ "$BASE_NAME" == "baseubuntu" ]]; then
    podman run -d --name baseubuntu ubuntu sleep infinity
    podman exec baseubuntu userdel -r ubuntu
    podman exec baseubuntu useradd -u 1000 -m -s /bin/bash pydevc
    podman exec -it baseubuntu passwd pydevc
    podman exec baseubuntu apt update -y && apt install sudo -y
    podman exec baseubuntu usermod -aG sudo pydevc
    podman exec baseubuntu groups pydevc
    podman commit baseubuntu baseubuntu
elif [[ "$BASE_NAME" == "basefedora" ]]; then
    podman run -d --name basefedora fedora:42 sleep infinity
    podman exec basefedora useradd -m pydevc
    podman exec -it basefedora passwd pydevc
    podman exec basefedora dnf update -y && dnf install sudo -y
    podman exec basefedora usermod -aG wheel pydevc
    podman exec basefedora groups pydevc
    podman commit basefedora basefedora
fi
