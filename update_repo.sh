#!/usr/bin/env bash
docker run --rm -v $PWD:/zfs --entrypoint=/bin/bash quay.io/centos/centos:stream9 -c \
  'yum install -y createrepo; cd /zfs; createrepo --update .'
