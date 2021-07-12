FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install wget git curl

# Install Golang 1.14.4
RUN wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
RUN tar -C /usr/local -zxvf go1.14.4.linux-amd64.tar.gz
RUN mkdir -p ~/go/{bin,pkg,src}

ENV GOPATH=$HOME/go
ENV GOROOT=/usr/local/go
ENV PATH=$PATH:$GOPATH/bin:$GOROOT/bin
ENV GO111MODULE=auto

# Install networking toolkit
RUN apt-get -y install iputils-ping tcpdump iptables net-tools

# TODO: Download and build free5GC NFs and WebConsole
