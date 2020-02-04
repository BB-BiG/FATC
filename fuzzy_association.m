function [fs, fc] = fuzzy_association(data)
% finds the FUZZY_ASSOCIATION 
% fs=> fuzzy support
% fc=> fuzzy confience
% data => fuzzy layered data
[r,c]= size(data);
fs=zeros(c,c);
fc=zeros(c,c);

for m=1:c
    for n=1:c
        s=0;
        for i=1:r
            s = s+min(data(i,m),data(i,n));
        end
        fs(m,n) = s/r;
        fc(m,n) = s/sum(data(:,m));
    end
end
end

