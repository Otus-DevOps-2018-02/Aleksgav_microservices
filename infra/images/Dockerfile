FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y software-properties-common unzip wget openssh-client \
    && apt-add-repository ppa:ansible/ansible \
    && apt-get update \
    && apt-get install -y ansible \
    && wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip \
    && unzip terraform_0.11.7_linux_amd64.zip \
    && mv terraform /usr/local/bin/
