#!/bin/bash

set -e

user="nvidia"
passwd="nvidia"

folder=${HOME}/src
mkdir -p $folder

echo "** Download protobuf-3.7.1 sources"
cd $folder
wget https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/protobuf-python-3.7.1.zip
wget https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/protoc-3.7.1-linux-aarch_64.zip

echo "** Install protoc"
unzip protobuf-python-3.7.1.zip
unzip protoc-3.7.1-linux-aarch_64.zip -d protoc-3.7.1
sudo cp protoc-3.7.1/bin/protoc /usr/local/bin/protoc

echo "** Build and install protobuf-3.7.1 libraries"
export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=cpp
cd protobuf-3.6.1/
./autogen.sh
./configure --prefix=/usr/local
make
make check
sudo make install

echo "** Build protobuf-3.7.1 successfully"
