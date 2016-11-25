
# coding: utf-8

# In[8]:

import pykov
# Doc at https://github.com/riccardoscalco/Pykov
# $ pip install git+git://github.com/riccardoscalco/Pykov@master #both Python2 and Python3
# Note that Pykov depends on numpy and scipy
import time
import random


# In[2]:

T = pykov.Matrix()


# In[3]:

# 3 states  (each row must sum 1)
# idle -> no sound
# harmonic -> choose one harmonic sound (or note) from database with a given frec and time?
# inharmonic

T['idle','harmonic'] = .4
T['idle','inharmonic'] = .1
T['idle','idle'] = .5

T['harmonic','idle'] = .2
T['harmonic','inharmonic'] = .1
T['harmonic','harmonic'] = .7

T['inharmonic','idle'] = .9
T['inharmonic','inharmonic'] = .1
#T['inharmonic','inharmonic'] = 0


# In[4]:

T


# In[5]:

T.stochastic() #check


# In[9]:

events = 10 # or loop with while(1)
state = 'idle' #start state
for i in range(events):
      print( state ) # call the right method for the state here
      state = T.succ(state).choose() #new state
      #time_between_notes = random.uniform(0.,2.) #in seconds
      #time.sleep(time_between_notes)


# Aplicación con sonido en: https://github.com/sonidosmutantes/apicultor/blob/master/SimpleStateMachine.py
