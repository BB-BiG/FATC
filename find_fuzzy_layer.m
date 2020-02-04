function [time_layer] = find_fuzzy_layer(data, num_layer)
% find the orbital structure of data
% num_layer = number of orbits
% data is the dataset, with row as genes and coumns as time points
[r,c] = size(data);
%d = 20;
%delta = d/num_layer;
m = 2.5;
layer_array = linspace(min(min(data)),max(max(data)),num_layer);
for time = 1:c
    for i=1:r
        for j=1:num_layer
            x = abs(data(i,time)-(layer_array(j)));
            mu=0;
            for k=1:num_layer
                y = abs(data(i,time)-(layer_array(k)));
                if y==0
                    y = 0.00000000000000001;
                end
                mu = mu+(x/y);
            end
            mu = mu^(2/(m-1));
            mu = 1/mu;
            if mu==Inf
                mu = 0.99999;
            end
            match_layer(i,j) = mu;
        end
    end
    time_layer(time,:,:) = match_layer(:,:);
    %% time_layer(i,j,k) => mu for ith time point, jth gene in kth layer
end
end