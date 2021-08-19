#!/usr/bin/env bash

# Action code

Rscript "${1}" "${2}"
time=$(date)
echo "::set-output name=time::$time"
