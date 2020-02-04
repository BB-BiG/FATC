function [comp_map] = find_complete_map_fuzzy(table, n)
% finds the complete_map of pairwise associations, it calls
% find_association() with the given support and confidence thresholds
% comp_map(i,j) contains the fuzzy support, layer number having that
% support value
% confidence_th,
[fuzzy_supp, fuzzy_conf] = find_fuzzy_supp_conf(table, n);
[time_layer] = find_fuzzy_layer(table, n);
support_th = 0.3;
[g,g,c] = size(fuzzy_conf);

fprintf('g=%d',g);
for i=1:g
    fprintf('i=%d\n',i);
    for j = 1:g
        sim_fib = horizontal_similarity(i,j,time_layer);
        a(1,:) = fuzzy_conf(i,j,:);
        fc = a.*sim_fib;
        [k,U] = max(fc);        
        if (fuzzy_supp(i,j,U)>=support_th)
            fprintf('FS = %d\n',fuzzy_supp(i,j,U));
            comp_map(i,j)= {[k,U]}; 
            %comp_map(j,i)= {[k,U]}; 
        else
            comp_map(i,j)= {[]};
            %comp_map(j,i)= {[]};
        end
    end
end
end