
# coding: utf-8

## MIR Archivos de guitarra y bajo

# In[12]:

import os, sys
import soundAnalysis as SA # sms-tools + essentia


# In[13]:

#Bajar sonidos automáticamente vía REST API
#downloadSoundsRedPanal(search="", tags=[])


# In[14]:

SA.showDescriptorMapping()


# In[15]:

targetDir = 'taskRedPanal/'


# In[16]:

SA.descriptorPairScatterPlot(targetDir, descInput=(1,2), anotOn=1);


# In[17]:

SA.descriptorPairScatterPlot(targetDir, descInput=(0,1), anotOn=1);


# In[18]:

SA.descriptorPairScatterPlot(targetDir, descInput=(0,2), anotOn=1);


### Lista de archivos procesados:

# 1288: http://redpanal.org/a/bajo-alec/
# 982: http://redpanal.org/a/riff-bajo-1/
# 983: http://redpanal.org/a/riff-bajo-2/
# 1194: http://redpanal.org/a/tabla-tintaal-vilambit-1/
# 984: http://redpanal.org/a/riff-copado-1-guitarra/
# 795: http://redpanal.org/a/improvisacia3n-1-guitarra/
# 126: http://redpanal.org/a/tm-guitarra-bajo3/
