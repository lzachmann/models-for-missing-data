#!/usr/bin/env bash

# Action code

R_FILE="${1:-model-api/.empty.R}"
ARGS="${2:-none}"
OPTS="${3:-none}"

OPTS_ARRAY=($OPTS)

if [[ "${ARGS}" == "none" && "${OPTS}" == "none" ]]; then
  Rscript "${R_FILE}"
else
  if [[ "${ARGS}" != "none" && "${OPTS}" == "none" ]]; then
    Rscript "${R_FILE}" "${ARGS}"
  else
    Rscript "${R_FILE}" "${ARGS}" "${OPTS_ARRAY[@]}"
	fi
fi

EXIT_STATUS=$?
echo "::set-output name=code::$EXIT_STATUS"
