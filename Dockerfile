FROM mcr.microsoft.com/vscode/devcontainers/dotnet:8.0-bookworm-slim

ARG USER='vscode'
ARG WORKDIR='/app'

ENV R_HOME="/usr/lib/R"

RUN apt update --allow-releaseinfo-change && \
    apt upgrade -y && \
    apt install -y --no-install-recommends build-essential \
                                           r-base

WORKDIR ${WORKDIR}

COPY --chown=${USER}:${USER} . ${WORKDIR}

USER ${USER}

