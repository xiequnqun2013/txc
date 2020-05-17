#!bin/sh
params="-lr 0.5 -epoch 25 -wordNgrams 2 -bucket 200000 -dim 50 -loss one-vs-all"
p=$(echo "${params}" | sed s/[[:space:]]//g)
echo ${params}
echo ${p}
