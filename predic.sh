#!/bin/sh
#./fasttext predict-prob model_age_25.bin - 2 0.0001 <./data/predict_data.csv >res_age.txt
./fasttext predict-prob model_gender_25.bin - 2 0.0001 <./data/predict_data.csv >res_gender.txt
