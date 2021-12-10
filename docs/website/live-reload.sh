#!/usr/bin/env bash

pandoc content/posts/bib.bib -t csljson -o content/posts/bib.json
hugo server -D
