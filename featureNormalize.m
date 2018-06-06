function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = zeros(size(X));
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));
m = size(X, 1);
% ====================== YOUR CODE HERE ======================  

mu = mean(X);
sigma = max(X) - min(X);
X_norm = (X - (ones(m,1)*mu)) .* ((ones(m,1)*sigma).^(-1));

% ============================================================

end
