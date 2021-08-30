#!/usr/bin/env bash

APPLICATION=${1:-rstudio} # one of: rstudio or hugo

if [ ${APPLICATION} == "rstudio" ]; then

  ENTRYPOINT=${2:-/init} # one of: /init or /bin/bash (or just 'bash')
  TAG=${3:-latest} # latest is currently the only option, but this may change

  REPO=$(basename $(pwd))
  IMAGE=ghcr.io/lzachmann/$REPO:$TAG

  if [[ "$(docker images -q $IMAGE 2> /dev/null)" == "" ]]; then
    echo "Image not found, building from recipe."
    $(find . -path \*build.sh -maxdepth 2) $TAG
  fi

  if [ ${ENTRYPOINT} == "/init" ]; then
    PORT=${4:-8787}
    echo "http://localhost:$PORT/ (with usr and pwd 'bayes')"
  fi

  # # rm -rf kitematic/ .rstudio/ rstudio/
  # docker run -it --rm \
  # 		--name rstudio-m4md-$PORT \
  # 		-v "$(pwd)":/home/bayes \
  # 		-w /home/bayes \
  # 		-e USER="bayes" \
  # 		-e PASSWORD="bayes" \
  # 		-p $PORT:8787 \
  #     --entrypoint $ENTRYPOINT \
  # 		$IMAGE

elif [ ${APPLICATION} == "hugo" ]; then

  docker run --rm -it \
    -p 1313:1313 \
    -v $(pwd):/src \
    -w /src/docs/website \
    klakegg/hugo:0.83.1-ext-ubuntu \
    shell

    # hugo server -D

fi
