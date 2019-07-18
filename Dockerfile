FROM ubuntu:18.04

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    gnupg \
    gzip \
    jq \
    nodejs \
    npm \
    openjdk-11-jdk \
    python-pip \
    python-setuptools \
    ssh \
    tar

# Setup yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y yarn

RUN pip install -U pip
RUN pip install awscli

# Install Clojure
ARG CLJ_VERSION="linux-install-1.10.1.447.sh"
RUN curl -O https://download.clojure.org/install/$CLJ_VERSION
RUN chmod +x $CLJ_VERSION
RUN ./$CLJ_VERSION

RUN apt-get install -y --no-install-recommends rlwrap
RUN clj -e '(System/exit 0)'

# Inststall latest npm
RUN npm install npm -g
