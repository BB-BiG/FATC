n = 232;  % number of genes
time_layer = find_fuzzy_layer(dataset, 5);
for i=1:n
    [cluster,type,time_sim] = clustering(comp_map, i, time_layer);
    [p,q] = size(type);
    for j=1:p
       % if isempty(FINAL_CLUSTER(i,type(j,3)))~=0
            FINAL_CLUSTER(i,type(j,3)) = {[type(j,2),type(j,4)]};
        %end
    end
    p=0; q=0;
end
k = 1;
% for i=1:n
%     for j=1:n
%         A = cell2mat(FINAL_CLUSTER(i,j));
%         if isempty(A)~=1
%             x(k) = A(1); y(k) = A(2);
%             %plot(x,y,'db');
%             %hold on
%             k = k+1;
%         end
%     end
% end
  
for i=1:n
    for j=1:n
        A = cell2mat(FINAL_CLUSTER(i,j));
        if isempty(A)~=1
            CLUSTER_INFO_POINTS(i,j) = c_id(k);
            c_id(k,2) = i; c_id(k,3) = j; 
            %x(k) = A(1); y(k) = A(2);
            %plot(x,y,'db');
            %hold on
            k = k+1;
        end
    end
end
        