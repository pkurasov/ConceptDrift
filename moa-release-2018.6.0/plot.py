#!/usr/bin/env python3

import pandas_datareader
from pandas_datareader import data
import matplotlib.pyplot as plt
import pandas as pd
import pandas_datareader.data as web
import datetime
from pandas_datareader import data 
import psycopg2
import re
import os



conn = psycopg2.connect("host='localhost' dbname='melanie' user='postgres' password='5x6VENIK'")
cur = conn.cursor() #Create the cursor
cur.execute("SELECT boost_no_mel_no_drift50_0.id as num_ex_recieved,boost_no_mel_no_drift50_0.classifications_correct_percent as OnlineBoosting,AVGtheta_nd_50_0.accuracy as Melanie_with_no_src_avg_theta,ddm_with_boost_50_0.classifications_correct_percent as ddm_with_boosting FROM boost_no_mel_no_drift50_0,ddm_with_boost_50_0,AVGtheta_nd_50_0 where boost_no_mel_no_drift50_0.id = AVGtheta_nd_50_0.num_ex_recieved and AVGtheta_nd_50_0.num_ex_recieved = ddm_with_boost_50_0.id;")
rows = cur.fetchall()
conn.close()


df = pd.DataFrame(rows, columns=['num_ex_recieved','OnlineBoosting','Melanie_with_no_src_avg_theta','ddm_with_boosting'])

df.to_csv("file.csv")
df.num_ex_recieved = df.num_ex_recieved.astype(int)
df.OnlineBoosting  = df.OnlineBoosting.astype(float)
df.Melanie_with_no_src_avg_theta  = df.Melanie_with_no_src_avg_theta.astype(float)
df.ddm_with_boosting  = df.ddm_with_boosting.astype(float)




df = pd.read_csv('file.csv', index_col='num_ex_recieved')
df[['OnlineBoosting','Melanie_with_no_src_avg_theta','ddm_with_boosting']].plot()

plt.show()
