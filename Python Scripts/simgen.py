import numpy as np
import scipy.io
import h5py 
import pickle
from scipy.spatial.distance import cosine
import time


mat = scipy.io.loadmat('./Prob1_mcImpute/DATA/processed_data/Kolodziejczyk_processed_GfMnLt.mat')
# print mat
# for i in mat:
# 	print i
dat=mat['processed_data']
print dat.shape
print type(dat)

sd=np.zeros((dat.shape[0],dat.shape[0]))
print sd.shape
st=np.zeros((dat.shape[1],dat.shape[1]))
print st.shape

for i in range(dat.shape[0]):
	print i
	for j in range(dat.shape[0]):
		m=dat[i,:]
		n=dat[j,:]
		x=cosine(m,n)
		sd[i][j]=x

print sd.shape
with open('./Prob1_mcImpute/DATA/processed_data/sd_Kolodziejczyk.pkl','wb') as f:
	pickle.dump(sd,f)

for i in range(dat.shape[1]):
	print i
	for j in range(dat.shape[1]):
		m=dat[:,i]
		n=dat[:,j]
		x=cosine(m,n)
		st[i][j]=x

print st.shape

with open('./Prob1_mcImpute/DATA/processed_data/st_Kolodziejczyk.pkl','wb') as f:
 	pickle.dump(st,f)



# m=np.load('./Triplet/T_final.pkl')
# print m.shape
# m.astype(np.float32)
# scipy.io.savemat('./Triplet/T_final.mat', dict(x=m))