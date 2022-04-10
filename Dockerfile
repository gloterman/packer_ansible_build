FROM debian:11-slim

LABEL org.opencontainers.image.title='packer_ansible_build'
LABEL org.opencontainers.image.description="A Docker image with Packer and Ansible"
LABEL org.opencontainers.image.authors='gautier.loterman@wescale.fr'
LABEL org.opencontainers.image.source='https://github.com/gloterman/packer_ansible_build.git'

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ARG ANSIBLE_VERSION
ARG JINJA_VERSION
ARG NETADDR_VERSION
ARG BOTO3_VERSION
ARG PACKER_VERSION

RUN apt-get update \
  && apt-get install -y wget curl git libssl-dev unzip \
       python3 python3-distutils python3-pip \
  && pip3 install ansible-core==${ANSIBLE_VERSION} \
  && pip3 install jinja2==${JINJA_VERSION} \
  && pip3 install netaddr==${NETADDR_VERSION} \
  && pip3 install boto3==${BOTO3_VERSION} \
  && pip3 install markupsafe==2.0.1 \
  && apt-get clean all \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

RUN wget --quiet "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip" \
  && unzip "packer_${PACKER_VERSION}_linux_amd64.zip" \
  && mv packer /usr/bin
