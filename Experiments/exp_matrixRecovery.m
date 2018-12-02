

clear;  clc;
tic
addpath(genpath('../ToolboxFunctions')); 


rng(0);
dataX=load('../Data/GRMF Matrices/Zeisel/rec.mat');
dataX=cell2mat(struct2cell(dataX));
% dataX=processed_data;

fe=[]; re=[]; me=[];
for sr=0.5:0.1:0.9
    
    SAMPLING_RATIO=sr;
    N = numel(dataX);
    t = randperm(N);
    ind=round(SAMPLING_RATIO*N);
    IDX = t(1:ind);
    IDX2= t(ind+1:end); 
    M2=opRestriction(N,IDX2);
    %IDX = find(dataX);
    M = opRestriction(N,IDX);
    disp(size(M));
    y = M(dataX(:),1);

    Xrec = IST_MC(y,M,size(dataX),0);

    fro_error=norm( M2(Xrec(:),1)-M2(dataX(:),1), 'fro')/norm(M2(dataX(:),1),'fro'); 
    fe=[fe fro_error];
    RMSE = sqrt(mean( (M2(Xrec(:),1) - M2(dataX(:),1)).^2 )); re=[re RMSE]
    MAE= mean(abs(M2(Xrec(:),1)-M2(dataX(:),1) )); me=[me MAE]
end


rank=100
fe=[]; re=[]; me=[];
for sr=0.5:0.1:0.9
    
    SAMPLING_RATIO=sr;
    N = numel(dataX);
    t = randperm(N);
    ind=round(SAMPLING_RATIO*N);
    IDX = t(1:ind);
     IDX2= t(ind+1:end); M2=opRestriction(N,IDX2);

    M = opRestriction(N,IDX);
    y = M(dataX(:),1);
    Xrec = MF_MC(y,M,size(dataX),rank);
    
 fro_error=norm( M2(Xrec(:),1)-M2(dataX(:),1), 'fro')/norm(M2(dataX(:),1),'fro'); fe=[fe fro_error];
    RMSE = sqrt(mean( (M2(Xrec(:),1) - M2(dataX(:),1)).^2 )); re=[re RMSE]
    MAE= mean(abs(M2(Xrec(:),1)-M2(dataX(:),1) )); me=[me MAE]
end
