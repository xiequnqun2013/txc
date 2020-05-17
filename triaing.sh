#!bin/sh
params ="-lr 0.5 -epoch 25 -wordNgrams 2 -bucket 200000 -dim 50 -loss one-vs-all"
echo ${params}

# gender training
./fasttext supervised -input ./data/gender_training.cvs -output model_gender_25 ${params} 
./fasttext predict-prob model_gender_25.bin - 2 0.0001 <./data/predict_data.csv >res_gender.txt

exit
# clean models 
rm model_gender*

# age training
./fasttext supervised -input ./data/age_training.cvs -output model_age_25 ${params} 
./fasttext predict-prob model_age_25.bin - 2 0.0001 <./data/predict_data.csv >res_age.txt

# gen submit
python3 genSubmit.py ${params}
