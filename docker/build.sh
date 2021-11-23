#!/usr/bin/env bash

TAG=${1:-latest}

FILE=$(find . -path \*$TAG/Dockerfile)
BUILD_CONTEXT=$(dirname $FILE)
REPO=$(basename $(pwd))
IMAGE_NAME=ghcr.io/lzachmann/$REPO:$TAG

cp assets/Latin-Modern-Roman-fontfacekit.zip $BUILD_CONTEXT
cd $BUILD_CONTEXT
docker build . --no-cache --rm -t $IMAGE_NAME
rm Latin-Modern-Roman-fontfacekit.zip
