# HyperledgerIndy
## A project made using Hyperledger's Indy

## Steps to run indy_pool using Docker on any system

**Step 1**: Install Docker on your system.  
**Step 2**: Clone this Repo.  
**Step 3**: Run `./build.sh`  
**Step 4**: Run `docker run --privileged run -it indy /bin/bash`

**Now you have run a container which contains the indy_pool image**

**Note: The steps(5-6) below are ought to be run on the prompt you get after running the container in step 4.**  

**Step 5**: Run `docker run -p  9701-9708:9701-9708 -itd indy_pool`

**(optional) To run the example transaction**  
**Step 6**: Run `cd indy-sdk/samples/python ; python3 -m src.getting_started`
