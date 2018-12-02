import numpy as np
import scipy.io
import h5py 
import pickle
# import cPickle


# mat = scipy.io.loadmat('./Prob1_mcImpute/DATA/processed_data/Zeisel_processed_GfMnLt.mat')
# print mat
# for i in mat:
# 	print i
# dat=mat['processed_data']
# print dat.shape
# print type(dat)
# with open('./Prob1_mcImpute/processedData/Zeisel.pkl','wb') as f:
# 	pickle.dump(dat,f)



# m=cPickle.loads('../Data/Processed Data/Preimplantation/sd_Preimplantation.pkl')
# print (m)
m=np.load('../Data/Processed Data/Preimplantation/sd_Preimplantation.pkl')
# print m
# print m.shape
m.astype(np.float32)
o=np.ones(m.shape)
f=o-m
print (f)
scipy.io.savemat('../Data/Processed Data/Preimplantation/sd_Preimplantation.mat', dict(x=f))