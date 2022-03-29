#!/usr/bin/env bash

cp ../../docker/latest/Dockerfile static/Dockerfile-latest
pandoc content/posts/bib.bib -t csljson -o content/posts/bib.json
hugo server --disableFastRender -D
