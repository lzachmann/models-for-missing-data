#!/usr/bin/env bash

APPLICATION=${1:-R} # one of: R or Hugo

if [ ${APPLICATION,,} == "r" ]; then

  ENTRYPOINT=${2:-/init} # one of: /init or /bin/bash (or just 'bash')
  TAG=${3:-latest}

  REPO=$(basename $(pwd))
  IMAGE_NAME=ghcr.io/lzachmann/$REPO:$TAG

  if [[ "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; then
    echo "Image not found, building from recipe."
    $(find . -path \*build.sh -maxdepth 2) $TAG
  fi

  if [ ${ENTRYPOINT} == "/init" ]; then
    PORT=${4:-8787}
    echo "http://localhost:$PORT/ (with usr and pwd 'bayes')"
  fi

  mkdir -p .config/rstudio
  cp assets/rstudio-prefs.json .config/rstudio
  cp assets/.Rprofile .

  docker run -it --rm \
		--name ${APPLICATION,,}-m4md-$PORT \
    -p $PORT:8787 \
		-v "$(pwd)":/home/bayes \
		-w /home/bayes \
		-e USER="bayes" \
		-e PASSWORD="bayes" \
    --entrypoint $ENTRYPOINT \
		$IMAGE_NAME

  rm -r .config .local rstudio .Rprofile

elif [ ${APPLICATION,,} == "hugo" ]; then

  docker run --rm -it \
    --name ${APPLICATION,,}-m4md-1313 \
    -p 1313:1313 \
    -v $(pwd):/src \
    -w /src/docs/website \
    klakegg/hugo:0.89.4-ext-ubuntu \
    shell # ./live-reload.sh

fi
