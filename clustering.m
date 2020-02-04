function [cluster,type,time_sim] = clustering(complete_map, g_i,time_layer)
% clusters the complete_map depending upon the pairwise similarity in layer
% structure between genes
% complete map is the 
%
j=1;
time_sim = [];
type=[];
cluster =[];
distinct_type=[];
n=size(complete_map,1);
for i=1:n
    a = cell2mat(complete_map(g_i,i));  % confidence value
    if isempty(a)==0
        type(j,1:2) = a;
        type(j,3) = i;
        [sim_fib, time_points] = horizontal_similarity(g_i,i,time_layer);
        U = type(j,2);
        time_sim(i,:) = time_points(U,:);
        type(j,4) = bi2de(time_sim(i,:),'left-msb');
        j=j+1;
    end
end
fprintf('    Finding clusters...\n')
if isempty(type)==0
    distinct_type = unique(type(:,2));
    fprintf('  %d clusters are found\n Exploring the cluster variable\n', numel(distinct_type));
    cluster = zeros(numel(distinct_type),n);
    for i=1:numel(distinct_type)
        n = numel(find(type(:,2)==distinct_type(i)));
        cluster(i,1:n) = type(find(type(:,2)==distinct_type(i)),3);
    end
else
    fprintf('   No cluster is found!\n');
end
%time_sim = bi2de(time_sim);
end