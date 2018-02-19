#!/usr/bin/env bash
set -e

PROTOC=/usr/local/protoc/bin/protoc

cd proto

for proto in v1/application v1/artifact; do
    ${PROTOC} -I/usr/local/protoc/include -I./v1 -I$GOPATH/src -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis --go_out=plugins=grpc:../ ${proto}.proto
done

