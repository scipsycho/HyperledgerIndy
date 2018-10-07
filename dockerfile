FROM ubuntu:16.04

#Installing python3 on the system
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python3.5 python3-pip python3.5-dev

#installing dialog apt-utils
RUN apt-get -y install dialog apt-utils

#setting up dependencies for it

#adding keys and certificates
RUN apt-get install -y apt-transport-https ca-certificates
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu xenial main universe"
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 68DB5E88

#adding repositories
RUN add-apt-repository "deb https://repo.sovrin.org/deb xenial master"
RUN add-apt-repository "deb https://repo.sovrin.org/sdk/deb xenial stable"
RUN apt-get update

#installing libsodium
RUN apt-get install -y libsodium18

#installing RocksDB
RUN apt-get install -y libbz2-dev\
	zlib1g-dev \
	liblz4-dev \
	libsnappy-dev \
	rocksdb=5.8.8

#installing Charm Crypto
RUN apt-get install -y python3-charm-crypto

#installing Libindy and Libindy Crypto
RUN apt-get install -y libindy libindy-crypto


#installing useful packages
RUN apt-get -y install git

#creating work directory
RUN mkdir work_dir
WORKDIR work_dir

#copying indy_node and indy_plenum
COPY indy-node ./indy-node
COPY indy-plenum ./indy-plenum

#installing indy-node
WORKDIR indy-node
RUN pip3 install --upgrade setuptools
RUN pip3 install -e .[tests]

#installing indy-plenum
WORKDIR ../indy-plenum
RUN pip3 install -e .[tests]

#installing flake8
RUN pip3 install flake8


#installing indy-sdk
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 68DB5E88
RUN add-apt-repository "deb https://repo.sovrin.org/sdk/deb xenial {release channel}"
RUN apt-get update
RUN apt-get install -y libindy
