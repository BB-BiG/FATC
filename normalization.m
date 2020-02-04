function [table] = normalization(table)
%% Row-wise normalization of table
%table = table';
[r,c] = size(table);
table1 = zeros(r,c);
for i=1:r
    range = max(table(i,:)) - min(table(i,:));
    table1(i,:) = (table(i,:) - min(table(i,:))) / range;
    range2 = 10;
    table1(i,:) = ((table1(i,:) *range2)-5 );
end
table = table1;