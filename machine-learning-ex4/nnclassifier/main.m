
clear ; close all; clc
data=load('ex2data1.txt');
X = featureNormalize(data(:, [1, 2])); y = data(:, 3);
THETA1 = 0;
THETA2 = 0;

[THETA1, THETA2] = nncost(X, THETA1, THETA2,y, 1, 1, 0.01);
for i = 1:500
  [THETA1, THETA2] = nncost(X, THETA1, THETA2,y, 0, 1, 0.01); 

  
end

pred = predict(THETA1, THETA2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
plotDecisionBoundary(THETA1,THETA2,data(:, [1, 2]),y);