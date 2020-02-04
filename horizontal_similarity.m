function [sim_fib,time_points] = horizontal_similarity(g1,g2,time_layer)
% t = number of time points
t = size(time_layer,1);
layer = size(time_layer,3);
for i=1:t
    [m,loc] = max(time_layer(i,g1,:));
    x(1,i)  = loc;
end
for i=1:t
    [m,loc] = max(time_layer(i,g2,:));
    x(2,i)  = loc;
end
% 
% count = 1;
% while(x(1,count)==x(2,count))
%     count = count+1;
% end
time_points = zeros(layer,t);
for l = 1:layer
    i = 1;
    a= ones(layer,1);
    while(i<=t)
        if(x(1,i)==l)&&(x(2,i)==l)
            time_points(l,i)=1;
            if(i==1)
                a(i) = 1;
            elseif(i==2)
                a(i) = 1;
            elseif(a(i-1)==0)
                a(i)=1;
            else
                a(i) =  a(i-1)+a(i-2);
            end
        else
            a(i) = 1;
        end
        i=i+1;
    end
    sim_fib(l) = sum(a);
end
end