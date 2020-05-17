#!bin/sh
params="-lr 1 -epoch 25 -loss one-vs-all"
echo ${params}

# clean models 
rm model_gender*
rm model_age*

# gender training
./fasttext supervised -input ./data/full_gender_training.cvs -output model_gender_25 ${params} 
./fasttext predict-prob model_gender_25.bin - -1  <./data/predict_data.csv >res_gender.txt
rm model_gender*

# age training
./fasttext supervised -input ./data/full_age_training.cvs -output model_age_25 ${params} 
./fasttext predict-prob model_age_25.bin - -1  <./data/predict_data.csv >res_age.txt
rm model_age*

# gen submit
# remove space in command line
p=$(echo "${params}" | sed s/[[:space:]]//g)
python3 genSubmit.py ${p}
