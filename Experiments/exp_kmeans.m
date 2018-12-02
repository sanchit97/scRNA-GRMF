clear;
clc;
addpath(genpath('../ToolboxFunctions'));
addpath(genpath('../Data'));
data_dir='../Data/'


technique='Laplacian'

dataname='Preimplantation';% 'Zeisel'%'Jurkat' %  'Usoskin'%'Kolodziejczyk' %'Blakeley'%'Usoskin'%'Jurkat' %
actual_labels=eval([ 'get_numeric_labels_' dataname '()' ]); 

nlabels=7; 
pro_dir=[data_dir 'Processed Data/' dataname '_processed.mat'];
 
list_ni=[]; list_raw=[]; list_dr=[]; list_mag=[]; list_grmf=[];
for (i=1:10)
    k=length(unique(actual_labels));
    loc=randperm(length(actual_labels),k);

    pro_dir=[data_dir 'Processed Data/' dataname '_processed_GfMnLt.mat'];
    load(pro_dir);
     
    ari_ni=call_kmeans(processed_data,technique, loc ,actual_labels)


    %Raw
    data=csvread([data_dir 'Raw Data/' dataname '_raw_data.csv'],1,1)' ;
    ari_raw=call_kmeans(data,technique, loc ,actual_labels)

    %GRMF
    xx=load(['../Data/GRMF Matrices/' dataname '/rec.mat']);
    xx=cell2mat(struct2cell(xx));
    ari_grmf=call_kmeans(xx,technique, loc ,actual_labels)
    disp("Done");


list_ni = [list_ni ari_ni]; 
list_raw = [list_raw ari_raw];
list_grmf = [list_grmf ari_grmf];
end
avg_ni=sum(list_ni)/10; 
avg_raw=sum(list_raw)/10; 
avg_grmf=sum(list_grmf)/10;