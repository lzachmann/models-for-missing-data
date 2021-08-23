#!/usr/bin/env bash

# Action code

R_FILE="${1:-model-api/.empty.R}"
ARGS="${2:-none}"
OPTS="${3:-none}"

if [ "${ARGS}" == "none" && "${OPTS}" == "none" ]; then
  Rscript "${R_FILE}"
else
  if [ "${ARGS}" != "none" && "${OPTS}" == "none" ]; then
    Rscript "${R_FILE}" "${ARGS}"
  else
    Rscript "${R_FILE}" "${ARGS}" "${OPTS}"
	fi
fi

time=$(date)
echo "::set-output name=time::$time"
