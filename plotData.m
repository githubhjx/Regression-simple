function plotData(x, y)
%PLOTDATA Plots the data points x and y into a new figure 
%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
%   population and profit.

figure; % open a new figure window


plot(x(:,1), y, 'rx', 'MarkerSize', 10);
xlabel('Population of City in 10,000s');
ylabel('Profit in $10,000s'); 

figure;
plot(x(:,2), y, 'rx', 'MarkerSize', 10);
xlabel('Area of City in Square kilometre');
ylabel('Profit in $10,000s'); 

figure;
plot3(x(:,1),x(:,2),y,'rx', 'MarkerSize', 10);
xlabel('Population of City in 10,000s');
ylabel('Area of City in 10,000s Square kilometre');
zlabel('Profit in $10,000s'); 
end
