clear;
clc;
addpath(genpath('../ToolboxFunctions')); 
data_dir='../Data/';

%no raandomness: rng(1);
%%top 100 genes has mistake, reasonable perf of 4 datsets on all genes

L1=2; L2=3; dataname='Preimplantation' 
% L1=2; L2=3; dataname='Blakeley'
%anno=get_numeric_labels_Kolodziejczyk();

% L1=8;  L2=5; dataname='Quake' %5-8
%     L1=1;  L2=3; dataname='Usoskin' %2nd 1-3pearson
% L1=2;  L2=8; dataname='Zeisel' %2-8
% L1=1;  L2=2; dataname='Jurkat' %1st spearman better
%L1=4;  L2=3; dataname= 'Preimplantation' %1st for 3-4, 1-4 
%L1=1;  L2=5;dataname= 'Mousebrain'; nlabels=7; %2nd for 1-5,  
pro_dir=[data_dir 'Processed Data/' dataname '_processed.mat'];

ncells2pick=[];

anno=eval([ 'get_numeric_labels_' dataname '()' ]); 




%cellCountByLabel=histc(anno, unique(anno)); [values, indices]=sort(cellCountByLabel,'desc'); ncells2pick = values(2);
%L=indices(1:2)'; L1=L(1); L2=L(2);

pro_dir=[data_dir 'Processed Data/' dataname '_processed_GfMnLt.mat'];
processed_data=load(pro_dir);
processed_data=cell2mat(struct2cell(processed_data));
% [mat,ind]=selectTopK_mostDispersedGenes( 2.^processed_data-1,1000 );
% dataX=log2(1+ mat ); save('Temp/topKindices.mat','ind');
[cts_ni]= call_cts(processed_data,anno, L1,L2, ncells2pick)

%%GRMF
xx=load([data_dir 'GRMF Matrices/' dataname '/rec.mat']);
xx=cell2mat(struct2cell(xx));
[cts_grmf]= call_cts(xx,anno, L1,L2, ncells2pick)

%%raw
Xrec=csvread(['../Data/Raw Data/' dataname '_raw_data.csv'],1,1)';
% [Xrec] = scimpute_processing(dataname,Xrec);%process(Xrec,[], [],2,3);
[cts_raw]= call_cts(Xrec,anno, L1,L2, ncells2pick)

       
      
  
   
% save(['Temp/intra1_' dataname '.mat']','v1un','v1sc','v1ma','v1dr','v1mc','-V6');
% save(['Temp/intra2_' dataname '.mat']','v2un','v2sc','v2ma','v2dr','v2mc','-V6');
% save(['Temp/inter_' dataname '.mat']','v3un','v3sc','v3ma','v3dr','v3mc','-V6');

       