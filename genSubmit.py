#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''
    author : xieqq
    Date   : 20191028
'''
import time
import datetime
import sys
import pandas as pd

class Worker(object):
    def __init__(self):
        pass

    def Run(self):
        ages = []
        with open('./res_age.txt') as fp:
            while 1:
                lines = fp.readlines(10000)
                if not lines:
                    break
                for line in lines:
                    sps = line.strip().split(' ')
                    label = sps[0]
                    res = label[9:]
                    ages.append(res)
        print ("Total ages: ",len(ages))

        genders = []
        with open('./res_gender.txt') as fp:
            while 1:
                lines = fp.readlines(1000)
                if not lines:
                    break
                for line in lines:
                    sps = line.strip().split(' ')
                    label = sps[0]
                    res = label[9:]
                    genders.append(res)
        print ("Total genders: ",len(genders))
        
        now = datetime.datetime.now()
        date_str = now.strftime("%Y-%m-%d%H-%M-%S")

        fileName ='submit_'+date_str+sys.argv[1].replace(' ','')+'.csv'
        lines = []
        cnt = 0
        for i in range(3000001,4000001):
            index = i - 3000001
            #print ("current index:",index)
            line  = [str(i),str(ages[index]),str(genders[index])]
            lines.append(line)
            cnt += 1
        outPD = pd.DataFrame(lines,columns =['user_id','predicted_age','predicted_gender'])
        outPD.to_csv(fileName,index=False)
        print("DOWN GOOG LUCK Total Lines:",cnt)



if __name__ == '__main__':
    Worker().Run()
