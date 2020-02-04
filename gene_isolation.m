% function for gene_isolation from c_id matrix
conn_count = zeros(363,2);
for i=1:363  %number of genes
    k=1;
    for j=20364:20368
        if c_id(j,2) == i
            k=k+1;
        end
    end
    conn_count(i,1) = i;
    conn_count(i,2) = k;
end