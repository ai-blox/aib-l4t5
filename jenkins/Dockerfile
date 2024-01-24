FROM ubuntu:20.04

USER root

WORKDIR /tmp

RUN apt-get update && apt-get install --no-install-recommends -y \
	git wget lbzip2 build-essential bc zip libgmp-dev libmpfr-dev libmpc-dev vim-common 

# Should solve server certificate verification failed. CAfile: none CRLfile: none:
RUN apt-get install -y --reinstall ca-certificates && \
    mkdir /usr/local/share/ca-certificates/cacert.org && \
    wget -P /usr/local/share/ca-certificates/cacert.org http://www.cacert.org/certs/root.crt http://www.cacert.org/certs/class3.crt && \
    update-ca-certificates && \
    git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt

WORKDIR /l4t5-gcc

RUN wget -nv -O bootlin-toolchain-gcc-93.tar.gz https://developer.nvidia.com/embedded/jetson-linux/bootlin-toolchain-gcc-93 && \
    tar -xf bootlin-toolchain-gcc-93.tar.gz

RUN useradd -ms /bin/bash jenkins

USER jenkins
WORKDIR /home/jenkins

CMD ["/bin/bash"] 
