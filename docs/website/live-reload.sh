#!/usr/bin/env bash

# ---- copy essential m4md files to /static ----
cp ../../docker/latest/Dockerfile static/Dockerfile-latest

# ---- copy example outputs to worked examples directory ----

# EX_PATH=content/docs/1-guide/d-worked-examples
# mkdir -p $EX_PATH/example-analysis-configs && \
#     cp -r ../../assets/_config/M4MD $EX_PATH/example-analysis-configs/

# EX1=M4MD/ELDO/counts/y_sim/pois_exp_b0_hier-site/w1
# for d in $EX1
#     do
#         EX1_F1=01-diagnostics/convergence-diagnostics.txt
#         EX1_F2=02-checking/op/op-y-rep.jpg
#         EX1_F3=02-checking/ppc/unit_code/y-rep-by-unit_code-stats.jpg
#         EX1_F4=03-inference/coef/beta-coef-estimates-untransformed.png
#         EX1_F5=03-inference/coef/additional-coef-estimates-Beta-untransformed.png
#         for f in $EX1_F1 $EX1_F2 $EX1_F3 $EX1_F4 $EX1_F5
#         do
#             mkdir -p $EX_PATH/example-analysis-outputs/$d && \
#                 cp ../../assets/_output/$d/$f $EX_PATH/example-analysis-outputs/$d
#             # If the file is plaintext, strip trailing linebreak(s)
#             if [[ $f == *.txt ]]; then
#                 EX_TXT=$EX_PATH/example-analysis-outputs/$d/$(basename $f)
#                 wc -l < $EX_TXT | perl -pe 'chomp'
#             fi
#         done
#     done

pandoc content/posts/bib.bib -t csljson -o content/posts/bib.json
hugo server --disableFastRender -D
