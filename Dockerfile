FROM ubuntu:18.04

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    gzip \
    nodejs \
    npm \
    openjdk-8-jdk \
    python-pip \
    python-setuptools \
    ssh \
    tar

RUN pip install -U pip
RUN pip install awscli

# Install Boot
ENV BOOT_AS_ROOT yes
ENV BOOT_VERSION 2.7.2
RUN bash -c "cd /usr/local/bin && curl -fsSLo boot https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh && chmod 755 boot"
RUN boot repl -e '(System/exit 0)'

# Install clojure
RUN curl -O https://download.clojure.org/install/linux-install-1.9.0.348.sh
RUN chmod +x linux-install-1.9.0.348.sh
RUN ./linux-install-1.9.0.348.sh

RUN apt-get install -y --no-install-recommends rlwrap
RUN clj -e '(System/exit 0)'