FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install wget git curl iputils-ping tcpdump iptables net-tools

# Install Golang 1.14.4
RUN wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
RUN tar -C /usr/local -zxvf go1.14.4.linux-amd64.tar.gz
RUN mkdir -p ~/go/{bin,pkg,src}

ENV GOPATH=$HOME/go
ENV GOROOT=/usr/local/go
ENV PATH=$PATH:$GOPATH/bin:$GOROOT/bin
ENV GO111MODULE=auto

# Required packages for user plane
RUN apt-get -y install git gcc cmake autoconf libtool pkg-config libmnl-dev libyaml-dev
RUN go get -u github.com/sirupsen/logrus

# Build all NFs at once
WORKDIR /root
RUN git clone --recursive -b v3.0.5 -j `nproc` https://github.com/free5gc/free5gc.git
WORKDIR /root/free5gc
RUN make

# TODO: Install WebConsole
# Please refer to https://github.com/free5gc/free5gc/wiki/Installation#d-install-webconsole
