
clear;  clc;
tic

data_dir='./Data/'
%sparco needed->
addpath(genpath('./ToolboxFunctions'));

% dataname='Blakeley';
% dataname='Quake'; 
% dataname='Zeisel';
% dataname='Kolodziejczyk';
% dataname='Usoskin';
% dataname='Jurkat';
dataname='Preimplantation';

 pro_dir=[data_dir 'Processed Data/'];
 
 gene_names=[]; gene_ids=[];
 
 %% Data read
if(strcmp(dataname, 'Usoskin') | strcmp(dataname, 'Zeisel') | strcmp(dataname, 'Jurkat') | strcmp(dataname, 'Quake') | strcmp(dataname,'Blakeley')| strcmp(dataname,'Preimplantation') | strcmp(dataname,'Kolodziejczyk'))
    data=csvread([data_dir 'Raw Data/' dataname '_raw_data.csv'],1,1)' ;
    pro_dir=[data_dir 'Processed Data/' dataname '_processed_GfMnLt.mat'];
end

disp("Done");
% %% CALL Processing
call_process(data,'dataname',dataname,'gene_names',gene_names,'gene_ids', gene_ids,'pro_dir',pro_dir);

%% Save results
%mkdir(['RecoveredMatrices/' dataname '_imputed']); 
%save(['RecoveredMatrices/' dataname '_imputed/rec.mat'],'data_recovered') 
% Xrec=data_recovered;
% save([name '' dataname '/rec.mat'],'Xrec','-v6') % -v6 if .mat file has to be read in R
% time_taken=toc 
% 
% rng(0);
% actual_labels=eval([ 'get_numeric_labels_' dataname '()' ]); 
% list_ni=[]; list_mc=[];
% for (i=1:100) 
% loc=randperm(length(actual_labels),length(unique(actual_labels)));
% load(pro_dir)%load(['processedData/' 'mbtest' '_processed.mat']);
% ari_ni=call_kmeans(processed_data,'PCA', loc ,actual_labels); list_ni=[list_ni ari_ni];      
% ari_mc=call_kmeans(data_recovered,'PCA', loc ,actual_labels); list_mc=[list_mc ari_mc];
% end
% avg_ari_ni=mean(list_ni)
% avg_ari_mc=mean(list_mc);