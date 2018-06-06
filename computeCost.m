function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples
% You need to return the following variables correctly 

% ====================== YOUR CODE HERE ======================
cost=0;
for i=1:m
    y_prediction=theta(1,1)*X(i,2)+theta(2,1)*X(i,3)+theta(3,1);
    cost=0.5*(y(i,1)-y_prediction).*(y(i,1)-y_prediction)+cost;
end
J=cost/m;
% =========================================================================

end
