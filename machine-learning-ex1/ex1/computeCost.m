function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

h = theta' * X';
_sum = sum((h' - y) .^ 2);
J = _sum / (2 * m);


%{
%%%Computing J using for loops%%%
_sum = 0;
n = size(X,2);
for i=1:m,
	h = 0;
	for j=1:n,
		h = h + theta(j) * X(i,j);
	end
	sqe = (h - y(i,1)) ^ 2;
	_sum = _sum + sqe;
end
J = _sum / (2 * m);
%}


% =========================================================================

end
