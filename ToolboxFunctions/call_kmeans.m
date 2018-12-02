function [ari] = call_kmeans(inputdata,technique, loc ,actual_labels)
        
k=length(unique(actual_labels));
 
[inputdata,~]=compute_mapping(inputdata,technique,2);
init =inputdata(loc,:);
predicted_labels=kmeans(inputdata,k,'Start',init, 'maxIter',1000);%without impu

[~,ari]=getRiAri(actual_labels,predicted_labels);


end