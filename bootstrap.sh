#!/bin/bash

cd `dirname $0` || exit 1
. ./setup/bin/os_info.sh

os=$(os)
if [ ${os} == 'Darwin' ]; then
elif [ ${os} == 'Linux' ]; then
  distribution=$(distribution)
  if [ ${distribution} == 'ubuntu' ]; then
    . ./setup/bin/ubuntu/install_ansible.sh
    install
  else
    exit 1
  fi
fi
