f = waitbar(0,'clustring in process...');
n = 232; % number of genes
gene_connection = zeros(n,3);
complete_cluster = zeros(n,n);
for i = 1:n
    i
    [cluster,type] = clustering(complete_map,i);
    s = size(type,1);
    
    if s>1
        for j=1:s
            complete_cluster(i,type(j,3)) = type(j,2);
        end
    else
        complete_cluster(i,:) = 0;
    end
    waitbar(i/n,f,sprintf('%12.2f',(i*100)/n));
end
for i= 1:n
    gene_connection(i,1) = i;
    gene_connection(i,2) = size(nonzeros(complete_cluster(i,:)),1);
    gene_connection(i,3) = size(nonzeros(complete_cluster(:,i)),1);
end