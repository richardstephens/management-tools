#!/usr/bin/env bash


set -xeuo pipefail

arch=$(uname -m)

curl "https://awscli.amazonaws.com/awscli-exe-linux-$arch.zip" \
     -o "awscliv2.zip"

curl "https://awscli.amazonaws.com/awscli-exe-linux-$arch.zip.sig" \
    -o "awscliv2.sig"

gpg --import  aws-gpg.key
gpg --verify awscliv2.sig awscliv2.zip

unzip awscliv2.zip
./aws/install

rm -rf ./aws
rm awscliv2.zip

aws --version

