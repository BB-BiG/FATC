function S = random_prediction(data,sel_n)
% sel_n = selected number of genes
t = 10;
n = size(data,1);
rng('shuffle')
S=0;
for i=1:t
    rng(i)
    rand_sel = randi([1 n],sel_n,1);
    rand_data = data(rand_sel,:);
    [predicted_data, rmse] = predict_lstm(rand_data);
    S = S+mean(rmse(:,2));
end
S = S/t;
end