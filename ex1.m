 

%% Initialization
clear ; close all; clc

%% ======================= Part 1: Plotting =======================
fprintf('Plotting Data ...\n')
data = load('ex1data.txt');
X_origin = data(:, 1:end-1); y = data(:, end);
m = length(y); % number of training examples

% Plot Data
plotData(X_origin, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 2: Cost and Gradient descent ===================
[X mu sigma] = featureNormalize(X_origin);

X = [ones(m, 1), X]; % Add a column of ones to x
theta = zeros(3, 1); % initialize fitting parameters

% Some gradient descent settings
iterations = 1965;
alpha = 0.01;

 fprintf('\nTesting the cost function ...\n')
% compute and display initial cost
J = computeCost(X, y, theta);
fprintf('With theta = [0 ; 0 ; 0]\nCost computed = %f\n', J);
fprintf('Expected cost value (approx) 32.07\n');

% further testing of the cost function
J = computeCost(X, y, [-1 ; 1 ; 2]);
fprintf('\nWith theta = [-1 ; 1 ; 2]\nCost computed = %f\n', J);
fprintf('Expected cost value (approx) 35.59\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nRunning Gradient Descent ...\n')
% run gradient descent
tic
[theta J_history] =...
 gradientDescent(X, y, theta, alpha, iterations);
toc
% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);
fprintf('Expected theta values (approx)\n');
fprintf(' 5.8391\n  8.089\n 7.9014\n\n');

% Plot the linear fit
hold on; 
% plot3(X_origin(:,1),X_origin(:,2),X*theta,'-');
X1_origin = (5:0.1:25)';
X2_origin = (50:1:250)';
X1 = (X1_origin - mu(1)) / sigma(1);
X2 = (X2_origin - mu(2)) / sigma(2);
Xtemp = [X1 X2 ones(size(X1))];
Y = Xtemp *theta;
plot3(X1_origin,X2_origin,Y,'-');
hold off;
%plot(X(:,2), X*theta, '-')
%legend('Training data', 'Linear regression')
%hold off % don't overlay any more plots on this figure

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, (3.5 - mu(1)) / sigma(1), (40 - mu(2)) / sigma(2)] *theta;
fprintf('For population = 35,000, area = 40 Square kilometre, we predict a profit of %f\n',...
    predict1*10000);
fprintf('Expected profit value (approx) 11973.0687\n');
predict2 = [1, (7 - mu(1)) / sigma(1), (63 - mu(2)) / sigma(2)] * theta;
fprintf('For population = 70,000, area = 63 Square kilometre, we predict a profit of %f\n',...
    predict2*10000);
fprintf('Expected profit value (approx) 41418.7371\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============= Part 3: Visualizing J(theta_0, theta_1) =============
% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
%fprintf('Visualizing J(theta_0, theta_1) ...\n')
%
%% Grid over which we will calculate J
%theta0_vals = linspace(-10, 10, 100);
%theta1_vals = linspace(-1, 4, 100);
%
%% initialize J_vals to a matrix of 0's
%J_vals = zeros(length(theta0_vals), length(theta1_vals));
%
%% Fill out J_vals
%for i = 1:length(theta0_vals)
%    for j = 1:length(theta1_vals)
%	  t = [theta0_vals(i); theta1_vals(j)];
%	  J_vals(i,j) = computeCost(X, y, t);
%    end
%end
%
%
%% Because of the way meshgrids work in the surf command, we need to
%% transpose J_vals before calling surf, or else the axes will be flipped
%J_vals = J_vals';
%% Surface plot
%figure;
%surf(theta0_vals, theta1_vals, J_vals)
%xlabel('\theta_0'); ylabel('\theta_1');
%
%% Contour plot
%figure;
%% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
%contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
%xlabel('\theta_0'); ylabel('\theta_1');
%hold on;
%plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);

