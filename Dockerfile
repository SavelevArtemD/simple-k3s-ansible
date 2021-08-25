FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y gcc python-dev libkrb5-dev && \
  apt-get install python3-pip -y && \
  pip3 install --upgrade pip && \
  pip3 install --upgrade virtualenv && \
  apt install -y ssh sshpass && \
  mkdir -p $HOME/.ssh && \
  echo "Host *\n\tStrictHostKeyChecking no\n\n" > $HOME/.ssh/config

WORKDIR /infrastructure

COPY . /infrastructure

RUN pip3 install -r /infrastructure/requirements.txt

CMD ["/bin/bash"]


#FROM ubuntu:20.04
#
#WORKDIR /infrastructure
#CMD ["/bin/bash"]
#
#RUN apt-get update && \
#    apt-get install -y --no-install-recommends software-properties-common apt-utils wget curl ssh bsdmainutils libssl-dev sshpass && \
#    mkdir -p $HOME/.ssh && \
#    echo "Host *\n\tStrictHostKeyChecking no\n\n" > $HOME/.ssh/config
#
#RUN add-apt-repository ppa:rmescandon/yq && \
#    apt-get update && \
#    apt-get install -y yq
#
#COPY . /infrastructure
#
#RUN chmod +x /infrastructure
#RUN chmod 700 /infrastructure/ansible
#RUN chmod 600 -R /infrastructure/certs/
#
#RUN pip3 install -r /infrastructure/requirements.txt