FROM devinsba/docker-base

RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/* && \
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

ADD wrapper.sh /nvm-wrapper

ENTRYPOINT /nvm-wrapper