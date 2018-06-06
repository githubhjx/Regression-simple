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
data = load('ex1data.txt');
x = data(:, 1:end-1); y = data(:, end);
m = length(y);
Y = y(:); 
tic
H = [x(:,1).^2 x(:,2) ones(size(x(:,1)))];
toc
theta = (H.'*H)\(H.'*Y);
x = [ones(size(x,1), 1), x];
computeCost(x, y, theta)
plotData(X_origin, y);
hold on; 
% plot3(X_origin(:,1),X_origin(:,2),X*theta,'-');
X1_origin = (5:0.1:25)';
X2_origin = (50:1:250)'; 
Xtemp = [X1_origin X2_origin ones(size(X1_origin))];
Y = Xtemp *theta;
plot3(X1_origin,X2_origin,Y,'-');
hold off;