function [ si ] = call_mySilhouette( X, IDX,K )
%CALL_MYSILHOUETTE Summary of this function goes here
%   Detailed explanation goes here

s = mySilhouette(X, IDX);
si=mean(s);

%# plot
N=size(X,1);
[~,ord] = sortrows([IDX s],[1 -2]);
indices = accumarray(IDX(ord), 1:N, [K 1], @(x){sort(x)});
ytick = cellfun(@(ind) (min(ind)+max(ind))/2, indices);
ytickLabels = num2str((1:K)','%d');           %#'

h = barh(1:N, s(ord),'hist');
set(h, 'EdgeColor','none', 'CData',IDX(ord))
set(gca, 'CLim',[1 K], 'CLimMode','manual')
set(gca, 'YDir','reverse', 'YTick',ytick, 'YTickLabel',ytickLabels)
xlabel('Silhouette Value'), ylabel('Cluster')
end

