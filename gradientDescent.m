function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
thetal = length(theta);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    gradient_a=0;
    gradient_b=0;
    gradient_c=0;
    for i=1:m
        gradient_a=gradient_a-((y(i,1)-theta(1,1)*X(i,2)-theta(2,1)*X(i,3)-theta(3,1))*X(i,2));
        gradient_b=gradient_b-((y(i,1)-theta(1,1)*X(i,2)-theta(2,1)*X(i,3)-theta(3,1))*X(i,3));
        gradient_c=gradient_c-(y(i,1)-theta(1,1)*X(i,2)-theta(2,1)*X(i,3)-theta(3,1));
    end
    theta(1,1)=theta(1,1)-alpha*gradient_a/m;
    theta(2,1)=theta(2,1)-alpha*gradient_b/m;
    theta(3,1)=theta(3,1)-alpha*gradient_c/m;
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    theta
    J_history(iter)
end

end
