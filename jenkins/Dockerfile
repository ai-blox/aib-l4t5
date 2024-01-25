FROM ubuntu:20.04

# USER root

WORKDIR /tmp

# add ARG and ENV for tzdata (used by sphinx?)
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update && apt-get install --no-install-recommends -y \
	git wget lbzip2 build-essential bc zip libgmp-dev libmpfr-dev libmpc-dev vim-common python3-sphinx flex bison libssl-dev

# Should solve server certificate verification failed. CAfile: none CRLfile: none:
RUN apt-get install -y --reinstall ca-certificates && \
    mkdir /usr/local/share/ca-certificates/cacert.org && \
    wget -P /usr/local/share/ca-certificates/cacert.org http://www.cacert.org/certs/root.crt http://www.cacert.org/certs/class3.crt && \
    update-ca-certificates && \
    git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt

WORKDIR /aib-l4t5

RUN wget -nv -O bootlin-toolchain-gcc-93.tar.gz https://developer.nvidia.com/embedded/jetson-linux/bootlin-toolchain-gcc-93 && \
    tar -xf bootlin-toolchain-gcc-93.tar.gz

CMD ["/bin/bash"] 
