function [predicted_data, rmse] = predict_lstm(full_data)
[r,c] = size(full_data);
numTimeStepsTrain = floor(0.7*numel(full_data(1,:)));
fprintf('Number of traing samples = %d\n',numTimeStepsTrain);
numPred = c-numTimeStepsTrain;
fprintf('Number of predicted samples = %d\n',numPred);
predicted_data = zeros(r,numPred-1);
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0);
for i=1:r
    data = full_data(i,:);
    dataTrain = data(1:numTimeStepsTrain+1);
    dataTest = data(numTimeStepsTrain+1:end);
    mu = mean(dataTrain);
    sig = std(dataTrain);
    fprintf('i=%d*******************************\n',i);
    dataTrainStandardized = (dataTrain - mu) / sig;
    XTrain = dataTrainStandardized(1:end-1);
    YTrain = dataTrainStandardized(2:end);
    fprintf('Starting training________________________\n')
    net = trainNetwork(XTrain,YTrain,layers,options);
    dataTestStandardized = (dataTest - mu) / sig;
    XTest = dataTestStandardized(1:end-1);
    fprintf('Prediction starting_______________________\n')
    net = predictAndUpdateState(net,XTrain);
    [net,YPred] = predictAndUpdateState(net,YTrain(end));
    numTimeStepsTest = numel(XTest);
    fprintf('number of test steps=%d\n',numTimeStepsTest);
    for j = 2:numTimeStepsTest
        [net,YPred(:,j)] = predictAndUpdateState(net,YPred(:,j-1),'ExecutionEnvironment','cpu');
    end
    YPred = sig*YPred + mu;
    YTest = dataTest(2:end);
    rmse(i,1)=i;
    rmse(i,2) = sqrt(mean((YPred-YTest).^2));
    predicted_data(i,:) = YPred';
end
% 
% data = full_data(8,:);
% dataTrain = data(1:numTimeStepsTrain+1);
% figure
% %subplot(2,1,1)
% plot(dataTrain(1:end-1))
% hold on
% idx = numTimeStepsTrain:(numTimeStepsTrain+numTimeStepsTest);
% size(idx)
% plot(idx,[data(numTimeStepsTrain) predicted_data(8,:)],'--')
% plot(idx,full_data(8,10:12),'--*g')
% hold off
% xlabel("Hour")
% ylabel("Expression value")
% title("LSTM Prediction of EXOC5")
% legend(["Observed" "Prediction"])
% 
% subplot(2,1,2)
% stem(rmse(:,2))
% xlabel("Gene")
% ylabel("RMSE")
% title("RMSE " + rmse)
end