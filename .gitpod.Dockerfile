FROM gitpod/workspace-full:2023-04-18-14-35-39

USER gitpod

RUN brew tap leoafarias/fvm && \
    brew install fvm && \
    fvm config --cache-path /workspace/.fvm

ENV PUB_CACHE=/workspace/.pub
