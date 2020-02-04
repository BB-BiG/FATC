function [fuzzy_supp, fuzzy_conf] = find_fuzzy_supp_conf(table, n)
% finds fuzzy support and confidence in different layers
% n => number of layers
[time_layer] = find_fuzzy_layer(table, n); % 10 is for fcmeans(m)

[t,g,c] = size(time_layer);
for i=1:c
    data = time_layer(:,:,i);
    [fs,fc] = fuzzy_association(data);
    for j=1:g
        for k=1:g
            fuzzy_supp(j,k,i)=fs(j,k);
            fuzzy_conf(j,k,i)=fc(j,k);
        end
    end
end
end