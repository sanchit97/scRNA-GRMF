%done for MB and Usoskin

%check raw data criteria (raw is logtr and mednorm reversed )

clear
title_fontsize=20;

data_dir='../Data/'
addpath(genpath('../ToolboxFunctions')); 


t={'PCA','tSNE','ST10'}
rn=1
dataname='Preimplantation'% 'Usoskin'; % 'Quake'%

actual_labels=eval([ 'get_numeric_labels_' dataname '()' ]); 
pro_dir=[data_dir 'Processed Data/' dataname '_processed_GfMnLt.mat'];

for i=1:3
    
tech=t{i};
figure;
subplot(1,3,1);
Xrec=csvread([data_dir 'Raw Data/' dataname '_raw_data.csv'],1,1)';
sv=call_cell_visualization( Xrec, actual_labels, tech, rn  );
tt=title(['Raw Data: ' num2str(sv) ]);
tt.FontSize=title_fontsize;

subplot(1,3,2);
load(pro_dir)
data=processed_data;
sv=call_cell_visualization( data, actual_labels, tech, rn );
tt=title(['No Imputation ' num2str(sv) ]);
tt.FontSize=title_fontsize;

subplot(1,3,3);
xx=load([data_dir '/GRMF Matrices/' dataname '/rec.mat'])
xx=cell2mat(struct2cell(xx));
sv=call_cell_visualization( xx, actual_labels , tech, rn );
tt=title(['GRMF: ' num2str(sv) ]);
tt.FontSize=title_fontsize;


end