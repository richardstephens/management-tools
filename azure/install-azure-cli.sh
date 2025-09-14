#!/usr/bin/env bash

set -xeuo pipefail

mkdir -p /etc/apt/keyrings

curl -o microsoft.asc -sLS https://packages.microsoft.com/keys/microsoft.asc \
	&& sha256sum -c microsoft.asc.sha256

cat microsoft.asc | gpg --dearmor |tee /etc/apt/keyrings/microsoft.gpg > /dev/null

chmod go+r /etc/apt/keyrings/microsoft.gpg

AZ_DIST=$(lsb_release -cs)
echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | tee /etc/apt/sources.list.d/azure-cli.sources

apt-get update
apt-get install -y azure-cli

