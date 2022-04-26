# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake clang wget

## Add source code to the build stage.
ADD . /minimp3
WORKDIR /minimp3

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
WORKDIR /minimp3/fuzzing
RUN ./get-afl.sh
RUN ./build.sh

# # Package Stage
# FROM --platform=linux/amd64 ubuntu:20.04

## TODO: Change <Path in Builder Stage>
# RUN ./fuzz.sh
