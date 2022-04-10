# Packer Ansible build image

This is a Docker image with Ansible and Packer inside, and AWS cli tool. 

The aim is to use this image to build AMI with Packer and Ansible as provisionner. 

This image is intendend to be use in CI/CI pipeline.


# How to build

An environment file contain main software versions to install.

Launch the build script `build.sh` to build Docker image.
