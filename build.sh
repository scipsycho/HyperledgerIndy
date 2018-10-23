#!/bin/bash

#git clone https://github.com/hyperledger/indy-sdk  indy-sdk-temp
#git clone https://github.com/hyperledger/indy-node indy-node-temp
#git clone https://github.com/hyperledger/indy-plenum indy-plenum-temp 
docker build -t indy .
docker run -v /var/run/docker.sock:/var/run/docker.sock  indy /bin/sh -c "cd indy-sdk && docker build -f ./ci/indy-pool.dockerfile -t indy_pool . "
docker save -o indy_pool.tar indy_pool
docker build -t indy .
rm -rf indy-sdk-temp indy-node-temp indy-plenum-temp   
