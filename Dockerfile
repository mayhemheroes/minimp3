# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y make clang wget

## Add source code to the build stage.
ADD . /minimp3

WORKDIR /minimp3/fuzzing
RUN ./get-afl.sh
RUN ./build.sh

## Package Stage
FROM --platform=linux/amd64 ubuntu:20.04

COPY --from=builder /minimp3/fuzzing/fuzz /
