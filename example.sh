#!/bin/bash

echo "Updating packages - wait for completion"

sudo apt update -y

echo "Instal yum package manager"

sudo apt-get install yum -y

echo "Install python3 and boto3"

sudo apt-get install python3 -y

echo "Show python is installed and version"

python3 --version

echo "Install zip"

sudo apt-get install zip -y

echo "Install pip"

sudo apt-get install python-pip -y

echo "Installing terraform version 0.12.9"

curl https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip --output terraform_0.12.9.zip && unzip terraform_0.12.9.zip && sudo mv terraform /usr/local/sbin

echo "Checking terraform version installed"

terraform --version

echo "Installing docker-ce"

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "Updating docker-ce from community repo"

sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo "Verify docker is running"

sudo docker run hello-world

echo "Pull latest docker image for traefik"

sudo docker pull traefik:latest


