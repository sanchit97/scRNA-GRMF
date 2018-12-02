function [labels] = get_numeric_labels_Blakeley()

data_dir='../Data/'

load([data_dir 'Annotations/Blakeley_annotations.mat']); %anno=csvread([data_dir 'Annotations/Kolodziejczyk_annotations.csv']);
gt_labels=anno;
keySet =   { 'PE','epiblast','trophectoderm'};
valueSet = [1,2,3];
mapi=containers.Map(keySet,valueSet); %access labels using map(gt{i})
labels=[];
for i=1:length(gt_labels)
labels=[labels;mapi(gt_labels{i})];
end

end

