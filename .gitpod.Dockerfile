FROM gitpod/workspace-full

USER root

# Add Teleport CLI (tsh, tctl)

RUN curl https://deb.releases.teleport.dev/teleport-pubkey.asc | sudo apt-key add - && \
    add-apt-repository 'deb https://deb.releases.teleport.dev/ stable main' && \
    apt-get update && \
    apt install teleport

ENV TELEPORT_PROXY=https://fernando-gitpod.teleport.sh

# Install:
# - git (and git-lfs), for git operations (to e.g. push your work).
#   Also required for setting up your configured dotfiles in the workspace.
# - sudo, while not required, is recommended to be installed, since the
#   workspace user (`gitpod`) is non-root and won't be able to install
#   and use `sudo` to install any other tools in a live workspace.
RUN apt-get update && apt-get install -yq \
    git \
    git-lfs \
    sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

USER gitpod