#!/bin/bash
# Get operation system name
function os() {
  os="$(uname -o)"
  if [ ${os} = "Darwin" ]; then
    os_name="Darwin"
  elif [ ${os} = "GNU/Linux" ]; then
    os_name="Linux"
  else
    echo "Unexpected operation system ${os}"
    exit 1
  fi
  echo ${os_name}
}

# Get architecture
# "64" or "32" will return
function architecture() {
  arch=$(uname -m)
  if [ ${arch} = "x86_64" ]; then
    value="64"
  elif [ ${arch} = "i386" ]; then
    value="32"
  else
    exit 1
  fi
  echo ${value}
}

# Get Linux distribution
function distribution() {
  if [ -e /etc/debian_release ] || [ -e /etc/debian_version ]; then
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
