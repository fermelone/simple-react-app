FROM gitpod/workspace-full

USER root

# Add Teleport CLI (tsh, tctl)
RUN curl https://deb.releases.teleport.dev/teleport-pubkey.asc | sudo apt-key add - && \
    add-apt-repository 'deb https://deb.releases.teleport.dev/ stable main' && \
    apt-get update && \
    apt install teleport

ENV TELEPORT_PROXY=https://fernando-gitpod.teleport.sh

USER gitpod