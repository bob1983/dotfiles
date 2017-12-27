#!/bin/bash

cd `dirname $0` || exit 1

source ./setup/bin/os_info.sh

os="$(os)"
echo ${os}
if [ "${os}" = "Darwin" ]; then
  echo "Darwin"
elif [ "${os}" = "Linux" ]; then
  distribution="$(distribution)"
  if [ "${distribution}" == 'ubuntu' ]; then
    echo "Bootstrapping with ubuntu"
    . ./setup/bin/ubuntu/install_ansible.sh
    install
  else
    echo "Error: Unsupported distribution"
    exit 1
  fi
else
  echo "Error: Unsupported operation system"
  echo "Only Darwin and Linux are supported"
  exit 1
fi
