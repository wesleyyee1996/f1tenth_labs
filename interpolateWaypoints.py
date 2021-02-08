#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Feb  7 06:54:43 2021

@author: meam520
"""

import numpy as np
from scipy.interpolate import Rbf
import matplotlib.pyplot as plt
import pandas as pd

data = pd.read_csv(r'/home/meam520/rcws/logs/wp-2021-02-07-13-40-22.csv')
df = pd.DataFrame(data, columns = ['X','Y','Z','S'])

#df.plot(x='X',y='Y');

#f=df.to_numpy()
#x=f[:,0]
#y=f[:,1]
#z=f[:,2]
#plt.scatter(x,y,100,z)

#new = df.interpolate(method='linear', axis=1, limit=None, inplace=False, downcast=None)
#print(new)