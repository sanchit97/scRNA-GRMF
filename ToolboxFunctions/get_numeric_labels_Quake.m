function [labels] = get_numeric_labels_Quake()

data_dir='../Data/'

load([data_dir 'Annotations/Quake_annotations.mat']); %anno=csvread([data_dir 'Annotations/Kolodziejczyk_annotations.csv']);
gt_labels=anno;
save('../Temp/Quake_labelNames.mat','gt_labels');
keySet = {'OPC','astrocytes','endothelial','fetal_quiescent','fetal_replicating','hybrid','microglia','neurons' ,'oligodendrocytes' }
valueSet = [1,2,3,4,5,6,7,8,9];
mapi=containers.Map(keySet,valueSet); %access labels using map(gt{i})
labels=[];
for i=1:length(gt_labels)
labels=[labels;mapi(gt_labels{i})];
end

end

