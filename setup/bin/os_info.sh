#!/bin/bash

# Get operation system name
os() {
  os=$(uname -o)
  if [ ${os} == "Darwin" ]; then
    os_name="Darwin"
  elif [ ${os} == "Gnu/Linux" ]; then
    os_name="Linux"
  else
    exit 1
  fi
  echo ${os_name}
}

# Get architecture
# "64" or "32" will return
architecture() {
  arch=$(uname -m)
  if [ ${arch} == "x86_64" ]; then
    value="64"
  elif [ ${arch} == "i386" ]; then
    value="32"
  else
    exit 1
  fi
  echo ${value}
}

# Get Linux distribution
distribution() {
  if [ -e /etc/debian_release ]; then
    if [ -e /etc/lsb-release ]; then
      name="ubuntu"
    else
      name="debian"
    fi
  elif [ -e /etc/arch-release ]; then
    name="arch"
  else
    exit 1
  fi
  echo ${name}
}
