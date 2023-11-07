#!/usr/bin/env bash
set -Eeu

sh -c 'echo "deb [trusted=yes] https://apt.fury.io/kosli/ /"  > /etc/apt/sources.list.d/fury.list'
# On a clean debian container/machine, you need ca-certificates
apt install ca-certificates
apt update
apt install kosli="$KOSLI_CLI_VERSION"
