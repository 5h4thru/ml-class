function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
n = size(X,2); % number of features
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    %{
    Normal equation method is not working
    theta = inv(X' * X) * X' * y;
    %}
    %{
    n = length(theta); % same as size(X,2)
    new_theta = zeros(n,1);
    for j = 1:n
        inner_sum = 0;
        for i = 1:m
            inner_sum = inner_sum + ((X(i,:) * theta) - y(i)) * X(i,j);
        end
        new_theta(j) = theta(j) - (alpha / m * inner_sum);
    end
    theta = new_theta;
    %}

    % Vectorized
    A = X * theta - y;  % size == m x 1
    dow_sum = 1 / m * (A' * X)';  % size == ((n+1) x 1)
    theta = theta - (alpha * dow_sum);  % size == ((n+1) x 1 vector) 


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
